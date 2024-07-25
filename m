Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59B2C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 16:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367310E88E;
	Thu, 25 Jul 2024 16:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGGZQJ/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B33510E88E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721923275; x=1753459275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xTrFijDsyQGDrftuBHrgFhAZJJWegNTDS0tcpsuMk7M=;
 b=NGGZQJ/teMNhvuO2fNXpMXNU4EdOIuC4rCHplZZYNsgAZn+SIAAPWxlG
 Q38xadP5QgNeX1vxSnTuYjHQ43BcScKsLKb7Wdxy79UOHS9sdGFqxBe/b
 9trbd1g2uiiYucIjL+iwgQP60cgwJrTHpNlYv7SuHKf2O9CFG8yGpkqFV
 qqYztmeA4gpUHNqUZ6ZlwaY3D3Bebswr2C1PPpbXTMDq8t/g3b95CMVyp
 KsURsNXQzwvxYNkOtp8saEVkAVT5ROyL+hPi3R83e4jSVt5yiUYBJoQ6t
 vlkQ0jLyv7pc3T8/il2gE9kIXxy8t+/QfdLhBK/B1uktk+AbNr4cR2bew w==;
X-CSE-ConnectionGUID: gVCOamKjSsW11I/xahhUFA==
X-CSE-MsgGUID: frB0jqp7Tsq12TRQRez1dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37192059"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="37192059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 09:01:08 -0700
X-CSE-ConnectionGUID: FoRseCu0QHKPmX12puCIrw==
X-CSE-MsgGUID: EWYmCmYbSZSs9R6FyNKkeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53733439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 09:01:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 09:01:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 09:01:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 09:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOlDE2HN8U9OpwVEpkBY7VLZ5TeOm14bFL/Vv1oEwzWoIhRErMtvx6zMiVKtaP2u7//ltmk16Ii2i3AE8Tdf7x/Pb8VY9qnV+UjprhaQappkcn+ysCUJ9BAoi5lEWrvuwJCMsO6S7xh0Nyj5x6SaStrfjFs/vEhwKhaQ/KI/YlIuRRONMjpCITHz/XGSYUKGUYlJVV80kl6jSvCETFHZnzaxGKdj6FtHr0zyj1qKnPZ0PDaZQIecqAl0zZjjqIsTUy96HldHAmeBu+ZhSTWgVY9WYgSys5bIEy7VZBVTcfmO3jPP/MOvVLkF5jElTUaMkvS1tV6Ru0FAr/FgN1m59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwgSApBbDjX+WMbhjY7irdmVmMkoLsGhqWApgf9apA0=;
 b=biyTdCeQC3xd+cf6FYZS9MxVZCC3o98WzSyAtxmfM/3p7SFOe5zGGX2ZxvtK7shbdlpQ7/6YTRzzZOhYNni3OGWiXPDrwFXpuvHDuk+DTFGt2b5aa79w1CXGHbcTeTiuND8xbAhldgFcWPvGSJeoVCRlSEOIdvPX3XX5itJK07r9SaTv1kGJyZuxtDhS3wbRfCOi5QFBjbDvo9HzogM0vSLap8SOPF3rjdn20iTkOLsa7VY0fYCjTeJUABrbJNCWMZn7VcKNNI3UMLhoegqjYpyPyodtck7YXpKRjsWhuGtORxjk5MZhw/iRLnuLZ2OWp+CGDknLeWmmB8FCz78RoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 16:01:00 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Thu, 25 Jul 2024
 16:01:00 +0000
Message-ID: <de2fafa3-9bf0-41c2-b9b6-b67cf3b11351@intel.com>
Date: Thu, 25 Jul 2024 09:00:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Move HuC and GSC FW defs for LNL and BMG to
 drm-xe-next
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
 <tqx4jfnjgkzq3opvcdtsjcr3ivqvsw3qs3upptne37fr7afzuu@2y2ath6vpri4>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <tqx4jfnjgkzq3opvcdtsjcr3ivqvsw3qs3upptne37fr7afzuu@2y2ath6vpri4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: afaa31e1-10f1-438c-e188-08dcacc2fa23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzgxTS9oUGd0cmsxTm1CdTJiSEpQUTBLQXN0N3BaeEF5UG11V3RsdVpGa0o5?=
 =?utf-8?B?NW92Zy9lRzJHTjFwODdGNTZQRWl0QktKMWdadE0rYWtZZDRmWWFPdS9tWHhM?=
 =?utf-8?B?OHRUZkVsdUlrSmlITnQ1cG14V2xvcnFCRmtoNS91ekVzTENCbldkcGhPOWd3?=
 =?utf-8?B?ekZNNHlDaDN1MDBIQndxNmc4V25va1JiNWpRRXpjTWRJSnlRcG5VK3Jnck9a?=
 =?utf-8?B?bU9RM1pkWktUNFVyQVQ0S1JYN1pXRzBuTWFYQ1dJcXN6dWk1ZldyZ2ZyQmNn?=
 =?utf-8?B?cysxVDBEdlJDb3NWdTVHa2lYWmw1QjhHblZLM3p5cWJTaE9WSm1tTGdjSFZy?=
 =?utf-8?B?VEpDN0lMSjhQM0h1eWtGeDZrb2R4a1AxeDZTL0xEU3JodW9ySVllRmZWaEdt?=
 =?utf-8?B?cTQ4RG56b3JuUFMxenRVRVZvdm9DeHRUZG1pUFI0YUJIWlBoeHJUR05oaUEr?=
 =?utf-8?B?YS85TGN3Z2dSMEUxa0VvMU5WMjZteGFLM3hzTVRISzJQMUFkRHJ3WFIySzdy?=
 =?utf-8?B?bG9xMSs2VkdKU3FINVJyd3VCOXU2d011Y2xxMlBpTU5lUCtBRWRvTStkdHZp?=
 =?utf-8?B?dHQzS0s1ZWlqTUo2VUdvZGx2Ujl4dTIxUVArTXVYV3NaMXZ6S3hiTWpQd1Zz?=
 =?utf-8?B?WjlOQ2Z4WDY2UWdDdEVoUGwwTFNCSFNoMWZBMElQMXgrOVE3a1h0aHdQdU4r?=
 =?utf-8?B?cTBPVjFma1BUT0NvT0FwbjNqV0JiZVMwaEwxOHl0Y2srRHZuQ1loQnUvL3Jv?=
 =?utf-8?B?VzRnV3kwbEZsMHVhcFg0RWo3MGR6U2dEdFR0SzJnR3UxWHcrOExDNVN3OEpv?=
 =?utf-8?B?WWQvU1J2V0hSUVVBWk1UOFJvdmZmVzAxemZlZ0NBN0daNWtvWE92Rk9sdWxS?=
 =?utf-8?B?ZW4rdDRkN1ZDQVVhdThFaCswMGxVTnVmWm1neWVDSjhBRWJvZlRzU1AxV0Fl?=
 =?utf-8?B?SmtOZzNuckxhdVdNSkdxejlRL0ZhWVNRWlBFekljUzRsT0czUndFV0JyRG9F?=
 =?utf-8?B?K3VDUit0L3BiZFVmY1JYdEZVTUs0em85Zzg0VGZQT1llcC96cytYNFYyWGZ1?=
 =?utf-8?B?TU5EeGd3dktwUU0vb3FzVjZwaTJvMTIwSlk5YkpZd3VQa0tFNmlhVWlGQnBo?=
 =?utf-8?B?dDBKQXlyL0lWMFJvUm9iODlGM2dQeVBaenpWTHBQcS9JSjlBMHY1eDhPcTRZ?=
 =?utf-8?B?alo0WVppRitPaVFIcGFFMVBleHFGcmFVcDBVdkdaM1U2NU5ucXdieHpJMVVP?=
 =?utf-8?B?TXUxNnlrWTV6OFpzNndnNHNHRXF5YmhIU2d3M2hYSVRrT3k5OUprMlpIOTNh?=
 =?utf-8?B?K2tsWFpXUHplamFTTTgzYkJHdVZiQXFEUUVrSCtyTUY3ZVZaOEtTQU45ZFNL?=
 =?utf-8?B?a1hJSmkwVjRtMG91bjh0aUhjUG84blFBek9DRmNtblVwVDFmNStVS3FIckcr?=
 =?utf-8?B?VFVpSG1vZENDcm1EUno5a0xKcys2K05ralFBejVGMXJMcGlkd2tZVVhTcldo?=
 =?utf-8?B?bHIybjU5dDUwMHZFekt2NHI1OWQxbDFZUnp5a2wrZkY2WTlqczdCWE5XTnFR?=
 =?utf-8?B?Y2U0SWJDM0V6Q1QyQitqbk4xaW5wMm5OWGNMYkdrWVVQeE9XNDhaVUdhU010?=
 =?utf-8?B?dDFTaVJaSG9BU2dLcXdSZjZoS1BTUlNnUW5aUG1QYU1hc05YWHpPWGZoY2Ny?=
 =?utf-8?B?bjBiR2ZJaXA5dVJQMng2bUJqWGRpVHJuNjhqd1FEaENFK3lqRTcrQ1VGU1Ey?=
 =?utf-8?Q?yLZX0ivdLKNOhsYWT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MThpdnFyYklCU05sT2RMV0Q5ZDNwU1AyWHBsVWN3UDJZN2lEbzdHaDZDblVt?=
 =?utf-8?B?TjE5bmlTR1BWMnRBaDduRFBLNjVHVzllVEJTV3QyQnhqVE9JYzZBcDc3WXV3?=
 =?utf-8?B?T2hCTFB5emRDTXorUTV4a1BORHNlVHc3QmFabG9OckVxWEw3alNDYkp2OUpV?=
 =?utf-8?B?SzRaVzVHU0pzRXNDaWxETHhpcTRJSEpIMlFHQ1hLNEU0ZFdpSzBEaUZ3Um5C?=
 =?utf-8?B?cjIyVVVuK0tQM1N6RHN2T0NVK0tTVWJtdy9GU2JCVm9FbC9maEd6UEFuRHNp?=
 =?utf-8?B?U041ZUZhZjdlcjkwWnpHYjdtVE4vM1luWTVOZG1zblYxekZNMWpYcXF1QWY3?=
 =?utf-8?B?d3RjQ2hrcTc2UGV0R1pPYU1yT245VVcraVlZYm1vRXhkTG9RMEV6OEVQd1hO?=
 =?utf-8?B?cG1Wc1YrTFRVZTB6dmFFNGR3VUdPS3JGQVcyWnd6NUE4UnNOMUZscGsxV0lF?=
 =?utf-8?B?bzhPTGVZNGMvVFk0ZVh4dzN5clB6TmFBZ3N4dnlxOU8xT1VJcGxLRVBUWDh0?=
 =?utf-8?B?Q0pwZWJncVI3Zysya0dkYlB2akc0bHk3S0xjTDAzNWx2Y2t4cnBxNEE1bGZS?=
 =?utf-8?B?UWtvM0hQSFErdU4xT0tQQStyNStvUlRGRWNQODJBNHdYNERsbnV5MXkxWmVw?=
 =?utf-8?B?Q0lmK29sZHEzeDI5OGwyK1NLVUR1QVRLZDBtQ1N3UGtiWHhLeVBlSFYzK0tL?=
 =?utf-8?B?UXdvaTNyUE14VEtyalRRdDdTR2NSU1ZqektaSllydTF6eDJFeDBhNStaTVVn?=
 =?utf-8?B?UE0ydXdVVmpwaHFqUGZsWGEzRENNRThFckVhK3BZQUJEMXZWMjJEQVR5ZzRJ?=
 =?utf-8?B?TGtyODlFVXo5STFHa1VHN0ZxRm5NeGY2TUJjU2FGSWVYS2VqSVEvemFwQVIx?=
 =?utf-8?B?R29LZUxZRUV4UUdGRUdpWE1vcnFLQnk1ci9YYW1sU3R0b0ZaR3poV0VETFY1?=
 =?utf-8?B?K2F3dVlqc3U0YWw5NUtjSWxYT3czYkhkZExuZlZ2MmlycjJxTEhFTUtzWVhG?=
 =?utf-8?B?ajY3M0pFOXBzTTBLYjdrYzFnUkphSUhDRE1TcklOMDlOTWtvUzZ1SWJka203?=
 =?utf-8?B?R2NGVVlCTWNISU9BdnhTajJwV1ZxV3BiUzRGT2hCVm5WYUdFZVdEMExrSEt0?=
 =?utf-8?B?QzJMdlBDdHZ0WENpY3U1cjU4dlg5WHpuUy9yd3E3bVJsQ3hid0VlNGpDY3VM?=
 =?utf-8?B?b3o1N3hBdjB6L0pjWlp3VEE3ZUQ2Zm51UkFodUR3enhMenZLRHYwMVJDVW9p?=
 =?utf-8?B?WndMZ2pwblEwSHkvUlIzdmhXeE5LSXVlakNYWUN5SWpISzA0VFlSVW1ibXNE?=
 =?utf-8?B?cStPZmJOUzhqajFMMXNnUTl3d0ZzcFNCV0twT3paVGoxSEZHSkQ2OW1jWHps?=
 =?utf-8?B?WWpaTzNJWCs2VGxXc21WbmdEVEtYZlRnK1NQdWIyWWx0TXZHc0wzOUc3WGpE?=
 =?utf-8?B?NC9NVUxrZXJNcTl1ekhrU0xPRnVCcHI2aVIrQVZCNXZlVHIyUmg2ZHg2VkMy?=
 =?utf-8?B?SEJjbmlqM1RmUWV6NXBqY3poOWFzQzR0NHptcXZ6OUhKMnJRWEFSd1hzalFu?=
 =?utf-8?B?VUxoNmwybUNwb1dDTlRYQ1d2RUgxMlRRckVYVHZyb0UvZlVLUk5jeGVRTXhD?=
 =?utf-8?B?Z2ZvQUN2R2FlWnhHQVgzbWNYdDFpRlp5bDJVaDJUSWxtL1c3YS9jTjlrMk9q?=
 =?utf-8?B?MmxTTUl4WTU1MG1WQjE5bzlpOFNIYmxGWVBHQ2pPb1hDRXBqU0VIWHplbEVE?=
 =?utf-8?B?VDByUTNCd0Z6UVJhR25YZG11cEc3UHlIakVab1Zzd01Bdll1R2FJMFF1UWVq?=
 =?utf-8?B?ZGpadXQ4b0FtcVNxckRHL2wvUnpWSjRXa2QrT0prL1BnMDlSWU45dVhJK3JI?=
 =?utf-8?B?bStOaUFGV01tZkxvY2hQSDlsZTAydDY2cnhPNFVuNjU0NjRpdmkzRGVHYVBS?=
 =?utf-8?B?YWQzUlYzZ202TjdqL285OFNsRHFMbXRqZDVkQkxiSk5ZaTBLT2VoRUgvSGdX?=
 =?utf-8?B?YlJ1VXJxdzBzTDBaeWJQUVhJSnZ3eE9RN1ZNVGVrTXFWUVhoRlJiYmVaQ1JC?=
 =?utf-8?B?aEdxVlV3aDdsdndVOER0a0YwcmJHa0VpQmMwT3hVT0t3SzMza2w4cjBtSnFj?=
 =?utf-8?B?TStKb3ZJQlQrcEI2anREeUZQUEFBK1M3OW9vYVJ3dyt0TWZ1NmhHekl4RVRE?=
 =?utf-8?Q?MtWdn9pEETcVsrkgW4o0Gqw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afaa31e1-10f1-438c-e188-08dcacc2fa23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:01:00.1618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP99mdPRXltYeptwQcNjyXFQkax99HJOxXvD3NN4JNUjqN/IoFt7S1yyT5NzJkql2lb4jreTHCebZ7x+mmXjx9WFWU95mZ/98FoFnPfF+0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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



On 7/24/2024 9:48 PM, Lucas De Marchi wrote:
> On Wed, Jul 24, 2024 at 05:32:17PM GMT, Daniele Ceraolo Spurio wrote:
>> The FW defines are currently in the for-ci branch because the FW blobs
>> weren't ready to be officially published. Now that we have updated HuC
>> and GSC blobs that are ready to be sent to linux-firmware, we can remove
>> the defines from the for-ci branch and add them to drm-xe-next.
>>
>> Note that the 3 reverts are not meant to be merged, they're there to
>> indicate the removal of those patches from the for-ci branch. Only the
>> latter 3 patches are meant to be merged.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>
> not a huge fan of UFC, but the first thing that came to mind when I saw
> this was the catchphrase "iiiiiiiit's tiiime" :) Although I still miss
> GuC in the series, hopefully we can get it soon.
>
> If CI is happy, I'm happy with this.
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> It would be good to note, in the cover letter, where the firmware blobs
> currently are (the commit in drm/firmware containing them) and the
> status for sending this to upstream linux-firmware.
>
> AFAICS 
> https://gitlab.freedesktop.org/drm/firmware/-/commits/intel-staging?ref_type=heads
> up to commit 0690b69dc20da6d096450faa0c256f6896ff8365 has these 3 blobs.
> Can you share the plan to send them to linux-firmware? Is this going to
> happen just after having the CI results?

I was planning to wait for the GuC binaries to be ready first and then 
send a single PR to linux-firmware with all the blobs, which means 
sending the PR either late this week or early next week. Note that we 
usually send the PR after the patches have been merged for 1-2 days, so 
this would be in line with that.

CI is happy, so let me know if you prefer me to hold until we're ready 
with all the binaries, otherwise I'll go ahead and merge.

Daniele

>
>
> thanks
> Lucas De Marchi
>
>>
>> Daniele Ceraolo Spurio (6):
>>  Revert "drm/xe/huc: Define BMG HuC"
>>  Revert "drm/xe/gsc: define GSC FW for LNL"
>>  Revert "drm/xe/huc: Define LNL HuC"
>>  drm/xe/huc: Define HuC binary for LNL
>>  drm/xe/gsc: Define GSC binary for LNL
>>  drm/xe/huc: Define HuC binary for BMG
>>
>> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.43.0
>>

