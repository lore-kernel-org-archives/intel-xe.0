Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089FBCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 03:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF8C10E027;
	Tue, 13 Oct 2026 03:18:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3C010E027
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 03:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791861484; x=1823397484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ziOutUVDXTMbZg9yE9GsQmzDaWN1ko5VJkpWZGFoVUo=;
 b=VtV1/CdZ3XkA8kAyOCi7GNKlzB2kiIe7nqF9MmbuVYKN6XVg3+RSWJnn
 tRxicI0qnNc3ToMhyu3NlZ5Rh8V3HCYgL1PisXovQEBR3unU+CzawSjnc
 b39lMZQ4q6gVSUhzT5AicpjTULnlFCNAWqQv91mjpXqgTubXluaNIGV28
 8G8K2JObRcYF7qMcRE5i484hT7ljdBcVIPoBn4p7Jl2vRNXwzVszniQnW
 0sVj/pd25Didjo7cHhlK6Q4432ee1ghdUcB5aelTvtsS2vArApMl7kLAl
 MPLXyzASy7NW0GUlIdMwYkNlrc+TLT7bZCDnFO6MjQ9qTm7dmEvxOlXus A==;
X-CSE-ConnectionGUID: gSpfIo8jRtmAKZ76DALiuw==
X-CSE-MsgGUID: soewoRvSR6uKgHZ/ZXB8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="467783"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="467783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 20:18:04 -0700
X-CSE-ConnectionGUID: l1u9b9yTSWSapLXdsbsO1g==
X-CSE-MsgGUID: gVoE1IqrTIaT4bgtufekGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1168875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 20:18:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:18:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 20:18:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 20:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFu6ziYKrsnZmZiNLeZdwVmbK4PA2npkMtXocszrn4fQkuMPng6XHRcQqcV3d37H9bbE8G0cgs3DF/5F9Xe2Nu8QRspaHbNCql4cWgJoJ7lpKAppFjQF9nPzo6ObNBoNQQOI1peiY4Qrm8Hv9YTDucXuihKaXyI76/hgIn4Me+i7aXZuklecGEYN5C7RXlRknZVjfTEr1ixVobVS3VYL7/4jZDx8gl4XR68bqOep7YvlEgziPblcGcSwbHgdPRYm9fGFsWBerQnUM6g1lOPspbaZ9oWzUCEV1FQ2mveUcPo/9/FPmrHHX5mCRE/630e/2wwxwDqqb2Zir7bYKtW46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJibPrHZig7oRZ2OEnYyvDenxTd/CoE6Bu95ABVJJ3Q=;
 b=T3xHNn424v6QvdG4b0W+mcKFFhJGhGTWYwwZZXD1xAZxUiE1hg/eW9/+RtSCYshpRXVKVUQDlB3kQQtKYymix357U7+OeT50AnAqRZkbSFX1SPUh6HWmRhd+9hfTdkn86S6F6a8IaOx1NfuhYAnFUo7pjS9oeWmShBKM5wq5QnrjFEVLJHKSV7ANlHlUvKfK4EpFlCesyw11cRy0OXtxKxL76LqIr3qlYX1rt4/uUbNplx1dUnRSaafnOwpnWXrZD+9/MCQOZQSI56pOSyWtfGyQ8U0x057BSVsoEHpWQFY8TuS2NQxTjn3uam79HfenSyt4huTj5NfzXxBQ0c8CCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS4PR11MB088494.namprd11.prod.outlook.com (2603:10b6:8:509::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 03:17:49 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 03:17:49 +0000
Date: Mon, 12 Oct 2026 20:17:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intnel.com>,
 <jia.yao@intel.com>, <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
Message-ID: <as2i2xPkEvDgAKFo@gsse-cloud1.jf.intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-4-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013023442.206915-4-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS4PR11MB088494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8304da46-b240-4459-11c7-08df28d88f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: qmQ8XYdLZ7Lq1/AUzz9Mu1ts9PZactiWOHcPklfm55eqm/ayEbpnVYfORXe4asFm2pubLokKOBdw4Csou0bnAXXCXnZlXPhLScJoT1b4v83nHnEbTJoY7SB1uR7EMmP9smfQLcJdnjhhv0Tmhs7LidFKdteM6e3Rop9z/bZqJ5LOT9hU4CgZzQYrvLznqhJvFFtqVATTRuULdJDGppPGi1L8O3+2fO/eEWe5eSllNTLGsAXq4f+kZ2qjYHru5NWZFVO6MdsBvA8ZBys6qrhfVt6KUbYYbzo75rf4L9xhQmi5RM/ZPNvYnukCjcmEqWaHpWEX6YHKRfmJqTnFu6et7W9MstKjhiEO/zc7vxOisfozx7KI4dVhggFBAUyScIWkzhXXqi0MK5W2qaItTXJXNLITq8EKa5bzKgrWeKEJ+Bwhwl2vLcNIypxjsD9U+ZBjrEzDx0mwcHZpAO2JDcVO1UTcB/EQMEVLJ9x0xL7DruiP/BIIf+jWcm71nyW0hm5hH6ABmjhcw5rpOih7Z8kQjf58qDN9mAn+ukHdJQVACoCYALKsg/ynt7bJDa38wZdYGFgm712djhPZSWLloBY8vHTdrdttDAj8eYbLQHieeHlmv0L28/hbDPiO8ZIFUrc/s62C9eY9KK+4puPIXcGSadiq5A5Anr5xsEWqHPt1Nic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9n7e7Sb4JE6g2KIBDfeRggnr4czHYWwXUVeyeiciXRpKYPiYeLHyiWYHJB9Z?=
 =?us-ascii?Q?U1gFdFfmoZquy2Z3eQ4yE2rH37V0QzHyuJj7L0TNMi1s+B/bXEaBGb5lk5fN?=
 =?us-ascii?Q?pVUK98I70u6lEQQ7oq66Kgfwjwn1L9M3r5iytEeq1CpSzCLXog6VkR4wk2D5?=
 =?us-ascii?Q?LeqB3Ns+23HTnoreaDABHGFacgcWgh/5phBxtGgaekCVKqWyUPMou7sYeidx?=
 =?us-ascii?Q?0WcxtwG97EU+HwL6a4wSlWyiHZLmXRQTZJB3nacBvysya2jOlqBj5nmtX6ay?=
 =?us-ascii?Q?vwHbK+a2KOfbvK7X21Y83X3ufpVYC8QoEKPVoEm5jDQzKChWTanaXzAQbgQg?=
 =?us-ascii?Q?PeKvmVPzjdNYBGJcCdFADfVx2jtaAKsykBtZT2yyqwLKUHgMYoW1N1Zl0a6h?=
 =?us-ascii?Q?EsRNtOvJbtTK7Tgbewv/uZZ+oK0Gc+kWhvHnjKgqnu5qT9gBIGHIfeTKPSDN?=
 =?us-ascii?Q?+z25g2p+4cn03qYYN23gVxYnb6vtPBsWY6HjBEiGeZ3brxVEpgVXTrq0bJh+?=
 =?us-ascii?Q?npNCKpI6M56nF738iUnHP21bNBchDXTu45vpyYLH9U3mSa/NXrSBgGRl1b2+?=
 =?us-ascii?Q?65juekXN2bqOuB4zBxB9D9MolPEYWz+ueObHryXR8WPjAivr0STa+dWJWBbG?=
 =?us-ascii?Q?mqI/QNX06anM6ts5QG8Xq+DXvXyvo8AAyUj3X23yZ3xd9iYdtLZbTJjjE2r3?=
 =?us-ascii?Q?jh7Sxi4PpjEcmLxVnRHIAxOrt+0zDoii0PjIelw5ozaWxbLKrVxqEvVJ+wO+?=
 =?us-ascii?Q?oF6W4mzrGiXkAfOjdKHQQ8dPoyMbLvt7UHkDrth284dj/YCkZ2rIgVA9+2Fx?=
 =?us-ascii?Q?60egutmhU63WedDcV4gTVrWv8Szfz5RVLLy6Yg4aBihAsFEpqfzv91JYiCwI?=
 =?us-ascii?Q?4Yno8RJ4Is8CiclPIhfoWe8ffX/OIjeHjCEB/mReGe7PlPDns5DmH4AbvbH/?=
 =?us-ascii?Q?zaYpBqLQYfF4BpgGozS2+ztnYks1+1vcTCXs713v5x7xLbl6Z19yPYyvNsCx?=
 =?us-ascii?Q?9VzycgubghigpuO7h8ZgRV3PKIhDzq9pUyFkR9oqMrxdsx9Sg/UfPMJy8yXc?=
 =?us-ascii?Q?Vp4UzPIP1tSCahtEAkEhS/uVHviUQYeX9P85bbtGglsrMAErXc5xZEV1mIzT?=
 =?us-ascii?Q?dRx6J6QCCsdQATPhpuH8jTvnxTzsGdWjSAWCLkddt15NWA7k/ENpy7kK+G4b?=
 =?us-ascii?Q?boaF5PgttGlXuLKOZVmbq//fMp2E5NIiX9tggeqhYwe5kYyX8+Azu1w+oV+I?=
 =?us-ascii?Q?N5zdyc+OXM+jz5dRam9BWEbIBGSVdabgglNJFCc2vuVN6VH1KaodtpibRyXs?=
 =?us-ascii?Q?gu1+f46JTsOxalnHCRMbl4rlmwhkpmcJ8rUHsiLVhiN1x4xZhk9+RmAAq5B1?=
 =?us-ascii?Q?kuI/LxiVd0+86fm9SU3peD1nREw4CgpyAu9LQ15PQiTOntRQOy2MaVA1Pg5A?=
 =?us-ascii?Q?EeGLe8qIxtIPILxPgrag9VMn6bwcJKtGaxr3XeHj7MVAZzdMvPgN7bzIX+vM?=
 =?us-ascii?Q?cAuCNZ+odSNVkdbf5YpB9Ui8LI4hfGInR4awnWmkapwj4tK+dMFVt9V52J1K?=
 =?us-ascii?Q?uPoPC3NpAWHfW7Y+/FmN+xOc9oAUYAdbAS534k1hcwzT+T3TP6ElWBSkvA70?=
 =?us-ascii?Q?eojSeaHUr3JP7JUt9lIsXdZoDXl8jM2y2pib7PE40ih0VLxqggax8u0uj6/V?=
 =?us-ascii?Q?zxOy5NxY68Mx5MFsJwtu5tVSrFmGq3xlxo72UpLm/WWztyoZPHw8/OMjP6kL?=
 =?us-ascii?Q?ECrSyoRPoZQV2YOnyE30NDerPygL+f4=3D?=
X-Exchange-RoutingPolicyChecked: ucJlQvJEW+fA74JpNa0YVzjs28YUZk3ROY5mK3gwKysHeFPbHOBQ9iAgko8xYon99KO8RTAwyyUPRf2i2uMke+BdwHts6vieYFajZSkkyZLktn5u0Uaar+0R+o5ZY4QrTYXvnmkTlXo9X8p7fi0qTKslMpbsFNwfMFU+kQC5e8dZEPkO+0VWZuwa2dBY9gNVEnSXVBzmgjzO1J7Rp2D7eaMvpEoieoWgunHLuCm4TylG13HT2okO5/zHJll1dkI9bqntv6pRA+XmvTTuWkzzADDmlF/L1pFQd/YKdBu3HD8ONkAsPCscENCAWMCvWtg+EY+d58B5+5rdiiANYq2aQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8304da46-b240-4459-11c7-08df28d88f61
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 03:17:49.4841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtNo8BN7cMeWNGysmvOSJPKiE74KfHZvLpeZcugzCez3XxwqUXYfKwHYlHo9e6sAoHxHZ2bWMXuWGQtvELlz/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088494
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2026 at 07:34:42PM -0700, Daniel Charles wrote:

Thanks for taking a look here.

> The early KILL message disables GuC scheduling outside the serialized
> TDR path, but xe_file_close() does not wait for it to complete before
> dropping queue references. GuC may still schedule contexts whose page
> tables are being torn down, producing CAT errors and engine resets.
> 
> Split FD close teardown into two passes: first kill every queue so all
> KILL messages are queued in parallel, then call the new
> xe_exec_queue_kill_sync() for every queue before dropping references.
> 
> The GuC backend implementation flushes the message worker while the
> static KILL message is pending, then waits for scheduling to be
> disabled with no pending enable/disable. The wait also completes when
> GuC submission is stopped, VF recovery is in progress, or the queue is
> wedged.
> 
> Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
> the waiter is woken as soon as scheduling is disabled.
> 
> Assisted-by: LLM
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  8 +++++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 13 ++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++++++
>  5 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c48..ffee8951a7b4e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -190,8 +190,14 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
> -		xe_exec_queue_put(q);
>  	}
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q)
> +		xe_exec_queue_kill_sync(q);
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q)
> +		xe_exec_queue_put(q);

You can do the put in the same loop as xe_exec_queue_kill_sync.

> +
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9a8efa2bf2bfb..8ba2cf45694dd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
>  
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue after
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}
> +
>  /**
>   * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index e8963f85cabd9..4be023b9a4c6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q);
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
>  
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 48c05398b0168..4882eeccb9bd5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
>  	int (*init)(struct xe_exec_queue *q);
>  	/** @kill: Kill inflight submissions for backend */
>  	void (*kill)(struct xe_exec_queue *q);
> +	/** @kill_sync: Wait for the backend to stop queue scheduling */
> +	void (*kill_sync)(struct xe_exec_queue *q);
>  	/** @fini: Undoes the init() for submission backend */
>  	void (*fini)(struct xe_exec_queue *q);
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 609af66b343d5..36c8c3766f5fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2267,6 +2267,34 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>  
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc = exec_queue_to_guc(primary);
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> +	bool pending;
> +
> +	if (!exec_queue_killed(q))

xe_assert(xe, exec_queue_killed(q))

^^^ This is a caller invarient.

> +		return;
> +
> +	do {
> +		flush_work(&sched->work_process_msg);
> +
> +		xe_sched_msg_lock(sched);
> +		pending = !list_empty(&msg->link);
> +		xe_sched_msg_unlock(sched);
> +	} while (pending && !drm_sched_is_stopped(&sched->base));

I'm honestly not quite following the logic above, and I don't think this
is necessary. At this point, we've already queued a kill message. It will
eventually run, or the TDR will fire, or a GT reset will occur. Any of
these paths should eventually clear the flags below.

I can see that this was LLM-assisted, and it may well be smarter than me
here, but I don't understand why this change is needed.

> +
> +	wait_event(guc->ct.wq,

wait_event_timeout

A GT reset saves on the GuC taking a nap but that is unbounded,
wait_event_timeout gives us a bound.

Matt

> +		   (!exec_queue_enabled(primary) &&
> +		    !exec_queue_pending_disable(primary) &&
> +		    !exec_queue_pending_enable(primary)) ||
> +		   xe_guc_read_stopped(guc) ||
> +		   vf_recovery(guc) ||
> +		   exec_queue_wedged(primary));
> +}
> +
>  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
>  				   u32 opcode)
>  {
> @@ -2744,6 +2772,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.init = guc_exec_queue_init,
>  	.kill = guc_exec_queue_kill,
> +	.kill_sync = guc_exec_queue_kill_sync,
>  	.fini = guc_exec_queue_fini,
>  	.destroy = guc_exec_queue_destroy,
>  	.set_priority = guc_exec_queue_set_priority,
> @@ -3423,6 +3452,9 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  				clear_exec_queue_pending_disable(q);
>  			}
>  		}
> +		/* Publish the disabled state before waking kill_sync waiters. */
> +		smp_wmb();
> +		wake_up_all(&guc->ct.wq);
>  	}
>  }
>  
> -- 
> 2.43.0
> 
