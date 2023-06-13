Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACB3C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 09:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4F989316;
	Tue, 13 Jun 2023 09:39:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26C389316
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686649169; x=1718185169;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PJnJlAFmih52fdl2GHlaC/MYJLJ3MVwviDl5zeLhu0s=;
 b=iGXrrZ+TJ9Kj6a2Nc9tAtY3RYnXdzusI7NYGyCbenN5Bpp8k+ZLY4E3f
 PmhchHhMoRv1+30j+JVWvrCOozTiHJJveN82Fhvl2FMsKQqhbeKssf5qZ
 Hx1d6+VeXocNa3t3xypdob1wkL3mUJeplkXCJO/ySqLF6uUiL1BeYdbNW
 G+NzFH/A4ce8ReD+kcLLj4CmEC+W7ir4MDAK+qYo1gD+QNQ6d4J1Q1IrS
 FFIT/Kmk2mBQxJb62BkuCrTXV7Y4fNXU2zBHNioHLnvPJ+dE6632UTMux
 nSh9W8g39swfJ4+pLm1Lv+88lFwWp0zw/gtA0om4POQ5/Hqez3uWGLLv2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361651042"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="361651042"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 02:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741363417"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="741363417"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 02:39:27 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 15:12:32 +0530
Message-Id: <20230613094232.3703549-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe : Fix GT looping for standalone media
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently the id of primary gt is set using gt_count and not
the media gt.

set gt->info.id of media gt using gt_count

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bd1f59b49928..2991cf5365d5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -590,7 +590,7 @@ static int xe_info_init(struct xe_device *xe,
 		 * up with platforms that support both together.
 		 */
 		drm_WARN_ON(&xe->drm, id != 0);
-		gt->info.id = 1;
+		gt->info.id = xe->info.gt_count++;
 	}
 
 	return 0;
-- 
2.40.0

