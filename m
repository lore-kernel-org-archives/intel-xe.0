Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84436106286E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791A810E89A;
	Wed, 11 Mar 2026 11:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QARNeGkR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F48E10E89A;
 Wed, 11 Mar 2026 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229893; x=1804765893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XrEVlB9twd1jXbRWP/A3toEidNhVD8EfpfsDX+uZ68w=;
 b=QARNeGkRwLdkI7VM80kL1hPFnuqnxcJ9mVityVOqtIxbtyZKrzsJeHrJ
 XiWLhUjKt259axK+msD9StJpDVBSt6oXEnWtxPnYmrjqSA1nOOWZJlEVp
 V6/BxC/fZncjZds/i6EfeN9dkkha/fYBYyXkhcQ/0OZlr3rJ5/86ScC84
 SW8t4Q1hcoJZG3uooljtCmkMbtXVSqR1OBpWc9kDo7iW13yTw997RR7AS
 st8m+XiUGGRHnikin+m2Zmcl+z56h68inCCK2+jbHNqzwYXOpiWyp8Ld4
 iWSzGzfhsziDX6inMv5lyfHRpLbwCSsGl2kDNN3gJnvHVzZvVIV03qV9L Q==;
X-CSE-ConnectionGUID: itjYtLmtTq6tiaanpHqbFQ==
X-CSE-MsgGUID: qV//R/UVR2W0igXW2TX3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204967"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204967"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:33 -0700
X-CSE-ConnectionGUID: iStQ4aUbSNWTN7LLY5kCQQ==
X-CSE-MsgGUID: VHd2Bzy7R7WfL2w1vRsnlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602292"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:30 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/19] drm/dp: Clean up DPRX feature enumeration macros
Date: Wed, 11 Mar 2026 17:05:54 +0530
Message-ID: <20260311113611.3393194-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

Align the DP_DPRX feature enumeration macros for better readability and
consistency, and use the BIT() macro instead of open-coded shifts.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4ea3b5b08a12..49f0154eb93c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1202,10 +1202,10 @@
 # define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS	0x04
 # define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS	0x05
 
-#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
-# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
-# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
-# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
+#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1					0x2214 /* 2.0 E11 */
+# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED						BIT(0)
+# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED	BIT(1)
+# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED				BIT(4)
 
 #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
 # define DP_UHBR10                             (1 << 0)
-- 
2.45.2

