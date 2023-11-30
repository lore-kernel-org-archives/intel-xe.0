Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93176C07CA9
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 11:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5973810E15C;
	Thu, 30 Nov 2023 11:14:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B263A10E15C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 11:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701342877; x=1732878877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lvjSXJuPHDrQGgHLBcEYboWtGXFoJhlkQ1xFC38MSSo=;
 b=dCOlBMV6PflQZHb2ryZZ2UaBOw7Gjfi/LTrvlEbhOvjjU4exPIwtEvuW
 4A4XTS3NmQlrVkPIkCLuPiETnmBLSGtFMaSA0INrgJPqhfZJq8a00Cf5H
 nXboMyQ9JlM4B22oukONhmxSjJs3V6WpOJmZ2K1t6bEMEgGIVlXCE3RSA
 T1F+vy5yCH93osSVoenyXScgO+wuYU02/oRY1iq32I6bngH8KXlwByUmG
 xthM20AOXVhhNPVSTastOKBhwq/LbjyzpNfr6P/AZYKQ+HlKPxApgJyZH
 3B0d+FawBaxrCBOWhkBo4vNL3KK+1jLDxMG6qMFwHqTmwerpvQz6mBMm0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396116050"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="396116050"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 03:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803662043"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="803662043"
Received: from pruiloba-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.25.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 03:14:34 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 11:14:24 +0000
Message-ID: <20231130111423.434744-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Add support for CPU caching
 mode
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add back the padding check. It was removed since we originally used the
other u16 for the coh_mode, but that was removed and never merged.

Testcase: igt@xe_create@create-invalid-mbz
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d59501ffc22a..7f012f4c2b2d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1840,7 +1840,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-- 
2.43.0

