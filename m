Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE46C4706C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5170C10E54C;
	Tue,  9 Jan 2024 23:00:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269410E53F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841242; x=1736377242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jTiz69vE2sz6hR6cB40P49Tc6F6YppfIvuvOs5shsP8=;
 b=lDYyN/KkQ8hiEDLaOgh+e+s1yGiTkq/hVjJSlhlN2/dx16nqUsj84+Pl
 jxjRkkpF7VsisnoN1v4AJkbZGht42MJ8ZgvIHnYXPAYDkU2r4DNDOCnXz
 SjUCq3ivjejpAAhAbx1d39ywFME6wJ7PZqtMlcRf5jOZ6y7rc7/j60M6M
 /uQgXS6UUqK+yB4IcOdeIWzHCJWtLcgX/7r83sLz2y+FKXJMLpIz5Rc3D
 KKoDL/XDBL/d3IadB0bsTJxQi22YIrEjHhk+R1NeM0/iT/wqYZdhGPOcd
 xFMp+U2ryUIn+RUOXDuKyLcqUWJjLtFf1TFE9ru9dtA60bbEHgh3NrTpW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="402133729"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="402133729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775017410"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775017410"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:00:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/guc: Fix arguments passed to relay G2H handlers
Date: Wed, 10 Jan 2024 00:00:15 +0100
Message-Id: <20240109230015.365-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240109230015.365-1-michal.wajdeczko@intel.com>
References: <20240109230015.365-1-michal.wajdeczko@intel.com>
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

By default CT code was passing just payload of th G2H event/request
message, while Relay code expects full G2H message including HXG
header which contains DATA0 field. Fix that.

Fixes: 152577060697 ("drm/xe/guc: Start handling GuC Relay event messages")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9d1d855da229..721564dbfda6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -975,10 +975,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *hxg, u32 len)
 							   adj_len);
 		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
-		ret = xe_guc_relay_process_guc2pf(&guc->relay, payload, adj_len);
+		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, len);
 		break;
 	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
-		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
+		ret = xe_guc_relay_process_guc2vf(&guc->relay, hxg, len);
 		break;
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
-- 
2.25.1

