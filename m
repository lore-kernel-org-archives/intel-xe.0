Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED38AEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE8B10EAA0;
	Wed, 11 Sep 2024 20:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEoQgA58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DA410EAA0
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726087089; x=1757623089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T0YSLH0jI1nthbbnMBRVTHv8GqV58IV9E0YLC+wYtsI=;
 b=nEoQgA58yZFNEMED/KWgEJAsgA87sMoA1/G4Xg/aNl086XYVhhwqu69c
 nYV/13CC0RjrUNEmmE+bxTAKIAhhrrgQ1R3eiuhOS33rM94LwuWnW/xon
 Pudd2yxmJuNQWhaIEN4Vzz7jFJBMD8cJazSxgxvgZtRm3WcdylQ4BXjyg
 T4bDcSWu5w/sroGQW0J8Xfc2+G6TVj6LtyFizb85o55kq4VX1AE3uE4Ab
 UGbw+p2djPVTwdfh2TKbeAAKuLhZ7CaZDwJWig71Dz0DWduLX5SIAU9jb
 MtJwobkchDgyzHYZtQFOH9PxqQUSqUOrub6uHeF6Wx1W2e8g1DqeT1xz2 w==;
X-CSE-ConnectionGUID: d7svEU35ShSeP4zYtG+cIg==
X-CSE-MsgGUID: oQf6crcHQJ6SXx+i+QWvlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36047969"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="36047969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:38:09 -0700
X-CSE-ConnectionGUID: Mf008M9AR36xL7HoHo06Yg==
X-CSE-MsgGUID: AmqparqxS+ihRPJie3kiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="90735503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:38:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:38:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zwe6QycKLRLOR4xgpsd8O2B4xChWPwSM+i9RqXjYUCd/khj4N3DNNxL9cyUBpdXDG+pgES1HwQPdMip6LEAnIF3IsSUYuIO2HhqSoN+G8DDw/TOj83cDSKuOhPJD1hrjMRevOvf3ZZMEeAhT74Hybzck1H8QoiQ4mVowzHqIyAla7N+QGEPMAw867q5ym5XlMCG2CRRty9UMKkGLvn8CfuNY5BhlM01Ev+4CCIgKEPjcppuwbbtwyA8dufgVGFtciuPMwXkA9Xl8vhBH4j1W5XZqob5JdSxltRpS1islzhp8/OSy997kU1EO1cgDITsECp801MecZaMhldvfo0plCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRSPMnp1aVhTDwOKOEMXYmOVT19uwOJbF5wGShYyo/4=;
 b=n5lZxZi+sYrE+HulWCYdBaOqXvrG6r9EUkstkTXAY7QCE9Gry4lfPNZYNopAvsjiIcwhfGm38YbEJGzqbobEw5e8roFqXahyJSTtqB09xV9kGa55q/UB6+5odV95pi+CicK6AVx2eSlR64Su7IaFFSPcwY/i90rQ3zXj8issdYsOuATeM7Ml5MZywCCFIHtizOjwdOTyUwfsoYMHQAKONWpSnaGevVp4Vzq1zHs5levt2DGuXdnmXdmxJJUZ5IUjWoO4QsOTaZ6WPk0eCzj6G25y4EM+QC1KU6++z1s1Vw+/5f/4Egs0Kk0vRAlvo1W0GZkbEew25e5RTaBjv7zAyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 20:38:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 20:37:59 +0000
Date: Wed, 11 Sep 2024 16:37:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <imre.deak@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Do not suspend resume dp mst during
 runtime
Message-ID: <ZuH_o3hSxT0g3gCi@intel.com>
References: <20240911152724.693560-1-suraj.kandpal@intel.com>
 <20240911152724.693560-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240911152724.693560-2-suraj.kandpal@intel.com>
X-ClientProxiedBy: MW4PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:303:b4::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8bcb28-8cb0-4896-7805-08dcd2a19fcc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KJjk2u7lL0GUbTddIyikLXrcKLVpD+E9LJ6en7kx3D/UbO7Ikx1S4nNVxvfe?=
 =?us-ascii?Q?nErl9YpqWnSmDXwgzh+LPtACjEjfLHaKyZsrtmniUBVrBYW30G7VkH9Etmj6?=
 =?us-ascii?Q?Xw3NeLejCNHi8Od0ygOPn8QX3efzURDKW5voU6CovP1AjqSCCnvEThs7fVX+?=
 =?us-ascii?Q?lHTOJsbq787I8kbZEo0IfSVOJ/gswncP9gxu33zSapp0rqma0vdt0epAb4c/?=
 =?us-ascii?Q?fbCzKCu2NHJUr3V6v5+0WJBMUhySLEN4zbLpdXhnWZj5cAtx5XbN5uT9zxxR?=
 =?us-ascii?Q?pEEgw4SblRz/y2Xt1qeBPuDxHUMHW0Wv8kHoFoYQ8WoKmEZQuX45O7UGC2OO?=
 =?us-ascii?Q?y9Qv/bzZBwNTZKIka4+uJlXCqeHfKfscalVaHq15wWkJgcXCENX9OuHgl+el?=
 =?us-ascii?Q?adZmIJrZOXrnVwuHEpaRv1b156IK+1pCKHarA4kVAto0RktiUtoQQPrQxyn+?=
 =?us-ascii?Q?UuKXVCOafDrhRGIx4XMH7eEVGclvqdPOHioJKwACyhWBzDmqcqQArwkb8uiz?=
 =?us-ascii?Q?s6ZJTDlpCPqyajKfEds4aTng3u21N2WsUNxMQQiYNzLcIlBXkxvkqiZ7B3hj?=
 =?us-ascii?Q?GHF6F6C8UnzbaYuZvjFjnks5GaFesPSZ9ep4FvGM0Ee1LvYtc1lLnKGZAzEV?=
 =?us-ascii?Q?GkcVdqiXwL2h1CoW7LVqwNRaSoiBBuZ9EBSKc/Syu95Cwy6/OK+Fl5IR+IG8?=
 =?us-ascii?Q?IZhRJTKp03i+7RQoVGW325f81cq5uqEzdS7puKciIxUtRxHU+FcDOGutUp26?=
 =?us-ascii?Q?0dOmLY1PAPIzYUH+gQXZ69NkrNj8w4QdcMtxWdTaNUsjU30qlTm+bQe8ula2?=
 =?us-ascii?Q?b+vM4N9Hr0BpzOkXy0H/qWR5fAVGx2pVNXDFjxSdsOmMQqYRgKacLE9YeQ22?=
 =?us-ascii?Q?0aFVQV6QtfVvtdLCHCjOm0AgBh3KDmbju4TOyZVNRenAmF1dvtD+FIgJaSE4?=
 =?us-ascii?Q?OARbvR82T6bGYyeerkVCPnTBMGBf81IeDOrbtAINoEhPW9hs1woMcC3qoZLO?=
 =?us-ascii?Q?2jJvMg2X0AaBPDu/jNzz9OwYITB3WSUMrVop6dK0Mrq0lzZku6nTGKzlk8Xb?=
 =?us-ascii?Q?gZIK21CrwDZ2wuMpI0mdrGxTWEUBVGTEigDKOauT/GQ1ImPneeSyBXfp4boJ?=
 =?us-ascii?Q?NfRIJg5ulMNKka2oS8aXhtsoR6wbJ9M4hYiQB6eP6BHk5Zo4VQVFnbF2I8Nq?=
 =?us-ascii?Q?IiSwdvYQoXQEAOzeSf5mGEloDlOsTTAs4uT4UZCrd9yVbeflNHaYiQaHrfdc?=
 =?us-ascii?Q?1NDvpMAZaPR3oIXrjLy1Gu/wYKPENV4nYqTH05Rfs18s/SGEk1SaVjSYL/S6?=
 =?us-ascii?Q?Mbw75hTihGEHQ2eQuS/RjvcnrvdIOvQR71SxF0Kd/NUPbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxZbSQtAS1Orr/6irRJ41BTCSg1UKxipZtKHZWZF61MDmWfAw51CkM43P6k4?=
 =?us-ascii?Q?JiSkwQJPeZvuWGLKI6SQhy0BM6wtgSDlQYu0cvh0CD9CUX+sbrRwkrdRlZrR?=
 =?us-ascii?Q?ZI4145CSly9Dr1al/zCbBJ0CBTG/j+jQ7RDJHCN6FsL4aBd176MA8Svo9+vz?=
 =?us-ascii?Q?+Ul+i1C0qIeViZ/R8lUHApzsOMZm5X1vJkADH1EJ4px4L6rMOcNsRVPY8CHN?=
 =?us-ascii?Q?IEQwdLquzkLGHvYLe42Ho5fixHqTrG8MKs/0j9at9U88LOE9KMo+lp7DqOcu?=
 =?us-ascii?Q?P5F2ghJWQcN0TD5eXtuSBF6tyPYPIAqDD0w7NmIlDd3QwYHVylSpHolX30mp?=
 =?us-ascii?Q?nzNpDrETAf7qkTTTbvqs9FDX7MtYcc6j3wmXGGjc2L4tWZLzT+yV/uv0aOzL?=
 =?us-ascii?Q?fGIFblejegv0Z1go6ST1ZVv9w++jqYb+p93bpB3q/RH1UHxNkz7otJI6iG1j?=
 =?us-ascii?Q?YtWhcP9o5K+83Jv1L47srqBNgfx8lQT23MKvFVBT81GWJ26oHv1xSkxGmFRE?=
 =?us-ascii?Q?9uUZDVusSkd/edYiOcl0rL1xiV8/OuqkdBn/d6aDbkw4oZ6/FQtCRolimfpp?=
 =?us-ascii?Q?+YVzFXpBIdCJOPATaSDbapOz+x+lT6traDZ1+7I648fpjEYfhSBe7SgkOwrI?=
 =?us-ascii?Q?Hm6ggDmIx8FSeL+chpt721oDoYnRmuqEERx51RiAm5aqnf/R6xTFTcUUWQX6?=
 =?us-ascii?Q?AMSQMJMdClwK7iUNl7kxNpW79mgd7t/q8a8MDrf2xQVWPUqjfhK/YqCK7SBn?=
 =?us-ascii?Q?fqQ6TxfcAMLT+YOt6VnikyYn+JED2hyB7+b6HagEjoeX/m5M580YTgqeuuyt?=
 =?us-ascii?Q?3dBnLAhcV1hv9trMKcKIhxsJEuurRtENiJDtsY+M1KQEoI4fs+cdcIUJmLQj?=
 =?us-ascii?Q?Pb6F6+wiFTZU9xzmEw0CeFXAmVPf4bjoRKNh5tvp6H2MIHxDNpCeCbe+WUcY?=
 =?us-ascii?Q?K7bMBR4mKPVhzSb/0pMB17d48BzYfQbuNORAZSU1q70AQs0cx45GLfw2OypD?=
 =?us-ascii?Q?U0DcHr0zG8D0RnSqR36qSWOaikn9dOsvpLFPvEtpdhKBclp/AdjNmwyjwyNi?=
 =?us-ascii?Q?NMyaobPc/FHQr4U3fwD9JmHaJPKPsIuAOPxPKaFB3gtA/Ohbq8kCiXunLhVk?=
 =?us-ascii?Q?V8yK4rKirRrNRecGTRqj4YPsCcNHU0jAZS+PUvmsTRDCboIVRaoEfSQ0QxHR?=
 =?us-ascii?Q?YL31I3IpIICMbcizFb5Hxo90fKa4C8nGjmcVNKIraAPTgNfeIXzKhMGPgyXb?=
 =?us-ascii?Q?xkmvo8tczha0fBppPZblBBHSZUQsonE6p+/ZkORz98SGGaOf3azd1Q9ivSHo?=
 =?us-ascii?Q?YFxjyIq/+18Pu79S5H/G3raLdVexbrQzREQ/3eSI7XcNfMfZQkMsboW3Ujpd?=
 =?us-ascii?Q?1YNkwELN1xRwAaZLP+C5iFTienMIDFDb0Lg2p7OygepV/ofNG2GLXub8U3xk?=
 =?us-ascii?Q?OSV3J1BeimLpsv4qOq8LTiflvywTT7CAJ1Kh3ym4e2iyfu2CX/eoxFidKmWr?=
 =?us-ascii?Q?mIXMRQJee2MYBMQ4q1Pw6i1Mgj84277AwLOIHWxatjVs6I0a4Mz5RO3Q9jsD?=
 =?us-ascii?Q?IIx+G4UpUgpiQys5VoPajj8TqWKEo5vz7u29qNn6199yfp6+p/AbmPNI8X3D?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8bcb28-8cb0-4896-7805-08dcd2a19fcc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:37:59.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54FVBzxzMEc1Ce8OgNdja4bcVNewaF6LRtVXIOeYQwBMre7ndLgcqEQc8s18RiHS9wHwb6hzyZLRQdlZoUXxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
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

On Wed, Sep 11, 2024 at 08:57:23PM +0530, Suraj Kandpal wrote:
> Remove intel_dp_mst_suspend/resume from runtime suspend resume
> sequences. It is incorrect as it depends on AUX transfers which
> itself depend on the device being runtime resumed. This is
> also why we see a lock_dep splat here.

I pretty much agree with the intent... could you please provide
some pointers to the mentioned lockdep splat here in the commit
message?

and with that:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index c0e9aa7a274f..a09062b7687d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -342,7 +342,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	xe_display_flush_cleanup_work(xe);
>  
> -	intel_dp_mst_suspend(xe);
> +	if (!runtime)
> +		intel_dp_mst_suspend(xe);
>  
>  	intel_hpd_cancel_work(xe);
>  
> @@ -407,7 +408,9 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  		intel_display_driver_resume_access(xe);
>  
>  	/* MST sideband requires HPD interrupts enabled */
> -	intel_dp_mst_resume(xe);
> +	if (!runtime)
> +		intel_dp_mst_resume(xe);
> +
>  	if (!runtime && has_display(xe)) {
>  		intel_display_driver_resume(xe);
>  		drm_kms_helper_poll_enable(&xe->drm);
> -- 
> 2.43.2
> 
