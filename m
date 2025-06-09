Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17746C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 21:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B2110E1A6;
	Mon,  9 Jun 2025 21:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oz5hvyUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3F310E1A6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749504499; x=1781040499;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lmj5LIDhUR3Q7PLC6R+hYC/28qcWNrxFiAVwhZSjYJo=;
 b=Oz5hvyUWH0qsiLEaANlPSZEr66XL0nVIEpjaNtanQ4WNa0e9yS/xHSNZ
 suRa7gmQRt+rhT4UXqxfZPFofj+kyV4abCxwJ9H+s4FPtSOJf+wh/GmVJ
 ovvdNgoYAtCotrtXXLd7fSl0FDHbYUBdTH2/xW8R18VckRLCfNM21kKAS
 3xxk/mr5+PYL1b1evdB3/YtDCANsYPhtPO9gxGWAmAjVQJhOcGne9E0Fo
 Dthdf8vKIRBKnT63WAtHJDkOtpp6a7ICyGITjEWQLTyi9DdNV4UdK/N/M
 tnglohtTzDzg/3Fd4cc/QItMn7kELcD896UFgaWeD5gV2hP0JtgA4BusU g==;
X-CSE-ConnectionGUID: xgYm6J05QPK7yd99yicJtg==
X-CSE-MsgGUID: yD7Rh/zrSZKn+ON6yvciTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74132193"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="74132193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:28:18 -0700
X-CSE-ConnectionGUID: UCbQehSkR1KRQ7HjPX4wfw==
X-CSE-MsgGUID: 3ZIdSs6ITLaLglrKHhQPTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="146616243"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:28:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:28:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 14:28:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDXT471sxtiA7/7U4+SQVgXv3+WXOLtRrWjY2UrdaLrUytoeLl3CVQRUCnElK+XpfFha58V0xUHZi0rurNwVQWrxICg6B7oXP1ftyvBPiDeDQn9LfoM85jr00bKm7jVqJ6Zx6nC+a0dw2Hg9zNVqlwqBeoL14+KcaGk5p56tB5aB39febuKUKP6XPwJn6qkYl6vcFVQD+glbmpPpNrbVjV1evjtvwTeyFjvJwMqMZAuyBGUbge9mv/uzd6NxhqT5GSzECuFEcMJ/xpvNyXkqDqJLv9Onj+lAUP9K2u7UouzAf4X1I8SXtx9L2ACUc+rV6DYdZS9ZL+r5JJ9mP8N5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLOhcGdSZAerkH31h1utf9UJyqzQy0ytWxoLweiRdvg=;
 b=eNCqhg7hDZc+3iNmYKTRRV1WNuNTQaGhFs7EyQgDHdD4Eh06TPrWwR74Mazc9gCBbz+rOUsUENHpiJ27QkKid2l+Xq5+jGViHwle9Cg9ErbbtBKMB1lmj2fB7PqdOfI/ZDLxuNeMUd22Br4jBRmpqWg1M4HLHWu6eYZ7GMUFhWawZrpXeNMF0XLjqquX32DJa/ae1mUYrCRg35cOBtO4Afda7IrHEav4rum4wlJCRaQ4ge7PyBLBsCLw0fPuOxhj565HJW1K7Wcd+icikqBGrB/FADmH0UbWCdBRfisO6JRwBwlbvtIu3VRU1lN6umKSpNB++buF2bqvtmRf00SeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 21:28:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 21:28:02 +0000
Date: Mon, 9 Jun 2025 14:27:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
Message-ID: <20250609212759.GP5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603202826.681-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d383470-1d72-4c75-2bef-08dda79c83e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9M1eVEQJiXgRk3ZgDa805rNEhwKJTDCkwpobd4OPCIuhk8pZCqmeqbLsqfEG?=
 =?us-ascii?Q?I8/ffKtkbg9wt2KrGSb/G3UXs6D/3Lap1w+7D5l091Q8KpKWbtNRzIx7QW01?=
 =?us-ascii?Q?4RbxFlBEI0OK9qsji1wTO5hx6N9OPsL4M0IicYN+ge0/9M6Dn9kA3/ZVkcNv?=
 =?us-ascii?Q?86AJZFoA05Id1uRD7VP4HJA36sdr5CKPI58lCVPQcpGjMAr8FrHxEZpXfUkl?=
 =?us-ascii?Q?1oMogzXzjvySVqveJv00CD2Oq0r6bXYPp5oi5x0QNXt0x+MhfycO2izxgzgi?=
 =?us-ascii?Q?zDKmPUz1lmjyx4wQuqufVeT3pK10wGpkS1HtC/B9R2NElmtow5dZNAUix2UG?=
 =?us-ascii?Q?6z3RAXrcUsremnnbld/IoHrG2FRdJIjeoKtg/5OKqY4zLmQfKvih5IQhlElk?=
 =?us-ascii?Q?6xbn1jkz3WD60YLIkaOG/R5WcZTXpr+Fn7g3uLY2VOe8s3T+iwWdO08Qyg3x?=
 =?us-ascii?Q?zWFmt4SMv7gAmOR8jYDueoF41DbTx3dQesJDHe10fLcwP81ZYjCbJ83WKILV?=
 =?us-ascii?Q?XtfpiqKt1EPQdLJt6SyHYri1OGLqFaYhB0pVEp/JH6YeIcePmSqCR94sBPeF?=
 =?us-ascii?Q?tWvsbhwj0/hR+tes657y2Xg6uThna+F3Q3Ux2jUeH/ebb+KHiQemuhgKQ+0u?=
 =?us-ascii?Q?KtPWmclObvK9IP/uQ/xKMtRIW3Smz4cPGgDNh3231hAZWZNxNf6wT9s4D78E?=
 =?us-ascii?Q?Z8Z/tn1NsfMKsZUUN8hN1fTR3QmhEXoaXqAvM3Oai/N/+HBqoGDCaD0c+Sm2?=
 =?us-ascii?Q?tfZ8NpDxn6XFyI+TFOMETmALyU7c/0Hyzk0gGQWgtwyC1mFFKO780qvmxJad?=
 =?us-ascii?Q?Ej7yJKViIHUY6PUTrwbxxrHI/Db8nB/hcXJhy1tAiBPkKfUqB814yxeGX0ie?=
 =?us-ascii?Q?H1hE2HckqRGU11DPNAAWnx4aaoteqTImHe2kN0R24bwU0hMeqFEZCOHtXxyo?=
 =?us-ascii?Q?v4w65LgoYGfbBhou4BMK8ESnAZfx8mPy1Zw6Jne8ujjjjl5csuzW6dvpnfyY?=
 =?us-ascii?Q?p3aIl1TTY34vTdImo04oQBuu1I/3ILeHe7lp6T+Kz2+OCC9z+iDp/HEQnccW?=
 =?us-ascii?Q?xyzMqEUeQnQXIJ9HlodcqmDbGuva8lv1J01T27ojg5B6uG3uPjYbTP/l6Hag?=
 =?us-ascii?Q?0cRtekV7zB0T4tBnTlz2MzLEQu4455a1pjYstKJ0q4ZyUTghR0yNqMX9TOCq?=
 =?us-ascii?Q?lLg407mkuto4+dIyiG4UDiA9iKMIzXmX0AHC0yZHwT8u/nFs27YMPuyhLP46?=
 =?us-ascii?Q?helXwsebSTL5B0t/wzBE8BOVv4A8UHwy7haqgYgAl39MQVU8ugQ6J8iS07es?=
 =?us-ascii?Q?US5W94FhfaeJlpQl01SiyRr+ARvyQHeDeP5srGU/wVCIi6TRTWNmy+edbMY1?=
 =?us-ascii?Q?0N5hmQlKruZNh+9IdQWrP10C0AO8E4RbklVit06fG+bBkBYDHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3UFYu/pRE+7Fa2VmA8/ZBuTe8t99WprX+vN55CmnFg0QhTAiRJEY10OgUCjQ?=
 =?us-ascii?Q?sdnkw+V15cC5oD+Z8wTsQ48RKwBwXUpnZ+PCV/t7UTFFubSQYxuwAQAgHcwv?=
 =?us-ascii?Q?sRhJKJTkd8NrIRMxB5C7zzeevA7d7gZ7UiJKiC9xNF5hJRjlcvu1ulQryolD?=
 =?us-ascii?Q?BG66nP+yONOZzIayCnIv8EgPN9uwkvV7hajJx5EXABeeFQNul1fTBcZe8ZBJ?=
 =?us-ascii?Q?NY/w6aNdGnFEZ4XkJOpXjPq+RjnSdATrr0PFMJMxaQmjdNiPObqv6loTs/rJ?=
 =?us-ascii?Q?60+oY8IoLj6BPjrEeOh6ZGkwSCXa5FNkZiVOaNUZf1jWcuw21xC+bLgRKVKk?=
 =?us-ascii?Q?Qq/Rd7crufzQUK57kEZM8lbEEmqnBiVuJ0YKypYWmNCuYpMq99PaKcMZ+HWZ?=
 =?us-ascii?Q?PjWlBmxEo2BnJRRqwqalxIgCs8IWKU2XgBmuET+hGYc5MQk1tsc/us3Ax/bo?=
 =?us-ascii?Q?pSH00JpfeVV4fnvrjShUaNlPukxwrOhmuPiKpWGo6S1UhoeI5kqAIlNgwb8y?=
 =?us-ascii?Q?c2cxhWk1LUjoduxnwSTWRZgGpgRE3kcHnZ4zCoR7Wx/VvRkq0ZYggvmsGL+5?=
 =?us-ascii?Q?5lVWGis5HQJvhUARLEfCADUP9ESnS0u79MwwS9kbKb98AngVZK55HvkmGX98?=
 =?us-ascii?Q?NvH86KqLzQ1efnVnDvv1W2uQFkgZCjCvnU7/HzmhD78MsidmJKlTB5aCKdvh?=
 =?us-ascii?Q?OgWZEKCWvddDPSbjwdAg3yFZfFvKmEEU3QR9GyeFf0XQBszN8DPBG3/KUGyd?=
 =?us-ascii?Q?7w0V31hM0Ot3XJpRiZGUZ1Y4Efs4cD6EmrKk3QT+o2xuiYmOI4V18Xo2mZw5?=
 =?us-ascii?Q?YSAmuft5Qr2FAAU0aElAuO0x+5+NSM74XKDaf08t8UKmThBw2sxVgO55DLa1?=
 =?us-ascii?Q?DPKiz/Y6K4jMIbUY7ZfTjnysgC5THoQ9zkrV/3dgVQzbWytCP/mOI4q09p9G?=
 =?us-ascii?Q?r+s8aWoh/oE1hC4525rNE26BhzkAxo5qzozB42jnbLcyiDyJle/7YPbmAoUp?=
 =?us-ascii?Q?aEZcXoMod5UwpkE6RLF0C5yMel4MotIZA0wKD3oe3hMvJMjtwXdXWy33yQYR?=
 =?us-ascii?Q?kPZ3eIXILXPUpmBRRvTzl9P4QCktMnB9fYN+3Ci2IUY4pRClLADRsFQkYfgt?=
 =?us-ascii?Q?Wv74pz/YGFjZ61IZRABUzDskG0WO0v+tmTOgBJY0TN/H0FfmQpT9n3BUwE5B?=
 =?us-ascii?Q?nfWeWkKwUIHsx4tl8wt/+UVVz2POYCAwcYhIUD1Em9mlTziAlcT4s4uvJ5oi?=
 =?us-ascii?Q?jOy0eyUgeDISclnIJd5lS3pQsX5HE2BXgTURR0hAbH2MR7LFH7qnuVpsh8+m?=
 =?us-ascii?Q?XFVKpmwod4qcYX6coGIquGI4CFxLV3adlQ2aqt+ExdAX63HD20Dy880cXqwK?=
 =?us-ascii?Q?SOQxproPBnWoQL3SENKuIEpCXlAxXgS1iHrbNVk0aH0N9nY0qMeZVZRtlJaK?=
 =?us-ascii?Q?WQASQXwNja/eZv4MwTBG1y6xGowXTxJ/XfjCxD/LAhnQgqQDPZGGn8nuSxjG?=
 =?us-ascii?Q?Ojnghc4G6jFXOU1hF6WUHUSVKv/Y8imwzKLGhBHJIAknZ+ugvRbGLDil47TP?=
 =?us-ascii?Q?mM7nuW3o1rKRYz7GMCD+D/Kkb4h/QTQE3hFWcaYpUnXw3t205jZb5+OxgJ9i?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d383470-1d72-4c75-2bef-08dda79c83e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:28:02.6711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCdeaOOfHVypNK/JfuST45IzWfkVewZzo+EGntbU0341hmryGpu2PWzBzr1F66HRate/qxVShqaR09O+H2EOhwZkznuGcCJaa2+mXPjELK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

On Tue, Jun 03, 2025 at 10:28:23PM +0200, Michal Wajdeczko wrote:
> It seems to be a better place for this helper function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.h | 5 +++++
>  drivers/gpu/drm/xe/xe_mmio.h   | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..884e8e4fddbf 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -117,6 +117,11 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
>  	return xe_device_get_root_tile(xe)->primary_gt;
>  }
>  
> +static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> +{
> +	return &xe->tiles[0].mmio;
> +}
> +
>  static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  {
>  	return !xe->info.force_execlist;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c151ba569003..540bade24790 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -37,9 +37,4 @@ static inline u32 xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
>  	return addr;
>  }
>  
> -static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> -{
> -	return &xe->tiles[0].mmio;
> -}
> -
>  #endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
