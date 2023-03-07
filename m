Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE039C6FD1B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EDB10E3C5;
	Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97F410E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181129; x=1709717129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LZ6EZyn8e0QSRWCAAEezU4OIjHgOeFEdwpPuxI6G8b4=;
 b=Ugmpl3XX51TsuFN0pYTPN6zmgkTeWYi6a9IStmF+vOvwsWU9DosvUSX9
 oJXB2Vzm5WbeZ26diUb7rOso+uqKtmfXYxtTifuOSZHSiRltOVc08oQrh
 j2gRqYfVuFLLItPbzbYJlWwAAeM70nr90ep5NTQeNO8XLKzOBfiaRJ/N6
 xauF4MMSkx8rA5fusZmRYlyUYNCwzdEF2RwC4txfQkSxxiqbOM+BjArYn
 Q65EUP/sP8lo+3FM1JaLk8b0KthfN6d/H5iqhWlAvYYopSzODhXaf8fD/
 5DOr4iOIdIkmk/X6saxqL2yxpcu3zjSVCMvTe1A01/OEI72hZ5yvWy5FV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079116"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079116"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798805"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798805"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:32 -0800
Message-Id: <20230307092446.1263266-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/19] drm/xe/rtp: Move match function from wa to
 rtp
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Match functions are generally useful for other parts of the code (e.g.
xe_tuning.c). Move and rename the single one available to create a place
where similar match functions can be added.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa.c  |  8 +-------
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5b1316b588d8..c04eca290ef0 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -154,3 +154,9 @@ void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 		}
 	}
 }
+
+bool xe_rtp_match_even_instance(const struct xe_gt *gt,
+				const struct xe_hw_engine *hwe)
+{
+	return hwe->instance % 2 == 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index bd44fd8bbe05..9bd2532442ed 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -397,4 +397,16 @@ struct xe_reg_sr;
 void xe_rtp_process(const struct xe_rtp_entry *entries, struct xe_reg_sr *sr,
 		    struct xe_gt *gt, struct xe_hw_engine *hwe);
 
+/* Match functions to be used with XE_RTP_MATCH_FUNC */
+
+/**
+ * xe_rtp_match_even_instance - Match if engine instance is even
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if engine instance is even, false otherwise
+ */
+bool xe_rtp_match_even_instance(const struct xe_gt *gt,
+				const struct xe_hw_engine *hwe);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 03c5b01a14e4..67539f9d70b4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -91,17 +91,11 @@
 #define _MMIO(x)	_XE_RTP_REG(x)
 #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
 
-static bool match_14011060649(const struct xe_gt *gt,
-			      const struct xe_hw_engine *hwe)
-{
-	return hwe->instance % 2 == 0;
-}
-
 static const struct xe_rtp_entry gt_was[] = {
 	{ XE_RTP_NAME("14011060649"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
 		       ENGINE_CLASS(VIDEO_DECODE),
-		       FUNC(match_14011060649)),
+		       FUNC(xe_rtp_match_even_instance)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-- 
2.39.0

