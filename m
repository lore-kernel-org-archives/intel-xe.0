Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80252E7B61B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7DB10E119;
	Wed,  4 Oct 2023 14:02:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DCB10E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696428150; x=1727964150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vWcw/jgmwFESJ/RSkwsD0zWEo69Y03pzUi6QI98hRY8=;
 b=meTcqmBa3+pZ6FvEl4uxiD0uu1P/q6sg8/rnzMWTOkeeEyh4VaFGUoJE
 tFDrJ932NZsP6b7wo9duPpS/7y/hZwkFjq5JR19Vcm8kOTlvhdy1rteMr
 gIwuC0XksjvcuX5iNrv72q8KfsPBhtiD7yyxCboPVrxCFpytlW/Mrl0EF
 JGjIoWj0MPdBK+DqJJazfNNQRXvLqL15eWtdRAG1f0HC/GwCzlbIQVc0A
 8EUmfrMnr7zswnFSwPflHRXecNQ6WH9/eWiKQMyVIIZYmH84uofPh1wXU
 0CfJS49XVTc8db0n02X3ZCyn+wruRZP4lujTDWsf4bRdaZJ39Q23Db7zy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363445216"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="363445216"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701115151"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701115151"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:02:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:02:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:02:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:02:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:02:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRxYXT41YXJ03S2UkuJE8GI8jr6OG/D/q0NYYrhPozcdVHMG+WgL3OoExyb6S+caijhCM2kdMnE3vKMznHaE35qUYE8yiLTbZEIJ36+nCAcJ0lznirtWj7/KsrKhFKluDa1tFz9EY5BDPjssn5mCArHtl2NgHwlGt+ZmIFtqOoZLoUws2HNDQXgsjp6fmCadDmm5MDJSbR09TvEIIo5PoVZC+0X9aUN0vHtS5xZ6V/6tMECxOoRRWmjJcNYNwZsG1OyM0PzKc5kz1q49DKHQSIm48SMdU/ggwPybM3ZNyFb/qrZFOZjABN6y0AEFX7ceVYvnjnGZ/8rqW+z63Tf+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbN+WDiTTf7ahnYZVcdZcQHLJuFDO5uiq9vmitlCzDE=;
 b=neVrWiY9SMamqQJ+YaQWio/ew6HawHCpJ0+RGcXex6aXZXAn8hGiuz+bv3XzgZPrSVskB8j0RdOTZtOm4HvPONmB/RWNnMH5BvGDBKUr1iH22c/eKfgZcxcmfiQ9iruATkUiHjfHYe7ad7x3MHbBvasG8/4JCbN9CwOPNmgNqP1hhERVPG97Zc493UYdo6D+y6yzINAyT96xviL+/qWOXoGsBPkMgnU8DU/uZjxezlb4X92RGID/a015xkRb3cKZr67BScdZ2PyOsv7WvhaisiqaUS3k4JuL9eg1J7jPyUFCQLna3kK4lmu/NTKjfUhYW6BWqkS9ajPCjCbAhxEy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 14:02:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:02:16 +0000
Date: Wed, 4 Oct 2023 10:02:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR1wY+2IKMC6r75M@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <70a0652ffedbfa33e36b0b2eea4a0aad5bc378da.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <70a0652ffedbfa33e36b0b2eea4a0aad5bc378da.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: bcce6dbd-cf8b-44bf-012f-08dbc4e283b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGQgTWegMKAOESBwjZZVsp9a2KFeEeRoaIfRLzfnSSMr87NPIqCxr3Lp/pvJaDlYPDutgaTIKFs0NYdGs+Q7DLU+Qd8+y4c6pEj0uMGqcmLcflzUl4dsVZHJMUZ4PU0TGjfOTqgsAuAqQvVjNSsl47cxkDe26KtzXxG7/b8W0eYjdtpbpld926ZwOUZMtwz+4jZL/G80cqZiGoGzRj8njTYwdRxlF39Jrfk70JdbTMxBeGl1fB+64bXBGBFSBL+nTO5jWzdWntA9MmfjK4qoOzeec5jV/J9CFSQC8Ktz+E2kDbnuXgQ9ozaXs/I4FA6ge5/Qmusn76Sy4K5AHHCptOdGbI6nMdejhEYIt/hR5lezMDnax3EKfwSUDFGUvJ40J4Nh293F0E2HA8BAVJt90fW5+mjyFUbsrubA6OXqykN02avqKP8YJ79DM7J0UwrJu5LsGI3FrCB7ihjA3zvaDmZ10Sj+/VcaQQ4tofGnuejQO4Tww4zdJ8slSVm5mDkuMfk67QXVt2w8AS8+Z2s9csXYXNvfriVUOjYtPZHCnB/89D7RFQ7Jf9K5v5XDv7kbbX8ItVqJAwJaCkne4F82dlt33tMNSFIaThwycaxDVcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(39860400002)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(41300700001)(37006003)(6636002)(8936002)(66476007)(66946007)(66556008)(6862004)(6666004)(38100700002)(82960400001)(83380400001)(8676002)(478600001)(6512007)(26005)(6486002)(6506007)(5660300002)(2616005)(4326008)(44832011)(2906002)(86362001)(36756003)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z09tnMMkmjziJgnI5Zp8KukQpgilOUEKnOY8d9j/1jJKOteML3CpnwtEVIgI?=
 =?us-ascii?Q?eZbhtOOyTtvJuvcVW3c4AtbR74EUE6t10615GHREgTCLlf9myxEEJ25KvTsM?=
 =?us-ascii?Q?9+2kWTznEdU6MlAeIhpwpVxGSuxHS/BvLwyQsmNu/Ukl/LsFsOEdxrqCjIJ3?=
 =?us-ascii?Q?Afjyt9VdKyNJyCsJFqiu53VLN07WPAW4mT5mtwwejYbVnNulDymhXnM7orHc?=
 =?us-ascii?Q?hqglE1xH6LMhzonsVFFQYV1J2+a2UnQqi2dIkj3ZK7dD4ajS4sNFHYJr5PBw?=
 =?us-ascii?Q?4fg/L0E/7tME39GAn0s2qsscWRNTL3v3CQ8lqcqtIS6onMbac6hayMJegvAD?=
 =?us-ascii?Q?v7s7K8h0QIMRMAn5yrWlQB4Tg2Wj6DBfUlDhRcoJHEZzQXDxuzi4dBVrMWSi?=
 =?us-ascii?Q?rei5Ct30xfESMw2OhkgLADpvorKvmhwtdKQjHXOkJgCEzPPcH6AkxDOvQNXM?=
 =?us-ascii?Q?tVOJbPWaNKolv/4EsmhyrPsq29FS8ykm4eWGm8laJyarsoDE4wsYmcde+sIr?=
 =?us-ascii?Q?hSQr2RV71OFHuUntduGTuUJc6U0qPoOMZl5rmZkQ4DK7MbiVqhMjWNzKcwJv?=
 =?us-ascii?Q?Vz2CytXoYB9V4j4EJ4adcfwixpft6eXQ18Se++49mRYFnprjcKd51UEMnqkf?=
 =?us-ascii?Q?6xdvNbnyPdMPSnpotnn5J/sFJN3x3udcvyM9S04+ALXvgIniCccXOOhc/Dd6?=
 =?us-ascii?Q?zDFkQuzZAumXxYnz42wKTOj21PTZYiZiPna5M1p2QTtqzQJ9+UCIniVAj7YB?=
 =?us-ascii?Q?mlqVJPDLOXQpPFT6ujOq5+Ef9NzqQhSGU96/AGS/XJxV9OTMSPKhfI4QYNka?=
 =?us-ascii?Q?dcuJCzLm7jQbCANk2u5T5YtsP1c/y8gAJYkBvVnXyM3vvfzZ+J4qEnhihDqH?=
 =?us-ascii?Q?D+I0talATUfNyM06RufhxcijlCn0iBZnBC9mXCw5ZGv/7oEW/AQhAUh2zfLD?=
 =?us-ascii?Q?aaM2DBbAoCukmnJWEFU1bL3Geql8w0PH/50eoLDSW9Q7LaMq0VuHf5bPH4dP?=
 =?us-ascii?Q?Si37hQ2yeDyEeW+um1NivywW629SJ2svO3ySP04y5bdDoCfaXo40WjP+mRPZ?=
 =?us-ascii?Q?qw62DFGLSDoOk9hawgUiXi7idwCGVr9U8XTsxLFwmcCDIqVGAd3JxJVnY8KX?=
 =?us-ascii?Q?VqGPqU4DePaZhjFwd/dHCY6LjZz9OSjfFFPmWlIJBwApMDzHB6alU3UiJl2p?=
 =?us-ascii?Q?9tzKq2faBua1O5bsbohZmsEXcuY8fNniEBPVYihYPF9wxR2v0LhIhXu4InSb?=
 =?us-ascii?Q?qSQzo9pX0pV17LjM4RmmBEUzCqoLaAgoluSSp8tSIjnms+Qp0QWlw7XYkfwN?=
 =?us-ascii?Q?6WJwy71AQ05yW2WI7e9lQNZff4TbE6UZtCyQvgMlSDEfiZ9puvs5KfVKJB4S?=
 =?us-ascii?Q?N8bXJPXpJZ1f+EYZxcUNplB4wbRjStqCBvVUXCLjynyEWd0lQvGCvruA8v10?=
 =?us-ascii?Q?fBAbZenQnyStXlgOpWMfK+zMMOhDxsUvaP25NQhXUbJHjRjw8fwOV+UTm/Od?=
 =?us-ascii?Q?rNfKdT4tL1Om4RD28ssLozBSdxAVCweAlSS7qYKP5jr91W0GcTzxZdJFy6ZN?=
 =?us-ascii?Q?CnNO6EoUIkoPiERD6YUghCyoSWQoke9c2vMp3j+S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcce6dbd-cf8b-44bf-012f-08dbc4e283b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:02:16.8801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aPPozamBR3LvtQdD59XBBygmi80MbRTaTOk4rjUyNCHNO+leoqVMWanAbDFvSDH+H9bpHAtL+SOumtcpwplrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] fixup! drm/xe/display: Implement
 display support
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

On Tue, Oct 03, 2023 at 05:34:48PM +0300, Jani Nikula wrote:
> We have an abstraction for "has display", and it's
> HAS_DISPLAY(). Unfortunately, it requires access to
> DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
> although it's a bit meh.
> 
> Looking at this makes me think there's a bunch of confusion in:
> 
> - the pipe_mask or now HAS_DISPLAY() checks
> - the global enable_display checks
> - the xe->info.enable_display checks
> - redefinition of INTEL_DISPLAY_ENABLED()
> 
> I really don't understand this, but it all looks very suspicious. This
> change leaves all that in place, unmodified.
> 
> v2: define local has_display() to make this a bit cleaner
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 07898e0e175e..68729997e1fe 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -15,6 +15,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "soc/intel_dram.h"
> +#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */

should we then add a FIXME tag to the commit subject as well?
just to ensure we don't miss this here?

>  #include "intel_acpi.h"
>  #include "intel_audio.h"
>  #include "intel_bw.h"
> @@ -32,6 +33,11 @@
>  
>  /* Xe device functions */
>  
> +static bool has_display(struct xe_device *xe)
> +{
> +	return HAS_DISPLAY(xe);
> +}
> +
>  /**
>   * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
>   *				   early on
> @@ -316,7 +322,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  	struct drm_device *dev = &xe->drm;
>  	struct intel_encoder *encoder;
>  
> -	if (xe->info.display_runtime.pipe_mask)
> +	if (has_display(xe))
>  		return;
>  
>  	drm_modeset_lock_all(dev);
> @@ -346,7 +352,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	 * properly.
>  	 */
>  	intel_power_domains_disable(xe);
> -	if (xe->info.display_runtime.pipe_mask)
> +	if (has_display(xe))
>  		drm_kms_helper_poll_disable(&xe->drm);
>  
>  	intel_display_driver_suspend(xe);
> @@ -392,7 +398,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>  
>  	intel_dmc_resume(xe);
>  
> -	if (xe->info.display_runtime.pipe_mask)
> +	if (has_display(xe))
>  		drm_mode_config_reset(&xe->drm);
>  
>  	intel_display_driver_init_hw(xe);
> @@ -403,7 +409,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>  	intel_display_driver_resume(xe);
>  
>  	intel_hpd_poll_disable(xe);
> -	if (xe->info.display_runtime.pipe_mask)
> +	if (has_display(xe))
>  		drm_kms_helper_poll_enable(&xe->drm);
>  
>  	intel_opregion_resume(xe);
> @@ -424,7 +430,7 @@ void xe_display_probe(struct xe_device *xe)
>  
>  	intel_display_device_probe(xe);
>  
> -	if (xe->info.display_runtime.pipe_mask)
> +	if (has_display(xe))

my first reaction to this probe function when I bump into it during
rebase is that it should be simply refactor to something like


xe_display_probe()
{
	if(!xe->info.enable_display)
		return;

	intel_display_device_probe(xe);
}

but then I put the pipe_mask check and the goto back to avoid
disruption, but without clearly understanding on why we have
that to start with.

My thoughts was on maybe it was a redundant check to see if
display init setup went well, but now I see it was more about
has_display...

But now I wonder if we cannot simply use the HAS_DISPLAY()
directly in the first line of this function and avoid everything
else?

>  		return;
>  
>  no_display:
> -- 
> 2.39.2
> 
