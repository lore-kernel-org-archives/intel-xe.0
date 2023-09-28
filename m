Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6CFE732D8
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 14:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371210E010;
	Thu, 28 Sep 2023 14:08:33 +0000 (UTC)
X-Greylist: delayed 716 seconds by postgrey-1.36 at gabe;
 Thu, 28 Sep 2023 14:08:30 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D488710E010
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 14:08:30 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695909386; bh=SotaQMuYiD5+rymAe1DYN9IVUHX79u4zkVWlZfbjwrA=;
 h=From:To:Cc:Subject:Date:From;
 b=RZXsvuYNbWoSf8T3cKw/KwAMH3NirI4zz39uaArdQdD/FXxhSRfYZC8rP0ZHvLfGD
 ysruQA6k3pPHn2j5IB1Jyjd/r5kRMI16Av8AAs4ebTm4nvqEHsL30ioxSNdUqQAenQ
 oiOeofm4ubQTNyIUe4ERZyV8eHA2env7EDWWGYBIw9QuI9ODy9tbAdzx3JWVSzNw1G
 GDOULPFksael9Jk2I9M8bPuEozxi6tp/MR7q1SxFqEs2UEuIY3IBGq3yWuWdXouoiO
 mwGef9bLbUWyGLPbNA6psdyPqV+B5tZj5ZaElUaudZFBWEbjs2YidcwFn38NplNtHi
 yii6SbjLis8vw==
Received: from osharabi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 38SDuNfX308285
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 16:56:24 +0300
Received: (from osharabi@localhost)
 by osharabi-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 38SDuNGb308284;
 Thu, 28 Sep 2023 16:56:23 +0300
From: Ohad Sharabi <osharabi@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 16:56:21 +0300
Message-Id: <20230928135621.308271-1-osharabi@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: do not register to PM if GuC is disabled
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When working without GuC (i.e. working with execlists), the flow
attempts to perform suspend operation which is failing due to a
lack of support without GuC.

If PM ops are not supported without GuC we may as well avoid PM
registration rather than returning errors from various PM flows.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ----
 drivers/gpu/drm/xe/xe_pm.c | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1..68cd9a7ee087 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -641,10 +641,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 {
 	int err;
 
-	/* For now suspend/resume is only allowed with GuC */
-	if (!xe_device_uc_enabled(gt_to_xe(gt)))
-		return -ENODEV;
-
 	xe_gt_sanitize(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ad3c08c4ff22..e31a91cf311c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -167,6 +167,10 @@ void xe_pm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	/* For now suspend/resume is only allowed with GuC */
+	if (!xe_device_uc_enabled(xe))
+		return;
+
 	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
 
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
-- 
2.34.1

