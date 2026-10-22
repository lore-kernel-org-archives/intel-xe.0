Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D9B606A325
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BL3rNktG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D88410E19E;
	Thu, 22 Oct 2026 06:11:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9910E19E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792649494; x=1824185494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aIc/hC3NSxZQADfOueAe2Zh5ZoPgQ+yqiZjfrBD5ce0=;
 b=BL3rNktGSvyrk/WK27t1Gs6lLkYKVOIF2sovCS8u93JZYaBcISUUVlUi
 nGy9pqmlRb5fayrl1TpWdnR2HWqXY9JqjmU7nXE7PMvXYSTuDVhClaPmj
 PR+S14e44yJCJQBZjQU4BJPejJ0pTsfE+cDg4dhLuokhlO3I7aucHy0Kq
 I0HkyB/YeGxKXldvukC4uXjQHSpieatkEFIoXeAkfHZOXV5LfXQot48pC
 x7qOPEoxkxSr+G4DyebX1ebBEJi2JVLSUa8HeCzL6nUnxMGXGVjrQgyK7
 Rc6OhkzOMkafb/bkuk50b+e0bTGfjti6UoFOq7TKbYQaxnE8XAo1PZh1w A==;
X-CSE-ConnectionGUID: r/RbaAOJRca30HSMyHanZw==
X-CSE-MsgGUID: BKJpnHnjRmurxUKGhqY92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1397932"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1397932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:11:34 -0700
X-CSE-ConnectionGUID: WqpST7HdTWmD09dkbFfypg==
X-CSE-MsgGUID: cBdON3wESSKYSS60R0rJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3315279"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2026 23:11:32 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/tuning: Stop applying media CCCHKNREG1 tuning from
 Xe3p onward
Date: Thu, 22 Oct 2026 12:21:14 +0530
Message-ID: <20261022065113.928244-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 288b775a1cd4 ("drm/xe/tuning: Stop applying CCCHKNREG1 tuning
from Xe3p onward") bounded the graphics-side Compression Overfetch
tuning to graphics version 34.99. The media counterpart
(XE2LPM_CCCHKNREG1) was left unbounded and kept being applied on
Xe3p-generation media blocks. This was caught by
igt@xe_debugfs@check-gt-reg-sr on a CRI media GT:

  Mismatch on 0x82a8, expected 0x800000 got 0x0

The tuning guide (Bspec: 72161) still lists this programming for
HUB_DIE (media) projects on this generation, but bit 23 (L3CMPCTRL)
no longer exists on CCCHKNREG1 on Xe3p, and bit 25 (COMPOVFDIS) is
also absent. Bit 18 (ENCOMPPERFFIX) already defaults to 0, so
clearing it is a no-op. The tuning guide entry is stale for Xe3p.

Bound the media tuning the same way as its graphics counterpart so
it stops being applied from Xe3p onward.

Bspec: 72161
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 457c6dd1e0da..bf8305840b63 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -49,7 +49,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
 	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
 	},
-- 
2.50.1

