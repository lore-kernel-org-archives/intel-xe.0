Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F90EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 02:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9310E09C;
	Wed, 14 Jun 2023 02:49:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DBB10E09C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686710962; x=1718246962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6CNStuj+sipXoHPxKlPcaJVD153so63HaFaFN55q+wQ=;
 b=jye/BF5CkXzEIRwiscUg/EdcUTrEG9baOog3fCX5orGbgMPxJig/59lT
 VfpHIYpH3DBYaYsmrgWE4pQYKL51Js7IGBIy0RqTNA0cmV+SGnnXHadf+
 WTQhpxFu8sKTFe3HvtAg+IiU/pIy1q0I4Lv6lcs38NDOPyooiJcW+/M4R
 WV9mAPpoepTyKPoWW5SEOgTT2zs49+WqY6u5GOe0bbW7jF3pFX3YRZ7z4
 INPVLW7wwuv9GyMNplC/HBELlXVVoCuz0F8HGfGr4xVX8hAPwJT1IilP6
 ltLRCzSTBALiSVRLc3cNcnxyRKwNlDtuAbLX82D+/shTRvti2kGLY/gke g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="424387547"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; d="scan'208";a="424387547"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 19:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781922741"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; d="scan'208";a="781922741"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2023 19:49:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 19:49:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 19:49:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 19:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiBOam2Q1w8TBO6kt7IZyHRbRChvqfu6L0Dg0ryjr9x3JyB6R1yuYxoz8ATFyatf4XcVydLZQDi0xCwxpqeYQfIRYx7zaQR87nMEI3LGMB18tSyMWjyoTWMNad8sA9Hk8CRcT9ial1TLgvEEfaDnSBDSHgn/lto+ApX3Y6JpHIkhExLcuDuTPVTsnC7ROb43FuK6sWE7zev8st5JEGRc63ZdpoP9EefhfUNggaFBc9uRpUja9DzLPapUYEEmprK7Ps33NqqwRU4afz+y4EQO38uw1bQAE0l/TXPgLI3g8B24C2U4RgyS9ZJSZk07t3f5PDxV6Dn0teY5fQiV0NBz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyTMoj0ufXCIDli/8P4YP64qwp93jmrgS/8uL3FUop0=;
 b=IPfGdqFWuhD7f/ZGoOtenCXKiEZ2WoKhOipC3U8aDx8CixFk3l8FOmlRegOh0XO1UIMvEG2a5I4VUxFnSY0xYl6ohlMSDdxlJ9TCwC2WBBwadifvzuFKLHY9b+PkyE3v0pDQikqlaCibC4EPm6RRbClZQRfhdMO/10xQxERwSfTA1OdVsH2ZedNrhfbg65PVVLb+JCOjez3M8wZ/bKpwWi/wd8zxg2IpkCAPfb+e9kFFPdgkwNlT2vvIURwiI9RsFcnSzJRXGaxb26hUKGQ+2TEYIJjNa4b0Bs2waS3ntWtNFgHKj77VNgO/23sRAaxUPkERJjxpC0ik541+I0eN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 02:49:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 02:49:16 +0000
Date: Tue, 13 Jun 2023 19:49:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZIkqo4Mx6RkuJ5Nd@nvishwa1-DESK>
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230608050333.37581-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d19979-f214-403d-a9bc-08db6c81f184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHT+HCZeoznN1/QhRDFccK9YW7rG2C6a6L1Y5BRmgsQauawfMzTjcT023TRH4pPIpmcKIwaz6qmzHr/W1GQI1AmH+2qJzXtWzSXHTGgFYLBYRZQtTDk0sB8f8Pkre+huXcFQ9sLAx6UcqGpe8PEHaVlVoLr3I63OHCIod7caJ2NzxAaUV6NoWvVEX0DtgMSJ6nYEXYFOG8NK1G8BysWZLj7LgQaOurmuVoaW7+YYq2j5W7vF8PzbiDh2aY471l4fnFL8iVfOrIeTJpP7z6fFIrBjbIKr2+l/+nLKpfYHnONBsf3pEpt7jD9rtiQdrhUAuBfgI5pOwbi/7NKMT5Aeu3rbAUhUaxCfEKlbZyCEcSmiXE2In3oFTNvpyZumgfawGoJRzWati8YxYR0e29jtzY5orNeLe4RP2WoiQrEjMiGtALZvDrjUkyE0TToe0ROofm3igeLEotS5lq9cTVpcQAfSuFFSGaDB/asHMPrjgTDpIAeqRsgrtWSJEH/boSgUpEbw7MHoftXbiKoGTYUiB1iKIHSE3+n0jNsq1wZPCW5DuToYlWGa9XbQhEJuP3bj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(86362001)(38100700002)(8676002)(6862004)(5660300002)(82960400001)(316002)(44832011)(8936002)(33716001)(41300700001)(66556008)(66476007)(6636002)(4326008)(66946007)(83380400001)(186003)(478600001)(6506007)(9686003)(26005)(6512007)(107886003)(2906002)(30864003)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bb81tlxXQZzHnNRpAGDnJBIsw0luIuRkFbM9IX6vR5CMlUPlEt70yOYl5feU?=
 =?us-ascii?Q?qdUSguu5bfOEX/5Hp1l/h/8nn2Fmbuub3W20uMBSV14tGl6n/N7BR7LsknQw?=
 =?us-ascii?Q?IbSop8nl227Dc0fp/ZZWok5KskHswRndzMb5W1+6vGljnvEKDjBjb4KmBeQT?=
 =?us-ascii?Q?xddKSSvwimjokSfDev0gNwYkWPxuiZZOKnH/mptMmi44PPQptiPSLUGScM6d?=
 =?us-ascii?Q?+nSjgsgYaeVcQfEMpTKYBA0Si9vdWjinuBN0YIaLmHrfY6lBNE09Ti0VWpTy?=
 =?us-ascii?Q?pO/VROZXn8ScQRk8S0dqy/FWbOzCU73NqMNYewacQXppEXpTId/cDyWlvrj1?=
 =?us-ascii?Q?eD/+68QitVM0wBGi7VyuarLmLCvQKTrgI2Ul8hxHlPkrp2cjguFnDPs7gBQ3?=
 =?us-ascii?Q?wtj4wKTubSxvb4maBDMtX8f7g2w6uxWRDmjNpmdU5NoBm8iHBkBLJNuid0qb?=
 =?us-ascii?Q?9hHENS9p9K6FixaD9JsmfPH4LP9iuaVJbt2j48EJ7X5JCCdKJi0RxGk/RRLa?=
 =?us-ascii?Q?V8yZCNGcsRBsiMHXvTjPaOYzduLN1ZaTGWGybgUt33UJ9ObTYg5gCIVIJ5SN?=
 =?us-ascii?Q?LxHhB6iVAKRBgXa0U1ri+lnixF9nYyCnBKJV5djrnm6sch3IkwMjkjtf31F8?=
 =?us-ascii?Q?1bmqkkzrOHP8U1ZtE7sNUa0vwm/FGaOP2IGU3ALtKVlzeLtWtPBAL1b+JABH?=
 =?us-ascii?Q?UMPHdNcONi8oLvMp/kHQ2VW6m7m+TOF2gu9oySYFFF+ZrpkX4Bqw632+tBL2?=
 =?us-ascii?Q?MWbtrdSsPO7DGeSjettfae75FXlRr/KiqGSiHjM6BkXUueJu2sDOYxZDO71D?=
 =?us-ascii?Q?yiIzFugGovWxqzXUsfGbGe6nZHVuuUaz8z9kyvKGpu7h3oy2JLRYXPIAeZ+c?=
 =?us-ascii?Q?kW5pMBtg4b/PVBStRKjZrAbJKjaFXw1lizveMJwCiC5CtdR1ImRIusptnHhl?=
 =?us-ascii?Q?qoAJkMNrlZP6Yg6K481/WnfFSccbe0SHIpZunCOHKGi2on/f6jxXFgNrCwfx?=
 =?us-ascii?Q?hDCy+0Id70VUorhfByRKkAUws5/O2YaXS9VV+4dgsO4+m/hgu+3Eoyvk6J8K?=
 =?us-ascii?Q?JWE5/YO4xFPAQzFYi/mse5pubp5iIXDD4RFBKuoHvjToFQMtjOE1mC1KXgzf?=
 =?us-ascii?Q?wWPJ7xoQTSiGB2BgoTuDs/9V05hJgytajY0ENN2VFkTLPoC2sDJyTgfy8FEG?=
 =?us-ascii?Q?++ir7E7WN66sScE0SNMJfcjLyki6ZhiVdZhVnc3D7k4Lt9WytF4Hr6TL5+/M?=
 =?us-ascii?Q?v3AvcD6sFY4ECbTXLSEGd0aBAg+OvVQ3TV1VAx7XNeTTGHIEOM+kOT3ridau?=
 =?us-ascii?Q?mWerJ5vyULqqMxPO6S6UGFEAush58gNFmb7UtTa372kZUUe2c6IrZ/mabpAX?=
 =?us-ascii?Q?l9tH3JAnMXsV8NXlTPUGCGW0qAKBpKcmETCHe6GsqF6b1P2ITThWSkeN1NJB?=
 =?us-ascii?Q?djm4vgXQm7SJHNpEjXldhcLGL/Z//AwvkIbjjvLVpGLq1OylPzjHE8yDq9As?=
 =?us-ascii?Q?hlCbQPz5ClZFOpConjFsI8vDp89H77FkOBnH9mEN/tV2ZsEw7DQuzm9FJHbp?=
 =?us-ascii?Q?0DIl3uqBpCRPUA/+KEqdlsg3v2r0/CDi0I90m2qSiQiWg72wXUKaKAU/3bvd?=
 =?us-ascii?Q?62ZJQTLfV4WVHZ58PJf86c0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d19979-f214-403d-a9bc-08db6c81f184
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 02:49:16.4590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ba/lLcbqD4TSjrfWBQjtf1B7Y9eWzbYLgBGV+SyeIq4S4xyOvteZ8Be4r7qF0WdzQviLIKlBwZe68RX9/zZ/QyvlC/MA59/ngGfK4cUZvkGGZnqjZx4SrrUzkD3+fK1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 10:03:33PM -0700, Matthew Brost wrote:
>Add uAPI and implementation for NULL bindings. A NULL binding is defined
>as writes dropped and read zero. A single bit in the uAPI has been added
>which results in a single bit in the PTEs being set.
>
>NULL bindings are indended to be used to implement VK sparse bindings,
>in particular residencyNonResidentStrict property.
>
>Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.h           |  1 +
> drivers/gpu/drm/xe/xe_exec.c         |  2 +
> drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
> drivers/gpu/drm/xe/xe_pt.c           | 71 +++++++++++++++------
> drivers/gpu/drm/xe/xe_vm.c           | 95 ++++++++++++++++++----------
> drivers/gpu/drm/xe/xe_vm.h           | 12 +++-
> drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
> include/uapi/drm/xe_drm.h            |  8 +++
> 8 files changed, 138 insertions(+), 56 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>index dd3d448fee0b..3a148cc6e811 100644
>--- a/drivers/gpu/drm/xe/xe_bo.h
>+++ b/drivers/gpu/drm/xe/xe_bo.h
>@@ -61,6 +61,7 @@
> #define XE_PPGTT_PTE_LM			BIT_ULL(11)
> #define XE_PDE_64K			BIT_ULL(6)
> #define XE_PTE_PS64			BIT_ULL(8)
>+#define XE_PTE_NULL			BIT_ULL(9)
>
> #define XE_PAGE_PRESENT			BIT_ULL(0)
> #define XE_PAGE_RW			BIT_ULL(1)
>diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>index e44076ee2e11..4f7694a29348 100644
>--- a/drivers/gpu/drm/xe/xe_exec.c
>+++ b/drivers/gpu/drm/xe/xe_exec.c
>@@ -120,6 +120,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> 	 * to a location where the GPU can access it).
> 	 */
> 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
>+		XE_WARN_ON(xe_vma_is_null(vma));
>+

Also return error here?

> 		if (xe_vma_is_userptr(vma))
> 			continue;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>index 73db7f7c0381..6faebd02f3fb 100644
>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>@@ -533,8 +533,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>
> 	trace_xe_vma_acc(vma);
>
>-	/* Userptr can't be migrated, nothing to do */
>-	if (xe_vma_is_userptr(vma))
>+	/* Userptr or null can't be migrated, nothing to do */
>+	if (xe_vma_has_no_bo(vma))
> 		goto unlock_vm;
>
> 	/* Lock VM and BOs dma-resv */
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 39ec94549439..265ee45bee5c 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -81,7 +81,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> 			   size_t page_size, bool *is_vram)
> {
>-	if (xe_vma_is_userptr(vma)) {
>+	if (xe_vma_is_null(vma)) {
>+		return 0;

NIT....no need of if-else.
if (xe_vma_is_null(vma))
      return 0;

if (xe_vma_is_userptr(vma)) {
...

>+	} else if (xe_vma_is_userptr(vma)) {
> 		struct xe_res_cursor cur;
> 		u64 page;
>
>@@ -559,6 +561,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
> 	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> 		return false;
>
>+	/* null VMA's do not have dma adresses */
>+	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
>+		return true;
>+
> 	/* Is the DMA address huge PTE size aligned? */
> 	size = next - addr;
> 	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
>@@ -575,6 +581,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
> {
> 	struct xe_res_cursor curs = *xe_walk->curs;
>
>+	/* null VMA's do not have dma adresses */
>+	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
>+		return true;
>+

But the addr (vma->start) and size still need to align with SZ_64K right?

> 	if (!IS_ALIGNED(addr, SZ_64K))
> 		return false;
>
>@@ -631,12 +641,29 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> 	/* Is this a leaf entry ?*/
> 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
> 		struct xe_res_cursor *curs = xe_walk->curs;
>+		u64 pte = 0;
>+		bool is_null = xe_walk->pte_flags & XE_PTE_FLAG_NULL;
>
> 		XE_WARN_ON(xe_walk->va_curs_start != addr);
>
>-		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
>-					xe_walk->cache, xe_walk->pte_flags,
>-					level);
>+		if (is_null) {
>+			pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>+			if (xe_walk->pte_flags & XE_PTE_FLAG_READ_ONLY)
>+				pte &= ~XE_PAGE_RW;
>+
>+			if (level == 1)
>+				pte |= XE_PDE_PS_2M;
>+			else if (level == 2)
>+				pte |= XE_PDPE_PS_1G;
>+
>+			pte |= XE_PTE_NULL;

This somehow can be combined in __gen8_pte_encode without duplicating
code here?

>+		} else {
>+			pte = __gen8_pte_encode(xe_res_dma(curs) +
>+						xe_walk->dma_offset,
>+						xe_walk->cache,
>+						xe_walk->pte_flags,
>+						level);
>+		}
> 		pte |= xe_walk->default_pte;
>
> 		/*
>@@ -654,7 +681,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> 		if (unlikely(ret))
> 			return ret;
>
>-		xe_res_next(curs, next - addr);
>+		if (!is_null)
>+			xe_res_next(curs, next - addr);
> 		xe_walk->va_curs_start = next;
> 		*action = ACTION_CONTINUE;
>
>@@ -761,24 +789,29 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> 		xe_walk.cache = XE_CACHE_WB;
> 	} else {
>-		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>+		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> 			xe_walk.cache = XE_CACHE_WT;
> 		else
> 			xe_walk.cache = XE_CACHE_WB;
> 	}
>-	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
>+	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>
> 	xe_bo_assert_held(bo);
>-	if (xe_vma_is_userptr(vma))
>-		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
>-				&curs);
>-	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>-		xe_res_first(bo->ttm.resource, vma->bo_offset,
>-			     vma->end - vma->start + 1, &curs);
>-	else
>-		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
>-				vma->end - vma->start + 1, &curs);
>+
>+	if (!xe_vma_is_null(vma)) {
>+		if (xe_vma_is_userptr(vma))
>+			xe_res_first_sg(vma->userptr.sg, 0,
>+					vma->end - vma->start + 1, &curs);
>+		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>+			xe_res_first(bo->ttm.resource, vma->bo_offset,
>+				     vma->end - vma->start + 1, &curs);
>+		else
>+			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
>+					vma->end - vma->start + 1, &curs);
>+	} else {
>+		curs.size = vma->end - vma->start + 1;
>+	}
>
> 	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
> 				&xe_walk.base);
>@@ -967,7 +1000,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>
> 	if (xe_vma_is_userptr(vma))
> 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>-	else
>+	else if (!xe_vma_is_null(vma))
> 		dma_resv_assert_held(vma->bo->ttm.base.resv);
>
> 	dma_resv_assert_held(&vm->resv);
>@@ -1330,7 +1363,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
> 				   DMA_RESV_USAGE_KERNEL :
> 				   DMA_RESV_USAGE_BOOKKEEP);
>
>-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
>+		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> 			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> 					   DMA_RESV_USAGE_BOOKKEEP);
> 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
>@@ -1647,7 +1680,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> 				   DMA_RESV_USAGE_BOOKKEEP);
>
> 		/* This fence will be installed by caller when doing eviction */
>-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
>+		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
> 			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> 					   DMA_RESV_USAGE_BOOKKEEP);
> 		xe_pt_commit_unbind(vma, entries, num_entries,
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 94fc9c330235..f7629db275f9 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -590,7 +590,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> 		goto out_unlock;
>
> 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
>-		if (xe_vma_is_userptr(vma) || vma->destroyed)
>+		if (xe_vma_has_no_bo(vma) || vma->destroyed)
> 			continue;
>
> 		err = xe_bo_validate(vma->bo, vm, false);
>@@ -843,6 +843,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> 				    u64 bo_offset_or_userptr,
> 				    u64 start, u64 end,
> 				    bool read_only,
>+				    bool is_null,
> 				    u64 tile_mask)
> {
> 	struct xe_vma *vma;
>@@ -868,8 +869,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> 	vma->vm = vm;
> 	vma->start = start;
> 	vma->end = end;
>+	vma->pte_flags = 0;
> 	if (read_only)
>-		vma->pte_flags = XE_PTE_FLAG_READ_ONLY;
>+		vma->pte_flags |= XE_PTE_FLAG_READ_ONLY;
>+	if (is_null)
>+		vma->pte_flags |= XE_PTE_FLAG_NULL;
>
> 	if (tile_mask) {
> 		vma->tile_mask = tile_mask;
>@@ -886,23 +890,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> 		vma->bo_offset = bo_offset_or_userptr;
> 		vma->bo = xe_bo_get(bo);
> 		list_add_tail(&vma->bo_link, &bo->vmas);
>-	} else /* userptr */ {
>-		u64 size = end - start + 1;
>-		int err;
>+	} else /* userptr or null */ {

NIT, may be 'else if (!is_null)' saves one identation level below.

>+		if (!is_null) {
>+			u64 size = end - start + 1;
>+			int err;
>
>-		vma->userptr.ptr = bo_offset_or_userptr;
>+			vma->userptr.ptr = bo_offset_or_userptr;
>
>-		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
>-						   current->mm,
>-						   vma->userptr.ptr, size,
>-						   &vma_userptr_notifier_ops);
>-		if (err) {
>-			kfree(vma);
>-			vma = ERR_PTR(err);
>-			return vma;
>+			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
>+							   current->mm,
>+							   vma->userptr.ptr, size,
>+							   &vma_userptr_notifier_ops);
>+			if (err) {
>+				kfree(vma);
>+				vma = ERR_PTR(err);
>+				return vma;
>+			}
>+
>+			vma->userptr.notifier_seq = LONG_MAX;
> 		}
>
>-		vma->userptr.notifier_seq = LONG_MAX;
> 		xe_vm_get(vm);
> 	}
>
>@@ -942,6 +949,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> 		 */
> 		mmu_interval_notifier_remove(&vma->userptr.notifier);
> 		xe_vm_put(vm);
>+	} else if (xe_vma_is_null(vma)) {
>+		xe_vm_put(vm);
> 	} else {
> 		xe_bo_put(vma->bo);
> 	}
>@@ -1024,7 +1033,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> 		list_del_init(&vma->userptr.invalidate_link);
> 		spin_unlock(&vm->userptr.invalidated_lock);
> 		list_del(&vma->userptr_link);
>-	} else {
>+	} else if (!xe_vma_is_null(vma)) {
> 		xe_bo_assert_held(vma->bo);
> 		list_del(&vma->bo_link);
>
>@@ -1391,7 +1400,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> 	while (vm->vmas.rb_node) {
> 		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
>
>-		if (xe_vma_is_userptr(vma)) {
>+		if (xe_vma_has_no_bo(vma)) {
> 			down_read(&vm->userptr.notifier_lock);
> 			vma->destroyed = true;
> 			up_read(&vm->userptr.notifier_lock);
>@@ -1400,7 +1409,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> 		rb_erase(&vma->vm_node, &vm->vmas);
>
> 		/* easy case, remove from VMA? */
>-		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
>+		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
> 			xe_vma_destroy(vma, NULL);
> 			continue;
> 		}
>@@ -2034,7 +2043,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>
> 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
>
>-	if (!xe_vma_is_userptr(vma)) {
>+	if (!xe_vma_has_no_bo(vma)) {
> 		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
> 		if (err)
> 			return err;
>@@ -2643,6 +2652,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> 					  lookup->start - 1,
> 					  (first->pte_flags &
> 					   XE_PTE_FLAG_READ_ONLY),
>+					  (first->pte_flags &
>+					   XE_PTE_FLAG_NULL),
> 					  first->tile_mask);
> 		if (first->bo)
> 			xe_bo_unlock(first->bo, &ww);
>@@ -2675,6 +2686,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> 					 last->end,
> 					 (last->pte_flags &
> 					  XE_PTE_FLAG_READ_ONLY),
>+					 (last->pte_flags & XE_PTE_FLAG_NULL),
> 					 last->tile_mask);
> 		if (last->bo)
> 			xe_bo_unlock(last->bo, &ww);
>@@ -2742,7 +2754,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> 		      *next;
> 	struct rb_node *node;
>
>-	if (!xe_vma_is_userptr(vma)) {
>+	if (!xe_vma_has_no_bo(vma)) {
> 		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
> 			return ERR_PTR(-EINVAL);
> 	}
>@@ -2751,7 +2763,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> 	while ((node = rb_next(node))) {
> 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> 			__vma = to_xe_vma(node);
>-			if (!xe_vma_is_userptr(__vma)) {
>+			if (!xe_vma_has_no_bo(__vma)) {
> 				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> 					goto flush_list;
> 			}
>@@ -2765,7 +2777,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> 	while ((node = rb_prev(node))) {
> 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> 			__vma = to_xe_vma(node);
>-			if (!xe_vma_is_userptr(__vma)) {
>+			if (!xe_vma_has_no_bo(__vma)) {
> 				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> 					goto flush_list;
> 			}
>@@ -2824,21 +2836,23 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
>
> 	switch (VM_BIND_OP(op)) {
> 	case XE_VM_BIND_OP_MAP:
>-		XE_BUG_ON(!bo);
>-
>-		err = xe_bo_lock(bo, &ww, 0, true);
>-		if (err)
>-			return ERR_PTR(err);
>+		if (bo) {
>+			err = xe_bo_lock(bo, &ww, 0, true);
>+			if (err)
>+				return ERR_PTR(err);
>+		}
> 		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
> 				    addr + range - 1,
> 				    op & XE_VM_BIND_FLAG_READONLY,
>+				    op & XE_VM_BIND_FLAG_NULL,
> 				    tile_mask);
>-		xe_bo_unlock(bo, &ww);
>+		if (bo)
>+			xe_bo_unlock(bo, &ww);
> 		if (!vma)
> 			return ERR_PTR(-ENOMEM);
>
> 		xe_vm_insert_vma(vm, vma);
>-		if (!bo->vm) {
>+		if (bo && !bo->vm) {
> 			vm_insert_extobj(vm, vma);
> 			err = add_preempt_fences(vm, bo);
> 			if (err) {
>@@ -2872,6 +2886,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> 		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
> 				    addr + range - 1,
> 				    op & XE_VM_BIND_FLAG_READONLY,
>+				    op & XE_VM_BIND_FLAG_NULL,
> 				    tile_mask);
> 		if (!vma)
> 			return ERR_PTR(-ENOMEM);
>@@ -2897,11 +2912,12 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> #ifdef TEST_VM_ASYNC_OPS_ERROR
> #define SUPPORTED_FLAGS	\
> 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
>-	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
>+	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
>+	 XE_VM_BIND_FLAG_NULL | 0xffff)
> #else
> #define SUPPORTED_FLAGS	\
> 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
>-	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
>+	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
> #endif
> #define XE_64K_PAGE_MASK 0xffffull
>
>@@ -2949,6 +2965,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> 		u32 obj = (*bind_ops)[i].obj;
> 		u64 obj_offset = (*bind_ops)[i].obj_offset;
> 		u32 region = (*bind_ops)[i].region;
>+		bool is_null = op &  XE_VM_BIND_FLAG_NULL;
>
> 		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
> 		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
>@@ -2982,8 +2999,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> 		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
> 				 XE_VM_BIND_OP_PREFETCH) ||
> 		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
>+		    XE_IOCTL_ERR(xe, obj && is_null) ||
>+		    XE_IOCTL_ERR(xe, obj_offset && is_null) ||
>+		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
>+				 is_null) ||
> 		    XE_IOCTL_ERR(xe, !obj &&
>-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
>+				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
>+				 !is_null) ||
> 		    XE_IOCTL_ERR(xe, !obj &&
> 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> 		    XE_IOCTL_ERR(xe, addr &&
>@@ -3389,6 +3411,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> 	int ret;
>
> 	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
>+	XE_WARN_ON(xe_vma_is_null(vma));

return error?

> 	trace_xe_vma_usm_invalidate(vma);
>
> 	/* Check that we don't race with page-table updates */
>@@ -3451,8 +3474,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> 	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
> 		struct xe_vma *vma = to_xe_vma(node);
> 		bool is_userptr = xe_vma_is_userptr(vma);
>+		bool is_null = xe_vma_is_null(vma);
>
>-		if (is_userptr) {
>+		if (is_null) {
>+			addr = 0;
>+		} else if (is_userptr) {
> 			struct xe_res_cursor cur;
>
> 			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
>@@ -3463,7 +3489,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> 		}
> 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> 			   vma->start, vma->end, vma->end - vma->start + 1ull,
>-			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
>+			   addr, is_null ? "NULL" : is_userptr ? "USR" :
>+			   is_vram ? "VRAM" : "SYS");
> 	}
> 	up_read(&vm->lock);
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index 372f26153209..38731e200813 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -115,11 +115,21 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
> 	}
> }
>
>-static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>+static inline bool xe_vma_is_null(struct xe_vma *vma)
>+{
>+	return vma->pte_flags & XE_PTE_FLAG_NULL;
>+}
>+
>+static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> {
> 	return !vma->bo;
> }
>
>+static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>+{
>+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>+}
>+
> int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>
> int xe_vma_userptr_check_repin(struct xe_vma *vma);
>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>index 6daddd29d416..f775bafe4619 100644
>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>@@ -31,6 +31,7 @@ struct xe_vma {
> 	u64 end;
> 	/** @pte_flags: pte flags for this VMA */
> #define XE_PTE_FLAG_READ_ONLY		BIT(0)
>+#define XE_PTE_FLAG_NULL		BIT(1)
> 	u32 pte_flags;
>
> 	/** @bo: BO if not a userptr, must be NULL is userptr */
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 0ebc50beb5e5..39a1ce89732f 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -456,6 +456,14 @@ struct drm_xe_vm_bind_op {
> 	 * than differing the MAP to the page fault handler.
> 	 */
> #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>+	/*
>+	 * When the NULL flag is set, the page tables are setup with a special
>+	 * bit which indicates writes are dropped and all reads return zero.  In
>+	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
>+	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>+	 * intended to implement VK sparse bindings.
>+	 */
>+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
>

Are we aligned with GPUVA manager uapi here? I haven't paid attention recently,
but they had a GPUVA region abstraction for this sparse binding.
That allowed user to mark a VA region as sparse and vma/s can be allocated
there, but once unbound, it automatically goes back to being sparse
(read 0, write discard) which user having to explicitly manage it.
This probably will also remove vma_is_null() checks sprinkled at many places here.
Any thoughts?

Niranjana

> 	/** @reserved: Reserved */
> 	__u64 reserved[2];
>-- 
>2.34.1
>
