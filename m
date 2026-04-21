Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A878F94CA7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 20:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63010EDA2;
	Tue, 21 Apr 2026 20:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo65AYI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCAF10ED91
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776802673; x=1808338673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nZrMBFJLObWgrysrIsr+UO5HWKgx1UDcXCZ2ukeU12I=;
 b=Eo65AYI6OmuKurnRmn4gWjTfT+kz/qPxFiLbk/IdWErWEbHrAzv5ujy+
 kvgXMDIm8B9bWuQm0+86IrGdPaRppJqSvY0zXRVIm3tziXDOVMagGvtsq
 67P+Ytwq2BFSLDil0qB4lk0TKFEExb9N7tcA6NVUxpwGtldaBFmjXKCMD
 6hU5N9ewuJX8yk3WHr5AD1DZNNrRqKBmp07YHykN7iwK7ta4XU/moSG5W
 D0r4p8vE3MSj5+fibBvxJ0HZ2D09hTr8SdESMi6j59u2rqWTetrR6Q/s5
 MKXo8ep6jbeGR+D52P8CcfSO6Cpzfyh6O/lphC1IAKq6H9v6UFDeaJMf4 w==;
X-CSE-ConnectionGUID: D7HrdsEJS76DWM1GL5v9Tw==
X-CSE-MsgGUID: FM7iqO8LRCe8IqvLdxOQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77818034"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208,217";a="77818034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 13:17:52 -0700
X-CSE-ConnectionGUID: Ppn7/pz3SpWJWwHbpsdj5Q==
X-CSE-MsgGUID: Y+AyjwlUQQevwfKUrlsfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
 d="scan'208,217";a="236516054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 13:17:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 13:17:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 13:17:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 13:17:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQUnwRMROZnzhZpyMaJaKAV6nXLQvZRCUXZMR3NV8pNjSJotfJ8DZm/UOMxWquIQ2bagPe65bgYHZYrh2O1++uVR3jOS/F6VhsnHf0wli+tZM71dEVM/Q3IjKfcDi+dvNDNiBakFOVYXvDi65pU0Lg3sKEbAncabAR8Cni46frgnDpm5ZuYOXI2l8xbFW+1cBhNcQwqDsDAyiK3q947SfW0vLqVEZ7mibyp7Q6t8wcM8+k+Hdkol36OZ9mbhKvQF8uu+Y6NFBlCjDa7szQbc0cJGRQ6lXmkQWgnHsNyLkzfLU5JfxSYlhgUFGmgDK3E2ntmPV/y4X468WCEU02nPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihkLjTV9heidIYwzjUkhXzyAXpWiZwXq63FkX+9T65Y=;
 b=BhHdOB+8bqcq1kupXF6bQ8k3nSQ1yY2ajIkUdD1sQglreM0J46n60TmSW1G+uZZc3x05XnJXFnxrqJoCf+nJMBj7qM99z6C+Pa4iUH5RYrSLwaA5a4YIFAekCM57ELIFzTpdyzN2ZRuWPfVb1nGQyCXLWeN/wxFnqWRj51B3mzSt7JmQ9xleqdgQDVWMZz6Cft/axSjz+sgyIJ0qF1cRUjhWe0cQnqwjp2YIaFzECt0zO92ZXPl6x1O6nOUbQdiqID9Q3MEdQEc1oAQ/8fRxNQ5qjKgqqUJ9Boxjnf6qEIRbsKHUBHE9TPfBNYrFZ8elhZIsUPQANAFVKKGp7XZ1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 20:17:48 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 20:17:46 +0000
Content-Type: multipart/alternative;
 boundary="------------3E0DJXWCw002cxRwQ5UyUv0g"
Message-ID: <3c3bcdd4-e503-4fb5-9e1e-a5dfcddab8dd@intel.com>
Date: Wed, 22 Apr 2026 01:47:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/sysctrl: Add helper to query application status
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <anshuman.gupta@intel.com>,
 <michael.j.ruhl@intel.com>, <mohamed.mansoor.v@intel.com>
References: <20260421153832.3785987-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260421153832.3785987-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fd80b4-670d-49d8-3c62-08de9fe30d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|8096899003|22082099003;
X-Microsoft-Antispam-Message-Info: GD9w8WdO8pQRtQjnTlP14mo06wSnMcRJDoliNuZ20OtuENT+w3EvX9iQ9LtlJfsNczGW4fGu9AEaPgrAOfrXBJl7b54h/FxpJczXDcVJ+jBgv39kxed+52QAuwkKnz1m6HedtAc74HIUHefw1CiGOQHjd3mzXu6D70YeA2GZ46Rg9d5955JnEcxM+HN3UC4k0g1V7uderDh6n27XYLF0hzGfpd2gXM+pMuUkte50Yz7Jspk8GPeyMPG1fRvjP3R2KFZXUK/PBrMzbnFGDLuwamuTtShdMlDWaGdRQcFic75Bz5a2J7r6V4EYqYIRmPXaVUfvFi3f16nZAyfNMl4m2FIkul5gFK9Ud1J6wgRsN0AoCLFXAurLxA+D+I5mBaMRHvr+a8VO1xEVFBojgAQXV1gUIax9MoqeyBfcgemOYXhH2NCWE+nkADj9/kkC7Vv0rGar7tja2cfJRqVCyxxtKvzT1hTKEXgNMz5sJtl/SrU3FdAQwF1ps/g2783AT+lna714iBinXcB6Jy7iaOon0ZZir/iK+WetT27/QwRq6NcfG2oHslBgDARn0fZEuccxEPvw6Tq1ELMeTD3VsXPw/bREd4s+D9In+ou//E4TmQRbZzddWBolaHSJjMsE155CxL9eqY9Pdu4jEOZ5eRPJVX+6+dQm4wo4Gi8C7eOffvfn7mDJJfC+RFRnAbYic8Mjtr8N38aXRtS7V37sbiLsVT0QSL/64tdzhJ0BMg6pGzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(8096899003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25ycHByL2JEcTY0aEQ0RTlGWjN1dGFzVU5CZE1QbjBXbWlUV2VBREl1VDVZ?=
 =?utf-8?B?amFZWkkwSk1Ra2ZOQ3ROakY1Y1BFNy9majVpZE5hRVJacWlvZkRPOHBJM3Bx?=
 =?utf-8?B?MlQ2ZWExSUlGVmFTZzFZZUZnWDdPWUtlSk9NK1c3Wk9MNURyNnUvWFMwdVh0?=
 =?utf-8?B?bTA5VGRBT2NrRElWMzNkVDRWSUFhZHNJSTlyQXZ4RVRrUnFuNUVSR0xKM2NY?=
 =?utf-8?B?ODkxaXpkMkNOcXF4YTdUa1I0N0Z3Q0NUd3JoTFdXcVdZbXRVaXZPVEhQL2Zx?=
 =?utf-8?B?RGlhcnRwUUtxdDZGcnZoUTc4NmhuT1k4UmwxWHRNK3pPTHFFS3QvVVJVQ1NO?=
 =?utf-8?B?VjVkTXcrMWFvbDZJYnhjTmpZdVFra1FZcW5zMHFxWEhIeFk4c3ZnUEt5WDY5?=
 =?utf-8?B?NVRlNTBESzhLRFNEcys4OS9ob0VzMzlOZm1zUGszdFFoM2ZmOGNpRmtSYUxp?=
 =?utf-8?B?UEJtUElPbER0OFFEN3J6UlRxUkRFOEd5VjllaHhLL0VJQ1pFVTBZK21yWGdY?=
 =?utf-8?B?aU1kdEZqUjZBOFBlcFBNRDREc2U3UjdZRVYyZWlpYWcwMlZ4akRPd2E4Nnpk?=
 =?utf-8?B?b0wra21abHI5NGo1WUtESk54NHY2bFdPU1VsZ0NvUkxFZWlTcXQwYzJGbC8v?=
 =?utf-8?B?aWsrM1U1S3RJK3BLc296N1M1d25HU0EwYXZKemQ2clJrT09wUWNEdG9va2JL?=
 =?utf-8?B?R0N5VjVqZlI4R1cvZitBcVVHR1V0MjV5VUN1MWtYTnh6WlVMenBLUUZEaDFm?=
 =?utf-8?B?cWY3dVlsbnZkUDkwbkEvTy9Qa0UxWkEvcDJXT0l4QVB1QkhScXBXeVFjR3Zz?=
 =?utf-8?B?bmRPdlpsTXl3a3g3RHZTTWVYQTYwOWlUNzVKVE1IdmwrU0VsMDNEbEN6THEy?=
 =?utf-8?B?UHhOejlUVnQxZGFtcm0yQXVyMkhrSy9iWlpyTkNpM0ZzTFNObURUUjZBdGhK?=
 =?utf-8?B?WHhFaFN3Z0hjWmtqdWdyT1gxRXJaNDR5VzFRSkQ5TXVtSUJCN3NYVFRTRVZS?=
 =?utf-8?B?RGxHTk1ZWnJUTWJudzhPc2pYcHVUcnA1ZnFlTzBYN1BENkRNeDJqalpyUW4y?=
 =?utf-8?B?eXRQc2FGbkxTbGx1WUw4cnhjeDRPaXRLSllTUlZkc1lQVjFLYzh0TTdPcHRq?=
 =?utf-8?B?ajl5MnFibzVFQ1V0a0t6ZkxEYTRNcE1WeHF0UitxZWQ2NUZwTTNRWkkrczZp?=
 =?utf-8?B?eFBRRkVHMTBJSVR1ZnVZbEhKOUU5aTVVVTljd0plWVJEeVRGL1I5T2JhRG04?=
 =?utf-8?B?NFlmWVZBL09ROFFodEh1d3RXanp6cVJ1WlMzYXIrY0hDejFnZ0ljam1lLzR4?=
 =?utf-8?B?VTRoN25QZEVlU3MrMDk3RjhkeHo5YlRKdHFNaUM0UDdqbCt5L3NicFNPbU1I?=
 =?utf-8?B?QWlvWDVpUGZNQWhncUFTczFza2ZRbjdVblhONUxpdjNzRGRtWkFpcGZPUHZL?=
 =?utf-8?B?ZVMwZ1MwVFljTjl2T3NIZHZTTDhkQkxTank5UjIzbkg4NHpZdml0Vm1lQnRF?=
 =?utf-8?B?Mk1MZDl2MEE5a1hwak81cy85RnQ2ZW1HdU5Oc2VsODIvYURlNGpXNnJrcGtj?=
 =?utf-8?B?bE5TSmZPZFpOQU5nVmcwTFAzN2xLM1dxMDZhdnpMUjBVSUx3TUl0ZERyOUFK?=
 =?utf-8?B?dGl5cWJuZTJ5VmNqQy9OU3U1Ly9NRzI5bDZOa3ZGU0xURkoyMk44WDBxcXV1?=
 =?utf-8?B?MjFuOVBBYlhwZ3NKVGpOMjNYMzZBSm00bkgramRoMXlxQnNGZTFUVVBxOFd0?=
 =?utf-8?B?VTVYOXAxVlVLbHlxNnJHQkh3ekNQcHByVW1vWUd2bWFjTVNUQTJIaWdUcFN4?=
 =?utf-8?B?UVBnMmMrZVBOWU45UmVSNXZIbENQUm42Z3lUUUVheGxOem1Xa1VsdEVqQTZl?=
 =?utf-8?B?MmdiUEdqZUlnR2tCYWlqWmdYZVp3UVhTMjFjVTdTOFY3RTR5Wm41VXFKc1dJ?=
 =?utf-8?B?UE5PSmxNTGZYQVk1c3FMM0ZQaGVzY29MWEQrT3JZOHN3RTVrY29SOFQyL0pH?=
 =?utf-8?B?dFN2ankydy80Lzh4cDBuakJpbDl3R21kbHg0eWJKOUhsNW4rWXpLL2pQd1dq?=
 =?utf-8?B?TmVJd2IxUnEyazlEUmxUOXFPOXJJd3NPSTNiaDZBMnBTQm8rVnh5cXNtZE43?=
 =?utf-8?B?cmx6Y2thV1VmS296b3Z5SE9wVytaWmUvd3lXOVFFdGkzTlc4UFdZRDlaM0h1?=
 =?utf-8?B?RHVNY25qWS9tRmlING1idzcvblZjeVhLR3MySzV1bXF4LzZDeklOWHNZSFZQ?=
 =?utf-8?B?cDZHMEdCU2hvWEt0bXVsb3RLaVNOWjlMbWZHeUlYU3Y1RWIzNTF1SGFNMTBQ?=
 =?utf-8?B?SFVhbk1KM01hUUNKbTBjQjB1WmhJcXNLWFVpbGhVMTRoZURtZThkUT09?=
X-Exchange-RoutingPolicyChecked: R7Oe2c8ZqFHEg/Lw/BHrpcxpYjL+QTKBjcSgtjnxMsqETo5+zDobG+KGwCDLLRVfHtyeZVzZ0+3njX+kKd1/OS4RKCQYAsqj6yusiiuEp4vhQEX4QDkEfywhBU3y2ZuzrfLtaQ2MVx77rgDjjBYxas1ZkkW1NqZobEgExEuWvkPKjzuB9xIKfFHRdEdv1RdEYg5f9qPbiKmC3cl1ql9uYjWN7vK04rBcmzC71dp/MuNDbfheHtIZ8WndKo3bKCys1J+LlGc2gaE3C25iDwfUtu8sLLbdyw42t/Z0wEnUr1p4VJwAP1YGFQyns53MjP5SB06iX9jRzbqaWbWBwmJhgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fd80b4-670d-49d8-3c62-08de9fe30d60
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 20:17:46.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMCHHXP4kbPsVIrgbzBbKknqoLFlbnKPRNR3Y5fNRK/hWYSvSWj4E5md6fDk17WWuDnFBTzFH1vtheYM18pyAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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

--------------3E0DJXWCw002cxRwQ5UyUv0g
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 21-04-2026 21:08, Anoop, Vijay wrote:
> From: Anoop Vijay<anoop.c.vijay@intel.com>
>
> Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
> application is loaded and booted, returning error codes for not loaded
> or not booted states.
Fix the commit message.
>
> Signed-off-by: Anoop Vijay<anoop.c.vijay@intel.com>
> ---
> v2: (Badal)
> - Return SysCtrl firmware application states instead of errno for application lifecycle conditions
> ---
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 44 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c         | 65 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
>   3 files changed, 110 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..8ed9ba791f3f 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -62,4 +62,48 @@ struct xe_sysctrl_app_msg_hdr {
>   #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>   #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>   
> +/** System Controller Core command group */
> +#define XE_SYSCTRL_GROUP_CORE		0xFF
> +
> +/*
> + * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
> + *
> + * Check if a System Controller application is loaded and its status.
> + *
> + * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
> + * Command: 0x04
> + */
> +#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
> +
> +/**
> + * struct xe_sysctrl_get_app_status_req - Get application status request
> + * @app_name: Application name (16 bytes, null-terminated)
> + */
> +struct xe_sysctrl_get_app_status_req {
> +	char app_name[16];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_get_app_status_resp - Get application status response
> + * @handle: Identifier used to control the app
> + * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
> + */
> +struct xe_sysctrl_get_app_status_resp {
> +	u16 handle;
> +	u16 flags;
> +} __packed;
> +
> +/**
> + * DOC: System Controller Application Status Flags
> + *
> + * Flags returned in xe_sysctrl_get_app_status_resp indicating the
> + * current state of a System Controller application.
> + */
> +
> +enum xe_sysctrl_fw_status {
> +	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED = 0, /* Firmware application not loaded */
> +	XE_SYSCTRL_FIRMWARE_APP_LOADED,		/* Firmware application loaded, but not booted */
> +	XE_SYSCTRL_FIRMWARE_APP_BOOTED,		/* Firmware application booted */
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2bcef304eb9a..8d51f8cdaaa4 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -14,8 +14,11 @@
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   #include "xe_sysctrl_types.h"
>   
> +#define XE_SYSCTRL_APP_BOOTED	BIT(2)
In previous revision there were more bits. Any specific reason to drop 
them in this rev.
> +
>   /**
>    * DOC: System Controller (sysctrl)
>    *
> @@ -99,3 +102,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>   
>   	xe_sysctrl_mailbox_init(sc);
>   }
> +
> +/**
> + * xe_sysctrl_check_app_status - Check if System Controller app is loaded
> + * @xe: xe device instance
> + * @app_name: Name of the application to check (max 15 chars + null terminator)
> + *
> + * Query System Controller firmware to verify if the specified application
> + * is loaded and booted. This is typically required before sending commands
> + * to application-specific command groups.
> + *
> + * Common application names:
> + * - "ocode"- oCode
> + * - "diag" - Dianostics
> + *
> + * Return: XE_SYSCTRL_FIRMWARE_APP_BOOTED if app is loaded and booted, error code otherwise:
> + *		-EOPNOTSUPP if System Controller is not available
> + *		-EINVAL if app_name is invalid
> + *		-EIO if communication with firmware failed
> + *		XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED if application is not loaded
> + *		XE_SYSCTRL_FIRMWARE_APP_LOADED if application is loaded but not booted yet
> + */
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)
> +{
> +	struct xe_sysctrl_get_app_status_req req = {};
> +	struct xe_sysctrl_get_app_status_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	u16 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return -EOPNOTSUPP;
> +
> +	if (!app_name || strlen(app_name) == 0 || strlen(app_name) >= sizeof(req.app_name))
> +		return -EINVAL;
Is this check necessary? IMO for invalid app name XE_SYSCTRL_APP_VALID 
bit will not be set. You can add enum as XE_SYSCTRL_FIRMWARE_APP_INVALID.
> +
> +	strscpy(req.app_name, app_name, sizeof(req.app_name));
> +
> +	cmd.header.data =
> +		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
> +			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
> +			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
> +
> +	cmd.data_in = &req;
> +	cmd.data_in_len = sizeof(req);
> +	cmd.data_out = &resp;
> +	cmd.data_out_len = sizeof(resp);
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;

Is it appropriate to treat error as XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED? 
As per my understanding when app is not loaded then only 
XE_SYSCTRL_APP_VALID should be returned.

Thanks, Badal

> +
> +	if (out_len != sizeof(resp))
> +		return -EIO;
> +
> +	flags = le16_to_cpu(resp.flags);
> +
> +	if (!(flags & XE_SYSCTRL_APP_BOOTED))
> +		return XE_SYSCTRL_FIRMWARE_APP_LOADED;
> +
> +	return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f3b0f3716b2f..db2743d54cea 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
>   
>   #endif
--------------3E0DJXWCw002cxRwQ5UyUv0g
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-04-2026 21:08, Anoop, Vijay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260421153832.3785987-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>

Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
application is loaded and booted, returning error codes for not loaded
or not booted states.</pre>
    </blockquote>
    <font face="monospace">Fix the commit message.&nbsp;</font>
    <blockquote type="cite" cite="mid:20260421153832.3785987-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
---
v2: (Badal)
- Return SysCtrl firmware application states instead of errno for application lifecycle conditions
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 44 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c         | 65 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
 3 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..8ed9ba791f3f 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -62,4 +62,48 @@ struct xe_sysctrl_app_msg_hdr {
 #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
 #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
 
+/** System Controller Core command group */
+#define XE_SYSCTRL_GROUP_CORE		0xFF
+
+/*
+ * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
+ *
+ * Check if a System Controller application is loaded and its status.
+ *
+ * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
+ * Command: 0x04
+ */
+#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
+
+/**
+ * struct xe_sysctrl_get_app_status_req - Get application status request
+ * @app_name: Application name (16 bytes, null-terminated)
+ */
+struct xe_sysctrl_get_app_status_req {
+	char app_name[16];
+} __packed;
+
+/**
+ * struct xe_sysctrl_get_app_status_resp - Get application status response
+ * @handle: Identifier used to control the app
+ * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
+ */
+struct xe_sysctrl_get_app_status_resp {
+	u16 handle;
+	u16 flags;
+} __packed;
+
+/**
+ * DOC: System Controller Application Status Flags
+ *
+ * Flags returned in xe_sysctrl_get_app_status_resp indicating the
+ * current state of a System Controller application.
+ */
+
+enum xe_sysctrl_fw_status {
+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED = 0, /* Firmware application not loaded */
+	XE_SYSCTRL_FIRMWARE_APP_LOADED,		/* Firmware application loaded, but not booted */
+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,		/* Firmware application booted */
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2bcef304eb9a..8d51f8cdaaa4 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -14,8 +14,11 @@
 #include &quot;xe_soc_remapper.h&quot;
 #include &quot;xe_sysctrl.h&quot;
 #include &quot;xe_sysctrl_mailbox.h&quot;
+#include &quot;xe_sysctrl_mailbox_types.h&quot;
 #include &quot;xe_sysctrl_types.h&quot;
 
+#define XE_SYSCTRL_APP_BOOTED	BIT(2)</pre>
    </blockquote>
    <font face="monospace">In previous revision there were more bits.
      Any specific reason to drop them in this rev.&nbsp;&nbsp;</font>
    <blockquote type="cite" cite="mid:20260421153832.3785987-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 /**
  * DOC: System Controller (sysctrl)
  *
@@ -99,3 +102,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe_sysctrl_mailbox_init(sc);
 }
+
+/**
+ * xe_sysctrl_check_app_status - Check if System Controller app is loaded
+ * @xe: xe device instance
+ * @app_name: Name of the application to check (max 15 chars + null terminator)
+ *
+ * Query System Controller firmware to verify if the specified application
+ * is loaded and booted. This is typically required before sending commands
+ * to application-specific command groups.
+ *
+ * Common application names:
+ * - &quot;ocode&quot;- oCode
+ * - &quot;diag&quot; - Dianostics
+ *
+ * Return: XE_SYSCTRL_FIRMWARE_APP_BOOTED if app is loaded and booted, error code otherwise:
+ *		-EOPNOTSUPP if System Controller is not available
+ *		-EINVAL if app_name is invalid
+ *		-EIO if communication with firmware failed
+ *		XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED if application is not loaded
+ *		XE_SYSCTRL_FIRMWARE_APP_LOADED if application is loaded but not booted yet
+ */
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)
+{
+	struct xe_sysctrl_get_app_status_req req = {};
+	struct xe_sysctrl_get_app_status_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	u16 flags;
+	int ret;
+
+	if (!xe-&gt;info.has_sysctrl)
+		return -EOPNOTSUPP;
+
+	if (!app_name || strlen(app_name) == 0 || strlen(app_name) &gt;= sizeof(req.app_name))
+		return -EINVAL;</pre>
    </blockquote>
    <font face="monospace">Is this check necessary? IMO for invalid app
      name&nbsp;</font><font face="monospace"><span style="white-space: pre-wrap">XE_SYSCTRL_APP_VALID </span></font><font face="monospace">bit will not be set. You can add enum as
      XE_SYSCTRL_FIRMWARE_APP_INVALID.&nbsp;&nbsp;</font>
    <blockquote type="cite" cite="mid:20260421153832.3785987-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	strscpy(req.app_name, app_name, sizeof(req.app_name));
+
+	cmd.header.data =
+		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
+			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
+			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
+
+	cmd.data_in = &amp;req;
+	cmd.data_in_len = sizeof(req);
+	cmd.data_out = &amp;resp;
+	cmd.data_out_len = sizeof(resp);
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;cmd, &amp;out_len);
+	if (ret)
+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;</pre>
    </blockquote>
    <p><font face="monospace">Is it appropriate to treat error as&nbsp;</font><font face="monospace"><span style="white-space: pre-wrap">XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED? 
As per my understanding when app is not loaded then only XE_SYSCTRL_APP_VALID should be returned.</span></font></p>
    <p><font face="monospace"><span style="white-space: pre-wrap">Thanks,
Badal </span></font></p>
    <blockquote type="cite" cite="mid:20260421153832.3785987-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	if (out_len != sizeof(resp))
+		return -EIO;
+
+	flags = le16_to_cpu(resp.flags);
+
+	if (!(flags &amp; XE_SYSCTRL_APP_BOOTED))
+		return XE_SYSCTRL_FIRMWARE_APP_LOADED;
+
+	return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index f3b0f3716b2f..db2743d54cea 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------3E0DJXWCw002cxRwQ5UyUv0g--
