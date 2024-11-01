Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F883E67493
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 02:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFC710E068;
	Fri,  1 Nov 2024 02:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjDFuIDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19EC10E068
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 02:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730427964; x=1761963964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ewmY2APG9wRS2aIJJU8g52GZAwE1iIG2uxzLUcUPWRY=;
 b=FjDFuIDWrUT+mfqLH6bCtBIW8kEpTmHX162wZgRntQ9CPYbmrWFLbc9P
 EwW5+GysRjJ5SEXUegoxAMJ72ncRiVjuwH4jPjyNVGn6ayrAw1P0HAKto
 4KG5cvZ8m0M7P/DPFWpRr7/XcuX6JXBiOaTRdI9oncSeM+G1kE+um3nnI
 nD200n6jM5OF5bPKWeQ0Grjul7xRFlnS9cc5nJhtLL83rg7K4f4IzAifG
 /K10B1sl5wnzOvY/5tZh/dtOJfOYXt80773PQ1O284Fv5oSVQ65xAgOJP
 yuEQvdrAC60Twx1tmhTqJrMaCeeFy7YHNpd2vKqbRI5nr1AZx6qvd+B1C g==;
X-CSE-ConnectionGUID: p6sly4z8Qja328TUwNXoVQ==
X-CSE-MsgGUID: SG0PX0FgQyaD3pa5ykuenQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34126307"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="34126307"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 19:26:04 -0700
X-CSE-ConnectionGUID: FD1zypzqTiSHd4Z+dxdVnQ==
X-CSE-MsgGUID: KJQT1YLQQ22EuqXRhb9aUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="83257723"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 19:26:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 19:26:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 19:26:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 19:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtASdqhvX3KcCHx3VQ+hYtOXIA3in9cjzzZCYf7qkN2BDYBmY018fDYs4D2sIrOmyrPr9uqFmXuc5Zutj8var5SdrOMs33Y533OBCjDNi8jsmLsPiSH2ygonBUQp2Hj6kvrWxcwW1MSr5MKiWB15MlPe9tO83Uhf9hanrBcrXgAwr3C2DUPBSnfwHkbQtMESoM1vq0byRSG5TDGySD/DIw3B6rDbv7+IjpjqS/IO4luYqtsvEiG1sxIDMz3CBCsnBCEDbfLEXCcKk+sk351hkghDQFohFWZMIVId78EawnROZ+DTbVAeypno6w5PEG351dcuObniX7ijnBoVVzwzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgvws/sh2aSAzm+uJsCzzWoQaRd26Sd7E+1rlDO3NZg=;
 b=xvnLp8LVNgessdVftYUYgxNQt+rrjIqc+xN1393og17l862beSIOV6xMNTzfx5OeiAgypoxwYB/hPu/SQGSZN4OJ2WJPiNW3ZDBld3vJ9lQJn/p7wikL8qoibKhdW4IZ1I1ry67XRrgXJbc3Rq2NxCqHPsQ6cQ5Uqp3Q2jqguWeZ/FsLqcubzOH9ndUGGPl/BkongzzoCJYDTcXYISj4vXCXp+5eEJPmM1hN+Azh5uIpU/QuaL2fIcHnWziIgoL2OdAdsDjQRFcfB/K+0zGxs5LX/zVWT0dXFfKqDwG+xybb/pmHjJYcCTITv2CfcqYxPfEysmeX19Gai4FX7gUllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 02:26:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 02:26:01 +0000
Date: Thu, 31 Oct 2024 21:25:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move Wa 1607983814 to oob
Message-ID: <63zvf26adbncakc2a3ep4qr3522mdekp6pu5pnmvzfyaxrtkpd@zszxscsxsm2d>
References: <20241029193258.749882-1-lucas.demarchi@intel.com>
 <20241029194055.GZ4891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241029194055.GZ4891@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: YQZPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e754a3-4e71-4cf0-e74b-08dcfa1c86e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SaHBvEx9GVq4NNhgkfBmQ7kSSSNbNph+TTv5LlzcTlV2WyE4bkU20ONZSl6I?=
 =?us-ascii?Q?nLjMRxt3UsGNfe6jg6CRukQu5W5XukRtclQwbHROF9ZzhrIXofs5V/9vjZU7?=
 =?us-ascii?Q?yNZq4Ll/53qmbOBgrtdUsTynY8JAvP8Vry74FUVuaPHyTJXUJyTM2sdWJB7q?=
 =?us-ascii?Q?HrbR5CI0aXsVCwUSIYLfIkylYV0UD++udOVsGUfPt4UHISeyzoZDdmgLhde4?=
 =?us-ascii?Q?I5FoRLGg8ZMS9XyzucGcJ4vaNgJhviP7Ju83p3CdkgWmJQIFkE6xeIT83vAu?=
 =?us-ascii?Q?3YOIqp9n1RaRjHNOfEyO8Wz93KTNQZJJD1mdRN2qOHWW6Xuy8xehNytdUXeW?=
 =?us-ascii?Q?k4p5NFdijTpE67lM2TEvcVNXEqUYTDg24hFimk3R7frO5GIN4L5X8Xtyizl7?=
 =?us-ascii?Q?sV05sd5DIUpEi89M8q8xLTC60xLJVi1GoAx5YLqBKusXHCvphYuglAJaeBYi?=
 =?us-ascii?Q?xPC1rvCZVIjBgU3WPpqQM9/Gl2tar4dHCHbQuLCbaFKCDNYtttNnR5hKATlM?=
 =?us-ascii?Q?aeNLe1VT7j8j6TtHUVQM/qV/CIyFpPrh+RnaWChNCPax6AiMzIOuPWTAMgMp?=
 =?us-ascii?Q?cHynd0owYtmX8/qdLggyAV4367akZzkqAOBEyhNzifwSlpBeeIbPSQCaCoYx?=
 =?us-ascii?Q?1gvBMLltw1E/TE26GD0h4sXs13gzpBxSayileupgVc3Vbp7JA2J9uWo7fT2j?=
 =?us-ascii?Q?BV9FcLu8aneW4Yw1Y0NYonx9MIJWJiDEXfXJerzD65A+qVbErrFKdaJQdwJ9?=
 =?us-ascii?Q?EI1fg/Q+e13VEvvNo2nlFfYO8yvlAy4LS41zLRAzlsd9Y7QU+p9dYRb1VCzc?=
 =?us-ascii?Q?UDh6lgQc4OqUOaX+cNok5tH4gH3oDp2BFOJYYv18OnqkHuTinfLWKbBowuMi?=
 =?us-ascii?Q?BMnc9lv5iP5VAEPyZJh1xYXg3gOShRfWmuMpG4hm4Xef6UdWrbl6Ut7SpWe6?=
 =?us-ascii?Q?Atjq46X6ij4ZjJMv0fVEyGl5Gyzjmf2B5Ry2QszU83BagGTQ8V55kXjZxInW?=
 =?us-ascii?Q?wH6598LIu1tjKKjiBpqUFbz9cAA4A+BZoWj1lKcb1yvcLwqv7uxEdp0EMFDK?=
 =?us-ascii?Q?KPeqII9Z4kytu/VedwSJ1EsfBvNDxZ+Rl6ALh16gZ9ZPSl43rSv1m2Ywq+ub?=
 =?us-ascii?Q?oMbBhXTAKwS4tlznZTyad+XjcvPCUo/ociKjlyuMl27w7jG86GYf3rvmgnwL?=
 =?us-ascii?Q?S1pkpYMSIKlkSX2ob2axHUWWlLz2GREGPzCLfdtSF2DRzyFjEdYC7301f7AS?=
 =?us-ascii?Q?DCqimX7GeN5DoGl0wMK5gxuqHhbw9MRUjdC8QDFm8Ib+wRtn/Lu85a0966PI?=
 =?us-ascii?Q?BR9sA0yWk1CU5ibnb7ZJgekN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?204xfppWX8bBlXeB5o+oIs3rIlU1o1N1KkHNwfMmq+ODR54EQTnkPtuM8I+x?=
 =?us-ascii?Q?MqQl/IqZineuiK97awvgjHuRmGszPalSlxh6kQ2g7/7+GIOX4Cx7dI0T5lQv?=
 =?us-ascii?Q?+Dql2swtSdowj9dhUNsnj852I+uPuJsOajqVP7hcn7rb3lh970jFUusCh8FK?=
 =?us-ascii?Q?ZcHM9BksfJnDJnXAGl9SQgDarFeFEMZtDnvhc3FLOF6FAyV1E1mkK9wO1pHg?=
 =?us-ascii?Q?ig0bD8fyUzx6CZliHBbUEAtfuH8S76xt+WxiFY7F3ic52ya2g2Ps/j1U3mOb?=
 =?us-ascii?Q?WmrbyEYozd0D+MAbJim8rfhI45rKGYmnqViy5sErYHRp23p1vZm1RhYbBmRI?=
 =?us-ascii?Q?b6jsop9Eww/hutu3o98/PRsb062mgu+0CUr/bJWTp44JHwo/WDjp9MYIsH34?=
 =?us-ascii?Q?zhvLS5O0IRMIlCBo4xxoklSSRBvYU6rM3BT/VFLxUu4EGT3VmDrxia/fN0pA?=
 =?us-ascii?Q?clAXCqNpVd8oZvZJ10hDJeAhLqmnKzHhAavvzsculFJZuzRcMLyPximTsAa4?=
 =?us-ascii?Q?wiGfpQyxHFUTA88Xd4dhS+slXQWNEgk1zAqjA5tUZiaP6Nc5VRhQcc8OiiRo?=
 =?us-ascii?Q?pNc3KIikDTHcsWVO0QIJCstXqIaK/OZSBYAaxHQmY7skzkmgS9ZMIAXE/f4r?=
 =?us-ascii?Q?PbQRwPk+YVcm8smFNKbWi3h8Dg7JpWW8wupsAAVhhNlyZjjZyOQK8TPY4bIv?=
 =?us-ascii?Q?BIcYHT3WsBMwdXyHMTV567Ir5ZQ5y3gmtsh2LRAkqd45X1flzIsjqK3DpNHd?=
 =?us-ascii?Q?SsDUUj7OzJ4DQTjsVb2sCQH1IE01xQWpeis1L9VozFzj7Z/0CVsyFTCvJtBI?=
 =?us-ascii?Q?uoXzbOUV+qaGkvegAT16/BpQ7is7xi2SwqfkaxoH/4FV+rK/Elj5U5RPcqYS?=
 =?us-ascii?Q?/OupUTC3OQ2KqZMuWXMERnZy5UaOlbMUJiTEKMVFwm/6f8CCq57/X359QY8w?=
 =?us-ascii?Q?N7sifMATW4BWW4BsstjsXl/QgCei+6RdgKEuxrO4Kma2pBeObJF+GDi9PHYq?=
 =?us-ascii?Q?fFQsqAk3TV8HpSjB9Exu9RMXlmkYzPqC0e6h/Uo3arjVrdRnhV1uAXjUk8T2?=
 =?us-ascii?Q?UUtIplN9lOT/+FJEGbZ4DJcnqvbHRvDh6QB3Vs+4Vbc/mdE1iZD4NSHZ9c56?=
 =?us-ascii?Q?tFTDvWDFAzs4HZ/Pcwp3URVP/ykyOKFVsePMfmh+AeMJ9vjEgBbkTZIpE3i4?=
 =?us-ascii?Q?Bf3cYygA6BCFug3+O2Vmb9ibX/nKfKtrMPLvS8WD0j07urbmO/zjS+ENxLRV?=
 =?us-ascii?Q?UBGKlupVGZBfMhlsU6miLwnMco4fJkVLwzqfbiztF+QN2pmBFg3QaH4xbvA+?=
 =?us-ascii?Q?5jAse8EzYS1iYd62i5kxZ7PRsckEyl7cuNvyqrgIZMxJ/LcF+T96M+BbH17U?=
 =?us-ascii?Q?t57LOM/NZH7abHpeSL4I5eJmMovWFH2fIgeZ4kGc8Jdvh4znJCWVJrxYSuMn?=
 =?us-ascii?Q?vkYxI63N0YXV3VQmQ0vvmLrh+dqPZZSMF5fWMKqvL0kO1L6AlmUiRMjMt9DO?=
 =?us-ascii?Q?yG6Sp+oM7rcwJRIs0XA1LFpnnhIvtulPnNzlu47GdG01KvJWLMS4R9kltzuX?=
 =?us-ascii?Q?51oxRNyWXimq0H6jy66T7UhaBXWF9P2P1pAjFDF4owl7eUhDi21vsSkHkPRV?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e754a3-4e71-4cf0-e74b-08dcfa1c86e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 02:26:01.1190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HginHlEF0HLmaA8Yyy5n99csAqphYnqxG3G0u2+p3UdQ4R0g3nizsLqhaBjKDKzacWkZIrFXL04I3YR+/27YSiKRz0ULIgcys/KDzEQKt3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
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

On Tue, Oct 29, 2024 at 12:40:55PM -0700, Matt Roper wrote:
>On Tue, Oct 29, 2024 at 12:32:58PM -0700, Lucas De Marchi wrote:
>> needs_wa_1607983814() predates wa_oob, so it was not being printed
>> in /sys/kernel/debug/dri/0/*/workarounds. Port it to OOB rules.
>> This makes the WA show up in debugfs. For TGL:
>>
>> 	OOB Workarounds
>> 		22012773006
>> 		1409600907
>> 		1607983814
>>
>> Eventually the RTP infra may add support for writing registers in a
>> loop, which would allow to keep track of the registers as well. But for
>> now, just listing it as OOB workaround is already an improvement.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ads.c    | 11 ++---------
>>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>>  2 files changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index a196c4fb90fc9..00945caf49ff4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -232,11 +232,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
>>  		guc_ads_private_data_size(ads);
>>  }
>>
>> -static bool needs_wa_1607983814(struct xe_device *xe)
>> -{
>> -	return GRAPHICS_VERx100(xe) < 1250;
>> -}
>> -
>>  static size_t calculate_regset_size(struct xe_gt *gt)
>>  {
>>  	struct xe_reg_sr_entry *sr_entry;
>> @@ -251,7 +246,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>
>>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>
>> -	if (needs_wa_1607983814(gt_to_xe(gt)))
>> +	if (XE_WA(gt, 1607983814))
>>  		count += LNCFCMOCS_REG_COUNT;
>>
>>  	return count * sizeof(struct guc_mmio_reg);
>> @@ -710,7 +705,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  					  struct iosys_map *regset_map,
>>  					  struct xe_hw_engine *hwe)
>>  {
>> -	struct xe_device *xe = ads_to_xe(ads);
>>  	struct xe_hw_engine *hwe_rcs_reset_domain =
>>  		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
>>  	struct xe_reg_sr_entry *entry;
>> @@ -746,8 +740,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>>  					  count++);
>>
>> -	/* Wa_1607983814 */
>> -	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>> +	if (XE_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>>  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>>  			guc_mmio_regset_write_one(ads, regset_map,
>>  						  XELP_LNCFCMOCS(i), count++);
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index bcd04464b85e8..d4ddfcdbe9370 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -41,3 +41,4 @@
>>  no_media_l3	MEDIA_VERSION(3000)
>>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>> +1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)

I moved this to the beginning of the file so it's more or less aligned
with how it's sorted.

Applied, thanks
Lucas De Marchi

>> --
>> 2.47.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
