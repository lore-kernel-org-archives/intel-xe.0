Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC204C47DDC
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 15:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9F10E326;
	Wed, 24 Jan 2024 15:40:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42210E326
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706110825; x=1737646825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QAjAXQpjCFVq/6xYQgCW4BqFbYeQb0KgbgmUbNnhuvs=;
 b=dZ0npetOvEGKS5sZr4wc5aZRRrxls2VwBMKUoBxziCAi3jK6ylz/Acyz
 zoz8EB/cDS/POggUaxcp3cgIbZAleLyM87BGLdboxu5icP/N/1NITNXAk
 sY15R12CC81X1JpJjiow1v7+4ptFqDUXhObkxtBOOxtoDR34AVxfDQHuh
 oghHXdC+LqxXI26b2ycbADXhoPjAo7V0pE4tMfwAkLnh5v+1382pqMWA2
 mMJN1JpEQ9OOXz6TFtkyQ0u5X4HpEpGsMjVure2zOWXvjzFvKp9m9BAnC
 8u5BIUYvbcNifUg3gmRzYEumK1arzHJL05Bw7blE3M1vhKTaFkaSpfh8/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401537839"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401537839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 07:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28432530"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 07:40:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 07:40:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 07:40:16 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 07:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvCvU+M/fNTex5gGCZ4nj5h14MMuaQG9KjTAVjdnc2uO+FK+nPnR/7MamCn+/yHR/nMD60rE0Hic9g4o0hF/ZeS5oz/TXzinh+BeP4XnBgEO/lVnKm1vwgotQsm1ooY35KEmaaOiUzLC2xQ1lhWsWm8r7gHqDn6eQY7GkCmBVi+sjwwAc1LbtFbmm7ZJo/7qgKff6aKGBK4nR3zWYc8fB94rF7xw5owzatVXOjCopYvn2S0xy3qnSLUvtRrIaUgJVg5PjyIWixcdh5u4RY98iCNDatRQr3JqXwhzYjK5Xh+LAuhMNGMF6dvY4h1M+6WkENkXddXLUP8d4TuoY9ryHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L43h5y5nNa6aIdvI0DF2mMAQlO6IEI16pKOUDPCbgA=;
 b=Y5QAyRJfI4DkptbYJimwVxUjW7p/K2l4vNYxxhe0DYs74i2S45tfLhTJYE49r1XzSXmSE4ltp/Qrb0vw4BqdwEyE9Yw6mkk9w8fUuoiR7lzZoIvdtOP3NgLkz4I2Wwq/9Sc/QFdlr+esd6yZEdFrc7cgEvQNmRAf7qa7M6TIKQAyu+VxSon21/i8HcR9o5b985aexH6ESKhepfmzqpxqMAVCoYcATlErh1zejKm+rcMmrMKmqaOlwNygDZBVxWYvrwpcPc7Ob2J1bKhreny5iFt2LwfjtOfX43QVTy1+m1Q1A63uCban0yA4qXLy07qPNIMU3OdbwRhO47/pPR142w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 15:40:14 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::565f:6975:c06e:819d]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::565f:6975:c06e:819d%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 15:40:14 +0000
Message-ID: <5b4a5e5c-b47c-49d7-8851-78711a921c9d@intel.com>
Date: Wed, 24 Jan 2024 21:10:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Group normal kunit tests in a
 single module
To: Lucas De Marchi <lucas.demarchi@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>
References: <20231122203147.988021-1-lucas.demarchi@intel.com>
 <20231122203147.988021-2-lucas.demarchi@intel.com>
 <20231207171110.67073e33@maurocar-mobl2>
 <xo7nktc3nv4rrwdql2ad3d5fzi5q4fci4dwzeqr3xr2ltyv64y@4m7mpijc65m6>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <xo7nktc3nv4rrwdql2ad3d5fzi5q4fci4dwzeqr3xr2ltyv64y@4m7mpijc65m6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::6) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d82175-ec83-480f-55d0-08dc1cf2c193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RcJ9Ns7hLs37BUvuDmgg1On5RHx5URk6StLFrHOweW2yLKyIkF6KMPUFhOqjQFIro65kLOin7MRPrtcENN9mTvrfaeYvILv5YR8/vzL3IMyOYhiqxS+uUuY4Eb+eLliuoF7/Q3JuMHVQ8ArG9qRGco4HjMXpSm1rSuQ9rlIQN7FuwQCoHLwAoEgOgUe5PDGWJgb8XWA2cDFKGYtZWp/qcxqpSFUey1t1zQGvfijtRgrFDTX2UIL7KolgzaTxUJfJ3/kQh7XCwhfCVj0gDdJrqUP4Nw6ObocGIvOFD+t6ifI7Gh8+r1A7kSDA68+X9BpzCc7kk0wfUXiXENzeYcTy/e4vGgTy/KXIlTvAYVsYFhr2pnO5jKh8dFOjWFDJvMwWaByc0pkusU6tJEoozRdKZjrxL6/nLrJU2hOP9qA10KsddaBwsnRsaK+Cee+3mZ0r1CnX2PHwZl2ASPxK5VGi/J3ocD26WKIllqVOeMgQz/emdiMsroVcCEZ6wAxWLx5NeNcutvbO4QY/PpBuiY4j1Wi4F2TNb/uwWb2RmBQ526U62Zwgnv2BY2Dem96IdOcuN3auepTCRFu6e4uaF5Ah5bAbTI2fJgbrCTcQjNz7AjEPqJyYDoseujQ/8IpDFu030sS2m0tLOQkABy8gvVGL8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(26005)(41300700001)(36756003)(31696002)(86362001)(38100700002)(82960400001)(2616005)(316002)(66476007)(66556008)(66946007)(4326008)(8936002)(8676002)(110136005)(5660300002)(2906002)(31686004)(53546011)(6506007)(6666004)(6512007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRxSzdMbHlXb2ZEVTZ2MTVuWmNpZlV6M3VnM0dvdVJpanF6elRoMTIxNXlr?=
 =?utf-8?B?VHBaQkZZRm4vQzR1bkFMbm5Ydmd1djRqM1k1SWwzT3BDS3Y4RUtIZG05TG9i?=
 =?utf-8?B?S292RHFvRkNZQ0ZMZXJqU1dSQ0FBZHB2WGx1RmI2Ynh2SXdubDYwb0F3eVk0?=
 =?utf-8?B?eU9LQmlnSXREZ3BwQXUyekhJTG9tOERYUVcxYk9iZlZlb1BiMklSTVdUcGVW?=
 =?utf-8?B?dXlFN2NNMGdBejRYQUVOcHc3SUM0cHRQeW8yL1FqODd0WWpNOEtZOW9Tc09w?=
 =?utf-8?B?MWt4OExIaS9KRDllcVZ5d3g1WlQ1M1NYRXJRVndaZHFSc1dURitMaThUTnRk?=
 =?utf-8?B?NE5GWnkydlF5MHY4aFVNSDFJSEJBZWV0UUprQ3Q4S3ZXbTJwRURDb0pRK1Vj?=
 =?utf-8?B?d1IrSlJTOXE3SVBtQ2FjcngyUVhrUStFQlFvQkJBUklTdVNyOHA1MXJ1RUYv?=
 =?utf-8?B?TmthKytoRGNxVFZPaklseDNab3czMlAyY2pHc0FkYXd1ZEUzejJoNnFnUTZp?=
 =?utf-8?B?RWJLaTBDanVjU2VHNjJJVFhMbWlBZXA2UXhrUUZoa0Y0NE9DQTFXb1FTQXFr?=
 =?utf-8?B?NktCMEJEaUhsaGszaVQ3Yi9NR2dxL2syK2thYmx5YjJRbzArZGNVL0ZLdVZ4?=
 =?utf-8?B?aWpSUmpuRjZLckdQS29Oc3ZtenJGc01Lc1poczN1MWhxOFRLNHF6dEpYejNw?=
 =?utf-8?B?Q0RRTUZhVEkyUkJjSDNKdzNCRklFQU4ydU1FMVprSStpc1FWY0k1N0Q4L29V?=
 =?utf-8?B?MHR1M25JM04yNGJFWFdqZlVLekFwOXVITHBibHlzMk41aHN6dWlJMzkwNEZx?=
 =?utf-8?B?dE1GZUM0VEhnU2ZKL2gvR2NRVDFYdUxEb1QwamREWWVaZFZWajJMTnpONHNz?=
 =?utf-8?B?SmZiTzhQY25xN3phNUJuQkttV2pRczF0UjJJTjJjNmpmVDNDdDg5UThrVkll?=
 =?utf-8?B?YlF2ZFE3YmhPZTBGUG5sQzJNbVhpenJCT3BwbDVxSkV2MDN0aGhxaEZPOElH?=
 =?utf-8?B?ck9WbnJHQ0hVOGd5aC9VWUlLUy9KeTVES01raENjZlF0RlhqS0htRHh5ZFFZ?=
 =?utf-8?B?RWUwaG10U3BhTklCb2hUNy9hNGZ1UzlsbHRJUHYyaUdHYkZTWGhyK3dMeTZ0?=
 =?utf-8?B?WXZuc3MvRkhoY3g5aXJoTmwzNVlWTVFpUkRKSVBNMHJzK1NqRzE0VVJZR25j?=
 =?utf-8?B?OERzUEhGa0FjcjZyRmJlZS9nd0hxL0Nvc0hmL3dad1BUQ3RZMmh2MENMcmxR?=
 =?utf-8?B?VGdDUXZYR3d1MEhqeEtDdkk5M0lhMUpwaGlxZFFTNnpEWE4yZnBnZTNEcE5I?=
 =?utf-8?B?OEwxRXI0bGRnN1ZsbDN1a1JqT0RybmVyc0I0WEd1QWd0bC9JeHozcjM0Qisx?=
 =?utf-8?B?THI2L21wbklNTUMxRXJPQzdCSUJKSmpaNXlhMHMzU1NQcVJqK3VhbmR2K0Vz?=
 =?utf-8?B?a0FXNHF5WEJYNDByZ3ZSZDVjL0V0THdHRDF5MnlBLzhOa3pJVGFlSzZJUWlz?=
 =?utf-8?B?VnUvcDJpQ1duWGtIclBNaVJ2Zk1CNWdNSTVkYmQ1UEdzNW85VG9lUEpVd0N0?=
 =?utf-8?B?dlg4dE5ZK1c5Y1g0NjU1ZmdTYjMrYnhyVkVNK2ZsOWtjY0dZVk4yZXBmZGRp?=
 =?utf-8?B?Tmk4bUtwQVd4UVlWdnJ6UitpTk9ncFdvZFREbDdWVEpiQXFCQ21jZWRpV0NQ?=
 =?utf-8?B?M3JJMmdBZjJGQ1UzSlNERjZtdTNsUEtmT2V0TW92dDZIaDlsM0lmZUhKLzRj?=
 =?utf-8?B?Rmt6YURyMnBjRXhQL25aK1hVbDZSYjc1b0o5YXcweVRlTDdpYk1ub3R1ZjAy?=
 =?utf-8?B?eEtXQ0ZxYzFzbHRmaWx3cytLZVBKY095NEJndVdlV3NGZk05OXdUN1V3S292?=
 =?utf-8?B?Tmt5TXBPZWVrREdpSzBFQXkzMUt5eThqQUxmUU9sanMxSXpMVEQyQTAxMlJ1?=
 =?utf-8?B?VFF4djVPR0RObEFGZlpUZHhoaTc1cVJJNGhQbFRpam5xY3VHeW96bnNzSE5Z?=
 =?utf-8?B?ckEvV1UwOW9hQ1pXYUROOFllNk9pWTVvMUJQUzczK0s5UGRKdlk3d1NQeFVQ?=
 =?utf-8?B?VGo3d2x0SC9qSktkcXhoRXI1NDkvaWJBVmxvdkExZlFWbUNFWksrVTNocGZh?=
 =?utf-8?B?ZGg1MmpMbm5DSWxNY096Yk01S0dETmEvRDd3UkRHOU1abjE0eTRDQS9UZVd2?=
 =?utf-8?Q?s8DzeHfIoJ2oKhGhbkbTzYU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d82175-ec83-480f-55d0-08dc1cf2c193
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 15:40:14.0287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYMmP9lbjdplkgU57M/+hLdbI9b+mZqO8BjmdHxYc/Py7fhC3ScNxavB8XE26vKbWiToOMaIELkIJBGpZQO1GlwX9tevsCXVMo+WGks2ylg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

Looks fine to me.

Reviewed-by:Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>

Thanks,
Ravi Kumar V

On 12/8/2023 11:28 PM, Lucas De Marchi wrote:
> On Thu, Dec 07, 2023 at 05:11:10PM +0100, Mauro Carvalho Chehab wrote:
>> On Wed, 22 Nov 2023 12:31:46 -0800
>> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>>> Creating one module for each compilation unit to be tested seems
>>> excessive as the number of tests increase. Group them all in a single
>>> kunit test module called xe_test.ko.
>>>
>>> The tests requiring the physical device, aka "live" tests, are still
>>> kept in separate modules since they are normally triggered via igt,
>>> and not via kunit.py. After igt is converted, those can be merged in
>>> a single module as well.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/tests/Makefile      |  7 ++++++-
>>>  drivers/gpu/drm/xe/tests/xe_pci_test.c |  5 -----
>>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  5 -----
>>>  drivers/gpu/drm/xe/tests/xe_test_mod.c | 10 ++++++++++
>>>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  5 -----
>>>  5 files changed, 16 insertions(+), 16 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_test_mod.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/Makefile 
>>> b/drivers/gpu/drm/xe/tests/Makefile
>>> index 39d8a0892274..9d1d88af8b2f 100644
>>> --- a/drivers/gpu/drm/xe/tests/Makefile
>>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>>> @@ -1,10 +1,15 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>
>>> +# "live" kunit tests
>>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>>>      xe_bo_test.o \
>>>      xe_dma_buf_test.o \
>>>      xe_migrate_test.o \
>>> -    xe_mocs_test.o \
>>> +    xe_mocs_test.o
>>> +
>>> +# Normal kunit tests
>>> +obj-$(CONFIG_DRM_XE_KUNIT_TEST) += xe_test.o
>>> +xe_test-y = xe_test_mod.o \
>>>      xe_pci_test.o \
>>>      xe_rtp_test.o \
>>>      xe_wa_test.o
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c 
>>> b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>>> index daf652517608..59e29a148478 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>>> @@ -67,8 +67,3 @@ static struct kunit_suite xe_pci_test_suite = {
>>>  };
>>>
>>>  kunit_test_suite(xe_pci_test_suite);
>>> -
>>> -MODULE_AUTHOR("Intel Corporation");
>>> -MODULE_LICENSE("GPL");
>>> -MODULE_DESCRIPTION("xe_pci kunit test");
>>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c 
>>> b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> index a1d204133cc1..83b0ba097a3e 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>>> @@ -310,8 +310,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>>>  };
>>>
>>>  kunit_test_suite(xe_rtp_test_suite);
>>> -
>>> -MODULE_AUTHOR("Intel Corporation");
>>> -MODULE_LICENSE("GPL");
>>> -MODULE_DESCRIPTION("xe_rtp kunit test");
>>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c 
>>> b/drivers/gpu/drm/xe/tests/xe_test_mod.c
>>> new file mode 100644
>>> index 000000000000..875f3e6f965e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c
>>> @@ -0,0 +1,10 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include <linux/module.h>
>>> +
>>> +MODULE_AUTHOR("Intel Corporation");
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("xe kunit tests");
>>> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c 
>>> b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>> index 01ea974591ea..4eb8e1e8a76c 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>> @@ -135,8 +135,3 @@ static struct kunit_suite xe_rtp_test_suite = {
>>>  };
>>>
>>>  kunit_test_suite(xe_rtp_test_suite);
>>> -
>>> -MODULE_AUTHOR("Intel Corporation");
>>> -MODULE_LICENSE("GPL");
>>> -MODULE_DESCRIPTION("xe_wa kunit test");
>>> -MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
>>
>> AFAIKT, if you want to have multiple test groups at the same file,
>> you should use, instead, a different macro, pointing to all
>> test suites that will belong to the module, e. g.:
>>
>> kunit_test_suites(
>>     &xe_pci_test_suite,
>>     ...
>>     &xe_rtp_test_suite);
>
> having multiple kunit_test_suite should be fine as it will only add the
> symbol to a special section, .kunit_test_suites, and when the objects are
> linked together there will be one .kunit_test_suites section with all of
> them. We'd need to force using  kunit_test_suites() if we needed to
> enforce the ordering (although it's still up to the linker if it will be
> top to bottom or bottom to top)
>
> I think kunit_test_suites is useful if the suites are on the same
> compilation unit, but we don't really need to export the symbols just to
> group them in a single place.
>
>>
>> Regards,
>> Mauro
>>

