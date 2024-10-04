Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D5DCF884F
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905010E0CB;
	Fri,  4 Oct 2024 22:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUAKCeV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8110E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728081611; x=1759617611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DOF3HMoV4zvxLHueQtFRl1MNxqFyfnDUPHJ3Duv5x5s=;
 b=TUAKCeV+v5P8Wz8UjObKbilIyysmQaAA5FFT2V2i9ciwgKyPQa3Ebwdo
 Dca+kittP+hEJqR6Zib4bX8yV6ZeOTjebxtQepohKBlFaq22JHMSagfb+
 +2g17pJduShg1cFDNUY1O8fmoHeMfSN94eyL8E/wI5g1qtItm0CiePcRs
 Wa5h/5EmeAhHGuFXCotZbIJvtO/m1ei9Z+Vp+TI1QtTYC2KqHUNfcP8L1
 Ct+xL9yfL2LOVP+cZxin2etx9B6Z1uTPU3q8cdNwvsAHZaCH/30smDug8
 J3hmvxiR5UfTCGh00QJ2UFiUYf83KMYklY6EFU1KkQfMzedVmXAi4auSx g==;
X-CSE-ConnectionGUID: tlUX71GeQiuZXefqrIA8Ng==
X-CSE-MsgGUID: EI8OroncQbyN7kjvXPIq/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44782736"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="44782736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:40:11 -0700
X-CSE-ConnectionGUID: 7Kft+Qh1QzK/nfdMm19eAg==
X-CSE-MsgGUID: fs2fQAAASNm2obii9rLTWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="75180564"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 15:40:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:40:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:40:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 15:40:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 15:40:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWxSO2yvG0eWHjiJy6/AAVywBl0HCPqR+1xpU5KW5jA5+oIWjAJDsm08IlZYOhSYas/c8Tm3YQwgMad2gqwMsVevOjHQRjR40b1/R8BoyJENNhbkChQd2D8t6MRSXL8PagHp0LEudS3VSh06M88baGU6kvrrpUObp/ubN9dqPg0yLPIWhxyYnT1Rydq3JKp6ua0nvxqkL+O+Ukws4Nmp+tKTqpaIF1ZIdYSNduBva4Yg50gKNgCLngCqqfVi1eYKe59RRnPstC1VHuhGf9eV5D3nm0tmMZ9jfuRzkd7PURiA+AH2AkHFy0TAGUHZXEK3x/axHV0TRDF9WpC0XfPXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocwt0BxAX5pSmPqmTgWlbcL3lqVidrdl5+CJVTotcN0=;
 b=m8bMXC6J3JWbKpvRehjwGzgyblm9Bcjo4Q1IOxRxriFvh/pR25SJGW+I94NwM7EeTi8zQ99HQAYTQ79dzg7npxRI8i1FQ92hlUyrcdPYcpvz/yP36GUpYWqXy2VJgkcXBnX4jcYqpi8OxZVik5r/+oYtbMrued7JbMpYtS9wPUGEhUI8jMbYDOC9eVd2k9yPoFptFon64RwWsm0///IvABZ6r0QRWfpinbtA1vwrN7ehHvuCDJYWPyYnV1LIEZ1bHQmgJjPagT9TxOjME2Q/k39FcqQqxfe8yhsaXyHcrRj39S2zGeGFYX2KS1qZsUmiPiZOgNZBEWLjjis4uZ+rXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 22:40:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 22:40:06 +0000
Date: Fri, 4 Oct 2024 15:40:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
Message-ID: <20241004224003.GN5725@mdroper-desk1.amr.corp.intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241004220550.94308-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa1cc98-899e-4beb-d84d-08dce4c57ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o65/1apHyNgimNcnsHYT1cRTIEsNrQ7eEJjJEH450e0gHXbqOUzTahRvs7t1?=
 =?us-ascii?Q?s+f3DlpQO6EoNDItoHCVMNnH4ihVXN7fv2x9qKrKU61WDQMLJgSNonhFsNww?=
 =?us-ascii?Q?UliDi5dZGUa0tHp0RHMglbQem3kWZdkoa1gWsJ8KzjJ8DEIeXtSFpBjgnmWE?=
 =?us-ascii?Q?jTc5AC5eBbjOYkxDT2EainWHG2IUZtHAQr+BG3gbIpPGEop7SkHAL5kJ7dt3?=
 =?us-ascii?Q?meC1s6LSV2eXtEM6IdztwzZMrB0RIIMuP20x+Ao7XFW/ZhU3fjy+fUNl7Du3?=
 =?us-ascii?Q?6jmtTCTNEafYgvyZEaRnrYC7L5obOVhNZxi1mTUZ+lhQXilUkgWoFV+3nOJM?=
 =?us-ascii?Q?PCIFA8mdIINwysx8MyNHnntOFtg4W10neod8slDteWfBnJXgC5dyHDkWp3mq?=
 =?us-ascii?Q?1C1S6VgoLPlmWJyVvmO1NeND3H3r/1ECm47vriz5TwOPsMs0FtkeDuLIaFLl?=
 =?us-ascii?Q?zwo7MRKID8vm00j9xl4uQg9EdW9tfIeZ0jD6Df/Mu+0TsLdUkj5WfQNQSLLY?=
 =?us-ascii?Q?YSjV/XXnJj16mywpU3Tk7iq0IzJeH17tZaNcGSrITU4W5IBG4+PbHpHtziRx?=
 =?us-ascii?Q?6HYWgfg5RJ0Cu97YigdtsbuzfiDt5Bqsu7isYVJWanK+oLLByI0zoJE90fTI?=
 =?us-ascii?Q?hFUvz/fhNEUk6+gNxrbvLOJ3OFHtRstH/9LvlEbnbJbr5GStcoWHLfntwZmE?=
 =?us-ascii?Q?XO0zrczgJ5CL4ZdcJ71LfJPbHEvRj5jv3RY3pIKTyetpSosjclOJd3rvrQ0g?=
 =?us-ascii?Q?I+FH1Q9Los/vePwYTiYVt/bRr7bJhobrwo/AeZqDZ2oGRKZ+5veQbF7vBrK0?=
 =?us-ascii?Q?iYjRKI5rsIgjO1+pfLVcMi2f2geEBSPsKZkbeKXFngLgcAKmiFFT/1XNHUPQ?=
 =?us-ascii?Q?Y+l5tDHLRnOrZ2EETsm4g1z5zNfNvpLZTdG5mDUfbMQBApZRomYQ9kG9vZzC?=
 =?us-ascii?Q?lnn3FcJEzXpHYNPYtz6IE0CP28Ws1g9vMHhsnQUcIm4yGeOztB+/cl7N3oAB?=
 =?us-ascii?Q?8TFoLoKPkv0iLhdUtjddGjAPG+1JLw8vXTDkmWIDw38UmHKr3aknkuox7Zx7?=
 =?us-ascii?Q?3WDZ+k1KLqVvXnLzEpSLnoID9DyhepcXRmbds6DnVVPoQ8Ez6HdRNfwc7S52?=
 =?us-ascii?Q?/hT7dUdtWudCw2xw+6nwKi55w0uozNCubplsRregFQwnI7JV1y/jjtXZ+im5?=
 =?us-ascii?Q?yVTxXtmkSHe1Gs29/MJj4RAncodtXA2Q7Im5S8WuYJGAx3CpUw7byjZzQ9eq?=
 =?us-ascii?Q?UVn8HskBWMROogHnLcBUILAzeBMRtOKAFLDS0RxEyA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96RlzlUgJUsI2pcBNPWcXINafMc8FPJKVM2lD3YnVha9NT+pYj0ZpaRKBiZ7?=
 =?us-ascii?Q?oxGTFLwrtYyb4TmHIlKgujoty2GsL4tywxvXt72U9qhuEaKRcoJCCB/HSUoH?=
 =?us-ascii?Q?JsPEGQqerUcC9Rhm1cDRCvmoO5pCEvprnYJHo288PWjMsS5HwTfw8omPMnO4?=
 =?us-ascii?Q?9ZzkIBGql+OKsCv6Qcr49BlWCYgmWyrMYtp5B2KHbwSZp8sCHKAsEUUhc5xw?=
 =?us-ascii?Q?vGVegjIdttLrkpstGpt1N12fzuhSCnREihsGhDWj28B3xslL78L33FADUzuS?=
 =?us-ascii?Q?6EYUTS9Gq2EFnClOUA1x4P5Mg+qFRY5rNouVf9AdOsgRj4gFD9Nj1q5uZhlQ?=
 =?us-ascii?Q?FnGLKaQCUttigafvqfvt8/WpSlmskXMzpLuZ5p9DnXHAQ5nH9PutaHy7UW3E?=
 =?us-ascii?Q?ktJ9FSprSTRu4eQZg1bhgeDQd/gaYqpx6ykHCEXqUYfTmyJyM1QFqDpS13ER?=
 =?us-ascii?Q?7fA0lULUEa61/Pu6xZ59jOYV2KNYAIsLXuzuIP1fzgW+p52Q1lkbBb/7+c5p?=
 =?us-ascii?Q?j/3kGca65bqEUsuQzAS+vlvvr9jkV9FwptkKupXZuBN4uY3hNyY51mTt/9UF?=
 =?us-ascii?Q?g65AaxLiqyU31unIocQybYv1mTJxn5TXZp1Zc4MB7UzfT0R18E4hpuAloiXL?=
 =?us-ascii?Q?Ci9HzDEv7PsKOqDLKoz6vqokfClmC3miYGWnvZKKEO0NDdNf23PC4Al0FMer?=
 =?us-ascii?Q?pPlmPj3MFbXSuUYqmB9V4fDg036UUq4+0R15ttPK37/yS8QiLE4DX9dQ1hQo?=
 =?us-ascii?Q?J5ynAWpi/HTwxhK5JpAVOc+OffIgvIqrgg80PHm2YASwMkWfeDSU+pdJL9Bc?=
 =?us-ascii?Q?BLSzelVxJ1ZJR1Amw8arhl78X903Vi+SQ5580wWRVT73mbN+M+T58jG0KhAy?=
 =?us-ascii?Q?yOpDWtrtZIL7rmJaaOYxVIPUI8Qk93E9GFfqQVjGalPitThKyrXMMHInECZ8?=
 =?us-ascii?Q?GgTQBtDOndKLOagzz+hpo09Q3Li/0IOMYBUsCYeS56dEvD28ZpIlV4GnJOfL?=
 =?us-ascii?Q?vi39y1F+PdiEva/KS6GIaOmgXp94blFgGOEJuBllR4Cat7n2tMcJu1+RinOc?=
 =?us-ascii?Q?AQyMYt01f4oBEtc1YM/dA7+WT/H3+0wl6aRRar3Jts/xUqEiMecMfBLv/tAX?=
 =?us-ascii?Q?R9r+uD/oTncjtPUm8nfGTL4iXjdBC2yReC8GzzUKlcBidw1Vp/CFpyrxIfph?=
 =?us-ascii?Q?RD08kgbN8/DBXk2gcJ0H0X140r38gVQBRiYVHVHV6pW1PgxTj3WdEpC/7hUM?=
 =?us-ascii?Q?WbGBRvzmnJMY2dgKuxQ/Vi1FperriLh0te9aFXxOFw1tVxZU3oxC/cII4U7F?=
 =?us-ascii?Q?S551y7NO7TxPR21zjVdW6Aev4rhbj0tqcNd0tQFk+m5q6OpHMV99yo8LT1gp?=
 =?us-ascii?Q?97Qemjhz0BXaT7HSa561pjgqErt3qVvu11UBIzkqX//N1bwgZN3+Y5rKYkrH?=
 =?us-ascii?Q?1ArFarYqHqmJ8PWHQnntpnT0sEQSvHIXrU9g/L0ENPRuXtL7olcjKhJrIzwq?=
 =?us-ascii?Q?1tsQbXO28dMMZ+Vym1OcKFJSzhUTC+4Tr5Pu6eze8DgLO2Sx3jLQnWfTXxzr?=
 =?us-ascii?Q?PLK1lSQ0hSj8Qay/1hQqcdfIYMt/M8+PIcX08QaTU0qITFQoXQu2VLydnVoH?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa1cc98-899e-4beb-d84d-08dce4c57ea3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 22:40:06.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2dGY0COLE41WnbObjP7uGz/TGE5Rb55HMnuZBhpqSj9PHKI6e4LJev96OKNptzA/0Fc4CCZUkbvypO10zV3G41OiY50dn3nhrVZISCvDtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
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

On Fri, Oct 04, 2024 at 03:05:46PM -0700, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> Define a common set of Xe3 feature flags and definitions that will be
> used for all platforms in this family.
> 
> The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
> platform.
> 
> Following B-spec details inherited from Xe2 feature flag definition
> commit.
> 
> Bspec: 58695
>  - dma_mask_size remains 46   (not documented in bspec)
>  - supports_usm=1             (Bspec 59651)
>  - has_flatccs=1              (Bspec 58797)
>  - has_4tile=1                (Bspec 58788)
>  - has_asid=1                 (Bspec 59654, 59265, 60288)
>  - has_range_tlb_invalidate=1 (Bspec 71126)
>  - five-level page table      (Bspec 59505)
>  - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
>  - platform engine mask       (Bspec 60149)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7ffee06fab13..6b2dfe4b305f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -179,6 +179,11 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  	XE2_GFX_FEATURES,
>  };
>  
> +static const struct xe_graphics_desc graphics_xe3 = {
> +	.name = "Xe3_LPG",
> +	XE2_GFX_FEATURES,
> +};
> +
>  static const struct xe_media_desc media_xem = {
>  	.name = "Xe_M",
>  	.ver = 12,
> @@ -208,7 +213,7 @@ static const struct xe_media_desc media_xelpmp = {
>  };
>  
>  static const struct xe_media_desc media_xe2 = {
> -	.name = "Xe2_LPM / Xe2_HPM",
> +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>  		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> @@ -360,6 +365,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>  	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>  	{ 2001, &graphics_xe2 },
>  	{ 2004, &graphics_xe2 },
> +	{ 3000, &graphics_xe3 },
> +	{ 3001, &graphics_xe3 },

We probably shouldn't use two different styles in the same patch.  Media
is literally using the same structure (just changing the name field)
while graphics is making duplicate structures.  If we don't actually
need graphics_xe3 for anything, then we might as well just keep using
graphics_xe2, just like we do with media_xe2.


Matt

>  };
>  
>  /* Map of GMD_ID values to media IP */
> @@ -367,6 +374,7 @@ static const struct gmdid_map media_ip_map[] = {
>  	{ 1300, &media_xelpmp },
>  	{ 1301, &media_xe2 },
>  	{ 2000, &media_xe2 },
> +	{ 3000, &media_xe2 },
>  };
>  
>  #define INTEL_VGA_DEVICE(id, info) {			\
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
