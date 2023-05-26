Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8924EC7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4600810E789;
	Fri, 26 May 2023 00:10:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96C10E789
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685059847; x=1716595847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=raN13W9wTJumS9AcWA58elEtIjpsG6gJhZImqz9KWnk=;
 b=WVE9Bybn0b2BR7xiUqiWqhH1mLPE9JTs0GThySDeyIgBveymdvo2R93V
 oQrjZCAfmtCiu2yS8x4gbFL05UhNY1j+85Y+2VOY4VNH4phQWALWCsJAs
 ZoaucT/Sc8VDIoxoOsDKSxVOGYMYI5TR83lIk7FbIGbs5K8wHrVbGhTHh
 WxCdYiJFGt02UKx8487p037ecR4LiqLY0r/C/UPR3c5d6CQPg2LRTwWfv
 rEJFyUhJlWbQPcW2UM95IzkEt+MdWTg8i6REo7NR+axpVAbib5sI3cEg+
 HKScWRlWxm/NnyasqZYHloPvYrzTMdI36co1h/rOT6SWTa8wgEZKgcC3w A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351576255"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="351576255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794881299"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="794881299"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 17:10:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 17:10:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 17:10:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 17:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqykTiy8iNrnmzsOp31IQU4lTAjl55v5XCf+KnjytEtiA4LAFN/BVflzFgtrN9+vU6AxbPix57X0SBJK9H9wIDA3tSTMt2y6sbtAYNxG5d9mip2wTu/oRMQNn5c3MTlDIrpplhXBFfYozkcKk+Uo9F0EG20SZKEG3K4Kbvx8FXEpJVYvTQKiRchngCPcMhDMLE/AszC4V2NsjclgxuoJtr5NM8Zzmb7x1cVh4mNJ/cI5TnNIo+VNdkK8eHu50sB+wtgPjaXyacDyC5FYX8F5trFhoLn7kNY/seoL4aI9GKS7afLslAHrvGqkY1g83UkmzJqvFMOjhLbQypk9XA0Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpNswySt2Cu6b6vsBws+S6Zi6LOz2M6+So9ArWmtAqM=;
 b=DB3yzTalJYBejgXwOsXDtd8zmn8VZXeGHF9Ld8RL29N6MLEUa1/hVOH7F+Nn0IFKz7Q8tQcYThUvy9ZwjBY6hGLXgCWTn0PZUkpBl9lXZAZ+w4zzmMwHLNU3c1TDdk5ulmEQVZ3SqYBmrmIR+D0vAdBjJzzpndM4OuokAyPdpRdu5T/f8UMJ0YfzxOahzrMoOz6P+KZdBKFN6ysnFZ0uDPTnIklJTAXXZnOv60bKp9MNNQJT5Gx3p3M+e0ttmalrbnNt0CuPgAf5yNQEo1m1IiAMFm0JsmCA14IwcPiJI7WG59z8IbJf4uY9GpuAF3KyL3kXlnOzqFH/Jb0r5iu22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Fri, 26 May 2023 00:10:42 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 00:10:42 +0000
Date: Thu, 25 May 2023 17:10:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230526001038.GJ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525232406.688875-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525232406.688875-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:a03:80::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: daa49358-0e7b-499e-6671-08db5d7da483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XOdDAVSc9j+Om3rSAIcNyvX2xtmvfXmY6BcE33p7PgMkBKbwaE9FoSGxJ7ugAZt8J+L2lEydsC42A9dNcoG79Ss8Rf/bIa/UhkSM9DZwHfiXYTErIWGcjx22Swi9xSioZBgfGR0vjk9x3jG39sN74862TGIhy4nldCVINmBwG0JJlDCfrVd1Iij4Ce/rk4nR0EuguoWHD7HZU4iUGAYoQ0qnf860EiuZxpuLjNRGmMCkE+G8UOK0rUQgEk7jVnCdW8JhA+DqEJVfJ/4kEXZ/ShFuRrXdsdP5+xyUBG4e5JcApUI2YZpKJTEl6X5btqyRSuCUjqnkYdeWQrLJb4I0iyn5KKxPZ5ywUpEZW0Un9AhgSAj2NcjxU0TCy0LK+ocm6PUorMbHwZSwknY/dsVFv61MqeOlumFjjiXZvf9027RnweAiKrgxNGX9IJ5pzG/00rUNK3wE0/2Zb6Q0bCZcKZPWKlMLr3EDePLEpynrSEK6PDxXImaS7E90adwSQeOz3RpptS2KaHawOmKg6V/2HwFslvTlXmEHR+JgCswaiAhtjKIythT3jsYoLEsiLJ0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199021)(8936002)(8676002)(38100700002)(5660300002)(82960400001)(6862004)(86362001)(6512007)(2906002)(26005)(186003)(6506007)(1076003)(83380400001)(6636002)(4326008)(316002)(66476007)(6666004)(66556008)(66946007)(478600001)(33656002)(41300700001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0D4PEC8SaDCxz7AQktb09AeonMd2lLE8aJm8ZoaQ/bGblC1s0/FYJhXnE3G?=
 =?us-ascii?Q?0CpejVV4aInkFHhBfaPvqjwSGDC3vxHg0cnS5OxOkId2NmvyyXYp/MvZS2Fu?=
 =?us-ascii?Q?p/iCzfZA9L002OTy1ZWSxoZACL7LgJ5VB4cPyeJxYtdaDFBnKXPksv5TfKVQ?=
 =?us-ascii?Q?AtPMKAaApcEVh+Z3FKd0h1Ag2x23dB50TLlS8U936EsELe/3yy94BqABsQJC?=
 =?us-ascii?Q?nWqZX6agGrpuSIeJMjpS519g+XZmJsC5pHucNOKwaUn54x5kqXqh1DnQGg75?=
 =?us-ascii?Q?dnC8gnQRbGz89dyc2NAMG0AQtqpf/npanwOEeEntLR3bWyX2O8f7Tqb+A2kB?=
 =?us-ascii?Q?BIjxengDmPNhpTpIQ3l6LIuKwAJ9TgyI06JNKUnWGNplRGXtyGWvYX5/Ag+/?=
 =?us-ascii?Q?xzrp3NHM6ButL5a7bhI1NggmwSOaa34Uiks7ml1hnsvU/WrCgpCkpRvpLIYJ?=
 =?us-ascii?Q?09LkToVp7s46tCBPzxFbvXtyDh68izg5X41U0gai4mpiW91Nv0RshH1VK7yc?=
 =?us-ascii?Q?6RSVXmRQQwX3yULd1kOmCjcgndCX2I5gHqM2IqVH1uLKXRo35r4BLqh6g2Z3?=
 =?us-ascii?Q?RATf9kyRPpT6+x+JyTB4XHNiHrvcPNZQ/rviX9NQ6dY/eoFmiVq2Rar7Zdtk?=
 =?us-ascii?Q?pLYQNczzMmOErAtP/dYxiIRVIY5s8erH11DLHyd8uxW+GfV2aElwe54GcpZ+?=
 =?us-ascii?Q?41pboC8O+EDVxoiFVWeSpMBaMx6+NUYO3++D6PlDEQwZ8Olh7OH9r/7bkOaU?=
 =?us-ascii?Q?tx2Xq2vZSZ7/rMnEX5gCDZ/hbhfiaYEyBoMA6HWvdu3KErLwJ1jNMxlOkXYP?=
 =?us-ascii?Q?LvZjBlislt1NPYwub6zkjrHLdly/T4glOlZe2ROzMb2dMeqhLMUi7gDY9qwS?=
 =?us-ascii?Q?onz2cdysgQTlkcTdvtD08NPznCOZEuEyKaOP7YwWYTjYSw1b2Ea8vFJi9UMM?=
 =?us-ascii?Q?LaUsNS2WhLqslHn7JxiLWP/BUvRmRzcvWe3noptE9Voqe7Ux9VaDg+FJiraH?=
 =?us-ascii?Q?XsNLRExoogfu3hrdhPzeCfPkS5G2AXvC0lYZqbK6qtlQIrp1sO6UqyBzIqfL?=
 =?us-ascii?Q?Hb7GhEQrLENs6Y3zZ/X7T/MEQMrHsGLwboxYvZRU2GpEojM01aW6mvva/Egd?=
 =?us-ascii?Q?7kCoMtAXcsoz5ViHn/Cbxur/zklU1x2ZpsHo5sf/68SSdKpEilrEjjCTC3pw?=
 =?us-ascii?Q?egKJivb/fYZALP6w23RQVl2C7QySo5tsSUOslFHbr3fJO/4AnAEalIRwD1nD?=
 =?us-ascii?Q?5NzlZj9rBpUsoH0vFwbfv8TMEJUouxK94or/boocXxpKtrRXhmc4aSZpHV20?=
 =?us-ascii?Q?QHFFwN0Fq6af+kig9rkUXYfXUhuJ/PeI0uTRRFPnnwmuq7hYjLoHF8VJ1Hs2?=
 =?us-ascii?Q?f3BqknpN6CkZSfu6cpolAmC6dXkORe9rdD2HvrWDlNgX2qlBAdnCqagVzMvo?=
 =?us-ascii?Q?tX7/S2gP52kcbRaaRW8QIcrasiWcSEjEWPiMQDvVouttjgmYr3rKv60S45bL?=
 =?us-ascii?Q?8XIlimyDi4RzDWb4jTHlZi3Wsj8Kn+gS30bPdEU6hPaJ89ec9TNk0JImWaoe?=
 =?us-ascii?Q?9OHG30A5XllEgVS451RfmU4rDY7xfBVzQIDEv06Rm/aiceyCUUoDxSMe2U9Z?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daa49358-0e7b-499e-6671-08db5d7da483
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 00:10:42.2365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev2vUj5YBeQqoCKBNsqQ7lUDzCAp//Jnmweq5guUNeSCl0RgLROGu7zIfQ6QOV61Kq2h6yf0WRdg8PfjISRmKJzLywJDI6GBfXnyF2aw7Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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

On Thu, May 25, 2023 at 08:24:06PM -0300, Gustavo Sousa wrote:
> If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
> slots, then it makes sense to refuse going above it.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 0312823101ad..b82f704179a0 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  
>  	p = drm_debug_printer(KBUILD_MODNAME);
>  	xa_for_each(&sr->xa, reg, entry) {
> +		if (slot == RING_MAX_NONPRIV_SLOTS) {
> +			drm_err(&xe->drm,

We probably want xe_gt_err() here so that we'll know which GT we hit
this error on.  Also, it wouldn't hurt to pass hwe as a parameter to
this function (instead of mmio_base) and include hwe->name in the error
message here so that we also know which engine ran out of slots.


Matt

> +				"Maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				RING_MAX_NONPRIV_SLOTS);
> +			break;
> +		}
> +
>  		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot),
>  				reg | entry->set_bits);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
