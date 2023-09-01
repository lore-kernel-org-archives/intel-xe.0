Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B23CA0FE8
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 12:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9510E7A3;
	Fri,  1 Sep 2023 12:05:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043FB10E7A3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693569935; x=1725105935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XF/Sft1nweYm3CjFzYjTk0c3hOjv64osBSofyF7KmvM=;
 b=FJ+kZQ8GtFeG8ZtCJYgiI4u+rJ4RwihAayELnQNBpRnxVs+EBAXmSWDJ
 R0A5nem3tWCOrC5wMGX0VLKHNpMOjG5TVmrNFgaw9TH1QmWEsacluR6nT
 ZrAbL+prNsAgl6erBrAk4n25lex44MQlgLN6cVazatT9soTYZpfi6Vi/A
 wbeyvtxqY7PA8fjc+uy6/eskVJ4rXdrHMyiylZpJfVsVVVsJoJnL6y82m
 dyZTOCRdIlsDTIdWgtu8L1DEb4GK8GChpiQaOlPXtsSUQJ+U+Uv4Cvznd
 lVAgQOD0nubnphyq9SvwqvExXROAqHD84cncOo3SZpYJSAP4LaU+35IRk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379994922"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="379994922"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913666771"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="913666771"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 05:05:33 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:45:43 +0530
Message-Id: <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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

