Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492B7C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA110E02D;
	Wed, 23 Jul 2025 20:26:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054310E02D;
 Wed, 23 Jul 2025 20:26:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Tile_and_GT_counting_improveme?=
 =?utf-8?q?nts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 20:26:23 -0000
Message-ID: <175330238312.184315.1762254920811724615@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
In-Reply-To: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
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

Series: Tile and GT counting improvements
URL   : https://patchwork.freedesktop.org/series/152026/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[20:25:32] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:25:36] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
[20:26:10] Starting KUnit Kernel (1/1)...
[20:26:10] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[20:26:11] ================== guc_buf (11 subtests) ===================
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] stackdepot: allocating hash table of 65536 entries via kvcalloc
[20:26:11] 
[20:26:11] Pid: 18, comm: kunit_try_catch Tainted: G        W        N  6.16.0-rc7-gd50fc838d671
[20:26:11] RIP: 0033:mmio_flush_pending_writes+0x7/0x60
[20:26:11] RSP: 00000000b988bda8  EFLAGS: 00010206
[20:26:11] RAX: 0000000000000000 RBX: 000000007b45a3e0 RCX: 0000000000000000
[20:26:11] RDX: 0000000000000000 RSI: 0000000000101800 RDI: 000000007b45a3e0
[20:26:11] RBP: 0000000000101800 R08: 0000000000000002 R09: 0000000000000000
[20:26:11] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000101800
[20:26:11] R13: 0000000000000001 R14: 0000000060327060 R15: 00000000605a7c20
[20:26:11] Kernel panic - not syncing: Segfault with no mm
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: guc_buf: missing subtest result line!
[20:26:11] # module: xe
[20:26:11] ==================== [CRASHED] guc_buf =====================
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] [ERROR] Test: main: missing expected subtest!
[20:26:11] [CRASHED] 
[20:26:11] ============================================================
[20:26:11] Testing complete. Ran 27 tests: crashed: 27, errors: 28
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | /kernel/tools/testing/kunit/kunit.py parse
[20:26:11] Elapsed time: 38.515s total, 4.248s configuring, 33.849s building, 0.418s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


