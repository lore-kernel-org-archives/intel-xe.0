Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B355BC5AD55
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC10810E82E;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyRohhEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F04010E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fEnBqmMCfuVPMcRqxi5UQrSGHahp2f2qpj1gA/4LTmU=;
 b=gyRohhEFwlrWWoqbnqrs/SMZwy/bZnEnTUc58D+wzdJ3jrteuoJk4kDX
 Zw4Cd3h05OPqetrijtU7pPK/pEz0MtSBieowuFcS2Xlz22WajWf+Ece+P
 G2r9lo0MN6vQsl1oNdwgW/2ZkBKCaTYUKvObIJGW7L0VPqkw35bLBEaaC
 5jp3rjZv1LhuuukJkL4TGNtOwNTfq+Cll3LwLtHwsobc+/HYXyPTomHLq
 Ge0Jm4EMgWvJdjN8Gjj9ZDG71BEmnpW43QdVLHhK1sI/t1NmovKko/ta/
 VkzDCTDPuiIs/a+H/N7ZYufn6Lb85bQt1R+i93PMNhPTNj+n5gzCqoHDz A==;
X-CSE-ConnectionGUID: ClrLI3pnRfevvoVol0QpNg==
X-CSE-MsgGUID: 2wjHHGFGS0W/LfAL5DeLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606731"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606731"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: xiigAQD2TSK49ZgaTrElBA==
X-CSE-MsgGUID: vHkn+iBpTvyUYpV9buRkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138677"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:26 -0800
Subject: [PATCH v2 04/23] drm/xe: Consolidate workaround entries for
 Wa_16021867713
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-4-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=fEnBqmMCfuVPMcRqxi5UQrSGHahp2f2qpj1gA/4LTmU=;
 b=owEBbAKT/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmsUFqIW2ulJ9hDMGzMmadXhKFtwOIruQwc3
 x+vIXefDsuJAjIEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrAAKCRBNeSQFyHKQ
 BCr1D/YjUv24RYVATsfm5OB9+3yZ9xSvs4+10/Rs9Mf2VHPReBV9aUCQy9xo0M7o2OupRBmsqWf
 O4CXu5eOv3mR1pTwI83wZtkj0lm2JIqZqCOR+KlsAWoxO5LtkncjZoxo1DAIcX8cVG31balh+Ue
 /+ToLxXxkec8oTIO6Y5CiZNihY237ys7KgBPvuhIH675oZUVCY9G9N2OGzqPL/85bmi9aHah7ej
 KG6vBdMP/fP74wtbsQpaqD03aSkqhIj2tZ5PaT8u3CTllxUsf9pVi+66yO/tFxWYfnAnCqwFbJz
 va68kG6R7IIHtHTdcIc6nNYeRg2cisdPDeHcvW2s0j6DleOljUihDuz3hTh+lKyU0RfqBOHfIWT
 8/qVV7/kknZPDOelhGMbO5p7h/RfkYQv/ekFu4aQJnx+K9GTyH0V6Cl7t4AlUkrBCP8qEVVvlKI
 vYW4HICpDxpfO6M/Rg+B1pPUGmitksGV1EpZ9sm2aID7/WfzKy2aPl51/2vAps6fd2kqnfUT9uY
 hB6eX7Jbm++q2dPNLDNdLyrU2GlKPCEpvfYPH1RgnOCv6EPMu6PCzX+YbJdjXXe4Q8tCSkJJZZs
 u4ACJqHR2tgNB3wu9I4qu8IVMbvna2HMjcCdQZFr0k6QJsCGUy9OuKmok3EsyVKDJ+Tf12j29xb
 NZJ8aC+LUYoFs
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_16021867713 applies to every single media IP from 13.00 to 30.02
(inclusive).  We can consolidate the multiple per-version entries down
to a single range entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c3d694947bd5d2b178e9da08bb937dc6a171b326..4a8685f2ea985cb67b21bdf8a043ad1dfdfc816d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -131,6 +131,8 @@ __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 static const struct xe_rtp_entry_sr gt_was[] = {
+	/* Workarounds applying over a range of IPs */
+
 	{ XE_RTP_NAME("14011060649"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
 		       ENGINE_CLASS(VIDEO_DECODE),
@@ -146,6 +148,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1260)),
 	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, 3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 
 	/* DG1 */
 
@@ -213,12 +221,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe_LPM+ */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(1300),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("22016670082"),
 	  XE_RTP_RULES(MEDIA_VERSION(1300)),
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
@@ -232,12 +234,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
@@ -262,12 +258,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe2_HPM */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
@@ -291,12 +281,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe3_LPM */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(3000),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("16021865536"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000),
 		       ENGINE_CLASS(VIDEO_DECODE)),
@@ -309,12 +293,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(3002),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14021486841"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
 		       ENGINE_CLASS(VIDEO_DECODE)),

-- 
2.53.0

