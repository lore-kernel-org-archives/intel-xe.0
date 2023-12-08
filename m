Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9EDC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDEF10E9D6;
	Fri,  8 Dec 2023 07:18:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9911A10E9D6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702019891; x=1733555891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NS2R55/oAg1NxbjUYf11/TWKG3aHjwsSi3+S6xNQX8c=;
 b=U3shtoa5eRPXoLKaLrlL1o6cilTzkxf95AA9O75zHo9dYt7H3yuMpD+R
 +T4JphGw0m5KHkBJp409fnKhDsAkqklH9z/JyjYDaMBULzvzvI2DBe+WV
 s3x7RVDFVV1OYO7Z6ZEYtzyZEWkQiwCUo+gS/PdR38HtdyUMUcIkCLqyW
 u4igLCwUpywN8WLlMyBZGFBDPINemkB9XfHbjV8caVkS1FhM7pUKFJ4Ee
 XfoUauu4NdBGF6fbgYBxNWxmn7RNZ9ItH4D88bDDnKferTzS4xFelA6ZL
 xckPLzYjrUL10Ju2ys4S0zpBkxsz31HR3yNhmgICF8Yo+RsuPMQvN4D+i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398237718"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="398237718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103469657"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="1103469657"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 23:18:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 23:18:09 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 23:18:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 23:18:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 23:18:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS40b5VA+fvipDq9eLnq2q5K3e56tXntXcFoLthFrMx5tySA9qeTkRepEJ4nwFYDuaNUYpJGr44/mviioy468gyP1sYMmNhWOKWLpdNKr4AWIJrK67rJ75yFOyvpZjhimtnN2L7v8auEkGEJa6i9ZSfnK+nFgq2UyqeLq0T/7pIEUGvQD6REvhQs9k367LfLwky8yC+4Ldt3XpFUJkPrFUV1M9ZrnHul5wI5TxddzRAsP84h3TZnJYzVgp2n7O7RLH/QFg4MqE4tQ+dr3ceCw3DoUO9X0xletKxw477rB1OSaEh3ndk+Cg4+k7ktiHMtPydcovEHVn9nCUaYyEKWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsLjNEB65uyK3aBQfl0V0miRnPFYkyRqMUeUNkMI4vg=;
 b=h+m0TY085L5Ks+RyTm1tjqdIft53fw1rqJF34X2ELHWk/s4baXApsrofUKaYWXc+b3CNlJBL+UYqAQrENce0kuDetnD18nxbM8WdRqhIEIgsIb97FvztWLTzQh3jBNSScXKzQxGdHOGb+1ysHo+JwW8R0zBoT9Xz5VBoJK/h0R4ixUPzYoMMFLcxERoswgV/1KnFcj+EVWQ6xRqx15PV9qaQiXiTBGoOb6Mug1HjFvM0VPuqy6HVeHqfPOUyq408f6VL5o8M+s+0OFaMUa34k6nkY6/g34vJPVlHiPUDUhOmi1KeRdkKCN8evuHJfM+35myfnYxp//U7bTObSBul3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Fri, 8 Dec 2023 07:18:02 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 07:18:02 +0000
Message-ID: <23b21834-61e1-4926-9e1b-8b233771e1b5@intel.com>
Date: Fri, 8 Dec 2023 12:47:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/dgfx: Block rpm for active mmap mappings
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
 <20231206133421.3295163-2-badal.nilawar@intel.com>
 <c3e2e04f-7cb3-4d68-b19a-5c7271a0c626@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <c3e2e04f-7cb3-4d68-b19a-5c7271a0c626@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 845343b5-2a69-4288-7ae4-08dbf7bdd071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhqzYGzoy0pgdhqGweQgwnZ+XpuvbjjkwVRc35SO10Z88VB6tIpZuZIrHYD77blfNuLX30l6EDamfntmefnyaVZgfpiawhEbHKrSFd3n/wKIcxGQ+K97/uGNnWrN1+w0LDe1bk5Igy6HRyXUCZunVQpBDXO6moZCbWujtSjICKQPbBgrSvi3L0PrlmuTD7dNFAWDFFORsduTHf3qHwVDpLnOIc7m/UtsUwhRJfDOF8g620MLIkm3y2qr9mSs47Zdksg4WlIN92Oo7wxwbBYzB57tg47mWJ1FjwHsEo1sdyquKwEzzRuvQwEWNIGN5Jyu1TnRBGel/4X4IFLqx2jMt4be0PzkdsmNHYppRnfwan8uXs66LQwmrVxZSV+Z+xf7DMOhrLDo5j60AV+GYe7g8nUZXwe7gDyleYU1zbVokHUBdyM8tjz9k6T/x3J4y0uRRlCsjVTJvjCV6ThNE8mPDcltsyJeWvth5Xg7kXvYZ6lZ5kgRy4jC1ypY/9qJUfuXs9H4u9g54fYbcMCcu7O6DFR0gMDoMlHsnYqOwvODeOxZr7vYCFnpN8gMI4m4VMM6a5DSUoOmbLY4kccOWrJXzSapnEdSv825qEhY0Gz2ZcwMgR5Xsr9yE5ziWoq+qEKbpPz2rh8kUW66pjOBZRVL+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(107886003)(26005)(2616005)(53546011)(66946007)(8936002)(66476007)(41300700001)(83380400001)(6506007)(2906002)(6512007)(8676002)(316002)(4326008)(66556008)(6666004)(478600001)(82960400001)(5660300002)(86362001)(31696002)(6486002)(36756003)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmJTR2llcmdzL3BhSE1NY3hZZ0t2a0haN05OSllCQ29NeWRsL0VhU3piT3BX?=
 =?utf-8?B?RndGeURNWnQzUmE1WTVaSEJMMmNhZmlOTlZCSitWZ1A2RDRKRm5XY2ZDcDBW?=
 =?utf-8?B?VUlxM09rTHBkRnJKNXJOS1RXcDhGRU5tUGhkZ1J2WVl0REkwc2dPSUtJbU83?=
 =?utf-8?B?Q3JzUGVETXkydTJrWGplcDdadEcxMUZyWlBiMnNES1NLYXhIeWJ3OXdjTm5W?=
 =?utf-8?B?aEE2UnpkUk5XQllmMDRwRVZoRjBDNzdHemsxV0QyT3E2SURRbWgrVlZod2VH?=
 =?utf-8?B?UGFKNDdNSzZRd01sOTV4YnFYc2hVYmNPWW1jSXRQenc4ZW9VdytwV2Y0Rndp?=
 =?utf-8?B?amo0RWM4d3N3cjlXc1IzQTczZ09EcHBMMGJ2Yys1dWZLankvNGFINVZoamhX?=
 =?utf-8?B?NUZ2SEJIZjJSb1ZzUkROV2JodWtQazRZNmpod2tiV0N4bEpEelk0cXNnU3dY?=
 =?utf-8?B?ZHlEdFA3ek1TWkg2VjdYbURqa1ROTUtETnhCNlljcm83Y1plNnI4NlNYdDhO?=
 =?utf-8?B?S0ZIcDgzaWNGU0FOL0NJUWhRTEplY09FZWY4QWlIcjI0UkUzSFAyeVozMXl5?=
 =?utf-8?B?cDkxdlhOWWVDTmJndFBCQ3U0eEcvenJYTEVra0JySThreSt1Y3ZpTVliWE9y?=
 =?utf-8?B?MFlzekZXUjhKQi9KanhCUzNGUm9RS0VyY3p1R2xISkwvcVpFeHczc3JSY2Nj?=
 =?utf-8?B?ZzRrOTZGY2RySHFTOHJXeDVnMVJTMGV2Y3BraUkxcWNidGNFOTVCcTBRZTNr?=
 =?utf-8?B?Yi8zLzdScGJYRldDOXhrYXl5eDVqY25ISG1VdCt6WlppUUc5OWJ6NVlpbnlX?=
 =?utf-8?B?Z2xiUnBKVGJ4ejJXaW8vMFppTlVhazFaNEg1aWt0dEF5UU03NkxsMFF5dFVU?=
 =?utf-8?B?bWl4aUloMXYwQ3VsSmpSclE3RGR2eDhzcFAyL2I3dGNIbHRaNkk2SytiSjdO?=
 =?utf-8?B?bXc5THNYU3gxRFVMeTk5VlZhZ1ZOQjJ1dWVheGZYTWVnWGduNmp6VzFFL3Uw?=
 =?utf-8?B?bUNQNHVyckxzR24wOUlDZkplWkM1Y3lPQWxKZEVMeXovaDIxV01jK0RGMExY?=
 =?utf-8?B?SnFGOXo5T0JmOGVGM09KbFdyQ0VGampha3FjYUVvN3N1VWRmUUVkUGVUWmRX?=
 =?utf-8?B?ZHNMaGtIL0dsRE9LaEQ5VUpUeEYxd1kvcG1iZjFNWnVTWWhKYlN5TVExdE0w?=
 =?utf-8?B?MHU3SWZZMkZmUkZwclVHODBSL0VhdXRiM3UrT1RSZ2JIOGV3eUFxK3p5WE9s?=
 =?utf-8?B?Q05hbjVYS3VuL0xVUG52T2JsQUxqWGJRQ0FZZDFnb1lIa3ZWQStIT2ZFNTJI?=
 =?utf-8?B?YkNjMlNwdGRHclZpbjdMYnJ1Q08raTFYRUVUbjNYakxRcGhtOVd1M0dvS3ph?=
 =?utf-8?B?L1oyeVc0QitBOElTcmlMM0lFR0h6M0E5MW5xbHFuSUp6ajFPdDdpM3dkN2VX?=
 =?utf-8?B?RElkT2FUNzN1MUM0dW9Bak9OVzkwdit2Wi9OSHBkOWlnbklTeGZ4T3JBbjVC?=
 =?utf-8?B?SnFzWTFQOFBTdG5sQTNQdHZRYlB4elZ6eHFYRk5sdkdmNEZlZFdGNXA5TUg4?=
 =?utf-8?B?VnUwN1FVLzJFRWZMVXFzOEJQSkFKa2tLK055cDg2d3BBNUo1ZmV3dHRCMWNF?=
 =?utf-8?B?elRjbXFZcG4wMUZaVXNHbVlZQ3l5QXpmZ0JQVmVkUGM2U3NSNXU5UEk4QVBG?=
 =?utf-8?B?R0ZPcWZQM2FJYUd1d2wvMGlYUGVxbGxCbW9mZldNazlJRW9ibkR4bHB0dThB?=
 =?utf-8?B?UTJqR1RvZkl0M1dJZmFUQnhCV1VHVnNKRjNJSHZCWnhhZkU5MlU0VHIra3dG?=
 =?utf-8?B?ZFV6N0N6TUNjcVh3Q1dVQ0MwdXpzY1MzT0xnOXptRXNNb0t2MFZpN1BWcERw?=
 =?utf-8?B?MjVIYk1CUTVjV2pXazhnNEp1ZlZxcGw0YlVuYmMyeGlvS3RTNERmK0ZPWHF3?=
 =?utf-8?B?YmU5TWNzUWtlR09nSTVibXlmZkJ4dGwvWE10eG1NOXpTMnJaemwrQ3JRV1Bq?=
 =?utf-8?B?SUxhS0U2V2JzMHp1RDlKMEZWT2RJMXZJVGFMek5nSzhwQm1BQW9YblBZbmQ5?=
 =?utf-8?B?TkUrQ1pwbHRYTEp2L0NpT1FIQnZpTkhha00vZVRVcEZNa0x2MUtZZlRwOHBM?=
 =?utf-8?B?ZVZaNjdKV09xanNzKzFhUENRUUsyRmxNWVd4SVBVNEZuUXhpRDY3WVlZcHVi?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 845343b5-2a69-4288-7ae4-08dbf7bdd071
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 07:18:02.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZoXNH27lVp/LfSQkL75vUI1AxfyGJOelhoGt7jymlGQ1kV31UOhZ1hY5GTQB7LbH3it8fvoN9PuH5o1qtE97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-12-2023 16:56, Matthew Auld wrote:
> On 06/12/2023 13:34, Badal Nilawar wrote:
>> Block rpm for discrete cards when mmap mappings are active.
>> Ideally rpm wake ref should be taken in vm_open call and put in vm_close
>> call but it is seen that vm_open doesn't get called for xe_gem_vm_ops.
>> Therefore rpm wake ref is being get in xe_drm_gem_ttm_mmap and put
>> in vm_close.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 35 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 72dc4a4eed4e..5741948a2a51 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/ttm/ttm_tt.h>
>>   #include <drm/xe_drm.h>
>> +#include "i915_drv.h"
> 
> Do we need this?
This is needed in patch 2 I will remove from this patch.
> 
>>   #include "xe_device.h"
>>   #include "xe_dma_buf.h"
>>   #include "xe_drm_client.h"
>> @@ -1158,17 +1159,47 @@ static vm_fault_t xe_gem_fault(struct vm_fault 
>> *vmf)
>>       return ret;
>>   }
>> +static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
>> +{
>> +    struct ttm_buffer_object *tbo = vma->vm_private_data;
>> +    struct drm_device *ddev = tbo->base.dev;
>> +    struct xe_device *xe = to_xe_device(ddev);
>> +
>> +    ttm_bo_vm_close(vma);
>> +
>> +    if (tbo->resource->bus.is_iomem)
>> +        xe_device_mem_access_put(xe);
>> +}
>> +
>>   static const struct vm_operations_struct xe_gem_vm_ops = {
>>       .fault = xe_gem_fault,
>>       .open = ttm_bo_vm_open,
>> -    .close = ttm_bo_vm_close,
>> +    .close = xe_ttm_bo_vm_close,
>>       .access = ttm_bo_vm_access
>>   };
>> +int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
>> +            struct vm_area_struct *vma)
>> +{
>> +    struct ttm_buffer_object *tbo = drm_gem_ttm_of_gem(gem);
>> +    struct drm_device *ddev = tbo->base.dev;
>> +    struct xe_device *xe = to_xe_device(ddev);
>> +    int ret;
>> +
>> +    ret = drm_gem_ttm_mmap(gem, vma);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (tbo->resource->bus.is_iomem)
>> +        xe_device_mem_access_get(xe);
> 
> Checking is_iomem outside of the usual locking is racy. One issue here 
> is that is_iomem can freely change at any point (like at fault time) so 
> when vm_close is called you can easily get an an unbalanced RPM ref 
> count. For example io_mem is false here but later becomes true in 
> bo_vm_close and then we call mem_access_put even though we never called 
> mem_access_get.
> 
> Maybe check the possible placements of the object instead since that is 
> immutable?
Sure will check bo placements
	struct ttm_place *place = &(bo->placements[0]);
	if (mem_type_is_vram(place->mem_type))
Or can we check tbo resource memtype
	if (mem_type_is_vram(tbo->resource->mem_type))

Regards,
Badal
> 
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>>       .free = xe_gem_object_free,
>>       .close = xe_gem_object_close,
>> -    .mmap = drm_gem_ttm_mmap,
>> +    .mmap = xe_drm_gem_ttm_mmap,
>>       .export = xe_gem_prime_export,
>>       .vm_ops = &xe_gem_vm_ops,
>>   };
