Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B0EEAA7D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 23:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F084410E5B0;
	Thu, 14 Sep 2023 23:53:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5020F10E5B0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 23:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694735635; x=1726271635;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JoEQw9FI5JpGjmmzfnFPTGqyqUZLytVKn6GQ3fVz49c=;
 b=HHbespUSwwF7/E/jjHslZqBRo6TiAHjGkwa/cugIMwiVOyE2/zmo1JCX
 UrNBriq2W56cVxr1E7YdLX2Pj+pl4Sy20NCCFfo01iumMnqrbuSKP+W7m
 izEoZgwIR7QzvuNVOVILBuCQKLQ3hzPuX+zIJM34nMcsq26YtBnb4tjss
 k0syr9aefHQRMvdL0eaH2NxJJZP2iJWBlRddoT2M20qcgTONyTPciefZ0
 3ApuyW9erE76JSrcv73Gg/6Am7Zz7CzEYFzmiDa8sQVf69xAkRqIs1JpR
 KFciQghRLJAKSh4jpIGaHJa8dnHtz+HoBeqM2httBi9Lits1e2dwruebC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382933587"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="382933587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 16:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810297910"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="810297910"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 16:53:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 16:53:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 16:53:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 16:53:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 16:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eV72P4yUj79jhTTNQodms+6ngnSqwTUtSXg1IzJP/AOwgzls6R1/gNqjkeehK+oANY+Fsih6rptfkoEZ3N4plu5Dk6s3vTiHMNv+cne+XQoFrEDr8UFh9PUZ/BrRUwx/tQsFOh+HtmQqsAx10GcXc/PyvMmBEOkt+JBpKNMGHfjzdDmNi8svh63U7wdac4BUnBY7Q1kzn8FMd8ovL/eSdqIAHsb5wYQPIKZdDtSBZaypKZTAB6yJEKUfxKBIquHb0HBJ52SF7HtA6srClL4xJN5ohu6P/JmJ7QPRZgy54ze0GuIViKRA8/lpm/4p6M8eQrAxS9UDg4Z2+6gvfrvbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnf390d3ddXThxjRPa8TFG0ULK3pZh8OkJqwB/Ox8As=;
 b=d1XMU67OKFrhFIYNGtrQb9Kw+kvmjPl8iTAsgmA/9RpCPsFixhh4x2r08Owu4yfdAvSl3SmvAWqRk/kyP1edxyMC9jNF+oJlBsgfc5lMuHFdjv6oPxjlBInES+70TRJEGNXjLxszGwV471HdekBGLpp7GGRB8Vo0ws4INa4sZob1zwAKU0tdE0HJA3KDDnpZ9lbjI8MDLTD0vBQ6Hnwef/ve4vy1mfOZV4PqjkOQJBzcE8IjOj/7oYePJhKqf8VoK6pWk/s8B+lBiXi3I/SgKf7qy1ky0ccjfeFb8wX2CEWqG7JH3mq5dSwfyWY8V5peszjtrwBn1tmvDfXBWidTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 23:53:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 23:53:50 +0000
Date: Thu, 14 Sep 2023 16:53:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230914235344.GX2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914153112.455547-10-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: ce222b6d-e1fd-43b6-3d25-08dbb57dd842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cg5ocq96NGiQLZ3+8+Dx0BVdGAsfSDktFPDysulYLYusPBjDiw2YUwvMET/nGpAvipxUzSsgVvEce029Z/+kYSEw6z5iLlJPusBTLzf1UyBUGADyovt/paU7Jy7VVtipyE3aDTBJ9NyhFn0LGhr1PdDKenCyC64Z443KdgymKJqD709oUw6U8hb6gx1MOHo8CEypDrMmgfVX8B4fXVQyfSIyEypgTJ2C1h8Bprxez43O8217LcRXrSTN3Jbn++RbD0NERABffO1Bpo0J3VoXSV8OwvevYAJ+KtSWndjt9+nSVvXKUGDbwG2e3PETDCxWes/u5rhIwGbO8ged2xUXkmN1epmBiSvRKbnl3Iz107xACO6ceh3XO56X9HGyZgCR6oN8Rt8Hbqe9pqGwNw8cg99eAoAcoBcJwz/gGVNFb0EdwnqqcokekmoEVkFtBqMkqvkmWYEZt+fVAoN/rRB/0AsEjXqqjd7mjKMnAZzwH0vxBzRNneVGjYjfvZKAtfxiCrbd+UzwBKDWKJragCrkGfmuhS0+rvAKe3dVB4iyOEk5bh3z73c65b6JYmz9mgCM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(186009)(1800799009)(451199024)(26005)(107886003)(1076003)(41300700001)(4326008)(6862004)(8936002)(5660300002)(8676002)(6512007)(6486002)(6506007)(83380400001)(478600001)(33656002)(82960400001)(66476007)(66946007)(6636002)(316002)(66556008)(2906002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+kZFr46JFtE6yvmJ9njeh91/Y/56IGDuhbchFN539b62qStenacfxd5cbO0?=
 =?us-ascii?Q?AwNWx+seDADTYyErzw91do7Ivy6zKJ3mfpJgqjhpX+frl6efC9caZtGcCYbL?=
 =?us-ascii?Q?fsU/FmeHaG3YC+ZuRtW/+Ab+o4ZUfdtp/QJtS86jggtfvX5OmDKDwTlUeunX?=
 =?us-ascii?Q?TWFxcmEt/X7R2EvTRMx+4jNg01P7J9OUV0DopLTZtYthajez99hACcztypcM?=
 =?us-ascii?Q?+6KTOfaENbqhBQE9PPIcyrZwWiX0+Wio2IjyZZw5oOQUEZDhZMOcshGs3T2C?=
 =?us-ascii?Q?lllcrgASUaYYGz5hAGJAsognaroCitPMyTVbiJRe/y36ZrdDQ42BoeQmGns7?=
 =?us-ascii?Q?7hF+0/rS+PhT5qKLnpci3Py9N3JrRYXh1R0L05tGGCxtFIm89a8A63ZiDhX+?=
 =?us-ascii?Q?MxuzkAznUfgyjZH4fsXh0eZJQb/yW7XvOSaK9/zQCgv2k+6sCa1qQpcEEPfR?=
 =?us-ascii?Q?Mg4gJpkRNglDvlJAW8Wa+g/O00MEoY1vx6dW1gjXFSPnFoMYVHXkTjhqdTRz?=
 =?us-ascii?Q?1s6zJkEMnhTxW4KIrWK4YgiAqHJLTgHCoYlVdMjpZlBWKjW4aXR56lJ8p48Y?=
 =?us-ascii?Q?mXdUrwTPCgbDTJ0odVJ0nw2daFF2AfktBG6Es+ubxSv1rGl7SNvpUTkJFNso?=
 =?us-ascii?Q?mDwcOxjdy7fVE/a3vsIL7gqj2wrSbUyeOUS62g0+1PMqLvlSLLchO8Gec3fd?=
 =?us-ascii?Q?djnb5jaA1L/UCF5XqL1ZD07Wshh0bREdphFVZtYrrhgBnw6nQRfI85uEVcQP?=
 =?us-ascii?Q?d+b+7CPJZR+aQIYuH8INI1MeEx1exlV9kycOoSRPhF7tSHbDSR9IziJxKhr4?=
 =?us-ascii?Q?m1Po0CxMWJhPs+JO6CqgTJatqyR834c1CNeMOeKhvcUMVl6N3xv9gsHC1Y+a?=
 =?us-ascii?Q?KJpGd2sfCSvbWt0cf7nqHIlYnQlfdYb/UfMFv/Fby6CKntLU23Zluy4LZbHF?=
 =?us-ascii?Q?w3vPjcaPlOJCdkFFN/+wXnh82RCnrVqKmbUO/wuwaXIGDX/9AjBDLUJmxLzw?=
 =?us-ascii?Q?AXwvI5KbagYNLSwgNeTD0IEdEigCM9eB/6+/Nuo0B5IawHEHHkRsCHlcAjH8?=
 =?us-ascii?Q?y0sIxWQ+FBTo00n92dAGl+7x6ka9sawdykK8RuC9Z+YpqLfFM+3+w/cCxS9R?=
 =?us-ascii?Q?zevvR9jd8n47UEfV0vC7/1ef0nrCVLFkm3doi3FWDX3SlN/U8xxOV1ODi0mq?=
 =?us-ascii?Q?2+PdF9P53dsCSaG5AJ+W8rRn9DfjdLxgHDBuprSJyWKl0VzjOwYj+BE6HFtt?=
 =?us-ascii?Q?7+Le8walOmEcTfK/o1n9YYANk2OmX1OCSONHpV1SUo8dOganGBrZRsfZ99yV?=
 =?us-ascii?Q?zX74JjoZ/fbQx9kYdOHxUbPqahid9PLPEvcJYvTAu2slEB8gbXi6L10zJ9B7?=
 =?us-ascii?Q?+jhBh2XE3BBpaRwnOIPiy8Zbxmhce911IJMEZkjXjjw19jbI8r1tZ3jGEkj1?=
 =?us-ascii?Q?WVaNNzDNY//uaywoN9gkXzwX+ZF69a72VenU8lVmgHe0UAlE/cGHRW5wa0NS?=
 =?us-ascii?Q?LJ0w08n+lU+Tefkzq+0z+C+nSd3leRbv5lK3BSThrPfsvTYbcVpP7CILKHMD?=
 =?us-ascii?Q?GSsBKGiDFAC6XYJBR+4VQFctsx+1AHugFFzHlxJTuP/eDvUUspDpy3gSH0tP?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce222b6d-e1fd-43b6-3d25-08dbb57dd842
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 23:53:50.8161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/8SpHRfc3BtLW65IFSsNzWB8vAGDYHhvRqy996rvEJ/PUa1wMMYof59C9AwALedw8s2DmRUYGmTd+8bs5zozODfyeAEePx9fUWvm7wwccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/6] drm/xe: move pat_table into device
 info
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:15PM +0100, Matthew Auld wrote:
> We need to able to know the max pat_index range for a given platform, as
> well being able to lookup the pat_index for a given platform in upcoming
> vm_bind uapi, where userspace can directly provide the pat_index. Move
> the platform definition of the pat_table into the device info with the
> idea of encoding more information about each pat_index in a future
> patch.
> 
> v2 (Lucas):
>   - s/ENODEV/ENOTSUPP/
>   - s/xe_pat_fill_info/xe_pat_init_early/
>   - Prefer new pat substruct in xe_info.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 11 ++++++++
>  drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pat.h          |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          |  7 +++++
>  4 files changed, 44 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5037b8c180b8..6c50d0f03466 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -238,6 +238,17 @@ struct xe_device {
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>  
> +		/** @pat: Platform information related to PAT settings. */

For the top-level comment here we may want to write out "Page Attribute
Table" once.

> +		struct {
> +			/**
> +			 * @table: The PAT table encoding for every pat_index
> +			 * supported by the platform.
> +			 */
> +			const u32 *table;

We should probably have a space between these two fields for
readability.

Aside from those minor tweaks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +			/** @n_entries: The number of entries in the @table */
> +			int n_entries;
> +		} pat;
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		const struct intel_display_device_info *display;
>  		struct intel_display_runtime_info display_runtime;
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 32b0c922e7fa..aa2c5eb88266 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> -void xe_pat_init(struct xe_gt *gt)
> +int xe_pat_init_early(struct xe_device *xe)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
>  	if (xe->info.platform == XE_METEORLAKE) {
> -		/*
> -		 * SAMedia register offsets are adjusted by the write methods
> -		 * and they target registers that are not MCR, while for normal
> -		 * GT they are MCR
> -		 */
> -		if (xe_gt_is_media_type(gt))
> -			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> -		else
> -			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> +		xe->info.pat.table = mtl_pat_table;
> +		xe->info.pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> -		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
> +		xe->info.pat.table = pvc_pat_table;
> +		xe->info.pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
> +		xe->info.pat.table = tgl_pat_table;
> +		xe->info.pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> @@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
>  		 */
>  		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return -ENOTSUPP;
>  	}
> +
> +	return 0;
> +}
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/*
> +	 * SAMedia register offsets are adjusted by the write methods
> +	 * and they target registers that are not MCR, while for normal
> +	 * GT they are MCR.
> +	 */
> +	if (xe_gt_is_media_type(gt) || GRAPHICS_VERx100(xe) < 1255)
> +		program_pat(gt, xe->info.pat.table, xe->info.pat.n_entries);
> +	else
> +		program_pat_mcr(gt, xe->info.pat.table, xe->info.pat.n_entries);
>  }
>  
>  void xe_pte_pat_init(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 5e71bd98d787..2f89503233b9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -28,6 +28,7 @@
>  struct xe_gt;
>  struct xe_device;
>  
> +int xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  void xe_pte_pat_init(struct xe_device *xe);
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index dc233a1226bd..2806311bd6a4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> @@ -531,6 +532,7 @@ static int xe_info_init(struct xe_device *xe,
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
> +	int err;
>  
>  	xe->info.platform = desc->platform;
>  	xe->info.subplatform = subplatform_desc ?
> @@ -579,6 +581,11 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err = xe_pat_init_early(xe);
> +	if (err)
> +		return err;
> +
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
