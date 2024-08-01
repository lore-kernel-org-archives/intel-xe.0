Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FD4C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2817910E905;
	Thu,  1 Aug 2024 20:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clV/k60J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580310E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722545037; x=1754081037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XyYRQVRglGuinJ8xW9w5bMFUM9aOR0blIdqtsI0u0Yo=;
 b=clV/k60JMRziOolAWkWWEqNeaKIYZdrf34tjknUVRcqIj02I2v7jSxdj
 BkH2PBEIB5T2wLNyz6Ty21KNmFxtG9bNXZHB7Fz9HsCeNlIAjOgIon4Yl
 nrf5RsJgoVgAbEmmf/d/51gjLIS6cHPT1ZYD2OpqXKAzt99PxAbrTKfAd
 d4mhj7AXCrPmoJgODvW/Iq8/U01oXPZnc+fgisDTJAOHXM1yHj9CYZFDN
 RLBgEQXoD+FHX4RU9T0e7AHl1Ob5punSaNqw6wXgSlpV9O02JC6gXBZZe
 QedEv8UmfIfsTQ4xiKDW1HsZ5Y4uSXC2QQKXibK+pNzjppm7VzKAHnAfG A==;
X-CSE-ConnectionGUID: 6D1uvNqBT5KkX1oFMkOIjA==
X-CSE-MsgGUID: 4woDXswYQhaL9AqxeAnHmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="23450866"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="23450866"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:43:57 -0700
X-CSE-ConnectionGUID: dWO23qxhS1O4FU12cK6bvA==
X-CSE-MsgGUID: n24BDiu3RICNhwQlMyHHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55260332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 13:43:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 13:43:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 13:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdXssAN8fpQs8ROa2Fkvl/q9UrTR4TieD86mz/zTL64+dyU/IPZakFXXNFDXLBa5hKqaW6hraforNZAM7RhfkFR1n7SWs+iCaNxeafNVA2dynYEJV3NdrhpVCCFfgwf11cCo4C13pFCEJp7uDgTELaMz8tnTCLqXEzVloUHRzCYdFKENaZqVkTV4wK9V5FnaO5unnEt2EVbV0WLXNw2kBzkqxlgqpc3w37ar+LSnQNLV7uGMGCSpITIXNs0olqk86br9VpH1ZEm3Wtb3mlKhqndRwGWoZXKXzSS5uVZQ1C/wPfw4yPNEYf6PhbWWRyNAx7eo/wTXKNe11gDrtujPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3ok7A4CwSBiFybGaA39bhafEUwYDLmy5+fVlOIyey8=;
 b=Ur86Ro2Ql+7tLs1A71VzW6cVWj1GChaeiDMBVe22Td48CRLZnioicza45FyqElC95H1p6bMCsM71xdLLS2WUvuamhqZDJhEmVhhueaAzo7GuFaP7oOVa2CHQI67zgbKqLUMBrXDBbUYipyEtsSo6/EW+KkzTu6SRHEhQR0oqQGiJQFlICAbMBlTnSZUvgB9jAhaT/RqXndQajNKls10KY79zjkmafmxSQW3Oz79a+gSGuDI3bZPmPJ7HbDfY1ul0f+g24nled2hOnJka+RVRKSFPaCXc6sWhzTFA4PL2qaIZVLn+nVA2WGm1OqucLYKbUN4dRL+wn9fyGQIvxyaOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 20:43:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 20:43:53 +0000
Date: Thu, 1 Aug 2024 20:42:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <michal.wajdeczko@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <ZqvzU2rYPy4Citg+@DUT025-TGLU.fm.intel.com>
References: <20240801055941.1187878-1-riana.tauro@intel.com>
 <20240801055941.1187878-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240801055941.1187878-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: a38de45d-99aa-46ac-a8c1-08dcb26aa7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JtVbLs3D0wAdIZ6ZDG1X0P7KIKAy5+zMDDw2PU0P6dvF7yxOnBk+YDrtZ5mA?=
 =?us-ascii?Q?SJTv2PfeV/qnZt9bZcb7qYN+TINX+aKNIbSiw1ByKGGN7sNCrc0Vxf4sOF2v?=
 =?us-ascii?Q?Njcww+GYUj/20l0B5Ss+L2Ei8npe2nIsH5eabIlKEJWh6FsI1cobEPHZCG88?=
 =?us-ascii?Q?gb8ZeOUmQmt/yLHr6Z3W2gTY2tcxH3fFlpiGE6RpzLI/6j48t1FkQ7cXBT/D?=
 =?us-ascii?Q?FFxGpvMeu7KV1F38USzVnEMBIbjQ7XCM8ntCQFjP/dR0GDricFY3TGGWHmlc?=
 =?us-ascii?Q?i9lvHsyWxVwuMOH7R1mVkdWpfPP9DTX8uGDfeV5JtrhjN9qDrNsQ5u4XL09m?=
 =?us-ascii?Q?6H0VIN6MSHYfgJXY1R5Wc6ljPjur+bRjjKiXYZqx9NCO0fEo43NfP7E0IvAf?=
 =?us-ascii?Q?IssSA6OiHZInExBMvcqk/a3ctZ04COBfTHX61Xdt2+c1JyLn380rw/Qrdube?=
 =?us-ascii?Q?Lr1My/p+Lspa0UgvU+fS+8U+gLy0BmhAqQQajPpr6KZDMfVdG04PqlqKduud?=
 =?us-ascii?Q?la8q55EpSZw+S+x29ZvzH1QtO0F2Z9oAFxCJVkDel52B6+2HJRWnnvsSOqT0?=
 =?us-ascii?Q?TN4eKhspenqu/glg1frGlDXDV/ymtifDfnSyWQ6xwG82qKQeGK55dGM++fr6?=
 =?us-ascii?Q?2cTXDSAdFzkZrNPyuAP30mkgK/WhD4frpqwA7qztgz8Hc1kgoK5DPTDzaEIA?=
 =?us-ascii?Q?VT1umhKalmEYmmWvlomikH1XXGGCiGgOPY/QPYGZ+ozJZSNfwjCMJ4ccj4i+?=
 =?us-ascii?Q?CaQYtkEEp+PrDIjV+QOhW47xkA2UykH2NGTfyebh3zWpmqz3Ewdb+cRPwwvn?=
 =?us-ascii?Q?u5Wvr9NSMYo/SIm6704x17iqKRLRRXjfZFC2Z5lwlQEmViqKK6zPocczK/J2?=
 =?us-ascii?Q?X7QuqlQQlhkzcvT3LvXjA9sShuANy0UTFJYVaI54umnZ/hp9oKvOXeEQoLrm?=
 =?us-ascii?Q?VBQWvdPNYfXYShEXLEnXwlrkG3Z8G/AtKbz8gL7g5OBe1VA/hqyX56HPTK22?=
 =?us-ascii?Q?/02bYbu1HEr1sy6QQVEa+zeJ95FVvyqALGDI/2F1WwlDyk++X6GDO5lQxG4I?=
 =?us-ascii?Q?H8UioN7/KMPTIOuCDsxloB2MRZAzHuNfaAxu03GEtoLh1FHxLMPrfs59pany?=
 =?us-ascii?Q?TqcmI4vZvNxqTLoYytzvKVXelgNDYPiX0GBEuHPFOYErUs6yMICip2fzQB1w?=
 =?us-ascii?Q?WbnXuoMOd/10VGFcsSfBlAg8+w9tY+1wQEyFIXu9AVa92Ervo2ugNJJNG3zi?=
 =?us-ascii?Q?JraCYVPwADpFmuYP9nCdD32GydckaHsKmrM1ZyabEBweQYqTzF8UfopFvvRu?=
 =?us-ascii?Q?pDi3zCm/OYfFmgp7gad8MeZwO8FF0jWYv0JMOxJ+YtC+Aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7kc+XN85C5jq4DWnFYCiRR8pARnbsOZ9xP6d0HfLR3c5qQsLcyfq4vIh/nc7?=
 =?us-ascii?Q?5pXYbSRdOd6PQUIHmXJYwK96l96Rzt2gfbU+Exv9rsG4jTHMCoyfhL8AI6SG?=
 =?us-ascii?Q?Dwqk2j8+xMnub6kYo0rBi6Fmcg0wCGF3cNMiAGmkRoYm/UfzrR581dgfhEyd?=
 =?us-ascii?Q?Y9S5qW40GCCf3KsDB+VG9Lc26gpj3+LpnkDnqTKfvbF00auMDASPzyTrH8X6?=
 =?us-ascii?Q?zi/8O4ATZNfcTqm1PWbexre+4dx9DxB0bSqCuCLwJFiuP6gJDkVOlf6YpjFs?=
 =?us-ascii?Q?nEEtJnRt1d4FG+cy1A8cgKINOcc+ZgbQ5hA311Ir8lxcO4Koo3X1gpKczV3o?=
 =?us-ascii?Q?mlqOYKawuN/omqwJChS5HyEJR9GM56npSeLEZUL1UFMMEgiW7tz/wtqitaRy?=
 =?us-ascii?Q?Pj0cVz2VKbtFZkkJ4iBzR6v2pywd5xDSeuNKmNR1Ugn2Np8QM4dKqlELQ1qb?=
 =?us-ascii?Q?nmQXw2M8QPfJvLnOPf701oxFN8q51l2xBbhq5jYMofqkK5SU3KpbCZLJtx8u?=
 =?us-ascii?Q?5EMjC5GrQ4qQh/xvb9KDxPsI4hk7xbIlskaYu9VT5iqwctMcBJ0+w/8bneft?=
 =?us-ascii?Q?L3PMhQMnZG0rmX7DbAg9xjI8ouGqoGquh2uTlrEqP2pX3pD16Pz0H1b211Tu?=
 =?us-ascii?Q?97LcuGeJwDLQoIUEy/wDbxXzR7J/3c8nETW3ElPnstWFBk1SsB01Jq995gZP?=
 =?us-ascii?Q?oZuIFsXFnITlz07q9hh4m2AjOb2yHyjhsmy0lnZc103Ih2zTqpaaO1ZZBMqi?=
 =?us-ascii?Q?BtX+H2Say5Nl8x5bHZ19KF6zDT3iDSMnt2A12ofIWWHZz0QcTqdAc1+RVCbW?=
 =?us-ascii?Q?JGQ4K5QdR7GlGHIL3kw8jj5RnTdzdoRIJEBUmT0lme9lVtWNZ+sgH9nMHqDL?=
 =?us-ascii?Q?Uiiqu4fdWyernkEry8mOXe/ooYf39FmeI0poMTp8zNLmag2j9gByit+cxCCw?=
 =?us-ascii?Q?rEUb7bBbc2ipE4NuFpi2KQhL2b25wtuYB+lvwL0fA9UvstLxTPxwmBtoWAi1?=
 =?us-ascii?Q?kWyHMSBiQ3FiDqDy6C0QjY1Idd4nZCiVCZftVqpv7hjXvHXgvsEZaL38ri6P?=
 =?us-ascii?Q?VuP/ZhxJAWTX8ZP51EpCc2vsC1IPr31v17DvbQ6NUZ92Es//i1EKBuSrwdej?=
 =?us-ascii?Q?/5dHufkNFLL6yufHNJ6E0u6PzOd1LEBUGJ51vy/hecAw5oqVdYUqCX9cd5n5?=
 =?us-ascii?Q?k0uMRQL52GnJqDUW0jfhNI3EF+Gh1RkjB5FxTH+SnfhK5tiquyOQDn/cwJq6?=
 =?us-ascii?Q?258y9XP9cT4UrAtRZ6ao5S4uRAUMB6jg4KsouLMX8+1WrVDKRhUHAeEl1xD+?=
 =?us-ascii?Q?IGb8Zz9MWx0aYOrPmfPpnVIxSmHsCiW0X8+K/O5t2KynKsOZMTqt1tusqU8z?=
 =?us-ascii?Q?d6FYT13rCsl2mUhvej1rlGsAuk0b/EGF8gnP1OWbb/fyVIcb0z+hjr8tB8ue?=
 =?us-ascii?Q?8ExBBKaJZSSi6/2+3FSx2z1AD1LR5rBtnznGiPQ1q936nwhSm5RS8Xxzpq0c?=
 =?us-ascii?Q?ymtFNLyiQnCHM8Wv5bMqzWwom2SNIglV1c3ihv74B21Rye12TL6js0d1QI5o?=
 =?us-ascii?Q?D7ssMIvBPvXwYMcrJsFKSvZNffdUxwqypvLZYPaNI6IZ+jNitqUFFqvxehwv?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a38de45d-99aa-46ac-a8c1-08dcb26aa7fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 20:43:53.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQAdRgJEwtP0tCKmT4STOGuc6NOBuejws31IeoRw/CzKvwcGHV9LAGDBYtG0G4yeQxCcKVvJ1cxHNRWEYK3z/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
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

On Thu, Aug 01, 2024 at 11:29:41AM +0530, Riana Tauro wrote:
> Currently GuC is reloaded for both runtime resume and system resume.
> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> is not necessary.
> 
> Remove GuC reload from D3Hot path and only enable/disable CTB
> communication.
> 
> v2: rebase
> 
> v3: fix commit message
>     add kernel-doc for gt suspend and resume methods
>     fix comment
>     do not split register and enable calls of CT (Michal)
> 
> v4: fix commit message
>     fix comment (Karthik)
>     split patches
>     correct kernel-doc (Rodrigo)
> 
> v5: do not expose internal function of CT layer (Michal)
>     remove wait for outstanding g2h as it will be always zero,
>     use assert instead (Matthew Brost)
>     use runtime suspend and runtime resume pair for CT layer
>     (Michal / Matthew Brost)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 33 +++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_gt.h     |  4 ++--
>  drivers/gpu/drm/xe/xe_guc.c    | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 +++
>  drivers/gpu/drm/xe/xe_pm.c     |  8 ++++----
>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 131 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58895ed22f6e..e0b13dc7663b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
> -int xe_gt_suspend(struct xe_gt *gt)
> +/**
> + * xe_gt_suspend - GT suspend helper
> + * @gt: GT object
> + * @runtime: true if this is from runtime suspend
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "suspending\n");
> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = xe_uc_suspend(&gt->uc);
> +	if (runtime && !xe->d3cold.allowed)
> +		err = xe_uc_runtime_suspend(&gt->uc);
> +	else
> +		err = xe_uc_suspend(&gt->uc);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> -int xe_gt_resume(struct xe_gt *gt)
> +/**
> + * xe_gt_resume - GT resume helper
> + * @gt: GT object
> + * @runtime: true if called on runtime resume
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "resuming\n");
> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = do_gt_restart(gt);
> +	/* GuC is still alive at D3hot, no need to reload it */
> +	if (runtime && !xe->d3cold.allowed)
> +		xe_uc_runtime_resume(&gt->uc);
> +	else
> +		err = do_gt_restart(gt);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 8b1a5027dcf2..21f27ca23b67 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -53,8 +53,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  void xe_gt_record_user_engines(struct xe_gt *gt);
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
> -int xe_gt_suspend(struct xe_gt *gt);
> -int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1ff49318f001..e1923a00a9f6 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -881,6 +881,8 @@ int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb)
>  
>  	if (register_ctb)
>  		err = xe_guc_ct_enable(&guc->ct);
> +	else
> +		xe_guc_ct_runtime_resume(&guc->ct);
>  
>  	if (err)
>  		return err;
> @@ -1112,6 +1114,34 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +/**
> + * xe_guc_runtime_suspend - GuC runtime suspend
> + * @guc: GuC object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	return xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume - GuC runtime resume
> + * @guc: GuC object
> + *
> + * This function enables GuC CTB communication
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Power is not lost when in D3Hot state,
> +	 * hence it is not necessary to reload GuC
> +	 * everytime. Only enable interrupts and
> +	 * CTB communication during resume
> +	 */
> +	xe_guc_enable_communication(guc, false);
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 13e75573f7d0..ddc87798e176 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>  int xe_guc_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index beeeb120d1fc..9e42c5d29971 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -419,6 +419,37 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Mark GuC CT as enabled on runtime resume
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{

I'd assert here g2h head and tail are equal in memory to ensure we know
we are doing with the PM as we shouldn't have any g2h on runtime resume
if we have the PM correct. If they are unequal, this isn't fatal just
kick the g2h handler.

> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Mark GuC CT as disabled on runtime suspend
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{

Nit, I'd write it like this:

xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
if (ct->g2h_outstanding)
	return -EBUSY;

Matt

> +	if (ct->g2h_outstanding) {
> +		xe_gt_assert(ct_to_gt(ct), !ct->g2h_outstanding);
> +		return -EBUSY;
> +	}
> +
> +	xe_guc_ct_disable(ct);
> +
> +	return 0;
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 190202fce2d0..0cf9d77feb35 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> +
>  struct xe_guc_ct_snapshot *
>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..c73a728a7450 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -101,7 +101,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	xe_display_pm_suspend(xe, false);
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, false);
>  		if (err) {
>  			xe_display_pm_resume(xe, false);
>  			goto err;
> @@ -157,7 +157,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	xe_display_pm_resume(xe, false);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, false);
>  
>  	err = xe_bo_restore_user(xe);
>  	if (err)
> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, true);
>  		if (err)
>  			goto out;
>  	}
> @@ -428,7 +428,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, true);
>  
>  	if (xe->d3cold.allowed) {
>  		xe_display_pm_resume(xe, true);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index fa98e9f22631..8e535153cc62 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend - uC runtime suspend
> + * @uc: uC object
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume - uC runtime resume
> + * @uc: uC object
> + *
> + * Called while resuming from D3Hot
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_remove() - Clean up the UC structures before driver removal
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 506517c11333..1e223d67086a 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>  int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_runtime_suspend(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.40.0
> 
