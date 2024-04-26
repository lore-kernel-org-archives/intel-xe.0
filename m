Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2635FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 20:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1AC10F2B8;
	Fri, 26 Apr 2024 20:43:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586DA10EB7B;
 Fri, 26 Apr 2024 20:43:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Refactor_default_device_atomic?=
 =?utf-8?q?_settings_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 20:43:00 -0000
Message-ID: <171416418035.1685485.11872350261926326330@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426105655.23738-1-nirmoy.das@intel.com>
In-Reply-To: <20240426105655.23738-1-nirmoy.das@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Refactor default device atomic settings (rev4)
URL   : https://patchwork.freedesktop.org/series/132930/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[20:42:04] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:42:08] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
   17 | void foo(void)
      |      ^~~
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/bugs_64.c:9:6: warning: no previous prototype for ‘arch_check_bugs’ [-Wmissing-prototypes]
    9 | void arch_check_bugs(void)
      |      ^~~~~~~~~~~~~~~
../arch/x86/um/bugs_64.c:13:6: warning: no previous prototype for ‘arch_examine_signal’ [-Wmissing-prototypes]
   13 | void arch_examine_signal(int sig, struct uml_pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/fault.c:18:5: warning: no previous prototype for ‘arch_fixup’ [-Wmissing-prototypes]
   18 | int arch_fixup(unsigned long address, struct uml_pt_regs *regs)
      |     ^~~~~~~~~~
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for ‘__vdso_clock_gettime’ [-Wmissing-prototypes]
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
      |     ^~~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for ‘__vdso_gettimeofday’ [-Wmissing-prototypes]
   30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for ‘__vdso_time’ [-Wmissing-prototypes]
   44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
      |                     ^~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for ‘__vdso_getcpu’ [-Wmissing-prototypes]
   57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
      | ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
  187 | void *__wrap_malloc(int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
  208 | void *__wrap_calloc(int n, int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
  222 | void __wrap_free(void *ptr)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for ‘kasan_map_memory’ [-Wmissing-prototypes]
   28 | void kasan_map_memory(void *start, size_t len)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for ‘check_tmpexec’ [-Wmissing-prototypes]
  212 | void __init check_tmpexec(void)
      |             ^~~~~~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
  140 | void fork_handler(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
  217 | void arch_cpu_idle(void)
      |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
  253 | int copy_to_user_proc(void __user *to, void *from, int size)
      |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
  263 | int clear_user_proc(void __user *buf, int size)
      |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
  271 | void set_using_sysemu(int value)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
  278 | int get_using_sysemu(void)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
  316 | int __init make_proc_sysemu(void)
      |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
  348 | unsigned long arch_align_stack(unsigned long sp)
      |               ^~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
      |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
  594 | void force_flush_all(void)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
stty: 'standard input': Inappropriate ioctl for device

[20:42:34] Starting KUnit Kernel (1/1)...
[20:42:34] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:42:34] =================== guc_dbm (7 subtests) ===================
[20:42:34] [PASSED] test_empty
[20:42:34] [PASSED] test_default
[20:42:34] ======================== test_size  ========================
[20:42:34] [PASSED] 4
[20:42:34] [PASSED] 8
[20:42:34] [PASSED] 32
[20:42:34] [PASSED] 256
[20:42:34] ==================== [PASSED] test_size ====================
[20:42:34] ======================= test_reuse  ========================
[20:42:34] [PASSED] 4
[20:42:34] [PASSED] 8
[20:42:34] [PASSED] 32
[20:42:34] [PASSED] 256
[20:42:34] =================== [PASSED] test_reuse ====================
[20:42:34] =================== test_range_overlap  ====================
[20:42:34] [PASSED] 4
[20:42:34] [PASSED] 8
[20:42:34] [PASSED] 32
[20:42:34] [PASSED] 256
[20:42:34] =============== [PASSED] test_range_overlap ================
[20:42:34] =================== test_range_compact  ====================
[20:42:34] [PASSED] 4
[20:42:34] [PASSED] 8
[20:42:34] [PASSED] 32
[20:42:34] [PASSED] 256
[20:42:34] =============== [PASSED] test_range_compact ================
[20:42:34] ==================== test_range_spare  =====================
[20:42:34] [PASSED] 4
[20:42:34] [PASSED] 8
[20:42:34] [PASSED] 32
[20:42:34] [PASSED] 256
[20:42:34] ================ [PASSED] test_range_spare =================
[20:42:34] ===================== [PASSED] guc_dbm =====================
[20:42:34] =================== guc_idm (6 subtests) ===================
[20:42:34] [PASSED] bad_init
[20:42:34] [PASSED] no_init
[20:42:34] [PASSED] init_fini
[20:42:34] [PASSED] check_used
[20:42:34] [PASSED] check_quota
[20:42:34] [PASSED] check_all
[20:42:34] ===================== [PASSED] guc_idm =====================
[20:42:34] ================== no_relay (3 subtests) ===================
[20:42:34] [PASSED] xe_drops_guc2pf_if_not_ready
[20:42:34] [PASSED] xe_drops_guc2vf_if_not_ready
[20:42:34] [PASSED] xe_rejects_send_if_not_ready
[20:42:34] ==================== [PASSED] no_relay =====================
[20:42:34] ================== pf_relay (14 subtests) ==================
[20:42:34] [PASSED] pf_rejects_guc2pf_too_short
[20:42:34] [PASSED] pf_rejects_guc2pf_too_long
[20:42:34] [PASSED] pf_rejects_guc2pf_no_payload
[20:42:34] [PASSED] pf_fails_no_payload
[20:42:34] [PASSED] pf_fails_bad_origin
[20:42:34] [PASSED] pf_fails_bad_type
[20:42:34] [PASSED] pf_txn_reports_error
[20:42:34] [PASSED] pf_txn_sends_pf2guc
[20:42:34] [PASSED] pf_sends_pf2guc
[20:42:34] [SKIPPED] pf_loopback_nop
[20:42:34] [SKIPPED] pf_loopback_echo
[20:42:34] [SKIPPED] pf_loopback_fail
[20:42:34] [SKIPPED] pf_loopback_busy
[20:42:34] [SKIPPED] pf_loopback_retry
[20:42:34] ==================== [PASSED] pf_relay =====================
[20:42:34] ================== vf_relay (3 subtests) ===================
[20:42:34] [PASSED] vf_rejects_guc2vf_too_short
[20:42:34] [PASSED] vf_rejects_guc2vf_too_long
[20:42:34] [PASSED] vf_rejects_guc2vf_no_payload
[20:42:34] ==================== [PASSED] vf_relay =====================
[20:42:34] ================= pf_service (11 subtests) =================
[20:42:34] [PASSED] pf_negotiate_any
[20:42:34] [PASSED] pf_negotiate_base_match
[20:42:34] [PASSED] pf_negotiate_base_newer
[20:42:34] [PASSED] pf_negotiate_base_next
[20:42:34] [SKIPPED] pf_negotiate_base_older
[20:42:34] [PASSED] pf_negotiate_base_prev
[20:42:34] [PASSED] pf_negotiate_latest_match
[20:42:34] [PASSED] pf_negotiate_latest_newer
[20:42:34] [PASSED] pf_negotiate_latest_next
[20:42:34] [SKIPPED] pf_negotiate_latest_older
[20:42:34] [SKIPPED] pf_negotiate_latest_prev
[20:42:34] =================== [PASSED] pf_service ====================
[20:42:34] ===================== lmtt (1 subtest) =====================
[20:42:34] ======================== test_ops  =========================
[20:42:34] [PASSED] 2-level
[20:42:34] [PASSED] multi-level
[20:42:34] ==================== [PASSED] test_ops =====================
[20:42:34] ====================== [PASSED] lmtt =======================
[20:42:34] ==================== xe_bo (2 subtests) ====================
[20:42:34] [SKIPPED] xe_ccs_migrate_kunit
[20:42:34] [SKIPPED] xe_bo_evict_kunit
[20:42:34] ===================== [SKIPPED] xe_bo ======================
[20:42:34] ================== xe_dma_buf (1 subtest) ==================
[20:42:34] [SKIPPED] xe_dma_buf_kunit
[20:42:34] =================== [SKIPPED] xe_dma_buf ===================
[20:42:34] ================== xe_migrate (1 subtest) ==================
[20:42:34] [SKIPPED] xe_migrate_sanity_kunit
[20:42:34] =================== [SKIPPED] xe_migrate ===================
[20:42:34] =================== xe_mocs (2 subtests) ===================
[20:42:34] [SKIPPED] xe_live_mocs_kernel_kunit
[20:42:34] [SKIPPED] xe_live_mocs_reset_kunit
[20:42:34] ==================== [SKIPPED] xe_mocs =====================
[20:42:34] =================== xe_pci (2 subtests) ====================
[20:42:34] [PASSED] xe_gmdid_graphics_ip
[20:42:34] [PASSED] xe_gmdid_media_ip
[20:42:34] ===================== [PASSED] xe_pci ======================
[20:42:34] ==================== xe_rtp (1 subtest) ====================
[20:42:34] ================== xe_rtp_process_tests  ===================
[20:42:34] [PASSED] coalesce-same-reg
[20:42:34] [PASSED] no-match-no-add
[20:42:34] [PASSED] no-match-no-add-multiple-rules
[20:42:34] [PASSED] two-regs-two-entries
[20:42:34] [PASSED] clr-one-set-other
[20:42:34] [PASSED] set-field
[20:42:34] [PASSED] conflict-duplicate
[20:42:34] [PASSED] conflict-not-disjoint
[20:42:34] [PASSED] conflict-reg-type
[20:42:34] ============== [PASSED] xe_rtp_process_tests ===============
[20:42:34] ===================== [PASSED] xe_rtp ======================
[20:42:34] ==================== xe_wa (1 subtest) =====================
[20:42:34] ======================== xe_wa_gt  =========================
[20:42:34] [PASSED] TIGERLAKE (B0)
[20:42:34] [PASSED] DG1 (A0)
[20:42:34] [PASSED] DG1 (B0)
[20:42:34] [PASSED] ALDERLAKE_S (A0)
[20:42:34] [PASSED] ALDERLAKE_S (B0)
[20:42:34] [PASSED] ALDERLAKE_S (C0)
[20:42:34] [PASSED] ALDERLAKE_S (D0)
[20:42:34] [PASSED] ALDERLAKE_P (A0)
[20:42:34] [PASSED] ALDERLAKE_P (B0)
[20:42:34] [PASSED] ALDERLAKE_P (C0)
[20:42:34] [PASSED] ALDERLAKE_S_RPLS (D0)
[20:42:34] [PASSED] ALDERLAKE_P_RPLU (E0)
[20:42:34] [PASSED] DG2_G10 (C0)
[20:42:34] [PASSED] DG2_G11 (B1)
[20:42:34] [PASSED] DG2_G12 (A1)
[20:42:34] [PASSED] METEORLAKE (g:A0, m:A0)
[20:42:34] [PASSED] METEORLAKE (g:A0, m:A0)
[20:42:34] [PASSED] METEORLAKE (g:A0, m:A0)
[20:42:34] [PASSED] LUNARLAKE (g:A0, m:A0)
[20:42:34] [PASSED] LUNARLAKE (g:B0, m:A0)
[20:42:34] ==================== [PASSED] xe_wa_gt =====================
[20:42:34] ====================== [PASSED] xe_wa ======================
[20:42:34] ============================================================
[20:42:34] Testing complete. Ran 98 tests: passed: 84, skipped: 14
[20:42:34] Elapsed time: 29.730s total, 4.242s configuring, 25.269s building, 0.199s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[20:42:34] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:42:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
  140 | void fork_handler(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
  217 | void arch_cpu_idle(void)
      |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
  253 | int copy_to_user_proc(void __user *to, void *from, int size)
      |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
  263 | int clear_user_proc(void __user *buf, int size)
      |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
  271 | void set_using_sysemu(int value)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
  278 | int get_using_sysemu(void)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
  316 | int __init make_proc_sysemu(void)
      |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
  348 | unsigned long arch_align_stack(unsigned long sp)
      |               ^~~~~~~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
      |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
  594 | void force_flush_all(void)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[20:42:57] Starting KUnit Kernel (1/1)...
[20:42:57] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:42:57] ============ drm_test_pick_cmdline (2 subtests) ============
[20:42:57] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[20:42:57] =============== drm_test_pick_cmdline_named  ===============
[20:42:57] [PASSED] NTSC
[20:42:57] [PASSED] NTSC-J
[20:42:57] [PASSED] PAL
[20:42:57] [PASSED] PAL-M
[20:42:57] =========== [PASSED] drm_test_pick_cmdline_named ===========
[20:42:57] ============== [PASSED] drm_test_pick_cmdline ==============
[20:42:57] ================== drm_buddy (7 subtests) ==================
[20:42:57] [PASSED] drm_test_buddy_alloc_limit
[20:42:57] [PASSED] drm_test_buddy_alloc_optimistic
[20:42:57] [PASSED] drm_test_buddy_alloc_pessimistic
[20:42:57] [PASSED] drm_test_buddy_alloc_pathological
[20:42:57] [PASSED] drm_test_buddy_alloc_contiguous
[20:42:57] [PASSED] drm_test_buddy_alloc_clear
[20:42:57] [PASSED] drm_test_buddy_alloc_range_bias
[20:42:57] ==================== [PASSED] drm_buddy ====================
[20:42:57] ============= drm_cmdline_parser (40 subtests) =============
[20:42:57] [PASSED] drm_test_cmdline_force_d_only
[20:42:57] [PASSED] drm_test_cmdline_force_D_only_dvi
[20:42:57] [PASSED] drm_test_cmdline_force_D_only_hdmi
[20:42:57] [PASSED] drm_test_cmdline_force_D_only_not_digital
[20:42:57] [PASSED] drm_test_cmdline_force_e_only
[20:42:57] [PASSED] drm_test_cmdline_res
[20:42:57] [PASSED] drm_test_cmdline_res_vesa
[20:42:57] [PASSED] drm_test_cmdline_res_vesa_rblank
[20:42:57] [PASSED] drm_test_cmdline_res_rblank
[20:42:57] [PASSED] drm_test_cmdline_res_bpp
[20:42:57] [PASSED] drm_test_cmdline_res_refresh
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[20:42:57] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[20:42:57] [PASSED] drm_test_cmdline_res_margins_force_on
[20:42:57] [PASSED] drm_test_cmdline_res_vesa_margins
[20:42:57] [PASSED] drm_test_cmdline_name
[20:42:57] [PASSED] drm_test_cmdline_name_bpp
[20:42:57] [PASSED] drm_test_cmdline_name_option
[20:42:57] [PASSED] drm_test_cmdline_name_bpp_option
[20:42:57] [PASSED] drm_test_cmdline_rotate_0
[20:42:57] [PASSED] drm_test_cmdline_rotate_90
[20:42:57] [PASSED] drm_test_cmdline_rotate_180
[20:42:57] [PASSED] drm_test_cmdline_rotate_270
[20:42:57] [PASSED] drm_test_cmdline_hmirror
[20:42:57] [PASSED] drm_test_cmdline_vmirror
[20:42:57] [PASSED] drm_test_cmdline_margin_options
[20:42:57] [PASSED] drm_test_cmdline_multiple_options
[20:42:57] [PASSED] drm_test_cmdline_bpp_extra_and_option
[20:42:57] [PASSED] drm_test_cmdline_extra_and_option
[20:42:57] [PASSED] drm_test_cmdline_freestanding_options
[20:42:57] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[20:42:57] [PASSED] drm_test_cmdline_panel_orientation
[20:42:57] ================ drm_test_cmdline_invalid  =================
[20:42:57] [PASSED] margin_only
[20:42:57] [PASSED] interlace_only
[20:42:57] [PASSED] res_missing_x
[20:42:57] [PASSED] res_missing_y
[20:42:57] [PASSED] res_bad_y
[20:42:57] [PASSED] res_missing_y_bpp
[20:42:57] [PASSED] res_bad_bpp
[20:42:57] [PASSED] res_bad_refresh
[20:42:57] [PASSED] res_bpp_refresh_force_on_off
[20:42:57] [PASSED] res_invalid_mode
[20:42:57] [PASSED] res_bpp_wrong_place_mode
[20:42:57] [PASSED] name_bpp_refresh
[20:42:57] [PASSED] name_refresh
[20:42:57] [PASSED] name_refresh_wrong_mode
[20:42:57] [PASSED] name_refresh_invalid_mode
[20:42:57] [PASSED] rotate_multiple
[20:42:57] [PASSED] rotate_invalid_val
[20:42:57] [PASSED] rotate_truncated
[20:42:57] [PASSED] invalid_option
[20:42:57] [PASSED] invalid_tv_option
[20:42:57] [PASSED] truncated_tv_option
[20:42:57] ============ [PASSED] drm_test_cmdline_invalid =============
[20:42:57] =============== drm_test_cmdline_tv_options  ===============
[20:42:57] [PASSED] NTSC
[20:42:57] [PASSED] NTSC_443
[20:42:57] [PASSED] NTSC_J
[20:42:57] [PASSED] PAL
[20:42:57] [PASSED] PAL_M
[20:42:57] [PASSED] PAL_N
[20:42:57] [PASSED] SECAM
[20:42:57] =========== [PASSED] drm_test_cmdline_tv_options ===========
[20:42:57] =============== [PASSED] drm_cmdline_parser ================
[20:42:57] ============= drmm_connector_init (3 subtests) =============
[20:42:57] [PASSED] drm_test_drmm_connector_init
[20:42:57] [PASSED] drm_test_drmm_connector_init_null_ddc
[20:42:57] ========= drm_test_drmm_connector_init_type_valid  =========
[20:42:57] [PASSED] Unknown
[20:42:57] [PASSED] VGA
[20:42:57] [PASSED] DVI-I
[20:42:57] [PASSED] DVI-D
[20:42:57] [PASSED] DVI-A
[20:42:57] [PASSED] Composite
[20:42:57] [PASSED] SVIDEO
[20:42:57] [PASSED] LVDS
[20:42:57] [PASSED] Component
[20:42:57] [PASSED] DIN
[20:42:57] [PASSED] DP
[20:42:57] [PASSED] HDMI-A
[20:42:57] [PASSED] HDMI-B
[20:42:57] [PASSED] TV
[20:42:57] [PASSED] eDP
[20:42:57] [PASSED] Virtual
[20:42:57] [PASSED] DSI
[20:42:57] [PASSED] DPI
[20:42:57] [PASSED] Writeback
[20:42:57] [PASSED] SPI
[20:42:57] [PASSED] USB
[20:42:57] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[20:42:57] =============== [PASSED] drmm_connector_init ===============
[20:42:57] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[20:42:57] ========== drm_test_get_tv_mode_from_name_valid  ===========
[20:42:57] [PASSED] NTSC
[20:42:57] [PASSED] NTSC-443
[20:42:57] [PASSED] NTSC-J
[20:42:57] [PASSED] PAL
[20:42:57] [PASSED] PAL-M
[20:42:57] [PASSED] PAL-N
[20:42:57] [PASSED] SECAM
[20:42:57] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[20:42:57] [PASSED] drm_test_get_tv_mode_from_name_truncated
[20:42:57] ============ [PASSED] drm_get_tv_mode_from_name ============
[20:42:57] ============= drm_damage_helper (21 subtests) ==============
[20:42:57] [PASSED] drm_test_damage_iter_no_damage
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_src_moved
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_not_visible
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[20:42:57] [PASSED] drm_test_damage_iter_no_damage_no_fb
[20:42:57] [PASSED] drm_test_damage_iter_simple_damage
[20:42:57] [PASSED] drm_test_damage_iter_single_damage
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_outside_src
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_src_moved
[20:42:57] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[20:42:57] [PASSED] drm_test_damage_iter_damage
[20:42:57] [PASSED] drm_test_damage_iter_damage_one_intersect
[20:42:57] [PASSED] drm_test_damage_iter_damage_one_outside
[20:42:57] [PASSED] drm_test_damage_iter_damage_src_moved
[20:42:57] [PASSED] drm_test_damage_iter_damage_not_visible
[20:42:57] ================ [PASSED] drm_damage_helper ================
[20:42:57] ============== drm_dp_mst_helper (3 subtests) ==============
[20:42:57] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[20:42:57] [PASSED] Clock 154000 BPP 30 DSC disabled
[20:42:57] [PASSED] Clock 234000 BPP 30 DSC disabled
[20:42:57] [PASSED] Clock 297000 BPP 24 DSC disabled
[20:42:57] [PASSED] Clock 332880 BPP 24 DSC enabled
[20:42:57] [PASSED] Clock 324540 BPP 24 DSC enabled
[20:42:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[20:42:57] ============== drm_test_dp_mst_calc_pbn_div  ===============
[20:42:57] [PASSED] Link rate 2000000 lane count 4
[20:42:57] [PASSED] Link rate 2000000 lane count 2
[20:42:57] [PASSED] Link rate 2000000 lane count 1
[20:42:57] [PASSED] Link rate 1350000 lane count 4
[20:42:57] [PASSED] Link rate 1350000 lane count 2
[20:42:57] [PASSED] Link rate 1350000 lane count 1
[20:42:57] [PASSED] Link rate 1000000 lane count 4
[20:42:57] [PASSED] Link rate 1000000 lane count 2
[20:42:57] [PASSED] Link rate 1000000 lane count 1
[20:42:57] [PASSED] Link rate 810000 lane count 4
[20:42:57] [PASSED] Link rate 810000 lane count 2
[20:42:57] [PASSED] Link rate 810000 lane count 1
[20:42:57] [PASSED] Link rate 540000 lane count 4
[20:42:57] [PASSED] Link rate 540000 lane count 2
[20:42:57] [PASSED] Link rate 540000 lane count 1
[20:42:57] [PASSED] Link rate 270000 lane count 4
[20:42:57] [PASSED] Link rate 270000 lane count 2
[20:42:57] [PASSED] Link rate 270000 lane count 1
[20:42:57] [PASSED] Link rate 162000 lane count 4
[20:42:57] [PASSED] Link rate 162000 lane count 2
[20:42:57] [PASSED] Link rate 162000 lane count 1
[20:42:57] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[20:42:57] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[20:42:57] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[20:42:57] [PASSED] DP_POWER_UP_PHY with port number
[20:42:57] [PASSED] DP_POWER_DOWN_PHY with port number
[20:42:57] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[20:42:57] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[20:42:57] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[20:42:57] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[20:42:57] [PASSED] DP_QUERY_PAYLOAD with port number
[20:42:57] [PASSED] DP_QUERY_PAYLOAD with VCPI
[20:42:57] [PASSED] DP_REMOTE_DPCD_READ with port number
[20:42:57] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[20:42:57] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[20:42:57] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[20:42:57] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[20:42:57] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[20:42:57] [PASSED] DP_REMOTE_I2C_READ with port number
[20:42:57] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[20:42:57] [PASSED] DP_REMOTE_I2C_READ with transactions array
[20:42:57] [PASSED] DP_REMOTE_I2C_WRITE with port number
[20:42:57] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[20:42:57] [PASSED] DP_REMOTE_I2C_WRITE with data array
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[20:42:57] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[20:42:57] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[20:42:57] ================ [PASSED] drm_dp_mst_helper ================
[20:42:57] ================== drm_exec (7 subtests) ===================
[20:42:57] [PASSED] sanitycheck
[20:42:57] [PASSED] test_lock
[20:42:57] [PASSED] test_lock_unlock
[20:42:57] [PASSED] test_duplicates
[20:42:57] [PASSED] test_prepare
[20:42:57] [PASSED] test_prepare_array
[20:42:57] [PASSED] test_multiple_loops
[20:42:57] ==================== [PASSED] drm_exec =====================
[20:42:57] =========== drm_format_helper_test (17 subtests) ===========
[20:42:57] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[20:42:57] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[20:42:57] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[20:42:57] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[20:42:57] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[20:42:57] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[20:42:57] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[20:42:57] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[20:42:57] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[20:42:57] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[20:42:57] ============== drm_test_fb_xrgb8888_to_mono  ===============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[20:42:57] ==================== drm_test_fb_swab  =====================
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ================ [PASSED] drm_test_fb_swab =================
[20:42:57] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[20:42:57] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[20:42:57] [PASSED] single_pixel_source_buffer
[20:42:57] [PASSED] single_pixel_clip_rectangle
[20:42:57] [PASSED] well_known_colors
[20:42:57] [PASSED] destination_pitch
[20:42:57] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[20:42:57] ================= drm_test_fb_clip_offset  =================
[20:42:57] [PASSED] pass through
[20:42:57] [PASSED] horizontal offset
[20:42:57] [PASSED] vertical offset
[20:42:57] [PASSED] horizontal and vertical offset
[20:42:57] [PASSED] horizontal offset (custom pitch)
[20:42:57] [PASSED] vertical offset (custom pitch)
[20:42:57] [PASSED] horizontal and vertical offset (custom pitch)
[20:42:57] ============= [PASSED] drm_test_fb_clip_offset =============
[20:42:57] ============== drm_test_fb_build_fourcc_list  ==============
[20:42:57] [PASSED] no native formats
[20:42:57] [PASSED] XRGB8888 as native format
[20:42:57] [PASSED] remove duplicates
[20:42:57] [PASSED] convert alpha formats
[20:42:57] [PASSED] random formats
[20:42:57] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[20:42:57] =================== drm_test_fb_memcpy  ====================
[20:42:57] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[20:42:57] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[20:42:57] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[20:42:57] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[20:42:57] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[20:42:57] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[20:42:57] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[20:42:57] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[20:42:57] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[20:42:57] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[20:42:57] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[20:42:57] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[20:42:57] =============== [PASSED] drm_test_fb_memcpy ================
[20:42:57] ============= [PASSED] drm_format_helper_test ==============
[20:42:57] ================= drm_format (18 subtests) =================
[20:42:57] [PASSED] drm_test_format_block_width_invalid
[20:42:57] [PASSED] drm_test_format_block_width_one_plane
[20:42:57] [PASSED] drm_test_format_block_width_two_plane
[20:42:57] [PASSED] drm_test_format_block_width_three_plane
[20:42:57] [PASSED] drm_test_format_block_width_tiled
[20:42:57] [PASSED] drm_test_format_block_height_invalid
[20:42:57] [PASSED] drm_test_format_block_height_one_plane
[20:42:57] [PASSED] drm_test_format_block_height_two_plane
[20:42:57] [PASSED] drm_test_format_block_height_three_plane
[20:42:57] [PASSED] drm_test_format_block_height_tiled
[20:42:57] [PASSED] drm_test_format_min_pitch_invalid
[20:42:57] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[20:42:57] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[20:42:57] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[20:42:57] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[20:42:57] [PASSED] drm_test_format_min_pitch_two_plane
[20:42:57] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[20:42:57] [PASSED] drm_test_format_min_pitch_tiled
[20:42:57] =================== [PASSED] drm_format ====================
[20:42:57] =============== drm_framebuffer (1 subtest) ================
[20:42:57] =============== drm_test_framebuffer_create  ===============
[20:42:57] [PASSED] ABGR8888 normal sizes
[20:42:57] [PASSED] ABGR8888 max sizes
[20:42:57] [PASSED] ABGR8888 pitch greater than min required
[20:42:57] [PASSED] ABGR8888 pitch less than min required
[20:42:57] [PASSED] ABGR8888 Invalid width
[20:42:57] [PASSED] ABGR8888 Invalid buffer handle
[20:42:57] [PASSED] No pixel format
[20:42:57] [PASSED] ABGR8888 Width 0
[20:42:57] [PASSED] ABGR8888 Height 0
[20:42:57] [PASSED] ABGR8888 Out of bound height * pitch combination
[20:42:57] [PASSED] ABGR8888 Large buffer offset
[20:42:57] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[20:42:57] [PASSED] ABGR8888 Valid buffer modifier
[20:42:57] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[20:42:57] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] NV12 Normal sizes
[20:42:57] [PASSED] NV12 Max sizes
[20:42:57] [PASSED] NV12 Invalid pitch
[20:42:57] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[20:42:57] [PASSED] NV12 different  modifier per-plane
[20:42:57] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[20:42:57] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] NV12 Modifier for inexistent plane
[20:42:57] [PASSED] NV12 Handle for inexistent plane
[20:42:57] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[20:42:57] [PASSED] YVU420 Normal sizes
[20:42:57] [PASSED] YVU420 Max sizes
[20:42:57] [PASSED] YVU420 Invalid pitch
[20:42:57] [PASSED] YVU420 Different pitches
[20:42:57] [PASSED] YVU420 Different buffer offsets/pitches
[20:42:57] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[20:42:57] [PASSED] YVU420 Valid modifier
[20:42:57] [PASSED] YVU420 Different modifiers per plane
[20:42:57] [PASSED] YVU420 Modifier for inexistent plane
[20:42:57] [PASSED] X0L2 Normal sizes
[20:42:57] [PASSED] X0L2 Max sizes
[20:42:57] [PASSED] X0L2 Invalid pitch
[20:42:57] [PASSED] X0L2 Pitch greater than minimum required
[20:42:57] [PASSED] X0L2 Handle for inexistent plane
[20:42:57] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[20:42:57] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[20:42:57] [PASSED] X0L2 Valid modifier
[20:42:57] [PASSED] X0L2 Modifier for inexistent plane
[20:42:57] =========== [PASSED] drm_test_framebuffer_create ===========
[20:42:57] ================= [PASSED] drm_framebuffer =================
[20:42:57] ================ drm_gem_shmem (8 subtests) ================
[20:42:57] [PASSED] drm_gem_shmem_test_obj_create
[20:42:57] [PASSED] drm_gem_shmem_test_obj_create_private
[20:42:57] [PASSED] drm_gem_shmem_test_pin_pages
[20:42:57] [PASSED] drm_gem_shmem_test_vmap
[20:42:57] [PASSED] drm_gem_shmem_test_get_pages_sgt
[20:42:57] [PASSED] drm_gem_shmem_test_get_sg_table
[20:42:57] [PASSED] drm_gem_shmem_test_madvise
[20:42:57] [PASSED] drm_gem_shmem_test_purge
[20:42:57] ================== [PASSED] drm_gem_shmem ==================
[20:42:57] ================= drm_managed (2 subtests) =================
[20:42:57] [PASSED] drm_test_managed_release_action
[20:42:57] [PASSED] drm_test_managed_run_action
[20:42:57] =================== [PASSED] drm_managed ===================
[20:42:57] =================== drm_mm (6 subtests) ====================
[20:42:57] [PASSED] drm_test_mm_init
[20:42:57] [PASSED] drm_test_mm_debug
[20:42:57] [PASSED] drm_test_mm_align32
[20:42:57] [PASSED] drm_test_mm_align64
[20:42:57] [PASSED] drm_test_mm_lowest
[20:42:57] [PASSED] drm_test_mm_highest
[20:42:57] ===================== [PASSED] drm_mm ======================
[20:42:57] ============= drm_modes_analog_tv (4 subtests) =============
[20:42:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[20:42:57] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[20:42:57] [PASSED] drm_test_modes_analog_tv_pal_576i
[20:42:57] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[20:42:57] =============== [PASSED] drm_modes_analog_tv ===============
[20:42:57] ============== drm_plane_helper (2 subtests) ===============
[20:42:57] =============== drm_test_check_plane_state  ================
[20:42:57] [PASSED] clipping_simple
[20:42:57] [PASSED] clipping_rotate_reflect
[20:42:57] [PASSED] positioning_simple
[20:42:57] [PASSED] upscaling
[20:42:57] [PASSED] downscaling
[20:42:57] [PASSED] rounding1
[20:42:57] [PASSED] rounding2
[20:42:57] [PASSED] rounding3
[20:42:57] [PASSED] rounding4
[20:42:57] =========== [PASSED] drm_test_check_plane_state ============
[20:42:57] =========== drm_test_check_invalid_plane_state  ============
[20:42:57] [PASSED] positioning_invalid
[20:42:57] [PASSED] upscaling_invalid
[20:42:57] [PASSED] downscaling_invalid
[20:42:57] ======= [PASSED] drm_test_check_invalid_plane_state ========
[20:42:57] ================ [PASSED] drm_plane_helper =================
[20:42:57] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[20:42:57] ====== drm_test_connector_helper_tv_get_modes_check  =======
[20:42:57] [PASSED] None
[20:42:57] [PASSED] PAL
[20:42:57] [PASSED] NTSC
[20:42:57] [PASSED] Both, NTSC Default
[20:42:57] [PASSED] Both, PAL Default
[20:42:57] [PASSED] Both, NTSC Default, with PAL on command-line
[20:42:57] [PASSED] Both, PAL Default, with NTSC on command-line
[20:42:57] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[20:42:57] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[20:42:57] ================== drm_rect (9 subtests) ===================
[20:42:57] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[20:42:57] [PASSED] drm_test_rect_clip_scaled_not_clipped
[20:42:57] [PASSED] drm_test_rect_clip_scaled_clipped
stty: 'standard input': Inappropriate ioctl for device
[20:42:57] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[20:42:57] ================= drm_test_rect_intersect  =================
[20:42:57] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[20:42:57] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[20:42:57] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[20:42:57] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[20:42:57] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[20:42:57] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[20:42:57] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[20:42:57] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[20:42:57] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[20:42:57] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[20:42:57] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[20:42:57] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[20:42:57] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[20:42:57] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[20:42:57] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[20:42:57] ============= [PASSED] drm_test_rect_intersect =============
[20:42:57] ================ drm_test_rect_calc_hscale  ================
[20:42:57] [PASSED] normal use
[20:42:57] [PASSED] out of max range
[20:42:57] [PASSED] out of min range
[20:42:57] [PASSED] zero dst
[20:42:57] [PASSED] negative src
[20:42:57] [PASSED] negative dst
[20:42:57] ============ [PASSED] drm_test_rect_calc_hscale ============
[20:42:57] ================ drm_test_rect_calc_vscale  ================
[20:42:57] [PASSED] normal use
[20:42:57] [PASSED] out of max range
[20:42:57] [PASSED] out of min range
[20:42:57] [PASSED] zero dst
[20:42:57] [PASSED] negative src
[20:42:57] [PASSED] negative dst
[20:42:57] ============ [PASSED] drm_test_rect_calc_vscale ============
[20:42:57] ================== drm_test_rect_rotate  ===================
[20:42:57] [PASSED] reflect-x
[20:42:57] [PASSED] reflect-y
[20:42:57] [PASSED] rotate-0
[20:42:57] [PASSED] rotate-90
[20:42:57] [PASSED] rotate-180
[20:42:57] [PASSED] rotate-270
[20:42:57] ============== [PASSED] drm_test_rect_rotate ===============
[20:42:57] ================ drm_test_rect_rotate_inv  =================
[20:42:57] [PASSED] reflect-x
[20:42:57] [PASSED] reflect-y
[20:42:57] [PASSED] rotate-0
[20:42:57] [PASSED] rotate-90
[20:42:57] [PASSED] rotate-180
[20:42:57] [PASSED] rotate-270
[20:42:57] ============ [PASSED] drm_test_rect_rotate_inv =============
[20:42:57] ==================== [PASSED] drm_rect =====================
[20:42:57] ============================================================
[20:42:57] Testing complete. Ran 417 tests: passed: 417
[20:42:57] Elapsed time: 23.489s total, 1.675s configuring, 21.645s building, 0.150s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


