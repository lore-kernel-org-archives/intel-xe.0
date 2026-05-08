Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84CFCD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 17:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAAD10F566;
	Fri,  8 May 2026 17:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QilhrhRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7CC10F566;
 Fri,  8 May 2026 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778259606; x=1809795606;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xiqd8C91FlIYTKRkhli49VoET0v6gfa53fis3doCkWw=;
 b=QilhrhRF2c4fWNGJFvddw6E93NsuaKuPykOTftHt35AeI34mnDUWaQwY
 dYZcs6ccZszW1u5cKfiv5Jre5y6zDMdRtUhhHT1rnFHGYyAAx6j0o8RSa
 /RX4CDSMl3x9CyLfkdoV3OvBi4PnA1vnhK8R/gOwCrXlwO0fiYhNlbOZz
 TiKvk6oaFE4/0b12jKsh9h9xAqtX4CHU1G3sYpS0aQ0WLUmtGZP+CKxdR
 3OQawgwGT9GEGiieJE3yPV/wRHAKHjer1SlnBhHIMaeK/1lnXEl0yhKqk
 fohzBMaS9OmvedKmO3FMhhgyJd99zpYAnyR5Kka2QrFVk3LaAcj+oDoJT Q==;
X-CSE-ConnectionGUID: uWj6Nj7jS1+kuwOa9Ek1yQ==
X-CSE-MsgGUID: JuWTM7K/Qu2F3ow4rcpO5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90693390"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="90693390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 10:00:06 -0700
X-CSE-ConnectionGUID: rUa5WItMQQ+5bfMi2DUJ7Q==
X-CSE-MsgGUID: BH07jEWbQwiLzDkdzcmyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="237050866"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 10:00:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 10:00:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 10:00:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 10:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1jrb6vBqHasRsrxxnh2gDqXHXQHa80i7P9ytQXzOWBAh/McvYwGLQKO9FNpWfY8ir+9gM+a/QlHtK8xFPjX2JzzJCxFHZSaucLb0MpSR1y1PqiOoALr8189deZKKerSpj956RSLt47S3mbITG8jTbgDRzfrB6odHefZcuIf/Y6u8OLBUn4llQXaASx+ocBlx9dGpGmrRWKqboGXbX4omP+SJFj/8oy/IOIa39eiYJ/dxdJ26uAuOq258NvM3fv7x/b3bKcmdGQrPUtoNvjLuLp3fbgzN7tb5EwBzghWI7gLlFP6KUbBsGXknDKayAJI9nHTEkKY65XfBwu3gpdSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZhTvwEzqiL7wOvOwmNuRvdPanM2G73Mvh3rCiKZ2eY=;
 b=VzbTnzxfp2J+id3DBPWX6ATcGnx4Gs27lPMthDxSQJTI/rfkiOnG4rZ/pYFSNa76BRYoDo0e55VRSCOsgRXae0P9sdOvAW7GnUrwMRQAqHmPPTMB0GImTiXIW8DV365xHYdPL1ElDi4douFV1rdJYZBvFc3LBVHnK8vtF3O+PVCoDMVOovFtmRA2VJQrbmoRzVpudkdeSZvZfgTKBDMb3Wwanr61QEgUwzJDCtvLzFDUaUHbo1CyGXKjg4t4sN1gs02wq8WVpLi/DaP1u3mSA+bnAz3FYQDhdF/UYI6NEOMkL8Plk34P0zMBZ7iT7w150HqcghMzyhu9a/nZy0YTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DSWPR11MB9582.namprd11.prod.outlook.com (2603:10b6:8:36e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 17:00:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 17:00:02 +0000
Date: Fri, 8 May 2026 12:59:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_sync_file: Exercise sync file
 access post queue destruction
Message-ID: <af4WjjIF6nhz-Ub5@intel.com>
References: <20250312124245.83254-1-tvrtko.ursulin@igalia.com>
 <20250312131835.83983-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250312131835.83983-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DSWPR11MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 0186f3b8-0655-4961-6f57-08dead233ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: j+V2H69LLANPwq5whVJyxhbpJeK1hn3m3AwZurwclk6Y/I7qhYjSl4Tx0C9xX4ZBsKiXra5QBUwElW7EPFR75fjNZU8lT1ukqDgKEFHSS0Ri+2amP3YDUI8o7FQHL4Y/T1zfNY7BhTdItksjjRIFwRoCUrrCYEe5IwPjlnrEfYplbaegvFNVKL2tldQyaoaZW9qKYl7fZPw/fZGdgp0JQ8vs7g06eFQR/tw+VNsV8Bain0EdA3VZXxiIgXp/8u6w6Vb3WfXu5s6t0LQ8NuwEympp9nxjWQ7gC1eje58fUvb8M9yszBmzxnxMo7kS6XeeY0JCyLPPOS/kpT77XR/JTQfBFpcXXJ+IkCr+xo56urFFC1NWovqdigErcYkpL9HvKYQ5WYqCa5QAK3R+DRTA428WCEyc3du1tt0rTWpwPaFdo+5Ywmbi9J39UYq/XX3w3ZWiDmDjlrLE7My7OeH8rqp09ntpgTZZeZERKEzrelYZ5wYxd/2bkA5twX8bzR8iLdd0z+fnCIzDPTpjdfbjGO4OaIu/podp2OAvJhP4F1pUJdDT4pJBnP69otzkQfrndTVQ0olo/cwdlou4K1BsDdt6y199hQL8JKr4wLq0n++1JhKEeTtWUlEHKk7pbVNGCPzSzsehB0GZHN/F6qh3rKmBNawrJG2N+r19xxIwxDyB4GpTr8VtLyFB7JOnimVD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I721s3hVRw4+lSvPl/Dgqda0CsJ4yUA+y20+YHqZZXdhl1QUSqnpmrmtbz?=
 =?iso-8859-1?Q?yQUH5TSvl34muRbKSTI86pOkr5OUy2ZllQozesR+2qXi7U56yNYBs6eyKm?=
 =?iso-8859-1?Q?RCVi9HMSEinYvPCwHOXvMxaBXKjfIDx2oCVqRCPLeo1oBIrRDK09ExGgBU?=
 =?iso-8859-1?Q?jXsYVaJb496oYVDpvYSSmvGGu0HaOicmwsD6D4eaI8DjsUPD5iN7JHXDL4?=
 =?iso-8859-1?Q?fb/viq6rIabtPZFjdgJfwpp6g77cz91WW3WcqgPr/8GccNmKhnnWlZLBYz?=
 =?iso-8859-1?Q?QotWuNszyZfx4dFcatBbUPuKmbGgFgn83CocmkDHapduunD5jlO0yc+oBf?=
 =?iso-8859-1?Q?dn1s4r9m7M2obGgoSFIEPEGrRhUE+iRQc1282UYZDwrUcOCBISRRBEpAQn?=
 =?iso-8859-1?Q?8CmRJvg/1MLwEn9qUNU243ZhiNoLVGKdsnnWDoodjUWNFcmW33nU+C8I98?=
 =?iso-8859-1?Q?9MUjDmIx+VTk63HUxVRNsSEhTyUeK8k/GpTC+cGJ8mxvuGYlSTGO/KwcsI?=
 =?iso-8859-1?Q?hSBTlezfKTQF5aLLo895e4i91HkNtXKROj/vaVGBIQMiCixaWoxBgAfR7D?=
 =?iso-8859-1?Q?rsFCcWcs0kiRfC1fIGb75QHukJ8gjiVoTqc8LEnmR6Bv2DXN2ZTYEXgyJz?=
 =?iso-8859-1?Q?V77RjNKKf6tkZuOTHhSnytRYWq0ADzeiyK99WhHxttO6DkLFx1l0FDsa10?=
 =?iso-8859-1?Q?IKx2/2um4zQQg3waaKtmYPpiS9pS8JDUo55aUjAszZV3df2f+4cMSuUnFB?=
 =?iso-8859-1?Q?Ze/AZ+J5kKy9KF3vcSSDUvaPZpRniDgUm8RNxVD+WhnHGcS6laF+JEyr2B?=
 =?iso-8859-1?Q?s7/vd5zo7juMjWfKkAPiEC9uB4eGz5+n3zVQQ2bxbPGHqc0fFyC9pbKelG?=
 =?iso-8859-1?Q?f4ALEC04Zca1HsVFbL8o4PU+1Uv2rBenzCdgwLWcLz46FIh1yeD6+TIg2j?=
 =?iso-8859-1?Q?7/L8EeJN07kLkTWMWtkqBPwhdF9TXiKSUy9Z7YZsBSxvGAp5cZa2Eyvbzd?=
 =?iso-8859-1?Q?4ebBXNlb48lT7L9Hi0uWY9CWUmwyGk6HG+K5QC8idGa+t+ssreesyXy4s5?=
 =?iso-8859-1?Q?j1acKUmJ0DxvFGH6Td+iSHenjyT3Y8BIIQnLopGzYgEtE7xP2PKLJP4MGc?=
 =?iso-8859-1?Q?uAXB23oCTRE0CPh9ey5yFiElcpCj2euxej+o9070uiF16O6oom8RTwTmQm?=
 =?iso-8859-1?Q?8NjI7YS9haGQ/TH5m3BOn5QQHK5i40q1EQaPHR74crw9HuHyrqevSTADcc?=
 =?iso-8859-1?Q?N8iMaMiMb/0XKBtB5ClS75VpW8XIT7Mq7hjJGoqN7opM8rwFxi6HqYeVgP?=
 =?iso-8859-1?Q?MlWd5HOXyQ/fvB1ybZwx+KQZTLh6ja4zTpdQDElkLKIipwk6VCr3lgQ6yc?=
 =?iso-8859-1?Q?nSAt7NNalm2tXrsHIxdfbmNO+G619XEKcUryhX3HnfPsbrZ93Z+IvYisLh?=
 =?iso-8859-1?Q?GcrUBNlfkwFOk6kmhX9gzMuZkmTol7Sb4I1Rg7yYvj6UxbkqJfjVtP2sLb?=
 =?iso-8859-1?Q?uNp+BJhjE9kzJ8Uz1heLmCZu4grQuGXDAeJfQOqA42+8yi1FmPC6ZOP1Ce?=
 =?iso-8859-1?Q?+gbEqWCCkrwl5DhGxuNR0U9j9yAbLIuHQYAKb0ZB7d9rQUvQDIrLead5Zw?=
 =?iso-8859-1?Q?W8kfNNI5Fh8QzF2PmxEVNFsCKpFyr1DLfc6O6ezjYvTToYYobwsjph88r6?=
 =?iso-8859-1?Q?GNP1RdxqWNdW2vqBZAvndtXCGcJC3o2PPQY5smWp7PAMB5ZkZ0rLU8Ne5Y?=
 =?iso-8859-1?Q?gUZmZ9J5ISqoVqqyWaXTU+f7oAPUN+4y1myaR9p03hvD2/v4VQHkWZV8K+?=
 =?iso-8859-1?Q?vFe7kS2j7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: eBEkiQAScJxYXEDuq07E3j2w0EchkAq37EUKleiIvRr9fzgPyDvd+GibF5hVSnFIZ/MnWYs5af3D3s/z0CtyBLXsaHcoi3FW4egquAnABaKPsBMpgCYTDdJSaftckohGJKLUHPNafyuWvAcRYjLb11JJXLm1Kter9h1Pwm42VvPHxg7/NazgoxiB6CEzdEYlj8NkFPLwpipdZmOXrfVvit/tDUtKoYtYIP76YIS1+nJA4sNYenkDKyrFqqfkfmLNpNKGhnGTBja5hZDyOLp+eg/Og706PGXG6zGyWjjqqEIkZRpI0UcxRQQhw+6+qGEfquP/y0PwValfoivnI1tKqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0186f3b8-0655-4961-6f57-08dead233ebc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:00:02.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORuRxAMRJj/FtgL2ohETEW2QEqPBidL60TZGxb22mDJJDTsF2QMFGHEv1ssQrENF/JBlbSxPJHbDwIP5uYdOJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9582
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

On Wed, Mar 12, 2025 at 01:18:35PM +0000, Tvrtko Ursulin wrote:
> A new test to roughly simulate the VK CTS suite where
> dEQP-VK.wsi.android.swapchain.render.* is hitting an use after free when a
> sync file is accessed after the xe submission queue has been destroyed.
> 
> Abbreviated KASAN report:
> 
>  [IGT] xe_sync_file: starting subtest sync_file_race
>  ==================================================================
>  BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
>  Read of size 8 at addr ffff888126726020 by task xe_sync_file/2931
>  ...
>  Call Trace:
>   <TASK>
>   kasan_report+0xeb/0x130
>   drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
>   sync_file_ioctl+0x3cb/0xb00
>  ...
>  Allocated by task 2931:
>   __kmalloc_cache_noprof+0x1c2/0x410
>   guc_exec_queue_init+0x1a8/0x1240 [xe]
>   xe_exec_queue_create+0xe72/0x13b0 [xe]
>   xe_exec_queue_create_ioctl+0x10d9/0x1770 [xe]
>   drm_ioctl_kernel+0x179/0x300
>   drm_ioctl+0x58f/0xcf0
>   xe_drm_ioctl+0xe8/0x140 [xe]
>  ...
>  Freed by task 1689:
>   kfree+0x106/0x3e0
>   __guc_exec_queue_fini_async+0x144/0x2d0 [xe]
>   process_one_work+0x610/0xdf0
>   worker_thread+0x7c8/0x14b0
> 
> Without KASAN this of course turns into a plain null pointer dereference.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  tests/intel/xe_sync_file.c | 139 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   1 +
>  2 files changed, 140 insertions(+)
>  create mode 100644 tests/intel/xe_sync_file.c
> 
> diff --git a/tests/intel/xe_sync_file.c b/tests/intel/xe_sync_file.c
> new file mode 100644
> index 000000000000..3b8e93315be8
> --- /dev/null
> +++ b/tests/intel/xe_sync_file.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Google, Inc.
> + */
> +
> +/**
> + * TEST: Tests for sync file functionality
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: CMD submission
> + * Functionality: fences
> + */
> +
> +#include "igt.h"
> +#include "sync_file.h"
> +
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +static int sync_file_get_status(int sync_file)
> +{
> +	struct sync_fence_info fence = { };
> +	struct sync_file_info info = {
> +		.num_fences = 1,
> +		.sync_fence_info = to_user_pointer(&fence),
> +	};
> +
> +	do_ioctl(sync_file, SYNC_IOC_FILE_INFO, &info);
> +	igt_assert_eq(info.num_fences, 1);
> +
> +	igt_debug("'%s'/'%s' = %d\n",
> +		  fence.driver_name, fence.obj_name, fence.status);
> +
> +	return fence.status;
> +}
> +
> +/**
> + * SUBTEST: sync_file_race
> + * Description: Check that we can safely query an exported sync file fd
> + * Test category: functionality test
> + */
> +static void test_race(int xe, struct drm_xe_engine_class_instance *eci)
> +{
> +	uint32_t vm, bo, syncobj, bind_syncobj, *batch;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		},
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		},
> +	};
> +	const uint32_t bbend = MI_BATCH_BUFFER_END;
> +	struct drm_xe_exec exec = {
> +		.address = 0x100000,
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	int sync_fence;
> +	size_t size;
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +
> +	size = xe_bb_size(xe, sizeof(bbend));
> +	bo = xe_bo_create(xe, vm, size, vram_if_possible(xe, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	batch = xe_bo_map(xe, bo, size);
> +	*batch = bbend;
> +
> +	exec.exec_queue_id  = xe_exec_queue_create(xe, vm, eci, 0);
> +
> +	syncobj = syncobj_create(xe, 0);
> +	bind_syncobj = syncobj_create(xe, 0);
> +
> +	sync[0].handle = bind_syncobj;
> +	xe_vm_bind_async(xe, vm, 0, bo, 0, exec.address, size, sync, 1);
> +
> +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[0].handle = bind_syncobj;
> +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	sync[1].handle = syncobj;
> +	xe_exec(xe, &exec);
> +
> +	/* Export a sync file fence. */
> +	sync_fence = syncobj_handle_to_fd(xe, sync[1].handle,
> +					  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
> +
> +	igt_assert(syncobj_wait(xe, &syncobj, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait(xe, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	igt_assert_eq(sync_file_get_status(sync_fence), 1);
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	syncobj_reset(xe, &sync[0].handle, 1);
> +	xe_vm_unbind_async(xe, vm, 0, 0, exec.address, size, sync, 1);
> +	igt_assert(syncobj_wait(xe, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(xe, syncobj);
> +	xe_exec_queue_destroy(xe, exec.exec_queue_id);
> +
> +	munmap(batch, size);
> +	gem_close(xe, bo);
> +
> +	syncobj_destroy(xe, bind_syncobj);
> +	xe_vm_destroy(xe, vm);
> +
> +	/* Give any delayed freeing time to run. */
> +	sleep(1);
> +
> +	/* This should still work and not crash the kernel. */
> +	igt_assert_eq(sync_file_get_status(sync_fence), 1);
> +
> +	close(sync_fence);
> +}
> +
> +igt_main

igt_main() { now

> +{
> +	struct drm_xe_engine_class_instance *eci;
> +	int xe;
> +
> +	igt_fixture

igt_fixture() {
now

> +		xe = drm_open_driver(DRIVER_XE);

}

> +
> +	igt_subtest("sync_file_race") {
> +		xe_for_each_engine(xe, eci) {
> +			test_race(xe, eci);
> +			break;
> +		}
> +	}
> +
> +	igt_fixture

igt_fixture() {

regardless if this is still happening or not I believe this is a valid igt to have.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

with the changes


> +		drm_close_driver(xe);

}

> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2f5406523a4d..925fceb6b60f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -323,6 +323,7 @@ intel_xe_progs = [
>  	'xe_sriov_auto_provisioning',
>  	'xe_sriov_flr',
>  	'xe_sriov_scheduling',
> +	'xe_sync_file',
>  	'xe_sysfs_defaults',
>  	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
> -- 
> 2.48.0
> 
