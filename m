Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC0AC43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 02:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2910E718;
	Mon,  6 Jul 2026 02:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m8pMytZ/";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013034.outbound.protection.outlook.com
 [40.107.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7B10E718
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 02:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBLl+sIDVlEISE07Ck0LS0TFyJuWUiHVkm8yn4yIkzMj/NXZPOyABS3uISITy6R7jGX6ir/ufoOuN8xkibdzAZ6n7+X1Xf6jdaqzqGCHvSm8nfsfaZZTurCuwVAO/0Z8bTxviyBhyM2b/ZRk5xQ7ZKcGXsYEOxhwEWRR6xDd8iV2sO8dHcyd5xqVUtaaxxS0/XL8Vk4aZhiETo41JAtm2cz4xqtnE1N+g1GmG5KSYF4hKKZBxeoWACCB45rQuN8/pbWlzQbu0Bt2Hmcgggq+kU+r+jc3hiA8yiIOH2vgvAbhNVncNPuh6LKs433rVfI36k9mbgclnxnO3zfvO9UYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tSzvtO8ekLkFY06LrbamPKxRwcboUEslA1t5EA8mv8=;
 b=Zvu4AFPmUd5ZmhfW/8m+JO992/pLMAHwjYBO8X+QvPj5aIQJIgFoyo4wePa9TAFHK5tsADfzYm/+0JI3wlpNCHbAHsNXOh9kGcG7ytiIV8DaxKf2yaKAZwgfI4UxdCLGwwTAPuMAbq1t44wR6VeG/ktX9iqueBfMPv6MT0yXDr7DtFqZk7EADxw42huS+Z2Derut7RDO4rxYpqpN43a7WZ9QDySm0PsGW4PJuJ9M7ZxtfHQNLukaDcPxqaWee9yhlkSCGZzSqQoYw/5pFl9+zjVf2IqRIHzaOLBgMkoyhvYpwsLQ3HqjuZIpbjLwcPoXjTdIiZIPbjUFUK5sHa1IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tSzvtO8ekLkFY06LrbamPKxRwcboUEslA1t5EA8mv8=;
 b=m8pMytZ/NkDeAMe+qcrGzlmHiJMHM7wsVOk3JMr0cQu+l3tBaxufI0/g7CzmLkrVXeot6Hb7QZMQ/h+21yvheMny+pc7DW8kxWklH9aGwvpZ66Nvu3+ysXKlZJ/IT9uHcVxatMryeOiwf0mzNVk0KriIN9srT8/QJL5IzCaxQaY=
Received: from CH0PR03CA0350.namprd03.prod.outlook.com (2603:10b6:610:11a::24)
 by CH3PR12MB8073.namprd12.prod.outlook.com (2603:10b6:610:126::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 02:47:00 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::3e) by CH0PR03CA0350.outlook.office365.com
 (2603:10b6:610:11a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 02:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 02:47:00 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 5 Jul
 2026 21:46:58 -0500
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v4 3/3] drm/gpusvm: publish dpagemap early to avoid device
 mapping leak on error
Date: Mon, 6 Jul 2026 10:46:42 +0800
Message-ID: <20260706024642.614238-4-honghuan@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|CH3PR12MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 17373c94-2978-4222-0c8d-08dedb08da73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: cJAFa1Ydwpz3atbTl0feTodqD6TDe+jScMlMDhNhp0k7FeJWKJXzB/NCwct2w8HoM0FvXyJh8croVO1OPIOwkqUusP7EbXoNQzD+f9Q0hesgGSQH8jK9isw26zaXh9pSV1GqTwx4v/FDvWAuQxRm43Ywr27Wz91iMM/kxuqQyITkpKmxuMhNVcLGWYdqkygAoJlZeEhtdlh5Ru9M+osGkdZz63bcSS8idFazMKnlCKZWyzflf6Cx5WVG29y6/RrLyWP3l2bk9BzpszkZA/hkHliEe/96PeqM8zTnxFlj9XCpG60xJerej+em/bXOdOqz9YxxcBg4t8LttE0ngOgbUKtMB/6KauU7XIqmdThmyYyXN3V/rLXhXDdTfSJ+yTTXwIJ+UwVkXdI1WVMQfxF1msYlM/W4ZeWSR6s1KgvuN7wOM/+leAMMLK9FVqCKmhLXKz21DR+L6Hc3PM3UF/AA/N8i4NrGjbTtlcNj+3OncmTg2U5Htn/WOi0x/ZkCmlyiMnlXR5BH6OpDDyQOR1YzlJggfWd9d/P0ox2RtkQah08r+37R7wLDyo4+C8K5Hjjwf65MPeMdX0CLGRSZQbJC1PkSozGBzx1LhZqAB35Ww9wlF4GVs5aQmJLb8G98Z6bIpHK23lntbr/wFE6S8L5ZnYAhNH0H/oU8ixxvU40d9aTJlCOp0qq0Wi020PGeAHIuH8MizNAmXaqT2/f26+aDRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jFBEhBoKkL/jMMpijrXTKYaGJurhuLxy+H3Z2QRjQOw19INiofj9/I3x79VGO4giFQHzdkoklu+WW+h/AMyQCnlHdNl2iwMO80M/9bv/ZNock999XzbvLqACdEY8io6a6XJ8y6uqOdwTuTSy8df0JPt6DD3Moter+wbKtN+h2omXNA9lcZpOEUiB0WdoS5JpHysHUWnGpV/cel8AqkeBBG57AxqWf+z5D1mHGZ+miIz/f9rLVMdB36ZUkE3qP3dviC/Coah3kfUPtybNXdZQId39whFIRJcR7N4EV7goK0VkH1RsaKkEoaXXJ+w7gGRQICWVu7wGdEyKsCAXDuJZOoAbnH13xGdwVS/xogdBu1XpfU5D3qEBEgKj1Md9xUvEBj+KZOb9RGFSISvK6DRR/8dWkSP1B8WAx0TGXk7sA4JUSRUTCxolH7x9E/jJAkUz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:47:00.3671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17373c94-2978-4222-0c8d-08dedb08da73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8073
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

drm_gpusvm_get_pages() only stored the local dpagemap into
svm_pages->dpagemap on the success path. If a later page failed (e.g.
-EOPNOTSUPP when ctx->allow_mixed is false) and jumped to err_unmap,
svm_pages->dpagemap was still NULL, so __drm_gpusvm_unmap_pages() skipped
device_unmap() and leaked the device mappings already created.

Assign svm_pages->dpagemap when the first device page is mapped so the
err_unmap path can device_unmap() those mappings.

This issue was found by Sashiko AI review.

Fixes: f70da6f99d4f ("drm/gpusvm: pull out drm_gpusvm_pages substructure")
Cc: stable@vger.kernel.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 44bb19658dd..9a06ff7d260 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1544,6 +1544,16 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 					err = -EAGAIN;
 					goto err_unmap;
 				}
+
+				/*
+				 * Set the dpagemap as soon as the first
+				 * device page is mapped so the err_unmap path
+				 * can device_unmap() the device mappings that
+				 * have already been created.
+				 */
+				drm_pagemap_get(dpagemap);
+				drm_pagemap_put(svm_pages->dpagemap);
+				svm_pages->dpagemap = dpagemap;
 			}
 			svm_pages->dma_addr[j] =
 				dpagemap->ops->device_map(dpagemap,
@@ -1611,12 +1621,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 			goto err_unmap;
 	}
 
-	if (pagemap) {
+	if (pagemap)
 		flags.has_devmem_pages = true;
-		drm_pagemap_get(dpagemap);
-		drm_pagemap_put(svm_pages->dpagemap);
-		svm_pages->dpagemap = dpagemap;
-	}
 
 	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
 	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
-- 
2.34.1

