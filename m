Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C01C7EE37
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC54E10E09E;
	Wed,  1 Mar 2023 09:31:50 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04B10E0B7
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663106; x=1709199106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7dhSIi2zNdyCSxsErW+RDsiP3ATwB3W41Iq2H8WjvcI=;
 b=eAnFED4kauOYPnvp8+elWEk7JV7CRW419YH8Hnceb/0xev69fjoP93Ts
 2z0HeVgU0ctLs7/TGgREr2eTKNiSMgaLG1ZrVRqvCg5CdbWZ7wJ14Enjz
 wRBPhWgM2Ct68XzEWziEcptxouq9G+rS31hkQfe6PF6NppUB6gC88o7jQ
 bhYVxU3V03Sxnx2yJSvKaKDnDsqhbeaKZk74qnxVONWXUwrgDVaLmfftO
 xoijxAXiv3U1H815WzTjrXTtBB7WFm9RzwvCxaDeXRN7GhxHQlxAD7hw8
 KLmJVMlonItQV4P7ESRSdcoTYIrk8QRE+0OGL31dpIRurAvU2BZ1NbyZ4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091753"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091753"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600470"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600470"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:06 -0800
Message-Id: <20230301093112.2893689-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301093112.2893689-1-lucas.demarchi@intel.com>
References: <20230301093112.2893689-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/7] drm/xe/rtp: Move match function from wa to
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
index df72b15dfeb0..475a60e4d1c8 100644
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

