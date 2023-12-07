Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7317FC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC6610E7E2;
	Thu,  7 Dec 2023 05:30:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D188410E7E2
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701927005; x=1733463005;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YIy2KKDsHwLAYnOZK7muzBHVb7oi5itBvB6WGAlueXM=;
 b=iFCZJ+3dV7yzVEqjQ7mfEiZTp4EL2q23FTuzyDQMEAr+E9nQ8YaXSZVW
 yPv4ejlnGVX4J9K9ii6FW7he8kwI7zeqTMlNZcgGQ5yJ30tz0Ns73OMxs
 KXEGOMuvdvER8oOl/+QvMKHCB5HeHyvsXkVBfs3SF7MPXnqZSTazsbC80
 e+9Q5Nv0Ge4s5PSBfI7eDHTMELtqzjpAmzK8a21WsoCdO9FWP5Kc4IUUC
 ULe1FhMSmUxiiMqNIqmbARn3cfXbLT1RhvMBMIiocrtgtVeoK8T2ABQBb
 C8bRe+59fMq8Dr5+XRCzL8iqTK9qojjCpltZCVxRqN1N/zsj4x6MWeNVU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1242590"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1242590"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="944903475"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="944903475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 21:30:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 21:30:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 21:30:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 21:30:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jdt+bzl+OoefKYqARFXC2NAY/BWKP/ILg/ODXnzYEvGdunATilzL5TaHPggD4ERmtqYltI+1hQOK4RGuZsg41ZMEX5r77SSweuHcvOFHCliDSsdhbiC3ITzGvsEJ2wSRGIx5RYV2fbyoB9HQN3k4HwTGhdhZumxbdPWeUOLjZLz4Oli1GeYFHIMSZruoFBRohBOw/5AhGmR9swNGlPb5TZ5SLkUh6eX39GZ9WRA7dbtpkzWsEaA9adZkY8hrggZDO8avn2ieHufgWC2fF9x6dtN7Yl4mtcxfe00G9GVRkUlZrkg1X0J0Eu651zl2o/i0lxf0o+Nb6g17hgwEKEu/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZaifRaDTb7UrEatsIWOM51vIjC5lWLaRX6U7JBQ+IY=;
 b=Ylrp5R6BOtn+DwIm7PbogyjB9q9rWttLpzaaL2DhJiyt6tRMwDN8fcCo2Uxof0iUTS9D7waRs7AlOtQCdPsZ2i8Rb6p/SRVcZ9u13ZqcG6TNqdxXUMt2gUPCExgzi7fPWG9tEwdHUjvtf7/Kl5QCMNCDJqVRJsUQ/ODd5QOPSbYg9mFuKsudYDouxKjKL3HJkEqt+Xxpi5LV0QQT351SFfscku2iiK5vUuCdXN1BVLyBY+3rnjjwQaj8G/0pFu4vgZZxHIlvVVnUrCRCx1l8gHLxYA3TaDVKk/l2SL60Z306YMh6Ftimwt/zZY0ATmjkVcvguT9EJ3lv37oWAynj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 05:29:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 05:29:59 +0000
Message-ID: <1813763e-6662-485d-9ea1-47bda59a7cb4@intel.com>
Date: Thu, 7 Dec 2023 10:59:52 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <20231205213659.179813-3-rodrigo.vivi@intel.com>
 <7531590f-11a0-440a-a222-bb9d9a01438e@intel.com>
 <1d85504a-0717-4b4e-9d35-be4bcb5adf3c@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <1d85504a-0717-4b4e-9d35-be4bcb5adf3c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7294759d-2cdb-46a3-4666-08dbf6e58dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcCQ89VlR/Sy9Z2iwJskdcArxlE0UW1qsjV/RV6uGRHch27n/aK0cCg26MerKjfetKKObh6Ujwf6Rlw3hO99+cQ8UyB0YKuXd6Hq5afRPHbmTlMyJaJHRR+EwGfZpe/mjLGiOHkCAL+9Lg+J/bzfK7U47dFAPR02fBx6DmZUogb4XR8LhdmPuR1mCKsnIY/dXNrQs+AguplpfhGglSLv+3K7njhfnSr3cPDum/iITc1jCjexUGi/nHB0rsWd6IweQBieTPUPSrPq6JMkfdTEwKmmHZJVZj0PP18Q0+TtpbZ/2xi+cc3kLwkNLogCuo+iQtShVkO9iYsSnjOkkst5fqBcKROUMwsrsNHE5B8WRjjg5JKfFAu54s2rPGO/ctArhNj04S7Kv136Y0+g2IVvWtq8aPqnBUz0Yxl8SAKyFs5/UDi4bfgY/KfkZZ7wIpJ4rRuVkZqNj7ECtElQvrT8lu7dMf6Fmv7pyCocmZQ/4AgQdR5672t2fVyBhaVVRNE3qAhn1/EL98F8GaVWaqpuXk8BKpUvKkUl+DWYgPZlEYwL2dh7k0jQqKkJTd0fELXTh0FeQatPU1N4fDYgm9AAeJXvJS51ze4lYjMRMhN9qncHlu0S9oVNNgY1hP4jUQ0r29+R/CJm2RQLbaQXZRKvxnTWaDW1yyjwSQEiZEfOY1DgFozIswuhofuLC7khzZwF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(86362001)(66946007)(66476007)(66556008)(31696002)(110136005)(26005)(2616005)(83380400001)(6666004)(6512007)(6506007)(53546011)(36756003)(41300700001)(478600001)(6486002)(316002)(82960400001)(44832011)(8936002)(8676002)(2906002)(31686004)(30864003)(5660300002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2dxY0tkaHpnTkg1anpEVzVnbXJmSnJzMmtOVEJDaTJwWUR5UHFXaHZYMUxh?=
 =?utf-8?B?bWNRMUpmd3ZXWlpYWm9wSlNHR1B5OGFrd0FBOHpTdkxoRk9BQUJ0S1NEMitq?=
 =?utf-8?B?d1p1TGFIazBtZjJZb3lOZUdBYThaQXFQZjhVeVllZ0N1RnlkclhhVkV2Ulha?=
 =?utf-8?B?NkpOYmNXTnRMWGpVUi9VdlJ6NXZZWkZzajhCZ3ZCVU15TE85MWU4RGNLVElW?=
 =?utf-8?B?aEZXS25sMVIzcGNzS3hFZTd1WWVoWFUrM3BZV2kxWVBSV0dDUndEODVFaUxs?=
 =?utf-8?B?ZHlIRnRONjBBYkNQSTc1TUw0b1VZSk5xakRNeEJ5UzlsU0pJZ2xzM1BIZi9W?=
 =?utf-8?B?dnV0MXFoYXdSZU1UOEhEWjdob1BPUTh6WEl3eXFleTA3YmlFR29IYlhZTlpP?=
 =?utf-8?B?REV3LzZjRGdwRkZuQThVUHBqWmJJN3RhR2FBWHR6ZWFPdjNTM1Nid0ZNTkdW?=
 =?utf-8?B?R0JhemZwSW1wU29mQVdUa1JmYjVtbWRzeGkzczZCeTB5ZElldVlsN0hKUVNU?=
 =?utf-8?B?cEVqQWxpazRibmhxTFBXYkFsMWVvT3JOTVFvYjJJYStIbUxQWUo0T1FTNkdP?=
 =?utf-8?B?c0JRMmxxaVdsZzMwYnZqR3VQLzhqMjRJS0o2WnZBdE5xWWFaUG1LSFBaak9D?=
 =?utf-8?B?KzVmSUZhTEpDZyt4a295bGVVUjhFYUJxWHE0cjlTVXZnZmdCRERpSnBRelJ6?=
 =?utf-8?B?QjVlMmtwRkZTank5bzlyL2IxWEs5cnpNQUlHemYxS1BFZlROdXE1WnpvS29j?=
 =?utf-8?B?b2tVa0pDWk5ZR3RyWE1mZGFxMnVRRkxBeDdBL0hYQU9VREJqRDlFcDFTelFm?=
 =?utf-8?B?dVNEdWZpUWdRVElqZnNVak5kcVVJT0dnQ2ZtWW9takY0WHJlRHNCOUZnVkY3?=
 =?utf-8?B?cE5Ra1ZtalRnVm13clloK00weEd4eWhPWG0wbkhaM0xTRmtNUmdxd1M0Skhv?=
 =?utf-8?B?bkNPMzNXUVJCTW1PTU0rNjg1UEFUam14ZHo1SVAzaTE4MGFjZ0xjUzVFTUVV?=
 =?utf-8?B?RkRrb3ppZlZmK2lqd1ZnZG56MStiUTJpQ2I4M3FqQjk0aFdWTVowYURrTFJ2?=
 =?utf-8?B?VDJsUnF3eWtxT2VXa2ovYlo5cE1vU0xzcWwyejlMZXNZM2JmdWtOWElGQm9y?=
 =?utf-8?B?ZUJOM2tUZ3N0TEg2UkFBY05nNTl2SEYzYWNGSERMWi91cldxSytUb1VKdnZW?=
 =?utf-8?B?Rml1LzE0T3pXVS8yV0FiZUthaXdxS0E4aEdOQmJwcEFBOGcrQnJvdkV3Z3Iv?=
 =?utf-8?B?MFphSUFISC9zMGtJWGR4eVgxTFJHOXRyOTJjVktxQkFTcjdQVVlKT055dS9G?=
 =?utf-8?B?WDFyUU53aTJHUTBCTVhSZWpKTUdxNlZ3V3dDYkxhMzlHRGxNbndyZmlSWmFB?=
 =?utf-8?B?eDhtcFc5L0FGZEd6VmdwU2hRVW92TC9KWFFnQmVEVVJWYi9LRHdLQ0RmSkxa?=
 =?utf-8?B?RTRYdWY1RzZYN2w1NXhjeUpkZDdRWVg1bHB6L2E3bG00d3RVU1hTaWNSdi80?=
 =?utf-8?B?d3pSN1lKdzlLSkdab1VJMWlpeWRTaHVSVVdoYW1GcXByeWI0dllzRGQ3MUhC?=
 =?utf-8?B?L2kzNDc2TEwxZkcvZXNaQ3Jka050MVNuenFROFQ2U25LN1RLdkNmRlNDQzFz?=
 =?utf-8?B?TjhDS21yQ2ZPUDRQbkUwc2M0SHkyUjFuL0ttckxYSTBXbUpHNXNyZzVyVERK?=
 =?utf-8?B?K2cwOXZteXZNL3A3NVc0RmlkN3NsYlkvWDdBNHpsWDFIemFwakw1b05ucml3?=
 =?utf-8?B?Z1ZDR3l1Y1d5UHNFaER3d09vMHppczVsZWRLOEM5eVpObEVqUlFsSzBUSE93?=
 =?utf-8?B?eDREdjZVT3FNTnZOdCtuYWNmTkdlQWRmRDdtbm9JV0lIREk2RWF5UjVLaHRB?=
 =?utf-8?B?TnlQLzZGdjVuenlYZHFqOXE0NnFpM1hoQXJUK1h0NUg4WGlzRXZwdHNjd28y?=
 =?utf-8?B?NXZ6bGdXclZNams0QzFubjVwSFlUY2s3T2hjamhTN3pvYTlmbXpHWGNNTGpp?=
 =?utf-8?B?a09KRTNpVlJHQzA4ZWZlZ1NtS2xReGpQazdDRFIxdldKVStsVTBhODE5RTNR?=
 =?utf-8?B?aWtoKytDL1pHeDdsTGFaRWtmNzNmNHNGenhjYzFQb1h5L29FckxwelFWTFV5?=
 =?utf-8?Q?2fkBvjBLbFFByFai+uJsGFBa1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7294759d-2cdb-46a3-4666-08dbf6e58dc6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 05:29:59.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxJa5c+4dr3tPXc+hfPjmIwfwMU2PrWtN3WEcliZx8P0Rr9LEMR5PRqL/GBDbbRJePvBZMDhD2Ap9qoj+2KzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add frequency throttle reasons
 sysfs attributes
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



On 12/7/2023 10:53 AM, Sundaresan, Sujaritha wrote:
> 
> On 12/7/2023 10:44 AM, Riana Tauro wrote:
>> Hi Rodrigo/Suja
>>
>> Small changes
>>
>> On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
>>> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>
>>> Add throttle reasons sysfs attributes under a separate directory.
>>>
>>> /device/tile<n>/gt<n>/freq0/throttle
>>>             |- reason_pl1
>>>             |- reason_pl2
>>>             |- reason_pl4
>>>             |- reason_prochot
>>>             |- reason_ratl
>>>             |- reason_vr_tdc
>>>             |- reason_vr_thermalert
>>>             |- status
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>>   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
>>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 254 ++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>>>   5 files changed, 287 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 3bca43cdbe3d..c4559590b256 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -77,6 +77,7 @@ xe-y += xe_bb.o \
>>>       xe_gt_mcr.o \
>>>       xe_gt_pagefault.o \
>>>       xe_gt_sysfs.o \
>>> +    xe_gt_throttle_sysfs.o \
>>>       xe_gt_tlb_invalidation.o \
>>>       xe_gt_topology.o \
>>>       xe_guc.o \
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index d318ec0efd7d..19d00e4f0a33 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -463,4 +463,16 @@
>>>   #define PVC_GT0_PLATFORM_ENERGY_STATUS        XE_REG(0x28106c)
>>>   #define PVC_GT0_PACKAGE_POWER_SKU        XE_REG(0x281080)
>>>   +#define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
>>> +#define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
>>> +#define   PROCHOT_MASK                REG_BIT(0)
>>> +#define   THERMAL_LIMIT_MASK            REG_BIT(1)
>>> +#define   RATL_MASK                REG_BIT(5)
>>> +#define   VR_THERMALERT_MASK            REG_BIT(6)
>>> +#define   VR_TDC_MASK                REG_BIT(7)
>>> +#define   POWER_LIMIT_4_MASK            REG_BIT(8)
>>> +#define   POWER_LIMIT_1_MASK            REG_BIT(10)
>>> +#define   POWER_LIMIT_2_MASK            REG_BIT(11)
>>> +#define MTL_MEDIA_PERF_LIMIT_REASONS        XE_REG(0x138030)
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> index 769d59441988..39268a9c5b6d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>> @@ -13,6 +13,7 @@
>>>     #include "xe_device_types.h"
>>>   #include "xe_gt_sysfs.h"
>>> +#include "xe_gt_throttle_sysfs.h"
>>>   #include "xe_guc_pc.h"
>>>     /**
>>> @@ -214,4 +215,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>>       if (err)
>>>           drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: 
>>> %d\n",
>>>                kobject_name(gt->freq), err);
>>> +
>>> +    xe_gt_throttle_sysfs_init(gt);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>> new file mode 100644
>>> index 000000000000..1132e827f1c1
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>> @@ -0,0 +1,254 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include <regs/xe_reg_defs.h>
>> Unused header
> Will remove
>>> +#include <regs/xe_gt_regs.h>
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_sysfs.h"
>>> +#include "xe_gt_throttle_sysfs.h"
>>> +#include "xe_mmio.h"
>>> +
>>> +/**
>>> + * DOC: Xe GT Throttle
>>> + *
>>> + * Provides sysfs entries for frequency throttle reasons in GT
>>> + *
>>> + * device/gt#/freq0/throttle/status - Overall status
>>> + * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
>>> + * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
>>> + * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to 
>>> PL4, Iccmax etc.
>>> + * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due 
>>> to thermal
>>> + * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due 
>>> to prochot
>>> + * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to 
>>> RATL
>>> + * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency 
>>> throttle due to VR THERMALERT
>>> + * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due 
>>> to VR TDC
>>> + */
>>> +
> 
> Also need to add a device/tile#/gt# here
yes
> 
>>> +static struct xe_gt *
>>> +dev_to_gt(struct device *dev)
>>> +{
>>> +    return kobj_to_gt(dev->kobj.parent);
>>> +}
>>> +
>>> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
>>> +{
>>> +    u32 reg;
>>> +
>>> +    if (xe_gt_is_media_type(gt))
>>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>> +    else
>>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>> +
>>> +    return reg;
>>> +}
>>> +
>>> +static u32 read_status(struct xe_gt *gt)
>>> +{
>>> +    u32 status = read_perf_limit_reasons(gt) & 
>>> GT0_PERF_LIMIT_REASONS_MASK;
>>> +
>>> +    return status;
>>> +}
>>> +
>>> +static u32 read_reason_pl1(struct xe_gt *gt)
>>> +{
>>> +    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>> +
>>> +    return pl1;
>>> +}
>>> +
>>> +static u32 read_reason_pl2(struct xe_gt *gt)
>>> +{
>>> +    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>> +
>>> +    return pl2;
>>> +}
>>> +
>>> +static u32 read_reason_pl4(struct xe_gt *gt)
>>> +{
>>> +    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>> +
>>> +    return pl4;
>>> +}
>>> +
>>> +static u32 read_reason_thermal(struct xe_gt *gt)
>>> +{
>>> +    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>> +
>>> +    return thermal;
>>> +}
>>> +
>>> +static u32 read_reason_prochot(struct xe_gt *gt)
>>> +{
>>> +    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>> +
>>> +    return prochot;
>>> +}
>>> +
>>> +static u32 read_reason_ratl(struct xe_gt *gt)
>>> +{
>>> +    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>>> +
>>> +    return ratl;
>>> +}
>>> +
>>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>>> +{
>>> +    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>> +
>>> +    return thermalert;
>>> +}
>>> +
>>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>>> +{
>>> +    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>> +
>>> +    return tdc;
>>> +}
>>> +
>>> +static ssize_t status_show(struct device *dev,
>>> +               struct device_attribute *attr,
>>> +               char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool status = !!read_status(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", status);
>>> +}
>>> +static DEVICE_ATTR_RO(status);
>>> +
>>> +static ssize_t reason_pl1_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool pl1 = !!read_reason_pl1(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", pl1);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_pl1);
>>> +
>>> +static ssize_t reason_pl2_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool pl2 = !!read_reason_pl2(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", pl2);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_pl2);
>>> +
>>> +static ssize_t reason_pl4_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool pl4 = !!read_reason_pl4(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", pl4);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_pl4);
>>> +
>>> +static ssize_t reason_thermal_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool thermal = !!read_reason_thermal(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", thermal);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_thermal);
>>> +
>>> +static ssize_t reason_prochot_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool prochot = !!read_reason_prochot(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", prochot);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_prochot);
>>> +
>>> +static ssize_t reason_ratl_show(struct device *dev,
>>> +                struct device_attribute *attr,
>>> +                char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool ratl = !!read_reason_ratl(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", ratl);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_ratl);
>>> +
>>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>>> +                     struct device_attribute *attr,
>>> +                     char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool thermalert = !!read_reason_vr_thermalert(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", thermalert);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>>> +
>>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  char *buff)
>>> +{
>>> +    struct xe_gt *gt = dev_to_gt(dev);
>>> +    bool tdc = !!read_reason_vr_tdc(gt);
>>> +
>>> +    return sysfs_emit(buff, "%u\n", tdc);
>>> +}
>>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>>> +
>>> +static struct attribute *throttle_attrs[] = {
>>> +    &dev_attr_status.attr,
>>> +    &dev_attr_reason_pl1.attr,
>>> +    &dev_attr_reason_pl2.attr,
>>> +    &dev_attr_reason_pl4.attr,
>>> +    &dev_attr_reason_thermal.attr,
>>> +    &dev_attr_reason_prochot.attr,
>>> +    &dev_attr_reason_ratl.attr,
>>> +    &dev_attr_reason_vr_thermalert.attr,
>>> +    &dev_attr_reason_vr_tdc.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group throttle_group_attrs = {
>>> +    .name = "throttle",
>>> +    .attrs = throttle_attrs,
>>> +};
>>> +
>>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>>> +{
>>> +    struct xe_gt *gt = arg;
>>> +
>>> +    sysfs_remove_group(gt->freq, &throttle_group_attrs);
>>> +}
>>> +
also, add a doc to this function
>>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    int err;
>>> +
>>> +    err = sysfs_create_group(gt->freq, &throttle_group_attrs);
>>> +    if (err) {
>>> +        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>>> %d\n", err);
>>> +        return;
>>> +    }
>>> +
>>> +    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>>> gt);
>>  @action is directly called for any cleanup work necessary on failures 
>> of drmm_add_action_or_reset. So sysfs_remove_group is not necessary
>>> +    if (err) {
>>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>>> err: %d\n",
>>> +             __func__, err);
>>> +        sysfs_remove_group(gt->freq, &throttle_group_attrs);
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>> new file mode 100644
>>> index 000000000000..d26d0072f907
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>>> +#define _XE_GT_THROTTLE_SYSFS_H_
>>> +
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "xe_device.h"
>> The above headers are not used
>>
>>
>>> +#include "xe_gt.h"
>> Forward declararion of xe_gt can be used.
>>
>> Thanks
>> Riana
> 
> Will fix both.
> 
> Thanks
> 
>>> +
>>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>>> +
>>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>>> +
