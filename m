Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9BEFCC04A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8810EDD4;
	Fri,  6 Mar 2026 17:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ8zYykL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33D910EDC0;
 Fri,  6 Mar 2026 17:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817553; x=1804353553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ERDLRy1XiYNB9LD+YVknluTssQOXKpwEN7QNyc5vAec=;
 b=nQ8zYykL2PeO+E9OcPHbTH1YaJpaHQs4O4A1KvyzuYuLChBnOPviNwvx
 Dps302ecsjSYafZTdpT9a7g5CPawz1lpbLefua6fu7dArWUCf+ehMMJS0
 RYTChbCM+n5BcjZ/zitaHbGQoU3ofl78cjqM4afwoZrrQYwpsGC3dMy94
 ZqrmYPce+/YPB2H6/Ta6JZVkaXuCyAMFVJNyYpZKCLuSITHe64cDjOC/j
 M2RSO26AflKYOMDeTBkkdnSc5UdLWJ87kRjkv4wvfnM6CsQgmprpP4Rc0
 0A/W3RvnznfjHcabtltPuWd/7YnttBse5CWfoGNfrqQxjaZNELe6Kf4r5 A==;
X-CSE-ConnectionGUID: mEEplEJATdylgK4DjWC8Zg==
X-CSE-MsgGUID: X0rFwuuVRs2UGTgPR2UVMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530915"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:19:12 -0800
X-CSE-ConnectionGUID: ibytgvo9SamPBRVVs37+Vw==
X-CSE-MsgGUID: FeXodilgRlCBrzMuU11zFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175478"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:19:06 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 08/10] drm/i915/color: Extract HDR post-CSC LUT programming to
 helper function
Date: Fri,  6 Mar 2026 22:23:05 +0530
Message-Id: <20260306165307.3233194-9-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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

From: Pranay Samala <pranay.samala@intel.com>

Move HDR plane post-CSC LUT programming to improve code organization.

Also removes the segment 0 index register writes as it is not currently
programmed.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 92 +++++++++++-----------
 1 file changed, 48 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 9f7c2a328868..3578606e0ed4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4061,6 +4061,52 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 		xelpd_load_sdr_pre_csc_lut(display, dsb, pipe, plane, pre_csc_lut);
 }
 
+static void
+xelpd_load_hdr_post_csc_lut(struct intel_display *display,
+			    struct intel_dsb *dsb,
+			    enum pipe pipe,
+			    enum plane_id plane,
+			    const struct drm_color_lut32 *post_csc_lut)
+{
+	u32 lut_size = 32;
+	u32 lut_val;
+	int i;
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+	if (post_csc_lut) {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		}
+
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   (1 << 24));
+		} while (i++ < 34);
+	} else {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), lut_val);
+		}
+
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   1 << 24);
+		} while (i++ < 34);
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+}
+
 static void
 xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 				 const struct intel_plane_state *plane_state)
@@ -4070,51 +4116,9 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 	enum pipe pipe = to_intel_plane(state->plane)->pipe;
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *post_csc_lut = plane_state->hw.gamma_lut->data;
-	u32 i, lut_size, lut_val;
-
-	if (icl_is_hdr_plane(display, plane)) {
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
-		/* TODO: Add macro */
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
-		if (post_csc_lut) {
-			lut_size = 32;
-			for (i = 0; i < lut_size; i++) {
-				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
-
-			/* Segment 2 */
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
-			} while (i++ < 34);
-		} else {
-			/*TODO: Add for segment 0 */
-			lut_size = 32;
-			for (i = 0; i < lut_size; i++) {
-				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
-			}
-
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   1 << 24);
-			} while (i++ < 34);
-		}
 
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-		intel_de_write_dsb(display, dsb,
-				   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
-	}
+	if (icl_is_hdr_plane(display, plane))
+		xelpd_load_hdr_post_csc_lut(display, dsb, pipe, plane, post_csc_lut);
 }
 
 static void
-- 
2.25.1

