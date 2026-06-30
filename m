Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D0DC43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CE810E166;
	Tue, 30 Jun 2026 03:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B9YF9143";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8910E166
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqK43RgzBmCKjC1YVvQ+4F9JWrk2hHkeAVkMW4u4uMmo85mBSGILcDITJUJzClXONk/nU9mWe7AZfb3MX1eP/FEnSP8cRXBJN5TsmAoFGBV0/w2nLzoA7hqcvmV9Iqxbv3R/6CI2gJe7pVxlLEvXIwN28UWb0njb7kQB+a2Sbo58PWcAy05FJXcDHtXX1yihr/ZEX4EQtS6QrFdjp9TKuUZejD0Mt043aee4DCt6YUx4MJxgBk3wSxIfwoA0iVF20kPJAGrP29z/8lc3ikQtevRjavb7tV4yUA4eBQaghF0LcNk79GApLc6oBtscG5OeXcrSdKfHtDIOgsAXZL2mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FI+qtIo6m3FPzn4uImwzA7YS7itv5X/xOipi/nbW4A=;
 b=Yxmd1uqCv/rlPyh7uZMj3Tolpl36BRM8GkAgIwynD6udj6CbBER8RuAyyOgeAIRItzrWdWIninIAqgZDtF1nt2FPGVKuDVAMPLSsMcC/yK7pn27kRgrHd861taJpslzlaQPLAIFkQ9Ndqf2v/jvZBCzUcDwoVsrQ/xPRgyFFkNAMDjir7iD2HmcoNTEJFQlavsgRhglmnxKMigdyF4kSs7dFMpvSYQlSpxtlYfpleXKN2qqnjEiPw+PWRYY5W3v8ULtKwsqXlnU0RY++K24XrVI7cW7X8xCVA1BKJQZXm9zT6LpYs6KNb1TtuwvIBcYsuaEuc8mn25LMcJxaCONGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FI+qtIo6m3FPzn4uImwzA7YS7itv5X/xOipi/nbW4A=;
 b=B9YF9143COztwyu4bH9GGQ+8iTG0UdhTAKbpk9F411kNP7WNt2LxHOQMUWx6vUaQwCLni1Z+xF1QR3dzIFhumtRhOa9bI2QioQnFqzdwwFuYT8pfcS27MfokuemQM9P1j7x7RQc7U+13yDYyYHR2ZL7eQWDy4Y+uZPdtzVjpTxg=
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:40:37 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::20) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:40:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:40:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:40:37 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:40:36 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v2 2/3] drm/gpusvm: do not route system pages to
 device_unmap() on IOVA unmap
Date: Tue, 30 Jun 2026 11:40:20 +0800
Message-ID: <20260630034021.362571-3-honghuan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 207a74b4-7157-43da-e274-08ded659599d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: efoMsl4VkovhUN1hdsm2QS1AraGn4kD1dovcKJYBr+kH0nIHv9gIMrU4zy/KpFnFpHojhb+mMg95D0LjIvMFK2yBTExeWD+FLVazkzI6J2QGKJyrjsdtyoFPHw2n6w1x4XciBY/UgPKZV14g4q9oN+CScQWbtJH6yvPa/MYV+Ko6HJ+tUdb8RPIiGeKRYumdJqNB+MskvcciqmqEW0h4rQccTgvglLtTW5zRowrov+SF+UVcFl0488Vzn+kuJr4NncMm+7l4nlWYBOtnccjJfnBwYQCiOerJI59Ebq9FFZZYsZUY0GZ3Wlal+N2u645mgBdDjlWx5s6jpP4sqjEZPgQ6Oiw/Zo8dYi89YnJGb0WlL92CviRBMk1dr1Z4jtGCfzgslIWOU1ig7HdXPy80UGg7w2AZ4xoW8rP6dsoruIFQEYDSttE2rY8g1TAKb7Hf1w8X2ouPLVA1VbqXr4fFDaPeGxBN1oIqm80tH8n53UzbrFDcEva5/0jmgQ3pi0SkqNuKvpxovybC9wuhOR9jV47Je3BpnBxC94J12qea4DN1J1vaILIrYLmM2Nwd/ct49bN4p4aU05gM54+3D5pjT26i2/CpDJmYR5JYis7NuLWLDECzQLJo9wWGgrBQr5U/hRDYp+ZHYi8Cg1xqMVKyS4oJ+vv+MfuOcfGU3snxdkJJ7g1C+3sqp6vvXN8gKjB0i2pKFhxnXPYoOAmfbF47ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UmM9GLbPGj/aXpV+7HwJHEDBxu+Ir2IhpAP2Kk2Lg8gyrUd4cYurBVELA3mtmSyWMIVPSiBf0KJpcg+n1gRyguQTpLMC3wJFOf3BiDud6RrmzFY0HJXzT+QZCeVpRnC7g3X7eLSJlgIpYxf5hz9Vph5tbQLafKkr4kHIaCRXk5H3ALQL8makT4/6Z/3lwbBFo8NNvj6dT9/vJrgsIilMpS5KMEelWDGbIvqc8sdmU705xBsHpSpptBl0jRPZby+2OCZ2T16tRYKwMrNhv4PirrUa1VRpSMvaR5BmTjTgUZ46BHxNsSsVpP/g2i728oIAjdh2vXmqyJyG+TOo0jTXnWzJt/TldJ6ncHddn7oZAXCcj/st1XFy/GEkXba2qBY5UT0k5vCoEQhJ/xTQW8dGOppKcq+iDXwrZDD1uP3NYJLan1mi+Jv7nBUfgE9mC50A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:40:37.5800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a74b4-7157-43da-e274-08ded659599d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
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

In a mixed range: ctx->allow_mixed dpagemap is not NULL while some entries
are system pages. The unmap loop used:

        dma_unmap_page(...);
    else if (dpagemap && dpagemap->ops->device_unmap)
        dpagemap->ops->device_unmap(...);

When use_iova is true the first condition is false for system pages, so they
fall through to device_unmap() and a system DMA address is handed to the
device specific unmap callback, risking invalid accesses or state corruption.

Key the branch off addr->proto instead: system pages only need an explicit
dma_unmap_page() in the non IOVA case, IOVA system pages are already torn
down by the single dma_iova_destroy(), and only genuine device pages
reach device_unmap().

Reported-by: Sashiko AI review
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 3145d55cd86..44bb19658dd 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1163,12 +1163,18 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 		for (i = 0, j = 0; i < npages; j++) {
 			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
 
-			if (!use_iova && addr->proto == DRM_INTERCONNECT_SYSTEM)
-				dma_unmap_page(dev,
-					       addr->addr,
-					       PAGE_SIZE << addr->order,
-					       addr->dir);
-			else if (dpagemap && dpagemap->ops->device_unmap)
+			if (addr->proto == DRM_INTERCONNECT_SYSTEM) {
+				/*
+				 * Linked IOVA pages were already torn down by
+				 * the dma_iova_unlink()/dma_iova_free() above;
+				 * only the non-IOVA mappings need unmap here.
+				 */
+				if (!use_iova)
+					dma_unmap_page(dev,
+						       addr->addr,
+						       PAGE_SIZE << addr->order,
+						       addr->dir);
+			} else if (dpagemap && dpagemap->ops->device_unmap)
 				dpagemap->ops->device_unmap(dpagemap,
 							    dev, addr);
 			i += 1 << addr->order;
-- 
2.34.1

