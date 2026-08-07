Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC93C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BFA10F4A1;
	Fri,  7 Aug 2026 12:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfKJraa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6A710F4A1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106243; x=1817642243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SVTzG5b2dg4hJJsjrqU7YsrAUrKf2PqUYZRsBrsiHiE=;
 b=GfKJraa8HVV9/3Ey7V1fP8dx35B1rS0zupvM0AMdn+ULhObRrRhdm5Os
 urTslSRZcc2WWrbqUi3FL13hE0wN3uXvsNYx054bARLlpVEPr4zdl/DGX
 waqxg1g1WmHa34nHmkP+xdEUcQZkbaJb6TD1gDH7PB+bJebk2Jxi2r1yX
 yXMFI9CNFTk1r7+lx1vkG1/WujtxrQkn92n79wkuGKC3OJmleOjUm4eGr
 4DKW1leTU8AZMDt+wFYphQJnDXvGbIHsD1ZiOQs5lmZ4W6ljL6VHzYbYi
 eJiqSW+S5+jWLw3rAb8qggCDZcRdYe5lUYJha20ZoigvAi6p7FX2WkqmY g==;
X-CSE-ConnectionGUID: ItawHpxHQgyhB3oHFZ34rg==
X-CSE-MsgGUID: Om45/ReHS1OvraKarm8fhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86565228"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86565228"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:37:22 -0700
X-CSE-ConnectionGUID: QbJSCiQ2SIasW8y/BjlqLg==
X-CSE-MsgGUID: kDd/N0p4SJWntIbTu9SyUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="261100237"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:37:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:37:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 05:37:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:37:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF/AclFe0bgfd5waeQbGUK5BIXtnKGpaKxqNul94jxFS1fXD89dSirArxil5wGYsjeUBTZvBNMGuuBmjyVvRZJIoobf+fMcNv/RGrerxrKgz9J5ADKsge+VTRFRdPYcogx57KJPsDEJthHmaBltYWlj/hN6D+pTUahs4d9GrRVd9kmLkahyzhOqUsrsRsRIT3+T6NwQq6s8DKiZPCT5ZX1dUFa4ZdRTJLIIe2rYyrzOEZmden5/8t3ror3ASScWa9ZBixDXC9cvyo5s/ZAJH2xHDIKJRWGIYp5X435DhT5EsjAtjXAdLaNWhyPt4cMn893Ef4VmKhk8VEB8WimTAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsDz/TiEmcjaYYZhfQG2ECOcQNYkq4ja/RwYp4A7lBQ=;
 b=Aq9hoCzTqKWUqDlT5bAH9eW1/faNTDjJx2dG2svOMYc+sgMMYVgA4uqWCnbUuwpBn8xYu9B9xF24bi9vH1XhJLErswQ8cDpr9L6mYvFIdYn9pEokvS9OOrAJGtNtSsnI2jG9Yn0hCLdsZzB+V41AtMQgn0N/YEoREcrwPlvEGCL+5rTPZI74rvGxtmHX8K5CBjNpcCWExnUP7JlW678/CufOvAECP7AMVhGKUewtcQriuLrPIRvZ89Fyz8eEUhY9s7IXUYSgFvgQllWFCYH5p3TDdeoUleIluWjnG2ubD6BG5ul+Yzjk9MgoycV0CNdDyQJPJLP14QTeVD4S1Ys8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DS6PR11MB454219.namprd11.prod.outlook.com (2603:10b6:8:4c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 12:37:16 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 12:37:16 +0000
Date: Fri, 7 Aug 2026 14:37:08 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v9 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <anXRdEQvPx9CiAxu@fdugast-desk>
References: <20260806185202.3922432-1-matthew.brost@intel.com>
 <20260806185202.3922432-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806185202.3922432-4-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::19) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DS6PR11MB454219:EE_
X-MS-Office365-Filtering-Correlation-Id: dc801dc4-6d36-4ebf-d25d-08def4809ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: IA1sqr5RWlqLP2cTZZEUVi2I27pu+4rFkxNsx/USg2LsbK2BkZTWdMln4/raUjE3wzigWZK7TflLDR2I2jxGtUBjc7syD/sETxE+ZAZYrUE0TEWm0ECwY3Aq53lv073H6isE8NZ9ca/lky3NRtQGBV3OVxv5PEXFiqTFZJDyZe/MeG3l2py/IdqsymIyoorvbajA1Jow4A8Spo08FE38ROGotxQVZoXu9EZenJdFdAlsxOwEgbB0SjSJsJBiQPbmR/7+vq1/Zygkt89GYhPnDC/UymigLSI8bOImlpkt+UqIPfB1usb7qH2ZcJIgu7+zVUmEFe41SV396bTHSzKHN5z2OTLleOlLJVjUn7UN1fEDFFIw0scmRCuSmA44t8qqRd8LdlpaJ9V4tiWfIxMNY/stdJJGXkd5SfCpyACWRaYJVsCEvRvFm3C76DktmZu66j1zpXxL/YPEBhXDQofvzKw3sU9dX+ZCnjO6vsApXVE0epE5BDn7qeqwtnrFMk6xky8k9etwZAhu09H1qMKUxvih0U2iFlme39SuxwmKvtUgLHeYDzGqtYchCSnAwlkTJ7nwNYEqXoJXFn5THsRyuqFZ8TEGasimK1jidHmWWvFQZmWSRlRySAq0Hzn1fZNdkfa6oZLfPz4YsKXKoD9D7E0KeOYzZo12Fjss3HjjIE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ww1cfXtYhFcI/3KrSlRYC/a4lWd8/B7Lg9pByHHKq0oJsw67vAylx4gMnJ?=
 =?iso-8859-1?Q?LmbaTLI/xcptZMxAIJPpAWDE1FfqfIfM34l1bM3zRmC0VdonKMYK3UYrtV?=
 =?iso-8859-1?Q?8zmmp8rZRiZoD4J0aMAz+lPYRb27/2u9rx/DjLeQI9LfoZmUZWkQgZ0cIS?=
 =?iso-8859-1?Q?lSGMll8TVQ0fyPSuf0vTb6A5upFF5WlvnRxbzcI2NQtV2oUCQqjxN3v7r0?=
 =?iso-8859-1?Q?1tZhqGaeYDU9OuFgBE/JGMVz5nu2CRgC4j/RPrRraK8iwgv4EBbC4A0JqF?=
 =?iso-8859-1?Q?cBmxj63AbS5aHx59JAJInZYs+rXPJoR9PY/M3GuCn2huiE4xvi19QcVzXd?=
 =?iso-8859-1?Q?5p5EuneHDGkasFIJvotdRXDnswgcR8B13iXvVzyVFSNa/3rIHzvdaymiJI?=
 =?iso-8859-1?Q?zxRAEpkyBb80b+yC4JnjW27oFt/Sjf2KvH74iz7HPhdysEionNeW8AHrjj?=
 =?iso-8859-1?Q?BoievKYvEeIQSbQTUFN/f4PLRRAjektmyxhuQtc9kw7YQYHDRL2QEuvBHe?=
 =?iso-8859-1?Q?RvOd1mykyBpYjK4l05Ad5A6L1VnYI4WPR+cBs9n5O0bEvFUMZGtQJt388C?=
 =?iso-8859-1?Q?QhtlA914VvqfF7agg8yCjAwmigo0apR5rFcijGbjTVCqwS0nHPSs6l6dGs?=
 =?iso-8859-1?Q?0QDwA9RvcPSswCnwHULG1QiEShO+mIRzvVqdT0oRBNvJbRs91Uq/M0n10s?=
 =?iso-8859-1?Q?KpGkB90d31c28dpNBW/ol4tXAwVNaMCim+0FY+TPFSmp6Smcbrmz65yl2K?=
 =?iso-8859-1?Q?FHCOX2lBy0PraMmBQ+E7XhERn90BUBIIynA9yRmNHBgsfM3+8VRxX4dtRF?=
 =?iso-8859-1?Q?OaQpg6htMn2LZMbW4Ri4MJj9EePcumQaFwHPzdf7IBHePVoI9+pTnplkn4?=
 =?iso-8859-1?Q?+rokHZyMs9CLhN9JpL+T9A1W+MITotdrKVJFK8/LKItjta7n02Mf2Ts81t?=
 =?iso-8859-1?Q?TQN+uiq5/cTr4WwmJzvLWVD0vsCXWdaiGbO2dSyqjOxkbflgE8/Lf8Zym0?=
 =?iso-8859-1?Q?ymYLYNRSa7D09B0psplJHuJX+P8wdG2KnIeyb0pGjaS1xQCZa2XVZPlVyG?=
 =?iso-8859-1?Q?VeQ7Yb7wfOQEKdMnB7OTre9UuTVXfrAyeHqpYtPByz8NgofnKHu1Moy9eJ?=
 =?iso-8859-1?Q?lSe7PHPEAMpJ2YVJ8cQxSbHcMMZ2skbkzvBnQYgEIX8V24lEb+7RMbgV/I?=
 =?iso-8859-1?Q?2xgcpTmd4e3ylc7XaS6NZkW+5nCq0Kg/4+/4fYLLkG8JIuBGKGjLnwCg1O?=
 =?iso-8859-1?Q?PtobOusB8nAGCfqQIFK+qFVIGj48qrH0UjmU21v+Y1Zi/mynzAYXOftmS9?=
 =?iso-8859-1?Q?l2UZ8qKqWYqyETN7N5u/G0XhoDg12XNrFQJ7ucC4wp9/nlGOZO9JHq/kc8?=
 =?iso-8859-1?Q?3010SUlq/HEfRccGksjFfqkNUlML0w8K4vbRfIOcoK+gfdJ1cxHysomD/T?=
 =?iso-8859-1?Q?p35HLcRqWJIdE99H/t8Ep6i22DLa/aqmowY1Z313/xTBK2bdAMMHJVwnJm?=
 =?iso-8859-1?Q?BTs7UX32drV+i0zeLeXe6kHevipfxtOB074oG85PZljLxBu3hT1TbSxvXO?=
 =?iso-8859-1?Q?V5BfkQfTV/H2uNkKKZOjo/sTTJ36yImGJWm7bg9UCBJFCV6bj1ds2aO1+/?=
 =?iso-8859-1?Q?+bkeWdBWoX6h2PbxY+bJZ366JlH3WHfrHM4zHEunUMTo0rf80u07GZ4F5Z?=
 =?iso-8859-1?Q?3XQhnBXlnD5GRn6YnQicTYqSmVpTluv9/XhzPIukSqtyVi2EHorSKbFGp4?=
 =?iso-8859-1?Q?HMZ4g+4FJt0jx3rGXDfajlNfx6TjZRgOEsMNW9VOUfh/tcBIMwK5dCtgLd?=
 =?iso-8859-1?Q?01PdnHkxJVFHg68XtFCTAuB+iorJjOQ=3D?=
X-Exchange-RoutingPolicyChecked: eZ0pbMf9709uZgWOdrQJWMG2suv/mCezmF222MvDNGavd2U7TTUTV7ta5oH62roid4AK0055NvDtCbMgNDEGXXRajQpUKZonuUzhYr7cQHxkDzdJuoQzS5SNT3DB/TI36z3/F+qvDc05ckof4P7AYSv2yDtHNOY/2Z5fyV1RF3X47kHCawVCSWbQEVaUz7pgVi6KARUp02hURstE+FhpybvC73ILQhNuE9bdEj46+JuKbiiJNwFzs/e7i7mfTmPn0UuqGQdmoTrP4YS7L4oAtDV3+5vtePhRJTuTiTU/NMwxX6SL7HaMAGEHInCh10HyfQdxow3bBlgC0I/cHlf/LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc801dc4-6d36-4ebf-d25d-08def4809ce8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:37:16.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPPfAVW0rVtqiaUNVW+t4kZ92kZXteDOKQoJ8pZDPEE59jCEsoBWW8WQbhHKFCKh/4FIwtB//WPP8lp3hozV8Dg+3G7JufkqPIIcGA+UPHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB454219
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

On Thu, Aug 06, 2026 at 11:51:53AM -0700, Matthew Brost wrote:
> The migrate_vma_* functions are very CPU-intensive; as a result,
> prefetching SVM ranges is limited by CPU performance rather than paging
> copy engine bandwidth. To accelerate SVM range prefetching, the step
> that calls migrate_vma_* is now threaded. A dedicated prefetch
> workqueue is used for threading so prefetch work is never mixed with
> page fault or garbage collector work.
> 
> Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> this patch on drm-tip. Enabling high SLPC further increases throughput
> to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> of these optimizations are upcoming.
> 
> Since the dedicated prefetch workqueue is not shared with page fault
> or SVM garbage collector work, page fault servicing and garbage
> collection can keep using a plain down_read() on vm->lock: there is no
> risk of a blocked reader starving a worker that a pending writer is
> waiting to flush, because that flushing is now confined to the
> separate prefetch workqueue.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> ---
> v9:
>  - Drop Co-authored-by
>  - Bring back -ENODATA return
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
>  drivers/gpu/drm/xe/xe_pagefault.c    |  29 +++--
>  drivers/gpu/drm/xe/xe_pt.c           |   6 ++
>  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
>  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
>  drivers/gpu/drm/xe/xe_vm.c           | 155 ++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
>  7 files changed, 167 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e5f896636027..a2c8d88f544a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -324,8 +324,10 @@ struct xe_device {
>  		u32 current_pf_queue;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> -		struct workqueue_struct *pf_wq;
> +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pagefault_wq;
> +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> +		struct workqueue_struct *prefetch_wq;
>  		/*
>  		 * We pick 4 here because, in the current implementation, it
>  		 * yields the best bandwidth utilization of the kernel paging
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 80196e874e06..fd7ef0718153 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  				xe_pagefault_print(&pf);
>  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  					   ERR_PTR(err));
> @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		pf.producer.ops->ack_fault(&pf, err);
>  
>  		if (time_after(jiffies, threshold)) {
> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
>  			break;
>  		}
>  	}
> @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  }
>  
>  /**
> @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
>  	if (!xe->info.has_usm)
>  		return 0;
>  
> -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> -					WQ_UNBOUND | WQ_HIGHPRI,
> -					XE_PAGEFAULT_QUEUE_COUNT);
> -	if (!xe->usm.pf_wq)
> +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					       WQ_UNBOUND | WQ_HIGHPRI,
> +					       XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pagefault_wq)
>  		return -ENOMEM;
>  
> +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> +					      WQ_UNBOUND,
> +					      XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.prefetch_wq) {
> +		err = -ENOMEM;
> +		goto err_pagefault_wq;
> +	}
> +
>  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
>  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
>  		if (err)
> @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
>  
>  err_out:
> -	destroy_workqueue(xe->usm.pf_wq);
> +	destroy_workqueue(xe->usm.prefetch_wq);
> +err_pagefault_wq:
> +	destroy_workqueue(xe->usm.pagefault_wq);
>  	return err;
>  }
>  
> @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
>  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
>  			pf_queue->size;
> -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm,
>  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a07316a45d79..5d990c1c3740 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2414,6 +2414,12 @@ static int op_prepare(struct xe_vm *vm,
>  			xa_for_each(&op->prefetch_range.range, i, range) {
>  				err = bind_range_prepare(vm, tile, pt_update_ops,
>  							 vma, range);
> +				/*
> +				 * Don't tell user space to retry, rather let
> +				 * page faults fixup the pages.
> +				 */
> +				if (err == -EAGAIN)
> +					err = -ENODATA;
>  				if (err)
>  					return err;
>  			}
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index cc36addb4f4f..6a470a02fee7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  			      &vm->svm.garbage_collector.range_list);
>  	spin_unlock(&vm->svm.garbage_collector.list_lock);
>  
> -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
>  }
>  
>  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   * @tile_mask: Mask representing the tiles to be checked
>   * @dpagemap: if !%NULL, the range is expected to be present
>   * in device memory identified by this parameter.
> + * @valid_pages: Pages are valid, result written back to caller
>   *
>   * The xe_svm_range_validate() function checks if a range is
>   * valid and located in the desired memory region.
> @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   */
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	bool ret;
>  
> @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  	else
>  		ret = ret && !range->pages.dpagemap;
>  
> +	*valid_pages = xe_svm_range_pages_valid(range);
> +
>  	xe_svm_notifier_unlock(vm);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 0d1f1107af5f..46be2e5c6f7f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>  
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages);
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>  static inline
>  bool xe_svm_range_validate(struct xe_vm *vm,
>  			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>  {
>  	return false;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 25736c952304..4b4036da089e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2525,7 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			struct drm_pagemap *dpagemap = NULL;
>  			u8 id, tile_mask = 0;
>  			u32 i;
> -			bool need_put;
> +			bool need_put, valid_pages;
>  
>  			if (xe_vma_is_userptr(vma))
>  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> @@ -2571,8 +2571,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				goto unwind_prefetch_ops;
>  			}
>  
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> +						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> +				xe_assert(vm->xe, valid_pages);
>  				need_put = true;
>  				goto check_next_range;
>  			}
> @@ -2588,6 +2590,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  			op->prefetch_range.ranges_count++;
>  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +			if (valid_pages)
> +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
>  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>  check_next_range:
>  			if (range_end > xe_svm_range_end(svm_range) &&
> @@ -3158,16 +3162,87 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +struct prefetch_thread {
> +	struct work_struct work;
> +	struct drm_gpusvm_ctx *ctx;
> +	struct xe_vma *vma;
> +	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +};
> +
> +static void prefetch_thread_func(struct prefetch_thread *thread)
> +{
> +	struct xe_vma *vma = thread->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_svm_range *svm_range = thread->svm_range;
> +	struct drm_pagemap *dpagemap = thread->dpagemap;
> +	int err = 0;
> +
> +	guard(mutex)(&svm_range->lock);
> +
> +	if (xe_svm_range_is_removed(svm_range))
> +		return;
> +
> +	if (!dpagemap)
> +		xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> +		drm_dbg(&vm->xe->drm,
> +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> +			dpagemap ? dpagemap->drm->unique : "system",
> +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	}
> +
> +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			/*
> +			 * We intentionally return -ENODATA on any races to
> +			 * commit any VMA updates from other ops without
> +			 * updating any page tables deferring to page faults to
> +			 * page updates skipped in the IOCTL.
> +			 */
> +			thread->err = -ENODATA;
> +			return;
> +		}
> +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +	}
> +
> +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> +	if (err) {
> +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +			err = -ENODATA;
> +		thread->err = err;
> +		return;
> +	}
> +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +}
> +
> +static void prefetch_work_func(struct work_struct *w)
> +{
> +	struct prefetch_thread *thread =
> +		container_of(w, struct prefetch_thread, work);
> +
> +	prefetch_thread_func(thread);
> +}
> +
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			   struct xe_vma_op *op)
>  {
>  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> -	int err = 0;
> -
>  	struct xe_svm_range *svm_range;
>  	struct drm_gpusvm_ctx ctx = {};
> +	struct prefetch_thread stack_thread, *thread, *prefetches;
>  	unsigned long i;
> +	int err = 0, idx = 0;
> +	bool skip_threads;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
> @@ -3177,42 +3252,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>  
> -	/* TODO: Threading the migration */
> -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		guard(mutex)(&svm_range->lock);
> -
> -		if (xe_svm_range_is_removed(svm_range))
> -			continue;
> +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> +		(!dpagemap && !(vops->flags &
> +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> +	thread = skip_threads ? &stack_thread : NULL;
>  
> -		if (!dpagemap)
> -			xe_svm_range_migrate_to_smem(vm, svm_range);
> +	if (!skip_threads) {
> +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> +					    sizeof(*prefetches), GFP_KERNEL);
> +		if (!prefetches)
> +			return -ENOMEM;
> +	}
>  
> -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> -			drm_dbg(&vm->xe->drm,
> -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> -				dpagemap ? dpagemap->drm->unique : "system",
> -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!skip_threads) {
> +			thread = prefetches + idx++;
> +			INIT_WORK(&thread->work, prefetch_work_func);
>  		}
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> -			if (err) {
> -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -				return -ENODATA;
> -			}
> -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +		thread->ctx = &ctx;
> +		thread->vma = vma;
> +		thread->svm_range = svm_range;
> +		thread->dpagemap = dpagemap;
> +		thread->err = 0;
> +
> +		if (skip_threads) {
> +			prefetch_thread_func(thread);
> +			if (thread->err)
> +				return thread->err;
> +		} else {
> +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
>  		}
> +	}
>  
> -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> -		if (err) {
> -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
> -			return err;
> +	if (!skip_threads) {
> +		for (i = 0; i < idx; ++i) {
> +			thread = prefetches + i;
> +
> +			flush_work(&thread->work);
> +			if (thread->err && !err)
> +				err = thread->err;
>  		}
> -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +		kvfree(prefetches);
>  	}
>  
>  	return err;
> @@ -3343,7 +3425,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> +					     struct xe_vma_ops *vops)
>  {
>  	struct xe_vma_op *op;
>  	int err;
> @@ -3353,7 +3436,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> -			err = prefetch_ranges(vm, op);
> +			err = prefetch_ranges(vm, vops, op);
>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 2f5f74fed9d2..68588b624212 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -556,13 +556,14 @@ struct xe_vma_ops {
>  	/** @pt_update_ops: page table update operations */
>  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>  	/** @flag: signify the properties within xe_vma_ops*/
> -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
