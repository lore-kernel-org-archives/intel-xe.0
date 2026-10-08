Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1864BCA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F0F10E88F;
	Thu,  8 Oct 2026 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBxci9Yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178C10E896
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467876; x=1823003876;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0HNfQPBFBW4ikZ0xwXcyB5nKgl9b6guDihzYV/d4Hao=;
 b=IBxci9YiKLsX8Ch267gKdZ0Q+6+JH03UNQxW75HNVECerXmZLv46SAW+
 Z1C2LLnTkf+PuXSh5Wo36jndndDrXdciYo8ptJEb64uql4h2E4PWne+4y
 eIs4omcXkxki2BwjjDUPQyTQ1Hd7XzdWCkcp5H30RhsoS1cTuT3rZQk+U
 pcBJ0JCj4kiwcyZL5WLDwPw7V7q0WObhJnHcT5bRwDCP0M6JRwF1p6XQ0
 DXkPWW4cwq2hBirFXydvAeQWfNS2UiPcG7H0mlL7tuQxBSCVtxHZZqzpU
 DW6b6N/bQ9dWLi1QebV7mdO9sJ/Ilg1RMnHwsveXfFSLphQd3pWfPjDVK A==;
X-CSE-ConnectionGUID: ya3Sw4eOSKy/l6NIe2cCQg==
X-CSE-MsgGUID: TmpZBXWKQx6oezGlmH1sYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="250773"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="250773"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:57:56 -0700
X-CSE-ConnectionGUID: 2L5Wf4XlRPaGui1Rd9XKIg==
X-CSE-MsgGUID: 2PsoVl9tTQeSjUDTkWgLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1881176"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:57:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:57:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:57:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qas9F2Flbdot0/5YqjNWiDC3mRmehydkr6tdUpdgZJ8JTyoHVZEFpK9Z84Xj4KG1QbE/D1DWiksVDZseta1AaG0iP3rb4sM8kVdwMLUF7MBtWc4N3uzLceC6c/8tC5YwQHWv/5JvRTI4rg69jnhFC12ks21E0sVM5TL09aObKXfsFWyoNbC1plGdiVk4ai9EhVKaWcKn0zRpdXEjcvD9gVBFFtpcZUqvDtv+l37Y20EPx6abjK7GVEYVg81lbE4GcLzInwx7xjunqkCCRQXxMy+ojdWlH2oGAxoIYjtDIFs59U7b7gweyQMeBKqmQYnpbQM/CWaghbIydWYC4Yqd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJW/EaSzGkL9lXEmdeHBNmgwpii6F1qV90keKgeUzzI=;
 b=UIfcReA9WVVaRrGVrxjcQpIxRu3hlPJqWpuy74MQPRJz1dZRBVI4x2VQUFzY61Iammo5m1NjySfxnJ9rk+P+KkcpirlejiAzplJTy9umhDzZwbxU5kEGMU8gEa2RDpOrYDljdInbHdnlVHK/+INTwifu2J2RYU6a0/7TEwxN0EhjrmWkZt37WBVmgrulRr9LtWMYgN6FR3yJbCBcOen7iAqLyXxT03R4141bX40kuX0F8gmODBJPwO1gLkrUnAKTR9GbvuKaF8ilb91v4EK8manxMdoYoQE+dyQJI5UbtJp8b87xeHf3l03yXV5SraWLp8PP+ZgX54OUCupR1B56sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 13:57:50 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 13:57:50 +0000
Message-ID: <cf7950e1-3f34-478e-a239-e2cd71f2ee63@intel.com>
Date: Thu, 8 Oct 2026 19:27:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
 <20260903141834.1315675-2-naresh.kumar.g@intel.com>
 <DS0PR11MB871883C996488A6420860C6281942@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <DS0PR11MB871883C996488A6420860C6281942@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::10) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|SA2PR11MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac61e6c-193a-450d-8db8-08df25442431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|3023799007|4143699003|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KYA+0lhaAQOnMiYz+b3sx4xaCXAVlMaMdHb0zTygD3+NyljgjO5ECEONmU1Fyt0mx5vAPFSX9tS4Jeim8RjlJIZRKnSfSUzliBJBY9uFpqto3jmcrcxwUXXpfiiBT3CW5Noq/8NwKrCEOuIJlmp96oas1UftXR8nGv6r2pa/BkLPn9TT6Wh7eDth3+33ph69RoIdfbga65lNUraGxAMygDJz7tGUWZYwhaj5eoJ335t3F8kW8Aep/IokmNDejVO3jOPDgRULifZPPRv8piaHm928Ck03QWizsX4XEplvkO+7iEVMze41WyPoHfH3rHhSUeV1PIW4Bu32jmsZdAjHsuPDGzxxzP6qA4iZ3Azx0NfO4yrX17RGc5i5kQZoURmPyDCeprEq0x8UzowKZ+iaO8rXmbpm5fVGxfFAUzduuwYVseeE3UGvyHxhoKXdNgoY7QGdo3U3wXlxbmKuGRHiqghsEi1M/bFNgwPAkK0rN5dUuOZVcMlAdi/R1JYt6f3Q0BjXeVkTSLmqTUg4Q39plXrqZNonz4Dr2FKKDva95wH/HIphG+til/6dBHjUTgatydQOjNJSbXGM9bVHUVilwbfgh23RPrEmM0mnb6tnMOOCMBvsLz4VYjjHY6GxXAvJZsgkz0mkssmp+CgJEWMawFzA7DFNREuCmnQemFscxh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(3023799007)(4143699003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVExSG1ibGE2YXlOMXMzR3lTc2ErSnhsdW1hN1BuR3BZdlU1MG5TRy9lc24w?=
 =?utf-8?B?c2x6T25vbUJQKzcyVXFuWXJhUW9LZ2ZlL2NoUXFFaVNnaFdMOVJxQTVmdm5t?=
 =?utf-8?B?ZzBpZ3NtUW9EcHE1OTVzemFzcVR6ODVXR0JlNG0vUDZ1ZmsrSHRQN2E2Wlpy?=
 =?utf-8?B?S3UxR1d6WXl2dEtSbjhNczV4VFFYNitrbDVUL1ltcWF5L1JRR1pDRmc4RUVw?=
 =?utf-8?B?Sk1FakxYY2ZjQjF0eFBaNEdPb0J1YjdDWUpXU3pVbWVmTnFGVVpMMUVhMFA2?=
 =?utf-8?B?SFdmYUE5ZEtUcXhESFUyUURoRlZ3d0N3UTJ4Sm1LZEFaYngwbjdGTFlUVWdZ?=
 =?utf-8?B?dmVub3ZNd1FIbXF6L0Z6UDBROXErSmdrd1BSZmVaZFhMc1ZEY0tsR1g1RStB?=
 =?utf-8?B?UUhaUjFzZk04azlhZ2FTQVkvdFpIZTNCV1U4eTEzQ1VReVFxVnkvdkd1OWY1?=
 =?utf-8?B?LytpMWFHOHRvcnRlRS9SUHBvcitRKzhrR2pLZE1uTjZOSlZzVU1EcC9YVksr?=
 =?utf-8?B?aGtZOVJ4Z1lVWDRjMUVsMjNjZzJOMXJGZEVKeDhyZmR1YVBtZnFWMDJKVXpJ?=
 =?utf-8?B?NFU4T3YwOEJlOEgrdEl2MmJ6QmNaUUxSYkJFUTBQREVjdDRIRTg3VWw4MWV2?=
 =?utf-8?B?dkV1c2ZzbUlDbVlJT0JBWXdobXFTUDQxTitOanRwNWhoTWtVcVJoUTVNd1JF?=
 =?utf-8?B?RDZGNkNsbXRiWVJDN05BS2hmUmV6dFZFRmluWUdpblE2MEJLTXdSdW91dUoz?=
 =?utf-8?B?OEk5TTA1OW5vbndlSXhJM0VKN29DMndSQWNZc3VzNC8weVBvcjg5aEliTmJu?=
 =?utf-8?B?aTFBbTZOZmF5MkY3YjZUZzV6WE9IWi9SZFFoSGx6ajdxQ2lxT2JlOVN4SEhq?=
 =?utf-8?B?V0Z3Q2hPT0lLQjFEKzRweTRkYmV1MDlzY291bDhkZXpwSzJmTSszVnJVNDNp?=
 =?utf-8?B?VU03M0dFWFFFM1hLd0dsLzZHN3dwK0taeEZxeTY4a3E3QzZGMTlYZHE2MFJ4?=
 =?utf-8?B?czEwZHFtVllFSlFyeHp1bFF1Vm8xbUVrKzEzZ0UrVDZoakdHcEtiVm9ReDlH?=
 =?utf-8?B?UGRwRHBrY0t1cm03czVBVHdVenVrSTZXdjZjOVgxV2RNRHhqTGh6Z1QzNGF6?=
 =?utf-8?B?dHFaQXNIUDFRUzhsalhHNDVtS2lhWE4rcU90aXNFK01BNXcxVHBrVVV6bm9r?=
 =?utf-8?B?Sk9oTlNQM3E2NnlEbHJBV216WFZmaGd2dVE3MDhzVjlVMVFHRk8xVUlyUXVz?=
 =?utf-8?B?VkVGbjU5OVdZUFRlVzIrcllPR1Q2T1MzYzJPNGd0eDZxbnNHZUEweHNPSlRj?=
 =?utf-8?B?V0tyOHNQZ2xzWWJhMnViZU1MbkZCR3pldTVzU1JiUE5aU3lPYzRCSGVtWHRP?=
 =?utf-8?B?eHg1aW9TcnJvblBTTHZkS3NOL0V0NmV3T0Q4WmhnSEdIMGFCYUNHcVhkTU13?=
 =?utf-8?B?UkhKcGlScjBvdDRTc1pkV04rMXFnMVR5REUxVmt5bFNzK0lXdzY1bzVhUjhy?=
 =?utf-8?B?MXdjZjNicEQ4VTJPMU1jaUlmc01qMVo0VFBka1gvcEdKcURrcDk0S01UUHhp?=
 =?utf-8?B?cGptSDNpRXgybXEvVUZQZ0g4cUpJTTFKSmtSdERxRHBFem42NWJWQytweFpU?=
 =?utf-8?B?YWZHK2FCQlk0OW1KV2xyMUNuQWQwRWJHRk9zajIxUkNWS0NySGFFYk40VStN?=
 =?utf-8?B?WktlZ2kzOWx6dmFqMDI2dDkrcVMrQ0c0WURsN2ZXSG5qQWZLSG4rVXdnakpm?=
 =?utf-8?B?WkIwd20yS0tpVUFIWEVONmZaWUJUa3I0cGNoU05yRjlPdXhKYmljSFRKbkpl?=
 =?utf-8?B?R0lCNFdRWTVtWThnRkljVU5OU2Y3Z2RXcU16MWF0WVptZGlTcmh1WkRPNTg1?=
 =?utf-8?B?SWpFdVNZTDA0RGc0S2VGd3d3a3NsZEVqSmpTSWcrbUFndG54RUN3a0EvNSt4?=
 =?utf-8?B?WG5OS21SV1lJazFSL25UeGVPcEhWc0VGdHkvb1M2MHJCUlBBSmxwVHZvZmZU?=
 =?utf-8?B?SSthVVJhb0UxMnpydEg4bGwrNWxkRG5vdDQycVp3VFNKTXhkZVYwaTlMMjd1?=
 =?utf-8?B?TTZQZ2E3dlB0R203NHd0eS94MFo5Z2ZxMHdqOVhZQWZObEFCZHVrcXlNRXpH?=
 =?utf-8?B?MFVIT0JPZ0V6YkVzaytTTmoxaDg2YlQxdFRBT2xuT3FBUGliQnR5aVh3L0pK?=
 =?utf-8?B?VFV4V0QzOTJ6WDVOdTlRRjRPRStPRG5SMWVIUzNvQlFLMjFjQnM3eHpmYjFz?=
 =?utf-8?B?Vy9MVzMrYm1TTUhFVFQvTHFyQVY0MEJVOEZGb1BwSGMrVjVvWmcyaldJWHZ0?=
 =?utf-8?B?dStBam9GYzlaUWV5UGdLTVRtMmNxWjBic3NkaVNOZkFqVHZXYmN2UT09?=
X-Exchange-RoutingPolicyChecked: slBq2OAnkT9dNDIJmXGdDN+rPo12z7EzjBWAs3SjogvAaoNxu99i1fufYtGF5O55C01VQ2r1mM6+SpHXgKASNQBJ9XSSkBByfNBFIl37UCXBVxGPhUF+ATJBIYGV054I+oRsh5ks+pOW+hkMVBQM7pv004DlFbc8C3qzLHPEkPvqHIskQdCKpDj47F43q95j7uOriceXR69vJvw+Q6pLLBVWIYFdLS8tlhROF4jKwhvsVzN+avUdbhw3m/Df9MhDEPCbRzT/D0xh516YAHfoW++oTn/d6VPbzBFiyGgdGj5jei+oCbBM0w/23OM9EGaJwVqaCMjHI/+uaxor6JH87A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac61e6c-193a-450d-8db8-08df25442431
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:57:50.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OT6LW6Jf01MScZnHzdKiB63Zi7ixTQiQQfF+hQ1GhHpn5bUQuFuyVfQweLTN1FX9lZ6GO/bRfgSd5EaOYb1QHkrO4xpCw1HRheh2n9Le1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
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

Hi Tejas,

On 10/7/2026 7:21 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
>> Sent: 03 September 2026 19:48
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Yadav, Arvind
>> <arvind.yadav@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Kumar G, Naresh <naresh.kumar.g@intel.com>
>> Subject: [PATCH v3 1/7] drm/xe/devcoredump: Capture GT fuse registers in
>> devcoredump
>>
>> Capture fuse-related GT register state in the Xe devcoredump to preserve
>> additional hardware configuration information for postmortem debugging.
>>
>> Add generic register snapshot storage and helpers for capturing, printing, and
>> freeing MMIO register dumps. Use them to record both primary GT and media
>> GT fuse register state during devcoredump snapshot collection and print the
>> captured values in the coredump output.
>>
>> Also add the required GT register definitions for RPM and mirror copy-enable
>> state used by the new dump paths.
>>
>> v2:(Sashiko)
>> - Fix GT/media fuse snapshot capture to use the correct GT context.
>> - Add non-fault GT force wake for cross-GT register capture.
>> - Skip reading registers when SR-IOV VF.
>> - Skip media GT capture when media GT is absent.
>> - Add RPM snapshot print/free handling explicitly.
>> - Add POWERGATE_ENABLE register to get render awake status
>>
>> v3:(Sashiko)
>> - Check RENDER_POWERGATE_ENABLE of POWERGATE_ENABLE register
>> - Replace "render is not awake" message with "render powergating
>>    appears not enabled"
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   4 +
>>   drivers/gpu/drm/xe/xe_devcoredump.c       | 255
>> ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  39 ++++
>>   drivers/gpu/drm/xe/xe_device.h            |   5 +
>>   4 files changed, 303 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 48c515d91882..19f0a65cc3d2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -22,6 +22,8 @@
>>   #define   MTL_CC_MASK
>> 	REG_GENMASK(12, 9)
>>   #define   MTL_CRST					0xf
>>
>> +#define RPM_GCD
>> 	XE_REG(0xc98)
>> +
>>   /* RPM unit config (Gen8+) */
>>   #define RPM_CONFIG0
>> 	XE_REG(0xd00)
>>   #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
>> 	REG_GENMASK(5, 3)
>> @@ -274,6 +276,8 @@
>>   #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
>>   #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
>>
>> +#define COPY_ENABLE_GTFS_GCD			XE_REG(0x9174)
>> +
>>   #define GDRST					XE_REG(0x941c)
>>   #define   GRDOM_GUC				REG_BIT(3)
>>   #define   GRDOM_FULL				REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 5f2b90b18f97..fe38bb2296be 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -25,6 +25,8 @@
>>   #include "xe_pm.h"
>>   #include "xe_sched_job.h"
>>   #include "xe_vm.h"
>> +#include "xe_mmio.h"
>> +#include "regs/xe_gt_regs.h"
>>
>>   /**
>>    * DOC: Xe device coredump
>> @@ -69,6 +71,233 @@
>>   /* 1 hour timeout */
>>   #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
>>
>> +/**
>> + * struct xe_reg_desc - Register descriptor struct to make reg list
>> + *
>> + * This struct is used as descriptor containting reg address and name
>> + * of the register to dump its value during coredump for debug purpose.
>> + */
>> +struct xe_reg_desc {
>> +	/** @reg: The register */
>> +	struct xe_reg reg;
>> +	/** @name: Name of the register */
>> +	const char *name;
>> +};
>> +
>> +#define XE_REG_DESC(_reg, _name)	{ .reg = (_reg), .name = (_name) }
>> +
>> +static const struct xe_reg_desc xe3p_gt_fuse_reglist[] = {
>> +	XE_REG_DESC(XELP_GT_GEOMETRY_DSS_ENABLE,
>> "GT_GEOMETRY_DSS_ENABLE"),
>> +	XE_REG_DESC(XEHP_GT_COMPUTE_DSS_ENABLE,
>> "GT_COMPUTE_DSS_ENABLE"),
>> +	XE_REG_DESC(XELP_EU_ENABLE, "EU_ENABLE"),
>> +	XE_REG_DESC(MIRROR_FUSE1, "MIRROR_FUSE1"),
>> +	XE_REG_DESC(GT_VEBOX_VDBOX_DISABLE,
>> "GT_VEBOX_VDBOX_DISABLE"),
>> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
>> +	XE_REG_DESC(COPY_ENABLE_GTFS_GCD,
>> "COPY_ENABLE_GTFS_GCD"),
>> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_1, "GT_GEOMETRY_DSS_1"),
>> +	XE_REG_DESC(XE2_GT_GEOMETRY_DSS_2, "GT_GEOMETRY_DSS_2"),
>> +	XE_REG_DESC(XE2_GT_COMPUTE_DSS_2, "GT_COMPUTE_DSS_2"),
>> +	XE_REG_DESC(XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>> "GT_COMPUTE_DSS_ENABLE_EXT"),
>> +	XE_REG_DESC(XE3P_XPC_GT_GEOMETRY_DSS_3,
>> "GT_GEOMETRY_DSS_3"),
>> +	XE_REG_DESC(XE3P_XPC_GT_COMPUTE_DSS_3,
>> "GT_COMPUTE_DSS_3"), };
>> +
>> +static const struct xe_reg_desc xe3p_media_gt_fuse_reglist[] = {
>> +	XE_REG_DESC(SERVICE_COPY_ENABLE, "SERVICE_COPY_ENABLE"),
>> +	XE_REG_DESC(COPY_ENABLE_GTFS_GCD,
>> "COPY_ENABLE_GTFS_GCD"), };
>> +
>> +static const struct xe_reg_desc xe3p_gt_rpm_reglist[] = {
>> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
>> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"), };
>> +
>> +static const struct xe_reg_desc xe3p_media_gt_rpm_reglist[] = {
>> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
>> +};
>> +
>> +/**
>> + * struct xe_reg_desc_list - Struct for register descriptor list
>> + *
>> + * This struct is used to reference the corresponding reglist of
>> + * various component
>> + */
>> +struct xe_reg_desc_list {
>> +	/** @regs: Pointer to an array of register descriptors. */
>> +	const struct xe_reg_desc *regs;
>> +	/** @num_regs: refernce for num regs in reg descriptor*/
>> +	u32 num_regs;
>> +};
>> +
>> +/**
>> + * struct xe_gt_regset - Struct for register descriptor list for GT
>> + *
>> + * This struct is used to reference the corresponding reglist of
>> + * GT and media GT
>> + */
>> +struct xe_gt_regset {
>> +	struct xe_reg_desc_list gt[XE_MAX_GT_PER_TILE + 1]; };
>> +
>> +static const struct xe_gt_regset xe_fuse_regset = {
>> +	.gt[XE_GT_TYPE_MAIN] = {
>> +		.regs = xe3p_gt_fuse_reglist,
>> +		.num_regs = ARRAY_SIZE(xe3p_gt_fuse_reglist),
>> +	},
>> +	.gt[XE_GT_TYPE_MEDIA] = {
>> +		.regs = xe3p_media_gt_fuse_reglist,
>> +		.num_regs = ARRAY_SIZE(xe3p_media_gt_fuse_reglist),
>> +	},
>> +};
>> +
>> +static const struct xe_gt_regset xe_rpm_regset = {
>> +	.gt[XE_GT_TYPE_MAIN] = {
>> +		.regs = xe3p_gt_rpm_reglist,
>> +		.num_regs = ARRAY_SIZE(xe3p_gt_rpm_reglist),
>> +	},
>> +	.gt[XE_GT_TYPE_MEDIA] = {
>> +		.regs = xe3p_media_gt_rpm_reglist,
>> +		.num_regs = ARRAY_SIZE(xe3p_media_gt_rpm_reglist),
>> +	},
>> +};
>> +
>> +#define XE_GT_REG_LIST(_type, _gt_type) \
>> +	(&xe_##_type##_regset.gt[XE_GT_TYPE_##_gt_type])
>> +
>> +static void
>> +xe_capture_reg_desc_list(struct xe_gt *gt,
>> +			 struct xe_reg_dump_snapshot *dst,
>> +			 const struct xe_reg_desc *src,
>> +			 u32 count)
>> +{
>> +	u32 i;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		dst[i].reg = src[i].reg;
>> +		dst[i].value = xe_mmio_read32(&gt->mmio, src[i].reg);
>> +		dst[i].name = src[i].name;
>> +	}
>> +}
>> +
>> +static struct xe_dbg_reg_snapshot *
>> +xe_dbg_reg_snapshot_capture(struct xe_gt *gt,
>> +			    const struct xe_reg_desc_list *reglist) {
>> +	struct xe_dbg_reg_snapshot *snap;
>> +
>> +	if (!gt || !xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
>> +		return NULL;
>> +
>> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>> +		return NULL;
>> +
>> +	if (!reglist->regs || !reglist->num_regs)
>> +		return NULL;
>> +
>> +	snap = kzalloc(struct_size(snap, regs, reglist->num_regs),
>> GFP_ATOMIC);
>> +	if (!snap)
>> +		return NULL;
>> +
>> +	snap->num_regs = reglist->num_regs;
>> +
>> +	xe_capture_reg_desc_list(gt, snap->regs, reglist->regs,
>> +reglist->num_regs);
>> +
>> +	return snap;
>> +}
>> +
>> +static void xe_dbg_reg_snapshot_print(struct drm_printer *p,
>> +				      const struct xe_dbg_reg_snapshot *snap) {
>> +	u32 i;
>> +
>> +	if (!snap)
>> +		return;
>> +
>> +	for (i = 0; i < snap->num_regs; i++)
>> +		drm_printf(p, " %s [0x%x] = 0x%08x\n",
>> +			   snap->regs[i].name,
>> +			   snap->regs[i].reg.addr,
>> +			   snap->regs[i].value);
>> +}
>> +
>> +static void xe_dbg_reg_snapshot_free(struct xe_dbg_reg_snapshot *snap)
>> +{
>> +	kfree(snap);
>> +}
>> +
>> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
>> +				     const struct xe_dbg_reg_snapshot *snap) {
>> +	xe_dbg_reg_snapshot_print(p, snap);
>> +
>> +	if (snap && snap->num_regs >= 2 &&
>> +	    !(snap->regs[1].value & RENDER_POWERGATE_ENABLE))
>> +		drm_puts(p, "render powergating appears not enabled\n"); }
>> +
> Can you think on following thing first. It looks like too many structs and apis :
>
> Struct side: one array instead of two separate named structs. Something like below?
> enum xe_dbg_regset_type {
>      XE_DBG_REGSET_FUSE,
>      XE_DBG_REGSET_RPM,
>      XE_DBG_REGSET_MAX,
> };
>
> static const struct xe_gt_regset xe_dbg_regsets[XE_DBG_REGSET_MAX] = {
>      [XE_DBG_REGSET_FUSE] = {
>          .gt[XE_GT_TYPE_MAIN]  = { xe3p_gt_fuse_reglist, ARRAY_SIZE(xe3p_gt_fuse_reglist) },
>          .gt[XE_GT_TYPE_MEDIA] = { xe3p_media_gt_fuse_reglist, ARRAY_SIZE(xe3p_media_gt_fuse_reglist) },
>      },
>      [XE_DBG_REGSET_RPM] = {
>          .gt[XE_GT_TYPE_MAIN]  = { xe3p_gt_rpm_reglist, ARRAY_SIZE(xe3p_gt_rpm_reglist) },
>          .gt[XE_GT_TYPE_MEDIA] = { xe3p_media_gt_rpm_reglist, ARRAY_SIZE(xe3p_media_gt_rpm_reglist) },
>      },
> };
>
> Capture side: one function instead of four.
> static struct xe_dbg_reg_snapshot *
> xe_dbg_gt_snapshot_capture(struct xe_gt *fault_gt, enum xe_dbg_regset_type type,
>                 enum xe_gt_type gt_type)
> {
>      struct xe_gt *target_gt;
>
>      if (!fault_gt || !fault_gt->tile)
>          return NULL;
>
>      target_gt = gt_type == XE_GT_TYPE_MEDIA ? fault_gt->tile->media_gt
>                           : fault_gt->tile->primary_gt;
>      if (!target_gt)
>          return NULL;
>
>      return xe_dbg_reg_snapshot_capture_target(fault_gt, target_gt,
>                            &xe_dbg_regsets[type].gt[gt_type]);
> }
>
> And then,
> ss->gt_fuse      = xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_FUSE, XE_GT_TYPE_MAIN);
> ss->media_fuse   = xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_FUSE, XE_GT_TYPE_MEDIA);
> ss->gt_rpm       = xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_RPM,  XE_GT_TYPE_MAIN);
> ss->media_gt_rpm = xe_dbg_gt_snapshot_capture(q->gt, XE_DBG_REGSET_RPM,  XE_GT_TYPE_MEDIA);
>
> Also please think something storage side also if possible to optimize.
Let me check on that
>> +static struct xe_dbg_reg_snapshot *
>> +xe_dbg_reg_snapshot_capture_target(struct xe_gt *fault_gt,
>> +				   struct xe_gt *target_gt,
>> +				   const struct xe_reg_desc_list *reglist) {
>> +	if (!fault_gt || !target_gt)
>> +		return NULL;
>> +
>> +	if (target_gt != fault_gt) {
>> +		CLASS(xe_force_wake, fw_ref)(gt_to_fw(target_gt),
>> +					     XE_FORCEWAKE_ALL);
>> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains,
>> XE_FORCEWAKE_ALL))
>> +			return NULL;
>> +
>> +		return xe_dbg_reg_snapshot_capture(target_gt, reglist);
>> +	}
>> +
>> +	return xe_dbg_reg_snapshot_capture(target_gt, reglist); }
>> +
>> +static struct xe_dbg_reg_snapshot *
>> +xe_gt_fuse_snapshot_capture(struct xe_gt *gt) {
>> +	if (!gt || !gt->tile || !gt->tile->primary_gt)
>> +		return NULL;
>> +
>> +	return xe_dbg_reg_snapshot_capture_target(gt,
>> +						  gt->tile->primary_gt,
>> +						  XE_GT_REG_LIST(fuse,
>> MAIN));
>> +}
>> +
>> +static struct xe_dbg_reg_snapshot *
>> +xe_media_gt_fuse_snapshot_capture(struct xe_gt *gt) {
>> +	if (!gt || !gt->tile || !gt->tile->media_gt)
>> +		return NULL;
>> +
>> +	return xe_dbg_reg_snapshot_capture_target(gt,
>> +						  gt->tile->media_gt,
>> +						  XE_GT_REG_LIST(fuse,
>> MEDIA));
>> +}
>> +
>> +static struct xe_dbg_reg_snapshot *xe_gt_rpm_snapshot_capture(struct
>> +xe_gt *gt) {
>> +	if (!gt || !gt->tile || !gt->tile->primary_gt)
>> +		return NULL;
>> +
>> +	return xe_dbg_reg_snapshot_capture_target(gt,
>> +						  gt->tile->primary_gt,
>> +						  XE_GT_REG_LIST(rpm,
>> MAIN));
>> +}
>> +
>> +static struct xe_dbg_reg_snapshot *
>> +xe_media_gt_rpm_snapshot_capture(struct xe_gt *gt) {
>> +	if (!gt || !gt->tile || !gt->tile->media_gt)
>> +		return NULL;
>> +
>> +	return xe_dbg_reg_snapshot_capture_target(gt,
>> +						  gt->tile->media_gt,
>> +						  XE_GT_REG_LIST(rpm,
>> MEDIA));
>> +}
>> +
>>   static struct xe_device *coredump_to_xe(const struct xe_devcoredump
>> *coredump)  {
>>   	return container_of(coredump, struct xe_device, devcoredump); @@
>> -114,6 +343,15 @@ static ssize_t __xe_devcoredump_read(char *buffer,
>> ssize_t count,
>>   	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>   	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>
>> +	drm_printf(&p, "\n**** GT Fuse Register Dump ****\n");
>> +	xe_dbg_reg_snapshot_print(&p, ss->gt_fuse);
>> +	drm_printf(&p, "\n**** Media GT Fuse Register Dump ****\n");
>> +	xe_dbg_reg_snapshot_print(&p, ss->media_fuse);
>> +	drm_printf(&p, "\n**** GT RPM Register Dump ****\n");
>> +	xe_gt_rpm_snapshot_print(&p, ss->gt_rpm);
>> +	drm_printf(&p, "\n**** Media GT RPM Register Dump ****\n");
>> +	xe_dbg_reg_snapshot_print(&p, ss->media_gt_rpm);
>> +
>>   	drm_puts(&p, "\n**** GuC Log ****\n");
>>   	xe_guc_log_snapshot_print(ss->guc.log, &p);
>>   	drm_puts(&p, "\n**** GuC CT ****\n");
>> @@ -149,6 +387,18 @@ static void xe_devcoredump_snapshot_free(struct
>> xe_devcoredump_snapshot *ss)
>>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>>   	ss->guc.ct = NULL;
>>
>> +	xe_dbg_reg_snapshot_free(ss->gt_fuse);
>> +	ss->gt_fuse = NULL;
>> +
>> +	xe_dbg_reg_snapshot_free(ss->media_fuse);
>> +	ss->media_fuse = NULL;
>> +
>> +	xe_dbg_reg_snapshot_free(ss->gt_rpm);
>> +	ss->gt_rpm = NULL;
>> +
>> +	xe_dbg_reg_snapshot_free(ss->media_gt_rpm);
>> +	ss->media_gt_rpm = NULL;
>> +
>>   	if (!IS_ERR_OR_NULL(ss->gt))
>>   		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
>>   	ss->matched_node = NULL;
>> @@ -349,6 +599,11 @@ static void devcoredump_snapshot(struct
>> xe_devcoredump *coredump,
>>
>>   	cookie = dma_fence_begin_signalling();
>>
>> +	ss->gt_fuse = xe_gt_fuse_snapshot_capture(q->gt);
>> +	ss->media_fuse = xe_media_gt_fuse_snapshot_capture(q->gt);
>> +	ss->gt_rpm = xe_gt_rpm_snapshot_capture(q->gt);
>> +	ss->media_gt_rpm = xe_media_gt_rpm_snapshot_capture(q->gt);
>> +
>>   	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>>   	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
>>   	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> index a174385a6d83..75f317a5fe36 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>> @@ -14,6 +14,35 @@
>>   struct xe_device;
>>   struct xe_gt;
>>
>> +/**
>> + * struct xe_reg_dump_snapshot - dump register snapshot
>> + *
>> + * This struct is used as generic reg dump snapshot in the format of
>> + * register, its value and its name for human readable format.
>> + */
>> +struct xe_reg_dump_snapshot {
>> +	/** @reg: xe register structure*/
>> +	struct xe_reg reg;
>> +	/** @value: Value of the register*/
>> +	u32 value;
>> +	/** @name: Name of the register */
>> +	const char *name;
>> +};
>> +
>> +/**
>> + * struct xe_dbg_reg_snapshot - Register snapshot
>> + *
>> + * This struct contains the register values captured at the time of the crash.
>> + * It is used to store the register values in a human-readable format
>> +for
>> + * debugging purposes.
>> + */
>> +struct xe_dbg_reg_snapshot {
>> +	/** @num_regs: Number of registers needed for capture. */
>> +	u32 num_regs;
>> +	/** @regs: Pointer to an array of register dump snapshot. */
>> +	struct xe_reg_dump_snapshot regs[];
>> +};
>> +
>>   /**
>>    * struct xe_devcoredump_snapshot - Crash snapshot
>>    *
>> @@ -35,6 +64,16 @@ struct xe_devcoredump_snapshot {
>>
>>   	/** @gt: Affected GT, used by forcewake for delayed capture */
>>   	struct xe_gt *gt;
>> +
>> +	/** @gt_fuse: Fuse snapshot */
>> +	struct xe_dbg_reg_snapshot *gt_fuse;
>> +	/** @media_fuse: Media Fuse snapshot */
>> +	struct xe_dbg_reg_snapshot *media_fuse;
>> +	/** @gt_rpm: GT RPM snapshot */
>> +	struct xe_dbg_reg_snapshot *gt_rpm;
>> +	/** @media_gt_rpm: Media GT RPM snapshot */
>> +	struct xe_dbg_reg_snapshot *media_gt_rpm;
>> +
>>   	/** @work: Workqueue for deferred capture outside of signaling
>> context */
>>   	struct work_struct work;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>> b/drivers/gpu/drm/xe/xe_device.h index 6c4cfaebc44a..e05951b6988b
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -260,6 +260,11 @@ static inline bool
>> xe_debug_page_size_mode_is_mixed(struct xe_device *xe)  }  #endif
>>
>> +static inline bool xe_dbg_reg_snapshot_is_supported(struct xe_device
>> +*xe) {
>> +	return (GRAPHICS_VER(xe) >= 35);
> Since when these dbg registers got introduced, this almost starts from NVL-S based on your check.

I see only some/few of the register are xe3p based and as this captured 
started for supporting for CRI .so thought have capture from the

graphics version >=35?

Thanks,

Naresh

>
> Tejas
>> +}
>> +
>>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long
>> method);  void xe_device_declare_wedged(struct xe_device *xe);  int
>> xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>> --
>> 2.43.0
