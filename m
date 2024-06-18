Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8C5C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 23:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1210E80B;
	Tue, 18 Jun 2024 23:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1XzlMHJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893C010E80B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 23:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718754321; x=1750290321;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fhl6pGTjHTPsBxpsLRW0rt6q1b+mTMYnEU4xugCFnWs=;
 b=g1XzlMHJtMQ84GMYPRX9rEgoOMeXPGRUzUFOpiWedBLdj9aC+XyWVamu
 8wtk9XTtVmtRiDLbTg8RZgeulooMho1C3rCc7O1a5GRDTVODlq5pfML91
 uBbWhlyzHLelftPtijNwxlvnPzdEx3dkl/QWgqKqORiFaRaWIKP6TZOi4
 P7Gr1xaot8O8Ye1NtVH1uiNLu8hwyh7Fik+iOAim0nmJOEqB45fYlL6T5
 Eia6LNbqg/oEgDNzGWdckyyP9QdBW8mJUG04CrYwhecrhIb9MzSsm0IGW
 SaMqB3yaXK/KPrXYbACqlsJuT4sQp4k6zGFX9F7IwDa7tcmFsKFLjv6Un g==;
X-CSE-ConnectionGUID: H3/AKilaRx2j8GlMW2t6Wg==
X-CSE-MsgGUID: 4Lx7OK1uT7KqwIjB+2gffQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="19492130"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="19492130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 16:45:20 -0700
X-CSE-ConnectionGUID: dyCfgtIURRGHd3Xs+gdO8A==
X-CSE-MsgGUID: 1yMDOgV/TpivZa4sw9HSRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46099343"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 16:45:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 16:45:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 16:45:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 16:45:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1vmiQkUOMM9prvxGp9VQe5KmmXghU7LpfHpRKJgmO2mTlhc3pbD6nvu83SHuBSHLpYR0Syktr0HDKzSMrZBPoORBi83wS8S2rAO8q0nU55tbUVcVHKQnhr6KYsrmVH/GBfVs6ZlXemXjrRAqpa2qUzPczXEShgNoH2c7nsFHybxNYuCpl7EG7OwdYg6SWtFHVUjZYncIyBYQ4RwEJTkBzzK4NCbsufLzdKmCtWcx9WIjPhqPsMd8g3RtpuyMDf3Z+2TTE6kGd4mO3tnptGrDSSLUQQZkbYYwEhrBcv5lK8Vj/MJ4XF5uwdUBYBF54NUyZs5cf6NXhDwRl4awKmyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zffg6fhN8aCvMsaIrVskNktR4kAkc+G/xTKKDpHb4Es=;
 b=aJSEnd8rXNKN3EkuFCl600Lyo/prfynN51z5cOhr9Oh82+1/DFy55bXtc3mw88NMPQ6mGCLBUaIoJb7DEXHSbEv2PYEzTjJ6jaZiO73JkH729S3Bog+BR0hMkeC3QhZ98tVDW4lmxqTjTcR2wx01K7fFU/blXznPQTrrvHO9/Js8IhoNytU4PXp2LIBeSDVI9VwX0aVm3BNa/BsbQL/Tt0MVeGIzEnt75kdMLt5Q0exUuHdAaJD/zbzDB354eF4lGDyLS/zJhfVoA96LTcRJTz2fNu6HSN8+3jJt4AsyhGV403JoakCijL6zNdYA9TfQyeX2dbGtaUZvSquEpC7Vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 23:45:17 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 23:45:16 +0000
Message-ID: <1ba40a50-b73a-4cb1-acc4-c92b81aa540e@intel.com>
Date: Tue, 18 Jun 2024 16:45:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
 <ZnB-EfZZ8A6pCzU1@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZnB-EfZZ8A6pCzU1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf56a55-e158-4b60-d25e-08dc8ff0b4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHF4TWRQZ1M2SHV5cnRYS09oNVU4dmVPdVAvUUpPQ3dVaklDZFFRMDArQ1Rh?=
 =?utf-8?B?UkxaM2cvNmtsQUNNam02MHAxQytSeG1iUkJZcnRheW1pcEp0L0pCNXlQaGNo?=
 =?utf-8?B?VC95OUJQaEM5em95OHBqcHd3QTB2NEVkbE5KOEZQQ1FrOGVMQ2k2UDJuZy9V?=
 =?utf-8?B?eStLSEoyeVhrNVlVNk5VWVcxSE90b3hhNHpTSkRWaGRnY1FKdk1rbkd0ZElO?=
 =?utf-8?B?bDd3aFYybVQ0RSt2RzBCVUFVTEswRHA4TWNBcmpIUHVXWThYQXc2cWVRYmU3?=
 =?utf-8?B?V0Z2QjdvanVBd05tMUNxZE1rVDVpWHcwWmlHQytvdGR5QWw2bHpFWUFMUUx2?=
 =?utf-8?B?a3gwNWVDWFZpTnA4Z2lDdDVSbUdWSzBCcXdRY1IrQkhuZXBSTEJUWWc5eXlv?=
 =?utf-8?B?YkRVSUFQdWRWMU5OTEJMd2V0R0VHWDJxTUFTckp6OFBlU0ZxM3NCanFOcEJz?=
 =?utf-8?B?bit1a0VzeGd3Ujh2ZTNmMkdBbXR1SGt4c0x6Nzd3eWhmdGpWTDRUV3ZzZTE0?=
 =?utf-8?B?REphTUVnc1pDTEdBVlg2dXVzQmVtT0liTXhSRnlXWTRyUjZFOFNrbjZvczhj?=
 =?utf-8?B?UkV4M0VmUC81RjRPY2ZpQXUyM21UUm5NbndsK2hiWHNzSTFVRmFDQUYybW5E?=
 =?utf-8?B?MzNaYVplTmhhdlEvSHZKa2RYdWFSWEtwYjZYVHlhcUQ2UTJHa2VkYmN3bFpO?=
 =?utf-8?B?SDFUbm8xNHZoaU5PVFNvcVh5NUVUeFVJUW9oRDBVQ3RqbFZ1ZHdtWXRsRzNS?=
 =?utf-8?B?QWwzc1ZrQko3NFNkRnYyTmQ4Q1BUWDJJekdudUpxNXAxbElaM1dsNmR0ek5S?=
 =?utf-8?B?OXcweUl2NFJKbk5BajdLR0J1eCt4dEpWZHRtSXR5RENhbEpDMWxsd0lRSTk3?=
 =?utf-8?B?SUJIL2Nva1JrcVorSFU4cUpISFVxUVJTT3dCZDZraXBjRzVXTG8yQnYzNWx6?=
 =?utf-8?B?endUQzZPS3I3alNjTWRsRXFUSjkwbVFNSGduL0RoVlZ5bGFYK1NNSDdjSlhu?=
 =?utf-8?B?NWhzUGZBNmxyb2NTWXNyMDJSQ1hHS2FLQVdoSDFlY21mdVNXYWgxMHY1TEFl?=
 =?utf-8?B?YUJNWmlrc2I3TDNURjc3OThLNGoyYXgzMk83SU9wMzdKT3Y1YlFaWnJia01v?=
 =?utf-8?B?ckJCdVpjdW5ubnpML2J5czl2QTVOblVLeDZhRHBTYWdRQUlMa3A4eGtSbk1q?=
 =?utf-8?B?QVF1VzlZYWxQR0s4MnEvM0U1RjlWQTlaVzdna01kdlNQK011TCtWM0NwRkdC?=
 =?utf-8?B?R2RKVGdNZHlmQ1liT2VTbkN1UXpZejd0SmpsY1hET1RNQy9qRHZxV0pZeEVk?=
 =?utf-8?B?NGN1aXdNSHB1NHo2bng5U0EzaTVFTjJjK280WS9RTmc2b2R0WXNKYTNPK0dQ?=
 =?utf-8?B?VzlPL1BLQmhzK3BkenZzbWpBTTNKbGdscFZXNjZCakdnQ0RiWmhvYmN3ODlx?=
 =?utf-8?B?a0F4RXkrVXZUZEdLM1QvL05FTVNzRG5qeC94dzNtSm5UVkVTRmZ4RlVpSUI1?=
 =?utf-8?B?Z25ESmhjb2R3MlM5TzVUMVFFV1dQQllYVStPWmF0M3VqdjNrSFNoUlloZVJ6?=
 =?utf-8?B?L2lrV2VqOUkyMnhwZWRYWnpkNGdJZmxTdXhBSGc2UE9uUnVTTFhWWlQ2WVg3?=
 =?utf-8?B?M1hqdk5zYXBGalVTcHlwcTNzUXIvZC9xTjQzcTljcHFBZTdaN3R5S0JCbHU3?=
 =?utf-8?B?ZmkybCtHTFdMUG9oZExZbTdpQXFkWUtnL05WMzd5U2VzZEtBRkpSOU5Wenk2?=
 =?utf-8?Q?gDtvBADYzFZC+3N68RGGSwlKF2pPyQEHgQ6S8kr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkdmQVREbzU4ZUhVWG9neEZwZ3VxWnVsZHlhZENDTGxkSzFia004Q2tOWVBB?=
 =?utf-8?B?N1BleVJ4L2hmbm83SnJTTVVLVHFvMWVGR3h2ellGbVF4amQ3cTJQTHkrekM5?=
 =?utf-8?B?eEE4bmJBTmdLS2xMWG5qaFQ3ZmxSN1Q5YTY2b3F3dXU5Sy92NHlLOWYwTlU0?=
 =?utf-8?B?Vlg0R2dBWWdvc0U3Mml5SGRKdmFsLzJObUJMNTFhRGd4ZE91SFE5VGZKUk5h?=
 =?utf-8?B?cTFhU3FYa081V0lMTEdXcFpvVmRWTlZCTEdOQ1BJeHljUFFJdUxEeTlBWFFU?=
 =?utf-8?B?R2NQZ1N6OG9SdGdtRUVCa1BqRDNFYVZ2R0paNTRKekdIa1h5UWxaa2hoeWpQ?=
 =?utf-8?B?b2RHcFBEMGhaWkkzeUtqYUJBdTVCSnRsWTFFRXV6NlFaK2dJci8wZllUd0xt?=
 =?utf-8?B?b1hjbTdPUEF4TUQzZnZDQlZxMUZqWG9ib0NHS3NqM0htUWxVaysxTG5xRGIx?=
 =?utf-8?B?aXBrQytVZXE5aTc0M21iSDFvZkNwRWZ2L2hyeE1lcnBDTUt6MDZZc0J4cEVv?=
 =?utf-8?B?MHdJSVZNZWZBcjJVcnpUWmJSUjJQZnJySDVBZXVOdkg2cGZ1L2U5STJoVy8w?=
 =?utf-8?B?bTZVWGtwNjFLc3IyYUJwUlB1MnFFWFMrN0d3R1doY1RkMTFPMFpCWWlxRHdS?=
 =?utf-8?B?YmZ5Nm10dWwrOTlYeHo4cVBTTUkyWEsreGI3VGtURC95MG1jWHFqMjN1ZHZC?=
 =?utf-8?B?ck02N29pNVNJYVpCOGpPejRNQ3NvenhIYXdaMWxCUyszVDAyeGRCeG5WM090?=
 =?utf-8?B?OHdCa2d5amEyaXFQeEpIVUg1eG1FYjJFdmZFbWkrOUpIeFRUaDJnQVJjaFpB?=
 =?utf-8?B?RGpkcW5WdDhVY01xd0VkR3ZQV3VtenUrSTd0bjVBNytlMGIwOFZxV1hOUWhi?=
 =?utf-8?B?QXJHeWVOOVJRMDZlV1RnQ1Y0NndCNmlqSTF5bEVQQUR1VUVoa1ROYm81YUFa?=
 =?utf-8?B?MzFuNTBERkdWNXJGcmRrZndRWUNDZlM1UlFSVGhwOTFTTU5uRy90OHhhc0p3?=
 =?utf-8?B?Rk14cFNnb1FXYXE4MUE0N0lnMHVsZnJJUGN5bHA3ejI3NDVFYXVUTS9lcWZh?=
 =?utf-8?B?MUhBWTBFZSsvNGM2cDFRZVJvalF3TFBQZGNwTlJ4SjR1SU0vekxtUlUzd2di?=
 =?utf-8?B?bGlUWFNDY3Z0bTYyNnBrcWRWdWhKQTBhemQyU3hOMG5DUzBWTG5kbUdBaVNU?=
 =?utf-8?B?REJPaDNRNllYK0FudytUVFQ2aXlFRnhoTVVJRlpaOE11QXpkdHltUEh1WlJs?=
 =?utf-8?B?MUJwNis0ckxSL0gwK0JTT2Vvb1VSTVFJbTFQVmNOKzRJTkJVUkI4UGtnNjJh?=
 =?utf-8?B?eFFPSGUrclUwdUMzcy9JUUNMUmtWMFJxZDZRdFYyOVlZdkl3UUQrSHFpc0t4?=
 =?utf-8?B?MEl3OXFaK0hkVkgwOWVuMHhzWEk3MlZSVTFuMzVOTGxGY2RKcXZWVDArN0hv?=
 =?utf-8?B?dGw1SnIxQjZJT1dQQ0tFS1Q2ZDZuaXZlbS80U1AyUzR1RUlEYTMzblZkcmZs?=
 =?utf-8?B?T3U5ZnJxbElDaTZ2bEdKaUZFVlRXWERUTkRHMVhxSjBCTnAwUHd3eVRRTjV3?=
 =?utf-8?B?bStzaUFBOEVsY1RQMTU3aTl6R3U5b0ZmTVJxZmwxR0ptSnFwcnNtcGh3dlVk?=
 =?utf-8?B?YW5zMGg5aGc4dDZIVXhKZnZ6cXh2TllaMFNERWszeUtRRmYzVXZ6NkJyQzhu?=
 =?utf-8?B?VUlGcVJpWE5LeS9CTmVuUXAycFkvTGhmdXdDLzdwa2xMa3JYTE0zNVcrTjBC?=
 =?utf-8?B?TlVNaVBjQlplbVBBTVM0aVZxRVB6RFdQbUFFb3MvQ04wMkFpYlJaaGpNRnVO?=
 =?utf-8?B?RVBvS0JQNUUvcSt0Q21KNUtPSitGeXZGZTdiOE14T1MzQlBHalVpeVo2aFY5?=
 =?utf-8?B?WGlzbk9Fd3kwVmFGQTEyeERmWnE2TjlHbFo0YzVBNXFZWTMvcjI4MFFyZVNH?=
 =?utf-8?B?NDhTN1Z0ajkrdHRxTXJSOGRrdVJYRkFjYlVxZUJ5SWlWaVFrWTFZM2FrRXVo?=
 =?utf-8?B?ZUxXbnlxNFdJaVQ4TU43V1hqWkFvOGZycURDc0pZMGRzcHI0QmgyVWR6dDJN?=
 =?utf-8?B?cGFNdThKNkJCMlFWR0t6UFFKMUNldExFZDVNR0FXV3dKUWlyS0RYYkxUNFg4?=
 =?utf-8?B?aHMwQWthRHNKNzYyYWJLaWY1SUpkRE9ZQjRSakJMbE53Ui9qanRhTm9ZVjZK?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf56a55-e158-4b60-d25e-08dc8ff0b4b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 23:45:16.8463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kOC/vA1kLhPgdjPt/CFz9Cb1BSe3Z4fw8AZ1ulDeafanE/VFb6D+DAe/LgLWr5rs/Kv9Gysqp9sb/goRilBvuuiiLe0fJwWuVbJRGb6vZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
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


On 6/17/2024 11:18 AM, Rodrigo Vivi wrote:
> On Mon, Jun 17, 2024 at 01:10:50AM -0700, Vinay Belgaumkar wrote:
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load. Freq limits are restored after load
>> completes, so perf will not be affected during normal operations.
>>
>> During normal driver operation, this WA requires dummy writes to media
>> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
>> of the LMEM writes originating from Gunit.
>>
>> During driver unload(before FLR), the WA requires that we set requested
>> frequency to the cap value again.
>>
>> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
>> Rename some variables, check for locks in the correct function (Rodrigo).
>> Ensure reset path is also covered for this WA.
>>
>> v4: Fix BAT failure
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  2 +
>>   drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>   drivers/gpu/drm/xe/xe_ggtt.c         | 22 +++++++++
>>   drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>>   drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>>   drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h           |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>>   11 files changed, 136 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1905a80e61e3..8c72fe38edfd 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>   	$(call cmd,wa_oob)
>>   
>>   uses_generated_oob := \
>> +	$(obj)/xe_ggtt.o \
>>   	$(obj)/xe_gsc.o \
>>   	$(obj)/xe_guc.o \
>>   	$(obj)/xe_guc_ads.o \
>> +	$(obj)/xe_guc_pc.o \
>>   	$(obj)/xe_migrate.o \
>>   	$(obj)/xe_ring_ops.o \
>>   	$(obj)/xe_vm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 94dbfe5cf19c..fee90f66246f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -668,6 +668,9 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_hwmon_register(xe);
>>   
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_sanitize_freq(gt);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 8ff91fd1b7c8..e3fddd59fd9f 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>> @@ -23,8 +24,10 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> +#include "xe_wa.h"
>>   #include "xe_wopcm.h"
>>   
>>   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> @@ -69,12 +72,31 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>>   	return ggms ? SZ_1M << ggms : 0;
>>   }
>>   
>> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>> +{
>> +	/*
>> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
>> +	 * to wait for completion of prior GTT writes before letting this through.
>> +	 */
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	++ggtt->access_count;
> probably better the ++ as suffix since you are not in the middle of any check
> where you need to increase before checking.
ok.
>
>> +
>> +	if (ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487)) {
> This doesn't look right... it looks like we are counting all the tile0 as well
> and updating the tile1 always.
>
> I believe we should have something on the beginning like
> if (!ggtt->tile->media_gt || ggtt->tile->media_gt != ggtt->tile->gt)
>     return;
>
> then do all the operations directly on ggtt->tile->gt instead of tile->media_gt
Any write access to GGTT from CPU needs to be counted as part of this WA.
>
>> +		if ((ggtt->access_count % 63) == 0) {
>> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
>> +			ggtt->access_count = 0;
>> +		}
>> +	}
>> +}
>> +
>>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>>   {
>>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>>   	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>>   
>>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>> +	ggtt_update_access_counter(ggtt);
>>   }
>>   
>>   static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index d8c584d9a8c3..73fe6837b9cd 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -34,6 +34,8 @@ struct xe_ggtt {
>>   	const struct xe_ggtt_pt_ops *pt_ops;
>>   
>>   	struct drm_mm mm;
>> +
>> +	unsigned int access_count;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 80a61934decc..f8239a13fa2b 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_huc.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>>   		return ret;
>>   
>>   	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>> +
>> +	/* GSC load is done, restore expected GT frequencies */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>>   
>>   	/* HuC auth failure is not fatal */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 57d84751e160..301594d1e7a4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <drm/drm_managed.h>
>>   #include <drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_mi_commands.h"
>> @@ -54,6 +55,7 @@
>>   #include "xe_sriov.h"
>>   #include "xe_tuning.h"
>>   #include "xe_uc.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_vm.h"
>>   #include "xe_wa.h"
>>   #include "xe_wopcm.h"
>> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>   	/* Get CCS mode in sync between sw/hw */
>>   	xe_gt_apply_ccs_mode(gt);
>>   
>> +	/* Restore GT freq to expected values */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_gt_sanitize_freq() - Restore saved freuencies if necessary.
>> + * @gt: the GT object
>> + *
>> + * Called after driver init/GSC load completes to restore GT frequencies if we
>> + * limited them for any WAs.
>> + */
>> +int xe_gt_sanitize_freq(struct xe_gt *gt)
>> +{
>> +	int ret = 0;
>> +
>> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
>> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
>> +	    XE_WA(gt, 22019338487))
>> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
>> +
>> +	return ret;
>> +}
>> +
>>   int xe_gt_resume(struct xe_gt *gt)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 9073ac68a777..1123fdfc4ebc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>>   void xe_gt_remove(struct xe_gt *gt);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 666a37106bc5..d9194328b495 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/delay.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "abi/guc_actions_slpc_abi.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -24,6 +25,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_wa.h"
>>   
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>   
>> @@ -41,6 +43,8 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GT_FREQUENCY_SCALER	3
>>   
>> +#define LNL_MERT_FREQ_CAP	800
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -673,6 +677,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>   		tgl_init_fused_rp_values(pc);
>>   }
>>   
>> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	if (XE_WA(gt, 22019338487))
> I'm afraid we are missing the check to be sure that we are in the media gt
> here as we...

XE_WA() does check for the specific GT it is defined for (much to my 
surprise as well). So, above code will return false for a non-media GT 
since oob_rules has it defined for media.

Thanks,

Vinay.

>
>> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
>> +	else
>> +		return pc->rp0_freq;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>    * frequency to allow faster GuC load times
>> @@ -684,7 +698,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>   
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   	pc_init_fused_rp_values(pc);
>> -	pc_set_cur_freq(pc, pc->rp0_freq);
>> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>>   }
>>   
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -740,6 +754,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
>> +		/*
>> +		 * Get updated min/max and stash them.
>> +		 */
>> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
>> +		if (!ret)
>> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/*
>> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>> +		 */
>> +		mutex_lock(&pc->freq_lock);
>> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +		if (!ret)
>> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>> +		mutex_unlock(&pc->freq_lock);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
>> + * @pc: The GuC PC
>> + *
>> + * Returns: 0 on success,
>> + *          error code on failure
>> + */
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	mutex_lock(&pc->freq_lock);
>> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
>> +	if (!ret)
>> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
>> +	mutex_unlock(&pc->freq_lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_gucrc_disable - Disable GuC RC
>>    * @pc: Xe_GuC_PC instance
>> @@ -854,6 +915,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = pc_set_mert_freq_cap(pc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	if (xe->info.platform == XE_PVC) {
>>   		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>> @@ -902,6 +967,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>> +
>> +	/* Bind requested freq to mert_freq_cap before unload */
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 532cac985a6d..7ba875c3613b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct xe_device;
>>   struct xe_guc_pc;
>>   
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>> @@ -29,5 +30,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>>   
>>   #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2afd0dbc3542..13810be015db 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>>   	u32 user_requested_min;
>>   	/** @user_requested_max: Stash the maximum requested freq by user */
>>   	u32 user_requested_max;
>> +	/** @stashed_min_freq: Stash the current minimum freq */
>> +	u32 stashed_min_freq;
>> +	/** @stashed_max_freq: Stash the current maximum freq */
>> +	u32 stashed_max_freq;
>>   	/** @freq_lock: Let's protect the frequencies */
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 12fe88796a49..a6b897030fde 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,3 +27,4 @@
>>   16022287689	GRAPHICS_VERSION(2001)
>>   		GRAPHICS_VERSION(2004)
>>   13011645652	GRAPHICS_VERSION(2004)
>> +22019338487	MEDIA_VERSION(2000)
>> -- 
>> 2.38.1
>>
