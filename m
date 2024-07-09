Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D332BC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 17:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD510E619;
	Tue,  9 Jul 2024 17:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNwzGhpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB4510E616
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 17:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720547207; x=1752083207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gT9UWhT4vDhcSqLZevzO2m3gWY8MZq4lhMUMqPa34i8=;
 b=ZNwzGhpuCrEY6ssTYf8bSDx3jfmphhtTBAbREDQnMhbpOzz+tpp250+O
 0gumQU6GdnYJUVsMyQc/hRy6ONgnjECea3vVvbr2PSwB+iZkukjGZpJkm
 JVTn1O2UmFSKTzE2bcwPJAQ50cQDjkDjfvZ4NkOV3TNHsQP67OSazKQa+
 i5W2dGIRgtCyYJFkbf6lW8o07iup0AiaeZj10v7BXfQoM46tRGYLNOwty
 X2Bnu2tfXKkuGSXFOa6NS3fOb1NxX54tt+RIlPIJNFB9zvb6H3IW8QiXV
 cwijgmIKbVXurHOStCCGK7dG54vgiOgn5XVcNhk6jfph4gtICt3CnC1wb A==;
X-CSE-ConnectionGUID: 6K3yROKZTKW1J/M8ebMhzA==
X-CSE-MsgGUID: kX1vJMGuRkWIQ9o9C/gfqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17691326"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17691326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 10:46:46 -0700
X-CSE-ConnectionGUID: Swz8METLRB6hgHODb7vejA==
X-CSE-MsgGUID: GrIp9a5ISSCmwImeikz1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48017432"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 10:46:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 10:46:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 10:46:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 10:46:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 10:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg10xIjvnGjVhnIM8o2+PeYmSJFnh0/YQ3hs9qkS1AZLPxzlnxM6RFSMT4X1CZNt7pCcW5NQDwt4ZcDkOrhjkDps48RPPVDpNK4LYW+5YysSokLaipp4wmlHwuRHNvxEL1IilTEIdErSzPr0xGtcrCPpKwBHY212QKm/kOKDfVzrg81zq+CRrkGsGV/0MzII7kLyRzQkAIZT37MjKMvNHwahyIHr7AY24kG+xxgTNcmVUX7Yh4lYaM2kJwG5ISHhT8VKTapaYSptnsDg7I1KOQP1/Z4Vy5qWB4FxHJE1B9oKLL3e9f0HPqIPy15qMhZRO6i+cC7QG1k4y9+rLNADuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0QaWXdplr2wzHznmF978CxEB0GBF4UPnQVjXQLs0gg=;
 b=EvsLg98xgPXLTETo6L6GOcv/Db8OfPOwr6uNYbUv2wv2twGrUE36d2pWc1fbdkFtusO1WEHp9epIooRpt8u3YIHLhwY02uVtPRcEws9GwECwxFVZT6agPMRolmdJIIOvHK3vcwbQ5l8JzxwV231SwkX0uDBHjlBNLYAdZ9yasLqdCYsO+VpWDLb0tXOdOdTTPTzHrxYtNa1yUbyaSfrrcwQFGHW5PBjvXCZCbQzhTet6/ktmGz3UBpw4N9sYr8fZ5ANy0NFdCqLYE0Kjqqbx7hZGN7yxpEWcUtxfGbvq9XRGXATz0KwnEaPYqn8hxPi2ZUvy26eIKaKUgDtjje20Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 17:46:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 17:46:36 +0000
Date: Tue, 9 Jul 2024 12:46:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm/xe/xe2: Add Wa_15015404425
Message-ID: <zvm2z7jfpdosxnkpnargmwnjf2zyh222mymxzfwj5ymr3oxazm@tx5t2m2kvgao>
References: <20240703064626.2581326-1-tejas.upadhyay@intel.com>
 <20240703232315.GB2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240703232315.GB2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f1a359-18c0-4252-ce4d-08dca03f13dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zozqiK0mr2ryp1e8CHJyJzmJNtWaWIeCxwdhJmP9g0T4od2oDbEHa7kTpww?=
 =?us-ascii?Q?S5KjIUpb8xN7kcTQhBrrhHnhCEp9DdY1p+icLvhwIQCeYaiHDWZCZG2dc1hZ?=
 =?us-ascii?Q?MEslLmi+lBhYWEBMqFa9c4vo7mpu9jBHxaYqdOQ8oXDfEiIDbp/K8mRwE86L?=
 =?us-ascii?Q?QlA57m8WlAEYwRMbljSTYVEgEbecO7wEPo0fGulwZ9IxhAdYlhcH+Gi0EEfq?=
 =?us-ascii?Q?5ABkeVnxFbNYvVu6+5JWpD6k3K9IQRXJlCUv9lFwx1e6I9+cG0vjfVmMOmLL?=
 =?us-ascii?Q?b1WXBpSP32s4q9MClpRAuV2BFN8w9yyDMn4fuzKqMyTTTH5WBaeQbOv850ti?=
 =?us-ascii?Q?0c6afWcZL8sn+Pm1eFsrZ4w8s6Wf0e91TXgfaSjKxs+k2VmZSM+Sn8S91gUG?=
 =?us-ascii?Q?DaTXeM9nD/JZ0CzYz1onndEUAl5eQUm4oRWXESKYvnsmBOmc3uQRz1uSC5Y2?=
 =?us-ascii?Q?BelEpa7WTOCuGYLGRlALAgQl7detPWCToJMafpmWrYX23PqDne8JbOS7Deb/?=
 =?us-ascii?Q?II2ffnTY150soEc8Jvxu+B4GlCpayVpm3VOsqUUonLwD1HNlPj5T9H1hsL7v?=
 =?us-ascii?Q?fqFS/2o04qmCHppH7xgXxutd990IfopaUN1JcduZEFqQg/0LVyEiHmjhfJ2J?=
 =?us-ascii?Q?fMN+OHJf9OQ3YftJ7l+MNiZnXUn43JGiXZlSqiMEFInVXElh8b1UTUb4dryV?=
 =?us-ascii?Q?gF61t7cNF7BI4j61wdmGofFOshBGPUxJEG6ebZh7mVNrkvBqEvb5uLQgp+s9?=
 =?us-ascii?Q?dCnyO4CpRFTTrXYvRh0VJTvm45BmVXoqXDI2NjGJOVVkWwRGEQan2TbPCCJc?=
 =?us-ascii?Q?wo1tu7i5S23f5wvgZJesFei5u3qv6+T7YDnOv4ZXeUqfaXZtUQv0ZGq3G5FP?=
 =?us-ascii?Q?Tj1AN6oGyO34iFP29+0+wQI1pvZK0Rmh+4FlxGTmgH0wf1/R9ESYlxxtTBmz?=
 =?us-ascii?Q?d4v1fAj6EyGBdMyQugAqOpXYdkU6MqyB5mAMx2ZKa+rJzUhU+VuXvldD+C2G?=
 =?us-ascii?Q?xDIAKc6WqmJBQiINkvPwrHF+AwS2gkWv3ecB/ldh7MUagWNJvM8gS2kEMKFx?=
 =?us-ascii?Q?Pe+NpQadaDIrLfJtIdeFidzEIuIv4BLLoxmTxBR+zaImLGGmltoHrZY4bqVG?=
 =?us-ascii?Q?4Uh4/IwHRD6ez1TDktim2ALChu0FDITKKqwBtfiiuFf3cE2PtKBIv/DJPGBZ?=
 =?us-ascii?Q?gpr8NW0noOMoVsC0XTsq4wZgfYQ3CJbOcRJRNOF6sDrq2x+QDX3g3J45BK8d?=
 =?us-ascii?Q?PPreEFRZ7fAn7KuwOw5GGdQSIefhtlKzpILWxwZpIRtdEBpdBdoiNOdS+zEI?=
 =?us-ascii?Q?haHaeViNlEa7iP/ydnsWJHtOOnH46Jy6RHYTbwxWhkq8ow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qe/Wq0Qz7Ee4telpnRhR9rMZxAn4XHDlXEFPm2ZPAfy+Cq/HBFRjrGCN8Qg7?=
 =?us-ascii?Q?9gVwUeLeJiujV5jlsrotik8huvftA4HmvBSXy2lq2wr2XN9i5qq9zTt0unIg?=
 =?us-ascii?Q?YvHP72/H4hvtC10rEQ+g766Vzh+4P/f5F8Z5+Kw3brSn6k1YqKmhRQqb+Qt5?=
 =?us-ascii?Q?GBlR4kQoDgqyZV1VwDBc35FWLRGdCVn+jg4BIYNNpYrm9lhdCO8jh1RbCnD1?=
 =?us-ascii?Q?9gobW4NdV9N5oK7cLbQ3jwOKpu7kV98M8hfefQ1GQYqec1BIzdm9Gk/o2e8G?=
 =?us-ascii?Q?+oLECCq5g1S7diLemYxaZOvgz9JWb2apYegVqg50RyObjzWmQNeSNAmYaFbn?=
 =?us-ascii?Q?FTDoabgv9iSGsmVjxUT/LW91mLtVmUU2POMeHL4aUWbl5KkXhbLA249r9viQ?=
 =?us-ascii?Q?NhvEPG/ag+g6rupE8803QP39yV3zYPgroytroygVIz6fedPWIf6zAvbCQNSt?=
 =?us-ascii?Q?buf3IMFyX0LYLgo8M8awG73eakFdaXzq7K9r9zUUxURkC15ogFAfD8kbI2GI?=
 =?us-ascii?Q?3HH0omLYAzkl/PwYUhpqnN84bjrgeD2q97e2W+tmWyPhcyNKjMbwMlmCqnep?=
 =?us-ascii?Q?2YNpD3EzYnTU5FmY7DnFjWO5zQaIy0xZafcztGjjyZlMBwbqlhEfmJH+DxaT?=
 =?us-ascii?Q?ZzfChz8Zm/yTNTUqnm9VLq9Owx0o2li956M3EHd4y64rFTbeLdmczHqNb910?=
 =?us-ascii?Q?ZImspILTgNtfMPH3Gra+nulHJrPhm4jqxT4yMkwheZQ1yXAptOuSTSyWwbjD?=
 =?us-ascii?Q?5yDTpughwOFwl/hvxKKSmi6OgM+fcf+yNG2WCGGlunQRfcfYfAAmvYIxitxf?=
 =?us-ascii?Q?aXkcjq79/mWsNbdoSwsRPkz06Ms+vwbh4mTI8DBHIsVOolt3L7pPFxXDtDsV?=
 =?us-ascii?Q?PmIltM8TIOjrR7xrF+GDg2QY3JJaKyHXoKTXr5GSN/r2fs2QgKEewaTvTDGw?=
 =?us-ascii?Q?5OcvmcJjUKKL+7DCrZS8EnTuEgTBYfYOYZGO74pR3qTLxAyJns4ZQEagvUS1?=
 =?us-ascii?Q?c/O1Z7kL115eM6XUCyja10rHUev46KD+0pKy1jKGIDA5c5zn1J4h4nO6LgdX?=
 =?us-ascii?Q?cNqiGRYI9yvpf5FUNVlnxS2GT8Qu8KFqOfxIW/AenXfZVcvf6Tlg/hvhoGD2?=
 =?us-ascii?Q?zxTyLogZ+ZbTgue6NG6FBwOgoMlltuvJ7Zgspq2txvvUEMTEHazcNkYhKfFS?=
 =?us-ascii?Q?cj82x0oPPIoM/RSbiVWR2wLkC4UtIQXjA9+v0+7y/uaYg2JqcYkEz9LScN6B?=
 =?us-ascii?Q?iio6hKCgi3OkV5bz8aJCMzoPVz39eWnm3mXKHSFBz3FA69gRczKIvKNPfdCX?=
 =?us-ascii?Q?J6ex+yD3DCDLkqlyvs3eUIsLEo/LwgMglaiU1oe1mPjcpWf2Ck5iJNkllCxR?=
 =?us-ascii?Q?0DtV9kAfAag8qDANO4ElNpIVjRC8m7yW/3y5+BEZI04z8ZRxO60r8t+JEwls?=
 =?us-ascii?Q?mv03N7LrVRzFngVnz0nI3fCFrd5c1K5tOFtxJ02yQV1Sn0OO+oyWEDHaVAly?=
 =?us-ascii?Q?3SiHffCtUvTaiMACOq1WN2/JNHsscGfwHP5G++1ylgV1oQ54W5Ar0rXibw/u?=
 =?us-ascii?Q?YZV/yetTW19jeCaxB3l5G23eSUu0xnjOkQ+hILrJt9Ece4Yf3pwRlDc25wO7?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f1a359-18c0-4252-ce4d-08dca03f13dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 17:46:35.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRf+q+gJrpSiCaMS45fld2Oo44o/fbmG6o2Z6icebjOwmsDoPwyT3As9ugogibaYhH5YcmgIL/40RUtipqM52fG7nK3YBwP94LUqty/hgC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Wed, Jul 03, 2024 at 04:23:15PM GMT, Matt Roper wrote:
>On Wed, Jul 03, 2024 at 12:16:26PM +0530, Tejas Upadhyay wrote:
>> Wa_15015404425 applies to xe2 LNL all steppings
>
>Since this isn't a typical "write XX to register YY" workaround, we
>should have a brief explanation of what the workaround is asking us to
>do here for context.  E.g., something along the lines of
>
>        "Wa_15015404425 asks us to perform four "dummy" writes to a
>        non-existent register offset before every real register read.
>        Although the specific offset of the writes doesn't directly
>        matter, the workaround suggests offset 0x130030 as a good target
>        so that these writes will be easy to recognize and filter out in
>        debugging traces."
>
>>
>> V2:
>>   - Add WA to 8/16/32bit reads also - MattR
>>   - Corrected dummy reg address - MattR
>>   - Use for loop to avoid mental pause - JaniN
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>>  drivers/gpu/drm/xe/xe_mmio.c      | 22 ++++++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 23e33ec84902..56a1ba59cbd3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -45,6 +45,7 @@
>>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>>
>> +#define MEDIA_DUMMY_REG				XE_REG(0x130030)
>
>Since this workaround wound up not actually being media-related at all,
>does the "MEDIA_" prefix here make sense?  This register isn't actually
>in the media IP (according to bspec 60110 it's just in the general
>sgunit register range).  Honestly, since there's no real register at
>this offset in the hardware, this might be a case where we don't even
>want/need a definition in xe_regs.h (see below).
>
>>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>>
>>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index f92faad4b96d..51022a560086 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -121,12 +121,28 @@ int xe_mmio_init(struct xe_device *xe)
>>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>>  }
>>
>> +static void mmio_flush_pending_writes(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int i;
>> +
>> +	if (!(xe->info.platform == XE_LUNARLAKE))
>> +		return;
>
>This works for now, although it may cause issues down the road if we
>wind up with refresh/derivative platforms that don't need this
>workaround.  I think at some point soon we're going to need to separate
>out SoC logic into its own dedicated sub-driver (similar to what's
>happening with display), and bake a dedicated workaround framework into
>that SoC sub-driver to handle cases like this.  Although we'll also need
>to work with our internal hardware people to improve how workarounds
>like this get documented so that it's more obvious up front which ones
>are tied to the graphics/media/display IP, and which ones are tied to
>the SoC revisions that the IP is integrated into.

regardless, why is this not using XE_WA() with the rule in
xe_wa_oob.rules being XE_LUNARLAKE?


>
>> +
>> +	/* 4 dummy writes */
>> +	for (i = 0; i < 4; i++)
>> +		xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
>
>This might be a spot where it would actually make sense to do some
>direct writel()'s rather than using xe_mmio_write32.  That would bypass
>the trace_xe_reg_rw(); I'm making the assumption that most people doing
>MMIO tracing wouldn't be interested in having these constant dummy
>writes cluttering up the trace output (even though the known offset does
>make them somewhat easier to filter out).  If we do that, we could move
>the offset #define down to this file rather than defining a true XE_REG()
>in the register header.

then we have N places hiding reads/writes that's difficult to reason
about. On the other hand, if the trace is there, people can simply
filter out by the offset.  Remember the issue in i915/display about
unclaimed registers being caused by other reads/writes and not the one
in the report?

4b276ed3c7ac ("drm/i915/uncore: Warn on previous unclaimed accesses")
618f5df1f6a5 ("drm/i915/uncore: Warn only if unclaimed access remains flagged")

IMO even if we replace xe_mmio_write32() with writel() we shouldn't hide
it from traces.

Lucas De Marchi

>
>
>Matt
>
>> +}
>> +
>>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>>  {
>>  	struct xe_tile *tile = gt_to_tile(gt);
>>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>>  	u8 val;
>>
>> +	/* Wa_15015404425 */
>> +	mmio_flush_pending_writes(gt);
>> +
>>  	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>>
>> @@ -139,6 +155,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>>  	u16 val;
>>
>> +	/* Wa_15015404425 */
>> +	mmio_flush_pending_writes(gt);
>> +
>>  	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>>
>> @@ -160,6 +179,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>>  	u32 val;
>>
>> +	/* Wa_15015404425 */
>> +	mmio_flush_pending_writes(gt);
>> +
>>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>>  		val = xe_gt_sriov_vf_read32(gt, reg);
>>  	else
>> --
>> 2.25.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
