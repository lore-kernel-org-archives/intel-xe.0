Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD996CE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 04:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E610E055;
	Wed, 20 Sep 2023 04:46:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F0D10E055
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 04:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695185193; x=1726721193;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vG4VfTlJvcXrpKdBUtF4PZUXESs0UoTZBIwutuLbA6M=;
 b=Slsfe6RHT4qfLIqYnCXW38m+BlYUhVd88GhyO1CMvbJ5xrTQWJIUFaIw
 x7z7N0S2o5YLwqew+tft5YKd1s2gR9HHOIacKfiVVpwrO7IyO/QdzOgvi
 gbbhPIFjFVLXzbThKqAdC0Sx0aV2mHvh8QDTT97DscEruyqRww1gbV5pt
 sZp5Z3185tkFrF3/ApQCMfIUtM8/8618nLUKuR7cnuSLDlWnOhvHiuk5d
 VTWl0gClwChBZE18O2lJBrT36J/fCuIBmnpx4i2S8m4EB+AZCJ+opAQxz
 vW5QjZZpmfMsdtyTS01+BfpZ4y0+nL0iWg9Um2zGCJePz//KK8ULpWLwX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380022374"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="380022374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 21:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="723111126"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="723111126"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 21:46:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 21:46:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 21:46:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 21:46:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 21:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Duae0U3zXzMQutnQvM3a6ATRg6RaqquYVUX53LU179OQxBHSoF7Go3DuhWVmuSUr4wqaJ6dFS+1Az241Pqor9ZCm6JqYL0LPh89OE1tLQAP43D0R7kKzUDz8icyhDpBCbvmrg7U/uNZnXCZrKdofxlfIbkN4Df0tRgKqa7LttNfXGEqV47/QT511eFzOv0XudRBYjA0OuirRE1hPHivF9jiEKavPZR1CofJJZdWjstSBuiiXXSoqgyXbIwL4CfWq8CbBy+3CrxcUWkDf2t3ftC4C41NsWw/necxLl5/wkmlF7hJE9tlMFpTlfr03UCKX5ObXqYkMnu7JbQEfQvykuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty/PPCMaw4IxjVMEOam3ZgdpV1UjMKWaUkUoqA6Yc7I=;
 b=Q3H3gBCvO0ctdH/lCbH4qN42lNDbSvKyouq7XiSuNHzgq5qgX9PE2YxguFIFi9u+3KWIFHRlm02yML1tj/ce/iWY1KPhZisUCeH5n+S126RL39Oahf61+8Kdk5FMXmk+Q9BqN9FwasVv9zWUH8M++KOylg46xjyKZLvvp7jYcPvIP5zVnA6xlSjMUPtc+u9bERbk2ActlEWV1YXUW9h6K6NgewJlIroFCfUuFtH98OG9xiSOz5a3BxlZMVENXaK/n6MoUKR8s8IfUC3ogp+IhmZxSojps29AM3icOJBI23PMl5E22icGG+pu6uEqGjTMoYIAyYSkad9mkWCHLZVa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Wed, 20 Sep
 2023 04:46:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 04:46:21 +0000
Message-ID: <d48b8558-5e81-8f9d-0425-2064541b85c9@intel.com>
Date: Wed, 20 Sep 2023 10:16:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
 <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: ced51004-77ab-4d73-3a40-08dbb99488ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZzRssZ6wCAfxGqwCi2iKG6FmtX6k9Qr7dM1R5d14wFjY+J7vx2ouVMg+h/SjhIt0WSSZKhf1kVupsUA00dEpp02/E9qlqzZmffj8Ctrl0/5TUB5JXe+ELMuu7tXrETDTgwlx1lWz9CCJM5Tt8/r+e+6MjSe18UVmswNo4pJX0YHwmKmP6WLXw8TAGe/ZlGE0CyFKPpNYHP4B5nJwelfOuAqtYncvzlhYmeGVS1L6Wq76FOlaczdXT0bswcnYM4oHrWouW0T6ANK+j22a/3ZwdKhJDjHIPWZL8WXHFbV69PxerK+qJfIgG70qymUWOqOAbfKfIydnJrVNrrRBD0+Hb993/hboYpQMRUFbTqgx7YzdJugbsdNIximEMMyIxBHoE2NS0f/VZ3tHaRq57xJIGokinTtd81ArIPpzWG8fFREXNVtX1X02Pnv6YK3kqxR0hxZyzgd0mRZQA1O3GesilvhD6filN75N+cfSUP1Bz/aFY6vVxI11k28/nh3ZjjfTx1lNs5k3JjfEieFTgSVAjKlpD28hxi4ANtCHOUEsavaovNxZ8fw75nHb7c0M7EpuV1NFOQJL0ACtxzN1K6Vg9DBmBwj/EwhIJ7tQHWtee7+ut1xowL9ax1bsAsqPsqHr97/U4nBnvtcex35H1Y7IbAFI/tTSdTw77H6WSaYsak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(186009)(1800799009)(451199024)(31696002)(44832011)(30864003)(83380400001)(31686004)(6666004)(82960400001)(86362001)(2906002)(8676002)(8936002)(5660300002)(6506007)(6486002)(26005)(66556008)(66476007)(66946007)(6512007)(478600001)(53546011)(38100700002)(2616005)(316002)(36756003)(41300700001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1d0aUNPUEZVSDNVdU9xUzNQMGtEbkVlMTJ4UXlQdjVITkJUQ3pjTkc5SzFv?=
 =?utf-8?B?dDZxb0dMajBZZVhzTUpwT0hNNUoyOVlhMys1SWNoYTJUUEJJSWZVQUNIMjNs?=
 =?utf-8?B?YnNLbFU3VDNsaUh1UXAyZ3FkRnVySytjOVlHanNJU2dnVTBxOGF2dkJKQ1Jj?=
 =?utf-8?B?bkwyZ3ZVM1ZBRGg4ZDUyRm9GV2VHd2pOVHRQY0luNHUrZVdVaDZoZUY5Wita?=
 =?utf-8?B?L0JjVlNPbVpYQWZJelVSb1ViblBKMkN6aWpQdWJIQU5QQ2RLYkxsK01rZlcw?=
 =?utf-8?B?WFZPeGRabk50YVkxa0txRityNHNmSmNlTGZ3QjVNbVpHVUZpVkJXSDJmNTJ6?=
 =?utf-8?B?aDhEVmxQQnRkVjR6Z3I2VXpvS01jSGNKazJUNXBmL1hlMlBtcmdWb0YzQUV0?=
 =?utf-8?B?c0xnZUZhdWM5MTVtMGhWUnNsd3lnVTduVXVCVi9qZjk5VUdFUlZpR1kzWUo4?=
 =?utf-8?B?VGphWTIzOW5WMDFSWE5wRnMvdXhNOFJtaGlNa3FpQnJFaVFJbEtzQmhnOTJL?=
 =?utf-8?B?SGNHZExFbk9VcDZ0OCtNcjBjYkthWXpkek1yK3M1MkdsMEczeXIzalNTZzNr?=
 =?utf-8?B?cXJKN2F3VExPR3JxVVE5TVRINDAzVXMyUVZiN2sxV3lFN0pBZ25SQmtlSUpz?=
 =?utf-8?B?cXZ0TVArQUN3cGVVNFVqcDlxV21pcnlQbFdRVzJReDM2SlhUb1dScWVBZHE0?=
 =?utf-8?B?UUpuejNseU5qSm9SOHpJS2FwVk13Q0tNNW1yUk1sZDhjSktCUGVkUDhNZzk5?=
 =?utf-8?B?R3hnc3Q1bzlhUGVNNmswdjd3T0Irc0pMbXRVU3VrTUdyVnkzUks1OUZ2QWYw?=
 =?utf-8?B?ZFdDUmljZnJpR1gzTmZUcFlndWo2SW1KdjZadmFQejhIbzJQUXpvdVhCaWYr?=
 =?utf-8?B?MDU5VGdIUzNFRzAvNVRyUWUwN1k4alhwaUVZRDg2Szl3eldSSXFiTHQ0UTdW?=
 =?utf-8?B?b0ZVOEpjdHkwZXpuNVhOeU5XdlVBWG14bHhONzllWVEvMnd4OTF6b00vNEFG?=
 =?utf-8?B?aC9jQ0g2OEx6K2JVVE5kcUMrY3JRU0piY2RMYTE0SndaZ2pPQk5nMEFMQzJz?=
 =?utf-8?B?S2cyblFZREVlb2NEajFUNGQ0NWRHK3I4K3NCbkFjVzJad1ByZ0V1TU9HL0lZ?=
 =?utf-8?B?QWRuYmNCQ3lFVzdlN0NKY3dIUCsvYS9IVWUxcGh2elg0d3haUWErUzNOeDI4?=
 =?utf-8?B?NFY1OXBqZ20wNVliTXp1cFE0YjBMT1FUUlA0Z1FrK21TQjFZZzZlMmQzWHBB?=
 =?utf-8?B?a0xLUVFaTkhJSFN1S3RkWlo1bGpLNkl3dzFCbUpvM0lZekQxVTVKUG1XS3B3?=
 =?utf-8?B?OEdTRlRDS0pFRGhpUzUyU3YyRHM0VDlRTDc1aE5Obm5ISG82cWZtd2I5TXBR?=
 =?utf-8?B?bFl6VVNaekRDZWZCNGtYalZnSk5KbGdyNFZhSmp1d1EvemZMaUFDanAvczFH?=
 =?utf-8?B?N1M1WjBIU1pHSlBGMVFVUFNWdURVODNKeTlMSTVmTWdNU04rc3JvUFVhU1kv?=
 =?utf-8?B?RUJ6ZjZ5bFRUYmN3Y2JZa3FpR2psbjdQT1M0V1lMZUNZYnJKRmdkT0FoU1NK?=
 =?utf-8?B?OUhpeEVOSjArdDI4b1ZkWUVKZHluUjVuS1l0M0gwbHRETGoyeUhYbDJqdVFo?=
 =?utf-8?B?aGdxaFdUZXRlMWxWWmovdHRHR0l0VlRodW9BYVhPcHZzZGN4UC9EY3pJd0Vn?=
 =?utf-8?B?MUI0ODVQNEFnZ1RJUllTYjBlaVNHOEgzYmtkUlZjQ1Z3UEo3U0ZlY3cxT3BD?=
 =?utf-8?B?bWhFampvNmRUbm1aSThEMXVPU3oySDlabHNLVWZuR0ZWeGlrSS9xRjhzYW1T?=
 =?utf-8?B?MmpVY3NITDBRYnJRMjR0eTRRODNMYjVLQ04zeFlOcHV0TG1ZK2hoclMrYWJt?=
 =?utf-8?B?UW1ra1pFZUVXK0Y3a09sUVMzNE9xaHgyWldqMkc1eTNOQnN0aitXbjI5NEU4?=
 =?utf-8?B?Unp4TDdYNStNRGhvVzFvaTNjM0N5VC9McjNKTFRCcU1nQW5ucWFkeHNHUGl6?=
 =?utf-8?B?UWxVK3JOanBxM3l4VENqeWdnYTVsZzgrSkh4OXFFNFh0RkNQWlREVGt1VUR0?=
 =?utf-8?B?aTZuVlhkZ3pWdFg1MTdzVG5qTnRjbTk4NTlEUlI5d2w4b2tud3VQQlNyYXVC?=
 =?utf-8?Q?4qkeRmFnReUvMZUApEe0KH7xN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ced51004-77ab-4d73-3a40-08dbb99488ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 04:46:21.0345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkmEVhrjvy17NXUe+PwSR3ySox+0MBOl3nYTHnQoxVeJ8hkVwJNPBIHW3vQ+wWV8fVYewR+HErrcfJuIcB09Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add throttle reason sysfs
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



On 9/19/2023 4:35 PM, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/tile<n>/gt<n>
>                 ├── gt0
>                 │   └── throttle
>                 │       ├── <throttle_reasons>
>                 │
>                 │
>                 ├── gtN
>                 │   └── throttle
>                 │       ├── <throttle_reasons>
> 
> v2: Fix review comments (Riana)
>      Move init call (Matt)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>   drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>   7 files changed, 334 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cc95a46b5e4d..7e1c4be0ab7f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>   	xe_gt_tlb_invalidation.o \
>   	xe_gt_topology.o \
>   	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929..f9ba57c3bc4b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -410,4 +410,17 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
Not used in below code
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..d4839ade7240 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -11,6 +11,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs.h"
>   
>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>   {
> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>   
>   	gt->sysfs = &kg->base;
>   
> +	xe_gt_throttle_sysfs_init(&gt->throttle);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>   	if (err) {
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..0dc9c7cada5a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	return &kobj_to_gt(kobj->parent)->throttle;
> +}
> +
> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
> +{
> +	return container_of(throttle, struct xe_gt, throttle);
> +}
> +
> +u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
Add a new line after all declarations
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +u32 xe_read_status(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
Since you are using only xe_gt and nothing of the struct xe_gt_throttle 
is used. Can be converted to gt directly
> +	bool status = !!xe_read_status(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle); > +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> +
> +
Extra blank line
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..809213c3bba1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
The above headers are not required
> +#include "xe_gt_throttle_sysfs_types.h"
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> new file mode 100644
> index 000000000000..5ee0d45d0a9f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt_throttle {
> +};
> +
Why an empty struct?

Thanks
Riana Tauro
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..7829bbeeb5d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_force_wake_types.h"
>   #include "xe_gt_idle_sysfs_types.h"
> +#include "xe_gt_throttle_sysfs_types.h"
>   #include "xe_hw_engine_types.h"
>   #include "xe_hw_fence_types.h"
>   #include "xe_reg_sr_types.h"
> @@ -299,6 +300,9 @@ struct xe_gt {
>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>   	struct kobject *sysfs;
>   
> +	/** @throttle: frequency throttling reasons in GT */
> +	struct xe_gt_throttle throttle;
> +
>   	/** @mocs: info */
>   	struct {
>   		/** @uc_index: UC index */
