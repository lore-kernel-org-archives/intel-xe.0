Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B542CA0FE2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 23:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B10610E6FD;
	Thu, 31 Aug 2023 23:22:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405D10E6FD
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693524142; x=1725060142;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nqjl6qs/L40igZ48QWLFXPL0hQgKhwFPZ4bCsMQOFoY=;
 b=KMsLVCQEEhuQcm0acleXTyS4oguY51sxMcH+09hYgpUL4HWeit2oDNeJ
 YVq+fJkaO3NMnI62rbYpVaTrjwPm1Os9QTb1oWxiCG+vtofjM7L4VgHxP
 OSqQxoXA7MMElMgk0F1lxONkk/cHtqBQEXwA/TF4B8lvcVb+26rqYWIht
 p6jlbiWycgJTWQrIHXZY2amJESn/UfAjJ3L7sL5v97dum2STFnJeq3Kx6
 RLpldlU+esX5V3Y4hoEFCIEV/ijl7tUNlhoCSQGLxXrXR+zatpN/YgqZP
 19XrpX70pBHdsnjRUJ9MZKmzPx15vXLv4obCqQL77Ig6Ofm42f0GZUGXQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462453961"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="462453961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863334131"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="863334131"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 16:22:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 16:22:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 16:22:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 16:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+GLtbHQQUjgNb08F4nxkfNiNTg9tGHKzKpsvZIUW+1YVQHncUO5msEmci2ZOwhxd4r2bTWpwhHpdPiy5XeNczvuSbTlLE6sxd+nVsMpIUeN/yWOXjECvEpTDHWDsliJ6yvVEDDR3OD3JI1ewoDplSzxdTZkO4nYLgeETEa7G+0SSENIHfADU/lAj8Dkmu52pWNiirXf35t4naL7/DRQe8fqcqbyQMNL5rFcKh11ZaaGmAgfEGN87nnajNI1Dsv/mUkxXQxlNVpFfxRcwjjcXJSGtKqoW6wwbn9oRw6WFDKBvYkpDXhYHaawW9rMCb4t71OD6cKc6MGeEKP0W+bsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5mDlYkxbUv62EVon2KjmkGs7Hkm4A3a9s9pYCxgHwU=;
 b=NYFXxBWrH8latbfeHwhNldE9VEl6Aq8Ex5VU44vwJbjggHX718rYyzMs3bSEian4HzoP5xwZxOpuAiLP32tl3r4ChogEWWCxHrStcqai1icXXsjOjo4u/+iys+VioMiQAj27OwVsFHq1Ssn6sWHDJxIBCiZ7M9aX3ikn08/4LnWAre9hciD8HfTA6oSzbs2f6vYNP0lsxiOOsyHdXs1yDk9ryj86aRlpSotCrTB9iJexE3BB6gMqed+aK29xeBjARTisTQjKUF9CHTPvj44uINZOUFRVZPSdbzjPfDbOH6GgcWTryZTgZI/zmSfV3CBuYGKerpcL+3WXPfJ8AQToEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 23:22:12 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 23:22:12 +0000
Message-ID: <3c4ab23e-3b63-2f6f-a397-217f1818ead2@intel.com>
Date: Thu, 31 Aug 2023 16:22:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
 <87a5u724xe.wl-ashutosh.dixit@intel.com>
 <3b85e034-b1a4-29d1-2e4f-08ea6562b6ba@linux.intel.com>
 <877cpb173l.wl-ashutosh.dixit@intel.com>
 <496fa477-0361-5e65-e7a8-d3c0d02e114a@linux.intel.com>
 <77134894-47b2-98ce-d3e5-f30e611e03df@intel.com>
 <b9557547-1b36-5dc0-b2b9-0fdcf11c5141@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <b9557547-1b36-5dc0-b2b9-0fdcf11c5141@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 8236f9c7-f876-4328-5618-08dbaa791aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: weEAN6QgqH+D3GDwWhyBlBQgGKTvpNLYLm1uPjYFTQqczt+KrJRziGrhVee520QolfJTKFJkUpj6lpsVr6ycK6bUvVaVHWDHfXOunMKkv784WdxktLvlWhGh+niCT8Jut7zg24TcnAVuv3GGcCAS3BvQLuroLQLSXXvT2ZhwjoZRmookxNxj5pajld8jt6t50TIm36RKOi72s9FHcfY3gZ48ONXbfdq4zo3uj4GclnGfjUS8LCcKUIZdHro0ARKDYgA/IwPGJeUslcAioqzwG/0UrRV3sXlbm1Xgo37AkfhWv5solZ2xe2K0+KUf5k0ykXcAWOzzxkmybpc/FqS0kM/TSrjoKDUWi3fJL2DTyYg+ouX1DdqdD74ESdatSf86gbpOrefQa1DMDhya5U/ewDA+R78IFjX5b3YppoWfApec+jdrdyinwOc2Hmbh+GzEtY5RPBwGq8cQ9ZtUiQapCd+QY2AMNXxXgpmqpVI/+DeukPRtZbxdlcVaKz8kF+/nqr8+m3KO3LEsrl5ApX6Rcoeroxp6Mn6VK5U9dH8uXCt5liP9FZhFvhEVdqxZLyRhmvjqUofGj6uLhfpxNUmw67uOh0UxqhFZkAcC06UnCokkVHVjxvRgSPpX31PocECoYAYnAKbE5Ae1mxznpOORBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(1800799009)(451199024)(186009)(6636002)(82960400001)(2906002)(316002)(66476007)(66556008)(66946007)(30864003)(110136005)(38100700002)(478600001)(54906003)(31696002)(8936002)(5660300002)(86362001)(8676002)(4326008)(53546011)(83380400001)(41300700001)(2616005)(6512007)(6506007)(26005)(6486002)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWY1OTJWRjNWR21aVzB2Y2tIYStBN0NhcVRjQUh2ckRsN2V6L25FRFA1T2tv?=
 =?utf-8?B?RDVYQmhwWGJ4Q2x1M3hOUW9GRmdrelRCQ1E4WHMxZEhBSmc5dUV4UnpucVJG?=
 =?utf-8?B?dklRQzhTc3V3L2hhVmdQVjM3eWlNYm9GRGJ1amJvTFd0UG1QMHc4ZHI4bldx?=
 =?utf-8?B?MGRYdmFYVW1pMjJ5M1RmT01VWWpvcHExMkF5SEQ5UUxrZUdOc3FEYXpsRzJs?=
 =?utf-8?B?MVVWVVhobVZGVXpaUFQ1b20vWjkxamJjaFVOV1JiUWxBYU5nUzgzTnBBZWh2?=
 =?utf-8?B?VEVDTUpqYnhGeHNlYWZQdDlLWUt0RkZJOU5KWklFS3NwNXZ1WHlmalNkN3FC?=
 =?utf-8?B?dTN3VWlHU242N2kwancrSHlvOUpIeWxEb2NRZ2ZONFZNVWV0OGRnd3NjaFhJ?=
 =?utf-8?B?M2ZqejAyaVNxWklEaHZLZktlZklyUXVubUprU25NMjFHTnU3YUZtQlpPTEF5?=
 =?utf-8?B?OWVzYmUrWStJRndkWU5hOW44RklyK09leDJLZUJSbkUxUEZqY0k3VzFQOURT?=
 =?utf-8?B?YlZKbjN6dHVJWGtDTCticy9pM004MUFZV0tLcVoxOUx0TlVlSkdiWHIyQXc1?=
 =?utf-8?B?UGpwQnhaMXJBaHdnNmtjZWJwTFozdG95UU1VS0xwR0xKeFVqLzgzS0RFUWNV?=
 =?utf-8?B?TVd2UFk1MFNOZ2l2dUNEdVRpZGdqMW5qL3VOMHV2dzNOM0c4MEJLbDVYSnhj?=
 =?utf-8?B?QURjVGFrelY4Tm8xZUNzUzA4MjAyWnhkNDdieTZWemQyWGRMWmhNV09LR21v?=
 =?utf-8?B?b1JoY0d6SDZyU3M2eGR2RVgxV2Z4ZCtXWmwwcjIrYlZONFJuTUtIY2NwbGdS?=
 =?utf-8?B?YVRJc1pWUDdCMmpKd3N6Nkk2MWNGN3FQc2lkNmpXcWlkLzNmY0pFQ01Md0dw?=
 =?utf-8?B?RTltd1RzNHVFOFBmNG9oRkZmVzhPZzROeCtwbWhObm9OTDR0aUp4dEZ2NjBN?=
 =?utf-8?B?TUJDcWgydFNMTTI0M1BnZVEwQmhVWWV4UzVHZTJzdXpTcG5IbUpLQkllbEVX?=
 =?utf-8?B?UVYxUkMvdkpkSUw4ZlFnRDhzSTlrM2dkOGhhVE5sb0l0aHQ4bjRVTmVlZ0lv?=
 =?utf-8?B?cjhxRnhLOTV0ZEcrbmpHNmQ4c0VSdE9KdE5FUHNub2lWSFJGRktjcEtJdmN0?=
 =?utf-8?B?UHBtK2tkMC8xK3hneVlxV3Frem00TlhkZURMakRBYzh5L2hrem5ZSzV5UjYr?=
 =?utf-8?B?WGF6WGNnaFl2YWFHN2dlbytqZHdDL0NtazhzYi9lemY2Yld1a2RjRmpaWG9Y?=
 =?utf-8?B?UnhQc3VhZ2NEa3JtaVFxbjJCQ1VRQ0FLNnVWMW1oRjlxdVJmcXFyYm56VExT?=
 =?utf-8?B?a2xDNGFKcnh6dkFLbTV5a2RDWitHYjZLYW5LZHNpeUNtRTgwOE9mdks0cWNm?=
 =?utf-8?B?N0gyM1VCb1NGeDFUakl3WlJrem9zVVNuWDlMU3lodjhHSkFCTVlwZVRFdzlu?=
 =?utf-8?B?djkxMFRzaUxZenI0dHBIZnpRdTR2OVBZWG1na0RzUnhBMFZoTkptMGl2d290?=
 =?utf-8?B?a2oyMTJ3VmlPdmsvenI3dGljTnNTVHJJODlIQW5aU3dKQ0JwWGFURmpZSkY0?=
 =?utf-8?B?amdpOGFVdWwrWFdlVDhTc3g5YTE2aUVKaG9xRmNWU2dMWTZXU0hFUUovUWFu?=
 =?utf-8?B?bmcydTY5aTIxaXBXcmJ0ZXRSNXZNSlZaTnEwQVhqaUkxSnFRM3h0TjZBK29N?=
 =?utf-8?B?M1hsNGdLeWxzaGw2STcxVTZ3WXR6ZThjTlhBOEFGYXd4UG5oTEJFQmtScWRj?=
 =?utf-8?B?RHJmcjd0RG1jbEV5bnY5Z2NxUUtQZSs0Nk1WeHZtZEJVdnBydzNFS3pKa01r?=
 =?utf-8?B?a05BeDRqOE1pYzU0NmpSYWZPb25GQS9LTHhyRXNCK1ppQ1FJSVNvZitFdlhp?=
 =?utf-8?B?Vkptb0FPbXRKSk82S1JEWXAxY0h5ZTh3bXpLU2liWUZ5K2Vjalk5U0Rxc2JW?=
 =?utf-8?B?V0JoRjM0aFV5bk5MeSt2Nkh1TktObmV6cDJXUWxTY0JzSytKOFdTSmw3akxr?=
 =?utf-8?B?WkREZVJSMncxdWx0K0xqYXNwUG9DbUFlYmV1OE0zRTQvY1lPUitWYXZIVjhP?=
 =?utf-8?B?eHlQeGhhVFFta25YT2tYVzUwSXh3V1FOSUlkK3ZkeXdjSnEzRXFQRWJzTXAz?=
 =?utf-8?B?SG82bGp5MGNhSFUwMjM5ME5oRmJ2WjJzZkdRZllIcnRDalRCZlcwb21xSzQ2?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8236f9c7-f876-4328-5618-08dbaa791aec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 23:22:12.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oVQvumRys1WZFNjFgeyAydxbSEK336NbVai7kyh3OEfRK4HjXKsIfG23UKO4u75MobzbAubVZmvAa1ZcuLRlHw207SakOpUd0IN50c+nDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 8/31/2023 4:11 PM, Aravind Iddamsetty wrote:
> On 01/09/23 03:51, Belgaumkar, Vinay wrote:
>> On 8/31/2023 3:11 PM, Aravind Iddamsetty wrote:
>>> On 31/08/23 22:28, Dixit, Ashutosh wrote:
>>> HI Ashutosh,
>>>
>>>> On Thu, 31 Aug 2023 03:29:11 -0700, Aravind Iddamsetty wrote:
>>>> Hi Aravind,
>>>>
>>>> Hmm, what happened to the email formatting here?
>>> not sure, some how my email client is showing proper or I messed up.
>>>>>    On Tue, 29 Aug 2023 22:15:44 -0700, Aravind Iddamsetty wrote:
>>>>>
>>>>>    diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> new file mode 100644
>>>>> index 000000000000..41dd422812ff
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>> @@ -0,0 +1,679 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include <drm/drm_drv.h>
>>>>> +#include <drm/drm_managed.h>
>>>>> +#include <drm/xe_drm.h>
>>>>> +
>>>>> +#include "regs/xe_gt_regs.h"
>>>>> +#include "xe_device.h"
>>>>> +#include "xe_gt_clock.h"
>>>>> +#include "xe_mmio.h"
>>>>> +
>>>>> +static cpumask_t xe_pmu_cpumask;
>>>>> +static unsigned int xe_pmu_target_cpu = -1;
>>>>> +
>>>>> +static unsigned int config_gt_id(const u64 config)
>>>>> +{
>>>>> +    return config >> __XE_PMU_GT_SHIFT;
>>>>> +}
>>>>> +
>>>>> +static u64 config_counter(const u64 config)
>>>>> +{
>>>>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>>>> +}
>>>>> +
>>>>> +static int engine_busyness_sample_type(u64 config)
>>>>> +{
>>>>> +    int type = 0;
>>>>>
>>>>>
>>>>> Why initialize? The switch statement should have a default with a BUG/WARN_ON
>>>>> below? Also see the comment below.
>>>>>
>>>>>    +
>>>>> +    switch (config) {
>>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +        type = __XE_SAMPLE_RENDER_GROUP_BUSY;
>>>>> +        break;
>>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +        type = __XE_SAMPLE_COPY_GROUP_BUSY;
>>>>> +        break;
>>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +        type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>>>>> +        break;
>>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +        type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    return type;
>>>>> +}
>>>>>
>>>>>
>>>>> I am thinking this function is not really needed. We can just do:
>>>>>
>>>>>      int sample_type = config - 1;
>>>>>
>>>>> or
>>>>>
>>>>>      int sample_type = config_counter(config) - 1;
>>>>>
>>>>> It might not always be true in future, the configs can start from any range.
>>>> Disagree. This is uapi. Once it is exposed it cannot change. I am talking
>>>> about this:
>>>>
>>>> +#define XE_PMU_INTERRUPTS(gt)                  ___XE_PMU_OTHER(gt, 0)
>>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)           ___XE_PMU_OTHER(gt, 1)
>>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)             ___XE_PMU_OTHER(gt, 2)
>>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)            ___XE_PMU_OTHER(gt, 3)
>>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)       ___XE_PMU_OTHER(gt, 4)
>>>>
>>>> How can this "start from any range"? We can only add new counters after
>>>> these, not before these, correct?
>>> I didn't mean to say that these particular one's would change but any
>>> future new events that might fall into these categories might start
>>> from a different range. sorry for the confusion.
>>>
>>> Your suggestion makes it looks simple but somehow i wanted to tie this to
>>> the enums we defined in sample array, so ya will check one more time if
>>> it doesn't really makes any sense will clean it up.
>>>
>>>
>>>>> in engine_group_busyness_read? See comment at __xe_pmu_event_read below.
>>>>>
>>>>>    +
>>>>> +static void xe_pmu_event_destroy(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +
>>>>> +    drm_WARN_ON(&xe->drm, event->parent);
>>>>> +
>>>>> +    drm_dev_put(&xe->drm);
>>>>> +}
>>>>> +
>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>>> +{
>>>>> +    u64 val = 0;
>>>> No need to initialize here I think. We are not really expecting to drop
>>>> into the default case, which should be caught much before we enter this
>>>> function.
>>>>
>>>>> +
>>>>> +    switch (sample_type) {
>>>>> +    case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>> +        break;
>>>>> +    case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>> +        break;
>>>>> +    default:
>>>>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>> +    }
>>>>> +
>>>>> +    return xe_gt_clock_cycles_to_ns(gt, val * 16);
>>>>> +}
>>>>> +
>>>>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>>> +{
>>>>> +    int sample_type = engine_busyness_sample_type(config);
>>>>>
>>>>>
>>>>> If config is event->attr.config, this can just be 'config_counter(config) - 1'.
>>>>> See comment at __xe_pmu_event_read below.
>>>>>
>>>>>    +    const unsigned int gt_id = gt->info.id;
>>>>> +    struct xe_device *xe = gt->tile->xe;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    unsigned long flags;
>>>>> +    bool device_awake;
>>>>> +    u64 val;
>>>>> +
>>>>> +    device_awake = xe_device_mem_access_get_if_ongoing(xe);
>>>>> +    if (device_awake) {
>>>>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>>> +        val = __engine_group_busyness_read(gt, sample_type);
>>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>>> +        xe_device_mem_access_put(xe);
>>>>> +    }
>>>>> +
>>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +    if (device_awake)
>>>>> +        pmu->sample[gt_id][sample_type] = val;
>>>>> +    else
>>>>> +        val = pmu->sample[gt_id][sample_type];
>>>>> +
>>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +
>>>>> +    return val;
>>>>> +}
>>>>> +
>>>>> +static void engine_group_busyness_store(struct xe_gt *gt)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>>> +    unsigned int gt_id = gt->info.id;
>>>>> +    unsigned long flags;
>>>>> +    int i;
>>>>> +
>>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>>> +
>>>>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>>>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>>>>>
>>>>>
>>>>> This is not quite right. At the minimum we need to take forcewake
>>>>> here. Also since this is called in both suspend and runtime_suspend code
>>>>> paths we might also need to the take the runtime_pm reference.
>>>>>
>>>>> The pm reference and forcewake are already taken in suspend paths hence
>>>>> didn't add here again as this is called only from those paths.
>>>>>
>>>>> check xe_gt_suspend.
>>>> Sorry, you are right, I missed it. So this is fine.
>>>>
>>>>
>>>>> I think the simplest might be to just construct 'config'
>>>>> (event->attr.config) here and call engine_group_busyness_read? Something
>>>>> like:
>>>>>
>>>>>      for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>>>>          config = ; // Construct config using gt_id and i
>>>>>          engine_group_busyness_read(gt, i);
>>>>>      }
>>>>>
>>>>> This will automatically save the read values in pmu->sample[][] if the
>>>>> device is awake. Thoughts?
>>>>>
>>>>> I think this is best kept separate from usual read paths(which are
>>>>> atomic) didn't want to club them.  Also because forcewakes and pm
>>>>> reference are taken separately in suspend path.
>>>> Sure, no changes needed here. Just get rid of the braces to keep checkpatch
>>>> happy.
>>>>
>>>>
>>>>>    +    }
>>>>> +
>>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +config_status(struct xe_device *xe, u64 config)
>>>>> +{
>>>>> +    unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>>>>>
>>>>>
>>>>> What is this for? See below.
>>>>>
>>>>> reminiscent of my previous code, will clean it up.
>>>>>
>>>>>
>>>>>
>>>>>    +    unsigned int gt_id = config_gt_id(config);
>>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +
>>>>> +    if (gt_id > max_gt_id)
>>>>>
>>>>>
>>>>> Maybe this can just be:
>>>>>
>>>>>      if (gt_id >= XE_PMU_MAX_GT)
>>>>>
>>>>>    +        return -ENOENT;
>>>>> +
>>>>> +    switch (config_counter(config)) {
>>>>> +    case XE_PMU_INTERRUPTS(0):
>>>>> +        if (gt_id)
>>>>> +            return -ENOENT;
>>>>> +        break;
>>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +        if (gt->info.type == XE_GT_TYPE_MEDIA)
>>>>> +            return -ENOENT;
>>>>> +        break;
>>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +        if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>>>>> +            return -ENOENT;
>>>>> +        break;
>>>>> +    default:
>>>>> +        return -ENOENT;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_event_init(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (pmu->closed)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    if (event->attr.type != event->pmu->type)
>>>>> +        return -ENOENT;
>>>>> +
>>>>> +    /* unsupported modes and filters */
>>>>> +    if (event->attr.sample_period) /* no sampling */
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    if (has_branch_stack(event))
>>>>> +        return -EOPNOTSUPP;
>>>>> +
>>>>> +    if (event->cpu < 0)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /* only allow running on one cpu at a time */
>>>>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    ret = config_status(xe, event->attr.config);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    if (!event->parent) {
>>>>> +        drm_dev_get(&xe->drm);
>>>>> +        event->destroy = xe_pmu_event_destroy;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>>>>> +    const u64 config = config_counter(event->attr.config);
>>>>>
>>>>>
>>>>> Probably nit but this config being different from event->attr.config is
>>>>> confusing. Let's use 'event->attr.config' throughout as argument to
>>>>> functions and use config_counter() to get rid of gt_id. So get rid of this
>>>>> config variable.
>>>>>
>>>>>    +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    u64 val = 0;
>>>>> +
>>>>> +    switch (config) {
>>>>>
>>>>>
>>>>> switch (config_counter(event->attr.config))
>>>>>
>>>>>    +    case XE_PMU_INTERRUPTS(0):
>>>>> +        val = READ_ONCE(pmu->irq_count);
>>>>> +        break;
>>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>>> +        val = engine_group_busyness_read(gt, config);
>>>>>
>>>>>
>>>>> engine_group_busyness_read(gt, event->attr.config);
>>>>>
>>>>> hmmm ok.
>>>>>
>>>>>
>>>>>
>>>>> Also, need a default case.
>>>>>
>>>>>    +    }
>>>>> +
>>>>> +    return val;
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_event_read(struct perf_event *event)
>>>>> +{
>>>>> +    struct xe_device *xe =
>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>> +    struct hw_perf_event *hwc = &event->hw;
>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>> +    u64 prev, new;
>>>>> +
>>>>> +    if (pmu->closed) {
>>>>> +        event->hw.state = PERF_HES_STOPPED;
>>>>> +        return;
>>>>> +    }
>>>>> +again:
>>>>> +    prev = local64_read(&hwc->prev_count);
>>>>> +    new = __xe_pmu_event_read(event);
>>>>> +
>>>>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>>>> +        goto again;
>>>>> +
>>>>> +    local64_add(new - prev, &event->count);
>>>>> +}
>>>>> +
>>>>> +static void xe_pmu_enable(struct perf_event *event)
>>>>> +{
>> The i915_pmu code checks which event is requested here and accordingly sets pmu->enable (which doesn't seem to be defined here yet). Any reason we are not doing this yet?
>
> in i915 pmu->enable is only used by events for which there is an internal timer sampler
> which periodically samples those events, this series is not adding such events.

Ok, the tracked events are bound by I915_NUM_PMU_SAMPLERS in i915, 
whereas you have already defined the max non/tracking ones as 
__XE_NUM_PMU_SAMPLERS, hence my confusion. Should we use a different 
name in lieu of the tracked events which will be defined in subsequent 
patches?

enum {

         __I915_SAMPLE_FREQ_ACT = 0,

         __I915_SAMPLE_FREQ_REQ,
         __I915_SAMPLE_RC6,
         __I915_SAMPLE_RC6_LAST_REPORTED,
         __I915_NUM_PMU_SAMPLERS

};

Thanks,

Vinay.

>
> Thanks,
> Aravind.
>> Thanks,
>>
>> Vinay.
>>
>>>>> +    /*
>>>>> +     * Store the current counter value so we can report the correct delta
>>>>> +     * for all listeners. Even when the event was already enabled and has
>>>>> +     * an existing non-zero value.
>>>>> +     */
>>>>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>>>
>>>>>
>>>>> Right now nothing is being enabled here (unlike i915) so the function name
>>>>> xe_pmu_enable looks weird. Not sure, maybe leave as is for when things get
>>>>> added in the future?
>>>>>
>>>>>    +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +
>>>>> +    BUG_ON(!pmu->base.event_init);
>>>>> +
>>>>> +    /* Select the first online CPU as a designated reader. */
>>>>> +    if (cpumask_empty(&xe_pmu_cpumask))
>>>>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>>>> +{
>>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>>> +    unsigned int target = xe_pmu_target_cpu;
>>>>> +
>>>>> +    BUG_ON(!pmu->base.event_init);
>>>>>
>>>>>
>>>>> nit but wondering if we should remove these two BUG_ON's (and save a couple
>>>>> of checkpatch warnings even though the BUG_ON's are in i915) and just do
>>>>> something like:
>>>>>
>>>>>        if (!pmu->base.event_init)
>>>>>          return 0;
>>>>>
>>>>> The reason for the BUG_ON's seems to be that these functions can be called
>>>>> after module_init but before probe.
>>>>>
>>>>> xe_pmu_cpu_online() doesn't depend on pmu at all so looks like the BUG_ON
>>>>> can just be dropped?
>>>>>
>>>>> the  xe_pmu_cpu_online/offline are not invoked when they are registered with
>>>>> cpuhp_setup_state_multi, but rather when cpuhp_state_add_instance() is called
>>>>> which is done post the PMU is initialized hence the check for BUG_ON.
>>>> cpuhp_setup_state_multi is called at module_init
>>>> time. cpuhp_state_add_instance is called from xe_pmu_register, i.e. during
>>>> device probe when pmu->base.event_init is already initialized. Therefore
>>>> seems even less reason to have the BUG_ON's.
>>> that is true even, so will remove the BUG_ON.
>>>> Just a few minor issues left now so I am hoping we can wrap this marathon
>>>> review up soon :)
>>> ya i'm waiting for the same :)
>>>
>>> Thanks,
>>> Aravind.
>>>> Thanks.
>>>> -- 
>>>> Ashutosh
