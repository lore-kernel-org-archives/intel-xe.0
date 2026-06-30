Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D507C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C7A10E159;
	Tue, 30 Jun 2026 03:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b38X9x+S";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69E10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1j+huBGlF/lEOHLutf4JzJDFJO2cPk9N8qpkjRadHHznadisf1YkMOoRNPlF9O8p8daJua4k4rwA0pZppIyA2UI0WDrZ6RStQX1UuJAtEhzzwah/0jl5lrAUIMxjvYU3NdV0/QXcRqk/68KK4uRCKvdCO8JmVh72CvNO4jZ5YOjRdDGfPYNa8Kpv5uxRgH7hl3nTtbYu5xWW4wVyml+xeruPmJgCxLV6wijliezRZSTlgWfBZOC4+4d1FLnlw3YxB0OBffX9QwY1+kYh/2i7Iob4lviHgSIHPahSmFZnZ0f01HqXC/b6JeXkCgB3ddEYqRmcfeyGbFxoWdG5r+gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5mtmAOgKzNuW9XLfuX3zRDKjJrl645q+cjZC757bxc=;
 b=ilpaHrO5VHB+udoNCB2fdS37btvzAiheOmV3BUfnYddgG3ZAHQG9Tlf23+JVfNiCCHDA76mhcfuU3ZucJth4bGa2D1xAPuZsaSKqYBvfWbJFtX1TCwwSz1EFyJ4Oa6BOZABVH22eyLR/62ZlHTmLFx6U6a9dtJ8Pl8p6hLJR2XjqOYjHqYxhD/Yl9AMaTq6WkgdQNVpwJnN19qGkpmMwTfG0g7VjcfyWZI0GeoqkIKQFx3CO2ylAQ7JrCfmQreEWgpJqtJ0BfHU6XZBwK8wPUlse1AMnYrQ7Btb3MMw+LsA8NjR6OrUossW+93bH2YzsjOb0RzG9fOk5DZaEVugCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5mtmAOgKzNuW9XLfuX3zRDKjJrl645q+cjZC757bxc=;
 b=b38X9x+SfJRSuJv5RYeTNFKIK2uhIAZM0xXDs+VMM6psVbJZKuKecLFcfjgLhEwf+pYE0BswO7j0+4yjXqPKAu4h2aO8Arf4MPzdwU2fBRBg+kRdqWc7n703SBkgBjxPJU9EPKCgEOGoQZRICN+7Pjmopuw27Uzte8cxf/5iUyc=
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:40:37 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::1e) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:40:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:40:35 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:40:34 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v2 1/3] drm/gpusvm: free the whole IOVA reservation on unmap
Date: Tue, 30 Jun 2026 11:40:19 +0800
Message-ID: <20260630034021.362571-2-honghuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630034021.362571-1-honghuan@amd.com>
References: <20260630034021.362571-1-honghuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: a664459d-f498-4622-b4f3-08ded65958cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1flkXfnW0gqNDHbj5Vh7LB7avjWcS9RP6VC5hbs2X/Whx0qJqivwOZhoosaIzvAID2XlCEht2lw3n5L6UMge65Z4y56ijPy0JZwKmQY+1EyiK3opEuF3ENmsXzXrlfso3ZBh+KZNRm0fd+1GJEg2y4yG0h89uXdVQQPAAbw0OzxnGNmh7/9XbaVfISHT159lednepFZliR9gog3hWqWK5dRCsaV1voYY5wsFy7QXmfGnZ8vcgCxJu9++J+aJ0BC3RA6XtF/tcD9dk5ESj1eLrKCWvKIm2Bvo3wfMmjr1LKGqHzAP1DOf+venQXLZFngfcMUMV9dUIy+WKEwtqJ4ESFASo1CO1WI27PJx8dMP+AE0HPeSvauYcqErL941FaGJpUqsx+FDFDImbELAE7Z96wNowj3CbnxFiNZbfvm9VzKRZr0L06KQ40PvFo9lg6NkzsoGyeknYSUQfJYKVioz+cOH0sbfi78shNYmxbhA9hqBi1pfpt1+3NMYBYm6epVmOVwDIqXtII3PlkM8GTsP2Wd6yREGp2YYM89jeUaLop5cp5+ltSQJAFUCYV2IhUv5tyKPdoDJBhJxIDpCh1XnUp7caev7SAtI9X/h5wB4q/5/qSP4B4xck5nt8yz5bzhvc8EeJY6Mhaeu71LIN7FhlHbuZ62H6qCYtpzwLUPsuG23652cz6vUE+xMtt48RMy7FuWbBdbMG3cr/PCRP79vvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MzGfnjDdjesILoDzNOEh4rLcfb6/M4K18cEDdFnsI5pyRdLyUKTyAQDchm5TsG0rOv3l8giHYL4/RUUP+ciXohcqB2fPYjfteEYv1HFkgnxkFXLdcjS233rxHLnzBv9mBoerLeNfne2P0pDHrnLv4hqOe1s19aFcWaWb5hlzQiZ5BJ5eyXSm7eKaZSMQLOkdGKotaZK0PNdSTlXfDv/WalIHlWa6DgqIaC3I1NJx+7D2iUXXiVEhIm7ZgKyYscx3ruNhAl1uqTWOj1V/J5SY2WbIsXcwoNQHSj/cQGjvzOrpHN314dQLSdiBJ3ujBQXukQwr9b9AB+DmZ3fVBpOJAWd4AhL7DQYkmbIA2z2A7nZ7Hty36lH0bGCDpeHctMg/p7Ye2JeX53mseQIkuutxqjhibtQ6dgcrH4dtkdGIFNfcem1L6kLngeQ2Jsv6hr9P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:40:36.2537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a664459d-f498-4622-b4f3-08ded65958cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
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

Reported-by: Sashiko AI review
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

