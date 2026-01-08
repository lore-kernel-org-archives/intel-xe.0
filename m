Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68509D1489F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 05:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39710E27B;
	Thu,  8 Jan 2026 05:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E6bu9lAM";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B310E27B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 05:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKFeIVCWm6W/K2YvP4KaAbq5jGDRl4gprLEb6jWsWEmXO48UGxXR0vYcYhwtkIBvyD4DTWEHlaURuer8SpBZQrTd4D8yzLBHPiYnGNCN4npvQvNerHMfiHh4I0aLIPCb1dR5TBxZ903InIYZbVu6rtNZ+spnmUsUmL9kZq3fui44s7BaJwcYbUJYq77827TT8YA6130MNRne4tpiLoD17BuH/8WWM0IinMe0hs7IYchZq9rXZUxBt/raQkknNiL3HKeobHe6v2wq7QN9W/xYk6iiaVRSaNgCAu08jafS7IiDDPRGJM70DAsvAm04M+0NmJha94KBUJBHXc65gLKC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY1pGzhVJmWWFgyAMcfofUzjK4DzwQXkn1zo4epIkjM=;
 b=yWAfkUgZPj94i+EckXrjWiRDyybTCLUdRyk6Y1+axI4coUDZGvm+Fq4sL2OxMnw6Xb3z5t+fMVqK1+aX57c4Kx5zRfh0lS7OtvSeoITKG6KmLY/1OscjOheRycvBeQa2SwyyFAFWdTdKVJNsAHV4XFzlTnmdvWMjXrHQKTpqNOitavj6Y5jM53S5eCSpMW0id4jPuDbalTlLtf/1LXXQmSdlR2QPlzCxF9xEGlotwqNaGJLz8RRsMRcMGfWqEUL6d8VnRtREmXT4lTknAZkZSTTzm32Nj6ZU0j+PjI9/7+jhCp0KzmIHgvkblkiQbNq0/GMKyuSQApfAFvHUy6t/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY1pGzhVJmWWFgyAMcfofUzjK4DzwQXkn1zo4epIkjM=;
 b=E6bu9lAMuA/UNYpoG1YsDt4f5xmHtWZMKfSPXR1mtoWBXK182pzE4EjdeQb/kcWYe0WAbDpJ6n+m7olxldqFNuloB37+/POTJ6z81waXy4v2k2GJFENm36uJfa0QMOkAyVbcQDlNgddBu4SgX2+6Kr9IicqHOkaEf9cpdvGeGUXD6CxgAn5KoKIDgb+/YWVmAp0z3Tmi79o47CqObrEsngFcTTwvMPrZMZQ9+vc0Yiq5q5Udaiftw+c8vFBgxLPiwzil1+JCDdUKCCUxpldwiBPyzFFukbAozGA2qz3Oye2Lte0YTuWfXLOd5p+gkrM/LK0zJBWpbT1iHADArGmaDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:38:33 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:38:33 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RESEND v2 10/11] mm/hmm: Add flag to track device private pages
Date: Thu,  8 Jan 2026 16:37:40 +1100
Message-Id: <20260108053741.38802-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108053741.38802-1-jniethe@nvidia.com>
References: <20260108053741.38802-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: afaea39e-9f50-4aec-2a4f-08de4e782984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tb2Xo/9r7JRC5QVdJBAIqtkKzwdZoS0aKyb1AL8s5LOaIKkDaUFmKG1TfxJB?=
 =?us-ascii?Q?acgV9q5r7s1jJ4ZZh2IdYmP97rH1UV5+8eftfjzleRPiNvV87bk6dvh/H7X5?=
 =?us-ascii?Q?XmalGq6SjBJjqpdRHemac1Q/WZPxxs2wBA4aLTuq4RLWg0ttMkw9PFWO8Eg7?=
 =?us-ascii?Q?JRMkiRfEpVnjXVzWnYKmhgRN+6eCQArUw8OgN2NFL2Dw+Y1NvH2yn5Ofc15m?=
 =?us-ascii?Q?96Ok1xCGRsLzmiEuVvE2wa9v8S9c25UcfR+mg1nVT3qxXn6uA2OioH7L1lM6?=
 =?us-ascii?Q?qUsJ7MLF/mr32SiK2wzFiRbaWjua7NOqHkFHF5IaLFkD7PMlp//RPhbrlVke?=
 =?us-ascii?Q?XA0ks6Xq3pYwhhAwi8oeHaMG/vnSgkhv8JPW/313wZRRC6VuLaX95kjvf4Tm?=
 =?us-ascii?Q?w9q2qNuColMFqYrnNYmYU4dkLFz7ylwlsnFpVLjpFnj9ARJ6gH8K2sGyPD4x?=
 =?us-ascii?Q?bxgF1a5A38hksZJIs7L2u8fMMUEjHGquVpw3w1IteBa1jqsnv7OFJk/GwIDM?=
 =?us-ascii?Q?yCmkV4IrM4AtLsD47BYjmmnXiOojVt5Y9m48blmpYdFP05V6gho72iIhz1Ne?=
 =?us-ascii?Q?xMW9qEZKOFV95OUH9a9vnhgVRuPtO+xubA9wxwrDRc6y9R/FtW0Vxzp12VDg?=
 =?us-ascii?Q?bj3fbx5lpor1U/gB0wxWWOZSqTRVWeggGvjr4+1DIzHf7dG9rK07WFcqtN/G?=
 =?us-ascii?Q?Bs2WaTWBhT69jkjXG+t3nz94VvqviHSqoaA+XifISl4PGoEo/XrQvZEtG2V5?=
 =?us-ascii?Q?KiZjy2GFpTjO117MUoGx8O1YihTZsQSFmf3fGcyb3bjmbObdCE+9Or7SneM+?=
 =?us-ascii?Q?wT7kh3dtBpbkZlnx/ESPSma6JV7+GyUR/+N5hd3udDu/yYRQMBKeS0B2cnhY?=
 =?us-ascii?Q?SGPoFDRZBTfSLOPPs1WdcojoWMJzg7Xny08odK/1hc0XOLrGmgffB7ZzUgdN?=
 =?us-ascii?Q?8IyXyp+ybEOkNdiu3C6xyxIZv+irIxdVRJiq6Rdl5trOcyrWuk1ZdT54Kx27?=
 =?us-ascii?Q?6/hTl6G3qKOvbMzhKaIVc3GVHQrowyChSxArwVvY52yP29KMqpJ7ipHLQVmN?=
 =?us-ascii?Q?KQh0l++qsYIqgfMIb6UeJUDJjmS1a9ijDYRZVigaElkx/Vrib6r8OFTyE09w?=
 =?us-ascii?Q?0b9qKDmFp4iYvvaReDr1p+lXdNonnu2zI++z5bFha+qzK1IRw0tzCSErM7Wy?=
 =?us-ascii?Q?fLvPbV28ZezQskL77/8M6oyEEGuMCfxFkLCYgOzgQyzPygvpSDyQA2BuEIq3?=
 =?us-ascii?Q?sheSgxUFyD1fJgmo2oNWYV/DF3f9eP9E0jEdyjVVpMGdUIyZ5DUBYUXv8aTM?=
 =?us-ascii?Q?NNycpQgXNvbpyz5YQaXUSJVtg5ou9Opr3vX4d9AFuW2v8rKv8Ujf66oNUuyD?=
 =?us-ascii?Q?KKCjT1V/Ho390mRtgLcKQnQo2MbzVv/ZKCeazslcmwdGads22xZizokwQzZk?=
 =?us-ascii?Q?5Gp7zoqG1b06Ny4qdGUPFQ1s7AgrKYGo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RkE2Q/AbGjyOGFW54Nko7HqnA2OSAkm7XAs9mZoTHgCFgCMBblGCDbsvPZgv?=
 =?us-ascii?Q?5LMlZSd2zKLM47+dI5JiheRTUkXA8DvSVC5YXb3KRFRT9Od2z3eOOaR8tta8?=
 =?us-ascii?Q?ENBSz7/5xIYYY2Qr/izguUuziQ/YiPKZXlD7a+9oBbDaD2ZtboN9GDbMJERt?=
 =?us-ascii?Q?OpB3DJvKcvmPBiZHPrnlz6VjA0O8n1sYierEcq42zODSleOsx7mVnkiY4w5t?=
 =?us-ascii?Q?7qxD8f7rVmogFAh1FxZMohOpgSFNw7s+z+Edi8tm7k94YDLuIno93Fvag5cT?=
 =?us-ascii?Q?Pyp+Si9GPivm8Pddw4TblzEBqlQONakkWvvq5cysMlLxdqL+Pd/9Mf+VuJip?=
 =?us-ascii?Q?DTpYW9JVly/emwf+Wxn0A2oZXooqWJvir/uHOzxlSMsxfiyAJErs144Bav0C?=
 =?us-ascii?Q?H1ubSNMzIsyEhvJFBC/37GTziMnNromEaOLFtccin4aPSowP6ZHKwlCpcA2y?=
 =?us-ascii?Q?AKdb9HhLNwVM1y9gVK1v6kVfJHGmpi0Rw1Thpyysdh42bUV7oqRF6SpOiwml?=
 =?us-ascii?Q?5MXJPvCryqtuJIYSrY3GwXs8FliDeAjWGoBkmLhjV5W5IFVnzIUyI3uKYkDG?=
 =?us-ascii?Q?8hc+08lG+7EoPxp6fVaQGB/I1Zdv3ONxKr/Ia/5Tav8FImOeC0qzjMRWZrUP?=
 =?us-ascii?Q?07qmZ2WiTJPam9MO7Z7/ABZTNTFNvoAoK68RzDK7xgQ6nM4KX70hGbMUev2h?=
 =?us-ascii?Q?PovUMQiMWQ0b9tr9yQy8P22FCX3aw8HNwajld6O6CYv4gkeVcziNfHGvXtxX?=
 =?us-ascii?Q?ZsfjiEoR7Ir1NCQzfAHVzaKHPUe7YMPag6JuBfDDqTUzBhOxmmQ7B/Tz4Aw/?=
 =?us-ascii?Q?j/j8Q7oJVuZ0nBFftjh95X4nnbVEblN8Ruy9g/EsCKNOT7nn3gfQWROar/Cq?=
 =?us-ascii?Q?kQ4OHRxdMTVCNEOEO5XntlG0J2YtlKWIrEONffrxTJuf10DK8U3Ipw9h0c9h?=
 =?us-ascii?Q?SMxnZX07DOStC7Bu9cnccit7o2mvxXOWlgAW9NE8mh87H7bO/BQn/wbk3/Y6?=
 =?us-ascii?Q?hTJI852hrnTjc927Pdfm0g3UMCa01hZ+gMz8r1DxAd+ikEHay9+83ZmtMTFv?=
 =?us-ascii?Q?E8nlzpPDrXf8X9cRiy5EIggYblfPysQObswKh92mE8AU+vAlow/A5SZ5WMD9?=
 =?us-ascii?Q?zhiCWWersaMiBlIRRSLo7L1+A1Uubs1I1VP9/VmGal5S1SlV0Z4+/wIH6y+9?=
 =?us-ascii?Q?ZPVbR1GfKR9XUY/4EcHAuDqTZ3jr6cf27SD+AHNHDdI9jPoCt9/vJjxs0M2H?=
 =?us-ascii?Q?CeBaFB6/2Cv8K+J4GU3mujbXwZmsjIdSS6qxlwO6V21RSqfJuSqWNuZ9vV4F?=
 =?us-ascii?Q?bBVk8DYDJQZfjRhmneNPI2rhRTKY4mOOZtkCkPY35Hmv0fCXkHa14tw0cACt?=
 =?us-ascii?Q?Wl2Io3SAOPOlhT4DQia+bnJOgRJ96+mlhgALvP6jazEx2SsfMFMIXzyn63m1?=
 =?us-ascii?Q?SvMkIjKnCry4qOLMvmn2vLUPu0D4tmQijlBEYDc7VPPxMEIMRLNiKKwl1PI/?=
 =?us-ascii?Q?hvcz0vz2B6BkHuE0VqKuKTiAUKbqTWjbsw0AOd4eTJFzIwaaxTL2HWMikJgv?=
 =?us-ascii?Q?/slWGWHYJOZUyO6k1D4RhXAVez8INTIN87ZUth+rTWrZ4+mdBZUwvPWCeHli?=
 =?us-ascii?Q?46xqL8wq5WtSqqDxQncLreLSwMCL4EoWi/rtqhkn1BlHjkyNL53hCuvthfRW?=
 =?us-ascii?Q?ZUqdOi68RJi3h+tr61e8s3XSJt3FKm9iAT9+WwrpAmG30ywgedn8f29WVrsD?=
 =?us-ascii?Q?TSBi5SKXLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afaea39e-9f50-4aec-2a4f-08de4e782984
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:38:33.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr8FJz+sApO2VvaJiQ57/DV5EMaEcmoHixiKCMP4BvfswxcK/xSoIl+X9dXQI083u3d45cffL4i3xWRmWnp/UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
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
v1:
  - Update HMM_PFN_ORDER_SHIFT
  - Handle hmm_vma_handle_absent_pmd()
v2:
  - No change
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

