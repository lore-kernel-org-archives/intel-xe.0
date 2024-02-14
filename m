Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB4C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 21:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CDD10E557;
	Wed, 14 Feb 2024 21:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/ngK0Cg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE26A10E557
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707947023; x=1739483023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xne45my7qQFdsklNj2VKghcbvi33jGDnj9fcVQNgsf8=;
 b=h/ngK0CgL7LJJbZ83ytIGZXwOGCVmBzNswasV6ox3n35iUHqSYCSjCWK
 f/rirlrfhoAYCLgaGnDkv8FgkGQopHEilDy03yVH75MtkhiUmIvSZJB7/
 TsFZRZtu/TkaKqwbJoBwYEQRahw6OUEnSJ8SzWT2XoCGtnRKivVjEnG5K
 LdORU09Pe/d2ZYui+jD4yBcPRbULqw1cplLkY1dv4CU0699jBuMcAaeCi
 p6UlE9+55Rb6sE2jdfBL4KU4q6StwRznZrLQhHPlp3QAT39lDzaeU+nMu
 XcoGzRgg8U/Si0KMPQBlXcOzk0kli+ANGQDLNQH7nLYcm/IDCf4htVHtv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2143472"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2143472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 13:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3665431"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 13:43:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 13:43:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 13:43:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 13:43:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 13:43:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLCDiOEGW8kMwnRuizoEHSkAdyYFxDIAJm0qqqCy8R//fNnSCb4jYCsEkOtVMNvGsFRsKDurPlZ5xQTvh3IWm+y825PhrbLaWZ2dYYBVT0eUlWAfiBSFhWhm2Z6pJT/6ZvYNHoOX53p/AvqtqlP+JtzFSjErviG8EIph7QVd+dOlUUiwXL4XzvMYdzJsasJsLP6AgEL7u/TnlqwAOESdm9chUoBCM8I8pR3sV8TfLpbecMzZGZ9d30+I+5aUEmexmw1Ga5YFTUqLgymE5PItHVRqERYwFYO9layYDHYT3YYrW0MyUajlmP4xk0NtdWPax/pMhYPZECIQoEhuZ0+p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXSWcBvBM/ZctT7PIWAlcX2z002X3yKeqan+pdbd/3w=;
 b=nTufXmY8TsAXNcoyWNuBza4EBrGRkOw0pZM/DgiGvEtQsCqHjm032TsJLiLxJiLhCedC3iiNUa5eaMNAGCyVqkTTtoa6CMUw6hOd7ziyaXtYN8kyOKVi1AlWxxMd1HVT03dZ1VDAwe+b6SAzyxyvpgCZWaYxWkTVFgPoQyeYd3eVypBLTe9zi+8jMXGHflynrKecyii2VCIVHWOxh4J9lHDS5FDLdAMoZGAAra0GaQIPO1GCD4g8dz/GpTvYas9GonFU3jn0MbqxVbMmbaVhjC3TmuhkRFAW+A9ZQUmGe6+g1/LwMTRZTnu1rfdePuNg+QpDCJbdsgSxB4r1niPpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 21:43:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 21:43:39 +0000
Date: Wed, 14 Feb 2024 13:43:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
CC: <michal.winiarski@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/2] drm/xe: add a new debugfs file - mmio
Message-ID: <20240214214337.GH718896@mdroper-desk1.amr.corp.intel.com>
References: <20240131195953.852641-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240131195953.852641-1-kelbaz@habana.ai>
X-ClientProxiedBy: BYAPR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a80fb2-a2a8-469e-82ab-08dc2da60187
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/5gmEpOd8lyLE7EPgnKx5uTyM8ojSiM+JYpOgcmZ41ANkk/4p2ZGKvIgX2pZGIW48NtT1FQm/rtpvgvR5dkFeyTMFbN3YjmbpYDtboL1S5W8nUjM56WFQ7ETbnpF7mjNY1UWYdrOFhQXir91jlF0v1I0qdl5t4IjEJJnJvqeKRcevCrwk0hmNW6YkgfCHkepnDQiWSB8i1uMAIo1SFb2hc+4kbbedvEZc4IQX7ACNxGbltuKj+N0dSweq3aNnSPE4fN9WVt2m1hX5alRQkaUbH9CUfQg42zRlMrRkfKLqLo4gBNtYJP3nq16SxjRnZg7lFkc6MJmO7dov8Apn3oFqUzhtan5icMEbp/sBjm200GdJROaQRhllTMzVEFUeeVZDpYpHc2e06LeMnOCtg+2oy8CNE4aBfN0S1l/OLADu1FMaQXIvFqVjMFn7lAQ5KU59mdA3KPcexw5MpkjxZnGzz5EEA7IxnRnWuUR1qusremMhiz3CxqI/9eKdxIRpmeB9/dl6Tewvp21/12UrPnXz/nk2Q+lUWfTdf75koDVSnXvAJpLokwQYohlEW2apC3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(8936002)(8676002)(4326008)(5660300002)(86362001)(83380400001)(38100700002)(1076003)(33656002)(26005)(82960400001)(66556008)(6506007)(66946007)(316002)(6916009)(66476007)(6512007)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qYSO5MRa+t61BtDz0lZK0tYyoKf8oFTH1QlF+VYcGvYwFgjBZPSZaQwzZ2v?=
 =?us-ascii?Q?a5pR8xaNbyKkAQX0rFhwgXMnly5/edNa5LWo4T8BLtuZdpikkxAgfjRo444V?=
 =?us-ascii?Q?GrL7rxQRKZCz/DLhN9IoT6BK/W+TzzFkOk+suD5j9QrXwkbjZZL5fY4gGBYI?=
 =?us-ascii?Q?tB1G6OB6AUkez6tdkPe+A7D7RPQmPbvxusRadc/QFwyGC9CkU10vqlaHKCyV?=
 =?us-ascii?Q?2rNRenWZI1BjIkDdhSKX9yI1yU2E9B0aX51aZ32nI6R+yJQ6l2zMfAXbZN/A?=
 =?us-ascii?Q?DGQFcQcKq+gE4VINmwwaF5Ag3dXfd5D5dhiHFzHKt9gSJq0JFpD0idMBpz7i?=
 =?us-ascii?Q?lJ3HPUtnQr3neHZf/flZJiWbhfDyDqkzGWJmv5Vzz7/PAUq/Dg7MzdsCYlmi?=
 =?us-ascii?Q?XtOE8JEXuDOrh+wxC35TE+OU36i8LIweqLsGUPN3LykZ63dnVxWJE+JTR3yn?=
 =?us-ascii?Q?RMckYeEKLJl6Vq3f1GmssClZOc5qR8xrE19g4Sctj64kr2k8wsL6MbZLoMPc?=
 =?us-ascii?Q?6oyVtMae+tXNV3ODkZnO+ib3jOW8wRdc2B+l41qlVSZ5QmWTogiH1jqTDDzv?=
 =?us-ascii?Q?ThnPcs+r91JSt/b1vnWbVm7mXFkQGe1wTl9ud56C922JJ/YqZ14o/J3cSayP?=
 =?us-ascii?Q?NDIkHi1MGNKihuXCN5IRYqTOTwhRTBuiczG4eQlE+MbLS5wveMGLKOxXCGwl?=
 =?us-ascii?Q?f8xMwhuCsIf/P4Ocm3zbcLZ6YEQbi1oIUHsbeETV6icjZy3M3+ndy1HAaduK?=
 =?us-ascii?Q?pLRlkacLHxNJEAU92mokGGMZBUrGL1ZSjS/k+zsm4aNKmUlEeYTkD8mh+WtQ?=
 =?us-ascii?Q?AV9kCifnx52QfehylTckxLzexkGYzTqmmaTwZnymMvUDc1dJE1dkYsgfH0Vd?=
 =?us-ascii?Q?9jsHlCFgOUwiRRujsxt3dugJVHkIFUZeDVfSAO1gDgDqRK/dGJWslnmj/a/E?=
 =?us-ascii?Q?fnA3Vujz4u91m2p7nActztryGUpVkiwR0GODO9/qL0WctKE2p9CJjWKqwu2d?=
 =?us-ascii?Q?tj4n52wmqzStH3wSqljpCthLjzc2JMXB8+3YYuS473DOUbaHYUyKb7pylmpJ?=
 =?us-ascii?Q?xmjMSeLoFeXqZZQmu0oOmf096WvJTXIar8Pknlb1WTuxIYdYEaUTO+PXXIyQ?=
 =?us-ascii?Q?RQtPCSS3BvdZAV8bxRx6Kgtp1Jkg2iXejQO09Eg5NyMW+w11j8za9yfvW13z?=
 =?us-ascii?Q?4BJ9BnXzMRmqeIbk3G9+B/A9qH2n5qMJdCNWsR/JxQXzr5Blxgq6C/s+46py?=
 =?us-ascii?Q?BWJVO/8qGa9MKofdFZqSV5wCT7iNqWnQLAGFK2/cfiQzdJ1KQ8f+Eehjplkf?=
 =?us-ascii?Q?k7YmbZlS2Xj+MhhFbfMsZfDAxA2PsoZLXKNNdHEFWoHynw5DhxGGhBf0W6tp?=
 =?us-ascii?Q?K4XUxE8QVla3KsddZky+ZZHvVUH4gw++7+tyG17Iw9iRoT/UXB3yV7FHAyfv?=
 =?us-ascii?Q?TxYCbuTFW4TnUgrWhK4ENfvrhKVMLKKqgm+10Won0kN3AjDJXM3N3Jqp/pdp?=
 =?us-ascii?Q?lLFb1A0zxZRE/8xBfQmJBHawk/tSCaAlSam4FVEW9i90m9Y1XMMwfZi7NBPU?=
 =?us-ascii?Q?IVgm8homSqGycXCVYuOWWLK9fMpJCanzowV5PWDHfTLCFn+Qn6g80X2uoA/L?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a80fb2-a2a8-469e-82ab-08dc2da60187
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:43:39.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaWBfHo6Y7bMbCEtYbNVzHJsQzTXZxV3Pr1X0A0fnwRdTBVlXJ3JyK0AZyifsSyyo2nz1soAVTTIgGlW9XAeeCwfyOqMGvzE7nM9Ti/NQnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

On Wed, Jan 31, 2024 at 09:59:52PM +0200, Koby Elbaz wrote:
> Now that the former mmio handlers are fully removed, this
> debugfs file will be used for mmio access (read/write)
> through the debugfs ioctl file operation.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 01db5b27bec5..21b2257aa3a8 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -98,12 +98,22 @@ static int forcewake_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
> +{
> +	return 0;
> +}
> +
>  static const struct file_operations forcewake_all_fops = {
>  	.owner = THIS_MODULE,
>  	.open = forcewake_open,
>  	.release = forcewake_release,
>  };
>  
> +static const struct file_operations mmio_fops = {
> +	.owner = THIS_MODULE,
> +	.unlocked_ioctl = xe_debugfs_mmio_ioctl,
> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -142,6 +152,8 @@ void xe_debugfs_register(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
>  
> +	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);

Do we actually want/need this debugfs at the device level?  Wouldn't a
per-tile debugfs be more useful since the offsets that we provide to
MMIO operations are relative to a specific tile?


Matt

> +
>  #ifdef CONFIG_FAULT_INJECTION
>  	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>  #endif
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
