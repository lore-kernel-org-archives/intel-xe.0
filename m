Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28907C47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61910E00B;
	Tue, 30 Jan 2024 17:12:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB01132D7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706634746; x=1738170746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jqv4OaHU4tXNk/8QjmIXKCcG2h0JYUzqFhHEkbv0ZQM=;
 b=FXCSQQo4hE35af+u28GOgldKlOQXky7xlUshSLzqmOs7UX1qqdoSgJPq
 Aw4kMcJBk3MH6yIXs32D+QhGmq3nGtezuf2RNp+aCyQN+ITEvL7nJYXfg
 TzdgWymcDuqdCJ2zqFUuv4GjN5EarnzilibSPh5QD1+uqodpQxWN9X6Y6
 lUkXhaanux44erkw+jAyE6gaJkqd5sOEsGHukgBKOzAjWw626vNOWXWbE
 ICUMs/oM1RcVc3OSuTxJcqGgpGmfneEoNNheRo7ElDTKe13vM12b9VS7Z
 PAOgn1Znl4wgV90FUWnD1IKa82NeJb+AI+lYk+P3338IE4Juca0gL4OwL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="9989516"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="9989516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3758143"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:05:01 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/query: zero the engine info
Date: Tue, 30 Jan 2024 16:51:22 +0100
Message-ID: <20240130155122.12138-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use kzalloc like other routines for better consistency.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c..02a4e2c083e4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -198,7 +198,7 @@ static int query_engines(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	engines = kmalloc(size, GFP_KERNEL);
+	engines = kzalloc(size, GFP_KERNEL);
 	if (!engines)
 		return -ENOMEM;
 
@@ -212,14 +212,10 @@ static int query_engines(struct xe_device *xe,
 			engines->engines[i].instance.engine_instance =
 				hwe->logical_instance;
 			engines->engines[i].instance.gt_id = gt->info.id;
-			engines->engines[i].instance.pad = 0;
-			memset(engines->engines[i].reserved, 0,
-			       sizeof(engines->engines[i].reserved));
 
 			i++;
 		}
 
-	engines->pad = 0;
 	engines->num_engines = i;
 
 	if (copy_to_user(query_ptr, engines, size)) {
-- 
2.42.0

