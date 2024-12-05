Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6808E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 21:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8202C10E18E;
	Thu,  5 Dec 2024 21:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdJuQap9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F5B10E18E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733433526; x=1764969526;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=DdJuQap9p8zEe7OvY9/YmklOcz/d9QgX2RxZ0jA6JVoUDcmqS00OtV6m
 hmIVMORyQpymEZA5TQeiOmSJhTt2rF26ZI/u+Q8O/pFT7gvlwmmeGlIOS
 +F8i/RS0v2Gd2prPREmtvCjW5/a/KTuTvrIWX85IQzXo+UwTnoIOEPgL1
 h0NI+RKLbTyDiaUuM7nOkAta9vjZUFI+EfEImJaVN7BBUu+tOWOC27nbu
 TgzNlpBGKPHlXKC/baz2baUSJoFRmoxWQmxrjJlWLGDnzPoRLqloQqJ6H
 fsj7224K4Ca8lJFb64Tiv6uNe58VvWVlCQqDtKD+c9gumRJSqEXKy9M5U w==;
X-CSE-ConnectionGUID: VaqLWraESZaie8yD+beiiQ==
X-CSE-MsgGUID: hTBpTPH/RQ+4yhbURvsXRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44245111"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="44245111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 13:18:37 -0800
X-CSE-ConnectionGUID: 0JAv/oJYTcqa+ozRkmn7wQ==
X-CSE-MsgGUID: b7TcxHrnSOCczP0TkFwwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="99288132"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 13:18:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 13:18:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 13:18:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 13:18:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uatuTzyEGzTPSjiSkS66mJs8kr2OFwCQmg6jCmQjrIhMj+P8i3Ly9Mt8w6n/JCt+6GfywpWKY2Sz6mQzwFlApKdSoaCAojn+z5gk9qIE4ymKbj24CpRj90iA3As4ubftaTMbUl68K7PejydGijRuqPSNou4LT6IJewd6Ba4x7s7kX2G+uo/LXQp3pGtPLkJUT5KvIWqss6EhaSX+RSU1yypddHje7xGIpZ+uOUWbGrJIjZeB4YAKJNSwlTVP4eDfWHoPv5DZK2r5Ad2xyrkFXvt0m4xCVPZtcfSfIQTW7rE1aLR3t128C0MrNOtMfUv+MnqnW+I8PVQJYJMY3u67+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=uW+JL7pp3QbE1rbSIy2kHac0lpP8wzMNo6A0qLPMtlmjh6LWGVAfLJEIIMxTXA6xbfLu+p6rnfs1E39lRyo85k3rmHAw1qXIhFea+WME/KZcj7rQPNRxi19ICvJ+4MWXRziw0kxX/gZqeQOYEZArpuwKqgMIqN0ZtPuF37jQPZz1NEmFDUvC2glVrD2BuGM3myPU7/hUoGQvs+ZdV+fp6SHft9bNfkLk0tG9Lmh1w6f1nkLm7TQjmRDYefd+N4nXsC9TH5LQkDuVocbyC2JnRqYcV6dLe9pJGf9MSL5CTmlMFLvIbzPnFKKXph19kYffirYrwXWaIaa7n9/Hx3dkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 21:18:32 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 21:18:32 +0000
Message-ID: <c654a16e-83d2-403b-ac1c-f6c5838441e6@intel.com>
Date: Thu, 5 Dec 2024 13:18:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix for dead CT dump not re-arming
To: <intel-xe@lists.freedesktop.org>
References: <20241203005949.3947920-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20241203005949.3947920-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a71d44-9f2c-4bf9-91a7-08dd15725f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRNUUFabUIwMW81VlVTU1BhWE5Ec3lWZDVkQXZ6b0djUGJLVnRmVXFVcCtm?=
 =?utf-8?B?ZXZEL1ZaeFBvb1hqL2MrVDN4Ni9zQ1pNbjZjcERKc3RqZXo1STlyVnZqRVJN?=
 =?utf-8?B?b0ZuYTNZOWNzd1VtZ1lEc1RGdEFvSWo2cUtoTmw0VXpqdTJXcVF4dVcwSTJw?=
 =?utf-8?B?OGNmNUM4STR3a1g0dCs0NzRRKys0Nm5PVkp0aFFPcEowd1NrcjlXLzRaT1dM?=
 =?utf-8?B?bHB2WjBHcG9rMzlsdFhzLzhuTG1CblQrai9wUVdNZW5oSzVDd3pTV3FKWXk0?=
 =?utf-8?B?bDRlbDVPQlJpaGZCR0VsekxXem5ya3l5NUVmaHhLUHhseUFsWjVYZmk0UzVI?=
 =?utf-8?B?NExTSnd2eVVLa2hZdi9RVjdmakd0ZngzcUVMUDZwN3Rucnc5aU5QY2VYa05o?=
 =?utf-8?B?d0hidVhsWnIxRzNVZ3FKd0xZVGkvL0dUcjJraHlpaEV5YjF0UXFDRGlFZ0Fo?=
 =?utf-8?B?Y21CZXZqUEhtS1ZkN1JGeG95UGNDVUtOcTluVmljcWdQZ3ZITVRycU5Oam1o?=
 =?utf-8?B?WXVEbml5NEYwSkt3V29mMzkxUTlZb0Z5M0R5cGxrOEFYbVhhRzZScWlrWVVP?=
 =?utf-8?B?L2pJTkZzQkQxWXJ4bFZqQnJMRzFXcDJ6ZmdRUk1GZ3RKNXhOVlJvbVR2bXZk?=
 =?utf-8?B?RXNad0UxVmNjUlpna3ZOd2lMMVJFd01TZWg0dlN4Mkc4S0ZGM2pMWVQyWU44?=
 =?utf-8?B?S1hXM2VxZzMzbEwwL3ZNMk5iR0NxS0ZabkcrSzdVL1Z0cFBYYnhSZHB5K0w4?=
 =?utf-8?B?S0ZXMzk5WFdPUDR3d3Q4bXIySEFaZmR5K2JmQlRUdHBVVGY4WU44L0k1MHVC?=
 =?utf-8?B?bVhrRFBsMk5Galp4QW9WRDNHY2Vjaml1Q050eGZuazVXYVZKdldnLzEzUFNW?=
 =?utf-8?B?MXNYZGYzVGt5WGsrZk5DWUtxTWR4WmR2ck5qRENSczBLWEJZOS95bFM4Z3Av?=
 =?utf-8?B?TndNUDFWUVMvYVZIMEFpRW1rc1NwUVMwV1hzWmJjSjIwNU54NUR1SVlDMk1z?=
 =?utf-8?B?MHRWRCtKNmhhREYvMG45QnV2SnU3VkdITXM4cndVZkJaYjR5emdIbmVKVXps?=
 =?utf-8?B?YXl3V1IrcjVuOXowVmp0aWh2SUtmdEZmWnZPLzFXRjIvY2tUbStCOXhYRXVR?=
 =?utf-8?B?K2dHU0QwY2dZNTNEL0xPeDNRVHIzRXFJak52bzJEcGVvc29aMlgzQkU4Q2VO?=
 =?utf-8?B?TlgwY1hpN0dOeHZEN2wyMVIzNk5QaFdWcytDVkd2U25kYW9MeEZmMVRWVlhT?=
 =?utf-8?B?LytDQ0dWMDExTzgzVVR3UStiMHE4eFZGSnd4VGFSWWNsZGJtRlRIOEltNk93?=
 =?utf-8?B?V3pKNVFrdGVPRmk0WXlEZ0FPWkNHeS90bkZZNktaN1ZiM2tEbHVRTm9HRkcz?=
 =?utf-8?B?Nm5lRU1tbm9KbHZHSVc3anR3L054eEgvVnZvNTZmYm53alhFTHhBb3U4Wmla?=
 =?utf-8?B?U1dIUHlxU1NicDNROGt5eXVHYVZSanNSQnk4TFg1T2xGNXpMcG43T3Z1ZEtD?=
 =?utf-8?B?UmRKdzNpUjdIRlhyR0o0aXdFL0JhdUx5MHhHcmN0RkUwaVBiODlrUHlPRU5r?=
 =?utf-8?B?L2V6U3FZUnVKTjZDNzh0YWdoZHptTFN3bm9mc2ZYVm9NNXFUSXRWZ2NCUmF2?=
 =?utf-8?B?ZWJlb0cvVDV4ZFB6YWMwbUVMTnN2MnkxZnM5YjEvR1kzOWJScndiUEw2K3l0?=
 =?utf-8?B?TUhaYTQwb2RJT1VnejJ1Z1o2TE1JVjQ3L1pEUHgwNWQ2NnhBYUY1d3A2UVJi?=
 =?utf-8?B?S3JadFRXMU9YdS84ZnlUM0F0dFFPSmg3K3J6WXZtOGZxdUFYbmp1cmg2WG9l?=
 =?utf-8?B?c2tUbjdvMUJOOTdHWldWQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtSd3RSSkNhU3RXRktJM2pvVGttTlhpTXNxSTNuMFJ5c2ZwbW5DamJwcHFM?=
 =?utf-8?B?MUs2WUY1S1ozS2FZaEpIdE8wNklnRlVveU9VRE5MenB5ZGpkNHZ4VHBkZ2M3?=
 =?utf-8?B?MU9zV0JTMURqWXI4emsvWGRoRlExbWVrWnR4Yk51d2liZ0VVS2h4RjNUeFBF?=
 =?utf-8?B?NDZFVkRicWtuOSt6Y2psaVZQdmtKMVVOZW9TZmRmUnFCcUw0a2p6M1NnRUhn?=
 =?utf-8?B?SmNMMXQ2SmRHM3Y0dWtUb1pGVGY3K2xVMlViNlk0eEovbzgveFpMdTdxL2pr?=
 =?utf-8?B?cGpjc3F5SkVIKzIwNDFLOURZYVJXV0cwNi94WEpzT28rNUxKcmhNeVQvQlpC?=
 =?utf-8?B?S3Q1NWg4MkxnZjNFTS9zZS8waUcvRmpkK1k5RStobjJwZkNlOXB0cUNpK0FB?=
 =?utf-8?B?MkdxYk1nWXZRQ0lodFJGMEd1N2pHek5ockZOY05vbmpOZ0tYM04xc0diNzF3?=
 =?utf-8?B?cFp3dWZBSmZUOVpkQTc4aVRDQy9jbkRXeWp5Q3JqU2dVd1VFOWwrZXpTTzhv?=
 =?utf-8?B?NXlsNGZ4TnFtRHN5WHdxSW1XMVgwRUFKb01ra292bGhZSUdkWVczdm9CWGNG?=
 =?utf-8?B?RVZjdXVBMjIwSkUrdUhma3liWjRzK1d2K0d1dHRKQys0MW0wZndYSnpqV01t?=
 =?utf-8?B?bmtzOHJuTndmR250NFdWTVZHZDNrellUQlZNQ1RGaUYxNGdYMUlDRnpKaVVl?=
 =?utf-8?B?ajRCV0xTbUVUNDNXbjZYb1F5NmM0WnRMYXplQ1FCOUNmVEtwL05JSG5HZzFz?=
 =?utf-8?B?V2kvRkkrSmVwNXNwSmhITHRsT0pET1VHeUQ2aXpScmk1aFk5TnZuOGVYNlRv?=
 =?utf-8?B?MjBVNlRGYzlKUGNMbWd6c0JyRzdDZVU0VkdPZjlxNHNIb3lPVWMrWXBuYXRW?=
 =?utf-8?B?M21rVHFLYWYwN2lXMEUxNGErM1lGbE1CQk1uODg1TUsvcmRhRHEySnQ4MDBs?=
 =?utf-8?B?WnpDeVpkOGtFaFZyTG9VVTlCRDlnU25JdU50dG9LaEhqNVliYXlBNm5NVFI4?=
 =?utf-8?B?Y0kwUUhwaW8rZGdpTGZCWXNHU2R0YVVtWlpwSjhtOHJQeVRPZ0tPbWxNN3k2?=
 =?utf-8?B?eDN1S1hiQ1RLZ2EzWTJvVVQ3ZFk1cHBGNDRCaHV0UDhvMFZ2OTByK0hScXZs?=
 =?utf-8?B?Ti81d0tIdFQ2K0M2ekV3RE1IaThlQnRxMXZkZGU2MUg5eC8zMFRlYWdXcjNE?=
 =?utf-8?B?dnEwYVdZWWtrMGRVT0RkdGFyL25Qa3FnR3lMUEVxd01IVFo5WTl6aUlrL3V5?=
 =?utf-8?B?MUh6bXF4Qk00ejFJWlMvY05IL0lNNTQxOGFtQVZhQlhVNzNQV0FIVmxkMW52?=
 =?utf-8?B?S05yKzB6bWEzYkJpNC9YcEVXeGNUaFhjNDdlbm03L2tXTHZtOXoxYytlMlRk?=
 =?utf-8?B?NE56RzBzVnNBTWFyb1l4Q1dsbXc1bmlhMEtadlFINENaNlZRbE1zMFpBRG53?=
 =?utf-8?B?UlYxWjdSRkp3S0gxRFNOWXlieWl2dUM4ckRLYnNrV1ppc0N5ZmZCbUh0SUYy?=
 =?utf-8?B?WnhJdTlCeWk2bjFLcldZb25mS2NSdG5lSUNRcU8vWVpvTlpsYWo2Y3pRbDBa?=
 =?utf-8?B?UzdnV1VIWW0yZ2ErT0JlcHJiY1RSb2NoeVVGNVhkZTBsR0lWU2xLdFBKdXc1?=
 =?utf-8?B?N2UyaGVoQTZ3U2trQjZETEw3elEwQkRhRjlkcGtLemZVUFFWQ0RTalZQbFR4?=
 =?utf-8?B?d29XTE5FL2hhQjFXdHZNcSt1UWtLVjJrd3BFYW9tZ0lWcWc5b1RGdnRRL05O?=
 =?utf-8?B?ZXE1VHZ2ZzhBamhRSGFFN3p4d01INlRTR1hOckdQWEVoQ3lRRE44MUlHZGF2?=
 =?utf-8?B?NU9nM3NFTXg3cTJtZzVXNXo4a2gzVzgvY2hzbUtIWitidGhDQWVoSnJyTDJT?=
 =?utf-8?B?OEJFREFLbDhUQk5OdW4wbmorNGd1ZG41Y0hkL1lpcndEeWNTZnMrSnJDaWp1?=
 =?utf-8?B?VUR0VEZjbVVYQWp0UWVRNXVtMU9Ca052RG9LUXphMm5lQkF6NzQ5dWFMYVpr?=
 =?utf-8?B?MndFWkdGeHpPcU9rVGtHSTRhM2t5YWJmdnJwekpjRDlDZ1lTRHpUVXhvK2E0?=
 =?utf-8?B?dDdsOEFpV0hndzJlWkwxQ1VNejlnZnlIbFRMbWhqNjdqajBmb2srYzhQb1hq?=
 =?utf-8?B?YnVZQjAvR3p3ZDVVZlMvMS9ra0JCaVZRWmxhYW0vcUNYbVhMczAvaGNrVTZN?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a71d44-9f2c-4bf9-91a7-08dd15725f33
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:18:32.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ng6hfV+iwYQF7OjryrVUs2IrDUZbNdETghTQNNRtKJja6UeDjsa/djL8Po26UHd4CETTMXGPt/g4y407lJ6zOTPzMCuA2TGOtBCd/368xFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
