Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C98C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 15:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF2110E4F4;
	Mon,  3 Feb 2025 15:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2tRmUus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCFB10E4F4
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738597022; x=1770133022;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q+Kfwh3nmccbZdHUFBkcrdlL5BbebG0DGVzNC5vWghk=;
 b=C2tRmUust1FoJUHCCXKyhZNrrM8cEo/BAsgoqnH7Jszc0snnaFoPG0Hy
 rxZiDzjG0KSk/d3cv+HwPMoz2wo61MmD4wNo2P8WvWyCQ8s0AxugGs0G/
 SPdsSYbLh+y9uI/u+id52Z6DXl6NXE8a8kf58iXFr2dwTVvuAvec3fWPh
 kx2TWFz4ao+LPH/WTbS26Pw49nx1Os5CeX5w+rHKRnlmLRluHru7aBx6I
 0giX/Zz4Fj/P6Y1WYlK6VYUB2tk/S/4Ft/anX0oRRy5jwvm7GxaecYKF5
 Exrgzfq0XnaysPPYCzjTajCJ4zyvZGjwcv86BQkyW/eHYjLpFrSz7aNJO Q==;
X-CSE-ConnectionGUID: lCiPrnJuRnSHQTKb4zhbUQ==
X-CSE-MsgGUID: qu9Yn1zpSN6gvuSgm54bmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56522234"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="56522234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 07:37:01 -0800
X-CSE-ConnectionGUID: run7P1rjQrCG+ahzEZwIXQ==
X-CSE-MsgGUID: 72LXzcdRRYiwp0cowR+bLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133572250"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 07:37:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 07:37:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 07:37:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 07:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtBcb/Rv3FWZ5hKbXNLHxyXc88zey9zyfQ/hBntlmI5wbURLkfOYsez+OtfXoIHbzoCNoEKQV2yfpQudCZQdx//sTesLGpvgmS8xIzaBNafKWqk/wSfEFcW1kg43JGeSHEw9/5pcqYt8MzcXvl+2EvZOOQzLIVEm23OSO7CqEzkgHpb1DUTFsmhwXQOunlwf+No3h6oJJw+ioOk28y7MdXGC+0EmST2fYyvUzQP0dSWZzcZ5XexvuEsVz/uDiEFMOJxDX4TsfC8h8PdKaAvgrWzUEvTw4LC0DGqqC+Jf2I+thVSGhW4bhMxlUiXtzIUc6f52qf4XbTAxNR8J+/AJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdqIEXsNRrN6bngY77vx6dGiRvkUAM40O+ihj25clEw=;
 b=W1+9htqwz0Hs+uLZVfb6Dk9LsuH8cx+nXy4Gwe9VzSxxB4k/oGGcFEPQzbWA8E6BeILg/k73hzwkRjs8wGEwWvij73C0/2LozZpE1ZnRvIyJLINCbY1ZS57IrPouCkKIFlKw8S/zsTQearjo9DcTIoJuF3wICUxtqNfBM1qrbDwBZyab6N8V0bCvOCkEWYs7/KPDhpo4xhzU/AMmuD/rpX7fIqQ46m9Hh2LlHG9/Ckr5xrMwO2tebVfxwzAb4jlIZX9nXI0lRk13vOriqFd6c1Wm7mCT3G7EAs+UAO/g5Iki4ZF+g39UEX7c93Ega8Vbk9asloBfFP/Owx8Myo6Yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 15:36:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 15:36:58 +0000
Date: Mon, 3 Feb 2025 09:36:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Message-ID: <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <87o6zj6utf.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87o6zj6utf.fsf@intel.com>
X-ClientProxiedBy: MW2PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:302:1::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8701:EE_
X-MS-Office365-Filtering-Correlation-Id: 4815af3c-3565-4127-5ac1-08dd4468986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PzIzWwLxLoNrbvAytXGWpAi62mYyEUKkyg4mNUGy27GNuXCQ6Jgy/gp4vDds?=
 =?us-ascii?Q?/HKCE90aHlExKDMugma//EbXby7L4bmw60HDEv9VFxVvqXB2WEfLT73MgHDf?=
 =?us-ascii?Q?QCppQxSEfV0yO1xRl1w4LH+ZG6B1L+wedE6Ct3URumrA9p3H9GHgd3WeQR/g?=
 =?us-ascii?Q?ijcL/hDHwNU9Cj6Il4bjdXsImoZBFvYdKv8l7JfKt2hEsCywC566he5IER1h?=
 =?us-ascii?Q?P1SX+uu7yzzy8VfbhzDzyac/BYVuBMq9wzqynsDKGovop2GSoGn3U+c3Gdwx?=
 =?us-ascii?Q?aJdpCcgCemqwIkDXSQR1gzki3bVX4EWeRGfjK+kt/cb+dsS/OWAK4BDI+bBf?=
 =?us-ascii?Q?o+ivRNtwty+iO1MJm5NhYbWYBVuL8eDobL6ZLMKaUO3M0T4k76TSlw4hQ9Be?=
 =?us-ascii?Q?ckHUUEfwhs42bPykoVoeZPCzQjzjagBdPvVA8FJ4ZeF/tLIHp9fn/E4D06I6?=
 =?us-ascii?Q?+R5/QoqiEjjUIwx460U6XiT9VNaVOQdz98meW+Lhpp94We0lDtaCoclzLOpC?=
 =?us-ascii?Q?xN2F8nH0hMl/HNHUzWRUaqpdjKYSUb/jaraM7faQ0/vPSjyXV15Ol88eE1V/?=
 =?us-ascii?Q?fitwi9rd24J1nrOfzC4PpqTVACeW2bdQnNvVQGxS86ui5MAs04aR5YfRRnhX?=
 =?us-ascii?Q?FYdMUc4hBPi0lwSBljoDYOfxy8DWBBk6yha/I04CZP5T5YAKP1QpzOFlVc1e?=
 =?us-ascii?Q?mSAeEJ1QsiqCk/DvnpJ9Ob8UXZDpXtupSuLq48Bjvgy/FKfNU/gY9Nw/kdX8?=
 =?us-ascii?Q?aFnKTVJBAGkTESk9+NlPiNqcvMbEu6thNOhDzcKG1wsOnfRJARJQsNW03ILH?=
 =?us-ascii?Q?2vrLcHdnXFM2TYjHWOHj05pQ3f+qeyF7DjKrIM02RtC+e5A33vIxiDV3CPg0?=
 =?us-ascii?Q?YqgL3nXPsDjQrz5sO7H0+ZAezWOwAtOwsAqI0It7M9//gorzDIPCUgk4xxmi?=
 =?us-ascii?Q?zrsconMtrwLppVqn5O3ENksjVMkfZUHCgV9/zwUDFZOrc+ANYr/2RK5KPoMe?=
 =?us-ascii?Q?L/1i2cNjfv7rAZYIFBJEGSTNUnun2x1yNNfVDnJIEaa5p8nj33IHD3bpAbMZ?=
 =?us-ascii?Q?WtJSY6CpexLMfj0RFiqlI5ieTqPMS0acsNuX0BxUbjUKM6LMsacLcbfTx7HF?=
 =?us-ascii?Q?vjRtDTlWAus0aD9/Zy+zyPZ7NG36n/U/Cf4wbYUiLlgCw/7KCdBdQoHc4z+E?=
 =?us-ascii?Q?8TegnPRfPbgdYrVpUgMYZQ7xi0V5MLx6OFCIEMZWt1vnD+Sj1rSLPsxdl+Tl?=
 =?us-ascii?Q?AO69/JjwLYqTeyDpZHqSvsAE9SM23lAb1aSIk2KzCryE/binV4MAvx/63l6J?=
 =?us-ascii?Q?KAa1cxm0PKclfu3M8DEBd8djDHdKicfdMTB7iVAfLLO7OlXdvoy8ussyCUqj?=
 =?us-ascii?Q?DwX/CDIEqgQyOf9WxjN1YfuDQ2+e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+2Iqh7FcGUca3JQh7r9VEtQXt2BC/Sk+mGuOr5kT/EgM8DI4YtBQsCFioXW?=
 =?us-ascii?Q?GjR6ph8bIbs5AqKuQXQuLKm8z2pcERXb5gZQLqogWDtLRhpwVmPNI+dc/o4R?=
 =?us-ascii?Q?lXcNMhY66jDBKGf03aiiiiVUP+jvqrTtp4m07wx9pVey+56Wf+yW1mhgDbO6?=
 =?us-ascii?Q?+/JYG7sz+ddwjME5YOU9hisAdXNSZUsdGHMU4GRORI+LRqhJbG4YYDWgZGC0?=
 =?us-ascii?Q?n39cOpFfksv4goi52GDzmTyQNL+2bPWDkWarEJyzuMi8t5xh5tjiIE0rZfAL?=
 =?us-ascii?Q?OWW0i2LG7QmjHJEVPgvz1QtJiw2UXuaHeJLw3luCLttXJdyTeg3I7KhtT1VW?=
 =?us-ascii?Q?pq9TBg86YEEah902ImGstRpWA/ABKxOIrHP1aCPd3KCphmksOd6wf9OTJfiv?=
 =?us-ascii?Q?yceDc8KPHHvfbp+KVq6MdeSFfmhvGrSR2+VzDPj2IbF39lotFXo3oGp56Snp?=
 =?us-ascii?Q?QrCdYmm1f+Lm2a6RQVlPEjaXGvAkydjXNPfwHWtovq2Woy8nbWpC31JsDL8f?=
 =?us-ascii?Q?bRmiKhlkbaUtLB8pxMdpdv/3VdbgwMzByNnumneud+A21tGrgnFXFOE8632a?=
 =?us-ascii?Q?trftfi6quXmAfCgxL3UFczWYy6LQTOmNDkDUepSAWb8WBf1IUxIOK3GH7ma8?=
 =?us-ascii?Q?lKFAHwLXrLPdiVBIJl7v2Tcw5vgT0ZTTOSMkorSYV+47yAjjYicJFCuTSGbB?=
 =?us-ascii?Q?fqF9JwHRGWWtiJ8q5SzZFo9VeuoE+tWAR5GMIVzZb834hm0qYiJloNBaVJlD?=
 =?us-ascii?Q?XRM7m+qfJlJKMh3Zor8FCDzirt1at/cSH3MzN04U764I9TN6XD6UpNi4TdIO?=
 =?us-ascii?Q?7vpUJ+gplAIsTiIJQVlF/klC+GasNl3wUGOL317PbEcHGGnRXBdyzcOLS3vl?=
 =?us-ascii?Q?asV3J/PNcJzzQYQGUKFZAX1vQcNGMeIJdqntWRVEUfAsYil1u62oy36y+W+w?=
 =?us-ascii?Q?+pEL5UN3XVreo7ofVsHQQ6wsMiqZ3Ka6ckP0x8HRadhu0atPoJNCuqLXnP7I?=
 =?us-ascii?Q?aDU9TsEsEezPO319VH5HNqjHaK8SbusCa8/BX8RL3o7xjzWL+yJIjllNk8/z?=
 =?us-ascii?Q?C+8PyrJTLdr2uukI14I6yrWKaWobo12YkKj/FZxUWeuop0mbF6OD61DsFcv5?=
 =?us-ascii?Q?0V9cNRUC+EDkZsvBb7a2c3LKDAxCkKL49pdki0RNezniYw2fE1dJk9jHQ7c3?=
 =?us-ascii?Q?ft8bTQXYWZr8Pij6dvLB8pfGCLHLxP6Ye0+vMYanLZ9irE13KidsY7xyhnXG?=
 =?us-ascii?Q?lHDlld1Yksd4CDets1hG83xnLIsdtwS2VL7FbEA+pVk3ONLVGOJ4KHp/FeeW?=
 =?us-ascii?Q?JqfXFWFU263qbiIZ+WSdxNFGtMdtv+wzwbYHCCGos312DSOrK7k8iSUz2grC?=
 =?us-ascii?Q?1IozHDCdsRh3QD93K7nfjF6/YWhettPMtW6S5zNWyzbDTuwOV5b24dDKSK7Z?=
 =?us-ascii?Q?BANtP6fppneBpfJgT9wL7vft90/N8T3uyuvyD6ThWArp5vJf9npbr7Aovvwg?=
 =?us-ascii?Q?2lEjR6iUl3C4Lju/GzFuz/Mb/GlmpnmX9u2uHwlSoE3Gna1NoZR/JtRnn4Ep?=
 =?us-ascii?Q?CfHcsnEmHpfG2/8qkGg0SImWdOKl0My1zj3eBTdJB2iY2nwl8ihUZAs1ater?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4815af3c-3565-4127-5ac1-08dd4468986d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:36:58.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4pIKGJUbekH8g/6qoah+ubYqPfMIbQ1dIOx7KSxvbw4/TWJhnUDFtDNQtLW/v833dxIrDNwvWZI4ngpXloD+oMzalpuVBBKVGmiZufSFFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8701
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

On Mon, Feb 03, 2025 at 03:07:08PM +0200, Jani Nikula wrote:
>On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>> This also fixes bug where dpt could have been allocated from system
>> memory when on dgfx.

I'd also get the fix in place that will also be needed in stable for
platforms like BMG. Then the second patch to move it to this helper.

>
>Cc: Rodrigo, Lucas, Maarten
>
>Should this be merged via drm-intel or drm-xe?

I'd say.... if it's possible, through drm-intel since it's under
display/. However this only uses xe stuff and may have conflict if
drm-intel is not in sync, so it may need a backmerge from drm-next.

Since it only deals with xe-stuff, landing it through drm-xe should be
good too.

Lucas De Marchi

>
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>  1 file changed, 43 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 9fa51b84737c..c28885316986 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>  }
>>
>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>> +				     struct xe_tile *tile0, u64 size,
>> +				     u64 physical_alignment)
>> +{
>> +	struct xe_bo *dpt;
>> +
>> +	/*
>> +	 * If DGFX: try VRAM0 only
>> +	 */
>> +	if (IS_DGFX(xe)) {
>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +						      size, ~0ull,
>> +						      ttm_bo_type_kernel,
>> +						      XE_BO_FLAG_VRAM0 |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_PAGETABLE,
>> +						      physical_alignment);
>> +	} else {
>> +		/*
>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>> +		 */
>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +						      size, ~0ull,
>> +						      ttm_bo_type_kernel,
>> +						      XE_BO_FLAG_STOLEN |
>> +						      XE_BO_FLAG_GGTT |
>> +						      XE_BO_FLAG_PAGETABLE,
>> +						      physical_alignment);
>> +		if (IS_ERR(dpt)) {
>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> +							      size, ~0ull,
>> +							      ttm_bo_type_kernel,
>> +							      XE_BO_FLAG_SYSTEM |
>> +							      XE_BO_FLAG_GGTT |
>> +							      XE_BO_FLAG_PAGETABLE,
>> +							      physical_alignment);
>> +		}
>> +	}
>> +	return dpt;
>> +}
>> +
>>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>  			       const struct i915_gtt_view *view,
>>  			       struct i915_vma *vma,
>> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>  				 XE_PAGE_SIZE);
>>
>> -	if (IS_DGFX(xe))
>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> -						      dpt_size, ~0ull,
>> -						      ttm_bo_type_kernel,
>> -						      XE_BO_FLAG_VRAM0 |
>> -						      XE_BO_FLAG_GGTT |
>> -						      XE_BO_FLAG_PAGETABLE,
>> -						      physical_alignment);
>> -	else
>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> -						      dpt_size,  ~0ull,
>> -						      ttm_bo_type_kernel,
>> -						      XE_BO_FLAG_STOLEN |
>> -						      XE_BO_FLAG_GGTT |
>> -						      XE_BO_FLAG_PAGETABLE,
>> -						      physical_alignment);
>> -	if (IS_ERR(dpt))
>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>> -						      dpt_size,  ~0ull,
>> -						      ttm_bo_type_kernel,
>> -						      XE_BO_FLAG_SYSTEM |
>> -						      XE_BO_FLAG_GGTT |
>> -						      XE_BO_FLAG_PAGETABLE,
>> -						      physical_alignment);
>> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>> +
>>  	if (IS_ERR(dpt))
>>  		return PTR_ERR(dpt);
>
>-- 
>Jani Nikula, Intel
