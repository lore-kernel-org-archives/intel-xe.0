Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665EEC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082710E6C7;
	Wed, 25 Oct 2023 17:58:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E00510E6C7
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256685; x=1729792685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZJRfyfqsBm1vuUuUEcOIMATDq4i5TYpMk57El/MiR4=;
 b=AnWHq4oeE3pMi0UyXuXS2nYyGdR/n+Fhu2mlACwyR/xbI93EJrU7UQtt
 2/weTZHPltptwtAp/4e+KB3krZnIkqZYGJkATDbnmhscB4T133UPAA4gJ
 KLFGd/QlZz6Yew0yfAEGzAYi6A4EbYVknhIq3cea78dR4Nkh7U9qAClER
 DdJ3U63IBDWTZlA0F2AhiMQ4S35krqkR4lysqb4Pk7aLsc0k+g816ZlPR
 k0YiwwAnOf2cVsIMtfNMivIaYS8GzAsxdIYP4GF40LvJkDao2lK+Z9cN/
 9I7DRq/cZpIx9Y/fc7LhvnoeBcETagpVO2ewTPwIxOU18IkXlHXxpkZ17 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386249960"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="386249960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6642416"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:56:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 10:57:43 -0700
Message-ID: <20231025175745.1906310-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
References: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/5] drm/xe/huc: HuC is not supported on GTs
 that don't have video engines
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

On MTL-style multi-gt platforms, the HuC is only available on the media
GT, so we need to consider it as not supported on the render GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 293403d16f25..386efa180c1c 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -35,10 +35,19 @@ huc_to_guc(struct xe_huc *huc)
 
 int xe_huc_init(struct xe_huc *huc)
 {
-	struct xe_device *xe = huc_to_xe(huc);
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
+
+	/* On platforms with a media GT the HuC is only available there */
+	if (tile->media_gt && (gt != tile->media_gt)) {
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
+		return 0;
+	}
+
 	ret = xe_uc_fw_init(&huc->fw);
 	if (ret)
 		goto out;
-- 
2.41.0

