Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8B9EE49A3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 06:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1C010E2DD;
	Tue, 22 Aug 2023 06:15:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A83110E2DD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 06:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692684949; x=1724220949;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vSLrQBwRbMCSK1Ekns9pHm3LS2r+AZqs+spOIDv3C4Y=;
 b=FJADWaLYB/5H59ROmLHRJHQtHDo80HAHT5DgLvTWXg2KvG9t2eU4zhZz
 YX2rCR9jyg7Lk+UFeqzGCdSSmUWtstR6X1q2RGoCgVKoSO/Bpjts0H4WY
 tVwSn8zhOu6NYLNoyZgdYzUzna/uX2HHC/nz9msI9rdTxLg6YqKKcca8t
 dbzJ4Rjp4MM4oH8eKPKe6gZdVJvTNiMmk2GkdOwjaI/PWDaKI2ng17A+0
 EX6gOPkcMFAEIdkJZorVEgaJZAJr4g0sonwZNu2X7Nq54sAb0hnNiKs3f
 TnbucC1lpryb4syM3luC4FMxsDFP1tWHbirFSACKqrNd8kdzOQSa9gDD2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376523411"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="376523411"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 23:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771236222"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="771236222"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 23:15:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:15:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 23:15:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 23:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyZCs9pfmqBVWku/RcfIpl9aXkmHQo9qaXFaPS9JZ08eCn7rDQgbyY0eP44VA0Q/oZYU1Sj6t0EaY/19ubeaclQmMFRlpGrmu9UiqAfW4owWROzHyfexw08XhUaSEYXSoRGV+gqkIoV7wxfinLwDB3eeUKkdml/g+pX2YD0rf8RkREtgO3u8wAsrW720DwY1UwFWrT9XnX4CSiuc6YcK25tpThddsmgciC/ZMONz6KQiAwd4iF7By+N0W4TLVq03wfAFsq7CgcyqJIrzepyxmjGCQHVncxFkGMfJLX99PLjfiBkU6lij5N7ylMB0VRlmVOHttPbXGu31gecvDCCmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqCDYMuVy1pkQzjmfFL/Jh4nOVCWYEjViB97UkgOnxU=;
 b=YKZvGL08aBHxuEh2wTz5kOYIs3gvsLEIRiLNZP6qjzUtR1O4kfHwP3MaOvf/1swh7E91YZmFC9xDRkASrRBqLvitoNmFms1uTF/r4BbEEeDak4txc8VGPdKhzyhQd5kRc8OS1S/iYoEb4OvNqFWcGlLCsQw7UE+lyCuTMKEv9IKN1j6fFOTcXdB9ffetcmVvgvYtbFoDE2+guerCpLpWnR+J3uKC8hkoPWRg1pKdBKeLK23j9+2wm03D6GLtZpe4iTCnMbrnSzU1mQpDybFPjxNFbdd53eqOOFdpIJNziDolSjXaISNUaS1XfiHUVNPqSSPQL2m5uOVAK7dkEy3alQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 06:15:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::6b9:384:8202:b294%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 06:15:45 +0000
Message-ID: <0f97a804-7799-37ca-8b44-9ca27130e566@intel.com>
Date: Tue, 22 Aug 2023 11:45:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
 <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH0PR11MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d897aa8-fb7f-47db-588f-08dba2d7381b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ev8qHHmJikwKPoAszivyPYb2vaOGfXhy/Esd0x9xqgwztgDOQfURLRnwaUKwyEyaNadURLeTnbwElQbk2HzheibIuDATGgLf3bs+Hg8/OvVU32C61ZBZzUKPjIZclnNtKNaJbxnOzUkLwtLqfzKlETdAORInMB58XUoNPQQaZeNSZn81xS9PWRw64lrXC46/FtXt6grCzu9ZEwrLXRUaJlvBj2Nl+7lE9onWm7L0lWPqfB/fJeCykydvJS8SVxsXTpzoVcfWJitHdBMRw9wvKqJKgkuctyrAA7qm/T97QdNYdCc1RUsuHCxnmNl8e4rKcqzUKZoVC6d5ZnlQg0D8Nqp6hsZmXP5ivd9agM1LfwXHe7r9oU0cJQWld9fZWVVnwmGDQZsXFZR7jpT9ZxiZLzKQWSpuAhhSSbZ5gHRWCTqjXpkwa6pNT8ctZ+vuUZSLXHpJY6IFgNKvjFNGaUa2jAUiEre2Aa0aCJu0twl2n7SH7sf5ERFnetUfZNLlkEs0HrnR1Wnn3jaSHlU7bwjYhLoHw9wcuvcfQVKN3iGo2O6dSDS7rWLun5whDR4XzMn+0sH95YawlqpLTLIWOoOVX0R4dYzJz2hKF5/m8eEwD2asdFVyyqDIIq1F9nBocu8Jddk+IoU35deB4PHsPYVVc1eVj5euPcQ0B/ZxxJqPcec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(66556008)(66476007)(6512007)(316002)(82960400001)(2616005)(8676002)(8936002)(41300700001)(36756003)(478600001)(66946007)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(30864003)(2906002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkN6aXdjRmVHM3BDNUtScmdFWmdaOGpFZnp4N3VmakZkUW05NjJCWURDTExK?=
 =?utf-8?B?ZVAvY2ZJZ0dCVlQzcytWL1FnRHJiaXgvMXZlYVBsWjFqNnFTMEZPcEVvNFRk?=
 =?utf-8?B?U1ptSEU1aGNrdjcxUDFha0FoVVFXUzc1NDNNT3RsMTVEaGY2dkc0cWFwblR0?=
 =?utf-8?B?WHdscFRva0tyTkJjV052SzVIdG10ejM2WjJpRWNSOWt5a2NQSFNmc0FrYU5P?=
 =?utf-8?B?N1YzR21MT0dwYy9oeUVMOHhBcFZEOWdRNUtvUFNJRm5mbkFlemIyS3ZkQXll?=
 =?utf-8?B?KzN2NGxTYjVITEhNeHdSUnBaek5YZDJxMFdtQzU2dUg0dzV5RVRjQkUyRXEx?=
 =?utf-8?B?OGt4OFFZSExQVTdMaFpOYUgvcGJaSWVTVHBnaHNRTm9zQ21PZFI3STh6SEtT?=
 =?utf-8?B?bUxvOGZHUVRCZWkzK3RlZTdacjA0R2ZDNUNqSTJtY3NlS2VmbGp0bnNqZjRs?=
 =?utf-8?B?R1B2RFgvMFZCZjFid3hobm8xemk2MmlyOVlYTzRNSHFYS3RlUndTUUtCeGtN?=
 =?utf-8?B?R09qYlJRdDJ5dlZMSVhra0VLeTRYWWF0ZGtXRjhvUUhDeXk4anhDY1dPYmox?=
 =?utf-8?B?UmRWSVV1YlVWck1yTTFITDV5bE1RSDNsTWdSR295ZG9mMHIyS09EbFBoQno1?=
 =?utf-8?B?V2RNblBkaURmbGlZZFQ3VkoxQktYUCtiaWU1TDJEM0pHL1kvcEFlcnJ1cTdh?=
 =?utf-8?B?cGR1NkRabzJpcnc1c1hFTUR6dHdVYmZVdm5iY0tTMllrM3hCNDNTTkhBRjdL?=
 =?utf-8?B?S202WVdhTWU4K3FQNVoyYnYzZ3VWV0toRE5xQ1c5QTA2dUtrN2VVZldyMThY?=
 =?utf-8?B?RzU4MW8rUkh6Q1BVV1IwUVEwcFZKTkdadEhkeFc0WWFpc1VjVThaU28wa2Ex?=
 =?utf-8?B?b1p5OW5RTithaGdidytFUjVmeXJrM1RqektJYmlRUk5BaU9FMFdRTDhmSTlw?=
 =?utf-8?B?Z3h2Z3c0c3Y1bUZ4YUlmcko3dXlEVnNJMEZGc21MRDJ3OWtIOXkvRVErZTBz?=
 =?utf-8?B?MU9ySW9GK3lCK3g2VE9TSEF6WlcrUjRnYjVWODg1VmdLWVlqZ3lRcERaczVK?=
 =?utf-8?B?WS90L3hLSkY1VWpGcVdYT2R3WFhvdHJoN25VbThjV0I0R2FiZkFubTdQT08v?=
 =?utf-8?B?YlJDZ1F6bTdIYXpjV1hNOWs4TDl5YjllZFdyMVZSRGF3MkEyektOMnhYUllC?=
 =?utf-8?B?T1JiMWZ1b3Z6ZENHdEEzTDNFY1FFZWJCcW13RThEQzZKZ0Q3ZktBS1NmdlMz?=
 =?utf-8?B?ZzUxV1hDOGZuME9RK05aa3NwWE4xS0dySWRzcnZZTnk5UDk2d25pOFM1NzlF?=
 =?utf-8?B?WkVrMU5xTzhMKzQ2UllQVStrMzhiOG1EQVBNMXl5TFk2YXFkdGUxc0QxTHhj?=
 =?utf-8?B?SU5FMTEvdHBDMERmTjZRTFhtZEpKKzl4dytMZDN5aFpnb2NENVd4WndQbE94?=
 =?utf-8?B?QTd2UEZpY0w4ejM1UGdKWG1jSXdWTVN2QzJrY2NpRGNObVF2Qk5jalJLb0oy?=
 =?utf-8?B?K2pOVGFNcnFqSGVhZ0V4emxKNi9McTMydzNOOHc5VFlzS3M0RkRyUjEwdFlD?=
 =?utf-8?B?Rk9jWnR6YnVxbUVibEFvQXFsUXhqQ2pOdlpXYkFxOG5USFZGRWNTMUFCOXh1?=
 =?utf-8?B?NjJZOWJGaGZubjhWSTYrMjlGL1F0a3g4bXZCa1dGaGJQaE95UThVcHRmNm55?=
 =?utf-8?B?Zk5YOFVod011TG9HYXBicnFhOGFIZFh5UTBOK0xCYWIwNE1xelE4UE1HRm5V?=
 =?utf-8?B?bWd2MDMrd2N4WVBGcmYyWnhuYmlWTTFnWmNnbXNVNXQzTlpzWVI4Z3JMR2M2?=
 =?utf-8?B?VnZ1VXJ1YlA2L2VjekVzT3VabXJMeEEzOE1QQytDaUszWDJkOUloa2wya1I1?=
 =?utf-8?B?VCtVVUpkclpQSW5TTHhvUllvYjVUVFlyMXVZbUkvRHI0bHFBZ2xqSHlmTU8x?=
 =?utf-8?B?ZzhJTVVmbThFWDY1aU9xOHM0eU41TjQ3RWNvVW5rbE5wTllkbThhbDV3Si80?=
 =?utf-8?B?amdXa3RUdkduZkVSamkzQXBQbDNSem1GV1VNVlNFUFdrSW4xMG5vSDljUnZm?=
 =?utf-8?B?c3Uvclh5ZGZXdDgxOGNjQ1lGVEJiZmdPZjZ3b05KN3h1T1FJZnZwZ05FUmF5?=
 =?utf-8?Q?3eeQb2bxRWfv3XFtY/kY9wfBx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d897aa8-fb7f-47db-588f-08dba2d7381b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:15:44.9603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqtdKaQa0CAjq7mSUU6iRdbRD8eGbLS6G7lG6+0hTBGrUNmLSyNj02g6juDtPOhLPlbnkhXZesi9PRj61uZzpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja

On 8/22/2023 10:28 AM, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/<dev/gt
>               ├── gt0
>               │   └── throttle
>               │       ├── <throttle_reasons>
>               │
>               │
>               ├── gtN
>               │   └── throttle
>               │       ├── <throttle_reasons>
add tile<n>/gt<n>
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>   .../drm/xe/regs/xe_gt_throttle_sysfs_types.h  |  36 +++
>   drivers/gpu/drm/xe/xe_gt.c                    |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 282 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  35 +++
>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>   8 files changed, 391 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 550cdfed729e..eb3ccd90b2fa 100644
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
> index baa00557f114..8416d483e7c3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -400,4 +400,17 @@
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
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
This file shouldn't be under regs. Please move it out
> new file mode 100644
> index 000000000000..b71865f467ce
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,36 @@
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
> +/**
> + * struct xe_gt_throttle - A struct that contains frequency throttle reasons in gt
> + */
> +struct xe_gt_throttle {
> +	/** @status: status */
> +	bool status;
> +	/** @reason_pl1: */
> +	bool reason_pl1;
> +	/** @reason_pl2: */
> +	bool reason_pl2;
> +	/** @reason_pl4: */
> +	bool reason_pl4;
> +	/** @reason_thermal: */
> +	bool reason_thermal;
> +	/** @reason_prochot */
> +	bool reason_prochot;
> +	/** @reason_ratl */
> +	bool reason_ratl;
> +	/** @reason_vr_thermalert */
> +	bool reason_vr_thermalert;
> +	/** @reason_vr_tdc */
> +	bool reason_vr_tdc;
> +};
The structure variables are not used in the below code.
Is the structure needed?
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 13320af4ddd3..03be2c2980d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -24,6 +24,7 @@
>   #include "xe_gt_pagefault.h"
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_gt_topology.h"
>   #include "xe_guc_exec_queue_types.h"
> @@ -442,6 +443,8 @@ int xe_gt_init(struct xe_gt *gt)
>   
>   	xe_gt_sysfs_init(gt);
>   
> +	xe_gt_throttle_sysfs_init(&gt->throttle);
> +
>   	err = gt_fw_domain_init(gt);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..7db67b5fc138
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,282 @@
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
> +#include "xe_guc_pc.h"
guc_pc is not used here . Remove header
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
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
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
> +#include <drm/drm_managed.h> > +
> +#include "xe_device.h"
> +#include "xe_gt.h"
Above headers not used.
> +#include "xe_gt_throttle_sysfs_types.h"
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
There are two files with this structure definition. please remove one
> new file mode 100644
> index 000000000000..acc23ce8d0fc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,35 @@
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
> +struct xe_gt;
Not being used.

Thanks
Riana
> +
> +struct xe_gt_throttle {
> +	/** @status: overall throttling status */
> +	bool status;
> +	/** @pl1: throttling reason is PL1 */
> +	bool pl1;
> +	/** @pl2: throttling reason is PL2 */
> +	bool pl2;
> +	/** @pl4: throttling reason is PL4 */
> +	bool pl4;
> +	/** @thermal: throttling reason is thermal */
> +	bool thermal;
> +	/** @prochot: throttling reason is PROCHOT */
> +	bool prochot;
> +	/** @ratl: throttling reason is running average thermal limit */
> +	bool ratl;
> +	/** @thermalert: throttling reason is vr thermalert */
> +	bool thermalert;
> +	/** @tdc: throttling reason is vr tdc */
> +	bool tdc;
> +};
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf..c55815d1114a 100644
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
> @@ -298,6 +299,9 @@ struct xe_gt {
>   	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>   	struct kobject *sysfs;
>   
> +	/** @throttle: frequency throttling reasons in GT */
> +	struct xe_gt_throttle throttle;
> +
>   	/** @mocs: info */
>   	struct {
>   		/** @uc_index: UC index */
