Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745F7C197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 16:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DE210E067;
	Fri, 17 Nov 2023 16:24:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA710E067
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700238291; x=1731774291;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zDa0XrB9xenUraFChQ9Av5MdCWmI3qE5PfpLl1Gzbxg=;
 b=dbv7O9SUfVhvQKk9FU4PUbaGlHqpmQsF1PEPn61s+GF20tsEybd46nOM
 V7tnMt0R3o9lii04LCzayOOE6xJtoYd4XqjpQ3GF0oeSU+INBmT5wqT6/
 ptIuVTc6T/R2CC5jqdrQT/q5QTMPJNy/+VaSJa4jEDM3A2OgADOB9wLAT
 oGVmfRlnw5sByY1gvXQC+aSqvHh/796jt+NRvSaVXF6qx/QkuIXlsnygO
 6A4xOOmbkSm9Yu66Ba+DrE+d3rzaPqgAmRWB5oAu8m54jBtJJzCg9LPdN
 cgrNHyAHZW61ldtM0UGOfkMbirVyuHzkHAyqcKMEflnUAXkGOmwJn+QGd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="388474824"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="388474824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 08:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="7061889"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 08:24:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 08:24:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 08:24:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 08:24:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 08:24:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSVkz1ltJTKRdBppdG80/CNDeY8UZZL9ONdB00x+aN4GSuQdlx5ePPLhjPnrSen4KhIE7CyNNHCUtK6UzGwlPjW9QkxNr0ELiuIAKJqVzNp3eW7urIhmwR9YCiC1H+2xXUWQG5MnY9+MSpugNeLeDJe2BilYQqdPogTSMv6ZnxbUzP5XB3hehJXOZPHdL/vduhckUr7i6PPMCi7c6ks3UN/8lEVmTfnvNienXaShfo778rPFJbctqWyc+rK8Vr8TUMPEoSLM2c3TR0db/pbun97V62sL9xgzYtYBBEizkklF3ePpaJFVDQPPexJiaWAhtk8iZ0LGluglYoMZS4IY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tksFafdl7nZzv3hkLf0Fp1SjaL66gM2lZz0VVFQILMc=;
 b=S9k6CaGCTL2OC7Zp476FwSisxV37cO1luKxJPhyzjRTWt0tPImRNqPywunmyx4W48UU/kz8iuaKqoKHow0Tl8QSCzML2nOUXV72GwTQSuO/Cw30hyrQy1053Sb/82txoMS2fAUMp/TXpAV4y300kW6QEZNQM6ZRV2w6rBhi7q78uG8MJG6gFJVZL15RXaB+YpxLqypfgbcjkdCk74QnRl8TU23zT3niYld147bjRjRmjPJZ7YSeJPaflTsE0/XsaLv6XW4sze+i1XTZY8bGgYRNtcFNPbAQZfUVVli+UvYZ+JtKgwUh1JC15RtZGZZopWrTpMa58KF3exjalaOnkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5553.namprd11.prod.outlook.com (2603:10b6:208:31f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 16:24:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 16:24:44 +0000
Date: Fri, 17 Nov 2023 08:24:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20231117162442.GV1327160@mdroper-desk1.amr.corp.intel.com>
References: <838c405290912bb923c44b061d0eca4ca347f07a.camel@intel.com>
 <20231117040625.40843-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117040625.40843-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 1607e69f-8327-41dc-6d99-08dbe789b569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8uQwDyRVOf/7KIvE4nPFzg8nhlyb227nuBir3wumCqQKRqgsncWn9eM207zR+4e++u3OSy4kS9UA88XZW5Ww/xr1UckM/jfkjp4Lq4FqpTI7OpiixH72z9JF6nAa9ZaL33QvsNHKzGcUEsTz9UwcLHM3wIYHmgnz3pyWkaxfq41xTbyTP6O7dRRhye6yJLX0iIjbBamnnzCLBAlzQSfX7/8FlbMhfKHv/rsN7a8xcaK0BYELtIqOQXFKZ0nn5dAVokce1ZJWsYsiV9FGnodHdD9AA0jMR7RABim4Eghvld64CM51+VuDJz2TaoJ1fFNCwc4WSyT8DU0CEKHExWCm0I/q6me9mPkiyW2W1wOqEtDGAry77vBz0htnU6mtCNS050CdmM2WcovaoVJLAKHDlqPL0G7ySgFU1niQqY5u7SDQdbOPB/KVd/3HvnAZDVzRL+l+zlMYZeIlCvedik33tHLzFn3kWH8+RKU1Mj8trUQ43IdyvktwDOSnFgCaLkfQ5s40OMwyrfuYvUuuvVQ5ZLOPMRXOgDJshMri0W4Ay3wO6Wgr6M33hZke6DJW9tK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(5660300002)(6862004)(4326008)(8676002)(8936002)(6512007)(6486002)(41300700001)(38100700002)(82960400001)(2906002)(54906003)(66476007)(66556008)(6636002)(1076003)(83380400001)(33656002)(107886003)(66946007)(316002)(26005)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bbkKuEVDhFlUitMLtjRhH4p/0ryG24WYd82dcvFcgTXZSR7ZMiyK2yjIOz?=
 =?iso-8859-1?Q?GLp8eVgmVZOGk9RAM4vvcz1l+9dP7CYl4KhBJCAt+4Y8pyPxQ9GZp1F0Nf?=
 =?iso-8859-1?Q?vOtCAiWWoVLvkMyxdKYMCprqJw0KGXviwWF1tfQjjSoz74clHNmFHst9/0?=
 =?iso-8859-1?Q?YIaM2ChgQMODyClvzT/t58VZQhHpAPF6yuEjV5nJ77ZzUyqq4BT3F74cHb?=
 =?iso-8859-1?Q?n3egqypMuxnXxvGWC4a6Svi8vIr/dYICYvqqXyrDJoNq5rCGqUWsLXzHG7?=
 =?iso-8859-1?Q?VW+/zv/qZhnW9byPs+NX8ya59uliOAMqopQpu0rBvUuZIucYCelk9F1Cef?=
 =?iso-8859-1?Q?I88tKFDUxIKmfQoLofrm/6reTM+9AYr3Yu8evcT7xeRD5nit77fPtjbl5L?=
 =?iso-8859-1?Q?d+lAC4p8Rikep/6J0kBnXttXUnTu4OmgF5B8eEFirfHmzH1ryCJ/NGmlvR?=
 =?iso-8859-1?Q?BEChOX9HPiIyRGS2v9nNzz/pW6HbUg1uJcPwkU+MbdZRNLKt5yfWsHS3NQ?=
 =?iso-8859-1?Q?qoELY+l6dGaQ8MlGlMKSu3zoimPcVmu1ShacUT2TymBQcy5zKOqbBQPfNX?=
 =?iso-8859-1?Q?sQQ86yhvXXBSALIHgUyciVdxI4a1R/DXxvhcZj+Tbi8VFA3KQhCcumWa/c?=
 =?iso-8859-1?Q?IB2rt1VcplZiK8ibQAxmWRhENhH/fCwH5UoL+kRgpFS7uZ98YbYL20F4Op?=
 =?iso-8859-1?Q?Eeh50O94JRzeBlQYH4DpD0ZJxivlOf6Y35xzeB0zK3trSaIWp8glMOuNlD?=
 =?iso-8859-1?Q?XD6+tyWezwx+y90WQwvNSwihyWB4mu+E5DH3v0qUWhvSoowk8eWTHHv8lf?=
 =?iso-8859-1?Q?j8S7FIrVQRK/K9y6hxzW3nbr2oRaUqasB7gR8H4zwrw1oiCiSITjzkzjHd?=
 =?iso-8859-1?Q?TgyM3jE4NoS9VzeXYQjt/m2mKeCmgElzHqvt0MASJwI0eTPUhYHwJGVfPF?=
 =?iso-8859-1?Q?iMrLn/aW8/aIXczx+imCcoAqorx0RwqMqER6cRaDqLoe8TRPbLQ0ARgTfD?=
 =?iso-8859-1?Q?mcSO/vasc/YOLkpaTtf8dXcaxu0qLikJdDRQI4h3Nc7EegegLL5GZZVrOQ?=
 =?iso-8859-1?Q?gFT4gMWD4xFz+VG9IMjZ/o9mEWcDygATMsQeSIAGt+Gi1AMW6ZmqH5LpaK?=
 =?iso-8859-1?Q?e7EApGH80RPIKCm7FBNwio6Jpj2ozQBkTz5BO27eDW1oOVwt9IhieKlKYI?=
 =?iso-8859-1?Q?Nuck1S7aSkoEDalX7Wzp4QFHyozIxU/oQkQSHNH+TIXjEhwmSJFr+K8bcM?=
 =?iso-8859-1?Q?rpRPDWkaW8Kq8/3EJr1AOKhd9CXsy8NQajk4HYPC4928cDcYdr+Hsdht9i?=
 =?iso-8859-1?Q?5qZr7qyoHmhWmJ+t6X5j8btc9fFcmTOR7PTCJIXqfALBB1nKh87DMTe/hx?=
 =?iso-8859-1?Q?3SjXNnEwCYNhip4Uy2pqR4GltBc55Hi8V7Y0ZGEGuPoZ9poxB6+L1Eo8ZL?=
 =?iso-8859-1?Q?dhvL064Sc4o7bL+gWXMSrN8dnvLIX++XfB0cEjmcvv+18KQZcpUfIpJR4i?=
 =?iso-8859-1?Q?nquJCq9P6E8y8eI8ImlToI71HZyRV6/32TIs2GxppLmH/DWtig6bXodcRi?=
 =?iso-8859-1?Q?IojzSRXj0brO7p1quFFDHRSqYeyp1jlJ3ehTYVh8VVcWr+f3H21dVGejNC?=
 =?iso-8859-1?Q?u0oY3d0NT5Dggz4CRw3NNsDefZaYeX+1cLH5kHZq1y85a2Os90kT7p8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1607e69f-8327-41dc-6d99-08dbe789b569
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 16:24:44.5130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG0Pmmms/qnmCKhDIuJh2yYpBImQmqVjOkklekX8w0RuO/uHhrdtllG0DZ2GPZYPTXJtz25dwxA6GW4g5OnHMZ3STNbbsksed82cA1WlZpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5553
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Fix various struct padding for
 64b alignment
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 11:06:25PM -0500, Rodrigo Vivi wrote:
> Let's respect Documentation/process/botching-up-ioctls.rst
> and add the proper padding for a 64b alignment with all as
> well as all the required checks and settings for the pads
> and the reserved entries.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_vm.c    |  7 +++++++
>  include/uapi/drm/xe_drm.h     | 14 +++++---------
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 838f03795841..77c3afeaf4b6 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -277,6 +277,7 @@ static int query_mem_region(struct xe_device *xe,
>  	if (perfmon_capable())
>  		usage->mem_regions[0].used = ttm_resource_manager_usage(man);
>  	usage->num_mem_regions = 1;
> +	usage->pad = 0;

Why are we explicitly setting all these pads?  The important part was
adding these pad fields to the structure definition so that both 32-bit
and 64-bit would consider the structure to be the same 64-bit-aligned
size.  The kzalloc should always zero the entire structure correctly
now, making these additional pad clears redundant.


Matt

>  
>  	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
>  		man = ttm_manager_type(&xe->ttm, i);
> @@ -335,6 +336,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  		return -ENOMEM;
>  
>  	config->num_params = num_params;
> +	config->pad = 0;
>  	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>  		xe->info.devid | (xe->info.revid << 16);
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> @@ -377,6 +379,8 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  		return -ENOMEM;
>  
>  	gt_list->num_gt = xe->info.gt_count;
> +	gt_list->pad = 0;
> +
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
>  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> @@ -392,6 +396,8 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  				BIT(gt_to_tile(gt)->id) << 1;
>  		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
>  			gt_list->gt_list[id].near_mem_regions;
> +		memset(gt_list->gt_list[id].reserved, 0,
> +		       sizeof(gt_list->gt_list[id].reserved));
>  	}
>  
>  	if (copy_to_user(query_ptr, gt_list, size)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f8559ebad9bc..6e09855f1e2f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2850,6 +2850,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  	int err;
>  	int i;
>  
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, !args->num_binds) ||
>  	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> @@ -2966,6 +2969,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		return err;
>  
> +	if (XE_IOCTL_DBG(xe, args->pad) ||
> +	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
>  	if (args->exec_queue_id) {
>  		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>  		if (XE_IOCTL_DBG(xe, !q)) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 8610ac461619..777d2564bcdf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -384,6 +384,8 @@ struct drm_xe_gt {
>  	__u16 tile_id;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> +	/** @pad: MBZ */
> +	__u16 pad[3];
>  	/** @clock_freq: A clock frequency for timestamp */
>  	__u32 clock_freq;
>  	/**
> @@ -662,9 +664,6 @@ struct drm_xe_vm_bind_op {
>  	 */
>  	__u32 obj;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
>  	union {
>  		/**
>  		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
> @@ -744,9 +743,6 @@ struct drm_xe_vm_bind {
>  	/** @num_binds: number of binds in this IOCTL */
>  	__u32 num_binds;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
>  	union {
>  		/** @bind: used if num_binds == 1 */
>  		struct drm_xe_vm_bind_op bind;
> @@ -761,12 +757,12 @@ struct drm_xe_vm_bind {
>  	/** @num_syncs: amount of syncs to wait on */
>  	__u32 num_syncs;
>  
> -	/** @pad2: MBZ */
> -	__u32 pad2;
> -
>  	/** @syncs: pointer to struct drm_xe_sync array */
>  	__u64 syncs;
>  
> +	/** @pad: MBZ */
> +	__u64 pad;
> +
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
