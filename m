Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634C104BFFF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8892D10E0C6;
	Wed, 11 Mar 2026 11:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPSmogsu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5510E0C6
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773226811; x=1804762811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CUPBV/3rOOsw5aZwxVlqDelVcC6r1wFhgXi/YeLwZ0M=;
 b=mPSmogsuyi5DMuyqv2zlQX7gsEmQCRIrPZJjcE19TQyh0fR8Zf4woRLb
 w7RjBthLrsbB+hys21W6t1zhID0YJX7J2JF69HjqxaGHDlBJnszAOdo+S
 k8NnKkFgigDhl8PUvHq3c5Pzqc+QADfZPPCeF2i8RZ9mavkLVrADDdNhu
 U6ull6LTUq2irhgHsLiAgtkVGC1zla5av1S8vNXWC9d7qFDEgioF3FW8O
 8bKF3tuaemtSBpfntVUjcBkTf++6wsEf4ySkEJhM2XFmffvR+kbpY+89p
 arxU6jEZnNeKAZd2VL7bAaLsZXt1P4PhM8IKzqsLxq+emzhJU8DLpw5Gp A==;
X-CSE-ConnectionGUID: tC/k7PgzT96XCRZqJGKrSQ==
X-CSE-MsgGUID: HxKy4CR7RsG9C/Er9CPasQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74370244"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74370244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:00:11 -0700
X-CSE-ConnectionGUID: bU8Ka6ruQ16szVTRe4W+1g==
X-CSE-MsgGUID: CL54q8cvS7enwt064o5pdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217901491"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:00:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 04:00:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 04:00:10 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 04:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZYns3ykerYzPO9RDNgvp62mTpsJUl+QT24JKuiPvIAc1CpEs9agqPPs7686ftXm2ZhgbwdyUmmao57TdLduF33/9cCuDjSIaNZSxgv01JzmLbbhEKN2iB76aIMJZjQwJZnmSsd74MoFOiydwsmcxCmZyzXs7PsaZfxd2NdQHVh64hdqD0CjkkTaz8nScGRldYKKUg+r4h9hJqwI7wKuIvoDDlezHleqMYdT+1pqZIB+gcZHLaeFnnOtRjP7uNwak5eM0D3QUAlV1oOl4i1wbGbcjw0RwHm9aItsRZSATHZHXSSaJE91nZZZ4wn/3rnL/CAPYQOjQn5tDqjPebv+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZvls7k1KoRCuihcoXdO5xFzesrb+C15RrzE/8FEESs=;
 b=H7GtAToNG2QJlJu9XA84hDaZTBwX1T20diDnQNg+CGvtE0el9ciY/zciETfqogdFgJUJaBo++iMIa5+dIKT8xY+eHd+wLNgK5uVdmi/nSwuOLHLPY+63JWfvgFCTb1bTpGFhaZV5brj/rfZvYIthr63tfA/AmX9GaPjGPxB8dAhsJBod+G05uFZqVWWCYcmLvZMlURmAumCjnpLkq4iRoYLLO1ibvdLh25P1zt9uOgOUCYxZ5UxCP7JLCKGuoVdc0cT6tEbkAUcC5tViyV6ts9Fp3C+9i2iptzD6EZxg6FJS/FOFv8y6NiqAhiw9+PFatbeqvFTdm8/Mhj1fh15gUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Wed, 11 Mar
 2026 11:00:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 11:00:06 +0000
Message-ID: <99cdff33-f6f3-4075-8787-d0456592afb5@intel.com>
Date: Wed, 11 Mar 2026 16:29:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] drm/xe/sysctrl: Add System Controller
 initialization
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-12-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260310182336.611041-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: e312f31f-62aa-45f3-79d9-08de7f5d5aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Tbl+49Nbyhm/R6r9/cbRVQX1tSmMKdjWRTp81JsnfsfzbEosjxwJY3Y5aVH9Fd7VfzPUFgpxdL3PG6mGza13EZlGAFlPa29caCy0/WmXxUq5QxChGi2Bv9LUW49W4gUaU/nroEk1yCflmLIAMu5SiOWzRBvm4ZtMcn8pVE6Q/D8GMIu9g2ikaVL/2w6HKyOuz+KQ11Z4q57X1cHPd2QC7xOfSS48SEiPb+m0IFEfHaG6aazYDiDzpboDuDznSUokO6AikC4aRzP7Xr0yK6g6G5E6wG1O26pbs/FQZakhnXVyaFTCu8aWHiSIE8honW+/3Dfu5nSPvXBWBmv1VbljWTaiqLfru/ugVg4iTBvFD5Suum/ZVk8QlGNP3q7IyIqrUWmZOJGXJ/w533vnMmVqfBoW51xsHCrIaVlcr1WsS149iek9VYe9l65F6AwMceEtaOig6fPTAGShIDEynIcFTtMgEH4/u/9I907KJXA3mbLzs/vBdwT99wl9xxZLwkayCxTiCKGTCkUWdNPHkmVWb1e4zM+sbaAy9757KlwCnwLSb8sEUJbG0VsunQ4Qbdl1RKNl3DDtdEw3+79U062HD5zy6/bOFSoAV1rl+uPRBuekCkq2gIEKCh5/Mg6L9NzV51w8dR63VRR92CHd3JFpfRxNt3TcL1HAEpezth4SRmwLSpFc3POXKlwZFFDbSQlkA9WIEbItL6cl5bDK4x0we9lIcB+qNRVH3cije/0kQDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWl3R3czQ2RlUVlLbFVBY2dkZW5FOXpZZzIzdWMxYkV4WitMbW9KYlJ6NkNx?=
 =?utf-8?B?ZDRVZ1hjM3pFVlJvYmJlaUoxaWt3NDdJcGdPMjBpNi9Ncm9TZjNGOG51VDJM?=
 =?utf-8?B?cTRHZ2REbnlybzF1cDE4OEVhTjVQT3piUXN6aXkrK0tlME40aXRVd2hsUk16?=
 =?utf-8?B?WTJBc0t0V0pyZmd0UUZwKytPWHllQTVlTDNoNkllZVNNUmZ2ZlFRRnAwM0ti?=
 =?utf-8?B?TmVVT05UM1VyaGlEeVNLZEhyYVVJNkZMcWk0SkZVZytUQy9uVlZUWGxVQ3dF?=
 =?utf-8?B?M1MxYjExaDlDMmUwaGpTWmdkQnRYMzcrM2lZZ1czZnZDc0M0MVA3cW9lMnRu?=
 =?utf-8?B?VGtDUXB4TjA0cklBUzVsdGthdGRISmp4VC9yeDh2dVZCcGN1ZFZ3clBMZEw1?=
 =?utf-8?B?aE56L1RSU2I0SmJ0TkFGN0srbTFCWE4zNUUxZ2gwSjB3VXJsMjUwenhOMmZD?=
 =?utf-8?B?NnRDcWIzSFpsTWxrK2dlcUNwL3hQN2tSMGVkbm1pNFlPTDc5VzhwYXNoMWlo?=
 =?utf-8?B?TmxTK2NxUWM2bEp0dDFxdnpxS0h3RnkrOVA3Q1VhandiL2lveU9EaWtvMmIz?=
 =?utf-8?B?d0xxVFQwZW1EMXpQQlJzQ2FBUXBtbzBqbHQwTjRZMFNncElTbktsblhJR2hX?=
 =?utf-8?B?YWs3NVYzNmxxeXBFK3VsR1oxdGttbDRlbk0xZ2hPdkJvNzlKQ05jdnU4TW5h?=
 =?utf-8?B?YjhURGxIdWYzRVFrV2c5bS8vRXMwSDFaTmxOeGgzc1NYWTNDR0wxMGtGMHgv?=
 =?utf-8?B?cFVKTjVjT0ZhSTY0QUJQcVRmeS9OaitMcURVcDFKVFhwUVVzejdKN2ZoTkd1?=
 =?utf-8?B?R3hhOWVFYzZleWRWOGVwaTA1djZNV25KSEtlM0kzM3N0aGx3U0dVd2lIM2ZR?=
 =?utf-8?B?amQ0S3ZRRWx0azh5SDdTRmc4YnpNS01tY0pQMk0yYmZsZHVOcXl5bWZNSGVB?=
 =?utf-8?B?YUdXdDlTSTYwMjNOVGRHbnNxMW1YYVhoT1hXVHQvb3Z5NVVra2JXZ2tYUHZO?=
 =?utf-8?B?ejBEVG80SXJ1S2Q1ZC9YNkhZQUVQVTk0NE9tS1hyOG52WWdvR3ZCemZqUSty?=
 =?utf-8?B?V25RZk1odzJwNmdsWHRrNnpnN25xL2pUVWgyYVZtZnFZTmloY0pCSVZCOFM3?=
 =?utf-8?B?UmNGR3ZEOVU2YWVPNDNXSjBBR0FDeGsxNHVadE5EOWduWElocUJnMWxOREVM?=
 =?utf-8?B?OGptMlkvaUV6RlRSNzI5MHlLcnlMVWNsZUZCcW8ybU4yblU2SVJYNVJ5UjA0?=
 =?utf-8?B?TnF6VEFjYllZQkhYRXBVMG9ORVArd2ttblp2NjdVMVNQR2djVXB6OFZQNjla?=
 =?utf-8?B?bHZLQlc3VXczSzZlWWY3WmhRY2E4cU5TcjVxbW43czJHVy9nVHU3Q0RwV21s?=
 =?utf-8?B?MWNCVU9LUG5nbmU0cHhJTHhwZE9JVnRMMDBBNlhLRUpaZENFb1pxMVdYUFJu?=
 =?utf-8?B?allJL2t0eEdpempBL3gzNUV6RU1BOXRkUVRlQzlKZ0p5eXZEK0FPZE9DRkxw?=
 =?utf-8?B?cXFEM3NwN0lkb1pUdktnUWRUWnB6cTUxa2hMRWIzaWVTc0dic2U1aFVORldE?=
 =?utf-8?B?dm1zTFYwWitLTkhyQUhiZVJzRHJrUnRFNUVnZXZ2QVR4ZGtjcS9oRmRrOEg0?=
 =?utf-8?B?TFhTWDlkc3FHS09rQVV0Rmo1YWYxVnRmYk5xNTBGcEp3b3huZnY4YlFlTWdQ?=
 =?utf-8?B?YkRvYU1NYUhuUDFFZVIzckI3cUYwUUJSRlVsSHU4ZGhsUExRdXhlSXIyc3Q1?=
 =?utf-8?B?dEpSdjg2L3B2QlZZeFg4dklvdnVPd0FxMjlhQ055dkVLdFFJbXVDUEpOYzlT?=
 =?utf-8?B?ZStKNzFHMWwzTUVXOUdGR0hTZDYzYXhaTEw5dTc3TkFxQk1iMU9ldTF4MjRv?=
 =?utf-8?B?eDhkK0l5cUF6eGxUTkt2d1IrVW9zRHZ3TVJyUjJPbmJrcTlyZzF3eFBKcHJj?=
 =?utf-8?B?Z2F6b0dhcGF6ejRoNGJQSklqZ3FteVVaN0d6WHNOb1l4TmZ5aEZpNWFvQkkx?=
 =?utf-8?B?MEpvMkk1R0lIVzRrYlBYcnd1a1BjOUp4NkZZZ2lzUElqcVFxc2ZiR1crenlI?=
 =?utf-8?B?TitIemN6enJMVElOTEJPSFBwZG9aWS9xUzlSWTJPZU9YajN2MDA3cjFSanQx?=
 =?utf-8?B?YS9jNHZBWkhmbTEvQzZjSzlUeVY5WXlkcGhrWGtoSTljYkVoV1lpMGFCUG9L?=
 =?utf-8?B?QnBZbjBicjdRSklRbW90WHRTVnZqQ2FPZkpJdkhiU2JvYXJzb2V4WG5sRG5v?=
 =?utf-8?B?T0xJTzNzb1lvSHQwTExYNFFPUFIyTHc2UGVndm9jelUyK3pxdHZGV2h4TE9v?=
 =?utf-8?B?bThrSE82ZGkrS3JibzF6YTJkUlI4NlVPM2Mwa2tkQWNpVE16UzFBZz09?=
X-Exchange-RoutingPolicyChecked: bFt9SPhLawWzqTMHZAQeE6TgWVXdKk3AwQ2pqx177x6IvvR5OOjw6woBm09UbiSQGMKnjPEj9Rt0MopsGFHofl2vPsh4pDzwPeCZoB9jHB+erlVkZsnoxzbu7YCywvg56nNWu0XtysfvMgNgnIMf3PI+BLUn2iDl4LSu63MMUnnlwaScYVXURz6LTb3CAUQeEogxHxrZJ1xXOXPKt69r+oX87aJ3g2rv9gMJgRMj/oOapNmTyI0YB+rZPK/QYkBZUF8uVMQkJiykTEj+hRpDa4pwF76Qu/k5tvynvVVHpXhfcXQQUHucqbsIoftk7f0xjvhdKuaOlH+6+T7K8XM4Fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e312f31f-62aa-45f3-79d9-08de7f5d5aaf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 11:00:06.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNG5CO7GxEb/aL5i2jIyREk10VYpiFn3mBA5KgBhBJqPO8pO2l+1yiySrQ4PmG1jIc8hD/kVU/k5QLaOYZv+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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



On 3/10/2026 11:53 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add initialization infrastructure for System Controller subsystem:
> - xe_sysctrl_init() and cleanup handler
> - Integration into xe_device_probe()
> - Makefile build inclusion

The description should be a brief of what the patch is.
Mentioning 'makefile inclusions' is unnecessary

> 
> Initialization flow will check platform support via has_sysctrl flag and
> configure mailbox region through SOC remapper interface

punctuation..

> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v8: (Matt, Michal, Shuicheng)
> - Fixed include order
> - Added VF check
> - Converted runtime checks to assertions
> - Added sc_to_xe() helper
> - Fixed kernel-doc syntax
> ---
>   drivers/gpu/drm/xe/Makefile     |  1 +
>   drivers/gpu/drm/xe/xe_device.c  |  5 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
>   4 files changed, 109 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f63fdf80055a..76a86818986a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -123,6 +123,7 @@ xe-y += xe_bb.o \
>   	xe_step.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
> +	xe_sysctrl.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
>   	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e77a3a3db73d..c70d4ae413a9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -65,6 +65,7 @@
>   #include "xe_survivability_mode.h"
>   #include "xe_sriov.h"
>   #include "xe_svm.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_ttm_sys_mgr.h"
> @@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>   	err = xe_device_sysfs_init(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> new file mode 100644
> index 000000000000..2751fe25a6ff
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +#include "xe_printk.h"
> +#include "xe_soc_remapper.h"
> +#include "xe_sriov.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_types.h"
> +
> +/**
> + * DOC: System Controller (sysctrl)
> + *
> + * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
> + * responsible for managing various low-level platform functions. Communication
> + * between the driver and the System Controller occurs via a mailbox interface,
> + * enabling the exchange of commands and responses.
> + *
> + * This module provides initialization routines and helper functions to interact
> + * with the System Controller through the mailbox.
> + */
> +static void sysctrl_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, 0);
> +}
> +
> +/**
> + * xe_sysctrl_init() - Initialize System Controller subsystem
> + * @xe: xe device instance
> + *
> + * Entry point for System Controller initialization, called from xe_device_probe.

How about suspend/resume?

> + * This function checks platform support and initializes the system controller.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_sysctrl_init(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_sysctrl *sc = &xe->sc;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> +	if (ret)
> +		return ret;
> +
> +	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> +	if (!sc->mmio)
> +		return -ENOMEM;
> +
> +	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
> +	sc->mmio->adj_offset = SYSCTRL_BASE;
> +	sc->mmio->adj_limit = U32_MAX;
> +
> +	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);

Let's use devm or drmm. Not a mix of both.
Sc is specific to device so devm would be appropriate.

Thanks
Riana

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> new file mode 100644
> index 000000000000..d5d8735038ae
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_H_
> +#define _XE_SYSCTRL_H_
> +
> +#include <linux/container_of.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> +{
> +	return container_of(sc, struct xe_device, sc);
> +}
> +
> +int xe_sysctrl_init(struct xe_device *xe);
> +
> +#endif

