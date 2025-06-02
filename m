Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E29BC5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 15:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F210E563;
	Mon,  2 Jun 2025 15:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etICWA37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2A010E564
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748879470; x=1780415470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E0yEIhyEYIMMVtwSgwoFZGV2zgO9ttOioKdCnjzzahE=;
 b=etICWA37Mmf0bGNeaRaQBGNtcq9VR9PCwAE1FrK9pLggc2ji56+rplxv
 Lqn0bNECN4GhmBH6S9YtGROUAqSDXO8mgvUBcAE85ftal9PGFIaGDGPDx
 uzbk1Y1r2mnS1+dO+6B04U2HSJTSeS2iAOeNAZBcmqORJlAkTkRXyDDD5
 +aOLeRn5p/CpySN8IWJmfkSkX7iYXV22RhfpiYYI9qSm6nx5wxLnD5xJ3
 bbWn+JzQ0cxGwYC/MH7VU41AZ+wmSlBHaGoYHYuPojPpAjqH35ZDWjVJP
 kbYfZSuvUBfuD4ExV1xh453F58bRFM98XFPtEiKr+5R6k5IFLSuuEdZnm g==;
X-CSE-ConnectionGUID: aKD2Spg0QZW1+rejmwsRyg==
X-CSE-MsgGUID: yJwzJnPcRSS7P8wOgrkCoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50758855"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50758855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:51:10 -0700
X-CSE-ConnectionGUID: BhjJjY5NQuW7RMH9BmbK3A==
X-CSE-MsgGUID: MsmwRGVYQ32Nmmxwmlsgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144408837"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:51:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:51:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:51:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd1CCbKgxJQwMAm6Zc5yhPBng11I+PcjYHRERhL9pGSDKejxCgyYQ0fFm72M+6T14R8MWCIop9i+5ypCvEa8GrEtI0spnWRhb7n1BjvpqV/xKSwxvwNIOPSCUYlmgc4SBgZ2kfLK+0ZigD7Eqv7IUBLHjoW0pv/0ZXicXv3bM8ZUqcg2vVR6IXne7K1BvR8KVlc/nZ+SHJF2K+ItZZnUwP6u+1w+PtU9+dP/Ii3LaF3YBdBza5npXdSutXGcVj3TZq6gZILVkDabb1PaeooLfM30WIQlHymXAdlntS6oc+LahmHJzfBL9T+8/b6BMNX477ZkC357Lj4B2FKqxIupMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pt8+BnTLLQpwYDD3A5z6WChAt9DSLbIo67HDOCX6aw=;
 b=ZrqmQ0oU6o6yZVw7iVf+KzaJZHJ8/9PZtE+X/GpDUNr93Qus2j9IvDKFNV5Lhxat+o/6snL+ljox9+m3/7K/FbiS0hWbzG5QA5CCmQyHpykaz27eyLORaqQmVeTuSD1IE9xcib8wX+52b9zU4AP2XRd4XnpLpr+JkyYZj429AEAv3Mc4J0J4UvKcLcyn5KNph/WclDxuPk6T2OZJTrE4Qi0/Swt4zUGS5moxAV8sBxtU0Cqq9GybqOkD2d+h4Q5k+ZoYOAA9m9DjM2T0OpvlxL0hIPAzjYRLjSF3sys/zgTUU3QAfL+JE+s+K+XUcBGSRZgfEeuVkssox31hmn4/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:51:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 15:51:01 +0000
Date: Mon, 2 Jun 2025 10:50:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/6] drm/xe: Use iosys_map helpers for WA BB emission
Message-ID: <ct6dtxh57vebxjvj75jyzqui4mg3jvp5lourbbh223um3so4wq@7tn3kyvqis4h>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
 <20250602111956.14854-3-tvrtko.ursulin@igalia.com>
 <r2alqrhauj7b3dbtmc6oicp2jevhlniogxjgggovw4axlyxzqd@5mnufxsin23l>
 <e98414e8-a487-4164-89db-86f9a98b06b9@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e98414e8-a487-4164-89db-86f9a98b06b9@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: be592def-9315-4e9b-5b7f-08dda1ed4605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xQM+gaMlv4OtHVNbMt3buO7XlgWF5Tg/3POETZptD++rKzzllaci2K7PHW?=
 =?iso-8859-1?Q?8sejsnAG5IMnIejNNJ8rgkAkk3oEVEtgWIxHs+oeadwz44kaHrPN6WItRP?=
 =?iso-8859-1?Q?13f1RvplEtm9DgVIhqpAuu8y4COPDtvGPtLqfNVHsemhnqnlJoFX2xSPq8?=
 =?iso-8859-1?Q?aJjKetUvjs/F9+GajiO+9jY34tQH/nD/2bRf+uEdQu3i4zLPOYcAGLSi4o?=
 =?iso-8859-1?Q?ncvPPbmR4nS7/d2ThWtDSVUuGKoHdTHk/JFBvQOISRC90aFv0GyNwypg/Y?=
 =?iso-8859-1?Q?an6I13XWQznRWLF4jkC3OeZ9jYXPSOWpkoLcEZvP+wTRd2zJbGZYCL5Ew4?=
 =?iso-8859-1?Q?MzGD4XHByw1uoH7hIMkVYn3H3thHjfb0dI/1nHsKaLt2Ti5TCnCHeJcbSZ?=
 =?iso-8859-1?Q?PWvPtsZ6BWaxYRhL3x7yF3FugTOx/GOvlCWG6SiuA+CM2/+wiK3G7f+clm?=
 =?iso-8859-1?Q?Ykapz7EuBkOIJIg1OI7SK5t+ZWXryQ6OEIWCyrkv6KJzDP0Cv7eTpQa/hb?=
 =?iso-8859-1?Q?2fR/7Wg6bN/sVjET3ZYQvr5vaGc+H6noYzViTOH/UJejhvaOfe08PWFBlk?=
 =?iso-8859-1?Q?9KoDAMknPM/gi0SwWD7nwbLZnCLccLIwfx542Or3L4aXDw0fY0at7QqUdv?=
 =?iso-8859-1?Q?k+vkGsrfbKqttdjJE9092aSxup7m5MMjdsIb5M7erL5dtee+ePq37hhlaV?=
 =?iso-8859-1?Q?zwUMIL7jrFP+ys1tSpP5OHjSadZh/3TIdQL2kBQoD4xdd2jbYB4LTcmHxY?=
 =?iso-8859-1?Q?vuZPohJxtDHHez8JvorGmAOGKbn/E9FrbCGcMtgdUbb+cyOtp+kmGjsSb3?=
 =?iso-8859-1?Q?+suezcIYSU5oJ+eto7XsPTQTxGys9ptM+cEfTJGo+cFr7zAi5dWm7s2gtd?=
 =?iso-8859-1?Q?4p28kkLuo/XPyjqcJUpUcBVlkTozUEtjLfsHZe2TtU4TaKtYU/fYqwQEBk?=
 =?iso-8859-1?Q?+hgQsoHXZh3LFn29nzDeFUx1e6BMvC7L/fGFMlxhgl27jghAc/zbDo81gS?=
 =?iso-8859-1?Q?PAHFNrqFQ9TiMyFnG9wBDUdXHn6LGkzIVnaTb9BJ7Masas8GMp+iF8HEm2?=
 =?iso-8859-1?Q?sFnZtgE7dNaG0jTLDmK6HXIzIwCeImPeUgIvl77Y+m+XSAgm4wRarrd0zT?=
 =?iso-8859-1?Q?X6v4ic3Xwcnm2YBfRV7h+i4ca5H1dk7rcZFfClkurXY8hyB0IZ/n5IY9Gh?=
 =?iso-8859-1?Q?VR5lblKchLGnOp/WYhd+mkwodjt/55HLuxa5BjAroNoL45COm/5BzSo4xp?=
 =?iso-8859-1?Q?BgxEMCr9YGANSDo1orr0BNrIeJUy+QjmQm7911/vdRgCWesVXW4N+DD3zL?=
 =?iso-8859-1?Q?WrUpjXKdyXtkMPz25W9KnkGgGFLvuP2Yeaf4Ke1EH0ltXos2E+uHwVI8bM?=
 =?iso-8859-1?Q?W4OuLBB50jhm5e+qUkyePics4APyPCj6Nz/Y7PrXauvwu6Q0iAH7ipfqq0?=
 =?iso-8859-1?Q?4J3cjOlGOlm8Ex6n1/+nM2FKPs2c+b3yhpHXfQ2H4n0AsP5z8RuH7QtjRD?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Vw28EvjWFKmUK6OvhZ0r1sMi8nLhrJaIQUmNSvLxFJhj1pXlJFu8eHRv2X?=
 =?iso-8859-1?Q?6BQaXd11204SwHslUGUNd8gr89UZoRBV0vn8hE1L5XPh3wd2WpsH3tsHrR?=
 =?iso-8859-1?Q?RjUGugg92sVPCm+48lUkpax5OmSUBOZpEwh8xDZkk8jes3R0Zlehui13gT?=
 =?iso-8859-1?Q?X8c7e48ujWIa7EJA86+34cEAgQW2NsBWmDaNrt7wOwODkSjUMdt+L0Hc8n?=
 =?iso-8859-1?Q?0zWhYyBdIgj8NCSJEXERW130kVa0TrGI0/xI17Of3s/nEhr5+NjH0RAYpw?=
 =?iso-8859-1?Q?f9c/ViIsigIuEUPEXgX0pNwuJSuijoPJ75Mc2j1i287k0bpAhrygr2briK?=
 =?iso-8859-1?Q?D0lC6HWPoCujiLJsudZtB2DeG9qa1c9GImGdxvKpriyOn5GKGbRxqk2E8B?=
 =?iso-8859-1?Q?aAahEx5uMocEQjENPjK0VjgZhOba5kTLxf6rfxXcFM5m0epvs7yCFrsI1u?=
 =?iso-8859-1?Q?bajGR7qpT6QaU+37ztntoRw1o3h46RiCswhfZo+CAUCL8i9FTEYWlqNnWZ?=
 =?iso-8859-1?Q?LrkjHARwuz/wcyZHMHNQZQBrxwjF1L+5fx+mK/NGo4fU8Ta+A0uzanmk4Z?=
 =?iso-8859-1?Q?II7R638ZHi+VipxTP1kJj+UXpmKZn6Rb61VZ2FSuwflIA1lzoze5R8e8Rv?=
 =?iso-8859-1?Q?VavOmUckUWgItGpLlLYreEGoyuJdww+ECy78h0HYkyYvnqCFX6k8zC1CPh?=
 =?iso-8859-1?Q?NgBRjhOTbe/tHBuHc3m9O7Y+rPuws7JSCxu2R7r5RnVTUv+bUGp5a87hE1?=
 =?iso-8859-1?Q?sCRAuQhasCtytcoDIX+4qn3GQzJr71QAneR5nJo1apnx5fiwx14OsyrS/5?=
 =?iso-8859-1?Q?76bNC5r7E6Y9YgKgsaCctTfhNouIGEjOupDoK0bBqDEJTwuNQ4b+omlDjF?=
 =?iso-8859-1?Q?eOiAaYBaFWCggbKXic+CahNhNcEWQ88x4s90wl0+1O6OyvjEYFcFWCJS1/?=
 =?iso-8859-1?Q?qMdUqic3qEvOL8ZEDjEykj7vi2TMb/QaHshb5LLLTBCdAg1sLe+Avcluve?=
 =?iso-8859-1?Q?ha0TBQS6GfoDT3OTWCOAbOujtZXEFRkUGhPBgtKr5qdWmX4ID6jCAjhETj?=
 =?iso-8859-1?Q?Jz492jDV7WaWQtVdmcSceXAWM+uWl0+Ddsph89vcuEngh9639vboypPxOu?=
 =?iso-8859-1?Q?bt0wkF69dbL94rMWB1tjZuwaP/qvxDZVdT5KYgpqEvGlxRI+ZkjHFpGUJu?=
 =?iso-8859-1?Q?QPBlRNG5Z29ztlHbt+cMHhDgwme15/Apmvaw2D6e9J22Poqo4iAnFTX+KX?=
 =?iso-8859-1?Q?0mINsNzZixieoPw0RZLU0Nl0ZDdUq2/cZtUadkD7cmQcv3qJeOe968ZlUB?=
 =?iso-8859-1?Q?d0LIZDhRcrb3Bf1B6XuzrGaq2N+p2afgiL6XA76m/e/gLpKpHZPhaiKfTU?=
 =?iso-8859-1?Q?WTBG0wV66gLSrBQ0bykgJijI/MPNkAGIXdMQAb8HxsE23GitLmtVQDciLP?=
 =?iso-8859-1?Q?TecAYHO1b99Erl7FvaO99ackg+yZOFV1e8nNFGXwZ8EQoSH2wtRvGtWuDf?=
 =?iso-8859-1?Q?b/3J/s0J0uZoePU+83b6/a9euYYkndnlapf0lYIBivOt+XsYGvVxceVS3c?=
 =?iso-8859-1?Q?35Lsi0uThpd7ykFsvi2Yj6kM22Vd7oU9fr38c9e2AYYSKm+OympV6PYFCK?=
 =?iso-8859-1?Q?+XLg/CyCnoKWPJdIVL0QZ2ai82pF8kM4v3+9Bv0lCroid4zxvX+A4wXQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be592def-9315-4e9b-5b7f-08dda1ed4605
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:51:01.2760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gOLQgrMNJ+lx4NLvFUwclE18naFBSY4mYXsChWBWKroT9jJ29ezW9QJvTogxpd1POpt2XH5KzbeSKF9WkAPdRObRrYJ8crN8ZZcJuHTd9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

On Mon, Jun 02, 2025 at 04:22:47PM +0100, Tvrtko Ursulin wrote:
>
>On 02/06/2025 15:56, Lucas De Marchi wrote:
>>On Mon, Jun 02, 2025 at 12:19:52PM +0100, Tvrtko Ursulin wrote:
>>>To properly support discrete GPUs on all platforms it is required to use
>>>the iosys_map helpers.
>>>
>>>To fix we emit the WA BB into an on stack buffer and copy it over using
>>>xe_map_memcpy_to().
>>
>>For https://lore.kernel.org/intel-xe/20250523-wa-bb-cmds- 
>>v1-0-40b337f71bcd@intel.com
>>we will extend the WA BB to other things (and that is the first
>>additional user). I don't think we can keep it on stack. For my next
>>version I was adding the patch below to allocate the buffer. Let me know
>>what you think.
>
>Works for me I think.
>
>I mean I don't exactly see yet how you will make it work for multiple 
>users adding stuff to the same wa bb, like will you consider a shared 

this is done via configfs that is read on probe only.... mainly intended
for testing new workarounds and tuning before changing anything in
xe.ko.

>buffer passed down from the level up or what, but in any case I can 
>probably adapt my series quite easily.
>
>In summary, you suggest my series waits for yours to land first?

Let me post this fix separately.

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>commit 28dbdf201133d92b0e0b0a0139eae7fe5eb9e33b
>>Author: Lucas De Marchi <lucas.demarchi@intel.com>
>>Date:   Fri May 30 16:29:51 2025 -0700
>>
>>     drm/xe/lrc: Use a temporary buffer for WA BB
>>     In case the BO is in iomem, we can't simply take the vaddr and 
>>write to
>>     it. Instead, prepare a separate buffer that is later copied into io
>>     memory. Right now it's just a few words that could be using
>>     xe_map_write32(), but the intention is to grow the WA BB for other
>>     uses.
>>     Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active 
>>context utilization")
>>     Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>     Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 63d74e27f54cf..1b835d7efca2b 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>   * store it in the PPHSWP.
>>   */
>>  #define CONTEXT_ACTIVE 1ULL
>>-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>+static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>  {
>>-    u32 *cmd;
>>+    u32 *cmd, *buf = NULL;
>>
>>-    cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+    if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>>+        buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>>+        if (!buf)
>>+            return -ENOMEM;
>>+        cmd = buf;
>>+    } else {
>>+        cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+    }
>>
>>      *cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | 
>>MI_SRM_ADD_CS_OFFSET;
>>      *cmd++ = ENGINE_ID(0).addr;
>>@@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct 
>>xe_lrc *lrc)
>>
>>      *cmd++ = MI_BATCH_BUFFER_END;
>>
>>+    if (buf) {
>>+        xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
>>+                 buf, cmd - buf);
>>+        kfree(buf);
>>+    }
>>+
>>      xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>                   xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>>
>>+    return 0;
>>  }
>>
>>  #define PVC_CTX_ASID        (0x2e + 1)
>>@@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, 
>>struct xe_hw_engine *hwe,
>>      map = __xe_lrc_start_seqno_map(lrc);
>>      xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>
>>-    xe_lrc_setup_utilization(lrc);
>>+    err = xe_lrc_setup_utilization(lrc);
>>+    if (err)
>>+        goto err_lrc_finish;
>>
>>      return 0;
>>
>>Lucas De Marchi
>
