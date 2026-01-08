Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8AFD1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4A410E27B;
	Thu,  8 Jan 2026 06:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2pw2NHB";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9B610E2F7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hbr1Cb71mz3+Ro09B0AwWN0xNNR6k8aVYZsXcqXW3wifs1i557R9LP7DPG9jwwADgFPfroB7nQoMe7ECFpgCX2LbILwDr/xU7UbxX+Uc8jvghr5zyjL4FhMUzKbBXDp2JJ0k5RytCQICovGytcHJwatqeH9fYUX+y9yaWIBCjPYpVbsTorTa8JOb8CnavOqGRLEYvSH9EnRGHUH9BtzdpqSaak784a+8B76gLfFzfojwMeG4spIzxGpIO5l1HsAUZXhmUUezMV6zWl6OBj/XFthXmmZSdsWuAHp4fwgibiwvm3pzp7xkCneDk0aqlE0VX7Grz0Vb286TGSeFtPKJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHOeBdfv4+U5yhI7ZWfO1mTF73qlJ9x6yYpqOm17B9w=;
 b=sOugnYRPjGhk82ZKKOOpwEE+cT8yE1EloUuyiprMLIlPSXBwaC4TDeR/gi87WK/SL/H+U5irUrVWdsFiUEj/bqBmte1O4ic8wAaICMEsF9K5jHuZM3k2zhaZLjgEOVtG8LqfaDlWn0Ws22ZONxc4Ko6r3XLFBt4ZAIoobWQbUzBOVxn2EklSoNMx9EaYOlN7WkU6DcsThOOO3D9CROnEW1V2MD+mpJw8WbYRYayQFusUFi9ibiTf7ofoooBzrQhVqDJo4IBVyOK+2T+ZN7fGMVmXvRhr2VA71k6CIOcC+lXMfo5bXkfr2RcKQKXyzp1rkeoCPcuGIKwZuKhcUMrUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHOeBdfv4+U5yhI7ZWfO1mTF73qlJ9x6yYpqOm17B9w=;
 b=W2pw2NHB/6IAYpFy5SgGTnJkZYbOqcrszWxYMy49w/TKF0VRxSbdXPqLgbvxa4qhwiVlrbdj0CsD0ZPI8ocKeb3kk5boF1twTDvNJGZWxXkGm4FrK2mfifihtb+RLM7DVePZhNsj5qcPtIBsb7p6Z9hQTZjNb7pPTVA1XJluyGuivzVv7QT+iHkyA5JcuWQqVvJ7MHLy4ANRMuAjY8EqzRonb01RKB7tHT4U73FNlrDUGnnTsHH1mw1kbLFGOUD4XAxqxPZIOKbsJhbeZD1e9nXvuathvBrjtyZHvAjELADzcPTYfTvptuJNCAhIgeSogIaBpyEF+jVacFYh2DUFUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:24 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:24 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 05/11] mm/page_vma_mapped: Add flags to
 page_vma_mapped_walk::pfn to track device private pages
Date: Thu,  8 Jan 2026 17:00:56 +1100
Message-Id: <20260108060102.41357-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c01007-854a-4f56-59f3-08de4e7b5af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dnzhNQB0rbn7PgfkQDXt7EYFUvLV9bEANZn52c3tuFymPskZ+FvntIRljlhO?=
 =?us-ascii?Q?AbIa8stzrXhhqUIYI44rBgmYZ+tHmoGVlH5jZxC2Y5Yak/upJZ7Yp+ifrIwL?=
 =?us-ascii?Q?XMQD6v3uThJ8NfmWxE8jNEIvls/lE81u8+XHtTqzbR3BVvw/eeX9cS0HVnZ7?=
 =?us-ascii?Q?6LPY9Q62ZJnLQ1Y8phdc78kr57wPREVG77ar4hCj6lJe+C3Of99lhDPnPINl?=
 =?us-ascii?Q?0kVeiS01vx3meIfw4BHCTElZshUNMR7Fy8nZJqfCU2ZAYBmcf+iHABEZFPOZ?=
 =?us-ascii?Q?ZkAF8uMB/wJhtZVXRxjyX+wiZMrZ+bHr9nBt0L1PyskT9QCeyH/QeSU5+uLl?=
 =?us-ascii?Q?lcn5CuaD1KOvxa6DGdYxmAJ5B4nQrwyBDO/3fdHSS/5L3K5Hzs/9NZVADjsq?=
 =?us-ascii?Q?UErB8UH7ab2KDO7UMR1ayzvw8ISLrc19rjQOEJegxmr+dAlEBxJ31HG98JEA?=
 =?us-ascii?Q?rO1XJOqa4/0buVCPtA3ZfH6QVXm1SPAJEzLZPaYLSE5GNQtLy1EUt3UuPRqe?=
 =?us-ascii?Q?vB4l9WUPsJ4BYiKW0t5YIXLUerda23OWU6KGucUyf5HSmkiR5jjJCrSU+EqS?=
 =?us-ascii?Q?7ErUmOHLi01urzLeUhAzgaS4Q0h0RMY5W4++ApGOgpyVXTnqTIa5vztCTmzG?=
 =?us-ascii?Q?yF0+3Rij2Tlhkw3LMQ7To4fUchH4yUsZNLzlaHZInowcYc/G8kAxoa7HcIVJ?=
 =?us-ascii?Q?R6hpRANE9pgf+YVfN+f/8yWmAj4N6ZQDZpM64gB0ThTZav90tgc6P4hhQThZ?=
 =?us-ascii?Q?dkoaoJclSSFyy/vbEARW+7l5noQ4A5K7EpD60OytdpUhpF+YQWpezrngdD86?=
 =?us-ascii?Q?fFpgHn+fpN+jiM/hW/NE3iEevKUAy9TzQBnzZIjWqhJ+6xAFFtQSBm9eZGl1?=
 =?us-ascii?Q?Hql3NLHnXjzNp9uTNx0CLNwZ5sJTso1TG3PP0uw/eBzSEtCCMcom/Ual4yPL?=
 =?us-ascii?Q?DBv3Unqr7HJfcVFl8YSya3u7OyyW0VGqlNuQYc1flCOspQdTk/d7AaNP1dmh?=
 =?us-ascii?Q?6enF56LWtOPnqVn6uMgNzQvAwJd2O7uIapJh4+ekqyQdy43thX/8KgU9S1oi?=
 =?us-ascii?Q?DJAuBHM1vhPA1igvhU9r2vZa8rYfVtV+DhdMgz+6PY8DLDKGy9owznoEfGw5?=
 =?us-ascii?Q?sumYAkhsvE/+z/dtRpDPz/xiW17db4j1hZBOTV1Ew+sfZsSDBGNU/ZfoWHRn?=
 =?us-ascii?Q?33sBa78lQwut2FQdXYUMx6pA2+inKAV7TXsWtSSt6/Pfm0Wwje5ktvqKVbey?=
 =?us-ascii?Q?vImk87GWObg96bnKvyVMcwZICxHpJ2ESmqgb652v90Vu5/LUJFYkRB73Bi8+?=
 =?us-ascii?Q?T51aWugw1gAS1W/mkPfEnRbPoJIVyUZtiPIZTYNL6xtZ1Q9fECYdqnKbIwRa?=
 =?us-ascii?Q?hmeHoWjdOQKmkOSqnbn0I7/CNnSW11IE6XuxHAWqoXMLyHevSOaeD8E+c+jq?=
 =?us-ascii?Q?I877x8CsAkmDbDHETPcX3PbQ/i17Ha1S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a8Lfd89vstNfL9SsIXRAFwu0hbnxtKWgngCkOlJkbq+IwZKSAt/Qwfd10aDS?=
 =?us-ascii?Q?GY66drTyLIl/B/jOk48YQIRSMZN2pK96xdOMZs83h8dfQWjxJanNQaei2/Pc?=
 =?us-ascii?Q?5RwZfgIqCuTuwZ7/SLphfdXEoB6TH82eLmEbbXEbtDWvyITDZIgIX+C+anZk?=
 =?us-ascii?Q?Yrc3XC+fTHnvoHeNOgQVof6fjSSkOFBUCjrGYjq6rzez9DBSB9VIOiLU9Ht2?=
 =?us-ascii?Q?w0k/RMhyCkoW16TLEQ+V1WKR9RVBsSG5HnIw54+PDq6ZMveY/emBukKUDWUf?=
 =?us-ascii?Q?8TWx9cbJuNWLUmbCn6jkLcSELP87F9Zwu5CFWFknARDeWWWeWmcqPvRXbkOK?=
 =?us-ascii?Q?gHOXjFDtmziPRn9gc/pLfgGVDh/AS35zmB1y1EHmizjhWhxB31+S5CZhwRvc?=
 =?us-ascii?Q?WFgE05dNmc7a/8usGWf1I33IFB9sBdLp0NNDsMoo6zIXKkmOo8lcE87ZIgP0?=
 =?us-ascii?Q?llAbfc+OywsnzG5cBKAu9S24ajJob7XWI54dCH9x4ncATZ5OU/B/NWpYNq/1?=
 =?us-ascii?Q?YJAbUYsyxxCazJYf9xTaKwgrlSoQzVxDM2LIftCoYuRj8A2o/vF/cQnttRL6?=
 =?us-ascii?Q?6+cHgQjnPd9cXAcCZeNrJIFDOZf3Ih4ociXxPxekvK4oGzfDskl4abY25g9a?=
 =?us-ascii?Q?3/RZpNYWAS0OElxqqCPB7YFBheyeAr8uw4qUHxKphZMowSzYDRguykh8Vaeu?=
 =?us-ascii?Q?WdAsiX8dGFz0pp9Yx4d6iqI6abSN1lOSGOZayTyaehIqU1E2Q6KNi548uDax?=
 =?us-ascii?Q?oALNSk4DoIv/EcpiS0OKjR+suLLxD3BDSph9s+envFYzrTRsWr3dE9qmsEpL?=
 =?us-ascii?Q?yS0dHXqLuRE/9annOjxtTZGl3ieLpiTM6NeBpUCYxJpX6Roe28pnajUZS7TF?=
 =?us-ascii?Q?rRMFBJnF7BLlV2b3H6QbEr8v/T3Y8prXp2apEdrfdD1u86UQp5G4iwSHk2Ht?=
 =?us-ascii?Q?iAwIcz6eM6QyfmOaA16pusjVUqd5aTMu6BcocXNPRrJ2AVnOXy/7t/NYPXlw?=
 =?us-ascii?Q?IkKCWGJi42VLlRLAt0cVfdp+Hc/yNpVTAFSR8QRTuwcehDaxwkQwPHasz8xS?=
 =?us-ascii?Q?dfDlJpV1v1oyf9DVkcrWbyEq8T3CIieoQLK4qywNpqNSdx/X/mlDh5byyjtP?=
 =?us-ascii?Q?j3HnP2DfGo25YR+aFq4RoODlEtgNmBQmEfoTcM9ialTVd8K6hrqcIEIBpb+B?=
 =?us-ascii?Q?zIuQtmn8nUBwMiU3hGzKQ/FXsHQ7iNpKuCycAeX7OkTygI5R75Co+CkXIzK2?=
 =?us-ascii?Q?F/0TCOGwYK15YMMqBQq4VGONeYyEVxcfENQc8VD3oiF00fOiDPjB+UyS4IKZ?=
 =?us-ascii?Q?iaeM0AGPyYMaSuQTNH33M3vaTpot4rHSWCNeFczUfVVFTtBFuWHS/wKk9hCt?=
 =?us-ascii?Q?7qlM/izJiiVKb0/zVY0YC/4xMsj8uxdcnbRmH/IKDyK/HHkFBodyWAUGGfhb?=
 =?us-ascii?Q?IfvYsv+t3SyiHtZo44wQb14QYy0bMH8DIEcdd1NioMtt7PmMj6EEPB2z9QgX?=
 =?us-ascii?Q?EgQH81dFZwKnVJv9x5YLas3TyaXTSu2piT6lwfyiHNpvmeGhOPiAq11jrdGZ?=
 =?us-ascii?Q?h3linLInfEHPS4tmgl9RyA/hF8Uxi+cEHhf0y5zHY8iswDSrkVuJB2EaZ/gw?=
 =?us-ascii?Q?xcRPeYAACnn9NU9RrDdLdkB+mdHKSwpZ7TfazFEyH8oSZCsAeB6tY+QnoCY/?=
 =?us-ascii?Q?nUNf8UUVZYC8x6lnACUPb+FCIT5qSNqUFI+3bDZ9IrchBTXV4KHTKtPHAvcI?=
 =?us-ascii?Q?uvMNdrBctg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c01007-854a-4f56-59f3-08de4e7b5af2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:24.7808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cdZhaoYX5x/E5OKVBkayikw2+miBFr+735tV3VOw0jizdL3GJNVG5wVWuzSOBZ9rjY0SMgDD+0czeOu6GEZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by modifying page_vma_mapped_walk::pfn to contain flags
as well as a PFN. Introduce a PVMW_PFN_DEVICE_PRIVATE flag to indicate
that a page_vma_mapped_walk::pfn contains a PFN for a device private
page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/rmap.h | 30 +++++++++++++++++++++++++++++-
 mm/page_vma_mapped.c | 13 +++++++------
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..57c63b6a8f65 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -939,9 +939,37 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+/* pfn is a device private offset */
+#define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
+#define PVMW_PFN_SHIFT		1
+
+static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
+{
+	return (pfn << PVMW_PFN_SHIFT);
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	if (folio_is_device_private(folio))
+		return page_vma_walk_pfn(folio_pfn(folio)) |
+		       PVMW_PFN_DEVICE_PRIVATE;
+
+	return page_vma_walk_pfn(folio_pfn(folio));
+}
+
+static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
+{
+	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
+{
+	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..96c525785d78 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -129,9 +129,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		pfn = softleaf_to_pfn(entry);
 	}
 
-	if ((pfn + pte_nr - 1) < pvmw->pfn)
+	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
+	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
 		return false;
 	return true;
 }
@@ -139,9 +139,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
 static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
 {
-	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
+	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
+	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
 		return false;
 	return true;
 }
@@ -254,7 +254,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				entry = softleaf_from_pmd(pmde);
 
 				if (!softleaf_is_migration(entry) ||
-				    !check_pmd(softleaf_to_pfn(entry), pvmw))
+				    !check_pmd(softleaf_to_pfn(entry),
+					       pvmw))
 					return not_found(pvmw);
 				return true;
 			}
@@ -350,7 +351,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
 		.flags = PVMW_SYNC,
diff --git a/mm/rmap.c b/mm/rmap.c
index f955f02d570e..79a2478b4aa9 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1112,7 +1112,7 @@ static bool mapping_wrprotect_range_one(struct folio *folio,
 {
 	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= state->pfn,
+		.pfn		= page_vma_walk_pfn(state->pfn),
 		.nr_pages	= state->nr_pages,
 		.pgoff		= state->pgoff,
 		.vma		= vma,
@@ -1190,7 +1190,7 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma)
 {
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= pfn,
+		.pfn		= page_vma_walk_pfn(pfn),
 		.nr_pages	= nr_pages,
 		.pgoff		= pgoff,
 		.vma		= vma,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 670fe9fae5ba..be5682d345b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1

