Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1268106286F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D1D10E8A3;
	Wed, 11 Mar 2026 11:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0EaOegM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036510E89F;
 Wed, 11 Mar 2026 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229899; x=1804765899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qy6RvxVa8nWIK/2NvGqoMwWsbntlZxtRGEa8EoE5O4I=;
 b=f0EaOegM6zUT6l1KObXipfQt3XuzG/nxjeSa1vWV3r5QxQ1qr6htBYK+
 422VosnZ40wLNbvsNPnc4dbhVs3Td9/UqYxBUz0HQD4Hq0UibU/nXCVvN
 LDgWvPg/wbihhV46TmihcnpjFF+zpxG+KCHcN3ZicajuQzYV/YoSSGbjr
 ndnDhROaQdzV2rmQFFT8ZvilCyi0BdVXbKNCBr4H3v3gLhFi86bswvkb4
 05Wv04JI4zddKkTk/tS9QHf32Ilt2ltyFNB2nveuIf5AEf2WT9f0uSc5D
 2bnk7S/MRI9zi50XdZpAmH+qI6dGRnF2PaYmHPigZKPmAY1B5prcCnvFg Q==;
X-CSE-ConnectionGUID: 4cQUXcVDSKWY2I30raipCA==
X-CSE-MsgGUID: 838ZBoeiSci4qOzE+VOvSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204973"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:38 -0700
X-CSE-ConnectionGUID: dgOeOTBBRjOhB5v+QYLudQ==
X-CSE-MsgGUID: 6FVzb7jzSpOHkx/QCIxMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602316"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:36 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 04/19] drm/dp: Add DPCD for configuring AS SDP for PR + VRR
Date: Wed, 11 Mar 2026 17:05:56 +0530
Message-ID: <20260311113611.3393194-5-ankit.k.nautiyal@intel.com>
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

Add additional DPCDs required to be configured to support VRR with Panel
Replay. These DPCDs are specifically required for configuring Adaptive Sync
SDP and are introduced in DP v2.1.

v2:
 - Correct the shift for the bits. (Ville)
 - Add DP_PR_ prefix for the PR-related fields.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 8d172863eba3..e6752a92d5dc 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -775,6 +775,15 @@
 # define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_VAL_SEL_MASK  (0xf << 3)
 # define DP_PANEL_REPLAY_SU_REGION_SCANLINE_CAPTURE		 (1 << 7)
 
+#define PANEL_REPLAY_CONFIG3				0x11a /* DP 2.1 */
+# define DP_PR_AS_SDP_SETUP_TIME_SHIFT			6
+# define DP_PR_AS_SDP_SETUP_TIME_MASK			(3 << DP_PR_AS_SDP_SETUP_TIME_SHIFT)
+# define DP_PR_AS_SDP_SETUP_TIME_T1			0
+# define DP_PR_AS_SDP_SETUP_TIME_DYNAMIC		1 /* DP 2.1 Table 2-227 */
+# define DP_PR_AS_SDP_SETUP_TIME_T2			2
+# define DP_PR_AS_SDP_SETUP_TIME(t)			(((t) << DP_PR_AS_SDP_SETUP_TIME_SHIFT) & \
+							 DP_PR_AS_SDP_SETUP_TIME_MASK)
+
 #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
 #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
 #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
-- 
2.45.2

