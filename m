Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F993CE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 23:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1321710E260;
	Mon, 25 Sep 2023 23:38:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73B810E260
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 23:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695685100; x=1727221100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XXVQUGTi5mIiW9yRHLzs9uy+b+ZTj+/x1hKQL9Pg+Rs=;
 b=JtRj5EyF3CWRB2civVexzBOONjEiB+0NXHD3mzEQxRY69DrSCw0cT6KJ
 NRQ0aLSJt42bqNNats+uiNWaPgFL2ANq6SLj5TfnhlWnR2mSyBaF6FWch
 9xntKtj4fMMywrF0Efk+YfoysIeOR8JJoXRLtQBPPIO1J0jMOwaNswy6u
 rSBre9aPAUoPbVMh9xQ+uOMaVQMJIOjRtvf56owXVfD1LGbvgnXWxwjmJ
 z/pFB7JS7o1yh2X2biWAJu/QCZ1qhEhowzyuilIHBH0v51hFDkbba8/EE
 QvSDAtqMHAn9zS5j1e8yZ25rJvH2YH8BrPQAK7IhYctOdENo5l5tI/MVI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412355758"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412355758"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748589892"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="748589892"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 16:38:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 16:38:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 16:38:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 16:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYnT67jVHdwKERaoBPyPbjhinJJmBGRldftuhHya6cGKOOJ8QTNVrN2YbKto/eODjFWAbHPXbuGiIAz1A0e4bFC5tfnDtdGsnA5T8q+0SqOnZL7+TvbPJ5EG5BwJU3o3lOvAGAjzLmNgtTcANIcBYcrLQKRjVrk8c5f9l6RU1g2LOOLINikdCARB0yBAyTA713LjlZRn4QJ8OOgKTLpsdDCU1FpSSZxlAhx3ualtLfW7t5pvnyjtztPY8kOhmNtq3gG/jawLvjg+AGs5tmNk6DBXbFNtSPkKe/7ivpPgBzB22RhOfWxe1UxpMF7RJPg70cOdpBnJEfgwRUP2nXBYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9iTKgxPXVkV/wAfyeUiM2jph0cKthpq6UyoDtz+4fU=;
 b=OdTAlOJgm7Xya4sN2udAXZeMeL6KtJdVfa1bpEU0ngpF1D6w9Rmt3SuL4WU/gX1a6RJP3wXZciaVOrTd11+Ki2+5myCCsylhDlF0UPAk+1ctXPkwuacFNnZXEfFI5OeO75HNS4vSwJqI66AU+j72+V9CbKrDQyegjJWAPWEj/K29ktRUxNewCM8eQUgnOH/HPoyOUvUENf5opqTLqq7a7ggPV7RoQaWvHo04M3B+ykT1S140h9uOziTm80fWQyqfoehNMyb/OhPQ375maZYETaIhC0CIkxog0C9Mw9JCJJ3BxdYttKVnp2Te26XJqV+pHLWWdUWN/92VWq8i5ScCpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 23:38:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 23:38:00 +0000
Date: Mon, 25 Sep 2023 16:37:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925233757.GE2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c7b542-8fc7-4674-b57c-08dbbe207409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odvYKng1MujeOMdBYv5rIcfI/s/iwB+e2VVF29NfuON9bekfWKhpBozsoDmHJvQky+sn1e7wVNV/Jh2W4IWZGk66ca78HHlt1sNBnPmoxpWPQibImp2dTMXLCJhLSMUE5+yU8oHvg8vlGRyRvZbIyy+jgMwBe9vda/14VesAlWNmmUaZBwSP2xhlnIn2Mxbc+8a8BXnZd+vRrgJeVo/Wg1ZPadZ5x37pCwe3P7LRit26ei7FvkowoWm5LRMFeebLyhYYMvO6GnCKdbCfC06mK7eaadd+oFDGjNuPqEYMsJ9BtLokSAXDpOIVb+nWsEwIeu420WFwqVWOA0KVMdzNzK6tPstT/w/8+8tWqlmCCa8Iy3zWUHkM+tqVHeQLlbjt3NcnZrxfcdcB2UG7VmvpBlvezrjpWX9n3Q6q4vkjthU7lT/lp5HWfIDyQUGuTB0ZYtxrclFYdOnLzQTKyc+bCm0vIT78soWgQdRJCbIQFAMgjm8uTB+LZ9FXS+vVnbuy3ez3UY/kxrYrslWnIcEJCoA69Zh0vMmkO4mXNeN+jnRD3RKAIS7z9QSrP9EM+Beq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(2906002)(5660300002)(4326008)(6862004)(8936002)(41300700001)(8676002)(6636002)(66476007)(316002)(66946007)(66556008)(478600001)(6666004)(6486002)(6512007)(107886003)(1076003)(26005)(6506007)(83380400001)(82960400001)(86362001)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mPYm2pAw9E/usxXQbUGk+z56oUhT+Eei5lfN/360b5VxzODhdPB5r7jbZ2g?=
 =?us-ascii?Q?UXjhyek/Dgj+UODs2V7IFNeMp5Thf+a9LMZ+T2m4Q9gDjeyx0ZMxtyuxVQY9?=
 =?us-ascii?Q?X4jxmzE4UB+7R37u7rgsGX8IYwdpj3u+NI6G6t4gfArNiW5h8Kf82g2uU5pT?=
 =?us-ascii?Q?lWi5OmC6PQtCLzfQ7CaAD/5OD0YBhuNbSODKCrvuYtB6rBEpMFEe1akwLasI?=
 =?us-ascii?Q?bzrpG6xXpSR77C7HXhVVNhdzUfSeebe/RY6XMjBzZ4gXuNUE/IEawVmzlnyI?=
 =?us-ascii?Q?NeeBHa6FqiaOrvhjeLFDV3IYKbRpQ9LqJBDRgEldycaXMx7fPL4+VqcCtYcd?=
 =?us-ascii?Q?ZsDxNNST5eECuu999A0lbBbDVRFkqA6XiPheppzA0TnpcjCvFcVv/AfTFwQz?=
 =?us-ascii?Q?jB8xzvc5a63W+CYtxAlkzqusNstM9vVInGLgFSC2r4B89m+27ETpoH51eHdo?=
 =?us-ascii?Q?wOka48fYORCCb7kSPdLTEfnt8KiBBH51S3k/RwnGpWg/PXnpad5x0uqyIxR5?=
 =?us-ascii?Q?TIW1lAx75zIpzbKR/0v3nF0BypvzBwiQEqGGj0UvaCIK0+L+byWZPU86O3Yh?=
 =?us-ascii?Q?zhia/Hm0Ttdn1mGfp2QiS8KfVgA3zaUZDuzDQxvSA9z9kQO/2WFltbukwQQz?=
 =?us-ascii?Q?rqorUQSMflBiNW77xFCcVP1dJfAjvdkeTcheUMr5VXas5S+lgUdAenA0/V8c?=
 =?us-ascii?Q?j0ld1CYeFtYQo2HZPPeDD9AA0cyg+d8mQLNoAYYUu7e2Kwy62mORCRy46zdE?=
 =?us-ascii?Q?3Aj00tuX+Gbe69Zm6Bn0txuzmCy3p3yjouF3Jyk2RXnKetZhPCKi+DM+9p8f?=
 =?us-ascii?Q?ecN/304T8XaH/EgesJ3EQkBfB/j3I3cHynU7Jaw1W4QUDCaap3ZVeB1Mt2AD?=
 =?us-ascii?Q?ba9JHBU2Buv6ODvZ1gbcScfshS0+4zG94rVMYzOJlnM4QwO2PxQYM4vvDmiT?=
 =?us-ascii?Q?+nT8yZFr6Rk7paS//yzppKWzQtr3cbsThLvl58+n4me1rSVA/TThkS4DKYES?=
 =?us-ascii?Q?mwVyL7ekt8prhDKFBBPN/h8rCDIMiXmJVw5knf2dDfpYvTD9od0Gwi/NtDNI?=
 =?us-ascii?Q?Sb/nWg2hh3k89lLdkqTRlsjkThV0zWBHOC0ZC2KPTe7R7QUxPmiSwqNYXEPk?=
 =?us-ascii?Q?V/BVAhHckFCN40fXMbILqgUjT6LdsyEAjTDJY5j+o+EAs8Ion0iu4es2PfuQ?=
 =?us-ascii?Q?VrsEZevVEcKebvSUI3aOpb4gLuLgq2R8Clv8jIGQdnEcOdzI4bGo6ypR6/bw?=
 =?us-ascii?Q?ILBdGZa4kMXHGgJ9pFZ0/JkhKdjEBg+Ne9Xs2wr2I+VPB+1RABCNQYFbAasX?=
 =?us-ascii?Q?LAcPBohM8ltntSmklEw/IRgch7oQKin+sfDNBHpohFNY1nPr6GLru2JiwsTE?=
 =?us-ascii?Q?uCRQsJ6A46K+cK5mbKiOZdmI7VDphspPVn2NrkuwDHu9kxOp6t/jwZqLlqfl?=
 =?us-ascii?Q?bMUo+oIbYUxOJXCrcqEkl1Xmla/rdFH5qgt2noUoVWG/I1nD799dyOQWtYEo?=
 =?us-ascii?Q?O4ZpJ7r19sfee/zUmQYlB3sn46jmZcIPl5wfD1BUP+8mzYhgu4XTapkSl4f0?=
 =?us-ascii?Q?1EIoEx8/di77t0IIh3yoxwdMGCRj77Hb2dVV9tQRA2ePhw1sCCpmzTlpcYQ6?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c7b542-8fc7-4674-b57c-08dbbe207409
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 23:38:00.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iicA8lYzeCwiN2feLaOzeebPX48mHlFklF6x6rj0f4qlt1ZIikiwVFlH7aEXighrs6BBmgQD70UTdoZ9uWVicpxl+cAsze0/qYcPei1kok0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 8/9] drm/xe: Use vfunc for ggtt pte encoding
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

On Mon, Sep 25, 2023 at 03:10:48PM -0700, Lucas De Marchi wrote:
> Use 2 different functions for encoding the ggtt's pte, assigning them
> during initialization. Main difference is that before Xe-LPG, the pte
> didn't have the cache bits.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 53 +++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.h       |  1 -
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  9 +++++
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 54baaffc7235..09c6bd46f097 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,16 +20,31 @@
>  #include "xe_mmio.h"
>  #include "xe_wopcm.h"
>  
> -/* FIXME: Common file, preferably auto-gen */
> -#define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
> -#define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
> +#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> +#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>  
>  /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>  #define GUC_GGTT_TOP	0xFEE00000
>  
> -u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
> +static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +				   enum xe_cache_level cache)
> +{
> +	u64 pte;
> +
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pte |= XE_PAGE_PRESENT;
> +
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +		pte |= XE_GGTT_PTE_DM;
> +
> +	return pte;
> +}
> +
> +static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +				    enum xe_cache_level cache)
>  {

Since the two functions are basically the same aside from PAT, should we
just implement this by calling the xelp version and then add the
PAT-specific stuff at the end?

        pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, cache);

        xe_assert(xe, pat_index <= 3);
        if (pat_index & BIT(0))
                pte |= XELPG_GGTT_PTE_PAT0;
        if (pat_index & BIT(1))
                pte |= XELPG_GGTT_PTE_PAT1;

        return pte;

Either way,
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  	struct xe_device *xe = xe_bo_device(bo);
> +	u32 pat_index = xe->pat.idx[cache];
>  	u64 pte;
>  
>  	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> @@ -38,11 +53,11 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_GGTT_PTE_DM;
>  
> -	/* FIXME: vfunc + pass in caching rules */
> -	if (xe->info.platform == XE_METEORLAKE) {
> -		pte |= MTL_GGTT_PTE_PAT0;
> -		pte |= MTL_GGTT_PTE_PAT1;
> -	}
> +	if (pat_index & BIT(0))
> +		pte |= XELPG_GGTT_PTE_PAT0;
> +
> +	if (pat_index & BIT(1))
> +		pte |= XELPG_GGTT_PTE_PAT1;
>  
>  	return pte;
>  }
> @@ -72,7 +87,8 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	xe_tile_assert(ggtt->tile, start < end);
>  
>  	if (ggtt->scratch)
> -		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
> +		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
> +							  XE_CACHE_WB);
>  	else
>  		scratch_pte = 0;
>  
> @@ -102,6 +118,14 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  	fs_reclaim_release(GFP_KERNEL);
>  }
>  
> +static const struct xe_ggtt_pt_ops xelp_pt_ops = {
> +	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
> +};
> +
> +static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
> +	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +};
> +
>  int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> @@ -146,6 +170,11 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
>  	if (ggtt->size > GUC_GGTT_TOP)
>  		ggtt->size = GUC_GGTT_TOP;
>  
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		ggtt->pt_ops = &xelpg_pt_ops;
> +	else
> +		ggtt->pt_ops = &xelp_pt_ops;
> +
>  	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>  		    ggtt->size - xe_wopcm_size(xe));
>  	mutex_init(&ggtt->lock);
> @@ -260,7 +289,7 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  {
>  	u64 addr, scratch_pte;
>  
> -	scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
> +	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, XE_CACHE_WB);
>  
>  	printk("%sGlobal GTT:", prefix);
>  	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
> @@ -301,7 +330,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	u64 offset, pte;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> -		pte = xe_ggtt_pte_encode(bo, offset);
> +		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, XE_CACHE_WB);
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 205a6d058bbd..3faa3c6d0375 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -10,7 +10,6 @@
>  
>  struct drm_printer;
>  
> -u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>  int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d34b3e733945..486016ea5b67 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -8,9 +8,16 @@
>  
>  #include <drm/drm_mm.h>
>  
> +#include "xe_pt_types.h"
> +
>  struct xe_bo;
>  struct xe_gt;
>  
> +struct xe_ggtt_pt_ops {
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> +			     enum xe_cache_level cache);
> +};
> +
>  struct xe_ggtt {
>  	struct xe_tile *tile;
>  
> @@ -25,6 +32,8 @@ struct xe_ggtt {
>  
>  	u64 __iomem *gsm;
>  
> +	const struct xe_ggtt_pt_ops *pt_ops;
> +
>  	struct drm_mm mm;
>  };
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
