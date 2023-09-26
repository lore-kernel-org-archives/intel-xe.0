Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B722CE7E63F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1BB10E3F2;
	Tue, 26 Sep 2023 14:29:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AC310E3EA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695738565; x=1727274565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mf4+mbh05oAPuNqbfW0DGxofMAcQ7NJ8fC6KJsx0RhI=;
 b=nJX4DZ/nzZAmAocer7BEIRhmZhcTUeKyVbtb7Et7SGUQLr1zsskzxYjE
 5xNsiaK0rofohdMPqlBIS4TeU7cEZPgA2Qr9PX5Qn9BQGgM3JgYoEd6kz
 QGljNICsfx3/0FU//2UhRfmMrAxRbytgk6q3+jWBAA/umnGSz/9AsJe93
 MtwREcgBiMsnyXHXYYKwWv1NopzHD6Q8Eq+BN3mNVJwqh3AvEhGS8x/r3
 6KT+ScqZSCUwHj23PxDT0o6fOjass7JAjcph0gr6TLh5eKdzxL2TwkzR3
 EAgaAkr9xej1fVjl9OUspe1H8gctNu8+KOGcyYlB5sGv+pLYiPchs9FbX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385425148"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="385425148"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079726671"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="1079726671"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2023 07:29:23 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 20:11:19 +0530
Message-Id: <20230926144120.334009-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Add a couple of pcode helpers
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some pcode commands take additional sub-commands and parameters. Add a
couple of helpers to help formatting these commands to improve code
readability.

v2: change function name (Rodrigo)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 7f1bf2297f51..eed096ffc23c 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
 	return err;
 }
 
+int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)
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
+int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
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
index 3b4aa8c1a3ba..79ae45e71228 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
 #define xe_pcode_write(gt, mbox, val) \
 	xe_pcode_write_timeout(gt, mbox, val, 1)
 
+int xe_gt_pcode_read(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
+int xe_gt_pcode_write(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);
+
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
 
-- 
2.25.1

