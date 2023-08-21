Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A66FEE49AA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 11:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597A010E23E;
	Mon, 21 Aug 2023 11:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E737410E169
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692619047; x=1724155047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XF/Sft1nweYm3CjFzYjTk0c3hOjv64osBSofyF7KmvM=;
 b=Jr3iFiDorucBqJQndndOQBHt2vNEggW88I2WBhPmP0aQ8B/vgt4noDdk
 kCNScvkJRz4dDw/tvS3K5kTdTVhiOdDIpk9BJ6FRN7ktfrKF+3A/vEwhB
 KEXUFrT3HXzI2R7IZ04dlzeiZnTkhLdZwBKZ4RoH51l1eyBiptEm9PQJx
 2VVIioyMXndKHC+2JjHYtbgh76PogUJj9on51Lt6ANEWrU3WbMsTk4onL
 x9HudozKRiA/slLMotAe/2VTaXsNMAyJBHnw9JsJGJ2RHSxRkxPaECGcj
 BftDyPI0LcmKFk1hTqB7EezXldQJK9qGfr3Yr9NWt1v3hd1+yXpoeEywb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="376317636"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376317636"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770918660"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="770918660"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 04:57:26 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 17:37:27 +0530
Message-Id: <20230821120728.3871527-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
References: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC][PATCH 1/2] drm/xe: Add a couple of pcode helpers
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some pcode commands take additional sub-commands and parameters. Add a
couple of helpers to help formatting these commands to improve code
readability.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 7f1bf2297f51..e45169f47500 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
+int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)
+{
+	u32 mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
+
+	err = xe_pcode_read(gt, mbox, val, NULL);
+
+	return err;
+}
+
+int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
+{
+	u32 mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
+
+	err = xe_pcode_write(gt, mbox, val);
+
+	return err;
+}
+
 static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
 				u32 request, u32 reply_mask, u32 reply,
 				u32 *status, bool atomic, int timeout_us)
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 3b4aa8c1a3ba..8d4103afd7e0 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
 #define xe_pcode_write(gt, mbox, val) \
 	xe_pcode_write_timeout(gt, mbox, val, 1)
 
+int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
+int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);
+
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
 
-- 
2.25.1

