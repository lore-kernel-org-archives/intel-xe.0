Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C4C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 20:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650010E785;
	Thu, 13 Jul 2023 20:34:05 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FE10E080
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689280444; x=1720816444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CMQGWlzkVIPvNGeIdP95F2YbPXfs7FLHgJgMt/MsQKI=;
 b=JEOnKGBCjjzvQSvYQAUSIqkObkESdC30hiHF0a1rZw6G1TG+y6QU5+vs
 PclyAhGErLdxpZvgzYFupH2T2hWHJ5zLNPF5Q9U8gJqrduxu5uIEdb5yQ
 yR1aS6sA+jOaxnWotj56iIGbEvggXYo3HxL+BZhqhqrY5pRX33v7Zh6VJ
 rarwpW+yLpf2s2o0iJZkdEcLGAQr1b+WREWdtWSFpaoO36J8kd/P5YyL0
 0ZetBXth/MlNkXWBvW6eUPvKyadItuxNmHp6I8I1/K1WjLonKd0V/Rh0c
 zwj5aFOhLXrY+YnSPoUbZI5pxm1D2brXX8zi1WB1fgFWPF5DOi6w+K8Hs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345627298"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="345627298"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 13:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968760499"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="968760499"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 13:34:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 13:33:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 13:33:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 13:33:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw3M7/qaPUmn8AeKrUwwxf3VkcAaSwYr+e+b2R5nJ/WnWD/Gei2+c2uAUcCp8I2j7h0iUXcZWXBg36bJiFIbKXqHg7vM6QV6rThOh7fzg6GGlvTBZXYorptBGwa5+DyjsQpj/4Dz40WFt5HVxFQYBRGP128OgGIEETE7HZiViWFV1mVHJV5lwWNMhL1SYuVLaJeEhmBm4SK+lNhM+YqHja3sALZotZ0XWoDmFbl8cVDaD7v6mWC2ueywW+XOR2Awn4dGWnNe/hDvHvzBro3V/QYjNHVzeE4hz29AMgca8Qh8m+j2SqogM2auTKLJmmkRf9cYaGa6FaFbQ/CM7kAAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wk21Uaf/qbWISBhu0+mvIe8BILOj8MrOTV+IOTvRqpY=;
 b=DSjOoM1VS2H0ZcZ/1uE9n/RAbCrKBcyjLzD08+CFc+KwNKKaZnb+PZ6bGPyyT3Aa6ofgdz4otIbC5Gvq9COeGlxaoFIU5HpdF1LO/8HeeV2aNWGMRyD5DHzQrvVdnJ5nrABJL583+Za/ZZ0/5fGcLPxfNIAEll7i/7xIaHJ4Vp8GlPXnVJuOLoPeqxiIslPCUwi/RaGK9eKcaAzChKKp1jNlVngyftB7m/PrHQSTAK0J3+ZzD2yEgVu30SMAsOplEnKA2cEVCkJhvlKQKfjhXKlTv9MhRnpyw9xny3MxYeFlpLJRuK/6ee7/0RaA2Zk6gx0PnCXhte7LteGM1WCiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 20:33:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Thu, 13 Jul 2023
 20:33:57 +0000
Date: Thu, 13 Jul 2023 16:33:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLBfsNWDeWYx+c/X@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: c47d62f6-96f3-4af9-f437-08db83e07bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b+Mhn+9OFz0fGVLuw+fTFxCUb4MFEsfrJ2mV3osbvKogNOYsOB/RSqY9Amf91uSuHkqqbLoph0+8Ip9ddjsn6HAJtUjO0FafRpgxwDAH+E6OeH3sl7ClfgA73MB5rkFrhZdtw+JV19McWYgcKLRA9bSM38rLXS883SA8rHLLQYMPzLY/+1lHW9linyjwWMb+L2jgssu2nbMgZtswHxywtL7f8iJ2SIGMyEldOVA0lu8mAXXWwKbKO6l9w7o0xD8biVNXCsYVse/bjZdyHbAKC04crTEEVjzaE3Qk7x2YsxmslH9c3fcWChVB0gMpPVX4V7QdIHaaS6m3wSNmYfMbBQv8EvxGqX34i5IMLpuDoOQB5U1y6B9L2OcBcWL3P8dDZV8VGduguvWe614lDFyrl/BsVLm9NH+aEFZ70k9FzXp+FLp+ESqcY09DMsHXuzTxEjPRVJ2fE+cb6ONXTUZoNS8oYvjzB2sFsSvAFPK14jwMYiMBlxPK9uZwIVJEzFAk78bVUR50IoYb4palTkpQ4fgLLDsLjLYIPqWEUxULJGriVRFxo3wLE0Fwh0ls+2Pw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(82960400001)(478600001)(6666004)(41300700001)(37006003)(8676002)(6486002)(6862004)(6512007)(44832011)(5660300002)(2906002)(4326008)(316002)(6636002)(66946007)(66556008)(66476007)(8936002)(2616005)(26005)(186003)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uIOrG/VSojy2i1YnWJsy3H+zhxOrbIqVsIc3KIYfj6yw2gosj+lvKlMHLW3T?=
 =?us-ascii?Q?k40S1K19QoKGdSGRSYwdW2nldvQY11Zgqqj9U0xftMq1vp4PeUoSDdLibjtT?=
 =?us-ascii?Q?Hrs14J/xcdXUwssRuJZU/wWj0/wL0HzoM0sgS1v9nfx6jfWl/yp/QSTmqwlh?=
 =?us-ascii?Q?jv84VMqB1FPAhq1sOO8bXpSDWZfH51tfVk4uHakNr/PRxprniCmFMz3B8/g7?=
 =?us-ascii?Q?FAmOB+Ev07XyZfKBf+jNO/zHZscUYIoL8Is+Vqnnd65LSIWKtKsBT7ANSFU5?=
 =?us-ascii?Q?N6ZLSx5RO9CWrkrkU7WJl2tfWx6y1wgG5X9j656LfapqYj3B1X+9Wqcnmogr?=
 =?us-ascii?Q?6EV/P/gtAU3GWf62DI1i1raV7qPEmMFtls1KnpFvLrU8iSknC55HOcYKyONP?=
 =?us-ascii?Q?NITfppJGAy8BojErmiSqi0xRv4C6bTGFQlJ8y33bwfWsDbcKVXsQkBv4Iuh6?=
 =?us-ascii?Q?N6OYfre+Q6tOIefH8p/3EjQ+p6zp6i1xxu5E7IMP8K1+Yj6OyzExUOK1e0Jc?=
 =?us-ascii?Q?LdKkYDSeArEANq5UWN8Ld8sMJINvPIua6dP6uqVSm+ErLRRBYvbxT9pyyX6I?=
 =?us-ascii?Q?6sO9BfOZ72KtT2SZyYdaswW6Ar8DYhRJ7zeavMQwl49sgvXACptsqRRBeuda?=
 =?us-ascii?Q?5gISWuE1uum3euwUxcN/UL+KbsvWL2aTbE2kIqJsBjHgNtcPqtCO6A8JSgsy?=
 =?us-ascii?Q?y6zsj2mc2hKFdzqf+mn1F7UXZ12UBv48CwTVWqdwKrDnqNNS7VmAxLI+mS6Y?=
 =?us-ascii?Q?n4FMCFPiPYGDOMwLPv1hLJiHSRG4DgklR1DI5xbbFyhwty2XOfuqBNdvy/Qt?=
 =?us-ascii?Q?4geQcJ3YcMZMjKxWju/VFKSph5SsBM7+TWb2S2arMM76CsGph3EAFJhw/4/2?=
 =?us-ascii?Q?tLRZNLMvmPTi7Sq7dwDUQh/r2xddlYvTl5VgYURrq9tg1UU0ywJlPU776mvW?=
 =?us-ascii?Q?9GeZmgNNQxwZF2jI/Wt2DUuwxSdLU16Gd5armifKy//WzDKyzEpVW1ltDOah?=
 =?us-ascii?Q?Elb9yNKDh4sng7kLBi7ElJ4BUSZyHZZ6+0M3h1uVjo41DYiG8dIBUYqbnDBE?=
 =?us-ascii?Q?/U8T3cnOvV+6QOUxEOrrFCYdu2hLkzmlFqpVFxLXRHd0/EBswY4KBCmkPAJ3?=
 =?us-ascii?Q?IkHNHbUd5CZaGlXIT7BymiSqA++a1ayNw7U/WPdPOst1II12Xcba5/zhp+Uq?=
 =?us-ascii?Q?B1kVIm+74KOlXmWAXKuVH8k15DvMX5iHiBG38nw5Z4lYb5kyrJgcIdctDKZU?=
 =?us-ascii?Q?VekpGhSavzl1Pl6CRJHBaNJeym9r71l1Wyu7LaDkNTgeeOngdnQBvdxhDpCF?=
 =?us-ascii?Q?kgGs8jTNtTYjA+CAi0Vs/1P0cB4kXDgcdjr82WHHsAnioNLaSNPL38GPVCEb?=
 =?us-ascii?Q?pR8iU6nXOZFjDb0YiLmj+S2LVnMmcu9jW0/vNGRUB3xp1pMF9Jb4/PsK1rL5?=
 =?us-ascii?Q?jGtLQsEDtiau3tVScb9JuVkGUp++ZZIqs8/Y2bkHTeUG+vG4BclgKeCdgSnh?=
 =?us-ascii?Q?QFi732a62NbJfF0ovLQlgAj5xJmrlPTzRPe/xzPxPSr/k7cya1paa+V08xUy?=
 =?us-ascii?Q?dWkDHKFQYuKDY/ajIKVHuM49Zb90KL2qBT2PYhUNBz02C78BverMK2Mub9WV?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d62f6-96f3-4af9-f437-08db83e07bc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 20:33:57.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0LmHh96upI7bh/J0ESWjq17jY7CG6vZP0RnhYngON1+GBiO60QLCS2Ji1i+8zi/UXBxGrzIRZc+isHcyfipzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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

On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.

I wonder if we should do this with !fixup patches...

But we anyway need this,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
for the series

> 
> Francois Dugast (7):
>   drm/xe: Cleanup SPACING style issues
>   drm/xe: Cleanup OPEN_BRACE style issues
>   drm/xe: Cleanup POINTER_LOCATION style issues
>   drm/xe: Cleanup CODE_INDENT style issues
>   drm/xe: Cleanup TRAILING_WHITESPACE style issues
>   drm/xe: Cleanup COMPLEX_MACRO style issues
>   drm/xe: Fix typos
> 
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
>  drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
>  drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
>  drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
>  drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
>  drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>  drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
>  drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
>  drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
>  drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
>  drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
>  26 files changed, 69 insertions(+), 63 deletions(-)
> 
> -- 
> 2.34.1
> 
