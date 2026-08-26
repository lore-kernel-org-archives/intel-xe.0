Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9484C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 09:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E07610E275;
	Wed, 26 Aug 2026 09:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuD26sy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C2810E275
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737826; x=1819273826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=kBrRHeABTcfYZgmzgD9rwhQtham/wKlAkCI9+lXOYpE=;
 b=OuD26sy1SviAaNkJxjHyQP4UF1xkcaZl0BqefJT42JHAepb+m8RvHzRr
 lThTIY3oSm5qtiMT0S3JSodimu+UW1nwcHMG7TaVml5mGWleb6XG7JlH2
 l8ffAdwbNgXhib7TT9xD/68FsHLcV3GvWHIa6MXtJ/S3Y9tqBXLKHYslm
 T5hHN0VkwYxNjo+I43Xj3uc/Ey69niFgAO2kNMO8OY/DD0IAS3ybRk/5d
 PcLTVhJsO58VksvHvT+G95TmwdxvjAhWa28k/EYA/JRP+Vx6nYn1v570e
 pZaX+KpfItmB4Fk0gbSen3crvg92y523SxZYx249TABjFm+NQ8RioAHxa A==;
X-CSE-ConnectionGUID: 6xW9rmz+SuO9y4h261shjw==
X-CSE-MsgGUID: 9t3PDINfTrOcsIju7TEHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88233109"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208,217";a="88233109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:50:25 -0700
X-CSE-ConnectionGUID: VeULHBZURsiJ8Z+wAs8PFA==
X-CSE-MsgGUID: uF7Ww7K/QGS9QVb5VMxjNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
 d="scan'208,217";a="261405391"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:50:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 02:50:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 02:50:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 02:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAElOJ13JFinhWfaVd/Et6KIz0e2MRL0/UYhO/6ZB8pFVM7Br9F7ghlr41KBDZ3qaer5gYuLYkzMYxUhmDk3lUWFBUC8cc4MvMyhaqqt/KM7EyJvmg9H1AJ4vcRipG6e5segzDvMZvoCQO7N+ExqeTHBIV+lSC0IHmZAdS1p/OVFoKumAOtGYPFE/8ZL3d7m2MpuG+5KOJ8cvc4dYt6AALFscIX5OnsNpB0lzYYB1m0MIHwftsJrE45vGSOfSp9qs/qtJhVVrBBY1cbhfKQN6K12PuJPYl2tlqA1kI/mjqPGHOUJJATSHpmQuTMAeNbp3R8y4p7Vp+i4jgZ2b4IC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3ypF0lytl2uL3+/7ePAhAwzLaoBVIUeRDzmtwd35Q8=;
 b=qFAlw0xHyf/ar9HGWd/O/tMMzsqdk7yhGbx6TuUpYtv0Y+XD6HFlV/nUGhq7/SkPdXEV8uObGUzvhrEshGMPvcsnLR3Fxff1/bwVKLP/OQiaQYjANN4Q+587F3AXhOX6o4s3ypCZb6WE1OUFILqtazdhNPYkSMC1ZilHdd7LKMjJkuco+PJvf3ub7HA3jHwxoUo2sJKI8LUGjpwVy/CfDfxiRHzrtI3wIFHq6tOECgkkhC/3y3Nlp+Nj4M6UkeXKvfdrp3F2uyU7gVZtTJiVQZf7RNgZaVhKfQQW3/IjA7V+KWeENPG1Vp/2rxY2LQO9mt3cvg/DkCJWJDut1f5tOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DSVPR11MB445312.namprd11.prod.outlook.com (2603:10b6:8:37a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 09:50:22 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 09:50:22 +0000
Content-Type: multipart/alternative;
 boundary="------------qaQo5jExsAXxKRwaGCxslXC0"
Message-ID: <e5a77bae-9e0f-4603-816b-35529d6c58bd@intel.com>
Date: Wed, 26 Aug 2026 15:20:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/xe/hwmon: Report errors using structured xe_log
 API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5P287CA0142.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DSVPR11MB445312:EE_
X-MS-Office365-Filtering-Correlation-Id: 900a9394-f8ee-4dcd-7b80-08df03577241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|22082099003|18002099003|11063799006|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: i568/BFlRmVW/RGMNrr/C1vjocC9VIYupeVFdwVVTqlt77BSK6fHR1HR3KImuRWak6xIgntDzT70pWBGGHfpqCeQxaZGW6u5rWj6EMWE/1srTCY9sjIZEWSRN7VbVlfSNVXYDRFHtpu2mrmCNqZ04/klITIaBtmiEK/tGFjQxCOxhQLlXtNt2BUEdbR7dcoI+qlUNUyedLI5ABIlQZiv20lkcOEO1NFLm68FzJXtizaEm4YXxCL5x6LqE/AJGxuzu9zpCARYBSYlH6t+xeFPQtr7KEJ8mPXOYh+S4oIsfSvlzH0Rt+54VkHaOd0CnRUGDhQx/lS9Jwg2ixca7YvEHU1kMzUApjkSLMKGcuEVSV/s0uiMnvLhc+ooVr5BP+EuHQb7Z7Q4N/28WmPmZ86x4IJBcBEiqtpT/Cqw4QpyIhOpXp851QEew6Tq26T5mhiJBl5HxKt/YYup4lPFavWkH5fuABlIDZYksr2aA9Ef7eQ4Ce+L7CDgR38IvVJ9gZD5eyEy8nU4e526FU6hWPS62TTgJN9K/29EFtt3ddc8Bris4+qowZvWEVkSo8JDxRKwAZQFGeMcmsIpfK3zXsCzxbZEdx0Ddk4Mq4KJ5wh7jYFR5jR/5osF/SyFFLVwjQQIzZIMbJIkVOBHqDLLgmpSAqBkNPV1LBCyLv4GkEjJzkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(8096899003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ukw5ZUFocWdaczVRcXNkOEdZeUFLRlAvbW11dTQ0MWczU3UzQWZnSmRjTy9o?=
 =?utf-8?B?d1VqYkJlZEprajNYSHRGNlpXZk14WE5aOTVqZHdCZGFrcTJ6dXgvUVRzbnVJ?=
 =?utf-8?B?Sjkra2JQRlRYOEtqcWpZb1pRQkVWOXpoVm5kcTVWTVorNzBjbUpKR28wZWxM?=
 =?utf-8?B?aVordFd1UzdKeDYxTGJyNWQ5R09FbHdnTndaYkJpRWNNQUV2aThJckFkTzJz?=
 =?utf-8?B?TDNvQjN6OEdTcmVPaElZR2xmbVBtRTgydFBmaWZ6TTU2YytVM3BYSWp6ZFpW?=
 =?utf-8?B?ZFZxckJLc2NrNkZYNFZndXVqMm9rZUlyRkNnSHpBUVpyMlp6NHQ3OS9HNENo?=
 =?utf-8?B?SENyUzdwZDROMkhpMHF4NmJHb0ZwdkdVbXlic21zMzU5MkJ3LzhGTHA0M2Jm?=
 =?utf-8?B?ZXdYZUlUdSt1c1FNcG52U3FQdkpabUkwVkpyYVN5VDliVFlYT3VoSEZPNWFV?=
 =?utf-8?B?M1I1RnFDcHVQMC9JUzZ2cGp1WlZnMWVDRjFnemNuNGNyOWliTkhjdlhWeFFr?=
 =?utf-8?B?VWRYZjMxajlVc0l2bSthSjc3cG01a2xndkZIcGUxL1o5SVgrWGh6R1h3YzhR?=
 =?utf-8?B?azUyTW1ORlBqd3daU2ZDZkN3ZDBzTEhjRFpPajFUTmRUUyszZzIzd1Y0dVQw?=
 =?utf-8?B?LzZmWU1ITEdBMDl2b3A1Wm42VVNTTEgyeStFMG1KLzc3Q2UyOVp2WkdGMDdt?=
 =?utf-8?B?eDJqQ0ZnZWFDKzN5d1JHWmt0Sk9QQlNWNVVIM2hVejBwbURFeWNpTngxbG9r?=
 =?utf-8?B?OXMxVElNVjRHbnVtTkpSUkVoMEkzUzVkbHZsT0JGcTVNaytjdFJSSjA4TzQ4?=
 =?utf-8?B?d1NKMjZTbzBQNGJvbzh4VEhLTDNQQUcxZitqSThMcHJlcDlQVzJwaUtsT0Ns?=
 =?utf-8?B?TFBXSmNBQ0YvTzJ4TGRhU09DODRQS2xSd2oxOW1XK3FOVndsZk9LSXRGa1Zi?=
 =?utf-8?B?cnQwNk9SNzRHcUsxcitRTml1K01qZVdoV2trclhMbUcvNmtML1BiYkUvUUVQ?=
 =?utf-8?B?WmhWY0lKMnYxZ1pGY1lWTlhyVUVpS3d1KzdzT3EwK1hyVG5TallmSTgvTWw5?=
 =?utf-8?B?UEpobzFhcjJFTkd6RUZDaWFFaWdGOTJtWmtZSUhsVXVUczZVU2NFa1dkK3dN?=
 =?utf-8?B?V2xXZU5LcHpJVjJJbWJwUUJ4U3Y3WW1xODRMZzBBWnRQbVlUdFZXQ3JGODhT?=
 =?utf-8?B?VHYyNnppSE93SXRrRk9mUTRsVmdLa05UUXNWc3VPTjJyUGJ0eHZuazBZZVlk?=
 =?utf-8?B?QW1JTkFWM2xRNmNwQmZhUmg5WU5YK20vWXRjYmw1dnA5ZUhZUzFpdWFBYjRW?=
 =?utf-8?B?bWNnU3UvVDNMQkdXWC91TUFRem9NRWVVcVdMQVUyT2JJd2Y5SHFvVXFOU0JD?=
 =?utf-8?B?bmQ5QlNvVnpETkltVDI0Q2lKSUovRzZybXM0NkcvTVNuNlQ3bmJXTndBQzhR?=
 =?utf-8?B?K2tGanNzb2JxYmtmbkFTbmJkdVk3YUgwTmsxRzlRdHNHT1p4bDVtbldZVGNZ?=
 =?utf-8?B?dE5UVU45MUlmdkdCeThjZnlpcUIvNndPVEI4Vm1yZmp6a2dtRnhRWlhYUEpE?=
 =?utf-8?B?azI4eXozVFpGL0huUWVlZjBwOFljK0VnV1FldDNKa1pmRjJIYTRyNlRmYkpS?=
 =?utf-8?B?aEg2ajZYWTlQdG44SVIycWJmV2xsMlYvTmZpWHUveEdxWElwMmpQVzM4MjU1?=
 =?utf-8?B?Z3FiaWd5bW10TnR3ZXRmNTU4NmEwczcvQjA4dVMrWHJOalNVY2VzYncwS2h3?=
 =?utf-8?B?cS9GbUNJeklJVVBLVzN3VmhYTTAwSDh6ZHdSNHRtOUVTR3VadCszT2psbldm?=
 =?utf-8?B?NXRLSnpHNDVQcjhXcXNneWNsNjRmSGcrME1lY3o0TVBqdGw2VVljTzV2NGNr?=
 =?utf-8?B?NmNKVlZ1U1o2Ni9UclNaTHhYSUpZUmFwdVhhUlhwRXIwdm1xb0R2ei9tNDlU?=
 =?utf-8?B?akI1R3dScVluWEdpNFlwZ0IxblMxcGZqQUxvN3l6N0h1R2R1NkZqMU9BMTZq?=
 =?utf-8?B?VXREY0JHZTJzdEVmWTRVcjRxYldtZkFWQmFjSVhKREt6YkFENFlTaVcwSmdD?=
 =?utf-8?B?UGJRNlBMb0hPSGVGWmhpMkJmemVHOVNiY2h1OXR6Ty9ld0hzS0YxMTVEUUpm?=
 =?utf-8?B?S3pMTS9CVUdhSG42Qktkc3dDdlp1ME1xbXdINlJJK0F2QkdsUnEyQ1BHMnpN?=
 =?utf-8?B?bllpVS9oSWFRYzBPQ1VBNnBGVHlWcnZhd05FbG9FbUQ0NVd2S2xQZjV0Q1lx?=
 =?utf-8?B?REVMZmM2cEhwV2tsMGwzeC9tTHp5SWZMaXN3TVVMdFAvZ1I5Q3hCVUFjUUcy?=
 =?utf-8?B?RW10RkpaMEVUSXJtcnpxdzM1bDM4b3JOU0xWZWsvcGdoRFZneVphUGZOYnJo?=
 =?utf-8?Q?nhkqfuqEOqvxayJs=3D?=
X-Exchange-RoutingPolicyChecked: nd59NWrYSRQcvLOEqg6Pby5dqkJvfW11BiLjBJFztdjpEq/09jyf+0FpIqx7KG1RB4ozSwhOzDGw0EqN2eZtlq4YSbi99Cd4W8P9m1ix3luW87U+gpOUufRR9kadQemYI0OvzNg7AYmIYGF3dgApXZl67QchYENcjPh8UFsev/I2gkTe9tAjI1ciWCKNH6jPea4GAkKVWV5rpVZ4x0FAvoSGIaK8/Rcbl+Wzy3lfKqBGn6yyTEpagrhvrjQg1/WYK0D2Pg4xNfV938EZYEsX7XCz5XrdX+mQ8Snbv8h6WgSPsguZVUa067Q5GHg6iaM+8qpTg2sr0MnCmpt+QQZukQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 900a9394-f8ee-4dcd-7b80-08df03577241
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:50:22.7458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HY1EaQwzRzVaOkxUrs9A+hi+rTcOuokU31OWBR3tzyTvS2KhLGhiHB4kz4u99A6miNjMX2ramiqnbS5pwGPj7mYlmMAQvd4gmQXhuypK+CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB445312
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

--------------qaQo5jExsAXxKRwaGCxslXC0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 20-08-2026 12:44 am, Dnyaneshwar Bhadane wrote:
> Replace drm_err() calls with xe_log_err() using the HWMON component
> tag to enable structured error reporting with SIGID for hardware
> monitor failures:
nit: '.' rigtht?
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..9ff351e87e5a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -15,6 +15,7 @@
>   #include "regs/xe_pcode_regs.h"
>   #include "xe_device.h"
>   #include "xe_hwmon.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> @@ -563,9 +564,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	if (hwmon->xe->info.has_mbx_power_limits) {
>   		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
>   		if (ret) {
> -			drm_err(&hwmon->xe->drm,
> -				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> -				channel, power_attr, reg_val, ret);
> +			xe_log_err(hwmon->xe, HWMON, -EIO,
Use ret as errno.
> +				   "power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
> +				   channel, power_attr, reg_val, ret);
Once you pass ret as errno, no need to log it.
>   			reg_val = 0;
>   		}
>   	} else {
> @@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
>   								&hwmon_chip_info,
>   								hwmon_groups);
>   	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe_log_err(xe, HWMON, -EIO,
hmm, is -EIO correct one?  we can use PTR_ERR(hwmon->hwmon_dev) right?
> +			   "Failed to register xe hwmon (%pe)", hwmon->hwmon_dev);

nit: Once we pass correct errno, no need to log so remove hwmon->hwmon_dev.

nit: add '\n' end of message


Thanks,

-/Mallesh

>   		xe->hwmon = NULL;
>   		return PTR_ERR(hwmon->hwmon_dev);
>   	}
--------------qaQo5jExsAXxKRwaGCxslXC0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-08-2026 12:44 am, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace drm_err() calls with xe_log_err() using the HWMON component
tag to enable structured error reporting with SIGID for hardware
monitor failures:</pre>
    </blockquote>
    nit: '.' rigtht?
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..9ff351e87e5a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -15,6 +15,7 @@
 #include &quot;regs/xe_pcode_regs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_hwmon.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_pcode.h&quot;
 #include &quot;xe_pcode_api.h&quot;
@@ -563,9 +564,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
 		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &amp;reg_val);
 		if (ret) {
-			drm_err(&amp;hwmon-&gt;xe-&gt;drm,
-				&quot;power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n&quot;,
-				channel, power_attr, reg_val, ret);
+			xe_log_err(hwmon-&gt;xe, HWMON, -EIO,</pre>
    </blockquote>
    Use ret as errno.
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				   &quot;power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n&quot;,
+				   channel, power_attr, reg_val, ret);</pre>
    </blockquote>
    Once you pass ret as errno, no need to log it.
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			reg_val = 0;
 		}
 	} else {
@@ -1599,7 +1600,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&amp;hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon-&gt;hwmon_dev)) {
-		drm_err(&amp;xe-&gt;drm, &quot;Failed to register xe hwmon (%pe)\n&quot;, hwmon-&gt;hwmon_dev);
+		xe_log_err(xe, HWMON, -EIO,</pre>
    </blockquote>
    hmm, is -EIO correct one?&nbsp; we can use PTR_ERR(hwmon-&gt;hwmon_dev)
    right?
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			   &quot;Failed to register xe hwmon (%pe)&quot;, hwmon-&gt;hwmon_dev);</pre>
    </blockquote>
    <p>nit: Once we pass correct errno, no need to log so remove&nbsp;<span style="white-space: pre-wrap">hwmon-&gt;hwmon_dev.</span></p>
    <p>nit: add '\n' end of message</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260819191442.1957986-4-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		xe-&gt;hwmon = NULL;
 		return PTR_ERR(hwmon-&gt;hwmon_dev);
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------qaQo5jExsAXxKRwaGCxslXC0--
