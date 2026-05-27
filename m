Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A37CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 18:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02510E900;
	Wed, 27 May 2026 18:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ3e1Emv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18DB10E900
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779907068; x=1811443068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pgu8NpQOIb9m2VY7J/nXykLyQ2SrLa/dycyJ2pp/II8=;
 b=IJ3e1EmvYxV26Cv7IKbV1xA49czt5KQ2eEeTqiiQJYOQ0H3PDVHxTyvj
 Th8iqAhva92YHDqo6dOAdkYvIINLM35YoWUgfDYWZ3nvV0RIB60mOWzvR
 dVC2kcCq+hfqOLwJU077oaagV9NERso1STOdH0kGjgaNIGSBIS4kB5FpY
 5um2fvcB8mOMIzikGg4fVcsPbrCIFdeGS+Tp84O4gbC+tFuh+hFVN4r/h
 OMgOS0WfZVVREQl8+sjR4uyuik8NjK6u3/lERaxJVxllQBMIfesQdSRyO
 u42ESPPCEYaHMq0itkn/ldlwz7gPR2dK8Vj/9isPHvwKyH/rAgVWyy2Ln A==;
X-CSE-ConnectionGUID: 9iudpWS1QtyS14nJ/SXbtw==
X-CSE-MsgGUID: tl16aqoBTVOI6PdtYzE0WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103423857"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="103423857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 11:37:48 -0700
X-CSE-ConnectionGUID: wzYZqpNqS1Can3nGRgZ6Gw==
X-CSE-MsgGUID: iMVNICcqSgq8YtDQX3Z/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="235955132"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 11:37:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Don't attempt to process FAST_REQ or EVENT relays
Date: Wed, 27 May 2026 20:37:35 +0200
Message-ID: <20260527183735.22616-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently defined VF/PF relay actions use regular REQUEST messages
only and the PF shouldn't attempt to handle FAST_REQUEST nor EVENT
messages as this would result in breaking the VFPF ABI protocol
and also might trigger an assert on the PF side.

Fixes: 98e62805921c ("drm/xe/pf: Add SR-IOV GuC Relay PF services")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index 577a315854af..eed0a750d2eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -689,12 +689,17 @@ static int relay_action_handler(struct xe_guc_relay *relay, u32 origin,
 		return relay_testloop_action_handler(relay, origin, msg, len, response, size);
 
 	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]);
+	relay_assert(relay, guc_hxg_type_is_action(type));
 
-	if (IS_SRIOV_PF(relay_to_xe(relay)))
-		ret = xe_gt_sriov_pf_service_process_request(gt, origin, msg, len, response, size);
-	else
+	if (IS_SRIOV_PF(relay_to_xe(relay))) {
+		if (type == GUC_HXG_TYPE_REQUEST)
+			ret = xe_gt_sriov_pf_service_process_request(gt, origin, msg, len,
+								     response, size);
+		else
+			ret = -EOPNOTSUPP;
+	} else {
 		ret = -EOPNOTSUPP;
-
+	}
 	if (type == GUC_HXG_TYPE_EVENT)
 		relay_assert(relay, ret <= 0);
 
-- 
2.47.1

