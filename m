Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAF7CA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 21:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1DD10E293;
	Wed, 30 Sep 2026 21:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0X/C6Za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDDF10E293
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790802543; x=1822338543;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=im+xMKpZhVLklIoVqux14elERd0+lqHkkEwwBHS/uk4=;
 b=G0X/C6ZapS6Tckjreq6ag+fVquRpz95qzF9D1MMc81x0LNBvdJhei6bS
 b9/x5YuXuWpTpYI+aU8DcsN4eli8lwxHCFpRICjLlSZZVWVTw3zh7BMIe
 doNLx88gNwjYIkGyA+prqM+Sx5YZwrQ/Lwvn3qnGzN7mmy9zmV2FerETV
 1xTxiTmr+tYDaNywyIHoEJC1xzvD0LqWuy+QiJhwnBtFZn27npYB1JGzF
 /WCc49xjgKd9Q5+00CPCe0mkt3HnpLnMfT0KeB2mRrZJ2KTxfGMeNfgjI
 FKvMFRQARjjl+J8X04JWomitZeAKqfBOCdRnwpAZKq4vWyHgneGOtDSKa A==;
X-CSE-ConnectionGUID: apPLOR1xTmq2PZCvS4P67Q==
X-CSE-MsgGUID: bdCAuv+tT9WYewBA3tdO8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100883501"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="100883501"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 14:09:03 -0700
X-CSE-ConnectionGUID: ysate4bJSEK7bmDauZX+ig==
X-CSE-MsgGUID: nV428VmGS6yfMYa0NHr9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="273610110"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 14:09:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 14:09:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 14:09:02 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 14:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huQMVVrdC0/8KNpvgqNI35kqPMi4S3UqOMAGw+6unY8wZ1qWz8mPYWIhMpvMUCOaf0MxkMS+2krjpYvgPfVULnrnur2W8GjMteX8MBUoNXzInyQG0TWG9TGXSD50jPhPquOJgTQ7ByJ/DI1REbQq+iXoyCQHndHpZJBcjlhvzxy0DBGUtIpo+aT0DMDy7vHHHZF0YcycMGFJz2mjWFk2XgUz5leYtrSuOJQBWKHFxrmx+sjHgR6uKpkGB0aTKKH95KGwcGaNUBYOowChntxcRZKE+DGE/yPyqrY97JQ60rAmksmnyc4IJyshNomFvdAPTlR8t7dxJlJPs69BMlrWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc1lDv6fzVHnm+tc6QGuF/W5VrUYmyo3+0+TiuxqcrI=;
 b=J9/j2UCo1BDS6vu7W1lGQDs4HcLy3H+hVrbv8qHe+WuGn4AQcPDmDgkm6lebheqJwU008IFMaQOWoZE0sf93pyRrjaE6RbjkzG6g7HXwNRRrtW48V/7NWNy1vkMaU9E6CSU3Tx55VStEmh33WIrLY4eh3dIF/0c1c5rEfCF9Nmg7rMcVn8p2QwFiXJdJFj8yCi2UdR4HDlnGgsHYbvvMmj2QpSsi228DeCEAhIFznQbsbL8oqQGb+lLbNwiavadBjh1tpZ+3nkYVEM6MGKmRkhZ3GyBbEBeqh9PZlTwBn5UZsZlR/W4Uz+E4KG9r8XfJyXvTL2eaQ7xMTtyrebRVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 21:08:59 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 21:08:59 +0000
Message-ID: <b1717a63-df2e-4cf4-ae7f-5239c015eef7@intel.com>
Date: Wed, 30 Sep 2026 14:08:58 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IElt?=
 =?UTF-8?Q?plement_print_vfunc_for_page_fault_info_logging_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260928222241.3815153-2-brian3.nguyen@intel.com>
 <179065853962.217537.14659824266134611479@61270ab9df2a>
Content-Language: en-US
From: "Nguyen, Brian" <brian3.nguyen@intel.com>
In-Reply-To: <179065853962.217537.14659824266134611479@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::21) To SA1PR11MB8839.namprd11.prod.outlook.com
 (2603:10b6:806:467::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8839:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ab7941-b079-4fb5-9613-08df1f370c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|13003099007|4143699003|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qy9fVVP2kBubhuokGgDseEZwrCUqOXc1U0lPfIQ/4Ot5x52cU1qA7cG5m1saeozLw/EhSmJPOehvO5caRfLPZ9adqcugZbFhEYgM6sbw9cRayKB6H7QLLWjYEA3YF971MX5Q75LLU84JAo/hqsfMLGGwXOjT8VBJUftJ9om0kWr+UWF2lQxykZysMrrZuIfTh9jRxmM1/aqiDlCgHnmFibs55EMuldUy/WlO7Ltd91SrsRz6Qr+Rtfq1uR0RPG+aBzL7TPF80Xw7ejNPOPxkg1IbNaJFMtdP9f19DcUgLRgxInmQKYADTynHkWjaIrseO7O5TVJqesiZpjYLOVp/fvVDEXktmTvdSZDM5gCp8DOVzKFfi6oNdxoPnbVbwn7OSdobgCXFzyUFqYdwqSYj89IxJZf4Ri5sp9qydHUMoJXcECusR9lbj7JHkqu7WrfrvyP8OdLxjhE8Ew2Pm8gutfsHId+SMnS97/BCUSBikb69vp41A8qhBWUiirRZwjQ2/aE82/tbeS6SqDgYpjbdS4JICHlVCQ5pfFu/Ru5YPqQrm8HA4wEwh7pjtQUbW5FwyWPnGus72SAnhCpM2uv+OmJv76KndBVLN4xdjcovK7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(4143699003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VkRkVLaC9ENHdia0RvZGdHQjB2ZXJ6MzMvQUN5MlU4M2FMVkV0czhFYnUw?=
 =?utf-8?B?ZFdJdHRnTVpHaGkwSEF3Z2hWYmRIdWo1eXpTaU8vNi9Xb0g3WkdENFNIVVVN?=
 =?utf-8?B?S2N0NUluVllGRjErR1BqNlNCc1dyWXZWYzFBL3RHdWxCYkZmdFNCMExkN2Jv?=
 =?utf-8?B?U3RPMXVHYTFhZ2lBRDlJN3VJV3RpWGxaQTJDaThTcTgxY09qTXhKbUZPY0xx?=
 =?utf-8?B?QS9QVURnWHI4eUZieFFINk1lQ01kaHNmNE5kMEYzM2FXMy9PdG5UczJJaWJz?=
 =?utf-8?B?LzlLOXpwQ2JZUjJHb3A5bUVrNzRzUElIODJGNzlkRHpRNkFBT2RzbVhyYTNl?=
 =?utf-8?B?aDhVMDIvaHpsWXE2NGk1aGVSOStHV0E0QjlqOTlVQndDQTJzYXVtSmZPdktI?=
 =?utf-8?B?UkxOZ2ZCOW5tMjl4VmtwMDd5bXZaQ3JZbE5LR2EyQUxzUThUa3grSU5MTDBM?=
 =?utf-8?B?c0ZqelRLeGEvNk5QYkhZbEJIRlBEMjZrVkZRT2s3TkNycnlLWmZqajRrYmJR?=
 =?utf-8?B?cDV5di9NM0U4QThLYitSSTJUbmMrZHNLemIydTRGWVlCdytRdlhKT3JIdzE0?=
 =?utf-8?B?UE5VSDhQaGh5aGxVMFVkTzZXL1o2b1ZVdUNuTS95d1BYWW5HbUc4K2VDU1Rn?=
 =?utf-8?B?T2tWcDlYYjNTYVgyeTZJaUptL25GR1VwTVhoS1lBS1hEanV5elNLazVUajh1?=
 =?utf-8?B?dCs2bGNYaHBZNlhxY1d1TzJVOVNrU3JDZHppQmlNeUFvS0ZjWXhUQ1FqRTdj?=
 =?utf-8?B?T1pBMEMzeTlxeHdZZzhITWRlWVA3S1YyMXdhSEp3dHY5ZExjSkhKVERVek5a?=
 =?utf-8?B?R1JNYnF0V29qa0FCRjlhVHFXNGZ2UU0wd3NLVkRzU2hKTjJYYlc1NkZoV0xI?=
 =?utf-8?B?V0d2NDBJaUdoT1hlcmRrNTZtY3ZScWx6SGlsK01NSk5VcWRsQXNRU2c4WmNQ?=
 =?utf-8?B?S2Q3d1d4ZHgxdnZ1VVB0R00zdzNNa3JQQ1dVeE9uSUllMkU1N1pXMGdVWnBT?=
 =?utf-8?B?S2F3OUNIS2JySmQ1Y2U0Zk8vakJ5WU5XcjZXcy9PdFRjSkZIOVk1Tnc0ZFp2?=
 =?utf-8?B?MEdQaDQxZTdpNHZ4S2crbnFFdGVuajVLWi9Kc1d4bitEdkVjZmZJeU5BOFNh?=
 =?utf-8?B?alltVkYrZGJlT0UxNDdLSUZqQXRrZzFyeDBKaEk5eC9FNXBBOG1rdlBOQ0pE?=
 =?utf-8?B?WWxRYWlIeXEvSFZQNnpSYzVidkVFM2ZrV3RaSG9PMXdkQ1RJQlNWMmpTNVhs?=
 =?utf-8?B?K2tNcWpWRTBKeEZGNEZ4QUhxUW4weENJVVFSOUFMbWwydlRpMDJKS0dUN1Vv?=
 =?utf-8?B?V1hFeWp0cy8reHNsaGhWUkg2eThIUjFweDVkWCtwSm5DYk9laGNtSXd6MThQ?=
 =?utf-8?B?NzhOZVBNb0ZYbkxMeEtLeStEZFlPQ292M3BRaXJxcVkvWEFEZHYzeXNReXht?=
 =?utf-8?B?NHNLWjZyS1NxYmdqZUJFLy9ZQm96R0FyWDNjSEQ3eTZmdnRSNVRoK2JyS0s0?=
 =?utf-8?B?elZqZlV0NGJKZmpKdE1UNnRoVVNLQ3pUYlJKb205aXFXMWphamlVWkpoT3dS?=
 =?utf-8?B?ZVE1bjNVS2psakpYeXRVZDdaVS9NZ2M5RW1laE1PZGN1QUVOc1FyRGkxOEVj?=
 =?utf-8?B?VHFPS2Ztc1VZZmkzdXpPT05aZjh6a2hmYi93OE1kMklwWStTOVF1anZhVnFD?=
 =?utf-8?B?WXU4OUN0OUhDbU4xdEpxMU85RFdCTjlNQk1hMWJlTmJtT0I1NkI2OVMyamJ4?=
 =?utf-8?B?MHpienkzV2YxVzQ2M3A5OUtLQUNQUHh0aHhVakQ1UkV6aUpaZkVvSEIwTkZh?=
 =?utf-8?B?bXVybW9qWUJnOFlQZEZHNXYwa1lwSEROdkdkZmlZek1XK1dBRGwvZGNPU0dV?=
 =?utf-8?B?US9XQVJySEhjcW9WNStQUWUvd0M0Z2hZVng0ZllUcDlBaTdiZGN1aTM3NmZt?=
 =?utf-8?B?QUN5SVVaazZaZWhYYUVxR2JDUVlQRHBMQmJHejFOSEcyWlNtRFZHR09xWitm?=
 =?utf-8?B?YWR3U0Rzb29wUVY2QzlQVmhFYnhsTWhXeW5FZkk3aXM2ZkJ1RjRXQXIzL25I?=
 =?utf-8?B?MkJZTi9HbEp0cGlUMlh4Y1hjWjU4U1lUelNEeG5wTjZQNTFyWmR0TngzQ2Rp?=
 =?utf-8?B?eXF0cE5jMnFQOU9LYSt3eWhkT1VRNzlGSHplbkFZTHVJQ05HK3Q5bWM3M0g3?=
 =?utf-8?B?VFdhZXZsSXFkQ2ZOZVF1dnNnSFk5RWpHdkdKM3Q0V0lwdXhlajM3VVRXcW1H?=
 =?utf-8?B?QzNRNTBCdUd4TC9nVDBzVXg5TlVTRWZrNE9BRDQ3L05tQXFpUWUrdGtldjJC?=
 =?utf-8?B?YmtZREdVRlhqRi9vZVZLaVlPQUZ0V1dLYUV4VENkMVE4M2Y0aVB5dz09?=
X-Exchange-RoutingPolicyChecked: j533L5U6MEVzqF4weIlmJQwIW3sItsLuJbzFjLFVYUNeGZP1pTdQZtBVeGsnh+H63iEbwZs41r9ccBVLXaPoaAfZ+MhzPwjTwbEqZRZG//VFw430c9kFamQbGV0UElxUpx3Y4VA2FNkK5iDwqHT4aeWvRpKVNiP5//3csDQTrRZsSFemMtIP69iRCGNdb+IHgQDcu3j1WQJL8/XW+q6x/nWY4cH2gMOrtW6Z/vcuZfxye9UvncYcx5FndlHdKHT2mOW3JUkWw5JR2skW+9HQNvlZ6x0CYQsjX2J+A6tsqIzdizpsgRJvfNmwYz1rLW8D0pmnJVb+pGTaJnP5IWEJmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ab7941-b079-4fb5-9613-08df1f370c08
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:08:59.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS9uGHFoQWBm/TIjk78Ci64vhm1DlqkyMk+dNRTSGiRoGU4EmtWLwr/OHB9jiXCLBrlmr8ROcNUgGYpGHfVWKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
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


On 9/28/2026 10:08 PM, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe: Implement print vfunc for page fault info logging (rev3)
> URL   : https://patchwork.freedesktop.org/series/175024/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a_FULL -> xe-pw-175024v3_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-175024v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-175024v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (3 -> 3)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-175024v3_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@core_hotunplug@hotreplug-with-load:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a/shard-bmg-5/igt@core_hotunplug@hotreplug-with-load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/shard-bmg-7/igt@core_hotunplug@hotreplug-with-load.html
>
>   * igt@xe_configfs@ctx-restore-post-bb:
>     - shard-bmg:          NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/shard-bmg-9/igt@xe_configfs@ctx-restore-post-bb.html
>

Issues are unrelated to this patch, as it only modifies logging output.

So, this patch should be good to merge, thanks.


Brian


> Build changes
> -------------
>
>   * IGT: IGT_9113 -> IGT_9114
>   * Linux: xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a -> xe-pw-175024v3
>
>   IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9114: 916c79cfb7675ca01607dcd821f8c49d4f633a6f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5837-972eeb850a4ca07aba05ccb805db28a33eab2c9a: 972eeb850a4ca07aba05ccb805db28a33eab2c9a
>   xe-pw-175024v3: 175024v3
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175024v3/index.html
