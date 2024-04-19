Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6DEC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 15:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166DD10ECBB;
	Fri, 19 Apr 2024 15:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmd0Fa9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343BB10ECBB
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713539057; x=1745075057;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZfKNzX3NLZrZ+VpHZ7x1qu80/ylnzHA9l0MPyjXrOs=;
 b=dmd0Fa9F0VQjY7maq3z4J+QxKwGWgh2EHp9agSLtouZddg/eKF9op54X
 +3mi+y6cKhvneQsVFHNUP4ja7ZD+nDGOIJtfZSDqYIS2bzVdSl/a//5RM
 2Pe8Fdfxq/TVuKu31yQks09eKi9KeekEFZkzwTlCDOxheZkQP0SIiyq72
 gyh2IcYxyxlyrxVqomjs/Y+LXya/0Yf3NwnAFmWpba3ifPIfM2fwHfMAu
 9EA/ASpLEaCIUnnBE1T4eMl6NSnU1yy1h9KpRYHJMWujBnLmaf5o2GV0D
 rjt2/oGbEEzYkDiSaPZvNdkbOabpUil2wJYtvl0lTyZWZ8CeIdyk4X6Y4 g==;
X-CSE-ConnectionGUID: SRnkhILwTpqtfhQ1hJpfoA==
X-CSE-MsgGUID: n5L5csYdTASVvXLuSR/73A==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="8977092"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="8977092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:04:12 -0700
X-CSE-ConnectionGUID: dMHhRYnVR2aq4RhgZyl3EQ==
X-CSE-MsgGUID: V8jJf2SxSUCu7wK7TN6NHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="54558185"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:04:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Fix arguments passed to relay G2H handlers
Date: Fri, 19 Apr 2024 17:03:51 +0200
Message-Id: <20240419150351.358-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

By default CT code was passing just payload of the G2H event
message, while Relay code expects full G2H message including
HXG header which contains DATA0 field. Fix that.

Fixes: 26d4481ac23f ("drm/xe/guc: Start handling GuC Relay event messages")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ac9324338ccf..8ac819a7061e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1058,10 +1058,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
-		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
+		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
 		break;
 	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
-		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
+		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, hxg_len);
 		break;
 	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
 		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
-- 
2.43.0

