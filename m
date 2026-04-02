Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B8CC6B25
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD410F0E0;
	Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQkNLeBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0603010F072
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775117503; x=1806653503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/1xk8Bzx6DZEJ1hcDCxjUTpmd01gUryhRaanWSm47mk=;
 b=SQkNLeBtA6MrxoOuXggaM4dkF8lzM2vbdBcYanhee3qHktA/Q9ZMwuil
 bBG+l2JbBH+Hgg/PPhFQgQ4lNAA7DEe7xJyhcGUX2MzX53F8S3lc8pIT4
 /bvG7+gE1fmYDgSRpU1LXE27EinVtMzT7wTeSGvIlspNVlyNBl+Ryekkx
 9bP5J+tdBdIDGinXICDGyFlSwVxP9xZ8L1yrGj6SDiUXKJkf2pnnpY6jN
 WPl65eOWODC6P+784i3o263B8fpR7L/v0udW1xutwBJRSE4GiUwltJypO
 ytvc3EY59yqwg4clqDyW89nLNJVJDPyQk0eTXVn6tRykxRkrxBZ/ofkBH w==;
X-CSE-ConnectionGUID: e06975UJQxanVCatFwghUg==
X-CSE-MsgGUID: b/P7IJw7RVqjdqbDCM721w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75208993"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="75208993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:11:42 -0700
X-CSE-ConnectionGUID: wriaahQKTEu/0K64wz8hxQ==
X-CSE-MsgGUID: K+xawrPKRhKJL4oDTl386w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226078023"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:11:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:11:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 01:11:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 01:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVOlWgCreSGnEikvtpVJ51aI9TTT0jqeasFKUjsaH1XacjxBnkA58Wy4E/a30z4TYkFmI3t/KRgI9LrjRac4AB6wy3qak8UjF+W/4gCswS/+SOySOEw63dczK8i2gNsevFdrFHcCfNqTnlbJGTZzhHisjZZFE15OZcaQ+QDsp+hpg0GBPRAJslr5TMGu0CdNbBV4hBfLMM42L+To+6V/FLuQAkaSHnOPvK7GTp1NXdI3Mex8SL+rEQLkHUWpapHkOAST8dXbcJjdWEZdvef4JM5IHNC08kaa4fEbvG5uF6QMQ4/rBUjvXt4Lcsuqwq/3WN86vOFn2npCehfBVQvP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQUV2w5mebcJ3PuqbO4K7oPuSSPfWzfSGD8n+4i+fx4=;
 b=byT1/r7IKKduQ7lhWj2Ld9ehSzPcTcdQwPkQjQVnkuJmdqsgOXDKcAQG4gMSZ1aSNYljn5eN08HncCgTmHEHXQKRVFJddCNaQCcmgOi43dHOG+E1lOK1eIXfVonZbMplwrzvvCvaYQLxTZs5n2GrF+8XW6EgfkST23Ju4GqcmxIuN7NmRynFp3IGJ/C2rSeBSfonYCqCWw71vUYxMUwxOj0mPvr5NBP8afGAuLhSbXCOqvM4R5iY+8GDP2vkCKHgiW/Jh71mjAR36vXGkE3Jg/JEhdtjAGJ4LGhjz5WUYfnboQDYuLQQcHNyBjJuXJzxJSh2YfdP0eD/9UT8pqfkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.7; Thu, 2 Apr 2026 08:11:37 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 08:11:37 +0000
Message-ID: <722220f6-519b-4cfa-a7c5-89698fb5802e@intel.com>
Date: Thu, 2 Apr 2026 13:41:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/xe_sysctrl: Restore __le32 type for app message
 header
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>
References: <20260402063357.1453605-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260402063357.1453605-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: f3479309-7091-49e0-7ed7-08de908f7641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: iMJH78LcLud9NovkKqfClJfWVPW+89ehmdzowokx1882f+BjVDSwazsVLC3qRff9ojtoedS7ZJusYQWlwtBENf+YhejBQ/CpHGnQtIzSaqTsUhYActa1OaVTzaXCUWOyJ7AcwDmxG5u5dtrI5vSxpTH0LPA+GxgRfXbNLkYk5UaxwW0tcnVJg5aPCfeQ/rPVN+hoO5GDmB/ZqoM/P49qshRgIE07Q9xFbxiyDzMfhicWrad91Xr6q4H4Vw4s6h64SIIqtan9rYiYZg4YBleN2CzSxV00oCb12ttLTjgdTZ1IDdyEiPevVSeLcKAQIo0D+TzQRpTnbfmPiWKyZvcWJDg/uOtJwH1E98Ouke6TW8d3X1uiFGSywbjizXj46F035scQdCcbNQx741++1b8DTqea9KXQcKrcNOvncQNe5s/kaEpKMyS0Wevb7r7t4XP36QbD0XgTScz+3jopNtv6d78Hw+TU+FQ05H/rPTB8D0IUr9uEfZjnfL7cCeNvtpjzBrLVyFoNYVUxBmsxnc83c/ruB6e5AX2c9o6euGjDLEuGfA+RAYtYtScjXGiuYSO8xkzpyf8XfWICoc9b4mcw8loPEAnf8Bf4CBCUlsnPycTVYWzviHr54uv/BCvRNtQtjtTqe4DxK4hOEcy4DU4h3mC0UjfJtCe4pdpyM0W0cNHtWMn4OzWyn1bUuVCvReK91gCpomew0+IUtsgwv28mEaw8dsN8hsCwHwly9crxkER3D9SdXpfOR3Pbmq08CADz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXh4U1F3dUtVWkdncUlPUUh4M2UxY0NjT2ljRUZSM1o3UTVhNC95eXBoWGsw?=
 =?utf-8?B?bllwUWdQVWhmMHBYazFLa3BZdm93emw4Q1NUQmZ4Y3prWkZPSFZpUmdBaGdn?=
 =?utf-8?B?NnFwaUtnakhVcWJVb3JPd1h2RlB6TmxXQVp1T2laQ2xPcjk5TjFocjVpQVpn?=
 =?utf-8?B?L3A1Y3Ura1Z4N29HR1hSRnFBNTdoOXZneEFLVE1IQmlvT01hbTBvZHA3K24x?=
 =?utf-8?B?cDFvVFdKaUFNSFdXUFVlRTUxdWZnTndHcFRiWDRPdjFtY2tFOTdIcXg0YjlX?=
 =?utf-8?B?NXhJY09DOFQ3Vk1PRlJlaldEeEMrVmRLT1lTd0kzdU1XWEd4R0MrbklhTG5u?=
 =?utf-8?B?MjFVcmRrMVlxbkM2dStWU0p6ZENrRUkvdktmN2NhVU1uV2FpNGVWV2liR3k4?=
 =?utf-8?B?TkREdGNNQk1GNW1NVG41ZzRYNElqbnhGVWFEbUc3OVJyOXYxZGNLSExQZ0Iy?=
 =?utf-8?B?dXZFY29OUk5JUTZEckJPVk1xNFE5QkkzZENmTGFDWFk3V1FkcnRTa1Q5K1Q3?=
 =?utf-8?B?SmdSYTBRUm03dXhqZTJpU1RSTTdhbGc4VFhiNHc3U2I2aEFQejJ6WXhPaHF1?=
 =?utf-8?B?a2RKOWhETWJuM1MrSk9hTzFMK25HTTdCMHJWQWU2SmtxcWdtbGN6SDR2Z00v?=
 =?utf-8?B?M0Vvb2M5R0YwRVdPMWhLMlJkYUVZNVFZcDNrTk1acThrcFpIZkR3K2UzdFZt?=
 =?utf-8?B?Nng2V3NCa042UlNseUQxTGtwUExDblFLZnloSFdDV2tGcG5mWXBYWUsyVTh5?=
 =?utf-8?B?VzdQWjBtWG1ka3pDRklGRkpsNGNiTWpOcStidWwyM0JkVVNMLzlka0xPYUR0?=
 =?utf-8?B?UHVweDB6d0lTc2IzOWVlTnBsZitkZitLUm9BSmhVbWVraTBVZjZMbFM0TzBn?=
 =?utf-8?B?ejdRcHVzelorcXFJZFY1RDExalZlY0V5anFvWEZRbGNGeWZoOUVpNG9jNnlw?=
 =?utf-8?B?Q1FlZmhuL09kZXZwdEd1ZHZVWmpDRlRqQ2dmUkRtOEIrSVVaM0hNQXBGR0Mx?=
 =?utf-8?B?QmlVbUoyYWRXMVBkZjk5MGVTSWhCUTF4UlhpemJkU01EdkdSbCtSV3VYUjZt?=
 =?utf-8?B?NExQS1c0MTU2WG1XaU5lWkd2UldvNGxNRno3SjZhMmJ5UWpqVHI3dlhCNGls?=
 =?utf-8?B?MWQ4elVGVHdWdEhZQUJkUlA5ZXl2b2pOVlBkWitMcWp2eGFPRFJteS9sWHAx?=
 =?utf-8?B?UVlXblpQN3ZzUkdWYzVweDhHRGpXV1pMVTU3b0tpZDNsRy90b3oyMENtSVhh?=
 =?utf-8?B?a2RvRCs1UUhPTnlwS2IxU3E4allqTzJxb2kvT3hKQ2JKY3ZGWnRkNFNhL3lR?=
 =?utf-8?B?SkF4TG9nWFUxM1dia1UzMlZIMzlEWDBZbHpvK05OSjNoTUNESHpaenJJL1pX?=
 =?utf-8?B?NEw2bEhTZjhJVS9udEI2ZmpXZTM1QllJemhFeFFGSTk4WCtqcW9QOEhTaERG?=
 =?utf-8?B?Zm1HSHZLVzBIQnpxVWtBaXZNMFMveGFvc0ZUY3pZNWJhUC9PeUJBaEZFQ25h?=
 =?utf-8?B?Q1ZBUHRSMzJvUUp4ZUhiNG9iMU1PZjFzN1hHR1ZlcFYrbVRNMkhGK2YwNGFP?=
 =?utf-8?B?VjdkOG1HWGVGL0ZQMCtzbjlXbzFVUFFNNnZUVVV3R2l2K0UwN0ZXVUozK3dj?=
 =?utf-8?B?M1NNdEFHVU9sOENiZytycnBWaTdIemExWXpEeUhQdnhXWXVnMGdBWVdLNFA3?=
 =?utf-8?B?SEVoNmNoWUdLU0Q5M1o3NXBIcnBLZ1hYdUdiN1dHM3BOMlVGblhsNkx1QThs?=
 =?utf-8?B?N09Ub2g1blVaQ3IvMkRjM1UwU2pwVk1hUGpIdjlKMGdidUhlSnBkWVA3dlFq?=
 =?utf-8?B?WnQ1SEFhMnBwSVM5amVkelVKQ0Ztc2FzVXk4bFBxNmhqL0tLZFhhbDBoNkRt?=
 =?utf-8?B?ZmQrV1oxY2NTZVNOVlZxWDQ1VWlEVXV1aU85OC9PNm9JR3k1dS9UNmZFbWIw?=
 =?utf-8?B?QlFnUWVlSnl6SUpxbitYN0xnSHNBdUxiRU1pUXlSek5jMkNVWlRaZ0w2WGp2?=
 =?utf-8?B?TG5tUlQ0cmYzQzNQTllsNXVFcWVldzBrV29JdUNnQ2RkM2tJWlJCd1JHc2c5?=
 =?utf-8?B?cXRLRmcxTXpPRmoyd1BJeG1RZEh4ckZNTUNyUnVPSWtjYXIxV3BmYWhUdVl0?=
 =?utf-8?B?dGVXM0txcXk0alVQOGFzeWpxTDJySm5JRnZHMnI0MW84dXRWTFNJcTYwOGxx?=
 =?utf-8?B?c2JPRHl6VlhXdjE0S093R3RMbmpTWmd0Z1VxTjdFNUZ4SjkybFFhbmlHR1Zp?=
 =?utf-8?B?ZVRzVFpRZXZQa3FwMDhtNFRoZ2tKNWdvV3JQM1RsbUhNdXFrWnkxQUxFQS9k?=
 =?utf-8?B?em11SHBMQUlaZVk1SGk0Q3c4VlM1UXM1RzNkWmJ0OWo4WG5PeHhXUT09?=
X-Exchange-RoutingPolicyChecked: bsn4x9F04QMH36B0vkEHFM/LLKJmTlVOj5wv/rBm+GfYLHrKvh9xQ8J9tH6DSjMckOwW0gJKvLDlPwLrD2FoDTBHqdV1e6zTK+S7hFmHcIW+pKjnMvhpaeb1W0Ql9OcOLpYczki/QVa11vf+tr+/EwqG1w1ZYbCDjWvL1+TES8sHm21bjPIYKEjOW7mQcM26kSv8xRW7/jkbXCdkYMREgZ4Sf/emNfmwG/xuZtygDPIsm4LM2n5ZL9djRPvE6wUSwy7C5ORffcHu4soqFzpuaCYiUOMAbHYRdY2sZTvKXL5YaulxPd5hpUvM2ppnd4vU1o/Ofzh4SRNlxRjFBui2pA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3479309-7091-49e0-7ed7-08de908f7641
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:11:37.5209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBhOqS1/6KsAxXuKpqCs90ucDFWp3/VOT4rP3Pcy3pJeOUU0iaFR1OZH9aDSYtMYJUuyuYM04opL8J0MqCriCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
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


On 4/2/2026 12:03 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>
> Using a plain u32 for application message header data causes sparse
> warnings on big-endian builds when converting with le32_to_cpu().
>
> Restore __le32 type to correctly model ABI endianness.
>
> Fixes: 37ace5254a2b ("drm/xe/xe_sysctrl: Add ABI and mailbox interface headers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..ac48fa7e4818 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -47,7 +47,7 @@
>    * Header structure for application-level messages.
>    */
>   struct xe_sysctrl_app_msg_hdr {
> -	u32 data;
> +	__le32 data;
>   } __packed;
>   
Shouldn't the macros be fixed instead?

Riana
>   #define SYSCTRL_HDR_GROUP_ID_MASK	GENMASK(7, 0)
