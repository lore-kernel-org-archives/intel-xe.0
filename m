Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45815E7F15D
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 03:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F333310E463;
	Wed, 27 Sep 2023 03:56:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D3710E468
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 03:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695787017; x=1727323017;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oYN8cFAObOIqo+zFBdAZk9Jl3SHC+rluKefRQ5Tvjvo=;
 b=mOssnPC3BclVmY7JtWNMWNq+On4Lt+it5nNWmArLTSi1zKAWGpsj+1oA
 owfKOLnf+ixwJblce8P16+NCaI/IixtOuESX4JjqdvyWMdzwk8Fx/v50z
 yhHnBhd2ZtoHtQ1fZ+G495fBrmSZ1ljAd3nGBbIOWLw1YOWqZch7Rcuqn
 2ibt9jZueIp7xXg0GamF2Ev2U476uyO4rcAHzJyevoI/qz2XkIg9JcvPH
 Jv5t+UJGbGdj7ZZi9Yw9RW5v5wwdba5TVBotfomL+xOdmgQizrZcKfa0J
 PTXN83D5nFp0ooTj81332Z9ZNJXp32+h6X+pmn7z7xXAM2vYYmbGCcOnl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366785074"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366785074"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 20:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892445714"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="892445714"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 20:55:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 20:56:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 20:56:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 20:56:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 20:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfFAP5MRtVr3DH0Umww6pmz0gJQGEXn6R/2yie0Tli3tgIt56+jLBIiRM4t7eAFZoG2vQN59/z/O6uyHi9+RffwrJEjlJLMQVQFL8ryEXY8QPobWOGR+s+ZgTE5xG8n2D1xraAvppk41qJwF655dhiKKBn1tpA4GCjk+fFJNRyEABsxxAwbdsnFolqsMpwDxxTj3J4UoYF4/8Fncr7K/RgywC34W9PlJwo/hd1f0HGVvTduNd3+Opf9P6rVwjPC+qiHe6wdUvTe86HSi/s5BVbqpCNQwIa4geH0RLgGBzsRsEotzl2Njzcb5+qWm8JxG+5zBqA9gYf/0tIjgCQ50bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBe3Vs+y2ScmaW3OtMGsFECfzylPDqdfBgkQFaI1a7E=;
 b=OuoSJosGBV4kSX4al6fiDVuxb0f7N6sXWVvl8BAYN7G+CtP8V7/xhbY13bT2ACGPdE+CfTTnzucSfvnON+iTevwerZoV454pJw241BprBNe69XZHJaEHcOHz727QmBW/zKZtOJX/+6D4YlVxQiI3J8E7LeGvV7BlYOr9L+gRnMWlz4/Fmn01MRm5u11PrEw145wkni3tucbdpmCwa9fwrg1qjBnKI14PoDS79HU3SVjrMaEmsZNsye+xcKJFeOaz3/OHTPrx7dxR9DHoZhQb36o4l4hK5j0enk65vSbo+IQprb4hihpVsQa6Rz+XRGDwf6iK4gVEmwNtWGYbrzRWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 27 Sep
 2023 03:56:45 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 03:56:45 +0000
Message-ID: <9dd6d372-b51c-b979-d1d4-2b71f422c88c@intel.com>
Date: Wed, 27 Sep 2023 09:26:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230926143916.333958-1-sujaritha.sundaresan@intel.com>
 <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
 <ZRMWairdcW2ADPRt@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZRMWairdcW2ADPRt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d412373-4902-4b8f-3454-08dbbf0dc400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyS+BjcG3qWdd70QdLPm5xoERywfH4s6OAcOTR3Z/SI/fwjQ7pukPX1VEmYoFVPvMCfMrhPqbT+r3dkp5gNDVG/xJOhSujYPQMZtTtSyfMHccqUvW2TLsyTsXt/+EjPmA3qCm6LVWKYh+PXznwTPXqOedE3+/eVWKpCbqpGB+EGXy5N3/IcYovjYn6Q/S1IDk4oeP34UQEgsY7dAeFNhENFGyg5L0h2oVuSdd/9IFYkwF29AFhIHzFhVDnYQPZz5WR482+gP9Am9Zv+DiWVU4JnBmSquG3jMbLlX9E/8mBJNED+D4z0gjp3ELo1x5DxyMbletZXgP8hKhhsVdRDgA9Q6/ARSj5CxeU+63ifxAv3xCJa6Mzv8pU0BVSFRKy9iUoIL2I6zguAVE1wTjsSj4HcNQwLcTCty0dorpW0xG2xnuYmDOqc7vNrS+JPPw334D2AhAqDXew+gNTmtElQI+uqtWGulIFvPyZc3Aw3FOK9jn9WJ+PC4nr2eP8chVaNXKccUkwpuZ0B+git61lKvBOb9NUh9BKeC8Kn+Be0wu5iTGu60DKv9sJB8JVDZudnCjLhUz/Mt1CeHOb1Xx+lZ6ToJjyZLWHqL7qMrzvwYCdXdfTGiY1oGfhR8wKCVO4jpD0Q3HBLf/YAtqWO3KU/nd9xraycjuRfguX8iiNRsVsYG+dN5z42gK26JKumQq3EJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(1800799009)(4326008)(6862004)(478600001)(8676002)(8936002)(31686004)(2616005)(83380400001)(66556008)(6512007)(37006003)(316002)(41300700001)(66476007)(66946007)(38100700002)(26005)(5660300002)(6506007)(82960400001)(6666004)(53546011)(6486002)(6636002)(31696002)(30864003)(2906002)(36756003)(86362001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FnbHIvci8ybDZmLzdvWG4xaFYzaTdqUFh6M09EcEhiSDZLd2xIRE9kWGVt?=
 =?utf-8?B?K0ZYU2w5dlhHS2p6aFZHR3IvUG1PRUxjSVRnYXgwODV3R0N0N2hrMXNUMmly?=
 =?utf-8?B?UU50RVZiY1NFQS95Mk5UV0k4N3lTNnhpeTJEV0tIQ3p3aG83NXozNXBEaUh0?=
 =?utf-8?B?ZXVRYWxhVEJWWmJZaTJvdW91eGptNDBRaDI1YTJ0SzIwc0dYQ1cwNUhuU3Yx?=
 =?utf-8?B?Q0RraTZwMGpXWWIwQzFCK0RwZ2JxUVpzblYxeG9ZWENVN1BQalUxc05WVTNJ?=
 =?utf-8?B?M01nclBwMHB5UDhLTWgzb1JlQXNEOC92Mjh0VG9VREk5a0JyS1MzN2VCanZX?=
 =?utf-8?B?TUc5WVY1RjIyN3Jjd2I1S05UUXdxYjB0dmNFaTVFV1RXeWxFbVpQK0NaNHdS?=
 =?utf-8?B?TjlKblBlbW5hOG5WejlINjlEZDZzck1hRVpDbHVCdkd4aDRiOFEyNExwcWNh?=
 =?utf-8?B?ZWVMSm84QmFEc3RMK001NlllTzRwZVdhZnorT2ZuWC9ocDVaV2V1eEl4dGto?=
 =?utf-8?B?VjZDZ29NTmhrSjNQSXNUVEFSdmU0MVRIUFVJSmpBdVQ3NGQ1blhSOVJQdWl0?=
 =?utf-8?B?VitDakN4dndQREVTRVgzMHo2QUhsMk9CbWl6T093Um5uTVZpalhPdlUzK0k0?=
 =?utf-8?B?aFBDR0F1dGFrYzFoY2VUK0l1NmRCNCszcXp6MW1VanBkNzh0bE9rSXM0dDFx?=
 =?utf-8?B?bnkvWVRkUGhscFVMNkdiQUxBZGlZRyswMjFmTlZqZEZkZkNmSkVNNE5TMnBR?=
 =?utf-8?B?NUZ4dmsrTTNYYUcvSWVrVjVVMUpxLzJ2SGcweGhUb0syQmh4MG5JRHJnZEEx?=
 =?utf-8?B?RXRLcjdIV1BQV1dLbU5KSzFoUkdwL1FoeVcwRHd4WEZUWG1jSlh3VlN1WHZH?=
 =?utf-8?B?NkM5ZzNncTVSdDI4YjlubG9IOUg4S2pFYmsyRzAwcG45RlFPQ3dQSlp1YU5R?=
 =?utf-8?B?aHVLNXBJSXNGU2xNdGtaWUJnS0prQ09RbkdhSzJJdzVSYUtLQytJbUpNVlp4?=
 =?utf-8?B?UGx2N2JUZHpzVzlXQS81NU9BSnVPSDgyeTNxcUJzcnFIZFJJU3hvakVvcTRM?=
 =?utf-8?B?ZFpkOExGK3l0dTYxUGxXT1J2ME4raGxsV0FvYmxHRTJoWWZYVjlSWk1QRU9k?=
 =?utf-8?B?NkFyT0doemxZZ1ovc1hTKzFpbUNKeitSR0RYeGwvN2YrR05TckFpTkY0VW1C?=
 =?utf-8?B?UVBMS1FuRklsaTNENWRaVXVCcmdKdlk0cXpoSUc0ODJXVjFIOW56aS9sVnVv?=
 =?utf-8?B?SkN4bGJnckdpeHZVVEdwc3pwQ09oTWpKZ0hiRGN6UGhuTFJWK1ZhOEJRTERp?=
 =?utf-8?B?MXNmVFdsS1RSaXhsemFNVjd4eW5HZ0JkVUIzMm9uRkJCRFRGUnE5SEJUOVFR?=
 =?utf-8?B?cFJmWGh1V3VFWVlFSTZIRy8vK2NWcEo3TUNyOFUxejBpQVVJM1ZpUTBKYTBS?=
 =?utf-8?B?ZTVTSU1PNDhpc2V6VE9xcmNtWXVuZVhET1Y4TWsranBKOE1FUlkxL1AxMWNT?=
 =?utf-8?B?cGNGNm1GckxHUm1sTDY2QVEwZHB4MFBVbXNvL1I4NS9GR0lXdmhuQmttcjlj?=
 =?utf-8?B?QWlQTlZlR1FFWWcxd1QxRzZCaDAxNnlGdFhFeFN2Q21KSkNIbTlTMklMayty?=
 =?utf-8?B?OVNZL0U4T3VjYWpZOEVobDVCYmQ0NHpTNnRSSUljYjZINzNxRWxGVTBhMzgx?=
 =?utf-8?B?VmhlT0xscnFpcnRVRmVSNjFKMHFHWmRVK0NLOUhsTk5WN3pvWnExb0ZtWXht?=
 =?utf-8?B?Z0NVamNQWVlRNkNUSGt6bVlRbjFvdDgzRFhZR0lDRmRKNHJIMjhoK3FxSGZu?=
 =?utf-8?B?OHZQMGk0ZUlORS9DeFV6SHRyMVhPc29EN2RPdE5lRFd4M3I5NzM2bW9ZNnBJ?=
 =?utf-8?B?eWtjZ3d0dFJCSUJnTUZqWFh2ZzJOSURKckVTTnE5dmNTV0RWc2JCQnp6ekww?=
 =?utf-8?B?YzJzdE80RHhrWERkQU1nR1RhQk9aZjNubFJXeXVGUC9VbERDQTVWQnArL2Zw?=
 =?utf-8?B?eHZVSXc2dUxvaTNKWDgwL0lTVUJacWxJNE9VVGFKY09IKzZyN3ZKa3NKbzMx?=
 =?utf-8?B?WkVqWWdGZDRhMUpzZkgvWm5vY0hkb2tJWXdqZGdNMFg2VWFUbndzVDZZcm0y?=
 =?utf-8?B?eWZCNVEvelF3WUl4ZUdhN2ZxVkpTc01XL2FTK0VoRVBTQkJic1h3UGpIN2NP?=
 =?utf-8?Q?nwmGXND2HG9YyYKujIX2oP8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d412373-4902-4b8f-3454-08dbbf0dc400
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 03:56:45.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19ssyTv4/H2MutSFb/bmtEwUxVp4aoae4up2AZDv4/UZHwgb2KhyHAGU8Q3P6q56b584F+9KOK9ShgbxQ39MAViDjV/XhrIWS5haaFYBSxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/26/2023 11:05 PM, Rodrigo Vivi wrote:
> On Tue, Sep 26, 2023 at 08:09:16PM +0530, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── gt0
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>                 │
>>                 │
>>                 ├── gtN
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> v2: Fix review comments (Riana)
>>      Move init call (Matt)
>>
>> v3: Remove xe_gt_throttle (Riana)
>>      Make functions static (Rodrigo)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c          |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
>>   5 files changed, 289 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b1681d1416eb..9aa61e416a24 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3a4c9bcf793f..374238dd8a06 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -411,4 +411,16 @@
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
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..dc3f841b49d0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>   
>>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>   
>>   	gt->sysfs = &kg->base;
>>   
>> +	xe_gt_throttle_sysfs_init(gt);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
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
>> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
>> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
>> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
>> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
>> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
>> + */
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
> I'm afraid that you forgot to make this static...
This was miss will fix.
>
>> +{
>> +	u32 reg;
>> +
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> +
>> +static u32 read_status(struct xe_gt *gt)
>> +{
>> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +	return status;
>> +}
>> +
>> +static u32 read_reason_pl1(struct xe_gt *gt)
>> +{
>> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +	return pl1;
>> +}
>> +
>> +static u32 read_reason_pl2(struct xe_gt *gt)
>> +{
>> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +	return pl2;
>> +}
>> +
>> +static u32 read_reason_pl4(struct xe_gt *gt)
>> +{
>> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +	return pl4;
>> +}
>> +
>> +static u32 read_reason_thermal(struct xe_gt *gt)
>> +{
>> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +	return thermal;
>> +}
>> +
>> +static u32 read_reason_prochot(struct xe_gt *gt)
>> +{
>> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +	return prochot;
>> +}
>> +
>> +static u32 read_reason_ratl(struct xe_gt *gt)
>> +{
>> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +	return ratl;
>> +}
>> +
>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> +{
>> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +	return thermalert;
>> +}
>> +
>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> +{
>> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +	return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool status = !!read_status(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl1 = !!read_reason_pl1(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl2 = !!read_reason_pl2(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl4 = !!read_reason_pl4(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermal = !!read_reason_thermal(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool prochot = !!read_reason_prochot(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool ratl = !!read_reason_ratl(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermalert = !!read_reason_vr_thermalert(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool tdc = !!read_reason_vr_tdc(gt);
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
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> ... and to add a kernel doc to the non-static one
Will do
>
>> +{
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
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
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
> do not include .h inside a .h
>
> struct xe_gt;
>
> should be enough here
> and the rest of includes if needed they should be in the .c

Sure will remove.

Thanks,

Suja

>
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> -- 
>> 2.25.1
>>
