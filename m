Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4D2C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0568910E8E2;
	Thu,  9 Mar 2023 21:21:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6410E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 21:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678396871; x=1709932871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jJnU2WiV/nKjyShzW61p2Uj8HN8lkaLEKVLj/lssKJc=;
 b=ITsSmIGA3U3NU7AsGbKRMv2Z2CfpRxWXMS4qnyileTMOnpf0fC/7nCQv
 XR0rBDCkzrq+cv4zMBqMM66ZquxFzRsscxj+CGs3yeMQyO+xA8QsQ/VJ0
 8wZwru8SM17QBFRr2V/bd99av9xxbkAWfz+IwXu+SE92AsajKDl2VvFHz
 Vo+jyDgccefPVix6KePAbthGCbE6PXFJ0JB5vTIqWSQbPb8uQtC6+g4d/
 7SyGsu+wP02f6T4FdgjJJkFjDoxtjF8i8OUZQRkax1uyJB+NKWhXgARlV
 0NiqGELSAtOMcj2Mm/gH88CEy88/Y6Cr8H1DFNCLCgNsgG8QSklxWvFhv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338124511"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="338124511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851663651"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="851663651"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 13:21:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 13:21:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 13:21:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 13:21:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 13:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahLAd4pX83CSMI/x4Po61hjbbzDl3O2MSBdFzkImSo2MfTUiOmQbYnNsOz68L/5d6M1rDbiZ9IJYnmxRidBoB9UyxHPixgS1qUwZfAgbqcs6U2F3ERlBpLlpSKZtbZm1zUc355j2wSCVhNA2WNFEKHi+uwlj6lQz4FKLXpafvHWndrd9HtPIomsmIXe4QZgWHHpwv6raNZDg/rqi1x2oNhNujrXgeKhHqqEkrnsYBcdQo4P13Wx6Y3UDhecv6ob6G1VHKcRkH6jt57u+o7dn1HPK6KIpzjnH68quSjEnNTMBGkPSjV5cFOo3dDBS9+NoTWO14H+7wRouL4u7DOe0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0Vet8algMZvUxtY/tGnEJOH+9eZzfX9U0CbPIcnKpU=;
 b=m/yb0GbKfYNC449eUG/0/OkFLgqbHU0fDsJGxJxCGii7jI19PnozO7Ri9dpZqGupQ13sQvzgKTSww4S4y72Bboto6P4JGMntl/p3JJ1mi/kFl/v/EA/4OHdGHbr7HZrZK/euqrvzASBygnyKAu8soA1amINaBZVCWrkfVGMSHzd38Ng5APKT/bChX4mIJlhLD+yt31/YorPHxQjT3e7IPEfFA0tLs/g1Nj1CPnWMaQB3KXAQlM4U7eW6YcznTAjV6EjvfPttFSj4ie5y3DhqSgYKkuP+61zFwrU7JPGNraIfamZGG8ecdzAFDxEE16c+pzmcOCYj7Hq0ojVRs7zBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 21:21:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 21:21:06 +0000
Date: Thu, 9 Mar 2023 13:21:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230309212103.GC3408186@mdroper-desk1.amr.corp.intel.com>
References: <20230309211210.1713613-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230309211210.1713613-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d9b478-0bd0-4b60-8a7a-08db20e431f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5hLWKd6GUyBZmPl1MvGAvKnaL+cn2O2KeipjGL5q4kXTJUyuQn0/Q7yTXo/h6YtyN5WseUW1phEVglhPlZ0f+eJJrmBHBTvrP5A+NMRibgoUeaKk2mmL4YHWHZvOEXSSeUKM31l9iZlcEpqGJEaII6qkCFnF3Bj7e5mFzJbwFlQHMPYaXQ5AvGux7s52ZHtkoik+4SNgl1eBH77P5/EQJu/qWIMuFyde1rCDPojNXt7gwvrX2G/gCrT8MXTNuJ0os2qa8jbGpdqUd42VvF2dMD6PdP9QQvUN9u305SeHOt9Ng5sLwpI3cYSDWH4k0IUCTAWQofsM8nLZ3nzgeFQpzhsRFnNfwwpHmaVytJq7ZKkNu1pxduWR9Fa+qQbewMEYX2sVCHSRTIlLfkJ3QmZO3s5G+5npJeHevQzbmiLUdJgn8WoHlVlDbIRzWL9CLrHoJCzYoAYRCBZRUUBEpfSCzKqc6yDTV4YddEBa6z+KXVpvWeybGP8eSTfHNAHm2M0zeZfmI+sELXVBdPpSbsyk/V600GkW7VPW6eByvbXNMsPHldyNZN5VIWl3oiFB/lASLfbuoEsU03/qGlKpWdCETHJ2qO3uHy373rUQK9kshbCWah0XDmtz+saFBtC/3nJkdLz1VZ5b2StUuvminfhiBnHA74UFHj/Egc+KDKqM99+nMTsmFxNJyK4V3IN8I3R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(82960400001)(83380400001)(33656002)(6636002)(316002)(19627235002)(38100700002)(478600001)(6486002)(6666004)(6506007)(8676002)(26005)(186003)(1076003)(6512007)(41300700001)(66476007)(66946007)(86362001)(2906002)(5660300002)(66556008)(4326008)(6862004)(8936002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NCPJK3aeXu6gIKyB9TUtFrSdtVEiKNIlNf8so2akwYdj5j63S2zlaFInMbF?=
 =?us-ascii?Q?EhSy7qGpBV0ZZ66e815OG1NzrdhOI7CfAR3BrurU+VI7371geve0fDqgpgZ6?=
 =?us-ascii?Q?TNMd6l1uWl9A2y2+u+pZVNqU5tS4G+3AUVQzhFkSvgsyYLthm0V1YgH+jfcM?=
 =?us-ascii?Q?3Gf8F0i4SM0ERXQoZMYffcmPpozwAj72UHD8I8ldd3ul/FmxMN3HzAchgoAh?=
 =?us-ascii?Q?rWMSVStwWNut80aA9bb3tmmvbZx6plciPcQxDPIRaWGt0iyjNz7D6JMLGWp4?=
 =?us-ascii?Q?7uZMPbIvq53Ozcxudib76xsFh+qxlTG6mRPmIEEfvd/eInlC/O/xQYaPCL75?=
 =?us-ascii?Q?CXfMI7UiENrq4bzWu1q0oNvAoXMXmHdy/XQQp/XgtvxZlAJ2hwxQh6+HV0B6?=
 =?us-ascii?Q?ec3La8QAJkFIiBrkfu96YDGjnF620XKyr3cEucT87LSoOmoeBk4/wjLVjCQL?=
 =?us-ascii?Q?t65y2Gzm3ikql3gFUtyjfbRVBPwM4PRlXFnIJQL9lPV/Wzl0oKSQxX5OIYyj?=
 =?us-ascii?Q?5GFyDaDA3O6GWZWkj9UWHj19bYzPHKypyDk7MHSjcC6FBNEADCIknYOZOPQs?=
 =?us-ascii?Q?HHHBbGNCDygy+VqufliL+x9cdcJe3bUxNdKkqqoF188R+6/ssysR1ShUmgNE?=
 =?us-ascii?Q?BGGxxEFocUqGi3DSPKyA6C4ZggdCR7PWV4ZF0W6CfGvGYs1I8bJB96uKZBA4?=
 =?us-ascii?Q?95OuA2taNHE+N1h7qLAXS17YWGfUp76tpIblzStoK3iYtTz4wKN027IjrbMQ?=
 =?us-ascii?Q?dTJ9z9V6yvoaI4sMi4oBNYUaz5dhIspPnLP0D6qnD8sh+heq0RRzKxdMpGvK?=
 =?us-ascii?Q?DHYTaVFEij+rqDuoGO+RX1e30MWmlLw+Qklso/qwsRk24eWlCRBfjtgnKTEj?=
 =?us-ascii?Q?LGSzL4/j5U/FF8fHoC+r+tiryrhMjJqOYE1ojhKf0Wv+wOug2jyy7ATB1Wme?=
 =?us-ascii?Q?8HI9R26DE6wq594Wk0LinDrKnW4o3KxctKMxk5xYVy8UaqfAaZt7RnZzRgTZ?=
 =?us-ascii?Q?XeTinIcjzyYteaVyB7RaNpP6vO0bX+OO9JSd0G8dlx4duI4f7RxDGsAK25F+?=
 =?us-ascii?Q?Qh/XmyKPVUNfGvAAWzZ3qrL+BtSHDM/AycFjiXW3HVs2QzcHMIuaxcMTz0wK?=
 =?us-ascii?Q?zOAz1iHrDTolgjEZXBb+JFg1ujpyQ+MLB+at0ikWLGMcFlbrGxl4Y7kvvINM?=
 =?us-ascii?Q?3FKuWzoenplif2zVEiHiXCrVgcGhg88wCSlVXyiVSy/fcW3jrPbDMOelE5bZ?=
 =?us-ascii?Q?rTh8U6Hiz/8ueLOuURGZh5SpM5f+ojKSZHng5LiNPTE3E/Mm6YQ+3aiQlJSC?=
 =?us-ascii?Q?p4LxW/xu73VFMmvdamYX7po96DBpzbZlJnv/AfjKM5St3ffxOpxUDoULE/7r?=
 =?us-ascii?Q?EyBWaza4mnZsCi5Ni8SjX3snaHtsWWIlHQghOGmQhktH4IvOgmyPfLYwVv5R?=
 =?us-ascii?Q?xzZdzLhdcjmcwJXcb4C9sfnUN/L0rN+moZko03ad6TYvrH8BNNKs1axCoxaC?=
 =?us-ascii?Q?ZZqWL0l24jkJWzGx6cAGe4Zxc9TIEXpc2pGLNTDVpKQvsZKiKwCA8cVk2AnP?=
 =?us-ascii?Q?yz5ingehphk2as/PTIHmYA8/3Pnt8h6TLZi8TPjV6PG4tBhAXas9FARWILl9?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d9b478-0bd0-4b60-8a7a-08db20e431f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 21:21:06.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ioji10dPekOn8cVU4s2yjfNhOJFvqgmvsOMqVRxMgAYCLYWuIl9r/oq303Y9yvMuuemHzhcssUro2nBmczBwHNYeo42tWt/i/PnmkcId2HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mcr: Add L3BANK steering for
 DG2
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

On Thu, Mar 09, 2023 at 01:12:09PM -0800, Lucas De Marchi wrote:
> Some register ranges with replication type L3BANK were missing from the
> driver table. The following warning was triggering when adding a
> workaround touching the register 0xb188:
> 
> 	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table
> 
> Add the L3BANK ranges according to the spec.
> 
> v2:
>   - Fix typo in one of the ranges: s/0x008CFF/0x00BCFF/ (Matt Roper)

Nit:  the correction made in v2 was actually the other way around
(i.e., replace BCFF with 8CFF).

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>   - Add termination rule in the init function for L3BANK (Matt Roper)
> 
> Bspec: 66534
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 10eff02cc7db..ab8fc649ba52 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
> +	{ 0x008C80, 0x008CFF },
> +	{ 0x00B100, 0x00B3FF },
> +	{},
> +};
> +
>  /*
>   * Although the bspec lists more "MSLICE" ranges than shown here, some of those
>   * are of a "GAM" subclass that has special rules and doesn't need to be
> @@ -180,6 +186,18 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  		gt->steering[L3BANK].group_target = __ffs(mslice_mask);
>  		gt->steering[L3BANK].instance_target =
>  			bank_mask & BIT(0) ? 0 : 2;
> +	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
> +		u32 mslice_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
> +						xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> +		u32 bank = __ffs(mslice_mask) * 8;
> +
> +		/*
> +		 * Like mslice registers, look for a valid mslice and steer to
> +		 * the first L3BANK of that quad. Access to the Nth L3 bank is
> +		 * split between the first bits of group and instance
> +		 */
> +		gt->steering[L3BANK].group_target = (bank >> 2) & 0x7;
> +		gt->steering[L3BANK].instance_target = bank & 0x3;
>  	} else {
>  		u32 fuse = REG_FIELD_GET(GEN10_L3BANK_MASK,
>  					 ~xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
> @@ -277,6 +295,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
>  		gt->steering[DSS].ranges = xehpc_dss_steering_table;
>  	} else if (xe->info.platform == XE_DG2) {
> +		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
>  		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
>  		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
>  		gt->steering[DSS].ranges = xehp_dss_steering_table;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
