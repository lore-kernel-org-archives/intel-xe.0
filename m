Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E5C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D21510E3C2;
	Thu, 15 Aug 2024 22:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhztruRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C010E3C2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759659; x=1755295659;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=oY7GikP4VB+7mGkDQRJzLMSucMowzbrqy3TrcLBI+TM=;
 b=RhztruRsCF2HnFXGzs0QqCeMYmoslIMjb8cTEVHjo81/lYixzWXWdWRe
 4e2HPANIjEx100HbNfMfo159wcLiloVyc5O8He96SGZDHxNRFtZRNxZ3R
 9s5Ita0J+LAdB/psfzEhuKIxS/kPVEiEFul7FvMaLgve4IGXDhjkHY8+y
 csQ7fjfQVQ7BpBnZYoja1G3TClwO1VHrLiyarHEMWnOFCZGpTWqYVyntZ
 K67HRGQNI5KJqz230JT6CrnOuJQ9MZcoRAeu4KU8CaltH4u2vMqC9DqxE
 jJ/9JzpCQ2YSF1SPDrM7NWQU9XpjUmbnUPgg+kS4OULUlfeNX27kwMXyp g==;
X-CSE-ConnectionGUID: 3FR/n2aRShm+1n4ReZitxA==
X-CSE-MsgGUID: OjkFXwOVQLm4aaZtCziksQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24943192"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="24943192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:38 -0700
X-CSE-ConnectionGUID: SGRNMsqNS3GYbRHT2Cxzyw==
X-CSE-MsgGUID: KDM1UEjURIqf+ncmjENbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64335893"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZdTCwlrqJ9K1sNEQKvw03P/HVQwfnyf+oX3gWjggcndRMYIvW5qyFQfB/X8F2ruKghpwWxjdzzgfR987D2AYzgbctHjZplxW/dpHogvG1KYcIoxNq3MFyvdiNNKZrPWFl1U3CYoCtmCUZWq2B3gTVS6DefnAvGXH4yja3Q8bA8hFqgTPx81eDWOT5cUFhY/Wxnfe+vJmZ9O/khlgIT2JVs/RAbSvihPBJAyLhNaqISt8Apqmpxp/baYvAGmByQD+dadvIH/SHbph+Z0iYr/NtW1okUE9q8RVQCdX1b30RyFMls7V0PWNIZEeS6UYGRpjnzEe0noQ+NqYULPic8nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTPH5dK8I3jM9O3uMkkTsyiDpR9IEQb2qCEtodyYhr8=;
 b=lucKIlYVzKpG2Kmn080qP2oQNm8ZFaeGwnP4ByLfJxuK9e08RvHDw0ClrO46gq2MpTMaE0zZoDKcLyYGAB+54RaCxKozHnEr/9aDz73Sy10YA6nDE7IUNCSeSrpPCqdXnrVHGZpes1SIJahb30XcQSRTn0Gn4Gmyf/w9pyt3Fd71P0aFMl42JTJ4n2qr3zB2YYuOD3ZudmAZ4+0z0ynQTpkwOT05cLxY4xh6O9XhJWDFJDQXtTQaRoJl/CXVrD0LtBPIgV8gsEagjNlBw1E44siPXKIqTQjYQHC0FetqyFHHhVAjxKsY2XkTyVpQQuMOv0/HcYodEdPgoJBs0wzFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Date: Thu, 15 Aug 2024 18:07:21 -0400
Message-ID: <20240815220732.49675-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:a03:333::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a6024f-bf5f-4430-be4b-08dcbd76ab1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g65SEp3pN/1bRP95ZF39CcaYHmDrj0VO1DmuC5uExW8CecCgsmbvjgTSlCBh?=
 =?us-ascii?Q?zQXp0K0U+NHCqLDTPSY8VRqFh5vFrr+y/ywEX/RWuttG2bwvUUID11UlFm/n?=
 =?us-ascii?Q?bZVEgtoE0c2IcYktInaqzAVgJs7Rju9P+cW7qNnk190U4+veJg81TxybIxdo?=
 =?us-ascii?Q?rzh3Mg9qS/wN1+T7igZI14EEMc72oLen+ikNjvw1EPrlSfDoONcmIcaRTRlA?=
 =?us-ascii?Q?/KoP6Y5sNTV/Q9sa4Fj5dx9UHo8Heb8PfUW4WZirYY4lMk1byvGbrBEgP+oX?=
 =?us-ascii?Q?8s7oqVMwlYZPndxQT17rwBfcpUSHY84b9qDie6J/YoiLd9GyAHVp5Ftt1No4?=
 =?us-ascii?Q?Ng7s0fLB3jw9Cw409Hf5NsDCwbC/64nlNgHW02oWWjATVKdMzbCDlkYk6jXh?=
 =?us-ascii?Q?7Q3+8eHG56aDOt2Um5R5Q1j23W+MXN4kpwRfBV1E8Ua3bzi7fZFF2G0+NmOv?=
 =?us-ascii?Q?u39BtamFo5wtFMpfvG+QKMmgYLvbpxFUGsPKRh1PydLJoOX5Ix0GYQQLxR3j?=
 =?us-ascii?Q?mU0NJ48OHKzvPcDoTck6s2AI0T21owXG87+zwfTVYl3h+qX9JhLkS0NZ2xaK?=
 =?us-ascii?Q?BhXwjDfiFHjzTT+yrHwejqWnKKQx+ugqwTjbNKcq9dik20YxyoClT/1frPG/?=
 =?us-ascii?Q?+nq53PLScdBsa44gzBUcGeFxpsRs3D25qpDDLJ15i+ZjV75DFdGfqwyNxACw?=
 =?us-ascii?Q?7ClRKUZAauqCCZBeU5kw8/5o4fUFu4xy3WY/3oOG1Tu0n5rVLqRPbbmxd+JI?=
 =?us-ascii?Q?BrSzp+wDpfzZjbVMcdzw+CrCe3+VBo2yoU7ZAZjK6wpjgEv99+JQh4fDgZIU?=
 =?us-ascii?Q?D5+exL5EC6TNfsXpj/6eSLdYFWmc3o4MNwUNZiYEL4mHqgnEnl/JqU6O3GhL?=
 =?us-ascii?Q?tZPTNSgtVZaPy5P7UgXhF2c+u+aoyoAIUTnzun0OPfq9a2sMVaxNVWApCzZf?=
 =?us-ascii?Q?8E2iqGZwXlk/bzpOdZ+9R0jdZloc+YGghNajxFBMonFhlBwO0pKqBb1QbVbx?=
 =?us-ascii?Q?qG28W9wjbo94tIkal2eT33iC47EIkhQwlQqTBL8BbG4lstWCZLsr2UV/HlmT?=
 =?us-ascii?Q?131/6RUudJ3Xvc9JisuxrvYcr/MYy6Asc+cv9ADWzkCcBaO9d99XbcVpaH5z?=
 =?us-ascii?Q?0gYGNPdjcpktiREFwleKutU72oEcv0qj56wFtOXNlW27/NAch53wa0cDyRxS?=
 =?us-ascii?Q?kRN9UM4stqO4GU4eyygMDcBTXdFApDK3tquC4RC8ocT/PVZOah1E+hbjJFYo?=
 =?us-ascii?Q?pMfCXCVeXpZMMH/r+0cLyKilPqs1cj4uSiTBNXUk6XTu0+R6y6QZ1hQsmI7r?=
 =?us-ascii?Q?VyvRJWidEdb7CL1dxc4hCXqdIBTEs5qkeviwF1eLlNA73w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a8UbYjltmpuP/xxDRnv56fOE/jXMw32n21ylLlXyyO9o8hs9KsWbMHQHt8cP?=
 =?us-ascii?Q?180XadR+5Nf4oECIduuW1BbRVuHghcyGzEccUydlnJkFK1pt930wNjyPda1K?=
 =?us-ascii?Q?qzsx0Ut5I1+RH/+1Ctt66cpFfleeb3W7V117ELTniDe/HkuQEbe8te3sghgD?=
 =?us-ascii?Q?txdyb0gLU91et3LTH0B6XzlQtqv3TpaaBLUoZWF3KwgEM9UoZszo9STX1fQU?=
 =?us-ascii?Q?7WrU6Y07DDCKzVa8/xxPyrT45p9H16EIr+T1A062fndPjWcoBbTD+h4BMNC2?=
 =?us-ascii?Q?V0TmvBTX+/lTCFuMt46m8TgBLaP+kDeuVEGSTHTtmir2Lm7s9MRLFVxlFU03?=
 =?us-ascii?Q?L6jav/3AcGhn+SuwykjqzqesredMcpzymbL/x6Tuy/gXI14aeG9vlP4Xsvo6?=
 =?us-ascii?Q?t9YFDD3Z93AudKuDV2MN0XIOH5aiPuJJQ1CXxW5pgE9jhD9e2kfu4ggxVyIU?=
 =?us-ascii?Q?a3Cv2HUtl13uXf+kwBmdBq4gdRI5V6TOXocx02liilTmrnLYgq7oZwHq0KsW?=
 =?us-ascii?Q?+B93PpnRqxtpM46DX8FPMZCwuE6JzeqriIDL6rfwY8j2IaUoT6zHFLSdogvU?=
 =?us-ascii?Q?Ki8pRnvW9W9AG8cuOqr5o/wKulsAEmc+y/CaaE7eQA6+0zIxgf7KGlsYz07o?=
 =?us-ascii?Q?MzFH53HdLeFLFcP3p/D1AioSCaP2dM1E6UL8l5XXqi7vLZkBb+9BAPHA7/6P?=
 =?us-ascii?Q?4tJY9msDfXe9CsMSB3qUeY0BqVQcwZ6Uw3pf9NXXTFCW2oi66QSl2Im5ZHe4?=
 =?us-ascii?Q?Gl98tMute7Qlhwgn2fCvQ0d6v2v9UjIJQe5+SX2Ucerl2GG6iGBxv8oDysDy?=
 =?us-ascii?Q?/DCgUfFZmdEJCCR+tcBqBR2DsupaPcHIm+zrVwJ5BMf/f00ER7SmGTtlpNom?=
 =?us-ascii?Q?ik2g1J3ju2FC2eSA7X9lAj6L7hy/Br0zQTaJwDE+jAkLyUAQvZEDB0ERcGJ0?=
 =?us-ascii?Q?gh4gGT6bop4AnbVP7oOYuhqTeWTMqwVtekVd2RK97igyqKhaQFG1R2lYeR2a?=
 =?us-ascii?Q?MyRzpPvi3vUY7QGDkCwfIZxjc7vT69jd54eohFH3DVmTI2cI3mJm+jtTBbAb?=
 =?us-ascii?Q?z4DhLFRe3D+wmSx8QnWy9GxSv2XiSccyVzblc2IIeIolppurO1gcLssxUeb6?=
 =?us-ascii?Q?1typtov6p2PfEiGZ/+FRg8OqrKYUlVgnJ46godWwj650O9T+r6FBvMth+GH+?=
 =?us-ascii?Q?TYpwBZjcgER5N9813JkIpop8evSPBLpigO1y7sbWYLgn5+7sbUmFy22y2uQ9?=
 =?us-ascii?Q?sD9NtlKvA3j1OT5vqjOM0I1jQQP0IK7keKELwPCr11AZJUdlYnttd23+R4KP?=
 =?us-ascii?Q?KrcRzzEmzZmI4AIhNf5dCEtAInN0VHTdyPOxLrOkn3T2R5cVfzYztsSa7qH3?=
 =?us-ascii?Q?l9JZ1smxot79cuiv1U8zxj+pkLoJaODwMwcDa3KSc4r/0hlyz6eyhB45esxD?=
 =?us-ascii?Q?gq10qP+4/2FeDVKVTMBHWdT4oJXwE3hySOI0A15fPbtM2kJnCZk1YtJcmOnF?=
 =?us-ascii?Q?xNEijnacaaOVXfpbHL+xg4P7FhDrAoizO91lf+AXLEO0Pxrb33mVqPN5D8WT?=
 =?us-ascii?Q?DqCRzzs6mMpiJ4Y+V8czxJYCZ7vxtdflh5mIN3d+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a6024f-bf5f-4430-be4b-08dcbd76ab1c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:35.6421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGg3uBTmcRSZ20mBfu1jjs8GzMPLndLRR7F8m5Zm+Fg2QbEPfvDQ6acc+ZB255N1m1uqGAeXhaD75EkAROeNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
X-OriginatorOrg: intel.com
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

Apparently this was only useful when enabling ggtt support
for the very first time and never used again.
It is also not useful now that we have the ggtt_dump available
through debugfs.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
 drivers/gpu/drm/xe/xe_ggtt.h |  1 -
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..add14f3dea1f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -314,26 +314,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
-{
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
-	u64 addr, scratch_pte;
-
-	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
-
-	printk("%sGlobal GTT:", prefix);
-	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
-		unsigned int i = addr / XE_PAGE_SIZE;
-
-		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
-		if (ggtt->gsm[i] == scratch_pte)
-			continue;
-
-		printk("%s    ggtt[0x%08x] = 0x%016llx",
-		       prefix, (u32)addr, ggtt->gsm[i]);
-	}
-}
-
 static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 			      const struct drm_mm_node *node, const char *description)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 6a96fd54bf60..2546bab97507 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -12,7 +12,6 @@ struct drm_printer;
 
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
-- 
2.46.0

