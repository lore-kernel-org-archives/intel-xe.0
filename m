Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07512C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416210E183;
	Tue,  7 Nov 2023 23:32:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324F10E182
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699399925; x=1730935925;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cdkmV2/H62p5BzY0rZEPQtWL2VCfEk+aj0q56HB5OQ=;
 b=Fu5iqLn2dhPOxj23n/Sw+c/yYH90B4DLDLqs+h3/7FODIr4zsUlWTHdn
 fWUchXUxD++mc/rjGKp7zrWeKe6hmrKlo1Pqiq+pKCNg7nsxaNMrJW86V
 IwkArHrTJIa9CgRrLoR85xQa/atiwMf1i9JElPdcT91Q0BW7dHsybATTR
 gCEX8VqTk4vHv+xCKyZ5OeNmn398A4TWv1FhlotWaiEWYvhUIF40J5QCf
 EWZGMjXntNG7nGbPf3a2xsx12OTxATe2A9TkU/N1Ij6fcXJaBNQA1mIX8
 4dL1vXHdx4YjjLa3Fr1CLbN1p3E78726eyc16pEWT6FXJFBAyjgZyJRdJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="392514711"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="392514711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="10998195"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:32:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:32:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:32:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuqsnR19WL3lZmHafA6CDBugrZtM0fcQZa7OT7jrj3nD8cZ3vVRVUDd5P1qYfT/UCzCYX7GAR4KvLsa2vi3pwv20t/FFDVIOVPQn5BrtEoDDCSTmitGRSURrX0nI7A11+L2CS8o2f3SYOcjmO7VME7jprhrg5iYLRC/ClGokS3b5M811Ah/xMYNqpAjPKM2DF6BCvhUTIxYEkgXLhf7snzJHjSvvfTzg0yubaOTkcu9Ci1Dvh95uRCbKOSlQkRN8YZDuNyx9A2s4MbMvBMTxEB81oWHU3cdQnFKuTjRkE8M6OMUR2pKSGfEpZxmkvOmDtCOSX218d8d2CfH7zw0fOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulzHwoh68ZlIe1VKiUhpqDfVlQO8ybDFHSmibwddSkE=;
 b=dQ/U33jQLpmthzgSCp71SVr3Q+EPQHU9pvd61oRuK8KcRq4nr1vdcA52/wquFI7GqNcYVxu7Hrc0B6LA2EnxUup9MMAidSRhO2IkA/nPn6QEiQZQRa31qzpUBi+H7XSumkeS4Ilb2PbxKko+xw5UeifrHbXpwODzQg8pO6e3zbHheSwALNTi3eeFoh9AVT+XmZbIZn2rUvb+GO62cvWQHGnJou6AeJmUNzOQLQOSvzqPSFBL1RnZwdymCXXengnLgK2t6XO0x4E18Z9UpX7JgcXrc1lYimFhXZgw69EvXTd9VHfdiM3xRM7bVSbFwG9XvHlrha/qPiKWh1Gi6oY9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 23:32:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 23:32:02 +0000
Message-ID: <b60165a0-923f-4ed2-a8b4-aeb3f7a0c87a@intel.com>
Date: Tue, 7 Nov 2023 15:32:00 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-5-daniele.ceraolospurio@intel.com>
 <db3df54c-47f7-4a8d-9ad3-9ddb2e1626a1@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <db3df54c-47f7-4a8d-9ad3-9ddb2e1626a1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d0e7ac6-c72e-4074-1f78-08dbdfe9be72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TibQuq1FJG2Ji8DDEycc3aRBHyObmnsqtI2nK5Nd+nOOBvfsW02Y+FKYVgHkY3b6BSeN/9XhMXHlHNBfZs6upr6fTwZdIvTWVPfaKaSC9zjA1U8WOIkRmpRmYS7kBQjZsm9T3wyoQOS4Jb18J7PZeR0NJEEBLbRZ7DHv3nWJAe0v1/Kfw6aQeva7Tb8GG6m2OeKIMgYWJg3NciEPopp0gsnAehosHbCv+wEVJdfMCapz5Y87oC1+XyOV7GHwLu/lfwTPx4Aaxu0GI82400MgQkxk5CjKHhTe1ZA//TzxOtWy4jEGwYtSC4yS0KNOjX1s0wlcLn5SwhsKfvhUjv7S8QzVZu4V9thkwl3q8odnLfCl5BV8PqR7oDP6yCSwH0qNuRCRxFNNXl0feKkhY1LXtoqQu1vo+E9nmHZB2+3M+GAA0nfNvLUGCheXPiNEo4XxH2IFfKaw8rWe1gURdG5yu87kHUqZba+VV6MpJ7TRlL2Ec6eB12b2dKV7BkP9BjN0jJie3X4iuBVSUZ/BhF4Kd+fi4leFJiTPS8TvmnWXPFH9w2JouXswgRdsmQROBneN0NsFjWfSHNMVswQKe2EkihQoYau+fGslpydYSzrjg3GX98wPxsaqb9TER9nTwTrXAq6M517Zzc8DNEDdJTgGQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82960400001)(107886003)(2616005)(66946007)(83380400001)(26005)(478600001)(6506007)(66556008)(6486002)(53546011)(6512007)(2906002)(8936002)(8676002)(316002)(4326008)(36756003)(41300700001)(5660300002)(38100700002)(31696002)(86362001)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2MzdWY2dE00S3BWR3JVWjBiaUJVTFlvdDV0ZXBLTGVMTG5ReVE3RzRSakNP?=
 =?utf-8?B?MXMyMG00UmJydFJzQ3d5RjJNQzh5azNtanliazlEWWRNc2hKVTFGWkFVRy9I?=
 =?utf-8?B?aXEwemI2RmxnTjRaVmwrMHBvdVdGY215OUZ6WTVaUENXZnBOb1Jkb1JCZmFK?=
 =?utf-8?B?eU5DNUxhUGk3VitUZU82eWdjNWZkVjRwUmFDNlVyVVV6TzdHTjJqS0NlcnBu?=
 =?utf-8?B?Z252UXQ1Z0tJS2hkVHYyK1dZYUNuMmFqaHMvN1BndklGRDZSckc0SGxIRi9P?=
 =?utf-8?B?U09jNzNYazJUSFBQdkFCWVBoWXBYQUhkSDFjSkhoR2pkQVVMQ2RPM3ZlcXBH?=
 =?utf-8?B?MDFhampQUFJpcTFDdWNVSGxUSUlvZkpKNnU2WFdldXVvTkJKVTNVakw0TGJX?=
 =?utf-8?B?bTA1RnN5Z2U4M1gzWXdTQ3pwMnY1Z3BxQVc5TkQrb044dE01SnJwUFVMMTZY?=
 =?utf-8?B?U0RaL2xNdS9PNzA1dmw2dGRnNnVOd0JIZ0pvc21MT2Rvcm9OblZnWG9vVGtT?=
 =?utf-8?B?d3cyR2tvRmhzanRRL1BoVmdZdnI2eDVTc1dPU1BnTWxjWmFWcldXOXc0c3NY?=
 =?utf-8?B?bm9SSXJ1UzNWSlhsdjNmSXpWR1Y5TXUzN3cvTDlTa2cwRlc5MDFVbzVwWFJv?=
 =?utf-8?B?dW03VzNsYlpJdDdEaWFBQU5tbkdkVUt3ZFV1aWZYZXVTMjlUMTNiQ1YvNlow?=
 =?utf-8?B?c1Ewcks5dC9tOWZwbmd6QU9KZk4rODdSVzBsVStLcWk0ckxXQ2NiOUkwdnlK?=
 =?utf-8?B?c29IM3BGK3ZEQ21XUmVwdWlyd1BnK3lIVmhLWnA2ZkNZUVEvRmRkWmZ0QU5x?=
 =?utf-8?B?NGVCcGI3K2d5YXZEendSMmFWM3NGeTRQWW4yOEpKSktDRFBsclBkUGpKeDdY?=
 =?utf-8?B?M0MrWUFoTUp1ZCtUSDY1emI2Y1VqanRRdmRvTy8zQ2dSR3lMZHNubWVaY0NH?=
 =?utf-8?B?cSsvS2ppSWZOVGpIODQ5dGwwT3RINkN5b0FmUnFCcG05UW96RVZhcEtxTU9J?=
 =?utf-8?B?UEw5MFZFWFlBRTk2em1UL1lvazU3STZNYXROV1ByNmdsa2FOSDZtazlwaXY4?=
 =?utf-8?B?Tys3a1oyU1MrN3JVdGtkeHVsNk5TZFFVSGtBeVpQbVlxeFhEdjJCakRtaE51?=
 =?utf-8?B?RWtSZm8rM2FndUFBdEtRMmFqSEg5Mm52dW9DMk8vVXRFZzdvdWlnS0RjS1Jw?=
 =?utf-8?B?ZkRNcEhTVkR2YTF3REJqNkFhVGIyNG9BSU5URnRHaDN4enVabDlURFA0eXNP?=
 =?utf-8?B?WjhrQlZHQUxFWlVJRy9ZdXhhc0xSd0RMazFnQzY4Z3RJTThSMDd6NW1MM20v?=
 =?utf-8?B?bGY0WjU1MnpHczBsbFlvamZpd1c4RlNZdkJqdGYzd0RRYVJOYUlEdTdraWkv?=
 =?utf-8?B?allST0xLdkdLR2hQYitjN0FsTFcxWml0KzRlWWZtOTJYdi9NcW1sZlJEbHpm?=
 =?utf-8?B?QitUQUZ5bTl6UTJpOGlXcmFkQThWSUtjSlMvNnVmMGpQeHBKYmlxb1dOTXBy?=
 =?utf-8?B?S01RZm9pd1JKbVhWSUNEZyswa3BydE5hbW1jMWk2ajdIK1R1b0crbjBuWWgr?=
 =?utf-8?B?dFRPUDBYWGtuL0VJV1R4STZtb0JLSjRrNFo1S0ljY2dXeVUwcU5Ra09ab2lT?=
 =?utf-8?B?WUw0Q1loTGc5c2xSOVVhM0tiMWo1OWlGSC94dE9mclBHdUJpczY4MDRBem9V?=
 =?utf-8?B?QkVaak1tYVYzL0FQVTk4amVTUFBFYVphRzhEUU5qMEg5b1NSVDlzNWI2S3hw?=
 =?utf-8?B?TWIybUl2MkgxL3h5ZjNqTzFsU0lqOGFRWWJUYVZJTmJlanBMUkV5STFDNFZo?=
 =?utf-8?B?UFBiUC9wbnVwTTljT24zd0kwVzR4ZE1oOEdOcURrY2preTNoQ0g1TThvZTF0?=
 =?utf-8?B?cnFrbHFpa25tMitxN1cyVnRLaEhMampDVTlxUUc4Tko3ZE1BU1RORm9lTVo2?=
 =?utf-8?B?TXdtUzBaV2hkSm5iMSs5b0h0N2tHSWNNVk02YlNSelFKT1RpdzdUMTZGNFR3?=
 =?utf-8?B?N2pxZ1NRWHk4enFwckZmTjBGdXdiY2RiSmdqMnpVZXVNQVQvM0xYQkRuSHlJ?=
 =?utf-8?B?OGlTWXZjVEpJUHQ1M21ReUFqQTdWSTcyQ1FMSW5tTS9GU2dhZjNzaWZDRVcz?=
 =?utf-8?B?SzlEYW0zZi9mRTBiUVlmNkNjOVBTRDlCTWF5TEZhemxFVXpud3Y1MVlFSVZD?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0e7ac6-c72e-4074-1f78-08dbdfe9be72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:32:01.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guEBQx1Bx/q8uQ/zdH7HeiER7nGX4Ni42lg7WbCyaBu7sBZMxtAtNSQc7+VPTK0easeZv/XxSBwY6FKNKqGtxF2OSyC1r/FGaZOU3++tvHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/12] drm/xe/gsc: Introduce GSC FW
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



On 11/7/2023 3:26 PM, John Harrison wrote:
>
>
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> Add the basic definitions and init function. Same as HuC, GSC is only
>> supported on the media GT on MTL and newer platforms.
>> Note that the GSC requires submission resources which can't be allocated
>> during init (because we don't have the hwconfig yet), so it can't be
>> marked as loadable at the end of the init function. The allocation of
>> those resources will come in the patch that makes use of them to load
>> the FW.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile         |  1 +
>>   drivers/gpu/drm/xe/xe_gsc.c         | 50 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gsc.h         | 13 ++++++++
>>   drivers/gpu/drm/xe/xe_gsc_types.h   | 19 +++++++++++
>>   drivers/gpu/drm/xe/xe_uc.c          |  9 ++++--
>>   drivers/gpu/drm/xe/xe_uc_fw.c       | 21 ++++++++++--
>>   drivers/gpu/drm/xe/xe_uc_fw.h       |  2 ++
>>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  5 +--
>>   drivers/gpu/drm/xe/xe_uc_types.h    |  3 ++
>>   9 files changed, 116 insertions(+), 7 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cee57681732d..474b6044d054 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -57,6 +57,7 @@ xe-y += xe_bb.o \
>>       xe_exec_queue.o \
>>       xe_force_wake.o \
>>       xe_ggtt.o \
>> +    xe_gsc.o \
>>       xe_gt.o \
>>       xe_gt_clock.o \
>>       xe_gt_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> new file mode 100644
>> index 000000000000..3f709577d73b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -0,0 +1,50 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "xe_gsc.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_uc_fw.h"
>> +
>> +static struct xe_gt *
>> +gsc_to_gt(struct xe_gsc *gsc)
>> +{
>> +    return container_of(gsc, struct xe_gt, uc.gsc);
>> +}
>> +
>> +int xe_gsc_init(struct xe_gsc *gsc)
>> +{
>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>> +    struct xe_tile *tile = gt_to_tile(gt);
>> +    int ret;
>> +
>> +    gsc->fw.type = XE_UC_FW_TYPE_GSC;
>> +
>> +    /* The GSC uC is only available on the media GT */
>> +    if (tile->media_gt && (gt != tile->media_gt)) {
>> +        xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
>> +        return 0;
>> +    }
>> +
>> +    /*
>> +     * GSC can be "not supported" where GuC is instead supported, so we
>> +     * don't want to fail if xe_uc_fw_init() returns an error due to 
>> that.
> Not following this comment. Can you explain more?

xe_uc_fw_init() is going to fail if the GSC FW is not defined for the 
platform. The uC switch is global for all FWs, so either all FW init 
functions are called or none of them; since we do have to handle the 
case where GuC is supported and GSC is not, xe_gsc_init() needs to not 
fail in that scenario. We do still have to call xe_uc_fw_init() as 
that's where the FW selection is (and therefore where we find out if it 
is defined or not), so the solution is to check the enablement status 
first before checking the return code.

>
>> +     * To avoid this problem, check the FW status before the return 
>> code.
>> +     */
>> +    ret = xe_uc_fw_init(&gsc->fw);
>> +    if (!xe_uc_fw_is_enabled(&gsc->fw))
>> +        return 0;
>> +    else if (ret)
>> +        goto out;
>> +
>> +    return 0;
>> +
>> +out:
>> +    xe_gt_err(gt, "GSC init failed with %d", ret);
>> +    return ret;
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
>> new file mode 100644
>> index 000000000000..baa7f21f4204
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GSC_H_
>> +#define _XE_GSC_H_
>> +
>> +#include "xe_gsc_types.h"
>> +
>> +int xe_gsc_init(struct xe_gsc *gsc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h 
>> b/drivers/gpu/drm/xe/xe_gsc_types.h
>> new file mode 100644
>> index 000000000000..135f156e3736
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GSC_TYPES_H_
>> +#define _XE_GSC_TYPES_H_
>> +
>> +#include "xe_uc_fw_types.h"
>> +
>> +/**
>> + * struct xe_gsc - GSC
>> + */
>> +struct xe_gsc {
>> +    /** @fw: Generic uC firmware management */
>> +    struct xe_uc_fw fw;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 784f53c5f282..b67154c78dff 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_uc.h"
>>     #include "xe_device.h"
>> +#include "xe_gsc.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_pc.h"
>> @@ -32,8 +33,8 @@ int xe_uc_init(struct xe_uc *uc)
>>       int ret;
>>         /*
>> -     * We call the GuC/HuC init functions even if GuC submission is 
>> off to
>> -     * correctly move our tracking of the FW state to "disabled".
>> +     * We call the GuC/HuC/GSC init functions even if GuC submission 
>> is off
>> +     * to correctly move our tracking of the FW state to "disabled".
>>        */
>>         ret = xe_guc_init(&uc->guc);
>> @@ -44,6 +45,10 @@ int xe_uc_init(struct xe_uc *uc)
>>       if (ret)
>>           goto err;
>>   +    ret = xe_gsc_init(&uc->gsc);
>> +    if (ret)
>> +        goto err;
>> +
>>       if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>           return 0;
>>   diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 1f7dac394a1d..af3e5cba606f 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -158,11 +158,18 @@ XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>>   static struct xe_gt *
>>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
>>   {
>> -    if (type == XE_UC_FW_TYPE_GUC)
>> +    XE_WARN_ON(type >= XE_UC_FW_NUM_TYPES);
>> +
>> +    switch (type) {
>> +    case XE_UC_FW_TYPE_GUC:
>>           return container_of(uc_fw, struct xe_gt, uc.guc.fw);
>> +    case XE_UC_FW_TYPE_HUC:
>> +        return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>> +    case XE_UC_FW_TYPE_GSC:
>> +        return container_of(uc_fw, struct xe_gt, uc.gsc.fw);
>> +    }
>>   -    XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
>> -    return container_of(uc_fw, struct xe_gt, uc.huc.fw);
>> +    return NULL;
>>   }
>>     static struct xe_gt *uc_fw_to_gt(struct xe_uc_fw *uc_fw)
>> @@ -197,6 +204,14 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>> xe_uc_fw *uc_fw)
>>       u32 count;
>>       int i;
>>   +    /*
>> +     * GSC FW support is still not fully in place, so we're not 
>> defining
>> +     * the FW blob yet because we don't want the driver to attempt 
>> to load
>> +     * it until we're ready for it.
>> +     */
>> +    if (uc_fw->type == XE_UC_FW_TYPE_GSC)
>> +        return;
>> +
>>       xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>>       entries = blobs_all[uc_fw->type].entries;
>>       count = blobs_all[uc_fw->type].count;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>> index 1d1a0c156cdf..d4682b0276e2 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum 
>> xe_uc_fw_type type)
>>           return "GuC";
>>       case XE_UC_FW_TYPE_HUC:
>>           return "HuC";
>> +    case XE_UC_FW_TYPE_GSC:
>> +        return "GSC";
>>       }
>>       return "uC";
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index e4774c560e67..239256bfdb07 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -55,9 +55,10 @@ enum xe_uc_fw_status {
>>     enum xe_uc_fw_type {
>>       XE_UC_FW_TYPE_GUC = 0,
>> -    XE_UC_FW_TYPE_HUC
>> +    XE_UC_FW_TYPE_HUC,
>> +    XE_UC_FW_TYPE_GSC
>>   };
>> -#define XE_UC_FW_NUM_TYPES 2
>> +#define XE_UC_FW_NUM_TYPES 3
> Why is this not just a sentinel entry of the enum?

No idea, I'm just updating the value. It is the same in i915.

Daniele

>
> John.
>
>>     /**
>>    * struct xe_uc_fw_version - Version for XE micro controller firmware
>> diff --git a/drivers/gpu/drm/xe/xe_uc_types.h 
>> b/drivers/gpu/drm/xe/xe_uc_types.h
>> index 49bef6498b85..9924e4484866 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_types.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _XE_UC_TYPES_H_
>>   #define _XE_UC_TYPES_H_
>>   +#include "xe_gsc_types.h"
>>   #include "xe_guc_types.h"
>>   #include "xe_huc_types.h"
>>   #include "xe_wopcm_types.h"
>> @@ -18,6 +19,8 @@ struct xe_uc {
>>       struct xe_guc guc;
>>       /** @huc: HuC */
>>       struct xe_huc huc;
>> +    /** @gsc: Graphics Security Controller */
>> +    struct xe_gsc gsc;
>>       /** @wopcm: WOPCM */
>>       struct xe_wopcm wopcm;
>>   };
>

