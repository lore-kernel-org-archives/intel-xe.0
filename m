Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F7CE7A89
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4376410E260;
	Mon, 25 Sep 2023 22:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDA910E260
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695682563; x=1727218563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hs4CINJRr70BgU0qaOG/IURX9u3E9Bmu/UJjsZqgZvM=;
 b=TQA+EJM4w2pI3+rCQLW0BBWbKyzNuvobLy2qGnGB7PthtOBM/OLruxYp
 hINdGcQXKQS2/+gOMnnYEKTN4EtOB8ipCq+uFh96yDSwN5MOZOwL2Pb0x
 TeCt6E46VmQqNMoCugIIAGkffag0RTon9QPumZSADSAQwYku1/1t6eggF
 gr4pkNm0jRZenDg6ZMmZ/nnaXCVubm72rtPoSXRthom3MhYoZJWlm+iQK
 AQ9n2kKQUDZHp+yHzMwHwhQFA1nm1xUSHQrpCieoV8QZhPklbLqRBs07f
 Qej+up9tWKv/crBq6OmiVVjTdMRNgR8adgR3ydFr+ui1kJJQWkXKxqI8e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380295527"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="380295527"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995581108"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="995581108"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:56:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:56:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:56:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqrBYo3MB9auNABhRyTZ7pbzpPdQcPio6L16zMTMkDmEvwW+kSmc2giZ0wZ5zPfgoItT0f15LmgxPrPKApj6FwjDefmWXK1mFR403f3zW2G6tzzGCgZNAUIWrzzfxEmABAmjR1tLzz70l6er1Yb1gs50kw3cmt8gxYAnoo1Hpr7w+rVzy5LqFMMC9Urw2C8bFsWLLQ6Js69Z+UcrZw9Yzi61IqR48o7jWzp99LWQ3tia+tMLxq8MaWlVWqOAdJ6dsYDqtRpJwKs8y8YPYl5tiwYHH3UCqH5bdeN//CWdSrt/wGKXVCTXVm50gbH+5jkeZjOWDRxyKiIeNqcdU2mH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mker+57wT2n8QSDEsUqMhxzdDABB4R87TUH2KWubw2s=;
 b=V/i7/SOUiLrsNW7RFCl95CYl82AODCDilxqQ+yKMs381MDauXISpJH+b4u+kxNO5LNwmzVtMXLIeJ3L45w28oSi380nivY0THg1VDU4BLzcPnGthsZknyKBWvQ5ed75yYw953DnqWyje2Cvbe1UZaFuxowb1pSHJ5sHtUiOXt6pGlPQnoQRTC4ZyplrIuevt856dZwh7BWBRVixybVsFD/0k6ePLDCVfHnNuqzUYwXe01+izjpu7OQu0raKKVXz0Z486IyhOKRsW7HgnYNPnYtUC+tc2edl+mJH0cFZTxjwuW9lea4NpeTIgZeyJU3u2Biv2p0clx4L14tXDQHd0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Mon, 25 Sep 2023 22:56:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 22:56:00 +0000
Date: Mon, 25 Sep 2023 15:55:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925225553.GA2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0089.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4c2187-550b-4a4c-0f41-08dbbe1a960e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uayLISGXOAwWTKjzrOrbZViOEU7c6bIXGjxHG1kWYiVh17bIsf+5qjS0468XTVY336dwVtbyzkgGsiLg2nWzQtFMtHlheVVSwDr6sNy3mYYjHwl2y1SPXybwnWWaRkxb4SWni7E7/VJd3uH/hxDATrE/WMW6TL61CDd6Mti5NyVhfMyErBtxuX8oYXBbzT7J3M1po/Kh25wVCu5X6xKgUgysj5JFJnEeMDs7rdm9UCj0OEx/9VgIs6uIMhiTv9a9sXFBhaTn5kAlRCUy51XJeVBzzKIeiShCaAPrsJ96uEJj1PkR5fj13j1vrnBnuYvdSlIvnxQk+TcKOz97g5ZmPsUQvw7hZ6TKoCRn5srE04WF5wAd4V4qCDogGAilgYoomiB9usz9QHpx5K3/LoqZUOwqet71x2HVyq4FHkkVaibp2XvMyyuKVyUWGonCsc9f6/+I5w2Vy0QrukDhi5wHsblFqFfHSSoCrpj48vEVGhPmRZUoXVPUychCBKktsvLYr3oht5SSSFEWi46dJEWbwx+JjhdY6QUD9eEZi7YKZyQkGjFVGiJlqWcDO0ayoBDw2OoHIp6iwZezA3BN28phT66pDdHmGldbLdrxj6EOx6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6506007)(26005)(82960400001)(6666004)(1076003)(6486002)(107886003)(316002)(41300700001)(66476007)(66556008)(6636002)(33656002)(66946007)(2906002)(8676002)(86362001)(8936002)(5660300002)(6862004)(4326008)(38100700002)(83380400001)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/nIV9yov7mJU6949iaHXFCJUG3N+v0zWTOziW02oU2Ork0/yYD2BQy9K2Kq?=
 =?us-ascii?Q?Mk/H4himeqFBPRqj/O6+YiYFrpx6LMfIu8b++Ta5kyh6BIuqDmQIqf0MAzmB?=
 =?us-ascii?Q?3YFkB2gQOu+8I8vhL5YLxZLUYoy1W+4Iu4LzT/r0rLBMb+f/jV+yBXe6WcgZ?=
 =?us-ascii?Q?v1D4t1cz/+BaMWJ422TE3SEqLRCMa44GdhboG//GAOK3NFcPR3scC2uBXZqj?=
 =?us-ascii?Q?BOQryOsDOtWLsl52j4sh1gsFqjBlgR3DJrRIAIZa288SMn0I6TcNk6CnwVHP?=
 =?us-ascii?Q?vwjEClVN3XIh0DslhcpipCCMDLuxtGxeLaZRkqgQsp6hLJBp4kkDPlJA7CdR?=
 =?us-ascii?Q?gck4T8Xly2hxQocEOBTUUXD5oGOfsOFNlKTnaoNLwQQLNSUWZ9fJpLWzgXMs?=
 =?us-ascii?Q?yoTbdkqnTq5sConpmFAB9sIzRXq/9RVRO2Gy4A61J9VLVNEU0dN3iyM1d4dS?=
 =?us-ascii?Q?BR0JkdGrbn8c0nzE8+2s01d4yZtik4byHXClLmLVvxWIgtLYMdbKfv7PqcZx?=
 =?us-ascii?Q?DuPg7DdEI3RdUnuKskySHi0S3t0guDHmlxCIkyAyV17eaD2OkOS0/m/2OG91?=
 =?us-ascii?Q?9NeuXo6TTDW8xC28B4N+mClBmN6NzUyZ22WJC+PHxhBeuLB0nqcoblx3HmWN?=
 =?us-ascii?Q?Rr3ykS8tUaJgr7vyL44Q3xdCKqNf90M1CztYQusANQAQdMrbrNYgRlXnr3rv?=
 =?us-ascii?Q?Ip1ySM5R/IxFf+ffpdBG4bjd3MtGQ4m1J/jqRS/2waySIzizcPQ0HkmWH4Cz?=
 =?us-ascii?Q?ubYxgBWcmj+YqQpP9w0eltpHI/KKgFTFroLG9WeQYh5ThhKaHHVBmhjEwWK2?=
 =?us-ascii?Q?kG3viWSQ+I2GWm23cgDjB2Nq3q6z94Gpdea6mBSGmNkOi1DL3iJWwGu9w2Sn?=
 =?us-ascii?Q?ZTcD5GePbYLkkXmS+oLzWxUwAxQlKhVKexMRcOLvyNOoEhF26OI2WQFi09dR?=
 =?us-ascii?Q?Iu96cli98aoqXC7mfJ98lqeVEQT+Te8mmQUDNS8DAvHvjqbSwmz4QfyhWWHz?=
 =?us-ascii?Q?dUB4ttTWQWFQr306SlEsWGQJZepGtXvHsF7/hxwRB1h8IGC101jBicL1olUu?=
 =?us-ascii?Q?bj9EIOSG76eFBy/Ew3i3jrewmvLhgwz00LNyB2vrxhpxtukzMKvAqTQJAn1F?=
 =?us-ascii?Q?8oWZdVXad0oT3ikC9id9nk+ZZfQHn77d25Zl+TXgy/1JU7dJOL/0oXod24J0?=
 =?us-ascii?Q?tHLvxNc9/jbuisL1GqMdkJxeJmAfFmC7m1LKn9MRnSYc1cWvPsj6/IxrN4V9?=
 =?us-ascii?Q?xqR/eXaPD1GK19Irb8PdBqsdMxG1LagK6NCTyxSy56095WGtQUFdSrHmm/SB?=
 =?us-ascii?Q?LwSKfk4u2a3VRzIRxnF6eF7G5rxo5v0DzCIrkWl3j7PVKFiGcZQZOB9Ne/CQ?=
 =?us-ascii?Q?jDk1OWsSeZar+GlaaPQ81imh3QVaS3yIsrCFkATiK6O3c5ZNaWxtJ6p7U10O?=
 =?us-ascii?Q?T2/qbo9aOS9DW2K+RitG5GGGJWRM8nlEYzIIMFtU7yQ3FKp43OVl2/gWBVJI?=
 =?us-ascii?Q?9t9KqVB3FQdp74rUN2Iy6GEjv5HF3+tBzEIakquejiT2A22/dMH9Omw8Xev/?=
 =?us-ascii?Q?+/fL/nD4qIcvoBJD+ZL+PmLvy+KKo5bVEVEpZhLLsa7g8NvK7TXPebp709D5?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4c2187-550b-4a4c-0f41-08dbbe1a960e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:56:00.0525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIIhwcYB9SlKopIVgDQpnXfqOfzYFKVW8nhyHC9zwNMM53n6EIk5fc8qQfmRoTHcBTi0ZXTKPsrPWRG3XxaTuZanedgzuiZnV4L3t8cQcC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/9] drm/xe/migrate: Do not hand-encode pte
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

On Mon, Sep 25, 2023 at 03:10:44PM -0700, Lucas De Marchi wrote:
> Instead of encoding the pte, call a new vfunc from xe_vm to handle that.
> The encoding may not be the same on every platform, so keeping it in one
> place helps to better support them.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c  | 14 ++++++++------
>  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 23 ++++++++++++++++++++++-
>  3 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index aa0396330903..f22356d69ae3 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -261,8 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		level = 2;
>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
> -			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
> +		flags = vm->pt_ops->pte_encode_addr(0, XE_CACHE_WB, level, true, 0);
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -483,7 +482,8 @@ static void emit_pte(struct xe_migrate *m,
>  		ptes -= chunk;
>  
>  		while (chunk--) {
> -			u64 addr;
> +			u64 addr, flags = 0;
> +			bool devmem = false;
>  
>  			addr = xe_res_dma(cur) & PAGE_MASK;
>  			if (is_vram) {
> @@ -491,13 +491,15 @@ static void emit_pte(struct xe_migrate *m,
>  				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
>  					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
> -					addr |= XE_PTE_PS64;
> +					flags |= XE_PTE_PS64;
>  				}
>  
>  				addr += vram_region_gpu_offset(bo->ttm.resource);
> -				addr |= XE_PPGTT_PTE_DM;
> +				devmem = true;
>  			}
> -			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
> +
> +			addr |= m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
> +								  0, devmem, flags);

It seems like "addr =" might be more intuitive than "addr |=" here, even
though there's no functional difference.

Either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index c58f6926fabf..64e3921a0f46 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -39,6 +39,8 @@ struct xe_pt_ops {
>  			     enum xe_cache_level cache, u32 pt_level);
>  	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>  			      enum xe_cache_level cache, u32 pt_level);
> +	u64 (*pte_encode_addr)(u64 addr, enum xe_cache_level cache,
> +			       u32 pt_level, bool devmem, u64 flags);
>  	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>  			     const enum xe_cache_level cache);
>  };
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2e1b4d46d9ea..23452b98d853 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1216,7 +1216,6 @@ static u64 pte_encode_cache(enum xe_cache_level cache)
>  
>  static u64 pte_encode_ps(u32 pt_level)
>  {
> -	/* XXX: Does hw support 1 GiB pages? */
>  	XE_WARN_ON(pt_level > 2);
>  
>  	if (pt_level == 1)
> @@ -1272,9 +1271,31 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	return pte;
>  }
>  
> +static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
> +				u32 pt_level, bool devmem, u64 flags)
> +{
> +	u64 pte;
> +
> +	/* Avoid passing random bits directly as flags */
> +	XE_WARN_ON(flags & ~XE_PTE_PS64);
> +
> +	pte = addr;
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (devmem)
> +		pte |= XE_PPGTT_PTE_DM;
> +
> +	pte |= flags;
> +
> +	return pte;
> +}
> +
>  static const struct xe_pt_ops xelp_pt_ops = {
>  	.pte_encode_bo = xelp_pte_encode_bo,
>  	.pte_encode_vma = xelp_pte_encode_vma,
> +	.pte_encode_addr = xelp_pte_encode_addr,
>  	.pde_encode_bo = xelp_pde_encode_bo,
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
