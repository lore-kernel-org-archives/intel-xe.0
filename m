Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C6C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDEC10E1BC;
	Tue,  5 Aug 2025 03:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eY5J/zH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9210E1BC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754364437; x=1785900437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6I8V5prgzspYAKssfRJ1kL2tjfXl0/oipAQmDKeYiZo=;
 b=eY5J/zH/Y0skuYfB6xW3pzUTfYt4pmogNTcwLIxxp0kVW4NG0c1M8HlZ
 F8HGhV8IGb2PTkW/RchkGdUgRSLS/CfQdKRuWue91zYL9gWFmh5RpOKzV
 TW9MPRd+YU5cRsfrdwb3J8g7l/NJ4LRUbSp2joxvzO6/r/hkaI1iGvBEN
 VKH8uavW8lZNcd2QuL1LxPdqE3BAhehhPGl1ChjoTf+2gaIG5/mG8z7qA
 /NMgCSEL+KmwWwpSbBjj+vB6T37Np8+whOIYEwhRfON7W4Y+a038GO1sd
 gNXwdlr61q+On/VWhg7Y9q7t8esTXD4Fn6+4cUegHgTx4f1P72Jj8mxIH g==;
X-CSE-ConnectionGUID: XhroPq4nRnSIGq+6ABSJbw==
X-CSE-MsgGUID: xgk9As0XQMm4yDnYJvWV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56720074"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56720074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:27:15 -0700
X-CSE-ConnectionGUID: CNFMLP0hRJ2pUuEzgt8rVw==
X-CSE-MsgGUID: 31JxudATTwK30gwtKuVwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="195181821"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:27:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:27:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:27:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPw4O/Q4zNzIKGRLOUI/thPD6BzQJTjnGidK7mrZBEtxfVauLxrqGLdk74BaIlp9FHVak8wPOSg7T6wERHAopnwRqI9r7u+hA9xWF7kPFlflGJY5qF2pQKX5aNHKZupAWg/fc4bvh2cOJzB0NYTq3f/6BaOnvWi/OYp38dadZOiy0kb20IpTWhoW4cUxear0BGba3EKfw1iAK5RfrVQ+dwn/OjihYnLDHy/9Fq3B9A2vsfihw3l0TYcnHbEUDHrIelLukKgQZXr5L3DCegQOZjIHZvg6EpiAaN69bGcmyf/7LLG5cIuflm7Ultsd+PpEkb7Mv3dfoeAA3zJLqbpJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba7w+QMaCX2SoIg3lTBvdz4PTxF07XKwvahmvW9ovu0=;
 b=H5eBrjaTSvaE4T9sgEd5fPX0gZEivrtfxEY5mwRMdjWZMOcmNLWmMlNGvTUoJgyMR5BTLv8wViwI26Sq9WhqjQsTrjA6q42NN1D3dvxmpy/dMdqjfW5jheLoOZW+7LJCyhpASUV4rIh20tzoG9vt0wmAtpDLqPFhHUNJX0rOeH21bTEEz1lD9ZzY4JIAfhPeEXPmYz7IU9GPx/BJSf9ujgeCeRNfWHX0/69DmpVBlaGpEyrVo9eGK0INWNKQ4B/X1/TQVq1LNsv3Tk3oUaLSs5uY1beJnXwoEkHFuXaITcUYYiKnwuJgdcXfzFdxxehQk5+z7hV8QEOtiMaatacNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 03:27:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:27:11 +0000
Date: Mon, 4 Aug 2025 20:27:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/pagemap: Allocate folios when possible
Message-ID: <aJF6DG6o3HWByVuv@lstrano-desk.jf.intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
 <20250730142357.3851167-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730142357.3851167-5-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:303:87::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: b46f04f8-d8a5-4812-90d0-08ddd3cff6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v4yp1Op6l+ke8KUBR8nABrc8u76QYzJQGwLDquQ5yASj4cXROaakWmuPf+O2?=
 =?us-ascii?Q?MHsfdpA9RNoQkIUIILdGHaPZj3TvhPrE5WTaIz6PhPb/4/cIRnm6pDRimpBA?=
 =?us-ascii?Q?r+rFZJh7oemA9G/LDsZgwSaIPpyLw9Vqfgy+c2DzS0dRctrcFCmEjeUaP/yU?=
 =?us-ascii?Q?g5vE4LLoM2y5y9GDpZMpEqstWRLbkTNgBI6xsBd+Ezfa790S2f6XvaFSxEVd?=
 =?us-ascii?Q?2onbZaU5A5AozTHwVGJZd3pXLy8gTQEAeiRsH0xSMHLdM+9yNKnjJlrxVi49?=
 =?us-ascii?Q?5MD7b1mEwAJbBKX0Ck6fgB5BTQSctey0pC0Li68gXmq6NQ7EfVVP8cclnIPV?=
 =?us-ascii?Q?JSMueLa15bTyI0qN9kV0FKpbagKLBbi2s9yIrO/dp4PPZQv/91JamVzTLBy9?=
 =?us-ascii?Q?cwQT/bD+YQvA8VPauJp3jDeiUfiH8TgrSmNh0C5NkZpsePTdsjG9RQQ+3jnH?=
 =?us-ascii?Q?5FzleookxUjAZyQ/IMmbGarxO5mFprpl5LfOo0Wx02Xfxsp6lLY+B2ISniJp?=
 =?us-ascii?Q?VeCnke9ERGCqm9yJhg8Lf+1v4YipscwJTr7/2LijtZtUi3JON7m2TorAB4bn?=
 =?us-ascii?Q?YbF2IFqu0y1WUsyz8scVnL1rtLexyJhsIbYxCo/NOsrk7Z8KTLbc/v6vekO4?=
 =?us-ascii?Q?LEaYWK9QKdhGYk4aRCCWL81xSxffz79x/Me5Pk+mfS0BCHQbwK7nvEAKslcU?=
 =?us-ascii?Q?INRn3LEKJLYGLC2EmCE0FdBfGXdc8noJ0cxluXmZIlu9e1py+qJ0K/0+n7LN?=
 =?us-ascii?Q?Prc1Md55J3a3xfnXfbm9hk5XQKI6I5aRMzPjbG3WToRZpk030JnWa/OltgIT?=
 =?us-ascii?Q?i+mDbS+dKDlV8cBMIApuV4SH3gQVr0G/Vz+hnSqVjWSal2CrzbIh6gs+tVs8?=
 =?us-ascii?Q?h5EiQ5G98wnPk/7cOJBv8nGndsjLHc9GJhqcFuGVtob4PEouUMBPKkrKmean?=
 =?us-ascii?Q?Tx3rIxZGk1PsD4zijX7daFjV/bef0w3qjVZ3+9aFsaeMZsm8WKra9c5IiaX/?=
 =?us-ascii?Q?H02C5uw04OoKWZt9B6aS5vz1xtvj0HU3zanRvXyFujtFK5aNQKaZwlcoGoOQ?=
 =?us-ascii?Q?OX+BhKQKPnTiqboS/wmfaKvEtKgjEeKQRt34SvzFqFc7GLsh0x2mF48891Gi?=
 =?us-ascii?Q?AiVjYGqbfFAvmklRMdb5Ap3iK/YUkGYV2xgIP0Esj7lE/geLgAw/rU8Vibxr?=
 =?us-ascii?Q?7SeL5LwKngo3UzeLN+KNpI29tqxVB7Lq+I953/YAnnfM71Km4W4VCDrsdGAq?=
 =?us-ascii?Q?lFmxHyW+1+akhFYJ5tNN1/LhCagxVkV8Uw4duJg8Z4pfxBzuaUGyEk0BY9Ef?=
 =?us-ascii?Q?S1r3CNH0MzA5pfbt7b09YfCgmn3EMDK3wvNSMvWdZAJ8gBJjdU0NLQeWoEV0?=
 =?us-ascii?Q?3sjlGrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3sX1jvw3D8wJy/TrmFwvdRb6ycI8SQ3j1A8DFv5GFtSF2N42pc6cO4BWHt6?=
 =?us-ascii?Q?ErK5UemOFk3ww+UhSGaEKDqqAiVXS6SnhyyVNKzYgGQv7pCIp6xTGGuTDcBc?=
 =?us-ascii?Q?BrAwXnCV/GbtA/gmg1p8vJv3MbS53zk9DDzKkzUTV64/A2nuWKYkrA0Wf55w?=
 =?us-ascii?Q?tfTFhCm7oHy7ObQWf1tn/APYIPYUOQB/3Kax8iBT0ZmI2nVg3Ps1d6/ZDlyG?=
 =?us-ascii?Q?04x/uaBLheABeANXyseJIaYPyy4fsf+CgUA9qqT8hEBqj9EpjD4ObcZZAmdn?=
 =?us-ascii?Q?jsZb41WCCRM4MO5odeXCFq3Ua/MnFu3JIUY3/P2pnCif4pzi+aSN2U/RmzTw?=
 =?us-ascii?Q?VUDEwyUzXn9YgPq1ZQ0JGH3NQIrJ3oazQZoEHn50cQaRlwqCJd341dCpT4vN?=
 =?us-ascii?Q?hmbW/3/4MPhLw11kBfDo7V1AEM8HCbAE5eUsFQjO16ZSkV31O2+6ACuJ5oFO?=
 =?us-ascii?Q?Vjzh+lTZbn5lcH9rxzJIWAhwzUnInaVs6ASLVy7iNsVnRJO3oPCfYughtz6R?=
 =?us-ascii?Q?fzJfBytbzMXpomhCKWYdv0CCq0Nf7qPNaPiYSscAngmrKhh4QPvaEfTTKycY?=
 =?us-ascii?Q?BqokDVy+X60M6VxlZj1SzT41XHBQSdXzc9le9jbwDRfB7BJs6Ttat5aTy70U?=
 =?us-ascii?Q?8DOjO3Q0pZPsn9rJAGogd4nb7te6oyRx0E0eSt3rWY+7R4qYh3GqRnNTa6J/?=
 =?us-ascii?Q?mmi8MhjbD2C3iGN93Ua6++nRRpRquigjL6mfvwTEiPu2jGZw7ObZH9C6xYav?=
 =?us-ascii?Q?mI4N6fiTpzaasdA6pRoiPYmtxdQWtf3T0XIe/OwqTbL/qjEI9ZJepRpsoscl?=
 =?us-ascii?Q?/V0cAe3jmjkzsATAzN32q9RHrwDlFNSYITxvvx/lxItH+wOFLhkh7KMILVT5?=
 =?us-ascii?Q?3KWgOTCVoDg595IUVr7XBHPDlCTBAnjPkr82b3rFCM3DfOPI8KlgOoHUMEcs?=
 =?us-ascii?Q?28NbAygE3VMFXZqML3ddHwUpfeRIj7kVk7HA/dscc4/o6Z3SPo9ZSaSsWDJg?=
 =?us-ascii?Q?ccmMvmEsLC3ktv7Hs28grNWyWa6ldfDHTjXCRM6Qw+iFA3bKLVo8fAEOxblB?=
 =?us-ascii?Q?bJ0YxaOM7VvIRUz4x4PJspoNTfnFJYL+jbrTVuNFQJoFCG0lTJlzwx6DVnjI?=
 =?us-ascii?Q?je2wiX0gX4VHt+QKKvevNig6Er+05xiXm47MDaX6QlYbfV+V/bsjEOKt8a97?=
 =?us-ascii?Q?008JHSMASUtom0MnBak7Ci8LxzvxK8vpligqmycp+cbdJreUqNasLraZH91I?=
 =?us-ascii?Q?hc0e6Pwb+Tt2xGXa5p/IJCkTDFsz1X9znr1PJ6gyPCUK75HYJ5hHhpN168FS?=
 =?us-ascii?Q?dQQmFMqReG6gCRpDOTo/bufZ1sI0vxMt0/yvoyAKxLa4gM8ogYjGJB7pRwfq?=
 =?us-ascii?Q?1inZDvrdGbWwF0J7RR7uUML1sDDAx8OxdsJVxwCi8Y+zMbuBEELVpRP9GLNg?=
 =?us-ascii?Q?g5lAKI9bg/bFughbEVK3etNl5S3J5f/GXFUhvDjzvTTwpenRXGtAX5R4qYaH?=
 =?us-ascii?Q?M0sTLA2+Wghjxqs5W1wM4b2j8pHuMd3W7pOKJQAg2/96x6vBSFUrhc5esIp0?=
 =?us-ascii?Q?89FYl1ZqO1PAFg78tplPKoZOIxuwK+9hpPQmCm+1gvyAKfjq3U8V3hwxp/rW?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b46f04f8-d8a5-4812-90d0-08ddd3cff6f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:27:11.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDCY7Mj4aeUMeeVP/oDmxqEsrKpT6s0PLYj9KBMGgVf8uGiJ1NkvxdSVW7twHQXNAqxwh2cmTUwB27osegZw8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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

On Wed, Jul 30, 2025 at 04:22:49PM +0200, Francois Dugast wrote:
> If the order is greater than zero, allocate a folio when populating the
> RAM PFNs instead of allocating individual pages one after the other. For
> example if 2MB folios are used instead of 4KB pages, this reduces the
> number of calls to the allocation API by 512.
> 
> v2:
> - Use page order instead of extra argument (Matthew Brost)
> - Allocate with folio_alloc() (Matthew Brost)
> - Loop for mpages and free_pages based on order (Matthew Brost)
> 
> v3:
> - Fix loops in drm_pagemap_migrate_populate_ram_pfn() (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 50 ++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 0312edb8d4a8..e43676e15fe2 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -460,54 +460,80 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +	for (i = 0; i < npages;) {
>  		struct page *page, *src_page;

I just looked at CI [1], mirror issue. I think the below change should fix this.

s/struct page *page,/struct page *page = NULL,

RB stands, with prior nit [2] and clean CI.

Matt

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151754v3/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-eocheck.html
[2] https://patchwork.freedesktop.org/patch/666254/?series=151754&rev=3#comment_1222135

> +		struct folio *folio;
> +		unsigned int order = 0;
>  
>  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +			goto next;
>  
>  		src_page = migrate_pfn_to_page(src_mpfn[i]);
>  		if (!src_page)
> -			continue;
> +			goto next;
>  
>  		if (fault_page) {
>  			if (src_page->zone_device_data !=
>  			    fault_page->zone_device_data)
> -				continue;
> +				goto next;
>  		}
>  
> +		order = folio_order(page_folio(src_page));
> +
> +		/* TODO: Support fallback to single pages if THP allocation fails */
>  		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
>  		else
> -			page = alloc_page(GFP_HIGHUSER);
> +			folio = folio_alloc(GFP_HIGHUSER, order);
>  
> -		if (!page)
> +		if (!folio)
>  			goto free_pages;
>  
> +		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +
> +next:
> +		if (page)
> +			addr += page_size(page);
> +		else
> +			addr += PAGE_SIZE;
> +
> +		i += NR_PAGES(order);
>  	}
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order = 0;
>  
>  		if (!page)
> -			continue;
> +			goto next_lock;
>  
>  		WARN_ON_ONCE(!trylock_page(page));
> -		++*mpages;
> +
> +		order = folio_order(page_folio(page));
> +		*mpages += NR_PAGES(order);
> +
> +next_lock:
> +		i += NR_PAGES(order);
>  	}
>  
>  	return 0;
>  
>  free_pages:
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order = 0;
>  
>  		if (!page)
> -			continue;
> +			goto next_put;
>  
>  		put_page(page);
>  		mpfn[i] = 0;
> +
> +		order = folio_order(page_folio(page));
> +
> +next_put:
> +		i += NR_PAGES(order);
>  	}
>  	return -ENOMEM;
>  }
> -- 
> 2.43.0
> 
