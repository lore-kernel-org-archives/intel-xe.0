Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B86EC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D394810EA1C;
	Fri, 27 Oct 2023 22:33:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AEFA10EA1C;
 Fri, 27 Oct 2023 22:33:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 692E5A0093;
 Fri, 27 Oct 2023 22:33:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Fri, 27 Oct 2023 22:33:26 -0000
Message-ID: <169844600642.19711.12449247381862472728@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_GSC_FW_?=
 =?utf-8?q?loading?=
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

Series: GSC FW loading
URL   : https://patchwork.freedesktop.org/series/125717/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
stty: 'standard input': Inappropriate ioctl for device
[22:32:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[22:33:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[22:33:23] Starting KUnit Kernel (1/1)...
[22:33:23] ============================================================
[22:33:23] ========================== xe_bo  ==========================
[22:33:23] [SKIPPED] xe_ccs_migrate_kunit
[22:33:23] [SKIPPED] xe_bo_evict_kunit
[22:33:23] ===================== [SKIPPED] xe_bo ======================
[22:33:23] ======================= xe_dma_buf  ========================
[22:33:23] [SKIPPED] xe_dma_buf_kunit
[22:33:23] =================== [SKIPPED] xe_dma_buf ===================
[22:33:23] ======================= xe_migrate  ========================
[22:33:23] [SKIPPED] xe_migrate_sanity_kunit
[22:33:23] =================== [SKIPPED] xe_migrate ===================
[22:33:23] ========================= xe_pci  ==========================
[22:33:23] [PASSED] xe_gmdid_graphics_ip
[22:33:23] # xe_gmdid_media_ip: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_pci_test.c:45
[22:33:23] Expected mask == 0, but
[22:33:23]     mask == 67108864 (0x4000000)
[22:33:23] [FAILED] xe_gmdid_media_ip
[22:33:23] # xe_pci: pass:1 fail:1 skip:0 total:2
[22:33:23] # Totals: pass:1 fail:1 skip:0 total:2
[22:33:23] ===================== [FAILED] xe_pci ======================
[22:33:23] ========================= xe_rtp  ==========================
[22:33:23] ================== xe_rtp_process_tests  ===================
[22:33:23] [PASSED] coalesce-same-reg
[22:33:23] [PASSED] no-match-no-add
[22:33:23] [PASSED] no-match-no-add-multiple-rules
[22:33:23] [PASSED] two-regs-two-entries
[22:33:23] [PASSED] clr-one-set-other
[22:33:23] [PASSED] set-field
[22:33:23] [PASSED] conflict-duplicate
[22:33:23] [PASSED] conflict-not-disjoint
[22:33:23] [PASSED] conflict-reg-type
[22:33:23] ============== [PASSED] xe_rtp_process_tests ===============
[22:33:23] ===================== [PASSED] xe_rtp ======================
[22:33:23] ========================== xe_wa  ==========================
[22:33:23] ======================== xe_wa_gt  =========================
[22:33:23] [PASSED] TIGERLAKE (B0)
[22:33:23] [PASSED] DG1 (A0)
[22:33:23] [PASSED] DG1 (B0)
[22:33:23] [PASSED] ALDERLAKE_S (A0)
[22:33:23] [PASSED] ALDERLAKE_S (B0)
[22:33:23] [PASSED] ALDERLAKE_S (C0)
[22:33:23] [PASSED] ALDERLAKE_S (D0)
[22:33:23] [PASSED] ALDERLAKE_P (A0)
[22:33:23] [PASSED] ALDERLAKE_P (B0)
[22:33:23] [PASSED] ALDERLAKE_P (C0)
[22:33:23] [PASSED] ALDERLAKE_S_RPLS (D0)
[22:33:23] [PASSED] ALDERLAKE_P_RPLU (E0)
[22:33:23] [PASSED] DG2_G10 (A0)
[22:33:23] [PASSED] DG2_G10 (A1)
[22:33:23] [PASSED] DG2_G10 (B0)
[22:33:23] [PASSED] DG2_G10 (C0)
[22:33:23] [PASSED] DG2_G11 (A0)
[22:33:23] [PASSED] DG2_G11 (B0)
[22:33:23] [PASSED] DG2_G11 (B1)
[22:33:23] [PASSED] DG2_G12 (A0)
[22:33:23] [PASSED] DG2_G12 (A1)
[22:33:23] [PASSED] PVC (B0)
[22:33:23] [PASSED] PVC (B1)
[22:33:23] [PASSED] PVC (C0)
[22:33:23] ==================== [PASSED] xe_wa_gt =====================
[22:33:23] ====================== [PASSED] xe_wa ======================
[22:33:23] ============================================================
[22:33:23] Testing complete. Ran 39 tests: passed: 34, failed: 1, skipped: 4
[22:33:23] Elapsed time: 24.485s total, 4.192s configuring, 20.173s building, 0.098s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


