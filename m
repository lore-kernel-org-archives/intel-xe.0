Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BBAC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 21:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BB410E2CB;
	Thu, 15 Feb 2024 21:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgYiAMZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7892B10E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 21:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708032846; x=1739568846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g3X612OXVZFpCBVlMKtSj+1KreZgfqS2UXh6cuxfyug=;
 b=TgYiAMZNlfZbsraYT3qENtFP0xErXboscKTNortB/5YLwBIsr/9SGadT
 PLGXqUtxf/EOCF64Ni6AgbdyX48oKQfAQQs5Am7yFMZHlv+DJyJD86Ifu
 wA/xQ6qoaU+FQMgN0cAxAN1++Bi3uLCwNQvVW+HdECrT0NgF4IZ4zzNsa
 akwB9h/Kkp7lWm+qgh6GXu0jKpY+uVgWFByS3tOKVL7iAHVZ7JpfOEIdS
 0NBTS+wvO8eGFzYR/I4PJW1YFSHGoxHyHXwSMvP7OCQ1Vv0Pje40mkZFw
 OuRIrst6pSpoNYeKvaYHWzqr4x1TZ166bdUP9UqpbR1vPzmiULorFF+pG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5960544"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="5960544"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 13:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3823358"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 13:33:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 13:33:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 13:33:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 13:33:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 13:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvaxBfbdlR6tOb4mjWTtQrkmYsT/9zICXhar04yxc5I03jmuLt3NjdamQpoR15CbtCypWz3KFupl+OULqxbCZMD+U12Nms8fO0b2gGOQJEg6+xahdDmVaQ5n6cg/xIjYG2V50HF59cTprTG0RHuYC7jYdKxW+sPUGTgXHL5xgw+fHgjEsNOgCywc05w7I9fyPR+8HKv9a3Qfmr+IaxUawaCyjoSv7u5CbG49Gq8xYX1IVf9WDTcVkCPnmjnmS3WWNeC3T1ppmhGR84kR5uarI3AWcn74u2xJkAgkq/ITeo9YyaW/bTLIIV/pn5jLTbm88dl4tRklneKXqoEQZi2uAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYbsCt9xi3WEC2zN7KeZrDyP0nhFM+ZdTenUdkGbLb8=;
 b=YHIKpGU31VFJtveJrztXT0y4JJAIgEQhYUrXAAQSLzOgJ1PX6esjXAT/OQuEjBVgQNSNaxG6+KRrtuEzjar2ny0K8SQ0Cq7b/3JPt9ngMRDAsVS+Ffs5LKny0+d6iqU1aweuYdXk4JjDtNKUMmUHSdF5U9Ctqrff/YyiQODmRe0bzOSGFo5wQ162WDx3KuVIJwd8fl3eZfZf3yoQajg8sFw85IUC2he7iEHePjDPZ8lAqs2uWK92jD8N/OIXXgjyaTaj3SkYJDgzDnCZHneHKX12Hzx37OWCulssH1inuh87iBQOivIhvMgI3CWyT7lG6ezwtQy1GzPdIT3uVEMubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 21:33:54 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::4b2a:b887:723c:4882]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::4b2a:b887:723c:4882%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 21:33:54 +0000
Message-ID: <118ab773-cb3d-40b6-9f5a-1f0b6b580baf@intel.com>
Date: Thu, 15 Feb 2024 16:33:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] drm/xe: Add helper macro to loop each dss
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>, <jose.souza@intel.com>
References: <20240209174548.19389-1-zhanjun.dong@intel.com>
 <20240209174548.19389-2-zhanjun.dong@intel.com>
 <eb7c2696-077f-4274-b5ae-448ef756b9e1@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <eb7c2696-077f-4274-b5ae-448ef756b9e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0fdc58-46cb-47c4-fd4a-08dc2e6dcf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XlcRmvvVmZin/1ewhELu4mf5sNtQolHlOhYTolhrdET6OokKP2Dw4MzCc+WutuhQZieHGgf+hwx9VraxDEZYmr+/oFrg5xxsp7zlrlZGwKFyElRffXBmcT2bk8gWACttQQhy8eZRySG8Y45Fth1OXlwg9gwbGr3V+d7KQKfbNsdlI+C6AmoOKYOHkKWvlxeCHnlcbGPX+O2+YPxwLxQA+buBl8J4wnOK5l+eCYM+tbRv0vE/YVotMOCUnZ4qGizKswhv9f9/LdzJ7B/M6R7LBkHu6Z6S4TNDFlH0iWZqCFra+wg4MZpuldq0pAwRiUsZMDHY3e1LwpcCg7CKoIwtCME2SXjpBgps+hoGoIuD9F0QolA4HzWetV+B+F6MQdPiACdmyo1wp/J0Y4rAZkG/6mVL68rzWYdOnWdkml06dgZdQ9VH36TMg6K7dhr7HWsZix28HsfpeIBe17MPQGBHZ+711K4VXa3GeY7lVF/BabGwLJWNhSXpxMkaI7ZiPyeSDEhKGlXKh1b/7TCFMZr7gl5pHbGCxgZAjUInTduNOSpTf0axMlX+CHXpYfcyp1C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2616005)(31696002)(107886003)(38100700002)(31686004)(41300700001)(86362001)(82960400001)(53546011)(478600001)(6486002)(6506007)(6512007)(36756003)(8936002)(4326008)(26005)(5660300002)(8676002)(6666004)(316002)(66946007)(66556008)(2906002)(83380400001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3dKWlY1SFZOdW85b2puTFFpOGVIUjhUM1Z1SlNURFEweWNyeXk1V01lTXZl?=
 =?utf-8?B?R25Ud1J1aUdHaXVzTEwySXhpUEtBZ1NxUythVHZKcjE5ZUs2aXFOUlZnQndK?=
 =?utf-8?B?T05xbHIrUkFUbDZGK3Y5N0ltVi8vNUpOU0VydEZ4cGt1TTJCUWpQSHE4aGtY?=
 =?utf-8?B?MVcwUXFTaXp2SFRGZFBHeUZVdkEzL3k3NEVLRDE0K0ZLRnVGTWRtcG5ENjFX?=
 =?utf-8?B?U0pVRlVxQTFCbWNoOG5TM2JnWHBxQXltSHV5SXlEK3ZwcjBXb1J1dEpBWHEx?=
 =?utf-8?B?YytEcUNQdGxHaE1mL0RGSnFvUnZjRU50QXgzRWtja05xMFZmTkRKblVad3hq?=
 =?utf-8?B?Y0NxSzBLbEpsRWpvUkY5aGJldVllYlVLZ2VDNFVFeFErV0pXNGE5eU4zR3Fm?=
 =?utf-8?B?bUNOaVVlemx4YmhnSWM3WmJ3dnpnUEZTWGF2WnJzcXhpSlczYjY5UC9YSW9p?=
 =?utf-8?B?blUwa1dOWTBFTWJCSUlObTJKQXN2ektmbXVFNHJkSnJPVWh3b29sdmx3UHFu?=
 =?utf-8?B?Vmcrd2FCU0lqV1ZmZ3dabHRNZS9JekxvUlVvOElLU1VVOE9vTDlWMU5ab3Fo?=
 =?utf-8?B?cmhiQ3JibUYwaDVHT1luY092NkdyeFAwSUQ5dk1TcHZOb2ZWWUwvQlMwYzJZ?=
 =?utf-8?B?ZGxLcG9ub1dvME9CRXQzMHlUMWJESUtjWHhiampnbDlmVUFZLzRaWDd5dmZx?=
 =?utf-8?B?Mzd3NER1KzBVakxxd09obDRrcnZ0REVVTlV6ZUp3WXQwRkNoV210WHg5MzJm?=
 =?utf-8?B?ZDZXM29WbncxSGJiVi9YaDc4dlNER3JSMC82ZVZVbmpTMitORW05aEdSaUVZ?=
 =?utf-8?B?ZWxnaS8valRiNnJxaDVtK002NVE3ZjdEUk1QMnhDOWtpTldZcDRRSmJuU2lj?=
 =?utf-8?B?Mm5EbS95dkFjbmM3V3RLRytFemV5YkxoMnZ3cGxGbXRQK2JlZ3pZczIxU2RH?=
 =?utf-8?B?R0tWMkJOcENRRHZKK2Ftc0NucmtGazhLTmc1WjUzQitQMjdTRnNDQjhIVUor?=
 =?utf-8?B?RkZQWXoxaEFGN25ZL3NXY1EwbDRrVjNVcjBSTStNUEpwQjRZUnhESXRNNEVF?=
 =?utf-8?B?anlrUGdxVEFxbHgzME9RNFpQRnlVZnFERWRDK1did1ZtWE9KUjVzTnFlRzFN?=
 =?utf-8?B?alJDckVndXdDTW85amlSS2ZMRUx5VmZ0QWI3OS9Lb2w2UnJnSFV2d1lRaGYw?=
 =?utf-8?B?R3dGRDA1MUd6ZXN2dHNGTlF4dDBFMnZQWk9OeFRBMHMxV0piUUw4ekd2M0Z1?=
 =?utf-8?B?Q1pvbWd6RzhMSjB5VktJcUN3WUJsdHRIbS9YVThWMWJyRjZ0M1kwU2Vqc2NT?=
 =?utf-8?B?OThKWWFUV1dpdGJUVHpVUnRKTEVwNXRrV3ZaMUFrbEpXZVJuNXdocG5Nazhq?=
 =?utf-8?B?NFZBalFIWi9NR3owdDhMUUdmM3Bld2lwcnd3b3k2clFRZThJbER3dWh2Mnh6?=
 =?utf-8?B?QTFOVTQvSWdUNDdESGl1dnVSbUdsbExvZEJXaFBSQVRuLzAyZ0pFbkdLeEhk?=
 =?utf-8?B?M3dKVzFoWHpDU0JmdXhrVmdPc09kQTBxc1RhaUZYOUxDMnRTTlY0WlVVaVor?=
 =?utf-8?B?bzlDdE5IdlpGUnR6MWhGczdkNTlnTzQ1SEZLQnVYRnlNUkkyaFBnYitVa01m?=
 =?utf-8?B?a3dhNXNGcXRsT3N1WWpTRUhqVGNBanpaTzhzNjQ3VlVBMXZvbFBPc3pZRmxx?=
 =?utf-8?B?RnBWR0xucEtoZ2tHRllqQkRaZXo1Wk9CUDdvR0d1a29tZUpqM3BHbUQ3TmMr?=
 =?utf-8?B?ZmlvMVRwZ044eTdwUU5BOGYvT0lBd1dFUWI5S1hEaTNCem1UNHhMbEZKVHcr?=
 =?utf-8?B?MHJQcHg3SVU4M2Z5Yk1GeW1uR0FidWkwRmdGaEttdVZ3K0pMdjJISDAvN2NL?=
 =?utf-8?B?b1BFTCtsaXBGSm1Jd0x2UFR1UzM3UHAvaHFqc1pzb09xTVEvUUFiYjR6NThn?=
 =?utf-8?B?OUgrOTVTOEcydnhZNUFMRzV3Um1pSHJpY1YybWJJY0lqTHVRWEpsMWpveTJv?=
 =?utf-8?B?OUtVdmg2RWo3ZFR3b3oxbDE5bklwU0tvQWFwQ2VmM0IxUmVnWmRINVVCdzJL?=
 =?utf-8?B?eFNobVdrSFRqdHBuVWpFMlBpTTgxbEdhcUxZUWlaMGxKWXZCMEw2anpCRmNi?=
 =?utf-8?Q?zOBTGsOrsf7zrvVA28kS4I29p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0fdc58-46cb-47c4-fd4a-08dc2e6dcf59
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 21:33:54.6405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /izY71tvnCn1MpFlLutBCI/JQT9bJV159EZ8j/m7fwErG0KLz82K619NBICiBz+aXu69E8qfo/nvXc5fkJ/HqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5400
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

See my inline comments below.

Regards,
Zhanjun

On 2024-02-15 2:20 p.m., Michal Wajdeczko wrote:
> Hi Zhanjun,
> 
> I was about to push this patch, but it needs new revision, see below.
> Also added some nits
> 
> On 09.02.2024 18:45, Zhanjun Dong wrote:
>> Add helper macro to loop each dss. This is a precursor patch to allow
>> for easier iteration through MCR registers and other per-DSS uses.
> 
> nit: please be consistent on naming dss vs DSS
> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c      | 32 ++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_mcr.h      | 13 ++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_topology.c | 31 +++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
>>   drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>>   5 files changed, 75 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 8546cd3cc50d..44163fe8c7b9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_gt_mcr.h"
>>   
>>   #include "regs/xe_gt_regs.h"
>> +#include "xe_assert.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_gt_types.h"
>> @@ -291,11 +292,40 @@ static void init_steering_mslice(struct xe_gt *gt)
>>   	gt->steering[LNCF].instance_target = 0;		/* unused */
>>   }
>>   
>> +static int get_dss_per_group(struct xe_gt *gt)
> 
> nit: shouldn't this function be 'unsigned int' ?
Sure, we can

> 
>> +{
>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>> +/**
>> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
>> + * @gt: GT structure
>> + * @dss: DSS ID to obtain steering for
>> + * @group: pointer to storage for steering group ID
>> + * @instance: pointer to storage for steering instance ID
>> + *
>> + * Returns the steering IDs (via the @group and @instance parameters) that
>> + * correspond to a specific DSS ID.
> 
> nit: this is a 'bool' function so having a "Return:" section is desired
Sure.
> 
>> + */
>> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>> +				unsigned int *instance)
>> +{
>> +	int dss_per_grp;
> 
> nit: this could be one-liner:
Sure.
> 
> 	unsigned int dss_per_grp = get_dss_per_group(gt);
> 
>> +
>> +	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
>> +
>> +	dss_per_grp = get_dss_per_group(gt);
>> +
>> +	*group = dss / dss_per_grp;
>> +	*instance = dss % dss_per_grp;
>> +	return true;
>> +}
>> +
>>   static void init_steering_dss(struct xe_gt *gt)
>>   {
>>   	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>   			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>>   
>>   	gt->steering[DSS].group_target = dss / dss_per_grp;
>>   	gt->steering[DSS].instance_target = dss % dss_per_grp;
> 
> nit: this looks like a good candidate to use this new function
> xe_gt_mcr_get_dss_steering() to avoid code duplication
No, the pointer type is (unsigned int *) for group and instance of 
xe_gt_mcr_get_dss_steering, while here the steering[DSS].group and 
instance is u16. The pointed data type uint is to match data type being 
used in loop body, where we don't use u16 normally.

I know it looks similar, but type mismatch here.

> 
> 
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> index 27ca1bc880a0..5b4e74da82a1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_topology.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>> @@ -25,5 +26,17 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>   			       u32 value);
>>   
>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>> +bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
>> +				unsigned int *instance);
>> +
>> +/*
>> + * Loop over each DSS and determine the group and instance IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + */
> 
> shouldn't this be regular kernel-doc  >
>> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
>> +	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
> 
> BUG: using outside "gt" instead of "gt_" parameter
> 
> also it looks that upstream BKM is to _not_ use underscore for param
> names as params shouldn't leak anyway)
Thanks for point out the bug. Will fix it in next rev.

> 
> 
>> +	     dss_ >= 0; \
>> +	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
> 
> ditto
> 
>> +		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))
> 
> btw, did you consider to split this macro into two:
> 
> xe_gt_topology.h:
> 
> 	#define for_each_dss(dss, gt) \
> 		for (dss = xe_gt_topology_get_next_dss(gt, 0); \
> 		     dss >= 0; \
> 		     dss = xe_gt_topology_get_next_dss(gt, dss + 1))
> 
> xe_gt_mcr.h:
> 
> 	#define for_each_dss_steering(dss, gt, group, instance) \
> 		 for_each_if(xe_gt_mcr_get_dss_steering(gt, dss, &(group), &(instance)))
> 
We can split it if Jose need it.

>>   
>>   #endif /* _XE_GT_MCR_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..97c0a4b8fe40 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> -
>>   static void
>>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>   {
>> @@ -167,3 +164,31 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>>   
>>   	return quad_first < (quad + 1) * dss_per_quad;
>>   }
>> +
>> +/**
>> + * xe_gt_topology_get_next_dss - returns the next DSS id from a start position
>> + * @gt: GT structure
>> + * @from: An index to start search form
> 
> typo s/form/from
Thanks
> 
>> + *
>> + * Search from this GT's DSS-fuses-topology and return the DSS-ID of the
>> + * next valid DSS instance after DSS-ID 'from'. Depending on the platform
>> + * construction, DSS instances could be for geometry (RENDER engine) or
>> + * compute (COMPUTE engine). However, all current platforms that have
>> + * both engines have the same instances thus we can combine both masks
>> + * internally before performing this operation.
>> + *
>> + * Return -1 if not found since given "from" position.
> 
> you should use "Return:" tag and likely say what is returned if found
Sure, will fix it.

> 
>> + */
>> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from)
>> +{
>> +	xe_dss_mask_t all_dss;
>> +	unsigned long next;
>> +
>> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
>> +		  XE_MAX_DSS_FUSE_BITS);
>> +
>> +	next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
>> +	if (next == XE_MAX_DSS_FUSE_BITS)
>> +		return -1;
>> +	return next;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>> index d1b54fb52ea6..44bd8a58f9ce 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>> @@ -21,5 +21,6 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
>>   
>>   bool
>>   xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>> +int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from);
>>   
>>   #endif /* _XE_GT_TOPOLOGY_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 70c615dd1498..b926606edb38 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -25,7 +25,9 @@ enum xe_gt_type {
>>   };
>>   
>>   #define XE_MAX_DSS_FUSE_REGS	3
>> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
>>   #define XE_MAX_EU_FUSE_REGS	1
>> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>>   
>>   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> 
> nit: above looks like a good candidates to use new FUSE_BITS definitions
Sure, will do it that way.
> 
> Michal
> 
