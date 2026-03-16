Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DDCF53D69
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CEA10E3B3;
	Mon, 16 Mar 2026 16:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WisgphfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00010E3B3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773676820; x=1805212820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SYZg/hZkWYCQ6fdJsr+gceOFVoTM4RUD1sIA6nNPFX4=;
 b=WisgphfSb9Ku8Wu9IMHZ+pRGyq5mWHAnKe7gVkeCel4/htaiPJKhFquX
 Id4RPx5WdvdzPhJNX1Yqxd7i/bgrVWqIEAlWvnYGCkKYyHjrV/8Pdr0Da
 Bk4Wp62xY0uk3ka7p7nstxg6AVep2RcDMHAeErxFsCrjut+irpz4SOuqG
 PZCL1I+ORrIBysqpq9Zh6WkiScT72FNxeXhEdM3O7AnXZJ3kJKE68kYX1
 F8x0XMiu8ZENYBmejQPrDefGKzQJ0ujYLeFNPGwVs1CZI2/tOK6eK3NMW
 ITkBgrgD/L8eXY8xBId1DAReyOQHxyGY/4FSoudq+TovSM+QcZBFQedVd A==;
X-CSE-ConnectionGUID: MPsec8YlSHKPl4Dykh9JYA==
X-CSE-MsgGUID: 3n5Znz6DRnmI0C7p0MTPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73878973"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="73878973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:00:18 -0700
X-CSE-ConnectionGUID: e0m/2FogQFKr8tTPgUagkQ==
X-CSE-MsgGUID: RNNcUnQRQsef1raMdI/nFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226637066"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:00:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:00:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 09:00:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 09:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrbmGPYulVJO7cPqMYAvbnYv0LOrmWSrIXXYbBvS6F5RVsnMUZByuj2fVdl5fnjFXo1VeLfCud1vCxP56o4rpRsCC+jp2Xc/f9rkZrS2nFKSCUqGqHCAyJ/BZwzJMwrSD/T3sW7Kw0BNTQ+unBmnKj0KY1SQwsUyT4l8NwEsuRCBzZBaLis7k2Y1tf9w+76lW91s9K/6KRxDgumtJl0UvQWuZBbjkiiSYc68IN/k1wJSdQdIY4SAo1wWl/Ix6D1valPW2t8AULOSy/ecihrmaaZevPIRVpq19TVsxwIxCl8G/cyj/hr/8Hm9zualCXlRFK9xgp6wm4zHNbGYKIiNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miv5nITc6mA88AtjlpJE55uEVpPMxjh7prOshO42C64=;
 b=HdkqzhsagSblf7xm1tOVc/IESt2IUULspPMt2SBITQBkRrOT+0SHq8XEqp2dO7C6JpNdmVXHv0DtK0GYftzU7HOqJZ6E3XAND/Be/89C9OEzXys03vENv1FmLAPraGM1FUfC5Mt2GCshKH1nq0MAPCVsLPvyftaEMkWajLsRnydAzIKzN2X2S9ebTqQ+fzOuywQLnbeuQpk1FA4LiOe1Qh9SHH0wGaE8NC7IIFx/hdb49PQ8Yz13rcn2jD9POWlNSdW7CqAfZZhoNdCbUmHdiqycYO274jgPpvunRSWtiqC0YIsHQfkmgj8wpWnYLNSmBjccJg+PMXvn4+WR+xZThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 16:00:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 16:00:13 +0000
Date: Mon, 16 Mar 2026 09:00:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3lpg: Extend Wa_14026781792 for xe3lpg
Message-ID: <20260316160011.GC2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260316113026.326538-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260316113026.326538-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 964e78df-29e2-460a-1735-08de83751bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: EtOtqdBY9XT4ngGUMxJ0M5obewdCrJZ1XdVoNjAL9UrBpVC2qZdaGECUcQmbZ+uQVZbBNZQ5YgJKMhWHLJDjK2PRLm6XYjcXqKD6LSx6X7uCXJpVjl56Lu8b6uMWdNRRgUJ8Aj/sGG4t44I41zyjVWSbmubh+j2Muqd1LgzQUCfUGW4iYOCIcqc0NzBrZSDlY+R9WmH8/HX+hrLU0GRt8txOlezyFtatV9PG3t8/mpOxQB1Wxg4s1a8Zosu3hor5PRLKSe1Pe5oGM3ItIdBVxdUTR1bU2JMY4aWkmwC3W+Kscq2BLA+cOKT+1oAatJ13TZ3kIdxqvPNNTsfqJN/3CjKOEFDo1dA50Hshggc25/8WbHjUGy7ogllU8UWxUZHxExRnpNvlwwhDtosnVtv7SDv0Y0sAIaej0K9YPVKOX/89o9hEIxKvcmuFITKb6I7aa3FcSJx0i+mTUFKZ0v0MvYBAnJ0+lUKPqlijmrVGsxbaNaPIZOkUSsvHtOqH30+/XJymlQggEiK5inQxRKYcdLT791xOQ2Af6G4tQe7Tz3Acu3meIYN1Fm/4swsc/MRTVzxDu6Ppn7nl2MeT8xTmdJLgBZYm2AcqUIieJrFxg0icdCIOAkSu8SGAwvvJkXOcY0I94cMFZB3PyTiX/77Xs67tOiOo5xeaAWAQwcDsVGfeQ4LXFQX5B4kTqW5TgxMizdhGSCssVY6JGJkRbsUbNfNddZ6h4WHVIC3hbnwFpLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f5WEtzrw+yDruh8qH5tWVAwA2mnkXf8ar7HEEAtWBf23Mshmf8I8WlCWe0ve?=
 =?us-ascii?Q?fHuavBKjjXytX291e0t1aduYd+KtCYHRd16jT78/qylhAoogOP8F0szos9pO?=
 =?us-ascii?Q?HDfCGJRBqni16stgYUc1qP8eqZIPyi2MpBbv3SUMMwdURja3u7ujvkpuvKos?=
 =?us-ascii?Q?bnVxTjxYoE/ubSAzSdQKK4KDzIWCcsUwELhJX4C2CHO/j91loeJwvoJfozBj?=
 =?us-ascii?Q?lSUhR32XF0rz+8OESRxyCpS8slxwkozP20tIrt413mUxeaKzMe6t1vItSoIc?=
 =?us-ascii?Q?7id32+znYYEF8gqgEGN2xwzZAwblZoYCSz8q17GCdDV2QveZFNGTEc1/dQKX?=
 =?us-ascii?Q?oL/Y6jTKmugDWBIsyWIQBJttBfecbMfUxDUy9jN3W3jMARqKVMPteDC2m0EI?=
 =?us-ascii?Q?bFE/Fa/BQFgumF8PrJIgS2/l/nyagrcGTzB8WaVFu5qC4RsJf06Rv65HhZTA?=
 =?us-ascii?Q?h6cfGaYFmcBTij6RZrXSZA5ziOv1MjQvUAvu8uUmw5T9nH5np4s19PC69WJ8?=
 =?us-ascii?Q?JLD+CiAnfdUnIySaXrXO2uV0cO+sTT33DeVns/8zuE/+QZaim8gJu5EKw5B8?=
 =?us-ascii?Q?Ry0cIvcyScBfqwgaqbX6dxh/UJ+/1XEcPhMy19SLaO2rwei4ddoPdNQxmLaz?=
 =?us-ascii?Q?M5qzf70xQeQ4tBN6sIJqICHf7TvYbepXVxQ4WixqiTrMTC7UCZnXK8ZkPe7N?=
 =?us-ascii?Q?b24wrI2Oz4TmpzP74YRqcdrJ3WT8qy5sg7qOp+vVA+1wfCyb5eLrzQ7cbCT+?=
 =?us-ascii?Q?HvEAHd4HIa2WsiPqJsQbzAGB+jbE3NC90ZDUMHpDoFYPv6VKCjo2IaEB3FJU?=
 =?us-ascii?Q?ws10k55x+2x1v5GJfFxwsfMyFD9/3pURYBNZVbXYLlmq1Pf3UUxyN+zf7PSb?=
 =?us-ascii?Q?xXjwPq1QCeC/nIQqDJOjVwUH8q0jMF1NyY31THncuK3npoyvIBA9/NrF9tOx?=
 =?us-ascii?Q?D1oa4m93lPegOGBFwicLDoM/jeDolDiZQbsfDZHnp5snzqQT7MgroI6V/hL0?=
 =?us-ascii?Q?5n9ycaTVqNCGi/rsUpPurqU8gAj8c5avtyzQhFWhxbAXpy1WMCqQSGP4Ietw?=
 =?us-ascii?Q?YAcPmiIJ1Iuu0luE8sxLKn+Y3txt6L3YO89x65ytrEvOIHOlCCNt4BYe8+cX?=
 =?us-ascii?Q?7buZRkgtzhrszRtseVvwMUx9Til1z9EXrav91PQy8Dx0V+PiRuc+4E4RrYZ5?=
 =?us-ascii?Q?VbUMXHDN6KsG06wHLG1CHcnUP2dw4z/jipfhZx6PORLnajB8MNWp5L9ne+Y/?=
 =?us-ascii?Q?Gc1ZvC35EsobalqbmJt5/SUSYpN/U+tlYx+6DCx/bZ+6H/s3cq6aOnuajx9I?=
 =?us-ascii?Q?ZtfxUXxkqTmrEi9EQT8viJtjMZ3T6UFiknK5NdrWO+C8k9UR/i8fGkKqpkhu?=
 =?us-ascii?Q?/4468WWjWyfdl2t9zKMBhBYDoesZDpoYe1EojLYnJmLYpxC4CwnRHk6+n7Am?=
 =?us-ascii?Q?W+MxhuAB6FzdOa6rGQ0IoapiVDsXE/KdhNm9agJxYNT/R2gIG9E1Hy3t7v1u?=
 =?us-ascii?Q?7peWBxUOcLCm3UUoJcsQ2m5tVoXMp/JscObXId2nj5IMtZM2iK9G5HoNMj5D?=
 =?us-ascii?Q?Sjj5ELBj5bnaFULXHwYeHnR+LbMgJuziMgYQ792oW70U9sMcCcGHvl/QKV8w?=
 =?us-ascii?Q?ho3qniJ1eLb/ZmouTxgC+1viefegY76V48BLQq4L3fMtD45JzLEXuicO8gAV?=
 =?us-ascii?Q?/ALenagTlO3ylT7aa3it+MvPCoGoKK1YxDWmSVr4XKYIg+Es1JGVVs0qJB2v?=
 =?us-ascii?Q?EZDEe0UZ8Z706ThgzJZE/Bu+nn8gujo=3D?=
X-Exchange-RoutingPolicyChecked: jVA/M3zbPqEIzF/6Fcz5blj75Hg3iFhrA1zlwz9EB4BJOljRL38kDQatoMU9QIqbAkM99YG4pY4X/yV8YpmHOcW45lDra3f0Qo8aqrytLc6IGtGnaYijn5dveXHhAPc4ER0af2SYXgX34wTdbeghi+l6Mq9vWcXn/msCTFTmYVZbrIyW033HB82ORdv1pv6aw2zGMILO+JraRwC4lNb7Mu3Qrwe/aF/Eo6pF8yhRXCSAj+uVUmT78wJcIpM7R0gt9RTXN8c+gH6wWP89VJh2dJfBNTj33N2Lkk9TOcy+CaxzJ13NKKw7f3xA/m3EFR5cB88Rvl+pVLIbWacGD1arDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 964e78df-29e2-460a-1735-08de83751bc1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:00:13.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7VPh00V8tDsfoN0eGITEofWNlY1Igh7ySTbkCTskoHg6tE+o1KuOHV7eqLWc1xMiy/zPZvKhfFSTpnNVR4GEFJwTqfH4pm5sDCOaJZ7QOw=
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

On Mon, Mar 16, 2026 at 05:00:27PM +0530, Nitin Gote wrote:
> Wa_14026781792 applies to all Xe3_LPG graphics versions
> from 30.00 through 30.05 (inclusive). Since there is
> currently no IP that uses version 30.02, consolidate
> the RTP rules into a single range.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 8c55cd187a0c..ef0f213f60e2 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -777,7 +777,8 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  	{ XE_RTP_NAME("14026781792"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER), OR,
> +		       GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),

There are no IPs between 30.05 and 35.10 either, so we can go further
and consolidate this into a single GRAPHICS_VERSION_RANGE(3000, 3010).

Since this now covers multiple IP families, we should also move it up to
the top part of the table with other multi-IP workarounds since it
doesn't really belong in the Xe3_LPG section anymore. 


Matt

>  	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
>  	},
>  };
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
