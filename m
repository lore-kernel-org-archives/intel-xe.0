Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F22C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50BA10F1C2;
	Wed,  2 Sep 2026 12:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZa4RsB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E8910F1C2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788353523; x=1819889523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U7rEXnmFBrfP0/wYl8MazBHFccsi8uDwt9c1qsUy/ds=;
 b=KZa4RsB8njdbu1dWTJLfDPr/rfWEuJFgmT6H+VJieIIFIWrnjrIFgUJR
 xPYQArPTldiev2xBwovsfi+r1rw57aObEuxZK8l5x/JHkwfWLBgib1EfX
 WRrNl6XUxSLoM5z9ghkihbeWB+HedN7tROgNNJz1DIjhN6T5aAMVo+vlR
 5giA4+KlC7P+/KRPqIVRVCmkRqYohxA92gAb7iEJtNeT1yIbxhEHN5XuN
 UvTadCC3bfAZBG7M124UrwdV1b2LDnedals71e4cmG7R75VV+HBl/4gfe
 1uyOJ0zzc8GkQKXRWv5/HZOwoa6sAhDkqHS3tFH5QCvP938y15P3SthnF w==;
X-CSE-ConnectionGUID: lLCbz+FRQJOdwIIn8cei/g==
X-CSE-MsgGUID: ZsHLIchTQJupXSVlsM4L7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88933741"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88933741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:52:03 -0700
X-CSE-ConnectionGUID: PGUw7pAlTnSKv041ucd0ng==
X-CSE-MsgGUID: J+1s2j7XSzOxZVHNIfiq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266791521"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:52:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:52:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:52:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6poBFN4SYxvUMs1LFseRZVDcn3Piy68L1CJd3tjGVG6cRilqD510w3ys2S1/dCjqhV6TaGykbq1cp+JyPtySj7YymIeCMa974XAbevCpCKhiXjVSMz+GL7dK6hb8xZcohRBoafCYwuYfJMT1Txqw+8q2zD3p5FoY4HSPeZOa2ywZLPZwfD92XJenz+/+VIs10gBkB3+a4TZrGNsELdhs50r3VFByJxXyu5tL2cRI+q2VqRwgazHZvSP7zNIYLGW91g9HUtaSTP1od1orq4+cc5aaakKr4IfDx5DP7P4X5KWSQokD0JZUtZHRauWdqVeQv1ULlJK2hMPZOQqoFlGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebFVG/SgAhzoc0rImfFsUH9IxUIj3oxPZzGWINAYElQ=;
 b=qAVwc+Sswicm7B/Y3PYH2D59baQAXnXREh+eHI5o12Wubk9JXKtHCU/VCjMhcvIrfV3Ct892XjMHdTGyxxh7m9rh3K2ygWnAXX6kfwI0417H+MFQnu83TpBF07MbBWxRfzJwc5xTQh/6w4muJb2t+JFO24kaOhhrtwYfoBkbOYsMEyFRrc+76+29dldyHMSSt8XImxzXhTaYhuJwutokrGUDYlRfQPmXjFkI6nvvaDl6n8K9zFAXARmeD3IZ0c+xyvJWr9DOZOyjqIPs3Itv2lUhm+E1qN3ZGBiPMGj9LMxHbZxMVIs6pk7FwlKmautj1vWKjJJwUop40hhjHx4x6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA3PR11MB801804.namprd11.prod.outlook.com (2603:10b6:806:530::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:52:00 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:52:00 +0000
Message-ID: <f1d01885-1a97-4b5b-ac17-b53ad3541ca5@intel.com>
Date: Wed, 2 Sep 2026 14:51:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/gt: Report GT reset failure using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-5-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901063059.2547247-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::13) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA3PR11MB801804:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa2ceae-7791-4651-713e-08df08f0fa5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Tixp0tq1ATd5lLO3Nw+q3t00RUg/JvfQ1oRNa+zpWCu2i/A5weJ7virhiGAzfOFDdQT8STxPY+1xeizngC4LIfjqKwa/rf8w38DeL9gNQ0IBVugME/gDffMjespeDDmIElTr+JtW7dPQeD8aJbQUrRbo7gG3dFFlURHCiKgLJAPK6+xgqoNBVIdzPYGjjXS/AdRuhm90UjVPki1E7gMGKZhJ9iZLbOct5aZUlFB39ePq7B2Nm3fTmMdrmyTQWzsRabSvxmopwMekMj9bPptSjJOfyI+Wbbm7//xnnj5J6hOKZqfpqa1V1ejkSqPMOrFxfAxEWdHvocPHgJH6qO3fi3EcDS+JzypsqNrXJj7X01j8GTmOxWeG9QGhxwRjrLGcvzmSj6tF5Ox7EhP68/12v6JNQ7HRahAqsFw4KKYhclyKjjXOiO0gNY6HaaqRck9nRW2d2aWUhaVsnu6N0YYMeUaG0KneDdPWed8Z3bfYVvWenzmxiJbZYdJRS56fUitOmyTc0nuRmc6QVkPcNHliWkFNYa9WF8CjPwylcX3KTjxioayr1iqBOLlaVN0ilB/dudTKXOHAmnEfymGIXeRMo1kaH356uEGFadK9/td0jGjheDZAEL46yvwe55lzOlUVNP3BpTOG2bbfp+MnUFvfDKCjUrPoNSevfibw37OKRy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NTenVZTkNra1VhUkw5eE1lWFptZlptaEx6WWdzZGlWL21yaTlZQ1pCM21r?=
 =?utf-8?B?eEJ3d2R0Y1BpN3psRDRBRzNpMGFjWFJ2V213SDJ0MCsyNi9QRkdMbnM3NExR?=
 =?utf-8?B?U2RGWTJqc2ZGTW03eHJ0WGV3WUg0MnhNbCszU1lSTUwvWUowMEZTa1JTOWh3?=
 =?utf-8?B?M2FJMHN0Z25jU1hqVTVleVZabWZqT0lIT0pPeU5jVTJOZ0tTa3JqUjV1aitx?=
 =?utf-8?B?dCtnbTM4bWZZQnhCb0tOV3Y1UXhpZHJpOVZYSUVkNlJLOGZQbngwNXFxVmYv?=
 =?utf-8?B?SkFCMDZUbUFMMXZCNThMNk1pNEhYeERyWHVZUWV4cWNkb2FydTFGRk5ZRUNh?=
 =?utf-8?B?TEZoblBYNERnNmgyK3NQU1hYRERVOFNQdjRka2xUNWE3Wnl3YVJxTVowc3Uy?=
 =?utf-8?B?NUwxK3NvVHFnMGtHUTFFeERpcXZKWXhybmhBbWhJaGt5TEV1Y3dSdEtoYmZr?=
 =?utf-8?B?Vm1KUi9YaUFaaEk0RTVWdDUwSHJadmF6UWtKd0ZHR29TK2QyNXFKenZQTmZ6?=
 =?utf-8?B?Yi9iRkZVdDQ4VUFvTDc1VSs3dTNtckNMVkZSYmN0cnlIMTQyN0lUT0RYWGNx?=
 =?utf-8?B?WG1UYWJwcGk4VHE3b0pobGRyYS91Y01CMGduVllpVkRUWnQ3RUUrdWRBTmkz?=
 =?utf-8?B?RzJTNzd1RVVoYnNLdHJwbFJMbzFjSU92YVM0WVF5TnYvZ3BwNFRNaHJwMllZ?=
 =?utf-8?B?a1Ntdnl5SEZZRFZXZEh4U1NVeU1qclVKaDQ0b0JBQWtXVmZ0NWIvUW5CZ0RR?=
 =?utf-8?B?SHQ1UXNwWlY4UzZ3SkFwclJDblBCZktjUU51TkZLeUhrNytZZ3p6VTJJaytW?=
 =?utf-8?B?ZDNkTStQR0tTNGFQcUtMTFF3UGwwR3BNSnRwcFAvQVl5N3pJRFRaZGNVZXk0?=
 =?utf-8?B?WEtSck5jWmFNd1BUSHZmcUUvb3gwTlZtWTh2ajZBTXFpZ1YxeTRERklpNG9s?=
 =?utf-8?B?aEZjOUV3eW5LMkhLc004L1cxYVQrZnRBMVZyOVRpUCttb21uTGY1alc5czRV?=
 =?utf-8?B?ZE9FeHkwZlJoV2ErcGl4Vjd5WnRlRnRtaklpc2tnWHo4cHZGTXJmRFFGT3Bv?=
 =?utf-8?B?SkN4b2trbmRYR2cyajcwU280TVJpbERYVENZbVcwaHcxc3NaY1FnRGJhYU1a?=
 =?utf-8?B?MStMdGZwcSsrTkVrZDFDYWZ0OTBkUS83TWxqclNlTTFoRzF6bTRYcmFoU0Vp?=
 =?utf-8?B?WHBadUsrSEhvM3JmWnNSWlIzMkxkT0NCZENTVU44UW85RDEwdm5IVFpzbjRU?=
 =?utf-8?B?NW84ZW9EQ2d1SmdwVGpLcGpmS1JqN2d4eHY2WDdqSThFK3owZkhMUHNuN2VB?=
 =?utf-8?B?ZUxSbEpQcEpGWld6NGpGdjN0Sm5oQ254Y05Tc2Z1UlBVazAwYjFnMjJPVmNT?=
 =?utf-8?B?Yyt6N2xIdStVaURKaUlxRm9jQTVNY3E2MXNEYmFmVjFJQm5wWkFJbjRhRE5H?=
 =?utf-8?B?ZXBENG9HYW1rNnc2emNraktQTjBqSUUzVFZ3TjMwQW1zV0M5Zll4K2wrQWdy?=
 =?utf-8?B?Skw3ODJHUnAzR1BVTnZqdzZsWHJVOWZnVklRSzM0ck9PUnpSWmZFUW1zM2w5?=
 =?utf-8?B?Y0QzbVFRc0o2RFpSMnZ4WTBDZ2FWR1FPNkRYcEN0eFFMeGYxYjI4b1E1R2xk?=
 =?utf-8?B?ejl6MWZyTFlPekV2Nk1lOTQ0MU1rR20yWDg4b2FGNm4zVGc3SldDRk5abnpZ?=
 =?utf-8?B?eDZtTzZrNjJ4WE9BRGxOT1VlSnQ5MHNJeFozSHQ0NUJEV21LTHBCS0V6b21E?=
 =?utf-8?B?Skp3Q1FuVHRabUVMWjRDWDA4cEt5VlBsZlJTYkpFbEU0RFdHb1labDRYdzI2?=
 =?utf-8?B?MVVkbHI0UVpOWjNaeU0vNFYrUFZ4NDl1OXpLZUJsdGZGVUYycmlqc0grNjhG?=
 =?utf-8?B?elYzMGtNdVQxekIzbEEvR3VpaDZ4OEJPNGFuVFNtQUp3VWQ5NWxPeUlmTmtk?=
 =?utf-8?B?UjNOQkhEbnI0QnBySnZBbnI2T1U1ampiU1huWW02bjg4OWZENW51VWZ3K002?=
 =?utf-8?B?ZDVuZHV3Ulk0Ukt3ZXJPSHZsNnRIUlA5TDhLSHZWRjI3d1hNNHlhMkhtNC9P?=
 =?utf-8?B?RUxFRENYSGI5OFpRdy82Ulh4L0x0WkE1MDROV3JlRnp2OHlSVG1lODd0U1Rt?=
 =?utf-8?B?cEdlWFNVdE40cDFTb0p1ZGNpUmtMalNuN1VBUG44NWRWTmlFL2Y1NlpGWGdz?=
 =?utf-8?B?S0h2NGMrU1dneEROd01UeU0rTEdvaC82cG5tSFdYTU9JSy9MQnBZY25rcExn?=
 =?utf-8?B?ZFFqMENEYi9PSEFJVXMxa3FBL3pJdGNVeXV5UGVVQzkvajlEWmlDK1lqMVJE?=
 =?utf-8?B?RWxNL1F4WFFsM1M0VGNDZVlKdGNOODZheExoekd2OHBSckZEWWs3b2hMODVq?=
 =?utf-8?Q?MzKhdOKEQYlixEts=3D?=
X-Exchange-RoutingPolicyChecked: OWG3STtcsJQmk6UFXZfGdAFX/0aGeIIvkAPHRfsERcb+wLjOBgsR2d4wWM+AdeAH1c7LB3YNFfmspil9iF6mniMRjxA1VIS8KYNOVUgxQDNq4RDznBedcMklpQZvydRseIPLqLQ7QbMEECgcsbmp1V5qloICVkdVhrFA9Edo0yBYvYHbhU4nhuePgMqZ1B7gdi/EQm2w8zEUh4eJcT3I7g+EMdF0ahGkqZ4D6jbQ6xcZYmqclau4FIBk8L6L0MTRC5BYDw0D6mW/PajTTozhg4Ri2I3+14mRbxYSj7l/FaV4iFf76a46W0p73rePzws/x4t4170gDhiKQFXMJrMmwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa2ceae-7791-4651-713e-08df08f0fa5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:51:59.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CgjiJD4EGGWvLQw1Txvey7jQAa00UgyA8hUusFsJX8OSNWt7LsndMbtN7SfgYWeLXzdk9Q8S3/o7qWWvkjxzlWk0HyVJmU/agqAeqpkVMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB801804
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



On 9/1/2026 8:30 AM, Arvind Yadav wrote:
> Route the GT reset failure log through the structured SIGID logging helper.
> 
> Failure to complete the full graphics reset means GT reset did not finish
> as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
> the reset errno value to the helper.
> 
> Also update the message to describe the actual failure. The driver does not
> clear GRDOM_FULL directly. the reset should complete and clear it within

The reset ...

> the timeout.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> v6:
>  - Corrected the GT reset timeout in the log message to 5 ms.
>    (sashiko)
> 
> v5:
>  - Kept this patch limited to the GT reset failure path. (Michal)
>  - Improved the GRDOM_FULL failure message to describe that full graphics
>    reset did not complete. (Michal)
> 
>  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6805e0d3bf21..d72c7ec9a956 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
>  	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>  	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>  	if (err)
> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
> -			  ERR_PTR(err));
> +		xe_log_err(gt, GT, err,
> +			   "full graphics reset not completed in 5 ms\n");

hardcoding timeout value in the message seems wrong, to make it properly:

#define GRDOM_RESET_TIMEOUT_MS	5			/* 5 ms */
or
#define GRDOM_RESET_TIMEOUT_US	(5 * USEC_PER_MSEC)	/* 5 ms */

then
	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_MS * USEC_PER_MSEC, ...)
or
	xe_mmio_wait32(... GRDOM_RESET_TIMEOUT_US, ...)

and
	xe_log(... in %u ms\n", GRDOM_RESET_TIMEOUT_MS);
or
	xe_log(... in %u ms\n", GRDOM_RESET_TIMEOUT_US / USEC_PER_MSEC);
>  
>  	xe_gsc_wa_14015076503(gt, false);
>  

