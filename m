Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617EEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 21:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF59710E60C;
	Thu, 27 Jul 2023 21:38:09 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31BC10E60C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 21:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690493887; x=1722029887;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/QxKcSRFMyned+QWih9rWmA6zKQCWtRzXmEqJHzLYLI=;
 b=T8IIWpPZFVrDJlRciMI0LFAT00bZqy2rG7+7OGV87BPLLkv6dw2K5z6s
 3kDcuC8IZWbHGlj7tQ+Q0wOSFpxPllA46Y7KLSSuVrSCLXkyVnuctm4s8
 Du0yidq2YTqj4po+oaJz4JknK+ihZQO98u5kFNiYTxVPUNJFK72wV8alS
 +Y/05jbBu8UURITD7PjB0awUNpHoZaThh1XTEygWW4BH/xzbXBdprOky7
 U/UU4xA/v64kCdk+8N545nFfFzB4i0zhL8eIfxusQTDzdxJH5lIDOGYAB
 zKDxw6EndXHYtW9xHkUJ2QGuaCzFjvofwKubSSPSkTfGMpXXgrApsSXtJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353346732"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="353346732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 14:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727159915"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="727159915"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 14:38:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 14:38:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 14:38:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 14:38:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 14:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo2ARECQ9AN5Gjvk4cIaajZgehE+Ue0hd5W3UqdMg2f6+vNHYCwwTF6uNyeLy4Nd6s0hwlwy9iCFdswLOxd6cBkHXaWGu/ialAjt/pUyOlx4Mir7fg0MmuiC1mi+2LvTZHrLnf4sdbNT8eDte4jJKV4qDMquejCvJ3LFvUgiUpyxyaaWv8CbNHTGMhdX0VMkKTWp6LLtfUhbziEj3yZzK0DQCznQ+GY/FD2HxazpiNWimkV6gURlqpTm+uzWcCS0MTaGCQq47G8dw229dLtRYu/4Xjnt0Qj5vcgwvBfk0fqoHIoOFav7V1tG7H49iLeBOug8Oq3IUV8v44xt0oxd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX9dOl80ay4wyzLXCGL+pxzoX1CBkvLEEd0X1ua9zCU=;
 b=PSChlmg22sOdUB+MTJThXjLL7vPEUsbJwFdrdCNp6WNf4IQUlws2gqlr0p95T2IQg/LFFOBoaVGL+dpYsRIXEhoRGisdVFlo0ycg0KQdi8xWJ4UUX4NlpgcgB7r3kEZ8tsVxdJQv5v+LK+G0QGXkUY0hGUoRT6ZU8vjCpOvFkXa07UfZKSG30ZGtNHr1sLnzHJdkufBvPI6sIKpI9Te5EsOu6UEGg8FGl4aTOkjT2Ui0NfMvXj9MPHF7In806ShS6v3GkDdkxlACG3iq+GNqbPVDrUZzgyfjdMcUxBPtmtEnvMX+nDAOIIR43QDw/glTYvcSVlkeY0IfQa/Bm6jC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 21:38:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 21:38:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 17:37:45 -0400
Message-ID: <20230727213745.430938-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: ce31c661-9553-4257-7801-08db8ee9c231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2357TLJIEw5tf3deS880KRXZMuAoWKlA3pr9LXu2lcrVCCr1hycH4/5qljYOzYRuoqjhYESDiYDPI7ixyKlivVtDeG0EJNUddDgjzMlA8hRYoAO5ZJHREICa3oYefq7bwZUnNlpBlTZ01oL4PTfHGAY4cwYoB745uATy/dwDAeRbJmaoxKlR4GOYBSiBdOKQh8p0HNoM6Ac078VNgs3nmbK1OXlqZBJoqIVSS4y7/oSojiZZcV+JvPG2uT7HCEC9ljxmCN/0BMJD3NhlTiJ2q4K9YFTFZXPeEM4hI2jhajrGQdRrBKFEove5cv6ecFfrDriQGg6ubO1v6ECNXWmakY8mwU18vFL+qQCCFBstkZDikUXQOKkvOyz6TUpktr81hNqjZR3dXQZ/Qt9U2BSuy8sPPnPDfPpKIrKLHxMjdlPonEZ2piE7wUWpcFwjeUZOTjk9zNBQkUaRkkUH3wN11csjNIvdIvW/vTTTsPOfkVyC/iMC7a8Aw836TaToHGTnfTbl8ZJLNZLf5r+NX7KRsb5QH8rBJrYWyJq4cRUazuG1vcQqFB09d6ApoSSbJRz9953gUjnZgrlYJgfgCMi31nZAqBhBnv/CELo8+RP3pM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199021)(82960400001)(6666004)(6486002)(478600001)(8676002)(316002)(41300700001)(6916009)(66556008)(2616005)(66476007)(66946007)(8936002)(5660300002)(4326008)(6512007)(186003)(83380400001)(26005)(6506007)(1076003)(107886003)(38100700002)(86362001)(2906002)(44832011)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hvXW5lnNkikfpbJhrUriXeZxOXQsJOalzV0fZz6iiV2usimJIcFXKoewPoWQ?=
 =?us-ascii?Q?v1FScMarAcS3+ghuxj+ovOESloRtlT0zgocOuZ7ZE83YjWeG97p7uXCbz0Tw?=
 =?us-ascii?Q?X0sGqxBF2zJmwu7HOQfegnsWUckW4/07gST4oWZpXNhhuyuCTaFWp+Ri27fe?=
 =?us-ascii?Q?y73qJGqAPcOmWDimGGkCMi18tiKZ+DiBVeoL8bll8roye57uapy0r+CfbEEE?=
 =?us-ascii?Q?awakBvfDscy0NRC2KPY2PdTiqT3x0BPI8vW4NuFEog0HYmBb3Ib2prxiGaGV?=
 =?us-ascii?Q?hToadnqhT2bKEZsPE4saqCtVzmUxn2qxE4kTzYZCS7DNe5vz1lo9vA+e6Cmd?=
 =?us-ascii?Q?dZwvnnEbr8edJ7nHB/Xitxbv+sdiNX0oy51PnfcgQwYLTCgW0MwaZhql8rTW?=
 =?us-ascii?Q?p51Xw12vS/FlcjDY0S+78bnqYsOkosMjxZDeZq4dHyc+gXIIOhhkX7wvNZ38?=
 =?us-ascii?Q?3uHY72Jz9LEYJbP66oQfvKW80n/Pp1hoDjoDbt6OH+8rVBmXV93rkJ/lbop3?=
 =?us-ascii?Q?Ab8yIHg1/qG/cFEiqBUlyA3xMLMUQzhKR9dDIcq+rGV1QutO/irkSnhXk9VO?=
 =?us-ascii?Q?sGWxk9nFamP41f1hQeDdU4HZiFnFDQDWkR1DZSUfDn0o5Y0oJUnCANd5BUdI?=
 =?us-ascii?Q?EwbjFj/+J/BYKUoNm98hZjcDzUjT1vzXuZ/Z+/Z8roTGif86PJVktgebtSZp?=
 =?us-ascii?Q?yFmwecs96Md4LsNHORN7XwxS5RMiw0f6M0PW/06eDA9Z27CZ7vBwF/nYYuB4?=
 =?us-ascii?Q?U0ZJe7SfT78fli/1VUptcbYbt1u6NVvqDLIz9KXJD4e8OKXh1fvp8gOr6hP0?=
 =?us-ascii?Q?NLuMv6q2AxxFqmCMZs0FKQWtC9MSIGTm+YTTJfqRKKwKHPKAFBFLAt21BeOJ?=
 =?us-ascii?Q?vh+PqsEiKKxEsqCbKIQwq2b9lZrqBeK3fO2OtswT8p0sTLqzKSJMxXg7UntS?=
 =?us-ascii?Q?mVhF9ciZ/+RpuEmFq6OqQBQhu6H7eOFPyp1t6K41VUfgDC5j2oJ7jq6M3ftT?=
 =?us-ascii?Q?v8lKqtk5heRP0QyHJZ3xIZ7GM8VavcNUaGgqBTNeHD4nUgccEAaXNnO+cjzF?=
 =?us-ascii?Q?6BGJY8LqmSVhIf1q5Gz3DtcRJhdU+t6d74MoTFq8bHmhGz7/QwZsJNMdZsuG?=
 =?us-ascii?Q?bjJO7vRjV59/8Aw2IH1puVnq+cqOcJ2W77T3lzStP67H6AWWGKb9u2LoyF5e?=
 =?us-ascii?Q?cc879mFJHc10UfDRStL94tVLlFWQFB0RfwcsNagh7AN46sOQNUv/No+CvE1U?=
 =?us-ascii?Q?acc7CnAqq4tWCTTxFPvzne8cCwDpPcDY0Fjvc4T/4hn0vBnRq4BAkOKHx8E/?=
 =?us-ascii?Q?r0dCjwgMocHjBwxsrRKB4aNOHcbrJUJ5i+wkFoCaDdTDRy8Pru6w3bzmRPhj?=
 =?us-ascii?Q?oLGQLTwE6FqMKbKjVYSQSMoBvOW65BrzQaIOV2j39P2g2fDO+bZdSxLP9GGD?=
 =?us-ascii?Q?eZePVJUy2kIsFgAsZoOJLFiAJz+Ak0DKGpGZD8WR6DDlN4A0R8legl5NeKhm?=
 =?us-ascii?Q?RhGugmEg0o3iTK4VZZu+fz4EMrwoR6WDP8H48rBYO+VTeUK8J+bst0dAmwIm?=
 =?us-ascii?Q?H5V5H0jSg/WsfBRTHgb1vJ5nOCphnEb121X9o37B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce31c661-9553-4257-7801-08db8ee9c231
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 21:38:04.3405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKBQ2C3xa5X+e7/mKHuWgbKgGuQtJd0Qvz/8y7k7Fg9oHsNpgCL6jSjN0CATjZNTgvOziozXdcoD/fRttAnKdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Fix and clarify PAT Index selection.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PAT selection here in the Xe driver had inherited a lot
of history from i915 and ended up with some strange cases
like doing logical 'or' with 0, or even unnecessarily selecting
pat_index = 7, instead of simply opting for the 0.

XXX: More work needs to be done in MTL and PVC for the right
selection, starting from the fact that pat_index = 2 is now the
uncached and pat_index = 3 is WB with some kind of coherence.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h      | 24 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c      | 10 +++++-----
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index b29750a47d23..8c80c0784010 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -37,10 +37,26 @@
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
 
-#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
-#define PPAT_CACHED_PDE                 0
-#define PPAT_CACHED                     BIT_ULL(7)
-#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
+/*
+ * PAT Index Mechanism
+ *
+ * Some bits encoded in the page table entries and directories,
+ * are put together to form the "PAT_INDEX". The value of
+ * PAT Index points to some cache options such as:
+ *
+ *   PAT_INDEX = 0 --> WB Cache
+ *   PAT_INDEX = 1 --> WC Cache
+ *   PAT_INDEX = 2 --> WT Cache
+ *   PAT_INDEX = 3 --> Uncached
+ *   (The full per-platform table can be found at xe_pat.c)
+ *
+ * The bits that form the PAT index for PPGTT are:
+ *   PTE     - [62][ 7][4][3]
+ *   PDE/PDP - [62][12][4][3]
+ */
+#define PPAT_INDEX			(BIT_ULL(62) | BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
+#define PPAT_WT				BIT_ULL(4) /* PAT_INDEX = 2 */
+#define PPAT_UNCACHED			GENMASK_ULL(4, 3) /* PAT_INDEX = 3 */
 
 #define XE_PTE_SHIFT			12
 #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index aad76a6a8094..5d33ee1aa3a0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -257,7 +257,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
+		flags = XE_PAGE_RW | XE_PAGE_PRESENT |
 			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
 
 		/*
@@ -465,7 +465,7 @@ static void emit_pte(struct xe_migrate *m,
 				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_DM;
 			}
-			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
+			addr |= XE_PAGE_PRESENT | XE_PAGE_RW;
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3129fdb0551c..20f2d1139e8c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -65,10 +65,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
+	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
 
 	if (level != XE_CACHE_NONE)
-		pde |= PPAT_CACHED_PDE;
+		pde &= ~PPAT_INDEX;
 	else
 		pde |= PPAT_UNCACHED;
 
@@ -86,17 +86,17 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 	if (unlikely(vma && xe_vma_is_null(vma)))
 		pte |= XE_PTE_NULL;
 
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
+	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
 
 	switch (cache) {
 	case XE_CACHE_NONE:
 		pte |= PPAT_UNCACHED;
 		break;
 	case XE_CACHE_WT:
-		pte |= PPAT_DISPLAY_ELLC;
+		pte |= PPAT_WT;
 		break;
 	default:
-		pte |= PPAT_CACHED;
+		pte &= ~PPAT_INDEX;
 		break;
 	}
 
-- 
2.41.0

