Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCE3C6FD18
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 08:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1296610F154;
	Fri, 31 Mar 2023 08:46:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87C10F136
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 08:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680252411; x=1711788411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/UxaSunqw9CsvstEIGwRp8TDQffAMF4kJSz7uNzVfg=;
 b=FYOHHvQH0SdsX/tUsykMrgX5zAwC2ZnaHotV58kWx/Ze4hd1CGN3WX6W
 8h/xPBkfwaXmvDhgifMaifuiG2a1cXt0f/K72rVtlZ3X1hLwB8C2UgOeC
 DH4ojgydNx6g0Fvr+XuoseKBICkkP3Br1fCSqAGYNnH4W9sSPwncA10QD
 +zfk8cZZI7z0vOEV/foKf1vEdz0roDHB1ZC4cNYA6rmEHOlcFBLVsjdtL
 bwZrDt33yGC1fvJPWvNsF5xwBZs2JYCv+b8+tzbpQWVet88OqYPRq2JdW
 KcxTR5c2eChGPNFZrMbTDIoDLRNjkJrxn/nghrVFF7Y7uigRUEkuBdRFb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325364339"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325364339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678544905"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="678544905"
Received: from kuhnbrex-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.81])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 09:46:24 +0100
Message-Id: <20230331084628.421814-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331084628.421814-1-matthew.auld@intel.com>
References: <20230331084628.421814-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/5] drm/xe/uapi: restrict system wide
 accounting
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Effie Yu <effie.yu@intel.com>,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Since this is considered an info leak (system wide accounting), rather
hide behind perfmon_capable().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dd64ff0d2a57..c134450dd0b0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -128,7 +128,10 @@ static int query_memory_usage(struct xe_device *xe,
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].max_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
-	usage->regions[0].used = ttm_resource_manager_usage(man);
+	if (perfmon_capable())
+		usage->regions[0].used = ttm_resource_manager_usage(man);
+	else
+		usage->regions[0].used = usage->regions[0].total_size;
 	usage->num_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
@@ -145,8 +148,16 @@ static int query_memory_usage(struct xe_device *xe,
 				SZ_1G;
 			usage->regions[usage->num_regions].total_size =
 				man->size;
-			usage->regions[usage->num_regions++].used =
-				ttm_resource_manager_usage(man);
+
+			if (perfmon_capable()) {
+				usage->regions[usage->num_regions].used =
+					ttm_resource_manager_usage(man);
+			} else {
+				usage->regions[usage->num_regions].used =
+					man->size;
+			}
+
+			usage->num_regions++;
 		}
 	}
 
-- 
2.39.2

