Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3EAC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 07:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D0210F6AD;
	Fri,  3 Jul 2026 07:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqiaeAHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E07010F6B1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783063979; x=1814599979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C0Ly+bFP0/0NX+G+Iw6K8W9t6tqZvExOsYE6B7ahg2k=;
 b=MqiaeAHEpjNCD/USNaH0RN8j579EO8wAxX4+AkDj+eysWxhroZjpg2K5
 hRbF0K02/F+EcXVI/pipqnb31svO/A7ozJmfvwY3RnU1pquPr/TZJnHoq
 qa1/xzgXNK9kyxfZwhKpmC25ztm7LYjig5VbSIfBiTnWjwKB0P1KoV6a9
 hwYcISNr3H/vsK3vzsTDv4P+8ZslqdpdohG8RtH9VRo6DBp96ytXEtK5z
 FBKswVN/Be6ZwI6slp8gjApKOSRGNqHSejEagqvFk7QUhnzn5YXZoSnbT
 1uGZc//uoe/xpwQOjV4fUeplTtWhtSbYPZu7D5V7GJ/8weyem2KCDMu6w w==;
X-CSE-ConnectionGUID: JVHUFLKVQM2xzB3EA/gLNw==
X-CSE-MsgGUID: 3G9r70LATSmk4lN4Eof3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83905353"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83905353"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 00:32:59 -0700
X-CSE-ConnectionGUID: F24J3MViQFqwb3q/AkMXIg==
X-CSE-MsgGUID: Hrt0xvzqQSq1rVxpaqMpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="246671324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 00:32:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 00:32:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 00:32:58 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 00:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7I+qfeFkQEbRin4MyQpJMLOCV97JOlxu63lpl1+4Yx1r2F4ojyZwavzjiwYwoQ2YTm+6iHxBJTE3NWRU2s0uRCrX3ZzQCzz0jap3XTCMz230V2S9uPq15LdpDgmlzmeYhA9nQFf4zOg32Wys635qAqNWHHUh1+XDz0XztHUKdFmG1vVNMyBBD+uFA4QexawsWEUsbKc4IEhOBLgNRs+Ek0YkU6damOz6Xci0R71lGDD7GKdeo+WE/yWSbUdThEvVNfYIsyw8EiCDj2MjU+cxMYOHC6KD5CQuxaHwZ+TwSJQKfhGf0y/RTIfbh6HnPLHj8hblrr+YXr8R0I+pmHnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vyCyxHevxCsA9bdCQo4upQSgKmenLd8eRemXN/DRWA=;
 b=QG/7IiehtwtS+hwFzRsO4+rJ9wwVaqZN9Byo5i2VQIq9UDTtFVaZOWWqDoltQzaS31zDctSMJbduzW2+VuOtr1ojLwS0jJUztyi2YWyx/3F4b3vrkdpXotwtgoLP58llvBIje8wemZLTPeD3CDSxUO+Je+nFKIYztDdFb06kNi5D8YOIdjGl0DE1YHAImeLH/iDLSJ9gul3eqmS1eXtKzlgK1f8YH9rQ5hpWpnf8iJv7S5DjXCYrJtAlrh+MKETUCErzkANJJasy4Yqgk7AaiNG6LB9qVgebM2IT86TVXkCzLnlZ5/WWClYGyMYs+QvcTSs9OPUNzy6D34NyGPFWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Fri, 3 Jul 2026 07:17:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 07:17:38 +0000
Message-ID: <22674c40-790e-4ee9-bcf6-8e118db2ea69@intel.com>
Date: Fri, 3 Jul 2026 12:47:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] drm/xe: Consolidate debugfs fault injection functions.
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>
CC: <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <matthew.brost@intel.com>
References: <20260616052931.72692-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260616052931.72692-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d7123d-9119-4415-dba7-08ded8d329ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6jz0r9CP9QTA+xUJ8834Vkt3L49dAy0F0hE8fpBEDlx5JodnYLg/mgC6Hvvokclj5GLGfnZhhLIaZFzAdDS1mIe6QcCUCJGt/HXA+Cr2mqvAZYlOQep2DcDkkSDyqntDpSLXS8bTSJbrkU1JLkB46mEQei9tOoBP413sRr+a87L2MLbTsThVGhos7PluLQUQtjgnD/OBc46F50PB+IPfh5lOthOS73TzR3q0Sh2CSEketaaxq8vAYq3xnQkz51E3DdGsGX3cbkjR9WsYZbTeCMoIY5lj4YGUrHxkX2aNg9+gYpbctEwqqdZF7kkH7nl5X0wR2sQScIy6J7voSR2RRabwkwDV4g1i47n1HCrHIighzbVYRs1CQxpDmyK/yhUSlqIqVp07rnM9iYq1qK7Yd2gGx9uN5qkMSduUgSe0EW6rsVLU9nIiEWVqLVa0Ri3+S9bNwKwXBRep3NoGq1EnrSqXXEKcpR9CJFXaCweCuuvlVOj2/bPCSULpqm4WZGejsc1cCW1SodMztDWfmVI1XVAUovlQr7gjOlYSiPGbghUf2qP0qFAtXgYzhcJDrSUZVUG92pT0+GiGE8/0GSRI9oyDS+vIbqsA66G7AjxtDLbwYtAruOXpWeyRIo7v71RwgusE8hxFI3InBaqyFh39AWg7bvJYMUFJAA+DWDlKJyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHZMS2pSZXhyV2wwRXJLZ1VvTWE3NDF2SG1jUTdFRlhTeU00a1FLS1plTTd4?=
 =?utf-8?B?RHhqaG5QTklwTHhMUytUNU01RHh2cW5UVUlzMDNaOWZlWXhvNGRZM3RWVUpJ?=
 =?utf-8?B?Z0dwU2RZNFRtZ0NaVjBVekt3QkdpVWhBWkw5NUh5RjAyM00wV3ZxV3lIdktR?=
 =?utf-8?B?MjdGd1g5ajVnMjFvYmNUdGMrc2JGSkFiKytIM0RnRVBrR1RGTmUvemwzNVY0?=
 =?utf-8?B?ZGJ3NG53NjF4d1h0RGZ1aklGd0U2U1VGNEpGbGxJQ25lK2FFVXU0MSt1SXoy?=
 =?utf-8?B?a3R4dy9jNGhjeVJyazdCcXJtN2Q1TytROFVydjNGSFMyRngyb1dGNkZiTCti?=
 =?utf-8?B?MWVudXc3OWs1aGYzeTZpbXdCbWZVTWxFRllsZFMwb1Q5R1pCWVZJeUZERzdm?=
 =?utf-8?B?TmdmZ2hlelEydEc1ZUxWbGJpVnZUUWlITjk4bkpPOGZpSDMvNU1SdFRHdzMw?=
 =?utf-8?B?dGxPbEErTjRLOU9OOFFlMXJDMzJrTDJ6dkZRMXlVZG0vRzlYR01iTExYMFVF?=
 =?utf-8?B?bEZ4VGVMdnJYWlpNbVUxSEtQU2V5ZlBUTWRQL1FSL1V6TmNUTzdScnBnQWdx?=
 =?utf-8?B?M3BSM3gwMGhNdWlFVmUxZ0toNnQ2WVZpWnJROHpDaHg0WGFkMUNDZk1xNlJV?=
 =?utf-8?B?cVZIUDFNNnpsUjFrVHNpZm8veFJUZ2NTam44TnFxTTB5ZzJUWXl4SVJkbTRM?=
 =?utf-8?B?eWxxVkFzOVF0TysvaG5rdTFqSU1Xa09hY3hTenZ5Nlg5S1RsZ0xVb0lkc2lo?=
 =?utf-8?B?b2o3bXJyd3pPTnBRYjVqcklpV3VpMWtkRjNuYk9KQzM2YUY1UXZGWCtzNi9q?=
 =?utf-8?B?MGpXQnhaSmJzaE5yR1dvUng4R1R6RTdVMFI5Wk1tR1FUY3Zoci9KQytZUTFz?=
 =?utf-8?B?SWhlZ3F5QUNIbFV0dmJzTWV5Q2M5b01zMFdIQXNNWFJ1YUJqa0VlaTVaRmlD?=
 =?utf-8?B?YkRNeUp3QXBENVVyMGFlSkJNUTRiemE4SUE3bnNQaXVhNmlCOEpuWWFqY253?=
 =?utf-8?B?d0hFUjFIUUduUytvVUs4dTZtM2FyajF5NW9BVzkvVmZpeWtMb2pUSFVndFMv?=
 =?utf-8?B?eW9zVWU0UFR1VVl0TTlhMHQ4ci9LM1pKemEvS2dzcWFyajZhTVFNTTZ0N1dr?=
 =?utf-8?B?VnhQSWUwU2JHRzRjTGxXdWp4S1FiTFBOalFCa1FzY3RLNGdXdHFnWUxLQUcw?=
 =?utf-8?B?blVnNXhvUHdYYUpwdnZoQWtSZUVaWmplekVIWkRNY1l1R0drdjRjdkZLUFJm?=
 =?utf-8?B?aTIrd05TRXRIYnZoOERkNTBBMWFCY21zQldKd3RDazJ6K05KWmZZU093aWlN?=
 =?utf-8?B?WUtxR2MySE1PTnBUUEZSNnRidWJ1aEYySlczZVlYY081OUlmb1l5c2Ewcnlk?=
 =?utf-8?B?aVhGZWJpQXVkYTlGdmlubVRGSXA4M08rbmFZTzAxMndhYTdlWlRLekFvRklv?=
 =?utf-8?B?dnFRMWNlODdDMXJsRGQvTk9jZHhoUFRJMkJMVUJXaGdTdU5ZVTk2ZEdaOWh4?=
 =?utf-8?B?Y25jM0ROb3A0T3RDcWRwLys3KzB5ZWNjazlsSThnci9vTC9mYkkwZnFlM3ht?=
 =?utf-8?B?OFNCSVlkOGVnYXhzT1V1cE1KS1RYamc2Mk9GY056bzVTalhRb1JnVWNYYWlj?=
 =?utf-8?B?bU9uNllXT29zejhjdEdwbDR5elVwcE5lM2d1RHE4ckExcmo1Z3Z4MzUvcE1t?=
 =?utf-8?B?eTBWaTFhemtzSmVHUnVKYWtGUHNPc25uOHdGMVZ1MUx3NjlicWdJRHp2V2Ex?=
 =?utf-8?B?eU1ZN1N5S0NHSEFUT3VHU2V5TXhoeW5haGNqbkc5NURuKzJrVnFNd2NoaVJ5?=
 =?utf-8?B?SGVZQzJ2SytkcW0vWXFyU0YrSTdlM2kyN2hLdXhqVWtPMGRUVkhSMXowLzB3?=
 =?utf-8?B?TUcwaFIveG84TWxIcmJ0TStDYWk2bjQ3R2IrdmJoTzk5d1ljN1BsZHJXRjA1?=
 =?utf-8?B?L1RNVkVEeXlEWUZvUm53TVNHTVBHU24xS1NnQUxlQ1IvdTZlRStoMGtwdkIv?=
 =?utf-8?B?bHhSRHg1VHNRYWxDS3VNNTh6RUF4VnJEbkNxQmNvSmdVN3NwUzl2VC95OTVi?=
 =?utf-8?B?S0EyNnZqbEdwQmJ6eTlNWURXSmJTUGNBUGZzZE5IbUUrMGJ0NlIwTEl3eGdL?=
 =?utf-8?B?emRmb3hybkRTTVhiUHRwcUZFcWhNekV6MGhOalNGaFZCUERxZHl0cVBLdTA2?=
 =?utf-8?B?OUhndnFQQ3M0QU1ETU5RdERwK2d2WkEwOVdhVEJwTWRzN1JTVUZQSHB2MjQ5?=
 =?utf-8?B?Q1VIS0p5TjJnbmN1dDQ2TTMyM0d0Q2ZrTGFSZVRTOFJBWmpOQjc3K0VxM3F6?=
 =?utf-8?B?Q3lnQzQzMGNSZzNoU1hzWFcvdllSKy9RWUUvN05OMjEydGo4MTMvZz09?=
X-Exchange-RoutingPolicyChecked: OWlG1+ohOXzCOYX54wHc6xB+p99EMso67ThIiJY6HDgC4+7cLdr28jn2Y9JdEaMl6Imsr736Q8j8IMPfP6D3GbvE3RTBE+CetILLxu8g0SFXPJN1J2hS5AIs9SGs1JWM/7J1MGd4MjVhIzhF3JhIR2ocmaC3POHuRtfKF4q4XxOkWHXZYyto6Wz7qWIQJ2YfDD8vLm8Q1a5BylDVMBw3v9AEBa5t7Zkb1DiZJQAmPthkyBudD+jYo5xyMXsivEj5sy+CUPYsFItomc1Auk6kX4jlYEJk8WMj0OX5nu7QlAAgk5j/H4Tlo/8naG34vA0VxGh6ELfeRWrp3sDWbcWPGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d7123d-9119-4415-dba7-08ded8d329ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 07:17:38.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a2VARR7sTF/Bq5NQvEWqaE5TvVtAslmT5IkZ2XDi5pD46A7WN+8VTQt0kgeMbPUQ+ISwMg+StxTE2LL91MQRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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


On 16-06-2026 10:59, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
>
> v5:
> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
> - Change xe_fault_inject_descs to xe_fault_inject_entry.
> - Change 2025 to 2026.
>
> v6:
> - Change return comments of xe_fault_inject(). (Riana)
> - Remove full description of xe_fault_inject_debugfs_register().
>
> v7:
> - Move all fault inject helper functions in xe_debugfs.c (Riana)
> - Update commit message.
>
> v8:
> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
> - Remove CONFIG_FAULT_INJECTION block.
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c  | 45 +++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_debugfs.h  | 16 ++++++++++++
>   drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
>   drivers/gpu/drm/xe/xe_gt.h       |  8 ------
>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
>   5 files changed, 63 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..b3899bedf70b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_debugfs.h"
>   
> +#include <linux/bits.h>
>   #include <linux/debugfs.h>
>   #include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
> @@ -41,6 +42,46 @@
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>   
> +static struct {
> +	const char *name;
> +	u32 platforms;
> +	bool skip_on_vf;
> +	struct fault_attr *attr;
> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = &gt_reset_failure },
> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .platforms = BIT(XE_BATTLEMAGE),
> +				    .skip_on_vf = true,
> +				    .attr = &inject_csc_hw_error },


Here are my concerns with this patch before merging


I'm not fully convinced by this structure.
As we add more types in the future — fault injection that depends on 
sysctrl, guc
or anything else. This will keep accumulating.

> +};
> +
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(xe_fault_inject_entry[type].attr, 1);
> +}
> +
> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +					     struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < XE_FAULT_MAX; i++) {
> +		if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
> +			continue;
> +
> +		if (xe_fault_inject_entry[i].platforms &&
> +		    !(xe_fault_inject_entry[i].platforms & BIT(xe->info.platform)))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
> +					  xe_fault_inject_entry[i].attr);
> +	}
> +}
> +
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -563,8 +604,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +649,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 17f4c2f1b5e4..beedc7ebdaaa 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -6,8 +6,24 @@
>   #ifndef _XE_DEBUGFS_H_
>   #define _XE_DEBUGFS_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
> +/**
> + * enum xe_fault_type - Fault injection types
> + * @XE_FAULT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_MAX: Number of fault injection types
> + */
> +enum xe_fault_type {
> +	XE_FAULT_GT_RESET,
> +	XE_FAULT_CSC_HW_ERROR,
> +	XE_FAULT_MAX
> +};

I would still prefer an abstracted function.


Thanks
Riana

> +
> +bool xe_fault_inject(enum xe_fault_type type);
> +
>   #ifdef CONFIG_DEBUG_FS
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..eda8df8adf11 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bb.h"
> +#include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject(XE_FAULT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..f8e3ca63aabb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 4b72959b2276..bdbf87eb743d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_debugfs.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
