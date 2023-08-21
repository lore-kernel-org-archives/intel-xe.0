Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E65EE49A5
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 18:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D481710E262;
	Mon, 21 Aug 2023 18:19:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD5A10E262
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692641963; x=1724177963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3FuTOpPpayIg0COC+j2+vEOr8DyPa6w2D4QIV6lk4iQ=;
 b=iBI0ciSwMV7PiFZYtmVSLn3q3cJVQtgoTHQmzcqnknU1qKON4/CxBvng
 QE52BIX4DtwX8d+2yMItmxVrewDXcCj49vQVdNGBmLSmkJ0iwiWU5CHEb
 nx/Kh0ngJHyxL9ncWAClOWuDuGe9X1azBsPm6gp31OYyK3aQFm506ctlY
 rlCpwTSCjzhjzKgXfjoaYbJTBofLqhDCfuc8ZHIA0ZsXWpAXzmgnPkyD3
 moJXDr2wxNPCSq7kkFFUdbvKhMJ+A02nSw0TJ4H2J82BJe06HZdM9YLFZ
 WJjo+kN8+OaZSb2ClM5h+SdhwQhJQZvwyqh1feRA2Mpt5e9lPKaG26jWf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377411962"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="377411962"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 11:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982576198"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="982576198"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2023 11:19:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 11:19:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 11:19:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 11:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjCayaGdaqSM/mc1sWTDc4pAxs6fLPldfIX1Sk5mnWKZGFcJqn9N5GWCUtunQZm4NIICVYc5MjT9rmVjTmU6UprI9jdhyCQsUJpF/eTHczjf8XcvHCTl4mVJt3Dmc0BmikJlU2PHjfxZhorAfSxEd7xbHdueIYjsVLPqGqKmadFN/bPAUaFyrAohGcv74idYoHKpEm2duw3Z4p8N3cqXbRNMD+WIAy4vHbRwqXr/OE04gIh4cu0OxAg9DXux3efDLGV3rkskRPfV/ZLv40X1UtB9UP/VxmQ2kMsTtEa+ofW3kH62tFbgmWD7Pd6TC6t1Vv8/PlZWSL4yHUaLxpOwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvzgLB1Ep0lHGlzXW3UK6/CtM+deASkbJ2qeatJxWgU=;
 b=oKIAkFiR+WBAH2kzvy+8oC91Jc1Kp+CUATeYyq+VJ7KJNTxVKE/3zY/f9G0jHkCISppLlQ/nu0Qe216VTuGf2zGXQD/xVsOBJUZUwnOXqRgb6FEvWtGgfVNRQfM//Zf7aIqFT0u+/6h0cFsx8FhiKPs4sW+HoQqfsmKYeuwxYDlPbZhhu8Qkz/ItPMXvoV15MZvWnXZEH7dqF3y1/4d/PivTgjaUcKx97mvUhVFubzRj8HUH+uU+5fro6FW1MSy470OiLmfXd5HuUlRmBKmIM2J21ek/KiSjL3NGUw4m71bqeR3hQYnnYlL/Lv5j1JTKIdacW9uE3RsUZmszVPhqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7393.namprd11.prod.outlook.com (2603:10b6:930:84::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:19:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 18:19:18 +0000
Date: Mon, 21 Aug 2023 18:18:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZOOqXw17PwaP2tgz@DUT025-TGLU.fm.intel.com>
References: <20230821135347.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230821135347.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 774cee90-ed7b-4870-734c-08dba2732259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77tH9ZgJHV04QZMk77LJOC/HVeY6tLmTZrD7aWcyWryHf0Wxxx59KqwHjAlxQoyeoeeWS50rVc7ZP2jZO0uNQTJlRbQZq4zlvjFVxRiBieYhCuba6BMTGJ92zCb85vUlBgy6UnHa9pq5IgGHbjs3n8T+LeFZOKP6fdq/Ti12wv2IbcsWlb5KEo3VhFW8D5wJ3uK8iB2jSwhGPj9qDvkgxqzXNIJIH4PiaBw+f+NduZ4j0t57KfioXmh86chuzCvC0ocsD8I/O6EDjkRgRGVG5lrsITqN7huGAv7IxhNEYioT75VD5Nillq2zKmRiJ2dj6nnF4jL+ulJ0TtoABF2SgLwqQogHQwqeL3Bjb7nHV9cwD3uLeq/Yd7hihY5p0ZJz8kR9qLX0o2xnfUlM01zWixtiTGlznRjmr6EmU+fvDHeNnIHEgxyANRZDQsC2p7kLxv8TvHkGzgbiaw8amaIfYEP1NUatQ02oFSHoty9s1e0n7vd5THhEEth/LZ3rZY8h2Ke4H2LoMiEBQ7mi1NeTqHN9rfZ+JjHDnE/jgO4fQGTwouG3HlfwYhvpzUE96aJo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(366004)(376002)(1800799009)(186009)(451199024)(6636002)(66476007)(6512007)(66946007)(316002)(66556008)(82960400001)(8676002)(8936002)(6862004)(4326008)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(2906002)(83380400001)(86362001)(44832011)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgTrD2LiSkYkWKvoyn82AfzLumMNOrim5ZK3YGNz5HWmC8JquYc//EyY0Tn2?=
 =?us-ascii?Q?kaNuhrKLRdoP4QX7GGXkXZi93H5sx0j19Eg4KXnQ6WnPeyNUaKU5eX7pC6h1?=
 =?us-ascii?Q?C+7XDqXL+/6q3NvCCMz66NdfbLL1nDIIEg9xy9lWzq/Y0vleN2VhktUaZXv6?=
 =?us-ascii?Q?323T8emXjUAIcrxMNJzGrP78JPhRGnSZfz+oHiKlMIFCFwB7oAFBfmZhVivT?=
 =?us-ascii?Q?/KgsZmNmD1eAWF9qpGo2ZGWqZd4hpX6Q/UFaJZNEj7NLQiTvqyH7M3qUnfSE?=
 =?us-ascii?Q?a95rQQfU4qedhe58bjgkw5EaHeVSp+5s12pv0NpSH79jWnEnB+SuMXRvV+vJ?=
 =?us-ascii?Q?lcsy2e6B2MCyLd2Qq3VTobcTwOO12AnTFTyCDXJSbtUXYQlU8OxBYD8eNMZG?=
 =?us-ascii?Q?hL79PL6SQSnwsJPfKkh9cH3EDSGYG7wOyN4YnLcoTr+J+TTTd6gX5PKclfd4?=
 =?us-ascii?Q?zfApe74lYDl7HbzyKHj9gttM48qin1lIWYp4iTfPFYyqXyp0kqFT6cy3a1yl?=
 =?us-ascii?Q?NdVBcMNe3LZA6AGXtjWkoc3BkKXqPIiqnXlSRL0CnQ6EFvP5whvcMD66YOo+?=
 =?us-ascii?Q?Z6u1bQ8xlzwckX3AAb2YapjBp1Rxb5D3htbpDHuF8uddfhnGdiZfgGiEj/Mw?=
 =?us-ascii?Q?Wzq8qK/8lemHVDJ7qbKicExNGjC2rAB47/undLQFQuYggkFznYhZuVSU44Ql?=
 =?us-ascii?Q?b/6TCspHqWKynnnniupANmb0vS+0XPtfoGAFYgCeoGdog5RmCr8JpSIjFIEO?=
 =?us-ascii?Q?80Sxr4lKKjj+3TqprDjIRcYdbRcwEAK9Tk9jS7MYayyDgUIeaxTaH7wWPIRA?=
 =?us-ascii?Q?L1qrFWT/eWoraT8fTg7toWA855yRqFK3Nc54+B9BsJPGpOb4SftCg7yQZj3a?=
 =?us-ascii?Q?RC0pTujNWlQNBJQucPvkOvLQ1rTc+mSMSseA2kX3cBn+qwSnsRthE1lI9dyR?=
 =?us-ascii?Q?oLd4HtRX9iFByt9EKpZ0hqO86jFMe6WZF9wB4s/7sapysBc4I8gEXY7zuyzR?=
 =?us-ascii?Q?ttSl786FJcMBn2jgpjBTA3CivJTZ+QU0pgkJdwabOZaNAYgMcgkuWWEUb4iL?=
 =?us-ascii?Q?SZv6FlJbnzatV6am5EDrTOVvicm67+LeQwY3S3iMZt+9EZ9HjqMAltU0YFad?=
 =?us-ascii?Q?a3Wi4iAPm0dM41UH3iOkFDIuBAXoQvgc2mAEit6hoKSn+SfCMtNYz0OHwqKT?=
 =?us-ascii?Q?eOOGarpOIK048tXbTwhSTIgO47TKB5J1t1gdvtPnRb72NYTei9LUO0gpnU1b?=
 =?us-ascii?Q?4n6y8GOZ7z/R5BXvmExTf0paQh9bTVxRR4W4odYJmENasShFZkc+bUrvLcTe?=
 =?us-ascii?Q?TVkjrTY/97FWhp2d5mkVEwxr8EZtsgF7Q2IyyfmA82UjjB8bCFckPvNa/TxW?=
 =?us-ascii?Q?z+KD0k7VaTEjGX0EL+liiDwSRoVRprgqB1iczDDUAf+KQT8UIXbdIlBjfm1V?=
 =?us-ascii?Q?2M5lJ3xwY2wpCE/Ek4cvDHm8jAH3qMypRWs0dapmQHsuh/k0z4UlRAhqU70n?=
 =?us-ascii?Q?f8RZvDBN6CkCWuQk1rvJV/SLyspKynLCMKCBhQCQhBEiAgIvjwYWjs7DZXnB?=
 =?us-ascii?Q?nP2vm45tql64hb4YJv0e+17XctaSAfakKxPXsf447NoVouR6ZTENZh+71X3q?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 774cee90-ed7b-4870-734c-08dba2732259
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:19:18.5932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTPNaSMYeaJK37xyZ9gKlQbiGwqCwuj4ZVfLjhzZ4tmpv0p/BzJ1R/qzceJFiCJIUJmrfn6lfyX85EFJZJn6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7393
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Add min/max cap for engine
 scheduler properties
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

On Mon, Aug 21, 2023 at 01:53:47PM +0000, Francois Dugast wrote:
> Fix typos in options descriptions.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index 4bc080547d5f..ba17a25e8db3 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -5,7 +5,7 @@ config DRM_XE_JOB_TIMEOUT_MAX
>  	  Configures the default max job timeout after which job will
>  	  be forcefully taken away from scheduler.
>  config DRM_XE_JOB_TIMEOUT_MIN
> -	int "Default max job timeout (ms)"
> +	int "Default min job timeout (ms)"
>  	default 1 # milliseconds
>  	help
>  	  Configures the default min job timeout after which job will
> @@ -31,14 +31,14 @@ config DRM_XE_PREEMPT_TIMEOUT
>  	  an arbitration point and yield to HW before the timer expires, the
>  	  HW will be reset to allow the more important context to execute.
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
> -	int "Default max  preempt timeout (us)"
> +	int "Default max preempt timeout (us)"
>  	default 10000000 # microseconds
>  	help
>  	  Configures the default max preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will
>  	  run.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
> -	int "Default min  preempt timeout (us)"
> +	int "Default min preempt timeout (us)"
>  	default 1 # microseconds
>  	help
>  	  Configures the default min preempt timeout after which context
> -- 
> 2.34.1
> 
