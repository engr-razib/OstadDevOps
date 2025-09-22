import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  vus: 20,           // একসাথে কত virtual user simulate হবে
  duration: '60s',   // টেস্ট কতক্ষণ চলবে
};

export default function () {
  http.get('http://<NODE-IP>:30007'); // তোমার cluster/node ip বসাও
  sleep(1);
}
