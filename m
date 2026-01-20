Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D49D2628B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F2C10E220;
	Tue, 20 Jan 2026 18:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZH7cxw6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DDE10E178
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768935061; x=1800471061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bg+gNNKuP1HCmkM9z54/h2JLROj1y77QJqYD74w8Q0s=;
 b=ZH7cxw6fp6uCylFOXI1eA9F9xIoBX7rEa765exOFEwe+LoEjJq4+slnZ
 2FTd8S27dlLzVny3ad3dYDyLCyPWCMGuLrCVrwPxHh4GZ0AIhGyfs5YN+
 ZcBBUCGUII7pTGMDRbT0dyahyprGI2Zwoo6Ok7O1gmDxkt0t0QDi6XIFK
 90GrX9Zm2DxLXIeFE6k4YfxtJ8elApbTci62S+wjBw5UPiBxluyInoxZk
 Ewdlj0KliS1wP5YrLQ909aCvrWcpBIWUzTNIUPSbG9a5mxdrTCfX3TKF0
 DIu+yEiMI5A4oVWWK8wMs0FMnj6B9neWav/GsD4+oZq2w5PYi9UwOqtju A==;
X-CSE-ConnectionGUID: iaTouenMTeKYpdwwFfICsg==
X-CSE-MsgGUID: R+7rctqyQ0+JMUnC1VSMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70245726"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70245726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:51:01 -0800
X-CSE-ConnectionGUID: Si4at/oHSte9U+IT24GLMw==
X-CSE-MsgGUID: 6dBsnsh1S0GhKC/vXu1+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243776626"
Received: from amedve1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:50:59 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Wait before retrying sending H2G
Date: Tue, 20 Jan 2026 19:50:46 +0100
Message-ID: <20260120185047.593-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120185047.593-1-michal.wajdeczko@intel.com>
References: <20260120185047.593-1-michal.wajdeczko@intel.com>
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

We shall resend H2G message after receiving NO_RESPONSE_RETRY reply,
but since GuC dropped that H2G due to some interim state, we should
give it a little time to stabilize. Wait before sending the same H2G
again, start with 1ms delay, then increasing it up to 1s.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 2a3b057fc828..3ba0ea015611 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1397,6 +1397,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
+	unsigned int sleep_period_ms = 1;
 	bool lost = false;
 	u32 header;
 	int ret;
@@ -1477,8 +1478,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	    GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
 
-		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
-			  request[0], reason);
+		xe_gt_dbg(gt, "GuC mmio request %#x: retrying after %u ms, reason %#x\n",
+			  request[0], sleep_period_ms, reason);
+
+		msleep(sleep_period_ms);
+		if (sleep_period_ms < 1024)
+			sleep_period_ms <<= 1;
 		goto retry;
 	}
 
-- 
2.47.1

