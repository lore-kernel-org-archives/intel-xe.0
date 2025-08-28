Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC8CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D9010E1BE;
	Thu, 28 Aug 2025 10:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIIkrCa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F7910E1BE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756377659; x=1787913659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W9EVWvy30ccW1yZbrQWhTYExtwKkCy9WU0HpdCzk5PA=;
 b=GIIkrCa8nP8bjUSFxgNhcoUB1FNdnM9KSGtD7Q/NCgRYL52ZTaZcsrzj
 CKzMLYXsZxhwEaIYnJZr3jLvAO9IYmS6IJIEFu4lQaq2/PZ1ud2tWNiwD
 SFRRqjvPmDf92RNS62CzxwZjyhqwAubEQ6y9DdcjBXfIBPuixnpn5gxzc
 AP1CsmAx8iP1iDpGawQL41ovQUax56RBGJ2JD7IGf9utXsK465il+iD1E
 V+wZTtwzXhqh9lA+1Gf4Ty25o4C20ugbZLUP4itJmkjI05vQ4jWCQDa7x
 mTJ8OtQt00wdMvCjQ4DyFq9wwwWO6Jx/kpUYSVCGeGQqY7SPOryON8W0a g==;
X-CSE-ConnectionGUID: C9MCbE80TTmPfiTgdZjDxQ==
X-CSE-MsgGUID: 6RgZwSnSQ8SBYiq2HUVVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69350173"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69350173"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:40:58 -0700
X-CSE-ConnectionGUID: OWvIMGLCQkODLX5vG8dZNg==
X-CSE-MsgGUID: f6mYVk10SWCgRDTRgdDLBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169325330"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:40:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:40:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 03:40:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 03:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZk36yYlq52YaI5CXuHxuJccApm1Fb5P88C765kFa0bAceDUsMdVDcRKV2ijPVMIGFlKI51WMNVbuMD5hB30+Y+lX3XX1b4EA5bnV9+wwaedYzwsUhA6AtFc1oa3epgEpxOmACTf0HbPeSAZqIkxfJQuaclx0K6AOJAFqo+fEh1nbsSuDwHNCKZSiei5V3aqIj17v4JEpuXaZXxhYNuVvRzfWgMNnwKHbxujmKnipaT10UklcI9WcL3s9r1/pDfgNVJmSXmC9Ddv3VTGlVBkJmBZvZpNFQxhZGSmdS3odD1moWkyI/dx1U3LdFCqhuUSftkBghxtVPyy0oPyVUJySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYXs1ZCPhQlmvXVvCBr+hAWGPUKTxrH+NZEHVM9mw7w=;
 b=NHfOCuWxAVP3YabcNQkl2X6MERVynT3vYXz35GbscRf+ATwlNKcTFGHoKCpQB/dJTsVYfjninbXg+aG6sveC2trKsYp/aTg14yR8TA5SNeXdNdiGpwN+sm/2FS0ueg5qySuG7gc5Am5JY5zBWrlExav8t+7sBXXbxcGy4eG4y+mzJ8RMXdQEKNJrt9T0k8pbJQbeUdQ/IZyv+prAkgtg728hkw8Q1zUiDEPK+cOq/NvAtyiY/5PqpJIOwkjV1Sj1P1AxbHep7jZiivkRt9OmmLMhdivez+tiQ+GPmIFzklUNwM/hPwFz05AeqSF4phD3zUA51fTaKxFSso5/T+IQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA3PR11MB7980.namprd11.prod.outlook.com
 (2603:10b6:806:2fc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 10:40:50 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 10:40:50 +0000
Message-ID: <64cec606-32d8-41a8-aeff-c7e3b1a6d8e2@intel.com>
Date: Thu, 28 Aug 2025 16:10:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe/svm: Consult madvise preferred location in
 prefetch
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
References: <aLAvqguScFljSZaW@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aLAvqguScFljSZaW@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA3PR11MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e2a148-e668-4364-d558-08dde61f5aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1Fnb2xSY2NXWnhwQ0RFeXVYMDUvSXlDcjlDUDRjOGp2clduU1ptbTNlMmpo?=
 =?utf-8?B?WDIrZlg4ZWw0TTNaemNLSmJyZ1NXaEVvVWxHTk1mMW5YbElnc1N3THdUTUZZ?=
 =?utf-8?B?empHVXFFZG9kWXFZME1aanc2WnRTWUlxSVVhSkx0UDBwS0FQRHVzaHR4MjZk?=
 =?utf-8?B?WDZJUEV0RjlBbUlWckZ0L1lrQmtpaTY0b243S0VkNGVuWEN5VjlEenFJU2RM?=
 =?utf-8?B?WngrdEN6SS92TUpsV21JeU5DdkN0THVaQUU3YmhqVWRvZDBsL2FnTGhQaFRQ?=
 =?utf-8?B?dFlHeWt4Vnp6aEVmK3JKVUtuTi9zYXNxbXJTbnhzT2x5c0pXd0hPVEJ6MHdo?=
 =?utf-8?B?clN1MWFPYXhRSDNFbDJmTElFNVhZck1wL3VjZ2RSakZab29meDJhS2czUHR5?=
 =?utf-8?B?U0RWVXI4ekNIZnFONm5uSnFKMEk5QVQ2YVd4LzNjVFhTZUFWdjRQcTB2UFg4?=
 =?utf-8?B?UkF2Y0tGWE5QVXhQSi9WRmpVUncyc2JGT1RBWDVhdWVpQmdUdjBCMldHVHZQ?=
 =?utf-8?B?U091Ky9KaU9FRG9JOGo4dklKTkpOSEl2NzZEVGRVUWREZi9QZi83MjNBQ0tL?=
 =?utf-8?B?alc3QjB4NVYzalc5WS9KU3FxS3lJaFRrNXYrQldiNVNCbUZGdldEK290Zm1s?=
 =?utf-8?B?N0R5OXBkblpyMkhJWnYwUHpXUkY5dTl1ZUE1Y2NHTmhuNk5mSHVSc21aTkhj?=
 =?utf-8?B?RGdaUDJRYy94Tk9Zb3F6NGhVWFZPS28vUjhPOEZra0ZzdG1uc1JBS0x5RVRa?=
 =?utf-8?B?RGt4eTNUYzRybXBNRGZQZy83dVRuR1RYM1hRQjR5ak9pR0JqcEtTM0hOeC9S?=
 =?utf-8?B?ajN1dUVxR2pERklWajNnYy9aekdLdVMvM0RVUGJMT0pSMFBUSVRTRXk2dVhM?=
 =?utf-8?B?anVwYURhaE9FejJXdktERU5CbjBGMGsyMVgyczY5Z1hublQrUGdzaW5lNUdE?=
 =?utf-8?B?V0V3N0p5dFIvRit6V1VNVEF5K1J2ZTRGWE1nT21LejFKRHBYTGR4NTV2aUxG?=
 =?utf-8?B?MmZXK2tNeVFiMm1GbkY0U1g2emJIV09ORnlkZkdXSWhDTzVlS0lzSDJ0N0Ex?=
 =?utf-8?B?ZXRvdXVWbm5uK3F3WkdqMkErS3p6aVJjWGd5aVdZejJXRFpzakpuT09GMk5N?=
 =?utf-8?B?VmtaTFFlaDdRNExSbFpRSlVwcnl6NllWTnU4dkhtdmpPaUdzWHJ6SGtLaThX?=
 =?utf-8?B?Nks2bW50QVB2NUpkMlNZd0Z0bW0wcWtkTkVGYWZHUkZRcGhDdURKMEVOb3dC?=
 =?utf-8?B?eDFZQ0VRazM1dDdZdDNxSHdnNmVOWWlpTC9reEJuc1BFSnJDdjlTYU9ia21r?=
 =?utf-8?B?cXVERmNZd3VUS0dVUThiVmJ6NEJ1M2h4Wm8rRDM4aWRkZVpHcEdTd3daV1JN?=
 =?utf-8?B?WHNWQlRXV3l5Qm5IM1pUdzVwMC9ZK2VoSzdLWk0zc2tRWVJrRnZsWW1oaU93?=
 =?utf-8?B?NlFabG5WaGdHNTVqQmdWRGhoZzQ1N3dNTTFFSDU1QnVqSGZ1Y05hMXpxc0JP?=
 =?utf-8?B?Rlh5MTJ0Q2Y5RnViUzIxeUNYVERWSWNmRWhpczA0djlONXJvbit2bUpTMjNy?=
 =?utf-8?B?c2ROU2FoMkMyMlE0SzJCR3BkMDUyaTU0Vm92WmdsRlZSemNVQzZYWFBvWW9R?=
 =?utf-8?B?UmpKZXRPTEUrZ0xTMk9kdkdtVVdPbmZoWk9yeTZYeXdpQ3M5VXNBc0FlUktP?=
 =?utf-8?B?cko2VHU0bjVnSjNFcXB6Y2hDRlZYL1BpOWJkMFhUQS9JWlJtRFAvYTVvWU1N?=
 =?utf-8?B?eEFGaFpiTEdUcHZTc0ZrRVdrV1dQZUY3Q0t5NEIwMmtOU0Z6Vy9MemJuSHk2?=
 =?utf-8?B?eEdUaHdrbWYrUkwzZEtGYk1PUFpyb2lDS3Z5WmZGR083czFGK3FpSFlMZTFX?=
 =?utf-8?B?d01ERE5VMGJsWi8rOVZzb0l0ZzB2UlR5ZHpVaUJMdXV2aXBla2QzbzVqWW5x?=
 =?utf-8?Q?UNrYn5TvcUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9uUExpUGptVmlqaXpoY3J6TlU4OC9OWVc4eGhqdjFCcHo5dnFyMEZqQ2pU?=
 =?utf-8?B?ZFJKOFNmc05CUlZ0U3NLNEVkY3lEbEl0WU1xc000b3VSWmFqNkpvOTBzM2wx?=
 =?utf-8?B?b01OdnVVZzlOTnpiZG5JeThDSU5lbm9LMUp0YmZNZllpKzErNXBHS2txTlJU?=
 =?utf-8?B?U0x5V2hmNDE2WnFmZ25la09jODdoUy9LaGFBN1hHTWVSRXlmYmUwdjJMM1E0?=
 =?utf-8?B?eGYycnRBWGtwWnI0bmdTYmNENmRuVm5CM3ZtdzZIaTd3WW9SN3llVW1ZQjd1?=
 =?utf-8?B?QllwSml1TGxCdTFSdkNMaWhnZ21KSkIwQklWTzUrTFh3SVZpdzR3Z2dadjMw?=
 =?utf-8?B?Z1Fqc3RTZjNZYXprKzI2SEE4bDluK2trM1llRHdTK2M1UUkrYkg4TWJ1aDho?=
 =?utf-8?B?OTNrOWFSSUNYS05CNGh3Um5iRjBrSEpWRG9aNmNYYVc0ZWs2WXRGV0wySUhz?=
 =?utf-8?B?L2J0YjA2Q2pJSFBlbzdINU5NMy8yanZsU0JYaENEY3JrMXAvcEZnWkcxbGIz?=
 =?utf-8?B?L2hOZmNrcEtGSXU5R3oxOVpZbjd5SnJPaWl4WTZSdkd6Q0RjcTdsSXpOcEx0?=
 =?utf-8?B?ZEwxWU1oZWp1bWc2QVdJeWpUNjdNZTVieC9kOGZzTHowbndwL09kc1AxN1cz?=
 =?utf-8?B?SFc0RytUZ3NjaGlWQlJXdkJ2R2hEL1p0enFLbkZkbzR3UW5NMmJyWms3QlNE?=
 =?utf-8?B?SFU1ZW1mUkRNVDFhWktQTjVwRFdtVXpqYjlndmxiT1c2SHVFR2hKVlgxVUhh?=
 =?utf-8?B?RWpPRGhOeHFQbFBNZ3Yxc2RUcTRKaUF1SWRsZnNCMlAyM1lxa3JOZVV0YUo1?=
 =?utf-8?B?a1RZWEZMVXc1NjY5Mk5QMDJkU1o4SFVDUmlQRXpCc2kvcnVEcXA3c1BCcmRh?=
 =?utf-8?B?d1BjV3ZuTjd0ZzI0K09XRUNFUnZ4WXdiVXBCb0tWdmpSTlgxbCs1SkFaMW9Z?=
 =?utf-8?B?VXlJUVBWOHdoYXR1OGcyR2kyd2w2OWd2UEcvUDVrUm9KQ29lOEl0ck96OXlO?=
 =?utf-8?B?UkhsVmdBcmxTQ1JvNDh5TzgyVStSa2RDcEttQ3J3NDd1dUtjQ0gwcHRHb1hl?=
 =?utf-8?B?QUpvRmo1TTYvNjZTbVRybFU2cnBkVWtVeFNCcnBTTEZrRkVraDFDb016OXZa?=
 =?utf-8?B?bUdoaTVRaW1IMFdUNis2VzA5Wis1ZWZWY2hqbDVZQnRmYUcyRjNYVnByNVQz?=
 =?utf-8?B?aVRTZXJxU1FaMnBoL21aZDF5VUpoTTEzUmlEaEtjZkxlRE9DV1YySTZIcmJG?=
 =?utf-8?B?VUM4YlJkaVlnTHdnV0twMnBlYVh6aHZvQ3lrTWord05GK2NBdHNkYmExblFV?=
 =?utf-8?B?MmxJWHk3aEFzQ0s3aXUxWU1DeXRHWXRFVXd5NVJXZFlGMFYxV2hKMW96U1V4?=
 =?utf-8?B?bXBpQnBNaHlaMmpzakZrMnYxaGQra1g4RndtTjBYd0lWYjZkTFF4a01ZWitX?=
 =?utf-8?B?T3lZcEtwK0JxWHI0MURKZWFTS2RtT3VxQlBPL29HbHcrbW1OZXU5Q1puTFVT?=
 =?utf-8?B?SldSRUNrQm9veU9mQmcwQXBvSURvck05N0gvWmpGUE5LWmxXdGFLd2RhV294?=
 =?utf-8?B?YUs5cTIrN25oazBvMGVqa25kNXF6V3g1ODd6aVl5YVJqM2FOTFB2WG5UMjJy?=
 =?utf-8?B?Nm9GK3JhN0E2RDhDWG42Nnk3ZUVDb2JFVFVUNXhhcVc0bE1KWjArVU5VcDV0?=
 =?utf-8?B?YzhRZjFJR29HZkg0R0tkdVZYS3JOVXZjb2VZcVdhS0d0WUxiVlRYVUlQVHVl?=
 =?utf-8?B?cnZoUDlEMFd3aXdaZ3hsVVo2c3kxaWozUU9YZUVzSm5sWHNTbmNvVi9Bekhz?=
 =?utf-8?B?Q0tVYXcyRlhnRDFOZFBBZ29UOEQ5dTNhTlRCMm0rUW5EVlo0S1VwalE0MGhz?=
 =?utf-8?B?Z3VxTHJOZUdkcHBTVzY0SGJPYld2U29ZdFJOaXQ2UElqdHZldWw3TE1ZdGxI?=
 =?utf-8?B?a0xhVHZJcXU5UGpwSGtXaGc4cHFPQmRaczZsYk5Wc3VKK2pvdy96ZDNqWUxE?=
 =?utf-8?B?UEpCMFJmNUtyQzllZ2pMbUNKK0Z2d0FoRitTUkdacGxwVFRSZXpHRUJmR3F4?=
 =?utf-8?B?ZWhrZ0RIZ2NPVUJML2JmYXFLbTJVY1FlakNCSURKVlppRHVkcnJtQjVhOWY0?=
 =?utf-8?B?TmFXWElsUXJad0dmeVdHWi9EWkJuWUdxUUpzSXVlT0FMb0ozSzgrVVB1MTNI?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e2a148-e668-4364-d558-08dde61f5aec
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:40:50.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB69rd3ce1HOvW6B9fBr8+ncK0HObflZO9kYVnl56uijEXf+lYSYjDucu35zwTofIVvxM3srBAMz/Nsi1oFOudPpSUDOI3ZSMl8yzsKD+Oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
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



On 28-08-2025 16:00, Dan Carpenter wrote:
> Hello Himal Prasad Ghimiray,
> 
> Commit c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location
> in prefetch") from Aug 21, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/xe/xe_vm.c:3175 op_lock_and_prep()
> 	error: uninitialized symbol 'region'.
> 
> drivers/gpu/drm/xe/xe_vm.c
>      3125 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>      3126                             struct xe_vma_op *op)
>      3127 {
>      3128         int err = 0;
>      3129
>      3130         switch (op->base.op) {
>      3131         case DRM_GPUVA_OP_MAP:
>      3132                 if (!op->map.invalidate_on_bind)
>      3133                         err = vma_lock_and_validate(exec, op->map.vma,
>      3134                                                     !xe_vm_in_fault_mode(vm) ||
>      3135                                                     op->map.immediate);
>      3136                 break;
>      3137         case DRM_GPUVA_OP_REMAP:
>      3138                 err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
>      3139                 if (err)
>      3140                         break;
>      3141
>      3142                 err = vma_lock_and_validate(exec,
>      3143                                             gpuva_to_vma(op->base.remap.unmap->va),
>      3144                                             false);
>      3145                 if (!err && op->remap.prev)
>      3146                         err = vma_lock_and_validate(exec, op->remap.prev, true);
>      3147                 if (!err && op->remap.next)
>      3148                         err = vma_lock_and_validate(exec, op->remap.next, true);
>      3149                 break;
>      3150         case DRM_GPUVA_OP_UNMAP:
>      3151                 err = check_ufence(gpuva_to_vma(op->base.unmap.va));
>      3152                 if (err)
>      3153                         break;
>      3154
>      3155                 err = vma_lock_and_validate(exec,
>      3156                                             gpuva_to_vma(op->base.unmap.va),
>      3157                                             false);
>      3158                 break;
>      3159         case DRM_GPUVA_OP_PREFETCH:
>      3160         {
>      3161                 struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>      3162                 u32 region;
>      3163
>      3164                 if (!xe_vma_is_cpu_addr_mirror(vma)) {
>      3165                         region = op->prefetch.region;
>      3166                         xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
>      3167                                   region <= ARRAY_SIZE(region_to_mem_type));
>      3168                 }
> 
> region used to be initialized on the else path as well, but now it's not.
> 
>      3169
>      3170                 err = vma_lock_and_validate(exec,
>      3171                                             gpuva_to_vma(op->base.prefetch.va),
>      3172                                             false);
>      3173                 if (!err && !xe_vma_has_no_bo(vma))

This condition can only be reached if (!xe_vma_is_cpu_addr_mirror(vma)) 
is true hence region is always set here.

can be marked false error.

>      3174                         err = xe_bo_migrate(xe_vma_bo(vma),
> --> 3175                                             region_to_mem_type[region]);
>      3176                 break;
>      3177         }
>      3178         default:
>      3179                 drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>      3180         }
>      3181
>      3182         return err;
>      3183 }
> 
> regards,
> dan carpenter

