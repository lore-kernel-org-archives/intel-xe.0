Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF194C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 06:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93D410F001;
	Wed,  2 Sep 2026 06:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEmjVIvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344F10EFFE
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788330946; x=1819866946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fdLL2tsXrKeXQl3t+Xcpazw6JejcRy3APN8Fabb4FGs=;
 b=aEmjVIvGcHxH4zcb3VsSn1Ln6ZvtJ9sqfD2YjNkOYWnPXMQavVUAXxD2
 5Zxkq0T33TdpddVzzUIEVSjep9dPeyLpvy5HHs0akLT2pYVrlpmMWT8hx
 B4WMz+KdGoLTB/dxQBgHGVbsPi/mOtOdCdUoAyCpxIAKO+VHESft/cCQw
 kQSbAeRgCfxF4BrfbNZQW/uJK6L7XIpPjDTvtAT1Tld9gb/chxM43UzNK
 1rhgv5d7Y2jAFH6ZL4Bn/QhIh6DT8m3pNPchMZtPz2M4fwAi9EcVWi+2A
 EvpDmuy5e57uv9Qb7tmKCW562mz4jck+zxpUAbEDyV+sXiDBpDnqkJ7ui g==;
X-CSE-ConnectionGUID: XvpgOzARS8yJeBfypzHmgw==
X-CSE-MsgGUID: yJzjdNtlT5Wbi8gFFHDPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106147814"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106147814"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:35:46 -0700
X-CSE-ConnectionGUID: twoN2r/zQ7+RM30GmYBd+Q==
X-CSE-MsgGUID: 23paKjWQTUWub3CdL6pPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="274580101"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:35:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:35:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:35:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPbKP8khe1OElhOALEE+U3qHY3TkdSOeaipcw8IU6+AikmknCI8v1zemTvAzoTZ8kFxutn8qcvWpYZKd/aXmPbORzXANzXdng4P9E1SR/8hyimSTk/OIpKjo44VR98WU1+ePO804AVeJt+grD8QBMEmW3iqZJZQ9sjwtWs00DJs6DRGODk01V+23v4Sv3VetTYEphqHKj8pBsxaiNmrwMxcZaWmn1PIKNffKJvakqF1DatrptgG2JdBGgg5fd61JSWuNH4+AO/pQ/HIxYgLVL7Zgxa/exPBQmF9vXkMDdvcAZzm1QGc3UcEbAcxOrcLd3vuXlpg0K8Xxp6nvFSu0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej1gzYg4gKw/WjQtu2eAuEzBUIcjiSZO6c35VyUs3/s=;
 b=E7BNNowPprNTgM8goDlkRoZGJZctukmq1f76LfnSXlnWPkHS6R7z5jRcBMd5NJ9Z1vcpEIkt6v4A6SIPVDDjjMuU6MTzv0ySU/aC2/HNCfQuFVVXoVcolKk54t6LlBwP/OMOhfW9U6lEIyVIAGxVkYv9eMHwN18VjJx6tsIjnIXjIMw2SsjPhByEp+qaHF54VoRd61fAhxP13PheQdO/BPKYBQayIxqKbp3KXGFvAKw0u6xfu3HeYdGlL7ko8phlLHXGTMdreOYvHOQGyCEXvMr+4oqBM4QjeFSU9WNHznwxopUdqGP5MNjG2aE1AQKbKBz0XJ2JEipY8OU/tR2qAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SJ5PPFC362E0A4E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::854) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:35:18 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:35:17 +0000
Message-ID: <5d1e276f-f048-41dd-b74d-22724b8c281d@intel.com>
Date: Wed, 2 Sep 2026 12:05:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SJ5PPFC362E0A4E:EE_
X-MS-Office365-Filtering-Correlation-Id: ee960522-ad91-4621-5bca-08df08bc5a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|6133799003|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: oAMBYhmJW0NDtA2jLk0oRR50Z/jlbHk1zVZZbO+E6Zart8hxILnwishZi2lIW7SfnuFf50jlHJB+fm7vkuYcmjyRKIR6wVIXnrne7KMEnBXtCBUv3A5gcWZQRf0kuQu61kL48gq9ujaACD6Kbr+TTh/fFQrhf2pmJqD4lbtgyf8r8mkaSjR+j2lJ01DTip/I/lKJcBDz5eZUIQebikHmSrenWRiedltKcjJxeoVW5cqIkRLDPYWDxS0CxLtn2KNTBHp1CZu/6tdyoABcgcre1dUe2e1DH48oMi0hwXTz2Iqf3FyCE9k9jZYDO1LcrCnNFwSvOAnswihGEpNw/5IjqCDTlBAKa4z5JkB91MYv/g8GgiuvC7farGXluY3OcHBSKWTMue3PPwatA5yq33C/jYOB7a8bmphMjMSAAXR+3JehD7s+L6ofxlAjxTsWw4kUb6PgvwC4WZmyhmdpBG8j2Fmv7V2lPi9kddvHUa5EGG7zSLDTfMErLCYwneWGavC1vIbpoMGsodj/36KI0H+tkML/rs3+CbDSwoBzNVHW4TBMSp0TjLwVX5a4NbwXEXPvvHCnG3dYpCjsw6YPCuKUzziUmBqMe75wfw4qnxk3KPomved6QZvgYJT+RLU00wbIJVDdufiDilIYd80pPakJgz39lVRqC1OIfVi+AszpfAs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmdpUFc4VnA2S3lhTytTL3p5V3p0L2dXM3hDQ3RaTjJTbFZ5YjdGenVoeGh5?=
 =?utf-8?B?YnhFbXd1ejhpVUx3VzV1WCtRYUcya1Vsck9ZdmRhQ21OOVhrV1JFY1NiUkZO?=
 =?utf-8?B?N2NYVkM0clJTYm41M1gxYVRPOUxUdmExUFlBLytZVVdWa1kxaWdjaWtlaUl1?=
 =?utf-8?B?WkVxN0VsMTZadWR5MjdjeWU2VmFvcnhCd1E3VTRFazdBR3hZM3Z1Ukc1ZnhB?=
 =?utf-8?B?RVU5R0trOFVWOVNiWkpKdlZLUmZFRlA3RmE2THdrYllvaDVjR21HMm9mZ21s?=
 =?utf-8?B?R0dSdkdkdVI5Vlg5WElDNUZXdk01UzhNVGdlNm1ySThHYnRhanVwZ0hWNVBl?=
 =?utf-8?B?dTdKMXNhNnNZZ1pCMDRuSmZyOUUrUnd1QnRoT2s0QVlVQ0lzNk5QNEpJaklW?=
 =?utf-8?B?WWFWN2xOUmVTVnQvV3NtN09HamZ1bS9Ga1hhdVYzZTJLalJ2TmdWcW5wRXhh?=
 =?utf-8?B?OHUzZ0k0M0dGMHZzSkZKWWx4MXBUQVh2WGdSL1pSUXRiQnlmVlVJWXJoZmE1?=
 =?utf-8?B?ellBa2YxNmRhU0o5NWJoOHkyVDVsZlAwSXVkUGZmU1Jra01Rb1BzOGllMWkv?=
 =?utf-8?B?RnROQXpLeEhxdEE3VXhmYkdlWWYzNDhKOFRRY1FBbGhlY1ExcVNTYVk5Ulo1?=
 =?utf-8?B?ZjJnYUh4eTI1QVpPTWhRaDYyeUN0TytkSFNpQkR1UzNOWGc4ZGxvbUpDSUlu?=
 =?utf-8?B?dWxrMUFYYlJ1c3h6cmM5eXFBZktBaHBCWENLQjNKUWFJeFNhR2JMWld3QmxW?=
 =?utf-8?B?YlNOajB1akc5UzdYQU0wYjliaUJFYzg3b3lBdjdHM1BlRDU3T24rY25kU0Jk?=
 =?utf-8?B?Q2xhWDRsd05pQlVaVm5PVnZOSTExaG9iN3I1OHhwaVE3SE1pNk1nK21mcDlX?=
 =?utf-8?B?RG1JNm5DZFFTdVBpU2dZOGlYZldhZWNHRTZjQUN2SkM5NTRJeEhGWVZqT0ZQ?=
 =?utf-8?B?eWh5N2tqQmV3YXRwUUx4MmNCaU1JbGxEWFZOV2hNU2NtSEVhSWlXVGNSUFRt?=
 =?utf-8?B?RWRRbmkwOW1vd1VObW02bGg4aFpGaUV6bXBFWElSdjhDUCttNEJxbTRMZTBm?=
 =?utf-8?B?bDBZck9IbXVEbjk1TGFEUGRKRFcwQnliUWFlb1VKeElBTDZUd0lVZjN3dkNG?=
 =?utf-8?B?akJGN0IvZCtKcTRybmhYS2RLaWNKVElkRWFhdXAvYWUwYjFFNURsRUh0UlN3?=
 =?utf-8?B?MTBaZW83MkZnam5Kblk4SW5rMGtSYTAvTkd5aFp0bEdIdFhQYmhJamlaUkVa?=
 =?utf-8?B?MXJtTSsxR1JFUjNNMmtIeCtXWDFBZGZYWGFRSjFtUUNTY3c2M0tCeUU0VEFE?=
 =?utf-8?B?MStYY2FnZEcvVmFLdmNjVCs0eHJXa00rUnh2eEQ4T1ZtaXhyYUxDODUvSU01?=
 =?utf-8?B?T0xOblFaNG1leHV4bWRLUXRadFZvZnhFeXJzVVFNTmw1TmhUOFRVanNCT3hP?=
 =?utf-8?B?SG5wUUc0RjNXZWljM01MK0JoT2s4cVh4QWlIVzhpSHkwNVlmb2NOeUtpWTBZ?=
 =?utf-8?B?elR2VFBZY0ROWHAyU01oZGJpQnhKVTUwVDEwVnRicGNjcW5LWmdqSjZETkZI?=
 =?utf-8?B?TXhabHZERENUUDYxb09nM3N0THlNZzZ6cmZZNC9iNW96TlJhTXpkLzFVZnEy?=
 =?utf-8?B?YzYzR0NtV25nT1IyRDBHcVlFeWVYK3lJTDFCMzdWY2wxMmtoTEdOWUlrVHVI?=
 =?utf-8?B?NHhmUHpJUnNsbUdlSE9LSldoQmVjMlV0ZUtFRFN2empNeHMrYVZXdW5IYlVC?=
 =?utf-8?B?VXBXajFQMkVxZ2hVMlJKbEFKaGRnT3pTbUM0dTJSYVJ4THhqZEpuc1UwSkVj?=
 =?utf-8?B?UnRhc1dnMXYrVEsrc1FGTEpRZm14ZGp2WjR5dEppVTY5LzAwMU9SSzlrS3Fj?=
 =?utf-8?B?ZjhZVG9TUVpZMzVFb2hocCtRODZXR2FLeEo3cHZ1K01DaUVDeVlva0FPVWdZ?=
 =?utf-8?B?alFwT1BFK2tqQTZUUHlHUERERnFQcTJXdERZMEJOQ1pjWTB0d3RHNUo4OWdo?=
 =?utf-8?B?YWNUYURmR29EZ3d1MzFYekVQWmdObytLOEdrWmJrYWVXa1Fsc2FpSEcvRDll?=
 =?utf-8?B?djdDMVdQczd3Mmx2RlJFTjNYa29kZ2w1UUxxM2FMTnBTa3lzWllmNjlwQThX?=
 =?utf-8?B?blZMMzVpV2VKMUpDS0MrZS8xOGVUVnZqM01mOWZVNE5Sc3NHMytaTHVEdmVl?=
 =?utf-8?B?dVlFRExwNVBqWEhUbkt6WnAxaVQ5WjdRRk1SNHprelhiQ05xcU1WSy9aZXk0?=
 =?utf-8?B?MldVSHBYSGM5V01rbEEvQUFpL2tKOXJNSGtpNC9pYnZtTE00NnBwTUJ6WFEv?=
 =?utf-8?B?TnNNUmVYQzNSSmREN05tV0xOZ2JKVXJneEdyYzNmMUxQNUhta0VxUT09?=
X-Exchange-RoutingPolicyChecked: w3Hf5Gq9xz95fRjEmS44KRwGnHzPF2XuH5xb1hmL99zVFSQNqw3dBTEJN2nBWStcGH2YLCqFUnh9+hugyjDpmYsfH0aXOWeYxvypZ0vW9OgzB2zff7WsdnltEio8YOUeODvVYLNPrSPXP0gYaJeCpyAEXBJy+EWgWCclW5b4kG7F6QdsQdfxxm8BFLzIOcPbs0PFhHzyIuJWtQYPfsYSRiqfDc5pVynlYPoyPUPJUCubuLDn5MrjHtgUHQnHuxLKKT2k0GKYXX6T/ZDm0PWSoIAdvqx1MGxCTBRjkjZ68eHl+x6brWMxcSoAewGoPmCFPoktluC6yIyjU1912/eLRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee960522-ad91-4621-5bca-08df08bc5a60
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:35:17.7296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FmxatiBRLWg0PB3+zcxsjddi0Fw15W0qVYOXs+KeaFVyhwqq+kD1AQVNdpf5VWMKgNuGih/g1eJREOrNysabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC362E0A4E
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose curve-point temperature and pwm controls via
> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
> F is the fan number and P is the fan curve point number.
> Each fan curve point has temperature and pwm sysfs.
>
> Update Xe hwmon ABI documentation for pwm auto point temperature
> attributes.
>
> v2:
> - Use xe helpers for dmesg logs.
> - Update kernel version in Xe hwmon documentation.
> - Correct debug level of some dmesg logs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 +++++++++++++++++-
>   2 files changed, 715 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index effc7d38ce1f..68cc6b99e8a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>                  user table control and value 2 to use firmware default behavior.
>   
>                  Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
Is there a way to get the number of max available points ? If it is not 
always 10 then user should be informed about it in the doc.
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. Temperature in millidegree Celsius for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
same as above.
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. PWM duty value (0..255) for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fa9dbadd5fd6..a3ed139ad446 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>   			/** @speed: fan speed in percentage */
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
> +		/** @last_point_temp_valid: last user temperature point was written */
> +		bool last_point_temp_valid;
> +		/** @last_point_speed_valid: last user PWM point was written */
> +		bool last_point_speed_valid;
>   	} fan_table[FAN_TABLE_MAX];
>   		/** @max_rps: maximum fan RPS */
>   		u32 max_rps;
> @@ -779,8 +783,11 @@ static const struct attribute_group hwmon_attrgroup = {
>   	.is_visible = xe_hwmon_attributes_visible,
>   };
>   
> +static const struct attribute_group hwmon_curve_attrgroup;
> +
>   static const struct attribute_group *hwmon_groups[] = {
>   	&hwmon_attrgroup,
> +	&hwmon_curve_attrgroup,
>   	NULL
>   };
>   
> @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>   }
>   
>   static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> -					int table_type)
> +					enum fan_table_type table_type)
>   {
>   	int ret;
>   
> @@ -960,6 +967,16 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>   		return ret;
>   	}
>   
> +	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
> +	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
> +
> +	if (*point_count > MAX_FAN_CONTROL_POINTS) {
> +		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
> +		       MAX_FAN_CONTROL_POINTS);
> +		return -EINVAL;
> +	}
> +
>   	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>   	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
>   
> @@ -985,6 +1002,60 @@ static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>   	return ret;
>   }
>   
> +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +	int point;
> +	int ret;
> +
> +	if (!point_count)
> +		return -ENODATA;
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
> +		u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
> +
> +		/* Ensure fan control points are strictly increasing order */
> +		if (point > 0) {
> +			u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].temp;
> +			u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].speed;
> +
> +			if (temp < prev_temp || speed < prev_speed) {
> +				drm_dbg(&hwmon->xe->drm,
> +					"fan %d invalid user point previous value > current %d: %u/%u prev=%u/%u\n",
> +					fan, point, temp, speed, prev_temp, prev_speed);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		drm_dbg(&hwmon->xe->drm,
> +			"committing fan %d user point %d temp %u, speed %u %%\n",
> +			fan, point, temp, speed);
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"committing fan %d user table with %d points\n", fan, point_count);
> +	ret = xe_pcode_write_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +							   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +							   fan),
> +				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret) {
> +		drm_dbg(&hwmon->xe->drm,
> +			"failed to update fan %d user table count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = false;
> +
> +	return 0;
> +}
> +
>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   					    bool is_full_speed, enum fan_table_type table_source)
>   {
> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	return 0;
>   }
>   
> +#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
> +#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
> +#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
> +
> +static int
> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
> +{
> +	u8 local_fan = XE_CURVE_FAN(index);
> +	u8 local_point = XE_CURVE_POINT(index);
> +
> +	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
> +		return -EINVAL;
> +
> +	*fan = local_fan;
> +	*point = local_point;
> +
> +	return 0;
> +}
> +
> +static inline enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	u8 fan;
> +	u8 point;
> +	u8 temp;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[fan];
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	temp = fi->fan_table[active_table].fcp[point].temp;
> +	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
> +					  u32 point_count, u8 temp, u8 pwm)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	int ret;
> +
> +	if (temp) {
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
> +	} else {
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
> +	}
> +
> +	/* Cache intermediate points and commit once the last point arrives. */
> +	if (point == (point_count - 1) &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
> +		ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
> +		if (ret)
> +			return ret;
> +		fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
> +		fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
> +	}
> +	return 0;
> +}
> +
> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
> +{
> +	long hw_val;
> +
> +	if (is_temp)
> +		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	else
> +		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
> +
> +	if (hw_val < 0 || hw_val > U8_MAX)
> +		return -EINVAL;
> +
> +	*out = hw_val;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	u8 temp;
> +	long val;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"updating fan %d point %d temp to %u, pwm %u\n", fan, point,
> +		temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, temp, 0);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = sysfs_emit(buf, "%u\n",
> +			 DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * U8_MAX,
> +					   100));
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	long val;
> +	u8 point;
> +	u8 fan;
> +	u8 pwm;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	pwm = max_t(u8, pwm, fi->min_pwm);
> +
> +	drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
> +		fan, point, pwm);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, 0, pwm);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 9));
> +
> +static struct attribute *hwmon_curve_attributes[] = {
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
> +						 struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	/* Temp/PWM pairs for each point. */
> +	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
> +	u32 fan = index / attrs_per_fan;
> +	u32 local = index % attrs_per_fan;
> +	u32 point_count;
> +
> +	if (!hwmon->xe->info.has_fan_control)
> +		return 0;
> +
> +	if (fan >= hwmon->num_fans)
> +		return 0;
> +
> +	point_count = max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
> +			  hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
> +
> +	if (!point_count)
> +		return 0;
> +
> +	if (local < MAX_FAN_CONTROL_POINTS)
> +		return (local + 1) <= point_count ? attr->mode : 0;
> +
> +	if (local < (2 * MAX_FAN_CONTROL_POINTS))
> +		return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
> +			attr->mode : 0;
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group hwmon_curve_attrgroup = {
> +	.attrs = hwmon_curve_attributes,
> +	.is_visible = xe_hwmon_curve_attributes_visible,
> +};
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
