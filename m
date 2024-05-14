Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1DC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 22:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A2810E0F3;
	Tue, 14 May 2024 22:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXimGnXW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD9F10E0F3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715726706; x=1747262706;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wM882oskqPclG4d+8TnW76ubbLXnwPg692UNPoFmdjc=;
 b=eXimGnXW94wXKsKlfwOUBaq3Xo6un4XMZDYuuq13BnMmvxoY2Mv7pnXn
 YwOu8b9XvsIQt+iver/mbymG2v1R9uxXRruogW6z2q+ekJBLbl2PPu5fJ
 vzR8/Psf0whEIV0DUtQbejkI8HEwlBmZgO5IG5DYsQJdjCZHBdofa/2F4
 SwWGRLc2qQRE3YYxWo3y9DkPAZIgJ6VyUhCHSYFTy1V4B0zUiOx4WQWFy
 ByOtH2MnWc2ShJJbzOg4NEfA+P02xihJlS06V6VxipDPGMloH0yCFu16Y
 I6yQmN7Z2Bo0C+Mp9Brs9t7hqr4xC/LVThjIt/kAo+EnlXlFacakYEhz3 Q==;
X-CSE-ConnectionGUID: cO3EBPLYQtql8bDA4mrzlg==
X-CSE-MsgGUID: kfMMiKMYSN+hunjohdC3vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11577236"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11577236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 15:45:05 -0700
X-CSE-ConnectionGUID: Zjje5ktjRuuywaY+AyL17A==
X-CSE-MsgGUID: V7RjUZT4RXavzc2lR1uR8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30898391"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 15:45:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 15:45:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 15:45:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 15:45:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTd029ZKoXpqB0UxQXZI6mKwQjjH2eA3t2HhJotKAVd68vKl6gdolkd3cU22SMaer6UxyhTfTWXIS4j112IQLeLMC/S2lE5jgKMbzezXMWhPgHaCXoGMS6d6Fw/8fzrl0nT59mnW1nZ/TYQVt9ezGUPXgnQeiTzZq4Ku9FOxMa58EPNM4xk48x9xecNS00ySjjSpZKw+ppVCe4HY0STIWQoUx7cxiF67O2VlRZxtvyfchjls3jyJoyqYC0Rlw8b78s1Z08ziz8IDx4sY5Eb6dvEh2xlFMCt3r0hm/WuLhNSjqqNdDF0sTyr+eMTzzf1sQOHA8aFUgY5Qs9UriMOPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb1Rw5599HNMG5fB/bR1jxLzjWvJExgJSUR0ZpCbmVw=;
 b=QWjZiRJVYe8OJHA/Px1/QHmMHK+s5hEqRAyln/hgn/C0eFucAyUFvwaSjSjsNQzJV55bzwZ4I3shpmxVDknCdqGA9wnNuJ3spM8T1/o2KrjsKzne8ve9+Q80KCv5CCmBaAczXChyQshk+XXCwtvt/bjNJraCsT6oONTIkkUP/LQ4CHipv1edeNjyPAwDxOcxJDrRgvmFBVzWsiclu9wmWxluU4pTtA4z0ViNRo2CgiD1vc0qevNnNYFrUiOlQPNZEB0VWMFnVRNvkdoGjAKOrS5euN8WZ+02uAMKQrTw8IWR8tBC5VcmHhB8z8wGW6veOe3d+WJ4oNcAZh9OhtBHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 22:45:01 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 22:45:01 +0000
Message-ID: <7cb2095e-b808-4ca2-aa2c-1c793526197a@intel.com>
Date: Tue, 14 May 2024 18:44:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-2-zhanjun.dong@intel.com>
 <f55c5f7ef0ab613be9372d1f30cfb5071e872435.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <f55c5f7ef0ab613be9372d1f30cfb5071e872435.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ced6b3-e3d7-4eee-0d33-08dc74677d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZYeUNvREtLR0tNRXMvSllkWVQvaUl3YjR6V2lWNHpIRzVzWWxhK0lHbVMr?=
 =?utf-8?B?SkU0dlFLZ3A4YmRiQkFLY0hGMDJaVUIwRzZNWUZlSEFiTWRibGplTEhQVGx2?=
 =?utf-8?B?Y2dZeXk3VjhmWXBvRFVCanhtcjJxUWllSGloSjYzK0lvT2lpWjMwdTRuakJl?=
 =?utf-8?B?bkVRYTBZaUdHSGNKWngwbzFrdFIvYm5yTTRMOXlGZmN1cmVPaXluOWlyZ0Nr?=
 =?utf-8?B?TW1SUXNQZGFwbG5KenhQUzV0cWpyMEpLYlg5TnoxaW1zeFpxakhHU0MvbHhu?=
 =?utf-8?B?Y2o0K2hmb0NkYmJTSVo0eWhhdWZlV21MdXRJYVJTazBzamhPNU1zYllNRmky?=
 =?utf-8?B?VGhKSUdVUXIvUnRCY094VXg1d2o3WVZZMUI3VjAvcW1jSDZZV0tFZU9EM25I?=
 =?utf-8?B?U0RwUytjdGpBeVBkKzRsb3NFaDh2cFdteDhSWHNWS0xraGJTS3NnUDdmOXl1?=
 =?utf-8?B?WWhqNmtUOVhTT2xNYnpVckdxY1FZU2g3WjVSOVQyMFZHZml6cXpNR3IrNll2?=
 =?utf-8?B?bnlCRkc5b2wwUncyUjRJRW1yVTNPZXBMS2JXOFdhZUxrSFErVmRwZXQxeU1N?=
 =?utf-8?B?TDVRRTZjYkNxQys2RytZU2I5eUNQUDV2VnQ5K2hlMWhoVkVRTllWdmRWM3dQ?=
 =?utf-8?B?dnk5eVRQWnNMT1V0Q0o2STdscEFEcnFib2MrRTRYVWZndnNOcXhLeTNHbUtM?=
 =?utf-8?B?VEFxV0MyRTY1QThNZXF4NDJybmhGZHc0ZVYzWjkrcm9Fek9iRjF0LzJJWmpr?=
 =?utf-8?B?cUZFYlpWU01CQmdpSkxJYlVPanBSK08wYWwxZkt0VHVDZnNCY0J0dm9oUDhk?=
 =?utf-8?B?d3hjbmFHeldXSHZ5SkdNVHJGMWZrNlNpd2VoWVZ4Mm0vcEFpSFVWS2tBaWVG?=
 =?utf-8?B?T1JUSVg1cUdnY2tDYkEwMXpJdnAza3k2NnBQTkZCZDhEcWVkNHFxdzJCWk12?=
 =?utf-8?B?VFNqaHRqRDVLK2ZQRlQycm5ZbEJkZ1V0MTVBUGdsU3V5cFhFdytrS1ZZVkp1?=
 =?utf-8?B?RHpZMnQxY3ZKOEl3SURDVVVVWTJ2YTdzNWNiNGdxaWFMRm10Z1lNNTExK1Ex?=
 =?utf-8?B?TGNnTWx3K0ViU0M0Z2ZURDRvbEpiTDN6SHBUZFNvWTl2MGhYeENDUkZENHQr?=
 =?utf-8?B?aS8vTjZNSXQ2SFJqOUJUWUJEeGpLeCtNMlUwcnliWkNFRVNLak5VL1BCZy91?=
 =?utf-8?B?emdhN29zV0tHcFpRTFMxZ0xsQ2hIOGMrR2dJZmhlbk4wMTJiUGt2SFN2SXJY?=
 =?utf-8?B?bS9TaXE0Wk5RZlp4bEw4SHJQc1I3VGVjN1hlbzY3eTkrZk5JS280UTJHd1pE?=
 =?utf-8?B?SVA3eE5LUUw3NFYrTGd1UXhPbHV5Yk5xcitHdkxnd1h1aW5udEFkdEtYTUJ0?=
 =?utf-8?B?ZThzdFd5ak9aTDUzM0NjY0p6MUhtc1RtVGRXZTlPOFNMUGdOOUx2STlVUnli?=
 =?utf-8?B?S1ZmSFIxN3l3ZzlQK00wSkFEbjZNdWVVSFVBWk4reklHdi94NndPcEJTYnN2?=
 =?utf-8?B?RWJWT0Q5WVdwdm5OZHYyQ1NwS3BCYlFJK2pIcVJ6aVdGb0FuR0FXenowMFhj?=
 =?utf-8?B?Z09VL1ExZ2x5SzBleSt0SFBWTnRTaEJzZFhCOURRUGZoVHV2eGNxcWFxSGEr?=
 =?utf-8?B?UVRIS0NYc041clVkNEUzWFZwb2lVVUFrUytlUHdVc3YyQnVpMGZMTGVZQVRQ?=
 =?utf-8?B?cHVDVGNWMmNwbXZUbG5STW55cFlIei9IL1dqaWVhZ3hjRTUwdGZGMS9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhlWWQwVkFWRnN2cE4zYkJQMEN3eCtYanhRSUJ6azVSaEs4TW56cEx6anJC?=
 =?utf-8?B?VjMwdDVwYXFhd0xmUUdvd3VtRTVRQmZ0TWVUcVpONjVxNWRGTktKUUtYY0dY?=
 =?utf-8?B?T1dYYitINndiRVRCck03aWp3SDdSOFo0bFNYdEtDUmpRZldCbkZJTGI1SjQy?=
 =?utf-8?B?SDQrOHR6WEtsNVMwL1QzcW5weWxLOG9YeWl5U0ZZV0c3OEFma0J0M3djb3Ri?=
 =?utf-8?B?RFFYZXk5V3NUUlZNWENpVkR2T2R5aXRRWkI3VzJMWFVuemRNNmVzOGN1VWty?=
 =?utf-8?B?bVI3NXBGcjljSTdxOTZRTDArTXVldFFkUDJjT0ZEZ2hxMjN1WU1yWTZaTHRk?=
 =?utf-8?B?OEdGZTBISFl1TjE4cTBLb3RFMlVGN2hzeXZCVDlJT3Z1REFTdFRGMWRCbG9L?=
 =?utf-8?B?YkFnOHNRSlN2RnFmR2FIMVV4Z09XQm43SUg4M0VyZkNRR2VZYUwxT0JRSW52?=
 =?utf-8?B?elVyVjhtQVNOUzVyK0IwMkRWS1FNTkNtQVJ4eFNnWDBzZUFWci9sUzRLaldE?=
 =?utf-8?B?bTA0Sk51ZERySTdVUnVWOWVGeVFFZmtkSjRNR1NJczVpOE9VOFoyKzJjejk2?=
 =?utf-8?B?ckF4bTdZK3g4RU9FUERoN09wYkVHNzNUR2MyNE1peWw0MHN1UVEwL21NUHdE?=
 =?utf-8?B?S1h2azZYN3BjRlFTMVFoSzhua0dZeWM4LzJYVVJ0VWRpckVuQytOeGZQdHlw?=
 =?utf-8?B?cDlxcVVMMTlabVp4Yk9HSTh2R2I5dnpUamhZNGtKOGwxd2tYSFRuY3NmNkU4?=
 =?utf-8?B?dEVYYnU0bHlLbmszNmxqYjdrdi9BNk9HN3JrTXR3YWxBck5nL0w1VDduV0pw?=
 =?utf-8?B?RzY1Y0FLdEN6bUJCYnZkZUlZSkxhaWl3UkcyejB5dkZrd0NYeVNOUjRCTVBD?=
 =?utf-8?B?MVBBUnJzSVowTjBCZXZpL0lEM3o5eDQwWlgwMUVNa3J2UXRxRW5ucmtoRFRX?=
 =?utf-8?B?V2MxNkFIdEE2SHR4YnE3ZmNIMlVqK3lIOUNQNnNFM28vbjVFWk5vS2EvejVY?=
 =?utf-8?B?RXZ3cjM5YVBLbERrUjRiT3pBalJTYW9jcDhHZW9OWmk4UDh0clNNNS9Icmcr?=
 =?utf-8?B?MmdpaG84eE5SZlkwbGQ3VDZDdDBuYnlHT1F6dXI3SXVNTmgzQ0owQmx0blFz?=
 =?utf-8?B?Tlk1UzBwZlZhU2thTVRjQUZxYWIxOVo2eHY1ZEwzaEVRdXlIdXIrYytlTTRR?=
 =?utf-8?B?LzFWUGRZNk1Hd05pM3dsOWRGNE91VU5qYnVzdWVKS0FKSi9FZVgwbllQUnFD?=
 =?utf-8?B?SUZuaFFCWGVpQ04vQnNtREo3bUtRVG5CaWtHNUNockxzdHhKZ1VuOEF0Ynp3?=
 =?utf-8?B?NWtEOHZaN3FpWnZicWlrTEgyVkNhaENOVTJIMnlQZ3JPcFJZa1l6SGZMSUlE?=
 =?utf-8?B?cEdpM0V0L09LY1NHQ0VVNTY4WU5aaDFhTzJEMVJqNVhwM3JkUWhtU2cvMSs0?=
 =?utf-8?B?UllkMzAyR2NoQUpiQWloQ29TdncrZnNoaVlrSGxJZWFLd2I1aUR2bnBmV1FN?=
 =?utf-8?B?NWVTczBHdVVOQStHN244bloyZVkvaEhuRVVKam9tWHBZMEppUmQ5cFFON25N?=
 =?utf-8?B?L0xHQnhEV0JTTlJzOThlbTJsNVBaZnV1T0p5SktFV0ZSck01c21DNGFvVVBF?=
 =?utf-8?B?R1JKbUNPcEgxVndDanQ2ZWJlalBIeWxVaC9HalNKbjIySjJDNmNBWkd2ckFZ?=
 =?utf-8?B?Z2dwa0w2SkdBS2dEYnZDMExYcW9EMTBRbUYxWXppYU5YYUxuOE5SWFBGTEJ5?=
 =?utf-8?B?bkNVaDNUNWt0YVFTOXlLeGptT2M4RXVtTTZVV2FXaWs2d0ZRY2d5M1hjMWM2?=
 =?utf-8?B?YldnMkJjMjl3RTRNVGZ5cjVVTDZHM0wyc1c2WHN3RGFCYUtHSVFQMStLSnBQ?=
 =?utf-8?B?cGRwRytjTE9adUM1Nk1acGFsRm9FZkYybWJlMmo2KzdhQmc4ajhjY0hzQ0hE?=
 =?utf-8?B?L3BsUzNVaFF1b0FxNVBNNGRLU0tDOW45RnRpZXBHMjZHemh4aE9NUFFmdnBs?=
 =?utf-8?B?L0Q3ZjNZdndDYlRzUEpYSzNlRlA4UUt0UW5wT3Z2SUErL2xYOFNydG9wS0Z4?=
 =?utf-8?B?UXM1SW9FTURLODdSTXhIWWFVR05oOExMRHdVbm96QkdkSmZ5Q2tEZS85SHI3?=
 =?utf-8?Q?+7jxjBHAKQJwPCUERxlHrq49W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ced6b3-e3d7-4eee-0d33-08dc74677d5b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 22:45:01.5245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6h5OvKMu9OpwaQEOgxxJoIag0snm2uGhnRlgrQFGB3r0oEDczcHPY2jWsQpY3N4h/bVUSDV8RNnM8eAroUF0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

See my comments inline below.

Regards,
Zhanjun

On 2024-05-10 2:43 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2024-05-06 at 18:47 -0700, Zhanjun Dong wrote:
>> Add referenced registers defines and list of registers.
>> Update GuC ADS size allocation to include space for
>> the lists of error state capture register descriptors.
>>
>>
> alan:snip
>> +int xe_calculate_guc_regs_capture_worst_size(struct xe_guc *guc)
>> +{
>> +       size_t total_size, class_size, instance_size, global_size;
>> +       int i, j;
>> +
>> +       /* This function calculates the worst case register lists size by
>> +        * including all possible engines classes. It is called during the
>> +        * first of a two-phase GuC (and ADS-population) initialization
>> +        * sequence, that is, during the pre-hwconfig phase before we have
>> +        * the exact engine fusing info.
>> +        */
>> +       total_size = PAGE_SIZE; /* Pad a page in front for empty lists */
>> +       for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>> +               for (j = 0; j < GUC_LAST_ENGINE_CLASS; j++) {
> alan: so in rev6, i mentioned in one of the other hunks that in guc interface,
> the 'max engine class' definition used by guc-error-capture register-list-arrays
> does not follow the definition of engine-class enum of above (which is used
> for submission and other interfaces with GuC). I notice you fixed this on
> another hunk but missed it above. I should have made it clear this change is
> required for ALL cases where we are looping through the engine classes' register
> lists used in guc- error-capture.
Thanks, will changed to GUC_CAPTURE_LIST_CLASS_MAX

>> +                       if (xe_guc_capture_getlistsize(guc, i,
>> +                                                      GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +                                                      j, &class_size) < 0)
>> +                               class_size = 0;
>> +                       if (xe_guc_capture_getlistsize(guc, i,
>> +                                                      GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
>> +                                                      j, &instance_size) < 0)
>>
> alan:snip
> 
>>   #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads)
>> @@ -398,6 +443,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>          struct xe_bo *bo;
>>   
>>          ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +       ads->capture_size = xe_calculate_guc_regs_capture_worst_size(ads_to_guc(ads));
>>          ads->regset_size = calculate_regset_size(gt);
>>          ads->ads_waklv_size = calculate_waklv_size(ads);
>>   
>> @@ -431,9 +477,10 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>>          xe_gt_assert(gt, ads->bo);
>>   
>>          ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +       ads->capture_size = xe_calculate_guc_regs_capture_worst_size(ads_to_guc(ads));
> alan: nit: we had an offline conversation that despite post_hw_config knowing
> exact engine class list, we simpliify and improve execution time by using
> worst-case-size in both pre and post hwconfig when deciding on size. Would be nice to
> add a comment on that? (so folks dont assume its a bug)
Sure, will do.
> 
> alan:snip
> 
> 
>>          ads->regset_size = calculate_regset_size(gt);
>>   
>> -       xe_gt_assert(gt, ads->golden_lrc_size +
>> +       xe_gt_assert(gt, ads->golden_lrc_size + ads->capture_size +
>>                       (ads->regset_size - prev_regset_size) <=
>>                       MAX_GOLDEN_LRC_SIZE);
> alan: i missed this in rev6 - why are we using ads->capture_size to verify MAX_GOLDEN_LRC_SIZE is
> sufficient? i dont believe this macro is related to guc-error-capture reg list.
> 
Yes, will remove it.
> alan:snip
> 
>> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>> +{
>> +       struct xe_guc *guc = ads_to_guc(ads);
>> +       struct xe_gt *gt = ads_to_gt(ads);
>> +       u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
>> +       struct iosys_map info_map;
>> +       size_t size = 0;
>> +       void *ptr;
>>          int i, j;
> alan:snip
>> +                       /********************************************************/
>> +                       /*** engine exists: start with engine-class registers ***/
>> +                       /********************************************************/
>> +                       write_empty_list = true; /* starting assumption is an empty list */
>> +                       size = 0;
>> +                       if (!xe_guc_capture_getlistsize(guc, i,
>> +                                                       GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +                                                       j, &size)) {
>> +                               if (total_size + size > ads->capture_size)
>> +                                       xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
>> +                                                 total_size + size, ads->capture_size);
> alan: i think premerge hooks are failing due to format specifiers - please do fix that.
> alan:snip
>> +       if (ads->capture_size != PAGE_ALIGN(total_size))
>> +               xe_gt_info(gt, "ADS capture alloc size changed from %d to %d\n",
>> +                          ads->capture_size, PAGE_ALIGN(total_size));
>> +       return PAGE_ALIGN(total_size);
>>   }
> alan:snip
> 
>> +#define COMMON_XELP_BASE_GLOBAL \
>> +       { FORCEWAKE_GT,             0,      0, "FORCEWAKE" }
>> +
>> +#define COMMON_BASE_ENGINE_INSTANCE \
>> +       { RING_ESR(0),              0,      0, "ESR" }, \
>> +       { RING_EMR(0),              0,      0, "EMR" }, \
>> +       { RING_EIR(0),              0,      0, "EIR" }, \
>> +       { RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
>> +       { RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
>> +       { RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
>> +       { RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
>> +       { RING_IPEHR(0),            0,      0, "IPEHR" }, \
>> +       { RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
>> +       { RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
>> +       { RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
>> +       { RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
>> +       { RING_START(0),            0,      0, "START" }, \
>> +       { RING_HEAD(0),             0,      0, "HEAD" }, \
>> +       { RING_TAIL(0),             0,      0, "TAIL" }, \
>> +       { RING_CTL(0),              0,      0, "CTL" }, \
>> +       { RING_MI_MODE(0),          0,      0, "MODE" }, \
>> +       { RING_HWS_PGA(0),          0,      0, "HWS" }, \
>> +       { RING_MODE(0),             0,      0, "GFX_MODE" }
> alan: I notice that "struct __guc_mmio_reg_descr.regname" is introduced here in
> Patch-#1 and used in the population of the static reglist table above but then
> never ever referenced in the entire series. In fact in Patch #6, its removed.
> 
> NOTE: this is different from i915 where this variable was used in the reporting
> patch of i915's series but it looks like from this xe series version, we are
> creating a shared "register->offset->name" lookup table list in xe_hw_engine.c
> for both guc and execlist in Patch 6.
> 
> I believe this flirts dangerously close to breaking linux patch rules. A variable/
> func not used in the entire series really shouldnt be added. In this case, we are
> NOT consuming regname at all anywhere in the series. And then we remove it in the
> subsequent patch-6.
Yes, will get it removed in next patch.
Meanwhile, as there are 2 register list exist in capture and 
hw_engine.c, so I'm also consider to merge them. It could be done in 
separate patch.
> 
> alan:snip
> 
> 
> 
>> +static int
>> +guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
>> +                       size_t *size, bool is_purpose_est)
>> +{
>> +       struct xe_guc_state_capture *gc = guc->capture;
>> +       struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
>> +       int num_regs;
>> +
>> +       if (!gc->reglists) {
>> +               xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       if (cache->is_valid) {
>> +               *size = cache->size;
>> +               return cache->status;
>> +       }
>> +
>> +       if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
> alan: so this one took me a while to figure out why it has become orphaned.
> (after i went through the entire series hunting for it). I'm referign to "is_purpose_est".
> 
> So this is another i915 inherittance which did have valid reasoning. In i915 when we
> were doing "check_guc_capture_size" (which is a one-time event), we wanted to flag if
> any of the register tables were non existent. take note that at this early log-buffer-
> calculation time, we assumed all engine classes are valid on the platform at
> pre-hw-config time. The reason is because we did actually discover cases when new
> platforms added new engines and the developer completely missed adding the register
> table for error capture as well. With this message, it would get flagged as a warning.
> However, this same lower level function was also used for the regular register
> list population which can get called everytime we reset guc including coming
> out of suspend or if we performed a GT reset and so we didn't want that warning
> to happen every single time - only once per module load. so thats why we
> created a wraper with that "is_purpose_est" to differentate if the caller
> was for the log-buffer-size-estmation or for actual population where we only
> print the warn in the former.
> 
> so my review comment would be: we already learnt the lessons from i915 so lets
> use this properly. i suggest we fix patch #3 so that check_guc_capture_size
> will call above guc_capture_getlistsize with is_purpose_est set true as opposed to
> calling xe_calculate_guc_regs_capture_worst_size. I'll make the same comment
> in Patch3

Thanks for point out. Will be fixed in patch 3
> 
> alan:snip
> 
>> +
>> +#endif /* _XE_GUC_CAPTURE_H */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>> new file mode 100644
>> index 000000000000..79bc277afaa8
>> --- /dev/null
> alan:snip
> 
>> +struct guc_state_capture_group_header_t {
>> +       u32 owner;
> alan: If i read the the spec correctly, capture_group_header's owner
> has VFID field at GENMASK(7,0).
Will add.
>> +       u32 info;
>> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
>> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
>> +} __packed;
> alan:snip
> 
