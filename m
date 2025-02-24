Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B94C021BC
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D1710E08D;
	Mon, 24 Feb 2025 15:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsMFmy1z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B601510E25B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409644; x=1771945644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FbCyQhB70GcXaHbIO3kVxs/KC3JufsqR6arH9kx6WHw=;
 b=DsMFmy1zwselF/QzHOpypeEyyzcVACFxu1pQCflpxyLTf7FOh9SuxKbn
 CKoqcd3i1y0mS2YrXrWQgRB7ZqvoVLXaZb+KE7lxrAgxHks4wVvh4Wxcw
 /DFv0WRzxcuh4RvCKqVgIUKehMGdR+Aexlz+njvgraYXABvnJH51scVjm
 HoJyybJAFHwgIj9+vqvHvuP8Nkhaik0335BfhNH0VZnoIkwlTYo/y36dh
 VteVA4LUyywN3dMAU+MDr/Z6d3EcdDzYJtVuBsaYdoCoWk38VVPd9YV1F
 h6Af5vPxG1Kka6YYBxET1lqYZhPOEPjFDIJP/EyilE6kqKouVk6PYbpcy w==;
X-CSE-ConnectionGUID: QknJTQ87RZaNvuY5i0cVOQ==
X-CSE-MsgGUID: oKwrHGEmRHSR4HhY0GZNvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28763888"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28763888"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:24 -0800
X-CSE-ConnectionGUID: BwcOBjfWRIGsZ/bb2HVsyA==
X-CSE-MsgGUID: MyFdp6XaQo+UPWVK0keQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121349509"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:22 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 5/5] drm/xe/rtp: Remove redundant rule to omit VF
Date: Mon, 24 Feb 2025 16:07:00 +0100
Message-Id: <20250224150700.1778-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
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

After recent updates to RTP processing which to not enable
rules when running on the VF driver, explicit disabling of
rule using FUNC(xe_rtp_match_not_sriov_vf) is now redundant.

This patch reverts commit 70b8e6e3226f ("drm/xe/vf: Don't
apply Wa_22019338487 for VF") and commit c2e52eb73d99
("drm/xe/rtp: Add match helper to omit SR-IOV VF device")

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c        |  5 -----
 drivers/gpu/drm/xe/xe_rtp.h        | 11 -----------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b607be981590..ab1901e39c44 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -358,8 +358,3 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	return dss >= dss_per_gslice;
 }
 
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
-			       const struct xe_hw_engine *hwe)
-{
-	return !IS_SRIOV_VF(gt_to_xe(gt));
-}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 7874ea8588db..7a4f018ddcb9 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -484,15 +484,4 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
-/*
- * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
- *
- * @gt: GT structure
- * @hwe: Engine instance
- *
- * Returns: true if device is not VF, false otherwise.
- */
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
-			       const struct xe_hw_engine *hwe);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ff9da494efcf..385825f1ca81 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -35,7 +35,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
-		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.47.1

