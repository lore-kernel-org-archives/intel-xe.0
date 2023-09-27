Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC992E810AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731910E042;
	Wed, 27 Sep 2023 10:03:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2555910E042
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695808996; x=1727344996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E4pX5YjJgFV6oaN9RTG6UlrwQKRdqszTeewPCU03AFI=;
 b=YVjaAQpX95tVoqWpEtGShiWq32d4v4PGNsCXlbMiay0mLxaQd8uh4Lzl
 3JjSKCbWHp+bzHGpqFfZFwVRAPy0ciXyfN+FWl1/lq0QENWIqMDkkHsz3
 /m/7wlg8/x3eG1Owr4bQW2vuCxPFgMQ4RMPNJ6oVnDorQ1t47sjYFwtqx
 fnkYPFwqjyuvdWd3tWHRvx3qN1CplsRf/GxOUp75D3uF/rjtBhGyBh8WI
 2vXgXQYPbqvBn0YsEv15FunKIrvkTeJp8Srcdsrx+DUP5KJDeIzrIxFR3
 lCp0nd1T+0EAiP/u2I/pAs/OlONiLop8t3dTGOOeJh190DjWGq6cou3Vq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412698960"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412698960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080082840"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080082840"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 03:03:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:03:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:03:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:03:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdSEJBa1gw4qGhQvuQZvP2wvOwvJBkcRf6QcvrEDfbcOvy1+eETBg7sIJVRk4Pa9Gn13E++Zcod4Ms6c3o2dbpSM8Ka0o1q+oC5zuS3WwqlfQ2Gdr1xYFrihV+4ejnA4xRmpiRgb1mG8dVsC5Cwm1TFaEKgETM/EMfS+LMKAvtXJTYijqoEUiI89QKcH96uas7z9AAgenToAAh4B7DoCm4MK9eC+T6gF2p86qsc0jYKkhUKa2KIhleiRSxsa+NiIV9HM48J/njSqkr4/8g5BL7VkcQL1lEZOBSy3LQ/nDC0loQH1kVAy6tzvX0G/O9IMAQC1no1fe591J2xRMo9oJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYjy+DlOo8NSzFEUaDzi+WXlF3P9Dzv3wuxG95+9Iog=;
 b=DBulBWhwBFpTMoKzDbUD6nkK1uwEwrnSv+HzookaKJhDpp23jxfR0tS7wPl9I8Pr3o/HywLpfhJ8LrsSvbkuSe7/5hfi5o2oR92vREZRyHQc5zV6dh3NRtYV2HO0aNA0ecoNv+Jct89M+Bx3Cp9McFplsRK0gKT+ms1rkgNPGK+PkFl4H7F7fjo1ofTFLGyQcuYhYbFpimwJcMtjE4pKSm0btN1yKArCrix+ZbLNrT8ZI1cQmsA9jHjQRm2l2f61OwoYjDsqIFABV1seh27LEIJQLKGgw2y9xje46eR3C5sFtqOVHF4vmzwB8jQh3QDkXRLNeKUrH8GHY0rkGUbyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Wed, 27 Sep 2023 10:03:11 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 10:03:11 +0000
Message-ID: <3720c4a7-4ce4-c82e-5237-62a4a4bb3b41@intel.com>
Date: Wed, 27 Sep 2023 15:33:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
 <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
 <ZRMVda8E+xLJbDJp@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZRMVda8E+xLJbDJp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a67e93-74d5-4580-581d-08dbbf40f50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7xF+fsrHZuVatQxQdQ7TRv0r9Wqs89dOZBTpNn0MyvyNu3V66F2lVv26buemlW2Y7gjmon5RZzdnl+/gkYpbXcTklHOeUQrUJie0Gqoiu7DByrnBBatxtUIkvsUo5BPfdLhKqtHpt5AE5bf21zkiBBAMAJj6XuoBOIyOXYSd74ioztw26xvONIm7Ew/qqZ7bIqY7y/N8AZVu23x7uQrBUgCFBrBbRVhYfJEhyw91rCE8R9lTxK2CyKP73yJgUAcs7Q16K7bW0CX82TF8sk8mxe4RejtA+M5urOMxW6NcEfTQhJrbJBgtFvpS3tZBJIC0JiSCZa1u7bUKnlcEcJfa+E+ugJO7fhoXyC/P7RHy2+vTY38eIpsqDyyiu4qn+rG/qQ7X6wGKlX8ObRzWMvbJzu8+mXk/oYjmEQqos5TAUGlH+zKREkAha0qSP0Bus/x37nnpMeTCugXzFOOL8wLAr1GnKADYhMzXMjMaykebe0RydbNxzv3gsfpYRiyChWmbltg7r8QliMVDqwxqgIljgitTax984TMzOXIz8tJJug3aPsbJxKpQStMK+2eyI1B/Hjb2p7rnjAFvfDk6iS127rk85EjkxNoECVaH8/+8HW1bsCGbF7PXthfARyWCGPy7/mS7t0s0+dRRUb3VHjc7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(31686004)(2906002)(82960400001)(5660300002)(31696002)(86362001)(38100700002)(36756003)(8936002)(8676002)(4326008)(6862004)(83380400001)(41300700001)(6636002)(316002)(26005)(6512007)(2616005)(53546011)(66946007)(66556008)(478600001)(66476007)(6666004)(37006003)(6506007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJzd0YxY0RJdWVqa0c4UzhRbVpQS3QvUkp6cU1OVldRQjBxL25uQnliRTVP?=
 =?utf-8?B?bzJEZm9KY0N2eG5kemNWZlZLbmg4OENYV1BSMnFjWnNCNDMyQ1h5bUNGOGQx?=
 =?utf-8?B?cHo5bDR5UVNqL0RJM1RaTzZaZ3J1R1ZhQjBkNnNvWE9iVXpMWTJ5cUwxVzNG?=
 =?utf-8?B?UEVMSTQxSVF2NHVVZVFQM0xmMCtFVFRqNkppN09kOGJtbjA4aUZ6Wm9TRHlT?=
 =?utf-8?B?YXYreFRoaHRZeUUxc0Y3MFBTYU9QTU1XT0gwRzBlakM4ZVdxczFwQ0ZSdFhp?=
 =?utf-8?B?bEtPdDZzZ09Sdkpnb2I0ODJFbFRMRXFENVRwaXhCUThFVXZORlBCVGpRQTMv?=
 =?utf-8?B?RFJSZzBWUGdsUkhUdHBHRmZnWXgrL0lKTWk1WlBpYVlQcHNUNkFTSk0vRDNG?=
 =?utf-8?B?cncwQnhYYUdrdVR5RFBtMW82cUNQSVpRQ1VpVEZIdHdpSGdiVHQrZXphTVIr?=
 =?utf-8?B?SmUxODIwMmlKNkk0VVNZSkV2M3I3cFlaWG9FUVRZbGlyUTZSQmdXVkxRZWRt?=
 =?utf-8?B?eGt0UTQydmY1TTNWb2MweWRzeHFqVENTMkw5bW9SbmUrU3ozZkRjUXdRdDBs?=
 =?utf-8?B?YXh2ZWE0RlJPZ0lrVS9aVTRYaHoyUURyQUdoSXN6b2hRUi9wakRsYnFoQUQ3?=
 =?utf-8?B?YVZucWkwNjk4Q2dHZUVSZ1k3cENWZlQxTWYzNlplU0tXMmpzRlNWbkVhVzdG?=
 =?utf-8?B?K3RidUxNbG43M0FSQmpxVE1sRlNIUWNTVTNJdnc5RW9mN0h5K3J5RmZNTWkz?=
 =?utf-8?B?YU1tdEhWNEVqbTRoTWNGUWFQT0p5SU5jMFhyK3dEVGJ1WmF0c0ZDcDBkMGZZ?=
 =?utf-8?B?UEJWTVhXUGhTaTM4WFRoL0E1Zzhqa09QWUw1WmhCRXNVSUZ0eVIxTnhuWHZM?=
 =?utf-8?B?bkVmN0tOLzhiS25IWktxUUhaMmZ3RGovS1p0amtxdmUyUzNqSkVsU3pwRk5O?=
 =?utf-8?B?QU96NEFGTXU4ZzVRSnpLdkRWS1RtMU45dFFUMTJsVTBIQWE1ZFV1TzJzN0Zk?=
 =?utf-8?B?TFZEaHU1bWhrQUp0QXlpNjl6MHpPZURERVloalVhcWI1czhmU2hTb2xVb28y?=
 =?utf-8?B?TU1Lb2FhclYrODJWNTI0VTBCVDdGSWl5TFNHcmpLNzEwOUxFVTk3STVIR3Q0?=
 =?utf-8?B?cE1UN1RKZ29PS05VM3NMMVdwcTI0Sld4MmhVc2IreFdiWEl0aUM5RVVWTXFP?=
 =?utf-8?B?c0Q5VUJkN3Jub0JZYjBzQ0JQQ0ZhbDJOc3l3UERkSG4vckl0czBGcEx6aXdZ?=
 =?utf-8?B?anpDQ2VOSUxJeGVYMG1sMStEbXdkSHdtc3pHRituMDNBN2ZDZjlJVGVIYS9p?=
 =?utf-8?B?a0dublFDR21wTXBmb0JITE0wbjRqYkp1aHJxRFV0MW1GVy82V3BCOUFCQ0hV?=
 =?utf-8?B?ZDFCbjhqckd4OE5VRU9ucjVFckJWaldSb1JwcDk2REZPLzdJdEpGY2pPa083?=
 =?utf-8?B?QW90cUorblJwT3pGTTlzNVdjZzZGbC9zWGtIZEMvYjBrVXJpb1l5NEhORmZ2?=
 =?utf-8?B?bWVkNUM5emVSUzcxa25Na1ZqdjN5c2g3UDlFaWtZeU5xVlJYa0FLV0lHTFRV?=
 =?utf-8?B?aGYvQmVxcDRiRlJIMmd5Snlwb1RPaUQzQWp1S3lPUEMyL1V4ODdscjFkb21S?=
 =?utf-8?B?TUd4VnQxK3ZpSGFlRGhJckZLenQ2SmNwS0NJK3ZYMWdBSWhpOHdUY09vbWNq?=
 =?utf-8?B?cVMwdk1VQ08waWtpTHdtNGNldDV5aEtkalYvSStEYUQ0elhmZGYyaXpZY25S?=
 =?utf-8?B?UWMzSlo0bnlPR0ZhSjJoS0ExcVJwc3pydVZFYW5uaHlWc1NSMU1LejdkREFZ?=
 =?utf-8?B?NWVEZk1zTUVEMDNmSGR4T3JRRFkrRElTbXFYK2dYVDNnZmdMTUZhbUZ6bU1L?=
 =?utf-8?B?bE5rK1g5L1ZOOWZyc013M0U0b1hPRk1QVXEyT0dBaXJDeGI5WXpPUEsybCti?=
 =?utf-8?B?c09yWjRLeVU3M0YveXNveEwzaFNucWFvTHBLOFV5QzNEd2szYnJRazRtdDJS?=
 =?utf-8?B?VjY4ajJiT1lzZkpXY0o0Ump5ZmwvZk9ZLzRGZUV4YkNGaGN6MTJvS2RFTkJY?=
 =?utf-8?B?OEVYY3c4Uk1HSTB4TXBKTVNPL1VoQ01QdG52c2JzQmRYVjZLdHJWMm1GbWQ0?=
 =?utf-8?B?bFVJLzZSd0dLQnNGb1RGazlORElCOHZORC9vVndVMTVyS0grVHhQcXdXVk9o?=
 =?utf-8?Q?9mxBb19oM7DWlOTA9zGXJLw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a67e93-74d5-4580-581d-08dbbf40f50d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:03:11.7841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UH4ADVmxW5lgL96U93RGeqFEqsX5GEZ6zUUPmVhTqU4FqMzsl4xiRUOtXAI2APT6iMLDBU9qpk++sznU9SYPFlx/PPJdjKiWxQvuAUH4yZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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


On 9/26/2023 11:01 PM, Rodrigo Vivi wrote:
> On Tue, Sep 26, 2023 at 08:11:20PM +0530, Sujaritha Sundaresan wrote:
>> This patch adds base performace attributes as well as vram frequency
>> attributes.
> Is vram freq tied to the gt or tied to the tile?
It is being defined per-tile.
>
>> v2: Create a separate performance directory for attributes.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
>>   5 files changed, 257 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b1681d1416eb..bdd9922d3db5 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -60,6 +60,7 @@ xe-y += xe_bb.o \
>>   	xe_gt.o \
>>   	xe_gt_clock.o \
>>   	xe_gt_debugfs.o \
>> +	xe_gt_freq_sysfs.o \
>>   	xe_gt_idle_sysfs.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>> new file mode 100644
>> index 000000000000..6017d09eeca2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
>> @@ -0,0 +1,218 @@
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
>> +#include "xe_gt_freq_sysfs.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>> +
>> +#define GT_FREQUENCY_MULTIPLIER	50
>> +
>> +#define U8_8_VAL_MASK           0xffff
>> +#define U8_8_SCALE_TO_VALUE     "0.00390625"
>> +
>> +static ssize_t freq_factor_scale_show(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      char *buff)
>> +{
>> +	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
>> +}
>> +
>> +static ssize_t base_freq_factor_show(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	val &= U8_8_VAL_MASK;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +
>> +static ssize_t base_freq_factor_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buff, size_t count)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = kstrtou32(buff, 0, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	if (val > U8_8_VAL_MASK)
>> +		return -EINVAL;
>> +
>> +	err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
>> +				PCODE_MBOX_DOMAIN_CHIPLET,
>> +				PCODE_MBOX_DOMAIN_BASE, val);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(base_freq_factor);
>> +static struct device_attribute dev_attr_base_freq_factor_scale =
>> +	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
>> +
>> +
>> +static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rp0);
>> +
>> +static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +				PCODE_MBOX_DOMAIN_BASE, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(base_freq_rpn);
>> +
>> +static const struct attribute *perf_power_attrs[] = {
>> +	&dev_attr_base_freq_factor.attr,
>> +	&dev_attr_base_freq_factor_scale.attr,
>> +	&dev_attr_base_freq_rp0.attr,
>> +	&dev_attr_base_freq_rpn.attr,
>> +	NULL
>> +};
>> +
>> +static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_P0,
>> +				PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rp0);
>> +
>> +static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	u32 val;
>> +	int err;
>> +
>> +	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
>> +				PCODE_MBOX_FC_SC_READ_FUSED_PN,
>> +				PCODE_MBOX_DOMAIN_HBM, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>> +	val *= GT_FREQUENCY_MULTIPLIER;
>> +
>> +	return sysfs_emit(buff, "%u\n", val);
>> +}
>> +static DEVICE_ATTR_RO(freq_vram_rpn);
>> +
>> +static const struct attribute *vram_freq_attrs[] = {
>> +	&dev_attr_freq_vram_rp0.attr,
>> +	&dev_attr_freq_vram_rpn.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, perf_power_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj;
>> +	int err;
>> +
>> +	kobj = kobject_create_and_add("performance", gt->sysfs);
>> +	if (!kobj) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj, perf_power_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>> +		drm_warn(&xe->drm, "failed to register performance power sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	if (xe->info.platform == XE_PVC) {
>> +		err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
>> +		if (err) {
>> +			kobject_put(kobj);
>> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>> +			return;
>> +		}
>> +
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, kobj);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>> new file mode 100644
>> index 000000000000..7b76c4670632
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_FREQ_SYSFS_H_
>> +#define _XE_GT_FREQ_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_freq_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_FREQ_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..3b6316ce10ed 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "xe_gt.h"
>> +#include "xe_gt_freq_sysfs.h"
>>   
>>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>   
>>   	gt->sysfs = &kg->base;
>>   
>> +	xe_gt_freq_sysfs_init(gt);
>> +
>>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>   	if (err) {
>>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 837ff7c71280..da4114bfaa7a 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -30,6 +30,25 @@
>>   #define   PCODE_READ_MIN_FREQ_TABLE	0x9
>>   #define   PCODE_FREQ_RING_RATIO_SHIFT	16
>>   
>> +#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
>> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
>> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
>> +#define     PCODE_MBOX_DOMAIN_NONE			0x0
>> +#define     PCODE_MBOX_DOMAIN_GT			0x1
>> +#define     PCODE_MBOX_DOMAIN_HBM			0x2
>> +#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
>> +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
>> +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
>> +#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
>> +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
>> +#define     PCODE_MBOX_DOMAIN_BASE			0x8
>> +#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
>> +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
>> +#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
>> +
>>   /* PCODE Init */
>>   #define   DGFX_PCODE_STATUS		0x7E
>>   #define     DGFX_GET_INIT_STATUS	0x0
>> -- 
>> 2.25.1
>>
