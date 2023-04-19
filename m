Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD9C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 08:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F52410E15B;
	Wed, 19 Apr 2023 08:21:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759E10E15B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681892487; x=1713428487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77Z/H/Y4o6ExyCHOVLGo2+BloSuxhkIwc44znQFHzgA=;
 b=LrLc+7Jn8mHjUljdXsUgnm0YyBKXezCzG2XinQ+C8qjDk8R5rX4UdbQn
 m2aQvZ7fq5Cshd8BUzP/lo9TqywTJkZm7Jh5IPOMA/PBlohSzfdTHN09m
 Z2lwr7uEGTjXqx0Cb4WLbchKURZosvLY0c1bRHggssugv3Dt1SB8YVx/r
 02+egSTYIlA3ygwyOvdYy5aDuVTI2KEvRuDmFympym/uh+nT6aH72QCqJ
 iKiepl9GO6ibpUjJC8fxBvr+zRDIhQDytFRx2/LcTya+1S1OME+03qeUs
 Og2Sh7rRN4UJG8Ub+lCUc96eCe124rS6E+Btv2jz+Vx7v22xrQCOruP4k A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342872694"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="342872694"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 01:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="1021108058"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="1021108058"
Received: from sggopala-mobl.amr.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.123.102])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 01:21:25 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 13:51:13 +0530
Message-Id: <20230419082113.8758-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Select graphics/media descriptors
 from GMD_ID
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fixed a typo in the error print.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c92faffc838c..19ead642442e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -474,7 +474,7 @@ static void handle_gmdid(struct xe_device *xe,
 		}
 
 		if (!xe->info.media_verx100) {
-			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
+			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
 				ver / 100, ver % 100);
 		}
 	}
-- 
2.34.1

