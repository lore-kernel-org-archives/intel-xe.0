Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE2ACDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D77C10E532;
	Thu, 12 Oct 2023 19:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3251310E532
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697137666; x=1728673666;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2CtAarpjOhqHhEuRXuGD4rBw5lKSrN5/wB/eaA2UDlA=;
 b=AqBjjV3+1RipA9vPWKCayIx5tht6wqG1cCZonVSjhauJaHsIyUUAjCT7
 ZOWyERUI0srgsrlj7m44cLglLTeshTfTzwW7ZefiCmkNYeBdXqR7nMqEX
 vTJZR5bqSQbH+SoSuT5JfEVZgQHC8e9gTSa5YE75KbfHoAuaL/AUaXSdE
 QaUGb/WfgETSFSpa+sUZ3RNki1Ic8BwcW42KhM06Ej5mec2zz5ILH5iYl
 hMJ1zBNmwH6W89HG7HwXyTlLa38kE3p/gYhWzQVHb1aYfvU0qZ1UyVpFd
 j/sQEc+SDQRQS8gD9bJ3mLz1Kql20AarrtMgiMy9gqP8UY8CbJiofd7o0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370088812"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="370088812"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="748013064"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="748013064"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 12:06:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:06:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:06:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 12:06:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 12:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN8nBH5LvTEBIGQLdjOqPkpXF2/xoU0l8+Gqx3jthj+Sycce1poJow+p8Tji61YnwmuF64ef8Wgnms0U2iHnKHvdk+YyCYXqwJgVpGhAFTL0KDQoEObKxdz7LEcHUwuZ8TD06x3rsZPJC7zvi6uHqme2LdlDzIyaVSddWLNI7S5X9QaG0yJBsnnfZRHPY0G+r7ieohyUVEophxXevFjLwiXEeOLXKj9qoU+Wt5onBj33CWou5gUQ83iTLUE6y9q7T3Qzsoym2fLymkXpDZKYVOw0UMw3NdGNV5C9kpH0al5dKa/3/p+wVgfZhhumZWsfnkh8XL7rZimv+hcuyHLgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi/YZy1tZHs7QhyDNWrxp/mBHoDodLInsC7WiBJa+GA=;
 b=K/gaQv60Qm0FOhZmberYLNpmfq1yOuCJ8EBHFUWp/IAh90t2zBAKd5uIp7Ej0cAAHZA4TDegaXpkeh5iFDPn8Dbmp+hfutF6Y1jGiJmkdaCANysN0Q9UooixutIOe5v2+qLbyufeL1dsTad6dBkMoKTxtnypXThUAaq/wdkVt6mFRpV/VsBiprQP2A2U4DCnAIiJ0BgKXS+5yNHWc5iujqwuokjkap9WmE/dYGSEc7ywyfZUGk/VnXAmp7E0rio/p0q4iOO4XWL2pCbN1t3akW9XIOrsa8QBWWp7EnOMuoe1qw3MrUrjx1mj0iH0KJviiNbyVnw4DR4JZ3Ym5dXb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 19:06:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 19:06:04 +0000
Date: Thu, 12 Oct 2023 15:05:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Message-ID: <ZShDl2VRDu6iW3ie@intel.com>
References: <20230919094737.743358-1-luciano.coelho@intel.com>
 <20230919094737.743358-3-luciano.coelho@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919094737.743358-3-luciano.coelho@intel.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ace7af7-b1b2-4fcb-eccf-08dbcb564819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RKNfKgJPtPnE5g4146PwXzZD5nCKkyvpHcH+cLdda1BnkqTQLeaXj8g/18maJ3NLFCNUdKui10Lm9dUNRNWcRBPSAHVOA2ox+35Ry7QIxdj0ykg5BH54qHlUYa1PqfvNhcvxVbmc3xyj05MRhbV1K4deAgpmRY4miXiQrBP0pJYaxHwdzQ8M1qA3RRRu069zkUoxZp9UkK9qtfUab71eG+zglOjOv514jJDPDMlRzdwKiuM3mEqQ60Qibe3vbUOr0O8/uPtmOWzfiDSCnV0vDar2QGaoamU7Qsu3Fz/v4LpEIEofdHgiW97a1hiAipDzmtijCvjCvDkEfGOv2BY0JPMNJUMBxeC/TwZKRcHd2cKEK34iHQ3/RssYJ9ipYTkUzglH/IJdcWp4AUFE0HqMNS4MSMq2LDx1RZ3r66h3dMYo+LXrV2S1zdG9hhqc5Nk9yNIFyRzfsBLi9YREgLSG71XIv033p9wm3rlKNolyrrxDqNMelhtgCb2dKf4H+NVBnxaErvFnUG2il4bpFuP7BIJFq5Jg80yJn+MCmJjWjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(316002)(66556008)(66946007)(66476007)(37006003)(6636002)(6862004)(4326008)(8936002)(8676002)(41300700001)(36756003)(38100700002)(5660300002)(82960400001)(44832011)(6512007)(2906002)(966005)(6486002)(26005)(2616005)(478600001)(6666004)(86362001)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CzaBfaPvNgbx10GbXD4QXqwHOCoaLjdZe3/Qn4JnRHSRt9IpTUES4REw9vuJ?=
 =?us-ascii?Q?g59Dcc7hvTEwlpUJ20VxcQCT7inNVwY6dtrHYM3nXwekv5RB5Kt5lPYZOrbN?=
 =?us-ascii?Q?aXJTnSsA3HbhzTbCqJIFr0mz36aSzZs0Nrl7/4e4owqua1cCsjpmAmDARPdc?=
 =?us-ascii?Q?sGPjmYLi6kopIcMkdmQfudCAX6Oq9rdLuCU7Py1XJh9JGtwArO5Ym6si2e0A?=
 =?us-ascii?Q?J+Z4Qm4B+scNVB+fWjTuWPg65YkfNB6R7bo0K0hNDmX6xe01KuW/g/H4ZaKt?=
 =?us-ascii?Q?6KKqSp0sYCv5h2sT9HRxxRvDqxsdl5G2RD8ux61QDkuBzWb853h63QIV0yp/?=
 =?us-ascii?Q?6fDJjSe0EDo8GZ0yoNuUgNKNq6oazMlWoRffJxubmSIWaXzaMkE8BVuZkeQM?=
 =?us-ascii?Q?HCzEYONv/k7cmwkulmIZ/XkpjniDiAQfKXDSAGZD6boCE7ibgZnq/943RRlk?=
 =?us-ascii?Q?mfyAIMZh8TX+r8Jr1FX6CHiIhDX1l22k0dD+9xX2p0UiksSpTzpbotuoSm1t?=
 =?us-ascii?Q?9egwDMeCFvRNjVsEtVv8eChIjEPghHBLwR6a3S/VmlACzPflHZ6TEUTtiucp?=
 =?us-ascii?Q?OJmNjYPIOPV/3gra2pMv1WmPBfcgZjFhikrzEra+yQW8sqNlB7dRtlmWMQ0K?=
 =?us-ascii?Q?H8nC8TgYWRybXX2kB9b6RdfHMYAs8yZsgIcia9GQxYkUNnIXWpM4SukHfWd4?=
 =?us-ascii?Q?Tt1qdHRbCUNrANhDENhMe4fOPCxI3yilnkpAg9lzdap2Kk1x4HcGL6xDjtFV?=
 =?us-ascii?Q?rG6xKn8V34duVB7xrXdCyU0amKKXDmVgxV0GPC2X7V/NeEig6S6B/OmQwdKU?=
 =?us-ascii?Q?YHlaYfTA5H3wSwFRhGVDeJbK+/8Q+I+Yducf68xiC0BMO6CncOmRSjPzlRa/?=
 =?us-ascii?Q?+X3+xsYu78z5oXoqmLTAU3hxkpnXSQD7Fi8jt8oxaDSPfdFGTEUuEPKnvbGd?=
 =?us-ascii?Q?FonFJOOZKRJ0c17Y2LRhCKS873qtnnz3TI075focLxmDae6MTshazsAV0v9i?=
 =?us-ascii?Q?sRu9Bx4Jv0lxUfYMeqZpSLla3bcWd9eX5VdSlBo/rx1C+E3IUlCMBMo3ZY5i?=
 =?us-ascii?Q?JrRVVZBp9mTewMIHJ0VMICPWmE2FsMyy1D0ahLDGfsSFn8HtXJTpiI0IBy5i?=
 =?us-ascii?Q?8fD5S5YZsRIEaf9rY8C5VD0D2za9ehYhCRg12/0QJ32Of6px/VFOutmrq9c6?=
 =?us-ascii?Q?Dp2Df0/uCbS92g+fCuCtL0zxBtgSdeWrCO6TtXkIu9i++hbdI+xM65v9XjLr?=
 =?us-ascii?Q?YlO5XAz0C2a2NYpx+SXqLIqmPeLIEUprdNsl5ok7SHhSfn3i2LQWmYS8rfiT?=
 =?us-ascii?Q?yqzEtGRDGpmRzvtn0i6D2U3OImX2JwjNyHApmDn/dci/mZDjWIAWACTxBopB?=
 =?us-ascii?Q?UmTIfnZ4TTUxGz8v8WteJUHbte+Y7abMOxCmVobyLiul+9pQFnbVtIMFaHlZ?=
 =?us-ascii?Q?2stDDQBfkAa/+5rHqYk9aw65/AcUynxkL/CNEc4eHwbpnT1Q0OIE3r/feJjI?=
 =?us-ascii?Q?//bEeJ3i99LvpNSGt9IwB01jQGCnqS9vw4Nf6FTAT4xlzY7V+OlvCaGMinyy?=
 =?us-ascii?Q?6JDoV+FCw7o34P0VAKGTqvlHe4drkxZ852USxjLw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ace7af7-b1b2-4fcb-eccf-08dbcb564819
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 19:06:04.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfQSdzC1zkAkrWO27b4v0JIqLvfKKGkCqykuoMlQeBGe0j2UytzkdSE9MhNFYr8awyNOoNVAlz1gvIQwWKHEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/i915: handle uncore spinlock when
 not available
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

On Tue, Sep 19, 2023 at 12:47:37PM +0300, Luca Coelho wrote:
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
>  drivers/gpu/drm/i915/display/intel_display.h | 20 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_vblank.c  | 31 +++++++-------------
>  2 files changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 51eb65109d39..fdf9ff68a8a6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -565,4 +565,24 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
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
> index 416aa6749eaf..97841fcf5b0f 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -292,11 +292,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  	 * register reads, potentially with preemption disabled, so the
>  	 * following code must not block on uncore.lock.
>  	 */
> -#ifdef I915
> -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> -#else

A patch like this should be done first purely in i915, then ported to drm-xe-next
with the proper clean-up.

But at this point, I'm asking myself why does display code needs
to take the uncore lock to start with? what kind of races or serialization
are we trying to accomplish with this?

Trying to understand the big picture here so we can try to find the right
solution. I mean, maybe the right solution is even add the spin_locks to
xe_mmio and make both xe_mmio and intel_uncore to export helpers for the
external locking mechanism?

Although to me it sounds like the pitfall of using locks to protect code
and not data: https://blog.ffwll.ch/2022/07/locking-engineering.html

> +	uncore_spin_lock(&dev_priv->uncore.lock);
>  	local_irq_save(irqflags);
> -#endif
> +
>  	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
>  
>  	/* Get optional system timestamp before query. */
> @@ -363,11 +361,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
>  
>  	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
>  
> -#ifdef I915
> -	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> -#else
> +	uncore_spin_unlock(&dev_priv->uncore.lock);
>  	local_irq_restore(irqflags);
> -#endif
> +
>  	/*
>  	 * While in vblank, position will be negative
>  	 * counting up towards 0 at vbl_end. And outside
> @@ -402,17 +398,14 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
>  {
>  	unsigned long irqflags;
>  	int position;
> -#ifdef I915
> -	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  
> -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> -	position = __intel_get_crtc_scanline(crtc);
> -	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
> -#else
> +	uncore_spin_lock(&to_i915(crtc->base.dev)->uncore.lock);
>  	local_irq_save(irqflags);
>  	position = __intel_get_crtc_scanline(crtc);
>  	local_irq_restore(irqflags);
> -#endif
> +
> +	uncore_spin_unlock(&to_i915(crtc->base.dev)->uncore.lock);
> +
>  	return position;
>  }
>  
> @@ -534,9 +527,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
>  	 * Need to audit everything to make sure it's safe.
>  	 */
>  	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
> -#ifdef I915
> -	spin_lock(&i915->uncore.lock);
> -#endif
> +	uncore_spin_lock(&i915->uncore.lock);
>  
>  	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
>  
> @@ -545,8 +536,6 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
>  	crtc->mode_flags = mode_flags;
>  
>  	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
> -#ifdef I915
> -	spin_unlock(&i915->uncore.lock);
> -#endif
> +	uncore_spin_unlock(&i915->uncore.lock);
>  	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
>  }
> -- 
> 2.39.2
> 
