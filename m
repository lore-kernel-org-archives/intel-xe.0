Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698BCA0ED1
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 04:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531610E0E4;
	Wed, 13 Sep 2023 04:02:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E410E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 04:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694577719; x=1726113719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dcc0Eqq8tVFtbXRtunT//CXsAuG5umHzJCUpjaWXJaM=;
 b=mkVs0GiYeltvQFu7dfSHgXTHzs4F4ToO/AmYuS5TZppCRsPAlUegNCb6
 I1I2bSEydCSZ++fahzgb2GaK8PFQl04ymtzDfbUqVqXuf/IulMjCkEycY
 P70UJJX+tAEl7hN8v1sHbPIyJXOta29lUPuWfZBTiGzAGo9Sm5uSnD+G9
 /jqu4omrk6ZsI2nuISTF9sXhEpIfeeaPsIV8N1/fH7VKOIBm+Io0BnAmE
 4Vd6iyS4/9ajnV6ZsY34Yoio5KWrgylfQdmtjmdrt9kHxrfpLMQ8sbtJI
 gR3QwGYCazAcuPL390431YtouBHravMNheTWxQqb3JqSZMF5pa/UfdP/O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358831294"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="358831294"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 21:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720667981"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="720667981"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 21:01:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 21:01:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 21:01:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 21:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3oZ93CfG2pLQWn9MV/PAo74mx/DlEFmEX2oEVnWb/7BDfby03/ZRm0RSaqDBOlyzlGYSse9BLk7OZFgY6ViZkbsznDZSsPzH1C/HKiCMX4XdG7wWIKwe0mm96KQoxKIprWZWAPjTXrRZe0OKEpwXU2XldOM41rUVPJXVAE/pleP6ZVlG2terStNAtkUPkBseMR3jkn6oqfYmzs9tUvzLbq1knRC9FTPriYvDBGqluT7Er4Au41gCb7KT/MTktPkLOVU+TTEEjJrl7uk7JVq6UKSFmfLEAHS55sdDFXelVeNpPfSv5nZ/g0llF8B5jPimgEOxaIaSMox3jm3yc3nZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmKAeb67Ua2KxEj0H+6xM0df1KgG3sij2ZCl1YKYYvA=;
 b=gkWtN34x1Fo7UhaS1fHZ5bIvHIG9fQjt0NF5C/sqygkyqS4YGjLaH/JAG84f8/AyoCOK8iZP+SL/aGI6oC6gITYmLzLtIhjnyBpsQfSkWlqreA5RAs1Ap78a/+rc/lb8nTWfVPBXwLifK9ULRdY9TNU8+DzU93eKiak5Swa+bXXvYYvf88VEKft/nEGT/b4tdpP3ah/MWgwU3ytBkJtYy3DFCv89ZDSMTtUsPMj3QIWP9wkevnpB3nIO4421APBZ68p07Rvwk4jExDShiZwyrzxhbwnVDs0EeSQQug2SBnjVoHWSzbv8XcBQW/PEEMv03i2zSC7zUiR24m1Ei97eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 04:01:33 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 04:01:33 +0000
Message-ID: <2987010d-a98d-9c29-d247-32bd7688a19d@intel.com>
Date: Wed, 13 Sep 2023 09:31:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
 <ZPJLIlS7K7ey17kL@intel.com> <286c8c28-7bb1-f6c6-d8ed-da4875ffa105@intel.com>
 <8656f42b-dbb7-d380-8499-9193e9504347@intel.com> <ZQB2/aa1CqeMywjI@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZQB2/aa1CqeMywjI@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e86fa6-406e-43c6-461e-08dbb40e1dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fk1tbEDbVwvO/TT09adLAMkjL9QWFYiC15ATME4wSeeSP7F23EyiepO2NPXjgmBbE9jWQKoTlxjDRHfiw9uAXBjqlXr8WlQiglvXaCHVaeh9QmyDApXk03wXtI59J+ET6yw75Xcd9UBLo4fDWZ2sQjkOGXhJMRZz3TeWZZKzi76uvttN+zTx+rNdKMTQDguvOIi0WqMj2WChPcYpqQG7kOZw26aOtjHalcPy+d0gEJQwQrOLbOCiS9GzgIFkzQdYE/AO/zh1c3VQC3amIOEq9VzjGB0ZkcAlbN4AFYcAqaHqJf2IACNKbQkxnumym4rZ4etIm8dlG1S6LDh3hbEbfYEltvKHuzr3Lk8ruGeaM4JSQ7qs7+/Tev7Jr7TqgzKkUbuNir12B0g+cwUVD1wZFuGyG+yNo/Wk+bHTXoUHQ1WJKMJ+XEjMpN9d9zS4ELEyDPB+AoJO8Z/vI2Tk6niJghC75HptY6XJvLUYR1l9kVUA3KqMBHq0zJleaUkeh91tPkNfEyRKZXKetZEX5+5mafzpADWYbIbwghzqX5wF3V5kpFkphJ5BkTMiV3ZId0NGyx7/1mARM8NAKtCw8eibMhf8UMMlnD29ieqVM+0girf3ZEDQXBCwvNfAWYwmUGgDTsLlPK8XBy+LZVLlAYviFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(41300700001)(6636002)(316002)(37006003)(26005)(31686004)(8936002)(66556008)(2906002)(6862004)(8676002)(4326008)(66476007)(66946007)(5660300002)(478600001)(6666004)(53546011)(6506007)(6486002)(6512007)(2616005)(36756003)(86362001)(38100700002)(83380400001)(31696002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlkrMHF6akRHT1Q1TVNEbEN4dTBwbG5PUTJwUHNqRXhlUHJhNzhpOVRBY3hr?=
 =?utf-8?B?OVpQMjZ4YkZBWlBJb1pjdEFhaVp1MngwQWxZeUE4WGNQajRORDlSclRYSDFw?=
 =?utf-8?B?cDFnWnpFd0FEREJnVG4wVitKeTg4dkdyZjJqSkg0bW9nbEFsRzVkMVBOanBX?=
 =?utf-8?B?TmdEd21qSTVRaDRZRFVDVnZXdUhHNU1ZNkd1bmYrSTdTMDZ3SExaSEJHUUdq?=
 =?utf-8?B?U0VrNUxRK0RZNTFESXVNZ0ZmV0tJVER2NGhlNUNtZTBIZ3diZ2RDY05OdlVQ?=
 =?utf-8?B?OTFrQXp2WGw1TXo4dlJtaUo3OGRaRXdrZnhrVmJIK3RKNlpTMTNxaWlaTVFK?=
 =?utf-8?B?VW1naFJaL0xxY3Uyc3F1SE1QU1c2cEVvTUY5b2RTbC9WWmJNZ3BIMkZ4RVdR?=
 =?utf-8?B?SHFJbkJCUVl3Sk56WHJMRVp3QWhsTTQ1MzlZNEJZdi8zak1QWlNMQ1htMHB0?=
 =?utf-8?B?QmkySkp5eGRJdTRHNnZ6VFhLT0U5ajJvTVJXWWRnMHFVWnJWQ3Q0Q0FFNDdH?=
 =?utf-8?B?MDJMaEo4THpmRkZJbUZpSjFFejUvQ2lWYklzTm50eWtMY2MvV2xveGwwbTU4?=
 =?utf-8?B?OXpnNURSc3hNUUViYStqeks3eW9WRytPMWpibDlXY0JNTG8rOEwyK0ttVjBv?=
 =?utf-8?B?VlEwdXN3UmlmQi93VzExSUIydDVmU3VMMkh2ZHY0WEhkQkRhY0hVanhjQVJ0?=
 =?utf-8?B?eUR0VnVQS3ByckszYkpYbG5XK3VodHV0bVYrS2l4emlmc0RWUzcyTXpNb1Br?=
 =?utf-8?B?MFdURzVxcVpqdi9VZUtIN2swYjZmbWVZR2xQclpzSmNLbEI0Zkp4aG9nR3Zs?=
 =?utf-8?B?bmlmdUY5MC9LbEN5SWJBMHNvbEdKT1UvMCtEV2pLNlFXZFNycDVJU1pGY2RF?=
 =?utf-8?B?eUdycjhzS1Z0aGxrYzZoZjQ1WS9EK2tBUEpaNXJkYksra2IvY1BjdG81RlVi?=
 =?utf-8?B?clQ4eCtwcUZQY0pMbzZacVhzVzNuTlJnL20yOEJvSG1ISm9oTWdibmtLQ3VK?=
 =?utf-8?B?cHg5SDltQzgxd3J1ekcyT3gvQy9VZGczNUY3YWVSRm83V2V0SDVnZGJEVlBC?=
 =?utf-8?B?dFh2S05samdCSGdFK1NRZlNDSDYwU3J6MzRDVGVrblVCMEYzbDJhY2wwZ0V3?=
 =?utf-8?B?dlA5dDBkcXJWWXNnNFlhRnI4Nzd1YUFJTjFaRWNza3lTa0tDVkk5SlBlYUtR?=
 =?utf-8?B?UUdveXNhRGxqd1BjZGZFYTZQdHBvbkRYdlF3eklMOEMrSHpYejZlNnh2VE9H?=
 =?utf-8?B?SGV0L3pEQ0xxbE96WVdDa244MGR5ak8wYXI3WU9lenhWb3VDR1FlMFl0MG56?=
 =?utf-8?B?Mi9XdndjWFh6YVpHNkxET3RGMlR0MjNpNUM0dEJhVkVNWXVlRVBVSk9wanN1?=
 =?utf-8?B?RGZ0OWJ2bW1ENk1OU0NRV0l6ZWNaUGdyVXBqWGZLeHJBelFBclUrTEJ4d3R6?=
 =?utf-8?B?UGVTRUd4bUxiNTBxYTg0UHJLOFJ0em9EbjJkdlNyVTFsbjFpSHhaK2tNb2p5?=
 =?utf-8?B?TUF5TGNwZFkrQ1pyNTJuSlhVaE5wcnNFdThaUXVyaHpkcGNzNXpMZWl6cHNG?=
 =?utf-8?B?VXNnQnA0TDlpcFZuUEJldUhKMkJSUWNzWHZGWXlrRUVTMDhUMGJoR2FsL21k?=
 =?utf-8?B?SWR5RFpycEJLS2pLSmxHdjRmYURralFWM2NMWEFYRDcrVEVSWm83dSs4OXlI?=
 =?utf-8?B?bXgvUUhHRFRpK2wySGRESHRIdGFjc1RQQjNvVWVlZ1p5MTNoSFdYTDBLek9L?=
 =?utf-8?B?eGJCZjIvQWtuakNYczRtWG9PNytuelg4Y0M0Z3NBNmZoaGdHQ0U1KzJIWHF4?=
 =?utf-8?B?N3B2ZHJSQmhJNGo1R0J6b1dTL1lUK2RYMjd1TWx0Z3YwQzNRd2JVSVFJYlc3?=
 =?utf-8?B?NkV2c0JraHlvYVYvUlg1ZU9LczRSSVNBTVJwckJpZVJVdHRqTGUrUVlhTHFv?=
 =?utf-8?B?QUwyWDJtTTFQdVpxOFBUMUk4NmxYeXhHZmRoU0wyNy9VbTRESWFrcnNORWhW?=
 =?utf-8?B?L0phUEd1YmtDL3VWdFVqcWNLZjhDaUphMU54M0JlSHVnaEZaY0Rrc0N3eFN0?=
 =?utf-8?B?dHlUYWVVaDBNNGhYdzJOeHZmeHFBUlFuZ3N5Q3JmZnVTVTNVN1BjWWNyMllw?=
 =?utf-8?B?a2NQejMyd3AxckxZNUZkUEZUb0JtSDdFSUhEKzJrM2I1SVpQVVNjZ3VSdDU4?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e86fa6-406e-43c6-461e-08dbb40e1dd3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 04:01:33.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+X1BB4BTi6xKMvnbgQd1L5fC7Y/QE1GxOSDk1SW94Zh4G7abq9PA9oTWgkYjTqLaHhDSnJLY9KCJGkNlwzgGUiWsuy9o0+BxjVtKfP/gOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add base performance sysfs
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


On 9/12/2023 8:04 PM, Rodrigo Vivi wrote:
> On Tue, Sep 12, 2023 at 02:18:55PM +0530, Sundaresan, Sujaritha wrote:
>> On 9/3/2023 7:06 PM, Sundaresan, Sujaritha wrote:
>>> On 9/2/2023 2:05 AM, Rodrigo Vivi wrote:
>>>> On Fri, Sep 01, 2023 at 05:45:44PM +0530, Sujaritha Sundaresan wrote:
>>>>> Add the following attribute to Xe sysfs
>>>>> - base_freq_factor
>>>>> - base_freq_factor.scale
>>>>> - base_freq_rp0
>>>>> - base_freq_rpn
>>>>>
>>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_guc_pc.c    | 116
>>>>> ++++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
>>>>>    2 files changed, 135 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> index c03bb58e7049..6a139d1dbf66 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> again, this has nothing to do with guc_pc.
>>>> We clearly need a new component to handle the frequency.
>>> Right. will look to define a new xe_freq component
>>>
>>> Thanks,
>>>
>>> Suja
>> Hi Rodrigo,
>>
>> I've moved a lot of the frequency attributes I'm adding to a new file
>>
>> with a new xe_freq component.
>>
>> Does that work for this ?
> I think so, but I might be missing something.
> Is this already in the mailing list or some branch that I could peak?
>
>> Thanks,
>>
>> Suja

Sure I can share the branch. There is a throttle reasons patch on the 
ML, which is similar in concept.

That's the direction I went with for the sysfs in this patch as well.

Thanks,

Suja

>>
>>>
>>>>> @@ -20,6 +20,7 @@
>>>>>    #include "xe_map.h"
>>>>>    #include "xe_mmio.h"
>>>>>    #include "xe_pcode.h"
>>>>> +#include "xe_pcode_api.h"
>>>>>      #define MCHBAR_MIRROR_BASE_SNB    0x140000
>>>>>    @@ -37,6 +38,9 @@
>>>>>    #define GT_FREQUENCY_MULTIPLIER    50
>>>>>    #define GEN9_FREQ_SCALER    3
>>>>>    +#define U8_8_VAL_MASK           0xffff
>>>>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>>>>> +
>>>>>    /**
>>>>>     * DOC: GuC Power Conservation (PC)
>>>>>     *
>>>>> @@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
>>>>>        NULL
>>>>>    };
>>>>>    +static ssize_t freq_factor_scale_show(struct device *dev,
>>>>> +                      struct device_attribute *attr,
>>>>> +                      char *buff)
>>>>> +{
>>>>> +    return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>>>>> +}
>>>>> +
>>>>> +static ssize_t base_freq_factor_show(struct device *dev,
>>>>> +                     struct device_attribute *attr,
>>>>> +                     char *buff)
>>>>> +{
>>>>> +    struct kobject *kobj = &dev->kobj;
>>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>>> +    u32 val;
>>>>> +    int err;
>>>>> +
>>>>> +    err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>>>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>> +    val &= U8_8_VAL_MASK;
>>>>> +
>>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>>> +}
>>>>> +
>>>>> +static ssize_t base_freq_factor_store(struct device *dev,
>>>>> +                      struct device_attribute *attr,
>>>>> +                      const char *buff, size_t count)
>>>>> +{
>>>>> +    struct kobject *kobj = &dev->kobj;
>>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>>> +    u32 val;
>>>>> +    int err;
>>>>> +
>>>>> +    err = kstrtou32(buff, 0, &val);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>> +    if (val > U8_8_VAL_MASK)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>>>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>>>> +                PCODE_MBOX_DOMAIN_BASE, val);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>> +    return count;
>>>>> +}
>>>>> +static DEVICE_ATTR_RW(base_freq_factor);
>>>>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>>>>> +    __ATTR(base_freq_factor.scale, 0444,
>>>>> freq_factor_scale_show, NULL);
>>>>> +
>>>>> +
>>>>> +static ssize_t base_freq_rp0_show(struct device *dev, struct
>>>>> device_attribute *attr,
>>>>> +                  char *buff)
>>>>> +{
>>>>> +    struct kobject *kobj = &dev->kobj;
>>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>>> +    u32 val;
>>>>> +    int err;
>>>>> +
>>>>> +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>>> +
>>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>>> +}
>>>>> +static DEVICE_ATTR_RO(base_freq_rp0);
>>>>> +
>>>>> +static ssize_t base_freq_rpn_show(struct device *dev, struct
>>>>> device_attribute *attr,
>>>>> +                  char *buff)
>>>>> +{
>>>>> +    struct kobject *kobj = &dev->kobj;
>>>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>>>> +    u32 val;
>>>>> +    int err;
>>>>> +
>>>>> +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>>>> +
>>>>> +    return sysfs_emit(buff, "%u\n", val);
>>>>> +}
>>>>> +static DEVICE_ATTR_RO(base_freq_rpn);
>>>>> +
>>>>> +static const struct attribute *pvc_perf_power_attrs[] = {
>>>>> +    &dev_attr_base_freq_factor.attr,
>>>>> +    &dev_attr_base_freq_factor_scale.attr,
>>>>> +    &dev_attr_base_freq_rp0.attr,
>>>>> +    &dev_attr_base_freq_rpn.attr,
>>>>> +    NULL
>>>>> +};
>>>>> +
>>>>>    static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>>>>>    {
>>>>>        struct xe_gt *gt = pc_to_gt(pc);
>>>>> @@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>>>>        if (err)
>>>>>            return err;
>>>>>    +    if (xe->info.platform == XE_PVC) {
>>>>> +        err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
>>>>> +        if (err)
>>>>> +            return err;
>>>>> +    }
>>>>> +
>>>>>        err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
>>>>>        if (err)
>>>>>            return err;
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>> index 837ff7c71280..da4114bfaa7a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>>> @@ -30,6 +30,25 @@
>>>>>    #define   PCODE_READ_MIN_FREQ_TABLE    0x9
>>>>>    #define   PCODE_FREQ_RING_RATIO_SHIFT    16
>>>>>    +#define   XEHP_PCODE_FREQUENCY_CONFIG            0x6e    /*
>>>>> xehp, pvc */
>>>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0        0x0
>>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN        0x1
>>>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>>>> +#define     PCODE_MBOX_DOMAIN_NONE            0x0
>>>>> +#define     PCODE_MBOX_DOMAIN_GT            0x1
>>>>> +#define     PCODE_MBOX_DOMAIN_HBM            0x2
>>>>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF            0x3
>>>>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER        0x4
>>>>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY        0x5
>>>>> +#define     PCODE_MBOX_DOMAIN_CHIPLET            0x6
>>>>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK        0x7
>>>>> +#define     PCODE_MBOX_DOMAIN_BASE            0x8
>>>>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET            0x67
>>>>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>>>>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET            0x66
>>>>> +
>>>>>    /* PCODE Init */
>>>>>    #define   DGFX_PCODE_STATUS        0x7E
>>>>>    #define     DGFX_GET_INIT_STATUS    0x0
>>>>> -- 
>>>>> 2.25.1
>>>>>
