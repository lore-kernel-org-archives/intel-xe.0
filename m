Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4095BE743ED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D321510E0D8;
	Fri, 29 Sep 2023 05:40:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CB510E0D8
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695966014; x=1727502014;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+WA+PS3QhBP791HyGMg0oFLyRHqba4Ke7iB7RYfVUno=;
 b=Y7coymNv0CmEn/QkvEphgUgN55DrzBOWcUgUAfOI8pSMpsTLkzeI6ftg
 iAkeIgUDZpx+565dxFSrJegPS/zQZHFaUis77jEFyPtXXRGdHPjXGgKH+
 +wzS/+mq3cQNraf30Hdv2GEDRwPaclYWIEb81rxXXqcBmJlRoRez3/VAJ
 zbRb5etZzcO9OdJFjNCckp7YP9SzNEGyo4hsQIhmbjnF47ye2Vt0a6yQJ
 j3q8EZeF4hr6SYaYD6R7OxzAj6sQMdNelDTzw4B7imgtwUl06jYeEz1AO
 BwJFKsblvBEr0BqvqSWTwsqhombXgN+/rpoKbRYQv/KlNe72m8NxGBej1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3810010"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3810010"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873558700"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="873558700"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 22:40:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 22:40:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 22:40:11 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 22:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Caszw6rQiNg5J3NEqNRx3QClLq1zWMWpAJ+NX0Xi6seM9ZDio4UN9tkgyr5eviYFzQs54bQwKqcBTWf6D16B5Pi860cr1cgl+hr2wAZdCJK+SlH3IrdBzTeQAcK6cJgImUY66A11bjI5Lt1WwIanwWd71Ymkk1LMyhTzPnpxUJBq3zBEAc+toeNuMzLWdrsvTJy7k/JNg5mq01zd0Gv2PlgN8u4/o6He+a6CD+mSZXQzwZ9n1HYYU4QzpieBLdTV0L8en7NtmQ0/Pu/niC/mIXU2Hf9BhQbMPrdOr0nHSb2bzCNdWlIRpBXSD+NHvfn9orl/qaYigMjZG8aHn++yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kybyL9kpuwWNXgKT0cRPj1AYWHsZVvpLji5ghvJxC9A=;
 b=KENFKq0hMxZx3W8SnbbnaqpY24ONJG0OmUkG6Ophjv+7du8FbLxdy9PZj8g59qxy7phbZ+xWhMybFRKGT0RdpDOiuJfcaifkdxI/R9cAvrlVRm1Ykp4Ptardz4cQlNFgclauf973iFSxTbLDvMFnv66r37OeCYZWDCYKHBZSN0bK1TG3zpePLcjvpFGoCmERyyBYIs3eM+FisSAqPAZHt8FQvWG5sPk0qu1Hnkqwhb+fvODlOmaKkHPD64VDhheEDF4INTK0V8/p/i73+nyRJDw7/idyLCLitfojZNI9OButR7PzVEjgZbLwJykdfGR9V0WKXMYbQNExqvN0ukm5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 29 Sep
 2023 05:40:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 05:40:08 +0000
Message-ID: <5325c63c-07cb-8395-e95a-25d86febe29c@intel.com>
Date: Fri, 29 Sep 2023 11:09:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
 <ZRMVda8E+xLJbDJp@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZRMVda8E+xLJbDJp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 97abd0db-e9a9-405c-9e14-08dbc0ae8a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pY0zCaTe7XVc4Ftlx6BGK7s0xPRuIQnCXQb1HwFp0s9C6rdL08s2/4Tt/cyURB93dWbXIF6isVTrmLAhTxmU2030lW1x4xbEgPeHtsw5djI3w2p/Vmg+z470Mi2G4l3dSz0WIZ4JbZQ/QMUN7I23x5PRok2s1NANIHppTQVDlrAKsYVOh66Ha/LPyAftAOrwrsg3KQ1p8U+rxhL1wkq8RuPWEj9j7PjWdzolIQbc5BsvGIEv5LkbjuxvvbnuHf0/B4mxjP8vny3ZL9VzRes9ZHjoFRTnohegWYiVvIuRFNfnyqmbERy4vUbWKLPjIOQRYtP02sWGMJBRF9xUO0+tb7sRpjuaePKYPcd+SwNOmQJcLLEjMEykPPcncg7xfJfoQr4KtN7vhBM2jy/RN3j+fB/baa6r+xtcNd0bxUiEbpL3j9LYyu8SVR59ngNBNjSPPHGBWHcIYwlSVezF01Zg9gEgavk8w2o2XH1nKvrgFWzyT7x34WW8fbP49uqPrgS+mlXvTdVmgTzbBXn0JsjJGqlCS1FrmubwZwIG7KynqP/EQJlViAhHB4StDcQHl9w3Ca1Egt0jjAIkPp6i9AN7g0Gnmph5Pwk8P5uhvosmVRnO3AniLKuyqL+9pScqauhu6K8cRI8kCe5F58PrqTDTWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8676002)(107886003)(478600001)(82960400001)(6512007)(53546011)(6506007)(2616005)(31696002)(6862004)(38100700002)(5660300002)(37006003)(4326008)(8936002)(2906002)(44832011)(26005)(66476007)(36756003)(66946007)(41300700001)(6636002)(66556008)(86362001)(6666004)(30864003)(83380400001)(31686004)(316002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alQ0ZWh4eEZiZDZsS3VLanNLSFhrMFJWN21lWXBOQVZaK1IvSGZzNnFYSnZm?=
 =?utf-8?B?SVNtVGhHUW5XRmVmVzhBWmRjUGp2NWRnZXNUZFN4b1FDNFRnTDVPbXB5SWJV?=
 =?utf-8?B?UTdrM3VMM3duejZvTWxVMGxiYlh2MTFoUjlMZXZvTGMrd2U5WXB3T0dBa2V1?=
 =?utf-8?B?RGNnSHlHNDlUbHI3QXhYSzliZGxDenFOWmdPT2k4MFNOMFpjaUFvY3FhRW1o?=
 =?utf-8?B?ODIzNmM2Y25URmg0SnU4S1AxM0JWMG13RWVxZ3F1bVhVdm0zenFHaS90Z2hJ?=
 =?utf-8?B?TmY3VGVCZHlCTVVMV29sekFDK0ZVaFBwT0lSa2NnUmsyYnJJNFpNaW9BOEFO?=
 =?utf-8?B?bDJTNFJkbkNxajBCdXAwT2lreEozLy9YYlppOGpYeE42ci9UTk9kcEtVT1JO?=
 =?utf-8?B?NEV0aDI4cmJtSjFFaDhJUVhNY2NYT0ZXR0JLYjJESlRnTHNoUnlTeWxjMnNE?=
 =?utf-8?B?akNuWjM1Tyt0RWlJMXBJYzVuTnNkR2xTTnZFMEM2bDRKN1RZSlhkdUVOaEY1?=
 =?utf-8?B?cHo3c29RcTZQcHdiSHVzWkkxWlpmRlUydlFsN0crMWgwV2hZSEFnMzRwb09v?=
 =?utf-8?B?eFNZVHhseEUrNjZZbTI0amxiRkUwSFdHQTZsdXpMVGxoamFQN1UyVEwwOEdw?=
 =?utf-8?B?S01mbnQyTmxzRGtUQmZXdGE2TEpzS3NobHlnTmVCOUphWGZrN0RhbzBIcTVN?=
 =?utf-8?B?K1czQlFRaEQyaEF4dk12aGdIU3ByR05jcTJST09QdUMrOW95d1RWRDAwUi9N?=
 =?utf-8?B?OE8zdERJQndTck5ST1RyOTdJcnRVajNNNHc5bnc4TVBUVjZScGlqYW1FRVJz?=
 =?utf-8?B?UnliRmd5YXU4QStzM0YzKzNuZmNLMzhkU2VjWnlBMGN3R0tEWHZqZy9DdXNv?=
 =?utf-8?B?SkJRWEc5MzZDWWI0M0tEWlBTQ2xBaVpXdldEckUrZUwvZmQ4aHlqQkdmdHVz?=
 =?utf-8?B?YjcvbzhpbGpCQlJQbkFsbFlWOW1TaERpSGxiSlhreXFaVkVVb1c3am41YmtF?=
 =?utf-8?B?aEROMDFvT3cxaEovUWhJTVl1NVY1ZCsxZnBTWitEcGlDMGt1Z2NNYjJsWUkw?=
 =?utf-8?B?UWRqYnUydm13L0RsRlRPNVNFaWdLMndFOC9ueEpyVml0blZzSnR2cWRIVzUx?=
 =?utf-8?B?Z1dWaVNkZ0dYeVpubCtvRDlSVUZJMGRmR0NvNFIrSCtvbHZZR3lhUWxQVEVV?=
 =?utf-8?B?ajhjaHBWbllHOC8ydjgxZFFGUExPb2o3NUJuKzBzeUFKY283YTdwZkZsQXIx?=
 =?utf-8?B?RTYvUkJWTzd3WUxrWUNIRCt2V05YUFlYNTdONHd0SzhmNTdEdlpMQnZvNTVh?=
 =?utf-8?B?R0NIdEp1RERZTnNna0tkY1c4L3JnUVNzTTFoQ3ZzVlBQeDVqV29ya3BISHNY?=
 =?utf-8?B?a0lDc29VOXFQTlJSZ0x3b09MUG5jblRpbjFWVTdTUkFmSXZ3R1cxK1pIcHkr?=
 =?utf-8?B?QzVBRkhpRnBYNkcramY1TXNwVDh3VHhkZU9kajd2SUgzbDFBM0xnU3FKdThq?=
 =?utf-8?B?RjB4WXhnVjhXb0VlZGZkWkR2dHRSd1RFaGdnN1BnZHhZMGFSbmNPcE9KVlRD?=
 =?utf-8?B?T1NUSjJPYmRKVkdjaHZ4VGpnb3d6VFVFNVlBQzQwMHJUUytMa1RBZWtSQmt5?=
 =?utf-8?B?SGJVd0Q2VjNCeG9YeE0zeHdVbFVOdHJycjZsVzFZNFlSODlNbWxOSWJpYkUv?=
 =?utf-8?B?bHBDZmx5di9wb3hQQjVsOFZFR3N2d0dJTzNHSHovSjlqenF0ZGRkWDJzeW8y?=
 =?utf-8?B?L0EyT3RzRkU0T0ZCdDBZUWVwaVRpQ3JhekxaMmRPbG1zSVhhZlhvYldQSlox?=
 =?utf-8?B?UU9QcWlTVXJIVEcyWHFWWnNyTFRNcWFocVhvZ0NvbTdBWEozQTFHV2M3TTU1?=
 =?utf-8?B?UGNWdUVlZjlQTTJRRThSckQySkR2OUNtQkxYNkp2S1VUeUlmZDBvWW5HbFNG?=
 =?utf-8?B?aG1VR1JLOHl0WkxYYkZrdjhoODE2dEU2Z2FqcW1oQWg3NVRuYk9DSE1zbGNo?=
 =?utf-8?B?dVA4QkE3WDRoemxlR0JFNEVYamZFeDdNOHpnSU8yQnM0a29OQUpWREs0WWtO?=
 =?utf-8?B?OFFDRTZkNUt2eVBvc3RYM1d1R0pZQzZwbWxqbE1WY3ltM05IRDhhYzBPN3E5?=
 =?utf-8?Q?4MHWVstSb47q0n6TukoQOTzne?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97abd0db-e9a9-405c-9e14-08dbc0ae8a89
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 05:40:08.7601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16Q0k4BIqTj783DaGHTTny823zZz9ToMBKk/GYrRg60Psicg9tQh+4u7LXGk2iFjechSdTOjOEaKwk0MVjnkvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja

Could you add the folder structure in commit message

On 9/26/2023 11:01 PM, Rodrigo Vivi wrote:
> On Tue, Sep 26, 2023 at 08:11:20PM +0530, Sujaritha Sundaresan wrote:
>> This patch adds base performace attributes as well as vram frequency
>> attributes.
> 
%/performace/performance
> Is vram freq tied to the gt or tied to the tile?
> 
>>
>> v2: Create a separate performance directory for attributes.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
>>   5 files changed, 257 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b1681d1416eb..bdd9922d3db5 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -60,6 +60,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_freq_sysfs.o \
>>   	xe_gt_idle_sysfs.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
There are few attributes under tile, few under gt.
Should this have a common name instead of gt prefix?
>> new file mode 100644
>> index 000000000000..6017d09eeca2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>> @@ -0,0 +1,218 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_freq_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +
>> +#define GT_FREQUENCY_MULTIPLIER	50
>> +
>> +#define U8_8_VAL_MASK           0xffff
>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>> +
>> +static ssize_t freq_factor_scale_show(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      char *buff)
>> +{
>> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>> +}
>> +
>> +static ssize_t base_freq_factor_show(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	val &= U8_8_VAL_MASK;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +static ssize_t base_freq_factor_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buff, size_t count)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = kstrtou32(buff, 0, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (val > U8_8_VAL_MASK)
>> +		return -EINVAL;
>> +
>> +	err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, val);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(base_freq_factor);
>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
>> +
>> +
>> +static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rp0);
>> +
>> +static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rpn);
>> +
>> +static const struct attribute *perf_power_attrs[] = {
>> +	&dev_attr_base_freq_factor.attr,
>> +	&dev_attr_base_freq_factor_scale.attr,
>> +	&dev_attr_base_freq_rp0.attr,
>> +	&dev_attr_base_freq_rpn.attr,
>> +	NULL
>> +};
>> +
>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +				PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>> +
>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +				PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>> +
>> +static const struct attribute *vram_freq_attrs[] = {
>> +	&dev_attr_freq_vram_rp0.attr,
>> +	&dev_attr_freq_vram_rpn.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, perf_power_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("performance", gt->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj, perf_power_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		drm_warn(&xe->drm, "failed to register performance power sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
>> +		if (err) {
>> +			kobject_put(kobj);
>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +
>> +	}
I'm seeing PVC prefix for perf_power_attrs above but you have added 
vram_freq_attrs under pvc. Shouldn't it be the other way?
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, kobj);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>> new file mode 100644
>> index 000000000000..7b76c4670632
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_FREQ_SYSFS_H_
>> +#define _XE_GT_FREQ_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_FREQ_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..3b6316ce10ed 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "xe_gt.h"
>> +#include "xe_gt_freq_sysfs.h"
>>   
>>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>   
>>   	gt->sysfs = &kg->base;
>>   
>> +	xe_gt_freq_sysfs_init(gt);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..da4114bfaa7a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -30,6 +30,25 @@
>>   #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>>   #define   PCODE_FREQ_RING_RATIO_SHIFT	16
>>   
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_NONE			0x0
>> +#define     PCODE_MBOX_DOMAIN_GT			0x1
>> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
>> +#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
>> +#define     PCODE_MBOX_DOMAIN_BASE			0x8
>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
Add only the mailboxes that are being used.

Thanks
Riana Tauro
>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
>> +
>>   /* PCODE Init */
>>   #define   DGFX_PCODE_STATUS		0x7E
>>   #define     DGFX_GET_INIT_STATUS	0x0
>> -- 
>> 2.25.1
>>
