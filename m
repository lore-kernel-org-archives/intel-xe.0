Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEF5CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 14:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A719510E4FE;
	Thu, 19 Oct 2023 14:28:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24910E4FE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697725717; x=1729261717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ELgzZHHRh0y5YOq9FV7ZlFbHXJm9l99dD16Pd7y0J5Y=;
 b=PJ5aIG3zirc2RM+vXfH2PVwpqvkb6DTHrSwrGKKg6ztNMhlyOIazWWg9
 UdO4cEdY6s3aKA4Xe9MaHYHFv970vVKJohjGqbBA562kZ++TSeU0FRM82
 HyiIf2eFniqVbk9T0DAhaVUAUPdX6DoWYKLZ5/LkneVTeBNjF7wrWyp8S
 m47ZF6Je9ytAWGJCNXDj0NGO8SZbzpjgADdmmP7j9ER3cg/Fcc0rEsGCq
 1+3MUBhhb5e21T7si+aTjr30yTD/Ha+gL3u/0ex/rqMWLezGRjOgYBNBR
 mMKmoQ8OEDHty1GMvf9G6gO0WCqyS4tIwxoBjerkKhT/js8orSYqPHX4v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4869988"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4869988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757045559"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="757045559"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 07:28:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 07:28:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 07:28:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 07:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJcS4nW9VMqL0cBp0+sXlFYL1f8VPUKShZx7lD21AI3Kn3loXUkYJW0S1oRBKzYci2xackrYwxnCdDtPFb2rDBbzzkP8Njv1etw/mRNwwj0+jcKSTr5UMgeZtgyDGtBsgrVya8bqlfWeMrGJNYRNJFtjtuIbtsYXqC7qiYmDIlmXP+iqDnU7KOARrcSSU70wK0R7I3gcEX8U5N51t+ij1JcdQ7xTO/nQQsLVzxCPgGRXYx0VIe76MJ1pQppo7Gy3/CYzeXdrG4518wKrC85eeDj/jENRHQFamam6/K4j9DleZuVNWHlZFhhi6iWCsjNuB8oYn0loewHi+XTGDFbzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/CXt5vq27k9CrC+ZiEJGIQ++XECa+G866Hkf7TrkJo=;
 b=MJ3y7cI4SXGOWvWnTbovHfkc5DsCt+G5+ynWzh3qF7Sb/qMPwjnZkrbOTQm5edD2805F19KfJT5HXka66zZsRmW8q+fY1dbDOyuA0bO8/QeX5saf1kjUl60Zqj+6BjvW18DJSMY21sfAVt+np7Qp+GJJqjKNIQbH9x41MqYumA94JQYGMewWP0vYxu5aBJFqBJoHYqrAo9PYguaIVQSZbDoqG6oFCmdeb0YzQReodVbxrsCahF+ak1Cl7XHbhDSnAFyOnPQ+3xQ4O59l2Q1V9SNqNUo0sk8XNNZq10a8sYyxOY4vITNcbn2ordrKT3425mVW5cxh3ofZ7EZizN+itg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 14:28:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 14:28:33 +0000
Date: Thu, 19 Oct 2023 10:28:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Message-ID: <ZTE9DY1dFLqS0hte@intel.com>
References: <20231018124500.1309994-1-luciano.coelho@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231018124500.1309994-1-luciano.coelho@intel.com>
X-ClientProxiedBy: MW4PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:303:85::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b2dbe7-2134-478e-c4a5-08dbd0afac39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5Z5f1/+jefuUA5jyGjWNTXBMRwKMGGQCLnVP6wDZ0fWIKsBcj1QTMptEmQClcqL+nCbpFoqmv4tMUWSc2GiaX+JEW/9Fyqs8eZw2zW9U9X69RCrq6MCv27Hwn3tye8Kp0797BCKh22IdVcB4UKa2n6eKvlCaZIsuAoTYcIYoRcmW4xHExEOYLoG1qyk8/DWVil7X2b0vrHivgDQF518ZYtADUZ212fHw4gUNJ08asI7cqp9PaowdU5v0O+W3sniR3ooPwhy2X+biCrzHOdh6vGNnzQ0EMoFHqx7HPpZJxSQj2lfOSdOiChOMCdrM6AIo/WcVHwPv49a9/ljABdRoXtLm3kpiy16txzTHb8bxlxreVLAT9tbpEDg0e5RiUE+op0EaVG74PKlk/EW+GUXaYnsWm7Ymu8hKxyYYBpaqtRn0wRcCaQhdGy6pY3BJqwUTQAzf9jl7eUUMQ2yfsviAuQy2S2gUyIKQKfUIG75PEo8N1VxQA/JiRaNCRbUDlnT+VNCRqg1MvDb4IFQrH68a6vJa1UHITfgdLQdh/94QSZWkwWZeu/NxTr4HnJmOjI0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(4326008)(41300700001)(2906002)(478600001)(6486002)(5660300002)(8676002)(6862004)(44832011)(8936002)(316002)(66476007)(66946007)(66556008)(37006003)(6636002)(38100700002)(86362001)(83380400001)(36756003)(6512007)(6506007)(6666004)(82960400001)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4l8J3u5XAWXZNuFZ82xF0TIDMLLXAeQgH2t80gEdAeICecgC5cys7ABEweZ?=
 =?us-ascii?Q?lIZFkWkg/ktpPFG72KytBz7Nl+x/CeiI5K2pvInqBK7rPJR7QyOPgXib/FLB?=
 =?us-ascii?Q?iXcaWTRX9g9cMm75Vn+lh7a7uBCjTUOq99SU9Oruaj2oJm5oVUtuhadF6Wsg?=
 =?us-ascii?Q?J/jkDx5ejlyROElUFZyYRYIdtAJ0CVEDaZOS0LzetljC2CK4S7xfeOyLXsuW?=
 =?us-ascii?Q?4bU5N8Ba4R51Bkk93wg3XxXRKU6RAad505X+aoyLC7pv/CT1N1JCIPHk2+Ar?=
 =?us-ascii?Q?BMFtxf0OI/9/YLWmK39FPIsPDKrRi4HWSQ9E/YQg9xZipAhO5E92FWaMUTg1?=
 =?us-ascii?Q?LGQ2sgiKKWYrQg3QX4+fNpVX8OUvDOQVgP42gmHYv+S/PbZYVP2LZrhALGzt?=
 =?us-ascii?Q?mcksq2/H/xDLpmpW5LqmQNRdm5rgs7mGKMjVLvJ7tgI8xlLXFbJVQ4Y2yIh6?=
 =?us-ascii?Q?VKuwGM2M6a4Q+nX5WKkyAEmLBJZwwy2uXjeF1zj08OGposaLOVf5G6j6N10S?=
 =?us-ascii?Q?S08Eth6DDCNBMDTD1L0lYJsnVeJ2LMwfCfgH/Sb8p5yPON62OaPW1rvlEnS3?=
 =?us-ascii?Q?cBrbsYLypThgoWY0GlMNJepz40kscVd09wWon4WyAN+/FbB9uAYyAytIRBbW?=
 =?us-ascii?Q?qVRKe1BUtJpYBBrnOGDzdo67Cy1sHL2Yxv5CIUQZg6BnDZ9JJf50vrnRMGo0?=
 =?us-ascii?Q?WBFYNCPvjtdC0VWQuhqHMIHukdSgUvxPZAgSuIp9LlMaXjTVDfW/zH7lqyVO?=
 =?us-ascii?Q?RApZB1z7Q33pR6KiLCfmll8BW+Putmqm34Ec1wHnZzwE+DVFYYcmmkfom+hu?=
 =?us-ascii?Q?gGnanwrsnn7dL7FlIJurH9F/SUiRe79JOZZZHXHvACaCg3pUUFURt7voBBeQ?=
 =?us-ascii?Q?hQMSRhwniMqaolSLgLiHVg3SEhEEb7LWMmuvuDjw57jBxcys7OlvaJK/brRD?=
 =?us-ascii?Q?tC0XBJbQc4biS+1JdPU+PBS1m7hltUpFzy3v9Zmlhi8VzEawKAqKVCkKOOkc?=
 =?us-ascii?Q?ZHR5NotP5+5Az98zGSmqM95lYe9AwlZ9Xwq9Flw5kAa9uCrO/lf9ewzLszeo?=
 =?us-ascii?Q?Jlwqh9ZIq4609UHm9bc4Xyk77yjEYgKHhC7jAkR2HKCiyJyfx9x1DmD9aJJX?=
 =?us-ascii?Q?isfHxKGaUYWXGsv8NCjlPrEZg1e/QVT3W3QIEY5fE5swBcPd+N3HByP+J9mz?=
 =?us-ascii?Q?W5O/v308jnGxCHZDrzmBXjHG6BzZGqIXfONMqVhWdbOdJtxTyjPXtaa7kMfE?=
 =?us-ascii?Q?JJDb1zXl6eszPfvuyKg5V7yKkma/hAzoXqverkcxgGEfOw/AbFBcW0OwhYhj?=
 =?us-ascii?Q?OLBB0+OWISJI8XUmQpqMHiEZcwiwx150tFKgvb2HBB0ZDy/mtfZ1R/NFsSM6?=
 =?us-ascii?Q?/lg3Gjj19yRcHROayyf5KqYP6io8jy4tOcvEvZSI+QUVrPu7kuTsODR464tF?=
 =?us-ascii?Q?ZD/s4S8Fo2HZjPp5AqhSxMMr3VEPeQgXCkgKg+YcoRYsFfcd2e7o2fWQsdip?=
 =?us-ascii?Q?p7xod3TiOmQeYzC1hKk2wVxK3ypI2ue9YiHWq/TfGZX753Vcwh7EKZq+ju2Z?=
 =?us-ascii?Q?K+ZNXNdLjk7+dAx/PLi+gAsRlLbUrz3JhJco5Ku1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b2dbe7-2134-478e-c4a5-08dbd0afac39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:28:33.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3WNeiLe4wNMTw2gM3luaW8gKkOqIoeWtVEBPjSU0t7mp1KBUWNdQSyuJhPYN1ePCIZBDSikY+KvjCW7tqZeqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/i915: handle uncore spinlock when not
 available
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

On Wed, Oct 18, 2023 at 03:45:00PM +0300, Luca Coelho wrote:
> The uncore code may not always be available (e.g. when we build the
> display code with Xe), so we can't always rely on having the uncore's
> spinlock.
> 
> To handle this, split the spin_lock/unlock_irqsave/restore() into
> spin_lock/unlock() followed by a call to local_irq_save/restore() and
> create wrapper functions for locking and unlocking the uncore's
> spinlock.  In these functions, we have a condition check and only
> actually try to lock/unlock the spinlock when I915 is defined, and
> thus uncore is available.
> 
> This keeps the ifdefs contained in these new functions and all such
> logic inside the display code.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.h | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_vblank.c  | 18 +++++++++++-------
>  2 files changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 0e5dffe8f018..07acf5d414f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -559,4 +559,24 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
>  
>  bool intel_scanout_needs_vtd_wa(struct drm_i915_private *i915);
>  
> +/*
> + * The uncore version of the spin lock functions is used to decide
> + * whether we need to lock the uncore lock or not.  This is only
> + * needed in i915, not in Xe.  Keep the decision-making centralized
> + * here.
> + */
> +static inline void uncore_spin_lock(spinlock_t *lock)
> +{
> +#ifdef I915
> +	spin_lock(lock);
> +#endif

okay, I understand that your goal here is not to fix xe in case the
flow is totally broken there because of the lack of the locks to
serialize the display here. Nor also remove this serialization in
i915, if not needed. And that's the safest option I agree.

I just wonder if we could do in some more generic way like avoiding
the term 'uncore' and using 'dev_priv' as argument instead of the
lock directly. But not hard feelings...

> +}
> +
> +static inline void uncore_spin_unlock(spinlock_t *lock)
> +{
> +#ifdef I915
> +	spin_unlock(lock);
> +#endif
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 2cec2abf9746..0e8b71063353 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -306,7 +306,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  	 * register reads, potentially with preemption disabled, so the
>  	 * following code must not block on uncore.lock.
>  	 */
> -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> +	uncore_spin_lock(&dev_priv->uncore.lock);
> +	local_irq_save(irqflags);

shouldn't we save before lock or restore before unlock?
or to be on the safe side also create other helpers for these?

>  
>  	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
>  
> @@ -374,7 +375,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  
>  	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
>  
> -	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> +	uncore_spin_unlock(&dev_priv->uncore.lock);
> +	local_irq_restore(irqflags);
>  
>  	/*
>  	 * While in vblank, position will be negative
> @@ -412,9 +414,12 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
>  	unsigned long irqflags;
>  	int position;
>  
> -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> +	uncore_spin_lock(&dev_priv->uncore.lock);
> +	local_irq_save(irqflags);
>  	position = __intel_get_crtc_scanline(crtc);
> -	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> +	local_irq_restore(irqflags);
> +
> +	uncore_spin_unlock(&dev_priv->uncore.lock);
>  
>  	return position;
>  }
> @@ -537,7 +542,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
>  	 * Need to audit everything to make sure it's safe.
>  	 */
>  	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
> -	spin_lock(&i915->uncore.lock);
> +	uncore_spin_lock(&i915->uncore.lock);
>  
>  	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
>  
> @@ -546,7 +551,6 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
>  	crtc->mode_flags = mode_flags;
>  
>  	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
> -
> -	spin_unlock(&i915->uncore.lock);
> +	uncore_spin_unlock(&i915->uncore.lock);
>  	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
>  }
> -- 
> 2.39.2
> 
