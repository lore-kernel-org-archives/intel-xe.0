Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB19C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8EA10EAA7;
	Thu, 23 Mar 2023 12:00:08 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056F10EA78
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679572803; x=1711108803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMCcggp1iHug3aeRC8tBjkSTUIsBwksm/J6QSx9DaEw=;
 b=d6X2bH1NfE1/NvdTicAqO7pwgK3bfr8DBvsJ5V+VE9XOn/MlCBPuJ/P9
 PRr+YP0HqYa8qMp9ARoKrxfYOXf/nt7DXcOdmb5gSUK9qpLcc9uzV9PTy
 U42qn2pblzC6Pp7+3sUSmYZQvn4kpbBmwGTVvaHBSzB7e0aGKXvHB6GF2
 0h9IxqOolMY5m0kcvS4EZ1uHxg20chFca/QnLEpJVPeGPrxtwc8LUNLdT
 7qR/sjFoNsgG7JarrF4dit54BssyfNL/n8aPqFlddDNMm3t695h06Xeaf
 pt7fdmgpT7kLnIrGViOwgNKRU2j14pzm3/fXsA6b3tni5pu2iHlHP6j6O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404352513"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404352513"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751463373"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="751463373"
Received: from ehallina-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.208])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:00:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 11:59:23 +0000
Message-Id: <20230323115926.391900-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323115926.391900-1-matthew.auld@intel.com>
References: <20230323115926.391900-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/6] drm/xe/query: restrict system wide
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
---
 drivers/gpu/drm/xe/xe_query.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0f70945176f6..9ff806cafcdd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -127,7 +127,10 @@ static int query_memory_usage(struct xe_device *xe,
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
@@ -144,8 +147,16 @@ static int query_memory_usage(struct xe_device *xe,
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

