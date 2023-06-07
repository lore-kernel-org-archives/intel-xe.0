Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFBAC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 13:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67F10E051;
	Wed,  7 Jun 2023 13:37:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043810E051
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686145043; x=1717681043;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dW++aDmaNAMW2yQLc4J06o5C1Vvn04MR3A8dsHblub4=;
 b=AzDDzvDeGYqn3Bj3ZXpLSyMBWec4/dRwEBRu1fOLukWZIUAwQc9O2tIi
 fkRFsqBjb7yk4v/fDZraf0/qLIKdUovIvcz1gubO2GLzSwP1MFcmOixY8
 6+04CCLLOPPzPsDSCh2qYAUNv9KI4GnSKNtJwrrvkyvRHaYAJzTnc1fFR
 sLF5gBNxaA6lZKr93t2MaIx8iHa4rzlb3rrbM572PcnaPRrUCey868qtt
 EL8spRAzeS496aQ5QHUQ9foGYdRmENCiYfiPf9TE1nIepIzI/jG1cJYDz
 07/mbrvz0Em8SQFOHnOG3nZbIm3qLqkD3lBhPodNKoz/6+nH1lZphTwgb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="422831915"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="422831915"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 06:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="742693014"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="742693014"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 06:36:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 06:36:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 06:36:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 06:36:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3+1CVpNTF1nee+VEG6ur3YY9lip2ht7eKqkEIItycTASWFgqLY0BRoRct7XljFt2sXN/BSJDB8Dmktn5DA6wADSFDRNKfR49M6qi1Lq05tmC5lYH8cFUgccBGZgncHyUftSqyzYud+/wEsa+jbtQ3qxbKftuFBiSsLIcfPndFZFKzOvIYxcoNdaRExj1CNwKvw9ic/kWJzdlGhmDJK41eakcp9OZv/Oo7xTIttLLMojLe6qVq0om8LNFYzLkHSeZs/RQYXmyqpr5uHWaSWMlsSxbmXNcQzc1JsE4lK4dxRJneMncFfMXMGQ+uYMvdSW9R6hqgr9MsKYKe6bmnwxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVw06dsmZth48fR1Chk+jKp2X9I8/8TTgpVN+e7sbSk=;
 b=XmP6hb6fH5YPNdTctp30/HY5R2lR3ILK6GZTaou3DO11Oe93xZ+/5kM2z9w98JGCbpJHXplxONqOsz7nVrKva6gZDAyCQtvmSs8pJgsYhgIX+uE+6uGG3o6kykNKmTvOIi1rS/usVASUTN8I+HqZL3Hx6suyBk/Ipwl9AR0h1nffyS3oNstgzJSS71tctSkWJppaZwZhkAwVzTRelPozNOfYk049E1uiWvgr4uC/uwzHOZdqBRdbOd/9TEG2mS1S/rHoy1oAquYl/SyYx5+0S7akmrEengOorHRirVEUTnxv2o082lQ8ype06Th5t1gyZQffzdNbB+7G4mm7jHnAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Wed, 7 Jun
 2023 13:36:38 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 13:36:38 +0000
Message-ID: <56915f51-87a9-a7a0-6413-25401b0518e0@intel.com>
Date: Wed, 7 Jun 2023 19:06:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-2-badal.nilawar@intel.com>
 <2cf71343-8409-02e2-b1fb-7660ee5d59c7@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2cf71343-8409-02e2-b1fb-7660ee5d59c7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 6446f0e8-34ef-4689-4f20-08db675c37ee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1J+bBABzgjeeuSGTPyYcy60aKocuHRHc8C6L/XlDhs0fxVoqZUH2yonD1bbW01BDABN6aDPDysTS/v0X4LUm7R65ApuF/hPDgbQOMZ6DeLFWUfIvpkpwOBPW4zZIXayVH/bicr+4YaXN8axN4jem3UxyzRuDW2vp2FfZbT0xS7Wzr+zE/Fz9uQBMSHrLYsDvy5CPbhLdpjrxgA9fFvatII6S3ipLGCJW4Tpww0gXEqhwJkbfhxrHTjQfrzChfILTqWw4Y5dpjy+QlrySOU7Lq2uy/QO4xywPNe9ZkzWwsKIRwfi5Q2rN1WVApxH06q8c1VKgWreebiBsrQ881BHNDqyL28qDpI1uE8OBIYeGDPldFVY2Dtq/ysS3VEdVxlAV73XX/K+lJn8PX3VBd9bsTk7/NmaiYkwFLt41EfGHBSZZSRiW6wprNndrJgaEROa5ppQcHDQpfOm2NcBpZQCD198HC+21TTf9DIJZ1+OK9FU9Qkj/EqIxkQDZB7OcL12dvVRY5z3I7ojP0Jz1468706U4JFaXJ3vUJIYLwcfA/788SP5HrCPTdsXgs6gacDBnaGCFFsltm5JZkNID4DNNDY6Eun1es1SbWwOjct44YApwjTnvieszaMtlozR/mHMH/rCeog9l4W7Y+Hgvqpq/7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(83380400001)(5660300002)(86362001)(4326008)(478600001)(66946007)(66476007)(66556008)(6666004)(82960400001)(6486002)(38100700002)(186003)(2906002)(36756003)(41300700001)(8676002)(2616005)(8936002)(316002)(31696002)(31686004)(107886003)(53546011)(6512007)(6506007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdZYTBpT3FpQ1NYeXdkNzdkeGdrYXYrYVE5TDhmMUd2ZGg5RG1ZNm5Pa2lz?=
 =?utf-8?B?L2RZSnhCN1Jaa0luUVl3akpKSmEwUk9LRlNkSHdUa0F6ckZ0R09XdWxXMWFr?=
 =?utf-8?B?dWxrVkwwMzVNdldxSFc4RXJYbExSMGMzdmg4MmZRV3pQQVYvSWVDNkNGZ3Fl?=
 =?utf-8?B?QUJJc283emp4dUhzT0lNUjR3Y3RiOUs0UlRnUGg2VUFya0M5ZDBUMDZENlpV?=
 =?utf-8?B?dkloSDhCM2pQa01ybUt5WnRzYkIrQkk4YU9LMWlXb1RpRk1jZU5GdXY0T00y?=
 =?utf-8?B?T3IwdHBQZ2NPYU94dFBaOW5jbk1jQ3dyOWtxbkhyL0MvcGJvcEJxZTVTeGlt?=
 =?utf-8?B?OFVVUE05eURORmVlVG55aG5FM0xoZ3hjLzdzQy84NCt5b1VSK2w3WDNoYnBm?=
 =?utf-8?B?WVh2RWF2N3BkTHVWTzlwNGF2VzNsckczM056ZDdqYnZ0VjUvbW5GbERhKzAy?=
 =?utf-8?B?SzB1dFpYVVNqUzRISE9JUVRtRXRPYWt4WHJzcG1rb1ZMU2ZEY2pxQno1cjhs?=
 =?utf-8?B?MENZYWhKU2JvTUtTbGg5NG9RSzFtK3kwTGV3MEZQTnFiQ29GNDRMVS9xYy94?=
 =?utf-8?B?c3padXNCODVHbjZlU0tkd1NRenR1OVZXVHFDRStkQzFTS1pjc05WMUhleVBK?=
 =?utf-8?B?eGRBRjBEZUZWaVNGUWVOTjd5dmoxcSsrYXRJL2wwN1RyemRSZzA2YXhJVDQx?=
 =?utf-8?B?TXVJSU9QalZ0Q2dyVVRQeWJNNGY4a1JYdlpCeDNaeng5ZG5MYko2UlVmMmp6?=
 =?utf-8?B?SHlYSXBEZWRsZlJKUXJud29ZWWNNd1VhTkEzVmp4SkRHTXBMYnlYVEtkMmRR?=
 =?utf-8?B?dlFaM3dDZk0vZ3ZGaXJFWG1UU2FhTEhNaHdYWUFUK2pRZUhUdjdiMjdITFZs?=
 =?utf-8?B?a3FyTkxpRml4Y0VEL1FUZzlLK1o0MXcxUXk0a3N3Wm5uU3pzMUZwWDRaOUVJ?=
 =?utf-8?B?ejRVQWJqdXFoWDQrVnpMTXluNWtzcGhLbnYrUlR2aURNb2FwK0xwRGhhazYw?=
 =?utf-8?B?MllkYWhrb0wydUN3anMvSkdtYWR5Nmo0SVN0a3g4QXRLMENxWUs5T3J2NHN1?=
 =?utf-8?B?RXhkMzN1ekF6R2xhK2Zhc1hqdVFWanBPUnlsR0JzcTVha3g1Z1VGTVpNbWI4?=
 =?utf-8?B?WUt5b05hYk1VeWVtN2FvTERLU0pQQk9TTjdRYnMrNXZmN280OVBHWVhUMHdn?=
 =?utf-8?B?a2FacmJxTWpkOFBSN2lnTEwvWnZqbVhaTDFTbEZnR0lwT1dwMWtPMGh5N2hs?=
 =?utf-8?B?aHVrTGtBUUhSK21YWUc4N1VqOWFsTkU5Nmp2VFdvdjJLZjEwbUdjRklaeElX?=
 =?utf-8?B?N1N5SG43cEZQTjFEMHU3bVpWWTlGUWgvUFpHc0o0K21vRElOaGM3cGZ2SXJ3?=
 =?utf-8?B?aitKRG5QMVJZY1dIWk9BcU05dW8rQWtLWEpDOXVQV2NFU0FtcStiMEE1Q2dk?=
 =?utf-8?B?bm9Yb3pYVksveEhRclc0MDJ0NFhlcUQ1cmZRSENaTmZjNG90QlQyVjJRWDkv?=
 =?utf-8?B?K1krNm1yUUJsaXBOWUNkZTFXbHRYa2JJUFRWZ3RJcDlSRVliRUNJdkJKZXZG?=
 =?utf-8?B?eVdvbmtRNDdOTTJZQzRmTmRlUnljQi80a2RodlpXLzZzeDNSSWVmanBGVjNK?=
 =?utf-8?B?d1B2bUlBbXZJWkJIVFlIVVJ3SDc5bFQ3S3AzNmlKc3ZWcVNxUmd0OHdKVXJ2?=
 =?utf-8?B?UEpiTFdFTldmcTFReURxOWozMEcyd1ZRaEM0NVFFQnh6elYrblFGSWdEZXpy?=
 =?utf-8?B?WnpMMHpsRm5lM0ZMWW4wNmJ5eEkrVlN3NDc2cWVCckVKNWNWVDNSYit4ZEhl?=
 =?utf-8?B?QXRMZ0hoZVZsZkpzWUVhc29DYlZWWHlqVUtNcjVHRDQ3RDlDR3NneFd6Z0hW?=
 =?utf-8?B?ZXhCQi9YazYrMVltV0huOGtveHJPRFRpMU1GMXpKekVXUFZyZmM2bU9GYUth?=
 =?utf-8?B?M1E4TFdDU1J1cE1HVWt2V09WL2s4cnVLZ3JVeTExcUFKcnRLMEpMcWRzUlhM?=
 =?utf-8?B?aFRMNUp0UWFoNjJ0NkluS1Qya1FrZHl0WmpxV1Y1QnZXYmhpRTlMOWxsUzVO?=
 =?utf-8?B?czljWk5RMTNQeU1zaVk2dFdydHROeEhkTlMrUFZ3WWtSK2JiVlkvTkZsQWhp?=
 =?utf-8?Q?HcyTnslyNxm1O3X1++mKwjLH+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6446f0e8-34ef-4689-4f20-08db675c37ee
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:36:37.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UMUmHJPXDLI9dOnltLypqULqDQP47BziwUGUUxQ1Mj5ebNKP+OTuwg2bhRSGsaRRx2OWaWMOxrVSNC01JfGNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/6] drm/xe/hwmon: Add HWMON
 infrastructure
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-06-2023 15:10, Riana Tauro wrote:
> 
> Hi Badal
> 
> On 6/6/2023 6:20 PM, Badal Nilawar wrote:
>> The xe HWMON module will be used to expose voltage, power and energy
>> values for dGfx. Here we set up xe hwmon infrastructure including xe
>> hwmon registration, basic data structures and functions.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   3 +
>>   drivers/gpu/drm/xe/xe_device.c       |   5 ++
>>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c        | 119 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
>>   5 files changed, 151 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f34d4bdd510b..7ac4469b325b 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -112,6 +112,9 @@ xe-y += xe_bb.o \
>>       xe_wa.o \
>>       xe_wopcm.o
>> +# graphics hardware monitoring (HWMON) support
>> +xe-$(CONFIG_HWMON) += xe_hwmon.o
>> +
>>   # i915 Display compat #defines and #includes
>>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>       -I$(srctree)/$(src)/display/ext \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index c7985af85a53..0fcd60037d66 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_vm.h"
>>   #include "xe_vm_madvise.h"
>>   #include "xe_wait_user_fence.h"
>> +#include "xe_hwmon.h"
>>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>   {
>> @@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
>>       xe_debugfs_register(xe);
>> +    xe_hwmon_register(xe);
> Can we call this if config hwmon is enabled instead and remove empty 
> inline function?
During i915_hwmon implementation there was suggestion but not mandatory 
to add dummy functions to avoid conditional code. So I decided to avoid 
conditional code.
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>       if (err)
>>           return err;
>> @@ -354,6 +357,8 @@ static void xe_device_remove_display(struct 
>> xe_device *xe)
>>   void xe_device_remove(struct xe_device *xe)
>>   {
>> +    xe_hwmon_unregister(xe);
>> +
>>       xe_device_remove_display(xe);
>>       xe_display_unlink(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 17b6b1cc5adb..6f511d359de8 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -378,6 +378,8 @@ struct xe_device {
>>       /** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>       bool d3cold_allowed;
>> +    struct xe_hwmon *hwmon;
>> +
>>       /* private: */
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> new file mode 100644
>> index 000000000000..65e5488dec82
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/types.h>
>> +
>> +#include "regs/xe_gt_regs.h"
> Above 3 are Unused include for this patch
>> +#include "xe_device.h"
>> +#include "xe_hwmon.h"
>> +#include "xe_mmio.h"
> Unused include
>> +#include "xe_gt.h"
> Unused include
Sure, I will remove unused includes.
>> +
>> +struct hwm_drvdata {
>> +    struct xe_hwmon *hwmon;
>> +    struct device *hwmon_dev;
>> +    char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +    struct hwm_drvdata ddat;
>> +    struct mutex hwmon_lock;    /* counter overflow logic and rmw */
> Comment can be removed for this patch and added with the overflow logic
Will remove this comment.
>> +};
>> + > +static const struct hwmon_channel_info *hwm_info[] = {
>> +    NULL
>> +};
>> +
>> +static umode_t
>> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +           u32 attr, int channel)
>> +{
>> +    switch (type) {
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +     int channel, long *val)
>> +{
>> +    switch (type) {
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>> +      int channel, long val)
>> +{
>> +    switch (type) {
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static const struct hwmon_ops hwm_ops = {
>> +    .is_visible = hwm_is_visible,
>> +    .read = hwm_read,
>> +    .write = hwm_write,
>> +};
>> +
>> +static const struct hwmon_chip_info hwm_chip_info = {
>> +    .ops = &hwm_ops,
>> +    .info = hwm_info,
>> +};
>> +
>> +static void
>> +hwm_get_preregistration_info(struct xe_device *xe)
>> +{
>> +}
>> +
>> +void xe_hwmon_register(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    struct xe_hwmon *hwmon;
>> +    struct device *hwmon_dev;
>> +    struct hwm_drvdata *ddat;
>> +
>> +    /* hwmon is available only for dGfx */
>> +    if (!IS_DGFX(xe))
>> +        return;
>> +
>> +    hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>> +    if (!hwmon)
>> +        return;
>> +
>> +    xe->hwmon = hwmon;
>> +    mutex_init(&hwmon->hwmon_lock);
>> +    ddat = &hwmon->ddat;
>> +
>> +    ddat->hwmon = hwmon;
>> +    snprintf(ddat->name, sizeof(ddat->name), "xe");
>> +
>> +    hwm_get_preregistration_info(xe);
>> +
>> +    drm_dbg(&xe->drm, "Register HWMON interface\n");
>> +
>> +    /*  hwmon_dev points to device hwmon<i> */
>> +    hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> +                             ddat,
>> +                             &hwm_chip_info,
>> +                             NULL);
>> +    if (IS_ERR(hwmon_dev)) {
>> +        xe->hwmon = NULL;
> dbg or error statement if registration fails?
Sure will add dbg/error statement.
> mutex_destroy needs to be added?
As xe->hwmon is allocated throuh devm_kzalloc think just xe->hwmon = 
NULL is enough here.

Regards,
Badal
> 
> Thanks
> Riana
>> +        return;
>> +    }
>> +
>> +    ddat->hwmon_dev = hwmon_dev;
>> +}
>> +
>> +void xe_hwmon_unregister(struct xe_device *xe)
>> +{
>> +    xe->hwmon = NULL;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>> b/drivers/gpu/drm/xe/xe_hwmon.h
>> new file mode 100644
>> index 000000000000..a078eeb0a68b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_HWMON_H__
>> +#define __XE_HWMON_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +#if IS_REACHABLE(CONFIG_HWMON)
>> +void xe_hwmon_register(struct xe_device *xe);
>> +void xe_hwmon_unregister(struct xe_device *xe);
>> +#else
>> +static inline void xe_hwmon_register(struct xe_device *xe) { };
>> +static inline void xe_hwmon_unregister(struct xe_device *xe) { };
>> +#endif
>> +
>> +#endif /* __XE_HWMON_H__ */
