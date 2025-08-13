Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AF0CA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 11:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495DF10E6F8;
	Wed, 13 Aug 2025 11:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSSo/R3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BA110E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755083007; x=1786619007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yof43Q/q6qGr8uPNhrqVuK29QZdedkZMoHi1oKWeg1k=;
 b=lSSo/R3z86iqmr2NH4+d8L8s70YeHQ0eDXwT62BDnthleiQ4dpZ11hN/
 MiMflnJM42dI62PFqNL01JQy+SwffxYsPOFqyyIjzUGySiEsZFFZjLtkG
 NNWw2zdvkASBLhXryRHBCdj4Ya1dtNTmq+LE8KsACeKps+q21Q0gxzXv7
 gxD96HVuDshCtGFp4WLm4bBKr2ZSqauuweOEz3YcF+6y2BWdEEQGvlD97
 c5hsxo/8WBc7SI20aMZ26PASVervtQplcrCx2d+hqzZ+ctPMUvDYqp4nf
 VeZUC+Sjrn1M2Qk19hisWSMk3XSFUnGZUJbRLRd4gFrmoXvqsesuaD8hr g==;
X-CSE-ConnectionGUID: 82NgMYH0SmaHqYyOC9TuWQ==
X-CSE-MsgGUID: DNRX6iQZTzCay1to9w15HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57241192"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57241192"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:03:26 -0700
X-CSE-ConnectionGUID: WkdNT0ASQI6Y5Wdhk9LQtA==
X-CSE-MsgGUID: 4LXldg81SiO7bcxG8BS8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166815890"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 04:03:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 04:03:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 04:03:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 13 Aug 2025 04:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OG1hvQUwbJWfThngXnO452dqgppoak143r5GsdnB/BeojezBSzZcUHcDzB4TKeKwa7Ew+yUFpr/ROruRHB51pIjQTCPMOvWo2yHoOWYro6EtihKUPVHhYfAQTxG0s3MViaJYrCfv9hOtKTAZIoVV3VWrjNkSiW1eXYx41+K2NKAlOUjIbPsJRwTfR+ur8pGoG72lxW0e03X/IgW/PRO9zgnZNzc0Y5aS7ho4TMflbkmuppJpXoq69TMJVDK7gbsA0HldlmwYia6X6SgzhBt9c5UOsYwjrlqv/wLJ/uVcIBL/hcdJ/sV/xS1Fs+u5rDQuvCR6OZI7gVB2Hf63VuSXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgeLh+Kis5vgrHxVXeGUE27RA4B2erHSMggsX/p2wKM=;
 b=dVo9xjtQp6LSr+xqRj3ecLZM/9ddFMSTTXXZ543RzsFZLKyj0rgiYJoU6bX5/OO1an12AQw0zpdb4hBg/rh/kXxnG0Ngdi3o88AqC/aD+WHlUasSPf2UzY7NgNR55MkvJtrNZEMJU4vQxOQWq0oagEK1ruYzS22ZyEpM1PlYTEvwAE3y0JWnVPnOq7PHppIoOD+zCGv5gMQC9TF9zAKna0XxhHF39UejRClXbD0IYGJaC6yioxjZSRtgRpxsLN5zPppjjkSumjmA8vbhIz1zH/5JaGkdkLwxB6rqfCN6yK/rlE8lfFsGXXW/O+1QEUTc6YjJduK93/KbSOeg2KTFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPFEC87B8781.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 11:03:23 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 11:03:23 +0000
Message-ID: <c76bbc10-507e-4f6f-b559-30f1bf924806@intel.com>
Date: Wed, 13 Aug 2025 16:33:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] drm/xe/configfs: Block runtime attribute changes
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-9-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250808-psmi-v3-9-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPFEC87B8781:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4ca304-7c66-4d17-c9b6-08ddda5904ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFdQSmFJQ0ZjTFcyMXhBUEZUYm9zN0RXZmp5eE5oTXlPaklpQzJhazR2MEN1?=
 =?utf-8?B?Q2JPRGhzS1lCVlVnam44WWYvN2J1Z2l3UExXOUdLcmtHOXZaTlJWWXV2WFdl?=
 =?utf-8?B?ZWRKQTZuYVFsVnpMYkd0SGpJT1JTT3F4WGRhZGxPeUZuTVdCM0N3SE9zalNt?=
 =?utf-8?B?L013eHNTZWd3UUJIdllEc3Fnblc0dFgyVkNlNm5mblpkZ1lTYVh6SGZuQ3NV?=
 =?utf-8?B?dzJMTXFBaktZRmdGcFlTSXJDbzZwK04yRllkQVc3bEljRDd2V0ZiNFhYdGZE?=
 =?utf-8?B?ZlN4ZnoxTGtlUjd5K004ZUZsdlZnZFJvSXoyTk5INGxheGE2eW9hSmJrRU91?=
 =?utf-8?B?dW95WVI4akI5YnpTODl5UXQyb3psT1ZQMnFqUWlBL2N1ckpUaXZZTnhkc2ZY?=
 =?utf-8?B?S2FxL054a2V6S0tVNm1yL1ZTR01SdWN0UXhlS2p3NVZlbGllMUx2Q2szODgv?=
 =?utf-8?B?TDBBaEZ0eHFHUmtLTkJ3UnNQZnlzd3d6Zm51ZXBCa3VoUFJuclgxMlE5OXpm?=
 =?utf-8?B?dlBnL1M2eVpibjhicDBJcVY3bCs0UXVqM2ZVZlJOaTRQbC9TZVMvZFJMdjE0?=
 =?utf-8?B?MlhpdkRXTGJqa3dwNGtkYkI2cVUvbVdSVkR1TnhjSEtsbVFYSEsvVzZQeUI4?=
 =?utf-8?B?ZHJqcTQxY0pxbzl1b3ozSWdadXpOcmhDS3A5UVRlNENHbmNSaHFBVXJLbEUv?=
 =?utf-8?B?QjRkaUs0QVoyZ1AyU3psNlpsMWRhTk9VQWFlUzhDTWZ2RlpKQkRJaTVGb0J1?=
 =?utf-8?B?Y242ZXpJZ2M5VkdZbmZjZGw3azYxcnNpcEJJTmc0VVRyRC9FY1FnNzlYTlpu?=
 =?utf-8?B?ZUZMaG9qR2RKakV5R2NDeFl3aTdyaGZMZ3ArM00yL0RpTjZ1OGxKZktQZTJD?=
 =?utf-8?B?NmNhY1JmYkMrM3F6OFVLWS94YURWOGtsNWpGMnhQU1UydVovYUJqcFlqdnE5?=
 =?utf-8?B?ZlZBMDRpTHZBdkJlWW9kRWo0ZWlKTlBubHVGOWt1RGQ3Y3dFSmp2Tk13Wk9t?=
 =?utf-8?B?ZERCUmJ4cS84UFQ2MFdnN0ZVcGZQWlVPbWVzbHZBbFR2b0VPekVkbjVWOXk5?=
 =?utf-8?B?NWVIVnNYZDgrZXZrV3hVczRBOUZreURYOFdJQnFKT3k0TUpRekV5TkdTU2RN?=
 =?utf-8?B?TWx0NHFUSDNLRzhRTU9uS3UrbnJQb2lZREhKdUxwdGhKZk5xTDJKNmJTVUVs?=
 =?utf-8?B?VnpCeVArRlJXdnA5a200SHRVeTRvR2tKaHkyekdvaVo0UVp0ZHRLOUhRTlc1?=
 =?utf-8?B?UEk4MlFrQlM2N3hPcU9aWEJTaDV4NThNeDhUMVp6L0NvcTFPemEzYklxM2hV?=
 =?utf-8?B?Q0QreXl2clliTGMrRktibmNQa2JMeGhvSHpscU44ZkxWTkxXUGd3SkU0ZEpm?=
 =?utf-8?B?WXdqeFF2bUhwMEQ3V0ZEWW1ZdDZEUGhXYnB2UU1PWnJRNlg2c0dFSlJTK210?=
 =?utf-8?B?WU83ZGxZTHV1REtxT1VrOGw0Y2dKcjVMSTJudmJPTU9STkdxa2UxL3lUTHNM?=
 =?utf-8?B?NnlYZmlDNWpxdXlzNGVzS2lRUzdqYVYwZTNXK1JpUnJBM3pxMkwzUFdUR05m?=
 =?utf-8?B?WTFFSnc3MC9yOU1DVWRUSlBQcHd0amdaTngrdnR1UC9TeHgxQllMakdINmtl?=
 =?utf-8?B?bGtFK0plQ1d1bGNXaTVad1FHeUQrNmtZWUsxWEthdEJkQVFuWGROSTR2M1JY?=
 =?utf-8?B?ZWY4UzhubEZzQkorcE11d25uZjVwL2hPZkZEeTN1LzlUUmFzS3Q3WTJ5SWxW?=
 =?utf-8?B?TUhtNXo0Mkp5TWJNRG0wQnZGWk5wUXBKZ0IxZDBtd1Z0TVc2U3ZKU0Y3VkJY?=
 =?utf-8?B?VlBhMThldW5jRlBweDlUMVJZOUtIaE1vWlR5ZFN3dTlPQWM4VndiN1Y1UUhH?=
 =?utf-8?B?TVU5YWlKK2ltTStGWVppUEdwb0U5bmkxaDJQaXBwY2VoTUpSRk1MbXQ0eWdZ?=
 =?utf-8?Q?Da1skmyoo5E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymp6OEw3cTl4MEt0ZVg5dkswUTdPc2RWa0R5S2JnckhPYzNDZTBKd0Zyb2w4?=
 =?utf-8?B?TWkxOE4rdFllZGZqekhrL01sK2dDY3NTc2dHV05VVXpCb2I5aWo2YWU3TXJa?=
 =?utf-8?B?dDJJSGNraXR1U0g5VEVjZGFxS09OelJrcmV6Z1V3RlFxK2l4RFMzRnNGOUhD?=
 =?utf-8?B?dGZTWkIyTUNYNFNlVjdtQVIvU3M4ZjBYd0QwSTJ4d2NGOGQrZk9DMzZ1NGFi?=
 =?utf-8?B?b0lDMVhzVHREeExZMWZQNGRGTDEzYW1vV3NRMC8xT3hVWThBeXFEbjJrMTNq?=
 =?utf-8?B?YmxBemJWUms3OFhiSUFDYXZlUFlXcXl6TE9GL1hKaG9UNXRNYTR6bVpkR3M3?=
 =?utf-8?B?SGs4S2lOSTkwdk4yNDJaTHNidG1SQlNBQnQxcStybnUxckZreWtkSFRQOWFE?=
 =?utf-8?B?RjRBREtONDJmUGhPSmF1UjBmR21qVFo0diszMFVQVlMrRVFHb3ArT1pMRDdT?=
 =?utf-8?B?N05HSTJuMjVtMTRzc3FaWnE5N3djYU9LN2ErbVhSNXB1ZkQ5SmdZYmthVlNY?=
 =?utf-8?B?SnNqSnpXSE8ycnd1ZjVMKzFnZ013ZHRkckhNOUNTRDVVcFpkV3pVT2RUb014?=
 =?utf-8?B?R2xCdm1UYksyQjh6SlNicU01QVNteGFhdXAwbzdZWStZa250ZGFnZ1NXR2xx?=
 =?utf-8?B?Z013ejNRYVlrcGtIYzMzdG5zWFBISjUzNlJxaGNodTZFYndBUVZmQ0NjZXhB?=
 =?utf-8?B?SFNTdW85eU9HbVhJUUZROUREeERHeHZKRGpLLzVpL1dDSmtLbjVPSzlwNkFu?=
 =?utf-8?B?MjVoY25JK09mUVpiMlRoZTFTVWtHZzBNK1lnUERwNmhjMEF0RURmMThtWEc3?=
 =?utf-8?B?cThJSC8zejc0Q0RzVThWZ2xIcXNwdHpQcmZtT2QxQk81NUozWTcvS05rMmha?=
 =?utf-8?B?T2M5UXJvMDhWQUpEVUQvZFhUYU5LcXE1ek5RL1BwNHE3RXpwM0NETjhRREU5?=
 =?utf-8?B?ZDZoUkZrUXNTY2sxdkFwaENRSThmUFJNUTdCVEpYNG1aUWhRamhxSTVYcmhO?=
 =?utf-8?B?L0VEVmI1NzF2OVlCbEZKalgxbzVVY3hXVDByMHVkdVA5RnllTDVHbzZ5SWw3?=
 =?utf-8?B?YW1SNGxJRVo2ckxyZTFCSDVrSFVrMlY3YkFMdnY0OU9xTlY5Q2pob0Z6SExM?=
 =?utf-8?B?WGttTGxkbGFlOWIzVk11ZEIwUGpVMFdRY2NwUnllR1ZuRmNrd0cwT2FSSnMv?=
 =?utf-8?B?b2l1UEFrcVZBMlZ4cWxKWngvUVBuak8ybmFLZXJic3o3eE9EQUg3dXlKbDZW?=
 =?utf-8?B?MkJEdDNENUoxY1ZkUExKWnArRW1OTDhjMXhGUjZ1ZXZPci9VNnYxb0wwam1W?=
 =?utf-8?B?Y3ZjR3pCNGZxY3lyOTZ1QTNkSXRvZVNscTlxQ28xY1J4eWhIVXpXdnEwdnZv?=
 =?utf-8?B?TWNTd1p0TGVsRnhsWTZCekZCbU5pYjNodEFZSzdNSWZmYjBQUTdDN3NjaEpS?=
 =?utf-8?B?djVzTlZpWmRkNUV3UHlMLzAvQkRDc3VQOVhMWjJFRHg1aFY1MEVUaG1HUXlW?=
 =?utf-8?B?eGN3TU9RanovNGpFV2NXb3dmVW1xRDM1UmUwY2gwVFB5SEpySWJxdDV2b1da?=
 =?utf-8?B?Zjlxbkk2ZlY2REFieTNzbmFXb2U4aENudWoyaWtCYUY0RDF5UUlzSFhLM1ZD?=
 =?utf-8?B?Z2JFWGJaNU93S2pGdCt5TFlvVnZFZDQvbTJqcmc0VFFINTBZd3RNaEZCeUJL?=
 =?utf-8?B?R21lMHlUWGdzWVRIYUJpdzh1d2Z6WjR0T1kwaHlXaE53ajVkbENjRzlXWmZK?=
 =?utf-8?B?Uzg3Y293QkhUV0ZqcnlqdXlaUGdvc1BjbXN0TGZuWFRBNWRsUDZsd0prMTE4?=
 =?utf-8?B?YlRtanRCVjBoT3B0TkhoVXp4azhHTWJPRE9xeHlYeXBUdy9jVDFTTkgvVGV4?=
 =?utf-8?B?V3pXSUNUQW1jSUtPMFdoMFN2cjNXYWlha0pWaDdYMHNpUG5XZUhOY3VEcGsw?=
 =?utf-8?B?NEp2L0RmcFhzNVp5MzMxbWRobmdsbUR1aUl4YkVTVUdGS0tvUnEvVGp3TWcr?=
 =?utf-8?B?SnJucDFVQmxpL0M2RmJNN0YwOTVwMjhEMVB6L04zb2h1cVVPQjRMZzRabUpn?=
 =?utf-8?B?Wk1jVFVJOE5nc0pHNmVZeVRyVkhnaDVITDhUc3Mra21sd3JwTysyUklZQUQz?=
 =?utf-8?Q?e6+w8jJmSy61AnY6GP22ob2qF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4ca304-7c66-4d17-c9b6-08ddda5904ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:03:22.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQ5xwyOcpoidtTQ5RyVJKQ9X4mZFJYsfW4iDoV5j6b7s3A9bY5xTbOCTluzf/7O1ysGL9GO0szTcsOvtYRXcOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
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



On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
> Although it's possible to change the attributes in runtime, they have no
> effect after the driver is already bound to the device. Check for that
> and return -EBUSY in that case.
> 
> This should help users understand what's going on when the behavior is
> not changing even if the value from the configfs is "right", but it got
> to that state too late.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 4c2d4ff6a70f5..489c5c67001dc 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -54,6 +54,8 @@
>    *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>    *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>    *
> + * This attribute can only be set before binding to the device.
> + *
>    * Allowed engines:
>    * ----------------
>    *
> @@ -78,6 +80,8 @@
>    * available for migrations, but it's disabled. This is intended for debugging
>    * purposes only.
>    *
> + * This attribute can only be set before binding to the device.
> + *
>    * PSMI
>    * ----
>    *
> @@ -88,6 +92,8 @@
>    *
>    *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
>    *
> + * This attribute can only be set before binding to the device.
> + *
>    * Remove devices
>    * ==============
>    *
> @@ -148,6 +154,29 @@ static struct xe_config_device *to_xe_config_device(struct config_item *item)
>   	return &to_xe_config_group_device(item)->config;
>   }
>   
> +static bool is_bound(struct xe_config_group_device *dev)
> +{
> +	unsigned int domain, bus, slot, function;
> +	struct pci_dev *pdev;
> +	const char *name;
> +	bool ret;
> +
> +	lockdep_assert_held(&dev->lock);
> +
> +	name = dev->group.cg_item.ci_name;
> +	if (sscanf(name, "%x:%x:%x.%x", &domain, &bus, &slot, &function) != 4)
> +		return false;
> +
> +	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> +	if (!pdev)
> +		return false;
> +
> +	ret = pci_get_drvdata(pdev);
> +	pci_dev_put(pdev);

It would be useful to have a dbg log here to inform users about the 
expectation if device is bound

With that
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> +
> +	return ret;
> +}
> +
>   static ssize_t survivability_mode_show(struct config_item *item, char *page)
>   {
>   	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -166,6 +195,9 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>   		return ret;
>   
>   	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
>   	dev->config.survivability_mode = survivability_mode;
>   
>   	return len;
> @@ -249,6 +281,9 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>   	}
>   
>   	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
>   	dev->config.engines_allowed = val;
>   
>   	return len;
> @@ -272,6 +307,9 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>   		return ret;
>   
>   	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
>   	dev->config.enable_psmi = val;
>   
>   	return len;
> 

