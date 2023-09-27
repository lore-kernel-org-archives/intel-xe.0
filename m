Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474C1E810DA
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 12:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D966810E4F8;
	Wed, 27 Sep 2023 12:16:37 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 27 Sep 2023 12:16:35 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7810E4FC
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695816995; x=1727352995;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WSllx6/7YvdOwi1eAvX5hkwQ4aCY3UXmZmhdSwU0wY4=;
 b=JwyvJGX7sqfAK/xHHkAa4x+WynxKy+p3aMk+No0MADPd40SxUY/SAd71
 8qIC9KuccqhpPx6DVCqNCHkOeuV5umoWrcYoZsofLjJKGyLfeAcq1nxSI
 RBHmSumnA5EJFFBtq7Xic/1d7lHGThCFlhrXL4Hr/OO+qHlZgr8sXXVkd
 QwGpXHC10RHTqRFX3Q1t2QjQwoT/pQnnsEjLtyJQWAXbidey+siXd8Sl4
 LUI1iYcnO4NleX01pCT8n/UjUqI0OLJG3lh9LbgCtWx3/7OZzCJDUKHg+
 rL5hNfWYUqigmIzzqWOnatRYkHxIGNHrHCR2NmtAHrfa55A6zj2wHo5CO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="404372"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="404372"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725780661"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="725780661"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 05:09:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 05:09:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 05:09:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 05:09:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 05:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbnVu2L6vzTOq99rOV20tt/VmZdKN7kON16C8FxTCLS9KVQg+Vlf26o5buofWasoonOY1Vz3AbtvQAs5HEJGmfx4Vs6gSeVG/f4PsizkmgGPRkEmz3gFQd0u8YaA0I4HofgJ1pq7cHCibzlbkTfnptITFaxlM0vz6zoWIhYaRJNgCUArhW6bIis523o7IVgUUM6tFN+yHzosghuxDUpWzHSx+Q20eSslb+KURABJpZU+U2iFqbJEXSEdjYi0c2tiRjiu1PQ6mEmMyKNlgo2GmcheLL0Cktd4eGDneMU26HEXvUoXFD+1e+JovuUaQbPfeJsn4OJ0Vv1eaGSafzrDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qire4JSUsEIGYhKbGaHgwBxEY+dtrzBYwBQa9cTIj3Y=;
 b=UF3U8xrzaefoQM687XCeJPWIDt21+zhDw/n2RLVqXaxcv80SPhmvp000PZCzBax9z9h8951cp8aSfYsSLT05x5OCmgMxiQe6qWqnzQyLNbjUF6QhKoIa3PKLekVbPSh5sjPMG0cikzxR3Ms4R+7HrJYM8YiWWmCq2HViCnvIUX3IR7qg9OR7mgsSiYx0/1S6/wZOW2SnLHNIM0LmY56zFOgs6apa/PuTbaTFfwaQSCZ6cI8mbWHBBikTM+hVeNtRTxFXU+qpbUbZ8dYIbRQsSdZYTZ31FZT/gkbjw/YEe9e+wXCy0YSk2eztUduT3fXeipDiMCh1fRybc0dvxGkxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.21; Wed, 27 Sep 2023 12:09:24 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 12:09:24 +0000
Message-ID: <dcfa5577-ed43-651f-8ead-733cd7833a3b@intel.com>
Date: Wed, 27 Sep 2023 17:39:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230926143916.333958-1-sujaritha.sundaresan@intel.com>
 <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
 <2384762f-7d2a-03d5-56ff-e11100f392f9@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <2384762f-7d2a-03d5-56ff-e11100f392f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::22) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 1508d732-4455-4f3f-1863-08dbbf5296ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJumtKHMfR97r34mMR/1NL3czL00oSi0V4tPGNkYgWW1vCDcHzYv+UN37p0h4cDS82OiF4YIffRO95lvdUFiSDy12jtfxOSU6ZjvIH6vCrNpFSMmpB/afeTyZdXb7srcxkxk/0qJV+ApqGz04wFVPU2AOXMYGf/FIbilveBSB7oZwWIuSSj10rxocteuBAp0NxxFnwyPvpg5gLOTJjwNiROwQXSz/36E8tG0uMbTOyKT0QZkyGFT+udkiqCv3I2wmXHbx/4Oq2vRS7OsFLkovBJ3UvB27khDGzSGsTc+sPcFrOUQPS9Xl7vYxOkIPJrzTvLiVfSRUZXQ9JlBEyI2qud/KlkK/VF53ccc9GD+E+cXu7MPrHH6sTqAhcE60kX2uu486Cjnv82nlJ3yeCxYpVkPeADQV/svb4mqCSgBYN6v3soxJdLssDHcJANWA5wUYl+ljFgXb5KQxRrZ6bi2+sGSvV4tc1ThIrsj+01bd/qXSmmIDQO4RnEKm8dntDiK/cA05Gx9LqtL0rgbpBJrObxILfmI3Ka8WvslQCwUwH81/7nXWtoD2uik13WADFC9S4LTQhLb4NjKyHUOIO/IX/5ql3eP2P7MRhLiCGlTjzCLNtMR9k5DQoq4swmp1nTvTzJjlK6dOj9rEcb4sCD301atCdVUE+2xGxP5iflCHZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(30864003)(38100700002)(6486002)(2906002)(5660300002)(8676002)(8936002)(66476007)(66556008)(66946007)(316002)(2616005)(41300700001)(6666004)(83380400001)(36756003)(26005)(53546011)(478600001)(31696002)(82960400001)(6506007)(31686004)(6512007)(86362001)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGN5eXdhczVTbnF0OFErRGEyUnhVVThTaGQ2ekFlOXllc05xZWU2cGhscmRY?=
 =?utf-8?B?V2NHK1o2Q2YxRkFRRWNtRkJLbytJclNadDJTVU1MNjZqL2FwdExPYXA2Z1Y4?=
 =?utf-8?B?NnBxU2xqRlRFYWh6R1A3YU55TllIbEQ1MUNPNGlpTktJVDlucVFVVlhFZC9n?=
 =?utf-8?B?RVlibFNOUStzNmhOSmx4YS93eWNIcmNaYmtFWHFMMWc3M1dVMUE4QW9vNWts?=
 =?utf-8?B?a09tNC9sdHM1ejFXZkE0dTJ2b1pyNzkvdzQ4MG5ybTFNRnExMWpEYis0aEdv?=
 =?utf-8?B?T1cvbnZpNlNpSVQraWFZbG9nR3F1RnlXRm9waUJYVmx0THlDL0ZlbGJPRG5H?=
 =?utf-8?B?Ulc5c3gvdTQ5WjVqYjVsSE0yTGd0UjZyRHR6T1Zib2hxblBhMWlHTkI2S0hE?=
 =?utf-8?B?MVk0ZjBRczVjTEtYa0JkdFh0TGZ5eFdSYkpJelRRWVNlRnBIclh5VXp1VU9R?=
 =?utf-8?B?cmxCQzh0WGtLWGhCYXdlUi9paUlkQUtSTk9wU0c1TXg3YkUwMFErVGM3Z1lO?=
 =?utf-8?B?OFRGU0VVUjdza2t6WC91SlJYYWZZTFp3Vnc0ditobnIrOEJrYjliaXd4WTJ3?=
 =?utf-8?B?R29yTEgwQnpxQTZzV21CK1NYTTRLYUltVzVVQXhsQUhHTFRwNjl3cWpSWjI2?=
 =?utf-8?B?N1J5VWxvZ2VtY0RBODdtRkQ3WWVrZ05qZXRNZXNQZlR6bnhtVzVSWUxLVXVR?=
 =?utf-8?B?blRHMmdYQ2tVRUJXbWxWM3FKZi9nZHM5T2tBVmdBT3NyamJ3ZGkwQW9reWRw?=
 =?utf-8?B?MWNkdzRDQnBlL3BWanZ2Y0NqR3JNdStJK1cyUUFQTG16N2RvRFZXSHlIRzM0?=
 =?utf-8?B?OUdScUNwQUdZQ3UvbmFtNmZwYVFWWnFUL3ZjVEk2ajJmdGZEVnZkSDJVeURt?=
 =?utf-8?B?L3RGYys1T2JRVHozRGlWUzBxTXJmRzE4YWJITy9BVmo1S3lpWk95MVNwOVNo?=
 =?utf-8?B?eUQ1NEF0Ly83SFRTS1NTUTRBNldoaXBMUmFVejBMZjBJSWRzZnRPNGs2SHh2?=
 =?utf-8?B?TTNNeWJ2eFRZNm4wWGVqYjRyODl1Q01GODJISmgxTXVad0kvU2NHRWxXWUo2?=
 =?utf-8?B?U3VISnJJdzdjSGRBbkIreW1OY2dWL2w5K21lSXo0TE4wbkNUMVZIV0txYVZM?=
 =?utf-8?B?Vmdsb0VLMmpCdXlVQlQzWEdjTUtURDRMWlBEUTdkSzBaSTZiTlhxaXlmclUx?=
 =?utf-8?B?ZFBwTWJhSVV1dndHWTNYblp0aEI3NHVQcVN6V2k5dFFxRGpnNWN3UlZORFND?=
 =?utf-8?B?M0tkZFhUbzBsakkvc2JHS1JNRkl4SE9DRFlORlkzanovQXBiS1JYT2c5M0Ro?=
 =?utf-8?B?b0RDYk5EUVdnUzRKRVFweEx5S3hVNUNEK1lPclU5SDNjRWJ3Mkd0TFJMOSsy?=
 =?utf-8?B?a1N4TmRMclBRcUdMUjYxUTRoOVpqQXZkbi9LeHVSOFUvVDRreTJuemhGSUhz?=
 =?utf-8?B?am1wa2tNKzh5dXRMQ3NobFd1MUk1YnBhMkxRclNSZHQ3Wkllbi93OFkzL0RE?=
 =?utf-8?B?UDRDN0xCWm5jWlRRYlQ5N3dPd1hlaUdKR0g1djYwa05OTFhhSkh1VzJzWDNG?=
 =?utf-8?B?VURjQS9mK0N4S2Q2UjJIL2ZaOU9TWTFrRHBzVm0vUzE0SEVyWU9wbkEyeStG?=
 =?utf-8?B?c1o3ZDRyL0xYZ3hVNi8wVE1sMHdTL3RHZEVwZGpydEpZZHRPZTJFS1pQRjhm?=
 =?utf-8?B?L3FWWTA0cW9waGNZTmEveUVoOHdhSStGSUVNdmlxN1ZtQjlDRld5Z3p3THE0?=
 =?utf-8?B?KytaQnhCL0pJRnR2dzhTZWZnVE1KVm8remNiTHkxKzRLMVpUeUtnNUYwTWo5?=
 =?utf-8?B?c3Jmd3VDZW93VUgyaSs3NEVwNDVLenpyNDFCUWpRUk9DZElvZm9zZ1dGVUNJ?=
 =?utf-8?B?dFRCYkFtdmg0RVNLTUplV1Z5Z1BYMlJXSEZJZTlFR25iT3FCUDRkOEhTaHgr?=
 =?utf-8?B?ZlNwYUl4b0NVbGFudlByc2l5SkdqMldoVzhHcWR3MEp4ZnI0MzdJUXMvNTc2?=
 =?utf-8?B?S25WMTRrMW56YWI4dnlyQWVKZFRub0IwcFBTc1cxMjQxa1FaVzhaYjg0Nlph?=
 =?utf-8?B?anVucWh2aEk5cXhqSEs0dFpZV3c1K0VCaE4wWVBaMHF5RFNyT0pDajBacmtS?=
 =?utf-8?B?dFNkTE1jMVRIZkxJNU9oYjdlb09qQWNtZ0VKMUZlaXFMRW9NNzJRcTVwWjY3?=
 =?utf-8?Q?g/ehk1IO2DHFRJOpaZSR32w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1508d732-4455-4f3f-1863-08dbbf5296ca
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:09:24.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1Bg3SE7Pu7LT19Q5ZC4Pe5CfC9Etji2P0N9iCA0VnDM4K2lYG4Isq7qJbFqgoX5uj4Z0RYV8JvV94/bkzyZ+cCIBQv74UyDT0cERopiNHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/1] drm/xe: Add throttle reasons sysfs
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/27/2023 4:41 PM, Riana Tauro wrote:
>
> Hi Suja
>
> On 9/26/2023 8:09 PM, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── gt0
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>                 │
>>                 │
>>                 ├── gtN
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> v2: Fix review comments (Riana)
>>      Move init call (Matt)
>>
>> v3: Remove xe_gt_throttle (Riana)
>>      Make functions static (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c          |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
>>   5 files changed, 289 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b1681d1416eb..9aa61e416a24 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>>       xe_gt_mcr.o \
>>       xe_gt_pagefault.o \
>>       xe_gt_sysfs.o \
>> +    xe_gt_throttle_sysfs.o \
>>       xe_gt_tlb_invalidation.o \
>>       xe_gt_topology.o \
>>       xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3a4c9bcf793f..374238dd8a06 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -411,4 +411,16 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>>   +#define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
>> +#define   PROCHOT_MASK                REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK            REG_BIT(1)
>> +#define   RATL_MASK                REG_BIT(5)
>> +#define   VR_THERMALERT_MASK            REG_BIT(6)
>> +#define   VR_TDC_MASK                REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK            REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK            REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK            REG_BIT(11)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS        XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..dc3f841b49d0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>     #include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>     static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>         gt->sysfs = &kg->base;
>>   +    xe_gt_throttle_sysfs_init(gt);
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>       if (err) {
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..12facebd8989
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,257 @@
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
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, 
>> Iccmax etc.
>> + * device/gt#/throttle/reason_thermal - Frequency throttle due to 
>> thermal
>> + * device/gt#/throttle/reason_prochot - Frequency throttle due to 
>> prochot
>> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due 
>> to VR THERMALERT
>> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR 
>> TDC
>> + */
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +    u32 reg;
>> +
> xe_device_mem_access_get here?
>> +    if (xe_gt_is_media_type(gt))
>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +    else
>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +    return reg;
>> +}
>> +
>> +static u32 read_status(struct xe_gt *gt)
>> +{
>> +    u32 status = read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +    return status;
>> +}
>> +
>> +static u32 read_reason_pl1(struct xe_gt *gt)
>> +{
>> +    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +    return pl1;
>> +}
>> +
>> +static u32 read_reason_pl2(struct xe_gt *gt)
>> +{
>> +    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +    return pl2;
>> +}
>> +
>> +static u32 read_reason_pl4(struct xe_gt *gt)
>> +{
>> +    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +    return pl4;
>> +}
>> +
>> +static u32 read_reason_thermal(struct xe_gt *gt)
>> +{
>> +    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +    return thermal;
>> +}
>> +
>> +static u32 read_reason_prochot(struct xe_gt *gt)
>> +{
>> +    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +    return prochot;
>> +}
>> +
>> +static u32 read_reason_ratl(struct xe_gt *gt)
>> +{
>> +    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +    return ratl;
>> +}
>> +
>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> +{
>> +    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +    return thermalert;
>> +}
>> +
>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> +{
>> +    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +    return tdc;
>> +}
>> +
> Since the same function in called multiple times above.
> Can it be a single function with the mask sent from the show?
I'll try it out.
>> +static ssize_t status_show(struct device *dev,
>> +               struct device_attribute *attr,
>> +               char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool status = !!read_status(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool pl1 = !!read_reason_pl1(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool pl2 = !!read_reason_pl2(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool pl4 = !!read_reason_pl4(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool thermal = !!read_reason_thermal(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool prochot = !!read_reason_prochot(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool ratl = !!read_reason_ratl(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool thermalert = !!read_reason_vr_thermalert(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buff)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    bool tdc = !!read_reason_vr_tdc(gt);
>> +
>> +    return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +    &dev_attr_status.attr,
>> +    &dev_attr_reason_pl1.attr,
>> +    &dev_attr_reason_pl2.attr,
>> +    &dev_attr_reason_pl4.attr,
>> +    &dev_attr_reason_thermal.attr,
>> +    &dev_attr_reason_prochot.attr,
>> +    &dev_attr_reason_ratl.attr,
>> +    &dev_attr_reason_vr_thermalert.attr,
>> +    &dev_attr_reason_vr_tdc.attr,
>> +    NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_files(kobj, throttle_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    kobj = kobject_create_and_add("throttle", gt->sysfs);
>> +    if (!kobj) {
>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +        return;
>> +    }
>> +
>> +    err = sysfs_create_files(kobj, throttle_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>> kobj);
>> +    if (err)
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..c318d98215a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,16 @@
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
>> +
> Above headers are not used.
> Can use forward declaration for xe_gt
>
> Thanks
> Riana

Sure.

Thanks,

Suja

>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
