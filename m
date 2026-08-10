Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B050C5AD4E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF210E7A0;
	Mon, 10 Aug 2026 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBKUgtVr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6F810E798
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356764; x=1817892764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZ1IrzUJCr9r88R48LqEZyr6UXRkDnOwcCNn2qocXHw=;
 b=kBKUgtVrrYYFQVMu1p6x8nCF8N8bWspuWL3hwWdp1BBX225CCGY2aK7t
 JTYhsg2xo1pp5odpCkjfb9IBxXQZzHcvJrKWnJlC6/AG3CQbtSqMDWiOl
 zAr7cwbIKoC29LLJiia+50rVr6L1i9EhUub36y+yhpqY3AE7pOxhbet9G
 DHP+7wv32ltVRvs8WPd4E2GOuLk3zuIsd6T0m5Y/imaVPpr2PaRcHse8W
 A9dqDdPP6lIBjaewwSJJn1MhydxHimdeZ/ZGD/PvDiYOwNyrugNAJbL5l
 nBYSGfpHCecBZoZcmpSoWBAhzm1RhBD/zKoyxiO5LmQg0x5x29jtUP92g A==;
X-CSE-ConnectionGUID: VvZlx2EQR46+jbURCnRTzA==
X-CSE-MsgGUID: On9P5GVmSwW9zrsPyk1DeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893655"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:43 -0700
X-CSE-ConnectionGUID: tQ+ZITReTq2FqeskC+6Krw==
X-CSE-MsgGUID: deTxWXmoQbivPjbYgBaLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227573"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 4/6] drm/xe/vf: Add bounds checking for queried GGTT base
 and size
Date: Mon, 10 Aug 2026 15:44:31 +0530
Message-ID: <20260810101428.1009573-12-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add explicit bounds checks for GGTT base and size which can detect
and reject invalid configuration data from a misconfigured or
malfunctioning PF, preventing protocol violations and protecting VF
initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 81d68fe5ad7c..65e48f135801 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -486,8 +486,16 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
+static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+}
+
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
+	u64 alignment = vf_get_ggtt_alignment(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size, ggtt_size;
@@ -526,6 +534,18 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 		return -EREMCHG;
 	}
 
+	if (size % alignment) {
+		xe_gt_sriov_err(gt, "Unexpected GGTT alignment for size: %llu != %llu\n",
+				size, (size / alignment) * alignment);
+		return -EREMCHG;
+	}
+
+	if (start % alignment) {
+		xe_gt_sriov_err(gt, "Unexpected GGTT alignment for base: %llu != %llu\n",
+				start, (start / alignment) * alignment);
+		return -EREMCHG;
+	}
+
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-- 
2.53.0

