Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11021C5321E
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 00:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D213410E184;
	Sat, 24 Aug 2024 00:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iegOvOnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A1710E184
 for <intel-xe@lists.freedesktop.org>; Sat, 24 Aug 2024 00:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724459547; x=1755995547;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TScLcIcujmkHITK2+td3Ddx/YHIVum53pQsvTRIZMIg=;
 b=iegOvOnxkIPEi0hTZLay5yq97d/yu3fJM/xu3SqhMUn6i4nz+98QDVpJ
 PHU1g7es5TnVk5OZLkTls2gbw7K+0S+sYTRqLFmAkcZBjr0U3V4MF80Yn
 S03+TjkP083sMRUbta4KjG+LSa5y0+ae5hElBIB1BCMb632Y+vUqwxImk
 /sjNCKGMpNcuV3KnXr3M28Qk1dmHD62Wk1O2R8jIIodGJJF72cGL6noqu
 ZknThxYo5u43WgjbX1sTVbl7zbgo3GMUSm9j3LfjZ5XMzJrEhCNUCdp11
 +sNAxMUPNlHPshUS6B/SIfUkGLX68F3LgTDyV4VGF2i0tk72PEJp9zPCJ Q==;
X-CSE-ConnectionGUID: 4J1QGk84QTqq3+6CCP25gA==
X-CSE-MsgGUID: PkHhZ5F6QBubN9iDG5R+ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26721508"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="26721508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 17:32:21 -0700
X-CSE-ConnectionGUID: PDhwdiDxSKyNVMPl+Dh0oQ==
X-CSE-MsgGUID: B9fhVZM8THakDu4q6NM3yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="62126930"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 17:32:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 17:32:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 17:32:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 17:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svPp0J+Cnl5XvfeEw6k1Uv4SaOjU/HwQlZNiWeW0UtRWb3CmeV0ONSXDTqzY3wPn/9LuvTQcta4ClHvMLgs/srsppmnxBoiPvAtzsHp8DwS0NYe/Sj5GaGtLIieW+HV+x0JDsY/gV6fRFKYrsmuVi/v/3rBY58sH4z1oMhbffq8VsE6tPvtks6YXCsWvmu5zXLwQTv4YY9soZ/4pjiT4xaH9wmJ2mGOfyydgz8pWaV0vsWHF43WAZUlF5xslorZn0TBIdoWMmsO/DFM8rKeFEBIrGpv8FYd69uAptm3xZmruWJ0Knnp/7lSLsbgYdS5m4EarmqHC2U+jO3tJd9b/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzpVSaPFCbRGL7R/vyBIlJo10XrvoXoJMBJAWb5+/iM=;
 b=AgU2CkgDhVF+KF++A0L81PcR5cimpSAGWqrRMLmudMoN1tp8ACGqWz8ox6pfdI4W+GMCxJmA6c6MSNuMGELcaeKw9veCd67Gkc5RVxjoRidaH6nwvWqiuzTwmZr9W1UE93S1NX3TEkpMlPaybN1NHDc7J8x6CJArpxcbMh3kEjF9F0KhIEij28Lf+phrgizchzpdSZ2CR3bW32O1SQ0z65hQigTenOgCygW6MY8SssBtoyl68+7KxTd5mivne0moSLbQut8lGWQ9SiBkxRgQImRzHezpJ1Dt0LfendWT77X1Daws4mTJjaQklWeX03RiNPWMLcuaKChaNlI9dQkcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Sat, 24 Aug
 2024 00:32:18 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.7875.023; Sat, 24 Aug 2024
 00:32:18 +0000
Message-ID: <edd562c1-4791-4b02-8ebc-a7d3a7b38973@intel.com>
Date: Fri, 23 Aug 2024 17:32:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/gsc: Fix FW status if the firmware is already
 loaded
To: <intel-xe@lists.freedesktop.org>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
 <20240813231148.1663731-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240813231148.1663731-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4aa58e-ec47-439f-4386-08dcc3d435a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2d2eEttRnZNZU5neS9HY0M5SzVEcFhaVzVsRDVSVDBTMy95dmo0ckszNDE1?=
 =?utf-8?B?a1JSSTY1R2gzcmN6RTVwclZWQXhSM2FNSElPQ0hwMGgzakRzL3VHVDd0SXJy?=
 =?utf-8?B?ckpFNXRWNXhFeVhTRmFLYlJ5Q0d0NkkrdUkzOThySi9naXBTQW1GZHRrM0VE?=
 =?utf-8?B?a1dKT0ZNZC9uTEhZS0g0Vmx6cDVDZnYyNURjL0hCdmJtYXBhZGxiNkpiM2lm?=
 =?utf-8?B?OWt4djJwVENFdk1mVCtaYlAwOE0rd0Vka2UxaEJPandQUWMyandlYVNVNmdG?=
 =?utf-8?B?dmNTNDJzU2U2NzlnSEpCbUlBTXVTNnljQlUvZ2RGc2xnYVY0WkdXeHVHVnFC?=
 =?utf-8?B?QTJiQ1hkS0RzaDdlSS9aQXZhRW40NDZyZVFyWER5MWpTUDZLOXN6Qng0R08w?=
 =?utf-8?B?RU1LclI4WXF0YnYzQjFndjhmRDJ2ZTN3MFZmMzNwTXZId05tSUFhODZhUjd3?=
 =?utf-8?B?VFRxaC9QNVBhaFdsM0M2YW5rWUpTZ0h2UjdrRHpGVjRzdTJocHJpVGxQa2hN?=
 =?utf-8?B?YkYrWTRpWXU2NTNuV0plUDkrY3pNa3ZwMmVObzdBdUxHazVzRUx6VnY3QzV5?=
 =?utf-8?B?SklVS1NzakJsY2lrZDJvdnZsUTY4TFEvbXhPa0FUK1J6bE4xVUlGb211NFNC?=
 =?utf-8?B?R1BiWnVwN1R2cTNYY1FYZUszQUQ4VUNBTVUwN3pNSWZNVmJRTWJvN0puTjBN?=
 =?utf-8?B?Q29BZzIrK1h6a0RRdG1jRWxBNEwxLzdYUndnN0RFcTh4bjgxWkZ6UjJDQ1Qz?=
 =?utf-8?B?M29WdzBoQlJlbmxOUkxDYlUyRDlUaXFFYVYzMWlKZE52N0NUSlM5QTc4K24y?=
 =?utf-8?B?MHhTVTg2ek9va082SGUzQWhNYkdiWnQzRUt3eW5QdHFqVUk0MnZaTXlsVWJ1?=
 =?utf-8?B?d0Rvd3FmVkpHMmlSd3Rjc1M0TE9hTXVrd2NQRWVrYWFHaHJOeVZuWit4QVBI?=
 =?utf-8?B?WGpEZ0pvd3ovS3hGcDBGYzRRZFJJZzRlWFhCY1NtVTRYOWxFOGlDY25UVWFN?=
 =?utf-8?B?d0RIeXVzYjZkd1U2RHRMVFNSWERnOGtYdm1oL2dlZkdKUDdmeTdkVm1jRWFv?=
 =?utf-8?B?dEx6cVNNQ2pwaXZCNEkrUjRjSE5ialBrS1FET0RTaXBIVU0yM2VWR0FVSVZl?=
 =?utf-8?B?dDJOTTlFN2c2RzBqL3JPQ3BKRnpTQzMwdHpoMHFGWHRwVGRDb0N4bjVZcmdu?=
 =?utf-8?B?ZnlFSmVCd3JwS283YkdKV2d4d1FlUVllNVRqSGgwbDJKN3UyZVVZeVJUQnAr?=
 =?utf-8?B?aE56U3dWWUR0M3lkMkpIS0ora2R3R1dNNWl0WWVFVnl4b014bEF6SzBLL21j?=
 =?utf-8?B?NkNFUjJjM3FKb2dLY0RobXBCTG9PbWEwR2hsWGU2UW82ZkszZXBvRlJ2OVIz?=
 =?utf-8?B?QjRQdm1LU2lLQ2ZUaVRLeGZlcVN2aVVtQWd3VU0vQ0M2YkxtTHFnNGExRjNX?=
 =?utf-8?B?SHkvT0xSQ2NTaTFWSXhBWTNZcGIzUDAxaG9ydWpGTW5pblBiSmpjaHp0di9Z?=
 =?utf-8?B?TVkrenFwOFo3OWlEcEJORDdzL2VZUHBLaWsvU0xCZUl4TmZQNTd5dWMzMFYz?=
 =?utf-8?B?K1BXRHQrUnhNMjZTakd3di85THFMVlNCTjNVQjZidzBVODRJY2FqNHBNLzhm?=
 =?utf-8?B?L3F0cXZjMUorcUZyQTZVUkVJZUNRUzVyL0JEUmNpeHpHZWI4RXhtclltaFpX?=
 =?utf-8?B?a0xOWWY4QnFkUjllRkIxem9nTTUwSEF0d1JSd3Bzd0Vaa0Yzc0c5dnZlTlkr?=
 =?utf-8?B?bDM1cUl6U3lwMVlGaUd3L3hOVzF5ajZ5WXZlYjNFamQ1cWVFTzhoRWJTRmox?=
 =?utf-8?B?RFpVcXF6QjVFc2M2R2k4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWcwMzhxRXYvWW9oTzl5VEc4RTF3WGZWcVBmK0FZd1g1UTBraXcwdEllcm12?=
 =?utf-8?B?bkdkbUxreTJ2bGFaUHNmN1hRNUg4UUN2aHlscTdnR2NDVDZyaHo0TGJ2Vzdl?=
 =?utf-8?B?NVo2eGllT24zSFh6bWhyUlZ2dWVGQ0VsU1Vsamk3YlVQMjdIeTRmNSt0K3Y5?=
 =?utf-8?B?NWFSOCtSalcxRkhnb3NSYkVpQ3lzUzlDS1NMbm4xYkZ4SEJlY3NtWVozYUdr?=
 =?utf-8?B?bzBsWUl1ZVR6U0tSVjVyTG5IcUp2WGM1VXJiTDV4c21adGIzTTJNUVd5OWta?=
 =?utf-8?B?Mk9LUnRVMTk1M1MrV0lQdG9oZnpmLzNWa2pPcmVRbWU0eEs5VUV1VVRTRUQx?=
 =?utf-8?B?S0lPcXpzcTFFUXBUWllUTjk5ei9SbnNyOUZGS3RWcHpOckpabEtrc0RCK082?=
 =?utf-8?B?R01xdUlabEJObUgzMWxlbUoxL3c2eVZ6TFJ1UloveEVieWVHS0tyRHpjMDhQ?=
 =?utf-8?B?eHZHaENEc09TTkt5VmtBZU5HZWVVQTVJMUNyeCtDYktlOG9RSytRcUVyb1I0?=
 =?utf-8?B?WURxdldFODFUckVKd1Q2UVZuWnhPYWQ1RUo4NFVaWGRtV2lWUHE0allnZWhU?=
 =?utf-8?B?TU5PdVA4Qi96NlI3dWsycW9XV2Vka0doRTNaTXFtVXpTRGdaVUI3UHN2d0RE?=
 =?utf-8?B?NzYyUm0wMTY2MnhRMnBMcllWZkFzblVFbmVTcUVNQStqYlhocGFnaTJMUFJO?=
 =?utf-8?B?MnZtNmJyNXlkRTYxTnJJVGNYY1RSMmI1cmtta01Ib3ZFL1BxdHVaazFxaWRG?=
 =?utf-8?B?clc1OUhSN3Z3dVloWFdBMFhzVVROZVEvdkdIS1NScTE5RUQxR0xkSFNSZTNO?=
 =?utf-8?B?RXNkQzVtNlFxa0o5WUtVSkxMKzZseVYweWp5UW1zUktIWWlFb2NJMXFsdVdL?=
 =?utf-8?B?UWpoWHJFMWNycXFiU2R3R25yYlczOE42WXovR0FGaUl5L2hXblJzL1dac3B1?=
 =?utf-8?B?c3J3S2dhVlgrNTNwZGtEdkhUTGN3VHk1bGQ4ZTFraGczT0dBVUFlSklvdEY2?=
 =?utf-8?B?VU5ZbW5FeUNMdVdoSTJubmZvZUxRWEw2eGUyQkdTRlhmYkJUN1VFYWtFZ2FW?=
 =?utf-8?B?TmlEQ3VTRGJMbXkraTZlU0VXbklSWFRyS0UyYzBpYVRtM0hjK0k4M2JZcmJB?=
 =?utf-8?B?eXRVL0J5N3hEMFJNQzUrRExLZ2cwUzNPN3EyK2lrZGlNS2JoYUhrWk9xU2sr?=
 =?utf-8?B?MmpGRmxza2JsZHd2OEJGR1UvVlhZb2ZlbE5sZnlFT1ZPUk4yaE9YcDJNNENP?=
 =?utf-8?B?NDFrcHpGYXRQRm5YWmtkdTdSVFczbkJTTHZabXNPdGxHR3o0c1JaZGZGT3pN?=
 =?utf-8?B?OWxDL01XdU55aHhtUkFZejNwT09RZmJOQkJ3SEhVQzBnK2dJd0t0K2pDVFow?=
 =?utf-8?B?aHUrWUpmYnA0OXpXWkZRUHhtdEdoRkZvcUw2SjhBTUJFaE44bFpEUnQ5d3NW?=
 =?utf-8?B?U1MxUzhBQ3lISzBTWFVvNmFhUzE2UWt1VktLMmZPc3hQZFZ0SWtSUy9QUGFF?=
 =?utf-8?B?dGkzVTdYbnZrZGNSVTdTTUtjVWxKekM5anJaQS9NZE50OTlTVVVzcnlnWnhT?=
 =?utf-8?B?RUs2VXlCelZhSjZkZTJCcUNCeHZPTWdMVW5aLzRQYm1aOUowVUczdjJXbWFE?=
 =?utf-8?B?T1dRZWMyRkJDQnM1em9IZ1FZN0VsMCs5Mk5tc2VGaXhBNXJIOTdKRGRnNyt2?=
 =?utf-8?B?N040RExwYXloM2JWRExoMmNqQWxvY3RtZGlFNjd0TFJkVzhtbmJqMjlUZG13?=
 =?utf-8?B?aDlNWDdZZGxaeWhzTnRnQTVha3dUOTBRZnhJNmxyVnlUT1NodUxZcVZYbHJx?=
 =?utf-8?B?MmhWRjluZlYrYWxIdTA0UEh0NnNiMmhrcmNUUmVGTWd4YjVUcDI2NGMzSUFD?=
 =?utf-8?B?Q2VFVmx0emh2UUJHMWlCUTNQUUR4cjZBVnlpSWxvSkxnZmp2VFlPRmtYcVAv?=
 =?utf-8?B?c3RjdGxiRnhFeDdaT0dEQnpoYTdUYU9KZEt2Vld0MzNoQlNsdE5IRi9NL3FI?=
 =?utf-8?B?czAyT3ZRQ29rcVpuRExIVEZ3YWgrak1FeWtOa3I3VENYcFdGQkszWi9KNk9o?=
 =?utf-8?B?T1NFYk1icjA0TVkxa0pYc21rcGVicmt2WnJLeEh4Sjc0ZjdCUWlKeHluVGVh?=
 =?utf-8?B?R2lhUW1qOW1NSWhSSWcwdHh0cGM3ekloR1JoWFpTbXBYOTExK1JVNUNQSDhK?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4aa58e-ec47-439f-4386-08dcc3d435a2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 00:32:18.1260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfkYl0tGImFQfkTIpH5zrQRGnoFfaMfoXroBBtotgR+mB25+8o85pmgdfGjztnNmSsYCGX7kxQwzYU7+71ZLLCZN61jzPbqdgbkxbZjJkmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
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

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 8/13/2024 4:11 PM, Daniele Ceraolo Spurio wrote:
> We set the FW status to "TRANSFERRED" after the load completes and to
> "RUNNING"once we're done with proxy init, so do the same if we're trying
> to re-load the FW and it is already loaded.
> 
> Note that there is no difference in driver behavior between the 2
> states, but it's useful to be accurate when we dump the status for
> debug.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gsc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 66963e26c574..85a6a65063c4 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -537,7 +537,10 @@ void xe_gsc_load_start(struct xe_gsc *gsc)
>  
>  	/* GSC FW survives GT reset and D3Hot */
>  	if (gsc_fw_is_loaded(gt)) {
> -		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
> +		if (xe_gsc_proxy_init_done(gsc))
> +			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
> +		else
> +			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>  		return;
>  	}
>  

