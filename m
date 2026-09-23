Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAC6C982EA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 10:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07810E0A6;
	Wed, 23 Sep 2026 10:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NX7KQvLK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D150B10E0A6;
 Wed, 23 Sep 2026 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790159841; x=1821695841;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=oqluRD+ljN7JGy3yNxunpmXhWBbNOffQA1xcIdzL1V8=;
 b=NX7KQvLKELUoCmobRZtUWT2gTcKWWlXgUmIu6gOJQc7S4Dsw+BynHamT
 2FCyi5s6fjSuZ7YAfDEoea0D5WP71Qj1tBqUkRlxQPz2Dd6be6iOIQEz7
 nEaCQpQGkO4nmdoOgYQpe4/+xH8TWyII2zqxGXS38UaGeau4DmCzdpHgT
 B9T/BIKVCs9TYBdsst9nExaUZIxBMmIAgF894IIOhBf8po3UC1+Z4nsKa
 UBIEA8gwJ9wZhipG9wIsiX3+P6MmvB20TLjAIY9Us57sr9s38HOJnXmIQ
 fwCLsuGyCSXNjGzmqziefo6LOu3V1l3ttpxnAjj23weRmCY+Ql5UU2iru g==;
X-CSE-ConnectionGUID: P8oy308KQPCIqBveXEKUkg==
X-CSE-MsgGUID: y8hbO9C8QpyUhlXlEmeJRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108337398"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="108337398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 03:37:21 -0700
X-CSE-ConnectionGUID: WlUT/va5Q2yl9qGMp55VgA==
X-CSE-MsgGUID: MXzkRK3sS+yiYZzTJr7BvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273724795"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 03:37:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 03:37:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 03:37:20 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 03:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNRBQ2ObymTukZky3ofMBUWT1jYzibxjt9x6N1hYsANy0iF7iF+dm79+XdtEI3vwO+mu4ZU60e9I7eA+4sznDePjOvG5HCxabGevf6dMOtRzoAyTRPKpDk8F6JyfikKLLQdWirdY3KsuiELOHkgT1yK4IDgb1JMx6JaBxvGd5Cmv0koGDlyah1/tL70rp+9TB+kQJW9ZE5/2ZYRAChkPJe9IOUyDqNwCRivZuKjO8+/uDwWQPhqfzRAnzn822CiljZt874gUYsixo1jQtyNKeMAriPsAx4yU+0kM7EZAjvLjA1mf1rin+8iEPeYKWnfN6SjLIs9fl0wspGPc11e+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjv4rruknC9zDw8N44XRmn7OWfcp0iTcugp8fyA80BY=;
 b=DmsP6pHI21D1Z1+wadJX2eyzucsuGWGbBz93LVxgdLIoI/sj6Ifm7c8+4aaXSaNuPHKsqxhIQjGc77vJqZWR8b1v7Db1WCaFNsJuygGT0n+HGapiSncBb3UbSzCcnQTmVbakkd+ySzeS5xezSS4eXeRmmWhdBaghrNbp/R2TRWTHHWBkN8zqymhtv1FJ9hYQDyPuBKh8Mn6v2XZJxdDEFqlxX35Oyv325VAbwX7hT4viWRGQ11TACAAqaYmCwl4ZO8gQK++iZDPjBGbHgvQCZAzFhtpRsJ9DmVZ1Nw/kAVpbF2+MNceFeJv+mddGy1vRlNOcfDBbKV6TGLI2dyG9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by PH3PPF248AC5624.namprd11.prod.outlook.com (2603:10b6:518:1::d0f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:37:16 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:37:16 +0000
Date: Wed, 23 Sep 2026 13:37:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/{i915,xe}: make intel_dmc_suspend() part of
 display suspend/shutdown calls
Message-ID: <arOr1sYWoQvHVC5l@ideak-desk.lan>
References: <cover.1790089118.git.jani.nikula@intel.com>
 <0b8cb03babd960025f8948124a9d99358d8cc0f3.1790089118.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0b8cb03babd960025f8948124a9d99358d8cc0f3.1790089118.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3P280CA0056.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::10) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|PH3PPF248AC5624:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2238e3-4b3a-413f-7a7b-08df195ea2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: jL30rwblJZv2IG7CGlNORuyOBJLxhMp0eb69CVb/4pP8F2xVwU3zG2RTj/yEADiYg42nSU38asl1WW+jWjxFAcr2HzBglJ7USzZ5LXIBLvw7QpDrgw/hEQZN9uYSiyjfjjrTe7oh1qogS/UgaYwqiJLK8tOdF4IaTXW/vkRlolXIzzaSHvFoboOOOte5lFawUD0mcJx/WLhLNFai/L0yFfAKrA3oE2D+fFZWgxeZioJn9PxxFnkckx0T5bF+OtxqP7B9LcCrTs9Yt7nNl1cJOTr7c2KSCailHmp0ckMNfyKy2w4VNeHUkZHpj9SNkMWMGWRR54vsLuZmrMAzBlcwjytxIJVBtZUOh88l38yZKlozxFVGkfjA4CF8K47w6zA8DKw7MBZvWV4Ek7S94aWDWE4b9irWJ3ll7c1f+T8Tedhjf0xAW9rg5mi8E1LShF1Wapw8OvGeFxdzgCve9qEKYlYcCB5qxl0W4/0kITiDjAV25iLMiWJcLQIK3DScGHijSc4uodMCVIzCWgmb8e4mJagiN8UTuEwhesTydYN6hrUYViPfLI37hK/kBi0YLpXkA5y1aBvJyolDAgRY3ATOz0JzaFoLAiNtxIbeX9GiT0txyikdaQe7+ywubezVXBvAxX5tCRlx7jdXHfse9yrRU20aPY4jQIQAHOkMV4erPWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+lLQawMRAFMZxeCeDCBdXsSHqk+lhqQD6y4RGOH4jy+g4nMTaOdicI9y//Sg?=
 =?us-ascii?Q?vONIbFm5m1obygWC/PAx6FLq95TIVtd0rzY/G/jyA1b8l7oXOtWe+CZEWykG?=
 =?us-ascii?Q?mE00rEbKmOCveTYh4aYGQqg2+4XVSLo69L+1PVvTMTkdFtiIfCLmuxpKhbhf?=
 =?us-ascii?Q?WoNpMVfpVqZxChia0TDPC8kH9OzxjLJKTxrdIkfwbj6MJpiAHjykr37WO+EN?=
 =?us-ascii?Q?K3/PSt5VrTdEpuux3kJVSBb8Ape2DkbB8XlLkJJY4gDKZVsUas2Yc1gH3m3V?=
 =?us-ascii?Q?ir2lwBbwZX42Veln8oxs4pUZLlVszQaReSZjWZB4mynTHLTwewInJ5F4/sRy?=
 =?us-ascii?Q?JuGWnk5Kd0Q2MPEO0TLWZsBb5VsMdHT5FjYhff5o4Lozev2MEnxMmLaqGR6K?=
 =?us-ascii?Q?a1ivFF/Vg9Kuf2P5Flgs8q3lCyW2P13bya9R0gs+QHppG2HaWvGLyM5yFTKZ?=
 =?us-ascii?Q?02HgM74cPNxhJsT5XQnJ+cPrKmX+K4Ykog4kgUxR5PJ3v/wcikt0gHGtt+mF?=
 =?us-ascii?Q?Jm4Lof0ZPXOGuIeWFq66qRFiApUxrhAeIyzptjPMHYKGS2ZIsQ4ySZJjOO0I?=
 =?us-ascii?Q?QcS8xNDffbXWrumEsb42Pkk1eyAQF8tbgbR8Aru5yNFuUarJCu9CMXcspCuw?=
 =?us-ascii?Q?u5mqscdqHCv+KKJ9EP34vKpXQTL0DYrsleNB+WqVnvh02oKvIJR2ZnsoCpf+?=
 =?us-ascii?Q?CO8UklnNHUEAvEQJ2L6eIXogammqd4MTj2C83I4Aooc3cmJD+wNEm/uzx/1Q?=
 =?us-ascii?Q?e1ApcY51tm5hLoShDHVEvrLA5rPa5BRYVSySAWREqqCEvF4lQDi9V9oX6+26?=
 =?us-ascii?Q?klyhmfoToA8TdJrv9qdSYKjnJ2Y9PSBRYpJkyTjXFWmGVlK6L2r0uqGzp3ZI?=
 =?us-ascii?Q?Yrpw1sg45YR/2715lNeiN/xfD3LVOLZgJIK8ttok0eH+bPBcPcUA5/58qYRh?=
 =?us-ascii?Q?vxbNRKMdGIvfF5WQAEYuDbFc2zMY28Fz3jUIrjkvokVGGwVMabV8cePX4/HF?=
 =?us-ascii?Q?/zfHsMLOhiYYJfvXg0XkYztmo7m6NhzDk5zA5dpQg0VwmEzED4tiAp5u+uZM?=
 =?us-ascii?Q?1noRkOWjM8uV52cre2vZCCfyWuKC3wAzsV+p1phFNdCz6+MGDJBmfFczapv9?=
 =?us-ascii?Q?hPcDDi/G9XhdADvoogrZ0oI+8CrQjf3daFAj4U3R4JULVeQ9qMHN8YtlrCf7?=
 =?us-ascii?Q?L8oVDh7paxaBWbZiJuee4+tawoBhsjl1glZjCNTVpmj43QIb1LfM0f+i0inC?=
 =?us-ascii?Q?3aTbYapQGJrorc3EhGQSkh12lasu7T8CNM0lr+oBUrca0LffAB1JmcE0Fat+?=
 =?us-ascii?Q?45iHXUoaxhgCoUgYyNsU63yqHY7cYgZmB5UehtG/+pkuSTTogYul0eBHZXw8?=
 =?us-ascii?Q?P72vVu2VV+vA9evAt8SzcPyPrEMZh44uUUFnHiivDnftqSvaWYmlG0s+VbaL?=
 =?us-ascii?Q?tqyvM0s6dxe5SDkeHdTARDYOJSOKLT1HxeR6TO+CeCf5xzvNP5Fx7vuMdUGa?=
 =?us-ascii?Q?CzOWpVNx904IoOED172Cd8r9kWyu83NiXomxW9Or+z1oTz4l6Dme4ErisZ6E?=
 =?us-ascii?Q?lxEwmz7fHh3mVX6BwcxAGHnoTC4IpkI4YezM1i+dWi5AtHHcwg0+sv0nPJFG?=
 =?us-ascii?Q?cboZFlGqbpw0GogOL+DFvdY3sCprIXMR2p7ii3fZRzCQN9WRdke1xUI3Zkwa?=
 =?us-ascii?Q?NjJ9aunWv8w/FUQ2C1jB044jDnSDro2yHoKjsUoN02aGd06/W5FQjI1GsvR1?=
 =?us-ascii?Q?MUmRWgrBHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: WQ0z5qVrAPYb+GrqxDWWff+5clyEN+YvKZ0nWs/+g+cA/V6444Nw7pOTHsjMminAqjKTe0thN6hOGJD4YWm4K4vhAHfZ0dkqO0qhqvJhnxRUYH6EAIIc80EA1E/0367cYpmmweoH9gq0wwYYypzUNXu4iXV619c/GjAtrYt0lhjCnFLi/uQZt3x4pqyQHcAH2aKMfWdmz82j8At6QtupTpx+2FM1YOqAoq903zemlO4fLzKX6CpLCvI+6HFySQqlFjQLa7AN2F/jQPyyczGe02HCdoCNxNNiPWkMarXXEkten1HPtjGAdjXErcp/RRIgPoevrD+l2fHaDbYCKGiXhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2238e3-4b3a-413f-7a7b-08df195ea2f0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:37:16.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8axwG7RFb8ykAikLdE7qHH6vy9YZ8ZAnIuBsQRcZMHLBPlZXYLB/UJfkfOM5htEj5c9pVsqnf+UnUiT8SCJVZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF248AC5624
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

On Tue, Sep 22, 2026 at 06:00:49PM +0300, Jani Nikula wrote:
> Move the intel_dmc_suspend() calls from i915 and xe suspend and shutdown
> hooks all the way down to a shared location in
> __intel_display_driver_pm_suspend().
> 
> This is a change in the suspend/shutdown sequences, but hopefully one
> without problems. The main change is moving intel_dmc_suspend() before
> irq suspend.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
>  drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
>  drivers/gpu/drm/xe/display/xe_display.c             | 4 ----
>  3 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 70d112fd4287..77009dca7d0d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -768,6 +768,8 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
>  
>  	intel_encoder_suspend_all(display);
>  
> +	intel_dmc_suspend(display);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index ce6d20958320..9e047c27a153 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1024,8 +1024,6 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>  
>  	intel_irq_suspend(i915);
>  
> -	intel_dmc_suspend(display);
> -
>  	i915_gem_suspend(i915);
>  
>  	/*
> @@ -1096,8 +1094,6 @@ static int i915_drm_suspend(struct drm_device *dev)
>  
>  	dev_priv->suspend_count++;
>  
> -	intel_dmc_suspend(display);
> -
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	i915_gem_drain_freed_objects(dev_priv);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 7b25c0814674..184a5a237880 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -178,8 +178,6 @@ void xe_display_shutdown(struct xe_device *xe)
>  	intel_display_driver_shutdown(display);
>  
>  	intel_opregion_suspend(display, PCI_D3cold);
> -
> -	intel_dmc_suspend(display);
>  }
>  
>  void xe_display_shutdown_late(struct xe_device *xe)
> @@ -256,8 +254,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	intel_display_driver_pm_suspend(display);
>  
>  	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
> -
> -	intel_dmc_suspend(display);
>  }
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
> -- 
> 2.47.3
> 
