Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361DBC83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 05:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918B10E3AB;
	Tue, 29 Aug 2023 05:27:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223F10E3AB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 05:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693286858; x=1724822858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f35M9VpzbKL9Afcd+yXB0B8u0AIsKJ7wHsYFo8xR5Co=;
 b=X/GDVHl/hS4fpbRxKvS8d++IwoJKYU2FN5XamK4aiRVrtfmMDNXhRQQF
 yafCWLjHHsEvDo33o1Es7BZFJowhufYS751DuI9TJ18XqX5T66BrFdas8
 c2PSrB8QyI+PeggD9IfXt0GqVPym+R5DmLwtM0HypVx/1ULz8zzsrOdcw
 1nCKTmlUcRLHvTcQAXGW4Aj9YNx43KvQ82WHkU0QTpgcn44OpwbceJ4XA
 tnlLr+WV8fdLSeuKa1yeUxxz+VWQi0md38Uas/2JDkgPoDdGfESLgXeGd
 IuTpRRuZRKz7QGi9Yd+bOnn0tuVV8JoLymtf55nVDO66cNMerYUMuVrwC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354793417"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="354793417"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 22:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="767931795"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="767931795"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 28 Aug 2023 22:27:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 22:27:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 22:27:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 22:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke4BFL112AIHwmqNV8YmkjrEZGryL+p3I1i3ykxx9jZCuJXJ1I8ZzufzLxbf/3X4CN0CVSg6nNyIwuzKNlGGUhfiR/sAeYnksZEeUD5fiHYuA9FXb1lEmwVEQKb7vr5iNXyE417uDu8qjYDoquiQfd9Fd/4hofrPAySlgUZLrMLBmeEA9ehruebPJ2HCsMqBllo7QZM2lZuZf67jmmeygJt0/YKFW3MEfnL1x9DvcV0f5N+0bVha6TvdC17fmhaA/E+EU27w0+jQCu084eNOmzkBcYCfGLfUam0OpTnhszYRVGeAErwiWug87HOWTKocUWS+15V1PhN3yzovXUzq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETAcv/TOB2zGn/EaFvv7X0aMmKwk1fwKgaP8g6jH9i4=;
 b=hExey3uvuHO2AMnH3oc+pYZD9xUGylqmV89K8fihbw4pF9/4ckHzidBS4Htdh9w9l46AF1BpI5DC8vAofv80CsSySjSdfXnvAmTw5TUchJUtvc2Cj/mC99JW88dV/0eHadW6hlyxnUfwWcsT049o5GTOggIb0/8KdBtogimaNFtveHq54l03dD5LXX4zexAdUjfe8DGpCKUWWGHZYxIUnjjCidHYLhXoBaYvM5YzflwgFI0cg2RW6ch/14k5w//tsE4t5AqEiKxjJe2iDk0wExvkarBI+NPf7NSXaU91nGG1z001kQgnBdWsMHFHsLfE4iRWuSX2Sr3YeL+XF0hzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 05:27:33 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 05:27:33 +0000
Message-ID: <a4a97858-e16b-4571-777d-349cd33c2544@intel.com>
Date: Tue, 29 Aug 2023 10:57:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
 <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
 <ZOVLT+qHEZjIzga3@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZOVLT+qHEZjIzga3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: a705d7e3-568f-47ed-d053-08dba850a558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4ZJht+vf1O29aJutWVXlf5AOmZNajvqpUQ2vpIg3ubF0GqtkBJN1wFzYcz3FAQZa7PxipjAIGB5Iulmb8LiCtUmO3AEAByEISq6Z0VsC9JBBTd1f8ehiWZQp+tOLKjQAhdJoqS5MZxTO0zk5ZW/F8Pn4zMx57R20w8mSmR45cN6IfQDE7fmCJ1FXeuM0gOlovFvP5s4DWw9lUhFh/EbfXPizdawI44osuzIudBCbrO3iiuea1IL9d24WPIpJITZauC/r98F7sNzzOV60UPAZpKz4SVBs6V6QzKuWmM62IIBnk5DgM2g23hpaCz/ZsNAJBj9b079SZqxZ4fDXhN1qkCUMThP+nvjFuK8bJzB4/iw1S3RR1xycgSvfMgmvClZFL4aUT4i9uLw7M1qfvISRCF1cHXFsf23Lg5SWQSgpxi5BshlJlPn4t06BxF5VLH6H1/07Qv9YVQo8413rfwQdOHYt7orzJK3pKwSDSgltsc2aRhaTfqWqpDANJKAiQuK9PjbsF9YqyKYEAc5Q0PlWrHNW0tldXMUNW1MdegAVYp1rJNSouOB1EnC5ZlP16Vkb2l/xSQyLM8+Xa+D1jOD4iiQEV8NA7ctc4Uvw5kVA6HcTSd5HmPpvPGIVpw44XPRvmhCcOxJzr0Vuet9JHRr3P2i25Obh6Zru1ismzUUVTnrftqqeCcPxjBeYC2hcqVN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(83380400001)(478600001)(31686004)(26005)(2616005)(6486002)(6512007)(53546011)(6506007)(6666004)(31696002)(86362001)(30864003)(5660300002)(6862004)(2906002)(82960400001)(8936002)(38100700002)(66556008)(316002)(6636002)(8676002)(37006003)(66946007)(4326008)(66476007)(41300700001)(36756003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ci9GbFJKM0wwdklXSWlKUWZrY1ZLT3VTSFpZTWV3TUxhZERWeklJR2d0eW41?=
 =?utf-8?B?TGFGekdFN1FYTWR6WEo5eFZUYzdGdGVqbkc4Z0U0Ny9DR1Exa09Pb3lrN3ZO?=
 =?utf-8?B?VUdsaFpIQ0pjNGNsc29GZnRKTDVBODBTa3J2Z2VqdnBhemZqemVsa1BPeDh4?=
 =?utf-8?B?U29wMEhkaFJIVzJQSDlPZ3hZdVhCMzVtTnRWVlBJUzhJZlhwQ2VRVWZzeC9M?=
 =?utf-8?B?M2tKc2JNcjVMV0VlTTNvUDBoQU9KVWQvbFAremtQbWZMc3JXWkJKdVM3SXNZ?=
 =?utf-8?B?cFpJK1lPMWdYcm5YNHFFaHlrVUpZWHoyQ21NanBieFpsenJmVXFBSDdxM1ZB?=
 =?utf-8?B?eDhoek4xU2VKdTFGaFFBYTluUTQ1TGFhM3paZFducWdTSEpzb0wyNzR3SDFh?=
 =?utf-8?B?d1EyZlNselVweWxpdUszY3NUT1pTV1hyOFdaUG1kZ2wzb3N5LzlZeXV4WUpV?=
 =?utf-8?B?aUE1NTBwbEFpSGVwL1cvekNSMXBRMk56NUVsek1leUwrL2VyOG9zZXFIRkpI?=
 =?utf-8?B?S1pxYUxRdjBWb2JiWjNYdEZ5TDRaS2JPTVQwVUtPdkhrbTRKS2QrSFgwNUs0?=
 =?utf-8?B?aE9zL2MzLzBid2dyVTlDN0VCOGJNbUlXY1k5SzBQRHhybm8yL21TK2JJNHFv?=
 =?utf-8?B?VTErVjFPQXp6UUlxeDBGZGhOQjZXUkVVRHAxWU94aDZoMS80dG12aVU2ajRh?=
 =?utf-8?B?RXI4clhGWnlzT3RDUWljTUZabnNlc0l5dTBVY0l2NVZCSEQyRjNBTk0ybm9t?=
 =?utf-8?B?V25zUXBadGdoNnBZWjNSMjFDWUFTdWtiUzYxbVo2c3pxT1BRcDBPT01RQWd1?=
 =?utf-8?B?bWMrN3pXdkI2QlUwcGxKc3dFSlNYaG40dVlZYVJFQjhyNWc4eklKa0tIVTJm?=
 =?utf-8?B?eUZUSUFDNWFzem02L3UyQWRIR1V1MmZGWm5qZ2R4MzIvVkN5d1BYclI4eGEy?=
 =?utf-8?B?aDZxSTBzNVBpdEtENStpeHhxNUJMVC9XaHdaVWtYTFVwY2lvQ2xvNDcxY3lR?=
 =?utf-8?B?dmxUTEFYL0U5UWg5MEprTW92UVFkSUYwd3RPOU1UeE0zWC9aZjJHTzh3YURa?=
 =?utf-8?B?eWlSVlpIcytISDdtT1JwVlVDL3hOMHB3QU9uQkRWUzdUR0JpSkoxa2R5aTNR?=
 =?utf-8?B?VEhYVFhRcmVabE9OWmsvM0N2MnFpMFRMNFk3QlNvL2UyamhhdGtPR2ZWWlkr?=
 =?utf-8?B?UWljRUFNQ1hlVjBnaEQ4bVdIRndmbjgxNjZrY25malNndXg4Q2QxR1VUR2ND?=
 =?utf-8?B?cnhUejlxczkwNE1XYlBiWXVFNXdGek5peHV2QklidStweWVmdUlOdkM3MFB2?=
 =?utf-8?B?Q2krQW5ZK0ZIdWI4aXA1OE8zblBoSEFidG9hK2MrcHVkRzQzdmV6M3NGUnJC?=
 =?utf-8?B?T2NjcTM4aG1SRE1UMmJIYTNJS2t5QlpvcU10eVdrYm96emRvNU53YjVBYTVv?=
 =?utf-8?B?cHpGK3VDRDJRaE1VNzc5NGU1T0pLVFQ3TWFOSEJEdG9WWk5kc1YwOWJMTWU2?=
 =?utf-8?B?VmwyZnVjaUwwUUg4a3cxaG9EclhwRDR3MHd3ZXZ1YXBVZEJQYm9GN1VxNmlp?=
 =?utf-8?B?aVBzT2d4QjQrVnhkNURyNWk5Vk40YTV2Rmtjenh3dTdCUVhLeHZQQ2pmdXA4?=
 =?utf-8?B?Vlk5aFJGR011eHc3MGpJbE94OTZYblRJNGU5UVlZaTVjdm90d2RGdkVEMXBY?=
 =?utf-8?B?OGJaZURqNkVJOFZ4NUVkMVQyZGh2d2xVdTRHUE53dldFNTR4MVJQRWdSYmZ4?=
 =?utf-8?B?bFdwR1VZK292d0k5OVdJWSsvVFJ2enZzRmFDZ29menYvZFpyR3p3ekloTEdr?=
 =?utf-8?B?UmNUaWVxTUZwQzZhcjNyRzk0V0lrSURoRUNLWndEQVM5SFlnaERrM0FqTFRT?=
 =?utf-8?B?ZGZ6Yit2WGZBR21zalZqa1A3ekU1dzZFVEZORmhKQm0rY2w2TGNZL1hQNTZS?=
 =?utf-8?B?UDJNVGpIbnhOd0EzanhzdGsvZmx6MjFldmZ6UEswVWlFeHFzNDF5WmZXa2lI?=
 =?utf-8?B?WWRyTGZvenJQSzlsaEU3YUtldVhadFJvbk9oY3pheGw0Q3NlczQzUlRhTjEw?=
 =?utf-8?B?b2F1SWxpODg1czllelBsTFc1UTl4KzgyNVFNR1ZCS3ZVTG1ZWFVoSFpiUnk2?=
 =?utf-8?B?TnBURm1aWTQwMzJPNHFJODdUWEZSSFkwa0JhMlhrdTg3WUx6bytzSUoyRDQy?=
 =?utf-8?Q?/LiEjYfwXvH3s7t0EBhyhuo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a705d7e3-568f-47ed-d053-08dba850a558
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 05:27:33.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUp5pFB03EE6ocMlPOndwghOpzMlxb+I037Xp1jg2ULgdO+qKdq35KsDqd2IPnOeBv9UTlV5DE7lSwo8gfrR4O3k2DTDoPdE4+xkA/Yu0wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 1/1] drm/xe: Add throttle reason sysfs
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


On 8/23/2023 5:27 AM, Matthew Brost wrote:
> On Tue, Aug 22, 2023 at 10:28:25AM +0530, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/<dev/gt
>>               ├── gt0
>>               │   └── throttle
>>               │       ├── <throttle_reasons>
>>               │
>>               │
>>               ├── gtN
>>               │   └── throttle
>>               │       ├── <throttle_reasons>
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>>   .../drm/xe/regs/xe_gt_throttle_sysfs_types.h  |  36 +++
>>   drivers/gpu/drm/xe/xe_gt.c                    |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 282 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  35 +++
>>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>>   8 files changed, 391 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 550cdfed729e..eb3ccd90b2fa 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index baa00557f114..8416d483e7c3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -400,4 +400,17 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>>   
>> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> +#define   PROCHOT_MASK				REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>> +#define   RATL_MASK				REG_BIT(5)
>> +#define   VR_THERMALERT_MASK			REG_BIT(6)
>> +#define   VR_TDC_MASK				REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..b71865f467ce
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_gt_throttle - A struct that contains frequency throttle reasons in gt
>> + */
>> +struct xe_gt_throttle {
>> +	/** @status: status */
>> +	bool status;
>> +	/** @reason_pl1: */
>> +	bool reason_pl1;
>> +	/** @reason_pl2: */
>> +	bool reason_pl2;
>> +	/** @reason_pl4: */
>> +	bool reason_pl4;
>> +	/** @reason_thermal: */
>> +	bool reason_thermal;
>> +	/** @reason_prochot */
>> +	bool reason_prochot;
>> +	/** @reason_ratl */
>> +	bool reason_ratl;
>> +	/** @reason_vr_thermalert */
>> +	bool reason_vr_thermalert;
>> +	/** @reason_vr_tdc */
>> +	bool reason_vr_tdc;
>> +};
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 13320af4ddd3..03be2c2980d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -24,6 +24,7 @@
>>   #include "xe_gt_pagefault.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_guc_exec_queue_types.h"
>> @@ -442,6 +443,8 @@ int xe_gt_init(struct xe_gt *gt)
>>   
>>   	xe_gt_sysfs_init(gt);
>>   
>> +	xe_gt_throttle_sysfs_init(&gt->throttle);
> This is the wrong place, xe_gt_sysfs_init should call xe_gt_throttle_sysfs_init.
>
> Matt
Okay will make this change.
>
>> +
>>   	err = gt_fw_domain_init(gt);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..7db67b5fc138
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,282 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
>> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
>> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
>> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
>> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
>> + */
>> +
>> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +
>> +	return &kobj_to_gt(kobj->parent)->throttle;
>> +}
>> +
>> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
>> +{
>> +	return container_of(throttle, struct xe_gt, throttle);
>> +}
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +	u32 reg;
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> +
>> +u32 xe_read_status(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +	return status;
>> +}
>> +
>> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +	return pl1;
>> +}
>> +
>> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +	return pl2;
>> +}
>> +
>> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +	return pl4;
>> +}
>> +
>> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +	return thermal;
>> +}
>> +
>> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +	return prochot;
>> +}
>> +
>> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +	return ratl;
>> +}
>> +
>> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +	return thermalert;
>> +}
>> +
>> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +	return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool status = !!xe_read_status(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
>> +
>> +	return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +	&dev_attr_status.attr,
>> +	&dev_attr_reason_pl1.attr,
>> +	&dev_attr_reason_pl2.attr,
>> +	&dev_attr_reason_pl4.attr,
>> +	&dev_attr_reason_thermal.attr,
>> +	&dev_attr_reason_prochot.attr,
>> +	&dev_attr_reason_ratl.attr,
>> +	&dev_attr_reason_vr_thermalert.attr,
>> +	&dev_attr_reason_vr_tdc.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, throttle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
>> +{
>> +	struct xe_gt *gt = throttle_to_gt(throttle);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj, throttle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> +
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..809213c3bba1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..acc23ce8d0fc
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gt;
>> +
>> +struct xe_gt_throttle {
>> +	/** @status: overall throttling status */
>> +	bool status;
>> +	/** @pl1: throttling reason is PL1 */
>> +	bool pl1;
>> +	/** @pl2: throttling reason is PL2 */
>> +	bool pl2;
>> +	/** @pl4: throttling reason is PL4 */
>> +	bool pl4;
>> +	/** @thermal: throttling reason is thermal */
>> +	bool thermal;
>> +	/** @prochot: throttling reason is PROCHOT */
>> +	bool prochot;
>> +	/** @ratl: throttling reason is running average thermal limit */
>> +	bool ratl;
>> +	/** @thermalert: throttling reason is vr thermalert */
>> +	bool thermalert;
>> +	/** @tdc: throttling reason is vr tdc */
>> +	bool tdc;
>> +};
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 35b8c19fa8bf..c55815d1114a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -298,6 +299,9 @@ struct xe_gt {
>>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>>   	struct kobject *sysfs;
>>   
>> +	/** @throttle: frequency throttling reasons in GT */
>> +	struct xe_gt_throttle throttle;
>> +
>>   	/** @mocs: info */
>>   	struct {
>>   		/** @uc_index: UC index */
>> -- 
>> 2.25.1
>>
