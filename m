Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFE7EB2700
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 21:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A8B10E071;
	Tue, 10 Feb 2026 21:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQjfapXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D9F10E0E1
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770760714; x=1802296714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ClN6ivEQ1RlTUGhfl2ftOBjwOVaRMZNyDraNm+bs9HA=;
 b=lQjfapXCIg25htrUnxHQ/bWRVj7hiL7KPkUsHuGP1B14fb2UC5scD5kp
 ZoOzW7Mjq3vTR7oc+90JMx3vmm7QRCTddD6CvH37hgBAGgSzQGbxFXXDv
 gaDIBtHrzdIaJwO32DjCB+7LUBLSd9rxMoZgLK2V/Gvit8xu0sZqlLsER
 XagcnOMrmEcNGFASAezUbuusg3psAGQCAqHta3q3gdnK38ivgdKN+1yyc
 3FTH2Rn7y0NhkUs7obv/mkHu7Wn/yn5Jjj0PBbMST16qlipcMQo2r1krp
 20oPTA00XHCauxdyFM1Tsqjc0xCzYm/Q9SgGIsXk0nmK5MuIzCZcP7WTt g==;
X-CSE-ConnectionGUID: 5FUpGCYmRFWmORyp+26aUw==
X-CSE-MsgGUID: QYgfUvb0Rx21WZNjy9eP7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82538605"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82538605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:58:34 -0800
X-CSE-ConnectionGUID: J9eKSJkzTAqqrAZxWvBIUw==
X-CSE-MsgGUID: yD0FKbZ5TsqeceZo+HWomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211052247"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:58:34 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/3] drm/xe/xe3: Remove SRIOV VF check for Wa_18041344222
Date: Tue, 10 Feb 2026 13:58:26 -0800
Message-ID: <5879396bf202b64d9b5c4cb8c720f3e65d358fc1.1770760591.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
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

Engine WAs are not applied for SRIOV VF, even though they are processed.
Remove the SRIOV VF check.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c9ca74cb77f1..d512a9ca82fc 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -694,7 +694,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
 		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_not_sriov_vf),
 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
 	},
-- 
2.43.0

