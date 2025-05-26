Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CA5C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182E110E300;
	Mon, 26 May 2025 12:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+84pWXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7BD10E300
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261134; x=1779797134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cM8gMUJ6maXEJaQyVccrNN6wXfs1slLmyzxdU3rDSWM=;
 b=H+84pWXFwRR4EfYzAIYAhuGYiW1nBguji1tkD9+jczWYFXVfOLtvX381
 pbnqyYMHk5Isj0HSFtdEzSbH0E13u+vhVH2Cm6hYAi9+xspSSrVc5Z0ub
 hci9D1vmY6jsWDASi58hWrrzbE7RxHOYAeDN//KW+f00BRPHj7wyWot9L
 puw2n/eGBlolRmkREE2+Xxf20wld47CJnrv9Xq4O+OijnH7ycxxPuJSbu
 4uSjPeQL5MieB6q1bsVHN/rkoVTmgZfYvUc21j9JqNm+AYahv4ab1dvpc
 oqiFaPt6r7lUPbb5Zx0dS0VjOLzPA3WcWJ/eT5Vmf/cJuK3COBczlprh7 A==;
X-CSE-ConnectionGUID: XpsBPblWRDqSBC9vvQPzXA==
X-CSE-MsgGUID: RZQnTAdcQqWBq0EfuSgOtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492284"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:34 -0700
X-CSE-ConnectionGUID: ha07638iRt26fBJnW7NKSw==
X-CSE-MsgGUID: 0upNnxQpTV223ZMd9tq/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576016"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 02/12] drm/dp: Add Panel Replay capability bits from DP2.1
 specification
Date: Mon, 26 May 2025 15:05:02 +0300
Message-ID: <20250526120512.1702815-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add PANEL REPLAY CAPABILITY register (0xb1) bits.

v3:
  - added DP_DSC_DECODE_CAPABILITY definitions
  - use defined shift instead of hardcoded value
v2: comment about DP2.1 changed as DP2.1a

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 include/drm/display/drm_dp.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3371e2edd9e9..811e9238a77c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -554,8 +554,18 @@
 
 #define DP_PANEL_REPLAY_CAP_SIZE	7
 
-#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
-# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
+#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1a */
+# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT)
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_SUPPORTED				0x00
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_FULL_FRAME_ONLY				0x01
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_NOT_SUPPORTED				0x02
+# define DP_DSC_DECODE_CAPABILITY_IN_PR_RESERVED				0x03
+# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
+# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
+# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
+# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
+# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
 
 #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
 #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
-- 
2.43.0

