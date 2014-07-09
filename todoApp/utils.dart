part of todo;

class Utils {
    
    Utils() {}

    Utils.generateUuid() {
        int i, randNum;
        String uuid = '';   
        var _rand = new Random();
        
        for (i = 0; i < 32; i++) {
            randNum = _rand.nextInt(1) * 16 | 0;
            if (i == 8 || i == 12 || i == 16 || i == 20) {
                uuid += '-';
            }
            uuid += (i == 12 ? 4 : (i == 16 ? (randNum & 3 | 8) : randNum)).toRadixString(16);
        }
    }

    void pluralize(num count, String word) {
         count == 1 ? word : word + 's';
    }

    void storage(String namespace, [Map data]) {
        Storage localStorage = window.localStorage;
        var store;
        if (namespace != null) {
            localStorage[namespace] = JSON.encode(data);
        } 
    }
}