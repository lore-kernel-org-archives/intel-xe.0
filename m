Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A11AC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A2310E404;
	Tue, 23 Jul 2024 04:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy47vlRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153BF10E404
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 04:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721710167; x=1753246167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bkrDPmRAno3tbDEbI5HyhSyGyMIspC8zqhO6tVV8JxY=;
 b=Uy47vlRZ7vAEU3YhfwMQInFfbQ3LdYyagzSKfOAcx8Lrrhq+Wx3pzsUY
 Q6REq4vBU23v7UHaLwWOvDwotIOGBLXotqJmptXvOaU396GFmdugBGijK
 bmO5e9Q93jZAGb/rlmblB7ncdm0riaCEOTdA/GWNiWFko7lYsZJokhKQB
 8UeCI+UkKWmOnK0PkKKvM0JhWzT2+S5KPaz6syEKtnR267WTyIZPPGoOv
 Non/OjRGZEUBiVHKaiemySxZBOVpR8bgCItYBuR9y9VwkZHUVkOlUBGIY
 vLLoiwQRgFBTXJgfY437Y2AXNKYygu1WqetjaAlDfDUd5DpWQVdPg5Hfy Q==;
X-CSE-ConnectionGUID: aUYcb9wwTtu2gi7sczPlQg==
X-CSE-MsgGUID: hpFlfihoQFSTQ7rwPLUu/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23073674"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="23073674"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:49:26 -0700
X-CSE-ConnectionGUID: PZBK2fglTC6vSiMvqHxKfw==
X-CSE-MsgGUID: GZpIv7qWTrqzsi8HkrT1rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="56663780"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 21:49:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 21:49:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 21:49:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 21:49:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 21:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZXJvmFByaQTRF5S4JiWf5AYGaWMbgk298Km7v7o7LPWcIG9fCbYJnN4iP70x1iriZqv5J7uBVFspDLKi4xcfhLHDUiuIBD01diR/m/Jm/eei4l96++g/2dZLucNiW56gADjzcMxoWJb53o8ejwaLdxZcnzfEZMCmt4viY7YkbfXcoJ4mQP3MUfH4b/+ElIx38UPPs/b6ZPF0eIVRV1cbR5uyU07qNJ418PBOlmpc9tCk9suEv6atMYADJIcIaLT8fAFPF7VjqoZSbjSkM5G0VJTcEEKHfNPpQ8aezv+QCKph9T6XvCWZ3e1GuiyM/pSXRpHjYtghKCfJIrL3aGO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPDJQ+0AQGAy3fFrXyM32uOnqKHhHkN0KxnAOup72r8=;
 b=ec7WamrM0BTNajYGe67fTrW+BEwoG0VD6W/dGAgyh6SCo+bMhuoUgv5+cZn0y+3bsQvZ9vLLiwMLd/N2ZPFKrWuHK/XOVG1722fohnzoa9KcmMZfUPaiZQSwVMs02+7nZMoaY6irG+No1kEqTRl97saHLAnCgm0B84CEHCKaVWxFzaAROppge5PuS0y6aOl9zyQvJcLZomJ5iNeqM+x523GBt7UnzvdmETqEoIBROqTDNi1i60U1ySSvMVplUSDZXUUHIPYLcXepnnXg3rFzJPkTuhmZrGM8RULqcShkQmLze8kt2gFHZ8cN3qDqjU+nQkcyuVNP0x3EtPhIPXEU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7694.namprd11.prod.outlook.com (2603:10b6:208:409::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 04:49:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 04:49:22 +0000
Date: Mon, 22 Jul 2024 23:49:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Koby Elbaz <kelbaz@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>
Subject: Re: [PATCH] drm/xe: Refactor mmio setup for multi-tile
Message-ID: <ujddcvpuf2xa72kyd6s5aa3ve5c7bf2ikuar7zbvedrsxlhvlw@hk7wseyvuegi>
References: <20240716195608.2819428-1-lucas.demarchi@intel.com>
 <172169058665.66043.10367828117499655662@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172169058665.66043.10367828117499655662@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0213.namprd04.prod.outlook.com
 (2603:10b6:303:87::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 164303a4-7a8f-4323-7475-08dcaad2d1ca
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M1uY76vyYsqsK+iXAs0yJqA8dV8Mogh9Kdg1c8juateZFbQatrDY63m2wJaV?=
 =?us-ascii?Q?ZYK1Bo2nR1PjLcssGckmPgOLP56OSx96Qi1b/f5yAn5QyOVshdPiX4zFFiw/?=
 =?us-ascii?Q?YG8wCGlfVocqiSWbPs5r9bToLWcWqxcT2UAtMPD2igyFDbn3BrhQ65IZL/1X?=
 =?us-ascii?Q?/YMm2lIc0UksIB9gM5akFHzVQyT43+qv5h+vlQ+ZBarQQM7BeU0qFKAx8l8c?=
 =?us-ascii?Q?5HcFBPOtRpHVfUGjKBSSkjiHbgFmC1ODo3OrHwl4QFIVKugDKfpRQhut5c2b?=
 =?us-ascii?Q?tuP8JOmX0MpWyzUmU8ZVSsR7CKGdTaeBjKfo2a9inIJYUxrFLOURvQREjuQZ?=
 =?us-ascii?Q?PAgh49IcgURytwMiYRfOgtE5K+e42o4LsHIiyZMQ7boFIb/4wBOay/A33K40?=
 =?us-ascii?Q?r1acUpQarzN4TmMfN9pVNLHMCm5/35I3EvMCnlOUZ2W8e5Wqnn8C9STjJDve?=
 =?us-ascii?Q?OrwsqshdU8pDg3DKcD72jE4bDo6lGK4b0z4i7HjmPzFpRe953qyrX0ypJC2J?=
 =?us-ascii?Q?qs3fXXslQauKbf+TuK6gAw42CNu8aY2Fq5HfFuf5+rb1LAoLOxfFtLA7VHxA?=
 =?us-ascii?Q?PqBSTUnenHTyDguMV+/9CbrNpHHXStUjK4iGHxnn6+bczmhGfVCBY6S0n/En?=
 =?us-ascii?Q?bymEMCKrNM6BZzkXZ/O8ym8PoiyhCX/xpLzmtTe0LoCQaecRCKy/RcVuEcXL?=
 =?us-ascii?Q?KJX3Y4P9qYJT5VzVYTm/vBdYPLWNScr9TsY1RSU1EJBKtwqM1wiKwMvNbolG?=
 =?us-ascii?Q?VGQgset9Aya0zbFx5MlaE9/xC1QfNSjzJ9pggMVdSF0gVXkHG5+5t8E9yQqk?=
 =?us-ascii?Q?ZrVJMS+O5K1KRjfe1suYIDRSLYMINKS/LiuFOAvNfQf+HPF/GV4zRTLdXjad?=
 =?us-ascii?Q?MTeqwnejwfEvNVORZOj6s4Ly4RTUhfMmEyf9lIbyT7J+NM+i2CsLQZ3yttvc?=
 =?us-ascii?Q?6PKEJwUPgKdhVzlFYD1adY+rh0iZWWttxr5NZ4mMtVplR+bXTB9V4d4SVLKN?=
 =?us-ascii?Q?MLLK/+ngiAB91IHE6LDGC+RmVZi2bgNQ3fcN6EY1AYEtDmBbPg2hZkvXI0NI?=
 =?us-ascii?Q?1a8Qp4yHvx2+yYyMME5GGHARbLDp9PiOHTkeYkZ0c3AFsELmJZtFfNNdATQ/?=
 =?us-ascii?Q?G8zd0AeAL8HScVEVhf05RK8pphpNx2cKWvx+gr7boKlTMHn8ZiehSt907cui?=
 =?us-ascii?Q?505sTO6A+1yDdeDWWIVnOhmMR88uw/hmvc4+eLbVHEFqG3gGLJ/O9fHBF1Ze?=
 =?us-ascii?Q?ORpgUZ3kshthkHAYKkaFkpNIPn65MjJps0niR3EjB+1ePpujsdGtRT++N1Ke?=
 =?us-ascii?Q?hVGMGw2Jcmfivr/xSVMKQJJDostmh9dNbdg5/WTGLBkxMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xUid+QqbVTgbE4Ic8Nv3UaRsPiv3j2w9ZbpWOceQbd/HK14HGiKdDtKa4fLi?=
 =?us-ascii?Q?RfImW2ojP2XLe6hfb8L8sgxgO8fiK1vtaq6NDdJLkwkowMwvtPzctj/5TvYM?=
 =?us-ascii?Q?B9OE4NObzdLq1ciuRU8fhhKxH+mL1GzAsHiErlv07p/Yaj61MW7eBFk4Gvto?=
 =?us-ascii?Q?40QlKdo42pFpp3B2Gnvf4auCb8cVSrcsCGHhO2/h+Ac6QhqMD2CMpFkGMdTt?=
 =?us-ascii?Q?6UOnndehqh+ixoTDJB3ePB3cP/2RgXQGmGFwJX7+EQqDFIeVTS/UQbRM1hxM?=
 =?us-ascii?Q?dAmTKOu6cso8g1DCUY+VVmf11a4cbTotKE/SghwaalUYA8Q7K2AvvQz+SXqv?=
 =?us-ascii?Q?G5toJPvORXFUY0DeImgzmjEh8MRWTM17EUTkcgdnaCn2iGrCFtZIBIW1F7Ox?=
 =?us-ascii?Q?F8SWa+89/bSyCKvzV951rltpk3lmDfZF4/JqHgT1aEq1oiNkMvHXeisjWOMp?=
 =?us-ascii?Q?ss7oauG84QjrzFa+PHWoFmSPdjT5cEXxpxtx2ESJUiprnK2A9B4JAOkwfqu0?=
 =?us-ascii?Q?rDMcyP+Ha/FxwGksbAcCmI/uIfDYwiSRGNB3tXkgGFClxR5qGYKdckfApnPG?=
 =?us-ascii?Q?oGLDIGvCRdYsVhtOj5iZs4BlgxD6ADtWTJb85UWH9kfBzKnOQFGOsplytD8p?=
 =?us-ascii?Q?tHfLZVGYqDNGiWw/18ZrS2o/iAzEYdf4S9rrshR/JeeHvF4+ce7fmh1VNmhF?=
 =?us-ascii?Q?hElsHqiKcAfH5DnKuKrJYSfZvl3igrE/zOa8DFAW/OR+GjFvEamtGmSmyt3o?=
 =?us-ascii?Q?KNWXsqp40xH1sGuPxS8KHminxNuaFgYtnFGWnBMBsK3qVwaQq75PynZlvV50?=
 =?us-ascii?Q?z8OAUt9ZYYOpxz/F0kZHujGkvX5eN9Tb2nIILXzcVP2UXEauJBOrbSZ4Asr3?=
 =?us-ascii?Q?17IVe4qp5p9YytIPfkvccAotvcE18sKWKEhamvk6NlBIHisI+iA5ftVHHQFs?=
 =?us-ascii?Q?TTUvoaOH6CV0n0Yk6FGJ8qKgZLrr0Z/DtPOIRPHdkGuut39h5A3RHH6+QPYa?=
 =?us-ascii?Q?eNRpEFoCQfbW+3nKVvqxm/G/4gDZk9o5Pbiau0U2CVSeu97CEfGARSxsWZse?=
 =?us-ascii?Q?dea2Dj2v069XTT2V+wdBaxeYiBXgmrmh6DqKtDrc/f4bHpOPuY7QzLryfhTr?=
 =?us-ascii?Q?rXMn7LJ+vHgaBu5AxGGtelHZGzvL0mCq/DUifuQ1jR47ptuARMLcJFnD0wzV?=
 =?us-ascii?Q?OCR9eHsx+F+czLFytRCNOMSKqtCHAS3OG3gq1jmH4A9/JEW/4EZHE/yRiKLZ?=
 =?us-ascii?Q?DiFYwQ/SEct3Wxc3Jz3Cb8e5qvLL0PUYfNRD5GryQSwF5BgjKBSM9fyqI3Rh?=
 =?us-ascii?Q?L+nRg275Pd32NlzCmeHuLVyHOMFer9XiY1cOESxWSzecm27wV99ouyplC9+3?=
 =?us-ascii?Q?Lm+SzdE5n5nOkgweJ9+bhEudWBB9nVVa/Z6++m/mu5fcFFpxoLBV02+9kZZu?=
 =?us-ascii?Q?oGbXT0aQ3JvwmQsIBseh3RRYt0lVTDTeWwB7g4X22zKT6MpHV8AaqhBgSdxd?=
 =?us-ascii?Q?4Z500ZB14WySwm3U7Ik8Vp7sKbYiEidtDAY9l6FSamihgjwlt3isZMH4VosU?=
 =?us-ascii?Q?SRYg3ExY3cBuCgRqLp82GBUZWF9DdwBOx67r+k08csoQHUKFKpocwjWTftCY?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 164303a4-7a8f-4323-7475-08dcaad2d1ca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 04:49:22.0796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBv78q553KATv+VTw7gOsozns8h6sZwr5Mnv3v8I04h+Pv7y9uqvQZipBnGDtQm+W9YEOfHU6R/fIo73WNW1Q3Z16aIkFI/cPW7D/vceuJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7694
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

On Mon, Jul 22, 2024 at 08:23:06PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-16 16:54:28-03:00)
>>Extract functions to setup the multi-tile mmio space and extension
>>space, while better documenting the final memory layout.  No change in
>>behavior.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>
>>tested only on single-tile platforms for now. It shouldn't change the
>>behavior, but it would be good to get some extra testing.
>>
>> drivers/gpu/drm/xe/xe_mmio.c | 99 ++++++++++++++++++++++++++++--------
>> 1 file changed, 77 insertions(+), 22 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>index ea3c37d3e13f..31f6703daec2 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -33,29 +33,56 @@ static void tiles_fini(void *arg)
>>                 tile->mmio.regs = NULL;
>> }
>>
>>-int xe_mmio_probe_tiles(struct xe_device *xe)
>>+/*
>>+ * On multi-tile devices, partition the BAR space for MMIO on each tile,
>>+ * possibly accounting for register override on the number of tiles available.
>>+ * Resulting memory layout is like below:
>>+ *
>>+ * .----------------------. <- tile_count * tile_mmio_size
>>+ * |         ....         |
>>+ * |----------------------| <- 2 * tile_mmio_size
>>+ * |   tile1->mmio.regs   |
>>+ * |----------------------| <- 1 * tile_mmio_size
>>+ * |   tile0->mmio.regs   |
>>+ * '----------------------' <- 0MB
>>+ */
>>+static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>> {
>>-        size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>>-        u8 id, tile_count = xe->info.tile_count;
>>-        struct xe_gt *gt = xe_root_mmio_gt(xe);
>>         struct xe_tile *tile;
>>         void __iomem *regs;
>>-        u32 mtcfg;
>>+        u8 id;
>>
>>-        if (tile_count == 1)
>>-                goto add_mmio_ext;
>>+        /*
>>+         * Nothing to be done as tile 0 has already been setup earlier with the
>>+         * entire BAR mapped - see xe_mmio_init()
>>+         */
>>+        if (xe->info.tile_count == 1)
>>+                return;
>>
>>+        /* Possibly override number of tile based on configuration register */
>>         if (!xe->info.skip_mtcfg) {
>>+                struct xe_gt *gt = xe_root_mmio_gt(xe);
>>+                u8 tile_count = xe->info.tile_count;
>
>Useless assignment.
>
>>+                u32 mtcfg;
>>+
>>+                /*
>>+                 * Although the per-tile mmio regs are not yet initialized, this
>>+                 * is fine as it's going to the root gt, that's guaranteed to be
>>+                 * initialized earlier in xe_mmio_init()
>>+                 */
>>                 mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>>                 tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>>+
>>                 if (tile_count < xe->info.tile_count) {
>>                         drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>>                                         xe->info.tile_count, tile_count);
>>                         xe->info.tile_count = tile_count;
>>
>>                         /*
>>-                         * FIXME: Needs some work for standalone media, but should be impossible
>>-                         * with multi-tile for now.
>>+                         * FIXME: Needs some work for standalone media, but
>>+                         * should be impossible with multi-tile for now:
>>+                         * multi-tile platform with standalone media doesn't
>>+                         * exist
>>                          */
>>                         xe->info.gt_count = xe->info.tile_count;
>>                 }
>
>Unrelated to this patch, but I suspect this is an odd place to probe the
>hardware for title count. We should probably move this logic to a more
>suitable place in the future?

yep, I agree.

Actually the separation of the mmio multi-tile setup may not need to be
that late in the init sequence.

maybe the override of xe->info.tile_count and xe->info.gt_count
could be moved to drivers/gpu/drm/xe/xe_device.c:update_device_info(),
just after mmio is initialized. But maybe moving them even
earlier. Once upon a time we had xe_info_init_early() and xe_info_init()
where these things should be happening. Note that SR-IOV breaks the
sequence in a not-so-obvious way since it needs more of the driver
initialized for a simple mmio - see how a read is redirected to
xe_gt_sriov_vf_read32()

>
>With the removal of the useless assignment to tile_count,
>
>    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks
Lucas De Marchi

>
>>@@ -67,23 +94,51 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>                 tile->mmio.regs = regs;
>>                 regs += tile_mmio_size;
>>         }
>>+}
>>
>>-add_mmio_ext:
>>-        /*
>>-         * By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
>>-         * When supported, there could be an additional contiguous multi-tile MMIO extension
>>-         * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
>>-         */
>>-        if (xe->info.has_mmio_ext) {
>>-                regs = xe->mmio.regs + tile_mmio_size * tile_count;
>>+/*
>>+ * On top of all the multi-tile MMIO space there can be a platform-dependent
>>+ * extension for each tile, resulting in a layout like below:
>>+ *
>>+ * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
>>+ * |         ....         |
>>+ * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
>>+ * | tile1->mmio_ext.regs |
>>+ * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
>>+ * | tile0->mmio_ext.regs |
>>+ * |======================| <- ext_base = tile_count * tile_mmio_size
>>+ * |                      |
>>+ * |       mmio.regs      |
>>+ * |                      |
>>+ * '----------------------' <- 0MB
>>+ *
>>+ * Set up the tile[]->mmio_ext pointers/sizes.
>>+ */
>>+static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
>>+                                 size_t tile_mmio_ext_size)
>>+{
>>+        struct xe_tile *tile;
>>+        void __iomem *regs;
>>+        u8 id;
>>
>>-                for_each_tile(tile, xe, id) {
>>-                        tile->mmio_ext.size = tile_mmio_ext_size;
>>-                        tile->mmio_ext.regs = regs;
>>+        if (!xe->info.has_mmio_ext)
>>+                return;
>>
>>-                        regs += tile_mmio_ext_size;
>>-                }
>>+        regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
>>+        for_each_tile(tile, xe, id) {
>>+                tile->mmio_ext.size = tile_mmio_ext_size;
>>+                tile->mmio_ext.regs = regs;
>>+                regs += tile_mmio_ext_size;
>>         }
>>+}
>>+
>>+int xe_mmio_probe_tiles(struct xe_device *xe)
>>+{
>>+        size_t tile_mmio_size = SZ_16M;
>>+        size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>>+
>>+        mmio_multi_tile_setup(xe, tile_mmio_size);
>>+        mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>>
>>         return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>> }
>>--
>>2.43.0
>>
