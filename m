Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E0C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DE810E163;
	Tue, 30 Jun 2026 03:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iCTNw8zU";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36D610E70C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 03:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvrZRaymdJmW4U8k/O3Wwjk60VBH+aTOfmbhI90PzcOky13VoS1GnbcjyyIzT3O6QHRiAHdBY6AB4VwF/v1ghtl1xhWmTgVNmLdFZPBY3wN3PcWgUVxlItTGPdHUASJOe6N8/v/YJ+HeDFPwtFuIK7LHlKOjMcRDs+bxHlH4HzadX3jy5b1xGR/WyeAYZt4XUSAcyYRbQxAUrAwEsdtApYPlLmJktcYbiqgp0hiyOw2VEWT6b5DfsQzGAJQxRWgfvYsV/W7LuRn0Ggi8w+En6pSAbPRa4qMI3pmzbyRGSNTDI1pCTzljAqdi7HvLFBVMGRNi9xgYk/3PfWHbWXunxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vby4M1j4T9ZCXDO2ZujiXbMugqsyerR3yCkH/kcSXZc=;
 b=PHGpmcjF6PMtOgeG9tWnixINmXBctkI1iw2O3xKbVB2wq6Oned34DZvATGdxF+VkG+bu1P24geGz/VQR/IW1Hx/o/6XwCIezOUpaHJnSY62Jl/QF3c3KnoVHwkGBxUg+atOKjRLgOrEg8Od4ZbLE7A93KrXl2pc0xcynoZ3yrjoMeYkXJ0Ok4qi//gCvtG7EtueUrIrw1X/pEoGMFEGr2INWxKKBNoV8ZVn35NGs1LZlt3DBJbemgwjIIx9MGWlMv+tGL163CLwrD090MbrZoMv2xTLvFZ2O7TqvHzVhtcqSWUfVjRsPXj4QlXSaCO8wVtBA0qgfnGBFsTAZbG3FLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vby4M1j4T9ZCXDO2ZujiXbMugqsyerR3yCkH/kcSXZc=;
 b=iCTNw8zUfdlYFRJ65cjmhxTsnq8kSROwlDOd24lUKxitoVrturSBiKEjTC94fNAh4vQYZRV24ERKxHevu5KI7r9HQsiwfaWYR+lJSFf75UvHhHa4LCm/OAxcEfXaG1w+kIqbfbBpP0qDL5vsGOfpJcxH+niCcY68czbXEgzS1r4=
Received: from SJ2P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::11)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 30 Jun
 2026 03:40:39 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:5da:cafe::76) by SJ2P220CA0004.outlook.office365.com
 (2603:10b6:a03:5da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 03:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:40:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:40:38 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 20:40:37 -0700
From: Honglei Huang <honghuan@amd.com>
To: <intel-xe@lists.freedesktop.org>
CC: <honghuan@amd.com>
Subject: [PATCH v2 3/3] drm/gpusvm: publish dpagemap early to avoid device
 mapping leak on error
Date: Tue, 30 Jun 2026 11:40:21 +0800
Message-ID: <20260630034021.362571-4-honghuan@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c3c5b2-8bc9-4f57-41cf-08ded6595a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +uZ/pnKljESdzMXyyzyNNYAOFfuuB8hRDoMUpoBlQaWCOAwmTleE/llKBFuQRCzFdEXjKwdsOkmJG6DXNuy3UiNZq7Vp43anUwVZkmWJbQ7DR/BAYr2VePA+tdYP+4T5h/hKIY+CcGtnTVZB6JxQgX48aOSfFH2qHdR0843NU8eHA2G6BQMwHnaFtmv7Knzh+SH3KIaDLFtbQ717Tc4NJLC7xRVZQsGp7teKMj5s7N/6OpqihOVII5jxtq+dLiW5U0AaFQbxNjzjXjMcaGKBHA0jd9nd23IxGSb7dAvr6SCZh+dCghVM4S7xizNBTrlvIoKYIVTNc5kEqS2s9TxYqbxCv23wREDTPHIbgH8pgbtNEPu0KydsLOueGhX45ZXWMAhovDIAp4GUHOmLRL8rZ1kSgpJpJ0j/AT2BYBWh/prpBpX4WDRLygT2giojChDZNnoqlNYI8wbWphzgGmCNSQzb6hJ5MJhW2Yjjzi7feresDf4btP5PkD14XBNt2HNjrCZqLKFR9Zu6F83Gyb/bMFp0Q/CoFB5Y2BDEWGBiXYGuXCmZc7Wl4+orah4uTAXZ9FOiLyG/7IeEK0kD9TWQp4IuHlzv819as28XI2olmn46vwgtOU2RwcYFzvbMk4PF1pC18sEz12Ge/9gzXSWre04zx0aG2JZblKUIq9Nty5/wCyxWo1iDdCEzu7gLYpB8
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: APYY8Cld6kBO5RAfl6UBzuhWRZ+0ykPtcjhbxVROETV9N4C/ShdVXNFKB7ujj0mSeFqccH/2MqcocOKSoHb+Qjlz8wYssszMOoDcKO09fbrGRT9RdKDv2I8XrGq1Tv+I3EnVxKEsESCvrQyRBkMF0/RvuRDu2juJR76JK9c9YLvrBRgxhTgH+/8XOKmScFHuKRkLAbzfBjb9Zly/XTawSUjNBbNr52FfpBFBq5Clj2c3kvhddntNIdbTZ+ShehDiRCAq4zZ3yhOvG2unkfo0vjARLRuO1daA7Ud0f8MR9U3wWgziSY0pqaQ3fH24pL1aCIEajOSTjwaJlKnlaKHIUY1E7UBHWWuYTEyDG+eZhqjP83EDa/VJHX2YAFbzLMMM7nuagEc6lrMzBwQVaL1wsTkRqZ9kkwPStEr9eaE/KuHyM8+OofvEsGI2avIWPZf/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:40:38.6809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c3c5b2-8bc9-4f57-41cf-08ded6595a3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776
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

Reported-by: Sashiko AI review
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

