Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE612C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 20:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BDC10E649;
	Wed, 10 Jan 2024 20:00:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4455010E649
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704916814; x=1736452814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O2pybc8RlDLusETQCiIMknlGMtg05zSJcZTCPXOBQT0=;
 b=dr5zCSPu7+4KCypW4zgycUtUBKKU5HvCeZbLoTolUH1D1sMTbb26axvn
 ghmQ/59gANHfhhRlNUm0uWp+jdxtDj4H/QhJt642LBhsgYl/hHu0xEE0f
 icdzBjv2BvHQXWbiOILViJFJ67iQkIvIxp7R7iagAhQWSg6omOhF952ak
 zdkUkBrmceF0csjoKdqQbqr/SOnUqwtHOTJ1wMFQ/tSEG5bkWdVQCsyYT
 Z7zLoqc0jy4ZmzCCTGir9zIi5w2/kevAnqPYmSq7yQzgh45I6WDrKNo8t
 lrzJi3a+BPI1OldPwGIVW/83X7J47Tk7SZ4aslie7uPnwxmz0WO8RIBg0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="484816278"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="484816278"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029263397"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029263397"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.210])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:00:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Date: Wed, 10 Jan 2024 20:59:51 +0100
Message-Id: <20240110195951.453-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240110195951.453-1-michal.wajdeczko@intel.com>
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
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

Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d6b7020a2d2f..4a0c9ce13bf8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -984,10 +984,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
-- 
2.25.1

