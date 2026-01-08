Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A9D14887
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B45610E2FC;
	Thu,  8 Jan 2026 01:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYEp+mT9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AA710E2F1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767834835; x=1799370835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8VD5x1xS0m7tA+DIQf2hUmJEFCRFgWQDl7Wmdx3Ed8=;
 b=kYEp+mT9YyuwF22RKIFbscQKeq5Fn8HUIzWKhT+CoVHbuP58Hg5b2GUa
 QzzQXmnFmBoDDdNzMhkYxQtWLjmDk8sTICzbdBTTSS/RPjASDR8zsRHLi
 6btoN2T2fHKqp+Q7EuiU8yEppxjoj0WvczI6177Vt++466KxBjsd7hKim
 zUlaHOTBt7766DNNeoj4nupw4n96x/iPM2keJFiwy++qyP8OnJqJAFl6O
 B8YvOZonCbBupJg93WvI1Rakb+O974xCVdxykOpm7U6+p4D4oH9RQa49R
 9pr7MqoU4aS7ZaT9HeMtbjNX2ObBCgC+x6uFpB3IOV0CiX2q95y7ppJS8 Q==;
X-CSE-ConnectionGUID: 82RteIPsQxOGHP/MehC1oQ==
X-CSE-MsgGUID: kZo3PpRCRbu6QhH2Up+8Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73066456"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73066456"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:55 -0800
X-CSE-ConnectionGUID: q+P23dc7SOyJihz9RA2WnA==
X-CSE-MsgGUID: OkC2qfEVQdSPbJ6kBzGzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207915169"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] drm/xe/gsc: Make GSC FW load optional for newer platforms
Date: Wed,  7 Jan 2026 17:13:42 -0800
Message-ID: <20260108011340.2562349-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
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

On newer platforms GSC FW is only required for content protection
features, so the core driver features work perfectly fine without it
(and we did in fact not enable it to start with on PTL). Therefore, we
can selectively enable the GSC only if the FW is found on disk, without
failing if it is not found.

Note that this means that the FW can now be enabled (i.e., we're looking
for it) but not available (i.e., we haven't found it), so checks on FW
support should use the latter state to decide whether to go on or not.

As part of the rework, the message for FW not found has been cleaned up
to be more readable.

While at it, drop the comment about xe_uc_fw_init() since the code has
been reworked and the statement no longer applies.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c              | 13 +++++++------
 drivers/gpu/drm/xe/xe_uc_fw.c            | 10 +++++++---
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 07acae121aa7..ed1f65f5ef4d 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -39,7 +39,7 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 
-	if (!gsc || !xe_uc_fw_is_enabled(&gsc->fw)) {
+	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
 			    "GSC Components not ready for HDCP2.x\n");
 		return false;
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index a3157b0fe791..8ad27c884f68 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -414,15 +414,16 @@ int xe_gsc_init(struct xe_gsc *gsc)
 	}
 
 	/*
-	 * Some platforms can have GuC but not GSC. That would cause
-	 * xe_uc_fw_init(gsc) to return a "not supported" failure code and abort
-	 * all firmware loading. So check for GSC being enabled before
-	 * propagating the failure back up. That way the higher level will keep
-	 * going and load GuC as appropriate.
+	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
+	 * only missing features if the FW is lacking would be the content
+	 * protection ones. This is acceptable, si we allow the driver load to
+	 * continue if the GSC FW is missing.
 	 */
 	ret = xe_uc_fw_init(&gsc->fw);
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return 0;
+	else if (gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE && !xe_uc_fw_is_available(&gsc->fw))
+		return 0;
 	else if (ret)
 		goto out;
 
@@ -614,7 +615,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 
 	drm_printf(p, "\tfound security version %u\n", gsc->security_version);
 
-	if (!xe_uc_fw_is_enabled(&gsc->fw))
+	if (!xe_uc_fw_is_available(&gsc->fw))
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 50458d3bdc7d..b1a9ef3f6195 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -741,7 +741,7 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 		return 0;
 	}
 
-	err = request_firmware(&fw, uc_fw->path, dev);
+	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
 	if (err)
 		goto fail;
 
@@ -770,8 +770,12 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			       XE_UC_FIRMWARE_MISSING :
 			       XE_UC_FIRMWARE_ERROR);
 
-	xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
-		     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
+	if (err == -ENOENT)
+		xe_gt_info(gt, "%s firmware %s not found\n",
+			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+	else
+		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
+			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
 	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
 		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
-- 
2.43.0

