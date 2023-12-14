Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E09C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD610E236;
	Thu, 14 Dec 2023 21:41:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6947610E261
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590010; x=1734126010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=avBlls0RjYADMZNugALZiTrgrwHH6jvB0rDBxAPIPuI=;
 b=iiV4Ucx9t31FV8AaWv1QXBvfrjluwtFH+rZ/DDzWH2pfjRWB3g/lslub
 8P/QqvPRB5Mv/083JL2jwYpWFcnnZVA4vjkfj1eGnVRUUsUQ7oDYUb2nU
 thCNlQC6WDCqmP67xR2qFIYpTChFL/u+tI0v2e2/TeoLVybDSJPwZiK0q
 p0+U/40S64UyysI9Og5ZCVYdAuiCQFoZSfKRArff08nOxBDs09q/4/6Xn
 BYwjiu1qUzw7Sqnovsbom/3wAEsipuaTQJcR7Oa9ynrpYmwTiT+/rsspk
 RWiDadmyvjCCvRnO7DF8H5FuXyv7MI8SgB66rN+fYSnMGkF7UXLTl9l6W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374696750"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="374696750"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844878438"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="844878438"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Return error if drm_buddy_init() fails
Date: Thu, 14 Dec 2023 13:39:52 -0800
Message-Id: <20231214213954.3223263-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix warning:
	../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c: In function ‘__xe_ttm_vram_mgr_init’:
	../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:340:13: error: variable ‘err’ set but not used [-Werror=unused-but-set-variable]
	  340 |         int err;
	      |             ^~~

Check for the error return and return it, like done by other drivers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 953e5dc0fd80..115ec745e502 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -348,6 +348,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 
 	ttm_resource_manager_init(man, &xe->ttm, size);
 	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
+	if (err)
+		return err;
 
 	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
 	ttm_resource_manager_set_used(&mgr->manager, true);
-- 
2.40.1

