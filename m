Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FFCC04A94
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 23:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E499D10E13E;
	Fri,  4 Aug 2023 23:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3C89F63
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691191042; x=1722727042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTNEOLL4Y2neUduS/LP5+LKsehNUb9rRNE8k7htdcTU=;
 b=XN1wAj0jCxiQzgGN+8qmz5m9+HlDrMSJ0e2BRjQGs/aE4DJSs39yOI3W
 T+Y0UE278WXamI4uZhs/FER61JWFxBs2yrBYxWeeJeNXnJJp7ZqBW1xz3
 1qAhzUuVm1WbPS0vVDWeUkNSvU43h1hn7/VhP3IIKT1Iv/oKvCkv4cF3a
 RimYpiPK31FxYUueA0GrfW/kN8BWZe+oXkcEP8jMbCgeI0tl9W4L9e9VZ
 KX1TyP206s+rnkf+9NLDKVyO7KNLRS4h6fljynwtfH2LByug6DW9JiIm3
 mOaqxWIrQuD2iETTWOHfPoeUh2plS2ROib8nTMUgQpVNlKex01opZ1Fme Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401225998"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="401225998"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="853983491"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="853983491"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 16:17:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 16:17:09 -0700
Message-Id: <20230804231709.1065087-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230804231709.1065087-1-lucas.demarchi@intel.com>
References: <20230804231709.1065087-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Update ARL-S DevIDs to the latest
 BSpec
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

BSpec changed with regard the DevIDs for ARL-S. Update the define
accordingly.

Bspec: 55420
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm/xe_pciids.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 1263838617d3..43afd973e153 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -199,8 +199,7 @@
 	MACRO__(0x7DE0, ## __VA_ARGS__)
 
 #define XE_ARL_IDS(MACRO__, ...)		\
-	MACRO__(0x7D66, ## __VA_ARGS__),	\
-	MACRO__(0x7D76, ## __VA_ARGS__)
+	MACRO__(0x7D67, ## __VA_ARGS__)
 
 #define XE_MTL_IDS(MACRO__, ...)		\
 	XE_MTL_M_IDS(MACRO__, ## __VA_ARGS__),	\
-- 
2.40.1

