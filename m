Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB6EC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 07:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E9D10E10F;
	Thu, 13 Apr 2023 07:27:04 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A893910E10F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681370822; x=1712906822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6GTl5gWr2Bz03pOGjpMU5nGAn992EsC/UlXz36/GMUA=;
 b=blIN7W2NBW7qM5OhsdkeyyI4hkoOTodui6eaWQT+4sF/ncm5h0lh4s1J
 CQg0nfYTFxnw5Y2LL91kNuldvU/9/I5XW57TJoxrYdtquxa6mSL6Qhf1s
 ICwGN54XyaaT2aOkF8JhlmxaAxYlvTH1Crms5/ah5gGCu1M354b/LgKN4
 eMMxPit1tXmsX6QnpE1aT6TjaEUDAvwEG5jeNVbWrgxtPPXdjrf8CUlnR
 0zhTQ9fUsamrZULA7YP0z1AwAxFiI7NVEvDSgn60e9FrBOQqbx4EG3sTc
 gzja1/RUb+1mSxPBl4C7usfKQtC9VmXKDW98XAVGDM/frtymyikDu6s1P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346790996"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346790996"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935475506"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="935475506"
Received: from rtauro-desk.iind.intel.com ([10.190.239.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:26:58 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Apr 2023 12:55:54 +0530
Message-Id: <20230413072554.4183876-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Enable d3cold support for dgfx
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

allow d3cold for dgfx as xe_bo_restore_kernel
bug is fixed.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b92d8b5a391e..79cc0b8f197a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -750,13 +750,8 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	/*
-	 * FIXME: d3cold should be allowed (true) if
-	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
-	 * however the change to the buddy allocator broke the
-	 * xe_bo_restore_kernel when the pci device is disabled
-	 */
-	 xe->d3cold_allowed = false;
+	if (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
+		xe->d3cold_allowed = true;
 
 	return 0;
 }
-- 
2.40.0

