Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD1106286F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78A910E89E;
	Wed, 11 Mar 2026 11:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmHtX3ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D470410E89E;
 Wed, 11 Mar 2026 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229896; x=1804765896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aR883MkdyqzgSmejoaAQt1SUeJk1ueOFd1ylE1QQbDk=;
 b=GmHtX3ns8c4Bhpv0D4uh/l6fkDbZM7sHaTzIYrw0YrX5W8471H7Q1Ypg
 Ma2rHFjbSQK8yD7HKyUYemIF0NCGn4b0c6KhlCAVzBfEo1gStvOYv6Y+r
 ZI6NNDQ+S0KWyiBjowZ6aKX2ILOE4FOeL9bhE6KTDN/hzz3ewVb38VqOQ
 wKl7ygBFYx/Ohc00AEsvWyitfNNRffMQFzYvpcItuhFhJQWBJ7iRSfMVY
 bCakc8902vK2R3WSahhssnc6h3aVQUiKuZG0AJnwMKgRF4lnYIlL5uPl1
 nmPHxQ4DdNo5M5EHtEl812M1pfZJ1ov1Z9w4ovT7EN73Hagj1kcGzJwkZ A==;
X-CSE-ConnectionGUID: /3f5FvJOTI+/gHFz3tYU4Q==
X-CSE-MsgGUID: WRySgqYeRxOcPY1gKQ6Olw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204971"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:35 -0700
X-CSE-ConnectionGUID: 9CNil/Z1Q82cKA2bB/Ryhg==
X-CSE-MsgGUID: AVNLAi/ySoOgQl5gpoyowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602309"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/19] drm/dp: Add bits for AS SDP FAVT Payload Fields Parsing
 support
Date: Wed, 11 Mar 2026 17:05:55 +0530
Message-ID: <20260311113611.3393194-4-ankit.k.nautiyal@intel.com>
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

DP v2.1 introduced support for sending AS SDP payload bytes for FAVT.
Add the relavant bits for the same.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 49f0154eb93c..8d172863eba3 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1205,6 +1205,7 @@
 #define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1					0x2214 /* 2.0 E11 */
 # define DP_ADAPTIVE_SYNC_SDP_SUPPORTED						BIT(0)
 # define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED	BIT(1)
+# define DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED			BIT(2) /* 2.1 */
 # define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED				BIT(4)
 
 #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
-- 
2.45.2

