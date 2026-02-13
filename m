Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE769EF99E7
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E8710E857;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Va25cvkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCBA10E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mP2ZsHhvM6cir+txleJvrw3USopL89sOOsQ1r5g8Mjo=;
 b=Va25cvkWzO/GydTJhvV5JrbIT7AwRBaAgIe50QZKB4Hfqm7yr2JH8srg
 ZZAI0PqQc1uMhwF46nlJm7wyTEbbu1ab//vhyfRMjKBBHYYk1E9QXZN4S
 inzAhG91suqShfh/Uw1TzwmIHrWXL0/xpSfGHDwE0v277ylDQEEFPaxQp
 f7rmOXrFCc/OJrKzLdDonwJ1NaaD5ZEvFdWlzxlbU+NaPa/gMuLaNpeK0
 3YwfeyZeQlnjgErpzFynHwV1KGk7Re33D/t+G20U7tFW/8tmTO5QbTtrz
 PliPp4a4g5NKunbEdm9gx6kjaiTA/EwWms3IxLeJvbYkF2VrfcIb4h/r8 w==;
X-CSE-ConnectionGUID: KTBpysXMRI2rXd9Be+b+KQ==
X-CSE-MsgGUID: XLmi1U/ITKe9V+8xiwPIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654442"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: hOoONUeQRNqYYXzjbTAVvw==
X-CSE-MsgGUID: 22Lq0e9VTMiqvXzKpWqPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705665"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:50 -0800
Subject: [PATCH 15/22] drm/xe: Consolidate workaround entries for
 Wa_18041344222
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-15-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=mP2ZsHhvM6cir+txleJvrw3USopL89sOOsQ1r5g8Mjo=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aD3l5q+oVj0qXWN0d0bQMZrWTCqzibEz+GL
 KYgGJC4oE+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BAtxEAC6g8ectvuez1Iq9/8btTPChXmF31OxoPRqjzLxHZHFU+EiSnI+BYg+0qmJjcagqVcncd7
 0w5/8hcNUzRN9ND9gMScW7flIKDnF4T608MdIvhLxYSA4u91sCotrCJoodzwKC1rvtytXMMotXz
 iRSao5pyP3Be0N2cdNdoIl2yl7zwu3o76GlgXwLr1T+Rbi2bM5DAqgfPhLyOgAwHXds/ZmHXUCf
 6adJNo9qCsNNanygnbnNbyoZJ3U6yHEvvS2fEVoa9k8IHOMTRoiXaILAh4Kd/LrEE9bQRkPMyAx
 1cUxRwVERa2SfLOBbii1v9iJJED1gST6U+deqGew75jPVoA9CZIwXSLLMZudk2hEMTamDIBmSUG
 qMrK2VFilsGeMeOtM9rqUbDA+c1UzRgqH//Qwi8lk3mP67NVXdsAa9AY0o/fMXD2BCC/M5XvnKP
 NzzoPMQzCvnmiiyFslkO44jWnU6pstkQSoNE0hO9KZyg32/foA2lYhJhrlDiNa+BWGvZlAqOToq
 zPyatqHTpubUuKsUpEHWCiBCrjWo+RquZxwTSaKBBsoH2Tbdut/e4nVVma1Qtp3SiHkRT3zgyAN
 DouSVUJtjgqt3l8yz5EOaFPOG13sDeBg5athD1Jt5IytuwHBFaQcDGvfj+vTzqtehOOwFFBHqBJ
 EiynhQ3lxbj2tCA==
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

Wa_18041344222 applies to all graphics versions from 20.01 through 30.00
(inclusive).  Consolidate the RTP entries into a single range-based
entry.

Note that this workaround has recently been extended to 20.04 in the
workaround database and we had not yet added that version to the driver,
so this change also takes care of that.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 27e22f23088b5807dd11daa4d08eb80dc6eacd6a..52066e9e7dcfcc3e8ff1b8c5eb40430da1d247f4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -385,6 +385,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* TGL */
 
@@ -549,13 +556,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
-	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_not_sriov_vf),
-		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
-	},
 
 	/* Xe3_LPG */
 
@@ -583,13 +583,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
-	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
-		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_not_sriov_vf),
-		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
-	},
 
 	/* Xe3p_LPG*/
 

-- 
2.53.0

