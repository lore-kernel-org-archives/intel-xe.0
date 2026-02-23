Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3464FEA4FBF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2DC10E3C4;
	Mon, 23 Feb 2026 13:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkjC4ey3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3C810E3BD;
 Mon, 23 Feb 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853425; x=1803389425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VmqNqNaM5CB/B2Saxy0W/QAruTGRJJqEyVuB177B//s=;
 b=kkjC4ey3+x+rBBM5p4GBDhaqdFeLNAbGaPw4xbfqc3+klw5yOH8MoIAM
 nGq5lC7uxHcW5soyzLxggReArkM6S819FXbDE0DRzj2OL+6GG+kc9HeI+
 ZXWtJ0Bv+v9g25YChm6Gfr3ns4uB4CoseEHNP/d7YqmNpFO49yxm4M97P
 Wvw6fSCuHa0T65Hvy7x40DuGpxBJpWJ1RRyGT+bS/CuV9YJIFG5mhjL6a
 Y8acTX6ztCHvo/6bA6vynWAdQEJZKb5XaEzEG8TZOOWs/x6QVVQT7TiGe
 R7gcelakMHveQj4hquyTYVNg/hQOeFZOSupf0SzzJeGimVoy8K5EGylZb w==;
X-CSE-ConnectionGUID: MqmLswZiT3S6yCEFVe3bBw==
X-CSE-MsgGUID: pZoXDW+nTayildKUq652aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724212"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:24 -0800
X-CSE-ConnectionGUID: /PKhFLFvR0+pSvKznFiQxQ==
X-CSE-MsgGUID: ae4dxTGqQIitrGoDpVPtJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580520"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:22 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/14] include/drm/display/dp: Add DPCD registers for
 configuring Panel Replay + VRR
Date: Mon, 23 Feb 2026 18:44:24 +0530
Message-ID: <20260223131426.1638946-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
 <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
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

Add additional DPCDs required to be configured to support VRR with Panel
Replay. These DPCDs are specifically required for configuring Adaptive Sync
SDP and are introduced in DP v2.1.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..e63705415647 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -773,6 +773,15 @@
 # define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_MASK  (0xf << 3)
 # define DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE		 (1 << 7)
 
+#define PANEL_REPLAY_CONFIG3				0x11a	/* DP 2.1 */
+# define AS_SDP_SETUP_TIME_MASK				(3 << 6)
+# define AS_SDP_SETUP_TIME_T1				0
+# define AS_SDP_SETUP_TIME_DYNAMIC			1	/* uses Table 2-227 */
+# define AS_SDP_SETUP_TIME_T2				2
+
+#define AS_SDP_TRANSMISSION_TIMIING_CONFIG	0x11b	/* DP 2.1 */
+# define AS_SDP_ONE_LINE_EARLIER_ENABLE		BIT(7)
+
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
-- 
2.45.2

