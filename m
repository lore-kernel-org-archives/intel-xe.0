Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E667D2A53D
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 18:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD310E181;
	Wed, 16 Oct 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5Gj2y+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BE010E181
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729104726; x=1760640726;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hxq21lWXqKy8YvmxHosyBr9fchtjwUxpcfbWyg002Zk=;
 b=f5Gj2y+cQfp1ua3Ni7NvVdd+C9gnprWK4y8AXBW04PsyNwPi7YVHfIHf
 Hl4VNUOG9ZrR0Qx6FgrOuAIkgkUbLZjFWWsnFXG6RYC7iJSHh8RFhlj29
 S80kTBb0Tdz3BKZQsGq2iiwe+z60j5kyF9ncKE6UeQ5zBIyPZ09Akm8e0
 jpmjaozwypSp4YiSU4rX8wNYjZFkV0svviihIP7qAznktFX+BkX6TPVXQ
 /rFEZ+YZ+5eBeayq0eLE4g/nvhTBKmZniT9KkBKp1qsMQ6yHTCXxxbGm/
 pRy0pqWuzLgPkU7LnHng6VHY3IrbkGPLOIZEnLV+2QUNAVN78rJuktK3G g==;
X-CSE-ConnectionGUID: r0zCMVt5TpCCdgz15eda+A==
X-CSE-MsgGUID: atdRRAzMRlS1JP/+f2oAyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46065376"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="46065376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:52:06 -0700
X-CSE-ConnectionGUID: 89WPwJ0oQj6pvgkvRtEXIw==
X-CSE-MsgGUID: OUHO/WisTimwePV8xog5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="77930590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 11:52:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 11:52:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 11:52:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 11:52:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 11:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW717xDqrBuvv48mDiBZ8C0PtQBjJUtlQAEPdt4OC4MurSWkYeZnMHI8jjEgxFGM5l+JkyEVKDW45eGr5AeZ7jNx8i/X0Lh/QPucVSt696t0J3ycRXU52Q/M5Ap/kAK3SAygmG3cY102zvU5baq1sU38e4yxIbSsm9zujzeMRlRwgeOET6GTMxa60SUjfgAFk5ryAOrqe/1nYkJ2Xoen0Wld1qkrhvdVkRM5p3Bw7pbrBfztXARrMQw4Dxf5r63dMVHwFQH4cl/ZTN1unrOj4sMYWctqV0yIcnkymXjJuq9xCCgsow2ZVGNqq8s5HhcAU9peT5PAi9XQXBnaiVIUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVh63NkZvOrabOohamyAyVQ0QMowVbm6RmL2vb2dZsE=;
 b=IogV5V2/3ZMPBB0LrG6mVEhPlXkL0GB3AsFoWksJUMCaUKFBEpLyvm5xqjRn+QsDjIbEe4vzKi9YQwLpzJSC39wnHbfGqjZN/MqkybRPfhhTfEkXxLTyl6VsJ0Vlz3wQ29Ep0W2WxVcJIshLIRCgSgSHRwaKo7V9Ypi5YE1fD6NjI+t1vekMaR3KVV0WcHC+tMZKWrDN+OsLgWttTd/4tx4SN0V7S6Nk+/SBJ2GQlP1IysAG0gnGKwNsj/eCRxGYSiAXWnnJQ6HB0jV1lIEu8slEsLHQJtQLDIdM1Id6eebclCkm5xfY+PfukTd/topW1QZjvRCiKVwiOElGE0JjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 18:52:01 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Wed, 16 Oct 2024
 18:52:01 +0000
Message-ID: <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
Date: Wed, 16 Oct 2024 11:51:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
 <20241016115256.349791-3-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241016115256.349791-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 126cfae6-ae35-48cc-a217-08dcee139e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnM1MHp5S2tYTmhzTVZEN3AzRTJhcE1VbUM3UWwydk91YlBMcEU0VHp4QXdO?=
 =?utf-8?B?RmpmeTRWNkRvNEJBTWcxWU9LYlI1U05FZ3dDVmVGU3p1OXR6K0JIb0ErNzZN?=
 =?utf-8?B?OC9IajJTUUM5cVFNaVRiLzRrdnduWlBoUTNZaFpsbjlIQzZHc3UwcU43dWpB?=
 =?utf-8?B?ZGs0am5FVGFXdlZzVDZMNWdaOWRVNXJKUjQ4RGZJMTRzdDBmSXd6RWk2VlhS?=
 =?utf-8?B?TW1IWnNmdWRuT3hPcm42MTZOWndYQS84VmphSXRuZVV1QVVKUEsyakZ6WTRE?=
 =?utf-8?B?YkJvcW1YQzFRQ2RNN0V2cThjWm1iOUNrTUx1b3IreHI4c2VhbDUxMHdIVEVO?=
 =?utf-8?B?a0pIbGl5WGZPN1lnMWxDT0ZqTUtXdS9DdktEV3JCS09vVnFVaEhEWDNqd2NV?=
 =?utf-8?B?a09TNllzaWpzcjMyODA3WXlDb3JRMmdZd1Q3bC9DdTR6YnFoQWk1YUpCdFdK?=
 =?utf-8?B?b1JaZ2FWdGl4R2p1SWhOM2hUb2R5K3k0VHBtL0ppUXgrTVN0OWJIbnFNR3FI?=
 =?utf-8?B?aEY5Zk10Z09QMFl6QWJHY1lBT0pjWE9uT3ppbHFTSHIvK0ltMXFjeTI1NC83?=
 =?utf-8?B?czRoVUttVldXdk8vL25FUUxhS09RLzEwOHRuVmZFQ2wyRG82MnNydFJQT0Zp?=
 =?utf-8?B?MWczLzUyU1U5eGZFSk1ReFY1MXVsN01LS09FMmZscE5NTjFENVRIUjgxcEpI?=
 =?utf-8?B?a0M4YkNibDcvZ2ZUMUczUGdmY3Fab0VmUnMwWkIyTTdSTmZyQ3BzbStvOGtV?=
 =?utf-8?B?ZklKMXYrUDFDY0x5eUcrYk1qaE5neHZ5aTFIZU5qMUR6MVZPaVYvbFNPQ29C?=
 =?utf-8?B?NnNVMTY1N3lWVXZpMkh5Z1FKdjVpakltMUpPamRLNi8xQkdrVkhUZW9WcmlP?=
 =?utf-8?B?aE00aUZnU1FIZnB4TkNzL1U2TTkwejk3bjNKcjMvVmVXV0JJTDdweWpwTnBn?=
 =?utf-8?B?ZHlaMGdkWTlRT0FoNVJpTnJacXpSNmFEQWNyaTM4TXZacm9hVDZHZXhmMDJW?=
 =?utf-8?B?REdhZDFyS2t0eWdXYzF2Q3ZTL25Kc3ZTQWlVT2lUU3RBVytPWnNaVWJvY1cx?=
 =?utf-8?B?MlAyTFlTOEJvQVc2UThjSlcrUmJtVVZpOVhkOGYxSXc2VjlxNk95ZHNRdFdx?=
 =?utf-8?B?OG1JVHRHblh2S0lGbE9hK24wYU5ET3NaQlJFWVhBaEVQQkNESi9ET0I5dUN0?=
 =?utf-8?B?QTdXOUcvRHZOb1dvR1RSZFA2VVhPdkpiKzA5MVBpRkFOd1BPdkRkWW5pSGxC?=
 =?utf-8?B?NGpSK3kyeGxrVEQyeEl2OVlpbXFZWVl5RlBNdHdaWWdIclI3TytmRjhpbFJt?=
 =?utf-8?B?K1RWRTdqTFBrMmQrdHRXWXhyZmw3SDA2TUtlN1hIOEpyYlFLdlIvMkFkRG1h?=
 =?utf-8?B?UXR4UTZaQWZIMFZOUnN0b3g5bWtOQVU4d3QxWmNPQzVZSGpLY1lpUWdLMjZK?=
 =?utf-8?B?c1IvWkljRFp5OHN5bERVank3WGxONW5HTTVac014VVVQSVJPam95T1F3bysw?=
 =?utf-8?B?SlZ3OXVPVmJNWFZpa21RL3lDWERGZVQxT2xKQWc1djlmV041MFZQV3VHTUdD?=
 =?utf-8?B?dGVVUHZObUU4WlpXV2F4THVuSkVCbUlwbVVtNVV5MFBsbCt1Tnh6dlVYWkpD?=
 =?utf-8?Q?+NHJe39o0r57pVznq6btAKOla/uVagqM8OhYHf9TbzvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW42bzBQUkswcUtIQW85Y2VoMksrNGJBYkZIWU1zNmxaVmI3R3dwNTVuampz?=
 =?utf-8?B?dktDSWhNbEFvRUlLQ0RLeEk3aEs4UHU3TUNQSk9iVzJ1RzB0MEpKenF2UGd2?=
 =?utf-8?B?M2lRNmZhR1lwdndiRiswa3VlSHNGNUhMTytqV2M2dERYbDlqMjMxdGx2VG1u?=
 =?utf-8?B?WVJDSHNDNDFQaUg5V1Rpc0Z4eVpXSmt6K3FQNm4wK3JlSzROZGtqN2VlWm05?=
 =?utf-8?B?MFFIS3JKM1J5ZWRkU2o3WkttNjdXVE9mdzhUd21yVWtCTTlFNGw3cUJINkhU?=
 =?utf-8?B?Sk1rN3plWndlSllyMDV6aDdmVGk3NnZTZWphNjZ0VkVyRlMvdlpEMzJpbjA1?=
 =?utf-8?B?TENTRGZ2YXVMcFJTcFVnNnBTSldSRUxuL1Nwcy81dTVhQWpjdm5aMHdES2M1?=
 =?utf-8?B?b3h0Uy9NcWY5S2lzYlA1MWRQazhzRHpoZjhFU2M1MTNQZFBNNnRveVVyeUts?=
 =?utf-8?B?d1BRdUdVSXVYRHRQVU01QVNKSi9CckcrU3JzMDY5R3Y1bGtzaWZ1eEg5L3pr?=
 =?utf-8?B?V3ZIN1NZMU8rUmdNL1p4WjROcjFPbmJkandMY1VhbStyc0tmWERXUU5VV0JQ?=
 =?utf-8?B?Ykc0dXFjYktoSVlDd3VOMEJsczA2VVhLYmxKVVZLUWZWODdWOGROUUYzQVBT?=
 =?utf-8?B?ZXI1MUdjQXpBcHhLTVlvSVVuWldsOEhVaU8zbzhjaDVrREs1aHJVMFptY1V4?=
 =?utf-8?B?RFp6d3NkZU1qRUtxcmNMV3E1eG1xTllxZmNkcStnOVZtZTFiQTJSbTljUjdr?=
 =?utf-8?B?Y3oxQksrTks5bHY2UjIxTVJFOE1XNlBqUHFHWGtGMkgxdHBVNDJsL0xzRFJN?=
 =?utf-8?B?ZFdib1dqaTlMTk9NbGd0MXRQMXBkMENpWXFXTEhZZ0hBeXBvUHdWZU5oNTBx?=
 =?utf-8?B?eHBIQVdjQnFPc012L0ZwdHVJZFIrOHJrWVlqNzFVOVZVQXFvbkNjajNHbjJF?=
 =?utf-8?B?TkFEdnl4c25yYUs2NEVMUisvb1FGTVdwVlRhUkFRVVRvL3RQenk1MnA2ZDZo?=
 =?utf-8?B?VXRBREZldUlKajhMdEc3NHN4MGZqbUhWZjR5aGNmdkN1aWt4cXRyZnJobk00?=
 =?utf-8?B?b3BvNHlhdXlXWG55OFNGb2o2NUNZZ2dHajlDZDBFcWIyNkpWa2tqYm5QU3Bz?=
 =?utf-8?B?SGx2cjJ0VXpxYUhKYVE1N1dFejBuU0tqaU9oNHk2c2NhTHBGRGFzUGVXcmxn?=
 =?utf-8?B?SXlxWVVTa1FZaW44NExXMEdZcnZqOVUxdCtsTy9QMDNWRzdTN1JNTlE3MXV4?=
 =?utf-8?B?d3dYT1V0NFNnYnRuayt2cXhHcWpVQVZOeVVFOTd6bm1WSFJDWnVzcHNMUjRC?=
 =?utf-8?B?QXV5K1VkdkVPMG9UOUVod2plYzkyL0ZqMTlnZ2Q4bE53eGY1MWNLMDRhcFRN?=
 =?utf-8?B?THNaRkNJU3YwQkc0ZVY5YmxsbHhoWkR2dHUwRkNUbVV1NTQ5eiszeGpzUHM3?=
 =?utf-8?B?T2NBZzVWNzFEcC85eTVGbXU3Z0txRVdBTjVXSDlzYlV3a3ZoY0piVGJZQ2pq?=
 =?utf-8?B?ZXdXQnhMYUE5MXVWRTVjdnFSTlNxL253MXhVdTN5SFAxYXY2MGlXUUY0K2pi?=
 =?utf-8?B?Q3gwV1FsQ3RvQjNsY05xUGJUV2dlK3R4bFY5Zm1MMnZrc2t4YnpnbWZtaXhG?=
 =?utf-8?B?czhKMC9mbFN5NTFRcGt4SzJFVmVDNTdJdVVkUTN5dVNWbC9jemY4alRBQ0sw?=
 =?utf-8?B?Q1BOOW96SGhCMGZVZUNNbUJrTDYxWUg0VEMxSXgvRUt0TUJha1NNMlQyTjVC?=
 =?utf-8?B?QXd2QkZiQUk4QkdYcmVJY2pqcjIzTWFmcmFTa2x2ajlpK2QzSVloc1FaZ0M2?=
 =?utf-8?B?TzY3VUh6UUpHVlh6aXNCN2xicmREd2U0dUlSYmhUU1VWQWtYeGExMndsSk9U?=
 =?utf-8?B?aURyblIvc1IrblF1NkdsQjVLMlJRN1Q2UHI5dko5eTYwY0o1eXVRck9GR1dj?=
 =?utf-8?B?RERPQ0tFUlFJTmZkbFVKWUNmeEtlbkZqWWdQMHpWRExFa0FFWkY2SmFzQjRp?=
 =?utf-8?B?SEFLU1lpZkpZc0pxdWRZd3BWVERlUDNURlhNVmJsMXR1bVByOERHaVpkNmV3?=
 =?utf-8?B?a0ZrTXdoRTR2bnBBelBIUnkrd1hJcGxkdWxqb0tmL2lGaFFNTnh6eExlcm9M?=
 =?utf-8?B?NFBnaVBUYzQyZ243ZjVqNFJZRUF3Sjc4NkJJNCtMQTI3WFhOVDhSeGFyOUEz?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126cfae6-ae35-48cc-a217-08dcee139e5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 18:52:01.0031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwZuUPax3JQ5Cxb1QGW9sfXz6+S4zJpYBV5kOm4TSOqoSxidJ8YyS37QdQjCWXUNB36VmLab3OHhvyc+EdDnkuTmFAT4kBGXv+2mOOgMyiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On 10/16/2024 04:52, Badal Nilawar wrote:
> In case if g2h worker doesn't get opportunity to within specified
> timeout delay then flush the g2h worker explicitly.
>
> v2:
>    - Describe change in comment and add TODO (Matt B/John H)
>    - Add xe_gt_warn on fence done after G2H flush (John H)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3096baa4c9f4..c4e06d6722f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1028,6 +1028,21 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
>   
> +	/*
> +	 * Explicitly flush g2h_worker if it hasn’t had the chance to run after being queued due
> +	 * to delays in workqueue scheduling.
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue root caused and fixed.
> +	 */
> +	if (!ret) {
> +		flush_work(&ct->g2h_worker);
> +		if (g2h_fence.done) {
> +			xe_gt_warn(gt, "G2H fence %u, action %04x, done %s after G2H flush\n",
> +				   g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
> +			ret = 1;
> +		}
> +	}
Why bump the timeout and then do the flush? If the only issue is 
believed to be the delayed worker thread then waiting longer before 
doing the flush seems counter productive. You are just increasing the 
time taken for no benefit. Flushing the worker thread should be all that 
is required. If anything, we should be breaking the timeout up into 
smaller chunks with a flush in each so that the completion happens 
sooner not later.

Also, there was a big discussion about resets on the previous revision 
of the patch set. What happened with that? I'm not seeing anything about 
connecting with the reset paths here?

John.


> +
>   	/*
>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase

