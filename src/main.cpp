#include <windows.h>

BOOL WINAPI EntryThread() {
  MessageBox(NULL, "Test", "Test", MB_OK);

  return TRUE;
}

BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID reserved) {
  switch(reason) {
    case DLL_PROCESS_ATTACH:
    CreateThread(0, 0, (LPTHREAD_START_ROUTINE)&EntryThread, 0, 0, 0);
    break;
  }

  return TRUE;
}