Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3DFC072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 08:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E1410E5E1;
	Wed, 22 Nov 2023 08:33:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF2410E5E1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700642006; x=1732178006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=caztcJCYWAnKWPc3a9tJeQ3j5fGwo3yZW1v/So7ymLw=;
 b=fV/rHJGlvjkN6vwrhTjDiTb+yq75RBtzf/DMF4kGkWZXPLnxfDv8zr4t
 QxF6RwI1nrsV0TPa41bu68IIZ8WBr+xUjtgSv3pkXcOpN57+UlN6bvNGf
 YfDyo/bGQglEqNpyPZ05mnFR24mudDV99MZSNyM57HHGqagIvUgy3xs0S
 KjDfrK7KSTVBdhENoiwvPrjzXc413BCFE/rW6vNiePYqQ7W+g0SG+YznZ
 skqOvZIN9rwA9ZI35aU4qPzwRWXeqTriUGx0XOmKoP0TryuTSJFnPFteH
 mvkdwWHrAyNeznee51RBkLDECNEux28e3uKcJnZ5lVL4GkPvbLwB03i3S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382407029"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="382407029"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 00:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="837314500"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="837314500"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2023 00:33:23 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 00:33:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 00:33:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 00:33:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kve48uggTva7ZsyxPZOAB7r8iPYNBMnkl42OFm7llSzeQnn9mYswBmBX0Y2n7WLlXLhT96/f2o5B94EQ7Co683IyOIyuwTimze7n6dAFMeSi3zvwnEcwXbX0LEW/VfXfYqYBxHCW+HV3xwMM87T24cHsBaUQjKHvEsYCJF6ChMcpIFgLpChr2m99S61StD9pQya4h80/WMYUyxvOvNWWmU0SFuNrWqKXOrPde0ACE+LT/7NN7KnRxPCq/xox/arMBwlcHhBsbQ5PL1UK1o+jUTpZmsKvWBk6K2o6dGWnGeO8scXXjYzFWOb3cJ1VZ4kfIxlWdyhfsDf2Ur0m97piqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp8FpUDgOLL9z0BhFsr4+f/PcJQPvIdfi1X4Ydqi0zE=;
 b=jOmnCMyTyShYV7BQq1C4N2pWkOVaQymgcTSA45jg/yx8vK5F6u/Y1nj/T5tq7Rl3aRmyYJX85KxUJPGGpwxf/bKt+QgYT8R6E8+OgoTTt/rCt9BbRZnJLuZDMkes5cG/kwL7UjL/5Ig3OskdQsb4WrjksMFuHCeM9uEUTOdTuwC6UdkSDSwGTv+Hai2KSPHiN6Bi8dY6kSD8+b4SN3KAfRx3hul7J7w516LwI6Mp6lvTYD9NJhSmfxQL2Z9lw+JvKC9tSrkDJ/mXMQhtwZ+Xpr4ThyY1arvMpX+NYVSQ6LWwzInsHLhmk/JK09DBCGbyd3EQcyAV+3Ai1LXxLbrkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 08:33:20 +0000
Received: from SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc]) by SJ0PR11MB5664.namprd11.prod.outlook.com
 ([fe80::4cbd:d777:1e37:e6bc%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 08:33:20 +0000
Message-ID: <4f6ca199-eeaa-4caa-94b1-e3e4b58cba59@intel.com>
Date: Wed, 22 Nov 2023 14:03:14 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-4-sujaritha.sundaresan@intel.com>
 <ZVfeEJmfg6NST0LX@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZVfeEJmfg6NST0LX@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5664:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: fbadf0ad-6f0c-4cbf-2911-08dbeb35aece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNMzrhARjm4zZWyCip5e697EfdGs8z53BIdVYCNuv+FpWeKDbrOcuxFZnbsq1QGRaA9ZOLekVs/aKV/fMJP2Nb7EOv0/VIc/iyCs7VY36eUH+s3RQUOCE6FCQJj6XXL0n2XqcJWdQ7+8rwvMlr/5iW0UyURfIudGIF++1hFIO9/k4SmS26FyPzQeIJ0Nc+HlF7oo4mvuqmJ8uQ7TNdSkrdWUrsT+sSwB/rKnyc6PvuFasSf3fuUklFMGpfLhQ2rAyYmypMQc4BTZ4AShI7ypcKKapY0fM5f+y69Rb9cJ/haqJ9xteg8sLDzYl2Tc3NtW5pgpy5KZ7tMVRmjRhEiwYcu04RiN372Xd2mHtGniB2w3mmmawMquZDvUNYFIYlOcmCgh4uMq/y5/OmPjg1TkwlhngHGgC4uq5CTVWQHehT0r87VyZXRKdyeUhg7cm5KX4FmTfWpbcRoxZg+yDNG1KlOYY8Vly5upv3aqQ5Q7Gwe4+mE4wU1ia3C2Z6+kEmoyDEo2uqXZj9BORBUI3LkxnxSl/h418wkUTUtQ6qU+Ez7ic+Dnh61GpVSs39vEukCVntFqyOj0olThKvY2pvLf9j5nTT2oBwfg9Z11y8m1eZsPVCEaSrXg/sDF6oy80OOIz/4CSP2lOHxcP/pHkLAZsWLlntu7NUIb/6Eck4I7KtQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5664.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(30864003)(5660300002)(2906002)(41300700001)(4326008)(8936002)(6862004)(8676002)(31686004)(316002)(6636002)(37006003)(66476007)(66556008)(53546011)(86362001)(6486002)(107886003)(478600001)(26005)(6512007)(6506007)(6666004)(36756003)(2616005)(66946007)(83380400001)(38100700002)(31696002)(82960400001)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dENocFk4MHkrODZsZm5CYTVHZjliS0pBR0pWc2FIb2lpNENHUjl0NlVIUzFh?=
 =?utf-8?B?WUJsWVRDdER4RG5wQ3ZLeTRsSER4Wmt3ODVNemNwNHIwTGZMdnN6K1FpUUE5?=
 =?utf-8?B?Z2dqdCtOa0U1bWVnVjZqN2NpNkU1L3hxZjZ3TUo1YlIzaTh2NW9qUk41RTAx?=
 =?utf-8?B?MXhjdll6aXZwbU5KYUplMUY4dFpGcDdWV1pDZGZuUXAreVhZRDhXNUFVWWRr?=
 =?utf-8?B?a1ZOdVFRM0toT0hxZkd2NnN1VDZGWU55TjErOXNBc3EzN1FHQ1pVYVYydlRD?=
 =?utf-8?B?VGhBbVVjMzlFMnFER3pYa1BVUEdTQytESGgxZUxFM2NhYmx2aVRqTGRZY2o2?=
 =?utf-8?B?dW5RY0FtY0t1UVU3N0ZrQWt2TTBpdjRyWDBNQWtBejhhTFNqZ3lVaEVQRFkw?=
 =?utf-8?B?RkF3TDV5bENHaUszMko3U0FVVUZDYW9lQ1d1U1BjM0RocU56TkRiWU0rQ3Y4?=
 =?utf-8?B?NGhBSndLUVJESXV3WXY3SXV0MEI1dzBuaG9wbnZJZkxjeXVXUTV3WS9YQTRn?=
 =?utf-8?B?RDllOHdSWVV4VS85akM4dGZxakVZRVNId2pmczlrN1VLdFRJdzVreEJyUmJq?=
 =?utf-8?B?Ym8zaUQ4elJtbExKclhCeVpIUWF2UVZiQ3Q0WEhDMXdBQ1poSTFsci85OUNM?=
 =?utf-8?B?eS9RYU5OeThBdWxOWFNLaDhBVkFwWVlKcFFmczNmTEtVSU9Zd2o0cnZIUmZB?=
 =?utf-8?B?bnhCNzZNS1lpb3JOYzBUakpHaGwzMUY4ZlhmWGtJcUg2cERLSGFNR1FkSXM1?=
 =?utf-8?B?bzdlbnFFWTltd0dIVHJSdUJTVUJKT2c4Y2tzQXo4QVB2bkR3RTlyUUxkcWhp?=
 =?utf-8?B?U1M4c280SmczTHp0MmxzSmtRcWZOWEUxb1FLWE5idjdtTWU1bmwvSjRaMWk1?=
 =?utf-8?B?bVVRbG5nQngydXdKMDNXWGF5RnJBWG9xYmV3Ulk1SGV1YitMZjkxY01YTnZJ?=
 =?utf-8?B?TDFSYTh2d0Q0emcwNzBhRXhtUERNdmdSOVpieDM3LzBIN1F0MjV4U3BxQXBk?=
 =?utf-8?B?YzhnL3lDQVptRDhlSEdwSmlDZWo3djNtRFVWSHVYQktibUh3S3dCL1ZUcllL?=
 =?utf-8?B?dExCM3k2K2k4Q1M2YjFZMmxXOXdiSzczb3J5TkhsRkFzd1ZoL1o0ZTlrR3J1?=
 =?utf-8?B?Zmx2anF0V3NycnBtTEoycDIranpCWWJNSlVzT0JCcmgrTUE3emFnQWU2Z0tL?=
 =?utf-8?B?UzRXVitKT3NuRnBYb3haTExveHg1dnB6YnVGczFKMER3Y2llWHZuTmNaWWFL?=
 =?utf-8?B?WVJ0SlpZQTRhbmJuOVlSVFZqTzBJR0dJeWlQUWR4SGF0R1VlSTRwMmtvLzdh?=
 =?utf-8?B?K1lMMWxYY1JUYTM5WjFKWGdUQkhEVERlN0s4Ukk0WkFMcWlnaE1Kajl5aXoz?=
 =?utf-8?B?dmtROGlFNGhFUmdJRFBmQ1FGTlhTY05NVVFTTnYwc0dlNitJandxM0xldUI0?=
 =?utf-8?B?emtTUGVGL1hEYmVSOEUxWm1jaHZJMURxSnZ4bytLVE4xUytYNEdLTjEzb05q?=
 =?utf-8?B?QTExc3FZMTk0ZlpxYWhkUnNadDFhdTd5SzlkS3c5WUlwV1VEWUgyQlZ3SVhI?=
 =?utf-8?B?VW5IaVdxUjNYVnlkMlhTM0t0Vi93TStVanQ0aWtLbjFZN0l0Z3lkUHRndGVX?=
 =?utf-8?B?YzRRU0M4M0VzUXF2NW9xTVd2cTN5K2RFQU0xcXVnZ2Vla0JVajZtLzh4SS8z?=
 =?utf-8?B?QnBqSzJ6bXFhTjR0R0VuL0VXYXc5UEJhdmZvWXJndU5IT0ZSMFlsRW8yRWl1?=
 =?utf-8?B?cW1QVFpYakxUbFFRK2pNelFIYXdEbGIzSk1SaklhSFpORGJad1Jod3ZUV2Jq?=
 =?utf-8?B?aElRQldrR3B3Q3JlNjNicXlzeFBLMVZvZUFjeWZlUVRSNEcxQUZFMGlZdVla?=
 =?utf-8?B?SzVGZEViVmFsRENCcXlQRHlNQ1lnakRabTNSTE11cmgvWThFUzNNeXh1WDdR?=
 =?utf-8?B?dXBUK3gya1Q3dWl3cmNCMEJSNTRqU2pFVlVwbjk5WmQxY0I0dm9uNlViTHp1?=
 =?utf-8?B?ZWlCaElmNEtqYXpvNmF1eTFuSml4cWYxZXlxVHdwZE5JZFlDRGQydkVtbWlL?=
 =?utf-8?B?V1lSS1NZTVQwS29VMys4TFN6bERrKzNBdTJKcmQ4QWFQYUNKUnRwMGtWaVFP?=
 =?utf-8?B?VnNETE1jMDVXdEQyWGJTbEkrZ051MDlaWlFoRHhOOCsvWkpzVTlmeEdSakFU?=
 =?utf-8?Q?1pS6VcO79wB3JJgh+7hcmWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbadf0ad-6f0c-4cbf-2911-08dbeb35aece
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:33:20.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmEy7ovPU4I6c+k94bIcPQCzhCAnDgP1Uue/viiBLkNENROR1xWaolVKUka67LSXF5SeS9vSRhrXy7AEbxCiGcS9PyWQyXBAHW/nf2XRI2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/4] drm/xe: Add throttle reasons sysfs
 attributes
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


On 11/18/2023 3:11 AM, Rodrigo Vivi wrote:
> On Thu, Nov 16, 2023 at 08:00:42PM +0530, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/freq
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── freq
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 266 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>>   4 files changed, 296 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a1a8847e2ba3..c02b8e9bd72e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc27fe8fc363..296ba9831634 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -457,4 +457,16 @@
>>   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>>   
>> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> +#define   PROCHOT_MASK				REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>> +#define   RATL_MASK				REG_BIT(5)
>> +#define   VR_THERMALERT_MASK			REG_BIT(6)
>> +#define   VR_TDC_MASK				REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..1b64058d9561
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,266 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_reg_defs.h>
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
>> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
>> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
>> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
>> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
>> + */
>> +
>> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +	u32 reg;
>> +
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> +
>> +static u32 read_status(struct xe_gt *gt)
>> +{
>> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +	return status;
>> +}
>> +
>> +static u32 read_reason_pl1(struct xe_gt *gt)
>> +{
>> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +	return pl1;
>> +}
>> +
>> +static u32 read_reason_pl2(struct xe_gt *gt)
>> +{
>> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +	return pl2;
>> +}
>> +
>> +static u32 read_reason_pl4(struct xe_gt *gt)
>> +{
>> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +	return pl4;
>> +}
>> +
>> +static u32 read_reason_thermal(struct xe_gt *gt)
>> +{
>> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +	return thermal;
>> +}
>> +
>> +static u32 read_reason_prochot(struct xe_gt *gt)
>> +{
>> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +	return prochot;
>> +}
>> +
>> +static u32 read_reason_ratl(struct xe_gt *gt)
>> +{
>> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +	return ratl;
>> +}
>> +
>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> +{
>> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +	return thermalert;
>> +}
>> +
>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> +{
>> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +	return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool status = !!read_status(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl1 = !!read_reason_pl1(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl2 = !!read_reason_pl2(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl4 = !!read_reason_pl4(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermal = !!read_reason_thermal(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool prochot = !!read_reason_prochot(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool ratl = !!read_reason_ratl(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermalert = !!read_reason_vr_thermalert(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool tdc = !!read_reason_vr_tdc(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +	&dev_attr_status.attr,
>> +	&dev_attr_reason_pl1.attr,
>> +	&dev_attr_reason_pl2.attr,
>> +	&dev_attr_reason_pl4.attr,
>> +	&dev_attr_reason_thermal.attr,
>> +	&dev_attr_reason_prochot.attr,
>> +	&dev_attr_reason_ratl.attr,
>> +	&dev_attr_reason_vr_thermalert.attr,
>> +	&dev_attr_reason_vr_tdc.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, throttle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj1, *kobj2;
>> +	int err;
>> +
>> +
>> +	kobj1 = kobject_create_and_add("freq", gt->sysfs);
>> +	if (!kobj1) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
> This cannot be right.
> We need to have a xe_freq midlayer now and that creates the freq sysfs.
> a child throttle creating that is strange.

Maybe I can have xe_gt_sysfs create the freq directory and point the other

sub-directories and files to freq.

Thanks,

Suja

>> +
>> +	kobj2 = kobject_create_and_add("throttle", kobj1);
>> +	if (!kobj2) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj2, throttle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj2);
>> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj2);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..48e22f6b6442
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright Â© 2023 Intel Corporation
>                  ^ strange char here
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> +
>> -- 
>> 2.25.1
>>
