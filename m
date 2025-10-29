Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8376CCCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5710E839;
	Wed, 29 Oct 2025 20:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8rZoBN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1910E839
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761770247; x=1793306247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jVpUKy6sqxBDBcTKWqhQVu9CJqyL1S9IArGYn0MGgyY=;
 b=B8rZoBN3tFsSyL2jMy8+uFT/MpTMZPeN/hlW0bD1Bhivf7Oswk86++q2
 vmdZcZ5FeBiYKcWI2K3bwDiCoPc/KiXvc/3WL0A9sGESm3gpinAUaOiHD
 Xj1gqHFmlCze9BGCf7Fj2cMGEGwIaTG6Y9ImgqY7YlmnHaGFQu2/qOgeX
 6lCZKluhvrvizuq+8oEBI4sNdvAP8flWUJXaIEq5sOoIPz0ru0hlJR8tW
 xtyimbmOFkhemXTOIA00vHAgbwbsaMYG0hWP/XPrmQ7/K9MAj4YlF5NJH
 YfmVHS9tvWjyOCV59uSLmKQ+u5591KWX3QYh0ybJ46TPjqtHK1AMN3dNu Q==;
X-CSE-ConnectionGUID: QRGmnd3gTSi2haefLq3WZg==
X-CSE-MsgGUID: hodj13lbQdONzGmhLPg93Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75249017"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="75249017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:37:21 -0700
X-CSE-ConnectionGUID: Bf9vSLfpRv+UaaJltbtBxw==
X-CSE-MsgGUID: xUHIAwvESlCCPXuSRGmiNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185849321"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:37:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:37:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:37:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:37:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBT/yj9z6ZjP/l43nziN42QMK+c+ofPLMZ205dntjE8eqKn18RSDdwvSbW+jIvvXFvqwIMH3/rahAtQNh3YhXjxKbLzQq4/mW3gNkSB51L+mxAGMX4ZAB+0U1w4bVfLtgVFVF1Zo4v5yhMqF6u7+8lOHcMBDwjRzWkTEBC1NFADfLWGzrDEUpOH5/V2Kx8kjqCXTD9aIx22WRHeIxgLOjl7j749t0SA0CJKMYwH0LqduVJDZa4fWJCR+zSTALb1D/N5Vl7TGLIIJuTA6BN8LMal33vqg3PYeChi9Dd6knQLdn56lCaUyJtB4jR8yEymxmCxj+c6m1uipJnjxceMuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEhrI+M6VVSprX0fBs0g1C20lCv1/uYRRKBs2ncoc/U=;
 b=Stc7piA+UwiyAwy5JbWMWoqcMA6lfYdAb3EfN6pdkJqI2CvNAs5W4DHjt2fSTOIPIjfJa427f97f1SaEdGuNVUIlo9WtRSGtVXqWlLUvKPpqdqABlMsa2q8oGtCzeOhd3OFIjkmaHsIPz++h4+4U0YS+WW2iaaRwaOoEsPwF/kYoLHWbiBIWlBvhaSLDLlO/sRmZZ9JcAbCAsIUyIVZD5s1F5fWwX7uYo348aBjV9mkeGBWHSmryZiF7YBJZGH98V2j4EDpi/H0pBkj9zsxI1z/l7k9dP6j4sgpDT8EABUflyotBrj6YcyoFPwmC9thdQA5fW3BRhj3SgZEMVhAQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 20:37:17 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 20:37:15 +0000
Message-ID: <696c7127-84e0-420f-8ee1-72b7a64492e7@intel.com>
Date: Wed, 29 Oct 2025 13:37:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com> <aQJXIw7zBBy38Dhi@intel.com>
 <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
 <984175e33b6669dd3db02cc306465c51f196f314.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <984175e33b6669dd3db02cc306465c51f196f314.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a07eba-785a-45c7-b3b3-08de172af208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnpCNFhvblZ2TnFZcmh6SG1QWXgxczRWcnF5eTNLSzV2eDViRzEzckxnbHkr?=
 =?utf-8?B?ZDRrUmIwN3JicWZ6ckF0WmZDQ2RYbmFvYzNUbEhXRlpLaFcvc0Z3RXo2QzFH?=
 =?utf-8?B?cGFTZlN5REZRWVI0RXRjL2JoRUZtRFZudVh4TUsxSE81WU9xcnhjWjNyc25n?=
 =?utf-8?B?MWkraGpNVW80YWVCOGVUbSs5VkVVcXN1ZVNTeWJoam9zblZjQ1piSSt0dWJz?=
 =?utf-8?B?WW1ZL2xQSVBWYkpSdDl3RkRkRVUzTm1mL0ppdk0ydmRWcUV0N0dIeXRiM3FP?=
 =?utf-8?B?a1VWVE03R2lUSWZGRVBkcDdmRS80SG1HQVo0ZEdmQUxmMjBrbDZWL2s3TmFk?=
 =?utf-8?B?aVFlanpFYzdyRFBOc2hQa3BiZ2VNSWVnWUN3NENYend2UmNIbVZxbytLV1lD?=
 =?utf-8?B?bU5hRVJWTE1ETVNOWWNEdHJKUG9pVVlmNkZRSGRVU0JXQzdoZ0xIRzhOL3Rp?=
 =?utf-8?B?TnNTampWOGF2cmM1VFV2WGxiRG93R0tGbXArcGpYRkNwVEF5UlhEMU94NmJC?=
 =?utf-8?B?bVBYUGxhZ1NtQytGcUJCVkNIRzBma2dMaGsvVDloamp6TnFQWVBMbHFBVVFS?=
 =?utf-8?B?K1ljL2NmYU5CYXM3UTl3cGp1cXdKWm10eDhrS1lUZ280Q3NLWGhOSjgvSEc1?=
 =?utf-8?B?MWlVV3RoSGYrWjlXSGlBWlJUT1ExcU5Sd1RnSS9HbzlmRlc3a2RWaUs1eEJO?=
 =?utf-8?B?MUxiUGpPNzRGRVgvQklCN0VpclBNU3ZkbVY5Qy81Wk9IUWlZNjlZYzR3VTFH?=
 =?utf-8?B?K01YdERLRDRoeVRKSFVGRDMveFpOV3pMRU9OaE9DUk9zVTZOWW5pWThHRm1P?=
 =?utf-8?B?d3BJNHV5VTRaZVdhd0JVN0xVMjN0QUp6OXdlekFEKzhzMjkwY3ErbG9Odlh0?=
 =?utf-8?B?TXVqNEU4NHZ2bXVpRHpGekZRV2lRL2xZTjcvckNGaEdYemxUdFBIa1pHSTZ5?=
 =?utf-8?B?R0h2VWlKUythUmV0VXBIYXpET0FZZkRTZDh3Sm9aM1ZieGZpUG1nZW4ySzR0?=
 =?utf-8?B?M1BNL1FQTG5SMjBIMCtjVHV0Sk9JaTduVlNOeDRkMHp5OFB0NkRkeVBYaGhB?=
 =?utf-8?B?ZHVweGwrdWhMK2tWYWl2VXVkbTZYSGh6Qk1uaVdTaXQ2N0x4eEFBN3hZRnFR?=
 =?utf-8?B?LzBSRjRqaXh4cGd1L1kyZHhqTXZWYmFFbFBmRURvV2ZjMkpsL1F0OWQvakJW?=
 =?utf-8?B?emVGc3orMVBYZWcyUUxDRmZzdlpsRzAzb1U4STZ4NFNwN0VzZzJDT05SeXlL?=
 =?utf-8?B?SkRqYlBtOElRbzNvR0hNWXZ5SUtnUmxaclVuQU16bW5wVmRBVGR5bHBlbXlQ?=
 =?utf-8?B?V0Z2K1ZHWFV0cUQxRm9NT3VLSmI3RnZiY3hwYVFHNFVObEE2T3JlNDZUTEMz?=
 =?utf-8?B?US9FdSs1a3ZEOGYwTlhaYmdaaEhIRGdaS0t3OXFsZ1VqaUllWUk3b0FzazEw?=
 =?utf-8?B?V08yT1Q5aXo4YkdKRDZIcXN3TTRVMjJCNzE2MTVsbHdLazlueFo5b1N6ZjB4?=
 =?utf-8?B?d0Y3RmJxeUtLZHFBRmZwb3lWSC8zTnNoVVdscG1ZM1VCdDk5azhnY0hhUFV0?=
 =?utf-8?B?bTdYWXNVUG1pTjlteE04ajBvKzBTek1vNTZkSW1sc05VRlVOUFRKZFo2RUIy?=
 =?utf-8?B?VktNaUZ1a3I0dU95YXB6RUJFanJoNmpETU5IbTJjOVpvU0Y1NG5sdjBkNlNj?=
 =?utf-8?B?R3lmNjVia1VrYnM3UTlha0ZxWTkzbEpMOUpjZEZRRGNFWmllZHlVSk92Nkgx?=
 =?utf-8?B?a3dZdHV5aWh6T2lxUXVzeFhHZGRIaVBrcmZkQ3FhdlFyQTZYN1k3RWJiTG8v?=
 =?utf-8?B?dXNhUGtJWWcrNzhKL3pNRFNNVVZ4cHlsWWIwRlJFNkxVcnZON3pQdi9Lb0lT?=
 =?utf-8?B?VzEvYWlRdDNhMTVLRldnbVRwNlYrUnNHdENaY29TM2w0Umc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdnRlAzUGphTThHMUFTa2NsdlJSdkprSFZpKzk4anRIS1owb0pqZFNhSTZR?=
 =?utf-8?B?TUliNTlqNm5LVVAyT2ZiT1BIdEJzMjJRbGVzVVgrSmZDVE5mZ3BvQlpYWU5J?=
 =?utf-8?B?MTJ0eU4vRVBiOS8xT3UvQXR1TlA4N2lqNEdoV0JpM1RMWVp3NlFwMnBSdmlP?=
 =?utf-8?B?dk5NVnRoRkU4STFsc29qc1Z4OW12RUFEOUtMRjdyQ3JBSHlTdHd3ZUpaTFhW?=
 =?utf-8?B?U2dhK2RLQWZDWEVVOUFtOFhkdFNhU3NwK29QNnNVZHlIamdaaEhhUDF4R1Fw?=
 =?utf-8?B?Y3pNai9PU1AxdUxiWUM1UUdGUCt0MTBQT21OdnJBb0txaFlzZlMxNDVYNXFU?=
 =?utf-8?B?UTE1TmtTMlFpakhySnViRHYwaWZEckJJSjgrOHhURFp5c3dObVJwVEZmUm0z?=
 =?utf-8?B?Sm13THNDNXpacGlhdnEzMGNKbTcrMk1vUDhnT0xTMU9aclg1VzdKcVNFQkRX?=
 =?utf-8?B?WWtoRG5xRFVvQ1BjT1RiNWV3R3N4eVVSU0EyZE5sOTBkS29mVGd0OEh3NUg0?=
 =?utf-8?B?ZEZKVDBhbjhDT21NMElYMGZaL2R6SUNMZEJVMU90NWJRVm5PbmxTb1VnMFpP?=
 =?utf-8?B?cjAyVmpZai9BRGpYbkZjdmozbW9vSmtib3hWVWlXLzRackJ0c090dkNHbjk1?=
 =?utf-8?B?ckFNazJtTU5jOWRLbCtDdXdSSXg0M2NmeWx3ZFlUQTJHejNRZWRMeE5oVGUw?=
 =?utf-8?B?ekNaVlpPM0JsRWNWeUEyNENYWFh5RmpHeElKaDRsQk45cXdZbTZjUjFXTm42?=
 =?utf-8?B?UzU4QWxMRnc1LzZJT3VBVE5yUm1hYkNOUlpMcEhLa1FxQTQ2ZEJFTVZvTEpz?=
 =?utf-8?B?cUhMdVROTFNxVCt2NG1FVlUycDRoQVFHUFYxVVpBTXNwQ2VKeVl6QXA0dG0r?=
 =?utf-8?B?Q3RsdzN6aytUM2RVSW9GTlAvZ25JQU5FUmFYdkhmcVVhT29ka2E1L2krL0RF?=
 =?utf-8?B?NU1VbmdpcjVFUGlmelFyQXV5aTFuRmJVYnhZMUJybGg4Qkx5MlZsUnNqWnVS?=
 =?utf-8?B?VlE0OWRCOUZIenMveWFpbzhUaVdJczlyUWRYa2l2MUZpaWJlL2hDckdrZm14?=
 =?utf-8?B?MjYrL0hCaURLQXdLeEgvNlZUNXU4UzVKVU0xZ0x4WXBpV1JWNUZWcmtEU3d1?=
 =?utf-8?B?TGJ4VC9pS3E1WFhuR2k2Y25ycSt5enlZNmxWekowUDdnSy9UbWhnVVZNSjBP?=
 =?utf-8?B?RU9KWEJhM1pldkxiT0o4dzRXdlQ1Z1Nxc1JnWWZPUnZ0WWhhLzEwRGpGVk8z?=
 =?utf-8?B?aFptUndpeTBDalR4TWwwL0FWODZJZmtSekhHV2FGUzdJYjhDU1VhRmtXbCtJ?=
 =?utf-8?B?YmZSVCtGaHNBZDUrMS9iNXBrTWlKd3Y4WXJENTFCSGdiMk9maXlKTExrRit1?=
 =?utf-8?B?VUpUNFk1SUxicWZXajkrMVdVcFc1TUlOYm9TaG5uY1BEYUdvV2xvSzRCaDl3?=
 =?utf-8?B?OUFha3J0azU0Q054RERHMGhFNFN0enlIaHJsK1ZSTWJ4NXp2aDZzNkVZWlpH?=
 =?utf-8?B?Q2x6aHR2YnlzZ25SWThTSVlVS0htOEwzM3N1ZDkvbW40cTBETFJORkh3WU9t?=
 =?utf-8?B?WnhwRFZrWmh6b2pFTzZ2QUNCUkJua0htdGpkRFQwSzdKVmZpdGpCUWk3b1BS?=
 =?utf-8?B?eHg4ZG9wVG9tK0JTL21UMnZNd2hrRGNQbWlXT2dRVWZlU0t4U3BHVlNTdkhi?=
 =?utf-8?B?UVA1alN4RndBZ2hES0FRVHZsQlRRRi9kUHc2LzZOa01PMjJPdEhJUWxUWHh2?=
 =?utf-8?B?TGFzOFZ3cU9ud3lzTVhCTkhOa3NQMC92L2dxY2hoR1R4ZW5MV05tMEJPNURa?=
 =?utf-8?B?L3A2YUtVY2ZQUzJrTFllMHdmR3p3S0swZXF1Y2pvWHhxU0VUenNHS2hUdWM1?=
 =?utf-8?B?STN5OEN6dzlkanZSQWR5KzdwRjdHUkhLaDY2cC9BNFM3SzBmOFZvcUNOdklK?=
 =?utf-8?B?U3MvditWZUlseE1wNnlXUkhrMU1VQzk2bTE1NWs3eXVNZHZIb3lVQ015c2Vi?=
 =?utf-8?B?Z1k5eVVlY1ZTN0JvVXg2ckdScmNtWkg3anBRVWh6clV2bkhJdkd0cUFKejJl?=
 =?utf-8?B?d2dpWCtXL2dsd1BoQnRDQ01VeGJ0ZVVyTW9QKzZLL01xM2FxaE1HOHd2YmIx?=
 =?utf-8?B?eEpMaitBdldrL0VlRmt0NEpMY2xGb0pDbkJVdjEzNUZiOTVYWlJDMVNuOHVq?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a07eba-785a-45c7-b3b3-08de172af208
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:37:15.2630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOTebsp6xU+A40rpvJxbT/CKUJ262JTAaecTKG41f2FwRC0l7dYYdxyJTeJHwUpmtLkhCR+ftyikZxFb3h6VE6mvNcG1Tn2zsJ4/WkLtdlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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


On 10/29/2025 12:58 PM, Vivi, Rodrigo wrote:
> On Thu, 2025-10-30 at 00:05 +0530, Anirban, Sk wrote:
>> Hi,
>>
>> On 29-10-2025 23:34, Rodrigo Vivi wrote:
>>> On Wed, Oct 29, 2025 at 04:50:16PM +0530, Sk Anirban wrote:
>>>> RPe is runtime-determined by PCODE and caching it caused stale
>>>> values,
>>>> leading to incorrect GuC SLPC parameter settings.
>>>> Drop the cached rpe_freq field and query fresh values from
>>>> hardware
>>>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>>>
>>>> v2: Remove cached RPe frequency field (Rodrigo)
>>>> v3: Remove extra variable (Vinay)
>>>>       Modify function name (Vinay)
>>>> v4: Maintain a separate function for PVC (Rodrigo)
>>>> v5: Update RPn while fetching RPe frequency
>>>>
>>>> Closes:
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_pc.c       | 75 ++++++++++++++++-----
>>>> -------
>>>>    drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>>>    2 files changed, 42 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 3c0feb50a1e2..08deaa64aa85 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
>>>> *pc, u32 freq)
>>>>    	 * Our goal is to have the admin choices respected.
>>>>    	 */
>>>>    	pc_action_set_param(pc,
>>>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>>>> -			    freq < pc->rpe_freq);
>>>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>>>    
>>>>    	return pc_action_set_param(pc,
>>>>    				
>>>> SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct
>>>> xe_guc_pc *pc)
>>>>    	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK,
>>>> reg));
>>>>    }
>>>>    
>>>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>>>    {
>>>>    	struct xe_gt *gt = pc_to_gt(pc);
>>>>    	u32 reg;
>>>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct
>>>> xe_guc_pc *pc)
>>>>    	else
>>>>    		reg = xe_mmio_read32(&gt->mmio,
>>>> MTL_GT_RPE_FREQUENCY);
>>>>    
>>>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK,
>>>> reg));
>>>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>>>    }
>>>>    
>>>>    static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>>> @@ -408,24 +408,22 @@ static void tgl_update_rpa_value(struct
>>>> xe_guc_pc *pc)
>>>>    	}
>>>>    }
>>>>    
>>>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>>> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>    {
>>>>    	struct xe_gt *gt = pc_to_gt(pc);
>>>> -	struct xe_device *xe = gt_to_xe(gt);
>>>>    	u32 reg;
>>>>    
>>>> -	/*
>>>> -	 * For PVC we still need to use fused RP1 as the
>>>> approximation for RPe
>>>> -	 * For other platforms than PVC we get the resolved RPe
>>>> directly from
>>>> -	 * PCODE at a different register
>>>> -	 */
>>>> -	if (xe->info.platform == XE_PVC) {
>>>> -		reg = xe_mmio_read32(&gt->mmio,
>>>> PVC_RP_STATE_CAP);
>>>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) *
>>>> GT_FREQUENCY_MULTIPLIER;
>>>> -	} else {
>>>> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) *
>>>> GT_FREQUENCY_MULTIPLIER;
>>>> -	}
>>>> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>>>> +	return REG_FIELD_GET(RP1_MASK, reg) *
>>>> GT_FREQUENCY_MULTIPLIER;
>>>> +}
>>>> +
>>>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>>>> +{
>>>> +	struct xe_gt *gt = pc_to_gt(pc);
>>>> +	u32 reg;
>>>> +
>>>> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>>>> +	return REG_FIELD_GET(RPE_MASK, reg) *
>>>> GT_FREQUENCY_MULTIPLIER;
>>>>    }
>>>>    
>>>>    static void pc_update_rp_values(struct xe_guc_pc *pc)
>>>> @@ -433,20 +431,10 @@ static void pc_update_rp_values(struct
>>>> xe_guc_pc *pc)
>>>>    	struct xe_gt *gt = pc_to_gt(pc);
>>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>>    
>>>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>>>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>>>    		mtl_update_rpa_value(pc);
>>>> -		mtl_update_rpe_value(pc);
>>>> -	} else {
>>>> +	else
>>>>    		tgl_update_rpa_value(pc);
>>>> -		tgl_update_rpe_value(pc);
>>>> -	}
>>>> -
>>>> -	/*
>>>> -	 * RPe is decided at runtime by PCODE. In the rare case
>>>> where that's
>>>> -	 * smaller than the fused min, we will trust the PCODE
>>>> and use that
>>>> -	 * as our minimum one.
>>>> -	 */
>>>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -560,9 +548,30 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc
>>>> *pc)
>>>>     */
>>>>    u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>>>    {
>>>> -	pc_update_rp_values(pc);
>>>> +	struct xe_gt *gt = pc_to_gt(pc);
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	u32 freq;
>>>>    
>>>> -	return pc->rpe_freq;
>>>> +	/*
>>>> +	 * For PVC we still need to use fused RP1 as the
>>>> approximation for RPe
>>>> +	 * For other platforms than PVC we get the resolved RPe
>>>> directly from
>>>> +	 * PCODE at a different register
>>>> +	 */
>>>> +	if (xe->info.platform == XE_PVC)
>>> I believe it would be better to convert this to the graphics
>>> version here
>>> instead of the platform name. But no block since it was already a
>>> platform check
>>> above.
>> sure, I will look into this.
>>>> +		freq = pvc_get_rpe_freq(pc);
>>>> +	else if (GRAPHICS_VERx100(xe) >= 1270)
>>>> +		freq = mtl_get_rpe_freq(pc);
>>>> +	else
>>>> +		freq = tgl_get_rpe_freq(pc);
>>>> +
>>>> +	/*
>>>> +	 * RPe is decided at runtime by PCODE. In the rare case
>>>> where that's
>>>> +	 * smaller than the fused min, we will trust the PCODE
>>>> and use that
>>>> +	 * as our minimum one.
>>>> +	 */
>>>> +	pc->rpn_freq = min(pc->rpn_freq, freq);
>>> setting rpn_freq inside this get_rpe function makes no sense.
>>>
>>> I'm sorry I forgot about this when I told you to kill the other
>>> function.
>>> It should stay there, but be called update_rpn instead...
>> Since RPn updates depend on RPe, my intention was to update RPn
>> whenever
>> RPe is fetched.
>> Alternatively, I can maintain a separate update_rpn() function, but
>> in
>> either case, it will be invoked during initialization and while
>> retrieving RPe frequencies.
>> Another option could be to simply rename the function to
>> xe_guc_pc_get_rpe_rpn_freq() to reflect its dual purpose.
>> What are your thoughts on this approach?
> I think you need to get to the drawing board and think on another
> proposal. This is becoming to get really messier.
>
> update_rp simply update them all before the actual get.
>
> you don't update another thing inside a get of a specific thing
> of interest.
>
> think of what are the cases where the rpn update is really needed.
> think if we should have a constant workqueue refreshing it if not
> idle/suspended. Think about all the consequences of the updates
> and removal that you are proposing. And always making sure that
> that that igt freq test is reliably passing.
>
> But something is strange in the current proposal.

Agreed. The issue was we needed to get updated RPe. Why do we need to 
update RPn? That is a fused value and never changes. SLPC min freq 
changes with RPe. So we need to ensure we read SLPC min every time (if 
we are not doing that already).

Thanks,

Vinay.

>
>> Thanks,
>> Anirban
>>>> +
>>>> +	return freq;
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -1021,7 +1030,7 @@ static int pc_set_mert_freq_cap(struct
>>>> xe_guc_pc *pc)
>>>>    	/*
>>>>    	 * Ensure min and max are bound by MERT_FREQ_CAP until
>>>> driver loads.
>>>>    	 */
>>>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq,
>>>> pc_max_freq_cap(pc)));
>>>> +	ret = pc_set_min_freq(pc,
>>>> min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>>>    	if (!ret)
>>>>    		ret = pc_set_max_freq(pc, min(pc->rp0_freq,
>>>> pc_max_freq_cap(pc)));
>>>>    
>>>> @@ -1339,7 +1348,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>>>    	XE_WARN_ON(xe_guc_pc_stop(pc));
>>>>    
>>>>    	/* Bind requested freq to mert_freq_cap before unload */
>>>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-
>>>>> rpe_freq));
>>>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc),
>>>> xe_guc_pc_get_rpe_freq(pc)));
>>>>    
>>>>    	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>> b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>> index 5e4ea53fbee6..f27c05d81706 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>>>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>>>    	u32 rp0_freq;
>>>>    	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>>>    	u32 rpa_freq;
>>>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>>>> -	u32 rpe_freq;
>>>>    	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>>>    	u32 rpn_freq;
>>>>    	/** @user_requested_min: Stash the minimum requested
>>>> freq by user */
>>>> -- 
>>>> 2.43.0
>>>>
