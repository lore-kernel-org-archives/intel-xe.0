Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471F6C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B56110E060;
	Thu,  7 Dec 2023 00:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482EE10E060
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701908087; x=1733444087;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=laqhNB8narDIJuUB09UKRh4FxnIl8Al9gHwY5iFCw0w=;
 b=hFq5LFMEXxj+E8JkYhbD3gXMXoGz+SjR1QRkyEmjb/dOHyFpdPXH//vY
 7mtwL9d3NI4YVimxB1UIsZsVWhZgOGRPe00U4iKLeQIMZzT5zRVtGOJGl
 Cj9iG6VZE7BauUi89RYQUb8ExcHHA7BYwyA1nvqK3BBFT2XpSs1apCRvs
 cuqd9ATGHZJjs2n4PxkcuDEDX6gdg2T8ZKkhEmmj0+Y87qlkj/pSv+7mP
 X8PfaWQXOxmryi2rPe7MTVWIpQ04dj6guLFqojFgGFFqdsF1EuZo9EhOf
 GoRse3qli1hRiLoLilH2fX7t/wUmkTTZQ3WL/xZMC5FNjB/EyGvfUygjF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1032700"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1032700"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837504000"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837504000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:14:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:14:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:14:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:14:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+s2C/6YqgzoZDXcf03Q18jlwF8M+jG57NL/eVB6eGDbEOFaWGLsHksCO87uNgy7IjUDnjU8cIZbUmKcT8NwOychZu6DNylv6RpyXnMH8RlNI0iv0NuFu96tW6EdcUj2uMesVLqNOmRN1JLRZ0ryvP1Qr/OTFwv7VPUgI3sJTQpuVRjDYbOAQi0ts0nD/c/Rpz+cEA3m/4B3rIC20v+a56vAlwOSEXl7QUFVV43MTmDRzJCEv/iLpqn7NJtrolP2jGpRNiUgAoLOzBkOFAPFTh38/7ziUKFmQmu0TY3JmmZm/05PFFUdY0lNyFgkz6Ao5dF29wfFWVDfuj8KcF1HwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47GqSAY3fxY1LOigS8VSX3lMGyGTgJUr1t/KuoI6UzY=;
 b=YpTRC0D4n7b/ur5P9ggpK3/SEY7tb1LN0M2WmsWy7zTlz+KLfDmTADQHnFLqQTVn+TzjW8Qr0hQcMNrsbM30yZSfI/aO/AbfbaFWZm5g6DnBlOMygcXyYhY6QgO5eilZl3fK9Xp8S2yuA1wEII7QX9GYCYvYTI/Y/3QtngehfngBtbJa0D5ij+iBIU4SSbFz6UD6ErjGNSP0xjiR8F2TyZQ3isFVMjrozNdS6QIEGxFWxqVPrwbdbS63xVTIt01FbVUpXdcM7MQa+Ii/HN6bFJnGmlPgI1d1jFWphZaFGLsq0FKLbt5YBFNMq8Fq6jQR140CZloXGRBdQjaTFOfZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:14:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:14:40 +0000
Date: Wed, 6 Dec 2023 16:14:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231207001437.GU1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-7-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-7-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 591493cd-4a55-4f1c-3ba4-08dbf6b9813f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mCDjT6omnBDoY/Hh7szH1J6I7Pv75rGmreGAWVQ5WlXl8uY91Tc0T3CzwjgOcdBsyPsocbBqUaBwUgdiXUdRF+gxKtMehaLYZCVqha542yj3VydkptRFRdtKFMvofz/X0PAus1dXCYV7qB3+0X9iGFJUIavK4WKmEUTYhVEdWa0yAnaa+l8gKwTQs6gxTY/LymE+qi03d2vDN2kET2AAdKzbJaOS3NYplgyHuLkn/SnlsDqY2Nk3nziYam5v52HLYS4hwzAWqZDlAh/OewL2QeRRz609RnTNCqewwheOAnsgTQBzYztQh6NO1JPe6TDKtkaeYsQyKqfi14xcJqwqnPu5OBZ+zCI7BKCLcmO8GQWjOCIFscxrN5rcBw6Mz9zwXSDbKdy2c3OzOg5yAzcN6fMNj3e03JAYzwYbKKaVvg9B9EdQl+HtR3n/Zajn8RzmZPapJOxShANkFMBrB5emZomJn872lND5kOsvMjzEeKv9MS5d3kEbyoZ15bosx61tHVrKzKEIM7ECaQM8ssxTSNwd0s84Tij7K9Qo9kwCcf/U9kNbC42q1yyIGK7AQNHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6862004)(8936002)(38100700002)(5660300002)(86362001)(2906002)(15650500001)(316002)(41300700001)(4326008)(8676002)(6666004)(478600001)(6486002)(26005)(1076003)(6512007)(33656002)(107886003)(6506007)(66574015)(66476007)(66946007)(66556008)(6636002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mYvBUk8zaTJmHQBMuvjqBeS9SqNZ30C9iZ4gF90m3ZD68XMo/SvWZB6FwQ?=
 =?iso-8859-1?Q?SIQ5zs1apEvBO/LRKjPOXkFFyN8KBGFpnuQ7O90s6TfpEz5M00pI9OFR75?=
 =?iso-8859-1?Q?xmQLFo79L0Xj3eh3YvKTN61TQtFyEHBuV9p+e32K9hz/NNY0gPgimopR4J?=
 =?iso-8859-1?Q?SDWB/O+J9uAzhnnnNG3JX2tk4qcqaygn0invlU00sqvUeJCMNC0+YSAbJC?=
 =?iso-8859-1?Q?y34cbBKR3/fJY0i3IYiYkTdcUBXJHemq+0dCahDvMpWJEQQpc7QO5IM35q?=
 =?iso-8859-1?Q?MJLMdlL3DlpbkhAW05nCMzCNKyGWKQ3msWjsNaxc2K4HMh/2KENyA8RLrR?=
 =?iso-8859-1?Q?k5Z7wwBHMgZC28JdaTndC092nxo239p6g6m7M4sqC+10SGvqdpUisZ/IhH?=
 =?iso-8859-1?Q?RSiATPTxRsOIqNi+fx0Lp/dVjFkPKvQjWrIvQPAZRxnPhMi5lf7xas1Z/z?=
 =?iso-8859-1?Q?S7il+/L/sVIuQlXuCJ31/dIt62Tv2bnbUXfntsxndExi+NWojjoONvyWiE?=
 =?iso-8859-1?Q?543JCDypL25umhEwitUvdwGQS+S22wUNtmqUFNcxzSS8IHc8MeMmmuqQSF?=
 =?iso-8859-1?Q?Jlt5nueF76keDcShndQVLXBQ2C9PENOkbDQ+tQ0zZdItspHABwmQoDSfgc?=
 =?iso-8859-1?Q?ein90ck8F1Q5LuU9jkbdllUcbX+KROV1tpjZDNP6Lx3TNosh88qgIvSbOE?=
 =?iso-8859-1?Q?Q3miyTihW0BR0lVRxF0KiR+ZRUOVBn6J7TdrtNBBYyRbHQregKiDAs9uUW?=
 =?iso-8859-1?Q?HmMViOYRbdHtTznkb/svkVVvdpeyHWGjUcDHX6zpE0ERXpclYjk9WLGsB5?=
 =?iso-8859-1?Q?3PWfmaF72Otbua8OPEtErJc4sQ87T6GMlM3W9MQ9EJKs3wTA1qsVF7IbxQ?=
 =?iso-8859-1?Q?5+d7yBlA7DCPbJIsJj6hFsdHo3GtMlJ6OqMFSk156VmSLXjkB6RaT4nI2I?=
 =?iso-8859-1?Q?lJTERG5sW0a9GI+wgveWNfNNGGSSP81NS2HjNLL0qOVcsxbeqYKtfVETcz?=
 =?iso-8859-1?Q?LAUpyk2xy0zPD5M69xpRa3eYVJj1gxNrr1Q7zyHLm0mLzcaF6pF5mPI8Go?=
 =?iso-8859-1?Q?MwB3Hecz5kG+omgNDfAGXK/TcwZYzRlJfrx9zIErz0RBM3TQwgUWfYbPQH?=
 =?iso-8859-1?Q?0v86wTHP04SywMXglwy6WdRPwMaWITV4Vg5nCjG+g0PJ4b8DkxNHwsf3Om?=
 =?iso-8859-1?Q?ILWG5vIar4hasp3Z3VkzgUkjllU2zTolQwhqj7eexJTC7Y/i0vMW09FlLt?=
 =?iso-8859-1?Q?7TTiiNm7I8FpDSQbz6dlIhwIU9wVgFDzp7fmQVrNQecfOp1UT9RmphNwFT?=
 =?iso-8859-1?Q?2sHeEEMb3Jamj7ix9uuUwK5hUDkA15+AoO6WhyiHE2pFGXTPbYhQv8q0Jk?=
 =?iso-8859-1?Q?GsH2wCPsF4MEGZujuMEyjQN1TFFhpz0eg245pfjhE7j1M9WsTMoD231mGZ?=
 =?iso-8859-1?Q?Z/zkGcu8JFCCyUYSxY8u1lsqV/to2Fy6Df30qnIK9ts1TORODQ7l1VksMN?=
 =?iso-8859-1?Q?Shp4gXw8Gc6Z2GYJNRwPEEfY9MlUW4T4IbGTo1XsB0XoU389iHw8D+PBpj?=
 =?iso-8859-1?Q?OneIaEemnTu64s/H5tKmdHkrR1jLMjg1qDZVpQ5tDlfmyTCP4k75Bgm7kE?=
 =?iso-8859-1?Q?yLqBs9IeXndXZXPN1xQSKFzfO4APlcDITmbtuwdxNsBZg0Lbt0MT3Bew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 591493cd-4a55-4f1c-3ba4-08dbf6b9813f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:14:40.4709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ta42GhtZvvn2mh1eD5rHbh46BXrwh4ORELcUe7awsLY5ImVAk10lhBSQY1aTBAd1ff1Y2cDOsCg/uajx4F7BOSKtuuVdDcpwswZN84Mq4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 6/9] drm/xe/xe2: Update emit_pte to use
 compression enabled PAT index
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 10:01:23AM +0530, Himal Prasad Ghimiray wrote:
> For indirect accessed buffer use compression enabled PAT index.
> 
> v2:
>  - Fix parameter name.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 20 ++++++++++++++------
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 83d6a66ed369..f77477f7e9fa 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	else
>  		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>  
> -	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> +	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
>  		 &src_it, XE_PAGE_SIZE, pt);
>  
>  	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 98dca906a023..1bfb249680f4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -416,15 +416,23 @@ static u32 pte_update_size(struct xe_migrate *m,
>  
>  static void emit_pte(struct xe_migrate *m,
>  		     struct xe_bb *bb, u32 at_pt,
> -		     bool is_vram,
> +		     bool is_vram, bool is_comp_pte,
>  		     struct xe_res_cursor *cur,
>  		     u32 size, struct xe_bo *bo)
>  {
> -	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	struct xe_device *xe = tile_to_xe(m->tile);
> +
> +	u16 pat_index;
>  	u32 ptes;
>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
>  
> +	/* Indirect access needs compression enabled uncached PAT index */
> +	if (GRAPHICS_VERx100(xe) >= 2000)
> +		pat_index = is_comp_pte ? 12 : xe->pat.idx[XE_CACHE_NONE];

We should always select the PAT properly for the platform; we really
don't want a magic number like "12" here.

Also, how do we know we want to always use compression here?  Is there a
reason we select uncached?  Do we need to worry that we're now using a
non-coherent mapping and may miss updates to the buffer that are sitting
in the CPU cache?


Matt

> +	else
> +		pat_index = xe->pat.idx[XE_CACHE_WB];
> +
>  	/*
>  	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>  	 * we're only emitting VRAM PTEs during sanity tests, so when
> @@ -722,19 +730,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		}
>  
>  		if (!src_is_vram)
> -			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
>  				 src_bo);
>  		else
>  			xe_res_next(&src_it, src_L0);
>  
>  		if (!dst_is_vram)
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
>  				 dst_bo);
>  		else
>  			xe_res_next(&dst_it, src_L0);
>  
>  		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
>  
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
> @@ -975,7 +983,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Preemption is enabled again by the ring ops. */
>  		if (!clear_vram) {
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
>  				 bo);
>  		} else {
>  			xe_res_next(&src_it, clear_L0);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
