Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97CDC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 14:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984710E02A;
	Thu, 14 Dec 2023 14:17:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A88310E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563423; x=1734099423;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q2zKRcHKrZ1JI3ZX6maaHzlyR8xJ/LAVVIMt5YgHUSg=;
 b=Fqe3lwA6UjcdAtieTyfTrB78w6RlNx8ITDcu6rl4VpHGjyVs7FMrXpAX
 FR3MAo5geJZxCmQNa0lT3SdhVTZYIwkmxYDmxzcIf09Zon9CedWnsK9qn
 3QxI9yzd5RiFXoSwKCUno09xizKnBtxahpVGB5feFDQuGIC+JmfSLmSrE
 yXQQagZ7YqZXYrqos+zUI2oAyW2Bv+O6EANDnWzLmw1JYg22yTa8T7pbY
 BDgDGEutJjL0nnFn0JvhkGXesmhQ/FiFbgj5bcJySTXIyxvYIUaDdha9Q
 cpAmdkl86gzt/uyK+lyOWFNJ7OZGjDe1JgVRJkxpOztAQ+QLuLZoKBKWL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977651"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1977651"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750542001"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="750542001"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 06:17:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 06:17:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 06:17:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbLYusLtmYYB5h8uZspwht3g6G0X6cgZk3M02Ndycx7w2WHWZBePWK7F8n2KtgUBqT2RE7EVx5ztxvdFGywuzubsG6cBUqULzHgW21a5r8hazUhccHT2aoCOQjdLuC2+EjYkWFHId0+SnA26dWl9uBKNT3s7vsEshF14asjBE4rekix+Np6p5wfNOR+Z3JO5pIOH7G7LLDmVRxnD1cTxZwqMWwiiEKwi7dMSbR8RUuvBMIQ1LfbthYzcCYk7ngxvVwS/xnqs6+kycKp0rgRzz27rrpz0fIyP4u8SYEPtjs8AWz3yOfnM1mEImLMAi9WEaAFkMnjoWymJD2HaZT26Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRmGZGh4HM00jjMxjologUwLBJfpTuvsmVKsBFeWpAQ=;
 b=cW6Ffk01yO/uWbBY7yRqSp/7E3ngvzUByws/WRLHIow/R01Y86IQc2I/u93PCmqCYrrdYs5jFIGY8GYxaGZh499aAFRGBLKsaGyVHqy1btOHbLGNq4XrQ/G3wKAP/DHr5g2MIOIhOlYTWgXBtIbQZNBTcGIk6rZq9Shl9mcSzZY8X04Kn8jwzsZyK0KQb+rbZwcquZVk2CKXgAmt8Aom6AhgM0NwXRmKIC9FD93m4ajDxLaIv+n4XS6UiV1CGegtiXE0Lg+hnJ/B0bp/k6n6Axp/IUA7+XFxMmsYAsOAIfnVCMU/LgzYwbCQcvB7dEoyWKVlkgsg91GByYDk6GBU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 14:16:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:16:58 +0000
Message-ID: <55a10a13-86f8-409d-90bb-33349eeadd53@intel.com>
Date: Thu, 14 Dec 2023 19:46:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231128154118.2915150-1-badal.nilawar@intel.com>
 <ZXomjRGzn8O9Drg-@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZXomjRGzn8O9Drg-@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: b15be69e-ea38-461d-48d6-08dbfcaf550c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yXkeHOzPbS0fJ/MKUS/2BBcQjZtT5HBUKcyWo27+nXArIGkE59vaBt5nWWwRmPWblG+fWNm2SO96zYUvP1rUN0+8zQGgKO/E5oCCAxJ6OZil61PRVQzJmfWkO5EDmhNVSfREcxh6bYGZ6rgQm1RxVipznlIkPcNHe1hovzHjL3BejmGhzDrdjAmaiSj2UlrD/CSYrRs65wasN3HF8O5MevqSPgIyf3u5QXyyH7Mom9VxV7hebbOZftXJhYqFydb52uCs0+o68YK97rdMY/9XOzwS2DkaGTOzF8sbqnINdR/pqr90JhAoshD0HuMTGSKwqwRqLJog/0jGaHHBeEaDTOcyXLo66eJdBEg2O0tDQ8jIcUWyYkmMnWNla6lhvuNTKJ3PRLIL48J+IalGjzEDffVJbPWEv7QeGNRBoFI72SAzJ19+SKrij34MG5e7KwSuY/w7efb9yqGa8higDtaqtKv7MzcxzvVIXfaJDmDD15z9H/SHq/H6ZZAAIEfQBrixPlxNFGx8kfafhHvXPtDAfv0nJ4IDLPiZlPzjDux0RpH1Fc5lIjeDCcisuTj+fLvCBiRkkEf197sh1VB9MuEGxJMNxedd8AjoZVSnVBCHOwF4wpq3P35lS5AKCvKCc68qGDn8dfg3gLMzhexBg50CxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(478600001)(6512007)(36756003)(6486002)(66476007)(66556008)(66946007)(37006003)(6636002)(38100700002)(6666004)(26005)(107886003)(2616005)(82960400001)(53546011)(83380400001)(6506007)(31696002)(316002)(6862004)(4326008)(86362001)(8936002)(8676002)(2906002)(15650500001)(41300700001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d044S2cweDZXdkZOVDFFaHRTWDgrdU9VdGgyaGlBZTRyaFVkSjFGREtudjBU?=
 =?utf-8?B?QUY4cG0vL0NyVk9QVEYyNEV3MEY0MU5PRzl1bFVoNXB1TGZGK0VwcUtrWjdI?=
 =?utf-8?B?QVdyWCtQclUzcVVFQ29sUWV4Wm9qTXcvbVJQZi9EMUNNTTh1ajc2QnJKV1Ey?=
 =?utf-8?B?QUtDY0I2Q0M2VEdHMHZFY0ZtNVQrSTJ3eFhaK1F6Y0xlSGRUMkJ1dFYybkFI?=
 =?utf-8?B?ZUZrOThxQkFQR3ltU0dIZTg5MGRtL1FRU0RGOVYvLzB1eWJSa2tONGF5V1NP?=
 =?utf-8?B?WWhiazBVZklhc0JZNDR6K3VXVWQxOXdSSFhLNk8yZU5PL1l4anJJcjVGaTFF?=
 =?utf-8?B?QThvRUNseDZlNTBST2JRQmx5TkhvMW82eWx4OHVTaWxRQWZkRW1FODVGcXNC?=
 =?utf-8?B?Q3NFWmV5ZEJhTERaR3lYbzk3ZTZvV0drUUVqUjdtdGdwWkE2MEw3OXp5a2VZ?=
 =?utf-8?B?VFJiRTBqWm8wdktFYm9HcXhwcm8vRFl0RWhHb3JPYWFrMEM5eEphM2tRdFk2?=
 =?utf-8?B?NVFadTMyUGIyWVI3RXg5dlVGdy9tVUc1cUh3Sm92d2ZRckFCemJiMGNoRk9o?=
 =?utf-8?B?SFlxN3FSRXNOditQbW1JRUNWUjdLS2tSQ29JZGlFSHFHQ21tOE4xZERHN01r?=
 =?utf-8?B?VUxvUW9ZMHRudVBqZjdUL3pia1Y0TmNGMWxsQlQ0VncxREhXUTdIdVhUZTFi?=
 =?utf-8?B?VnIyZmlYdS9Zb2NOQWo5MXNSUDZneFo3Z1dYQ2ZwQ2JGSWREMWhKa3JiempB?=
 =?utf-8?B?em1IRTBWWnkzQ2M5QW05dnovMUpQRzNWcUNMMnluVm9OU1o1Y0NMMW1tTXg3?=
 =?utf-8?B?TVhPZ05xVkJ2U1ROSVhkNForMWt6VmpsNTVkNlFtK3ZVK1lZQTJ3dGZZdTQw?=
 =?utf-8?B?UXhYSWhYRDlLaEdCbjlYTFNma2dCTzZFNEdDYkJmaFJ1V3d0eG5rdEZSS3Fo?=
 =?utf-8?B?TmdqM1plSHhDY2xhNDN4My8xaFNuemU3L2lIaVFjcm5HNFZFR2ZLREpYNjdp?=
 =?utf-8?B?QmJTaDRlakEwTElNOCtjYzgzeG9PM0E5amYvUGZYaEE1dzkxMXA1WkFEdy8v?=
 =?utf-8?B?T2Z4M3NtUDUxK1BuTTZENXNVRkJ1SEEvWXZuV3NmemZaUVpDNDU2SW9oTkRk?=
 =?utf-8?B?dkRtbjhoNXdoK0syZ0w5dnZneHlGWGZhSmpMbWkzNHB4b0xDRjF3c3BuZjhs?=
 =?utf-8?B?RWR1b0FBaHlnV3FheDk0RFY3RGsyeUVlLzRiK0xCd2ZzR08zeEhMT29Mc3hz?=
 =?utf-8?B?eHlYREFtWG5yRE1sRWxjbGlKVVkyTXJza3lkNTJYTzRxMEczKzJxZXVCRUNE?=
 =?utf-8?B?S3BLSzVONDNKVGtYdC9CQ1BZM01Vbnc2ZmdQeGU4L0I1WGRWZUhzbzVWSzJa?=
 =?utf-8?B?UzB1V3BtSlFRWGFoalViQ05rR3NzZXVsdzEzbjJUTFo4eFBONTFmMlptZi9H?=
 =?utf-8?B?NDFHVGx6SE0zbWNMcXJZTDFoUElDM0VZVG92ME16MXNSM3pQNlBDVmhrNmhP?=
 =?utf-8?B?RTJFcGJUZW5Scnc1ZktueGdvUWNOM0ROK2hqQ01lbTN0NkpxTjIxaXN0L1pP?=
 =?utf-8?B?aTB6WmF5ODZqakVCSXE0VVNrMFQxMlhCQlZGZ0d1N0VPMDBVY0NXOVBHRllN?=
 =?utf-8?B?K3hmbEtlVUttaG1lWDBaTlI1TSs4T1NBWk9tVnFFbHU0bHQvZmM5ZTBmSExY?=
 =?utf-8?B?OExtTGkrdW9iMEk1M1BCMXh6NFlGWkRaSWYybmlsbDliRGhGUlR1Z0wwd2cx?=
 =?utf-8?B?TEFhL2dzK2hZem5ET1Vyc2NSQ2lzS2FaSE5qOFpyOVc1c01PNGxtR2RQNVlo?=
 =?utf-8?B?aDBKQzZrODhsRnhBYmNEQ2VkdHgrNlRkcHU2UlNzUmFtTzdlRDNTT0U1aUZV?=
 =?utf-8?B?N2dGcWZkVkRXcG5DLzZ4MmthNHloNHcrTmhqWWYrcXI0MmZiSFdJNXhiOEk0?=
 =?utf-8?B?YVVGVkVWazRwKzc5d3VGY1I1bEg4b2lIT0NDVjB3QTg4ejVMemZhY3c2K0hW?=
 =?utf-8?B?REFtbDJxNXpqQmpvYXoxRTFjRTlJWUsxOVR6TERJRHZSTjNzRUl4WlVheUpT?=
 =?utf-8?B?YzdFWjBBUFhQNUxTOTV3NHI5aXNjRG9OM243eStVSzlNN3ZaVGRHYklRQm1k?=
 =?utf-8?B?dUNXcm8rYVVNdktYTXBFR1VmTUJWR01rNFBoNGJXSWhNTU93L2lQdXk5WUZq?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b15be69e-ea38-461d-48d6-08dbfcaf550c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 14:16:58.9154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnW51uuHTKvmRr8CmCTpXJjr1l/R2zMZmUv3iPtBKnQXIWLCFtQnMPa2pHKC2BzGnSXaBz/9UZWW21Dguj/mfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
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
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-12-2023 03:17, Rodrigo Vivi wrote:
> On Tue, Nov 28, 2023 at 09:11:18PM +0530, Badal Nilawar wrote:
>> Release all mmap mappings for all vram objects which are associated
> 
> I wonder if it would be possible to extend that to system mappings as well?
This approach will be only useful for vram as vram will not be 
accessible when card in d3.
> 
>> with userfault such that, while pcie function in D3hot, any access
>> to memory mappings will raise a userfault.
>>
>> Upon userfault, in order to access memory mappings, if graphics
>> function is in D3 then runtime resume of dgpu will be triggered to
>> transition to D0.
>>
>> v2:
>>    - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
>>    - Avoid iomem check before bo migration check as bo can migrate
>>      to system memory (Matthew Auld)
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 53 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>>   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>>   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>>   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>>   5 files changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index c5aa01c0861c..03e699e3383f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -784,6 +784,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		dma_fence_put(fence);
>>   	}
>>   
>> +	/*
>> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
>> +	 * so if we moved from VRAM make sure to unlink this from the userfault
>> +	 * tracking.
>> +	 */
>> +	if (mem_type_is_vram(old_mem_type)) {
>> +		spin_lock(&xe->mem_access.vram_userfault_lock);
>> +		if (!list_empty(&bo->vram_userfault_link))
>> +			list_del_init(&bo->vram_userfault_link);
>> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +	}
>> +
>>   	xe_device_mem_access_put(xe);
>>   
>>   out:
>> @@ -1112,6 +1124,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   {
>>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>>   	struct drm_device *ddev = tbo->base.dev;
>> +	struct xe_bo *bo = NULL;
>> +	struct xe_device *xe = to_xe_device(ddev);
>>   	vm_fault_t ret;
>>   	int idx, r = 0;
>>   
>> @@ -1120,7 +1134,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   		return ret;
>>   
>>   	if (drm_dev_enter(ddev, &idx)) {
>> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> +		bo = ttm_to_xe_bo(tbo);
>>   
>>   		trace_xe_bo_cpu_fault(bo);
>>   
>> @@ -1139,10 +1153,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	} else {
>>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>>   	}
>> +
>>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>>   		return ret;
>> +	/*
>> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
>> +	 * vram_userfault_count is protected by dma_resv lock and rpm wakeref.
>> +	 */
>> +	if (ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {
>> +		if (tbo->resource->bus.is_iomem) {
>> +			dma_resv_assert_held(tbo->base.resv);
>> +
>> +			xe_device_mem_access_get(xe);
> 
> should/could we get the rpm ref directly here?
Ok
> 
> Also, I wonder if we should anyway get that at the beginning of page fault,
> regardless of the mentioned conditions above?!
Adding rpm ref at begining will end up waking device for gem fault other 
than iomem.
> 
>> +
>> +			bo->vram_userfault_count = 1;
>> +
>> +			spin_lock(&xe->mem_access.vram_userfault_lock);
>> +			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault_list);
>> +			spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +
>> +			xe_device_mem_access_put(xe);
> 
> okay, so in the next second we have another page fault if this is continuous access?!
> shouldn't we block that for a longer period if this ever happened?
For display enabled platform this scenario will not hit as rpm will 
happen only when display goes off but for headless case it will keep 
hitting userfault. That's why in other patch series we proposed to take 
rpm ref in mmap and release on vm close.
> 
>> +		}
>> +	}
>>   
>>   	dma_resv_unlock(tbo->base.resv);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -2168,6 +2203,22 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   	return err;
>>   }
>>   
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *tbo = &bo->ttm;
>> +	struct ttm_device *bdev = tbo->bdev;
>> +
>> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
>> +
>> +	/*
>> +	 * We have exclusive access here via runtime suspend. All other callers
>> +	 * must first grab the rpm wakeref.
>> +	 */
>> +	XE_WARN_ON(!bo->vram_userfault_count);
>> +	list_del(&bo->vram_userfault_link);
> 
> to be really honest I got confused with the list here.
> Why do we need the list if we are adding all buffers on suspend and
> removing on page fault?
> 
> I was expecting some list of buffers that are mmaped but not exported
> and once we have some buffer like that we ummap that and then uppon
> page fault we wake up the device, but we would only remove from the list
> when buffer is gone... So I'm not understanding the list usage here.
Actually list is to store mmaped references at xe_gem_fault, while 
suspending we are scanning the list and doing unmap.

Regards,
Badal
> 
>> +	bo->vram_userfault_count = 0;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>   #include "tests/xe_bo.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 9f373f6d25f2..c9f52e3f6b97 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -229,6 +229,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   			     struct drm_file *file);
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
>> +
>>   int xe_bo_dumb_create(struct drm_file *file_priv,
>>   		      struct drm_device *dev,
>>   		      struct drm_mode_create_dumb *args);
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 4bff60996168..032773bb097d 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -79,6 +79,12 @@ struct xe_bo {
>>   	struct llist_node freed;
>>   	/** @created: Whether the bo has passed initial creation */
>>   	bool created;
>> +	/**
>> +	 * Whether the object is currently in fake offset mmap backed by vram.
>> +	 */
>> +	unsigned int vram_userfault_count;
>> +	struct list_head vram_userfault_link;
>> +
>>   };
>>   
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 2712905c7a91..046085af4c56 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -359,6 +359,26 @@ struct xe_device {
>>   	struct {
>>   		/** @ref: ref count of memory accesses */
>>   		atomic_t ref;
>> +		/*
>> +		 *  Protects access to vram usefault list.
>> +		 *  It is required, if we are outside of the runtime suspend path,
>> +		 *  access to @vram_userfault_list requires always first grabbing the
>> +		 *  runtime pm, to ensure we can't race against runtime suspend.
>> +		 *  Once we have that we also need to grab @vram_userfault_lock,
>> +		 *  at which point we have exclusive access.
>> +		 *  The runtime suspend path is special since it doesn't really hold any locks,
>> +		 *  but instead has exclusive access by virtue of all other accesses requiring
>> +		 *  holding the runtime pm wakeref.
>> +		 */
>> +		spinlock_t vram_userfault_lock;
>> +
>> +		/*
>> +		 *  Keep list of userfaulted gem obj, which require to release their
>> +		 *  mmap mappings at runtime suspend path.
>> +		 */
>> +		struct list_head vram_userfault_list;
>> +
>> +		bool vram_userfault_ongoing;
>>   	} mem_access;
>>   
>>   	/**
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index e31a91cf311c..e2bda8bc75bf 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -181,6 +181,8 @@ void xe_pm_init(struct xe_device *xe)
>>   	}
>>   
>>   	xe_pm_runtime_init(xe);
>> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
>> +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
>>   }
>>   
>>   void xe_pm_runtime_fini(struct xe_device *xe)
>> @@ -214,6 +216,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>>   
>>   int xe_pm_runtime_suspend(struct xe_device *xe)
>>   {
>> +	struct xe_bo *bo, *on;
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   	int err = 0;
>> @@ -247,6 +250,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	 */
>>   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>>   
>> +	list_for_each_entry_safe(bo, on,
>> +				 &xe->mem_access.vram_userfault_list, vram_userfault_link)
>> +		xe_bo_runtime_pm_release_mmap_offset(bo);
>> +
>>   	if (xe->d3cold.allowed) {
>>   		err = xe_bo_evict_all(xe);
>>   		if (err)
>> -- 
>> 2.25.1
>>
