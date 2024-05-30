Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E47C25B7E
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DA310E7F0;
	Thu, 30 May 2024 10:58:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A4D10E7F0;
 Thu, 30 May 2024 10:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/xe2lpm=3A_Add_permanent?=
 =?utf-8?q?_Wa=5F14020756599?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 10:58:32 -0000
Message-ID: <171706671216.2238127.6116030491167635806@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530105229.490430-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240530105229.490430-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2lpm: Add permanent Wa_14020756599
URL   : https://patchwork.freedesktop.org/series/134245/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[10:57:57] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[10:58:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
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

[10:58:28] Starting KUnit Kernel (1/1)...
[10:58:28] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:58:28] =================== guc_dbm (7 subtests) ===================
[10:58:28] [PASSED] test_empty
[10:58:28] [PASSED] test_default
[10:58:28] ======================== test_size  ========================
[10:58:28] [PASSED] 4
[10:58:28] [PASSED] 8
[10:58:28] [PASSED] 32
[10:58:28] [PASSED] 256
[10:58:28] ==================== [PASSED] test_size ====================
[10:58:28] ======================= test_reuse  ========================
[10:58:28] [PASSED] 4
[10:58:28] [PASSED] 8
[10:58:28] [PASSED] 32
[10:58:28] [PASSED] 256
[10:58:28] =================== [PASSED] test_reuse ====================
[10:58:28] =================== test_range_overlap  ====================
[10:58:28] [PASSED] 4
[10:58:28] [PASSED] 8
[10:58:28] [PASSED] 32
[10:58:28] [PASSED] 256
[10:58:28] =============== [PASSED] test_range_overlap ================
[10:58:28] =================== test_range_compact  ====================
[10:58:28] [PASSED] 4
[10:58:28] [PASSED] 8
[10:58:28] [PASSED] 32
[10:58:28] [PASSED] 256
[10:58:28] =============== [PASSED] test_range_compact ================
[10:58:28] ==================== test_range_spare  =====================
[10:58:28] [PASSED] 4
[10:58:28] [PASSED] 8
[10:58:28] [PASSED] 32
[10:58:28] [PASSED] 256
[10:58:28] ================ [PASSED] test_range_spare =================
[10:58:28] ===================== [PASSED] guc_dbm =====================
[10:58:28] =================== guc_idm (6 subtests) ===================
[10:58:28] [PASSED] bad_init
[10:58:28] [PASSED] no_init
[10:58:28] [PASSED] init_fini
[10:58:28] [PASSED] check_used
[10:58:28] [PASSED] check_quota
[10:58:28] [PASSED] check_all
[10:58:28] ===================== [PASSED] guc_idm =====================
[10:58:28] ================== no_relay (3 subtests) ===================
[10:58:28] [PASSED] xe_drops_guc2pf_if_not_ready
[10:58:28] [PASSED] xe_drops_guc2vf_if_not_ready
[10:58:28] [PASSED] xe_rejects_send_if_not_ready
[10:58:28] ==================== [PASSED] no_relay =====================
[10:58:28] ================== pf_relay (14 subtests) ==================
[10:58:28] [PASSED] pf_rejects_guc2pf_too_short
[10:58:28] [PASSED] pf_rejects_guc2pf_too_long
[10:58:28] [PASSED] pf_rejects_guc2pf_no_payload
[10:58:28] [PASSED] pf_fails_no_payload
[10:58:28] [PASSED] pf_fails_bad_origin
[10:58:28] [PASSED] pf_fails_bad_type
[10:58:28] [PASSED] pf_txn_reports_error
[10:58:28] [PASSED] pf_txn_sends_pf2guc
[10:58:28] [PASSED] pf_sends_pf2guc
[10:58:28] [SKIPPED] pf_loopback_nop
[10:58:28] [SKIPPED] pf_loopback_echo
[10:58:28] [SKIPPED] pf_loopback_fail
[10:58:28] [SKIPPED] pf_loopback_busy
[10:58:28] [SKIPPED] pf_loopback_retry
[10:58:28] ==================== [PASSED] pf_relay =====================
[10:58:28] ================== vf_relay (3 subtests) ===================
[10:58:28] [PASSED] vf_rejects_guc2vf_too_short
[10:58:28] [PASSED] vf_rejects_guc2vf_too_long
[10:58:28] [PASSED] vf_rejects_guc2vf_no_payload
[10:58:28] ==================== [PASSED] vf_relay =====================
[10:58:28] ================= pf_service (11 subtests) =================
[10:58:28] [PASSED] pf_negotiate_any
[10:58:28] [PASSED] pf_negotiate_base_match
[10:58:28] [PASSED] pf_negotiate_base_newer
[10:58:28] [PASSED] pf_negotiate_base_next
[10:58:28] [SKIPPED] pf_negotiate_base_older
[10:58:28] [PASSED] pf_negotiate_base_prev
[10:58:28] [PASSED] pf_negotiate_latest_match
[10:58:28] [PASSED] pf_negotiate_latest_newer
[10:58:28] [PASSED] pf_negotiate_latest_next
[10:58:28] [SKIPPED] pf_negotiate_latest_older
[10:58:28] [SKIPPED] pf_negotiate_latest_prev
[10:58:28] =================== [PASSED] pf_service ====================
[10:58:28] ===================== lmtt (1 subtest) =====================
[10:58:28] ======================== test_ops  =========================
[10:58:28] [PASSED] 2-level
[10:58:28] [PASSED] multi-level
[10:58:28] ==================== [PASSED] test_ops =====================
[10:58:28] ====================== [PASSED] lmtt =======================
[10:58:28] ==================== xe_bo (2 subtests) ====================
[10:58:28] [SKIPPED] xe_ccs_migrate_kunit
[10:58:28] [SKIPPED] xe_bo_evict_kunit
[10:58:28] ===================== [SKIPPED] xe_bo ======================
[10:58:28] ================== xe_dma_buf (1 subtest) ==================
[10:58:28] [SKIPPED] xe_dma_buf_kunit
[10:58:28] =================== [SKIPPED] xe_dma_buf ===================
[10:58:28] ================== xe_migrate (1 subtest) ==================
[10:58:28] [SKIPPED] xe_migrate_sanity_kunit
[10:58:28] =================== [SKIPPED] xe_migrate ===================
[10:58:28] =================== xe_mocs (2 subtests) ===================
[10:58:28] [SKIPPED] xe_live_mocs_kernel_kunit
[10:58:28] [SKIPPED] xe_live_mocs_reset_kunit
[10:58:28] ==================== [SKIPPED] xe_mocs =====================
[10:58:28] ==================== args (11 subtests) ====================
[10:58:28] [PASSED] count_args_test
[10:58:28] [PASSED] call_args_example
[10:58:28] [PASSED] call_args_test
[10:58:28] [PASSED] drop_first_arg_example
[10:58:28] [PASSED] drop_first_arg_test
[10:58:28] [PASSED] first_arg_example
[10:58:28] [PASSED] first_arg_test
[10:58:28] [PASSED] last_arg_example
[10:58:28] [PASSED] last_arg_test
[10:58:28] [PASSED] pick_arg_example
[10:58:28] [PASSED] sep_comma_example
[10:58:28] ====================== [PASSED] args =======================
[10:58:28] =================== xe_pci (2 subtests) ====================
[10:58:28] [PASSED] xe_gmdid_graphics_ip
[10:58:28] [PASSED] xe_gmdid_media_ip
[10:58:28] ===================== [PASSED] xe_pci ======================
[10:58:28] ==================== xe_rtp (1 subtest) ====================
[10:58:28] ================== xe_rtp_process_tests  ===================
[10:58:28] [PASSED] coalesce-same-reg
[10:58:28] [PASSED] no-match-no-add
[10:58:28] [PASSED] no-match-no-add-multiple-rules
[10:58:28] [PASSED] two-regs-two-entries
[10:58:28] [PASSED] clr-one-set-other
[10:58:28] [PASSED] set-field
[10:58:28] [PASSED] conflict-duplicate
[10:58:28] [PASSED] conflict-not-disjoint
[10:58:28] [PASSED] conflict-reg-type
[10:58:28] ============== [PASSED] xe_rtp_process_tests ===============
stty: 'standard input': Inappropriate ioctl for device
[10:58:28] ===================== [PASSED] xe_rtp ======================
[10:58:28] ==================== xe_wa (1 subtest) =====================
[10:58:28] ======================== xe_wa_gt  =========================
[10:58:28] [ERROR] Test: xe_wa_gt: missing subtest result line!
[10:58:28] 
[10:58:28] Pid: 195, comm: kunit_try_catch Tainted: G        W        N 6.10.0-rc1
[10:58:28] RIP: 0033:xe_rtp_match_rcs_when_media2000+0xc/0x30
[10:58:28] RSP: 00000000a0883de8  EFLAGS: 00010297
[10:58:28] RAX: 0000000000000000 RBX: 00000000604f19a0 RCX: 00000000604f19a0
[10:58:28] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000061ab0028
[10:58:28] RBP: 00000000604f19b0 R08: 0000000000000001 R09: 0000000000000000
[10:58:28] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000604ee5c0
[10:58:28] R13: 0000000062074000 R14: 0000000061ab0028 R15: 0000000000000000
[10:58:28] Kernel panic - not syncing: Segfault with no mm
[10:58:28] [ERROR] Test: xe_wa_gt: 0 tests run!
[10:58:28] ================= [NO TESTS RUN] xe_wa_gt ==================
[10:58:28] [ERROR] Test: xe_wa: missing subtest result line!
[10:58:28] # module: xe_test
[10:58:28] ===================== [CRASHED] xe_wa ======================
[10:58:28] ============================================================
[10:58:28] Testing complete. Ran 90 tests: passed: 75, crashed: 1, skipped: 14, errors: 3
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[10:58:28] Elapsed time: 30.699s total, 4.240s configuring, 26.034s building, 0.425s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


