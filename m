Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B42C04FDF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44D110E045;
	Wed, 26 Jul 2023 17:30:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FF010E045
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690392657; x=1721928657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i7nkkk6pJ4Mc8lPNviLfR+VMRAgcpOTO2rmhfQIcOtw=;
 b=FGT3PqJDFGE+0ZtEJXQpUsm0aCBxdnPhOscJotnc6WBIadFmWwyZn6lt
 cK4G02O4YwhDcdG8VMv7wleF8F89fiKSLZQv6Y4ozxaGn/1M3K/YnMJ0m
 DSYnfj6zrM4gkKjqQp7pHj+qWQcfcQJt+ZxVvnUJiHrv9syfzKY7BaK4D
 gIr7YpAojD7iwiJvdUwDOsi7Xyjg34R/n3KqBpCp+yL2WvoaAGRJt7FKW
 F53f8i0kUH0YE8V5+Hm4Ysoe63YFgrabvuAluiyhz86fJiWZgcUUSDT3j
 ajG7IKkgFetSGnwGwOkLOClL0izhHx1qeqrcZu/OFxGtzqrr656+oVeZQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348365892"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="348365892"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796661498"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="796661498"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 10:30:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:30:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:30:50 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtvH7S0SdUYQcC5hgphqWki7PccfyiKBzvr448Etilje2xdOWCh/LnzjhPgOv4DsgaSBoL+tDhs0xihXXHDOdkwJD4SRYOYTaQhowRS2lqD1DH8dUmlQoaBvqZNcaY1PowDui6cbUCXTv0oSABCbgw32iMFEXZjbJJEzmFdLaS/Hcwo9/wTxVv44UyxwiJK5Tpg6prrutdn4eVV1fgiMKhJVbMv5v6E30vzGULquFH9XmE80jkzDeDiYQdSzGJjfCejxhPoEnuk20gSpYaW+DehL0X5eaQZtMDoYb6iEvSxR16KnT5gpYF7To9q6J/QYofmhefFrOuLzVPTrmDm0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJSF4EEUTGpymlbtFHCycbDMPqBoImRuSpKZT4Gg0Q8=;
 b=OU79xm6CbF8CVg2uOD9agh9fq0LX2LBQMusBuZmLyMBRn2ApQA+CfORl+bBRQofgtm4JSYr/YQyvK/hzNDQOR8TRWFw7Md18rwPd0PaO0lKOLDkbO1EKT4bDvCRDsRaerM0k0CL1wF5qsFeLaqVRTk3+gH+rN1RR4KJHZZGqy8oppIQpwyl5OfnNb2SCjn3IATpobukR6AxWgxxmk1ytaGtjjdzXP0lAIAClJhCTZqIFoq01Qij/9Yf0CATf/fA3k+q5HeNX4Bx62ZlQG1wNLA/lDO/Ocs9Do4R8GDm09XW8TNf3s4au2bIqr+6+OkEtjQBqLoYTAmYNtSo1P7YU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB8183.namprd11.prod.outlook.com (2603:10b6:8:161::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:30:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:30:48 +0000
Date: Wed, 26 Jul 2023 10:30:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726173046.GV138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 137f91dd-abc6-4143-ecee-08db8dfe0d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3BHFm6UsgH+12AXt7YFadvVHcIO1cHUDcTfXWtYdPq7Yit9jZXJX+ZL4/HiX9/6dWauttaa2INkpZo1cev464yXZnUOqEnvYRIgWbgxrmPfxcng5cuB4hIeAr2j724rA/ZXBYLMYwKVD4O8G67JxuFaOzyihYVAARnyfg6C84cN2WC1/JYgKnYsOG5sSYkYfeIOA/orTUeogIxDN1dPTNY2A2CW0BxmfchmuG8XyA0n46ENla5vvX1O0A4DTAXlKq8fZxK/+PrI6dnFOAvN4QFC3pVhfeaH9GaVGmpBuSLTzcJLmCOD/6P5UKUml0KqaokSFxc0SNYhbtJcR9E2/1ckSKZ3idyZNvluHcHtRZvMsqedwl5MS/vNLr8SsRCEYgajY4kUknFKpYdBMPLaY45GXSe02MEgi8B9HPGFL6zJWFxLADDdaKAb3eWUWeuop4TdeXNVOKZ/twSOPV9xqEKLCJefes1HzgX0PS2ixapDhM3gKtbNMW37t5JzsCTwoEHbiTZp9jh/AgNncdfo+Cvr6zVaeeEb5umAVmHSSX5aBtVIBOOU2O4uCy86iYbk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(83380400001)(66899021)(82960400001)(54906003)(2906002)(5660300002)(6486002)(1076003)(6506007)(26005)(86362001)(6512007)(478600001)(38100700002)(41300700001)(186003)(66946007)(66556008)(66476007)(316002)(33656002)(8676002)(8936002)(6862004)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xoz5Fl3RlVhGNyZuoS/xIrzLm3oBJgx6YHedtCDfX8uV78v66P8ihgzkxbjE?=
 =?us-ascii?Q?sfLX0U3OEYIBfZVnY2dLrWWjojS/+fQ48d5kycWTcW6ShQDbVjHEsvCYgCN4?=
 =?us-ascii?Q?a98+KP45146ydIxC3MF5OE81MLOiAN5Bq9TTxCOnczdly+mDk+5YJcV1I8tw?=
 =?us-ascii?Q?B3A+Lc9kCagAwP1ioi3fz9APzy3p6qt8tQ/kKuPLGixI4+7LANsxPicYrWEO?=
 =?us-ascii?Q?o4kzKlbTLxJuikoZnuiTnf09oTbyshSEJ0KEimx7vyT0UOe88Jw6WkibkELx?=
 =?us-ascii?Q?rsUNFByAt0Bvopw+fYW0IeWMcLA1JRBQAbuviK5f5GodPZqfSdThtNHOFG82?=
 =?us-ascii?Q?3ipWi6VfhSmrMw3sudxIdAmEIgNALmG8emujVIH3eczOqZ1Da2AVYAKH3JdL?=
 =?us-ascii?Q?E+6PrDaL3zD1GCcKx6DYoeSNkokpdHK01gRn5/WhFC6rAd5+w6QmQblYEmrd?=
 =?us-ascii?Q?4cnlOEqAQg7gOJokae+qOF7R/fQtCA81KH5cDsukf6zR+MShspLGGAUShg94?=
 =?us-ascii?Q?iwswShrAVgrm9VVaye0FHQ9zAsKfLY2myUcLA8YG/VjiNbYNGSyTyJ2XN1Vr?=
 =?us-ascii?Q?saYttoFI+VODxW4R5ZSj6sSBISLf0gLwnQzcEfKgQdXAovTXJdYQWbqEuk1t?=
 =?us-ascii?Q?ZUidjMJm5Uq7/TxlL9AmlKsDiAderkkwXEejzaraGucPWrriogTsmew13DUL?=
 =?us-ascii?Q?8qGVvXNP++rJ68naiV8pHWQMXMrtxm07YeQRkosL1mR3PLsrimXEBM7D7DFb?=
 =?us-ascii?Q?itZQGuI6xGHLvDnN44VOp8xxpxtQKZCJrmikUYmA0ag0kNKEJ4XcP3mfZwGS?=
 =?us-ascii?Q?qfcTNFpQgA2I3A6FQkG95HMYEPjdWTt432Vi1PjkgkXa3OPZGrqWOvpECl2j?=
 =?us-ascii?Q?VXojglIuS0wErFdDG9+JyDEEQB44YQ0nZyzoVXabeBrDoxB8ht/IjecO6Ohn?=
 =?us-ascii?Q?wWGRLLt7fXL7uOKDh/yzJH9O/2yxflZRVVkNb66qCjo5Bl0eiJesbuHpBAB6?=
 =?us-ascii?Q?8wzXELXdw0gB/4s6jYtRT+wEXDJHNSQzYk6W8ExwBn9BBfc8FP+226x8prDF?=
 =?us-ascii?Q?Q1DVmqsYWkj7JwV6FxO5i+88qtpECTbfr0N2qQ3MJcyCA/jwpEZrCMpLpCfX?=
 =?us-ascii?Q?aWb5IYq9TTIlhShO/N/2qZZNrwyJygHrBdb0bFbIV6hZ0w+amdFuJqgPTmHl?=
 =?us-ascii?Q?VO8eJQPitzZOJ4d1YNZCeAktOUhA8/WZvVWsnNPvsno24/Pf7I/PZcvAy+WB?=
 =?us-ascii?Q?mdeK/H6viArhxx/c7KHcwPoNkQ8VVYp6olMv8rJUcgBeWQ41nvY8uNQip9hl?=
 =?us-ascii?Q?I9fE0Q5U5BPs4SToSnQFHRKoIf3T4+TFE7+o4ROtL7fJDxEUoVsQet1c+e0e?=
 =?us-ascii?Q?9MWMO5q5PkYADtyNlCM7dxLHLZJ2uHJJPZIRyyDknDTEaBrbW0snsoQxrmdB?=
 =?us-ascii?Q?fxpVQ+jvV0avD97LAGUyLXeP3PqYiTruDd7JgyIkaQV1A61tRH4cCFXz55RZ?=
 =?us-ascii?Q?YecRYOOsuwEfu6upmbgAq7mGj4aVQB0nt1KsSObubPDYMqmpnTQUprOf7UIx?=
 =?us-ascii?Q?VnQqSS7JvmeqB3qpCOAHSlMgjgeQpFVzizTytjJ9+ejKe8A7/lOSGC3ZaUK6?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 137f91dd-abc6-4143-ecee-08db8dfe0d16
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:30:48.5537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9HO7cSLMjDb5sbyeNq0P114WUdAfN/TGQYC/8ht+NZXagMsiLSVVqrGAh1jM1WrIH75nD8mmh4Sf8gkbNiTYCfYuyuRG0jBT0g8Csv5/yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8183
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/10] drm/xe: Remove vma arg from
 xe_pte_encode()
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

On Wed, Jul 26, 2023 at 09:07:02AM -0700, Lucas De Marchi wrote:
> All the callers pass a NULL vma, so the buffer is always the BO. Remove
> the argument and the side effects of dealing with it.

You're right that it's only ever called with a NULL vma, but the vma
parameter was added for userptr support (null bo, vma only) in

        commit b01fd49ada0fa88c88aaa86529461c2feae09eed
        Author:     Matthew Brost <matthew.brost@intel.com>
        AuthorDate: Mon Apr 4 11:18:22 2022 -0700
        Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
        CommitDate: Thu Oct 20 14:21:59 2022 +0200

            drm/xe: Update VM PTE write code to accept a VMA argument
            
            This will help to implement userptr within the VMA.
            
            Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Did something change with how userptr is handled somewhere along the
line?  Is userptr working today?


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       |  8 ++---
>  drivers/gpu/drm/xe/xe_pt.c            | 47 ++++-----------------------
>  drivers/gpu/drm/xe/xe_pt.h            |  4 +--
>  4 files changed, 13 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index c332dc54cb70..9e9b228fe315 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
> +	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
>  	if (m->eng->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index bc7dac4e2086..3c7d5cfd30bc 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -196,8 +196,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = xe_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
> -				      XE_CACHE_WB, 0);
> +		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -215,8 +214,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -			entry = xe_pte_encode(NULL, batch, i,
> -					      XE_CACHE_WB, 0);
> +			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -1235,7 +1233,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			BUG_ON(pt_bo->size != SZ_4K);
>  
> -			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d5a237b7c883..ac01bc42e54f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -78,30 +78,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  	return pde;
>  }
>  
> -static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> -			   size_t page_size, bool *is_vram)
> -{
> -	if (xe_vma_is_null(vma)) {
> -		*is_vram = 0;
> -		return 0;
> -	}
> -
> -	if (xe_vma_is_userptr(vma)) {
> -		struct xe_res_cursor cur;
> -		u64 page;
> -
> -		*is_vram = false;
> -		page = offset >> PAGE_SHIFT;
> -		offset &= (PAGE_SIZE - 1);
> -
> -		xe_res_first_sg(vma->userptr.sg, page << PAGE_SHIFT, page_size,
> -				&cur);
> -		return xe_res_dma(&cur) + offset;
> -	} else {
> -		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
> -	}
> -}
> -
>  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  			struct xe_vma *vma, u32 pt_level)
>  {
> @@ -140,34 +116,25 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>  
>  /**
>   * xe_pte_encode() - Encode a page-table entry pointing to memory.
> - * @vma: The vma representing the memory to point to.
> - * @bo: If @vma is NULL, representing the memory to point to.
> - * @offset: The offset into @vma or @bo.
> + * @bo: The BO representing the memory to point to.
> + * @offset: The offset into @bo.
>   * @cache: The cache level indicating
>   * @pt_level: The page-table level of the page-table into which the entry
>   * is to be inserted.
>   *
>   * Return: An encoded page-table entry. No errors.
>   */
> -u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> -		  u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level)
>  {
>  	u64 pte;
>  	bool is_vram;
>  
> -	if (vma)
> -		pte = vma_addr(vma, offset, XE_PAGE_SIZE, &is_vram);
> -	else
> -		pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
> -
> -	if (is_vram) {
> +	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
> +	if (is_vram)
>  		pte |= XE_PPGTT_PTE_LM;
> -		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> -			pte |= XE_USM_PPGTT_PTE_AE;
> -	}
>  
> -	return __pte_encode(pte, cache, vma, pt_level);
> +	return __pte_encode(pte, cache, NULL, pt_level);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -179,7 +146,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  		return 0;
>  
>  	if (level == 0) {
> -		u64 empty = xe_pte_encode(NULL, vm->scratch_bo[id], 0,
> +		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
>  					  XE_CACHE_WB, 0);
>  
>  		return empty;
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index aaf4b7b851e2..bbb00d6461ff 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -48,7 +48,7 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  		  const enum xe_cache_level level);
>  
> -u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> -		  u64 offset, enum xe_cache_level cache,
> +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>  		  u32 pt_level);
> +
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
