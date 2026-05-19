Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50159CD4F52
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 08:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62F10EB36;
	Tue, 19 May 2026 08:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyepSqRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B33710EB36
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779179163; x=1810715163;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uy7o/YQqmwIEA+MyIHlwXUCj19hONavg34UdZBP6vMo=;
 b=WyepSqRlvXphGgWWKdJBofIgiIPOjfKV+nIf6ZAVKFExsNcurDxB3rQn
 g1wnsSN3qThqhqX6aceqRVCwyZuWASq2wzjF7PCsghkl/ZpOj8YUIOdo4
 yBQARRPO2U5+GkkgIt2WQlPOI7xc+JF40V/J1Vg8QRrXbqmfvlY5y+hAZ
 5fLTn4qdfPV8ESmgffK8K/GhEibo5wCrzXdB16cDBkTthOWo6nklLqqOK
 mjTLjyU3SgBgRetzGcsin0/uZw7GkyCTrUkGNKlDkOibN0mkXYcfrTyyL
 C5X/kJ8wYMoP9yChvoyrM2l/rgv0AhXVKMPyMBsF3Dpj5jqoWjn+M2/z5 w==;
X-CSE-ConnectionGUID: qARfmy/SSX+hvA3nOiaVOA==
X-CSE-MsgGUID: sYHHU4V7QeacmJVN9V6wxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97483491"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97483491"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:26:03 -0700
X-CSE-ConnectionGUID: tXJNzRV7T/+XGszF5jbNcA==
X-CSE-MsgGUID: oqthm4JETJWJVslJHP9YVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="277813602"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:26:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:26:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 01:26:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xv55lS9a44fPidRVIKIuXBCDF8oWS+kOPQLnPHtTHwJd0f8piA0Z/p2xgEDl1laiplIYxGIR22RXwhaenjhU5aEO8LSVar6cRLT9M7rO9YbPCZihtzcGrKeLXJzGsdqDIS5l6mFHFKDrQDsCxXrA17Db8KFA9qpCFBJwAEa+z0P8DYxFMs/t4LMGx5LnSLf4pUvEYei1c+8jnHFj/C6bQVaxJwfqJOLIJEi3CGEMPN5oHcRIQrdhogRgvClx9/+t7hLR76I6POSREqghMauAc3ifTEN/KvbQ95Y3SFNJ/oKaB5lfdxbtJ5jGyPtUa1d+HMqQIYBhovVPXabVVVyxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUokhQ/CNKy8nCdNHY3Rl2LGod1ulRq/24G4KwQJuWg=;
 b=VhDmeG4HYnFPqfU7pDJ8NWwYCxLTfl53jWIgKnScVqsZEDXWom8tjA5i8BCk8vcF9ZxGxPgDOsnbA44X1c0bprcZbkcUtAOjj34gnlF9ZuFtBGZEs8scgv/vO73UZQlbYOWkwwfMDmtikiWyYo76qcCQ06N34rDATOMQ35cxD2Fz5Tn+TSxme7oxsjJ69eLccrjMNpotq/B8mR0+NDnb32APSJKPIQbsca42GqHCnab78ELBbjHZHeQ9cKv9MCSDVLLbE2je2WRM/XVtxGkruoi1tWej73XMmUigKciJH+fmMKRal1M3huCe07CT7ivWCcrOBZt9jHQLmHjh8bv9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6807.namprd11.prod.outlook.com (2603:10b6:806:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 08:25:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 08:25:58 +0000
Message-ID: <1b7c7ec9-81cc-4b36-b303-d04a7b820d24@intel.com>
Date: Tue, 19 May 2026 10:25:54 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IFJl?=
 =?UTF-8?Q?fresh_MEMIRQ_code_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
 <177916102562.83627.5554419159098598314@5ab824fced77>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177916102562.83627.5554419159098598314@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7929d715-6a03-4465-21b8-08deb58040c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|4143699003|11063799005|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: JmBl2y0+dhp9bBZEePTqSuaGNlUogFU281BzI9TIb/X3ih+Qf8HSJyMbVxcx9O3u2TZgf4lTPpoxbC/1G0CmUW+kPPjtSRU2C8SCE5I/4UGYyMrHD8fYcCeZsEwkqmJ4SdeQvUozTvSg5F+GG7xbWTJzJXz8ixm0cm1TwZ8qLtiRzTcW2DNlzxmG4VAZIzi8wexU93NoAG+6sPvauVYYaXvZrLoShSiF7I/JqtzIkJiJ5HK8tpIMTM0PtRTIJF82Ksl4fKWFENorxgHpq0PQjapm5RvBD/cb04mnx87NX4S9FxTIY/QQ6zxvUfKQEb+Z93cjfXicOizuKbt5JvAo7UmwRVQl8KA1F8d6eILkjTz6R1Gx5eO9SugOixEekGpCMebUQXEi7H6nqtvoZZfSl61hUTq61kEr1gIgimMWqQPym7+xck+CWWQuWCjN+WMJBRkCouLQwOPQXUApTWA/xurF06VZens0/gPVrpJGASMQ4k+p4F069wypju/wGx780yc5SD+3HZu6sWjFBegNLqji/etNGmYOf3ec0fAWxMBAW+BycVT9FXqr4L8JDAZnoC9MbVydsuCeiFYkH7Hd9h1ig55cHeLM/kAN1HzSF0kJO15NkRwqgCWezuMhQR3yy64inRmh0U5hD321x6QXCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(4143699003)(11063799005)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNZZEN5ZEp0R2kzMDQvWCtyQW40cGFXMml1eUNGQ0k1M1ZqZWdrSlBpY1dW?=
 =?utf-8?B?Ukc2OWx5V1g1cFhOKytYUjIxaXZNaGRlTWJRUVRUakgzRzZCUTdlQzVLWmdh?=
 =?utf-8?B?amlTU1JlaEhTVWxPYUVENXA0Q0dXTjBzYnlyVTA2VWVkTEJRbWREYVJ0TklY?=
 =?utf-8?B?bjczcHV4QUVTM2IvSnBZWjdmM21yQnFHTFRGbmJwc09ubnBNQjhHL2JGOUdm?=
 =?utf-8?B?b2M1azhyQW5sMnhGQ3gxbUNLNEdYSkNSVGo1WVFCaXgvS2EyRk0raHpUM0N6?=
 =?utf-8?B?M25tQS9pdGZLZ2VlQUNYZXBzUmNYVjZMTVQ0K2lhTWtiZndVWmhTcjFQaVRi?=
 =?utf-8?B?ZVcyek9nbUhBYXdCUnVuWVpsVTdTYVd5TXhyVW1leFdPaDd3ZGsvNGRLSDht?=
 =?utf-8?B?WXNzc09GYVBlNE53M2M1VkRhQ3pOYVFVSmMwUXp6L1N4ZEhXZW5PWjVZd1Vq?=
 =?utf-8?B?WFVIdGRORDNBRmdkVG80OEErWnZOOCtScDV1NEN3L3I0d3hBZkNBL1RRTzNt?=
 =?utf-8?B?eDFLeE1mVzQxamtBdk1NV1d4M2w1SWVUL2svd2xqbG9kUnNDNEFha0tjTU9T?=
 =?utf-8?B?Q01RUVFuK0pnVWFUZ0FQRC9BWGFEODY5R3V5ZEwva0lBWkU5WS9RMlJQQ1d1?=
 =?utf-8?B?M1YvbDNDTEc2dzdRQUxta0s0OEY0SzNhRUtqV0x3Nkg3NkFtRkpyNzBKOWVL?=
 =?utf-8?B?bVgwTFhXUG5TUmhsOWlXeUhxOStCSDBhTlhxM2tENnlrS3dHV0N5cTkwM3l6?=
 =?utf-8?B?K2JOV2RnM0lSSzRWQXIrNFVSWUNEeFUzR2ducCtEUG5ielRjWUtXR0UrNGlW?=
 =?utf-8?B?U0VUeGtTYnNZZGJ1OG5iSUYxaTZZZDR1Z3EwTHFpeE8xdUNlaEFwMFBOYXVy?=
 =?utf-8?B?K2wzQUhVMHBmL2lkdkI1bGlkL3R3QXY3NXF2WHhFWllRR2VBanJpWGJtNDhC?=
 =?utf-8?B?TlhkMCtkWjdHMm1zN2hUSXpjeGs2dWpUeEluU2pBc0hQaWVMM0hRQ3pjR1pN?=
 =?utf-8?B?TXJtaUo2L2FpOGVjNWJ1Qjh1WDdwK2V1L0p5V1lyZlVqMDV6TDZIWG9KQnUx?=
 =?utf-8?B?cmRFNFc4azdnYTFkekErVFV6RVlWaVRmRGpWU2hJR21rSEhrVDYwR0U3VmVk?=
 =?utf-8?B?UEhEM09QM3pSMlR0cTZTWnhMVnNNZnBDa1pIMUt6NjRMd3puSHZKcUJZckts?=
 =?utf-8?B?eExRSlVubWxJbG9vaXZVdGVMTXRMR2creWl1UkhLb29LdXVqblptcUgwSjFa?=
 =?utf-8?B?dzZVcmtFdmlzRmhRTmRkY0hBZzUxSGM1M1cxV3h2a2VsNjJqMEt6R3pPRGg4?=
 =?utf-8?B?ZWgvejlrLzBQMmhadjRXSWZwdmxka3hiS2RRTmdIL2JpcTVqVldpcDJPMFI3?=
 =?utf-8?B?NXZiS1l6NElTUzlLQnNuemEvbzdkT1hvTzRtYWc3T1J2cTFVTnVKUE1wUmw4?=
 =?utf-8?B?bWJjVFRUSkRmeXR0dm5LYVFUTUI0TjJicWZoUVVZcUwwb3VMb0Y3Uk54MUpx?=
 =?utf-8?B?QndQTWUvTWxnRTU1MEhpSkZXcm1CVG9sMTk0TDBWU0tLMllmaXMzL0lYZHFF?=
 =?utf-8?B?cDM0RjFENjhSa0dHRzJTcnNra01iYmxmeitzNk0wUEc1TjFZWDVRMk5mTFRh?=
 =?utf-8?B?a2VsamhOTG5FaU9Vc1RyMGZpK1U2WlAvd0RmQXViRzRJcXpaUjE3TU15V0U4?=
 =?utf-8?B?UnhpT0ZOOHlOMzE4ZWtkdi9UbDhlckRibFJnd1ZLRldQOGwzNW1ncmU1b252?=
 =?utf-8?B?N2xsdm1GdnE4RUt6VEkyMEY3TDFqSk9rNlpmR1RQMkFrQlRSejI2V05yaWg1?=
 =?utf-8?B?Rm1Fei9rNGdKY1diWkEyejhtSFJnWHh6SEcxMFRIWHlpYlJEZG5EVmNlRnd4?=
 =?utf-8?B?SC9xb0wrVFdIZURCOU5QOXZ1Z1o2UDZnS2o4dEdoR2E2a3RFWXM5NEMvNjkr?=
 =?utf-8?B?SERGSjJUZ3hIMEJuOC9ZOVhpbkNVTXJZdGMveWZLSEh2eVNYemxvQTl2alJJ?=
 =?utf-8?B?RHVnK01ESFd0RlhiODRSOEEwWFhxeFFoRWsrRlBzVTl2c3lkaGw3cWo5YVhh?=
 =?utf-8?B?dUpUUFFtdlIzSEs4UFYyWTdrSk11Y1NJek9ldjlLSHdZc25PVWphM05FUHU3?=
 =?utf-8?B?dnYyOTNSUm82Mk5ZbWY3eDZPTjRqV2NzTFFJbjFjSUFJdWFaL0N0ZGFQWEhK?=
 =?utf-8?B?SkNDYU1CcTlnaDE5MjJwWElzNmZtNk4xd25QQitoSGw0WXl2V1dUNEMwRUNG?=
 =?utf-8?B?MzM2VEgzWFVMcUFRZUNPRHZld0RZQ0FHcUw0NTVlK0ZJOWNhNVQ4OXNwSlNs?=
 =?utf-8?B?a0lQcHJnN3RqenI5SGlwa0lmTEhUL2tSTng2d0RibzgvR20yUm1ZdHhmOHhP?=
 =?utf-8?Q?TyRsijUe7vpIZLSk=3D?=
X-Exchange-RoutingPolicyChecked: Y+Kmlm/4qYc6ljP5LDiQ8znFdxKkoFoCB8pi38xWbUegqBF1kZ/mp7C7knCpuN2LjyViRvYXrTt21l9D+BIDvzDAI3bo/N5QqCkgqdQSwj3uTu9o19r42ZA/PZPcVSh1+cO3evDSjPifOF5J9Q8FB4J9jbTTW1FfGTyWSx9BHBagp4qizAF+9JNlJReHEoWaLyR1SvMfHSsw0sF1T0tGGCWZkMISZWUniEf9pWc3QP/k+veW3vmVE+6ztL2Jez9K3D46EL2zk83rCZXUpAT0571cwnzCnDDcSJ777zG9mjXJmZfwtISOpv77KAaREnUENRzyEUThhp87TPHBMryPcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7929d715-6a03-4465-21b8-08deb58040c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:25:58.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaS5PT52NsYRcXeYelp47goMb7bletpV79apw0H3vEh9cDQluIJWjKxvw3kdVj23U9Ns5KTmyzMQi9JVXicRjzrx3ohHcYfr0fMvHtNysV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6807
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



On 5/19/2026 5:23 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Refresh MEMIRQ code (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/166580/ <https://patchwork.freedesktop.org/series/166580/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-5085-b4c011bc8baea7e1b400652839f49a9c6f7739e9_FULL -> xe-pw-166580v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-166580v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-166580v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-166580v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

unrelated

> 
>   * igt@kms_async_flips@test-cursor-atomic:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5085-b4c011bc8baea7e1b400652839f49a9c6f7739e9/shard-lnl-8/igt@kms_async_flips@test-cursor-atomic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166580v2/shard-lnl-2/igt@kms_async_flips@test-cursor-atomic.html> +1 other test dmesg-warn

<3> [333.287296] xe 0000:00:02.0: [drm] *ERROR* CPU pipe B FIFO underrun


