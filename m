Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1949EFF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ED510EE5A;
	Wed, 29 Apr 2026 05:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJ6svz0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18810EE5A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777439943; x=1808975943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5GjidDlMjRs+9HiwxYaA2o01i4JMzz85ssnjhBPmnM=;
 b=oJ6svz0jwykLs+wI1AP3Mf6jtkrEvu/i3TEQAbCwI6MOhj/DGexy2oIt
 vDkVGQHDpc+f2mHJd1ICUNPSRDwCA3cmYL7sBv0FTiX7Gt3PnS2l09YRR
 aZ27c/Qn8zEuVG3G/ia6p2mBeigVpfRNUad81bjAlPYp+TwC2dDM7qgWp
 Z2hApCNChZpOJeSVpBOj8Uzj86PAlRA2oeKbZIpft8PeoTxk76/4W3+Bx
 3fmo/Wfotaay7R/VUJVS8S3xSPZax4nyV0iBcas8Bnyxc3HaSVTDydnbK
 0+KDW501UZJW9q7Jqcdejp6GLoUMV4Upi3xpVL2JGHDFLpIa0W4STMB/8 g==;
X-CSE-ConnectionGUID: Zh1T8VQQSTan4EnbuKfdfw==
X-CSE-MsgGUID: 4x/7NIEDR+KYut0G6auihQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82217545"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82217545"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:19:03 -0700
X-CSE-ConnectionGUID: dS3xurd7SFK8vA0eSS7uMQ==
X-CSE-MsgGUID: KtJV8O3ATaCYh4RMxhKnDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239153892"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:19:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 6/6] drm/xe/xe_ras: Control xe drm_ras registration with a
 flag
Date: Wed, 29 Apr 2026 11:21:50 +0530
Message-ID: <20260429055147.1579576-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
References: <20260429055147.1579576-8-riana.tauro@intel.com>
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

Add a flag to control xe drm_ras registration.
Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: rename flag to drm_ras
    move drm_ras registration to ras_init (Raag)
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_ras.c          | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89437de3001a..f259b3ed0507 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -155,6 +155,8 @@ struct xe_device {
 		u8 has_cached_pt:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
+		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
 		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d55e5af4f4b7..739cebef1200 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -355,6 +355,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
@@ -456,6 +457,7 @@ static const struct xe_device_desc cri_desc = {
 	PLATFORM(CRESCENTISLAND),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
@@ -747,6 +749,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
+	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b..24d4a3d00517 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -40,6 +40,7 @@ struct xe_device_desc {
 
 	u8 has_cached_pt:1;
 	u8 has_display:1;
+	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 626ec342218d..7ffaa78638fe 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -211,7 +211,7 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
-	if (xe->info.platform != XE_PVC)
+	if (!xe->info.has_drm_ras)
 		return;
 
 	ret = xe_drm_ras_init(xe);
-- 
2.47.1

