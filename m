Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628C2C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 19:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C44810E14C;
	Mon, 22 May 2023 19:37:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D336510E14C;
 Mon, 22 May 2023 19:37:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D095BA73C7;
 Mon, 22 May 2023 19:37:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Mon, 22 May 2023 19:37:40 -0000
Message-ID: <168478426085.28282.13777880343023705600@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230522193541.2537418-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_?=
 =?utf-8?q?starting_with_=5B1/2=5D_xe/rpls=3A_Add_RPLS_Support?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] xe/rpls: Add RPLS Support
URL   : https://patchwork.freedesktop.org/series/118143/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[19:37:12] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:37:16] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[19:37:38] Starting KUnit Kernel (1/1)...
[19:37:38] ============================================================
[19:37:38] ==================== xe_bo (2 subtests) ====================
[19:37:38] [SKIPPED] xe_ccs_migrate_kunit
[19:37:38] [SKIPPED] xe_bo_evict_kunit
[19:37:38] ===================== [SKIPPED] xe_bo ======================
[19:37:38] ================== xe_dma_buf (1 subtest) ==================
[19:37:38] [SKIPPED] xe_dma_buf_kunit
[19:37:38] =================== [SKIPPED] xe_dma_buf ===================
[19:37:38] ================== xe_migrate (1 subtest) ==================
[19:37:38] [SKIPPED] xe_migrate_sanity_kunit
[19:37:38] =================== [SKIPPED] xe_migrate ===================
[19:37:38] =================== xe_pci (2 subtests) ====================
[19:37:38] [PASSED] xe_gmdid_graphics_ip
[19:37:38] [PASSED] xe_gmdid_media_ip
[19:37:38] ===================== [PASSED] xe_pci ======================
[19:37:38] ==================== xe_rtp (1 subtest) ====================
[19:37:38] ================== xe_rtp_process_tests  ===================
[19:37:38] [PASSED] coalesce-same-reg
[19:37:38] [PASSED] no-match-no-add
[19:37:38] [PASSED] no-match-no-add-multiple-rules
[19:37:38] [PASSED] two-regs-two-entries
[19:37:38] [PASSED] clr-one-set-other
[19:37:38] [PASSED] set-field
[19:37:38] [PASSED] conflict-duplicate
[19:37:38] [PASSED] conflict-not-disjoint
[19:37:38] [PASSED] conflict-reg-type
[19:37:38] ============== [PASSED] xe_rtp_process_tests ===============
[19:37:38] ===================== [PASSED] xe_rtp ======================
[19:37:38] ==================== xe_wa (1 subtest) =====================
[19:37:38] ======================== xe_wa_gt  =========================
[19:37:38] [PASSED] TIGERLAKE (B0)
[19:37:38] [PASSED] DG1 (A0)
[19:37:38] [PASSED] DG1 (B0)
[19:37:38] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:86
[19:37:38] Expected ret == 0, but
[19:37:38]     ret == -19 (0xffffffffffffffed)
[19:37:38] [FAILED] ALDERLAKE_S (A0)
[19:37:38] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:86
[19:37:38] Expected ret == 0, but
[19:37:38]     ret == -19 (0xffffffffffffffed)
[19:37:38] [FAILED] ALDERLAKE_S (B0)
[19:37:38] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:86
[19:37:38] Expected ret == 0, but
[19:37:38]     ret == -19 (0xffffffffffffffed)
[19:37:38] [FAILED] ALDERLAKE_S (C0)
[19:37:38] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:86
[19:37:38] Expected ret == 0, but
[19:37:38]     ret == -19 (0xffffffffffffffed)
[19:37:38] [FAILED] ALDERLAKE_S (D0)
[19:37:38] [PASSED] DG2_G10 (A0)
[19:37:38] [PASSED] DG2_G10 (A1)
[19:37:38] [PASSED] DG2_G10 (B0)
[19:37:38] [PASSED] DG2_G10 (C0)
[19:37:38] [PASSED] DG2_G11 (A0)
[19:37:38] [PASSED] DG2_G11 (B0)
[19:37:38] [PASSED] DG2_G11 (B1)
[19:37:38] [PASSED] DG2_G12 (A0)
[19:37:38] [PASSED] DG2_G12 (A1)
[19:37:38] [PASSED] PVC (B0)
[19:37:38] [PASSED] PVC (B1)
[19:37:38] [PASSED] PVC (C0)
[19:37:38] # xe_wa_gt: pass:15 fail:4 skip:0 total:19
[19:37:38] ==================== [FAILED] xe_wa_gt =====================
[19:37:38] # Totals: pass:15 fail:4 skip:0 total:19
[19:37:38] ====================== [FAILED] xe_wa ======================
[19:37:38] ============================================================
[19:37:38] Testing complete. Ran 34 tests: passed: 26, failed: 4, skipped: 4
[19:37:38] Elapsed time: 26.147s total, 4.215s configuring, 21.814s building, 0.097s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


