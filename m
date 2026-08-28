Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A501C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E2E10E286;
	Fri, 28 Aug 2026 15:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJyCzcAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11DA10E286
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930041; x=1819466041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W6NegitLfhHV+zedun8I40GhslYofuS7fTnbu94e/QY=;
 b=HJyCzcAhUA5LyorRxiqP5L5rndTJjUQA7/yskvkHxm2IncvsmsjgQ//A
 pJQtHuTsFkrr/d6ydnl3W5LJZObVFwzvzNNY8aei8CH9t7zr4/EOmLkYz
 TeDL5YsYQ2Pjn+UHNtUQPzAigSQoUBVCbo4de6VHxsoUEd4szz2G3CVMO
 wj2ur6C0izyzM/8jhbHYZfvhhXQqYhVCFYvFddg515J8/6I5/99EiGJCu
 iZGD+QZNnFWPNfAO4oqKo4TbNTI/KHAzpCVvDvaGFg8KV5c0O4Z9ZSG16
 iuEB7G209OfuFVW61WluKucp2JhHSZ/CFKl2NvSv2AWwm8MMsSHGEBa4a w==;
X-CSE-ConnectionGUID: CIdRERrAR8WHpVS5leJT4g==
X-CSE-MsgGUID: w3RhQmFzR9S7PJzu1n/KIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88203524"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="88203524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:01 -0700
X-CSE-ConnectionGUID: WPWEAnH0Q1KWWxJLc6BfSw==
X-CSE-MsgGUID: W1bb89qdRs+F/lJOjjQcrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="267617186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:14:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:14:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3XeaJalw6rlPdhaIPLoDvZ7s3lZye5KHL43ifeqsJf+tyoPJsi+Ls6XhzW/ZCSelCXKbxIgoe67e7fMRhzz0mMgN2Qw8aCmSonYfHj1KU0qkC2+3SxdE2uL7mvSti7pmcpeJmzKO1zX70YnHq2WX4eZPawJFu7yu3gai0HC3HS8SKbwQ6IB8D/OzHfJiguM2UhHUnF+bR5+w255hGiB+BYBl+D+mQF8jAhZVc/SrvVNNWboBzAfwZg2vin2sOQqm2lM1JMsUhtKcNbgU4G+T0ZJKf81j50MGpgBHlNcujXm27Y+6P68orn9XOwren9aZfs6jy3g44Lc6JNAbOGW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADmd3JRbLwLM17H9nooLFjiyDdyv37DQNdy/VxdoHSg=;
 b=JP4vYvZvKjX9Z9inNRXYR8iS912KDmrXs8te5RBKx6cZiCs9CBFQ48a8YXsAC482Box0JcIa7N+yJXrM1Jq24Zgr7c0DI3F0dpWmzX47ekXd80nyCDhDaUcmliKi8TAGcwEA+iVrRkqWcwi0L+34qoWoUyF0YbIwyY9bXeQjwGsRPVLk7Rg+qxBLXZzE9wK904BvjLMZy2y/oevlClIZ7+OSXze/UbpU0lHW0MhCUHnGGL7PHAVVMo56L3CAwC98U7IwQHmNtJy0R8PZ27G5cXS9HX58LHCdxUUy4HtqN15HZkyvFP0ZAgNsQQYV8YBbvpIDx5cZoWBEIkpU/P7v2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH2PR11MB8779.namprd11.prod.outlook.com (2603:10b6:610:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 28 Aug
 2026 15:13:57 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:13:57 +0000
Date: Fri, 28 Aug 2026 11:13:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
Message-ID: <apGlsHhoC9ig7olz@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825063615.3697317-8-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH2PR11MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9f3e61-8d50-4d69-2bac-08df0516fb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: G1lFZzDNwrBzkZVCpHkqy1kQ3vITY3sFourX/j6zNFhAmtmW/nv++QMqI9V8gV37JOBZSmZ0F1LyC8Dc04FAx6UtvaUN5fAM8S4wV0R1qjIiwpVPfaojmtxB5Jh/WSR1MydIsEkR5FMDaai6kecPTj9iYDzKj479RonzmQLH+5ocd6xQ0yUxdoO0n2IDPXhkQcLsvKDML5OmdnrccEMNBksVSAf8heVY1F8tJMiWjaaTs6wwhFytpMut7BFIwMimw9THoziuZv8QZ2pfYIqfbtTp5jva34kq5ybwTOR0LV6AmEOCWic6x5DiCXJk5r9s5qGraGr3B8BIwyV8AofMQGyQMv9QyQeyHmykRibmhcF5hNV1fBsB18h+7udUkLhZVssJbiu7Q0SLkpQ2Zti2CSgOeJbFJgjGEwPnSkbdR21pn+65lg5aCPcv8RdwPdKTZPNENM4Our4t/6DD54KJGzkceSLnqkEqjb37WWQZJt0oSj/rb7j5h/utM5s8gCJorrmoIF3vZDgoCypb1NOh3LJMq5cy2rm1OOpKt82fC96TkzsAA51pbfTUZl66w0yKUhVOY0A4i+XVb5/RYn8caBbZYsIyxpguFIlz87CignWPyR4l+0E3fFIRRdQKJcy3U4glh0FN8UNvZC6UQO2xSBCKc+tZ2NrZQ2Llm06ISI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EoUslDZVF+5YSdeCrWKpbDYaXlln6BoZUa9zA8p4+6HrNQffe516sH3jbgpL?=
 =?us-ascii?Q?k6Kqbolsgu1rm3TCmZvJ9DkNAELxAZPeW5eW5pS/7b6yb6YlIaTNfyCJeA+g?=
 =?us-ascii?Q?ARO0+0r+74E8JyEMwbD1K0qjhHXhPYAW8nLuj/gaub0ky88CrN1l2u0ftLKJ?=
 =?us-ascii?Q?1+76AlrNeTEEtlWqkw7WqPz6JyZhsv1aBhmZd0NM1s6+5bUcrRPuoRwH8ixQ?=
 =?us-ascii?Q?q2+hr91/YlmsQ+W8nSxKuf/JEoqbHNrKV7GaQsaoQwaaQWksiVmm1DocC1Vj?=
 =?us-ascii?Q?4uBiMzqJviEMrxf18dsuj+8qmXFMuwC43Ia6LSTw7V4RwgTbcxZeekwc+djQ?=
 =?us-ascii?Q?z76/lP5Y3yVzPXEjD3nkfDXT73hp7VO2IA4BJfWHG/KQqfmUEnTXqFWlXkdb?=
 =?us-ascii?Q?3oWPcz1hctIW9b0z8i0KzYN1KorF19HNzYw5+INgm1UNuHbV+H1Ue7MOr2p7?=
 =?us-ascii?Q?odjJMBsksyOSk1INQNBI8sGNuCF7nyU707isD9LYQ2Ha5mEP5AJQecV3+uxD?=
 =?us-ascii?Q?j+BjlAjG1s60KQM4iS9bdydu2HCm5wa02iou6mHEuuuG9YGnpvHk0uNkBiYF?=
 =?us-ascii?Q?dMG+OeUI6HnkKinYxxkAXJN3Q1fMSW32Pi4uDGgP1v49PcI1isLyQ4HlLxIo?=
 =?us-ascii?Q?cM9bd0QTV+y9aBnlLpgyJzpXn0+Fjxp1e/ZlAMJSTyC3CKOw4mu8X3wUhdJJ?=
 =?us-ascii?Q?DWu9botn5ows7Ylr1dbnGzG+56nu6k3yMzPJbHVKfNOCS6latdniDiSo0pYl?=
 =?us-ascii?Q?CuSl1zCliXXP5wTk/oYmln/DvoUh/C780bRJ67ZrxEbLcNE7wDHMWBi3aDyy?=
 =?us-ascii?Q?pOBS/2G08b0d9ROSJPs20qT/GniSVZpefn17L68vdzrL6XYJIR1ZDs1E/ttj?=
 =?us-ascii?Q?6d/hEAEJq9rArFnqq+WJ0zPMNho/rv3ViRmm7G+H9DGRqvbgWQGHyFVq9g1H?=
 =?us-ascii?Q?ku+hlEQczm8amfhMUuk/ZNOrCIo9Bz3/WJQWD4CGydAWx23gqpsir05Vv9LC?=
 =?us-ascii?Q?b11aVSlhnhJgA5kAsMlPv7sw+F+yxebwdpltmokYNN/7qzYg0Szmww7p3Nna?=
 =?us-ascii?Q?NfLPsI7WyeW/Q8asLBXVyPTQy6/XSq7dUeiRm3MVmuUzP9nIXAeFblqad1Tw?=
 =?us-ascii?Q?i3OBlGqTdv9TVHdVx57ryc46OleO4PUxwIH2XsjtXj245Qri+s52DoZI2WZp?=
 =?us-ascii?Q?Ld0qIx40wt3Dgc+8DHoVpnsuPAOJtFP+UIeJVX/Pkmh4IT8yObEdhoGym4u7?=
 =?us-ascii?Q?yhqdbrnvDwZ1VriPxT2Pl1Bz1nabJWpAgx3g1cr1B4kMdnk3ge9viItWuUkh?=
 =?us-ascii?Q?zNUJ91vgMOM0kib84s5jUOdFNGA7+PhdAjhiFVVnyMuREra5CWNlJo+Zx6Mx?=
 =?us-ascii?Q?3EwPoy4GG9/Iu192+6xx77BnCqRPHP9V35U53a7Rl6+YSzS2IVTGQ8iVLGJb?=
 =?us-ascii?Q?N7q5gRtC6WA9PySJAtBypMUoEwUDo9Dw7P8Z6bGP9q655z20/oNGlUZZVBhD?=
 =?us-ascii?Q?tGO/On9zYPQ7aGqEcOcW5pryg8QMZmkMZEM2dHE68Mp9Y8i+d/5mQVYUtUAz?=
 =?us-ascii?Q?jiNsspkv1SfFuD39/E17byu3Lydshxyk3fRj25J07cTSrInEorIjdB/CPkzv?=
 =?us-ascii?Q?QgdQPB3n7D+HXhfHGdTS07M8Hk6FksEDWsD0nwLEebYMRdXwnwjAHGNgbtk7?=
 =?us-ascii?Q?VghKhgcsKAKq80nnsYilM4SmPQqXnDZCX3yqu+CwKkhTq7gJlSaEdliT2aCb?=
 =?us-ascii?Q?mMe/saX2JA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Qqn2/FWoZysbbuGHFMuc5pEf+6veJ4ThMLBeibO+UHoSJOu4YDeNIjNQMwEAK0CNAAZaodEDAOCRqePxSqgK6lwsJ2Ze35JCQNnkUqgNvcy6TLOrc+O/zKo12pNszI7I3vWJ+rRuoV9vwjWliYbpzuXVjec6NAouFI3NUD7rU3Sjfgs5WQ4MxsYZGiiiA+9+ItHNw8oE/4/0Z5P3SHO0JRSI+8ev0Uy1x/uiv6vzdboMDW85UuTCR8Ed6mHfS0mFrPYIr4Y6kkZ0O0XFcmjYKK2yibqQaTDJ4tbTN6qIEG3FA/kYr5JCkuUxhGDQlhlPpIviRDL0iifwH0Ymfz/Pug==
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9f3e61-8d50-4d69-2bac-08df0516fb03
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:13:57.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lRFabKvMCbHwTyCqGTDAbsBH/W82X7ia+OKqjklBfXkPC3iXewVh/sUTBOsJT0HTE3LOnZK8p9YV/nk57b7+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8779
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

On Tue, Aug 25, 2026 at 12:06:16PM +0530, Riana Tauro wrote:
> Rename ras to drm_ras in xe_device to distinquish drm-ras functionality
> from device related RAS functionality.
> 
> No functional changes.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
>  drivers/gpu/drm/xe/xe_drm_ras.c      | 12 ++++++------
>  drivers/gpu/drm/xe/xe_hw_error.c     |  6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 180d450a6deb..1494f3a6c62b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -550,8 +550,8 @@ struct xe_device {
>  	/** @pmu: performance monitoring unit */
>  	struct xe_pmu pmu;
>  
> -	/** @ras: RAS structure for device */
> -	struct xe_drm_ras ras;
> +	/** @drm_ras: drm-ras structure for device */
> +	struct xe_drm_ras drm_ras;

perhaps xe_ras ?!

drm_ras makes me think this is a drm level structure...

but I would keep this as ras and change the ones inside the functions
if/when/as needed...

>  
>  	/** @i2c: I2C host controller */
>  	struct xe_i2c *i2c;
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 78184b6ea7d4..9f37ae732770 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
>  			       enum drm_xe_ras_error_severity severity,
>  			       u32 error_id, const char **name, u32 *val)
>  {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  
>  	if (!info || !info[error_id].name)
> @@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
>  			       enum drm_xe_ras_error_severity severity,
>  			       u32 error_id)
>  {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  
>  	if (!info || !info[error_id].name)
> @@ -110,7 +110,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  			      const enum drm_xe_ras_error_severity severity)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	const char *device_name;
>  
>  	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
> @@ -156,7 +156,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
>  
>  static int register_nodes(struct xe_device *xe)
>  {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct drm_ras_node *node;
>  	int i, ret;
>  
> @@ -196,7 +196,7 @@ static int register_nodes(struct xe_device *xe)
>   */
>  void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
>  {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  	struct drm_ras_node *node;
>  	int ret;
> @@ -226,7 +226,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>   */
>  int xe_drm_ras_init(struct xe_device *xe)
>  {
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct drm_ras_node *node;
>  	int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5f2abc9485ff..90b73077ef41 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>  {
>  	const char *severity_str = error_severity[severity];
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  	const char *name;
>  
> @@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>  {
>  	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  	struct xe_mmio *mmio = &tile->mmio;
>  	unsigned long err_stat = 0;
> @@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>  	const char *severity_str = error_severity[severity];
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras *ras = &xe->drm_ras;
>  	struct xe_drm_ras_counter *info = ras->info[severity];
>  	unsigned long flags, err_src;
>  	u32 err_bit;
> -- 
> 2.47.1
> 
