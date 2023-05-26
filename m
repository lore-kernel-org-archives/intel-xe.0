Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3691CC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088DF10E1DF;
	Fri, 26 May 2023 17:35:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2ABA10E1DD;
 Fri, 26 May 2023 17:35:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D41D7AADE8;
 Fri, 26 May 2023 17:35:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Fri, 26 May 2023 17:35:29 -0000
Message-ID: <168512252986.32385.3892661577952938518@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_RPLS_an?=
 =?utf-8?q?d_other_minor_support?=
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

Series: RPLS and other minor support
URL   : https://patchwork.freedesktop.org/series/118442/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[17:35:01] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:35:05] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[17:35:27] Starting KUnit Kernel (1/1)...
[17:35:27] ============================================================
[17:35:27] ==================== xe_bo (2 subtests) ====================
[17:35:27] [SKIPPED] xe_ccs_migrate_kunit
[17:35:27] [SKIPPED] xe_bo_evict_kunit
[17:35:27] ===================== [SKIPPED] xe_bo ======================
[17:35:27] ================== xe_dma_buf (1 subtest) ==================
[17:35:27] [SKIPPED] xe_dma_buf_kunit
[17:35:27] =================== [SKIPPED] xe_dma_buf ===================
[17:35:27] ================== xe_migrate (1 subtest) ==================
[17:35:27] [SKIPPED] xe_migrate_sanity_kunit
[17:35:27] =================== [SKIPPED] xe_migrate ===================
[17:35:27] =================== xe_pci (2 subtests) ====================
[17:35:27] [PASSED] xe_gmdid_graphics_ip
[17:35:27] [PASSED] xe_gmdid_media_ip
[17:35:27] ===================== [PASSED] xe_pci ======================
[17:35:27] ==================== xe_rtp (1 subtest) ====================
[17:35:27] ================== xe_rtp_process_tests  ===================
[17:35:27] [PASSED] coalesce-same-reg
[17:35:27] [PASSED] no-match-no-add
[17:35:27] [PASSED] no-match-no-add-multiple-rules
[17:35:27] [PASSED] two-regs-two-entries
[17:35:27] [PASSED] clr-one-set-other
[17:35:27] [PASSED] set-field
[17:35:27] [PASSED] conflict-duplicate
[17:35:27] [PASSED] conflict-not-disjoint
[17:35:27] [PASSED] conflict-reg-type
[17:35:27] ============== [PASSED] xe_rtp_process_tests ===============
[17:35:27] ===================== [PASSED] xe_rtp ======================
[17:35:27] ==================== xe_wa (1 subtest) =====================
[17:35:27] ======================== xe_wa_gt  =========================
[17:35:27] [PASSED] TIGERLAKE (B0)
[17:35:27] [PASSED] DG1 (A0)
[17:35:27] [PASSED] DG1 (B0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_S (A0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_S (B0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_S (C0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_S (D0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_P (A0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_P (B0)
[17:35:27] # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:91
[17:35:27] Expected ret == 0, but
[17:35:27]     ret == -19 (0xffffffffffffffed)
[17:35:27] [FAILED] ALDERLAKE_P (C0)
[17:35:27] [PASSED] DG2_G10 (A0)
[17:35:27] [PASSED] DG2_G10 (A1)
[17:35:27] [PASSED] DG2_G10 (B0)
[17:35:27] [PASSED] DG2_G10 (C0)
[17:35:27] [PASSED] DG2_G11 (A0)
[17:35:27] [PASSED] DG2_G11 (B0)
[17:35:27] [PASSED] DG2_G11 (B1)
[17:35:27] [PASSED] DG2_G12 (A0)
[17:35:27] [PASSED] DG2_G12 (A1)
[17:35:27] [PASSED] ALDERLAKE_P_RPLU (E0)
[17:35:27] [PASSED] ALDERLAKE_S_RPLS (D0)
[17:35:27] [PASSED] PVC (B0)
[17:35:27] [PASSED] PVC (B1)
[17:35:27] [PASSED] PVC (C0)
[17:35:27] # xe_wa_gt: pass:17 fail:7 skip:0 total:24
[17:35:27] ==================== [FAILED] xe_wa_gt =====================
[17:35:27] # Totals: pass:17 fail:7 skip:0 total:24
[17:35:27] ====================== [FAILED] xe_wa ======================
[17:35:27] ============================================================
[17:35:27] Testing complete. Ran 39 tests: passed: 28, failed: 7, skipped: 4
[17:35:27] Elapsed time: 26.450s total, 4.235s configuring, 22.045s building, 0.137s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


