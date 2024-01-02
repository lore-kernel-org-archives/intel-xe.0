Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E065C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 23:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213ED10E04B;
	Tue,  2 Jan 2024 23:13:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEDD10E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704237221; x=1735773221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vBBO3QMDPNIGSZdLDk1m4mT+qXyuixuTU2Ox9IjXbCs=;
 b=j1lZ4e5xiwNTzYBSG30pIdEcZztMiCSuoS+lI2qZkqh0KJlx/R4SL/Tz
 3r5UOkMerWXVSmr/BwDbvh1Q3NN+aPDeNU3YRjD/xapUCMs4mTRO4vsgJ
 iVYCagZPwQ5eZxN+FU5PK78iMCcEOB4neq+woW+iOE3CSJJReEuc9IFLq
 enMZ7sS8YogARkyE+97ZjCzaZ4oa8wfbrhP0lBslN3GG4LriGaWGy8R13
 ph5JU3POJoXnDlmucqHNKLxuDtYiLdyUJKxKMEWrJ6cKAuTgobJo0vbAq
 F5oY3aqDgjbO01VLlICN+GrTsL4WkQoKF3E+MGGEuOWN8dycmeI3r4zwt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396665898"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396665898"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 15:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756036965"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="756036965"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 15:13:40 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 15:13:39 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 15:13:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 15:13:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+zWL5QZ9xeLwEwCLRF3isdu1OEvenqk467hAvxX+wIJTLb+ebp9U4ETJj0o8juqymS1xF0YdwgleshVlHYglI0mba6Mf8mE2Bg54JpI+KHPgRbrEy4PvgdxaBTaXAQgVKPdMmm/sRVKQHWXpO4nKA/Qn8k0lDyrzdsZesGcdiop3y7vqnku9Ja9r3i908VvH65rum7oO30OSmzD/zC/3S4JkOAy2L6VXGwrz8x9QjU12WUYolUBa148HCl3tyXgUJj/JRsBfOfP4OH2l5wsShUiVxl1qvPEGk0s/vo4nUgNDFXByys+4yu4dxVBIwuah1xIVRtTnuUHzTjDGNj6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSjC1vInm3cSXeSYQmzs/9KyVNJUVZK22btk2YK9lBY=;
 b=MSC0XAxkD8krPbCyYQwuJoBVKaP5gDLJFLUgYYdd1V3NN/VcKuHvGlwSV4KPrPx5nqdumuU5XexsmaUqOqy67Ijzn3VASeOQtx/4Wp0UMnbQCECForW1YO//p/rwN+NIX1Nlf1BqxfGb7uDup66TTCYagkXzO9iSoRgfQDCr6b3SssjqQJywKEse8ZCDAfwCllXrPI4PZzfiydtC6biVEi1fFC+VKliUf/Cf7IVmSu1X/lw8ZPRfswo/itIwj+MK8yKyonKhJvQ3SV47EW5LA/i7rxKUqE8w0oP2xBf3R1oXShEE2vTbAPb19TCkpNM4x4ktl938GNwaUuTF1k2Vkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Tue, 2 Jan
 2024 23:13:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::c1b8:110d:619c:7f28]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::c1b8:110d:619c:7f28%4]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 23:13:36 +0000
Message-ID: <0e4cc75f-1a1a-4e10-b60c-297673563705@intel.com>
Date: Tue, 2 Jan 2024 18:13:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add GuC based register capture for error
 capture
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20231229220345.1396456-1-zhanjun.dong@intel.com>
 <ghlyiayalybcuzmjkafap3k7xlpjwddzetpaocojgpsefmvgmr@hc635zmrb2kd>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ghlyiayalybcuzmjkafap3k7xlpjwddzetpaocojgpsefmvgmr@hc635zmrb2kd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 26abdfd3-6787-41e9-3845-08dc0be8727a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/8LA0QMRIKJJPrAGRXsogJ6NCdIg0xufI9rMfj8Ilig/NZSqlj7e+0VRhBJyKGUr+jHSC/fh33y4+Nz5Sd/sf9/WYrETwG0qWWJtDi4fzj5vdGD+MWGPhFwgP6qdwYQgurt6bWgE15pQyy9Q4ogP8Fs/EecwS9aJTQKiaxLNTfCmaXtftemE0mJlg2gBAdqJ37+PaHmJNxcTO5rq/mH1u0RfF7hWhKagTGN6wMQPnhsnxbw5GpV410ZszBT/imJDioYkU6oglHtps1Wl+Z/u+qkMiwkDL3D6RbS3xmGdjQd0zTCLgBgTQkDftXtkoVPQbMINOmsGqhgzByLoNTx/N4XNNcvQi9oAzAgr8I1p+BxoHRiQ8YEKd0dLx86gh4W5XTuoGowqlbE2LjmsljaWAe85awSVYXhz322/YcHmm5swQn+3K0intv3AUmk5Jdd/JJ7qYO/KGU++7sNwBefjGVVVwFx4z3ISWtw20i+MKrSsYnXmUKR/KYFENZ1bBsrAcc4kXjwNsiOnQjri7Mw3js4iNF0O0mibOJ3W9u4RNrC5pyUrsSxmE5mzQjwAuixUEBLg9ph9jJj1t52L+mpT0ytUCGkM+fSZwOfomLITJKDpttEDvjKcaFUu/z5JcvTAUdGWFJdc4QlcjwpSQRm8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(6666004)(82960400001)(2616005)(478600001)(37006003)(86362001)(66946007)(6636002)(31696002)(66556008)(316002)(53546011)(6486002)(6512007)(66476007)(41300700001)(36756003)(31686004)(38100700002)(83380400001)(6862004)(4326008)(8676002)(2906002)(8936002)(26005)(30864003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVhzMmpFeENPcFF2NG9IdlNGZU9DcTNGU0YrM054K1lKZjBTU3o1TG9CK25G?=
 =?utf-8?B?REYxdU9qakNtaTRnbjd4RWphTS9ZZ3dveW5XdXkxZmZYM0dSa3VRNXo0SU1s?=
 =?utf-8?B?WXI5RW4vaHM3VDVYc3B5dVYrdXEvR2NocmcvTTU4dnE0RTdOWGVlZDg2N0U1?=
 =?utf-8?B?OHViaW1lenFjRE04eHVDSVZqL0xsMCtTZmJ0ZzUyRWFvM3dTa0dRTUpzMkFw?=
 =?utf-8?B?dGR6TTlIMmg4OThtbkpsTllpM1dsS21Xa3JQYTFHeTk1YlYzbVNsakZXa1k5?=
 =?utf-8?B?MDR5OEF2eHdhOGRTRUQ2dmltNlFnbGlEWVBYVndvbkJPamdTSHJ3Y3hjcVBz?=
 =?utf-8?B?NUpCWFpiLytFK0VBeHlnRWlvdmpaY1RMRzJwNWFoQWJhbFUxTzY3QlFYM0lk?=
 =?utf-8?B?UW5kaGJRVm1LanBGQlFETmR2YlFBS05GTmpoU0pPWi9nQTYySVBUMjM5dFIz?=
 =?utf-8?B?N1o3RTZDbm5DdUJ1YS9LM2g3c25EeWF2VGlIY1YySjNuYzA4SWQwaW5QcEY3?=
 =?utf-8?B?ZmxLLzBLWWErS1ZKc0x3VWdSdE15Mkt2NXYxR1FKbUY2U0VZWFNId3o2ZlFC?=
 =?utf-8?B?ci9PM2dwZXFPS3hMSy9FUVpoN2thVXA3SXlBTStxcHJVZk04aEx6N1pvTW5S?=
 =?utf-8?B?d3M5RlFvMHlOa1lkdEw1RHpETHVDL0c0SVRhaUJCSFhmS3Z1eUtWTTZnME11?=
 =?utf-8?B?SjU4R0VZMEpCRWZINUJUSlByL3BQK0tWelF6bm1ZREptOWZSSklubXNHQnYx?=
 =?utf-8?B?RFgvaU5CMWxjb3ZPcG1xb1BVV0lDb294b1UvdWdvcTNBNnpYbEtDZ0kySEtv?=
 =?utf-8?B?UGNzMkxlOXIyd2tNL0w2U0svR05GWWhLTkRRV1JHUEtGdzY4ZmZocGZMaHlO?=
 =?utf-8?B?OFZySWJWZm94THFKMjZ4bkRKNVNyY1ExVmxNbS9mWU1PeVdVVVhnUDJ2M252?=
 =?utf-8?B?amJKRUhzYzh4VzA3M3F4UCsyZTlGT1pMblAzcVdTVmoyeGlDd3pPUzlqQnc3?=
 =?utf-8?B?QXRDaW9YOXpoYUtDYTllSk1TbTJ4cmJubUlBaStLTzVMZGN5WVErT3cyL3Ry?=
 =?utf-8?B?dXlEQ1p2ZW12UDhZSUNlQlNzRWUyWVVxOUpER1RlMkEwTnJyTzFNSkk0WGtK?=
 =?utf-8?B?UTFPWFlaNEdMbm9veFpxWkxRenM5bmdmVEJLRG85RVFyVklhbXl5ZC9DNUtr?=
 =?utf-8?B?VW9LSzNXSTFNcmxGK2tiWTNsd21rOU84NUh4dnYwZUdmaENsaWYyeUF5VXhn?=
 =?utf-8?B?cENPTjN0VkIvNWhMTlI3bTgydC81LzlZeG5GWExjZndWOU1QVkpGNWdKczVV?=
 =?utf-8?B?Q2dxaEkzRXVHNzZROHorU25JbCtkYWJkNjliVEZtWDJkM1NCY0N0Y0ppbGRZ?=
 =?utf-8?B?TUd0ZHNzS1hreTZQYzVUdXdHdFEvb1QzTGQwak9sdWY0Ti9kcklNOWd1N2d2?=
 =?utf-8?B?RTIzeTU1eUxnYWNEOGtBRHVKbFM3QXRmUzdFUzBoV2RrRTlDR0EwbS9xT1NJ?=
 =?utf-8?B?U0NhUW5jclFoZkdUMTRsMlVOSitVdUlUMlI5cWp0dld1Sk00SVBEUUF6ZCtq?=
 =?utf-8?B?NzRmYWloVi9oK2N2S1RqRTl0NElHekw3RXRjL2d0TzRSbStSa21YWjZHSjhQ?=
 =?utf-8?B?SEJKTnRCQ092WjA3dVZKaGd3d1lvc1d2a1R5V2l3TEJRaVhHOHZKK2NGZGZK?=
 =?utf-8?B?aVFOWElBWDdhM2J2Slo3OWd0TkpONnhyUC85bDNhbTA3YUJ6WHJUZnNsNncz?=
 =?utf-8?B?L1dGK2N2ZGNOdFRONUlnSC9CcnNjeUdQUGhEN0ZCdkorTXRnbUcrUGZidTB3?=
 =?utf-8?B?K2F3ZFlxRGJPSzU5K0ozaXdOY2FPR21vM3ZvZEJzdDUyMDg5b2ltQS9oakh6?=
 =?utf-8?B?dENmbGNiM2pKcHg4bk5lNldCbzlDTGlsMEhmZnpPd1VSMGFOT2VyMXBoTk9p?=
 =?utf-8?B?clNxdTRubWRwZkRIR09WUUVzWW84bnNkUFkvSDVMMFg5MUR4ZDVzQU9lWGJS?=
 =?utf-8?B?WEZHWW9FVmFmQWdkTHhjcFRBVVA3Q1VaVXlxd3FRV3FqQTczL25UOXh4QnVK?=
 =?utf-8?B?R2VDV2dkRkhFTTF6VFM2b05BazcySGpkUE9yeEVEMmY2ZkMvMFV1ajR3cHJ3?=
 =?utf-8?Q?fulvyPS4XcdhVPpfEzGbFnkVB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26abdfd3-6787-41e9-3845-08dc0be8727a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 23:13:36.2857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TeMPo2Zn24amUUroZ7f/8PkhXuaQhBNkGLNxbBQXqEEnEnSlm9hwsLQ7v3rSQhqqUrPZXI2kLM8tjKCzcTM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2024-01-01 11:13 a.m., Lucas De Marchi wrote:
> On Fri, Dec 29, 2023 at 02:03:45PM -0800, Zhanjun Dong wrote:
>> Port GuC based register capture for error capture from i915 to Xe.
>>
>> There are 3 parts in this commit:
>> . Prepare for capture registers
>>    There is a bo create at guc ads init time, that is very early
>>    and engine map is not ready, make it hard to calculate the
>>    capture buffer size, new function created for worst case size
>>    caluation. Other than that, this part basically follows the i915
>>    design.
>> . Process capture notification message
>>    Basically follows i915 design
>> . Sysfs command process.
>>    Xe switched to devcoredump, adopted command line process with
>>    captured list.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> drivers/gpu/drm/xe/Kconfig               |   11 +
>> drivers/gpu/drm/xe/Makefile              |    1 +
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   19 +
>> drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   70 +
>> drivers/gpu/drm/xe/regs/xe_reg_defs.h    |    1 -
>> drivers/gpu/drm/xe/regs/xe_regs.h        |    4 +
>> drivers/gpu/drm/xe/xe_bo_types.h         |    2 +
>> drivers/gpu/drm/xe/xe_devcoredump.c      |    1 +
>> drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>> drivers/gpu/drm/xe/xe_gt_topology.c      |    2 +
>> drivers/gpu/drm/xe/xe_gt_types.h         |    6 +
>> drivers/gpu/drm/xe/xe_guc.c              |    5 +
>> drivers/gpu/drm/xe/xe_guc_ads.c          |  255 +++-
>> drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>> drivers/gpu/drm/xe/xe_guc_capture.c      | 1574 ++++++++++++++++++++++
> 
> mind the reviewer. This can't really possibly be reviewed. It must be
> split in sensible chunks (that still build and work)
> 
This feature is about ~3400 lines of patch, for comparasion, the i915 
version is about 4000 lines.
Yes, I will split into more chunks.
> I skimmed through this patch and think it has too much copy and paste
> from i915... it needs to be trimmed down and redesigned. Early feedback:
Sure, it will be trimmed down and split into more chunks.
Not so sure if I fully understand your word of "redesign", the feature 
has the similar functionality amoung i915 and Xe, the feature only being 
triggered on GPU hang, so the complixity of this feature could be sorted 
as O(1) and consider no performance impact, so reuse i915 code looks 
reasonable. Do you mean adopte to Xe framework?
> 
> - Any support fro graphics version < 12 to be removed
> - GEN* names are banned in xe, don't add them > - Each part of the driver you change as pre-requisite, should be a
>    separate patch. I will go through some examples below
Sure, I will check.
> 
>> drivers/gpu/drm/xe/xe_guc_capture.h      |   33 +
>> drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  227 ++++
>> drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>> drivers/gpu/drm/xe/xe_guc_fwif.h         |   69 +
>> drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
>> drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>> drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
>> drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
>> drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
>> drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>> drivers/gpu/drm/xe/xe_hw_engine.c        |   89 +-
>> drivers/gpu/drm/xe/xe_hw_engine_types.h  |  126 +-
>> drivers/gpu/drm/xe/xe_lrc.c              |    4 +-
>> drivers/gpu/drm/xe/xe_lrc_types.h        |    2 +
>> 30 files changed, 2632 insertions(+), 130 deletions(-)
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>> create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index a53b0fdc15a7..337f6b613438 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
>>
>>       Use "!*" to block the probe of the driver for all known devices.
>>
>> +config DRM_XE_CAPTURE_ERROR
>> +    bool "Enable capturing GPU state following a hang"
>> +    depends on DRM_XE
>> +    default y
>> +    help
>> +      This option enables capturing the GPU state when a hang is 
>> detected.
>> +      This information is vital for triaging hangs and assists in 
>> debugging.
>> +      Please report any hang to your Intel representative to help 
>> with triaging.
>> +
>> +      If in doubt, say "Y".
> 
> do we really need a kconfig?
I think this is for users want to save every KB of memory or debug info 
no longer their major concerns.
> 
>> +
>> menu "drm/Xe Debugging"
>> depends on DRM_XE
>> depends on EXPERT
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index df8601d6a59f..5a97b2b74d1a 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -92,6 +92,7 @@ xe-y += xe_bb.o \
>>     xe_gt_topology.o \
>>     xe_guc.o \
>>     xe_guc_ads.o \
>> +    xe_guc_capture.o \
>>     xe_guc_ct.o \
>>     xe_guc_db_mgr.o \
>>     xe_guc_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 3062e0e0d467..dd57620258b2 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
>> #define GUC_LOG_CONTROL_VERBOSITY_MASK    (0xF << 
>> GUC_LOG_CONTROL_VERBOSITY_SHIFT)
>> #define GUC_LOG_CONTROL_DEFAULT_LOGGING    (1 << 8)
>>
>> +enum intel_guc_state_capture_event_status {
>> +    INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
>> +    INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
>> +};
>> +
>> +#define INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
>> +
>> #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
>> #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
>> /* Flush PPC or SMRO caches along with TLB invalidation request */
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 0b1266c88a6a..060628dbac8e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -64,10 +64,17 @@
>>
>> #define RING_ACTHD_UDW(base)            XE_REG((base) + 0x5c)
>> #define RING_DMA_FADD_UDW(base)            XE_REG((base) + 0x60)
>> +#define RING_IPEIR(base)            XE_REG((base) + 0x64)
>> #define RING_IPEHR(base)            XE_REG((base) + 0x68)
>> +#define RING_INSTDONE(base)            XE_REG((base) + 0x6c)
>> +#define RING_INSTPS(base)            XE_REG((base) + 0x70)
>> +
>> #define RING_ACTHD(base)            XE_REG((base) + 0x74)
>> #define RING_DMA_FADD(base)            XE_REG((base) + 0x78)
>> #define RING_HWS_PGA(base)            XE_REG((base) + 0x80)
>> +#define RING_CMD_BUF_CCTL(base)            XE_REG((base) + 0x84)
>> +#define IPEIR(base)                XE_REG((base) + 0x88)
>> +
>> #define RING_HWSTAM(base)            XE_REG((base) + 0x98)
>> #define RING_MI_MODE(base)            XE_REG((base) + 0x9c)
>> #define RING_NOPID(base)            XE_REG((base) + 0x94)
>> @@ -111,9 +118,18 @@
>> #define   FF_DOP_CLOCK_GATE_DISABLE        REG_BIT(1)
>> #define   REPLAY_MODE_GRANULARITY        REG_BIT(0)
>>
>> +#define RING_BBSTATE(base)            XE_REG((base) + 0x110)
>> #define RING_BBADDR(base)            XE_REG((base) + 0x140)
>> #define RING_BBADDR_UDW(base)            XE_REG((base) + 0x168)
>>
>> +#define CCID(base)                XE_REG((base) + 0x180)
>> +#define   CCID_EN                BIT(0)
>> +#define   CCID_EXTENDED_STATE_RESTORE        BIT(2)
>> +#define   CCID_EXTENDED_STATE_SAVE        BIT(3)
>> +#define RING_BB_PER_CTX_PTR(base)        XE_REG((base) + 0x1c0) /* 
>> gen8+ */
>> +#define RING_INDIRECT_CTX(base)            XE_REG((base) + 0x1c4) /* 
>> gen8+ */
>> +#define RING_INDIRECT_CTX_OFFSET(base)        XE_REG((base) + 0x1c8) 
>> /* gen8+ */
>> +
>> #define BCS_SWCTRL(base)            XE_REG((base) + 0x200, 
>> XE_REG_OPTION_MASKED)
>> #define   BCS_SWCTRL_DISABLE_256B        REG_BIT(2)
>>
>> @@ -129,6 +145,9 @@
>> #define      CTX_CTRL_INHIBIT_SYN_CTX_SWITCH    REG_BIT(3)
>> #define      CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT    REG_BIT(0)
>>
>> +#define GEN8_RING_PDP_UDW(base, n)        XE_REG((base) + 0x270 + (n) 
>> * 8 + 4)
>> +#define GEN8_RING_PDP_LDW(base, n)        XE_REG((base) + 0x270 + (n) 
>> * 8)
>> +
>> #define RING_MODE(base)                XE_REG((base) + 0x29c)
>> #define   GFX_DISABLE_LEGACY_MODE        REG_BIT(3)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 6aaaf1f63c72..2546d58a7130 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -59,6 +59,38 @@
>>
>> #define XELP_GLOBAL_MOCS(i)            XE_REG(0x4000 + (i) * 4)
>> #define XEHP_GLOBAL_MOCS(i)            XE_REG_MCR(0x4000 + (i) * 4)
>> +
>> +#define ERROR_GEN6                XE_REG(0x40a0)
>> +
>> +#define DONE_REG                XE_REG(0x40b0)
>> +#define GEN8_PRIVATE_PAT_LO            XE_REG(0x40e0)
>> +#define GEN8_PRIVATE_PAT_HI            XE_REG(0x40e0 + 4)
>> +#define GEN10_PAT_INDEX(index)            XE_REG(0x40e0 + (index) * 4)
>> +#define BSD_HWS_PGA_GEN7            XE_REG(0x4180)
>> +
>> +#define GEN12_CCS_AUX_INV            XE_REG(0x4208)
>> +#define GEN12_VD0_AUX_INV            XE_REG(0x4218)
>> +#define GEN12_VE0_AUX_INV            XE_REG(0x4238)
>> +#define GEN12_BCS0_AUX_INV            XE_REG(0x4248)
>> +
>> +#define GEN8_RTCR                XE_REG(0x4260)
>> +#define GEN8_M1TCR                XE_REG(0x4264)
>> +#define GEN8_M2TCR                XE_REG(0x4268)
>> +#define GEN8_BTCR                XE_REG(0x426c)
>> +#define GEN8_VTCR                XE_REG(0x4270)
>> +
>> +#define BLT_HWS_PGA_GEN7            XE_REG(0x4280)
>> +
>> +#define GEN12_VD2_AUX_INV            XE_REG(0x4298)
>> +#define GEN12_CCS0_AUX_INV            XE_REG(0x42c8)
>> +#define   AUX_INV                REG_BIT(0)
>> +
>> +#define VEBOX_HWS_PGA_GEN7            XE_REG(0x4380)
>> +
>> +#define GEN12_AUX_ERR_DBG            XE_REG(0x43f4)
>> +
>> +#define GEN7_TLB_RD_ADDR            XE_REG(0x4700)
>> +
>> #define CCS_AUX_INV                XE_REG(0x4208)
>>
>> #define VD0_AUX_INV                XE_REG(0x4218)
>> @@ -73,6 +105,9 @@
>> #define WM_CHICKEN3                XE_REG_MCR(0x5588, 
>> XE_REG_OPTION_MASKED)
>> #define   HIZ_PLANE_COMPRESSION_DIS        REG_BIT(10)
>>
>> +#define GEN8_FAULT_TLB_DATA0            XE_REG(0x4b10)
>> +#define GEN8_FAULT_TLB_DATA1            XE_REG(0x4b14)
>> +
>> #define CHICKEN_RASTER_2            XE_REG_MCR(0x6208, 
>> XE_REG_OPTION_MASKED)
>> #define   TBIMR_FAST_CLIP            REG_BIT(5)
>>
>> @@ -94,6 +129,8 @@
>> #define   FF_MODE2_TDS_TIMER_MASK        REG_GENMASK(23, 16)
>> #define   FF_MODE2_TDS_TIMER_128        
>> REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>>
>> +#define XEHPG_INSTDONE_GEOM_SVG            XE_REG_MCR(0x666c)
>> +
>> #define CACHE_MODE_1                XE_REG(0x7004, XE_REG_OPTION_MASKED)
>> #define   MSAA_OPTIMIZATION_REDUC_DISABLE    REG_BIT(11)
>>
>> @@ -110,6 +147,10 @@
>> #define   FLSH_IGNORES_PSD            REG_BIT(10)
>> #define   FD_END_COLLECT            REG_BIT(5)
>>
>> +#define GEN7_SC_INSTDONE            XE_REG(0x7100)
>> +#define GEN12_SC_INSTDONE_EXTRA            XE_REG(0x7104)
>> +#define GEN12_SC_INSTDONE_EXTRA2        XE_REG(0x7108)
>> +
>> #define COMMON_SLICE_CHICKEN4            XE_REG(0x7300, 
>> XE_REG_OPTION_MASKED)
>> #define   DISABLE_TDC_LOAD_BALANCING_CALC    REG_BIT(6)
>>
>> @@ -298,6 +339,22 @@
>>
>> #define XE2LPM_L3SQCREG5            XE_REG_MCR(0xb658)
>>
>> +#define GEN12_FAULT_TLB_DATA0            XE_REG(0xceb8)
>> +#define XEHP_FAULT_TLB_DATA0            XE_REG_MCR(0xceb8)
>> +#define GEN12_FAULT_TLB_DATA1            XE_REG(0xcebc)
>> +#define XEHP_FAULT_TLB_DATA1            XE_REG_MCR(0xcebc)
>> +#define   FAULT_VA_HIGH_BITS            (0xf << 0)
>> +#define   FAULT_GTT_SEL                BIT(4)
>> +
>> +#define GEN12_RING_FAULT_REG            XE_REG(0xcec4)
>> +#define XEHP_RING_FAULT_REG            XE_REG_MCR(0xcec4)
>> +#define XELPMP_RING_FAULT_REG            XE_REG(0xcec4)
>> +#define   GEN8_RING_FAULT_ENGINE_ID(x)        (((x) >> 12) & 0x7)
>> +#define   RING_FAULT_GTTSEL_MASK        BIT(11)
>> +#define   RING_FAULT_SRCID(x)            (((x) >> 3) & 0xff)
>> +#define   RING_FAULT_FAULT_TYPE(x)        (((x) >> 1) & 0x3)
>> +#define   RING_FAULT_VALID            BIT(0)
>> +
>> #define XEHP_MERT_MOD_CTRL            XE_REG_MCR(0xcf28)
>> #define RENDER_MOD_CTRL                XE_REG_MCR(0xcf2c)
>> #define COMP_MOD_CTRL                XE_REG_MCR(0xcf30)
>> @@ -316,6 +373,13 @@
>> #define   INVALIDATION_BROADCAST_MODE_DIS    REG_BIT(12)
>> #define   GLOBAL_INVALIDATION_MODE        REG_BIT(2)
>>
>> +#define GEN12_GAM_DONE                XE_REG(0xcf68)
>> +
>> +#define GEN7_SAMPLER_INSTDONE            XE_REG(0xe160)
>> +#define GEN8_SAMPLER_INSTDONE            XE_REG_MCR(0xe160)
>> +#define GEN7_ROW_INSTDONE            XE_REG(0xe164)
>> +#define GEN8_ROW_INSTDONE            XE_REG_MCR(0xe164)
>> +
>> #define HALF_SLICE_CHICKEN5            XE_REG_MCR(0xe188, 
>> XE_REG_OPTION_MASKED)
>> #define   DISABLE_SAMPLE_G_PERFORMANCE        REG_BIT(0)
>>
>> @@ -478,10 +542,16 @@
>> #define   GT_CS_MASTER_ERROR_INTERRUPT        REG_BIT(3)
>> #define   GT_RENDER_USER_INTERRUPT        REG_BIT(0)
>>
>> +#define GEN12_SFC_DONE(n)            XE_REG(0x1cc000 + (n) * 0x1000)
>> +
>> #define PVC_GT0_PACKAGE_ENERGY_STATUS        XE_REG(0x281004)
>> #define PVC_GT0_PACKAGE_RAPL_LIMIT        XE_REG(0x281008)
>> #define PVC_GT0_PACKAGE_POWER_SKU_UNIT        XE_REG(0x281068)
>> #define PVC_GT0_PLATFORM_ENERGY_STATUS        XE_REG(0x28106c)
>> #define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>>
> 
> - drop any GEN prefixes/suffixes
> - only add registers you're actually using
Thanks, I will trim it down in next version.
> 
> 
>> +/* 32 fences + sign bit for FENCE_REG_NONE */
>> +#define XE_MAX_NUM_FENCE_BITS 6
>> +#define XE_MAX_NUM_FENCES (2 ^ (XE_MAX_NUM_FENCE_BITS - 1))
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h 
>> b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> index c50e7650c09a..15869c2e2a52 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>> @@ -57,7 +57,6 @@ struct xe_reg_mcr {
>>     struct xe_reg __reg;
>> };
>>
>> -
>> /**
>>  * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits 
>> marking the
>>  * written bits on the lower 16 bits.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index 2c214bb9b671..574a5a78739c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -7,6 +7,10 @@
>>
>> #include "regs/xe_reg_defs.h"
>>
>> +#define EIR                    XE_REG(0x20b0)
>> +
>> +#define HSW_GTT_CACHE_EN            XE_REG(0x4024)
>> +
>> #define TIMESTAMP_OVERRIDE                    XE_REG(0x44074)
>> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK    
>> REG_GENMASK(15, 12)
>> #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK        
>> REG_GENMASK(9, 0)
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h 
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 64c2249a4e40..cdef4dd1ef06 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -44,6 +44,8 @@ struct xe_bo {
>>     struct iosys_map vmap;
>>     /** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
>>     struct ttm_bo_kmap_obj kmap;
>> +    /** @ads_map: contents of the GuC ADS */
>> +    struct iosys_map ads_map;
> 
> 
> that would be very weird.... a map to the ADS inside each bo?? It sounds
> like a bad architecture of the feature, but grepping on this patch it
> seems this is not used at all
Thanks. This ads_map is not needed and to be removed in next version.
> 
>>     /** @pinned_link: link to present / evicted list of pinned BO */
>>     struct list_head pinned_link;
>> #ifdef CONFIG_PROC_FS
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 68abc0b195be..b032d6e2cc3a 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -14,6 +14,7 @@
>> #include "xe_force_wake.h"
>> #include "xe_gt.h"
>> #include "xe_guc_ct.h"
>> +#include "xe_guc_capture.h"
>> #include "xe_guc_submit.h"
>> #include "xe_hw_engine.h"
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h 
>> b/drivers/gpu/drm/xe/xe_gt_printk.h
>> index c2b004d3f48e..107360edfcd6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>> @@ -22,6 +22,9 @@
>> #define xe_gt_notice(_gt, _fmt, ...) \
>>     xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>>
>> +#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
>> +    xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
> 
> if this is really need, it should be a standalone patch.
Thanks, I will trim it down in next version.
> 
>> +
>> #define xe_gt_info(_gt, _fmt, ...) \
>>     xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c 
>> b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..696e41aa5596 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -96,11 +96,13 @@ xe_gt_topology_init(struct xe_gt *gt)
>>     drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
>>     drm_WARN_ON(&xe->drm, num_compute_regs > 3);
>>
>> +    gt->fuse_topo.g_dss_num_max = num_geometry_regs;
> 
> wat?  dss_num_max has nothing to do with how many registers we use.
> 
>>     load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
>>               num_geometry_regs,
>>               XELP_GT_GEOMETRY_DSS_ENABLE,
>>               XE2_GT_GEOMETRY_DSS_1,
>>               XE2_GT_GEOMETRY_DSS_2);
>> +    gt->fuse_topo.c_dss_num_max = num_compute_regs;
>>     load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
>>               XEHP_GT_COMPUTE_DSS_ENABLE,
>>               XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index f74684660475..4c0540abfecb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -328,6 +328,12 @@ struct xe_gt {
>>
>>         /** @eu_mask_per_dss: EU mask per DSS*/
>>         xe_eu_mask_t eu_mask_per_dss;
>> +        /** @g_dss_num_max: count of dual-subslices usable by 
>> geometry */
>> +        u8 g_dss_num_max;
>> +
>> +        /** @c_dss_num_max: count of dual-subslices usable by compute */
>> +        u8 c_dss_num_max;
> 
> 
> not really needed. check calc_topo_query_size() and xe_query.c in
> general on how to derive the info you need.
> 
> Lucas De Marchi
Thanks, I will dig into details.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>> b/drivers/gpu/drm/xe/xe_guc_capture.c
>> new file mode 100644
>> index 000000000000..ace5115cae6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -0,0 +1,1574 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021-2022 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "regs/xe_regs.h"
>> +#include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>> +#include "regs/xe_guc_regs.h"
>> +
>> +#include "xe_guc_capture_fwif.h"
>> +
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_hw_engine_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_capture.h"
>> +#include "xe_guc_ct.h"
>> +
>> +#include "xe_guc_log.h"
>> +#include "xe_gt_mcr.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_macros.h"
>> +#include "xe_map.h"
> 
> 
> here you should add kernel-doc on what this feature is about, how it's 
> used etc >
> 
> I think this is enough feedback for now
> 
> 
> Lucas De Marchi
