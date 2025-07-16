Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD4C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 01:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B4D10E652;
	Wed, 16 Jul 2025 01:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgd2s8Ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045A10E652
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 01:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752628136; x=1784164136;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Yunre+HvO00fjHs3Z2lwqgcvfOdrIoodzqik3ES1nU=;
 b=jgd2s8EjKychFohlAh5p3OwaH2ImOgSRAyFnLWNz0RXc50EZB6NRfI9F
 KbOuwRIZQWw5Wkz+yQ/WdOrDEltxriZ4azYlUDLjfsBZK1zYMCFzNCq9W
 UfaaYmhhUDKs3S2ab737Ku5LzZnXfPp3bfU7VDNn69oEBzRPWF6hkcYnA
 AGJBPJ7Im5DtMNvQeH2MrTy5yJITrshcSGPawaGESR7ue2D4IP1b9HbNh
 2eevefVi1cX+v20J/x3flgDDKS7fpIS6veUlfTvJog1dgcxxIOYsJ8zY2
 n9KijLMrLuu4V3/ntDoSiHjAEH4psN40NOVX9SSv2Hv4L/0dysxxh1qU7 A==;
X-CSE-ConnectionGUID: aEN0MSUHTFKs5ymYX9jl2w==
X-CSE-MsgGUID: JuhwV964QmaixPi/GVTmhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55008160"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="55008160"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:08:55 -0700
X-CSE-ConnectionGUID: CVmLTwt2RhO7Vc6Ln9MRmg==
X-CSE-MsgGUID: WwPOM9qLTXqhAq9UgdnJ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="158089251"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 18:08:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:08:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 18:08:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 18:08:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8RZxKJ0/Qc2XEY6752zkruifDwwJOKeRZwBhQ28cyauRUj2IG0EPsi3s+Nu3gWBluwzlB3OcmjyFgBSQH3s8OnmWAbUVvcSaWUrAZTkZ6ZW0I7N9aRAIR9K6wtnysSEFqBmjm/ZR2zifyntjfoKEVWLIaGRxGj/4TcDP3X2XnmxwsH0dUkiOE7HxiQ3j1zqJ2KkdAOI5SdzQoK6KvyRxErcTZCcRhH55Pphlvr4jTgCdbAXWXBLV0MiaEapRhd0fwN9cNi+9ShlzvuAwJMXqEJSR9iB/CQWlUnGCEsF9KJrYu679x4cK+cJmy93oRu2xz80JZllys127oV4CyJKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0dEaJJFultszZ6NfxG8zYpcgUvGgnlXcx0mP+MY+6c=;
 b=uHA9cTERKVJ3frIMckjJFHE41xp6i36IlfWHXIRcFjExBzHWFN/OowwbfMOeCNsKZAJGF/hi6bBwvIGhYL5n4y+/GaLkiGnv/d/3E3/tBeq1eJI8NTXOjJkMhpGunoNH4RfcTvIeAonA1tAfdoJlRVt9QoC65zYPkyz2cBZ3xFjutpFRlzI25F4heYyr0NcERj3+W/37k2+XSy1W5BeHtXT36nV4grezTtdim5v4fDIrdMYYkYizn87r9mqWw5V1rlAlnQFphV8V2hbOPl2i4Rr2iwrURLFd+UoswzgvSn/wOQXm133yCfgSsh0zzskQQjAtcjBy/9nFoqnLQX+hJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 01:08:47 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Wed, 16 Jul 2025
 01:08:47 +0000
Date: Tue, 15 Jul 2025 18:10:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 3/9] drm: Simplify drmm_alloc_ordered_workqueue return
Message-ID: <aHb8B57zBnlBWug6@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702234222.3278264-4-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c12a0ec-fa2e-412a-9eda-08ddc40550e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uzXxA9/IuDQ9WNKbSFyVgntNWdyy4aKx62UB/8V8ZciNsmffoYW3kX/gCC5Q?=
 =?us-ascii?Q?sn9bnRtWFO+vScTlfah8DFSAVxIEfyZEfNJaNAnxP+mM5mbOUNU+bCmShckt?=
 =?us-ascii?Q?mJnDA7ws4pIFR3VgZKW2cprWMl5auY2bStUumse38UXAWI/6Y1XJ0S7suv79?=
 =?us-ascii?Q?A8t9VFePqIHqVSTDePhhJwaxxOaouwN1cSmTrbAJC4qp8hFHhGQu3NGhyNEq?=
 =?us-ascii?Q?1Q3HQXH0qSmSu1WyqMZs7E7IAU659I2SM1ahO4vo7+wDyQukaTlhzO2wErD2?=
 =?us-ascii?Q?oJGJr2tj7l9XnUH28e3dyzH+6SEMo8iy0E8RDYgQoiAI23CvGIOMc6nETqOe?=
 =?us-ascii?Q?kpiXHVk8l7iy1TVZ+hhV9iF/0hSFEsogEjntbtp5neC4mmSblVROe7mYoHbW?=
 =?us-ascii?Q?aqVsZeRMFAlN2ksu5Oa+wrh5baqZ5CTpBDHE4fKvjOQIN+E7EI2/BWkTWQgQ?=
 =?us-ascii?Q?Y1kUYG6qp4KMmwj6OYdTqJJNcoldw3oprTa/Icolb53QTIwkwm3EJ9Wzsseh?=
 =?us-ascii?Q?bcE3m8maH/4LKcu9zHdM4nmb9hEEHin+AqgtJ7RQau413NoiMV9SDl90YFAd?=
 =?us-ascii?Q?CfBpLYxTZ0qS1B66KO2QiCaYxB7hDOdr8DAXZPR31uXCsl5VMjDlTHjrtK5p?=
 =?us-ascii?Q?g3ThGPOIRy4NhSE9Y7qcBcnJvpeKm91rk36BmZVKjfSXuIYUBPaktwysvGuF?=
 =?us-ascii?Q?FUERWqpJRI1UkJCKU9Taj0OXmodatW5QTwcjfdgZq9VlsUUf9IARjPC/OTpn?=
 =?us-ascii?Q?wiTqW3tcVO1m+vmn07L/zNabOpbAR8tLziyZpUGMguCX1M0Gh4VhENUrLp8v?=
 =?us-ascii?Q?DMb4aQ9cbMtq9MMqa/UxkLsb7hQgP0bwl1oh5WkKZI+1MD5rrZ86jXPyO0re?=
 =?us-ascii?Q?mogm/s9OkWadg9LFYP+C5svsQruoVzv3/h+DbTbolpZbwgP6kLleDrwy/1I8?=
 =?us-ascii?Q?8pjkCxVrGGyyleY3JUvw7RL1aFqEyFM/tFtAwBk9LAn/WIeOoVCoR8ouA08K?=
 =?us-ascii?Q?+PkO0I0PrdIQkZrQnDIfq+cYdrPQ69BnQWawHoiihKE9Bnyk57UF9tfMMSJf?=
 =?us-ascii?Q?naFXk/KWqH+V9AOgH2KIV/J66IPrEpxSha2ofTlyv2Xm9RYKw39gkAcBktk2?=
 =?us-ascii?Q?/dY/ddnGrl+r0EUaG6SBDT4pyeJHVSz+saLc7Rf0w54tZWmbjv+npnVtonW+?=
 =?us-ascii?Q?FZJCxoxH1/ffjxeGa/cGc/TuwIYZ5Mdh8rJ2srmloHgzWvo828tXfUQ5QTBx?=
 =?us-ascii?Q?nJlXiNoVh1ag6Tl9i0Lbm51n+pr/MHOR6d/6B5080Sf8EekT50I2MZ9ms4Kj?=
 =?us-ascii?Q?6iX29q+picM9TPme/PSVNq7FxptVK4UaND60BSfPosW/oJ+6oCKa+F7AjkLP?=
 =?us-ascii?Q?/8XNcr+mXM96KkWe9pTXlFKFKYiprYPBUGzO97Nt9GDClpYlWxJQp1GKvqMo?=
 =?us-ascii?Q?kCiJEFRsStg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7fwjzO79oKN530SJETT4KAbF/lLjAl4zKhUarU/yYTTsPO/MJdjZe0uKta9?=
 =?us-ascii?Q?hk7yaf9+5VXVTDIWMcM1qkiownx+QCvl4WDz/TqRCPPuTxbjbGv8LlHJNMYA?=
 =?us-ascii?Q?NohsGVhRU+0Ovua/ZS4olbFSyt3UjOt5gbKvfgdEDf+cMygxz95Ny0PMsjbO?=
 =?us-ascii?Q?GiF/YA6LqSH7cCvYxspzb5EKX20W4Rb7q3v4m1FYkBw6FgBwp6CWbuLm0W9I?=
 =?us-ascii?Q?XwI3uyAZ8P14hiLGzG6TEgXa+QE8g0qwuuOEICEB0QwOjpDMxSihmG2OOHEc?=
 =?us-ascii?Q?kYZaQV/Vgt6tcQpskkaB6jOgt61mvnyAaGKO5RL4R0hd9iAQ5BzzBMrXs3zy?=
 =?us-ascii?Q?b3ftxE395zgy75RPGOGIK+nOfTiVKqjZUvkq3+4xzpFWcgP4t4hj5EGwa/EC?=
 =?us-ascii?Q?Oe0OmHbnOtnPKvzj+GR5MNTslsh7WokJjFJFcliXdT0nAwaW3I/90W+s2joj?=
 =?us-ascii?Q?nEYUBht9V3qz6Mj6ThMBxxJeiviPKQBWSBvNhDvgWchBvfeaf4zS8bkEW17s?=
 =?us-ascii?Q?OfKvrC6bMJtK0EjTiE/1EiqPBFdMvFzVwGSJV9YZBm6FayotWYC6TAi/XgaO?=
 =?us-ascii?Q?qY88L69I6tzo3caSifOfb+zQuIHMjEe8nwiKlqiK6LEXfyUvdGUT+ML9x/ox?=
 =?us-ascii?Q?dwtbuN3odG+ex4tSGYhLUcNnmW6vJM3PigPcD235Wrs0BYLhfV/X9ekj54bn?=
 =?us-ascii?Q?8m1r0Cw4Qn/lO9KbH+9A9xv2sY5/msT1rYjJ0xJkvmWH+V6+bc3X+RISh4Y/?=
 =?us-ascii?Q?xYibTz4JljMXkPZIGZNFBsKRd0psVfhjomXJU05XWCNDAw4aQ7yRBpfkMFJ+?=
 =?us-ascii?Q?zKNgMAzLNWiDkQbnlTbIy/AfbXu1MQG8TGKICTuMZrpJXCSYzyl3tvxYhlMo?=
 =?us-ascii?Q?hh2XFKtBw/zBWrMsmHV8qKpO56S5COqlYLH/3LttWkv7D2ueIPuRhWzmMQjy?=
 =?us-ascii?Q?81FCAWPd/rynePNADnzg9NeGyD7rVU0VSk+Gd4wH3wDjdkYfRTZ/HUQRQ/UG?=
 =?us-ascii?Q?wNv16aT4Pt0KVOXjYyInbeUkxNQGJfq2JBY/3XQvW0fShjuY4unMzJ9wqZMC?=
 =?us-ascii?Q?n7jqf6aRIl0XPfV9v2myzt8Ye6xSXSfLOtTX3dOOmS1j4v5OpURrhA9xyQHF?=
 =?us-ascii?Q?QBRtluuvRzXArX3eFaZINLrFbLjsUhVSrq8Xrp55/+952mZHhOPQxfgznCft?=
 =?us-ascii?Q?gYRPb4JlyuWRTuHW2i01sRYrlpiv0WvkQkb7jgO7kEWpXBSYDog9FYDuNovQ?=
 =?us-ascii?Q?bFlxviRXdKA9oMialRx/3LUvZlYjDBOIG3zpOnNp2K1opJ+qRojdrxJ+S+2i?=
 =?us-ascii?Q?1Vr6vQTGdUBfeCUyb4z/Vmi3IUW+gKyJm61Ed1DW5ZIT1EAP5PqUFW3B1GOo?=
 =?us-ascii?Q?brnNeVZWsWEtk58nu/ZBqtQ6IrLKjngifUUCLCDjpu4n7K4iiH8O6hO+A+F0?=
 =?us-ascii?Q?G+0neemZwxkHlhtyjje3KZ7rymLhR1PdP7zJ4LYxyMH3p3pOVjOfgxTg8wrd?=
 =?us-ascii?Q?Wui9PrPrYFZtGqo429/Ig+MS/eJx4kCMaa0957V1xB2kBVyZgVpBuinsMQkk?=
 =?us-ascii?Q?MaVAMjyjWnTvlhqcUUDrscszK2lO3RYdJ4/0AjVl5L3CSjTVtFqjpVnUM1Fa?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c12a0ec-fa2e-412a-9eda-08ddc40550e1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:08:46.9660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eA+gIO0/F4mIT+cu4KCwf37SAKwIUd0ZNDSeu2kZUxmndHmaAGIalaKS5GlMjRCwCQ51gcKHqjs2rkVr2eRRFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

On Wed, Jul 02, 2025 at 04:42:16PM -0700, Matthew Brost wrote:
> Rather than returning ERR_PTR or NULL on failure, replace the NULL
> return with ERR_PTR(-ENOMEM). This simplifies error handling at the
> caller. While here, add kernel documentation for
> drmm_alloc_ordered_workqueue.
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This one is already merged through drm-xe-misc.

Matt

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c |  2 --
>  include/drm/drm_managed.h        | 15 +++++++++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 8c9898b9055d..e60573e0f3e9 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -302,8 +302,6 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>  	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
>  	if (IS_ERR(vkms_out->composer_workq))
>  		return ERR_CAST(vkms_out->composer_workq);
> -	if (!vkms_out->composer_workq)
> -		return ERR_PTR(-ENOMEM);
>  
>  	return vkms_out;
>  }
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 53017cc609ac..72bfac002c06 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -129,14 +129,25 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
>  
>  void __drmm_workqueue_release(struct drm_device *device, void *wq);
>  
> +/**
> + * drmm_alloc_ordered_workqueue - &drm_device managed alloc_ordered_workqueue()
> + * @dev: DRM device
> + * @fmt: printf format for the name of the workqueue
> + * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
> + * @args: args for @fmt
> + *
> + * This is a &drm_device-managed version of alloc_ordered_workqueue(). The
> + * allocated workqueue is automatically destroyed on the final drm_dev_put().
> + *
> + * Returns: workqueue on success, negative ERR_PTR otherwise.
> + */
>  #define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
>  	({											\
>  		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
>  		wq ? ({										\
>  			int ret = drmm_add_action_or_reset(dev, __drmm_workqueue_release, wq);	\
>  			ret ? ERR_PTR(ret) : wq;						\
> -		}) :										\
> -			wq;									\
> +		}) : ERR_PTR(-ENOMEM);								\
>  	})
>  
>  #endif
> -- 
> 2.34.1
> 
