Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA4C04A6A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 23:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DADA10E173;
	Fri,  4 Aug 2023 23:17:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F1B10E13E
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691191042; x=1722727042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfe49YJMxXhz4zavLfGQxCPDxT70c7EYU022Ys/6I8c=;
 b=AvjxnrXeY5G/OUuaFmEed1U5154oJRm9h/32JnjYyjfZWBdI0/qMh8is
 f9KDlBtnEWwYqx6UfNIfL8zQiGUAqTDkzVOjat7WB7PVEgpcHfGBFRGT2
 +gOSBF035ABZQdpmEIhmP/0hqpH4iZniP3z5+mC3Eix2t5J3YpGcF929l
 opiBMv3DLSWLu1K0w/7GRd+4PbnrtlhfiJ1mUi0qSjdPcZ+1uUglaSyyf
 b9VsedF7vw6ri+1OfSMhZXTB5l3UtBfxSlRdzryka09CaqtdnEvWdK+/P
 ZWGh+LsORCkwwPz+oV1P1JiJ7LyaLrbqHBQEkI5zNv5kc7oeOQZ+4xe2q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401225999"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="401225999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853983488"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="853983488"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 16:17:08 -0700
Message-Id: <20230804231709.1065087-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230804231709.1065087-1-lucas.demarchi@intel.com>
References: <20230804231709.1065087-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

Use tab instead of spaces.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/xe_pciids.h | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 31bb7196aa3e..1263838617d3 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -180,32 +180,32 @@
 	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
 
 /* MTL */
-#define XE_MTL_M_IDS(MACRO__, ...) \
-        MACRO__(0x7D40, ## __VA_ARGS__), \
-        MACRO__(0x7D43, ## __VA_ARGS__), \
-        MACRO__(0x7DC0, ## __VA_ARGS__)
-
-#define XE_MTL_P_IDS(MACRO__, ...) \
-        MACRO__(0x7D45, ## __VA_ARGS__), \
-        MACRO__(0x7D47, ## __VA_ARGS__), \
-        MACRO__(0x7D50, ## __VA_ARGS__), \
-        MACRO__(0x7D55, ## __VA_ARGS__), \
-        MACRO__(0x7DC5, ## __VA_ARGS__), \
-        MACRO__(0x7DD0, ## __VA_ARGS__), \
-        MACRO__(0x7DD5, ## __VA_ARGS__)
-
-#define XE_MTL_S_IDS(MACRO__, ...) \
-        MACRO__(0x7D60, ## __VA_ARGS__), \
-        MACRO__(0x7DE0, ## __VA_ARGS__)
-
-#define XE_ARL_IDS(MACRO__, ...) \
-        MACRO__(0x7D66, ## __VA_ARGS__), \
-        MACRO__(0x7D76, ## __VA_ARGS__)
+#define XE_MTL_M_IDS(MACRO__, ...)		\
+	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D43, ## __VA_ARGS__),	\
+	MACRO__(0x7DC0, ## __VA_ARGS__)
+
+#define XE_MTL_P_IDS(MACRO__, ...)		\
+	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D47, ## __VA_ARGS__),	\
+	MACRO__(0x7D50, ## __VA_ARGS__),	\
+	MACRO__(0x7D55, ## __VA_ARGS__),	\
+	MACRO__(0x7DC5, ## __VA_ARGS__),	\
+	MACRO__(0x7DD0, ## __VA_ARGS__),	\
+	MACRO__(0x7DD5, ## __VA_ARGS__)
+
+#define XE_MTL_S_IDS(MACRO__, ...)		\
+	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7DE0, ## __VA_ARGS__)
+
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D66, ## __VA_ARGS__),	\
+	MACRO__(0x7D76, ## __VA_ARGS__)
 
 #define XE_MTL_IDS(MACRO__, ...)		\
-        XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__), \
-        XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__), \
-        XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__), \
-        XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
+	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_MTL_P_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
+	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
 
 #endif
-- 
2.40.1

