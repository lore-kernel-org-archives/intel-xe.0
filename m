Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83779CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 08:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB4F10E3C3;
	Tue, 12 Sep 2023 08:49:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376910E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694508549; x=1726044549;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wXk8LUmcSX3dJpG4hhB9O7XZSp8GJjSNQ1wbHFSLil0=;
 b=VjiTBIGH/fKtKe1xZpWxyd6bo04PbdWU8fvlZhePB9FJnS0Ou7DYoBJN
 ve6WMK+yK+hcoxlYYW8lMgv2OoFQl/36IXpkB+yGhv5oT/HkMXsCkUMRS
 WSuJAFszjaWVqI69DXfQPayLwqECPyKDeogFcoVaHuvOLEyWQMEUSn+RA
 inUz0z3MLf/0vI4dcUsp2jeuaVwyF0HsQU/Y1ZrKlK8UuQgjWv3+sAsNs
 HtdovUFg0CIFwLsJGtXgRPNrsdHm5fDPQJW4YtT9B+tBT9J6o/ekVJipj
 f0G/QPOhGaD42W3uLe7JDKiSbd9e7sP0PPbN76G9IFe6mf+D4LJHsUQQ9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368573030"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="368573030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 01:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917364172"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="917364172"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 01:49:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 01:49:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 01:49:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 01:49:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i60UeehW9BeOMO7xp43aF5vJKVw0f04y0o1PEYfx5SnaDTv+TCmVrPUftSPhSgz10PAuz0M0P6xyo3osHnzIbEma9sYaqe3lVC26gkpBpFAPsOXS+xkjY/AwGAh08j6jZsy5sw491qBG5EhdoLBHnZAu/Y8vuiQSyVbyhNm7HFzr3vH8242e/dBjx+l8goHXeVyu5W+iTtrdB9Dv4sem+7kSw3CryU2O4p3/kyYH0PkebpvLmZa+f/+76EKPmrVlmlv8TOa0LePRbB41yzNg9QDkBrlmFjPNwMoC/EyH+IkwjL5gIfrJEhGCcOTGTBui18wHquuQ2QinUX0LjXroMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrhMlt5LphO3Ob0lk7Q6IoPFv0qfh/4BjmwhpIO2/sE=;
 b=mRgUMABoGZ0UAQQ53DFbSwN/WTu7wWQMFFLME2n4HzlK3RBtvsjVt8PT1hxSxPG0VgXla/zyfN79bE3Gy+XN8Mf2riQMB9LSdd2lHZBs2EhF7FzrkE9k4GAfQZ01RFVnbC+NxEvgvBSJf2tvcjSw1ZeDOuBor/RR+U2fcNCYSIT6reRcV3izOb9AZ/CtH6eu7m5mmTjWkmTiM32Ac1KanlLSAzYFXmsXDaMrNC+4laD2UVX6nnKKUthvhsxnwnhWP431qyT8QOBct0KJ2X8ouObbUfY/m1Gop75VBT3JvX7akr8CV0lBDIP2UGCD2Cm9EUtcL4yf1cAQvWKnmbxsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 08:49:05 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 08:49:05 +0000
Message-ID: <8656f42b-dbb7-d380-8499-9193e9504347@intel.com>
Date: Tue, 12 Sep 2023 14:18:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
 <ZPJLIlS7K7ey17kL@intel.com> <286c8c28-7bb1-f6c6-d8ed-da4875ffa105@intel.com>
In-Reply-To: <286c8c28-7bb1-f6c6-d8ed-da4875ffa105@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9aa1e4-7949-43a7-a70c-08dbb36d1ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jj2RFsmzHnTHaNf9nvqbxBL1z/Ch6ur/rv4BufeE+JcfIyBDbDUk2MC8LmoQnLye1mECvmJGqc8EzqVzTsqW4IadZokx7oaV9SAY+uffnVraGEa0VMMmRQIMZDsB6Csl4ZpMyQWloLc2fvrmeWKZNOjNzq8dCHhLf1iHQY2xN5QnVqPy8DdJdIgHbm0bLgpxsmmRgvz+5tslMXWW3HxbN7neI+j16yNNGCkvasDIk7xnGNZ33NqVu9VfY3nziT4/fbhCROWXgJrmAlu3mDFWkkWPEj58vUilawap0M2cIrSrk4DerxoGh/UorbzuA6eeBh55F2CjO1N8G/SIoKt+KU5+B/GKvtigJLoJ87e1MsG3WBLMk8xz91DXIK7wcEhzo8yhRLd1rW+GjrxyRy2eDTno3nVFHS/BcQhq20C1RDSoOSN6llB3mUE8Fnx1uhjnmO1tiUdZY9wqpIIwK9BD7ZQ99pZ3IITQtmK02QCa1v1ICC4CJCfOAuV0bdwWf2qpvTwDNRHzuELK3/8Hj60E454hy3v+BGxLFTq6+3ecshfgz9uKswZwUBp1RBMgasEN2j07qYaoxw8EfEV8Z4TYkvkbq6GwJdxQYKF2jLte/W74k2PhDblUulqOBHnOD3Ms9nQ+pgPegc7/Vgiv1diaOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(1800799009)(186009)(451199024)(6506007)(53546011)(6486002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(31696002)(86362001)(82960400001)(2616005)(26005)(66476007)(66556008)(37006003)(66946007)(6636002)(316002)(41300700001)(2906002)(8676002)(8936002)(6862004)(31686004)(478600001)(5660300002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STdsY3hwOGR4TkJtQW8rZHpDVXRodzdiV2VUQlRuNjdlMjE4UWFMcUIyS3Ru?=
 =?utf-8?B?NXNLbG1zVTQ5OFk4VnBVc3lXeTdqdGRsQnhjTjlyZjYxNm42ZE9CcFBWNTRE?=
 =?utf-8?B?cGFrMnhhb3o0cmdHM2VaWThSV05RcmowdGlvNzNCVzZkbUJiQWtUOWhFekF5?=
 =?utf-8?B?UFFsMVJpckxTaFZFVWRaZWt4Q0ZxOWVkazM0WlM5Q0kxYmhWcGRzdldCVXU3?=
 =?utf-8?B?SncyYSs5d25Fa0VJN3JOYStPTGNlZEM1SmhVc1J5MW0vQk9wVzVtK0IwZlpN?=
 =?utf-8?B?d0dBbmx2U2dOSkpUNlFlRVpMb2tTZWsrd0Q3bnczZmtxazE2Uk85WWU5Tmp3?=
 =?utf-8?B?Wnk1SmtvVXRDbmRVcWJTeUl0TTBOcTFHNk5UZVE0RWthaGc5cU8wYy9yRCtS?=
 =?utf-8?B?aEdpcTBmaWlXRWhlVDJSczhoZHYwemZGcWtvQmZYNEd2S2RWYVZqQXZkTHk5?=
 =?utf-8?B?SEFIZXBId3EwNHZYMjIwT09oRzdlcWdiajc3VjdFZ0t4dCttdWpIcjJTVkZi?=
 =?utf-8?B?ODBKM2tUV3lDOGFaNmFQR3BTcldIM0xKMzJlelBpNmVZdDdUc2JiYm4waTBx?=
 =?utf-8?B?VEFYQ29VbDBkWmxXWTIzcG9qTVRTd1VzOXh5WDR4bVRlQ1hja1NiQ1p1Q0pQ?=
 =?utf-8?B?WFlrZkw1cjFxNEdBdVQvcEVXa2gzM0NwcU8zalpFZGxubTdnb0pIaGY4QklP?=
 =?utf-8?B?N2l3bkZWWUpjMWlIaU40TzZBTUYweElNQmsvNFNxcU4xVWl0UHVRcHlNUDhB?=
 =?utf-8?B?aS9DOUF6NGFtNXlvME8zWWNxUXpieUQ5NTNsS1ZBY3JQUk1OdWxKSjhVSE5m?=
 =?utf-8?B?UmV1OHVsOURNbDZlYVdFNk1UbGlmQ2pJblpLSEdpTjJKa3ZaaXBqMzFYbTVt?=
 =?utf-8?B?dS9ySnA2R0ZvU3FwSERDNjZVcVpxUlZoenJqYzhZejU0VVVtQ0MwVjc5UERB?=
 =?utf-8?B?dlhRSVR4WjVmYnBkVmhDTlcwQ3J3c1J3WGFxamI4SUVSU2Vqc25xQXc1MWlp?=
 =?utf-8?B?RUNSc2c2dkpBdmRGbHRFc2NOY1g4YlJNdDM1RkRIdlBneWpSWnlUcTF3L0cy?=
 =?utf-8?B?N09oL1JEQ3ZrMWRMUFhIUmhDT2NwREhlZkRtSHlFTm16eFgranI2eGYzSXJr?=
 =?utf-8?B?OVltWHYrb0dUMGpWZ0ZvcllhMjVkQVBiYnZFNW1DNXovVGRUbmU4UXhEa3pH?=
 =?utf-8?B?T2xrUm5TRUVIWHQ5d0o0em1EVDlnODUrVmx3VXhzTTFmc0QxVVpBa25mUWZM?=
 =?utf-8?B?b21WUXZxMGVWU0VTcXVJZDFIRmRFSlZZbExwYThNQzRISStCb3c4V0k0SHNL?=
 =?utf-8?B?bDdTOFlBd1NXTGpKaTJRWlg5WHdsRElVQjBZZVhtR21xKzZpcUxpVFo1VWdY?=
 =?utf-8?B?aDd0V0lLY2hqclcwdGQzdzFVdFFadThmZk1qZkRyaEJKdDhsTnRpd0JsYVlp?=
 =?utf-8?B?cy9tbjdHOWRlSzI3eWFGOHhHSmFsSWdnM2Rndzc3QVUvMVVYdUNPeFhscEVQ?=
 =?utf-8?B?TSswYWptakFnTjRocXA4dGtUYVA5a1haOUhERlBpQUh0cHRXN21QU0x2bXBa?=
 =?utf-8?B?UEFBN3VxR2NqVDVXaWFLVEplVmZYaWxBMS9hL25pVUpBa29xSnJwdVJjMEZa?=
 =?utf-8?B?SDFMS2ZZaWRPS0MzeVpVU2U2cGxDY29jc2E1NTdVaFZWem1QZ2FoR05oWE96?=
 =?utf-8?B?a2RTVGtWSzI4WFBXRkUrVXdrdllTeHhXbTlSd2huQWpwaXBLcHNCNEM0Y2lz?=
 =?utf-8?B?ZjNZRlFRRHpRVXZMT1Z5dXNZZU5ISzl1UkdRanFkLzdyOVpBNlJTRURLVUs0?=
 =?utf-8?B?M1J4NU5Jc3R2M2F5UTl0czZ1MkdydTF6TkFyNFhCVk9QRmNMK3ErcXpxTzVa?=
 =?utf-8?B?R2NJT3RaZUtLbWZHS3hyQUl4eFM2dTNFSTFmalRqMGNYNk9RSkRYSEVzTVpJ?=
 =?utf-8?B?NUV1U3pXT3g3dUF3SmM0YUIwaTF4MWV2OUdtSGt2Q2lLRk5XaUdwSWorU25L?=
 =?utf-8?B?aDFHdU82RGh1OGNKTXBYZEFNNEFVUDVFbngxcFdNeng2dENwN0hDMFJvaTlw?=
 =?utf-8?B?K3JsM0xlQlZEbzVzb0Z0T0tMdlhxWEFLU1VsdXJ0K0docXMwK01MZm1OaVVl?=
 =?utf-8?B?bS85Mld6VkdoRnQ1ZldGdEt6MjhwVGxoTGVDSXBCK0txREd3dU4xYVdSTDhY?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9aa1e4-7949-43a7-a70c-08dbb36d1ece
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 08:49:05.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLrisqPqdT6NWRFTFtW5C5WCFqQ81qixZ0Tv1FEIloQx5evtO0bE0EwucKRMGRt7jg/sEl38rrMqYNorlvbAoip2Y0HObjSB71d2Pv6VbAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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


On 9/3/2023 7:06 PM, Sundaresan, Sujaritha wrote:
>
> On 9/2/2023 2:05 AM, Rodrigo Vivi wrote:
>> On Fri, Sep 01, 2023 at 05:45:44PM +0530, Sujaritha Sundaresan wrote:
>>> Add the following attribute to Xe sysfs
>>> - base_freq_factor
>>> - base_freq_factor.scale
>>> - base_freq_rp0
>>> - base_freq_rpn
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c    | 116 
>>> ++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
>>>   2 files changed, 135 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index c03bb58e7049..6a139d1dbf66 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> again, this has nothing to do with guc_pc.
>> We clearly need a new component to handle the frequency.
>
> Right. will look to define a new xe_freq component
>
> Thanks,
>
> Suja

Hi Rodrigo,

I've moved a lot of the frequency attributes I'm adding to a new file

with a new xe_freq component.

Does that work for this ?

Thanks,

Suja

>
>
>>
>>> @@ -20,6 +20,7 @@
>>>   #include "xe_map.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_pcode.h"
>>> +#include "xe_pcode_api.h"
>>>     #define MCHBAR_MIRROR_BASE_SNB    0x140000
>>>   @@ -37,6 +38,9 @@
>>>   #define GT_FREQUENCY_MULTIPLIER    50
>>>   #define GEN9_FREQ_SCALER    3
>>>   +#define U8_8_VAL_MASK           0xffff
>>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>>> +
>>>   /**
>>>    * DOC: GuC Power Conservation (PC)
>>>    *
>>> @@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
>>>       NULL
>>>   };
>>>   +static ssize_t freq_factor_scale_show(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      char *buff)
>>> +{
>>> +    return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>>> +}
>>> +
>>> +static ssize_t base_freq_factor_show(struct device *dev,
>>> +                     struct device_attribute *attr,
>>> +                     char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    val &= U8_8_VAL_MASK;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +
>>> +static ssize_t base_freq_factor_store(struct device *dev,
>>> +                      struct device_attribute *attr,
>>> +                      const char *buff, size_t count)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = kstrtou32(buff, 0, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    if (val > U8_8_VAL_MASK)
>>> +        return -EINVAL;
>>> +
>>> +    err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>>> +                PCODE_MBOX_DOMAIN_CHIPLET,
>>> +                PCODE_MBOX_DOMAIN_BASE, val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    return count;
>>> +}
>>> +static DEVICE_ATTR_RW(base_freq_factor);
>>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>>> +    __ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, 
>>> NULL);
>>> +
>>> +
>>> +static ssize_t base_freq_rp0_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(base_freq_rp0);
>>> +
>>> +static ssize_t base_freq_rpn_show(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct kobject *kobj = &dev->kobj;
>>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>>> +    u32 val;
>>> +    int err;
>>> +
>>> +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>>> +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
>>> +                PCODE_MBOX_DOMAIN_BASE, &val);
>>> +    if (err)
>>> +        return err;
>>> +
>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>> +    val *= GT_FREQUENCY_MULTIPLIER;
>>> +
>>> +    return sysfs_emit(buff, "%u\n", val);
>>> +}
>>> +static DEVICE_ATTR_RO(base_freq_rpn);
>>> +
>>> +static const struct attribute *pvc_perf_power_attrs[] = {
>>> +    &dev_attr_base_freq_factor.attr,
>>> +    &dev_attr_base_freq_factor_scale.attr,
>>> +    &dev_attr_base_freq_rp0.attr,
>>> +    &dev_attr_base_freq_rpn.attr,
>>> +    NULL
>>> +};
>>> +
>>>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>>>   {
>>>       struct xe_gt *gt = pc_to_gt(pc);
>>> @@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>>       if (err)
>>>           return err;
>>>   +    if (xe->info.platform == XE_PVC) {
>>> +        err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
>>> +        if (err)
>>> +            return err;
>>> +    }
>>> +
>>>       err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
>>>       if (err)
>>>           return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> index 837ff7c71280..da4114bfaa7a 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>> @@ -30,6 +30,25 @@
>>>   #define   PCODE_READ_MIN_FREQ_TABLE    0x9
>>>   #define   PCODE_FREQ_RING_RATIO_SHIFT    16
>>>   +#define   XEHP_PCODE_FREQUENCY_CONFIG            0x6e    /* xehp, 
>>> pvc */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0        0x0
>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN        0x1
>>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>>> +#define     PCODE_MBOX_DOMAIN_NONE            0x0
>>> +#define     PCODE_MBOX_DOMAIN_GT            0x1
>>> +#define     PCODE_MBOX_DOMAIN_HBM            0x2
>>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF            0x3
>>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER        0x4
>>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY        0x5
>>> +#define     PCODE_MBOX_DOMAIN_CHIPLET            0x6
>>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK        0x7
>>> +#define     PCODE_MBOX_DOMAIN_BASE            0x8
>>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET            0x67
>>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET            0x66
>>> +
>>>   /* PCODE Init */
>>>   #define   DGFX_PCODE_STATUS        0x7E
>>>   #define     DGFX_GET_INIT_STATUS    0x0
>>> -- 
>>> 2.25.1
>>>
