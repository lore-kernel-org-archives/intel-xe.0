Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC9C04A94
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 11:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097E689EF7;
	Wed,  9 Aug 2023 11:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD289D8E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691581213; x=1723117213;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZcCJPW0SjdZGRgWP4YzR0RKlEECR8rmzOQPPP5tdo4=;
 b=dHZ479KQkFXzpK5hm+vdwIU6KrUpvaMyQNpLefB15StQdefMS13KhctT
 GWjXjk6mopkqp2y9P1RFsTorV+PaYIu92MyJ+L7M/8NKZM4+D4+y7LLjh
 rIs8E5Qw8v5qwj3FI8CY7GZ88egI4pf56+Woz3hQIeiCyA6ZEa4QsH5Pv
 R6U7UjvkeKz2o7T6vz20GMeobYEjAb1LF8yp/kPYA2o8L+nixAPbiFHhA
 KYkmVfXbnceFDyoE5QOnmAj8tiChBE6ywXCURmDTNPmNRRflgkt+370DL
 zJ6neJuh1cG66cOOH9DLJlRPJF84kWXdZ2seMe2TqOpVb4R1SaLMEGODP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361226395"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361226395"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 04:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062431371"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062431371"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 04:40:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 04:40:12 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 04:40:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 04:40:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 04:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq51BunLO5tOp85C4PEtGmvVPKWPpyAz9EcWBm5Oa4ZwVQ3Z8QUSZ5tNCE5KuzRseF+kXeeRo8GwfLpduOEvrTltgLDBqYyDxYOG4hkmqvd6Ed9JMnc3J3eM8BH6mz4rVSZ6Tu4w36b0xLTMYvqBERPWyxb0baZSS6tW5xbfaBz/TXzrhSTGdawWD6SjEbzX4RxXD+nrIUqEEpDlmSPo6mlAbSZ/vrbZ9uQXnoFBTeHaDywwlkh4JZtguApELwlHyTXcyQwBqs0zWPlnH4Y39bI+GIyCfbladhfHCludfSIGBF4lahd2Ag+8joznJ1dqtyS6izaDgz+BZj1Y/5HjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49QZprhK04/LOMCHLFTVY/PJQOD8ar7nNxWAAdolIlE=;
 b=LQo707bb+68x0YpgFxhOQy13NUX84LuaATB3oE0XEgtZXTVIkGnNrcn/t4FdcKidPLgUyWRgX7KMB4Pl8P2YJbLNt+bv5Z+DYqYo6KpEYV3XPVAFjMwQEoAxfjnMb6o2ESn1OKq8ySGjBmyMTZgr3VPNOKr08cTN685L3GID3W2xi4Fs5LTcbpUyvzl/JIgisuRzc0eLzRsyOMLwqBeJOfVnRM/GiVrwVF9iVM1j//g5ZdSBOM5KtncbkS6WCtPqRF6QcTw7r2f3H41Vzm6zm+4BKiSiqPKuZKHGGk4fu2eGxOW1363rBpRN2bhFkgqr65cj5Xk+KVHxh2sZZld8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 11:40:10 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 11:40:10 +0000
Message-ID: <714a0c1f-cf09-b102-045e-ef6ffbc29d66@intel.com>
Date: Wed, 9 Aug 2023 17:09:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <b557820a-39b8-edc7-844d-900c3a9eb7df@intel.com>
In-Reply-To: <b557820a-39b8-edc7-844d-900c3a9eb7df@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: d60a05ad-37b5-4696-f7b0-08db98cd62c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9dkNmBh0LA6M0I753x6dSd/ieLS1qXeO2uy7tJbXL0zE+86c9+Gz0tq74XudIGOoJkiSUzSEZaw9lTIwhnFx0QowPwcJe4MLqr/HRy02P8jFmV4QKVCrQvIaSIQUiEkFIiTjlxtP8sS1l6ecjb32IGbuymLWGpgpRjsjh2dFELjI44k/iB0YKEo8RyT+7CnTKU7dS2eOPSCs18hSX81ljaqzp7eC++DHtYWwR1vwSeHoem9B1CZ01oYCtZeuMOW5l5m+9rjcSV533RMRh21EKvHzmrSx2g9RdkeZOladH3rvSZo/5kPo1COnANy8SYlt5XEQiWiYZ/q7gRW7XlGFYYPqp4Pv1jrmE5CnmRUSWgiPNr2DapGdmCOwHCHbmRCd26xJT/KKtL5OwaNHNrtNdLk+PcJ9IIwtoVmkSpM/jJlNP6xTjj6nNSlCUZboloNU8s4viVAPSEqK/8akNea2vHDYWKv6jqN/pPWH/sXohW/K98pEhpHdX9UZLUgaSKxiz7oJ65CU3D+tRei59+Ug6OYp0q5IXcQ+CfiKJ6WGljr15DfMcgAlP3gXpkYLz3RlARjTfu2/yyUcbqpym25VvrL6kJRzS7Nz2knRrpnhCaUhJzx79cdPDOUDTD+VpQRHqJYPSnVrkVr6sP7Gz86NPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(39860400002)(346002)(376002)(1800799006)(186006)(451199021)(83380400001)(316002)(66556008)(66476007)(6862004)(4326008)(53546011)(6506007)(41300700001)(66946007)(38100700002)(6636002)(6666004)(5660300002)(26005)(8676002)(8936002)(6486002)(6512007)(107886003)(478600001)(37006003)(86362001)(54906003)(31696002)(36756003)(82960400001)(2616005)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWdPM2RuQmpyZy9iaDROM25UNGFxK1FZd1hIZ1M4OXBXWERmQjV2UlIveTh0?=
 =?utf-8?B?dDhEU1RqUkZSZ3JNUFJJSzA5TlRWRWZOSll5MFF3RFRYME5qTHhhS1kyMkpt?=
 =?utf-8?B?L1c2M2JUeUdzUU5NTVVyZC8yRlBVZEh3TVN6blhQbmViWmw3NmYyU2JrZzd4?=
 =?utf-8?B?ck1OYjZFTDQvU2RsaXlWMWtsUExoNFRHeUwzRzVjN0dKZ0xNbWRmR0NURTdY?=
 =?utf-8?B?SDBoWWJjakpGV2JKZ3ptemdEZmJHenlQWTJ2dXVES0kvOUJGY2xIUDFnajVa?=
 =?utf-8?B?a09QcHFucWlDdGVmT3RkTlJDMjZVR1RoN25LTWZYZjZRbEgvSTk3bzRKNGov?=
 =?utf-8?B?aGhGWXlXd0kxLzhhOGo5UjdRYXFtTGdmVjVDMnVmUjdLdVpZVE94OWVhOVJj?=
 =?utf-8?B?Mlh5V0EwRjlkZkNrNm1HTEpqVFlyUXFsNFBtWWlUUnlrTzRZU21xakVpNWRX?=
 =?utf-8?B?TDJUWnJlYmVLOUZCb2xwUEhxMUQ4NTVCeHY1b1VqcWNxU0VMKyt6M2J5eHJH?=
 =?utf-8?B?WTRwY0thaXB0dmVTSzV5dnp1UnRZdmlIUno2M2xPQ294ZklCUyt6U2pVZ3ds?=
 =?utf-8?B?M3JuNHJpQkxkSElGaThoS3p1VXkrR1NjaHROMFcxb1pQbkdhN1JUZjkzUUFx?=
 =?utf-8?B?U3VtNXFScmlJVmJrSTlDQTQ2NDRnOE8wbzVGSm9DTklKNG5LUThuYjVTTitI?=
 =?utf-8?B?TmlRK3h1NHJ6NGI1ZVRwNmVReG1hUWFtbjBheE5WMGFDSmluN0VjcjdZeng5?=
 =?utf-8?B?eXNHMFZBbXNTRU5ydTlSa1RGUUNxZ2I0cXA2STBOWHJwTDRlWTROQnFramtq?=
 =?utf-8?B?ZDdyTWZtZzFFdmxXNDFoRGNVNjJDRHZBellpVytjeCtvTVFtZ25aYUtKT2NE?=
 =?utf-8?B?dmh0d20reHNYekZ3blBJMGNCOHh2WGVUSzl1NERSeWlaUmFtMzh4UUx1ZlhU?=
 =?utf-8?B?cXZrYm5INVQxWTdQSHRMWmF0Z1hmbWUvVnVGRFhjNDA5T0ZucEV5VmNoeEVp?=
 =?utf-8?B?cCtrelVBb29KWWJKdHhFZ1VVemNib2hETFgvTWNFVUJQMjNWaEhzNzhxR2ps?=
 =?utf-8?B?MThVSTJkUysyME1tRjNGVElmRWdoNlIvNCs1b01OekVON0x5WjJGNEdBU01q?=
 =?utf-8?B?aTRCdUJ3QjhlM2VPTm9yUGdSalVyQmxpYXAwL3d0OFcxVmp2cWFRSzZlVDBI?=
 =?utf-8?B?bzNxckdwMnZLa0tORDBqNlVlUDM0Q1NpbzNDUXRxRGsxNGRRM0N4ZWdLMXNB?=
 =?utf-8?B?dEFwRlRXeVhtT0tFd3phNjE3Q1ZXSkZQS2l3cDF2dUt6WjJJeVlxM0RqazFt?=
 =?utf-8?B?OVh3ZHNjc0pud0tidnFKYU1vM0U3bWsxS2lNY2REbkRvT0Z3ZURhOVY5NERh?=
 =?utf-8?B?NlVlSm9vWjRNeThYT1kwd3RuNERxcFBINVkrbEZaSlBXbUNBUUM5bVVOSWgv?=
 =?utf-8?B?TDUvVTZVSUxReVlmU2w2RnJMNEdBQyttK3pOMUladXM1R1M5c3hYQ3RjWDN6?=
 =?utf-8?B?UzJUSkdKTGJ3SVFGc0d5UkhyOXBQSW9wVExiWnRCMFFaY0p3UktHbVV4d3B3?=
 =?utf-8?B?emVFejJaaXU4c3BrOW1heHNicE1XcFYyMVF1STRIZGpzL1J4MU1HRGt2bDAz?=
 =?utf-8?B?QnhnUWF3OHI4RXY0cENwcitQNDNrK2xMaVpQR2dEOUxGTHgrVTl4L0kzTFZt?=
 =?utf-8?B?S2dUT0JjbDU4Y3BaeUpORHYvbnA2TTdmTXJJSGpzWDEzcVkyR1ZSeVFOL0Fq?=
 =?utf-8?B?L01MMW9keCtjb21LRTdqUVQ4eGp5RnEzRmR4NkovSmVPYU9hMlBDY0ZKcWV1?=
 =?utf-8?B?QVowRVhZb21aUzNNN2k0Zzc3eWJ3S0FaSlNqL0REVHoreWtDaFJpSmRxUjVR?=
 =?utf-8?B?R1h3UkowN1VTZVZKd1puQk96bGljMDVlME9aWVkrS0JjMzVnSnFPQ1o5UHA3?=
 =?utf-8?B?T0pPM2doZ3BuSmo1eVkxZXByNHdhOUlRTElqT0d0UEo1cngwdDFTWVdob0s5?=
 =?utf-8?B?VjV6U29SVjcxaW5UMGJ1TUhpQ2dpN2ZMK1FRcVE2RDR4YnV5SWtkalA2dWM4?=
 =?utf-8?B?MXBoTU9KWmhyWnN4Q0NsWW9xT3gzTyt5d3NJUXIzNTEwblNRZGRSckEvL2d1?=
 =?utf-8?B?Uys5dThLZU45VmxIa1dmOUF5eGFDb3hrc2Q3d1Q5dGI1STRNa3M4RU5XWXVX?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d60a05ad-37b5-4696-f7b0-08db98cd62c8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 11:40:10.0697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11zF+q0zv65eBYlEMZGaBcJMxfaBYv6TKy7N3Zmn3bPMQQ3+3PLaVnZ9yeMowXZOCKZNatwPBGW2awoYwhyZgCRB7FyvNvLHugHVhuU2/Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-08-2023 13:16, Iddamsetty, Aravind wrote:
> 
> 
> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
> 
> Hi Ashutosh,
> 
>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>
>>
>> Hi Aravind,
>>
>> Spotted a few remaining things. See if it's possible to fix these up and
>> send another version.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> new file mode 100644
>>> index 000000000000..9637f8283641
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -0,0 +1,673 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +

<snip>
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>> new file mode 100644
>>> index 000000000000..a950c892e364
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>> @@ -0,0 +1,76 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_PMU_TYPES_H_
>>> +#define _XE_PMU_TYPES_H_
>>> +
>>> +#include <linux/perf_event.h>
>>> +#include <linux/spinlock_types.h>
>>> +#include <uapi/drm/xe_drm.h>
>>> +
>>> +enum {
>>> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
>>> +	__XE_SAMPLE_COPY_GROUP_BUSY,
>>> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
>>> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>> +	__XE_NUM_PMU_SAMPLERS
>>> +};
>>> +
>>> +#define XE_MAX_GT_PER_TILE 2
>>> +
>>> +struct xe_pmu {
>>> +	/**
>>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>>> +	 */
>>> +	struct {
>>> +		struct hlist_node node;
>>> +		unsigned int cpu;
>>> +	} cpuhp;
>>> +	/**
>>> +	 * @base: PMU base.
>>> +	 */
>>> +	struct pmu base;
>>> +	/**
>>> +	 * @closed: xe is unregistering.
>>> +	 */
>>> +	bool closed;
>>> +	/**
>>> +	 * @name: Name as registered with perf core.
>>> +	 */
>>> +	const char *name;
>>> +	/**
>>> +	 * @lock: Lock protecting enable mask and ref count handling.
>>> +	 */
>>> +	spinlock_t lock;
>>> +	/**
>>> +	 * @sample: Current and previous (raw) counters.
>>> +	 *
>>> +	 * These counters are updated when the device is awake.
>>> +	 *
>>> +	 */
>>> +	u64 sample[XE_MAX_GT_PER_TILE][__XE_NUM_PMU_SAMPLERS];
>>
>> s/XE_MAX_GT_PER_TILE/XE_MAX_GT/ since the PMU is for the entire device not
>> per tile, as I mentioned earlier.
> 
> right, so for a device this shall be sample[XE_MAX_TILES_PER_DEVICE *
> XE_MAX_GT_PER_TILE][__XE_NUM_PMU_SAMPLERS]

on further checking based on (d714e2b698d8 drm/xe: Introduce xe_tile)
the XE_MAX_TILES_PER_DEVICE is being considered as MAX_GT as well so
will use similar to that here.

Thanks,
Aravind.
> 
> Thanks,
> Aravind.
> 
>>
>> Thanks.
>> --
>> Ashutosh
