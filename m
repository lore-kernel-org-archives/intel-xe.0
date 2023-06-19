Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FF4EB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD810E1FA;
	Mon, 19 Jun 2023 11:00:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EC010E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687172443; x=1718708443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Z+46MBP4mWQcRuXgJCQOGQO+Hy7l1U2UYGFLpvpWyo=;
 b=IWObvwqiiil9bZd9OHXLsCsC3vVlk5RW0i5K7rNOzeB36i7JA8pA4Qg4
 IVM76VgbF7JG8HayFkpOq8wZQvScspYvR9Z1OjMUktJ6V+Bu+Guv4ZzVB
 T7OSWk+DqgcYThf2aJyJo86+n/mzecdGikXfOfkdphwjt/wvdPWPbEBkJ
 qZLUT2w5/wU8LSi5HROy7kARMGsHXNsv95Nv/BryUmXrn2SE3gC9fWyKY
 IPA2YTqXUHQhXH38MffYbZF7oNsdRA/na+gZ0G4MX1AamXczXYV8jRVwB
 Dswak3Cfc5jeYO+mzGr3RU/MObzNA0eUxFHez3OyGthJ7KaN6obl93AFx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941726"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="339941726"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803579293"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="803579293"
Received: from lsuareza-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.111])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:00:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 12:00:21 +0100
Message-ID: <20230619110018.53538-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619110018.53538-8-matthew.auld@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 2/6] drm/xe/uapi: restrict system wide
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

v2:
  - Without perfmon_capable() it likely makes more sense to report as zero,
    instead of reporting as used == total size. This should give similar
    behaviour as i915 which rather tracks free instead of used.

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
 drivers/gpu/drm/xe/xe_query.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c4165fa3428e..15e171ca7e62 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -128,7 +128,8 @@ static int query_memory_usage(struct xe_device *xe,
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].max_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
-	usage->regions[0].used = ttm_resource_manager_usage(man);
+	if (perfmon_capable())
+		usage->regions[0].used = ttm_resource_manager_usage(man);
 	usage->num_regions = 1;
 
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
@@ -145,8 +146,13 @@ static int query_memory_usage(struct xe_device *xe,
 				SZ_1G;
 			usage->regions[usage->num_regions].total_size =
 				man->size;
-			usage->regions[usage->num_regions++].used =
-				ttm_resource_manager_usage(man);
+
+			if (perfmon_capable()) {
+				usage->regions[usage->num_regions].used =
+					ttm_resource_manager_usage(man);
+			}
+
+			usage->num_regions++;
 		}
 	}
 
-- 
2.41.0

