Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09FBEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 10:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350A10E113;
	Tue,  4 Jul 2023 10:49:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1724910E2CD
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688467780; x=1720003780;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uvIzQ2BahzTlvNHwbNcg2TEMMJm8vGwMi1SuqQZBKMM=;
 b=myTImlR2zyFT9HRaCQTiaNpw4rHITMw0rP4OmVKA0nxV9vXqJcmdzgdg
 lRfR2fSj1b74qu2qZOtGqO1/7vzcnat3xg33IO6ajofCm5DJz81HzqIfC
 dA6RwJhxP/LD0d/gkVP+cpNccZIBUX7H06blnLEkKZ4F0UQGEGGhF3aB0
 0ddLK1tXM7lT0T58hme9dmeSJ/fdryTccg/+ZajuTDHYYJ9pyOfw2YngE
 kGbdZ4GZF9fWneY6EscDlTAman9E75gLMV8q0M6x1J4KuzTNfOH3vhOYO
 OIm83+81ziwYUHzhNjFZiyOeAIr0luNL3cty3WJbC0Y0aa2fdPx4EgVpK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347887868"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="347887868"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696119085"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696119085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 04 Jul 2023 03:49:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 03:49:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 03:49:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 03:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuWyhXnwUd0Rs8EKIyymviumIVhVR8kQEgiOatix0cShNxj3Sl9PDCo9fe3BE7ejGAjxno6lf2eXjNpHmrFTkGjrGUeEmpmlFXiI/EU8z/cPubfB5UMz+zulqONYwvS73TId/Vl6E26gnRK0uAhe4wx5fgRajAuQdIlqvEtd7kv5WTDSjGZbADpFQtHTvle0a3YayKd3XDEtY6YZmqEK3LZKgTwBRwN69uVkmpAN6VVo8tIZA1d8jU83XoMPzF+E7cDobHp67f51IIvHSY410fYEDYsYWiav3OSfMjCV+1pl6kuPdRlsaSDQYdT61bxK8vY5/7U29tJeZSgtRfy7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRjs+qRVx3W0lAJ3GmIQnESi+7nCpZQ2sHPuwh/CnxE=;
 b=g9IoVkaSXZEGe533VvU/sCW+8JFQZUtmYCFt5Y2fICpMiL9X4nTXkwAg/wV0VzLvCWdSE+XV3OS+tw77+ah88DNYhGcK2rjFMIGcex45UqnURkOwrqEnN0QZ6618Q458jYUdpbtyE/K3KtlpFSRtuNEq8Pmh69SNf6MuMt6/0sp++QZ9GyJ4PjEVgCQ5g4xgQ7XHS2kqUUb11L8j6cAmZwGac2v17AOCfIITffr46G+f21jJbV3c9SsvSJhlnexhLdHs0YerfofPyBm+Tp2VG2SvndCU1iZfYbd62mzqNdc4tJBGL9e2dstzFrCn/L1hIGqIUgI5Feo+q29hlD5XBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:49:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::347c:9286:96c4:cf61%6]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 10:49:36 +0000
Message-ID: <d29d30a4-1af1-48cc-7cc6-a8e7282c222f@intel.com>
Date: Tue, 4 Jul 2023 16:19:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
 <20230627115642.2087251-4-anshuman.gupta@intel.com>
 <cecec48b-9f8d-15b8-1bf5-09ecba414ba9@intel.com>
Content-Language: en-US
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
In-Reply-To: <cecec48b-9f8d-15b8-1bf5-09ecba414ba9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::7) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d59987-e2da-4125-168d-08db7c7c5b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5rZcbYquRRaeZ7qBsP0zfSX9nbi9VKBXmkBtyeyKtN+t8Ud/sUpHnoEs1SBLk3uUCnnaV7rjJDULhoot2O5BL9zbi6fv69YB6DXG2MxpK1M/8LVguP46FaESCc0EStV3+/is3Kbp25miyqqe/9HWRd+dGF0s03550KoCL5Swx7Kp4Vmyk2ZECHp8dKyU+JxLe4D8wgFHlCkV8r4h7dStD/F0ex4Q4qGZPVbgHpn7SV4UfyTKbZpbCzUHcnjZGO9zty1qMyXT22PTSh7JelBoG8nPloArQBq97kcs5X2VC7iVyk6rx3S3xjxqt6CSjxDEF9T2K0JfTlTFIYWHrHbdZpmp9273eT7o657mdbQ+3XkPa0rxBLOyQPmEs0M5hvHwm0Hj8BprvmxKRVnPTsyhPpLFkpVmiS1IBkfrS5yJrYV2PllEBBvwHpXYKLj6TEdwsFYIpqyD8aYzK/iIplXp5Z7v76ua+1lE+Q2c+ppnwK88A21VqVkNkWMI8w/VgKxHULKsyOVp9rXB5jVwwPJeV07RzNYsEituz3M8poinud+HkmXciv95x67606pkm7fEmwTzKSVu38mOisdSwk/bbgwK0st8iSxJ2fJdj5oclOtsdHkuoVxToe+vMVIV3iwdSTIUaCBqFHo9Cycauq2xeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(107886003)(26005)(31686004)(478600001)(82960400001)(6666004)(6512007)(6506007)(31696002)(86362001)(2616005)(186003)(53546011)(38100700002)(66476007)(66556008)(4326008)(66946007)(83380400001)(6486002)(316002)(8676002)(8936002)(30864003)(41300700001)(2906002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXRiTkVodmN1QnlKdWhLWmRjMjZlT2NmdHBIMGU2MG5yNVcyTFUvTHFhTmR6?=
 =?utf-8?B?bEJQZHB1c2RJL3JCelpDNk9ydmhWY0JuRkNvT0tzTTh4bk1NUTJzM0I4UnU3?=
 =?utf-8?B?V2VkeXBQZTFJdmlzcXl6bHBqYytxcjJkZGtaZmw3QnIvWUNTenZvalZJWHhW?=
 =?utf-8?B?SjZIWjlSUG9sY3Z4ZFpTbEdrUnFLOWt5alhpZGdQSmk2UmVJdksxY0diRG1V?=
 =?utf-8?B?WHp2OTNvMVB5Tk5jQy9jbk1JWUhmZU9qWUcrRUlhZWNKNzlmY01mU0V3bktB?=
 =?utf-8?B?dkI5aWRrQ0NZSlpKdVFoZDN6dktVNEhCUi9VSnR6SnBScExnWmc1VXRWeVJD?=
 =?utf-8?B?a3BlancyTTZpMXJRMndLN3lTSEtsb29SSTJXMUpDL1pETmR0cVI0Zzc0MTVT?=
 =?utf-8?B?WEpIalJrOVA1QzBsYm4zZVhMVHFEYm5JM09tdDZDZkZha3VFZ0ZXdkh4ZFVy?=
 =?utf-8?B?NnRxR2E3T2thZFFTSEgxL0NQeTNLd0VoNXB1N21teEdSek5MNHpXYTZoZjZ4?=
 =?utf-8?B?Ums1M0hZZ241M2VtWnJwQmVoVTBDRjBtTDdvU1o1RFZlc3VTZmtNUmNwemo2?=
 =?utf-8?B?OE1LTGhSZVByUTBmT1A3Zk1EWjZpYm5CbWttUHd0akYySkE0dk9nQTZEa1J3?=
 =?utf-8?B?dGRScENWT3krTEpQcUIySUJnNzVEM2czUG9XNEV4T1N0Mmg5MENNNXlnK2NY?=
 =?utf-8?B?VFBvanJEZmRGdW8rVHRSY2dlZVZ1eTNnbVJwQ0cvYVJhNVJOYm0xclNxdGNB?=
 =?utf-8?B?OVFZV3ZjbXp3ZUxKTlR0QXhkemQ4LzhDUFJsU1hwNGs3SC9MSjFBUkZKV2Nh?=
 =?utf-8?B?Rmc5WjBZUEdDVkRwbG9xSjZkUTVac3UreEN6MWtZVG0rcnZqa1FrTFBkOXZM?=
 =?utf-8?B?bjdNRm0rRk5BUXRmcDBJdEhwVU4rOUtmWDEwZFpSWXZ3ZW9acFI5YXg0QjdQ?=
 =?utf-8?B?eklFOW9ZMTdZNE5nNDVYZC95dG5rdXoxUmpBVlNvQ3pBa0RURHRIelg2cjJ3?=
 =?utf-8?B?akgrNEZtR1pCdjBCa253eUFpTUp6TGdwQXNRNHd3WlFUcW5aWE5aZFJ1Smov?=
 =?utf-8?B?WGQ4MDIrck80YXdCd0Y2cDVPSkg5KzZJUXlxNEMvZmUyWHpkbG9CWUFZTnpP?=
 =?utf-8?B?OGFjWnk3OEpENERmSFJXSlFacEFaclVGcktRVUFHWDVCZ21ZbXdxK3ZUODY1?=
 =?utf-8?B?MVVQeTN5SGRkQU42SWN6VEZEZThkN3YxZHJuZGRNZFdOOUdNV01DRFVDM3pC?=
 =?utf-8?B?Z3ZzMmt0RlMzZmtRczJWVWNVOGdaeSt1U3RXbEoyZzhzRlEzd1BXTGNNczEz?=
 =?utf-8?B?MVdOL0tPVEZjZVlQb1ZydkV5QXByMnZwZmJYZWloUk90N2tpU1p1OCsxb2VT?=
 =?utf-8?B?V1lvY2NIMHRscnM2MmdZaHUxRHdFNmJCRzhscFVGbzNjQ2YzVExLMlNIU2Ir?=
 =?utf-8?B?Q2hGYm9Idm1ZNFR6blUzVmg1S2FNKy9zeEFyWGlwOWxkdVlQYWR3d3h2cC9n?=
 =?utf-8?B?OW5DNGNkVEsyMStNbVZZQ2RJMnJ3TkhoSUptQlNISEZ6U2piNnVVZWsyUis2?=
 =?utf-8?B?THhKVnREUndNTmN0OXRHSlh0Sk9EL3lGZ3hYTjNmRXJIcEE4alg2Mi9VbEI1?=
 =?utf-8?B?TjVFSi90NnZHempISXRkRkZJVHdaOS9KRWZsOStiOUMvcU5jRHFnY2ZjVWww?=
 =?utf-8?B?cTd0YW9kdlQ4MGxjV3Q0ZkloMUQ4NTd4Tlo0ZkkwTGVjeUhQd1FBdDA1Slp5?=
 =?utf-8?B?N2I3Ukx2YXBCdG1WZjZFdGgxZnlIamR6L3R1citGQ0p1YXNUR2ZaM3daZ0k0?=
 =?utf-8?B?S2E1dUVMa2FVMmxydGVncEpwZHhtMFJnWnd3RXBxOGJyTDY5VTV3VjU1N1N2?=
 =?utf-8?B?M0E0blVOeVhBYldPRWV1ZGoyYUhrdXFJT2o0SThCUDNEMC9xVjlnOGUxTU9P?=
 =?utf-8?B?K3Y2amp4aW5EWHIzRmlic1lkM1REQ3EzZUNJRlJLS2dEYU9tb2FTQWYzREFk?=
 =?utf-8?B?dGRFYWU0ZWp6L2t0bzFxOFNlYzhuRlZpR201cGg5SkN5U3FQNmQ0V01OeWRp?=
 =?utf-8?B?S3Jha29YR3FNMElIU1BnRFNQN3JIa1VqVnNYTG5BbXRUbkRVNkZ3L1lJMHl0?=
 =?utf-8?B?a3R5dENjZDVnM3pnWkhjS3lNMkZJNmxBV2JWNHRTb3JHYmhSdERlNkt3aVBy?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d59987-e2da-4125-168d-08db7c7c5b53
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:49:35.6917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0kWvQMqUQX809qAPnE0NeVTJiF7WtzxG8NU7O0hJJNd5qWJC/FdhhSXKiYI9MTORDe19+DimO6wYb2yFQjPkL0yoO7LcKqW5juYaXJ0HHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/5] drm/xe/pm: Add vram_d3cold_threshold
 Sysfs
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/4/2023 10:46 AM, Riana Tauro wrote:
> 
> Hi Anshuman
> 
> On 6/27/2023 5:26 PM, Anshuman Gupta wrote:
>> Add per pci device vram_d3cold_threshold Sysfs to
>> control the d3cold allowed knob.
>> Adding a d3cold structure embedded in xe_device to encapsulate
>> d3cold related stuff.
>>
>> v2:
>> - Check total vram before initializing default threshold. [Riana]
>> - Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]
>> v3:
>> - Fixed cosmetics review comment. [Riana]
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device_sysfs.c | 85 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
>>   drivers/gpu/drm/xe/xe_device_types.h | 21 +++++--
>>   drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
>>   drivers/gpu/drm/xe/xe_pm.c           | 37 ++++++++++--
>>   drivers/gpu/drm/xe/xe_pm.h           |  3 +
>>   7 files changed, 157 insertions(+), 13 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 4b82cb2773ad..f84b7b4d4324 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>>       xe_debugfs.o \
>>       xe_devcoredump.o \
>>       xe_device.o \
>> +    xe_device_sysfs.o \
>>       xe_dma_buf.o \
>>       xe_engine.o \
>>       xe_exec.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> new file mode 100644
>> index 000000000000..15ace0041798
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/pci.h>
>> +#include <linux/sysfs.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * DOC: Xe device sysfs
>> + * vram_d3cold_threshold - Report/change vram used threshold below which
>> + * vram save/restore permissible (in MB),Xe save/restore during runtime
>                         ^is                 ^period
> Needs to be reworded. Can be same as the struct comment on the 
> vram_threshold
>> + * D3cold entry/exit. vram_d3cold_threshold sysfs attribute will 
>> available
>                                                                     ^be
>> + * under device kobject directory.
>> + */
>> +
>> +static ssize_t
>> +vram_d3cold_threshold_show(struct device *dev,
>> +               struct device_attribute *attr, char *buf)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(dev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +    int ret;
>> +
>> +    if (!xe)
>> +        return -EINVAL;
>> +
>> +    ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
>> +
>> +    return ret;
>> +}
>> +
>> +static ssize_t
>> +vram_d3cold_threshold_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buff, size_t count)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(dev);
>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>> +    u32 vram_d3cold_threshold;
>> +    int ret;
>> +
>> +    if (!xe)
>> +        return -EINVAL;
>> +
>> +    ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", 
>> vram_d3cold_threshold);
>> +
>> +    ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
>> +
>> +    return ret ?: count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(vram_d3cold_threshold);
>> +
>> +static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct xe_device *xe = arg;
>> +
>> +    sysfs_remove_file(&xe->drm.dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> +}
>> +
>> +void xe_device_sysfs_init(struct xe_device *xe)
>> +{
>> +    struct device *dev = xe->drm.dev;
>> +    int ret;
>> +
>> +    ret = sysfs_create_file(&dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> +    if (ret) {
>> +        drm_warn(&xe->drm, "Failed to create sysfs file\n");
>> +        return;
>> +    }
>> +
>> +    ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
>> +    if (ret)
>> +        drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_device_sysfs.h
>> new file mode 100644
>> index 000000000000..f9e83d8bd2c7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DEVICE_SYSFS_H_
>> +#define _XE_DEVICE_SYSFS_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_device_sysfs_init(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7a12d8c657c4..c047571c8ab0 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -329,11 +329,24 @@ struct xe_device {
>>           bool hold_rpm;
>>       } mem_access;
>> -    /** d3cold_capable: Indicates if root port is d3cold capable */
>> -    bool d3cold_capable;
>> +    struct {
>> +        /** capable: Indicates if root port is d3cold capable */
>> +        bool capable;
>> +
>> +        /** @allowed: Indicates if d3cold is a valid device state */
>> +        bool allowed;
>> -    /** @d3cold_allowed: Indicates if d3cold is a valid device state */
>> -    bool d3cold_allowed;
>> +        /**
>> +         * @vram_threshold is the permissible threshold(in megabytes)
>> +         * for vram save/restore. d3cold will be disallowed,
>> +         * when vram_usages is above threshold value to avoid the
>> +         * vram save/restore latency.
>> +         * Default threshold value is 300mb.
>> +         */
>> +        u32 vram_threshold;
>> +        /** Lock to protect vram_threshold */
>> +        struct mutex lock;
>> +    } d3cold;
>>       /* private: */
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1b526d1e4d75..848de5dcdaa5 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -758,7 +758,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>       pci_save_state(pdev);
>> -    if (xe->d3cold_allowed) {
>> +    if (xe->d3cold.allowed) {
>>           pci_disable_device(pdev);
>>           pci_ignore_hotplug(pdev);
>>           pci_set_power_state(pdev, PCI_D3cold);
>> @@ -781,7 +781,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>>       pci_restore_state(pdev);
>> -    if (xe->d3cold_allowed) {
>> +    if (xe->d3cold.allowed) {
>>           err = pci_enable_device(pdev);
>>           if (err)
>>               return err;
>> @@ -797,8 +797,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>>       struct pci_dev *pdev = to_pci_dev(dev);
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>> -    if (!xe->d3cold_capable) {
>> -        xe->d3cold_allowed = false;
>> +    if (!xe->d3cold.capable) {
>> +        xe->d3cold.allowed = false;
>>       } else {
>>           /*
>>            * TODO: d3cold should be allowed (true) if
>> @@ -811,7 +811,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>>            * 3. at resume, detect if we really lost power and avoid 
>> memory
>>            *    restoration if we were only up to d3cold
>>            */
>> -        xe->d3cold_allowed = false;
>> +        xe->d3cold.allowed = false;
>>       }
>>       return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index c250a36b99ad..7028c9b6e94c 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_bo_evict.h"
>>   #include "xe_device.h"
>> +#include "xe_device_sysfs.h"
>>   #include "xe_display.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>> @@ -148,8 +149,11 @@ void xe_pm_init(struct xe_device *xe)
>>   {
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    mutex_init(&xe->d3cold.lock);
>>       xe_pm_runtime_init(xe);
>> -    xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
>> +    xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
>> +    xe_device_sysfs_init(xe);
>> +    xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>>   }
>>   void xe_pm_runtime_fini(struct xe_device *xe)
>> @@ -166,7 +170,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>       u8 id;
>>       int err;
>> -    if (xe->d3cold_allowed) {
>> +    if (xe->d3cold.allowed) {
>>           if (xe_device_mem_access_ongoing(xe))
>>               return -EBUSY;
>> @@ -192,7 +196,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>       u8 id;
>>       int err;
>> -    if (xe->d3cold_allowed) {
>> +    if (xe->d3cold.allowed) {
>>           for_each_gt(gt, xe, id) {
>>               err = xe_pcode_init(gt);
>>               if (err)
>> @@ -213,7 +217,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>       for_each_gt(gt, xe, id)
>>           xe_gt_resume(gt);
>> -    if (xe->d3cold_allowed) {
>> +    if (xe->d3cold.allowed) {
>>           err = xe_bo_restore_user(xe);
>>           if (err)
>>               return err;
>> @@ -248,3 +252,28 @@ int xe_pm_runtime_get_if_active(struct xe_device 
>> *xe)
>>       WARN_ON(pm_runtime_suspended(xe->drm.dev));
>>       return pm_runtime_get_if_active(xe->drm.dev, true);
>>   }
>> +
>> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>> +{
>> +    struct ttm_resource_manager *man;
>> +    u32 vram_total_mb = 0;
>> +    int i;
>> +
>> +    /* TODO: Extend the logic to beyond XE_PL_VRAM1 */
>> +    for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
>> +        man = ttm_manager_type(&xe->ttm, i);
>> +        if (man)
>> +            vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
>> +    }
>> +
>> +    drm_dbg(&xe->drm, "Total vram %u mb\n", vram_total_mb);
>> +
>> +    if (threshold > vram_total_mb)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&xe->d3cold.lock);
>> +    xe->d3cold.vram_threshold = threshold;
>> +    mutex_unlock(&xe->d3cold.lock);
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index e0c4f92e27c5..b50ec8bdce6f 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -8,6 +8,8 @@
>>   #include <linux/pm_runtime.h>
>> +#define DEFAULT_VRAM_THRESHOLD 300
> A comment on the units [MB].
> With the above comments
> LGTM
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Thanks for review, will fix the comments.
>> +
>>   struct xe_device;
>>   int xe_pm_suspend(struct xe_device *xe);
>> @@ -21,5 +23,6 @@ int xe_pm_runtime_get(struct xe_device *xe);
>>   int xe_pm_runtime_put(struct xe_device *xe);
>>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>>   #endif
