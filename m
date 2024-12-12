Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD51DE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 14:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999BA8935C;
	Thu, 12 Dec 2024 14:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gcy+vlmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4E10EE05
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734014014; x=1765550014;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QA8afIjYJWFug92imU+XZwaUeUKXOmdG6vtb+8ufqAA=;
 b=Gcy+vlmZU8awGUiXx8y0E55QJlzy1IT92GRslOfJJoz+nxChj/7wJ1CC
 gV3XTQiGb70CdUZmPyPlbaRBVKTAUaA1gVOXpUIXcG55KeS3XR4z1O1it
 5hvGjBfZh6Dx/IuN6JetcEXdidh9Ie2GMs0sPuB0Atls3Z5Kmr4Qpxv0h
 6MLP/4DfbKIyrnpVuJWYxSHBoloBceEN22s3knspeMX43YHw39RsSXswk
 RG55yWHhn9DYE6UmSsnkrCgugHHw3aBhQb5RYiidlSFkF2DNLVx7DAyMj
 IHz0g0zSfkjs9pOPnyGyvlQBsOdV08Wa57K6g6MO/7Jrql98j4RkFckAd w==;
X-CSE-ConnectionGUID: snM+/5zORQCEbv/bBmmp2g==
X-CSE-MsgGUID: c6GkZsMgTUiCoqnHUSzcxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34561083"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34561083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:33:33 -0800
X-CSE-ConnectionGUID: g0Hvr/c5T7CiEwlZmNcDjA==
X-CSE-MsgGUID: xg4D9YsEQoab9zj69o9y+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="95989329"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 06:33:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 06:33:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 06:33:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 06:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgDddQY21Ca13jJL100PKLe09kHfYK3kAFbeV8fUB81gGRe1ZGrlCi4z9LcylOlHF23tod3F4wwY6U4WTpTyv2rut1b6RaGPugrRc42DTO0dLkgD7LIbLQo2NRqqVIe2T+zYZW7vsoe5cRqk0iLDR/lUY/au5ioo9WRV4kkzXrOKn8iUgczn8izZJX/80SvXSAhvfHqGZHfHLon2S5gOT32yOecc967mate9Lh6V17p1VzpoQP83f9TInWbqbMpidWxwpTn8QD8eQmlg/8eNR5Sj1Opr71tACV1O+nUoLuy4iwxi4pEh2AGs/9oNze1aaNlgMRAsvYkAmp0yGRvoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfVAUpAVUVqtdUU2rAZJovLl7faZSEfkgNwI6kbH5+0=;
 b=NsiGNoLNeRTZpI5+MiSHAmxSowfQ1mSjIgPDDHptKomtfx1uwlo61yAilUFDr9+JpP2YmL+4BWaWDsX/unVI4cMKa1ejmK6brB344J58WVKKvg4sSLOxE+720UbZszAcZZ85id7/N01H0kFX4cPEsSBN70mjMxgyceayT9cc3kTCVzn1LU8pWHvq+nxvVzgYznxWLB3A1VxGC2A7YrdGV8/vzXsse8A3atSKhgiJQ2LO0gbhTGC/ghzavuZ7C9aMYqilVtOUHk2U9Ud42QvBeZxw9x91oplfaKoUHEgW0wMjCsEYjPP+78zXiLxcMEaxM2xZhl9AmE2eG9ME9qxRlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 14:33:03 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 14:33:03 +0000
Date: Thu, 12 Dec 2024 09:33:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/11] drm/xe/display: Add intel_plane_initial_vblank_wait
Message-ID: <Z1r0HMyS7wl_iSx3@intel.com>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-2-dev@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210083111.230484-2-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:303:b5::28) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2f2d4b-9a2a-495f-cfc3-08dd1ab9e2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VKkE6Gc6w2u95dAkzJhUtvUppYJ1vneDNIxSr4hr2O2Mn/ii5ahol59Jtj?=
 =?iso-8859-1?Q?E2EHxl6KubJHaYGaOAh4TQD9K+F9IfCodq3TbFbWIMArM+jeWgoHu5vtdT?=
 =?iso-8859-1?Q?zpxrFzihmS8n9hyurYtU6NsqzI8dXkvQwb6A3SCE+X1sa3QiT5QvbSUOMs?=
 =?iso-8859-1?Q?Gd14GMLqxKtHKI7Q71ZLK8oVUxZImlOpJ9/VA6kH4bQayEWxn2qPULDHUT?=
 =?iso-8859-1?Q?HraV/2DFkYb6Ju4mBe9KODYUCeKcMh+XUflhfP3FN6CX2yhbI/y5gAGlGy?=
 =?iso-8859-1?Q?9fOqksOm0XdQ86N5tTyvSqFOyur4mBxSVcZOovnwxOJ7N6K6nIugmfNURu?=
 =?iso-8859-1?Q?p53ivfYIfO8mljLKEy5GEp0RTTtwOjlLAKwKLs7RgPhETWTGbPg9TlCDf0?=
 =?iso-8859-1?Q?3a4VVkLzq9r0PqKg/wFFvsNSVQSrSlHLapg3sHpL8jf+GJTxLRp+11F5Pl?=
 =?iso-8859-1?Q?45gOnXa3K8kNfDbkFU4m3/SRR2JX3OyZhQ8zmE/2ACQftPGHr7fecBZcDx?=
 =?iso-8859-1?Q?vWVqGkVB43TC4GRiTfesjZnFeUmcd4wm7N4482MEKtdPcniPznMIBomYXa?=
 =?iso-8859-1?Q?gotTTa0OHXMt5RgUMXuDMc3vUb5hse+Vy68yTim92M+xVu6NumKiwKW691?=
 =?iso-8859-1?Q?avpbwUlzP3lwVMx3sSMca0fuv9qWvvBTaLwaBkip7z4NfPxXNVN9a3abNY?=
 =?iso-8859-1?Q?Ksuw2AnDuJK7eWGoVD1dg59A9XjgXupHS1i4ySHA/P0RA/LpKB5+s9QQOA?=
 =?iso-8859-1?Q?fLP3UlQ3G6aekCwrLEm5nvjzfVV/FGe2D41lgBV0h1WB5L64bNtEi20IFr?=
 =?iso-8859-1?Q?6aTklMy0TWSVxPWwopwGWvMoMV/dRfk6oUMBZHbYfNjtY+sWfBEGivDLJa?=
 =?iso-8859-1?Q?oZe+hWLAF2YV3cidrhKVz0IARhoWoNxU3DRLYrYVhsMEEq2mEKwOfDrtTu?=
 =?iso-8859-1?Q?a3BjjpOOaXuyGHA8aJniEY5VMVPpp9kUZq37F0Qd0BRfQiw0wJ0cyYaPkB?=
 =?iso-8859-1?Q?lYxnbeyPU07/rrCX8gXNTA3kpKhH6AEzsFYF3wmEiAY0jxe+yH/DYZKzsi?=
 =?iso-8859-1?Q?LLCKR06qpoKs3n1sgpIGtO1qykZPeiS4K9OKhayhKZt6dZZqGgTtfeUp3c?=
 =?iso-8859-1?Q?EpJZJQ5nhmD/GfBWlyHDeJgmjGwNn5qyLCF3/d/9S2lpV8WJZbQ8rpA3Yu?=
 =?iso-8859-1?Q?rCw6NTxzM24zCkZv8iKho/9OhyJFzsHK8xl9bCnzTMleS0Hcskc/Y5i/4z?=
 =?iso-8859-1?Q?8e7OLCwiewcXOippYQ8YorTeZAK/Wm6iRq1hANICtTDyO8Y3v6Whs+5fPQ?=
 =?iso-8859-1?Q?e63rPKpQwniEKFzcTMxB7qPZu0hY/AuQbzkeDrdHzxM9DqeatfIeL7GrZU?=
 =?iso-8859-1?Q?mYwFLxJ1u9McNsVtDMbekxM0loQKmLHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jOndTSuaeEMqjZZhxcEsdRCuBEmWhhpF8mx187XFPlm6xTByZVsyt2o0yg?=
 =?iso-8859-1?Q?HriVk6ku76U0LccLIN86F8QRX0scRWtNs0SCCwp5qhEohjvyNzaCICjOuB?=
 =?iso-8859-1?Q?gir1PQomBxI0orjI5wlEvyuZPzZHWimvkmT/dkljxTFWYLDYHj+mkS0qU1?=
 =?iso-8859-1?Q?3TvLXcykkBfU2cz8k74fgAMVKgBBiMPS66XG/DPFg/9roiz7vd0oR7DAaJ?=
 =?iso-8859-1?Q?thWXwFZjq87kXIB710zqhVeTAPO7RqiQwI/3BuOwRtZ0Xm0XjjKsc713RJ?=
 =?iso-8859-1?Q?8ufQaPAxdU7KASFSvmOaX889bG3TaT+Ig/Bet4F1rmB/5/Qq0okMmgOgjw?=
 =?iso-8859-1?Q?suRRu6EhuOfbIT8hfnDXuWy9YYwzuRtAppEwFC8xP7WED75qRhUoessB+y?=
 =?iso-8859-1?Q?viqCfDweJF0VI7G/AexOm8GVEfvnpvtv4fYH2wue297E0vxQrEFXjAQcS8?=
 =?iso-8859-1?Q?xDnBmBl0oF8afmtYaZ20fp6w4qzBt8nKikSNCZasRcIUkRtw8UOBE1oJEe?=
 =?iso-8859-1?Q?+RPQ0lYyTR9jWKvCheZ9TevDNeCwWCkWObrzxJweSWA9nrTH9JOEHbu108?=
 =?iso-8859-1?Q?BboyQWNg4idykQYt6iYO4u0hKWLQptkdz+DeOuJmIeI8hsqLtu5VUDI33i?=
 =?iso-8859-1?Q?Fb42TEWU64+4S/8RmQLts9MjD72rB2TXyThYGRa6BLfwovyfyC6t8MIPdB?=
 =?iso-8859-1?Q?lqsc09Vo0AM6aP4o0kJKtRdtGl7XobF5R5xwYkuiemm0kuiorvy1TvN8Nw?=
 =?iso-8859-1?Q?3BfDNskO3+BKAwGTz861cd656guSzemfJZw0KhqIcOFFCyRgDXvqXR90Kg?=
 =?iso-8859-1?Q?deWPsL/O5c6TEPhf1v67O7OIm4Z0xdnaKv6WyGa8gTtESl4l1ZEkF38D+f?=
 =?iso-8859-1?Q?1MzaXiP8BWt2+xeGay9lr14548dISjFkHrBpuHj6BPDn8AZJ4JybV213Z7?=
 =?iso-8859-1?Q?4ZBYujDPvQyfJjxRFCYCR/RiC4B3qRJLlNcuWLByHz/n19vJkPTWERjHHG?=
 =?iso-8859-1?Q?u+p5//CvzcBRRxLd1hsY3JJWrhZKLha4jDpoPdjk0Fgj6b0XlTgCeHm4Z4?=
 =?iso-8859-1?Q?aHaqGTiP3eji1R5Lf9h9HEOb46+b2aNoFss4IMaZ4E8dnXxP+9unVF6RRi?=
 =?iso-8859-1?Q?qkpLc3CsUBwuMFw8KMg9ofU8L18xPs/bUPi9W5X1EJ77JzdD6p9GRUy1md?=
 =?iso-8859-1?Q?GMFG+1czw7O79Vm+hf72Muz6zn67ftY2yDhGDNiYvvSX5IWP6SM2kXrIQo?=
 =?iso-8859-1?Q?InqXTcjD8BQy3FB7AsOnVCwox5fwlqerAIsHZb/dYM9QMrudrl1W8xUPez?=
 =?iso-8859-1?Q?gN9gKPCH6pYgi8bvZdCMnZnyBbqgrmUmrKE63LHRLQ9M583wQmE1zVNvHO?=
 =?iso-8859-1?Q?uazHpQD5IixwMiJMCsFIa/kjMVcbgqeus+b1nsLeHdl05sO7AEEy49wuiN?=
 =?iso-8859-1?Q?LGg/QVmFAvdns4xIvgPqhHxvE/onWK6sqiw4zoJ85jfjcyYjWfT9cX+e/o?=
 =?iso-8859-1?Q?2MVj3q3PmDPYyI9e4M1XGivLAbk3NN9xpsYjBKADvD1Xsn3p/MJCetWL8O?=
 =?iso-8859-1?Q?IeFT3uwqpGYZfwrWcfQbiYyLXt8BH+VfXck5n+tFM2x2qf7zf8Nejb+ku2?=
 =?iso-8859-1?Q?c9rsIV0UVL0avms+5095MwCE/bY5ryN6vxdYc6wLfWJR+h1YBdZncd5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2f2d4b-9a2a-495f-cfc3-08dd1ab9e2c5
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:33:03.4255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6LoV7vNzbKEOtWyC4eEjlbgvpUQzG0YirA+gPLudtS9z2qROOcfm6GywYPZXZ+4g05vjLva96blPg+zzAXdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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

On Tue, Dec 10, 2024 at 09:31:01AM +0100, Maarten Lankhorst wrote:

please identify patches touching both drivers with drm/{i915,xe}, or something like that...

> We're changing the driver to have no interrupts during early init for
> Xe, so we poll the PIPE_FRMSTMSMP counter instead.
> 

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |  6 +++---
>  .../drm/i915/display/intel_plane_initial.c    |  7 ++++++-
>  .../drm/i915/display/intel_plane_initial.h    |  2 ++
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 19 ++++++++++++++++++-
>  4 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 35c8904ecf443..a963610c4e259 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -796,7 +796,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  	if ((crtc_state->active_planes & ~BIT(PLANE_CURSOR)) == 0 &&
>  	    hsw_ips_disable(crtc_state)) {
>  		crtc_state->ips_enabled = false;
> -		intel_crtc_wait_for_next_vblank(crtc);
> +		intel_plane_initial_vblank_wait(crtc);
>  	}
>  
>  	/*
> @@ -810,7 +810,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  	 */
>  	if (HAS_GMCH(dev_priv) &&
>  	    intel_set_memory_cxsr(dev_priv, false))
> -		intel_crtc_wait_for_next_vblank(crtc);
> +		intel_plane_initial_vblank_wait(crtc);
>  
>  	/*
>  	 * Gen2 reports pipe underruns whenever all planes are disabled.
> @@ -820,7 +820,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
>  		intel_set_cpu_fifo_underrun_reporting(dev_priv, crtc->pipe, false);
>  
>  	intel_plane_disable_arm(NULL, plane, crtc_state);
> -	intel_crtc_wait_for_next_vblank(crtc);
> +	intel_plane_initial_vblank_wait(crtc);
>  }
>  
>  unsigned int
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index 6789b7f140952..b1675b46e06cb 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -14,6 +14,11 @@
>  #include "intel_frontbuffer.h"
>  #include "intel_plane_initial.h"
>  
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
> +{
> +	intel_crtc_wait_for_next_vblank(crtc);
> +}
> +
>  static bool
>  intel_reuse_initial_plane_obj(struct intel_crtc *this,
>  			      const struct intel_initial_plane_config plane_configs[],
> @@ -442,7 +447,7 @@ void intel_initial_plane_config(struct intel_display *display)
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
>  		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);
> +			intel_plane_initial_vblank_wait(crtc);
>  
>  		plane_config_fini(plane_config);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.h b/drivers/gpu/drm/i915/display/intel_plane_initial.h
> index 6c6aa717ed21f..5c315acda2101 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.h
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.h
> @@ -6,8 +6,10 @@
>  #ifndef __INTEL_PLANE_INITIAL_H__
>  #define __INTEL_PLANE_INITIAL_H__
>  
> +struct intel_crtc;
>  struct intel_display;
>  
>  void intel_initial_plane_config(struct intel_display *display);
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 2eb9633f163a7..a22e7adfb09d9 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -8,7 +8,9 @@
>  
>  #include "regs/xe_gtt_defs.h"
>  #include "xe_ggtt.h"
> +#include "xe_mmio.h"
>  
> +#include "i915_reg.h"
>  #include "intel_atomic_plane.h"
>  #include "intel_crtc.h"
>  #include "intel_display.h"
> @@ -22,6 +24,21 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
> +{
> +	/* Early xe has no irq */
> +	struct xe_device *xe = to_xe_device(crtc->base.dev);
> +	struct xe_reg pipe_frmtmstmp = XE_REG(i915_mmio_reg_offset(PIPE_FRMTMSTMP(crtc->pipe)));
> +	u32 timestamp;
> +	int ret;
> +
> +	timestamp = xe_mmio_read32(xe_root_tile_mmio(xe), pipe_frmtmstmp);
> +
> +	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);
> +	if (ret < 0)
> +		drm_warn(&xe->drm, "waiting for early vblank failed with %i\n", ret);

Hmm, I do understand your point of not touching the i915 side,
but if this approach is indeed correct, we could benefit from broader
validation on i915 side.

> +}
> +
>  static bool
>  intel_reuse_initial_plane_obj(struct intel_crtc *this,
>  			      const struct intel_initial_plane_config plane_configs[],
> @@ -303,7 +320,7 @@ void intel_initial_plane_config(struct intel_display *display)
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
>  		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);
> +			intel_plane_initial_vblank_wait(crtc);
>  
>  		plane_config_fini(plane_config);
>  	}
> -- 
> 2.45.2
> 
