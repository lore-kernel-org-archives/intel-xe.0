Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3C4CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 18:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAD510E6B9;
	Wed, 10 Apr 2024 18:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LELiJWsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7258410EC01
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712772006; x=1744308006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ce5wOrADdoUHITHshAYw3XszT8G+tP4CY0WFSzI6y6U=;
 b=LELiJWsh+JuwSdfomC+t4pSNRFX87lnwfaEjh/KNRx6vaCI68escYxTk
 s6WR+hQ/NAkEZfIFsyExTr/VmRLqm/08B/9PJQB4744E/YIP1x9lIMSkl
 ZWApNpMu/R2pmX5XJtcbO93KAY081if+ySrUZ8BoyS4SasmzNTDr3aYbB
 xji4EXL0FdglNavKEH44HyZZd8kxPKiwHevgSRr54lTnwpzUN29dQv4Rl
 6q6u17VVdAPAXnmAsSe5ZazczjvfrxS1fRT/ngCXPqi26i3PfKD0YGKNi
 5i9VGdTpVJ5362EF0uy92K4cWizpP7ewpXdV24xkb+y+4hyZ6ZIiIFmBS g==;
X-CSE-ConnectionGUID: SbLwgZBESfyDp5c5N49syA==
X-CSE-MsgGUID: qZeLzjndTMCz/TgAOGM0lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8258456"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8258456"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 11:00:03 -0700
X-CSE-ConnectionGUID: JmTCi6c3QnygXj75bbVtzw==
X-CSE-MsgGUID: DlVEQfQZStqSWHsaS0z95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="51609102"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 11:00:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 11:00:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 11:00:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 11:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S60RA9glHeBLo+hpxOSwj3YLfEH4vNlF9kUAgN4UTU+85/Hc+dEzz3B46vEMFbNNQspBaI/pKxrw1bM1N8OcAhZYz5Sr5XjyfLnisY55n7LKzCniLI3UaxBCNQ4QCC+EZnhb3MCtIOeyiM+8Nl2xQ41Emjeg7lxhP6WkXy5lNF0xvmd/iwbGIPICor7JAehNnxev+K9B3aEOkZ9df1hwsHktVkHUcnMRCzZFgzqixxR04kOMWC4KBuS1zS4W0OxzWqie8H9uQrCWJO5XMWk17qg4WKFVurAwC0yrwBZL/8Q9bQ3sbew7oaH2Ysoy4DvtNhZDK5MjHR+qGsiGUU9vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xmwdvr00jAwdbD+OiufLB8wpP70oSHNffVItQu+C/cI=;
 b=WsMtvQW+u9R041wPDUd9cVUVQgNJ7H53CUHwUJhWmfqtfb/4R0hV736vS+njNSvvA0IGZKc11yhqDO2sv1KJiI3nU9C8sgK3RpIU5yapyYV6O8BDfO7F5NVDET09PSIAUueIB81K7rxC80mBqRdgr6Bsb486EHLsckZ0CWSehr+clvym84EOcXS/T9fRfjtFrsWd2Gknl3Q5gKIHObrRfvFtzwvy+PFqrVZZdce7Y3hVrklJiXuAJBVE35Cg1y57MyTYoCJwfPVtiP4bsQUmhHz+zjoaNP5lTVOrQSpsLSvCTmRG38nom0K0d3fRxFJ36LOV/hVUGZVJZA3J6F8noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 17:59:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 17:59:59 +0000
Date: Wed, 10 Apr 2024 17:58:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Lucas De Marchi <lucas.demarchi@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <ZhbTXWC2BunP36Kp@DUT025-TGLU.fm.intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409221507.1076471-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR07CA0071.namprd07.prod.outlook.com
 (2603:10b6:a03:60::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6182:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SpGkX39scclj0F+yxSINuUa8Kbq1AVQZcEN3BQX1YRZselsgDYB+D3f5tPmXr2iME3XyuErnzxx+jSmvoNPxJu2yr4hRZn25CSY96fwF3kEqD+wGbVMccMprfiWhh4nlxmMNnnD19aByxNlT78bhy7bwzR8XAuwEClqo9rTbxphClf14aOIma/MC6ch8cu/XP0vNlJMgpalMlV8CBnZCk1EUBAXZFVjSfr+IB49S5W2B58cNjvdbSdZBCK5LBjKDKxesn9+2ZV5ahECFHGdcGKJgztrB784aU9I/i83M4g6IVd9eEJbCILeA7xZaMgzx80v836xahSkKEHv22L30iFvR1bDI95uehRt2ytEFJx0XonB+qtn+vr1GkOC3CQrLyhaWSJF8njynDr+gYyXzwnapQfpz0g8ovz0V+29pixebQVXWc/5TLTyRyszOS/wpvw6mogor+s8NK4u3Y9ypWSn55flNgkbvHEli/nAsa+R6S1wPQaF7Cty+InilKAzVofUeNGwp68QCKwuH9ikWXGlXcPIzTTJDWGUCAkw2EBwH921Fx6kEqczvfPpELsbNhPSIOsQ9DbgCL3lqcTm5hPl1XW293ZAJu1yO8qxkAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4rvIlbfnbRWXzoeU+jQLg3e5d/KigsvT8+Sx0pD3ChBD81F3hFYqlMNg68v?=
 =?us-ascii?Q?2tg+RduwAoMsuSkvE7BJJd6Qc+7T8JL4ltz93JVToqjAWdX09FhTLrXB2baJ?=
 =?us-ascii?Q?sa59ZdGT22rD3EtaHA5+wyS/F85PerQ3CmljMY8oW/zU6dZf4HHcusYpWs0W?=
 =?us-ascii?Q?HmBFpt6YJnpPiGLh5ni89UBvaCizunwzJHH6+X7RkuWvoVVPSY9/LOZtmJT9?=
 =?us-ascii?Q?tH8BA3KlWsDNxeIpqU9AXQDd+2IbXvY/RoMWs4ryEWNC4o+BOLicaiKCDGOD?=
 =?us-ascii?Q?oqpDb02Crax5gVtVTeVT5eKjuy547zF1Q010Jjl+lAVfKA7TgOnDaSN2uTGP?=
 =?us-ascii?Q?czcblrF2p+gmifW/huQ1e8nOAkRC9fCxWg4Jck+wLqOlDDry7t0x8gbc2etL?=
 =?us-ascii?Q?a8/EGUp0l7Ump4Di6brG/AFFdkOqrXubIgBit+vBGijphtP9ERuvvlDW4KTY?=
 =?us-ascii?Q?2OVaYA/KKVV5FvHFSZ9qK6AfOLUbZpi01d2Vc/6KIzJaeDUPr4sk/l2BFclH?=
 =?us-ascii?Q?O/du+c715gMDvNtZZ1vBE60sgNM4i+JO73YzfOd/zT6q6dkRnMckeGO/KP2Y?=
 =?us-ascii?Q?6M98GqpqJ0is3N/egDoaEvzmPFvnGpGfkW6lMX+Qzt4t6TkVtacne7twJjSD?=
 =?us-ascii?Q?qgiPj6OMAk+UZQaeZ6Z0614ETXWB4TkmVT/dVWV/A9bNujZbTIF79TWfJ5qi?=
 =?us-ascii?Q?fSp11jSDxa0wr5W0gITn5c+kf7CVNpfXIhtnk+Pjg7MFRyzcXfCJBlrycSRC?=
 =?us-ascii?Q?w/fLVRHNroaBinGBbTAZUZvXXEiOfrarspS3Hk2o5m71eN+7nnkfUs4T+2G/?=
 =?us-ascii?Q?CbiKGvUgyQJsfZacVNdKm6cEymMdRrPTv1mL7YGevHVsLGgGDeR+oI7w57Fj?=
 =?us-ascii?Q?8+uWmCOq0V3jNvAgTzyjgr5XrQepj3F6my9FSdCMlzfOrd5SIvn8voDvpFcj?=
 =?us-ascii?Q?tlo+bhkZdW/ac1tSK8FyXTLxdeFbl71Z9CF79NwkDxy02a9ZXhbgUsNL6X7T?=
 =?us-ascii?Q?hMIckSutuI4FEz4JCAHIjukgmG9/vI9SROncSSJQXZ7r3IieFtGjGkethQJE?=
 =?us-ascii?Q?/eAJ83Z9IGbeZTv7OD1eOonLZuW1t3iG6osLMLfHBVKXFtAqMEIfxmLP65rU?=
 =?us-ascii?Q?Tst/lBW5WubVbFhVrxB4+7hSxJ7SczH/wA7OVdKVPEien87SoaUpszgEp5f9?=
 =?us-ascii?Q?mqc1ftrXx9KyjiLB7pUOoFBcUWfAbOOudJmfS2A7iBnA8qS9rNVydlADZuC+?=
 =?us-ascii?Q?7KKUZInMFJnMjysKAhTXMID3RnnJC37GxWF0eEAmc7w4dMDEBAvViaGCNKCh?=
 =?us-ascii?Q?QcdxSy/Sr2+b6307iRi3Z4mFzF+qnXMEfc/qWayzFvp5KJJpiALLOAvVIjUR?=
 =?us-ascii?Q?XIZOWuNl/eBYphQYn/A0OLiLUoRtET8iZpnbSnBu5e4l3P1uafCvFybMHAxK?=
 =?us-ascii?Q?XDogCgA2yQXe1GHo5JHvEN76w6jYdyQRtilwczx5VgwVQJTrhRi49LIbLbWv?=
 =?us-ascii?Q?ILNEqpQQQIRVa3+wzAllSl5Tw08cI1QsjxdW1BxtGAE0aaMWT6ArYU83ieXO?=
 =?us-ascii?Q?a9V641uZj3OxA10IuzT+mkVf0YChAKyAobkt/F1hcPuYcZojwve8W1kXVfAK?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acdf11fa-5d91-4e8c-fadc-08dc598809a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 17:59:59.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/xpl7BQj3Du/iKOQfhBTYm0FfYZH9eWh/HrCwv6D3jbshd4NBVIuOQXe1uyPmbg9MJdnzSCoga5CWr3v3M0AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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

On Tue, Apr 09, 2024 at 06:15:06PM -0400, Rodrigo Vivi wrote:
> In many validation situations when debugging GPU Hangs,
> it is useful to preserve the GT situation from the moment
> that the timeout occurred.
> 
> This patch introduces a module parameter that could be used
> on situations like this.
> 
> If xe.wedged module parameter is set to 2, Xe will be declared
> wedged on every single execution timeout (a.k.a. GPU hang) right
> after devcoredump snapshot capture and without attempting any
> kind of GT reset and blocking entirely any kind of execution.
> 
> v2: Really block gt_reset from guc side. (Lucas)
>     s/wedged/busted (Lucas)
> 
> v3: - s/busted/wedged
>     - Really use global_flags (Dafna)
>     - More robust timeout handling when wedging it.
> 
> v4: A really robust clean exit done by Matt Brost.
>     No more kernel warns on unbind.
> 

I really like the idea of this wedged mode as I think it will be useful
for debugging hangs.

In addition to taking a ref to all the exec queues in wedged mode 2, I'm
thinking we also modify xe_vm_close_and_put to not teardown the VM /
VMAs rather defer this last put once wedged mode == 2 && device wedged.
This way all the VMAs and mapped BOs will exist after a hang even if
application exits. What do you think? Can be done in a follow up too.

A couple of nits below too but LGTM.

Since this is partly my patch, I'll leave the RB to someone else.
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c              | 32 ++++++++
>  drivers/gpu/drm/xe/xe_device.h              | 15 +---
>  drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_module.c              |  5 ++
>  drivers/gpu/drm/xe/xe_module.h              |  1 +
>  8 files changed, 132 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 67de795e43b3..7928a5470cee 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -785,3 +785,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  {
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with a module
> + * re-probe (unbind + bind).
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe_modparam.wedged_mode == 0)
> +		return;
> +
> +	if (!atomic_xchg(&xe->wedged, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as wedged.\n"
> +			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
> +			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
> +			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> +			dev_name(xe->drm.dev));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c532209c5bbd..0fea5c18f76d 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  	return atomic_read(&xe->wedged);
>  }
>  
> -static inline void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> -			dev_name(xe->drm.dev));
> -	}
> -}
> +void xe_device_declare_wedged(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 02ce8d204622..48f6da53a292 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
>  void xe_exec_queue_destroy(struct kref *ref);
>  void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>  
> +static inline struct xe_exec_queue *
> +xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> +{
> +	if (kref_get_unless_zero(&q->refcount))
> +		return q;
> +
> +	return NULL;
> +}
> +
>  struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
>  
>  static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 93df2d7969b3..8e9c4b990fbb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  			return seqno;
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
> -	} else if (xe_device_uc_enabled(xe)) {
> +	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 757cbbb87869..dbd88ae20aa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -20,6 +20,7 @@
>  #include "xe_lrc.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_platform_types.h"
>  #include "xe_wa.h"
>  
> @@ -394,11 +395,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  
>  static void guc_policies_init(struct xe_guc_ads *ads)
>  {
> +	u32 global_flags = 0;
> +
>  	ads_blob_write(ads, policies.dpc_promote_time,
>  		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
> -	ads_blob_write(ads, policies.global_flags, 0);
> +
> +	if (xe_modparam.wedged_mode == 2)
> +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	ads_blob_write(ads, policies.global_flags, global_flags);
>  	ads_blob_write(ads, policies.is_valid, 1);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c7d38469fb46..0bea17536659 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,6 +35,7 @@
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_trace.h"
> @@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define ENGINE_STATE_SUSPENDED		(1 << 5)
>  #define EXEC_QUEUE_STATE_RESET		(1 << 6)
>  #define ENGINE_STATE_KILLED		(1 << 7)
> +#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
>  
>  static bool exec_queue_registered(struct xe_exec_queue *q)
>  {
> @@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
>  	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
>  }
>  
> -static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
> +static bool exec_queue_wedged(struct xe_exec_queue *q)
>  {
> -	return exec_queue_killed(q) || exec_queue_banned(q);
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> +}
> +
> +static void set_exec_queue_wedged(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> +}
> +
> +static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> +{
> +	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> +		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
>  }
>  
>  #ifdef CONFIG_PROVE_LOCKING
> @@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  	free_submit_wq(guc);
>  }
>  
> +static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (exec_queue_wedged(q))
> +			xe_exec_queue_put(q);
> +}
> +
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
>  
>  static void primelockdep(struct xe_guc *guc)
> @@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	trace_xe_sched_job_run(job);
>  
> -	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
> +	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
>  			register_engine(q);
>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> @@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  		xe_sched_tdr_queue_imm(&q->guc->sched);
>  }
>  
> +static void guc_submit_wedged(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	int err;
> +
> +	xe_device_declare_wedged(guc_to_xe(guc));
> +	xe_guc_submit_reset_prepare(guc);
> +	xe_guc_ct_stop(&guc->ct);
> +
> +	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> +				       guc_submit_wedged_fini, guc);

I think we can use drmm_add_action as if this fails to allocate we
don't need to call guc_submit_wedged_fini.

> +	if (err)
> +		return;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (xe_exec_queue_get_unless_zero(q))
> +			set_exec_queue_wedged(q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  {
>  	struct xe_guc_exec_queue *ge =
> @@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gpu_scheduler *sched = &ge->sched;
> +	bool wedged = xe_device_wedged(xe);
>  
>  	xe_assert(xe, xe_exec_queue_is_lr(q));
>  	trace_xe_exec_queue_lr_cleanup(q);
>  
> +	if (!wedged && xe_modparam.wedged_mode == 2) {
> +		guc_submit_wedged(exec_queue_to_guc(q));
> +		wedged = true;
> +	}
> +
>  	/* Kill the run_job / process_msg entry points */
>  	xe_sched_submission_stop(sched);
>  
> @@ -870,7 +922,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	 * xe_guc_deregister_done_handler() which treats it as an unexpected
>  	 * state.
>  	 */
> -	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>  		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
> @@ -905,6 +957,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>  	int err = -ETIME;
>  	int i = 0;
> +	bool wedged = xe_device_wedged(xe);
>  
>  	/*
>  	 * TDR has fired before free job worker. Common if exec queue
> @@ -928,6 +981,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  
>  	trace_xe_sched_job_timedout(job);
>  
> +	if (!wedged && xe_modparam.wedged_mode == 2) {
> +		guc_submit_wedged(exec_queue_to_guc(q));
> +		wedged = true;
> +	}
> +
>  	/* Kill the run_job entry point */
>  	xe_sched_submission_stop(sched);
>  
> @@ -935,8 +993,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * Kernel jobs should never fail, nor should VM jobs if they do
>  	 * somethings has gone wrong and the GT needs a reset
>  	 */
> -	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>  		if (!xe_sched_invalidate_job(job, 2)) {
>  			xe_sched_add_pending_job(sched, job);
>  			xe_sched_submission_start(sched);
> @@ -946,7 +1004,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	/* Engine state now stable, disable scheduling if needed */
> -	if (exec_queue_registered(q)) {
> +	if (!wedged && exec_queue_registered(q)) {
>  		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
> @@ -989,6 +1047,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 */
>  	xe_sched_add_pending_job(sched, job);
>  	xe_sched_submission_start(sched);
> +

Extra newline.

Matt

>  	xe_guc_exec_queue_trigger_cleanup(q);
>  
>  	/* Mark all outstanding jobs as bad, thus completing them */
> @@ -1028,7 +1087,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
>  	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
> -	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
> +	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>  		__guc_exec_queue_fini_async(&q->guc->fini_async);
>  	else
>  		queue_work(system_wq, &q->guc->fini_async);
> @@ -1063,7 +1122,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>  
>  static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
>  {
> -	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
> +	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
>  }
>  
>  static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
> @@ -1274,7 +1333,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>  
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
>  		guc_exec_queue_add_msg(q, msg, CLEANUP);
>  	else
>  		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
> @@ -1285,7 +1344,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>  {
>  	struct xe_sched_msg *msg;
>  
> -	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
> +	if (q->sched_props.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1303,7 +1363,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
>  	struct xe_sched_msg *msg;
>  
>  	if (q->sched_props.timeslice_us == timeslice_us ||
> -	    exec_queue_killed_or_banned(q))
> +	    exec_queue_killed_or_banned_or_wedged(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1322,7 +1382,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	struct xe_sched_msg *msg;
>  
>  	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
> -	    exec_queue_killed_or_banned(q))
> +	    exec_queue_killed_or_banned_or_wedged(q))
>  		return 0;
>  
>  	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1339,7 +1399,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
>  
> -	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
> +	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
>  		return -EINVAL;
>  
>  	q->guc->suspend_pending = true;
> @@ -1485,7 +1545,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
> -	if (!exec_queue_killed_or_banned(q)) {
> +	if (!exec_queue_killed_or_banned_or_wedged(q)) {
>  		int i;
>  
>  		trace_xe_exec_queue_resubmit(q);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 110b69864656..5e023df0bea9 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
>  	.enable_display = true,
>  	.guc_log_level = 5,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> +	.wedged_mode = 1,
>  	/* the rest are 0 by default */
>  };
>  
> @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +MODULE_PARM_DESC(wedged_mode,
> +		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 88ef0e8b2bfd..bc6f370c9a8e 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,7 @@ struct xe_modparam {
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
>  	char *force_probe;
> +	int wedged_mode;
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.44.0
> 
