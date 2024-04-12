Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27910C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 18:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB010F7C1;
	Fri, 12 Apr 2024 18:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcN6UkW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591810F7C1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712947122; x=1744483122;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iAgtvTO9uDyNJoa38ApIrdoGJCZLjNxFzjQgHG8+L0c=;
 b=hcN6UkW0XdAtkRSrSc1spBD6Fx0aSUBsDAQX8uVJgks1eiwQXY9pXhIR
 Xc746cWMS0XlN6UTBAaEjHeN9E2+roirveXs9QzCKsKOTXdVu0IB7PN6O
 F61C2aHHQyYjF2PD49+uMdL4tLp66MoXd+tg6XXEviOeJ8azx8Z4T6sw4
 RkYOEFd3piN9E+O4YzOERcsREj3A15xWzlXTN/Ga8kz12yUBUqPLlp5Cq
 J4+Q4vU4jtD7n627Mvs+Hertp7j0ZhUir/uLbQ1Zy5FlJmCOB8Vo8oitt
 P8JL1GuEhDtMpl4ByvY1HAx9KDzTP41PywMuAdkHxQe5bWnA8+HSiX+vA Q==;
X-CSE-ConnectionGUID: u9bFO6rwREKQUPRHYlp+uw==
X-CSE-MsgGUID: yFbu9/PfTaKa+FFAQ+DONg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="18972126"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="18972126"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:38:41 -0700
X-CSE-ConnectionGUID: 8MKwhaxcTRi/L2BxTDBQ3A==
X-CSE-MsgGUID: eXoWBPxkTSik/izVNg8w+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="44569262"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 11:38:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:38:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:38:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 11:38:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 11:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0sZu9qOllzNHGf6JgCJxb78RNXR56kvprtV7x7ewoHHLjd8mOGnvDAsFNwP0s42huVxEeCDuLMQdC/M4PoRCeXKS/5X/WFaqFGhB+a4DlMOeh8IeOEfYLTENllIkQ6YaBZfw2cIosxKCRGooLU9N7kqTI8Fzuv6kwbF4fRVq2RfUw6Yu7W0J4Z6Ki8k+8xoJK8792LtMHhDZz6GfKNbuphoD0Lp4e6GfVUnv1GdTHnvPALhEqjQfLLIZdYvhrhsehDlYQHgPQ6KR5ixL4mhDPVnuKr8SpVD8Xm9u8ReOcgf3PyNOEUcc+Hz69I7UgB5zlC6FEDacizvQvPUy43Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/XFt5101HWdDddch/bY4wvbiPtBwIZiNgpjS7i7ZkU=;
 b=AuB+/MgQcoYXin/wTG4GvCm61pwhB+PkPS0gqqvOOv0UlnDTUeH94YBafY7RdnSAtKzXsDJvs7zzXoTzdUyuJlWZ1qmKpt/OAO9GiVVhcGV/sxF5r9k4yt5ABR0Xq69El229PKd225K12RzeBlIjbqE2mSPjmR7v8ChYBhJpluFYmIZ5gsvo/abEeYI6CdQPmij3aM/pixG/83leH1AGSC5FsR2rYunODdjfAtk/3lFCaVfj58hdEIw3Wk/Vb9QtVirnSFYGOlIwJWu7DaFaMsSUyS9e9mlb6aqxPMhuA25uycRORqqA03FAy83QqFcOazkDHvxL0KZhN3k8jWg2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 18:38:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 18:38:39 +0000
Date: Fri, 12 Apr 2024 18:37:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/7] drm/xe: Move vm bind bo validation to a helper
 function
Message-ID: <Zhl/ZezQ6w8CSWJa@DUT025-TGLU.fm.intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
 <20240412092249.3636-5-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240412092249.3636-5-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 6687a5bd-a9eb-4149-f856-08dc5b1fc525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9WY8FM/r49MpW0i0loY4nSK4gQLeM2VGk0dwCSiT3eVTCt2MwtfcTEWpMNMuiwTsLa2G6DVqaJn4DHaUWQID/KWlXO7hMh6xyKYHddBmFaoZSFm7HQ/HyZ4aj81/7iYi9F6sLN5pRJ2JPaICrjhqpDx1fkR0huFaWbWvpXLgEA14kvyKO6vfBjxgoQmD3DQrn04w2PVciONDESgWBwcwJbQMQm5gACNQTiCPIF2TfdRsROtcts1Khs5tUWkOaaFRKI6GDoPZ/UjU4rJA/XbX9MwTZm7bPps9dcyZtxSWCl/wjCClunqCoCZ2YNgh4a/s0UKga8wVv9F/z2mWxFimvv4mkdWzY1kWC6vLeKmv9V6UY3aNsrUZgwGueYZJBXb9RjNp0MQr2C6b0WaK4fapSBCJKi2d0eL/i/T+84LbRV4lofeMnOMLZzCFPc3LwVazJ73IyoNkF/Hqj3PPmJAUTfkgs2ajmFGKd7tQobj9Dp3zCW0dtFaX8i12IrVHCaxOvPaPdKMoYZxmRaPC5BdQNMqfjyeay/LDDFG5OJ05Ldn1s6iLqMzJ7LV7kRg/3ZFYLFGRL0lDEaGnykgnzo1d+EhVs4gzUCEPGntigfxE9eC1hJ2NOLSDcy031kOJRivLHHFjkmrLi9GmqRnvvxBgmhgv9Lr+4nMkGkumIG746Q0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FK2O0z6VPEP+GkS+CRX4Dfi+yaG+lqfak9Orr5hIbMdUTwTW4g7aB/VCyCwl?=
 =?us-ascii?Q?PG1i6M0lp1eehxJFLS/w/umHmw2Z2SHJ/UEVUZlM7pzUF3U6nIIhGq9YlMZF?=
 =?us-ascii?Q?7A3djIz9YM/SiEZhjxrGKDrw+LBcA7l23fPoLjawXLFl3zar/i9wy5XnWyA/?=
 =?us-ascii?Q?F0kEIK8LiB+HVvRLaQGDqrp7VQPKCLIh84lhYZQdUDgxuGXstTgWmeV8vRnt?=
 =?us-ascii?Q?WMKl5muGtn5UlGm+4St2T4lzAqcRe4EgKfC6k0bHBV+UjmFaPTiPZQrjuFYO?=
 =?us-ascii?Q?ciYdPH3p8CkThZ78cAgeF54DG+K6C5w6/l6BqbROM8AWc/OWIFR8dnd67iLk?=
 =?us-ascii?Q?C/+cBAe1y7PBjutehHkNFIlKpa6Od9x+x35BSSTditOgZPiP78kR6pXsq0NC?=
 =?us-ascii?Q?iS62uANN8WfiY7yogaQWGV75vG30cKRZFo/aL8OKE5NuvFhHudW7qQ2gcd4i?=
 =?us-ascii?Q?4nxat29Lb2FC66brtH66N2US05DYRYZrXq6Xvus5SX20wW71dgUqv6PRdbjp?=
 =?us-ascii?Q?K3MxpHUiNK0GsNMYDaLBI9Z0D3ykdP5A/sFEBKo0SUlGLbEarGZE2nM/BOSd?=
 =?us-ascii?Q?M3xqWzP6PzJpPa9wPEDEGxJycQJpbtAvkliuD+86/B8eRj0kjKHVAODn0pHo?=
 =?us-ascii?Q?nusadi1hyJGhJBJ4JKm8Cgo8ZLp/X07Q5XHZAkgVYVncxI7Q5kMO5QPzGxnk?=
 =?us-ascii?Q?mxCqURrkif94jzW5fvY+cvrcTK0uNt93K7YHdRR/7F7PB0YFsUOUATODMEXn?=
 =?us-ascii?Q?CPXkQV+Icn99YnpQ68nhmsEP/Cn7/pmAN8PTp3zUstXhcb0uRzcMjODKbx7d?=
 =?us-ascii?Q?14FAVdo+NTScZTmf/YbcbQY1g4eRz/FiZivF4VM87TpZXOeHViCD+biKtYMu?=
 =?us-ascii?Q?rMqSAmuapos8tRZH9g21iYbQ3ykCkukDmCF5OOW5tcHSqPVEEGX9N0mPCwiH?=
 =?us-ascii?Q?AbWrOzjhDA+xlIp9TxLFjRG1EUySMDwOrC6i/LDbzqfkbvYZz6RGDGiweEg6?=
 =?us-ascii?Q?N9vlKDLohwGw6RugLew23Q/BZbr0kbqMNOdVdr1pAUkZ8eHqwza+JuEnja6q?=
 =?us-ascii?Q?NrSmVb5i3J46XkUz7CC/rQ4z0BXrJgyhUjG+aJRtMbsiBeZNr8H2rzU5vtrg?=
 =?us-ascii?Q?HGuDswHztZzDMitPRrdd9VxPFf1pkdV/zdYkaBtFMuka2bogBUyaGFn8PiXn?=
 =?us-ascii?Q?9lOWfMfzJltgjNd4gi/J1fPhpgncl3z1o7cUnD9dm7E3QnFP5zNPniokvye4?=
 =?us-ascii?Q?Za1SU3tOeGvXgj52kDqjB0eQjZ9CGfmL6Xon9uOR/9heWQKgsmN9WbIx1w2+?=
 =?us-ascii?Q?lq5ramKgS+2KsTlNQ+Q83NoFL0Qcx8bUsvYYyN8WRkq32IPuqaGMtzVyT+0Y?=
 =?us-ascii?Q?Zsg9obgcvpoJ5d0OmTc8FfSf9eAXex7MVMeF5E8rzKaTij5Z60XWm4VlozXa?=
 =?us-ascii?Q?1Rqihddo20gHzZEWanIQc0fRR4sXnMiieCTZ69tq77Wo84dtdzbpEAPeJr0Q?=
 =?us-ascii?Q?a8YXXiEAeKYhPS9errCIRcMDN+V1ET4fqsYfJpLFfw658OMZ9doHyHjHT5LD?=
 =?us-ascii?Q?o/o47fzdQP5uuQYi4C2SP6Nmzf4jmQLLOiwqsqkQTaSEQmmc7sN5Kc1yD738?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6687a5bd-a9eb-4149-f856-08dc5b1fc525
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 18:38:39.0440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAACe37IFrnkfbWHYZ19EPg0E3iDCicoonzuhdH3qyQFcK90zIOwJuLqYVxiDDQrbdKB6IojQ5D+GYo1zrL+xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

On Fri, Apr 12, 2024 at 11:22:46AM +0200, Nirmoy Das wrote:
> Move vm bind bo validation to a helper function to make the
> xe_vm_bind_ioctl() more readable.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 73 +++++++++++++++++++++-----------------
>  1 file changed, 41 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7991d88fba22..5e633014f017 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2972,6 +2972,44 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
> +					u64 addr, u64 range, u64 obj_offset,
> +					u16 coh_mode, u16 pat_index)
> +{
> +	if (XE_IOCTL_DBG(xe, range > bo->size) ||
> +	    XE_IOCTL_DBG(xe, obj_offset >
> +			 bo->size - range)) {
> +		return -EINVAL;
> +	}
> +
> +	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +		if (XE_IOCTL_DBG(xe, obj_offset &
> +				 XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> +		    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> +			return  -EINVAL;
> +		}
> +	}
> +
> +	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +	if (bo->cpu_caching) {
> +		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> +				 bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
> +			return  -EINVAL;
> +		}
> +	} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
> +		/*
> +		 * Imported dma-buf from a different device should
> +		 * require 1way or 2way coherency since we don't know
> +		 * how it was mapped on the CPU. Just assume is it
> +		 * potentially cached on CPU side.
> +		 */
> +		return  -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -3067,40 +3105,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  		bos[i] = gem_to_xe_bo(gem_obj);
>  
> -		if (XE_IOCTL_DBG(xe, range > bos[i]->size) ||
> -		    XE_IOCTL_DBG(xe, obj_offset >
> -				 bos[i]->size - range)) {
> -			err = -EINVAL;
> +		if (xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> +						 obj_offset, coh_mode,
> +						 pat_index))

err = xe_vm_bind_ioctl_validate_bo
if (err)
	goto put_obj;

Otherwise LGTM, thank for the patch.

Matt

>  			goto put_obj;
> -		}
>  
> -		if (bos[i]->flags & XE_BO_FLAG_INTERNAL_64K) {
> -			if (XE_IOCTL_DBG(xe, obj_offset &
> -					 XE_64K_PAGE_MASK) ||
> -			    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> -			    XE_IOCTL_DBG(xe, range & XE_64K_PAGE_MASK)) {
> -				err = -EINVAL;
> -				goto put_obj;
> -			}
> -		}
> -
> -		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> -		if (bos[i]->cpu_caching) {
> -			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> -					 bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
> -				err = -EINVAL;
> -				goto put_obj;
> -			}
> -		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
> -			/*
> -			 * Imported dma-buf from a different device should
> -			 * require 1way or 2way coherency since we don't know
> -			 * how it was mapped on the CPU. Just assume is it
> -			 * potentially cached on CPU side.
> -			 */
> -			err = -EINVAL;
> -			goto put_obj;
> -		}
>  	}
>  
>  	if (args->num_syncs) {
> -- 
> 2.42.0
> 
