Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2AFC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F61410E781;
	Thu, 13 Jul 2023 20:11:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B14010E781
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689279088; x=1720815088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tpmlftDXHGy9C5zcrUr0KOo7epxLipPLkFhood7nGLA=;
 b=Hs/0/tUs0631bUgE0ssK6f+l7gYPPdXCtY7+4PaRlOFBjffkL/jg9IIi
 V/fBZz9f4coFzk7NaRsLoBjYIXQH5uu5wbacxi4JAXIj8/qijMZYzB612
 8BffiM/y2CKwRiKAKxWOBmlD+lyMOV6HWcAWKDtXyW39K5PWPPaDsTOXQ
 f2whB7uqdzh1wnOEtn+GmSnefjqinLjqM19n3mTWmKgGwPoU6SOWBD8Bu
 mgP78dv4Oj1TDc6MAumwKhP141oJ4ecpXhPwl6BybXarkSX+lwSJ6M6BM
 tq+abOK1YplM44431B4IUqarzzxE55OnB1siuQUGsnopUKuk2et5xSC4W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364179166"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="364179166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="751781789"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="751781789"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 13 Jul 2023 13:11:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:11:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:11:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:11:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgXzZmJpXwoOaBWUfq97ZiFzscIUfFQuoI3Clhr+H5LVI7cABrlZAsaUprZ71nwrT+3ue0IGF1o4tVjzRTAtRsAfJ+Zi1j6a9gNAAAy7+73Xvf+E98pyEaQBUY4mbrVdv+uxxNArs3s7bRwQs8kgHCCighcIHn/VwvWGbw5Fwc9VXcnDolavNk8PBz+KxAjQHe2JWo6PXmMcWhsjyo3NIzN9gU2UoyszB90hSVqTjD4UodQyI1tYoSqJnvebBEEM679Nwd607MilkMTPfdHnXu/XT1OHS9vV8gV+n5ckc3Wp++HhtADf09ueWYfdpeIhzNQ1Cd00Yl/R//skd9TYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkFKvpq3esuyMdfiPLfEL3QvMSSehgiKZvsDGsyC1bs=;
 b=i83sN14wqmAqpRgwq5Fg7vAfptAP0uEB87wsFcJaHJ2cFPmqPIXRVfsMczHEPoqVEbExwDlalR9knuaU7LsjiWgJSkFlKXxBX7qaywnDgs6TF+jKNVaOrH5IcMKeFyrjX80/gnDnm+Y9ozYd+EEk4EHfb9ijsgx8m8nLcnwOSh4+GfmPb+7/zOnXWR66y9vY0RUlQu/Oghb74aeB0MqmyeIrDjk0Pd35nVrpx7h5Zu+5bcaVJtjxmH6MrCushGe137F90Ovzh46dwrM2hPwYtOf9c4SZ8D76+cXJty/Mp7WkXWMJYt/bTb9OJQZt16ssCFu1g02oDKTJma4SS0/TCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 20:11:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:11:24 +0000
Date: Thu, 13 Jul 2023 16:11:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLBaaPdWo08TzzE+@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711212748.2029455-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce72b58-48c7-4d34-fbff-08db83dd5548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OypteeZFLwkVcD03v6CioL42e3QWedvFnIr8TvDTC4pvepFaleY0tInsUZR9UonjOiVm9GCSS7RMRtkB71BxsCtF1DFIGzG+Dsz3SPQLQLxpRv2pKrXm+PMtkHdEXkPmbOzsth3e6e2VCQ+W1FiHUdn7f5IIA2lgXyBNuJKwXlRWqazF1Ij5WhG2EvczH9oZMLgNKfJuKgD2BWHTVeFvY7nCwUKFq1rpF6jofNZl5owzr0v9decgatCGAK37QsJxV4EcMSbiQ2kKGm/gtWXHyPuVpC7tWK9h1vjxTf/d7izCeQrdLFCy34+xR1hbi+g95VJyUTdVhNP84IYZyXmYk5SNqHv9aWjGQWuNafB5ymMzwYNy41PYZ0swb07ZRRYiJndpVM8K9xg22seiAXEdJfXZvasRvkbeMYv5+oojeMYqwX8cvK8CPbLFe0L2WA1JmbOWPIXMpUCVgkxR4aNN6w2lObmzq6FA3fw1BDKlMKCVBkm9yVuKQZro1Ixst4p+HFPPjD3voFcBQ0vyhnRAAvqz8l24/FXnLQLwroKi9homiKJONtmBgD6L0MOTGKpqT2D59GaCFpR2YQI8aj5WblmJheuxL6fGuM9kmwFB5DFo6NzZjhMeW3nf9TBbV+lOO/Isby+2hGBi/OcCQYWxcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(478600001)(6486002)(6666004)(37006003)(83380400001)(2616005)(36756003)(86362001)(2906002)(26005)(6506007)(186003)(6512007)(82960400001)(38100700002)(4326008)(66946007)(66476007)(41300700001)(316002)(6862004)(5660300002)(6636002)(44832011)(66556008)(8936002)(8676002)(21314003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aL2G27hhwsGVZSsT4avBxuf8bWOYyGldRU/+3dO+tDojcxw89+/ix33Uk3Vt?=
 =?us-ascii?Q?Mpu3gEa2LVudyLjLxaUVHI5Vx1yKjLm849/wvlQsjH9++YvcAAH09esh/LrC?=
 =?us-ascii?Q?ov+gfbKexGKlpEYR9N+lkzjmZU3SWpwSTVAz/qwc5rnMF0yaEDe2FZn3A5P/?=
 =?us-ascii?Q?92yvAK3cpfI1ezXb8JDPw740YrJS6D67VQrHpbCGjlsMhSpcI9aAsY+1FBBV?=
 =?us-ascii?Q?wNuaNUbBgRNOFKygYLpeGG9y6DDNawONQLeJOq9B0qhuQ8EyBObaqgaMOxKH?=
 =?us-ascii?Q?6keG+l/YR7aQqDgtbV0LMziBhGHspFhglbBPNyYWm1EXPav86dlTmKC+vKPT?=
 =?us-ascii?Q?AByb/ex41KaAxLq4O7D7OsW650+ILVl8GSgW/Bl1BrTszDZHW6SfeEy27eey?=
 =?us-ascii?Q?2ABm0FGlELXXjNcSWb+So1DPdlEGlvdRavJAz/Zo2vqrFYyZ1JhK2VeeZicV?=
 =?us-ascii?Q?UwOAKWAiEBmt+qwlMoe+VUsRlwWcCBAUZgYqq5KHyjNcqwwsUK//CKX2nsKE?=
 =?us-ascii?Q?tHvzQXqbOj4Z4FWGglAV5i3GR3iIGzBJgbCo8yvXKrwIAkcPr7t8g9rcrBhB?=
 =?us-ascii?Q?AWgNUnXXQNaxyzYCWDimq3WmeTAXEAANdgqXryPCaKzg0FKAvapfuIH/0aUy?=
 =?us-ascii?Q?oKl/Zz/bKQEvbwjbBsdZDfLx6a++Wjn4zemqoO/4nMFYmFhYYMOxe1bAtjsa?=
 =?us-ascii?Q?DEkp7T2trUcwL//BATvXgHgT5RI+b8RuH668lX3ikTa1nSJzmg4sq7+ji1GZ?=
 =?us-ascii?Q?n3KEndjO8rWlj+QofqJswr8PjxEWjZez9PWbV6RvQfbzWbG2EAcKGbSM1Qy7?=
 =?us-ascii?Q?ysIoESU25O+aKxidMEC3MY7+q1sUvzoorVMSarHMOK4MqhQbLzmxLpjVOr48?=
 =?us-ascii?Q?4mdjbGjWx3kMEdfpeJH5st8h6ZYXNrQ+RXS7qrKZyiKsfMfj0isRaX7DUKQ9?=
 =?us-ascii?Q?kfTlBHHEqK+Fof9FaL0l0wFnuEoYthvDRgCVIcd84KjaVs+pehbezMwsW6OU?=
 =?us-ascii?Q?mhtqBqU2IHJi1jfCpDW1Io4O3BeNN8H3VYR3haU0/pouEkH38+KXo/nke3HA?=
 =?us-ascii?Q?trrdvWQDPnHUyHO/aZPH9Uip6cuCQVg5SLotqQXXme4DeaJmj//FcSrRCOV5?=
 =?us-ascii?Q?0TTB1aLQbo4QIwon6h2ZwfYfAFTbTB6xcCyUw3ObwxfHWK1qdFgImVAvmHyU?=
 =?us-ascii?Q?GItYLAHAEJc/P/4lC86ykZSTYzaErGCXE+4H1DJFjNyqlsyw7BzZyXxkCWNR?=
 =?us-ascii?Q?m0lmAChOiA/zbHlnAb73HWj05Dnbcsi3h6ashHpd/BESnJQ5xvjVhuFoPA78?=
 =?us-ascii?Q?gam7siqwaVMSkwn3+kZ9mILRGeGKYi2Ra1Q4dSwNPcsOyh8pykfEWIXSHqBa?=
 =?us-ascii?Q?zLh4wb7oAq1bAkR44sE3vQAgmSOIRugjmLdazWM5DAFdrZdiCz7nW8X11C4T?=
 =?us-ascii?Q?ekWbBOsE+eqdC3imdPHyP9EI3inhOoC+zpAO/ZDCey+Eb31zyclpVyLFx8g6?=
 =?us-ascii?Q?tOg7KR29PKkzdVK1lwLAKUAII5a7cygG6G4V7TPXfc/vWcrGBDhIscmICBdG?=
 =?us-ascii?Q?D5beHmDo/LWJn5PCtT9tegJfkZuHLRBDmrPa/bnatZN3+O9t61VYdN440UC/?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce72b58-48c7-4d34-fbff-08db83dd5548
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:11:24.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+b6tPC3sfST4vbgq2ZGQG/xud94mm+//4niOvJ909yr0gW3UOWcwJ1rb/qUHkLJW/gZfeSH4HKD2M3ttOXe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Avoid doing rebinds
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

On Tue, Jul 11, 2023 at 02:27:44PM -0700, Matthew Brost wrote:
> If we dont change page sizes we can avoid doing rebinds rather just do a
> partial unbind. The algorithm to determine its page size is greedy as we
> assume all pages in the removed VMA are the largest page used in the
> VMA.
> 
> v2: Don't exceed 100 lines
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 72 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
>  3 files changed, 65 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00855681c0d5..a8d96cbd53e3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -668,6 +668,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (!is_null)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
> +		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>  		*action = ACTION_CONTINUE;
>  
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..5f4f6dab270a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2385,6 +2385,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	return vma;
>  }
>  
> +static u64 xe_vma_max_pte_size(struct xe_vma *vma)
> +{
> +	if (vma->gpuva.flags & XE_VMA_PTE_1G)
> +		return SZ_1G;
> +	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> +		return SZ_2M;
> +
> +	return SZ_4K;
> +}
> +
>  /*
>   * Parse operations list and create any resources needed for the operations
>   * prior to fully committing to the operations. This setup can fail.
> @@ -2461,6 +2471,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  				break;
>  			}
>  			case DRM_GPUVA_OP_REMAP:
> +			{
> +				struct xe_vma *old =
> +					gpuva_to_vma(op->base.remap.unmap->va);
> +
> +				op->remap.start = xe_vma_start(old);
> +				op->remap.range = xe_vma_size(old);
> +
>  				if (op->base.remap.prev) {
>  					struct xe_vma *vma;
>  					bool read_only =
> @@ -2479,6 +2496,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.prev = vma;
> +
> +					/*
> +					 * XXX: Userptr creates a new SG mapping
> +					 * so we must also rebind.
> +					 */
> +					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_end(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_prev) {
> +						op->remap.range -=
> +							xe_vma_end(vma) -
> +							xe_vma_start(old);
> +						op->remap.start = xe_vma_end(vma);
> +					}
>  				}
>  
>  				if (op->base.remap.next) {
> @@ -2500,20 +2531,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.next = vma;
> +					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_start(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_next)
> +						op->remap.range -=
> +							xe_vma_end(old) -
> +							xe_vma_start(vma);
>  				}
> -
> -				/* XXX: Support no doing remaps */
> -				op->remap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
> -				op->remap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
>  				break;
> +			}
>  			case DRM_GPUVA_OP_UNMAP:
> -				op->unmap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
> -				op->unmap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
> -				break;
>  			case DRM_GPUVA_OP_PREFETCH:
>  				/* Nothing to do */
>  				break;
> @@ -2555,10 +2583,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	case DRM_GPUVA_OP_REMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
>  				 true);
> -		if (op->remap.prev)
> +
> +		if (op->remap.prev) {
>  			err |= xe_vm_insert_vma(vm, op->remap.prev);
> -		if (op->remap.next)
> +			if (!err && op->remap.skip_prev)
> +				op->remap.prev = NULL;
> +		}
> +		if (op->remap.next) {
>  			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err && op->remap.skip_next)
> +				op->remap.next = NULL;
> +		}
> +
> +		/* Adjust for partial unbind after removin VMA from VM */
> +		if (!err) {
> +			op->base.remap.unmap->va->va.addr = op->remap.start;
> +			op->base.remap.unmap->va->va.range = op->remap.range;
> +		}
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> @@ -2628,9 +2669,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		bool next = !!op->remap.next;
>  
>  		if (!op->remap.unmap_done) {
> -			vm->async_ops.munmap_rebind_inflight = true;
> -			if (prev || next)
> +			if (prev || next) {
> +				vm->async_ops.munmap_rebind_inflight = true;
>  				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
> +			}
>  			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
>  					   op->num_syncs,
>  					   !prev && !next ? op->fence : NULL,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index edb3c99a9c81..f17dc5d7370e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -29,6 +29,9 @@ struct xe_vm;
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
>  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
>  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
> +#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
> +#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
> +#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
>  
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
> @@ -326,14 +329,6 @@ struct xe_vma_op_map {
>  	bool is_null;
>  };
>  
> -/** struct xe_vma_op_unmap - VMA unmap operation */
> -struct xe_vma_op_unmap {
> -	/** @start: start of the VMA unmap */
> -	u64 start;
> -	/** @range: range of the VMA unmap */
> -	u64 range;
> -};
> -
>  /** struct xe_vma_op_remap - VMA remap operation */
>  struct xe_vma_op_remap {
>  	/** @prev: VMA preceding part of a split mapping */
> @@ -344,6 +339,10 @@ struct xe_vma_op_remap {
>  	u64 start;
>  	/** @range: range of the VMA unmap */
>  	u64 range;
> +	/** @skip_prev: skip prev rebind */
> +	bool skip_prev;
> +	/** @skip_next: skip next rebind */
> +	bool skip_next;
>  	/** @unmap_done: unmap operation in done */
>  	bool unmap_done;
>  };
> @@ -401,8 +400,6 @@ struct xe_vma_op {
>  	union {
>  		/** @map: VMA map operation specific data */
>  		struct xe_vma_op_map map;
> -		/** @unmap: VMA unmap operation specific data */
> -		struct xe_vma_op_unmap unmap;

oh, and on the previous email I forgot the most important doubt...
this patch here seems to be entirely removing the unmap op, but this
is not explained in the commit msg...
so, is this a material for a separated patch?

>  		/** @remap: VMA remap operation specific data */
>  		struct xe_vma_op_remap remap;
>  		/** @prefetch: VMA prefetch operation specific data */
> -- 
> 2.34.1
> 
