Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E98C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 12:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3110E696;
	Fri, 12 May 2023 12:10:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29B510E696
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683893424; x=1715429424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7P4/6ieGuydfWCAAE4u1CJ41SVxNh4B8EDJw7AAgho=;
 b=XnQn3bHWVV3s62qi+vLdqkIwp6BHBjT0xi4Vil4QOuFgACw7+mk3DmGi
 BmnesvG5rgjw78ZxCXO9E/ciwLNbE1JUqVRO+gOUAFGTvs2QFh6uVNfT1
 lvPpBRZbVLtEXx+l4NDpJstDgPNAP/kB2BOv/sq6GqFqx+1G3qpUHmP5X
 YnIxz8bgE1cfiLG/Jm4s7BYtw2GXUgTnzywolqtKM0laRMPDIyFjcaTRh
 b5goNCcGE+VWwP5JXjC/jwhZExrzflgIMrgBfj3e3FY8Y5wIi1DflSoJr
 regjuY81i9MP4+TWgk82Ii3yEV679q49fZQl/LGaJ13NY8OlLpvw1/CW8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437108957"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="437108957"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 05:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="1030071257"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="1030071257"
Received: from kav-xto-001.ka.intel.com ([10.62.231.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 05:10:22 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 14:10:04 +0200
Message-Id: <20230512121004.4145523-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove unused define
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
index 0377e5e4e35f..d45b71426cc8 100644
--- a/drivers/gpu/drm/xe/xe_drv.h
+++ b/drivers/gpu/drm/xe/xe_drv.h
@@ -11,7 +11,6 @@
 #define DRIVER_NAME		"xe"
 #define DRIVER_DESC		"Intel Xe Graphics"
 #define DRIVER_DATE		"20201103"
-#define DRIVER_TIMESTAMP	1604406085
 
 /* Interface history:
  *
-- 
2.25.1

