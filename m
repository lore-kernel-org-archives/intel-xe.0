Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9683C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 19:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DB410E1D4;
	Wed, 19 Apr 2023 19:36:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE7F10E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681932987; x=1713468987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vmd7bQX7vMAx4av8QjOdKO5/AjHhdkAye98WI0T7RXM=;
 b=MhAj9SqXiy1n4XBhhx+viA4DVqU6C2ryn/UXT93SzPDwrjdOrFZB66L6
 Ug2J1dNIivGqSzbJgdCJrgi0JHM1by/hpzNSSXY5RCX64GBe76gQYdJMJ
 E6WKvvb3qVxSQvcc10Tdmu+4/pxZIQ1ss5rwvoJePcpu+L1+IUg7lhPD0
 eQg5GNtOtI8nmyUJxtE8XJG2qfliETk4rjCXLl/ezbFDH8t5M1hgZeErW
 PN1XKw8pXHSt4sPsJRMsPxk9cBWQw+tbgBbD08XR2FvAIdp7Dyza4q3/h
 0OTThZvnrWKEc611UCek8DGYuLrQdQppelb6rp7/MRDz1s5+K460MW7fR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325154838"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325154838"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865955693"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865955693"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 12:36:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:36:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:36:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9oupFF2CHGlk378RghLPS92pxPa9ZbZQ/p2/L9M7ulN371KNfNqh+sh5MajjAsCZUZr2170b3vQxB3XW4cEY3ay60V6x4xrW7cvUdLtfe1eykjRBDZi04r9vjSsMJ5IVV2d6X6wcMlHkjeFcLHAntvU/K86fdXNIrG0kOHPOGd1i5tevip8a7i2DobmuCrvBSjlH7w3W/9dqncFnLuU2rc/HqcE2+jzndVLkFQqHHm/T83BLkG4IBVhDNFNU2+es16d2EI5igxNXJC8i/NV/fQbl+n7+DnN+zD6BzOrQjlJcG/XwEqL/K+V8tK9lsC2OpMFDYQ9M/UssCQJGzXtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTlCI6zQdaum8dF3kDWDKB6ILFft+dyKG7TDn+SGAY8=;
 b=UEKRlyiv7nuEHgrNZjFZnCW9D6FflneWGilKuW3HnDoD+xjE87cmJiIkp3zHKrQsiy1LHFU+ZhII5YHDE/RfROKKLskS2LPajdetdLUZfBZ+SpBggeCMFLtkuQ11ccCCR06fomkyNbYt//5obNoeqMSW6c699+woiChgOeIs448/gcwiAp7dV79NOPdC22oIcXH+mxBZEIXvFK8BevyaA3JqZ/eg2Z2GwcRQ7oXgPq2VQ7NAeUEZCO0cD1WGpcHKuLVyLSKpdxJM/IoP1PScDZwV/FFYckXHTL3hWG5t7Vx+73ZrwEA2zSiwEGT2mflmbm67LbGZYZs3EjouqdLkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 19:36:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:36:24 +0000
Date: Wed, 19 Apr 2023 15:36:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZEBCtLdx/vL0hytP@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-8-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419123947.543175-8-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b4f9e7-6e45-4603-0f21-08db410d5c25
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hf7mwOJC50XOH6gb6w7RZj7kWTcdc0EyuD5fM1tt9o12byGxvJyxFeWinKPG0sMlslBOG9tj2hshzy9WYraYJKaknavluYkd8J0CgSLYNC95SeoC8paQfphWmDEHPc4pHFTQxkHcpur5kB/l1O3mhsjbaMslHCdMipNyEfJ3a3gPoVbiUz+vLYacJ9Mh4TlY72nEG1/e47Cmqqo8k3zXTYnPr0r6B0s6tKI3EL0tHQ36HXdJJAuQ9gPaP+y9muXL0hYHlXfTyUcl2SgyCmky5eDiTJvQChOipCxjbIhkvflH5NWP60V6pw0uO5zNkK73Ay54yGQSHH6UY2Oh6AaYXWGG1Nqm06XK39YxKk9dahRDpQiBy7oyBbtKqXlbUCIiN6TZOjf6VvypcJM3+WJKVLIKg+WvkWJr7/4/E6xUEuPZaaO1pLWi20qCTe4dnsAayM0nwl/cyO3NYW/XAOX86A5OR9FQE+/X/bLNbjomgU0dzgfqQpeV8YZqqJNfH+KQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(316002)(41300700001)(4326008)(66946007)(66476007)(66556008)(478600001)(82960400001)(44832011)(37006003)(8936002)(6862004)(8676002)(5660300002)(6636002)(38100700002)(6486002)(186003)(83380400001)(2616005)(6666004)(966005)(6512007)(26005)(6506007)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ymyGf7bgSfOOPMGzf96YLFI1PM5xBZheECkN5ONELW2oxXq4mtLmFsa6SR0?=
 =?us-ascii?Q?sBGAy86lug4mf2tXeHjJz+K6HPq18zVzrmqdW62EjgRtlMo7FALgx8/PsYH+?=
 =?us-ascii?Q?Q67WrQCnWgHmYKh434N11YLOhu8uQqb+/tLz83XcxsXZBZxJjHMB1dOkykmb?=
 =?us-ascii?Q?3bJUusHEJd9rUF5KfBgqQCpDP4zG2GEFC5frHBWus2l3wKBzwAHwf7yXhFqZ?=
 =?us-ascii?Q?bK0j7kxWaIxXNtTdw6Xx+OmiGQK0AqE3lgqrlJC+hH0m0M7BvxJndOZtJYWA?=
 =?us-ascii?Q?Y8H0zOMXd657CmAQbI5bAWTwyQnM9fnKfnFRyNFDRpCPT0aEkmKRcCIPl8Uv?=
 =?us-ascii?Q?QDHKrnSNaOGktPxcD/JSbRBgvLq5nTE/KazlqqsPmARov0fGqLxWZNlxmQml?=
 =?us-ascii?Q?D/2B3s/T+bbn6cdQbjSfg9jdhcMkrqSIdlJDSu2tfQCbnHf2gEmD69lHP7ea?=
 =?us-ascii?Q?jLv4MXfHJG57C4D53NuBfCeZjbSEGvxveVWnVS0U4/GMDcYZ4n7ZPla5XsTf?=
 =?us-ascii?Q?5ReSPAmUW5n9GqKbKmqhvhwityT9/JL4Xg0AInB+O1ioUXCND+YSCtBqPMri?=
 =?us-ascii?Q?K2tsfAz6J2QnsOib/XEsMKW4UZfeGJA+udE4PR01+Mnv1t+gY8pmfPuNNhhS?=
 =?us-ascii?Q?hqBXrK+EantY2bgTce1OqoqWRmyWdL2cIPdYAFb2LRHbk9eJc5WxFMJEVzVg?=
 =?us-ascii?Q?zmUpVUO2uQmEH4ze9nHlRgBL2RIz7Rv5PSZUGBJyZnpJRn3ULe7XuI7zpkvQ?=
 =?us-ascii?Q?yGUWGnKG5f6ND5mg0iezHl58E5i0n8MubZCARNXRfZgcAdUvGKMKG+sA7x0Y?=
 =?us-ascii?Q?tzziRokocnZAEIz+PQjR+jFagm+mtNvkVrq2j4j8I1r4iYrA2d6O5zQrXpQc?=
 =?us-ascii?Q?8Z32Bjcf1mXR6jPxEG+ruCi6FW/1Zoz9LPvzEEy8wq1f+u9B+2kDGwzh51G5?=
 =?us-ascii?Q?UEf/pxkVduINk9Y+V1oON+z+amM/jGsoELYtxNSMOhXWATd2IhErxA0kMymr?=
 =?us-ascii?Q?rribH5Skbksye0xhYW4uYi4IT+HsZ5fTN7j+dDJKlckpPoyMhsSi374ELKB+?=
 =?us-ascii?Q?4bPORf7LmPlfPM03POsIb1P5kfA6071QSkTnjy/mkTOvy//DeSVk1GYVDCbR?=
 =?us-ascii?Q?SQ9fxvCowIkQmLvCkq/1Qi1CSq0GgL4XpTygtL5OO2xT8/2iwvYwUuRTf97O?=
 =?us-ascii?Q?/si/HFtEHknpXkMz0VUUGrEUgJ08wzSes5PDOVh9cCYoVdcp5AOHAq4cMu7N?=
 =?us-ascii?Q?bsO29+DV5Yrc5jWKsDDcA0NmjAx3nwqeD5bEvc8rmuO8nnEKXKIqDmIVveOd?=
 =?us-ascii?Q?wo2fb/a9msniJ8gftSH8uygPpmB1E/f5rdpNGJIHxt/Fej5s2zGkvPh9c4dc?=
 =?us-ascii?Q?SKi9gxTSE5w7y0kXSyNnY2EBbGwjjXtHVdapPQcYjjLKYbzAM8DkodHIE12k?=
 =?us-ascii?Q?JP9yWU1PWNhn7kF6xxYlJcWy93w/8C88MTND8jPNy6gfnGmOWArP57t83kt6?=
 =?us-ascii?Q?pMneNewvnVEI/SQbzV8wzNcHw8jwppbWZhFMRqcdXGTKBSkdMLJdAXv0cU/E?=
 =?us-ascii?Q?vZj+EIIpqIU8u+IQjldjLNzppSFEbXlvFnoYGovb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b4f9e7-6e45-4603-0f21-08db410d5c25
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:36:24.2822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaHULCcvfwIwz5fyrQ8Zbqs4qvR155mM1ubq+AQbhDu8M4u8yPRCbdVQVd/0SFHNqCXA0B80yJehGh2Bvdu5Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/9] drm/i915: use explicit includes for
 i915_reg.h and i915_irq.h
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 03:39:45PM +0300, Jani Nikula wrote:
> A lot of places include i915_reg.h implicitly via i915_irq.h, which gets
> included implicitly via intel_display_trace.h. Remove the includes from
> the headers, and include i915_reg.h and i915_irq.h explicitly where
> needed.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230419094243.366821-1-jani.nikula@intel.com

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/i9xx_wm.c                  | 1 +
>  drivers/gpu/drm/i915/display/intel_display_power.c      | 1 +
>  drivers/gpu/drm/i915/display/intel_display_power_well.c | 1 +
>  drivers/gpu/drm/i915/display/intel_display_trace.h      | 1 -
>  drivers/gpu/drm/i915/display/intel_fbc.c                | 1 +
>  drivers/gpu/drm/i915/display/intel_fifo_underrun.c      | 2 ++
>  drivers/gpu/drm/i915/gt/intel_gt_irq.c                  | 1 +
>  drivers/gpu/drm/i915/gt/intel_reset.c                   | 1 +
>  drivers/gpu/drm/i915/gt/intel_rps.c                     | 1 +
>  drivers/gpu/drm/i915/gt/selftest_rps.c                  | 1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c                  | 1 +
>  drivers/gpu/drm/i915/i915_debugfs.c                     | 1 +
>  drivers/gpu/drm/i915/i915_irq.c                         | 1 +
>  drivers/gpu/drm/i915/i915_irq.h                         | 2 +-
>  drivers/gpu/drm/i915/intel_clock_gating.c               | 1 +
>  15 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
> index caef72d38798..e42f5844ae56 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_wm.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
>  #include "i9xx_wm.h"
>  #include "intel_atomic.h"
>  #include "intel_display.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index d02378d2ab4e..d5330db12846 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -7,6 +7,7 @@
>  
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_cdclk.h"
>  #include "intel_combo_phy.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> index bd86f570f462..dfd3fd250f1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -5,6 +5,7 @@
>  
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "intel_backlight_regs.h"
>  #include "intel_combo_phy.h"
>  #include "intel_combo_phy_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> index 651ea8564e1b..99bdb833591c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -14,7 +14,6 @@
>  #include <linux/tracepoint.h>
>  
>  #include "i915_drv.h"
> -#include "i915_irq.h"
>  #include "intel_crtc.h"
>  #include "intel_display_types.h"
>  #include "intel_vblank.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index b1e7b2588fd9..9dc7083fe974 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -44,6 +44,7 @@
>  #include <drm/drm_fourcc.h>
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
>  #include "i915_utils.h"
>  #include "i915_vgpu.h"
>  #include "intel_cdclk.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> index b708a62e509a..e7f77a225739 100644
> --- a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> +++ b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
> @@ -26,6 +26,8 @@
>   */
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
> +#include "i915_irq.h"
>  #include "intel_de.h"
>  #include "intel_display_trace.h"
>  #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 1b25a6039152..c0f3ff4746ad 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -7,6 +7,7 @@
>  
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "intel_breadcrumbs.h"
>  #include "intel_gt.h"
>  #include "intel_gt_irq.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 0bb9094fdacd..382a72727582 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -18,6 +18,7 @@
>  #include "i915_file_private.h"
>  #include "i915_gpu_error.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "intel_breadcrumbs.h"
>  #include "intel_engine_pm.h"
>  #include "intel_engine_regs.h"
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 6d7395aa404a..7bdc140addf6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -10,6 +10,7 @@
>  #include "display/intel_display.h"
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "intel_breadcrumbs.h"
>  #include "intel_gt.h"
>  #include "intel_gt_clock_utils.h"
> diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
> index 84e77e8dbba1..fb30f733b036 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_rps.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
> @@ -8,6 +8,7 @@
>  
>  #include "gem/i915_gem_internal.h"
>  
> +#include "i915_reg.h"
>  #include "intel_engine_heartbeat.h"
>  #include "intel_engine_pm.h"
>  #include "intel_engine_regs.h"
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index d76508fa3af7..e89f16ecf1ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -16,6 +16,7 @@
>  #include "intel_guc_submission.h"
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  
>  /**
>   * DOC: GuC
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 80c2bf98e341..41389a32e998 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -50,6 +50,7 @@
>  #include "i915_debugfs_params.h"
>  #include "i915_driver.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  #include "i915_scheduler.h"
>  #include "intel_mchbar_regs.h"
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 31271c30a8cf..aa3182918331 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -52,6 +52,7 @@
>  #include "i915_driver.h"
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> +#include "i915_reg.h"
>  
>  /**
>   * DOC: interrupt handling
> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
> index 03ee4c8b1ed3..7f9e483f6ec3 100644
> --- a/drivers/gpu/drm/i915/i915_irq.h
> +++ b/drivers/gpu/drm/i915/i915_irq.h
> @@ -9,7 +9,7 @@
>  #include <linux/ktime.h>
>  #include <linux/types.h>
>  
> -#include "i915_reg.h"
> +#include "i915_reg_defs.h"
>  
>  enum pipe;
>  struct drm_crtc;
> diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
> index 8cfc19b48760..6692f74dc37c 100644
> --- a/drivers/gpu/drm/i915/intel_clock_gating.c
> +++ b/drivers/gpu/drm/i915/intel_clock_gating.c
> @@ -36,6 +36,7 @@
>  #include "gt/intel_gt_regs.h"
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
>  #include "intel_clock_gating.h"
>  #include "intel_mchbar_regs.h"
>  #include "vlv_sideband.h"
> -- 
> 2.39.2
> 
