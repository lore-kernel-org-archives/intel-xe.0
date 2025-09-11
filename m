Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADDECA101F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 01:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E8110E0F0;
	Thu, 11 Sep 2025 01:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chPa6vPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F4B10E0F0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757554069; x=1789090069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SMNqGF2Qx09fkSZNLJb2HU+a8lY33QmcXv+G5rmyUSw=;
 b=chPa6vPsAlDuARqa1JosxJV64HfrDcLl0iz512FWmcVzru+I1JioffFA
 SLXE167ZhmyagA3l0HAoTBQlEZ8mqpG2kMK8PHGXQh61vWnI5C+TuHcsJ
 vDyVVJY88VFge4orYA6JNDT9GFUOCgeX4YoOrlTx5xubBkbvSpSSrsakU
 WnWDBUKHsrBy0VUfwpAojkjsdxqXpFYRADliAAOBfVPAjwidNPEgsLNO4
 xm4+tBJTDZIJ9Rd1GqWsDbiaZuZhm2FCAyYLkoG2Ag6iUeezON8SSQDtN
 wKOBkcRtq5JXe4d5PxOSWYYS85emS0+syYcOQvbd2T85O+WhwSFSdifaX A==;
X-CSE-ConnectionGUID: Poak+zBsQTeTuyJeZSTrPA==
X-CSE-MsgGUID: Vy/rLd/qTqiwP4Y3cwkOSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59733682"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="59733682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 18:27:48 -0700
X-CSE-ConnectionGUID: vaZ8m85oRnyqApsqQjTubw==
X-CSE-MsgGUID: ZQOiyAAES/2V4+q0CPPsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="204539046"
Received: from hchegond-ivm1.jf.intel.com ([10.88.27.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 18:27:47 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP
 versions 30.00 and 30.01
Date: Wed, 10 Sep 2025 18:27:41 -0700
Message-ID: <7368f8059013424ac94f4a01c23f9c98a37b06dc.1757552915.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
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

Apply WA 18041344222 to Xe3 LPG graphics IP versions 30.00 and 30.01 too.

Bspec: 56024
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Do not apply the WA to graphics IP version 30.03

 drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c1fec526bed0..fa69bc7730bb 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -679,6 +679,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
-- 
2.51.0

