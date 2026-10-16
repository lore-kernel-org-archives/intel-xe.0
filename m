Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D3BCCF2C6
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5DB10E25D;
	Fri, 16 Oct 2026 18:16:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14EF10E25D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792174597; x=1823710597;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=52nxPcIUR36g5cF0uNERLAoIw3PrFk1iNLMV0tsLKqk=;
 b=I1eG5X5qCkn/fJnLxBCYZr1fnXS+IFSrfXVixKmvZktkWFOgZR2TnR+I
 RhEIbbuPilKT3t/peTOPwfdoSCUN9bd3/NT3NE5SQVLLQMI3HpBWi2Twi
 wJFMZSjWtNHCX3QzdaoJOSTVhS88aYBs2Aq+bCzUkc7F7kj+uzMaZBkSy
 KPjXy2tr8iHsP5tPjhVaLh67ktHuJQ6nR5vbTMSmskm2yhX5pFhW8Kc95
 maRJ++oUJ0Unn14rztjzpODrpsckOGMto6elnqLHhX/dfMw1/5AmrxE4F
 ke/fCQkTgERkUOeTGIz3s7wNoLZkj1ievDtJYD2eeD6Mw4ZJ8qHnu+YvR w==;
X-CSE-ConnectionGUID: TTOdkOBNQ3G/cvWn0ZfSYA==
X-CSE-MsgGUID: Cr2i63IhSHW6E/hT5rWLsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="867438"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="867438"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:16:37 -0700
X-CSE-ConnectionGUID: uE74oQBGT6yPxWjljaiXDg==
X-CSE-MsgGUID: m/+dMnchQoG4XEciV1kCKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2344267"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:16:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:16:35 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5FmsB+R9vzMPEyCXE92ddBUzaql7E+npKdRm5MYb23sxFsJ4GmvlQOCsCsXVVfVc2ulTHOyiHIAP0fMfPynQ+7rHzMK+Xi9trkMzWvzaJ1yRYLfwkBX/Uf8x3q6aaCrK8m1/CiRrrsJYKtXYboq+ZdSTA+E0iCmv8mbtPb83EgP9oWqu+f10APVLOpadcB23KRArHfTKaKRH3kCly54bahW2uyR9ZZVVOvPB6Hu87xm2DWb1PnXF+vlpUmdArOAJtuO2KIfsjxnPj+lDXn/RMwbmwk1u0rbdJJ/hyxHyuxYrWsZx+WuPYLtq8O1McLIkRNbw4TBXaP3KPBisD9BkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPYFbjMAGFhk4HONavQyErnjcgWceNXcM6is0r/jFA8=;
 b=tTKM46xobsuGtzTZZ3HXAMtweZOgemVFXjBH1ictpVdFhXxX1R1eqep7A0yodbVAVP4nb2w+av6DdSpsLD4nzibjDQGME+rqsELIIR2POgV1JC9kWYyv9XmDbFtQmqWFZLyPGk1QoSMd8Hos8c2HzEcnFK4lGpPE+5IHmS3ORo5IxUMijHpzHqne0IhPHv5xi9JStcgtw3kTGNDpx02WqZ5uA8y2Z+XybAYPsfDQ8ArmmA8WQ6aUU3oF2nn5vbtxaaxgnoI1tYjb+vCBsFcerEXAuxNQTV7hbWh+0n7jRwcav1pj/2dZBXf/5WDP4tP0aoqODdZlnlULeopy3M8R8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 16 Oct
 2026 18:16:25 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:16:24 +0000
Date: Fri, 16 Oct 2026 11:16:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
Message-ID: <atJp90kXhJceIa/i@gsse-cloud1.jf.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
 <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: a681f750-5cd5-4292-d024-08df2bb196a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|4143699003|6133799003|56012099006|261009223027099003|11063799006|22082099003|18002099003|10063799003;
X-Microsoft-Antispam-Message-Info: Adp9ptfvIZqMIaRC/06joBUb5zUo7OBd/VkeIGNDxXDxF1dB12EpqFcpQVaGj34cFP/aD+DmLjZaAp+Mvpdd4tyj+dnF9Upf9aVQbGX9EvYcQDi9OLGJ2UOc9q5AEo1iHytMNeoN9eTHnjL/xZiWIcmn7/+TiR8n9h7t0wO0aq9PvcPrrRhLjOS3UOrunqKklSqyMD8yVLMbZVs1u+4Ze6EfJRW9kH8M9TQCoqb7mp4Df+cjs7bG0WzqqLKL8Ama7Br/x5Lqju6FL/f+dvn3u2p8pDNI/UvLEBLfYJ64WylKcPEZf/Juh5DNXMYE+u5FcVWSi7aP4VoptimpAAangUNV5fypQA015iBFMN0ttL1diS9z4ZQZr3AwraE2aFHyg6LvYuwQ8l8UvJA3U09YjwQZvsAUxV3d2KfcTXhhaKJ6DObAdsoxcVq41HQKvgd8BVWIIj/GuxQEX1yX332TA5+fDFxBgPfxGZG50r4zXu99xY+2Gp5EH0qCXm/t6VM4KiG1TeDYz5DHwa6Kz91OqpLEnnqA9l49XoyAyxphYPnLFbt785DmlWAZLOusqulfC7Jbwc1O0r1RpJsNh3D0xq51kKmku6lii+ThlOBDNo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(4143699003)(6133799003)(56012099006)(261009223027099003)(11063799006)(22082099003)(18002099003)(10063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hsaA/HlthinMK4v9kdE46v4EIWg/FJwBkNSq7vwMkaPYckZ3morqtTh+bb?=
 =?iso-8859-1?Q?PQwz4f3G+woGqsxp6Jnwdp+jEM6dd2ZboFcqGSJ/AzN36tPhlDmhmt4aOH?=
 =?iso-8859-1?Q?aPsxwazZnSh85zSRoTomrLYGPd0+7bC5QuLg/NVjeaiiwTOuZqAw3vibxq?=
 =?iso-8859-1?Q?mGGDscnnTTQT8wEEyXrvLV9CGgxks9jPxgDiwnH6HQO5NnlkwGhWaW6mDn?=
 =?iso-8859-1?Q?0K0/aYX4EoaKHzcK4mKnkc8IjEqGjSno0pguP8gtUU+PzgGET7a4ibjYz2?=
 =?iso-8859-1?Q?pfAVXl6+C6jFp9oMvmCcTySUhYBU7mZIZIbvJXGY2vk5HgHsmeUSLp1/tH?=
 =?iso-8859-1?Q?Oq6VyXy0rVLbx8wsz3gvvodk9F4/yQdjD9WljkXoSKFw2+v91qJni4TTDR?=
 =?iso-8859-1?Q?tk7wPTbwimsr7FRpLm4T5M/VCSwppgkUGSVQCIZ2L6BhFXhptWrLYyxvCz?=
 =?iso-8859-1?Q?aNRDFEejocD/Sgyput/Mnla+81W0DCfyVaoN5NJrBOtwWPmMPIxQPpXF/p?=
 =?iso-8859-1?Q?vA3za0hMHtZfC29F3002nzDScSkFlpOZBKQhYdSUq0Sb8mOzTdjfNR8DPt?=
 =?iso-8859-1?Q?Bl3TxITKcys+M1OGdCYL5+k8299RJ234J+e6PE+f/TqjH2Y8CmqwFpefKA?=
 =?iso-8859-1?Q?At90anISambF1SCGeFS+YLZEYwaglMUCNWI7p15C8K0FQuPixHU6STA9pl?=
 =?iso-8859-1?Q?8bINwCTgHc57YavrbKMPeDSIORDPzUHB+o/OmFAPVO5NkUAm9eBWEO1Cf5?=
 =?iso-8859-1?Q?/Vu07P6cs+EtMr3GzDlad3/YDjadXYVXis2u2OQzy/wDbsfuCxuRolQNdk?=
 =?iso-8859-1?Q?jp6NCVRxSUf9TxCCl+yHO8LeMZygmiwbcYVdAUk+W9yg5yIpiH0XDk9vqI?=
 =?iso-8859-1?Q?R00yqxuEoVhY55en8dW3cN0+9j0ZkEz9zbBXj0O8/l/hHgR4qOOx66GhIC?=
 =?iso-8859-1?Q?gO3L8bJPPR0QN4g9/uvgQ1YKkcfxB/HIWzo81bEC/ohX65yZVZEBU4ce8S?=
 =?iso-8859-1?Q?926D5nxzpQj4AGj8rK+dhwyNgVvZ5R0mICg4LfzaJ+kk8cP1tgJxDGDrXj?=
 =?iso-8859-1?Q?FKzTMQFTXFzjUKo4yeSj+DrTIiF+olh+M9AYIc5eQFDhgllsxvdfu344tH?=
 =?iso-8859-1?Q?NyGQ5ONWPVw4zVsrmgiQ/g3QQ44ygr7ejJa+pVgdS7DWYCCxYf8dhYZUbE?=
 =?iso-8859-1?Q?S5tEtdN4E63Bdcj3IuqA1UBFCrVdYSCs27D1E4OPIJUGjgzel0l6Dlmaxa?=
 =?iso-8859-1?Q?0rgM7DWaofmaZSn297hWwBdvbfhWLps2bffM0wHS3TtQnEofWu0PRPJPPx?=
 =?iso-8859-1?Q?kR0n59E16Dxz1b7X87gdhhj1Wtc8pIJqA4Mw2uxd+tBUnNtwr8ABkCUY29?=
 =?iso-8859-1?Q?Gybpz2nPjcUDEmqBx0Z2dKvA0Sgyx9n7ewP6a7fIzFMGYbsU6dITtqL/Ym?=
 =?iso-8859-1?Q?D8V2HQariF0M3+K01YVZYWjnATp37J6fnCpTPbNcCZvS4ArTmR9XoOQKSe?=
 =?iso-8859-1?Q?ia9BlQQ1Sv6J99MoFs4PDrW3OIldNgoTWZc9ZbYR/gJc7K80G7xuQK0D2K?=
 =?iso-8859-1?Q?ZULJqp8hTzm6hrr335cQ0XRSMsAHzebN1RE0BFqC9QXV4XpO46OxDewncO?=
 =?iso-8859-1?Q?n7+4gc4jHvh66QDXjjNjkU/wtWFc8ZNVHwp7vY+RsTmI/PjJplu2YYl/gG?=
 =?iso-8859-1?Q?SRdcSiY2GC6SEiQTCvgaAW2jwbGJPl28o+z+rLjH22e+G12nSP5CLPdsYi?=
 =?iso-8859-1?Q?oz/xcFxWm0MVXZh7EtS7RKIGlDUa4W16jMkSlb3JU51UNH3UT+LZlIEYuU?=
 =?iso-8859-1?Q?EjQYUWw+Dw=3D=3D?=
X-Exchange-RoutingPolicyChecked: IjnoSBJsC89KUQdzK+/lejR6FIGufztmynFWdDdkDMBXYkOFaxe3EPqdBeGCPKtNGH30cM3hiI8/0YGtAH057nRzgyyonuyf1xsn4B6hvDDhHfvYTf/JDjzseWrEDdjqrUWnIcYC2SWTuyYsnml1rsFlAWZOWQtJYbw88S6zFVCTgXtVk227bY0Z0AuI5iNedl4E1saarc3N6ZLbyL2ZfmpKATptykcJP7Atqmh79X2EN6ePRjTDPOWffdPi66svV84iqjybiShjioOkpGdfDJ59zltbyfSK0LYB4e5u2qL+ikuzH75v7I6nNqsRa3TFtk2QZNMCC2nE/F0u6W5j9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a681f750-5cd5-4292-d024-08df2bb196a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:16:24.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 551S8uBe/KWijTo5F4OIEad7gUrI4iAuTIY/+R1ndJUHk0Bn8JDUtE6zWxejiULxfWELQ8LmgddSXCZGaeD72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Fri, Oct 16, 2026 at 03:35:22PM +0200, Thomas Hellström wrote:
> Purgeable objects are reclaimed by simply discarding their pages, with
> no writeback required. They are therefore much cheaper to shrink than
> regular shrinkable (non-purgeable) objects, whose reclaim may need to
> wait for the GPU or write dirty compressed contents back to a backup
> store, and whose contents need to be read back on next use.
> 
> Split the single xe_shrinker into two independent struct shrinker
> instances registered against the shrinker core, sharing the same
> underlying accounting (shrinkable_pages, purgeable_pages,
> populated_tts) and locking:
> 
>  - A purgeable shrinker, whose count_objects() reports only
>    purgeable_pages, and whose scan_objects() only purges objects.
> 
>  - A non-purgeable (shrinkable) shrinker, whose count_objects()
>    reports the shrinkable page count (capped by backup availability)
>    and whose scan_objects() shrinks non-purgeable objects, and also
>    purges any purgeable objects it encounters, waking the device via
>    runtime PM as needed.
> 
> Express the cost difference to the shrinker core through the seeks
> value: the purgeable shrinker keeps DEFAULT_SEEKS, while the
> non-purgeable shrinker uses a higher value,
> XE_SHRINKER_NON_PURGEABLE_SEEKS (8). The core scales each shrinker's
> scan target inversely with seeks, so purgeable objects receive
> proportionally more reclaim pressure than non-purgeable ones, without
> one shrinker's behaviour depending on the other's state.
> 
> The standalone purge walk relies on the LRU walk skipping
> non-purgeable objects, for which xe_bo_shrink() returns -EBUSY,
> rather than aborting.
> 
> v3:
> - Patch introduced. (Matt Brost)
> 
> v4:
> - The purge walk aborting at the first non-purgeable object is now
>   fixed by a separate, preceding patch. (Sashiko)
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_shrinker.c | 109 +++++++++++++++++++------------
>  1 file changed, 68 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 378022c37a57..8e3fe675e0f3 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -14,6 +14,15 @@
>  #include "xe_pm.h"
>  #include "xe_shrinker.h"
>  
> +/*
> + * Reclaiming non-purgeable objects requires GPU idling and writeback to a
> + * backup store, and restoring them requires reading the contents back.
> + * Tell the shrinker core they're costlier to recreate than purgeable
> + * objects, which use DEFAULT_SEEKS, so that purgeable objects are
> + * preferentially reclaimed.
> + */
> +#define XE_SHRINKER_NON_PURGEABLE_SEEKS 8

I suggest for full tuning this tied to a Kconfig + plus syfs entry like
I have here [1] so customers can play around with various configs.

[1] https://patchwork.freedesktop.org/series/176251/

Most everything every LGTM, but I think the Sashiko comment it somewhat
valid, I'll reply there.

Matt

> +
>  /**
>   * struct xe_shrinker - per-device shrinker
>   * @xe: Back pointer to the device.
> @@ -21,7 +30,8 @@
>   * @shrinkable_pages: Number of pages that are currently shrinkable.
>   * @purgeable_pages: Number of pages that are currently purgeable.
>   * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
> - * @shrink: Pointer to the mm shrinker.
> + * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
> + * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
>   * @pm_worker: Worker to wake up the device if required.
>   */
>  struct xe_shrinker {
> @@ -31,6 +41,7 @@ struct xe_shrinker {
>  	long purgeable_pages;
>  	long populated_tts;
>  	struct shrinker *shrink;
> +	struct shrinker *purge_shrink;
>  	struct work_struct pm_worker;
>  };
>  
> @@ -179,6 +190,19 @@ static int xe_shrinker_walk(struct xe_shrinker *shrinker,
>  	return ret;
>  }
>  
> +static unsigned long
> +xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	unsigned long num_pages;
> +
> +	read_lock(&shrinker->lock);
> +	num_pages = shrinker->purgeable_pages;
> +	read_unlock(&shrinker->lock);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
>  static unsigned long
>  xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
> @@ -194,7 +218,6 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  	else
>  		num_pages = 0;
>  
> -	num_pages += shrinker->purgeable_pages;
>  	read_unlock(&shrinker->lock);
>  
>  	return num_pages ? num_pages : SHRINK_EMPTY;
> @@ -207,8 +230,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>   * If bo shrinking needs an rpm reference and we don't have it (yet),
>   * that bo will be skipped anyway.
>   */
> -static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
> -				       unsigned long nr_to_scan, bool can_backup)
> +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
>  {
>  	struct xe_device *xe = shrinker->xe;
>  
> @@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
>  	    !ttm_backup_bytes_avail())
>  		return false;
>  
> -	if (!force) {
> -		read_lock(&shrinker->lock);
> -		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
> -		read_unlock(&shrinker->lock);
> -		if (!force)
> -			return false;
> -	}
> -
>  	return __xe_shrinker_runtime_pm_get(shrinker);
>  }
>  
> -static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
> +						struct shrink_control *sc)
>  {
>  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
>  	};
> -	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
> +	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
>  	struct xe_bo_shrink_flags shrink_flags = {
>  		.purge = true,
> -		/* Don't request writeback without __GFP_IO. */
> -		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
>  	};
> -	bool runtime_pm;
> -	bool purgeable;
> -	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> -
> -	nr_to_scan = sc->nr_to_scan;
> -
> -	read_lock(&shrinker->lock);
> -	purgeable = !!shrinker->purgeable_pages;
> -	read_unlock(&shrinker->lock);
>  
> -	/* Might need runtime PM. Try to wake early if it looks like it. */
> -	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
> -
> -	if (purgeable && nr_scanned < nr_to_scan)
> -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -				 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
>  
>  	sc->nr_scanned = nr_scanned;
> -	if (nr_scanned >= nr_to_scan || !can_backup)
> -		goto out;
>  
> -	/* If we didn't wake before, try to do it now if needed. */
> -	if (!runtime_pm)
> -		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
> +	return nr_scanned ? freed : SHRINK_STOP;
> +}
>  
> -	shrink_flags.purge = false;
> +static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
> +	};
> +	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
> +	struct xe_bo_shrink_flags shrink_flags = {
> +		.purge = false,
> +		/* Don't request writeback without __GFP_IO. */
> +		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
> +	};
> +	bool runtime_pm;
> +
> +	/* Might need runtime PM to access backed-up or CCS-compressed data. */
> +	runtime_pm = xe_shrinker_runtime_pm_get(shrinker);
>  
> -	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -			 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
>  
>  	sc->nr_scanned = nr_scanned;
> -out:
>  	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> +
>  	return nr_scanned ? freed : SHRINK_STOP;
>  }
>  
> @@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
>  	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
>  	xe_assert(shrinker->xe, !shrinker->populated_tts);
>  	shrinker_free(shrinker->shrink);
> +	shrinker_free(shrinker->purge_shrink);
>  	flush_work(&shrinker->pm_worker);
>  	kfree(shrinker);
>  }
> @@ -311,8 +323,15 @@ int xe_shrinker_create(struct xe_device *xe)
>  	if (!shrinker)
>  		return -ENOMEM;
>  
> -	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
> +	shrinker->purge_shrink = shrinker_alloc(0, "drm-xe_gem-purgeable:%s", xe->drm.unique);
> +	if (!shrinker->purge_shrink) {
> +		kfree(shrinker);
> +		return -ENOMEM;
> +	}
> +
> +	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem-shrinkable:%s", xe->drm.unique);
>  	if (!shrinker->shrink) {
> +		shrinker_free(shrinker->purge_shrink);
>  		kfree(shrinker);
>  		return -ENOMEM;
>  	}
> @@ -320,10 +339,18 @@ int xe_shrinker_create(struct xe_device *xe)
>  	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
>  	shrinker->xe = xe;
>  	rwlock_init(&shrinker->lock);
> +
> +	shrinker->purge_shrink->count_objects = xe_shrinker_count_purgeable;
> +	shrinker->purge_shrink->scan_objects = xe_shrinker_scan_purgeable;
> +	shrinker->purge_shrink->private_data = shrinker;
> +	shrinker_register(shrinker->purge_shrink);
> +
>  	shrinker->shrink->count_objects = xe_shrinker_count;
>  	shrinker->shrink->scan_objects = xe_shrinker_scan;
>  	shrinker->shrink->private_data = shrinker;
> +	shrinker->shrink->seeks = XE_SHRINKER_NON_PURGEABLE_SEEKS;
>  	shrinker_register(shrinker->shrink);
> +
>  	xe->mem.shrinker = shrinker;
>  
>  	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
> -- 
> 2.56.0
> 
