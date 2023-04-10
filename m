Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE902C76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 21:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5A210E09B;
	Mon, 10 Apr 2023 21:52:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF9310E09B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681163576; x=1712699576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UsBcSdoAnnEdkp23cY33ojeQ/hb6sJOYVnIxY7ymzrY=;
 b=bUTjDiWBcrXa+swT3QqZ72NBUTdVgWQVWH/HiEWPicd9JYSxPVmUfkiv
 B8NjyyPIGh3k8aSKIKMTrQoIubpR+f+GrpATLXY9vwYjfR0MyAroOofmj
 ahvtxHhYG7TYLO9rUCUkWbTwkzi4ylVEadWS7SrvX4NJ573CMgAbmdQoR
 XM40ZEJHHJ+gCAZtKVjkT8uKutzzTIF6eYDcXxt42wW76fjl5lHtHjZAk
 lz9da93CGT1lsWD1VO6wxQBuTUb9r15wuESXR0wO65NFX1LcFePcyxn5D
 /+nY5hvG5DaaPXhrdmiU2LZQJKTX3pKSyA8GZCSQkb+22qQhL/5ZhoqSO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323096372"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323096372"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 14:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="690921026"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="690921026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2023 14:52:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 14:52:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 14:52:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 14:52:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 14:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4LnsgMksbm1x02PWEQ4caJG1eHn2P9tHlwXvINRR7gUNIoHe+WXHfcPIW+rzUlKsmOt4VB6c/e/PzCbraXcd//GJVI8eXQ1tZf7izX3AnUYuz54cfjOgZKQCqO0tZUeT2CsJJqchvon07Odab4oq5H0vn7KYPjYMM37p6jj7nGSFVZYeEZM4LJMEpiZ9gWPaDO05IeqE34w9e4UlOHHMy/xkQq5XZKcFD0ckzk/f6ADeKSevESMpGC83a566Vln5aKQrqrnfDQvCoC8r7DBHXVKMRUsRLCnDdvxHYtcoKoN+0d0CVwKh8haVpoU2Wg6ZtjjLdLkMDVRRRWqOS5rgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfbeoaJBRCSHZec3HLoEpyA8FFxuMWJtXYbu2RB/UzY=;
 b=B//YT1EE9ImMx0ZC9XQgvndVIlLYip0gpj8RLqb3zpZC7s3lv4s4ZRJUSHO898BTFmT7mfqlYLtgRuv7e7+5DFNlo4rV/Zkrr3hP4fAv/KKmRu9b//vgTQ5ZNNFtF3Gy/8SE+dEYhMBOD3uWJFjrYfPctZX4dBBs899uSrphrERZ+PCb1vAN7Lmza7FmpdWziKxN+tsOr+MKdtMafxlOns6vdM69RUTPBuadx+csysOURp+F2anblOGmh47fbDn4sXmwFCzcVOpw8yi6JPwbM0fk7Icn5mJwZ4YCmxINMPDF79lojaEcfCMBnamiBqQ1TRD4O8tpm8+yqvagAeTliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 21:52:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 21:52:51 +0000
Date: Mon, 10 Apr 2023 17:52:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZDSFL7IUDLTHaBIe@intel.com>
References: <20230410213433.625866-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410213433.625866-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: ad29d192-4806-4584-5930-08db3a0dee47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cH4eKtlgJdr0qY77b5GhsfpqSwwWsSn4akzWxJ+ATbSgxRX2yP9yP5HxqK8sX/HnoRRmQmZkQjgnKEM+ngHoTfl7GSM9id1EkpfL+cgS39PPwiv6fjVAmwHNYuOYoumrEG+4v5+IPFzkM9+1Lvt2KSpzXo1q8l/Aps+TWDUH95WMwehhMcLNtiL5NAYJPkFLYmBV/QV4AT5VDeaL9Qzt9MzSI5v3gqKqVmfVAhtqaSA9sD2dMbDBF2x5wwgbDyiElvJSeY8oM40Y8At4xqYfdKQensZ+vbvZ+WQP8AVY2OP3KwSa7wZYT/jqxAqUjt/CCjMgjZq65H5+dP8AeIBBTtm1Q85nDoJ6izGyxX2tBVn8DDUrb2VChXOqvkWCdMfCxM4FvPog0ROJQUh06y0Gp+apm7/YztLV7zcelWqVBbwIX4r95So+dgtGuIPtU78PG2bVuFruvac39ELhJjB2A0Ux6pznk7X/tFbrUqocZ+DYZDCbyop0297RxWKhjcsJ0iHTLV8ouTPGk2jYulbd7+BN7QfHLF06xUE5zOr9W1bc8Vx+1ByUgBGAaE9E6TeI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(6666004)(38100700002)(8676002)(8936002)(6862004)(316002)(82960400001)(41300700001)(66556008)(4326008)(66476007)(66946007)(478600001)(6636002)(37006003)(186003)(36756003)(2906002)(6512007)(26005)(6506007)(83380400001)(2616005)(86362001)(5660300002)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JSYtCPJLi540eeAgUy523P44jckCM3PBUTgUgTR6pH5zvhgq47PjZkiXCZAv?=
 =?us-ascii?Q?4yVxhcXXMovg/0Xw8XwJG3j1gWC+BPcNhxX0k7iNMAl9DzACpbAeVTmk0a/G?=
 =?us-ascii?Q?GA5FkSwefcq4g84ZQnVomzzINXjk0pOitUy2Q1bkoLngZ+hs/H1uxQdbQtcu?=
 =?us-ascii?Q?XafCoavr35df3dtHK8kR4VkmZjub/yCPDc5FDmUKzgkW9QNSXUGkoJ/qkWEa?=
 =?us-ascii?Q?Fl1I7wJbu/iNBS96sIGA+cIkNVZL3QfeS8NjpViivij6MYJJEwbRlKXhkQZm?=
 =?us-ascii?Q?GpHZOEQiydHh+SEv7JLfQh+9162gaIiJKpMAim/Okt0oWHIOe4ZI4/pV23zR?=
 =?us-ascii?Q?HYd9GejQeMKGaB6D+3675zHa9294UC17LGY+JRoK7NQMynwY07npKXZegZ9s?=
 =?us-ascii?Q?wjUx9PmOTFsMYFj4Vau9BdgY36Q4OjhOeNcQfKzymF5WNu2WmC1zrnwrAS0G?=
 =?us-ascii?Q?F9LPtexC1/ebWMTw9GO5iMEFQ9R1IctmR7aqSku9CKlSIUy4i4UJUBL9K2sd?=
 =?us-ascii?Q?100EeKDkSj1Ckk7rjjp/e5WuB3dFKV0FhIXalTNP9u8HueZPFwdiLDkr3lrL?=
 =?us-ascii?Q?+vu5PbP6AtbqcK+oujhU6jjYYwe+ygiwlzrvVWAjJn75wpxsfwhpTaQax6Lu?=
 =?us-ascii?Q?tR0GloLhzfb6WWxXMJba5epqobisbwywa1o8aRJc7RU2FmlxnsJIzjLhEeuZ?=
 =?us-ascii?Q?auZsgjDKVOohdkqKa9CTIFmiKjdzxFXwxHuTI3p3l3iKyJYCvzHNlxp2IGaH?=
 =?us-ascii?Q?pk3y1dkf8LnV1mlIwgsnPn1n/Pzd6HXEbac6gWXEdqMybVjAIO9bCRkg7n6y?=
 =?us-ascii?Q?jv0iSq7TLL6aASwm0NzG6W3zgtQo94OeNLrtvLbb8g076QIqvEE9oNfUsbLG?=
 =?us-ascii?Q?WgsfZlS0Nmhja6SEc/L0mGeiRm/T8othy8SOOswKmXRaXNRYcfC1YSSWkI6I?=
 =?us-ascii?Q?rAwkLW/oPzupkCAbrTX1W3SJeyRzIKUP9zdng+nX/NrsL11PTvAO7ddrxqte?=
 =?us-ascii?Q?4RwhH69UhAhJ16bXCM6eGq9xusxDMNlQUIgQh6GvcdFeuMGerLITo4tiTGjB?=
 =?us-ascii?Q?GGDNvkYwCXeQGt0D/76rpohbYJPySYgLRfoxQXynN0hn+3VvpBFuyChm1o9y?=
 =?us-ascii?Q?wm9kzRu0JFFHD+T6Nn1364c1ys6IFeqZdivCrPs3wyIFpmaq1KcGTbq9+7O4?=
 =?us-ascii?Q?hk7VG63tENs94COLw2D+KEblsatP99IS8a6Lm4FuEtJcuhMCZO/5EwjLZBLK?=
 =?us-ascii?Q?HLPdhLIOyJFBsmNW4eE9cpQxareXVCGaiyZnJQgevwiGjNsucXa10Ssh391t?=
 =?us-ascii?Q?7yC+MeyFkbGCjnSK3btvvRp9cqwLp2F03/l3uItIvMTRcBBzS/DgmVEGxJaD?=
 =?us-ascii?Q?UPB/0Ud+IJGb+J4eFMnv0Z9wUndEVbReiaqXVo8wRCkQxOnJeGmlkvH6N71x?=
 =?us-ascii?Q?5jZHyvjzpQmZzOKxLVW6Yzvg6DuFEllD65cdYZseCGmW6F/esIZD4eS9Uybr?=
 =?us-ascii?Q?EmJrllsuP4vgN0UmdQxa/kMS3hR2hdFtEyXDPllIIV2FHP0bj2w/5t86F5Ox?=
 =?us-ascii?Q?kuYt3Bn0dIwBdt879LtYUO5jMJa6W9lDGvEvQpv1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad29d192-4806-4584-5930-08db3a0dee47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 21:52:51.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaBcSBKZX6YxFcgJOH8sf4uCi55ER3KG9o5A9R4U68/uBolcj7ImL5TyG7cISWTjD6aYddzKGskRNWuETgDAbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Don't grab runtime PM ref in engine
 create IOCTL
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

On Mon, Apr 10, 2023 at 02:34:33PM -0700, Matthew Brost wrote:
> A VM had a runtime PM ref, a engine can't be created without a VM, and
> the engine holds a ref to the VM thus this is unnecessary. Beyond that
> taking a ref in the engine create IOCTL and dropping it in the destroy
> IOCTL is wrong as a user doesn't have to call the destroy IOCTL (e.g.
> they can just kill the process or close the driver FD). If a user does
> this PM refs are leaked.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I could swear that I had already killed the pm ref from the engine!

we do only need in the vm...

I had previously faced this issue when we introduced the display...

it probably got lost in an old branch...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_engine.c | 43 ++++++++++------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 37209b13bcd6..094ec17d3004 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -539,8 +539,6 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_ERR(xe, eci[0].gt_id >= xe->info.tile_count))
>  	       return -EINVAL;
>  
> -	xe_pm_runtime_get(xe);
> -
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		for_each_gt(gt, xe, id) {
>  			struct xe_engine *new;
> @@ -552,16 +550,12 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  			logical_mask = bind_engine_logical_mask(xe, gt, eci,
>  								args->width,
>  								args->num_placements);
> -			if (XE_IOCTL_ERR(xe, !logical_mask)) {
> -				err = -EINVAL;
> -				goto put_rpm;
> -			}
> +			if (XE_IOCTL_ERR(xe, !logical_mask))
> +				return -EINVAL;
>  
>  			hwe = find_hw_engine(xe, eci[0]);
> -			if (XE_IOCTL_ERR(xe, !hwe)) {
> -				err = -EINVAL;
> -				goto put_rpm;
> -			}
> +			if (XE_IOCTL_ERR(xe, !hwe))
> +				return -EINVAL;
>  
>  			migrate_vm = xe_migrate_get_vm(gt->migrate);
>  			new = xe_engine_create(xe, migrate_vm, logical_mask,
> @@ -576,7 +570,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  				err = PTR_ERR(new);
>  				if (e)
>  					goto put_engine;
> -				goto put_rpm;
> +				return err;
>  			}
>  			if (id == 0)
>  				e = new;
> @@ -589,30 +583,22 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  		logical_mask = calc_validate_logical_mask(xe, gt, eci,
>  							  args->width,
>  							  args->num_placements);
> -		if (XE_IOCTL_ERR(xe, !logical_mask)) {
> -			err = -EINVAL;
> -			goto put_rpm;
> -		}
> +		if (XE_IOCTL_ERR(xe, !logical_mask))
> +			return -EINVAL;
>  
>  		hwe = find_hw_engine(xe, eci[0]);
> -		if (XE_IOCTL_ERR(xe, !hwe)) {
> -			err = -EINVAL;
> -			goto put_rpm;
> -		}
> +		if (XE_IOCTL_ERR(xe, !hwe))
> +			return -EINVAL;
>  
>  		vm = xe_vm_lookup(xef, args->vm_id);
> -		if (XE_IOCTL_ERR(xe, !vm)) {
> -			err = -ENOENT;
> -			goto put_rpm;
> -		}
> +		if (XE_IOCTL_ERR(xe, !vm))
> +			return -ENOENT;
>  
>  		e = xe_engine_create(xe, vm, logical_mask,
>  				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
>  		xe_vm_put(vm);
> -		if (IS_ERR(e)) {
> -			err = PTR_ERR(e);
> -			goto put_rpm;
> -		}
> +		if (IS_ERR(e))
> +			return PTR_ERR(e);
>  	}
>  
>  	if (args->extensions) {
> @@ -642,8 +628,6 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  put_engine:
>  	xe_engine_kill(e);
>  	xe_engine_put(e);
> -put_rpm:
> -	xe_pm_runtime_put(xe);
>  	return err;
>  }
>  
> @@ -750,7 +734,6 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
>  
>  	trace_xe_engine_close(e);
>  	xe_engine_put(e);
> -	xe_pm_runtime_put(xe);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
