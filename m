Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63FBC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 19:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7680610E1FB;
	Wed,  9 Sep 2026 19:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU337mOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D310E1FB
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 19:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788981773; x=1820517773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ONxZG8YxelbvIMozqG0yhPyK4Lu4dFBGsX+eE0rAuAo=;
 b=IU337mOld59fOzCxgLaNOc8TSJQvK6ZW3eIeBRhCHyLjwhYL6DTphtnL
 DDhw568AqL7UwM8uFrQyneF9QSPLeihHdsROge6fN1ldgp+cmLiV35ZAK
 AzTSAGUO3bvZvHIURAg4xfSf89o0/Y2HDGNOcdqY1Dy66iFsn3mRWHOuT
 eBp/SU3GoJ9gL/5hoRbM2xmrX3bFSEUaPgGYNL+lvEbo7Nc5IZKHxwK1J
 D3lJBzsMhHGp/G7qefFcqxqSmzehMWaqMJHc0q+vVmhbRLBP4/twYdrO1
 kxcuE2NduIbunQ42oF12uUGhgYMnc/QXOtVPGk2zYpHC29+oAeWUB9TX1 g==;
X-CSE-ConnectionGUID: lS/TmaOcThGXsIL2KuRkTA==
X-CSE-MsgGUID: 5tE1GynxTAaLctQ69LZNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100078882"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100078882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:22:53 -0700
X-CSE-ConnectionGUID: uozvU04zRUWcrWfVTgE4fQ==
X-CSE-MsgGUID: e2xNP3NPT4ySLrVCVHUZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296355904"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:22:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:22:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 12:22:52 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYqSc3sdyU6C7++qj2CVwsUVt489M/sRPrzY2iZHNVcpQDL3UX20kl+XlY8gE+33oaz/1/tbf2m3UeovSyOfxUpwjaNItbLzAQQdOnzpm8U8boVS2pyJXlbvpu7ZWsXj3beP4Yp+7SxNCvl9NAM1Ng9vcRsdTwFI6N3q4rUYHSuarJGCxWLsYmPKNAuvKtSkNcQ4Qz9YfFHsrez8O/QfwVFmpAQgiavCoOyiROUp2EITQ/5k+BODjnrNUKBqx+7wrkyAWALYBTDFaZLjsC6IfFQujbQJbAhM1FCDljqsmrzBjbbilCXTvV8jIhMil2mT1x79R6+GclNS+qC/+naauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAW87la2SlkD2mKSR2zc6+r5EdfKr+/IbydoJAd8yuU=;
 b=AsTtoxOW9tkJS1DCKyIp/bo0I7eImoWbfRZlVrlh3urRpgVs65sEy+KjjCsq6FfnVih1fHgMpki8kv7pWzrmCX41sJc/BR+718qDMBcBMr2DAlwmlXZewoTt27ObKCEchrSFBTFYtMKMllB950D7Vbl/A62kH2utWTa8shTTYt6ekqFKXTTI/wx3LXGIPKGnXgvJi0tU41VNJBqgVGMkHShoahxvc1Sy8aJE3i2U0/KFz7NEHOV9I84nlygJ3Hq9zA1/C0PW9I/y+YWdgc7fk5hOJ5qeiTOXN7RcB2hN2buQgFdBOY8EbbVqgRM865bl/w3r4IwL9zTAHb/fb3rGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by CH3PR11MB497958.namprd11.prod.outlook.com (2603:10b6:610:348::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 19:22:50 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:22:50 +0000
Message-ID: <ff529b33-00e9-4735-9938-1780b09172f5@intel.com>
Date: Wed, 9 Sep 2026 21:22:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/tests: Fix default subplatform selection
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260905200157.3164-1-michal.wajdeczko@intel.com>
 <20260905200157.3164-2-michal.wajdeczko@intel.com> <87ld9ajlfn.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87ld9ajlfn.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0087.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::16) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|CH3PR11MB497958:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bb4f43-638e-43d5-bb04-08df0ea7bcb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Cct/A/vFMtHc44Xe2KTEsMsQ4WNdnw/Ee3FwKrC+6Bk0RVMbMIZ3c2J+ziT3r57HiaPvYxICAeFCgakcwG4Ozp2dK0OQSXp2v4zbaU6ZNO68XQB+3pZ9v7Vdx/KmpxpNCJtcdK1ZnketZMDN2xREvOxNWTcc8O2CLdM2RUMOoZpf9xZ0CyOy1nvaWFcJ4XACu0lbYJQBIsEiiIOsqU/+roOiZ1OCk6dBwxQMRqckOhfy0bt5AaYTkogBWVN9B8woEE5kCuAYYOeMfTbs08LEGLFs7OTYz9/WadOk6jm4pRx4DaXIzXGlXSHa6ssSCuzGP4jZKhuTjFq8q4hWU0Y7WEW3MHkMs3rSFFN7kDPnyFv2BC8nnjcsLpsnOgQdF6Dj/dgNuXvfU+0T1WxIi5mnomVqfiPpZBEgOqgULlGxgliZsDgv/psprRvJw4TaOZMqCAZBWkbNr7vaa9I1+DAusCGAYN6mRp0eNcsL6UHJ4IjX2MHwgxfLmHg4lrBxcULKFUCTFv5eJzPgZfhflD4gwrNXv/2mmVTGLbci1aYoG9P/X1nuYZxkMfjUjmMppstHjwiOgPZ2gq71/NtCMK6eQj/5sVkDUghrBIEOedkfMgHYEQE4HwkPxdlqVxKnRbN4lPpQw+MWhS9RR8zcpOM3wMuxss+yYpV9kSLCwZ8VFHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNna1NtTXF2Nlh4K3A3UzJkSWdGWTd6RlBzajFYZ0JJdnM0a21OK0RiQWMy?=
 =?utf-8?B?ODBwQ1FPOFdjdmN6ZTUydWJUSUoyZ1J4b1d4d0l6d2ovTkRCRG9CZUUwZ2JI?=
 =?utf-8?B?alUvSDFKbDFycEl1OGlONjU4R2FQNDhxRnNkUi9ndVZrdndBUmd6WE94S2p0?=
 =?utf-8?B?TDB4emJVMWpoOXNZQTBvZlZ5M3djVFJoVFhoZXRKd3NsWUZqd0FVRS9Xd0U2?=
 =?utf-8?B?ZTVzMkZGeGZWdktoaXhnTlN2VVowUm9wUmdTWmhnZDF3SWdKK2V3U0tZeUs0?=
 =?utf-8?B?Z25WUEZsQzRYVkNEZy9weDRXMmg3Zk8yVE9PdHJ1OEVoZnhhQk9kNjBTVGhp?=
 =?utf-8?B?UmR2c2Excmc4NFJZYm1FMVliY3N4MHZUWWltWUphdG1UY0tiRDRQZUswZkVH?=
 =?utf-8?B?T2Z3ZDJPS3gwdldlRTJlS01pY3A2ZlpPNE5kcy9WOTMrUFA2VW5DQ2JlV0d3?=
 =?utf-8?B?SjJpeXVPcW5aTmNtc1I1RWZ0WEJmSWlRK0ZkdWtZRCtBclBqVlVFRkdsSzVQ?=
 =?utf-8?B?V01CMGc4YVBJYnZQcENncDV4aTlSZmw0SjBVR3NzZnVoaitTSXp2NVFyRStG?=
 =?utf-8?B?WEUzY2pEbWt2QStmU0FOQmlrZXJqYjlvNjZab0h1eGkzRzl3cTl2Y2pMVjl0?=
 =?utf-8?B?dWgwRGYyS0JNWll2UlIyOE1wQTMrWitxNWVyUEo1MnJwWmZmY0FlNUhGUXgz?=
 =?utf-8?B?NWFCRnNIQW5XMTlBYU9CVC9la2Jnc21UREZET0cxZmZIQVdJMnlTU2NqTW0r?=
 =?utf-8?B?QldyU1ZsVUNOS3NMV01ZV2hCVEY1OGE1bHRCbU1vUFVwRjJXdWFOK2R5L0xu?=
 =?utf-8?B?YkxOa1U3L2kyUm1lYmlZQ2FtSDhzRHdWWVdhOFdtbFl3Y3BRcnQzTTNXaDBC?=
 =?utf-8?B?cCsyUVdKT0JydzBmMlIzbUtaMjFMT093ZWxxRHpQTERHa2RUV28xTjJZTyt5?=
 =?utf-8?B?WVJrYit0NXp0ZGExOVRNQ2UzNk4ydEJnYTBRNStFQ3JzZ2NpdGZEbUNyWFAz?=
 =?utf-8?B?NENORHlHUjZjd29VbnpDQTFRYUg4L1NSQnQ1Ulh1Wm9oRHJ2VmtXbkNDRlk1?=
 =?utf-8?B?TmFIcTlGN25jMmt2TVZKSlhqUkI0eDdvcjJUc3M2YmdxYzh0bVk2TXVmMFRL?=
 =?utf-8?B?T0Q4dnhpTEUzdVdkZitYWHAxZnpGM2RNanJYMDF2bk1HeUg2VDdGNG96bmxL?=
 =?utf-8?B?NGdtNStybzcremczOTdvUVBjNVlaWHEvejNhZkIyby8vK1IrRC9EL1k5b1B0?=
 =?utf-8?B?T2dweU5weEN0dUlhV1M5OTBDK2pZR3p1TDVvYXdiaERaZlhYT2R3aFZtRE0r?=
 =?utf-8?B?SFFWYXBVUHoyeCtYakVqM2xmMWdUbm9xNkpxNnZ6ZjBvVXRNZUd2WWFUSFg3?=
 =?utf-8?B?bmExb0Vya1p2SGIyL3NKRGZUQmFkdDhudzl5dExYeStXekttRnFQMjJQZy9H?=
 =?utf-8?B?TmZEdFVQTzlnVnN1aEVtU1JjUGE3NG11M3JIbWFlQitCb0lzcSt0Z1VFTHRv?=
 =?utf-8?B?TzVzNTVIZW9WRHRWQjkrQzRBOXdtT0YwK2dsRTdLeHVTaTBWS3IzUDJXZjFM?=
 =?utf-8?B?SzU5Mmtvd1ZvY0R5RE83VDFHTWtMWksvZWVsYWEyRC94Y3U1eVEzSkNGaExu?=
 =?utf-8?B?ZlZ5bjlRYXNhRHFqR0MwOGs2M1I5NVBRcTBiRVYvWWgzL3piTVVLK1YxYU1r?=
 =?utf-8?B?Q0JRUGlQNVppaXpyOCtYTjByNUZRVUJXVWNaTzIyZFNUa3MzRG8yWk9WZUZD?=
 =?utf-8?B?eDBXTzQvTVVDZThZWXlFVXV4N2ROWThNUndpL3BHSmpDd2UrS0l5amZTdkxj?=
 =?utf-8?B?V3E4aXpqdHpIM0lRQ3UybElqK3owYkovdFI4N2NDak1id1pNVDhzVHBmK0ZD?=
 =?utf-8?B?MkpWR1Z0eTJ4d3IzcEpvUDdBM1VtZkFySE9EZXJXdDJjRktvaFVLOGM5dGJY?=
 =?utf-8?B?REJrZEpobjlDNHFBNXhRSk5oN1orU25ieGVVYUwzRExRWXpiRy9pWW1KTVpl?=
 =?utf-8?B?OXhQSjJOYkxOcTlhTTZIV2JXRFFzMXR5SEZTYW1HS2lBcy9BRUd4czkzVjM4?=
 =?utf-8?B?cHJXTk50NzRRTUJ2bTcyeXRWZmIvb0xYaGVwK2lub1BQSzRmZmV3bEhBWmc1?=
 =?utf-8?B?UU03NnUyMFBhd0diS0djWEtHTDZPUUluYW5tUjdhYUpWemZ6elNUWWNyV0sx?=
 =?utf-8?B?THJrWE9sckI1Y0JOcFpMbzVqK2I0cmRkb2pGamx4bldWNnBNc0JpUDY3cEpt?=
 =?utf-8?B?RU44c1Z5NHNoQm8vVmZueklWQTV1eHdUc3NCaDJ5M3Y4QmFFQVF0L1BLKzRU?=
 =?utf-8?B?OG5sNDBEZ202QjYrZmFRYitkZHBUQWRpOWFYY1FnbmVWdnhoZXh3WW1jcy9a?=
 =?utf-8?Q?AhhXJFD8yJQ4duIg=3D?=
X-Exchange-RoutingPolicyChecked: Ee7eNPGKdhc3IJS+nLFytLKziaOlhkcQwnnzq5gFo1YUAzDdXJiMXLk0Pis4GhcoBr7IsSr+W0lOD6NzAm9fdk2Jj+jGHm5wHxfiAvcPuYRVRISInl3HzQ1hRwsSfqdmMAzzNBnVlZlodfg8oXqh5XAzRiKImrFHEWMNXKmfzSgIKdgDJlSMWTScdCIlMkRPhOs7H7bC1D849Oh5nl6Q6u7OHAf/12n+4FvyaHtPKdbZIgdUIjz4LEpVczl4rHl3SPVhnyF9mgDTC+CPOtUwn8+E1R+UoLvHCyBZVT3vetWM5pHqvK0QbSc045bm8Rn9V/RonV6HalgWl/bLWM4NOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bb4f43-638e-43d5-bb04-08df0ea7bcb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:22:49.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB13urLXVIFpHhaw/+X1TAMiXczzeqbg8sKn+c6BWWbNn679G5vVHcx3VaBDtNLD+XNE2i2EQUl5rWyMZhwhVlYb9sFtDCs1R9G0WNBo+Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB497958
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



On 9/9/2026 9:04 PM, Gustavo Sousa wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
> 
>> If a test does not specify details about the fake device it wants
>> to create, our helper selects the device descriptor from the first
>> entry from the pciidlist and uses NULL for the subplatform descriptor.
>> While this works fine today, as the first device is a TGL which does
>> not have any subplatforms, it will be broken if we reorder pciidlist.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index bb0393475524..a82cab7a2b86 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -351,7 +351,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>  
>>  	if (!data) {
>>  		desc = (const void *)ent->driver_data;
> 
> Should we add a comment here that subplatform_desc will be either NULL
> or the first declared subplatform?

hmm, but from the pure C language POV the "desc->subplatforms" will be the
first declared subplatform or NULL, and we shouldn't document obvious code

likewise, we also don't have a comment that "desc" is the first platform
from our pciid list ..

> 
> In any case,
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks!

> 
>> -		subplatform_desc = NULL;
>> +		subplatform_desc = desc->subplatforms;
>>  		goto done;
>>  	}
>>  
>> -- 
>> 2.47.1

