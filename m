Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E66CC61D85
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 19:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F3B10E4F7;
	Tue, 21 Nov 2023 19:52:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047A10E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 19:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700596361; x=1732132361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z/elOgtErjI7R3tTfJnC7m1giaB9YkUu44iHRKniOuU=;
 b=gepGn+D/W2GqZudLbk3S0Fawi5a+lve3XFuAK36/KJZvrfTNGEn17KPe
 qS9McLM8hMRyOJ6YsaJ86xiU18aJ8Ielq6fnkyTj9Keq0frcJwM/IRa6N
 GfuJtRiz5XASjp9ojW9ljuGVjiTDaQU8j89s+Zx97fZWXM/LB7hZWm9KM
 CtPbdJasbL6cn1r5FN5+DBSFJZhPMOMIVH3EZzqRfV5l8k6zcr8NgRJ0L
 u8LnpVSnv8JETkmcq5Q931JelGZILjtxZLo3Lqp7ec/lACDPaeWnp7UOM
 ngQmkESHjT0dC3yatwx83IdNSFx6BsSQODuDKV3P1M2XyVH4z4y76FIDP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372089869"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="372089869"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 11:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766760207"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="766760207"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 11:52:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:52:08 -0800
Message-Id: <20231121195209.802235-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Remove XE_PVC_XT_IDS
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

No need for the indirection, just use XE_PVC_IDS.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/xe_pciids.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 91b4b570bfbf..c7d73d6476c8 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -174,7 +174,7 @@
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
 /* PVC */
-#define XE_PVC_XT_IDS(MACRO__, ...)		\
+#define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
@@ -188,9 +188,6 @@
 	MACRO__(0x0BE1, ## __VA_ARGS__),	\
 	MACRO__(0x0BE5, ## __VA_ARGS__)
 
-#define XE_PVC_IDS(MACRO__, ...)		\
-	XE_PVC_XT_IDS(MACRO__, ## __VA_ARGS__)
-
 /* MTL */
 #define XE_MTL_M_IDS(MACRO__, ...)		\
 	MACRO__(0x7D40, ## __VA_ARGS__),	\
-- 
2.40.1

