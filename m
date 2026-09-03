Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8909BC624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85710E166;
	Thu,  3 Sep 2026 20:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+DCP67M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7F810E166
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788466393; x=1820002393;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=zR3O6BlAo1PzvIhJqrL545A4Sp2OkL3fSSzlmMNDsgw=;
 b=h+DCP67MTY7eUbtU30UYorT5zAiANaKAIflMKZ1pY7HWopt5unMACIox
 y8GVLifw+jb3sL3GKvKRQG8uHCJ0j/0PHVFIJkgixGx8AIPf6ovSbjZTm
 er4Ccclvbr0sW1x0Eg1B6BdQiAjdjsMrKBUUhiRnqQqYtIk4cS8JqZhos
 yQpyXDidsU2QixUZtz50CL+ez7K+mw54QlFNk5puWZ+XSuOaYbFn1fIdT
 w9ahl5/WuOmh5iS8XnoDBt5T6ioUqY+UBLKCfUOSaokJrhf9jUz1fWfHn
 UPtZ/p4gRZwJNSXQSV0q2IlqvHgzoPQO6JOn6WFjl/yv2k6rfX7IvvM4e g==;
X-CSE-ConnectionGUID: /znYnNHFQNezCwY4yiMXjQ==
X-CSE-MsgGUID: bvlqPTUyTMCMOPHQ/6KP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88983162"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208,217";a="88983162"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 13:13:13 -0700
X-CSE-ConnectionGUID: DFKLPYYWTZOrH+qRIxiE+A==
X-CSE-MsgGUID: WXYzgRoZRjSMgZWstOEsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
 d="scan'208,217";a="270357213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 13:13:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:13:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 13:13:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 13:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ro4jifdQZCeCNW+LZsmPTFT/9EbHiEY5QQIiodF9CDtqILDkLzGKlyzqOe0Z/iBTyPZ/TnxFDpXCZmJNtPg0v/SjO+diqZ8qQf3rv04lCMZFlrp8dX/rNZgp4zvKJSO9DLRH+Xl9do9Ph4RpPp6Tdps6vesE5b9+ijLiBJE0I/mHhO8y8t99+ZJk0svgAo/nO7P2ydlpp0mKpz+78ub8uwlzYztSN0Gmiwh4UjXoU2+mEZ2GWe1RstABrqte5AxPEAbffLMkY80cHF01MGz5dWJyCjpQSgSwYcON7gbzHrsf/uRWjGF+OYcsMle7ELRG65TckqshysQ1Hj1QKc3xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mU0Rew8CtAddW0gsTZPz9rX3R4vBTxYtc18TdtpKtg=;
 b=ycllfsonTf8oFj9ekuLCWgW++yf4QWcoaBlIh54rNW2dmnfaMmVqG5l6/lOMGM8TulKmZZucDG1fAZAYfZfl9kUB9tYrhvSKxIQksLlgKlNvuZDkBzkP8b/ADpA2azS2bUqocDjRUpkzcZIlDsZqEVyocKiCVswek6U7w2Y8bzIH09LzPUJ/ms6XcL2IQvpMWcqex6ymDL6ZC3qhFZPATS3Raj2PZheU2CiB6Ky7axxD8GmheYOJ2yZvkqyEltbsOyhI9EFmhFBu5Ev1pgdHhP5DYbuEMlCd5DfylEa5Bx8SKl6rFY+X4erj1sMB92tDy7RqUhHICNVE7/C42wnVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by DS3PR11MB9820.namprd11.prod.outlook.com (2603:10b6:8:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 20:13:06 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 20:13:06 +0000
Content-Type: multipart/alternative;
 boundary="------------0n0kq5kDRkE1CbY3muUFAPa0"
Message-ID: <62002808-d906-4cf0-a5f8-d5368ccb86a2@intel.com>
Date: Fri, 4 Sep 2026 01:42:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/sysctrl: Add System Controller get
 application status
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-7-anoop.c.vijay@intel.com>
 <apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|DS3PR11MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5596cc-6314-49a4-5ec4-08df09f7c406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|8096899003|5023799004|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 4jA2LsnoNmP067etoZhciRdlvBRVWsF89OWlSuHR7XUV06n5r0IYX1Tk+EE7+fd2jAhcRz9PHLM90/NKBUSHvich7r+KQYfnPOVlbE3DQ1EtPaNhrQOaVKtLyiFuuLsfUbT6PQl4PVsbsTsq09tKoPZHyjVwsMYw3tqeqyfvpqzF9duycqHKTEL3xhS7hHsmjTepq9QX7/NCZJZnFM0SehEOvFaJkn4GDctyFKvUQaVvv7FAiccpK2kjohzx9YgHu10CKtgfS4G5iBCVFBt+IiEeZZOWE+0puaFMRldGBv712w5qmrY133Y0z/Mrhm93Xp/g/7ZfVkitYxAjR3j3rQFV9++KvIQzO9fKozqsQaHFhCKpY3K5D/q8gWa3mHl4nCD6D83LqpNlEH0ts+pbtyCkk/f+vXBzL4BdB9hHgsZLW3ouGIAbLCu0QwpyIr3DPXXGYeHdWJBZgkVc6GYtYv/c59mbd10V3O56TyzRSIWX9clbYTD/qfHSB9M9QIbHoqz4eaf5u6ZYEfLumvIghD2qwhFeNazYczk/9DgF4vvFaz4/WLm43mXpggD5NQjBhKo2ZShjCODu3g/v0zII7JIV3Owv30fFRCYQJ/afM5Hbn2Uzu+WqD6rhgaBCORXz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(8096899003)(5023799004)(13003099007)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNEUFp1RHBGR0dGVStRSFFwNmlkUFBKdmNpaVJYQVNNamwyQXdJVHk5ZHFa?=
 =?utf-8?B?d2piOVpMb3dHNGhwUmx6WnlPTlVtRU1VWExIbTJoaS9VS0h3YUhxek8wWkpT?=
 =?utf-8?B?MjB2ancxallnOFJlNnVtRmVJampkajlDN2p2bzBRZTFzRWZidldzZ0VBRFFz?=
 =?utf-8?B?TnlVem9mMm5meFIvRGpCajR0ODlZL1MvbnFjMy9mKzRNdmlETnBETFoyaytz?=
 =?utf-8?B?ME5TWnpYL0tEVFBaWFN1Y0Q2SWhzZDBmRFFSOE1zampTaUY5T3hHdWZ4Ulll?=
 =?utf-8?B?dDlGZlpHVnBkWW1pNlJGNFViRXNBZ1pxY2xWUzVjN2dKNnVjNUQxQlVNdERC?=
 =?utf-8?B?VWR2R0FxTENFSjVpWlZac1ptOFpJOVh2S00wYWI0d210bnRsUFgxR2NTU2pH?=
 =?utf-8?B?M25reHNubDNaZ082QVBsUC8xcXpjSStzelplazFtMWRWNnFaUzl3Sm5ncW5S?=
 =?utf-8?B?UmtkWEo5SjZieTZLcFlIZm5vQW9OTGZZeVlMcW9HcVlBNkE3QUhkc1pJdi83?=
 =?utf-8?B?WVg5VHo0T2ljUUlpMW5TVkhZRG56aVFrejhEQUl6WFRrMnkrZVhibWlFcVEy?=
 =?utf-8?B?UGFJa0p6c2NNU0lFMWliZ0QvNjNQWmt2UUFHZGZVQXk1UzdaNnhLSXdmS2Ru?=
 =?utf-8?B?ZlltakxyZFQvenpyTjVXVTBuM3VnZ2FoeTVsNmhBREJqeHlITEM4Tlh2ZWN5?=
 =?utf-8?B?eXJjeGhLV3VidEY4MXhCcjVHeUN4SmQ3RTJLQktZaXF2dDNJS2xWVEZJMVdM?=
 =?utf-8?B?cEc5c1NyWDcvcWNlbHhmcDN0S0YydGhHWFErcEFyK1JnSWNEcnVUWEJ0OHlY?=
 =?utf-8?B?NjRBLzdQMTNUajRRc1V4emVkNnpJb1ArTElyTk9KT1hVaTI4bW0zbWU5cmRl?=
 =?utf-8?B?Sk15R0MxWkM3eStxVjI4RU5reEJBSUVBc1ZqRHkvSFBPNjVKNEFoRUFRMkJS?=
 =?utf-8?B?Y0tNTWl2OWxOdWM4Rm5hOSs4TDUwOGY1ZVdEcmMyL3kzWGJHY1hmOGFsZFky?=
 =?utf-8?B?c1dEZ1QrSlE2RTF1eVZLc0JnbThBdTNEcmVhWTdFVS85d0Z4L3ZkTFFXYUIv?=
 =?utf-8?B?TWROdUpSd2NZTFNhWmY5d2lyOVNCOFpWd2szaWQrTlk3S0FOQ3k2ckNLZHR5?=
 =?utf-8?B?d3E1YTluT2RnWG1OY0JjMWswZ2VOaE1wQitqYXo4VDRkcEhZbGt5eWNXY1RF?=
 =?utf-8?B?TjdKbjB2Vlp3K2Z0TU9aYmZlY2tRcEdHUDRzaVFsbUEyZVR6NkZYTjJLQzlG?=
 =?utf-8?B?Q3BYWk9velRKeE1lTFlqQlplK3RIZXBERUNnZkV2NjRHMmJCS0RhN1pJK2VT?=
 =?utf-8?B?MXFxOTlrTEJZNnA1WGpzTHlhaDdaUkl4WVJPV0RWRHUvREcyeGxQd3N0djAy?=
 =?utf-8?B?RFRIUWJnRkhEalpacFNtNm1FdXhUcVJ2bytnNEZjZlRKUU1MU1VZTVdtRWJy?=
 =?utf-8?B?b3p6WEJDQlJBNUo3Nkkvc3g5Umw5N0tqL2o5MzJURmIxMFJiTUJ0NDdFaUpG?=
 =?utf-8?B?OHYyZGJJeU5XVFBmOEF3dmxObnNwUzA0dGp2RmpMbmZ1RFBmWVlmTUZPU21v?=
 =?utf-8?B?MzY1YlpUaWluVDNjSVFodm5EOTlHbURrRm13Q095bTQ3QTBLeGJHaTJpQ2NV?=
 =?utf-8?B?em9iRWYxV2hhMGtpR0tacnNObEowMkQzUnZXVkE2cm5OWXhGRk1tYStJRjN0?=
 =?utf-8?B?RkF4RURpYjZHVXB6bW1uN25zZzZlL0xjeGd0eklkY3hRYnBTQXVZUUxaNkNS?=
 =?utf-8?B?QjlNUlRqU0xzNlIyYWJkNEl6eGpmWkVlR0QvMk1oWFNXbEpZc0VZU003K2V6?=
 =?utf-8?B?UTlLVUNESFFXR3g0VjZGUUZldUVhVE1yVGFoTDNrTXNSSzIwYW5TOVhTYjhY?=
 =?utf-8?B?TDluSnMxK2IwY0xZUUZpeFFTWTgvNE5VSVlDNVFXRnQ2VlBFd1ZCMmUrQ2pN?=
 =?utf-8?B?OE04QWxPTTRGVFZGWWI3S2RGSkd0elJsSmRoTWliKytoMDFkUHlUeDFHNVJi?=
 =?utf-8?B?VVNoSnJTemZiUkF1dWRISU1tNGJLalE5Tzd2TDRFTW01M3hYZStERitGc2x5?=
 =?utf-8?B?Ym1TM2xXczhFVkR4ZDFITEsrR09GVlJZcVJWWGlDYi9PbkoyK1gvRDlyUXFF?=
 =?utf-8?B?YU5heEVyaHRaM2NNWm1xaktVQjF6cTN3R05VZUFPWWZESlY0N0xqdzQyNGE4?=
 =?utf-8?B?dVdVMjRwN05Ka1QxS1Jqek9kNFIrbTEzODlRNzhOZmxiNEtLSzBNVHU2NVpP?=
 =?utf-8?B?dnlRamUwZ1NZVDR0Zm1ZV3Z1Nk9JdER4bi9SeWZhMzAwRDdRWi9IYkxwbHhI?=
 =?utf-8?B?ZzZrOHhmOW5zeDVzWmREL0p2dXJIWHVYV2NOeUNiVElOQndwTzExZkdVZngy?=
 =?utf-8?Q?nBnA7w0v1huBWxyM=3D?=
X-Exchange-RoutingPolicyChecked: LjmeAv8tBXBaoRZMWNOo2dWrY9xUma1q3Fql5ZWMMSsZ3GrPco6ObXTLXCDc7/nPL8WuHWKI76DRBK7SKsEnsYYXilWu4dYAO8NVveAyVT7Z3kuNdMZX7XkRXecCkjVSqna39sL9usz0F86ji7e8H9YXqOWaLzGRuD5u2g8VHQn6ElRQ2UE5AWLjgUndV7dV6oSF2R2NuAnYf18MwjK/5hfkGfeI1OnAzYVomw9W02LND+LsQj72FxsDPopE9O1kyJEJQwA371aj0y3MsKlbMKSK8afKD9UpJvMZc6sVCq3nQLBuLPjf3VidSCkfRm/rU2gnEBNsnU826PiwR8dLkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5596cc-6314-49a4-5ec4-08df09f7c406
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:13:06.4538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdOI86LGwd2bqJZXu8BThonRdsDs5Z3DBS4n9yY1AtjP/HU3qgbYZCzfeOncO9Fz5VzC3SeXOmNp0nvtb840SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9820
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

--------------0n0kq5kDRkE1CbY3muUFAPa0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-09-2026 00:47, Umesh Nerlige Ramappa wrote:
> On Thu, Sep 03, 2026 at 07:03:41AM -0700, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Add support for querying System Controller firmware application
>> status. This allows callers to determine whether a given firmware
>> application has completed boot and post-boot initialization.
>>
>> This patch is carried here only as a build dependency for this
>> series; it is authored and under review as part of a separate
>> get-app-status series and should be dropped/rebased away once that
>> series lands.
>>
>> Link: 
>> https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/
>> Link: 
>> https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/
>>
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>> v4 (Rodrigo):
>> - Added lore links to the parent application-status series
>> ---
>> drivers/gpu/drm/xe/xe_sysctrl.c               | 82 +++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65 +++++++++++++++
>> 3 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl.c
>> index 62ccc9be71b4..5da591ade4e4 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -13,9 +13,11 @@
>> #include "xe_device.h"
>> #include "xe_mmio.h"
>> #include "xe_pm.h"
>> +#include "xe_printk.h"
>> #include "xe_soc_remapper.h"
>> #include "xe_sysctrl.h"
>> #include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> #include "xe_sysctrl_types.h"
>>
>> /**
>> @@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>
>>     xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>> }
>> +
>> +static enum xe_sysctrl_fw_status
>> +xe_sysctrl_check_app_status(struct xe_device *xe, enum 
>> xe_sysctrl_app_id app_id)
>> +{
>> +    struct xe_sysctrl_app_status_req req = {};
>> +    struct xe_sysctrl_app_status_resp resp = {};
>> +    struct xe_sysctrl_mailbox_command cmd = {};
>> +    size_t out_len = 0;
>> +    u32 flags;
>> +    int ret;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
> Reiterating previous review comment - based on the users that you had 
> listed earlier who query app status, we will never get to the above 
> condition, so it can be safely dropped. Once you do that, you can drop 
> the status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP checks in the below 
> (_ready) helpers.
>
> Instead, if you want to retain this check here, then each of the below 
> helpers must be split into _ready() and _supported(). The split 
> versions should check for the specific case. It's the caller's 
> responsibility to handle the cases as needed.
//
APP_NOTSUPP was added based on Mike's earlier feedback to handle 
non-SysCtrl platforms.

@Ruhl, Michael J <mailto:michael.j.ruhl@intel.com>, can xe_vsec perform 
platform check and only call _fw_ready() on SysCtrl-capable platforms? 
If so, I'll remove APP_NOTSUPP. Otherwise, do you need separate 
_supported() and _ready() helpers?

>
>> +
>> +    req.app_id = (u8)app_id;
>> +
>> +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, 
>> XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>> +                  &req, sizeof(req), &resp, sizeof(resp));
>> +
>> +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>> +    if (ret)
>> +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +
>> +    if (out_len != sizeof(resp)) {
>> +        xe_err(xe, "sysctrl: unexpected get app status response 
>> length %zu (expected %zu)\n",
>> +               out_len, sizeof(resp));
>> +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +    }
>> +
>> +    flags = resp.flags;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>> +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>> +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>> +
>> +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>> +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>> +
>> +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is 
>> fully initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if oCode firmware has reached the initialized state, 
>> indicating
>> + * it is ready to handle requests. Returns true also on platforms 
>> without System
>> + * Controller support, as there is no firmware gate to wait on.
>> + *
>> + * Return: true if oCode is initialized or sysctrl is not present, 
>> false otherwise
>> + */
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>> +{
>> +    enum xe_sysctrl_fw_status status =
>> +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>> +
>> +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
> See above comment.
>
>> +}
>> +
>> +/**
>> + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully 
>> initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if diag firmware has reached the initialized state, 
>> indicating
>> + * it is ready to handle requests. Returns true also on platforms 
>> without System
>> + * Controller support, as there is no firmware gate to wait on.
>> + *
>> + * Return: true if diag firmware is initialized or sysctrl is not 
>> present, false otherwise
>> + */
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>> +{
>> +    enum xe_sysctrl_fw_status status =
>> +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>> +
>> +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>
> See above comment.
>
> Thanks,
> Umesh
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl.h
>> index 090dffb6d55f..b69a3f474236 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>> int xe_sysctrl_init(struct xe_device *xe);
>> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>> void xe_sysctrl_pm_resume(struct xe_device *xe);
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 66e7cbcc3f91..d756b50cde6b 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>  * enum xe_sysctrl_group - System Controller command groups
>>  *
>>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>> + * @XE_SYSCTRL_GROUP_CORE: Core group
>>  */
>> enum xe_sysctrl_group {
>>     XE_SYSCTRL_GROUP_GFSP            = 0x01,
>> +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
>> };
>>
>> /**
>> @@ -42,6 +44,69 @@ enum xe_sysctrl_gfsp_cmd {
>>     XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>> };
>>
>> +/**
>> + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>> + *
>> + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status 
>> by ID
>> + */
>> +enum xe_sysctrl_core_cmd {
>> +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
>> +};
>> +
>> +/**
>> + * struct xe_sysctrl_app_status_req - Get application status request
>> + *
>> + * @app_id: Application ID for which to retrieve status
>> + */
>> +struct xe_sysctrl_app_status_req {
>> +    u8 app_id;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_sysctrl_app_status_resp - Get application status response
>> + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* 
>> definitions)
>> + */
>> +struct xe_sysctrl_app_status_resp {
>> +    u32 flags;
>> +} __packed;
>> +
>> +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System 
>> Controller firmware */
>> +#define XE_SYSCTRL_APP_RESP_VALID        BIT(0)
>> +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot 
>> sequence */
>> +#define XE_SYSCTRL_APP_RESP_BOOTED        BIT(1)
>> +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all 
>> post-boot initialization */
>> +#define XE_SYSCTRL_APP_RESP_INITIALIZED        BIT(2)
>> +
>> +/**
>> + * enum xe_sysctrl_fw_status - System Controller firmware 
>> application lifecycle states
>> + *
>> + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by 
>> firmware
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has 
>> not yet booted
>> + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, 
>> post-boot init pending
>> + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available 
>> on this device
>> + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System 
>> Controller firmware failed
>> + */
>> +enum xe_sysctrl_fw_status {
>> +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
>> +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>> +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>> +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>> +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>> +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>> +};
>> +
>> +/**
>> + * enum xe_sysctrl_app_id - Known System Controller application 
>> identifiers
>> + *
>> + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>> + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>> + */
>> +enum xe_sysctrl_app_id {
>> +    XE_SYSCTRL_APP_OCODE    = 0x0C,
>> +    XE_SYSCTRL_APP_DIAG    = 0x0D,
>> +};
>> +
>> /**
>>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>>  */
>> -- 
>> 2.43.0
>>
--------------0n0kq5kDRkE1CbY3muUFAPa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-09-2026 00:47, Umesh Nerlige
      Ramappa wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com">On
      Thu, Sep 03, 2026 at 07:03:41AM -0700, Anoop, Vijay wrote:
      <br>
      <blockquote type="cite">From: Anoop Vijay
        <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
        <br>
        <br>
        Add support for querying System Controller firmware application
        <br>
        status. This allows callers to determine whether a given
        firmware
        <br>
        application has completed boot and post-boot initialization.
        <br>
        <br>
        This patch is carried here only as a build dependency for this
        <br>
        series; it is authored and under review as part of a separate
        <br>
        get-app-status series and should be dropped/rebased away once
        that
        <br>
        series lands.
        <br>
        <br>
        Link:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/">https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/</a><br>
        Link:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/">https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/</a><br>
        <br>
        Signed-off-by: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
        <br>
        ---
        <br>
        v4 (Rodrigo):
        <br>
        - Added lore links to the parent application-status series
        <br>
        ---
        <br>
        drivers/gpu/drm/xe/xe_sysctrl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 82
        +++++++++++++++++++
        <br>
        drivers/gpu/drm/xe/xe_sysctrl.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +
        <br>
        drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65
        +++++++++++++++
        <br>
        3 files changed, 149 insertions(+)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
        b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        index 62ccc9be71b4..5da591ade4e4 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
        <br>
        @@ -13,9 +13,11 @@
        <br>
        #include &quot;xe_device.h&quot;
        <br>
        #include &quot;xe_mmio.h&quot;
        <br>
        #include &quot;xe_pm.h&quot;
        <br>
        +#include &quot;xe_printk.h&quot;
        <br>
        #include &quot;xe_soc_remapper.h&quot;
        <br>
        #include &quot;xe_sysctrl.h&quot;
        <br>
        #include &quot;xe_sysctrl_mailbox.h&quot;
        <br>
        +#include &quot;xe_sysctrl_mailbox_types.h&quot;
        <br>
        #include &quot;xe_sysctrl_types.h&quot;
        <br>
        <br>
        /**
        <br>
        @@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct xe_device
        *xe)
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe-&gt;soc_remapper.set_sysctrl_region(xe,
        SYSCTRL_MAILBOX_INDEX);
        <br>
        }
        <br>
        +
        <br>
        +static enum xe_sysctrl_fw_status
        <br>
        +xe_sysctrl_check_app_status(struct xe_device *xe, enum
        xe_sysctrl_app_id app_id)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_req req = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_app_status_resp resp = {};
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_sysctrl_mailbox_command cmd = {};
        <br>
        +&nbsp;&nbsp;&nbsp; size_t out_len = 0;
        <br>
        +&nbsp;&nbsp;&nbsp; u32 flags;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!xe-&gt;info.has_sysctrl)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
        <br>
      </blockquote>
      <br>
      Reiterating previous review comment - based on the users that you
      had listed earlier who query app status, we will never get to the
      above condition, so it can be safely dropped. Once you do that,
      you can drop the status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP checks
      in the below (_ready) helpers.
      <br>
      <br>
      Instead, if you want to retain this check here, then each of the
      below helpers must be split into _ready() and _supported(). The
      split versions should check for the specific case. It's the
      caller's responsibility to handle the cases as needed.
      <br>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <div class="___sm8es80 fi64zpg fz5stix f1vdfbxk f79feoa f1kwiid1 fxldao9 f22iagw f122n59"></div>
      <div class="___be36l80 fbotcpb fy77jfu f6dzj5z"><i tabindex="0" role="none" data-tabster-dummy="" aria-hidden="true" style="position: fixed; height: 1px; width: 1px; opacity: 0.001; z-index: -1; content-visibility: hidden; top: 0px; left: 0px;"></i>
        <div role="article" tabindex="0" aria-labelledby="copilot-message-_r_1ceb_-title copilot-message-_r_1ceb_" aria-setsize="10" aria-posinset="10" data-tabster="{&quot;groupper&quot;:{&quot;tabbability&quot;:2},&quot;focusable&quot;:{}}" name="[object Object]" class="fai-CopilotMessage r1f6yzd6 ___1fjo9g7 f1g2tzg5 fgct6un fy77jfu f2c7lf3">APP_NOTSUPP
          was added based on Mike's earlier feedback to handle
          non-SysCtrl platforms.
          <p class="MsoNormal"><span lang="EN-US" style="mso-ansi-language:EN-US"><a id="OWAAMF5FF79921C2D4C01A1A3E587CDDED972Z" href="mailto:michael.j.ruhl@intel.com"><span style="font-family:&quot;Aptos&quot;,sans-serif;mso-ascii-theme-font:minor-latin;
mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-no-proof:yes;text-decoration:none;
text-underline:none">@Ruhl, Michael J</span></a></span>, can xe_vsec
            perform platform check and only call _fw_ready() on
            SysCtrl-capable platforms? If so, I'll remove APP_NOTSUPP.
            Otherwise, do you need separate _supported() and _ready()
            helpers?</p>
        </div>
      </div>
    </div>
    <blockquote type="cite" cite="mid:apnH4aA3m1B7UAkM@soc-5CG1426VCC.clients.intel.com"><br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; req.app_id = (u8)app_id;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; xe_sysctrl_create_command(&amp;cmd, XE_SYSCTRL_GROUP_CORE,
        XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;req, sizeof(req), &amp;resp,
        sizeof(resp));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;cmd,
        &amp;out_len);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (out_len != sizeof(resp)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(xe, &quot;sysctrl: unexpected get app status response
        length %zu (expected %zu)\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out_len, sizeof(resp));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; flags = resp.flags;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_VALID))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INVALID;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_BOOTED))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!(flags &amp; XE_SYSCTRL_APP_RESP_INITIALIZED))
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
        <br>
        +}
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is
        fully initialized
        <br>
        + * @xe: xe device instance
        <br>
        + *
        <br>
        + * Returns true if oCode firmware has reached the initialized
        state, indicating
        <br>
        + * it is ready to handle requests. Returns true also on
        platforms without System
        <br>
        + * Controller support, as there is no firmware gate to wait on.
        <br>
        + *
        <br>
        + * Return: true if oCode is initialized or sysctrl is not
        present, false otherwise
        <br>
        + */
        <br>
        +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
        <br>
      </blockquote>
      <br>
      See above comment.
      <br>
      <br>
      <blockquote type="cite">+}
        <br>
        +
        <br>
        +/**
        <br>
        + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is
        fully initialized
        <br>
        + * @xe: xe device instance
        <br>
        + *
        <br>
        + * Returns true if diag firmware has reached the initialized
        state, indicating
        <br>
        + * it is ready to handle requests. Returns true also on
        platforms without System
        <br>
        + * Controller support, as there is no firmware gate to wait on.
        <br>
        + *
        <br>
        + * Return: true if diag firmware is initialized or sysctrl is
        not present, false otherwise
        <br>
        + */
        <br>
        +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; enum xe_sysctrl_fw_status status =
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
        <br>
      </blockquote>
      <br>
      See above comment.
      <br>
      <br>
      Thanks,
      <br>
      Umesh
      <br>
      <blockquote type="cite">+}
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
        b/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        index 090dffb6d55f..b69a3f474236 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
        <br>
        @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
        <br>
        int xe_sysctrl_init(struct xe_device *xe);
        <br>
        void xe_sysctrl_irq_handler(struct xe_device *xe, u32
        master_ctl);
        <br>
        void xe_sysctrl_pm_resume(struct xe_device *xe);
        <br>
        +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
        <br>
        +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
        <br>
        <br>
        #endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        index 66e7cbcc3f91..d756b50cde6b 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
        <br>
        @@ -14,9 +14,11 @@
        <br>
        &nbsp;* enum xe_sysctrl_group - System Controller command groups
        <br>
        &nbsp;*
        <br>
        &nbsp;* @XE_SYSCTRL_GROUP_GFSP: GFSP group
        <br>
        + * @XE_SYSCTRL_GROUP_CORE: Core group
        <br>
        &nbsp;*/
        <br>
        enum xe_sysctrl_group {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_GROUP_GFSP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x01,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_GROUP_CORE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0xFF,
        <br>
        };
        <br>
        <br>
        /**
        <br>
        @@ -42,6 +44,69 @@ enum xe_sysctrl_gfsp_cmd {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;XE_SYSCTRL_CMD_SET_HEALTH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x0C,
        <br>
        };
        <br>
        <br>
        +/**
        <br>
        + * enum xe_sysctrl_core_cmd - Commands supported by Core group
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application
        status by ID
        <br>
        + */
        <br>
        +enum xe_sysctrl_core_cmd {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 0x05,
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_sysctrl_app_status_req - Get application status
        request
        <br>
        + *
        <br>
        + * @app_id: Application ID for which to retrieve status
        <br>
        + */
        <br>
        +struct xe_sysctrl_app_status_req {
        <br>
        +&nbsp;&nbsp;&nbsp; u8 app_id;
        <br>
        +} __packed;
        <br>
        +
        <br>
        +/**
        <br>
        + * struct xe_sysctrl_app_status_resp - Get application status
        response
        <br>
        + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_*
        definitions)
        <br>
        + */
        <br>
        +struct xe_sysctrl_app_status_resp {
        <br>
        +&nbsp;&nbsp;&nbsp; u32 flags;
        <br>
        +} __packed;
        <br>
        +
        <br>
        +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System
        Controller firmware */
        <br>
        +#define XE_SYSCTRL_APP_RESP_VALID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(0)
        <br>
        +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its
        boot sequence */
        <br>
        +#define XE_SYSCTRL_APP_RESP_BOOTED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(1)
        <br>
        +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed
        all post-boot initialization */
        <br>
        +#define XE_SYSCTRL_APP_RESP_INITIALIZED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(2)
        <br>
        +
        <br>
        +/**
        <br>
        + * enum xe_sysctrl_fw_status - System Controller firmware
        application lifecycle states
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized
        by firmware
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known
        but has not yet booted
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
        post-boot init pending
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
        operational
        <br>
        + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not
        available on this device
        <br>
        + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
        Controller firmware failed
        <br>
        + */
        <br>
        +enum xe_sysctrl_fw_status {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INVALID,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_BOOTED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
        <br>
        +};
        <br>
        +
        <br>
        +/**
        <br>
        + * enum xe_sysctrl_app_id - Known System Controller application
        identifiers
        <br>
        + *
        <br>
        + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
        <br>
        + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
        <br>
        + */
        <br>
        +enum xe_sysctrl_app_id {
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_OCODE&nbsp;&nbsp;&nbsp; = 0x0C,
        <br>
        +&nbsp;&nbsp;&nbsp; XE_SYSCTRL_APP_DIAG&nbsp;&nbsp;&nbsp; = 0x0D,
        <br>
        +};
        <br>
        +
        <br>
        /**
        <br>
        &nbsp;* struct xe_sysctrl_mailbox_command - System Controller mailbox
        command
        <br>
        &nbsp;*/
        <br>
        --&nbsp;<br>
        2.43.0
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0n0kq5kDRkE1CbY3muUFAPa0--
