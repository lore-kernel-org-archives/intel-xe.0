Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE4DC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFC110E28F;
	Thu, 16 Nov 2023 15:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42BF10E60D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700147574; x=1731683574;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q/df1nMY+sedY5u/XtJVLFMYlOViwWwyLtB5FpIny1U=;
 b=FjVHWw5AQ1XqYH8Bp81lrrKBKOAwyKr5jF1K4pbnzW0nxkfWz6RCCsxn
 nHF2kkNDKBLkJh8pOGQ7BrpR4S+zDw37mMTMhQ7SNtv5vOTh/JR7DZeNu
 oN4qB+QE711u3h1aQ50IKYlPxSHhYw2uE0KLwyWiB88bbM6cVvUZEicba
 066g6eZGHow3IhNxTzmrndctsOYcyC6B+xasOJHESphGvXFklzfSsiMpI
 dBMiQK6mqHwl1COh+VKau3PurN/8PLcMA16WG3Naduz/kxDVTBvhUiMWo
 3j99yfCEqQ8eKkq3thvIj/dk/XT1gneW8rZNe474YgKqsVouNj7Cjmyg/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388269212"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="388269212"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938863154"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="938863154"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.152.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:53 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 16:12:41 +0100
Message-Id: <20231116151242.2125-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231116151242.2125-1-michal.wajdeczko@intel.com>
References: <20231116151242.2125-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] drm/xe/guc: Fix handling of
 GUC_HXG_TYPE_NO_RESPONSE_BUSY
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

If GuC responds with the NO_RESPONSE_BUSY message, we extend
our timeout while waiting for the actual response, but we wrongly
assumed that the next message will be RESPONSE_SUCCESS, missing
that we still can get RESPONSE_FAILURE.

Change the condition for the expected message type, using only
common bits from RESPONSE_SUCCESS and RESPONSE_FAILURE (as they
differ, by ABI design, only by the last bit).

v2: add comment/checks to the code (Matt)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index aa4af536c1e9..56edcb2b0e45 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -659,9 +659,20 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	header = xe_mmio_read32(gt, reply_reg);
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
+		/*
+		 * Once we got a BUSY reply we must wait again for the final
+		 * response but this time we can't use ORIGIN mask anymore.
+		 * To spot a right change in the reply, we take advantage that
+		 * response SUCCESS and FAILURE differ only by the single bit
+		 * and all other bits are set and can be used as a new mask.
+		 */
+		u32 resp_bits = GUC_HXG_TYPE_RESPONSE_SUCCESS & GUC_HXG_TYPE_RESPONSE_FAILURE;
+		u32 resp_mask = FIELD_PREP(GUC_HXG_MSG_0_TYPE, resp_bits);
 
-		ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_TYPE,
-				     FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS),
+		BUILD_BUG_ON(FIELD_MAX(GUC_HXG_MSG_0_TYPE) != GUC_HXG_TYPE_RESPONSE_SUCCESS);
+		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
+
+		ret = xe_mmio_wait32(gt, reply_reg,  resp_mask, resp_mask,
 				     1000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
-- 
2.25.1

