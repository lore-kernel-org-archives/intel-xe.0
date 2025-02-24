Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC5C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCDD10E0B4;
	Mon, 24 Feb 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqjkrGs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2154D10E0B4
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740437823; x=1771973823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1itl1fNr3RZg+d06YkygEGTSUcRCnQh6aGJf+kTZrTc=;
 b=iqjkrGs8NnAwGq146g0xuAYDv7LNkj43o+V7+bo1P5MntFtJbiIEn6hC
 BQd93zb67mExREJC0Xl6vFVbMj/nKobt/Fja0BOmKRD1cCEq4tGE1EWLa
 cAQS0Wl2pLhDGbJoXlnZ0wBtt0M4fGaz6+RP6V8OTzpzQd00o8pb6Ljhg
 r0xQNK9NzVAZlB028VlOQQ43j83Ro8UnhoULwiyvJvelDJwFXxikaGq8y
 /GIqYqpDWCte75WRN8U4mkofcjMmVUTzSe90GYOGuPDlM11oDa1EfBsef
 KxsA9riGmkg0iWwmZkHBU/8E6QCBTyV4Dhbs32qV2A8/2HQks8wp6v1jj w==;
X-CSE-ConnectionGUID: RfSFS8TOQaKJGzUP6OadVw==
X-CSE-MsgGUID: 6qbcL7tMTWqKt3lleN2bdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51851740"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51851740"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:57:02 -0800
X-CSE-ConnectionGUID: 6zkz6IDeSU6oTKIQTm7aFA==
X-CSE-MsgGUID: /AWHa/dJRYicjEfNR+EzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="116828632"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 14:57:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 14:56:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 14:56:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:56:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDQ04AMEmTzDSptXB2757n2sDWB8jLa0h2k6u2fqN9S3rIeautlgmCb0nq8FNYm7GsnXg7eh4g7MOktjpdMHyX1WGVqtjcSp36P5gfFH13PHlUFxNA7RzQQUuCTugbg8CSgBsQm6cCqSLSpY16Mh+pQMQibAxsFGjV0Vguz7FZCK/iA+8GGdAtit22kvol024lX3zDgO/KcIFopm9kuWa1kt0jEu/fgu94qMXu0wxSypjpHT2usNe/T2pd/cUskuiS7YRBObcOZ3B7pGTmfDnKvMkGNRCyYS+dCA8Itj2ugcTQnZWUJ9SMqoHIVdmU1KZtyh9RMMPTbPXY2ybJPT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1xq7dJHwHGTqlvGyGU33btLRV9NnBYo65UVndSmvxg=;
 b=QEWEaQkgPCvEz70vh19IeHOO2QhhBg6xFRYWltKWSdX4ufPkQ9sTDr6MBlz6kSfqqOtOEXAJTKDSqGj8ftxgrJQAb1PTVA4A5pt1iWY4ZxrUHmvTLq16kiHfj922CuiXsuQmMXYXRtJAeY0qKiAPoVicaL4XSYz6PTnRqoEucrQQDyRKdEUBWnER8rt05xP0GstGARzeGMKI+QnzO+6viRiS8AQFZzlltnQDys8NEafo7JuauIAXLLcNmlKaMBhxXLQmunNXMOnJ/SLecVWK0q1UEGHoP37NMXbTLdyMTbzOv6ECG3LJCdqxT7i4Jvgcld8uhMqxzMU7Cyii4hiFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.19; Mon, 24 Feb 2025 22:56:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:56:20 +0000
Date: Mon, 24 Feb 2025 14:56:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe/rtp: Remove redundant rule to omit VF
Message-ID: <20250224225617.GE4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224150700.1778-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 7208cdc1-9215-4507-59fe-08dd552673fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xxax9jAMVRP2fwvLq70c19hZ1RU2D/ey8Ek2sl7OD07BdB58pK4d4cwYtPo/?=
 =?us-ascii?Q?Lprq6YGQA4q1DBiMOxkmSQ9SdR4NAvPwL5d9rhHOruRVg+TteXajGU4H4Rqt?=
 =?us-ascii?Q?Y3R2NSSEOB4kD7kz6KyzLmW76pe409bMmJKAKHpw6NdE9vLySP1Vtztl0lnW?=
 =?us-ascii?Q?pZCow5uqH96ysMT/+dnLhsZC1YB/EOhjlsLhUPOMK04ylXHlnGYlMKBSYEjS?=
 =?us-ascii?Q?5ixAi7c8B/13FlOqNoh0y3T0eLph/vDcUTXslLvib/NG1U4hGWE4itGeJygP?=
 =?us-ascii?Q?9ImqFWuIuREOrYVeiJIfb97bqV+2iAPVguSBsslfvlBdC99xBjCfagGf6ja0?=
 =?us-ascii?Q?2NJ3UO+IODM/DToE4qoN2Qx9/k8M1A1U1WkVgL0JYolYOOHz4HIUkfPslCrw?=
 =?us-ascii?Q?s0s47Q7qTM9NABJsTGqy1Npw7rP29Jx22FI4HThgTCtRrZbnVB886Vd/MbS6?=
 =?us-ascii?Q?BXuVN3VdmO9Oq4m9+IDCNoPRpKK3CkpoQ1ajBsGFWLbJNNNNhKANPTc0rePG?=
 =?us-ascii?Q?Fti39AD9RNSosDSQETvc/yu1GKp78DuxkTKX2VMiNplQ/p59ZSGJlVkLJFKt?=
 =?us-ascii?Q?YzH6tL3HHmljCOChmgHkdfjZ3wbZ9ueO78eRaLokzRd5c9MVEdlTqt8zGK6l?=
 =?us-ascii?Q?DcTw4SY60ErIPoKMHOyHxoR0WojrDD3vDasu9caApUhe5VVJedFlDirNAYtJ?=
 =?us-ascii?Q?Y1PFIGhmEhrHWGjtB57lL1WV/HQBXwGpu5FAJ852dH2Nx78htfLhrnRJQsX+?=
 =?us-ascii?Q?5fa+rIgIJhY9UopF+m+P2n5fqeQa1WVXCMv59ag2RJphFdtLsNYeVidbOmuK?=
 =?us-ascii?Q?sHA/GOJ9VPaszvifl/Mv3pNDqDfi8XjYoVnpyssOstUzRzlk+EszLX/m1J/z?=
 =?us-ascii?Q?v6cKpJ8A5KvyXl817svBObnPPgL37wuG+Z6kU9ObHqDmhjS3+ooiHXhcora3?=
 =?us-ascii?Q?ShV8X8a0aZP5W5yCnpO1+ad9m1jCUDyWU3MqlQHv/WCB6BhlsneBrME9fEZx?=
 =?us-ascii?Q?8cJTsWBvgxol2RwzAKiB4XFMosu9ijVuYyURX+I2rDZN94msFrnDMLjlzjU1?=
 =?us-ascii?Q?bV4QWhzJDnw5D0bUs6dTHzHW4EgWifzrBaT1V6OTMP9UG8eJ80arUPjFkaq5?=
 =?us-ascii?Q?rpbVeO00OhyGvuX0KtXb/26rlqkpBZrpi1aUGif89Sp+pshzU2xi93TnffVo?=
 =?us-ascii?Q?sPAE+TuOpFCacB/v9onKi6gBZ0H2rzzXkXF3QjqC1DeW2iWW0eRAiAXdgj7U?=
 =?us-ascii?Q?nurb8qr0/kIEasN2laUL9d1Wezfz3ft8XY5X6zjYHLyGa0gY3asJNzO0azH5?=
 =?us-ascii?Q?IB7PRmNWTcAkfK4qOD6uTEjclNfcHMe5Rm3Jh058BM350STEoa0PLGJmIsJh?=
 =?us-ascii?Q?UvUx82ivfMNAS/6yD7fHZDiaKjsS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0EkZI+I3AGphJAP3myXrrkWEq6EP9YPLZmJDqHi8qCog9phd094cpdMuDRGd?=
 =?us-ascii?Q?Ty+STqXxfqbFgXnP/S0teY1+HWBDU/96Ow64+QlOYLW240eKC1e2NptvgDsC?=
 =?us-ascii?Q?jMeqdfxEUZPswpwvzEE7OL5Bc1EvA7y4d9mq1f5RraQeFUO9940hA1yfmnPO?=
 =?us-ascii?Q?ekvBi7PxW1MeZywH75QmjQ1Ha3FZsW/iJgVnAwVz80RePLYnzEoVPj4RiwXF?=
 =?us-ascii?Q?D3d7dUP77qy3A6SbKRqKyMNVh/YXoN5GL88FPkdpnIviD2TlT0ZZtLGPpD8Y?=
 =?us-ascii?Q?T8FuZfn6EDE7/YglpKKZSlYLPw/jC+ziS6EdnDlfLGSsJPlzHJtMzkwNoIqT?=
 =?us-ascii?Q?xoqt8aO8zttnPAyRZ6NKCgxSAL3OsoQC3gE4X9s+PjpcJAUkMvT9fxSjQ39j?=
 =?us-ascii?Q?AwUaMc9nDnbozcR3cDgQvSaWuvYXwOSNCL/P0bLX9JQ2JiOJsJoGeyCCPrD9?=
 =?us-ascii?Q?NW8/g4Fg396TbY9KhuVbPCU38MGRV2ex1bcflUZdcOfWm0K6TFSg9FV2cpab?=
 =?us-ascii?Q?RSdAyutBHRW7Dlpfbsq5jpCz2+QGSzDZUyL2V6H4vZFHpW3hfnwfEhb40aVC?=
 =?us-ascii?Q?1hLdEFYuNk+7kkSmLYvjwNTYCjkFX444e+MjJUk33viXkBJHem1QG09AcDqY?=
 =?us-ascii?Q?intbTJrxDiXyc4Qf0dM9Boj6u5WedkRoynPdjBHDzm5rmo9oziK0fp3dQPuq?=
 =?us-ascii?Q?YVP+Mu7nl5KY3AGJmogIbSAjDG7QXBbo7b+YpBkP6tUqZ2e3zzTCEnrjd8dZ?=
 =?us-ascii?Q?csEqK+ieg5kLqnpecIbTYqUahzh3u0CEYZ8Gy+DP7YzJPIdRhOtM4O7DC3WD?=
 =?us-ascii?Q?266ry6AkQfjTWJR/sBAKe/bifYdsyxXyxm+aEqMH3bQvOaLdZxhrgBolyqNM?=
 =?us-ascii?Q?lWqEOn0jQPwwfxr1JXOqzfgYQ8SKUZzhGb++e1qNExf0keTgHzJSUhLNNu4H?=
 =?us-ascii?Q?xAbwjfjSZlSvKE/kLnvIRHHyaxeOoUd5S8JzIlWyk/eaG7BB+cszmDmZB3py?=
 =?us-ascii?Q?fEVwAGeCMcMaZiGPkuA54IuTkaqqaKkVagVrJgmxM4tcqyp42KFda6jJrn+K?=
 =?us-ascii?Q?EyCmzMIAND2Q8VGduyo2LoiXwfLEpztHve+4ZjOXR7c8VU8tM8J5xk1mAgSn?=
 =?us-ascii?Q?5r+SnGxK03XzAJzSSPHPtAMBo9wCIkh7NT2dSJGPDQMbCk/yWsKPDl73vGU0?=
 =?us-ascii?Q?3owROdmA3zii0cXMteluMyE8rkew/bNAC8IUTxOg6q/6dyQH3PQc590cb3bO?=
 =?us-ascii?Q?e+VL2nRoBFk3jxpRhCoUHvFrT061WcDdd8XqB1h4dtTvsVHUEhz4W6z95ZW0?=
 =?us-ascii?Q?GMP80ygecEphznZcplu0oFlVGZfKdeELQzFGMOT6vY2zgQVKHJek9WKH7xcm?=
 =?us-ascii?Q?gSwfguIgnKtwqmqBnPNNPLItKzAT1lL3vK1W/cPyEwb3PG6pnA+kV2JlSbwj?=
 =?us-ascii?Q?7e3xs6QHYaz+HEalLYpEjRBTbdWmGO/pphiNfJ3bC+rl4VNZ8kUCA2ajk5pa?=
 =?us-ascii?Q?aa1Lwpz12KypY1DI56CwdK8UTuCLpXQPWrkDGEyNDWaduD689imeTEKYCNVt?=
 =?us-ascii?Q?9LIAys1QdO/JGXEkzqYqM0cwbAllU64rj5rfMiOa+Z5sGJquuS+MET/XI8MB?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7208cdc1-9215-4507-59fe-08dd552673fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:56:20.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d5AHlMd8FRjwTTyYYTl7anv2UrqY3k8ZCUxSh+m5XwVrjpzy2s1Nazug6l4V40T8Wsyh3uYcAi2s6KhOzMC7FXCoRAQ3lKKfbgpvwZw9LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

On Mon, Feb 24, 2025 at 04:07:00PM +0100, Michal Wajdeczko wrote:
> After recent updates to RTP processing which to not enable
> rules when running on the VF driver, explicit disabling of
> rule using FUNC(xe_rtp_match_not_sriov_vf) is now redundant.
> 
> This patch reverts commit 70b8e6e3226f ("drm/xe/vf: Don't
> apply Wa_22019338487 for VF") and commit c2e52eb73d99
> ("drm/xe/rtp: Add match helper to omit SR-IOV VF device")
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c        |  5 -----
>  drivers/gpu/drm/xe/xe_rtp.h        | 11 -----------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
>  3 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index b607be981590..ab1901e39c44 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -358,8 +358,3 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  	return dss >= dss_per_gslice;
>  }
>  
> -bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> -			       const struct xe_hw_engine *hwe)
> -{
> -	return !IS_SRIOV_VF(gt_to_xe(gt));
> -}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 7874ea8588db..7a4f018ddcb9 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -484,15 +484,4 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  					 const struct xe_hw_engine *hwe);
>  
> -/*
> - * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
> - *
> - * @gt: GT structure
> - * @hwe: Engine instance
> - *
> - * Returns: true if device is not VF, false otherwise.
> - */
> -bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> -			       const struct xe_hw_engine *hwe);
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ff9da494efcf..385825f1ca81 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -35,7 +35,7 @@
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
> -		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> +		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
