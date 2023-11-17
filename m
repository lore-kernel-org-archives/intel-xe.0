Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD67C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 21:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD09C10E796;
	Fri, 17 Nov 2023 21:37:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65910E796
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700257066; x=1731793066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YaRyMpesUqrChv8m9VlwEzjl2wYmv5oWwletGHOAUbU=;
 b=Eks8WKuBQpgfaUa9i6+kBMiOzlzXUDNRF2D75an4B4UMaXz/8b06CEMh
 aSKzrFL778EcUGIT2K1RQfHbhq0McNZhNXfXgwsOQnjryr4Q5YuJsBc+V
 yiZnDzCKoYssOjVOFTM0tYHgh1heLorz8Y5uS3PM1oJyA5plYEl1Hkcm7
 EMN6Z5MAn2myJ7qOE0njTpflVdfwUlePivVuj1opsl3IFRinSz5VvA2nj
 gk/lEi6kHG+uMfrW4frNV+L4LPdTiPNqmxm4viRDqciYZwdgBUV3I/Gwc
 D40sD16T0KTsOQF/E1zJQ6q+Uihi34sXFkPVxx3ufzLXQ/Q0czJDca6SH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370723115"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="370723115"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 13:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889365384"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="889365384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 13:37:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:37:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 13:37:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 13:37:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 13:37:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH3+nIWoSvuzIF9M/X5lY76hiNvwGrfWakQFapiKtADI2BEh21sczaYJ6QgTHalgcy+cDcVIEZbrQXt4NWti6nq8qNI6uTH0R41/Zoq/GHk8RiK7XTDSBzHJBaiCeU5wIRJNThj+nQVJEgmAcFJ4SAiaCoD11i4jEso8dr78qclAnPNrKRxaBLPWb3wJXSFhtxxzt5MJnhZdLObi2uEPjGxIIy749IxArISM8QvObf00WcoOWI2jjWR0p4LSyIxzRDZVeblnD1bW1aqfqkjOzX7i/MD7F9mC0nM4vHWso+ESS4wz8R2iCjxnNAY9oPWCfPdvihUPonRs4OwlbK2USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKOIqXFSWaRYqs/sdxF6m4Fjra2sLLxjVShYdOIMp5U=;
 b=k2+pFLm2ul3bjLP7gQ6WwGqc053M50d4VOXFEIC4MFpk/BnjC57L66R5LmetBLKrHXJE0iausnh6+DC0Wnut9BLBJVVMu0rNSfb5GyU3+moSsWz47pzzfnluYN6iAoZlwoxljwJgAi5aNwOYQcGOgkbfcP1rXCMU7WLvfbMpkyyRNhR7w0lJpgci7Y43fn19AMviM+zkrw9ffQEaeDx9GA0sZUKyLnZ2RHZDWdmiTX4/RRfO2EfO9b+13BX5Y9psJUq/Si1nG3YGevXIpGTEF0du/wNOjNsNo2fnEKO4yVcZ2nKO1NSexIZ26P6euF+JNnkqA18fV70gafh7e8zUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 21:37:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 21:37:38 +0000
Date: Fri, 17 Nov 2023 16:37:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>, Brian Welty
 <brian.welty@intel.com>
Message-ID: <ZVfdHp1M0BPtn457@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116143043.908412-3-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8655be-c0df-4f85-e9ec-08dbe7b56b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fff0wprghmVeImHjZcUSu0RG1Zwf35lbusjMPO5M9kC4ye3yPFtTfLuVrGDTmMFhDy3nt/OuwxJcK0GYXwTWU7f0DSMm1660jD2w4axgTdWI+G8RxBWty7BzOIK70o5VmKgOwH7xyLYuCd1AXgRtcRtcxokCCOYvm3DRow+4kJhF9mxEcadMoBdRy8pcQjqU7sn9aHK3C1ZyuOxh08RaqP6ZrFveZmZCDYuAsss71DIW3LQU5ngYX8WZFOqlTHYoHc7Jxh8wvfYoOFA4rBVbmOebsr0rpj6kBSH/IcOrFeLVyuPAPHsDKx4lJsrP4guBErKbiHKcqOTDBRm6UCE9cWyCi823LPyUcCHrnFBoK7laAAE1X6hTuB7KqTlpvqrw0q/rb1cSHm301HPQcgVrfca1WzqBEohiTH4C18cOlZETp49d06CBCh76XlWTFt/AYCwU0lxFULw/UuCqWyc2uKF+8NAdASmzhdwx++aXT13jUBDnmn9ECi+ZNaEAc4MXD/D8Y8y2cHg4gnkdp7DJE7LpSChNjERpfTajUWC77vYVYoaK5lwB0Qcd0nMg2KLN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(36756003)(26005)(6512007)(6666004)(2616005)(6636002)(83380400001)(8676002)(41300700001)(5660300002)(44832011)(8936002)(478600001)(4326008)(2906002)(6486002)(107886003)(316002)(110136005)(66476007)(66556008)(82960400001)(66946007)(86362001)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ojxp4BbgMwfng0y7qx/wmPPVh5G/+DVw9/cgTpxWvvQpJXcne9mVMpZkSERn?=
 =?us-ascii?Q?eloLUAYnp5f09bh93cME+TqDnJKAGulC+p2M0mnZcbSbFA4fy0TUdzkeng9F?=
 =?us-ascii?Q?2kvb/Jfh8LaPTOFhYz/Whhsj9405CObmvR4lKpcD38Fqr5dp/FxSoYzbguMi?=
 =?us-ascii?Q?FyvGT6meKRmqDux+FyDqb+INXxwye2GFWjrIwrKcJozcTkdx/pMjlZ+hLs3p?=
 =?us-ascii?Q?81sCbxgmQSlj/IM3xW/3+ogxpcRSekxaGDYcAi6nuwm5IvZYMPlgZ+HXgqoT?=
 =?us-ascii?Q?v8qNVtOQKCbwx8SC5LjjuuHaQj2k0rzX8nK/o2U3N2Klg1ivWK/DzRkgSAK5?=
 =?us-ascii?Q?DU0goCbWEwTfNek6jwV151UlpRHfqbo6n5swBUdVI8NRECOO9QulWT53Bo+5?=
 =?us-ascii?Q?jnODed8FZWGsQ0byykxInPLjO4bOF6EBE/d7OWJnnFaFR0VaRl9HXy3ksZs/?=
 =?us-ascii?Q?Zwgxkukz+AdK6nVFOETc+vzzzz0sAQQdBZUHDl/ER8BcJ/LdTuc51BSA2F1C?=
 =?us-ascii?Q?QzpTjLCWWVN+PocQAwp9dp0EX9C+ur5kgeEvZniN11lK9iO9s724bVoFq0y1?=
 =?us-ascii?Q?FRUEjDxLXPuN/HsNTLgXo/13QS70Yt9WKGffhiKYZxWt9O3Hwp9yaOIW2vfW?=
 =?us-ascii?Q?0xzaBM9jk79NXL1Lk2asEQXyFlV5RTTCxP9V/fYrfvJronCTLXs8Np67rggp?=
 =?us-ascii?Q?8lsXrrXB9g/1oXOlxO1Xt2FC0j0LI7PGLBWHZgM5n9XQbauR3WjlIncPBxk2?=
 =?us-ascii?Q?ikg3R59ZCanoOQr9YQZVT6Ae/X3cxAtIXgGG8MGEnx2fak0Nd8wGBhu0DKov?=
 =?us-ascii?Q?7YKP1mN53MDEKJTbdvzrhY0dFIMo/jEnZU1Jwrs/zn03OrR0NvEgQp1TKivs?=
 =?us-ascii?Q?EXglpsYWw27YdsAsVu3olHjbwH8P7orSTxT+7sQ/upOpVW+KHSTK+KBlrPRd?=
 =?us-ascii?Q?OQX1cpH2VsFL3E+qippzzhsvyb118OXsH79icDm4LwDKxfvo7A2I9gtVi2sJ?=
 =?us-ascii?Q?9g5gqtD2mQv9pF4bbeh1Dr6zEfBg5jwB3pxoUPXNeGktLmm0QQLRDfPhne8i?=
 =?us-ascii?Q?wgpaWXySlijhVu8gc2OmXmFpSkzYUzrS7McOahXR1c9wf3iMD1puXUtUPQru?=
 =?us-ascii?Q?eKX5YvIkrZ0NY3pLVJQSos48uGw1eTM8CFxPSA/UKIijYVbXmKo4ZZzX8a0e?=
 =?us-ascii?Q?hu8UloItqsU2J/BJ2ThK2VG7PKxh3ipB5rqY/1qbsozBW3fcxF6o1rB/JVe+?=
 =?us-ascii?Q?TLxNxXDnrSjput8ZXzN+iAVs3gy8HbGv/Gw2Ojh8X4o1OSxuVY8Ww6ZFVRBU?=
 =?us-ascii?Q?CSuKUv+to2el1Ws2RtLkqTWYHF2hlFZNZXZx/of2bYjKLN20kl2KSLk70zTZ?=
 =?us-ascii?Q?7+ev4SbKEU0l/9jc71fccVa0z41S3kd/iaJ3OcQjsA0jKWBR7Gr8W6Js/7l9?=
 =?us-ascii?Q?av7e6tYNduyrEXoYiD+nzDu8hjWytoVvkXn9KCxLqrV4zN5XLgfzPTFTKXnj?=
 =?us-ascii?Q?Pa6bCGBHZm6hdphTmvgHjwBJNbCDn31KK69nFEiArA/bEjxlzfKGjChPIJ1w?=
 =?us-ascii?Q?5cuHmpn0CmjUO6juintLXHGuM6oJshkrJOzT0FnKGBIpquBDNpO1CynSZR2Q?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8655be-c0df-4f85-e9ec-08dbe7b56b58
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:37:38.0993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXTxCle60yVt1kDNgSW70xgFUWQzxpeeLlaodcxSlKKaLbHu+aQARsUNhn/jRoVWSIZs4PG/wX6PFcuYH61qfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/4] drm/xe: Add memory directory for vram
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 08:00:41PM +0530, Sujaritha Sundaresan wrote:
> Adding a new "memory" directory under for vram attributes
> under the exisiting tile<n> directory.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Cc: Brian Welty <brian.welty@intel.com>

Brian, should this directory be under the tile, or maybe we create
separated xe_vram_sysfs components for 

/sys/..../device/vram<n>

and then if it makes sense inside the tile we just have a symbolic
link between them?

Or better for now go with what Suja suggested and then later adjust
with symbolic links if needed?

> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..d61c6fb1df40 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -46,6 +46,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct device *dev = xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>  
>  	kt = kzalloc(sizeof(*kt), GFP_KERNEL);
> @@ -64,8 +65,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  
>  	tile->sysfs = &kt->base;
>  
> +	kobj = kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
>  	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> +	    sysfs_create_file(kobj, physical_memsize_attr))
>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>  
> -- 
> 2.25.1
> 
