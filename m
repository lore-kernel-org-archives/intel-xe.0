Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF6FC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292201127B5;
	Tue, 28 May 2024 20:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2t0oMdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ACF1127B5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716929813; x=1748465813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3ZF6L2eLW1/NpGfH29tGGUyEpOhjXuhEqTtTp3LR5u8=;
 b=f2t0oMdOpZXTRO6qWAVXgFm3+6QenEDvGu0gnrxM8s433ouOAS61dHBd
 gCWdOTeq/4J2+UYxeK21WKZhBZuHXdrXJOZFu4NgfwXweVUkDvrABAKpF
 oQLV64j7xx5kpIT6YELKFvossYu84hB9gE6ZCRta/Uq0rWkSlmPnZBV6W
 rYHOJvk33/pwC7taAAWQPVO97zfOJ3u3hGqf6A8qPxwUc7VhdzAaRi0yQ
 o2K+pQA/pJ0kXkAcK/5QMaTCri3of2SF51pVgSuoWLFhPxorlrvbrbSKz
 fv81YKLQpGtRUWX4sL5wvdIE5E0IfAjeON0E6qAfKNyKEuJ9b2M7Be4uD A==;
X-CSE-ConnectionGUID: M5a0a11vRs+ptbiWqLq65g==
X-CSE-MsgGUID: mIazictISQGZ5rCdEJeOAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13470297"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13470297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:56:53 -0700
X-CSE-ConnectionGUID: ZE6zvtjzTkagyCmVE8Xkaw==
X-CSE-MsgGUID: 4fskSoVERJKdxuEDvcQrMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="40190930"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 13:56:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:56:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:56:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 13:56:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 13:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WilNo3IEJajnZODDY3PrMBRfuFfdJoAYS0VM6azskr0ewaEgSg5HAnyBZXKDJYJ1C85BYFe7PS67a69irUJbjmVe6syDRH6N4B0BDcmWXAbDxNr0/C6+q/qOffAnoU+85aJ5/H/zeYjBq9cNK+6yDjfbVJ/2I4xLNubIztsdts8LvksfQ8F8iyEAVwNvD99G2Wom1bmRvyIXx+kTvJqe2ugjlsm9B2PYr2rGYRQlvyrqrBlDnNX4BNpgxxtgtToN3odq2sCRhiBH0V5U9Z7oX5vNc7f53XKUc/B6WB3lmg37XWSsSveMBB1o95zGjAYx1ae0z06ScpJHo/qblIsuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGnqPK2jID4LMEsZ+jdO8caDmEH3iZWRygaX9SiaNg0=;
 b=P2QoA0XX4p+UHWcv+8QBk07ofb7a/DPkr3+Bjm9GqXVNqnm9WYymQGnH8cPDOexRCQoB5b2p/iQyLk3/YxRFdmHIAqmCbRSxmiPkr7Tc22QfNs38oWU/p14gMOhfwp1LzNSKa1ARlNijn5bJUUiP3nT1q2sWs7twkJ4k5M6kjf4dPK4F8kIT7gJZ0/ya30pizgUHNLOqYFNYZdGTN+c1XI2feOt1Pv5z2lawxVrkW5b0G0q5BLSQ7Z3a7ePZLaaaixZ6TRrVcftZetFKPCm881JHWh6CU3KSt/JOyd4HEWjlVAiPCLJboLjLbedpzj3OJuH1eiMZsMMhO6nrv2aGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 20:56:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 20:56:49 +0000
Date: Tue, 28 May 2024 20:56:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Check empty pinned BO list with lock held.
Message-ID: <ZlZE5Sf4ambwtrIo@DUT025-TGLU.fm.intel.com>
References: <20240528115408.22094-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240528115408.22094-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: f6105d52-2d8b-48b5-92cb-08dc7f58b170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cj+X3Bh7n6/7EDkaS4rUW5g4Dan6EBRGYtVhSIc/qBDhin+dy/nBzJ6Puu6e?=
 =?us-ascii?Q?lLgPoDNSuInb0T/tU9ScwRb3NFgMtUY4PYml2fHAYVjUS9H4P/3CUpr/GflM?=
 =?us-ascii?Q?VZmWS/KALVXwdygMR3iI1I/KP9MIeqhisCBPUdCY8kkZm1Zr3uMJy06kNPqX?=
 =?us-ascii?Q?UAoUXgbZipwCzrPY2cqjCg4uDp2ewQiDsj5XKD0gRwcBWvXC0yrc+HnQV0MF?=
 =?us-ascii?Q?lfqx8OLGPxzKbCu46aCXI5rP/HFnbZh/xEMkpQl4ZUk8UmHBHoTW37vMPpCH?=
 =?us-ascii?Q?Xh9SdhFkpsZoKHm0XRW9erTQcJINTkwvmNmXIRr7i/zcOdVZpPpnMrMoI55J?=
 =?us-ascii?Q?LkzrttegadpO+Ijmuwe32eRbMLMMsSWuoMvjs3d2lfz62xAMeP5B3KWrHFw+?=
 =?us-ascii?Q?OfHo9OA34CTyeZtYeg/DTSYp2LSgaVonHWYguT+Hp+pdkaawPpwpQjHzMsLs?=
 =?us-ascii?Q?vOdzMy1R6LvIFmvfciv2Yc7y0qkDwP4zWYQp1UfhHy5aDGegTJkih0JJgX1l?=
 =?us-ascii?Q?VOAn1rGaP4U3iZpGqQVhAcix2iMwEY4VkxSMO02Mb8PyyCsG8YxdQ0bSVH8y?=
 =?us-ascii?Q?JJq4Qbjch8oumoA9r/yM81fle1zyCUKOMoKvVoSVSvbV0TZ4n/d0D8qqLNUd?=
 =?us-ascii?Q?aS91c7UHZXJ+zEqajuZKP7X2PWTorvrlR8ApRyZ+T8eYCVxfGBFrP2XbTz9e?=
 =?us-ascii?Q?N+uGQkP/CRwclhIsSIqsOpQiQShlfFjPDJMFwODX+R8xHZj2nsXfj9CqXiYL?=
 =?us-ascii?Q?Jo7cDwHthjX+LoCSbhMC2+4Mj/qlxbUGVUlyXR7mQsxpY3vcAXr8IZ2ap3Q0?=
 =?us-ascii?Q?QnWQ/TqTwvNg8JUZS4tqEoJvyIXK4L0Qet8exjKjbNjY01UuwdL7UbHnWuYp?=
 =?us-ascii?Q?xLWUzAE+pWELAJCcy0yfJpWuoJI6CSTfJ9eauCyEerZkbKcZ7TKyN/FB0b9s?=
 =?us-ascii?Q?fUmpagJJxzgkyNXu/2sXtCBnhMtWSDFbtAmv3TRfTqE1ZrSTzLtRcozYJQb/?=
 =?us-ascii?Q?VFTSUJwbrRX6be3/ciG/xEgg5NArtHwp2iZTkAVUdnOxZpievchrfTyHi0QE?=
 =?us-ascii?Q?2xvdtG3WrjL0b2EOd543iL1TyTtqDp0PO8bT7UEeTP+aOCx/uXFrvsGr5dTa?=
 =?us-ascii?Q?YXSmdOjsafEOubwZHKg9uRkQrERmfB47ewP5jEAl+dpl1HbrpxWEu+qHstL/?=
 =?us-ascii?Q?hz35wDGvQFsK8RCkBzcZokSLOl/RTHyl+hnnRYi8DeoNuc2VLVFQtFJcw+7E?=
 =?us-ascii?Q?oHK6sfgCLW7/Hs7STRP7rmYLIjyHuUwmSUZgUzo6tg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHbS0YsyoW75pkRZimiWKs8WorZG9r/7RiPIYjA/YN3pC0xSbXHj8jTL99Zt?=
 =?us-ascii?Q?kx/oVZSLy0ongkIfCM8EQIm3NPqeO/HabEkiz1ccMUyd+Aojo1kOfEQ7uqQO?=
 =?us-ascii?Q?kHIvU+WjIwyN6UFEPuqEO74GkJ9Wynb5USv6PoUUeWRDwNdPGTW3XEEQneuP?=
 =?us-ascii?Q?xQEkt5F4snXVPk+eLEzDq7/4YTjwz21benrVnskYdrAhWi4UA0QjprnNEZLa?=
 =?us-ascii?Q?h+/HzSx1pnSXiOsdVgtioQQlX0FOlaCh+yA0mi8KCCcFK2M6jEOV7vi3RiM4?=
 =?us-ascii?Q?bJGp/VMUGDY9nt2paFuOanK5JpKiLDdgkjGD1oqHghwDFbDT1UooD2lx3jx7?=
 =?us-ascii?Q?bQwA7W9rmedGlQe/w30mqqAGoj/jFEjAcoQMG85+ZnNcYrI7ofIqkP9lBRXd?=
 =?us-ascii?Q?1xENC4yvP2nriaCsB1iFfcDoycO8jeqguhNK9iFklhJxFQjRC0RvpHbpZw9O?=
 =?us-ascii?Q?RUSut/FBEnKHnM034FoYYeaP2gYzV+SaJzUI2nyYBpEX/i6YbvZggVTVuV5G?=
 =?us-ascii?Q?2DNJGw8IEPb4MZ85YxsR9+PWVUPbz/PEp6bnypwoGYYO9kTbESmLo40EUOFk?=
 =?us-ascii?Q?R0a6vLFbqxGrDZgHMBHrhs9rNTJ19pwQtpnti2hzjjHhkrvaFrIoJu7Lq28e?=
 =?us-ascii?Q?mgh274halgyY0PU0mrUx4tADs5M924AX8BiUUIG+aZ5oRd8C/l+23gGOW3vn?=
 =?us-ascii?Q?UZ68hfXwapBu6bdipqi+cPsc1WnEwglGZ1ftav0tR/WGl3VQXYCStFjXK8HV?=
 =?us-ascii?Q?0mqo0Km69K2/eYqljofgyap8H3KhqWLK8xu4us0284UU8NAcX9RCR0fOc6xs?=
 =?us-ascii?Q?Iz/Eqsm2RwgEKa/kNJV0UxPZdLDFTjN3HOGt3wJIRq65Wsw3atOSpqYtAPgS?=
 =?us-ascii?Q?u5VHvkOzZLWVnQ61+3TJ6G6BLrUneC2SqyxGEfhi1o3g8PnVuT+JEspJLO3n?=
 =?us-ascii?Q?a8LLQaaVV5IHrfn5zxRSTuRrEXvVAYSwAKVOTPFO5nk5KuXk1KNXPvBoCCQ4?=
 =?us-ascii?Q?8X9jv1hjNRJUw34isoTRy2f9WD62oWCOb5fkPyP5rg5IUcpUav3Nd76HyQFr?=
 =?us-ascii?Q?dGZ4nkMKIRqPFezBvBp+IRgXLreQIDSGKRhoLbkhneiRVgJAFfJKAUtnIDvS?=
 =?us-ascii?Q?AkIcO+Ihlt04/oc70ORxTijCPckzpd4fgmRfKNoKa+mbvzcz2AkBDNySUQ7V?=
 =?us-ascii?Q?+UuaB2vogVDpyoD8Og6yYbv8jvqzxOUJ6rXO8d7I60wh1Esh7Jf+e/oj+vS3?=
 =?us-ascii?Q?krhP/oKjKNDed8b+YAzxLP+4tAq0KBXPul2MnyMXL3MdAuGIOOBesbxIGfLL?=
 =?us-ascii?Q?avWBZs1ZXTgv2qfkP90ST3kXhnNpmZcBt+0oxRGG4z5lji3VX+peoxMR0P8b?=
 =?us-ascii?Q?PlzeIbkP7LP3XnjNfAaVcuVzawxJXnYHfpYYot5b3VF+YGZDoZgbb0EV2hb2?=
 =?us-ascii?Q?iO83EEQPDruyRNV3Q9NiDqR/kWeen2lttfveJ1j5BV04eKEIG1OUbLTAzMBN?=
 =?us-ascii?Q?XTbMZIfryGPWcCW46EOYEhM+3UN6WrJkwemAgUkp/v9ypRWj88LwvpDTfElk?=
 =?us-ascii?Q?ohytpTrRihlWRRIAaQ5XFS3xdvbcGJcsCHMxBp4k2RnEHamnrdk0Aha33z3V?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6105d52-2d8b-48b5-92cb-08dc7f58b170
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 20:56:49.1625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z72dgi1vxlwUQIDSWMURAaX+c7VQ8Lj4z8fGRRMNdS/obtt9b/PqsP7+0MtybHNeUrsX/bRnLC7TMdfJ7urTdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
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

On Tue, May 28, 2024 at 01:54:08PM +0200, Nirmoy Das wrote:
> Use lock that is meant to use for accessing the BO pin list.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Agree with this patch removing removing micro optimization of bypassing
&xe->pinned.lock, we should avoid thing like this.

Curious if this was an actual problem (i.e. was their a bug report which
lead to this change)?

Anyways the patch LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 03f7fe7acf8c..2bae01ce4e5b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1758,11 +1758,10 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>  	xe_assert(xe, xe_bo_is_pinned(bo));
>  	xe_assert(xe, xe_bo_is_user(bo));
>  
> -	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
> -		spin_lock(&xe->pinned.lock);
> +	spin_lock(&xe->pinned.lock);
> +	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
>  		list_del_init(&bo->pinned_link);
> -		spin_unlock(&xe->pinned.lock);
> -	}
> +	spin_unlock(&xe->pinned.lock);
>  
>  	ttm_bo_unpin(&bo->ttm);
>  
> @@ -1785,9 +1784,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>  		struct ttm_place *place = &(bo->placements[0]);
>  
>  		if (mem_type_is_vram(place->mem_type)) {
> -			xe_assert(xe, !list_empty(&bo->pinned_link));
> -
>  			spin_lock(&xe->pinned.lock);
> +			xe_assert(xe, !list_empty(&bo->pinned_link));
>  			list_del_init(&bo->pinned_link);
>  			spin_unlock(&xe->pinned.lock);
>  		}
> -- 
> 2.42.0
> 
