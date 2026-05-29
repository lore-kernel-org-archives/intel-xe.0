Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17736CD6E43
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 10:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03DB10FC8B;
	Fri, 29 May 2026 10:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRiTFgdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15E110FC8B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780049895; x=1811585895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Zt8WTVgOHxsw8P15mYyPbBkmGvDvw4/cUHTwxV4BGo=;
 b=dRiTFgdcO6WVq7+pYzdlr04sR8EkUId/NX3hRtTHKhA+Czc6YXZ2dVik
 FJMvfaUvdAZOBcctlsU3wLzipEqB//TPQtAzl2fvY78NnkMui4oFdocNj
 Azi0M62hchOx0hu6HtreSgl58Ba+CptNLxjMSxBBPXGxwZ3hrRmmRde72
 93XbgU3yapAGNOOqcbcxWX3I9IRWHols+OYmKamTIqfcZNuapGzhWo6gU
 TvIQCNOBLUfVdGbgPsaDzKOhsNtERbKYnxITKCBD/YvVGMcDy43akzpXm
 eIVhGnrf2/K8LDIqDxmFR8VK+Sx1FuoYkXALt+WntcGbDyD1dfP4XOWq3 g==;
X-CSE-ConnectionGUID: HIgmrkYVS+Wk8H9oMBVyIg==
X-CSE-MsgGUID: 2MGgi/iYSYe7M+qTU5eicg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92283179"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92283179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 03:18:14 -0700
X-CSE-ConnectionGUID: Rnneanc8QsapHSD4hJgBDg==
X-CSE-MsgGUID: 1hHs/5IqR1ejVIuxe9FESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="242954705"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 03:18:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 03:18:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 03:18:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 03:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HR3TffwsY/8Z0dPxr73GI5PNSoUNKLAhscFDZQmTYvNn/9tylYyCU5mnvk3ntIUem0pz2SIpSo+H3z8ZaXhihy05g5z/pvXRiI/PPNx/KPLxdm+wdwS6z5wpnNtWVooG1SUAOMuvPELxzbnQFETdy76U9J1iZK9DxaI3PigTGsPeB+JHXMlD/ZiuDiE4m7qVgFewAkjDqofvwpqzCGiWf1By/e2o0N6ZhaXNM2ZlOIvAz3rv0YTUX2qV/19FK9erm8aXJP5jDPjOkVLc1liaW2SaMA3OZtC4SWaGMM+3mObTqDtUZdnAZopSNesLQE6eBiGcx2brA+q/+/Lo4RrkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/XrODsAdckSsPRiQwuW1UsSE19135CI/coZcsIs3aY=;
 b=G6iVeLttpQL2FISFpZV8fyysYE8na/JaEPGuglD+HGx0Q0wEAXT9mymalwnfjPBbHxAIgdyzerTx7lyy4pfVkRQ4+ZgL/upMV5EvsAoxX53htRaog5TuiNB/FVtyeH+6ibMxMtUZQ2cVBdRNLw+ATXbnDcW/zlsO4KMjcMWe2zY1sZ/y2XT9E7RrZTKcEQanIg6/buggDutk4AcbBLgaN6Ja8tMFgFtwhEdga0wIH0AKNuLaXsMd5WAQ//85NduNCD48xzcEZl/+5+HCM2jt2JsOxgAfcWngoxZcHHm3DVlR3l7L4uPt862iPlLsk0GOhjt1PbvNaUcZR3U4tWbLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 10:18:03 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 10:18:03 +0000
Message-ID: <eaf3ae99-272f-44ed-9b3a-4aaaef99a8bc@intel.com>
Date: Fri, 29 May 2026 15:47:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] drm/xe: Skip device access during PCI error
 recovery
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-22-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260525100619.3155663-22-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0061.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::6) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: aa948574-4c4a-4c37-3929-08debd6b9161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|6133799003|22082099003|56012099006|18002099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: W5030fzoczK1Ryb+CRJ1bexkjsgwMUjP824uRhuerIT8sUKJqEe0RIlQoz/k3lE/20nIE97CkIc4tnq5ZgmkgrTJJLJJvn5n8iN6bC1HRHjPKC5pd4V5Ihl7apaSjEdxOIF/ad4pm780eMpJZ+FHTIO/QG5LSKHwEY51P41/QohmTxb1CP9GKZtbh6BqFk4Rva6f5lim9/MoF7HBeZpV0rDjNo5iLnDBVG6jLhfNpLmA7H+mVuiXqUz+YiHF+8bpsrUvYFomIkdCKPRnHHZ29qr5r6fH+yJTTJZWTtMG7gaydwzfH3jAIzsuVxvbod2MN2T4ia5yrLNvS8ZPwSm1k3+g+kwiiqmi6EfIo86XZaSgA4BxUJ2hkm8dmBWmQ9PPWG0pkRlIPgXSHXo9yjAjDp2v8uhFe6Ch6erf+0FNSolEfYxV76/2hkmriNteuOdKfha4CcKRzOw1ldvlH4mfkZR5f0Sj2HayONADq/c8RNfaZjSywFb7n0eup24UX+rh5MrG8X87pr21eZTr7iv5TPq/XB73TQkQAB9KDWah0xMNIY+RRw12gg6143WjliaWCRpHOxj41YjuQq6uWc2zSbei4+lWrOBaXlkRp0foubieCMiJcVVrp3K4TQ66plTbYoF+zdm2vcQdcp7l4gl1mPfBOskE3xFQYsjRdM2JGOOvObcJHxrhOaJpAZ4oKPim0AImxFMLD8gQrtPfvKakCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(22082099003)(56012099006)(18002099003)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdrWUZ0MlFsb29GdjNhS0phWURIL29kWG1pQnpXOERWWDlwZTd1UmZ1SHd3?=
 =?utf-8?B?M2NYVENDMEJSUW82RDBQdTdkZkN3VExVMGsvQ3hhVEhnVk56U0dJazFBS0Rl?=
 =?utf-8?B?QTU3TnlmK1dKV1QraDkrNHU3TXZEQ0JjSS9idEYwcFpIMWlDbG5idFIzZzV5?=
 =?utf-8?B?VUowRXd1TlVVbm5pRFk3VW1xTzJlYU1QUmhiRzJtWFhkZmd6RDROeWlYWWw1?=
 =?utf-8?B?WThuMHlQMnErUml6aTMwcjQyNDd1SG8vM0llNDhSZmgxM1RHOGJlU1VOQ015?=
 =?utf-8?B?cHlUL1k3R25iOUJ2dWpuaWJHVDlRdDlON3RUeDZJaVFTN0w3YWRpUmQyaGxB?=
 =?utf-8?B?K0hrRlF6RFBnM3NzckZmTVJNbTBTeFpvc2RTOG4rK0ZkcDZJWDY2emVBMCtw?=
 =?utf-8?B?M3RuN3lPd1c0dStxdVlpV2NRQm9BQ0ZsTnF0L3NuRFRLeFc5a0c4L3A0WStw?=
 =?utf-8?B?NUdYcXVka0VmdkxDWmN2TWFJN0p5SFZiTlJNN2ZZRDZSd0QzQmFadVZxMkJW?=
 =?utf-8?B?MkZIeTRQeG1CcnRQY1dVYXg1ZVR1UC85Q1NGRHBrcjU1UVB5MU10bUtnUVJw?=
 =?utf-8?B?WVYybDc4UkI2N1FOR2Y3RFRnTVhDeE56bDh3YXc5NGZpLytrQktIbkFndEYz?=
 =?utf-8?B?S3J5cUhGWjNOQ0liSzZMMy9jQWFtMFVnK2YrL2tNU1gzTnhxVVBHUWJkNjFv?=
 =?utf-8?B?THB5dzhDK3pBYStNSXQ3TXVhNktGYlRTRWgwbWwvVEIwT25tK2J5N3kyRlkr?=
 =?utf-8?B?MmwzUktMT0F2Wm1DRUlOYlBYQmh4LzVqYTFKb0Nlenl6Q21pWDg3aS9ZQ2ph?=
 =?utf-8?B?Z2xmM2hzMmswK3hqSFdqU2J3QlpnRFZyc1paSjQ4UUJFUGZXQzEvL1g3d2hq?=
 =?utf-8?B?eDdsbFNmUE9IUkJnYkt0ZW93T05IWGRIZC9WcE1uVjFsU2wyNG5aSTR6ZkUy?=
 =?utf-8?B?cmFGMnpVQ0Ewd2RHaEpVYmJvN25ZY1MxS2RubFljdVRXQytjbzdRcVZyWlB5?=
 =?utf-8?B?VWptbWxmalRBUzlyL2padGlTVm1rbzRRMFRyNzJLZUw5eGVPWC9GT1ExSGN3?=
 =?utf-8?B?aWRtOXFPYVovTEF0eVdhNGovUGdSclFUbEhseUJzUFozWmcwZk11bzlFTjJG?=
 =?utf-8?B?dG9JRjI0WWp3Z2d0RjErZ1dZRXVtaXlYZmQ4TmJ1NUNrT3lQQU9MUFpVRUxZ?=
 =?utf-8?B?bzFNWnVKYjR2Q1I0YmNBZEJuMmIwVVQwbjErU3BDd0o2M01EY05jdWFvRXo1?=
 =?utf-8?B?VmVjdC9vL1RCRHA1S01ZcTFKRmtEQVNCWGd3ZGFqUFRuZlhFZlZlUTdLRzZj?=
 =?utf-8?B?UkpBVFRSU2NNbE5sS3FzZWNzeG8wMjZ6TGlzVzJabEV6eUVpUWRJYWlyYW5j?=
 =?utf-8?B?cXJFaWRxaHdaYnNHRENBUXdPSnlRVXpTa1ltbGVXL1ZDdmlvVTM3OXZLYyt1?=
 =?utf-8?B?R3RSQlZHempWSlFhMlpwUGdNQzMwS1JyclpTanVqS0JxT1A0WWJ0SzZJQ1JR?=
 =?utf-8?B?VS9LZ1huMUNSK09oZkNybWtNRUs5cnhIc2dSUm82QXplZnJDMzQwVmVXYzhj?=
 =?utf-8?B?czlhazBNZ1EyUW5UVTVjb0N5cVc1cmpiSndoL25TaDYybmZreHQ0TVVpeGt5?=
 =?utf-8?B?Um0vUG9wc0dDbVlVQ2dPMVhZalhGSE5taUZSeGJZOUlyb2VsMEszNDR0Q1Iv?=
 =?utf-8?B?ZDJUQWNDRldld0tHc28xVlM1ZWl3cUF2bDNscUphRkJXd1BtWDhkWE93Ullv?=
 =?utf-8?B?ZEVLcVdrUW5INERuWWc4MEg3UnR6dFB6SVZkcys5OUx3NWJ6RVhuWUdyb1Iw?=
 =?utf-8?B?dGRPM0VET24yQm9SN2VxYjlVaURKbkVYRC9xN3VPOE1lWWhyNTAreGQ4b29W?=
 =?utf-8?B?L1FaT0h3R3FidGdMb0hKYUhGeEIwbUJrWnJhdzQzV1MvNVpzOXRhUXY4bm9H?=
 =?utf-8?B?c2xGR1ZuWEdRL0Uzd0Q2N0pESEFVYkFDbGJhU2FzTlV4YWJaRGl5amdaOUVJ?=
 =?utf-8?B?cm9JVlNYd2duV09qLzFoazJLam9sM0dkMlhvU29qNzBIeXVhVWcwWDhUS2dz?=
 =?utf-8?B?NGVjT0hySC9MUGQ4bzU2c3MwNi9hYjZHZFEyVUpwV2hnQlZJeDR3U2tBNVdr?=
 =?utf-8?B?R1l1MWNSL203WVhLTVdOam1RcjRhUEsvZWJid0FGNTBlYkRaa04zNldjS3g4?=
 =?utf-8?B?UVgycHZjcGQ4eVlMZHdDTTdjekliMWZ5S01WTW5Qc3c4OVFZTmJIVFAxU08r?=
 =?utf-8?B?eW1pQ1liOXhtVVZQemNlclZINktiOXc5K21nMWFrK09rZUYzMHo2MHR4S2I2?=
 =?utf-8?B?cFFpM3lORHRsV0RBaXhXYnJUQ3VRUWVPaXg0K3BLSkRHQzNkTGhkSlRpQ2Rk?=
 =?utf-8?Q?SUjOCZV56j8fk8wY=3D?=
X-Exchange-RoutingPolicyChecked: U+2UNSf4RpLzgZ/rMzE6eKTas19gGRldS4so5ua6WO4lD5jcx/b9X4pz6cfGUr4giyFJQOgsh8Lns5FcUKXQ3G/0eyr89zhkDfX23UzccJAKxacbs3S0+Lf2gVqPr+n7WjOwIfybUQfKPbjqOXv263B1LdReumNVsNgPCpCIPCZllnsOsPwFe8nGwZkiIvd+d2VMrBW66PIvgqVESW1+NMG3sGwiSjmzNO1TfIbzLofp+c+72ucibbZAox+jz7sq3T9/yyY9t2v+c7P/OVww86MIjaJGZf2bPSV63R06zpahCnR+CTK1JZ1+XABWoO7+883rf9UUDm3GitumXFXgwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa948574-4c4a-4c37-3929-08debd6b9161
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 10:18:03.5772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHrOGuRkieQPWTAnnKk4PsUg3yruJPNT2DMNvegSbkf3e51xLZOfB0Gy9GBMP+lWJj9n8D+g6i7ZBZdrlyK/f7AAaJU3HQkphSuIGYVBDTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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


On 25-05-2026 03:36 pm, Riana Tauro wrote:
> When a fatal error occurs and the error_detected callback is
> invoked the device is inaccessible. The error_detected callback
> wedges the device causing the jobs to timeout.
>
> The timedout handler acquires forcewake to dump devcoredump and
> triggers a GT reset. Since the device is inaccessible this causes
> errors. Skip all mmio accesses and gt reset when the device
> is in reset.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add check in worker (Mallesh)
>
> v3: add in_reset calls (Raag)
>      rename in_recovery to in_reset
>
> v4: fix typo
>      combine gt reset log (Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_gt.c           | 14 ++++++++++----
>   drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
>   drivers/gpu/drm/xe/xe_pci_error.c    |  3 +++
>   5 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 355d69dc8f54..765e90f4220f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const struct xe_device *xe)
>   	return xe->info.has_mert;
>   }
>   
> +static inline bool xe_device_is_in_reset(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_reset);
> +}
> +
> +static inline void xe_device_set_in_reset(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_reset, 1);
> +}
> +
> +static inline void xe_device_clear_in_reset(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_reset, 0);
> +}
> +
>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>   
>   void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 714d2e25d3b0..f64e1a149cee 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -483,6 +483,9 @@ struct xe_device {
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> +	/** @in_reset: Indicates if device is in reset */
> +	atomic_t in_reset;
> +
>   	/** @wedged: Struct to control Wedged States and mode */
>   	struct {
>   		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..d904527a8898 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (xe_device_wedged(gt_to_xe(gt)))
>   		goto err_pm_put;
>   
> +	if (xe_device_is_in_reset(gt_to_xe(gt)))
> +		goto err_pm_put;
> +
>   	/* We only support GT resets with GuC submission */
>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>   		goto err_pm_put;
> @@ -977,18 +980,21 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   void xe_gt_reset_async(struct xe_gt *gt)
>   {
> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_device_is_in_reset(xe))
> +		return;
>   
>   	/* Don't do a reset while one is already in flight */
>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
> -	xe_gt_info(gt, "reset queued\n");
> +	xe_gt_info(gt, "reset queued from %ps\n", __builtin_return_address(0));
>   
>   	/* Pair with put in gt_reset_worker() if work is enqueued */
> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	xe_pm_runtime_get_noresume(xe);
>   	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
> -		xe_pm_runtime_put(gt_to_xe(gt));
> +		xe_pm_runtime_put(xe);
>   }
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afd8cc7bd231..f21a1f709c4a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1514,7 +1514,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * If devcoredump not captured and GuC capture for the job is not ready
>   	 * do manual capture first and decide later if we need to use it
>   	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&

nit: Check the length.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>   	    !xe_guc_capture_get_matching_and_lock(q)) {
>   		/* take force wake before engine register manual capture */
>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> @@ -1536,8 +1536,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	set_exec_queue_banned(q);
>   
>   	/* Kick job / queue off hardware */
> -	if (!wedged && (exec_queue_enabled(primary) ||
> -			exec_queue_pending_disable(primary))) {
> +	if (!xe_device_is_in_reset(xe) && !wedged &&
> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>   		int ret;
>   
>   		if (exec_queue_reset(primary))
> @@ -1605,7 +1605,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!exec_queue_killed(q))
> +	/* Do not access device if in reset */
> +	if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
>   		xe_devcoredump(q, job,
>   			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 7e714a02feb2..8792ccfbddf2 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -20,6 +20,8 @@ static void pci_prepare_reset(struct pci_dev *pdev)
>   	struct xe_gt *gt;
>   	u8 id;
>   
> +	xe_device_set_in_reset(xe);
> +
>   	/*
>   	 * Wedge the device to prevent userspace access but don't send the event yet.
>   	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
> @@ -89,6 +91,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	 * TODO: optimize by re-initializing only the hardware state and re-creating
>   	 * kernel BOs.
>   	 */
> +	xe_device_clear_in_reset(xe);
>   	pdev->driver->remove(pdev);
>   	devres_release_group(&pdev->dev, xe->devres_group_id);
>   
