Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ECBC88CB2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 22:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39D210E00B;
	Thu, 31 Aug 2023 22:21:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFAC10E00B
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 22:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693520508; x=1725056508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qaYDmPLw/YuyluBElUsfEihgJN5Fw/UxnfFRQknkdSM=;
 b=bHoBQ+nki9GzeTOJQHWWQ3VctG2OW1H+bXUSPfOwNf3DDnu0/bEy2mZC
 MLon/hSWXhks2fZHEt8tNjgaIXbVNkBk86XiZCONwkcNR/Vfl1ihOuGxB
 4kdfnxTx4BUQPmi26DjFf8ySUde0na2Mmc0NHVz+cB6rkjmXy0wek44xu
 zR7S3J5t4pvbjVWe9dCJ05vd/rK6y5wvoLwjNIRvlBqiGJGDg7xddymXs
 xGnrQW6v8H9fq/kTS5Wlzsrr/eTX6bYt/NEpbBL5lkPvM/vHjQ9Qvbwu9
 apFSSfHcfGRKyLwf6ioHupbQUPnXV8VyDKjtoIeZnQHGdCHM+Ma7rWGpb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379867621"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="379867621"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742892951"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="742892951"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 15:21:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 15:21:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 15:21:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 15:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8c2QcyvD+tnVNBkDQ6auCC1kCcWwd6WXcKdtvgK9zwfPMlMvMRz2HgsS7T4ZbOUfUmuxYoXqBiX6EiwRJlRPlJfCQCswCXbg6m4t6VbYr5uNFip3eSwrAb8oPFkcgEUS5s+CV6TNt95dsb7OLZ0bhFG8LNYaWqRmyfD23v3LWI9gJTwH1Z+2qJPJiDRXEwaUpfaLV+amA0WGTJPjPdEzM7zz3HYklDW8MCoukMJTp8bEs+R8r6/bN3pOGuMW/CxDc5yaS46prqgJtUaEigubbW0QTnwAqesW7mGZSeoxUzTEvFAmxcPwmntZzWSXOIw191imlzEZZKmhDVgEFD8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNPYlAjoERHSH0vsOY4JYXw6T5RJQfW05dL1RqtByeM=;
 b=CEAwYNvbcCaB9+ybOKubQFoW9TrORLEVWuEaWGdYw94vcBumy4lqbJmWy64gBEMEbUx8JH21ZtCa+BQjH76SKhB3B4T0cUcbL068gNo2ttZ0z/CTX29ChSB8vNnWdAlMeZ0g3T457UcPm7h2yvIznXYQLgYFksgoKhQlD4bkZIL3usLwacNGFML0KxIItBs7oNPa/pwU3HiktHUFCwBDXg//FlfXgYqzEYR/qplnU97a1z8j8GSTzM5Mqesjkuu067G5dMtwxcZWqTnPZ8OqEQjrh/gJUVcbx1UXKo2tOuaFbCliEuFfRTciWwxPrRB8WvDljX60/ZuzDT/gpf8iOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 22:21:43 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::2d90:2991:354c:a720%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 22:21:42 +0000
Message-ID: <77134894-47b2-98ce-d3e5-f30e611e03df@intel.com>
Date: Thu, 31 Aug 2023 15:21:41 -0700
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
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <496fa477-0361-5e65-e7a8-d3c0d02e114a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d3d89f-58f3-4b69-325c-08dbaa70a781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tn7l/MQkyaKpOuUUkhmhCTh5JwIGtOnW9FWgi9W4Vs5RbxHr44cLhSZPEg3E9N8vgf3tGvXNJGSlYMID5F4h0mx38rqTWdIsOTCPDh9AWeIQe3ijG3bt3H5IHa3VEZhsQwrc2U9V3XVCOgOE3vt0R6+OqHlzHJiPS+yH+QBTv4wr8z/6VnhP/M6dqzJkkWcmM5eZ2DrJmQ80gqxD2fbpBSTMPxf3Ld4JNoj2barJOjlS/k8wxmbv1Ss7GfULpCTHvfV6A+TFFRwGgKiM0DCE9I3cK4S5HO4QErg1sZGHFns9xnrvzkKUwIbKWpW1v3jeEXpMe/uc2MXRQOfcv5hwCfx9aMQEChrE8+FH6gK1OG4cRaq8i4INtfHhALtJ1fXz3D5PT2KTZAu4tP0/Te/+TgAfa6Yd7bpPxR3kWZdz6GLNJeuSpV6ZN4iKGNTNTb1a72b1Mi8xl+iYe2dYDqNBi8g66aMRGJFL7vm78ARvUFe5CkOvw2Iicm5EuZWUoM6Kkw/kQMuPrccRhBXUPxV5xGpCHBfNUuZbK1Sia5Mt2jFcOBkKhF9hMaS3aW4oquEosw6gF4pmHys3kBGRuCMEYewnrxrzu9sVaxD7FrPP/mDtH6uYmMjU0OWYtRcq439ts/W6nmeVxcnzNZzu+nFNeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(1800799009)(451199024)(186009)(36756003)(31686004)(83380400001)(86362001)(31696002)(4326008)(5660300002)(53546011)(8936002)(6506007)(8676002)(26005)(6486002)(2616005)(6512007)(41300700001)(2906002)(478600001)(38100700002)(30864003)(110136005)(66556008)(66946007)(66476007)(6636002)(82960400001)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZuc0VpaFVzam1lemhrVVZmbVdpbmtLTzlrcnptV2lFdkRSUVI5QmJWNEZK?=
 =?utf-8?B?UHNKMXZnZmU1bHR4V3JpOTVXRlFoYW0za2dQVFFBUHgvWXVmcFJaRlVhYXVt?=
 =?utf-8?B?RjZVZjRKa3hCelNYWjcxdWxzTm5mQnhna2N5cmtCdlF4OVo0bldvNEVoclpm?=
 =?utf-8?B?aXV5eDRQb1htdTZMMkxPaDQyVWdtYXlTU0FXeE9LQWdTYVl6cnA1dittcG1Z?=
 =?utf-8?B?RFpKRGpUOGluUGk3RjVUdVFLcU1vdlZsSUdKUldPMDBqL1FUb1ZPN1BrcjNC?=
 =?utf-8?B?REFNb0V6aGIxTGxSQVRpVTJJZ25abkt6bEh3NldkQzNSTWZPVHl4TjgvM3E3?=
 =?utf-8?B?SXJYTDA1RmJWWkNHbFIyblVnUENJbE1QQjB0aXljTEQ0aTBuYS9mTDlWMkRR?=
 =?utf-8?B?bjZyeDBGbXNiWjZ2bk1NYklocGQ2NWJtSXlxV3h2RFJnOG1jaEFsS2lXT3NR?=
 =?utf-8?B?SlZSeHFoY29KbGJHRC9mS3RxM3JzQzBhR3BZNUpMY21rcWZRY2VXSkpSdkxn?=
 =?utf-8?B?UmhrdTVzOXpQdkFud0xSdkRCc01FbndJbEpHYlRVdHk2NHlBMFVtVU42SXl5?=
 =?utf-8?B?VllnY3I4REJhTC96aU83aFFva2Rldis1czU5cW9QNVY1TG5iajNVT0NzQlhh?=
 =?utf-8?B?K1Z0QjBBbTNTc0pEM3NTSTdjRWN6bUc4TzQ5Wmt6amV2NWlXQ0FKRnpjVVlO?=
 =?utf-8?B?WExPaC9XTThuVHo2WnBmVUNGNDdVeFAyOTBjb0hEZUpYSTI5dVNZanB3UFJL?=
 =?utf-8?B?MW1helROcUpPaVg3MjVhVUhkZlR0ajJvYlQrQjVJa29nVjlFZ0dMdk5ENitG?=
 =?utf-8?B?M0kvRVRyejNtYk5KbFk1OG82dlBhdlNmajVuZ1pRMExqZVFRT1lSUnBkV1hI?=
 =?utf-8?B?alpaWUtCTE4rd0hPVVdZKzlOMDJncW9CNVYybDR6Qk5uQ09SOFNyZDh6d1B4?=
 =?utf-8?B?OGtuZzFBdVA1alBMSVkxb1dzQm1oQUNIWnJUU0NxZnJvWlhhd2poRmR3VGwr?=
 =?utf-8?B?dk8zZks4K0pWSTlkUnlIeEducnZwc0dQSnFnOTV6SnBYQWZKNExoOFNrVUZi?=
 =?utf-8?B?bEM4Y0Z6eVlXN1JmbVFxZmhBM1ZZUENrdHRxMFJiMUNQVm5xVnZ4SjFkMjQw?=
 =?utf-8?B?VTd4M0tweWFMUmUwUVZ0S2s4UFhXRENBWDlpejh4ZGZqazZPUnVRU0pIb3pV?=
 =?utf-8?B?cWFzVDVadWg4eGRWWDZkY0dUZHpRWU1LN09SS2M2d3I2UWNtdjFTcm5zS1hW?=
 =?utf-8?B?Qnk1MXgybUI0aGZNQ2RIZFlJa2h3RVNmL3Z1TDRqKzNocUlxdmJ1ZEpBdDVO?=
 =?utf-8?B?QW5JK1BKRXVvLzE0cHkrUE9EeVRmbTV2aEppVmdqb3RMSnpJc1NWek15M0tC?=
 =?utf-8?B?dURBQ0YzU3JieThFakdkNzVtdWNoUkRhZlJiUGVySEJiRmdhR0tTTkZFYnJp?=
 =?utf-8?B?b0Q1c0JzQS9MVnRzUFFVKzlPUnJRZnBOdlkvUkFEcEp5SmFBenNheWpzZ2dt?=
 =?utf-8?B?bzZFOW5xNU1CdmZWOEkxeWZINW40N3BONjZ5ckZiMDJGZVJUMDlSbHJVa0ZO?=
 =?utf-8?B?Ny9GNmp2QnFqa0tQMUw4eFozekdoV0NnWDBURWhvUjk2b2NYZmZUM0VNSFB2?=
 =?utf-8?B?ZFpvMXFDSDd4LzB4MW5Jcy9xYXN0b1liZEhYQmR4Q0JWaUhGa3dKYXlJWkpM?=
 =?utf-8?B?OGdHT1NQbDV3NnZUOGtsRG50bVpGazFFMlpzUGRNazNkSk53WUZkQzN2bjQ3?=
 =?utf-8?B?bDExMzA2NDVCL1JIZTdhbklWNDZ0SEhSNGplUUpkUk1RTE9pTGJFQmk5MFhI?=
 =?utf-8?B?VnFiMGFiOStuTXloSGZpYlNCYjg1eFMyMlZkR213WVRVOXRmdFBueTd5VFVO?=
 =?utf-8?B?R1ZOOWM5US95VklDRllhakVUbk9HL1krQ1ZKWmh1RC9SUmFobkFzbXBvd3kr?=
 =?utf-8?B?WkRNeFZTRVNEZWhWQUM2WHZQZ1Vybk1COWpDOVN3ZUVaVVFOb0RqQnluQklq?=
 =?utf-8?B?UjJVcUFrMHo4MWxIN1RhMHIwUmhOZGtUMStjdy9hcEtTblkxWWd4Q0hXTFRP?=
 =?utf-8?B?WWNXQzNVSmpobVFSb1VXTjZaaEZuVVcvMDlXV3o3V1dIZlB0Z1h2T3RtOWFM?=
 =?utf-8?B?SDJ6Y1pzcDFKTVM2cjVJVFhLOEVKUnozcitsZmljT3M2MmkveEdYWU9NNGNq?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d3d89f-58f3-4b69-325c-08dbaa70a781
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 22:21:42.8502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0XL+GAF/uEmanw5lTS1k+w5yL05Cg9DIe6mAN/WLa/ZWMWgRdd3nSzDZq2TGX+RxHrRci5p06i0KxOf3GyE7MboCEOJlPLdkwBTCBoYB9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
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


On 8/31/2023 3:11 PM, Aravind Iddamsetty wrote:
> On 31/08/23 22:28, Dixit, Ashutosh wrote:
> HI Ashutosh,
>
>> On Thu, 31 Aug 2023 03:29:11 -0700, Aravind Iddamsetty wrote:
>> Hi Aravind,
>>
>> Hmm, what happened to the email formatting here?
> not sure, some how my email client is showing proper or I messed up.
>>>   On Tue, 29 Aug 2023 22:15:44 -0700, Aravind Iddamsetty wrote:
>>>
>>>   diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> new file mode 100644
>>> index 000000000000..41dd422812ff
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -0,0 +1,679 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/drm_managed.h>
>>> +#include <drm/xe_drm.h>
>>> +
>>> +#include "regs/xe_gt_regs.h"
>>> +#include "xe_device.h"
>>> +#include "xe_gt_clock.h"
>>> +#include "xe_mmio.h"
>>> +
>>> +static cpumask_t xe_pmu_cpumask;
>>> +static unsigned int xe_pmu_target_cpu = -1;
>>> +
>>> +static unsigned int config_gt_id(const u64 config)
>>> +{
>>> +	return config >> __XE_PMU_GT_SHIFT;
>>> +}
>>> +
>>> +static u64 config_counter(const u64 config)
>>> +{
>>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>> +}
>>> +
>>> +static int engine_busyness_sample_type(u64 config)
>>> +{
>>> +	int type = 0;
>>>
>>>
>>> Why initialize? The switch statement should have a default with a BUG/WARN_ON
>>> below? Also see the comment below.
>>>
>>>   +
>>> +	switch (config) {
>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>> +		type = __XE_SAMPLE_RENDER_GROUP_BUSY;
>>> +		break;
>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
>>> +		break;
>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>>> +		break;
>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>>> +		break;
>>> +	}
>>> +
>>> +	return type;
>>> +}
>>>
>>>
>>> I am thinking this function is not really needed. We can just do:
>>>
>>> 	int sample_type = config - 1;
>>>
>>> or
>>>
>>> 	int sample_type = config_counter(config) - 1;
>>>
>>> It might not always be true in future, the configs can start from any range.
>> Disagree. This is uapi. Once it is exposed it cannot change. I am talking
>> about this:
>>
>> +#define XE_PMU_INTERRUPTS(gt)                  ___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)           ___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)             ___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)            ___XE_PMU_OTHER(gt, 3)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)       ___XE_PMU_OTHER(gt, 4)
>>
>> How can this "start from any range"? We can only add new counters after
>> these, not before these, correct?
> I didn't mean to say that these particular one's would change but any
> future new events that might fall into these categories might start
> from a different range. sorry for the confusion.
>
> Your suggestion makes it looks simple but somehow i wanted to tie this to
> the enums we defined in sample array, so ya will check one more time if
> it doesn't really makes any sense will clean it up.
>
>
>>> in engine_group_busyness_read? See comment at __xe_pmu_event_read below.
>>>
>>>   +
>>> +static void xe_pmu_event_destroy(struct perf_event *event)
>>> +{
>>> +	struct xe_device *xe =
>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>> +
>>> +	drm_WARN_ON(&xe->drm, event->parent);
>>> +
>>> +	drm_dev_put(&xe->drm);
>>> +}
>>> +
>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>> +{
>>> +	u64 val = 0;
>> No need to initialize here I think. We are not really expecting to drop
>> into the default case, which should be caught much before we enter this
>> function.
>>
>>> +
>>> +	switch (sample_type) {
>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>> +		break;
>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>> +		break;
>>> +	default:
>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>> +	}
>>> +
>>> +	return xe_gt_clock_cycles_to_ns(gt, val * 16);
>>> +}
>>> +
>>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>> +{
>>> +	int sample_type = engine_busyness_sample_type(config);
>>>
>>>
>>> If config is event->attr.config, this can just be 'config_counter(config) - 1'.
>>> See comment at __xe_pmu_event_read below.
>>>
>>>   +	const unsigned int gt_id = gt->info.id;
>>> +	struct xe_device *xe = gt->tile->xe;
>>> +	struct xe_pmu *pmu = &xe->pmu;
>>> +	unsigned long flags;
>>> +	bool device_awake;
>>> +	u64 val;
>>> +
>>> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>>> +	if (device_awake) {
>>> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>> +		val = __engine_group_busyness_read(gt, sample_type);
>>> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>> +		xe_device_mem_access_put(xe);
>>> +	}
>>> +
>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>> +
>>> +	if (device_awake)
>>> +		pmu->sample[gt_id][sample_type] = val;
>>> +	else
>>> +		val = pmu->sample[gt_id][sample_type];
>>> +
>>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>>> +
>>> +	return val;
>>> +}
>>> +
>>> +static void engine_group_busyness_store(struct xe_gt *gt)
>>> +{
>>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>> +	unsigned int gt_id = gt->info.id;
>>> +	unsigned long flags;
>>> +	int i;
>>> +
>>> +	spin_lock_irqsave(&pmu->lock, flags);
>>> +
>>> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>> +		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>>>
>>>
>>> This is not quite right. At the minimum we need to take forcewake
>>> here. Also since this is called in both suspend and runtime_suspend code
>>> paths we might also need to the take the runtime_pm reference.
>>>
>>> The pm reference and forcewake are already taken in suspend paths hence
>>> didn't add here again as this is called only from those paths.
>>>
>>> check xe_gt_suspend.
>> Sorry, you are right, I missed it. So this is fine.
>>
>>
>>>
>>> I think the simplest might be to just construct 'config'
>>> (event->attr.config) here and call engine_group_busyness_read? Something
>>> like:
>>>
>>> 	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>> 		config = ; // Construct config using gt_id and i
>>> 		engine_group_busyness_read(gt, i);
>>> 	}
>>>
>>> This will automatically save the read values in pmu->sample[][] if the
>>> device is awake. Thoughts?
>>>
>>> I think this is best kept separate from usual read paths(which are
>>> atomic) didn't want to club them.  Also because forcewakes and pm
>>> reference are taken separately in suspend path.
>> Sure, no changes needed here. Just get rid of the braces to keep checkpatch
>> happy.
>>
>>
>>>
>>>   +	}
>>> +
>>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>>> +}
>>> +
>>> +static int
>>> +config_status(struct xe_device *xe, u64 config)
>>> +{
>>> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>>>
>>>
>>> What is this for? See below.
>>>
>>> reminiscent of my previous code, will clean it up.
>>>
>>>
>>>
>>>   +	unsigned int gt_id = config_gt_id(config);
>>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>> +
>>> +	if (gt_id > max_gt_id)
>>>
>>>
>>> Maybe this can just be:
>>>
>>> 	if (gt_id >= XE_PMU_MAX_GT)
>>>
>>>   +		return -ENOENT;
>>> +
>>> +	switch (config_counter(config)) {
>>> +	case XE_PMU_INTERRUPTS(0):
>>> +		if (gt_id)
>>> +			return -ENOENT;
>>> +		break;
>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>> +		if (gt->info.type == XE_GT_TYPE_MEDIA)
>>> +			return -ENOENT;
>>> +		break;
>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>> +		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>>> +			return -ENOENT;
>>> +		break;
>>> +	default:
>>> +		return -ENOENT;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int xe_pmu_event_init(struct perf_event *event)
>>> +{
>>> +	struct xe_device *xe =
>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>> +	struct xe_pmu *pmu = &xe->pmu;
>>> +	int ret;
>>> +
>>> +	if (pmu->closed)
>>> +		return -ENODEV;
>>> +
>>> +	if (event->attr.type != event->pmu->type)
>>> +		return -ENOENT;
>>> +
>>> +	/* unsupported modes and filters */
>>> +	if (event->attr.sample_period) /* no sampling */
>>> +		return -EINVAL;
>>> +
>>> +	if (has_branch_stack(event))
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	if (event->cpu < 0)
>>> +		return -EINVAL;
>>> +
>>> +	/* only allow running on one cpu at a time */
>>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>> +		return -EINVAL;
>>> +
>>> +	ret = config_status(xe, event->attr.config);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (!event->parent) {
>>> +		drm_dev_get(&xe->drm);
>>> +		event->destroy = xe_pmu_event_destroy;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>>> +{
>>> +	struct xe_device *xe =
>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>>> +	const u64 config = config_counter(event->attr.config);
>>>
>>>
>>> Probably nit but this config being different from event->attr.config is
>>> confusing. Let's use 'event->attr.config' throughout as argument to
>>> functions and use config_counter() to get rid of gt_id. So get rid of this
>>> config variable.
>>>
>>>   +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>> +	struct xe_pmu *pmu = &xe->pmu;
>>> +	u64 val = 0;
>>> +
>>> +	switch (config) {
>>>
>>>
>>> switch (config_counter(event->attr.config))
>>>
>>>   +	case XE_PMU_INTERRUPTS(0):
>>> +		val = READ_ONCE(pmu->irq_count);
>>> +		break;
>>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>>> +		val = engine_group_busyness_read(gt, config);
>>>
>>>
>>> engine_group_busyness_read(gt, event->attr.config);
>>>
>>> hmmm ok.
>>>
>>>
>>>
>>> Also, need a default case.
>>>
>>>   +	}
>>> +
>>> +	return val;
>>> +}
>>> +
>>> +static void xe_pmu_event_read(struct perf_event *event)
>>> +{
>>> +	struct xe_device *xe =
>>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>>> +	struct hw_perf_event *hwc = &event->hw;
>>> +	struct xe_pmu *pmu = &xe->pmu;
>>> +	u64 prev, new;
>>> +
>>> +	if (pmu->closed) {
>>> +		event->hw.state = PERF_HES_STOPPED;
>>> +		return;
>>> +	}
>>> +again:
>>> +	prev = local64_read(&hwc->prev_count);
>>> +	new = __xe_pmu_event_read(event);
>>> +
>>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>> +		goto again;
>>> +
>>> +	local64_add(new - prev, &event->count);
>>> +}
>>> +
>>> +static void xe_pmu_enable(struct perf_event *event)
>>> +{

The i915_pmu code checks which event is requested here and accordingly 
sets pmu->enable (which doesn't seem to be defined here yet). Any reason 
we are not doing this yet?

Thanks,

Vinay.

>>> +	/*
>>> +	 * Store the current counter value so we can report the correct delta
>>> +	 * for all listeners. Even when the event was already enabled and has
>>> +	 * an existing non-zero value.
>>> +	 */
>>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>
>>>
>>> Right now nothing is being enabled here (unlike i915) so the function name
>>> xe_pmu_enable looks weird. Not sure, maybe leave as is for when things get
>>> added in the future?
>>>
>>>   +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>> +{
>>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>> +
>>> +	BUG_ON(!pmu->base.event_init);
>>> +
>>> +	/* Select the first online CPU as a designated reader. */
>>> +	if (cpumask_empty(&xe_pmu_cpumask))
>>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>> +{
>>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>> +	unsigned int target = xe_pmu_target_cpu;
>>> +
>>> +	BUG_ON(!pmu->base.event_init);
>>>
>>>
>>> nit but wondering if we should remove these two BUG_ON's (and save a couple
>>> of checkpatch warnings even though the BUG_ON's are in i915) and just do
>>> something like:
>>>
>>> 	  if (!pmu->base.event_init)
>>> 		return 0;
>>>
>>> The reason for the BUG_ON's seems to be that these functions can be called
>>> after module_init but before probe.
>>>
>>> xe_pmu_cpu_online() doesn't depend on pmu at all so looks like the BUG_ON
>>> can just be dropped?
>>>
>>> the  xe_pmu_cpu_online/offline are not invoked when they are registered with
>>> cpuhp_setup_state_multi, but rather when cpuhp_state_add_instance() is called
>>> which is done post the PMU is initialized hence the check for BUG_ON.
>> cpuhp_setup_state_multi is called at module_init
>> time. cpuhp_state_add_instance is called from xe_pmu_register, i.e. during
>> device probe when pmu->base.event_init is already initialized. Therefore
>> seems even less reason to have the BUG_ON's.
> that is true even, so will remove the BUG_ON.
>> Just a few minor issues left now so I am hoping we can wrap this marathon
>> review up soon :)
> ya i'm waiting for the same :)
>
> Thanks,
> Aravind.
>> Thanks.
>> --
>> Ashutosh
