Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60731E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51110E392;
	Wed,  4 Oct 2023 16:28:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81FC10E392
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436892; x=1727972892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SqfFuL3uemT/ZDeGAnlD37EUZzIOyABrzORAkLgBkKA=;
 b=bbjv8Zw/ZD6F1ZjD5LIJuHFk9UkQphdyPb7GBlhptQSHF8tZJZPci2UN
 Zugu7xDbEQ1vJanf5Vf9zCa9cwCuX2rHeSp/O2V/hFgK3yZsg4RbBGBC+
 ISZ6eKI1ubYQeApbSIQDVHOg+pjefO6bE2BNkWqhB2fsTznuC5OYQzLeC
 MoN7Ba6LcOA4VYIaD6u0A5oUq82CAWqZaislK61Ad6muGuVvgdJHRs0w1
 9tpi8oL+scwGxRvbPKxoM6ZPh1BVK5PVX0Fh62eqcKlWs+meodw/vLvR9
 p0Yb54uqRwIIfmwmz+ROIpG6eneRXJ66TCu83OhH51dtZomzGpEcXzEbR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469493220"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="469493220"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751361108"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="751361108"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:26:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:26:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:26:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfL1s46fD/lR6fS45LjaC42ouZyVleCsjudv+3L5J5Q1R/gm/m4M9XkqEb+QRNomRe2dCFoZNiBv+9h5Yjly1V6ei5v0bC0L5IC98KQlFRqbw6tMxwnPh9LXJjTW7AxMCHxeNfDdUA/PFzaukcvwvDChI6T1YJCg+pYLnC+Cr5dMKmRCG4la/NQqhTk+MIHBuXSPkxoNLaDX1Rq5YjRsws3ZK43wdNd9K4GDnbZFJyVX9Qm+Eab1znjQiTfBBK5lX/cpNIsUKFLkh3F7AukHANZyHprYUv1J5LVCzPWQYAWgrQIeBIgBo5di/gIkIL/a7ZSaF7PpvvGFtzDOgkuo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrau4TsL3BtUqV0SvqQfR7UeE/IgT09i11ekttBRUUI=;
 b=cWcZVlc/qlfrN3dIYTCiJxXfrSwHEuvPrVWe6QjY5iy4ehBxwpVLn0IGMrHHa60LaVZO9BVSHWD3+fvNEX2DPdXKxuJI0ImrdBhCYc7r+8FS9xzp1uQGAG6HOqfGZjSJaLaCi+I8PCGobiodobnlZe8eM2/k+zRM68jO1lp5NfoKE+LNCeVhJeVfa4p9DPlXTLUuFCZdpZfwNMBeYVnI+ORuthEfVeaz+IwfKARNHzzwPWbF3EyfuGPAsNtnBdGFjtcIYpuw36ZXB7HEqLp+jMV3cgDD7vWvzeHpZDcTLkd6ZfNBU9TP3p6NIyBNxkRnbiTUM0lToi13KrCg9V3SUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 16:26:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:26:29 +0000
Date: Wed, 4 Oct 2023 12:26:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZR2SMB3j1wZ6Oxqc@intel.com>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004160931.3490464-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f90f9e-300f-4413-e591-08dbc4f6a9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XU80pwVQwj20qqCu3FgFgBviO9AQo9aCASLpvIEomlKtZB5wivgj3uqQ5hN0wt1+Mp4UzPjxcmZqzI1WZSq3ar08D+ahRqqQiGxTL+sF3KOZ2SLFo0DQyjgCpV4HIwvPNcL2qt2OLz24FWRQDBIeMy0q0mr1sB8p0fpLQMeq77p0+XJ1dDstm24s15dfLH3R9M4Vie403AMj7fG5ubEBAe5Vd8m+suQs9Erpn6Oj/Nh+UVixrnYLf6j4xOBssZ0BVBZYS2VTQDQKUzYyH9rQQaaOq20teQXJed6jnikmpGtF2CBfQqUwXuiKQj5r4fkM+66rgr+FAiWiUvyllH6KTWRi7ah3ZNILzYDG/AgR4hXws5W+IjkXWSahQjTb8TvwuAtMHk8UvECGrJN4fXlJNdnUuT+BV8x0M+oen0dHKbdmxgWeZ7UApnQU13PdWuwH/nJL7nkXRxDe+Lz0XcIB4fRHwMN5cRWIKL3Jkw0ShSmV6LQWY/UOCvxTV9DBsF/htWa2qlC5Dzf1JbmIkkwfFtAFShI5cV4SNTW5yLt+0KY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(38100700002)(66556008)(6636002)(37006003)(316002)(66476007)(66946007)(6666004)(36756003)(26005)(83380400001)(6506007)(2616005)(6512007)(82960400001)(966005)(478600001)(6486002)(2906002)(86362001)(6862004)(8676002)(8936002)(41300700001)(4326008)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W7DlIgOQoJCJHiMApFVtYSfdEJcna/+Pm6W1O7LowXp8lkl2O6S6SWbSWJ13?=
 =?us-ascii?Q?Xs+4BQG1ETKfcaCod+vWGd0oS5+48tAkn/PDYX6q5cqo2BlGCgn1+lB9G2L6?=
 =?us-ascii?Q?/46fY6YHu7L16Y60WorKJgYhKcuE4QzL9u00obQUbngEBCQ2548gAtt7dZLk?=
 =?us-ascii?Q?fK/BSST1aHF9kDNLnor95iZUGIplXirdmKm36Xj92ZmMPGE0ApL/tXp/cxk/?=
 =?us-ascii?Q?JT4/UqyZSXIeobC9UqRVa5kh84n6H9dp5OQNwTy6P9M5QoCwSENsVisCxsIp?=
 =?us-ascii?Q?Ffnshi0GAb6x/vNSB0p9ethTkXh/OZAMyGO7lq3EKeM3LaBVKKhXsLkQx+3Z?=
 =?us-ascii?Q?/5zyu6ivTy30FQAG+57fGwHqCkuodSoeFbHmP9DxaUvgebre3PTk+9auqyUD?=
 =?us-ascii?Q?HhL3hb54gR3BPZKT+TkTsOsetDmyUZFpsMVnewddg9TVSmOo+f87hVhIAhh6?=
 =?us-ascii?Q?BA55g4dMKWwSilk3PNMEePpXlPhxY8l3lTRtSQFh0MvjFHYUhfJqTkDfcoXi?=
 =?us-ascii?Q?ue5MpzPznTwMC2WifFDwBSfgGea+mr1ZjCk6RzyS9OSepsy112c9NWfMr7AJ?=
 =?us-ascii?Q?ue8lxTSVqg1msgARHAVTqjUofWp6F/+ZM6g8SLn5oJH0bLANFh6O187YH62B?=
 =?us-ascii?Q?6d/Q1CRexYuTEzMisyix+NITj07598EkUtCWz8bvJPcBB6BbBvv8l4UBo0ML?=
 =?us-ascii?Q?vAbwawRGP3XpTbNAMQ3dXFw93S2TYTDhD+U2CSySB5lCZW8KdpxK122i9YYQ?=
 =?us-ascii?Q?pFKbv+dasICqSaUCywn1N7OMCCFAO9EFBZOHHkYW71DQWyC9XjrIqlCRK/HT?=
 =?us-ascii?Q?n0e36bGsLg7BrmX4LZJ3Lwkc0s6zJc1YOzhW9kwcoq/mv4C8y6fbusz7oXai?=
 =?us-ascii?Q?l+gtNKRGXHQLr+d7h80mwbZyGXirEJlR4fqv31aWib3unoarRxHy9nHm2bXW?=
 =?us-ascii?Q?PhHGH6o6Son0oYN/DGY/Q3ATS7X7t5gzSNmhvWZ53IWsTfhRtBICfzb0eoie?=
 =?us-ascii?Q?Cr7ozayPzYSpZCePfqgGsNiat2ZwH+7llWLGx06grQZ1JHis/zrFIvoXT/+c?=
 =?us-ascii?Q?xqaNNobsu4zKjKZp/Jl1dN1gPjM/KyeuJ6hnXHMiauXs4n1RGi/JDqxVwUEK?=
 =?us-ascii?Q?duHb+KfgIJTOQSGyoLIXO2u0TfsHPsaKTycXU5Gnc1tGWGFjm1+uwWHsA53J?=
 =?us-ascii?Q?NJ5AhIRYWyk2gKf9Lwk3OLxqKbNqhLbZbcXmw/dj3kXyj9No+p0iKaAbtyhw?=
 =?us-ascii?Q?IODgiRQQ1c+otf/aftvoat0bcyNUSPbyg74KK3wdSmvxS2t9veRku4lep9DV?=
 =?us-ascii?Q?UZ1QdGMZiwJEo1To/t0AcndepDGp2hDMbhFCbdKuH2699q8IDsWijvFUeawV?=
 =?us-ascii?Q?rOWp90A6RHVo0h7ReS5N69rr52uFKU4PVH4wcRKNMPFqYNdqSEWCrwRie/Z4?=
 =?us-ascii?Q?r4VW8yfUP1Gc5lnFjSQcfb4/cTdgzCZ6Hb7oZOh/1N1ZJcMHgmK4cm2GSqzO?=
 =?us-ascii?Q?RGBuefzRT8qGuuRrb34XC32pe2m2BEl3Xa3VhqPSdvJGk2YYiLjpSSqPdmfs?=
 =?us-ascii?Q?eiw4rAC65DURwE/xYwUBhznP/0Eqbmx/eP3w/zgq0UTgQaYx1t4zxNSb4rbt?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f90f9e-300f-4413-e591-08dbc4f6a9b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:26:29.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0aAb9R0TANwsnqaGaA/qwdpoLb6I90vxmb/Je3dCqVtdhd225hwsv4DkVJOLtTLpmR7dYxqlDJzqFLA2nzRnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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

On Wed, Oct 04, 2023 at 09:09:32AM -0700, Lucas De Marchi wrote:
> Add missing static to fixup build with W=1

https://lore.kernel.org/all/20231003222145.4090918-3-david.kershner@intel.com/

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Also I see in the changelog a change adding xe_ prefix to the static
> funtions... that is not the convention most of the driver follow and I
> don't think it should had been done. Anyway, just fixing the more
> immediate issue here.
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1deb5007e1e2..734fcca9f71f 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_
>  	}
>  }
>  
> -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)
> +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
> +				       enum xe_hwmon_reg hwmon_reg, u64 *value)
>  {
>  	struct xe_reg reg;
>  
> -- 
> 2.40.1
> 
