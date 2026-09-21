Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6251CC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE410E59E;
	Mon, 21 Sep 2026 09:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKy/woH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8038F10E5C2
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789982481; x=1821518481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IpnDKYh0L1pcQot4p+KEiXU7qRIdXgOJnBd90NcAfnQ=;
 b=VKy/woH7/NNMJEr/owJssNo6wrjiOv6KyYZleDv9+35zSIRNFmSO61gp
 WwulMxP1aV7sjsKzg7+IIhBZznAGyjVTqvtJHbNXFHPochWMKCRa//QuL
 DGJU8WQ6iD/rYcNz46Ym3vd1D0yC4RTbZ1ztLkJRSoTJ98E4kQoxSciXZ
 1JHGC7Z0ym+9WrAUhBzPsR60Tol6xuyrNYCRL4YPFv3yFcPqOZxbsHmvK
 tf+8ZwLf3M6iCEY0Nn8zByQm3RewEq9qHrmtGYcQOMMHrhNZeXuwhWHI/
 i3GyUFqQGPy/VvvByAvaZFQQGrhzb/FuhBywqkyL0wKGe2cqwJiycKFRE A==;
X-CSE-ConnectionGUID: W9HGQDFZRJ2ob4JkDx0QVg==
X-CSE-MsgGUID: ARkDFcnURNmlWF+pRHPGKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90606616"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="90606616"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:21:20 -0700
X-CSE-ConnectionGUID: KeHEBIDHTdelZ79/pX54Pg==
X-CSE-MsgGUID: Gd4yeiqcTl6BzBdl1EtMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3578420"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa012.fm.intel.com with ESMTP; 21 Sep 2026 02:21:20 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 06/10] drm/xe/sriov: Add helper for VF GGTT provisioning
 alignment
Date: Mon, 21 Sep 2026 14:51:05 +0530
Message-ID: <20260921092101.1243989-18-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
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

The alignment of a GGTT range provisioned to a VF is part of the PF/VF
contract: the PF must allocate the range with it, and the VF must be
able to verify that the range it was assigned respects it. Since PF and
VF run on the same hardware, both can derive the value independently.

Move it to xe_sriov_ggtt_alignment() so both sides share a single
definition.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V9 -> V10:
- Created a new helper to get the GGTT allocation (Sashiko).

V8 -> V9:
- Update PF GGTT alignment to XE_PAGE_SIZE (Sashiko).
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +---
 drivers/gpu/drm/xe/xe_sriov.c              | 11 +++++++++++
 drivers/gpu/drm/xe/xe_sriov.h              |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458e..04ee0fc08804 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -441,9 +441,7 @@ static int pf_refresh_vf_cfg(struct xe_gt *gt, unsigned int vfid)
 
 static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
+	return xe_sriov_ggtt_alignment(gt_to_xe(gt));
 }
 
 static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index f3835867fce5..d7704d226554 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -174,3 +174,14 @@ int xe_sriov_init_late(struct xe_device *xe)
 
 	return 0;
 }
+
+/**
+ * xe_sriov_ggtt_alignment() - Alignment of the GGTT range provisioned to a VF.
+ * @xe: the &xe_device
+ *
+ * Return: Alignment in bytes.
+ */
+u64 xe_sriov_ggtt_alignment(struct xe_device *xe)
+{
+	return xe_vram_alignment(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 72e55543c30e..ee770afca00b 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -19,6 +19,7 @@ void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
 int xe_sriov_init_late(struct xe_device *xe);
+u64 xe_sriov_ggtt_alignment(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
-- 
2.53.0

