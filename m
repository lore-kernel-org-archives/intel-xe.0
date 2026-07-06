Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4257EC43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 02:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D828D10E716;
	Mon,  6 Jul 2026 02:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rft/dluV";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4D310E713
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 02:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9AFmp/Mhh/ReqYTHaz/Loj48oDChxgVDdOKQexven4gWZ9BwCUXwdO9fKrQ1s5WbGu3gUmLNk9nfQeK8NA7XMYgsXcePgz8uBSYWv5xfyVBA5rItJNQjtRGeOd+qrgDaY3gHH9C3lxvn+rEVrxO536rpgcLuXRGnIlHNAGKGz2Nm0ZrMAS6e00MxKpYde1QwE+zzYs1DI2Y8QH4r4oinFLeqgrkHO64VQRD2C2mDXzUoHwwXmCNhtJ1lWCqMv3S1yvqkzkf4U4yIzeZ8rL59I4cVsE0JThWynCjTuVN8HoBts91BUWIeP3/i7Lc6sZYaiqSdPLzATknllaI/2H4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsxQLgRMH6IW7B2u9jyhxICkSleEw85FXdhirVPGhhM=;
 b=on1JaMkOrVKj/bQ45L605VrqeH+Oy00PhwprC3VNHFUmPX63OzQYNSFI3Zg8FGvpdUDfw0dyEUBC2knGeoMsK/h/DsRrnSZgiJDdC+BV2Z2cTYCiIrzeiy5UUZGrd+SaPtMfeIvVPWz3hvrqZvRoyi7Gya6jMBXFd7Zz3ubc6GZ9i3DbzCO3FiM16iRUNt6sl1U3nM3WSja3ZoV6YBR9J9Aa4by44d8UT42PqLu1duOlPNYSkgJTgROYETcgVEC1nzA7j+kTQG96LP3ooyK2p2rmPiAQPKsGnoUt2ekVEZ4Y68/kl8NDygjdINP8alPMAcA1q04UUYB5M0AnJ89vqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsxQLgRMH6IW7B2u9jyhxICkSleEw85FXdhirVPGhhM=;
 b=Rft/dluVg1vrozShOCkatmDrnoV5QXVZXYXgkRTZx03JQ0/bNZYGmTZAljJjaPlDw08GnSSr/mbvp1XPPCz8AIdAZ/qRvf0dxE39mIR7xYr6BI+4V3Hkh59Fgtxjanxhap/CjxMtRcG67F355ZCQzffM/V9cBFVle4thSyYehJI=
Received: from CH0PR03CA0355.namprd03.prod.outlook.com (2603:10b6:610:11a::12)
 by PHXPR12MB999232.namprd12.prod.outlook.com (2603:10b6:510:3cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:46:58 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::4d) by CH0PR03CA0355.outlook.office365.com
 (2603:10b6:610:11a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 02:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 02:46:57 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 5 Jul
 2026 21:46:56 -0500
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v4 1/3] drm/gpusvm: free the whole IOVA reservation on unmap
Date: Mon, 6 Jul 2026 10:46:40 +0800
Message-ID: <20260706024642.614238-2-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706024642.614238-1-honghuan@amd.com>
References: <20260706024642.614238-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|PHXPR12MB999232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6aeca2-0803-428c-b2e9-08dedb08d8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: IP8jDHAzjrBPWgDhLk+p19d0W49aor2kDC2X2N8TFv8arGomRArrPt8iwqQ014zA1722RLLORlqxUTT9CRwtZWwONPUQ2D48/ooGFT4MpEroUOLfGA5y5nwfZcVeCf5Y3Y7H5sMoVlxmku59YOSQDROiGWuzeMVdqIX1voi5NR3dk75fYLo3ycMbU4TgL2egGJKBrUyBi51uiKYAki90CngBZF3FfJT3DIlNX1kksaOFf4GBIo9PL+Gw6cPhV+2DX2bw0VylQuZZK4Ptmi1gpQ0oYeiBhumwcm3mfn5sXcJyKWqyYD4t6GD5PlW9vLr0Ydvvg+58xBHGMbP3Qk7v7qGUmS3CoTNP740Ip05xPGOtABkvm4H2/argeyaneo24zJdmZxE4iPTHsAN+WHcUdlnyYfAQe9YImu9GjCSjqPKQscBoBx8Gq/QJve7vr7az9TsNg8AB86V6gWdTzJMp8Tk0lwHibT/TW89t9h181g6RD2Eh1s13hy9IqGW0RqX14ihnyFFR3idIizDH3Y1fbIt4wuOIoZJwO3q3qp2HEHLgZbEaU3u4oqpdUrgtvQ/c+zuhlScjfHIE5AU5R/eMT35KkUHHu1IWMZ71XcEQ45CpwVxzT9ynSFh9/3mF1//YMXpG6eKfYYdHoAKKOY0bkB6nzwYNKwJglnbvY+oZ6KZlKdpJZU8REoNc38eouWdSD5hjOEqrgLOgbPfjQEMFrw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9IKu2KgAJE5QotTKYLvCbLUGbvVfARoUL+zd3oro8cbl8k38oc/PuI2DtGNCHSn0MU8g638Csbx5RVKYwOJ2fwHMcK/4MM+oBYosC5UbMBnBUB3khUuQrf2dJy6nzupWYIHKdDNlRlxdJ02GDWcns5U7hStXOX7FOUwPL+D0LdmXLDhy3h43U3zIHgZGk2HzOwDmSw7JgF42g056/oVNa+2ZBPp5Jo+Rf2lZAU9yZHdpPWMoKZhVOe2xpY7ED2+ius1se1B9RFExTOM5KIu93IBf2MVv8+Qwo1l/DPTnDxfvuqf+ZAAeryTod2HJPzuaP0O/NWOeKQfKwX7Qb8A6FCtd9JtxMmnk+bSv9DGDJa9rX6fYuyPy1VtjkD6E9kxkdqlkhNosG8nHVMp9uzHoCzMdvpF9dbiIisu2nwigCJBFgnL/qYhhl/k2EQVWhwJD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:46:57.7261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6aeca2-0803-428c-b2e9-08dedb08d8df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999232
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

dma_iova_try_alloc() reserves IOVA for the entire range, but in a mixed
range only the system pages are linked (their total size is state_offset)
while device pages never touch the IOVA state. dma_iova_destroy() with
state_offset only frees the linked part, permanently leaking the IOVA
reserved for the device pages and eventually exhausting the IOVA space.

Unlink the linked system-page portion and free the whole reserved IOVA
instead. On the get_pages() error path state_offset is 0 (no page linked,
dma_addr[0] unpopulated), so skip the unlink and just free the reservation;
this also avoids reading the uninitialized dma_addr[0].dir there.

Allocate the dma_addr array with the zeroing kvzalloc_objs() so every entry
has a well-defined value.

This issue was found by Sashiko AI review.

Fixes: 37ad039fb367 ("drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM")
Cc: stable@vger.kernel.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aed..3145d55cd86 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1146,10 +1146,19 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		};
 		bool use_iova = dma_use_iova(&svm_pages->state);
 
-		if (use_iova)
-			dma_iova_destroy(dev, &svm_pages->state,
-					 svm_pages->state_offset,
-					 svm_pages->dma_addr[0].dir, 0);
+		/*
+		 * IOVA is reserved for the whole range but only the linked
+		 * system pages (state_offset bytes) need unlinking; free the
+		 * entire reservation to avoid leaking the device-page part.
+		 * On the error path state_offset is 0, so just free it.
+		 */
+		if (use_iova) {
+			if (svm_pages->state_offset)
+				dma_iova_unlink(dev, &svm_pages->state, 0,
+						svm_pages->state_offset,
+						svm_pages->dma_addr[0].dir, 0);
+			dma_iova_free(dev, &svm_pages->state);
+		}
 
 		for (i = 0, j = 0; i < npages; j++) {
 			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
@@ -1486,7 +1495,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		/* Unlock and restart mapping to allocate memory. */
 		drm_gpusvm_notifier_unlock(gpusvm);
 		svm_pages->dma_addr =
-			kvmalloc_objs(*svm_pages->dma_addr, npages);
+			kvzalloc_objs(*svm_pages->dma_addr, npages);
 		if (!svm_pages->dma_addr) {
 			err = -ENOMEM;
 			goto err_free;
-- 
2.34.1

