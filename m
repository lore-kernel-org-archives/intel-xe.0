Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C3C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA3C10E1D8;
	Mon, 18 Dec 2023 18:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF4010E1D8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702924011; x=1734460011;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oZ9qYXZDemacnYRWpyF8mbkKZJLRCDTOkb3YsDZFHss=;
 b=EvhgtX6jAfUd6aOZwcs1JLgCYFGEYpRMZV6OH31QM1GfvsX/yks/Yfbi
 crYyLjXPHVCoSwfdCiBm8PIBYUJcxF84YSab2I+y2jmUN541jyrGAJuV8
 Cv5tf8/RkAWrgjx+i3vjd04FBY/nEtNcPnOOQBsiRxzuPMcDSLPmA4x+f
 LltHmvVwvCumHZE0sUniDCPQ0LnRKxIMgRcJbED/Um6LdTfEr97s8xtZI
 IYJ+PMUzb7FvbnDHfKcYwIwkem1dd0JFoFwhfYVVK3PzZ86t8BkFtojMn
 UQEYOo79C/OxPK7X7e0NN5zgzLU07wxGX632ZyaQdMEVg7trp/1WlHbXG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="395195301"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="395195301"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 22:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="893698701"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="893698701"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2023 22:08:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 22:08:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 22:08:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 22:08:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdbm3EhZsLqlyZRwtcVbRjBoc9mJgpJCohmuRerxjX3dVNUMZIpoJPnLDO65AtT1az39tuAwLR7m3phk3YK8An3UktVYdLB3KMjUnHDOG217GNfwOhNg2okwXiGhVGqOO1ffyTrjgTzI0Rdmrt91feeupA22aAPQeRKECRCjI6mxwM03FDsX0H8V5rl3NtRyNsZ9NjnhCR2D3KCjqVGxKgj+qhp937RWoEJUqoTRp8FKPPK77kxx+y+vPilBxLm8zz4VAVGKCRqrQFqzNqmLh7adfQ8f6tWLfpbjIQyCaiNznJIHwA/Dcont7bjI4HBiXtW/U480PqqtaGN6P4Jrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISUCq1PArIe+Trnz7o5HsvvecHsXHplTbgWdLun657o=;
 b=lSdJaXB/7KE8p+lAPDAXvIXKi582mmV2g4I9HNnjMgOibXSA3f9a0KvGh7xkyfpcHg4Knux5IENlD0CDdjIjQeUI4WwEGTceCu7UvPBKToPHaCKmuPZJbbhRkEQ5iAqObGmovRzIpzlIL2oSK/MA1BiyaSMdJWo4XaIOAbEyF/WU7ajkPNUy167vLjq4xnYBwPcLhIjc2CJUsrGpkwX9R5R4ucjsSYjVMHkUN21rz4FfpTP+OLuIYXNG/M5v4NsfFRILQtUAyvTAqakQ0xWm/r14iB1UEXZ4wkGHZLD6IPdIVaBmATPKBWDKLceqe+Hq2lcrO9VQHhCMQQw5n1mHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 06:08:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 06:08:06 +0000
Message-ID: <4cb9887f-ede7-4b95-9d3b-cf01ca84adb9@intel.com>
Date: Mon, 18 Dec 2023 11:37:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] RFC drm/xe/guc: Add interface for engine
 busyness ticks
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231214113144.251726-1-riana.tauro@intel.com>
 <20231214113144.251726-5-riana.tauro@intel.com>
 <b5db65e9-75a3-47d0-bcae-0b29f1d7cc76@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b5db65e9-75a3-47d0-bcae-0b29f1d7cc76@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d75d063-7734-422c-9237-08dbff8fb303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X99sEZ6SZah5d47LlA7F7EszvUtOEiDw4sFCtL1jGna//Od46siUsB+A6JJREy0IQCCSjlin5REY5+Nchb6fdyMAj37NShmhEPL8KybkUMqCeQC2ct+AhKZrJSN+3IdVJz74w15LPsSGa9ZUii5ooEZlj6o5wHy4+X1ADeogdFXKvAwDSqKeoLrYQtMsscztC8l5DSF9dULdHjghxcSyizWuf/9jqrHYO1FH6COtgw9PetMkClz96X5/wEmS0weWK3wXdPdIwniVX9hXsEIb01/0gh7aRXEbHtj6t0od9HgNp/jnBpwiI/eTzmVY//Pb0OSu6X5ZS7deMPLyuiH1GImfM3GIlP0LirPVo53gsXMOqeaFN5bN3VQmls2oJFMi0t5GIN2E7VCQzQGrXSkgcWtCSL8+tEOEGJHl+2br8oKe+dUdQ/ehoirICkEMUN1e25jvDlrTE9/gkTKby8sCyekCImpwzs5z66EyYiGvt3KN9Zpf7YFjtE9Nk1Tv713auyufsyt951k6U59ew7ItVJ0i8mWX6piE7u4NqmY2f5253Ixc5w/hC8qXcKGd49hCNyRrPUnqlpq/8YuK+El2E/aCe3ossvBPH/eF75tFfJWq0ua+MLf24aJvpt5NonvFSiRo7bunMwvfXXA8cL745g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(66946007)(66476007)(66556008)(38100700002)(82960400001)(36756003)(31696002)(86362001)(83380400001)(26005)(2616005)(6512007)(53546011)(6506007)(2906002)(316002)(8676002)(8936002)(110136005)(6666004)(478600001)(6486002)(5660300002)(30864003)(44832011)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJNK0w1MitPVUpnNEIyalMwK2NTVy80cWNEMXJNUnZ4SmNuZFlUazZPYmxH?=
 =?utf-8?B?dnJzejVxSXlSYjhsUys1cjBCUVFPa0djazY4Z2pKVVlKd1ZuTm5NT0h2RmNs?=
 =?utf-8?B?N3RtK2xtNzl4RFZrd1pTVlFyakEzWTBDem83VURPMDVWbUl6a21Gd1NpTmsr?=
 =?utf-8?B?YjVSSHRQKzVCd3cwWUY0ZUFPTTBTdVYvSFJzWlE5Zm54RkNQOS9USXZ0OUx2?=
 =?utf-8?B?ZXR6RUF5dllJUXRkb29GaFpYeWplYlhncjN6aHhXejB1MGdCODY2V1E4eHRP?=
 =?utf-8?B?WXRzaGdaZkJ6T3lCZ0JGUFgwVk9hS2RFWE9CalFhLzdHS2dmMk1vUU1xVm1L?=
 =?utf-8?B?cVlFemMvNlZ3dDVzcmEyQkJWdStZd21xT1EyQ1ZuQTF4OHRuMlJCQWJ4TWF2?=
 =?utf-8?B?MmNWKy9GVjNJMEtPQTZSRXpWS3NPODMwVkJ0ZVh6Wk9hWVMvUlBvQ2VLa3NR?=
 =?utf-8?B?eHpYMjdvYmJ5bVpROUV1Y0tNZGZEQVh1eFMvNE8xRFlmN2lXWnVLSkN2UjRO?=
 =?utf-8?B?RHNDRVp0dkVuMWNlUUFTM3BHeHNIYnVhWTBJaGRyNEJ4WHl5R1BvYWJDL0pw?=
 =?utf-8?B?UXB6YkR1K3RyZVJQV2V5dEd2U3dWUkxnN1ZWYlZjaHRYS2dnZXdRdFhHRlUv?=
 =?utf-8?B?TEZBbWVMQUY5VTdRQWduNVFoS1kxWGVZRy9xdTJSd2RSVGIyRmZ5YW5BWnhK?=
 =?utf-8?B?L2o0WG9iTVhEekgwSG83dDd2clhCTXRVakgwQjZuVTNydjkxQkx3Z2FPcEsv?=
 =?utf-8?B?TDJHdWpiVE9YRmVLMkVGYThEZW1rT3VyVWN5eitRcWxyWmkzMUM5eDdFQ2s1?=
 =?utf-8?B?SUxSY1Q3ZGVCT0pHZi80QXpvVkZ0MFN3NlQyZThTY0hIaVZQZXU5Q1h0ckd5?=
 =?utf-8?B?Z2ZQbFBSL2VwejhFZnhPT21DMklUNldLL2JsaC9rVXZjVnNkdzRkS2hpSjdi?=
 =?utf-8?B?TnJDWjhPbS8zZmJOV2FIQkx0Ukg2czBBNHJXZ2hqSGJUNzF5dE9EVjZXcmlP?=
 =?utf-8?B?Vk9BYVlwTlFVdUVLeUwxUlJxYXREZkNaVVE2T2VSN0ZkNStaaU9oWUZRcElJ?=
 =?utf-8?B?Smhab1hzS3dsWUU1cHc0M3VTaTR2YTlOcE0vcVlIV3N6VTQrYWo1TFVWUWtN?=
 =?utf-8?B?OHJlNm1FZHgzS2E1UjNaTjR1TitpYXNLQXF2b3lmd0hxK1Q2SlNrN2FDZ1Ry?=
 =?utf-8?B?UXlQUVRVUDlndUF4Q056WnkxRDVja2VHR1ptZmxlai9uNmEwTklqSkFORUlY?=
 =?utf-8?B?cWJNc0ZCSjVYN1JsTHlTNmdoWVdBWWVGRkNqZGJBblJiUVVYdzVHMG4weTV3?=
 =?utf-8?B?bE9XR0k2eW4zL3RtWjN1eTZ4TDRQYUE3aVdVWUllZGtPY3VoNlR6Szg0VkpB?=
 =?utf-8?B?eHFGalQxQUFZcDlGdVgvNFErRjhWOVp2bjgyZWpaVzFFY3BXeVR1NklyQU9l?=
 =?utf-8?B?eUJQNzlJL2dyUVE4YXNRNE1RaHlwYXBjK05NNnV0TVJreUxQMzZaMU03ZndW?=
 =?utf-8?B?dFpSTWRMQ3N3dUdpRUduMzhlcXp6bkVEeitETkxpc2Y5QlJTS3pUVnlONDRz?=
 =?utf-8?B?ejJ3QW9uVUs3UGliVWcrVjRXdXZDK0FEUzdlY3NjRGR4V0xIeUt1R3JvVVBJ?=
 =?utf-8?B?TFJ5S0psVVJ0dGtrWXczVFJPQkFXemZROXlhdTRadVRuYU42SVlSL0VNOHFQ?=
 =?utf-8?B?MUFyTkdGWG1ZcEorb1VXT1ZtNmhYYkllU0M0eEloUWhnMVNyN2NxOGQxSi9l?=
 =?utf-8?B?TlcxaU9NL2Vnd0JjaEVXTUt3VktqRG5nUk5teEZtdGc5c25odnZYbGI4SEVO?=
 =?utf-8?B?SHpUdHBMY3NEZlhrNE53Z08vR0FUS3lLaXVUZ2ZvL0FQWVF1R1ovL1JDQ1lm?=
 =?utf-8?B?eTdVVHdxQTBYMzlnS0ZpdHJVUjlqTnlWd1JSakhKcTM0Zm1YcDFUVkVjOGlT?=
 =?utf-8?B?WDBFamd0VDJ1WTZZb0xLRnVvbEZKUEpZWUk1YXUwellUbTdKelZ0bWJQaFMr?=
 =?utf-8?B?SDJ4dlg2TTZpTmtSckV3VnA1SGxqWE12YTFYd1BkUVJoWjdoVk1hY2FpVVBQ?=
 =?utf-8?B?ZmErcm1wbmlXWitnQ09Mdi9GQjJIMUxBZ3FzbFJRSmt6UnRzZmZJNFB2MFdm?=
 =?utf-8?Q?IVQ+9zssXy5WZUEGOAFK/sg9F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d75d063-7734-422c-9237-08dbff8fb303
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:08:05.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2i/vo4WNQFPY3P7RBpDXgAaqyORP76gMFQdQPL/oAst77GN6YcXPUqJRJ99rlRFf6viXZdzrTTh/ecnTJuJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
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



On 12/15/2023 8:18 AM, Nilawar, Badal wrote:
> 
> 
> On 14-12-2023 17:01, Riana Tauro wrote:
>> GuC provides engine busyness ticks as a 64 bit counter which count
>> as clock ticks. These counters are maintained in a
>> shared memory buffer and updated on a continuous basis.
>>
>> Add functions that initialize Engine busyness and get
>> the current accumulated busyness.
>>
>> Co-developed-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>    drivers/gpu/drm/xe/Makefile                 |   1 +
>>    drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
>>    drivers/gpu/drm/xe/xe_gt.c                  |  13 ++
>>    drivers/gpu/drm/xe/xe_gt.h                  |   2 +
>>    drivers/gpu/drm/xe/xe_guc.c                 |   7 +
>>    drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 153 ++++++++++++++++++++
>>    drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  17 +++
>>    drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 ++
>>    drivers/gpu/drm/xe/xe_guc_types.h           |   6 +
>>    9 files changed, 215 insertions(+)
>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b0cb6a9a390e..2523dc96986e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -85,6 +85,7 @@ xe-y += xe_bb.o \
>>    	xe_guc_ads.o \
>>    	xe_guc_ct.o \
>>    	xe_guc_debugfs.o \
>> +	xe_guc_engine_busyness.o \
>>    	xe_guc_hwconfig.o \
>>    	xe_guc_log.o \
>>    	xe_guc_pc.o \
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 3062e0e0d467..d87681ca89bc 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -139,6 +139,7 @@ enum xe_guc_action {
>>    	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>    	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>    	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>> +	XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION = 0x550C,
>>    	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>    	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>    	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index f5d18e98f8b6..9c84afb00f7b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -32,6 +32,7 @@
>>    #include "xe_gt_sysfs.h"
>>    #include "xe_gt_tlb_invalidation.h"
>>    #include "xe_gt_topology.h"
>> +#include "xe_guc_engine_busyness.h"
>>    #include "xe_guc_exec_queue_types.h"
>>    #include "xe_guc_pc.h"
>>    #include "xe_hw_fence.h"
>> @@ -794,3 +795,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>>    
>>    	return NULL;
>>    }
>> +
>> +/**
>> + * xe_gt_engine_busy_ticks - Return current accumulated engine busyness ticks
>> + * @gt: GT structure
>> + * @hwe: Xe HW engine to report on
>> + *
>> + * Returns accumulated ticks @hwe was busy since engine stats were enabled.
>> + */
>> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
>> +{
>> +	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index f3c780bd266d..5b4309310126 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -42,6 +42,8 @@ int xe_gt_resume(struct xe_gt *gt);
>>    void xe_gt_reset_async(struct xe_gt *gt);
>>    void xe_gt_sanitize(struct xe_gt *gt);
>>    
>> +u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
>> +
>>    /**
>>     * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>>     * first that matches the same reset domain as @class
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 482cb0df9f15..6116aaea936f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -18,6 +18,7 @@
>>    #include "xe_gt.h"
>>    #include "xe_guc_ads.h"
>>    #include "xe_guc_ct.h"
>> +#include "xe_guc_engine_busyness.h"
>>    #include "xe_guc_hwconfig.h"
>>    #include "xe_guc_log.h"
>>    #include "xe_guc_pc.h"
>> @@ -306,9 +307,15 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>    
>>    int xe_guc_post_load_init(struct xe_guc *guc)
>>    {
>> +	int err;
>> +
>>    	xe_guc_ads_populate_post_load(&guc->ads);
>>    	guc->submission_state.enabled = true;
>>    
>> +	err = xe_guc_engine_busyness_init(guc);
>> +	if (err)
>> +		return err;
>> +
>>    	return 0;
>>    }
>>    
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> new file mode 100644
>> index 000000000000..287429e31e6c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include "xe_guc_engine_busyness.h"
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "abi/guc_actions_abi.h"
>> +#include "xe_bo.h"
>> +#include "xe_guc.h"
>> +#include "xe_guc_ct.h"
>> +
>> +/**
>> + * DOC: Xe GuC Engine Busyness
>> + *
>> + * GuC >= 70.11.1 maintains busyness counters in a shared memory buffer for each
>> + * engine on a continuous basis. The counters are all 64 bits and count in clock
>> + * ticks. The values are updated on context switch events and periodicaly on a
>> + * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
>> + * a caveat that is not real time, best effort only).
>> + *
>> + * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
>> + */
>> +
>> +static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>> +					  struct xe_hw_engine *hwe,
>> +					  struct iosys_map *engine_map)
>> +{
>> +	struct iosys_map *map;
>> +	size_t offset;
>> +	u32 instance;
>> +	u8 guc_class;
>> +
>> +	guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +	instance = hwe->logical_instance;
>> +
>> +	map = &guc->busy.bo->vmap;
>> +
>> +	offset = offsetof(struct guc_engine_observation_data,
>> +			  engine_data[guc_class][instance]);
>> +
>> +	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
>> +}
>> +
>> +static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>> +					  struct xe_hw_engine *hwe,
>> +					  u64 *_ticks_engine)
>> +{
>> +	struct iosys_map engine_map;
>> +	u64 ticks_engine = 0;
>> +	int i = 0;
>> +
>> +	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
>> +
>> +#define read_engine_usage(map_, field_) \
>> +	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>> +
>> +	do {
>> +		ticks_engine = read_engine_usage(&engine_map, total_execution_ticks);
>> +
>> +		if (read_engine_usage(&engine_map, total_execution_ticks) == ticks_engine)
>> +			break;
>> +	} while (++i < 6);
>> +
>> +#undef read_engine_usage
>> +
>> +	if (_ticks_engine)
>> +		*_ticks_engine = ticks_engine;
>> +}
>> +
>> +static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
>> +{
>> +	u32 ggtt_addr = xe_bo_ggtt_addr(guc->busy.bo);
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION,
>> +		ggtt_addr,
>> +		0,
>> +	};
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	int ret;
>> +
>> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>> +	if (ret)
>> +		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
>> +}
>> +
>> +static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_guc *guc = arg;
>> +
>> +	xe_bo_unpin_map_no_vm(guc->busy.bo);
>> +}
>> +
>> +/*
>> + * xe_guc_engine_busyness_ticks - Gets current accumulated
>> + *				  engine busyness ticks
>> + * @guc: The GuC object
>> + * @hwe: Xe HW Engine
>> + *
>> + * Returns current acculumated ticks @hwe was busy when engine stats are enabled.
>> + */
>> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>> +{
>> +	u64 ticks_engine;
>> +
>> +	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>> +
>> +	return ticks_engine;
>> +}
>> +
>> +/*
>> + * xe_guc_engine_busyness_init - Initializes the GuC Engine Busyness
>> + * @guc: The GuC object
>> + *
>> + * Initialize GuC engine busyness, only called once during driver load
>> + * Supported only on GuC >= 70.11.1
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_engine_busyness_init(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_bo *bo;
>> +	u32 size;
>> +	int err;
>> +
> How about adding guc version check here and places applicable.
> I am seeing patch 8 handles version check but how about moving  version
> check function in this patch only. This will also align the code with
> the doc.
> 
Hi Badal

I added it seperately for the ease of review. Since this patch is big i
could seperate only that out. Once that version check function is acked 
i'll move it here?

Thanks
Riana
> Regards,
> Badal  > +	/* Initialization already done */
>> +	if (guc->busy.bo)
>> +		return 0;
>> +
>> +	size = PAGE_ALIGN(sizeof(struct guc_engine_observation_data));
>> +
>> +	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
>> +				  ttm_bo_type_kernel,
>> +				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>> +				  XE_BO_CREATE_GGTT_BIT);
>> +
>> +	if (IS_ERR(bo))
>> +		return PTR_ERR(bo);
>> +
>> +	guc->busy.bo = bo;
>> +
>> +	guc_engine_busyness_enable_stats(guc);
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, guc_engine_busyness_fini, guc);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> new file mode 100644
>> index 000000000000..d70f06209896
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUC_ENGINE_BUSYNESS_H_
>> +#define _XE_GUC_ENGINE_BUSYNESS_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_hw_engine;
>> +struct xe_guc;
>> +
>> +int xe_guc_engine_busyness_init(struct xe_guc *guc);
>> +u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 4dd5a88a7826..c8ca5fe97614 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -37,6 +37,7 @@
>>    #define GUC_COMPUTE_CLASS		4
>>    #define GUC_GSC_OTHER_CLASS		5
>>    #define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
>> +#define GUC_MAX_OAG_COUNTERS		8
>>    #define GUC_MAX_ENGINE_CLASSES		16
>>    #define GUC_MAX_INSTANCES_PER_CLASS	32
>>    
>> @@ -222,6 +223,20 @@ struct guc_engine_usage {
>>    	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>    } __packed;
>>    
>> +/* Engine busyness stats */
>> +struct guc_engine_data {
>> +	u64 total_execution_ticks;
>> +	u64 reserved;
>> +} __packed;
>> +
>> +struct guc_engine_observation_data {
>> +	struct guc_engine_data engine_data[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>> +	u64 oag_busy_data[GUC_MAX_OAG_COUNTERS];
>> +	u64 total_active_ticks;
>> +	u64 gt_timestamp;
>> +	u64 reserved1;
>> +} __packed;
>> +
>>    /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>    enum xe_guc_recv_message {
>>    	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index cd80802e8918..4e9602301aed 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -70,6 +70,12 @@ struct xe_guc {
>>    		u32 size;
>>    	} hwconfig;
>>    
>> +	/** @busy: Engine busyness */
>> +	struct {
>> +		/** @bo: GGTT buffer object of engine busyness that is shared with GuC */
>> +		struct xe_bo *bo;
>> +	} busy;
>> +
>>    	/**
>>    	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>    	 */
