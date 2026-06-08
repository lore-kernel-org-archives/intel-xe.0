Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED23CCD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 09:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0510F068;
	Mon,  8 Jun 2026 09:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0t+lmD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841BA10F068
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780911722; x=1812447722;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mwamVeVxjbvEym7Tf6iHmluth+xHJYhJdXgJHJzUvko=;
 b=j0t+lmD0P8bZ+QWAgPTbIkOTuOIJyxSF7bz5Uz8b30K2Q1tqQCEDHuOY
 NiFLEoUislNjoFblVmwFiyZ5BSUNONFqs8lTjyxjcjhI3esSTnAQ5iirt
 II9wagq0T83KVcbO0vi64wYu36vQS6hRs1ga+8Mf5Oug/o4lwvdkZCywz
 aA41mphma3qBw+1zlUp0PNR2sY9o+k0Mtf6wBPFP0JC0/lepvRiTSwyZm
 Y/h5nZZNW0jlaPN4rwjSyFldjIRbh3v4mCP+12nBPsJs5TvicYoUlRlFA
 eqr7mYZj4wshtKobnIqXsKFVFcNajHCcu5je7X9VET99f/Eu2ekVVPR4I A==;
X-CSE-ConnectionGUID: wN7YIak6T3+FkZaSwfvnTQ==
X-CSE-MsgGUID: +fV0b4XNSZGBUbU3vCFslQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="99225637"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="99225637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 02:42:01 -0700
X-CSE-ConnectionGUID: /wKAXSEaS4y3YLy6HyCj2A==
X-CSE-MsgGUID: eXng2bRRQ6aMSq4nFOiPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="242538136"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 02:42:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:42:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 02:42:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 02:42:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFyag9PnB5XBOvG3vcyIFmsX5cE48EWtiCSBwR4fkCWFYbYb9HANA3wBWtDzdzCTK6L8x335q5ARxq48Rd7S/1rlArSh85DxFlOmYlCV6tuMElrS6+kWdyqJa1N+vkfPE1ugZEw/5A/b/EHRl0eLDnoxBYdM2johq5spzrAUgGtc7bxprpwCGwEDrqkuFnqF3LjR/fK1WOT5Kky81n5Eokx8EB9rJiXNw18ShRUvfP7+xT8ljHXB1Z3fuG1N0b4YvEloPqCQw3G8s6iVa1o3Bc8X/5AfgXNCK4AG9SqVsE1SqpnGh4qcY52v9Jg608gaPew09jiG/0ynbkJI6jzAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVOqu4bVAZk8keI8aYGv+e0jhvX9rUEVmdvm/NN7R1Y=;
 b=A9wSk+KXKs2lJFsgDmwyCdSjzp9plu0JcWWpZO4hX4sjbnm2bOVH9nA3Ej9GDKutIfCv/29ywjXDPnYXnQfaazK0ZGfwkfAnn0DSqLxcC0srnNBmYPEo2CIifiV/JjbK6CrrsKwViuNOe0gnkubagi3X1jAxUCpL7p2VTa8sbCmO02ZeLQcFe91B0IU9YpGOWDf++KJYmx4joAv0/DMryUBWJ9qcGzaQCXhbpPTOViKCV2zoYiaiJgmd3BPbAQYBW7dMXjMYs//NUlDRfKz23FS1qcUGaiTh+pIJwsCfH3VRGJ1RXvbHrspFTgvLwpDGc6VXyXTrzYk0InXxuwW31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 09:41:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:41:57 +0000
Message-ID: <39aff126-c1ec-42ac-8b16-6f149eeab163@intel.com>
Date: Mon, 8 Jun 2026 15:11:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/xe: Consolidate debugfs fault injection functions.
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260604132623.1000288-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260604132623.1000288-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: d326c876-5887-485c-bf48-08dec5422e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: HKA7Sm0NpNTB49X1y4R/JvpY6xzENkrt6AtVZWjiBBdh5HT/iIv17JUhInPnmQBse2bTeM0Clfx0Rvtf8ehO7fIjfEpGVP8Q/7ngOZQktlyXGuwG844aiNRvs1ro/tTjvCELxQDDbi5QI9GAB4iuvz5dYWhTzW+TdNkVJPYkj8eQcA8qnHRNdCK8vJGlgNDIjDxbDPg0N3KxVLonbAw3SzFaWc0GhrKQACDB82nGoQjaSqXzoi5/vuiqNebvDnxbE+S+PX6z0FnU+wxf0CT9lDvZlqn2WEJ/XK2NdxyTFup0QYfm3PhChWtHPwrwPQyfsbGd9r+pU0DX/HNle0Ideetjuau3H+UfqANg22X0PZpsjO6Gr0fcTTn0d8PtBgUnGGwSWY+yc/HePyQDvV92UQfo6z9TzQ3IRHr/VuDxTYqHe4NRxsdNOHqe283k2KP8MKbtTL04v6c6cz/Z4HPSCQQzuv7BSlmEIJTeEMXaeIzBvqudWRl5mbVl5FMT8nePmwbr+oUr0ord+VAeL+aU62FzuRj8ikN6SJqVhuqhFunJkk18UglacXaLKa3+GYYyOSdvvG5Jj3jxvHvMWyn+Qh0kr3Y7Zd7wgT6dvZguZF0MVeDglzh6IY63O2oom4E4DXQnfKDwLsDtVdN2yJSomNpgAp+21EM71QL5ZjdXCpScH4Z37kSj+5Dm8wepyYoF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZqemVwZk1rV05oa0I5clFhblhDTm82bWI1WDl4Z0hJZExhdmRUWHVPUTRE?=
 =?utf-8?B?d05xRmhOY0ZGK2lLU3daUFVlUmw1bFRKMlFFRXM3VC81NjJIYzhqckFlT0Y3?=
 =?utf-8?B?YkpKZmQ2MkxhM0ZIUS9NK1hhWTZkZEtGOVJuVURHZDRBZWdHTS9hdlF4eXAx?=
 =?utf-8?B?M0xBNHJZckhFYlF4aUdSY1VYVTdDZzVhc2Z0cFBTWUZ3aTg1bE9EenpnM2c4?=
 =?utf-8?B?U0lOaEp5b2dadGZ2akhIY1FJZXVmT1lid3JpV0tTdExjRXVISSt0WlZ3SnhD?=
 =?utf-8?B?U1lqWHd3MnZmYjEvWHlUYXlZVG44cDdxNjJGT0Q5dmRjeldiT3cwUjJhMnc5?=
 =?utf-8?B?RG5TSFM0d1JxWGYveUNqalphZXIwVWl5TEh0N3Q0blFvSTV3cXVRUi8rTzhj?=
 =?utf-8?B?R1dncFZ3cHVzeXVoQ3hsRHBrYWllYml3azhlS0tuZ2prcWsweHMwakR3MkVY?=
 =?utf-8?B?angzTHgzTXZ6ZVQxQ2J4MlppUG15R2lPSklhaFZFQUs1c1RFdnNXK2NaTVNO?=
 =?utf-8?B?bFBVcHk2Z202WTlXOW1xMVR2NDFVL1RCSmJoYjhCZ0FYVXZqUXNBVVFGeEVC?=
 =?utf-8?B?bGh4U2k5NzdTLzEvQjRmZzRKcXBINUllc2tsbUtWZkhJelcrMmx2eGtweHdD?=
 =?utf-8?B?Y0pOWHVQR2ZOWEZlc08rUmdUVklsQ20zV3VVWHRsd0ZuV0VwOERuWmZEWGRi?=
 =?utf-8?B?ZzJLRzYvTzlYb1dBWFZmOUd5UjJ1UUJaWjFLQ3FWWWpiZHMyNkxKVjZIdXBx?=
 =?utf-8?B?NTJYdjhqOVZYRW9vR2F4M2NHVDVxRytNYkd6eFB4T1NYNXZoajBCMkpiYWZR?=
 =?utf-8?B?TXZ3Y2taK21ESE1RMnZlZnFTTmpxNG5HeDE3d2g4T09PbExyOExleWM0S1dM?=
 =?utf-8?B?L0NkZGFwY2dpVlJBTTYvcERJRzRsV0haWXFDa0U2MCsyMlZ2VDdQa1YvL3Zl?=
 =?utf-8?B?NTlLWkxrckhtVVNKZEtVVERkaTJEdE5wdVBCU2RxZjhFMmY2RnlJeUJhMzlM?=
 =?utf-8?B?bGtLYWp0NUpEME42eW44OHVoSldaUUh5UTcxZDZJNnhJc2ZUazlYQWoxUSsw?=
 =?utf-8?B?OHRRM3hRaU54bHdzL2c3K1FYRlZadzZZdGFMUTRKQmhuMm5RR3ZNZGxtQnUz?=
 =?utf-8?B?YS9scGY3RTAxQTdGWWJFRnZRbzRManRkZUlueFg4Q0tmVUZFUTZMdEhRUzFr?=
 =?utf-8?B?N2pOZk5lWUw5eFpSUzNSU1JCSGJrUlVxaVhEa0tPRFk3NTYwVWNpSDZPY3Vq?=
 =?utf-8?B?dEdHbkdJZ1hscWlOWU5mK3hPZWtJU2prZWx6TEZyN0NveEtYU1BMMXFmTXky?=
 =?utf-8?B?c2xGaCt1Qjl5KzUxRUdrU2VyTktSWmlZRWRPVDh5a3Y4aExMTlR5WThxcVQ0?=
 =?utf-8?B?SDdVMVhuUlJUSHZ3czlaZGF5VXFYaHNBQ3p4VDlDc1hjWjNDYTJZZUUvMnVn?=
 =?utf-8?B?VUExTi9DclNnRDQ1N1RyaHRYU2YyME1KdExWYlNsMURrZmIxcmdMZCt3NkNC?=
 =?utf-8?B?QlZRbjlqNEhMR1NwU2UvMHhDWlpoUERYQ1psL3NoY3JjNU9lclprMGZaWUhK?=
 =?utf-8?B?OHQwL0VRMXQzZ3dXQzlxRTZpMnVtVFUxQmhxSklpOWJmYWJjR3dVOGdsTXJh?=
 =?utf-8?B?S0V3eHZFcktpU2wzbnJPM0FzNmJSbk5Sc3Jnb2w5VUU3WVBjSkIyYTVqK3JY?=
 =?utf-8?B?M2h0VlczQ3ovcm1pU0N6b0IzTC84Z0p1cWlRbUNzODJtK2JScEpQSTcvQmw2?=
 =?utf-8?B?dnhHQUZTakpZKzVkRVppOHFqbGZCd3pwNnFBRXpXN0xEVDNjV0FHc2ZScFhE?=
 =?utf-8?B?YzhVb1ZwcnJ1ZVJnT1k0QnoyTUJOQ2JWSC96Q2pjNXcyZnZCb0hJVkJ2UnRm?=
 =?utf-8?B?Q1JhckI3SWdPSE5lRmpBd2pBd1E5SEQ0YjNoV2tDcXg2dnJ1SW5zVTNXMUg5?=
 =?utf-8?B?Y0gyZ25XZmN1RjkrOWc2Zy93azVvMDdjMzU5dnQyaCtiZzhWTUNLZXJTS0VL?=
 =?utf-8?B?S29rUDdMRi9xckpEYXBtRDg1VEJNWmp5SzNaUDBTbFpSV3VwR2xmSE1UN2dY?=
 =?utf-8?B?Um9wNSt1M3BMNjQvNk0vaHY1aldvY0VrYkFQb2J4UXZ4NXZyTytoeTNEYkw4?=
 =?utf-8?B?V2lDOU1YVTdqZXZhMGYveGhLc0VxMGI2YVdJME5rQVJ1QWszQ1d2dFBaMDJN?=
 =?utf-8?B?UXdjZ21oeExWekxvak1POVh1VVExcDg1RXR5UUpwNGFSazFGYkU4YzBuMy9M?=
 =?utf-8?B?SjJUcldSaDFyTDFDTzdGVG9kWEN1TWF1N2ZYTng0dE1QL25qTG9LbklUK3d0?=
 =?utf-8?B?VlgyT2lZeHZwZXJYWkJxQ1pxdjlibitVT2F0d1EvdnJxWVorZ21tZz09?=
X-Exchange-RoutingPolicyChecked: nZNvBscXFahOJEDdsi6EIAK52jL+BWQfsZD4J8AJvlNWXPt+yTgz3V+y0FFnSvxwf2lo7lbwkr1nBijX3votKrmsAltw/OIlePjICBT2EIxOIp2a/SnsZeaj3Imgrx1PQXG80lM+qlfrAxr6n+ZSnIafSHL0aEUohnHVO2Mj2wFJ6YpjWujH7nPTCH9QidfPh9wpCc+GPzrfwmeJpb/HJ1GapQkihzCcyP0UZWxuho6jwfyFl/E0C3dlPBxtI7qjAVEgGGO2tqzFkWSRT/xk9YDWCIGeKKLXtSvUEZUI6MTk7E+AfUY9uvI7cMpXDDgqrVBZlQ02wWvY1A6STXXs1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d326c876-5887-485c-bf48-08dec5422e82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:41:57.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pN4f+KfawVFP0Q+saPqZyg2am9PJ5KOA9nogkDD/mvajbXRHgCrqC48NmlBgqENscwxOdXfVH8UsNOCW3yGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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


On 6/4/2026 6:56 PM, Mallesh Koujalagi wrote:
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
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c  | 53 +++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_debugfs.h  | 23 ++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.c       |  5 +--
>   drivers/gpu/drm/xe/xe_gt.h       |  8 -----
>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++-----
>   5 files changed, 76 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..21eb673b3f27 100644
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
> @@ -38,8 +39,52 @@
>   #include "xe_vm.h"
>   #endif
>   
> -DECLARE_FAULT_ATTR(gt_reset_failure);
> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)

Instead of using this and having big blocks based on flags in both c and 
header files.
Can't we retain

DECLARE_FAULT_ATTR(gt_reset_failure);
DECLARE_FAULT_ATTR(inject_csc_hw_error);

and assign to .attr.  We have a fallback for this in fault_inject.h?

> +static struct {
> +	const char *name;
> +	u32 platforms;
> +	bool skip_on_vf;
> +	struct fault_attr attr;
> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .platforms = BIT(XE_BATTLEMAGE),
> +				    .skip_on_vf = true,
> +				    .attr = FAULT_ATTR_INITIALIZER },
> +};
> +
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(&xe_fault_inject_entry[type].attr, 1);
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
> +					  &xe_fault_inject_entry[i].attr);
> +	}
> +}
> +#else
> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +					     struct dentry *root)
> +{
> +}
> +#endif
>   
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
> @@ -563,8 +608,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +653,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 17f4c2f1b5e4..c3d6c0b47b28 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -6,8 +6,31 @@
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
> +
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +bool xe_fault_inject(enum xe_fault_type type);
> +#else
> +static inline bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	return false;
> +}
> +#endif
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

It would be better if the enums were abstracted (xe_fault_gt_reset())
Maybe define macro for each type based on name

Thanks
Riana

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
> index 5135e8e4093f..c12f1b50e035 100644
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
