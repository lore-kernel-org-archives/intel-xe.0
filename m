Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF71CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 14:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2FE10E39E;
	Mon, 25 May 2026 14:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbiNcGiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678E910E39B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718452; x=1811254452;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U+tCjOBO02tvQNi1GpDREbR/VGXUfBK/ZVBCOGy0RKw=;
 b=VbiNcGiCXCIMGi/f7DaX+xa3wxQZp7PO2U5CrXOkvIIbKhxIWQmjhoFV
 lEJcxBxnwKr814PfQ8mGB85bCLUFc5hMDP/5wETTQ3tHAnndGl48CJkl8
 dKTtTgnuC52LypckjbV62qicl1576p657zines0+tAVRjRepqlB9XHGsc
 IwzuILs21P8Y3DbQ5PjeT0tqnfdK8NTJsdDEAgNsAJUFK72s+JerDR4Hx
 +L3mzuvOMbNXW0GRDIFgImCfX943TAinthNJEGHfHX/hdgPp1CrXUdt0d
 kCm5VP/qZy+nq/Ea0uSBWL9Jeti+oguB4V5m7YdMRqKZ6VMXxggT74y/J Q==;
X-CSE-ConnectionGUID: j2siBnBcQne+GioYjJ0XRQ==
X-CSE-MsgGUID: O4tcIq48RXGtwp3dS5U+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83119195"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="83119195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:14:12 -0700
X-CSE-ConnectionGUID: p+hKDhbTSHOr8v9Z1DV4Yw==
X-CSE-MsgGUID: dARz/C9yTRGGzZTNrB7vpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="271942674"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:13:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:13:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 07:13:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 07:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObZ/9o77p59y6FNoINJX4Stn6NF/IizWHacI3Y9BZKia5pGHpFnS4QwFZ/zdMAVFOMNfjp8gPQXrTuoirJ6NdzjsoddipH1Cs5tOE7RpDO5kA6JL/DFhr8v9MURvJZpCQNwouKY6Bby6ns2RmOC68/rDNKuCfRsUIfNAOIi1nTViYRZha8MeJYkMT1EdFiXcPbAE5HwN4PPwhemIx3k2ftWlx17IWJx8whKcNfkz8rngSsbYWMmUih1PUFrRHGUOMWs6NPd2wGkKVrzrb6FMjIOuB3ZZuk7n0uDOHQuM8dvFHV9ttAvyVcdsSxBm6T4EPjjtu5WiGnjZIWdwYUqY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5qnzm9383uo2v5f/Uni5SvsMklh8ooouCqHDDLAGVw=;
 b=hWiqBmhHDoGWsmO5u85FMsEsb8L1I8RBPWjADhumKDLYlQK+ib2DQN1ibaHCvJWoBEXBwRUGy23mDMz5kxuboo63xbqB23HFO/KdPabmr6Dz6nxAMFEJ9b3Fr18e2S11vo+wfWEjYPdTL9BWp/eLhYvmBDH+cdwb9p6XbbsA1DIeKhBueJmtQDa+5wT7cpnjqMP/0WZWwt9AOR7A0ojcip9e1onX3asmQD/MIRy1/+xQ8ZdyPjQbavoeVvmbAvZt+iFoMpt6QGXSo8INwdgSmDWNOA8dgdAEG8QDnH71Gef9H2I9nD2+1GsbkHoBrEy4yiWGFexbd0aTHudcJLbHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:13:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 14:13:47 +0000
Message-ID: <3138ca66-a606-409d-a245-9ded2fe91230@intel.com>
Date: Mon, 25 May 2026 19:43:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-10-riana.tauro@intel.com>
 <agtL3NF1BFyEX841@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agtL3NF1BFyEX841@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0355.namprd04.prod.outlook.com
 (2603:10b6:303:8a::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF7A0031045:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ce057d-cbb2-48bd-279b-08deba67d64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: FZHRGkf02Fcm5/zASZZ8uj0xKtBKUhgKI5/X/wBdThwM/4Z1DjeZEHo/qhgEpAsdKGcWDnO8UQKDH5W3QEg/ZMSqXtdncq/C0IteC1QVBJUVskU8NNr8PY+J+BSwpASeZxZDb8oIJoyx9HAbHNZreQKN72ogdgUSDEE+IxmSVzgmfJC9NoM7BGcGl084kXCyO1QRJh/YCt/k3K0YyoDZpgI4BcAmzx0i1mWQD95ExUnFpkdL7FRvCGxHZgKPo0Gz6GjPep0tC0iE5IgHjTWH63AwtV8IJIueBvGIIpoEuMOQ5uPZYOhZYIvX20pAohJBzXOjjxFPRPNemljeIHGWpg3/D3WphP+WJQsR2UzCVQhdBoBxXJViv9twgsLziYnDZkOUPTp+OUhP64OFsHLYs6nmqb/2aZT5pdIPEybV+7eQnhT2D4dZ59eOT4amETUY0Nah3cHG6e32SlAyZSaCeXGc3yeXmKxidN+XRAtRQy9dTGWQLJ4omJu0lu2YMEN1pIgPKIcX6Yruyy8X6AhVDuhuwI8xb7/iMyqWGGhZO3IiT6w7tPslVxzVOMogQxOCRp2BAZIQ541gLJ9QXUsJLBd4IuEqHVEGhW8HWiP1qFvSL7V74YgOH4JxfVzoksAQe486KHuJFe8TqViytrif3vD8vOsODO1rliBmHToBO8s7fi/+XKXBP1QZcgk0ITT2uq7sl0AIp/MB9FPJ5R3MAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9aRFFtK0Q3NkN2RWVic3YrZjMxUGc1RGZkWGk3M0RndWJaWittTnAxeXRH?=
 =?utf-8?B?R1YrZnlsaUprNDRnWkUvNXl6TTZCdFpTZGJKTlljRXV3V2IwLzRGMncrZ0Vm?=
 =?utf-8?B?MjBOQ0lTbW12c3A2aHhCTDJJQTQ4b2tEWDFhMG8rNTNBMmhoN096TmJMTFh0?=
 =?utf-8?B?U0V5Nmt3VnovQVd4VUZnWUF0N0VPcnR6MFBvdllZRzNUdEZJWFp3V2JZWWtK?=
 =?utf-8?B?N2xMNnFvdWhYS3N6NXJyVFpIT3JUaVk3K0ZSVzdkVGJtelZHNVZmdTRSZ2l6?=
 =?utf-8?B?NWcrVDdtWkt0WCsvaDduWWZFVkhHa0VmNWx0eENsaUxYQlRaVTFvdmNRUU4r?=
 =?utf-8?B?QVpZamIybHZSSmI3SDdUYlFmNDdXd1owUnVTdVBnOUdDbTFJNGxVRGR3ZUF1?=
 =?utf-8?B?aEZQZ0lyWlJoVVJKZ2dBYjVEMFdaRlRabXp0UFdvcEdQSFRLOU04cjV5WFIy?=
 =?utf-8?B?b1dYZjA4WjhZeGNONzU3Y0tHT2puQlhLNGw1cUhCZW8wSWdvT0FISVhKWFBo?=
 =?utf-8?B?SVF6NjQ5SE1HRDRLY3JCM1g2ZnQwdGZLQ2VmVEsvcXNBRnF2Ukx2d25nVGg0?=
 =?utf-8?B?dEMzZVhBbkgrSC9DcktOVldmK3ZLSXF3bUNBZWtsM0Rtd240UE9ZZjBtd0Ry?=
 =?utf-8?B?OVB1a2FPSkJGWE1mYURLL2FIeGRxNU1ocTYvUnBQN3lRcWUwS3N5K3V0dE5C?=
 =?utf-8?B?cjV0TmhKZzh6WDgzN0l1VEJ0blNoNVRaQk1relNONkUzTjVFRGl2V0J4ODhv?=
 =?utf-8?B?UUZxRUpFdGtQSVgwc2tBY0lkSmxOQjhaSGthSUxicWY1alR4VkVIZDMrTS9B?=
 =?utf-8?B?bWVLN1ZrNU1Gd2RldnZ0d0tIdmY3OGgrcjBSelRDY2RyN0pvRnJDRnZ6Undj?=
 =?utf-8?B?TnFRak1IQnBPOTFxS0grQlg2VzdSaU1OUjNyTnZBSHdvRnNvNHJrVFZDSlhk?=
 =?utf-8?B?akQvYmpRbEw5R0o2VnhId0diUFErMGFxRS9UeENUdW9JWWtpWG03ZUxHVW8x?=
 =?utf-8?B?cTlTeTUvV1AxTktwYW84R2h2STdoWVc5bXU0MFViWEdYRGhlbk44WXVoNjAz?=
 =?utf-8?B?TU5CdkVwV0M1eXhQM3FFOFYza2tBc1ZZNUswdEh2UnRheVF2SHFwb0VRYWtU?=
 =?utf-8?B?QWkzeEVMNnNjV2VXcmtXaHB6dmhhZldPd1pFWlJzUERGVFFtOEhtbTJBcnRG?=
 =?utf-8?B?RWxYaWFLNmcrNGVkYkRHVWFHWVp6MktzRSs5WTNSaUs4SklEVDREMzlTOSth?=
 =?utf-8?B?VlEyQUJjbVl2dFZRZGxsZWtWV3dmU1lxaERac3dBVWJPNllNZmpDeXpyK05P?=
 =?utf-8?B?TWIzRGVkUjBGYmdnczVGNTZaSllHVzRzdW1ZeXVSY2JHT0drditoWm95OStW?=
 =?utf-8?B?ME1uL3QxYTZzVGhpQ1BQdVRocTdrS0J6WEx3NXREZUQyZGlKOWQ4U2FCRzkr?=
 =?utf-8?B?RTNRVnkydlNjL0crMlZXd1VhUFFidDlOZjJ6Zk42dEZhR3BtYXZNN1dGL3Nj?=
 =?utf-8?B?WGs3ZXZNSW5VanZHQVovY21jNXZUN3lLZlBuOGxkdlpGcGxUQnhSOWpaY0F4?=
 =?utf-8?B?L1pabVJ3aWJQRnRmSXdEeXBXN1FlRXY3ZFRsdGFqK3k0WVAyaXpPS2IyRVNh?=
 =?utf-8?B?UXpWMVY2QVpmVWhEem5JMFNIdFUyeHVnZ3Y4S1pJdUFPL3hTYWNhZHlPaHQz?=
 =?utf-8?B?ZEZCY0REeGtiSUt5VmxmQ1VFcEd3bGxrempqS2xZYWdnME9sajlNdzY0Y004?=
 =?utf-8?B?Wjc4WmNpa0FVWGhFVXliYjhuWENKZWlHV2Ryb0x3Y1hUTjBuWFpjVW9aS1Fk?=
 =?utf-8?B?eCtzTWx1T1JqbHhORVNZTW5QbU5tbGhMMkFHOTZQSktzNCtqbjIvUXh0aU53?=
 =?utf-8?B?ZGVEQ0hGQVRBOHdVVzlUZHNaT1dmVThxTk9DaHV0aHhUVmVBbU5DZldvcFB0?=
 =?utf-8?B?eE82VytuSWt5OHZQMGVpbkIvU08rQ2lqL3E5UnZYR2VONDFpN3I3ZUNRWmJS?=
 =?utf-8?B?eDB1aHdnTndEMUZtYUFwMDE1ejl1K2ttY3JDYUVCRE5Jeng5Z0xyMU9VUFVp?=
 =?utf-8?B?dmtnT3ZBR3krT0lEZTZwN2RlZEdNQUxDejN0N0tUaEllVUI5a3VCYWNyRHFl?=
 =?utf-8?B?aWM2RWc3SEZrS3UxNWRpblowZHpZaWhnVkN1MzBkVXpXUXJqa0EvMnI3Wmds?=
 =?utf-8?B?SFhzYjl1TnFwRG9RSnBiVUV6Zm53cDZKUmt0RjZGYVJ4dERpUSs1Y3ZPMjJZ?=
 =?utf-8?B?aWNLNjhucmFnSjg1azhxc1FTTnlmR0s3RnZyQ1FXN2hCTWxDOWZnNXhDQ3FI?=
 =?utf-8?B?bVlUd04zd0ZhYmFib0t3RUlYWUhabWJrUnF4U3pSNVlDYWRNZ0Y3Zz09?=
X-Exchange-RoutingPolicyChecked: i9EvhwYlNYz9B5s5IrzIxiWCkf5si2iHNDTd0eNIW82g1IwK7uUUcdU4AcH2SfO2tY3YE7It67uGvW9aj2+ziSJWB1MoLd3ZRzj5fJDDXqw1yBL8T5iKcuPD733FYThx1ij9YJgcHUmxgNgEpP9wbrIk7zBTcjIeSHbh5bcLFJzdZnqVP2obLiHpXPuA288fUeAGOISSeTRaHLGIqGQFWjNhKlmW/fUwAg2q0afX/+4tFV/mAGCJ1g40tsTUyXK4fEuSYKO+M24+iKajRrWzgkGN1tX//8sQbT7VT4WzqU7WOFeAfmcFoUD2UBh4nQpRuU6WfJH3txY2cmKcw8YxlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ce057d-cbb2-48bd-279b-08deba67d64b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:13:47.4806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buhWzWdPsGRT9v7u2z8YVVhyUXFSPxKd8+QvtJbvV69zZr29JINmZtKkE3F56ClhNhN/XhjOQ+DRCQUaUAzK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
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


On 5/18/2026 10:56 PM, Raag Jadav wrote:
> On Thu, May 14, 2026 at 10:52:08AM +0530, Riana Tauro wrote:
>> Add request/response structures and helper functions to query system
>> controller to get error counter value.
> ...

I will change the mappings to switch. I was working on events and there is
a need of reverse mapping as well as default check.
So to have consistency, will change drm_ras_to_xe_ras_component and
drm_ras_to_xe_ras_severity to functions with switch.

>
>> +	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", response.counter_value,
>> +	       comp_to_str(response.counter.common.component),
>> +	       sev_to_str(response.counter.common.severity));
> A bit heavy handed with nesting :D
> You can use a local counter which will also help remove the wrapping[1].
>
> [1] https://lore.kernel.org/intel-xe/20260512191610.1817578-7-raag.jadav@intel.com/

Sure will have a local pointer to response counter.

>
> ...
>
>> +/**
>> + * struct xe_ras_get_counter_request - Request for get error counter
>> + */
>> +struct xe_ras_get_counter_request {
>> +	/** @counter: Error counter to be queried */
>> +	struct xe_ras_error_class counter;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_response - Response for get error counter
>> + */
>> +struct xe_ras_get_counter_response {
>> +	/** @counter: Error counter that was queried */
>> +	struct xe_ras_error_class counter;
>> +	/** @counter_value: Current counter value */
>> +	u32 counter_value;
> Nit: It's already 'get_counter', so perhaps just 'value'?

sure

>
>> +	/** @timestamp: Timestamp when counter was last updated */
>> +	u64 timestamp;
>> +	/** @threshold_value: Threshold value for the counter */
>> +	u32 threshold_value;
> Ditto, 'threshold'?

sure.

>
>> +	/** @counter_status: Status of the counter */
>> +	u32 counter_status:8;
> 'status'?
>
> We should probably make these consistent across series', so let me know
> which ones you prefer.

Will rename.
The status here is not the same as set operations. This says 
active/threshold reached.
I did not add the enums as it did not indicate pass/failure and is 
unnecessary for
netlink operations.

Let me know if you want me to define those.


>
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:24;
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1[56];
>> +} __packed;
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3caa9f15875f..b7c4d8c37819 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_sysctrl_prepare_command() - Prepare System controller command structure
>> + * @command: Sysctrl command structure
>> + * @group: Command group ID
>> + * @cmd_id: Command code
>> + * @request: Pointer to request buffer (can be NULL)
>> + * @request_len: Size of request buffer
>> + * @response: Pointer to response buffer
>> + * @response_len: Size of response buffer
>> + *
>> + * Helper function to prepare sysctrl command to be sent via xe_sysctrl_send_command()
>> + */
>> +void xe_sysctrl_prepare_command(struct xe_sysctrl_mailbox_command *command, u8 group, u8 cmd_id,
> There's already a sysctrl_prepare_command() in place, so let's make this
> a bit distinguishable.

Oh..i did not see this. Thank you. will rename

Thanks
Riana

> PS: I've used xe_sysctrl_populate_command() in my series but I'll leave
> it to you.
>
> Raag
>
>> +				void *request, size_t request_len, void *response,
>> +				size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr header = {0};
>> +
>> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group) |
>> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
>> +
>> +	command->header = header;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
