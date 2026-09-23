Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734EC982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 11:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8210E356;
	Wed, 23 Sep 2026 11:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLoet+oR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8970910E356;
 Wed, 23 Sep 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790162421; x=1821698421;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=k+JbexSJ8ToEzoV8IUqOpBcrnQ/sfD3D1Axj3WhrO9s=;
 b=cLoet+oRMy2RW2FFqfT8fG4zx2C1W8tFKxkHukuaGJ+OjwqSi5kbc3Tg
 MzfkK9UXSjABysXrJQNAmouKWjplgOEvFBuQ+uz6nA39pGc6+gCaJc3qj
 e0Bfa+JCUjcTDb7sGt87aN28TA+mev1iORQiUbBzdJZL41O5UujVzE3gg
 5FsASJXs+QsEJOSK3GyOMvBbcD96eP93laWcIAP/EC0NOj5KcPrUAGrGx
 VX7Ew3+kIBUNFU9Y8z9EL0upsuA1Qfoat2QR7tXQpERqg4oMBfJtdDJ/T
 t8pxSuzPVTajvnby7GjFLJoc1LJHZJtp5+dfg1f7km0t3R1/HhKnDIav8 g==;
X-CSE-ConnectionGUID: NPwDYaH+RmO5McLdiOoetg==
X-CSE-MsgGUID: A+2oe6l4SyyXFOdcNok8KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78401064"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="78401064"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:20:20 -0700
X-CSE-ConnectionGUID: 83SN+4bjRVKrDr0tGwAr/Q==
X-CSE-MsgGUID: r3zz7t2SRyuoUAwGjpLwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273740635"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:20:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 04:20:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 04:20:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 04:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLGuxDl3eq4rTMsUKyb86gCecZuw3TvmevGZqEym263sJgc1+dpcycnkbl12J3bjv19CAlld3t6/edXbL9hmOvFGKGvwlPDt11m0FCZMb9hKPJ8gfgUOc7bcm53zC74vJeE2ngnWdZ6Q28H9pPDbrFbk2kaTOI0yAgvfLkxXKofgxBk/ENuLH6qvMqZ7ADYX6dUiyTUV50xzAAo/VqtpUXrjP4OJLJlTuiclsbXA3zU8ptpBWXi9QAPS34yuhpgyrlmsTbDlELILuXEuSz3chV/x7VoBvkHYoYvoKvjCi4GMppicdaBv8De1XmxTU3gCC85WhG3HsTpt2ACowdXOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97Esg0HL5MRVI74RJNQpXnyxLIXbmHxyYoExDxugUWw=;
 b=MLe7EcRuJ7DXS+kNVg0sq+VkyXsXHJFfwxBPLiCsAOAH/GDsJ3jP9IuMAxIkyvg2zhi4/MqGU1o2r1z0GWx9qCbh2YArucD8S8pPtBoL06r7Guv4Bof6q6f2OBzlWZVtn+GbSO2UWwy5QloXYPRBY/57LDKqgYGrjfLk0bcAk+5mDVXVVBRYQG7AWqMnbgU+dIqn++H/Mg+oBoikGCjTf6XcReHjqjEPo3SF2D6uBGTS51mUh1g7cf93/fuIlH9JOq0aoLVN16r7GcfjfriP0CXAVGnCjIB7MWh36tbDrpmJA/ZJFysPvRx88/U/nzwPCLcFA59mrNDTyex6k/V4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:20:17 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:20:17 +0000
Date: Wed, 23 Sep 2026 14:20:12 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/{i915,xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
Message-ID: <arO17C67JhscLp1j@ideak-desk.lan>
References: <cover.1790089118.git.jani.nikula@intel.com>
 <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVYP280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::25) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c88d57b-a998-4d65-6528-08df1964a585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: vYhcue4YtOGBWWtDfB90tcjsM0x7OzL7tJYEXsAqukodniOQYCsX4cE5xwgsZeOfImpTB/ezEFmo+8Ydyc/1ehkDfhV6xfvwxv37KY6FtQZ5uCRA4zfxcBo1MiJukYl35uaig3cA7Y2R3ae8+BGl7PlHKwY0m5eOQUTvmKytun1R3s6tTtF1/f2l8YIXbgTCBCujF1Xb2DE0Wz7E447WhvQBebG7yFmKP2BByS6Fn0I9Mj9FMXqxSsax7DsevaZZW9+XgBn+zudDdNYXoNNDTHFia0GnPh8SEAnLjez3Q1BgCnXJtzGqeKiMn0vIfdLu3x6NRZUMqUuCovCfQhtapKzjjF8xypUoVLyj2avKxcOiVGb/5QC6eYo0/dNx3PJRzvRTz7r0e/UBxAPvj23pW6J96SGOgwxSydAKSV8a22wiLewA8Jl1NdF7DrAYxtlgj99kpc8loh/rf4a7csgJvEzeIz6vauH0XCX6quY1MQbr+i08j4JM+aITd+RPCT0ih82fM7EgguFAgmRUG8MIHoYy4dEg4mz8ri7JQHxrOlL1iAKNJXVTR/1Oaw4wF04yHZe2nMiLB8SpksNLh3gufvPYhF7UPuGUGnbH4HEIoEfVEe+x6cGAMl5ofjf/Kal6dH9epAlGkAILfBOTV7uNHlGXcV5TZMl4jY0w7kkw2Ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LUN5itOPY9txDweUKwWDvxzgu0pdewvNURpm9VhgqGmjTOGs/tMTVbcLmScZ?=
 =?us-ascii?Q?YFy3IQlKzpTtKV0r6ldLmKmNdCDdCCQJjxykcHBkCfcq2n2Jsk/i1bbfo0uN?=
 =?us-ascii?Q?4GgkpMC0muxI22+ZjZQ7GnRoP1mN5oi+GXmUhBnC4uOYuH3Fp22G3KIlfs9O?=
 =?us-ascii?Q?JM8XcQP5NvjgDaCIDDi/wAV8fRkRg92k4yQbabfTCP8L5uOYQVk4ye0nX3Hx?=
 =?us-ascii?Q?8K4pB6LCN2uBCfJv6YQ5ago9KaQe1QhVsHwgY0+CTLvfNw3QG6wSXUGNIIyW?=
 =?us-ascii?Q?gyCYWA7dwE/7L4gUfSxB4Vc3P8JndNg63oue4DowFJZRo7d8i1QtzwCK4ulF?=
 =?us-ascii?Q?6+oImW5JfMm1+FXhZFPLhNukIsxfxn9DrLRkolaZq3qna1tqg9sNMzIS97Ae?=
 =?us-ascii?Q?W54c/A6Gpdo55V1mYj9Sqlh9HUHgr0tFGabQI5wwu6moiMNAOyAvfN0bx+y/?=
 =?us-ascii?Q?4Tc8777SiaMFpsitx9r6Q+HiJDbpTP2e5QmH/9KUXCVLxpW713PLyK9pQBTE?=
 =?us-ascii?Q?EuOyf6fZnFeNZAaSg7dMHSczbjJ99reKShTv5YHN6IQL4Re1cmzFehnTB1+c?=
 =?us-ascii?Q?RFkDHe24/O5K2m4TQixGCgVZBmIpHZDkx763gN3YoQJGusXMzPbAoN8+XXaz?=
 =?us-ascii?Q?uBTZGVc6QyMJdWwsJ2+XWWqqHp9ld8HcDPnR7xjmHMCc0GoRpTfjKk/BjbUc?=
 =?us-ascii?Q?TIIIOd2di9GuANqEDr7oeuVw01Cy+XsCc86blVljIwbGxvlyhp1poJCUgQjf?=
 =?us-ascii?Q?g9a85ST1cFB4F1g5kzwzH3j6MwTNx57COH4tL2jDui+en7fugoaxZ+e4F7lE?=
 =?us-ascii?Q?Qy2roCBrErV9pTgoGDLyF6aBpiJENy7IokJHydwrrqU3DAuihTEgP+FGzb/Z?=
 =?us-ascii?Q?cg6ZnyzjyuBplK0p2LGcyYy5ReQ3MZk+ex62/IliRRAt4hKbrYFgqFhgGmyd?=
 =?us-ascii?Q?IgotXgKr095OQTzb876c76q85rAFjt/+kLdhtrziR1mPWmnjyo/NAyqK+T/C?=
 =?us-ascii?Q?3kjxGM2TqoM7c1aQ1iO5WC57U1ogOWYGjWPxo5gk2IRhbDgwShn54QeYvWMM?=
 =?us-ascii?Q?d3962rTe+2+WVwo4mUQAnzPKP6h9jwXYdHirq46QikwEcOor7eFFLLPfeAa/?=
 =?us-ascii?Q?Uni2FaN1r8vbGkPAibfUgDu+yJjgu0Ju6itFzDey0VFRQktWYhu+zATQvOp5?=
 =?us-ascii?Q?9HEusHIbCvtnnsZ3sf2GooliclL1gXjiW8epDgd/d+KHbzE6ARSvxez6D/yl?=
 =?us-ascii?Q?aqzJVyO6k/1WiStO2lOyz7mnsNaRIPQBmTRbGqejtMJcSoHHlBSgpjjWHCQp?=
 =?us-ascii?Q?kRmgINMSgkiQA85dj2mWwUK4xj3i4tY+ywY73mTr0tZf68RqhIw/IEfkRezC?=
 =?us-ascii?Q?9c7RZ5VhYUdmnLGo07oKNgy155uFTPNuS3HDaAx6OZZgDf+3o7wKl7FX+eW/?=
 =?us-ascii?Q?dWp0FGQgdjZuT7SkOTdPOb/koZ9LaDoFUfuubI5tYEeSwUFhLfU8qL8DZzih?=
 =?us-ascii?Q?uo01oL3AjFPOkGIy4zB6Peqav3eB1hPB/f3dqb0lc3bgNlXJZ5VKqYsLFckO?=
 =?us-ascii?Q?3Hd8+PECaVLYIuqtg95kyLKSTs6IpfKiRSKIUIgWUlRZ5igsrAB59/cZ4YnF?=
 =?us-ascii?Q?oDVbexw4Ef9vEMf2FzaRGwm/woJ43vyKMRyDbH8R1Ma138GXQw+QZI9i0A8S?=
 =?us-ascii?Q?GQCQ7TjmVLncfByMwn+ljmKOdunJr5aBNqhxou9cGW8JOvck6J1hpYBeNwCK?=
 =?us-ascii?Q?xAXvMS3OTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 0OT2gXyJjFuB3KyIMghzbcHyO5xpVeLf1lYKTY0UrtGwE4e1ICcGLxvUYYYYqOLtj+8ep1Uo1vpeQ3qGQX2DQJmDvNQ16FCwTwfs6b2tkDPMR0O5ss9+xz3P4Li4OQDjPym2lhfk6yUqdHB6K9EEWv6rAyeJIhs/3S7jEt12mgsKK9pgAlnziuDxgL50RsViQVTs0JyrvGiRrqYpAHiW81eBohYBiAy8ub/OwvyswnzbcYFrr85+tGN1INlltjUpYJ4cLplv7ZHaOx7+XExKFTaAGWO1uqzU+Fk75wCNOzIamWeZBnBz9x+/+76zmGQVjhct3BzFvNd5Xe+0uqSGRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c88d57b-a998-4d65-6528-08df1964a585
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:20:17.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkt2Sdzp1Ar9lVZoiB8hK0AaW4dkQ2FIv5mDsT4+hkMvRy77W5JTiPLtZGvuMRyKNDMTnnOViRbSoZNweTJE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2026 at 06:00:50PM +0300, Jani Nikula wrote:
> Try to unify the suspend paths and behaviour by moving the
> intel_opregion_suspend() calls to
> intel_display_driver_pm_suspend_late().
> 
> This is a change in the suspend sequences. The idea behind adding this
> to intel_display_driver_pm_suspend_late() is primarily based on not
> having to pass the s2idle parameter to more functions than that.

Imo the main reason is that it should be called with interrupts
disabled. At least not sure how cancel_work_sync(asle_work) could work
otherwise.

> This also changes behaviour for i915 hibernation, going for PCI_D3cold
> instead of PCI_D1 on hibernate. It's probably the correct thing to do
> anyway, I don't think it should matter all that much, but fingers
> crossed.

I think it is PCI_D3cold for i915 already before this patch, since
acpi_target_system_state() is ACPI_STATE_S4 in that case. If so, the
hibernation param from i915_drm_suspend_late() could be also removed.
But need to check this more to be sure.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>  drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
>  3 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 77009dca7d0d..abab457bce3a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
>  	if (!HAS_DISPLAY(display))
>  		return;
>  
> +	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);

This leaves intel_opregion_resume() called from
intel_display_driver_pm_resume() in an assymetric way, but I suppose
that could be addressed later:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +
>  	intel_display_power_suspend_late(display, s2idle);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 9e047c27a153..293099fe6639 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct intel_display *display = dev_priv->display;
> -	pci_power_t opregion_target_state;
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> @@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  
>  	i9xx_display_sr_save(display);
>  
> -	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
> -	intel_opregion_suspend(display, opregion_target_state);
> -
>  	dev_priv->suspend_count++;
>  
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 184a5a237880..b013ec00b75d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -246,14 +246,11 @@ static bool suspend_to_idle(void)
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
>  	struct intel_display *display = xe->display;
> -	bool s2idle = suspend_to_idle();
>  
>  	if (!xe->info.probe_display)
>  		return;
>  
>  	intel_display_driver_pm_suspend(display);
> -
> -	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
>  }
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
> -- 
> 2.47.3
> 
