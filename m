Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34268FF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED15610E963;
	Mon, 27 Apr 2026 22:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbRCSXLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAA610E0AA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777327703; x=1808863703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3bKza2+/7snXxbwowg6foD7FRc1WPdOLx/PnfNN0lmc=;
 b=gbRCSXLnAKqVtaDsjTUPP1sUJQBvahFK0JuB1spDpo26JTVM03FTT3Zt
 Omi5N+Svk7bI8t4x3OKpxPSEHOtk8wpweRvNRkAXvkMf1LM1jEzDC+DkM
 ST+2xJc5620wWqVLvYLPwlbh/QKfWuEzTc5Ft19oD1KUQekf5MOyj1U+E
 yu3jEBWzgjQjJW9OF7YP62DiDNwt1lU3wRy9A5vwLBLLfIV3tWKwZsFua
 /rqBQQl7PFx3eNkU58mjrj4HIT+qMpWD21u5J85A1Nh1dAPaoNI1srzAa
 3DasKV96UqkBr5IUkl7sbSaEW5BFH0FVP8Fh4WMzxXTPYhZPXPhsQnRc/ w==;
X-CSE-ConnectionGUID: ghKhLQKkTbWlqjBofttD/A==
X-CSE-MsgGUID: JQlgS1DGSQKJ/RxS7y6elA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88828224"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="88828224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:08:22 -0700
X-CSE-ConnectionGUID: B21sRN6vS2SFd4Dq0Pp5YA==
X-CSE-MsgGUID: ljLOZFZ1RtG5OOoBAQcnoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="264159775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:08:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:08:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 15:08:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 15:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoYF0GG0kA9Etnyi/ezyLhasBgd4oruP8L1OMkZl3j+2ILDGi68FYUcMe9BB2E9npAYX7ykogrizI0x8VO4B9BPYwhhgWTDN7NGFTgYIACwvt5YMHNiPaXnuU2Y+CVdghAmT51gMnGNTvBJAnJ0zTpf1hKG987oeLfC9NjH8t8HVXmKspkTQkf5nssE+OdvYaIZEgS/OEYmg1mxvzwAzaKPIgm25D+EivqHkWx/0ywS5li1qie893s2hU4CShJx36uhCmgpkLctqRmWTG6xSS0IOfw6WPbKHj2+h4H29BO1j03XzVa76JuTfgXmzce3IlmQ3fQpD6uxKeX4NqB8djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxISbf26avzRrpeOwn1Mq6svYOChGxN6/i1z/aNk53Y=;
 b=S94S2Teu2BfB+Wh0DfvxcB3uaWBnISIiEs0K/mIoQ16moZFr7hAY4lq34oiHEoM/IRvVSOK3Dv42dg/GfOkyx20vhZ02XRg53AMtfabVvPfkOOibkOX1elDEJMzUSeNCk8QIpaLDSt0tUVxVtCnQlsly3cCKxxJu9L5zH1OOhQZe/MQiGIdayXm4YhBy/I8DZiiq8cciBu2iGyU/enpkesF7d/d9SxSO5KBFi4TI4K+MHGl/5TW5F/lzIYllwWtpULE40ALBaNq3oLIPZ2CWXZ8RpzPQCzg9IKI/nmn0TfWLvJ2urY+uboGHzEBcIFv4cY/5YnX0VQ6r8S8jFFHKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 22:08:16 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::79a1:7b0a:45ee:cdee%5]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 22:08:15 +0000
Date: Mon, 27 Apr 2026 18:08:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/guc_pc: Reorder forcewake in
 xe_guc_pc_fini_hw()
Message-ID: <ae_eTPP_SbS8QXdS@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
 <20260427092928.1181893-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427092928.1181893-3-raag.jadav@intel.com>
X-ClientProxiedBy: BY5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:a03:167::37) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e6a4fc-707e-4333-8f54-08dea4a97ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 56ydz+HmGzHISsqjXE77eFXVo445xeKruAkQdw7NH37hO8aIF5CXJ9cPO5QjaH/Yh+2lKrc7dcepVnWuaE5gq7YM86lBM8/q1p2EUgSNjnfyL+ho9eB6JU4gyge074lmGS73az11/ZZhxjJ0RLbXzzpK57xrJbdEkmSyEEAamXZP00Z5wowa2x6u1VvXzEDE2vP9EDG9W7uHIjrFxxyu3mrME8aETRX0TGqTfDWBZEgs9/ZfrwLYiPkIWld/A3kPI3oNHN7d+EvFpoU5hnkBTMq4jWeXGD6CQQKoQcDIalKLGJGxXS7i0kpQJZTqPRyyjyKox6FFaVB1pai9F5YXu7Blqn5H8NWXqFdQiQHIGTOIBfoqXwsXhepew4rNFJzz9ECV46bvGMiVMYYUjgPokZz1MsGgoaqEYOzGgRaUpshYeuPj0d0/BgPbOjTuh0SZcPVVSd56V5FiWjENvqFfGVuQRE6qA39moIPsD3Fkg6xoxnbOYvCjg+tE/LVDkH5GjEv0IEzo6a1YC30kwPrjVmgDE0ayp3iGnuu0lGQO2paDzFQkrqAJe8Kg3kvT/rafcm2nHcd23LI6kbF4XH/8rqTvjyqRYWvnlCBC7QPK7hUUWOPHXFdHCDe1kEzJOBBtBKbwKnKioJDFRbbceHW+WpCv/JP0mdkVnNLocxSw1o6ynXwuUNBKSGN+71HK0ipttHqWTyR4eA77crz2vlLv3CCOo0yNPIwHBv7Lthia3pU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5kTXSMWNT5VdmaW/q+C/0XG1m8rs/QN6iwPRXawHX6gpUXFzm4MPNa+93bn+?=
 =?us-ascii?Q?rITYDlfHBrk5CdKUWUBvmx/kl77zsQCgB69GjvdKugn6t8vgvC+lv2JL0jl/?=
 =?us-ascii?Q?bQaItstEiC2kInoomKi4po8x4/cgsRNY5IgafrK3Rtq/VODaekH/Dg6hyCCg?=
 =?us-ascii?Q?ppmr+s5oeUyYcW3og3OMrbzAVYf+krE+IINmt5ecSKx5FVwoVXj+mQLfKELb?=
 =?us-ascii?Q?m6LWUVssE44IQmrgRKHptH+Eo9D3Pq29nRrnkNKq6gYQXBiwZyd7HWOOcQPa?=
 =?us-ascii?Q?ZTcEJ/lk4E/WJCynRtAWViNyRCuIo9oxseDCOqlJ2PuiH8CtcU1oeEYHA05/?=
 =?us-ascii?Q?BS2ambJ2y0ghCuozOIMezgIhfKj6OaUe4/VCubOtAqVEX8qw2SbH2NJRkn/o?=
 =?us-ascii?Q?bv+lBBuhe3Jk8xPMmAaCHRBi8K0ztqfjZiycXu+b/JK8iinAMUh9Ijwe0zrs?=
 =?us-ascii?Q?egz7pFdcPmtwzqJ4+yz480gOtdM+mA74Moze7nmLXp3/03qDkqRW+4SP5uZC?=
 =?us-ascii?Q?/ycpSyukvc4v4OWNqo864y6YOPBJKqsQDzMX8EHgW6842pMMnXQh6FiDuI56?=
 =?us-ascii?Q?uCynNEfhGbUALG2BAuIlUujnUhqgeHLUg2bPA+59kFxlqEbe2Q4BoH5D2k39?=
 =?us-ascii?Q?yP0g6BAub92smoCH2g61OMpzeCeQvXw5YsNrzwUbwyDRfBFrBWP79zCjIRDo?=
 =?us-ascii?Q?ZADvdlTL8PtA9n0e9uLJPxWmvCXqiseDbR0iSPjSSFgV+nSerFg8QpsnHHOY?=
 =?us-ascii?Q?1opTSRedJZQntWCbyChY5mE6E2ndmGYwfac2lvTXIZwVvAe8gGu6zozpmGKf?=
 =?us-ascii?Q?q3kKgVuTrEFgMoLlf5mImCrdaZCp3tX4c8th7Hjmpm3oc92p55a1kRLxNWLk?=
 =?us-ascii?Q?Sj4qDsoCFHR/ODd6sCQFZ3g1X060/hh8uA+1tDYaHAgywUJ+7gpYyCePU4pr?=
 =?us-ascii?Q?PP7W6UMvjEecJlKvFy858InAAcpb8jLD8PoqX/4Cw3ata17BXadluGTMnNMQ?=
 =?us-ascii?Q?IPJ6Tj8ao6qEjmiRusGlUU3zGXkZJrsqlH2Ra19hFUjjJYi+8PIt2VXbeeRI?=
 =?us-ascii?Q?vCRS0ryD2op7wCoMdMHhy5tg3iuYeUkH3Tk+EluZtH+WIULKsEntBiIiafZW?=
 =?us-ascii?Q?NpheizLcZwz/IHaLe+tOEXBa33Rz8RTCUME79lV5NkbH4cbt3SGUGfuz4Gnx?=
 =?us-ascii?Q?X2T1qIlGrQVELFCbysvzzFVi18R2za1LE65ajUDeRUxSgGA2Bamj00c+wvbZ?=
 =?us-ascii?Q?mPXWLGIXmbQUpEhNcs0Qxx3irfZtTimz2R8/quN+8OK8jsdEF4ZBPvoQlQ8e?=
 =?us-ascii?Q?GrHUGharwbTicDsIavSwW1myWC9kJ5xkuo4sSOfBya1v7rHtFrdqiyPrvYkV?=
 =?us-ascii?Q?tKcInkXDq7MhzqtiK9CIlCb2r4BUnIU8G0b1HjPjJ8OnWXmcX+hynAhrXBE+?=
 =?us-ascii?Q?TS3KUBREGf99g/m8X4YNq0T9088KBeZxPyeAaL5v2DRhTN2j/YoRD9luHZ+/?=
 =?us-ascii?Q?V5QBpdzCTfZtw81Jt1YKQ8K7gcZoz7phemonc5mihW1QcNIOqfFemrkW7J3n?=
 =?us-ascii?Q?v7uvuv/i2qIQHlt1RqmzodQcQF/IduXWjCn8Y5G7LBrCs6UQSxPWSxV978DP?=
 =?us-ascii?Q?COLU2o4u4hOl2UFDDGmCivSFp5fcFL/1TkxoM4KFZnVifYrUKdSO9Nm6/YQk?=
 =?us-ascii?Q?Si5RWMEo1bcdx90MuvIh1G+CqFt1jc7I1BFpBqRzhG5FKeKT/lqi48e4oyBu?=
 =?us-ascii?Q?3xqB8R2THw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Svxgm+asX7QoqGNrxLlcKXndu0z1cpZgeRqXgkfdPFVc/lTETF68Qn7ZnLVjZtPEHSnknjtV3l6nP1g+GDd6thnkxXh6dACo4OI59KKedQD6B2UFU1ReVTwEOiD7stiHpJookUtAnr6TM7Wd3N/33gyWLoHelAH7sH7FuyPO60BoNLLH0mEpgt5uQrbV5oOeE5yvGINP7pKr8qcBgBIMqTwWe6QpZ2/U7fp4qW7pq8DlLpu4SikWOnLaWhebRicmKfqNDFM8I1lYByweWRysDJpPaXnggqZo0akgmS2owciZhHx6iV/jC5IMDyW7f3YhOVekR2O8/15oxs6ZXoU7cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6a4fc-707e-4333-8f54-08dea4a97ac3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:08:15.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OVDgqD55AMeYof6FBFTZWQOE9si1RXgscXWjaQAmkHvhyga6zLZ7d6cdsZ88qIpTXdGr0vfi/8vJ+qf/19oww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Mon, Apr 27, 2026 at 02:59:27PM +0530, Raag Jadav wrote:
> xe_guc_pc_stop() doesn't perform any MMIO operation that requires
> forcewake in it's code path. Move it before pc_set_cur_freq() which
> writes to RPNSWREQ and actually requires it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v2: Split forcewake reordering to separate patch (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 9530cddbd11d..59f2fa79ad42 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1340,10 +1340,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	if (xe_device_wedged(xe))
>  		return;
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>  	xe_guc_pc_stop(pc);
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>  	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>  }
>  
> -- 
> 2.43.0
> 
