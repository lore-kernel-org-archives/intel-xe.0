Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A4BCD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 08:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520710E984;
	Wed, 17 Jun 2026 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJNOKbQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356410EEC1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781684967; x=1813220967;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aoUvZ+wXcZfcHI4VCEshyq0ocuoYh2Cmzx1bEbrmkUw=;
 b=TJNOKbQt8W40REHj2LF6kjh5Llt0b2D3TX4wnMqK+gIfztj8uz2I6v4S
 Jzr4lM9nJj5ZSzpGTB7lK4Zb9D9jSgQhF2Z/8MVNUuvxhKYba1a9P0iEQ
 5Fb2XJEsgTGG1/PFthB8CVPeUSCcJMbYxCQE17C6LkH/jJ+ARHkiy9eFQ
 GkSVApvuw7PZX/yNsWOzfQWhcRIyursDjkgEFqGx1Fv8RaFaE0wcMN2lW
 OCa4ynx2Vbv56+5mC2OEWoxfnwg3Ny4qdbPhseBri3fbQsYuP8YE8ulJG
 9pVkI1/HsxjwY8LWYRqkMWme0GExJjKyv9L2Jp7uGG0HZAT+2s+tfTgRZ A==;
X-CSE-ConnectionGUID: L3Fer+TtQL6jePsctVcCZw==
X-CSE-MsgGUID: a7xrQLERTVGw/zSfMzU23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82579657"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208,217";a="82579657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:29:26 -0700
X-CSE-ConnectionGUID: I7YzEqTxR8CGo+BaTTpVnQ==
X-CSE-MsgGUID: ri1j/GqaT0O2x6lfRNzcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
 d="scan'208,217";a="286119398"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:29:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 01:29:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 01:29:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 01:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3NKQ51hsQgdz3rnj+hkPl/Bzbc+7a4LZOuY7Z8BbS8xAkVKv9yxGp/pov8wflCCz0s9dSIa1f79GFAvmzVzHQzPH9FR1nEQFJ4+DSPm+/H4B39jJkyAxsWEvPzanc29Wx9Y5hV8YOKNyogLfHfpEs8BKQcOzdkCFyi6GSw9nK3r+BCLehpGitVBELIr1uwmy6j0xSZkIonXIGvSyyk+T5dPY6PqGaW6+SffCLouVDs3QCyvTlwFdCAXPeZXFxPQloLwG8UPzgyyEYoLhMQWZKAWBFDluaWB65DI4NjWl+4/qQlaHcmcislUp9jJZ9BhJmBGRWwfHMHBzO2z32HtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQikIbLQpsZI9tmLUsEKVQfuHZosfTHP7luPKXiwuuo=;
 b=ZG/LIBens+n1mbrIv7ydXsRXvv/KthWO4BGhNuM3k4oeFdDngOafVB2LqM2McwH0ZQb3pSTeF+7e4uL5Bj61l8UzkM9ADWhtzyCiyYHiFeNYOWTkzjNFTMRvQRGMjBGcMxtbFnW0auItc0ZrU4itIofkdUUge2JnZDX8zFR19Cf0lUpXaXrNg6lK/Oqsyw6mVN3RYZgJJhjv1uno8fEbxApxIQ7+kXk6KvtoIzkZM2//SqbVHUdptZiumN3otBBWni1awmvmG5LMCA/JSHvXPplFOKpJBCagrsnXGlZEOSUwnZ5WypRrebmijMmbv5AovldIPqsjPKwRwSM5Lz6Vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 08:29:23 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 08:29:23 +0000
Content-Type: multipart/alternative;
 boundary="------------bndW2wcG0R1YYGao79O0M7wg"
Message-ID: <66254e2c-fa6a-4068-ae59-824dedcb9ff5@intel.com>
Date: Wed, 17 Jun 2026 13:59:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose per-engine idle status
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20260609195149.616010-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260609195149.616010-2-sk.anirban@intel.com>
X-ClientProxiedBy: MA5PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|MN2PR11MB4518:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b63a90-8881-4d8d-3509-08decc4a8892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|8096899003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ctzqr1DElYqYeGa/4XRBdwS5CT4PKMBfBfP5Nr1N7NstsqSi0genjCIpMrI1wlW7fJrTd3Q+3JiNQqJpPpCFRDDDwHKDaJJhLwjabl67OtiSTG57VQvqb9OsDCVi7XoWm4YF7DIWKBjbK5vOHP8U0grUPNZIxAlS7KkVey8uhn+6TZ1VFJ+BjV8jHnpliSNFliYIvrNyzJOsrAoKOjaMlcEtsqOOi9uJ1JhoxVK9A8idjPyL+OQfDPr8twagofodR4jQW/nUzCgjMGW7Kg2Nk7cURpBmrpubLiBLFoO3GBALKwgPl0Znyt+YehyLGDgnOvVCkRNJzbLC9YkdcnSTueNf6cr1G2Lz95fGKMXc23UyG20pLWRiSVyafXmp08BevaBOdx4bbXhgfUeObezfXXiuXi1y2RN7oMo5UVLJC6cRwKs9JSGEuTdBOGfE0M6elAgVGgsTijEIAqVSe/x2rKI3rEh7a7/Fo8YNBQy4LE6WoCueFYo40budHMv34bxmbmj5TTt2PKlFBACViBM0U3TGfcNXlIhN0iGSbZY6Hq/rl2yn7hUjI7nLHufN3qdFLXm7xz+JY421pUGQgI1ZodWmYmcw7U/jbUbKTQzqBPacdvANAAWz2JetNp+isgbhG4DfeJOPFN+jsNu/zNhtKIZ3cTXXblmuCse9tjq7w9HQ7DrZbNuZXwPuCTnqOQgw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(8096899003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2JiVkExekQyRk1icnBEdHlVSFkrY3RsNXNxR0xZckNCUC96cHZPZm95WnFi?=
 =?utf-8?B?VC9zNXBWSlhwSnEwdXhIRHpjNE9DRWFjOVJWUnR6YXNZRlIxRTRyT0c4UHIv?=
 =?utf-8?B?REdaZzlIN3hzOGdVZEFJSTR1RFRVTktsek9ORVRRRmk1ZWhLc3BObHlCcjEy?=
 =?utf-8?B?bkF5WlAxV2VjbktIRjZsb0FBMHBjOVFuSk1sSzJrY21LUFUxb2NMREVINm84?=
 =?utf-8?B?dlNlUXZGQkVsUHJTOUlyZE03b3lwZ3BJeldRbSs2WEpNOXRkV2FGaWd4ejlo?=
 =?utf-8?B?Yjd2T01XU1BlL3krT0V6aDVDSUU0d01mUWhiNXh1WnB2dE9QUVY5ZjlDcHEr?=
 =?utf-8?B?dDNQWG96cE1TRTBKUGtqblJpamlQNC9DU2hNNCtHMTFmVWVQZWtZRDZNYytJ?=
 =?utf-8?B?OStaL1hva29Nb0pXZXpwZGpJZ3ZXZi9UQXRaYkhyYUFFQmhPSkw0NFZHNG1M?=
 =?utf-8?B?ZUR5RllGdDZmQUN3Uk5zb0R6YlN3VVZDM0dkL1lQZHZQaU15U2xScXNuUXFJ?=
 =?utf-8?B?a2x6eEFGa0FtQ2YvVkxxc0dZZ2pIY0U0MzZFRmY3Uk9YV3o0clc5azlNcW5w?=
 =?utf-8?B?RWFPTG5Ya080Uk5uckhiRmhtYjFDNWh0TGhLV0RwaFhvRHVWL3ZwYVhGd1ph?=
 =?utf-8?B?YzRmRk1HUkVXVitGZHk2N3FzRWhTYWNKcjVkQ3BrNjdZdGMzZmFuN0lCd01t?=
 =?utf-8?B?dlEzWGxCSjJuSWo4TWJKWjUwWVRkZVJzWFYrZW1kYkhpc2V2L2lDQmtxUTlG?=
 =?utf-8?B?b1hmYkxHWmh3bldweUVMdU9TdG1TRlIwd0FrNnM4NkV3VlJkR0lKMEZyNUNK?=
 =?utf-8?B?KzN5ckFmMWlKeWh3R3FKNFgybEMwTzlQNmF6Q0VBU1U5MWtZNGhibTBPa1dV?=
 =?utf-8?B?UkcvaDNyUllZbGhIZTRkbGRPY21LdllZUTh1MTlYdloybFN2dnFXY3Bid3B0?=
 =?utf-8?B?S3BXdmdpN0IxRkxLVVhNeWRPOUtPMWs1TjlPUnZLVGduczZUSHR2TE4wVGU1?=
 =?utf-8?B?L3VpL0kzZE40VGZtK1BhV05LYk5KOEtxaW9OemNqZ0xFRFVtOG83VGJzUTdm?=
 =?utf-8?B?RmpLZms2QVNaZFc2QXBVeU5uY1NLcVdzdlIyVTBHRWR5WFp0YktCUGpBajV0?=
 =?utf-8?B?OVBGUUZ1czk5aFJDY1V1OXMvSzBDeStVcEpqZlVIRXljZDZVODJuWHBLOXVh?=
 =?utf-8?B?YU1Gdk5ERktMOG9rS1U3MGt1RlNTMHB4WFBlVkdYaDNPZng2OWRlSkhrQWln?=
 =?utf-8?B?eVNidjkxMkZYaGNJb0RTYjczWUJHUm44bWhGSnliUGJKVVkydWZLd1JaZnJz?=
 =?utf-8?B?R3BwSzdWOHJxUnhzZThNanRiMlhvVXZheUdZUlZ4bFR6ZmxtbjVKWkNOYkVL?=
 =?utf-8?B?UVZPR2pUZWlIRWF0NHVjUHZIRG1yQit3RnlmWGpuZFdPdmpVL3NNV2VYUi9y?=
 =?utf-8?B?TUovdWgwancrNXJnZ3pTMlRkUXdmZzNFcDl5VWNwc3Y0T0hlT3FGSzV0Ukxx?=
 =?utf-8?B?K0xkSk1oYkdXY0dOU3F4S3laalIxRStRWXpPRUZhOXFDcXpESXRQNkFvRVlo?=
 =?utf-8?B?MHh2MEVDbkUzUFp2RmRnNktFbnBmcjFOdjJqbXZEVC83c0JEc1hUaGhiNWo2?=
 =?utf-8?B?MEQ0VFcvVVI0ZVdSMmZIdEtMeFZpQ2wrbkRnZlRWS3FueC9nY0hrRmFBb2p4?=
 =?utf-8?B?N2hJNFhvQzl2RGk2OERFN2NZQXRaaXphMEtrK3NOdmxqRFpCNXAxVXJ3T1M3?=
 =?utf-8?B?TU1MNWs1cExzOEZZbDdISm5NaTRxdU11NVhQRDQ2dkt4Ri9nb1hSZnZVTFo0?=
 =?utf-8?B?d3dvK21XbzNNemc0UzMreUl2eVZnNU9ZUjcwVHRtd2Y1UEF0WTE2dkUrWkk1?=
 =?utf-8?B?enlvSTAwTDVjcWt0cXJHeFFjcE1pb0JENTBBZm5oZzA2VlRvV0VLa1cwOTNv?=
 =?utf-8?B?U2llNGxWeTluNnlONHowRm1wakpGK1pnZFg4OGxsTUZxYkF0MWtlLzNNdmVv?=
 =?utf-8?B?eDBMaFpwNHlMdGQ4QWdyOXJINm45NHAreHlNWDBJZHIrM2ZXZys4b28waGlP?=
 =?utf-8?B?NnBGdDRYTzNvR1dRb1FCVDA1eUwrME1HbTN5dWFDV3l0R1NVSFd3WDh1USt3?=
 =?utf-8?B?WXdaKytMWkQ4Z0RKZmt3c1d0clZKWnB3cVIxMUJ3czVCVkdkOG1aYldJUUlX?=
 =?utf-8?B?SW04QnFYWisxU1pzbG9yeUcxdjdnVFZhMTBFbnFjbFZwT1ZPN3VzNjhkNFVT?=
 =?utf-8?B?TnhlN2lFWTI3ZDRwYWtpT1V0NHVyRnR1SHZoaEpGVHdyTW5CcitIWmdRRXRs?=
 =?utf-8?B?YlFpTmtiYkY3bHdmWkExQVk5Sll1UXdYbEJIN2p1NVNPWDRnaXBjZz09?=
X-Exchange-RoutingPolicyChecked: RQ3JMrE/1FvI1GuFnQqyd7jvqLNTECvPuS9BiJrux95g5DA9kWYnJ347dglUWaA1FyzvQHO11hLtfFXdeGpSFiZjPOMq/XPHzymhrbGndHoVr6FHM5a/y4hEn9onteYhbVqzuzCyU+Po+gzx0ulhQg+UzljPcTDiRLkZ3ekcIFziRYDH1rIxVij4v+bJ1OjB+F+Bhd+aoWnYD6P+eBfV424xzEifBRK0PVhQQdL+qYDkr+037SHuzvibyNVGCfdHLBizAzafWxvjbiOyD2oP0Xaj1frMZBqEjFDGpgWXTsTx8Yad8bc8WMXSnbhp6zOpoP7gGjN+b42AxBGTUvh4Bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b63a90-8881-4d8d-3509-08decc4a8892
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:29:22.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYKrzRm54A6N9b3WNSRH1nbUsO7DzQBsYug4naMOSe/i6tXrH5lzjtFghTRTjO6IVSGcbCGotbJ0dn9ImipTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
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

--------------bndW2wcG0R1YYGao79O0M7wg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Airban,

On 10-06-2026 01:21, Sk Anirban wrote:
> Add a GT debugfs entry that iterates over engines and reports
> whether each engine is active or idle. This can help debug C6
> issues by identifying engines that may be preventing the GT
> from going idle.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 31 +++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f45306308cd6..d404467146d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -10,6 +10,8 @@
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_engine_regs.h"
> +
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h" @@ -115,8 +117,10 @@ static int hw_engines(struct xe_gt *gt, struct 
> drm_printer *p) enum xe_hw_engine_id id; CLASS(xe_force_wake, 
> fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL); - if 
> (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) + if 
> (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) { + 
> drm_printf(p, "ERROR: Could not acquire forcewake\n");
>   		return -ETIMEDOUT;
> +	}
>   
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_hw_engine_print(hwe, p);
> @@ -124,6 +128,30 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static bool hw_engine_is_active(struct xe_hw_engine *hwe)
Should it be renamed as is_ring_empty or something similar ? Why the 
active ticks are nor being checked to evaluate the busyness ?
> +{
> +	u32 head = xe_hw_engine_mmio_read32(hwe, RING_HEAD(0));
> +	u32 tail = xe_hw_engine_mmio_read32(hwe, RING_TAIL(0));
> +
> +	return (head & HEAD_ADDR) != (tail & TAIL_ADDR);
> +}
> +
> +static int hw_engine_status(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))

It silently returns -ETIMEDOUT on  failure. Better, a reason could be 
emitted as done for hw_engine().

Thanks, Soham

> +		return -ETIMEDOUT;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		drm_printf(p, "%s: %s\n", hwe->name,
> +			   hw_engine_is_active(hwe) ? "active" : "idle");
> +
> +	return 0;
> +}
> +
>   static int steering(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_gt_mcr_steering_dump(gt, p);
> @@ -240,6 +268,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>   /* everything else should be added here */
>   static const struct drm_info_list pf_only_debugfs_list[] = {
>   	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
> +	{ "hw_engine_status", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engine_status },
>   	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
>   	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
>   	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
--------------bndW2wcG0R1YYGao79O0M7wg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Airban,</p>
    <div class="moz-cite-prefix">On 10-06-2026 01:21, Sk Anirban wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260609195149.616010-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a GT debugfs entry that iterates over engines and reports
whether each engine is active or idle. This can help debug C6
issues by identifying engines that may be preventing the GT
from going idle.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 31 +++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index f45306308cd6..d404467146d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -10,6 +10,8 @@
 #include &lt;drm/drm_debugfs.h&gt;
 #include &lt;drm/drm_managed.h&gt;
 
+#include &quot;regs/xe_engine_regs.h&quot;
+
 #include &quot;xe_device.h&quot;
 #include &quot;xe_force_wake.h&quot;
 #include &quot;xe_gt.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-115,8+117,10@@staticinthw_engines(structxe_gt*gt,structdrm_printer*p)enumxe_hw_engine_idid;CLASS(xe_force_wake,fw_ref)(gt_to_fw(gt),XE_FORCEWAKE_ALL);-if(!xe_force_wake_ref_has_domain(fw_ref.domains,XE_FORCEWAKE_ALL))+if(!xe_force_wake_ref_has_domain(fw_ref.domains,XE_FORCEWAKE_ALL)){+drm_printf(p,">&quot;
@@ -115,8 +117,10 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_hw_engine_id id;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
+		drm_printf(p, &quot;</a>ERROR: Could not acquire forcewake\n&quot;);
 		return -ETIMEDOUT;
+	}
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_hw_engine_print(hwe, p);
@@ -124,6 +128,30 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static bool hw_engine_is_active(struct xe_hw_engine *hwe)</pre>
    </blockquote>
    Should it be renamed as is_ring_empty or something similar ? Why the
    active ticks are nor being checked to evaluate the busyness ?&nbsp;&nbsp;
    <blockquote type="cite" cite="mid:20260609195149.616010-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+{
+	u32 head = xe_hw_engine_mmio_read32(hwe, RING_HEAD(0));
+	u32 tail = xe_hw_engine_mmio_read32(hwe, RING_TAIL(0));
+
+	return (head &amp; HEAD_ADDR) != (tail &amp; TAIL_ADDR);
+}
+
+static int hw_engine_status(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))</pre>
    </blockquote>
    <p>It silently returns -ETIMEDOUT on&nbsp; failure. Better, a reason
      could be emitted as done for&nbsp;<span style="white-space: pre-wrap">hw_engine().</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Soham </span></p>
    <blockquote type="cite" cite="mid:20260609195149.616010-2-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -ETIMEDOUT;
+
+	for_each_hw_engine(hwe, gt, id)
+		drm_printf(p, &quot;%s: %s\n&quot;, hwe-&gt;name,
+			   hw_engine_is_active(hwe) ? &quot;active&quot; : &quot;idle&quot;);
+
+	return 0;
+}
+
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_gt_mcr_steering_dump(gt, p);
@@ -240,6 +268,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ &quot;hw_engines&quot;, .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
+	{ &quot;hw_engine_status&quot;, .show = xe_gt_debugfs_show_with_rpm, .data = hw_engine_status },
 	{ &quot;mocs&quot;, .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
 	{ &quot;pat&quot;, .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ &quot;powergate_info&quot;, .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
</pre>
    </blockquote>
  </body>
</html>

--------------bndW2wcG0R1YYGao79O0M7wg--
