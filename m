Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA15BD148A0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1110E698;
	Thu,  8 Jan 2026 06:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ihbsp0Th";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010004.outbound.protection.outlook.com
 [52.101.193.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AB010E694
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 06:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkzY7/weaHeiBd3SKCmexUI1yGjbLNPN4c57YPzbeJBgw7UKRwLzdmdB5CBFpVw4mi1QAYxOXvaKp0RNWsR5C2d7tMq7lOJk6YPR+jGxa0Iv+S6JkaPhoijWSl5gE9U+B7UsaF0EUVS50p0jJGF1wYoE7QTEfWDndQZsokYaVPv+lTV5z3r8KI2+M6/61u2DwzkwnIkyMtWQ6IT8zjW64e3+RQIbY2oyRIruXQZIejGHpmExMJAZ8Q6sMct6ZkKJCMtKlyLliG1PPItVwvdA9d7HxYffZY+tDqX+6+EV4xov/St0NFTDIGQURAwopFZaKEzeEJ333MUZmpUszWTLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJLBpr448Un7TSTKD03UDfr8GbmwWLkiw0oJ3GrPbQ0=;
 b=rlJdQuMgvKS97wPjkk0rpfWfhnjbzOM73IaQpvprnk54mUp0uon3Xsa8/RNKEXqffCuqOHJQHXrS2cNiPcyttJbfgeBPAdrQp/D1IQRqSqv9/EkifwlvKXGwjhEOvdm/ha+6PtuenbGxStCGmWddNwzl+xuImCeU8uU1Bg5aDCdjlC4wvolSlZTjs7EfVBNfY5LLtYnhO1c7u6ojq97Fz67xK3Gt7/750rCGIqi4bZNju5rbN09MIWqZTsdY3tD6cdtaLdb0Ed1kDqOgJTjChfo3qP8BqfeSCV/8G4dIs7MC31016nDkhX68xo7Uxk1Wr3EJdsl8Mx7oRcIrC/FlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJLBpr448Un7TSTKD03UDfr8GbmwWLkiw0oJ3GrPbQ0=;
 b=ihbsp0ThaM197VSI21GQrfKelPvmyL1n7qGrAW8fIEqTgfmH6VxCxwdh1R/5p8FNUc6vY/oqXO3JWr/LHQY8UIDUuj8woOodxX66vMrXz7bPerSWIB+eYycveesQ3JXS7R21uWjzatUqthUtTjZsoSjbWmoLePen9cl3iajtaEAWmmHJLDFWXL34D8fB5VdPmkA8nmoPlo7bPMOJcZ8PBOdYdj6+qxsVosvX+azG3cKvgagU0rwD7m06HpO5qnXulpcuq7qxQr+JCPCjOaiUGb3fx++d6uzNKjzJ9268FZC0j7hoj1DB/Cp7+Qjo9GhHlWZQeXPq6X9vx9n/nI0+eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 06:01:42 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 06:01:42 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESENDv2 v2 10/11] mm/hmm: Add flag to track device private pages
Date: Thu,  8 Jan 2026 17:01:01 +1100
Message-Id: <20260108060102.41357-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
References: <20260108060102.41357-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa21019-ff2b-4b5f-d611-08de4e7b658a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T3ZKfWGYQYaes7XimK6fbnH8mpM6kJjUKemNzUP+6A3W3aLXSZrqqHWDt1Wg?=
 =?us-ascii?Q?IR2zaeTkCb2//dXC9BJf6w0+JOP3gPevi+QQq5lKn/paLA9lgFCs+mjlLi6P?=
 =?us-ascii?Q?nQpdukE7GD/Xc4Rt1BAtdlvD4WuTwcQhJZLbdThWM1QDoD0CjIZpH/bbFs+y?=
 =?us-ascii?Q?rySuuprIOtHrHR/knWTsopkkS2j0YlcocNnzCFy90bRG67DM0phNdT21r6Qx?=
 =?us-ascii?Q?aMnLPlo4GrSxP8nqvOAIFJmb/K2Y+w2kf3USS6FGJ/GEdmzw+roecCzrA9Cb?=
 =?us-ascii?Q?k0yk8eId72xLyLLgMMA+dnMNNTrT++URDwMj25uhNPXfXungHfHyhxk4tIZs?=
 =?us-ascii?Q?sq5VDKIY0jL1tuWpzZP1LIIr5FI/fGFUP1pkbzat0fIaPYrzbtoMwN44Ms2o?=
 =?us-ascii?Q?R3D3zMXHWN9nU7Bf4kzm1NfLf7N9sWQpF/HE8CmC1pfBbeVV0tAcWpz9A78c?=
 =?us-ascii?Q?crzEUC+AAje18lkET2b4L8BEnm5rJSoaRnuYse9QPUhfY0BBw5tjo4OIDIJj?=
 =?us-ascii?Q?em0wsf+LAKw4bs5szaTtpeNWw3Fgchg3bFPmbdeDRWj7ypZAYiPtoF8Hl33G?=
 =?us-ascii?Q?LxkFiJy3MbVpfb5ymB4rL3bzuVVus5Uy0BI1vkvlpPbp6whS8b9FbAH50WoM?=
 =?us-ascii?Q?uJOIYT5TRzE5ExVWLXzsI5GibNfEwd2SR66BU33WoID/BOsvt8wPW7rdJzfq?=
 =?us-ascii?Q?fcqpIr4KrpSUIW4x+GFe/g6UVsamDuEuRWOBLZr8ac83J8vG5aCyFS3erUGv?=
 =?us-ascii?Q?/IRm48kAvVRj1zCQEKqnRKdm+dQiLILhc02v34e8jHzNlYT7OqxakaTwiJQ1?=
 =?us-ascii?Q?80kWg/MF9r8o1BNrPpBJFoTCOsAT/JS+/rOtKDAT5yDoV+hG5YBKimH4vmWq?=
 =?us-ascii?Q?c6AFj1+nZttCZeWKHUSmrtaqQyiWEi0oARxAq2eGSWVf8yu+HmHFN2mHJ/UG?=
 =?us-ascii?Q?Gq6MY2SI6iVg2plZqnPTvO9z7jQqGTc2ACZhKz5zZn3ougz4T5UDv1pOdrtx?=
 =?us-ascii?Q?oWFI3t3bTpXIx+wQ6bSJuRLv2X2Cicf8YWHgYfnAUZUOntJAID00SB623ZvY?=
 =?us-ascii?Q?Uk6FYdPrMC/NCMCUv5i/QIqYLRC7JtUy0z2IvmXVepMOIBe/jSXnz+6X/yQJ?=
 =?us-ascii?Q?Z42jBr52vb1oZqver0xqScVAvMzcies/x4K7JoL4TvH914Z7KWoEyjs5Vthi?=
 =?us-ascii?Q?jMngd0l9jN9RZhjHMjSMZLqFojrSQmyGLgokzAYNAhogvhw1pGkSZOUG6/WV?=
 =?us-ascii?Q?Pouv6DHR+MXuzPczDkr/XJ7yWuYwXI+LRD1U1E2Oao137H7a5W2q51NSahCW?=
 =?us-ascii?Q?lrNto584qxL23UgnsnwQnGIK/lSj1G1zOuAaiUxD0KZqSmWrd0h6s0Cmfqg7?=
 =?us-ascii?Q?DpXFnQAnYv5FLXt1S1P1d9H44ww0tOrFpcv210ceGsfeXsn3KoAtkKnlOtW2?=
 =?us-ascii?Q?Pmtw4sL/ifYZUJrdj7XMOvGgmg5W6645?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lNRiQmlIv6NUOuTGxDFN/wEXw0CWxDa6O6vRcAa87DoonwQF8Iq/n5YAvwXN?=
 =?us-ascii?Q?lg7EHOmOb7eSBSDIorJY8PMoBXrszBQir/6P0Te14PsVbk7pwok1EJFCdML4?=
 =?us-ascii?Q?WcTrIUOpCEvLQ8zEVlow/1pKOOgyb6+tRL2hG6TWta/WBNhschjkPg5Do5e9?=
 =?us-ascii?Q?lz75UihguLHhhhf2xVTX8QarSunIMtpyijrlK8Pmj6kvpcpsRmpnx8nBOgyt?=
 =?us-ascii?Q?L2QgULma77QcseUaBydKwPHMcudNuiHR6wdiTRyXxYqW5MM1z8aWV1TvssXv?=
 =?us-ascii?Q?4aPqh8xI2AVwULHk51SqBSWiJqEixYZfsY1toN26qN8TVBfgvIVXUYjDZldp?=
 =?us-ascii?Q?Q4yc/Co/vGKPEWiAFqmSb9cOPMedvCWVuJGt3XDwXFcQP5TYJ49knRhJswbu?=
 =?us-ascii?Q?sOqKWGg/UZfpuE0/ItSNZDFq+l4j5OBFStnbg0yhOjVEbYV6qWL80M5OY4Qf?=
 =?us-ascii?Q?RQEqFB+saJvE4F/yuCh8M3dcsLIEIiDxPknLnqSfZNptdKnYNb0glmRxiJOk?=
 =?us-ascii?Q?+kny365E4Ba0/UMZHU5YYXHE/OLMK/badtpkFj8Cgoy6P5Md3o6YA6GFSYsy?=
 =?us-ascii?Q?raIfOiPGXpJ7t/997uC9ckGEdeFSUk5Vuai1XhELZTj9PLEyZqpnhF6e0BPZ?=
 =?us-ascii?Q?MtlE37ujUYI2H6Y42mYo58wMrm1TPFYzHpi/Dgtgt4VAXlgeISsRuwXYgAAI?=
 =?us-ascii?Q?cFpf6jgPtfRwsNdpKQrp7eyjPuuf5pBZuiQpExQNdQEAKpExaHTT2GC53eEu?=
 =?us-ascii?Q?tRhqjvsOGq5QbYM/20EYHOdnxdkHS3NSW/oZ16WWOtZWnz+FQABl5cOGnvzQ?=
 =?us-ascii?Q?4ZwmdsVszU7mPVYqD9cwENGJ6YOjMTWBd6hyHXiAPdm1kSeNKHC9Rz1nubOR?=
 =?us-ascii?Q?yB838xlx5zp3I/jTwQd7RkL8W7vC4kcCFqg7K+qvR3SOA55Dls/ckhsQJO/M?=
 =?us-ascii?Q?m6Zz9bStEhYlvwAP5Kass44HwMktewjSr3nUUkhmUpzLxuT7jkB9JceS5DtO?=
 =?us-ascii?Q?R26PLa5EO2HcWt9SGH7rzKBepjFhxR98Ua8+s9V3BDBcvv5YKu9ZiMjnbDKk?=
 =?us-ascii?Q?aKI2maWSeeFgu7KZgMaQdmQG/pDyFUche/j4vcKGy85VyCJnFcWrw0wnQhkq?=
 =?us-ascii?Q?clIOBvqT0ocMGmVI3Cy+NMFE8MZpEBWn3PNaDFJN8rfVwuQPE358lSK0L88o?=
 =?us-ascii?Q?VjVdo0CFuAblMLbkUkNnYMBnijkNTptrfHI/SjUM5DU2Dz3DR1g7pbDQdhB8?=
 =?us-ascii?Q?E+H4+PamML5ub8xu3/WehHViaYq5clPIHnBcZp7rX7uKadoU+F5MstcP+gY8?=
 =?us-ascii?Q?fN4CfcmXL3KgCUhAzwKMUBRJnA5vMvoLzch5tnwvKt9EBtwqI+fr3J2RhjgS?=
 =?us-ascii?Q?hzwoDFMoFVrj7wYLoDYEoYH++XS9jkCwEdH69bwlu/bYFmsuZghAiUKnR4L9?=
 =?us-ascii?Q?3DOtk68LadUPon4er97ORW3NKwz117pDizGRgxL1fKXxPqCap2zHFApJKlUL?=
 =?us-ascii?Q?LgZinrwSvNorSeLAj2GHYMM2wh4J5iSdoVFpeaQSs9Ltlufrcffh7fVGXD79?=
 =?us-ascii?Q?E1tvF1R2hrNQfSjVQ/U1lK6yzN1yYbFxo39IJEniLY7MAJ/LfM735aa1QZPG?=
 =?us-ascii?Q?syZGfjAH5gwqTIXGL3TYnOtNdhKyEC3kt11DlEaCl7jYM00Bd0EB/PJvMXZm?=
 =?us-ascii?Q?y6iAQJYtpKkd7KUOV3fRVLEiXXE+eZSAETzOsaURKiPNtLyccxderYcT1wCx?=
 =?us-ascii?Q?CU6xe1o2UA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa21019-ff2b-4b5f-d611-08de4e7b658a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:01:42.5732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoeUeI+3Sm8NW2cwvQvP/wh+K/ud1n4EPItpj/THtrGV+EjhzPQnDtligcfFgbUKPkb3dRJX9qew1XHkOqXy8A==
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
normal pfns and must be handled separately.

Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
that a hmm_pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/hmm.h | 4 +++-
 mm/hmm.c            | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..d8756c341620 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
  * HMM_PFN_P2PDMA - P2P page
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
@@ -40,6 +41,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
 	/*
 	 * Sticky flags, carried from input to output,
 	 * don't forget to update HMM_PFN_INOUT_FLAGS
@@ -48,7 +50,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 12),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..14895fa6575f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -267,7 +267,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
+			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
 			if (softleaf_is_device_private_write(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
@@ -347,7 +347,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    softleaf_to_folio(entry)->pgmap->owner ==
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
-			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT) |
+			HMM_PFN_DEVICE_PRIVATE;
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-- 
2.34.1

