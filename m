Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC1C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 05:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D00113911;
	Wed, 31 Jan 2024 05:32:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F16113911
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 05:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706679127; x=1738215127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L/ZPVaHyPsTT1uvqAjfGrZPpUHX1Xwx349LCvkmKkrk=;
 b=EhLqcc1Ft3dnCUE6kcEsXax/05XQ1fLYnwvwgOvBE6w25oYS5uwprIZz
 LgIIlvJ8ktQRL/ATEtkJZD3RiK++XuQQqH8VHyRVuaixG8/xQSpX48SE4
 ebEhzNYg+fOAFB9HAsMng9NtdJHWi5uCc3udqkxqyLingRQNhKCrdC0To
 vPo2mJDDpxMSkb+W9UTXE0wyuAoLBxMyeBGpFWQtJppTEHdNhPxAmDk10
 q7vv72ctI4/LCSa0tXy27yDy5x/JtfgedfiO8MXnTPWbrVBPkbG50WXU8
 yrFKffq+HAFfIAiYuW/Ln/n2H6tGLyKsVI4CjmvhVD92MfcFlA/pEbtQ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10592434"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10592434"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119505770"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="1119505770"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:32:03 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/query: Use kzalloc for drm_xe_query_engines
Date: Wed, 31 Jan 2024 06:18:38 +0100
Message-ID: <20240131051838.24705-1-nirmoy.das@intel.com>
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

v2: Improve the subject(Matt)

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

