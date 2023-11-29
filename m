Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6917C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 04:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DF310E5F4;
	Wed, 29 Nov 2023 04:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E648E10E5F4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701233349; x=1732769349;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f0yinY4S2yV0hmePgDPF+xISaWF8VsYuGGmECA4onrE=;
 b=kfzTATHoIQ5y2dSw/wqgoqUkjNLosBBEoCbYkb33cCPjPdHB+n01+uen
 Ba4uLRF9t0oj0Q67WZ5aCWc//IcXz/enauGYOVxKKg4ZBlxxrsclwAB/g
 Y4TEvzLRSadQQV+uEXQKROprZ0mZJ7umVu4Z7m06l1DAfcVlHN3TJKanV
 /Zc99Zk5XZn4MyYq3LUHVDPe4lzs3aUkjyql9oPtzRjpJ5CUES5ZXSTWK
 9rKt/RW8ymzLocY8LnfNkU/xWq71gSgnV2BigqHxVkL4zAk2YEIVLdEMw
 OxtPk7n9bEb4BlflR+byTZbsyevUBmHULR2FYOt8cWOIbOjGLnhTHXn1l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="396996612"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="396996612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 20:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="942175328"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="942175328"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 20:49:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 20:49:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 20:49:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF7rVljLcbsPDDJj1RF704d7MK4Llo5uCrdQNWpSTOv3QPxQTbs3W3w1CJz6VdTf5BdUsZF3yXq4hFcWL6hg1EhF9LcvtTIGcw16TsG8Z4B+Vh7GJS2LIOw/7qTokF/11/+PMlSFc18JWHIkjcRt0JtnsAZd2kCJkmjK3UHG+t7fkWKLQ7gn+mob7Fuy+YpBQvEchDB0Ul7mdquRzcUgT1in8whGl+hpeIjfZFDZuDVWZps3VkK9c7VWRjkDTq+KGVbgKZDaDHEmecDH9zRbiban9onJvIcTVDGqbE0xeciMZfEX0sw/anspX5MzIjdhbDzgYw5JRtSRhQaNgrj8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63Ny7wXC8VP6kYoXef/Q8DTLPNNDedT5MKG5PMmrpQ0=;
 b=DoEROKTEn+wTz0NhIStO1/pke+xwp7DTh7ZTFO9jnAbOMVaRoUHDPvfUhN71U4aZ/YjL44ln/jWwT1bjioiMn9DMMYoQa+mH7OyL2c84mHQF5DS7QziaXmF1KChcxKF/j0a3i+fCIma6AlZslHL5yoT0vWSRCqHJxb9h9rpQz9w29tcjx+uV+7oK+A5W/0KNeIACzvOu0obFM3auA3L18W8V0DNHpNe5ky2H5Rvq8XuUhU+DVolgrRfUU6TyjlXjSvRYntpAxM+r9D/rfIVLZ3l5KNjtEi/N9wTY7Ju5vT50OHTCZVVw013GaIkme/tc5Qjo8NJ33pDEHbZ999YlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 04:49:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 04:49:00 +0000
Message-ID: <dafbb2df-0d30-4fab-a5bc-64da402eb082@intel.com>
Date: Wed, 29 Nov 2023 10:18:53 +0530
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>
References: <20231127141125.2913415-1-riana.tauro@intel.com>
 <20231127141125.2913415-2-riana.tauro@intel.com>
 <ZWW1GXuDuMBA3Jdz@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZWW1GXuDuMBA3Jdz@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 0157e988-de3c-4e51-71a8-08dbf09680af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /zX4sVwDxeYHXPKKSKhwDlKmYTRrXGp57UYjX6R18s9OhXHhqLIm2CPjS17bzs7B/r06z8791PrfdPXMZWrAHy9xU4iv0Tr66/SuIGM4WQjiGP3YsOGLU+jtmSx7C1ejRLXAR1QyHHScKAwtVndhzHxU0mSlVtPhCNyp9BdA9yF4zbrjMFPkDyPcr/anlQVCwqBQSr2SPNibhigvc/qu4Sv/UXCzDQ+/n5/TJmVt8LB8T43BNfYybYMpkxu6/vtTU8OIxO8kTOcA9EswSI06tJ/CKxMiVz5Mp5qtzUUWlyBt7jJJZFwiDIRa5UfreCKorFROPj09MhKSDECC7O2j8EJuBDYlAQ3GP2o1fXgJF541WiH+ReEcdKHI3DKF8aB5qGSKLd82KiQV6zdQdo0v6Mbimp2mwsRyTL0iRn1jgOev6EakInwi6tUE0V2xY6JF59D/qn6O7dcv05ERNk7mo/0daTXBr59e0ncsnD6/1RO5HNWlJTrFlXuaW6Vpy0mqYEXgzkJojXO7Ysp3lxdejy6kfFTyLoH19bvCH++qY75wvT1IGyqhHH/fpaZ7EF2o0a9c0NCdmIUgQ9BYyJQt627PMF8SrU2X0WNjKgzudquD0/zHbUxT6v51sEiArMVfy97ASEKAxIW4PGl7TUap4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(31696002)(26005)(36756003)(44832011)(478600001)(82960400001)(83380400001)(6486002)(86362001)(4326008)(6862004)(8676002)(8936002)(6666004)(2616005)(53546011)(6506007)(37006003)(2906002)(41300700001)(38100700002)(6636002)(66476007)(66556008)(316002)(66946007)(6512007)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJ5bmlPU284Ym9xNjBSSDdEa0lraEJPTjZxSjJHbnZ2UUJBMnBkcmlJVU1p?=
 =?utf-8?B?VXBxRTc4Z1lJS2g2Szg5VjBJQkNLMHRlMk1UNTBWZXg2cHpacExUQXFLb3Ju?=
 =?utf-8?B?LzB2TGJuMTZ5NDYxTGdZUDcyTlVyMWIvenhkODR3a3BzejByVkRxNWJNL1p2?=
 =?utf-8?B?MW4wRmpvaDF3Y1R6aDQrQ2ZXdy9DZGdGRU9tc2FYcUdTRHp4Nk9tTFpmWXl2?=
 =?utf-8?B?ZGJQWTgvb2VpdnJIS2dFczdrdjdJb0ttaEM1cjAyUFp5TXhqdVpVUkxoL3Zz?=
 =?utf-8?B?MllhUDVuaCtPd2o5UHNFd1B2b2dnVXVMUllRWFhBZE1XOUI0SjJucDMxbDN3?=
 =?utf-8?B?T3pJUkRWMkNMTmJmMGFUR2hINjhQY1hLbElsbWM2RTJiZTVEUW1QR0hyOTBm?=
 =?utf-8?B?ODJXaGJkUTNvRVlVYkd3d0lDd0kvaWFmVlE2R3R1U3h1T3RUeXE5Rlh1Q1NM?=
 =?utf-8?B?VmVBeWEyYytCZi8yZksvb3F2aWt1bE9sdWJiM281aDVvV3NXMjZaa1grZTh6?=
 =?utf-8?B?NWxFM1VJM1Z4Tk16VVRFV3RMRmZtTTNKNEJjdXpESkFrWDlOZnIxaE9FaUhF?=
 =?utf-8?B?aURCeEY5WGt0YXYvSkszdzNLdXVBL3FnaTB2Um5KMUxRdzExa3E0YTcrL3VT?=
 =?utf-8?B?VzZ3ZSsyMXM3TnJ5aUcyUHVkVTRUMktSd0pCdW1FNi9jN3pYbkI4Ukd2UzFs?=
 =?utf-8?B?UC8zYTZCVHQ3WFZIWXB1VTFKY3MyRHMxZGszTGFhUW9Vb1BhbnRlemV5SUJx?=
 =?utf-8?B?U1FqNEhNRURwRzhjcDRyYnQvOHJsOWs5WHhKd2pWSHhWY1pYWmN5SlR3UW42?=
 =?utf-8?B?OGJ3YWdSTytaUmtBV1NCWGJtbnF5R29JQUlnTFlaZi85enF3R3c0bitEV0JN?=
 =?utf-8?B?QTl6RCthbGV0ckZwSTFqZnhjQnpkU3NjTXdTVEVtUTdWWlg1M2Iwd1RQRVp2?=
 =?utf-8?B?cElPTVowVUtWY2hVcjNIVEI5ajNMdzFhUmw2SXFLRlZJalpZN2dpRU5NcCtJ?=
 =?utf-8?B?by80Q3h1OW5WekNXSVU2c2RWYU9oNW90OENzczdhY3B0c0xQb3pxNysyZ2d6?=
 =?utf-8?B?YmhDeDdDVnNVekFESjlDSStvdS8yM0NMaXQ0SzZSVU5qSG0wWVNBYXc0enNT?=
 =?utf-8?B?ejJZdGh3aVp2a1JqWFZ4blFPU2srclpsK3dLc1VJanhFT3VtQ1lWQld3YUtt?=
 =?utf-8?B?d1Vrb1RoMkExNUZoa01UY0dZcC9EWGI3R2J5MEgySVJ1NVFvOVJyVGdML051?=
 =?utf-8?B?bGREZ3loZHRIWUpvakN4cmdMUjRna3FCcnkraWlUd3RIV1BLdTFROXBqN1Vo?=
 =?utf-8?B?RWZLT0ppSWY5aWVlUWZId2VkTXZKYUU0SFhlNlptdTAzMW0xOGlOeWoxbC9X?=
 =?utf-8?B?Q0VidnpiRno3cDl4bG0vdHhEb1FaVmEvZUN5QVJFbjJnQWtXOHorM1V5ZjAy?=
 =?utf-8?B?NFU2R05wTmxlV2JZcXFQSnU2QTRrNlA1MkVLTm9saWVRRndDNDZMbytLNTJR?=
 =?utf-8?B?cnU4LzlMcjhBQkVxNWFLTG4rcTc3eDJpN05peU5CaWtuVFF5Umw1Q2c2NWlL?=
 =?utf-8?B?Q0ZhVzhkek1aVFVxOGZwdUIvRk10Sll5YzhZcTFEUFllYWxkaWp0RXNGV0gv?=
 =?utf-8?B?OFhra1lrR2ZpanRGR0ROL3JjRzZ2R0JtNzluUjZ1b1RBZ3Fadk96N0tKNTB0?=
 =?utf-8?B?R1dCMTBjQlpyeSt2MDBNSVRLQlNhL3R4ZGRGUFllQTcxclBXSUxLck9yVGdU?=
 =?utf-8?B?RStyZ0FQOEpzMkZzclhybXlFaVV4UDNkTld5SllOMlNGVHFlRld1U0VkeDZx?=
 =?utf-8?B?aFJuSzRCOHExdHVrM3N0dXBKVjZXNzRaeGFBeWVLTkFmYXlPbXpBZkNzZGxl?=
 =?utf-8?B?UTN3ZEhIcmNBcHlDSnkrR1FuSEdSTkkvcFE3TWxGSlJZdXAzY3JKVkYrcEpP?=
 =?utf-8?B?SFMxYmhZN1dsMitjQlhKOHc2VFB3S3Q0QTg3K21mVFFYWUhOUnJhZHUwanl1?=
 =?utf-8?B?dHk4MWdQRGtYQUxXdWNnNEt1NDNRekxTcWlJS05BOFVla21xWU55byt2VVVs?=
 =?utf-8?B?VitRSUk3eHFDa0NHS1F6WVpRdi9TYnVnYktrWFJyVnJrMXNFVDIrMjhYS1gz?=
 =?utf-8?Q?qEldqroNeFdug602IJgvW2GgI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0157e988-de3c-4e51-71a8-08dbf09680af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 04:49:00.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p8k9DlVBEIzYFFp3wOe3Oe0S5hJ87jzt/W0HpvU09TlPxa5w/jjZbPJMcP9lJbg4+wSq8leO6s6iH/2/oxbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/8] RFC drm/xe: Move user engine class
 mappings to header
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

Hi Matthew

Thanks for the review

On 11/28/2023 3:08 PM, Matthew Brost wrote:
> On Mon, Nov 27, 2023 at 07:41:18PM +0530, Riana Tauro wrote:
>> Move user engine class <-> hw engine class to header
>> files so that it can be used by perf component.
>>
>> No functional changes.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c      | 17 +++++------------
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h | 18 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_query.c           | 22 +++-------------------
>>   3 files changed, 26 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 62d0237e724e..6f27b78666f6 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -482,31 +482,24 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>   	return 0;
>>   }
>>   
>> -static const enum xe_engine_class user_to_xe_engine_class[] = {
>> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>>   static struct xe_hw_engine *
>>   find_hw_engine(struct xe_device *xe,
>>   	       struct drm_xe_engine_class_instance eci)
>>   {
>>   	u32 idx;
>>   
>> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
>> +	if (eci.engine_class > ARRAY_SIZE(xe_user_to_engine_class))
>>   		return NULL;
>>   
>>   	if (eci.gt_id >= xe->info.gt_count)
>>   		return NULL;
>>   
>>   	idx = array_index_nospec(eci.engine_class,
>> -				 ARRAY_SIZE(user_to_xe_engine_class));
>> +				 ARRAY_SIZE(xe_user_to_engine_class));
>> +
>>   
>>   	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
>> -			       user_to_xe_engine_class[idx],
>> +			       xe_user_to_engine_class[idx],
>>   			       eci.engine_instance, true);
>>   }
>>   
>> @@ -532,7 +525,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>>   			continue;
>>   
>>   		if (hwe->class ==
>> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
>> +		    xe_user_to_engine_class[DRM_XE_ENGINE_CLASS_COPY])
>>   			logical_mask |= BIT(hwe->logical_instance);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index 39908dec042a..8269f77c4ca2 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_HW_ENGINE_TYPES_H_
>>   #define _XE_HW_ENGINE_TYPES_H_
>>   
>> +#include <drm/xe_drm.h>
>> +
>>   #include "xe_force_wake_types.h"
>>   #include "xe_lrc_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -58,6 +60,22 @@ enum xe_hw_engine_id {
>>   	XE_NUM_HW_ENGINES,
>>   };
>>   
>> +static const u16 xe_engine_to_user_class[] = {
> 
> s/xe_engine_to_user_class/xe_hwe_engine_to_user_class
> 
>> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> +};
>> +
>> +static const enum xe_engine_class xe_user_to_engine_class[] = {
> 
> s/xe_user_to_engine_class/xe_user_to_hwe_engine_class
> 
> Otherwise LGTM.

Will fix these

Thanks
Riana
> 
> Matt
> 
>> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> +};
>> +
>>   /* FIXME: s/XE_HW_ENGINE_MAX_INSTANCE/XE_HW_ENGINE_MAX_COUNT */
>>   #define XE_HW_ENGINE_MAX_INSTANCE	9
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 61a7d92b7e88..caa98c6b5853 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -22,22 +22,6 @@
>>   #include "xe_mmio.h"
>>   #include "xe_ttm_vram_mgr.h"
>>   
>> -static const u16 xe_to_user_engine_class[] = {
>> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>> -static const enum xe_engine_class user_to_xe_engine_class[] = {
>> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
>> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
>> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>> -};
>> -
>>   static size_t calc_hw_engine_info_size(struct xe_device *xe)
>>   {
>>   	struct xe_hw_engine *hwe;
>> @@ -138,10 +122,10 @@ query_engine_cycles(struct xe_device *xe,
>>   	if (!gt)
>>   		return -EINVAL;
>>   
>> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>> +	if (eci->engine_class >= ARRAY_SIZE(xe_user_to_engine_class))
>>   		return -EINVAL;
>>   
>> -	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>> +	hwe = xe_gt_hw_engine(gt, xe_user_to_engine_class[eci->engine_class],
>>   			      eci->engine_instance, true);
>>   	if (!hwe)
>>   		return -EINVAL;
>> @@ -212,7 +196,7 @@ static int query_engines(struct xe_device *xe,
>>   				continue;
>>   
>>   			hw_engine_info[i].engine_class =
>> -				xe_to_user_engine_class[hwe->class];
>> +				xe_engine_to_user_class[hwe->class];
>>   			hw_engine_info[i].engine_instance =
>>   				hwe->logical_instance;
>>   			hw_engine_info[i].gt_id = gt->info.id;
>> -- 
>> 2.40.0
>>
