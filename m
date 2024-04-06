Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F34CD1292
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 04:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F373E10EE34;
	Sat,  6 Apr 2024 04:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP+PeZoa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3518910EE38
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712376265; x=1743912265;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SiF86ttKE/EHeiaDmDxhHZfiWViQKWtU514S8oK4Bcw=;
 b=mP+PeZoa4HWPtM/j8Y538gkhyvIGZyChQxfXVH9Do6UKCEnbppAHz6gS
 gi758a23qD1BL2Lma8wf6gPnF/RsYUpY1QNL2XezdlBR6r2+nfHhtHz9T
 Nl3A1d1Z/RhPnEpPvlutucQ0H1KX5z3vZ9jsLxkMh86rHH150mk3xHqwA
 jdRs3lOD3NUEiI1LQxTHlhDomJHDtSakVdAJ5pJKp6YB3YgGIVRw/v+18
 dduElvVN+ozw+BpxNTh8W1la4oyFKbqMGLV/078M7CeDGtg1fi3rJukUZ
 o4epWZW76/2xeelY7h/b4+vj4sFgAgEnx3T/4AB85ZLNcQDVjPsXLirGB g==;
X-CSE-ConnectionGUID: 7upj+r+DT2CAMflrtLJ1OQ==
X-CSE-MsgGUID: hUwcOn6qQ9eTmMLdcFXtfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7576137"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7576137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 21:04:24 -0700
X-CSE-ConnectionGUID: 5af4JNYlSrqRx43UYmX6kQ==
X-CSE-MsgGUID: jlqZMnaGQLStwa3jwgdb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="23845883"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 21:04:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 21:04:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 21:04:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 21:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvjLny207ndHucCCphEQ93YxzkhqK388ayGfxg6U2KIY4bBd1pINFwzgLI+2sFgshlnB8oeAGDI6L2Wg1+KszfUGAyLgtG0v9460sy4BnNOHZG9CONiHiDmGFZvkxgCzeZZkfHruH5jSzcLtMb0POpp2a56qRRdC+ddgQ6HD60AoMn6lSDHAu4CKNZbUkQlhfKVXIgx7WS/qihByT7N4Y0eiYZ3kevL6D9dGhyiUpWlMtLbCZU6ycpkRJ6PCFM3e81bFPE247+83rJb87zHBd/YoRo0LZuQZdS8hfSOiLE286dW1wBO7EIiBxGGX4y3vlJ8TVPjfzwdQpWPhQwczeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+55pES0FjEI8z91Z4A87zchK2knT8KIwjP0DJxgbpos=;
 b=bezkrqb/1n3buoT3kArYvo4IXPLa4rDXva69YJBpDf+XVD5PyPIphcV0GHL6tCl6hb3Ao4UI6ZmxglFVURpS4F92HArIcK7oZnNwRmZtArOP0MIXMYjQKMIOJmUvRQ5b5X7TJZ6NqIhzNjCRIDsFsxELRUY+DxthpdEI4MMNzShIR7TtA040savY6aM65uXGj+7uzLwcwdxu/7uUUI7OLixrTvMiSEGaFf6Skr1Oc1Ut31EhEkIxqtL9BhDR/h1QmAALfoY80T+oNX58wMsHETW6CI6zewD5tvPLkzfIMF5+bDtSSg8uDGFu87lZQzL5U0VtbJAQz1MQpFLlTf3tAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sat, 6 Apr
 2024 04:04:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 04:04:21 +0000
Date: Sat, 6 Apr 2024 04:03:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove debug message from migrate_clear()
Message-ID: <ZhDJheeNa/URlMbW@DUT025-TGLU.fm.intel.com>
References: <20240405153849.44906-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405153849.44906-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5153:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9s59VU93/ICf51o46wZJWoErGNr5PfMMCH6CDbABnmVlfVdXgvMfWfqqMsXPGQcLmt7D/+9tt2/tY9XU1O7x8/qZpGVx+zrnp6WqwWH54Mzl1Ds/SWTh1zVncmzvO6eC4qc6JuE73gcwc4LmeZE8VceW8krqLdfIH3QC96FEExJTZS0v695/CpRrnJXuf6qSU+vT8jAW4RyRQHGKWLAkS7JhLMycZuaUJZwn4mCqBYnQJIwt+Wem5ts/2JbRM+Nvg4XsuHp9adx3/cROv+cU9LaS+JPAjze5UqtXpGPlw0vBEl3ggIOfzhyEBCAuZhzau0SGP0IT7WOwQKPFtdz44NAsYrub4C6rGZwTMidh88xgp76wgwXUij2uJydqDQsKR3oMphOtuxwbW41sQl9/fo1/geFOpXNlbATsE60i4rX4zA5HUbTqPsEHNTcBwyFm5aVDa1zEIWHjRQUcM/1NpxNLAF/1xzn3DF4KeqPg8l188C/yX9FPOT75h2hY9TeMdx1RZJI3RSopo+GnjdB2WRdzW/JMPLc3/8/8UaAGdTpYRgpMRlUInCc0PDIQo05RsouI0dOstfl+orCJl93ij/kr7+5v8qdx8sjnc/rV7xiMiIm5tsWSeTtHhFLaihpc6UfSgMBsHW1yIAf5bmYvRvscf/OPv5qi9DiR0I+5HUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1WpC5OTT/yIJ4CW+NcJiuxE12k0lefvldB5p2LZ8f9/CgxBAtoee7DDaMu?=
 =?iso-8859-1?Q?cCR9Ie4iYNyi8iAwbJjWzRprqAv0rav+OlPKphw05RTCcCZOHQAMJ5wwDI?=
 =?iso-8859-1?Q?UWxQ1wSws9Y05OhfJ6dFJOOL0NUeiGlVaF+FfHOJBDjppjdAWZuKp+b2VE?=
 =?iso-8859-1?Q?KJjCSOIPALFe0Pm3me297kAO7hEwESMUra5Y9OAEqs9h33TZPzH8Ovlm/z?=
 =?iso-8859-1?Q?ecBkYAOXIZlEbhjFOZGA+g7ozsTJgHPum08I++uOqRh4y/ETAwYVSvIvh6?=
 =?iso-8859-1?Q?UqgR3l8y3UKysMm+iLkuvpd7Grzml9VUH5kusAry3rT9cOWtEoClxzCyqJ?=
 =?iso-8859-1?Q?sAW6LUBswVc1koQJUTo9XlthyAjUZMW70z2atbXyhlvYS5o3T9zyZjFT3s?=
 =?iso-8859-1?Q?k636oxVe7Bs+w6cAHERE/fMi9aYPWkTRWBJB3Sex8AQjPUc79mHAi9zr8W?=
 =?iso-8859-1?Q?PcLaESi7wljv3X7LdDFoqpqEThMdHX443jcV/UyvYBE6mReE1mHNCVgZaF?=
 =?iso-8859-1?Q?ygK9snIabGqNctz5RkKJl/uUbOyZ4kXBp7lAyTLWoigJyLG95kTE5L9eNK?=
 =?iso-8859-1?Q?4xAVYL5TBhZAYV6NQcT4DAXaqvT9NDV6RUxmCo+i4XOz1uIzLW/DutMt0L?=
 =?iso-8859-1?Q?dIOvYP5HNPRYqihVXdXmGwnAX/zEYd5QL470vnVpRvu9kTGtSKKiaxZ/WC?=
 =?iso-8859-1?Q?toPbWS70H4eiFgDqS+WNmKYug+P1vSon7UXY6rxucegaTGas3WdRW/CzCK?=
 =?iso-8859-1?Q?lMCoFSAxoYTjfM8w/Xu3fJKjNKPJUcPNMkoYT+brdtFRvhNgpbk1ilpy2E?=
 =?iso-8859-1?Q?EVn2KIXaNwqgoGpyxl/AXDclTQSo8aR1lcn29VgKGBiej+YwDIKDJ1wWIl?=
 =?iso-8859-1?Q?Oki5JG/R5nWE6reXYTidczBH4OfU6DHns3gAh7cEWb1JiO8hNfOdwZtLiw?=
 =?iso-8859-1?Q?+Mq9YvJ7pvbC1NmP9tzx+/fmVT6It80kmoR9E9JEAM6K9uhCCZS3EeIOnr?=
 =?iso-8859-1?Q?+3rismdiAG0RLsNOxGox1sZo/RRvn/F2uggdr6mMeWKkRf2oK9lojd8DWh?=
 =?iso-8859-1?Q?7FY6LYwY6ND3XGSyejUaWMo6G+d01DbXgGMSxBLBH+34kRaolVQy9xN1yv?=
 =?iso-8859-1?Q?MFkZOtAXnbj/ZphWRMc979jsOLon04XccIboXr7kfRhL7cJrNpbGajhkBT?=
 =?iso-8859-1?Q?p+H4nfObrHtf8/f+5Q0yFSiYJrz9dhHlbFXa51yIpJPUIaqly3RN/NIruI?=
 =?iso-8859-1?Q?zCAwjGCk40evt7ZRIqF7RRVjKeDh6YVn/si9VQPLtRonk6z/SeMexBCsYG?=
 =?iso-8859-1?Q?1wYldcvlv4x7SzFaOCysiEGy9thThyrcA+Ipx5ZXu0S0KTXWVLPTd1nOgI?=
 =?iso-8859-1?Q?Xge41fTL1R6yeq8+o/v8F3OWqQcFXSHwJBzhTk+C8Dca7ph6NNJueHcc8N?=
 =?iso-8859-1?Q?ix5TbItLK5i/EEQkcK6iVmY4trcv8wQUJiQ3iX9OQL1667h6VOxJmMqRO7?=
 =?iso-8859-1?Q?WR9XA4BqlVNnPppUsQEP65q7N1PReAIYIg5acbq3eWys2KaIel7V4lxmqM?=
 =?iso-8859-1?Q?SB6xwDCpyfm8yAoVpG6fvbW49m8OaK76P/HJH9LM55+JwJAPvY+Sp10Qwm?=
 =?iso-8859-1?Q?5P29KMGRho9BDhBkzKiw1qmjhrHuHf6UVWc4pTDVRAvZ1XhqFsYZHmGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5898ba-464b-469e-a588-08dc55eea31f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 04:04:20.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xS7VTiIc/bCy42ynBlkSWV+MudJbfPweHmPZbN92OfazlfASUiBvZJpxSih9b95LIq8eyY0ntq79Iutw/W3kRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Fri, Apr 05, 2024 at 08:38:49AM -0700, José Roberto de Souza wrote:
> This messages is printed a lot and from my understanding it do not
> bring any value, so here dropping it.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

We want to drop the similar messages in xe_migrate_copy too but this LGTM.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 524b0198fcae3..2e37cbe35d16e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -984,7 +984,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  	struct xe_res_cursor src_it;
>  	struct ttm_resource *src = dst;
>  	int err;
> -	int pass = 0;
>  
>  	if (!clear_vram)
>  		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> @@ -1005,8 +1004,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		clear_L0 = xe_migrate_res_sizes(m, &src_it);
>  
> -		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
> -
>  		/* Calculate final sizes and batch size.. */
>  		batch_size = 2 +
>  			pte_update_size(m, clear_vram, src, &src_it,
> -- 
> 2.44.0
> 
