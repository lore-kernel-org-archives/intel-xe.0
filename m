Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154B5C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 21:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D202F10E09B;
	Mon, 10 Apr 2023 21:40:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C500B10E09B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 21:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681162801; x=1712698801;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aK9PoWcd6CtXfbg+KudMuWMRF+OLhFLqmx83swbNUX4=;
 b=TO1FDy2F812Invf1V1akBj3BIAt27QzWmLm0j/xq9lIQPkrdw9c11JSL
 ltxVy2SZdP76cOXSO61G0W3QXTCIRG82XTXeRMaePxys8MPv8C3uVot71
 koL3w+ulV9kH6J3dNFR/PZcsz978gyW6f9ZYMBAcnIwj7u6OEgwHO/obd
 ZK7u32bA5OSdgoUhJjQIKnK/u30LQI3IZoSO8eJsX4hJL7I768By3f1ZS
 nPzvIqk6/5uWAEPik5h6Kgot/yUvwk6iV+/Bsa2jTeoHFS6a/E4OYoJYn
 8OoZczjl1dYEb/b9KDq+fHfUf8cXbYhsBUL7ABV6X9ppo4HeGRvad491f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371304243"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="371304243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 14:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="720960958"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="720960958"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 10 Apr 2023 14:39:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 14:39:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 14:39:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 14:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmUS28G3eLFt/+WzCegYA1IJTiOEKFPy9jg5QikjfCycxnqmN1LJ9OBevlPFa9a+I3rX2QCJG9NWIsilQqdYQ8Xgr5ScLm/rQBy32B/v3HXToZ1K1wj9QkHMo/BhCc251IiWvE6WsbMWNnisJPDG/w3ZkH+6/nvIZy280BJwGvyZA3M76QVXzNUlzYuOPOlcGTJajlOcqlTmQDWceEYssQT1UCuRciML5ASluK81Ag94uOR+Zfwh124AJPNAQAe7Ij0P1Trw7alCAxrHPycZPgLTATHdTgmlnKTq1k5gGdIFH6ztEd+IwfphRjLyn7KbgHAWTwGayAZDNK7gpvi7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWCv25TNOSsbGcnVAHC9quQzkLwMju9a2xKWrrhbsYo=;
 b=LxUCBG0S4ktCRAsLy2BO3m8/0Koj0rji9qNBBWU23GN0kN2vKD5cBabQFOcyhmCVJS3IOWVoTkmvysXXGcrwL/hhIkgdnGdU2zq1VGTM4/y3N83aFgLHthsbYxun/h6CxARNtTcI5jleWdfPsd9B/yxTFHj1TeJ1G1r/mtEO08DK7luiuDNDS7abaXh3ouAl3QuQsl/1yfJqO2jazJ7w/n6JlSa3flQ2kc4UE1xrtHBUUm/dioHUlEKAaYMbytOQ/CK53MfzVQUIorPun6zJ/AvGK3h9t9rpNrv34vb109WeOICie/7iCiGs9OjGx+VW1nrr/QfRIHkDRLXw9ID42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 21:39:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%8]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 21:39:42 +0000
Date: Mon, 10 Apr 2023 21:39:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZDSCFyE9Jv9TtbRN@DUT025-TGLU.fm.intel.com>
References: <20230410200229.2726648-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410200229.2726648-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6c0f53-0d1e-44e4-c463-08db3a0c1802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rDWsCU6zJsH9z0qmFj7+BHLbw8IJ5tCxXTfR33Tn7ku+wv1O1v370Yl7vdXGv+z2APceXwUILqu9rmTWkZQp2euNxGBOaZgj4V3OhlyKyE2z7j3P7oJZtp94rB37dDiG5csxCCbEQztZmiDpQoGufb6+gWK6QeakbZHTgfJLWRF08BPPwwsCX/0B1QJNNJtyz4yNt0xD34qGLfWLHNTk9EZRTx1uWRvVqM8d+PwlJ7/ZRAj7N3V/4BMg3FPaAR6opYkia5y/zIQECT60CShyO+C4s7ckDXGgkxniIFvdKkucgq4oGdfoi5e+jPCfArma1xnR+GFNJNJyJ4twKKAUsXEfiVDsF25/1+EHo/3cpQiJbVC5dxN0kzY0SXZdPDQg5WcZ6c7k8MzsMmRvxp/qo5fEZiHzzb5Z1xNaRfuLrjW/hAyCeReCEArBWajn3CAxaMf62W4TT2QV8JM0gmThFYX24W2J6XV3Jtg7Ngw9juYVl+Ep2W+SZPmfkLVGSxN1H1uXqhhfctHiLf9mFBo9paWdn4NuUFP7uwP4alH8knldWK1QN33JDa2PyOE9KNo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199021)(478600001)(6666004)(38100700002)(8676002)(8936002)(6862004)(316002)(41300700001)(82960400001)(4326008)(66556008)(66476007)(66946007)(6636002)(186003)(2906002)(6506007)(26005)(6512007)(86362001)(83380400001)(5660300002)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/5Ry+aU/Mi734dXY34HWV5DfGMsKXzwRTz9SJORv2RvKAruYJ9t+UjVDw8s9?=
 =?us-ascii?Q?yapwGUFbFlIrg0JDpIhomiVzLsKeH6d+HAqlGb7RPjTVQvISmzdxjAGRKK9b?=
 =?us-ascii?Q?HEKsaoQroWGjSt1b/f3FqIcpP725ly4Mcr9r8o8rBslUTZZE5b5DHHL0+am+?=
 =?us-ascii?Q?OLiEhccX4TWBYg+HoeGLVRe0Wl2jADR9w3DxIL0xLEgQCaxdvybYwy+mW5Qq?=
 =?us-ascii?Q?bIBasvD7ZZlzeEaf64vk7ukZs4IKZqez0Cms3plsv4joyanRQYnCGsoOT6bS?=
 =?us-ascii?Q?R8cM6PGKrNjTn0xvu9qV5WM8tzLpph1EkPlc4d3aULAbRhmNNSYmf4PuhWSL?=
 =?us-ascii?Q?xfIyE0J1L8XAd9jPsdu7uyPWWPnfRgubh10TsSjiSFQzbyJ/dEI8F3rDPhJ+?=
 =?us-ascii?Q?b+j948T8p7LbDYuk9JS1Fak3larbheJRJKSHdOp8jJm8v5RJNy093nbM0Of0?=
 =?us-ascii?Q?YAS4eiuMUUL1X98BhHFxFov84v7Lw1lffRPnySkJYKf6xi2iVwURsJNGZHKp?=
 =?us-ascii?Q?nZpH6GnhNm7dKCFJVsHc8JJrkN3FCOBfRclcVe3AWOfl6u8hs2OcE9a6/2R0?=
 =?us-ascii?Q?L0lK+Con/GcERZECzJZPsFo1B2c6l/IAxJ5vcEoZ4iGea5KEs9dCao3G3KdJ?=
 =?us-ascii?Q?9G6o3QiWxKZzuj/46ThyLj6YOKdvgToLAZ6SiFTlYkPhWVeh3x8YSiIE0VaY?=
 =?us-ascii?Q?yyK3sxftMepDqnxX7wWIDG3pyTxrXtzoGo+lL+r55iij6A81IOJbr3HPqKNL?=
 =?us-ascii?Q?pooZN8f8kjllNYn0V94tUJ1r5RC0sUC1vjtzPuCcqOFEZBBlTtVcaRAfTyUN?=
 =?us-ascii?Q?ZOQTt+yJK+e5GKL2cQlRYmhguoy3HsbTLpmEarQPFmzA1OTSR6oBEn2/eet1?=
 =?us-ascii?Q?V7PNk8X82+ER5tZoG6CABXEPiHTiWErmqoiE3D5FnozoiDjBgBvHXycZcgFx?=
 =?us-ascii?Q?6FsrmP0W6eoXxtwdGH6F4pc+oECS1O4P1VtIHuWoS+UlqAyRQHvxCqvicU2j?=
 =?us-ascii?Q?N4w5nknG+eojPUteUqTmvLTuKDPMwkC5ZXLb9GcopijmJ3OfI2NvxQE7XeGW?=
 =?us-ascii?Q?iA4Fi3fze6ro6PcW85qqx1PPPk0p4NtlEyy09EqcpWblY2jTlxE/psp2MlzL?=
 =?us-ascii?Q?VItAV6GmiqMmNeRBVYOGEhNbH7DevyLCTkN4sEHOsETU6lQl/g97gKJvrCvv?=
 =?us-ascii?Q?RzjgCsb3DVyn62aXTVtptrygB5cCxMg7Oc7dEnO/R1w+SSzLrG58qTVn64GQ?=
 =?us-ascii?Q?t9Cp6sVg3HhkgoKF/mOQ182x3TRZrkllbOZcyNFlfWC5d87kxSfgH02Vrv8U?=
 =?us-ascii?Q?g2uijLNz9sKp3/idLcEIhzUVRSgo24O9zsD4b1bpmLDnS9DWhRULgNvaIfoW?=
 =?us-ascii?Q?T5MXPCh4ReVtk7jqmigzmDgElFQLKAvUg6IZECMySlFkMKhC7MvPRlSn0uYr?=
 =?us-ascii?Q?2KIQKyfxOa9C2Bhuu2/qZ/MwaTRlEr4hbjBYc9C0q3mEWpfzvVV7gF/TCJAW?=
 =?us-ascii?Q?3CS2nPQ5xbq9Pvoj2Yjqb6IwYvkJHHot4nKHoxxWCrG1LEvZVK3gTmLqJc/I?=
 =?us-ascii?Q?ZqbaWOHbaoIq1duX2R/eEOcvLJKJt4wv9Gq7WThDxe64wS4fU3vdMitBEBMd?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6c0f53-0d1e-44e4-c463-08db3a0c1802
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 21:39:42.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwx9twrx+C+g9iDpZhRgLNVL8AqtgJ7bvcCEt5+IE865vaAuyr/dwTjEa5zgMqUJoFnDSvLWFsJCT/rNksrssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Let primary and media GT share a
 kernel_bb_pool
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 01:02:29PM -0700, Matt Roper wrote:
> The media GT requires a valid gt->kernel_bb_pool during driver probe to
> allocate the WA and NOOP batchbuffers used to record default context
> images.  Dynamically allocate the bb_pools so that the primary and media
> GT can use the same pool during driver init.
> 
> The media GT still shouldn't be need the USM pool, so only hook up the
> kernel_bb_pool for now.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bb.c         |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c         | 32 ++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_types.h   | 10 +++++++---
>  drivers/gpu/drm/xe/xe_migrate.c    |  4 ++--
>  drivers/gpu/drm/xe/xe_sa.c         | 23 ++++++++++++++-------
>  drivers/gpu/drm/xe/xe_sa.h         |  4 +---
>  7 files changed, 48 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 7172801ee570..3deb2d55f421 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -42,7 +42,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	 * space to accomodate the platform-specific hardware prefetch
>  	 * requirements.
>  	 */
> -	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
> +	bb->bo = xe_sa_bo_new(!usm ? gt->kernel_bb_pool : gt->usm.bb_pool,
>  			      4 * (dwords + 1) + bb_prefetch(gt));
>  	if (IS_ERR(bb->bo)) {
>  		err = PTR_ERR(bb->bo);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index daaf93e23bbf..4186f7f0d42f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -137,7 +137,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> -	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
> +	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
>  	job = xe_bb_create_wa_job(e, bb, batch_ofs);
>  	if (IS_ERR(job)) {
>  		xe_bb_free(bb, NULL);
> @@ -186,7 +186,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
>  		}
>  	}
>  
> -	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
> +	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
>  	job = xe_bb_create_wa_job(e, bb, batch_ofs);
>  	if (IS_ERR(job)) {
>  		xe_bb_free(bb, NULL);
> @@ -439,26 +439,32 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	/*
> -	 * FIXME: This should be ok as SA should only be used by gt->migrate and
> -	 * vm->gt->migrate and both should be pointing to a non-media GT. But to
> -	 * realy safe, convert gt->kernel_bb_pool to a pointer and point a media
> -	 * GT to the kernel_bb_pool on a real tile.
> -	 */
>  	if (!xe_gt_is_media_type(gt)) {
> -		err = xe_sa_bo_manager_init(gt, &gt->kernel_bb_pool, SZ_1M, 16);
> -		if (err)
> +		gt->kernel_bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
> +		if (IS_ERR(gt->kernel_bb_pool)) {
> +			err = PTR_ERR(gt->kernel_bb_pool);
>  			goto err_force_wake;
> +		}
>  
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
>  		 */
>  		if (gt_to_xe(gt)->info.supports_usm) {
> -			err = xe_sa_bo_manager_init(gt, &gt->usm.bb_pool,
> -						    SZ_1M, 16);
> -			if (err)
> +			gt->usm.bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
> +			if (IS_ERR(gt->usm.bb_pool)) {
> +				err = PTR_ERR(gt->usm.bb_pool);
>  				goto err_force_wake;
> +			}
>  		}
> +	} else {
> +		struct xe_gt *full_gt = xe_find_full_gt(gt);
> +
> +		/*
> +		 * Media GT's kernel_bb_pool is only used while recording the
> +		 * default context during GT init.  The USM pool should never
> +		 * be needed on the media GT.
> +		 */
> +		gt->kernel_bb_pool = full_gt->kernel_bb_pool;
>  	}
>  
>  	if (!xe_gt_is_media_type(gt)) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 9fab8017490f..c45486c2015a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -66,8 +66,8 @@ static int sa_info(struct seq_file *m, void *data)
>  	struct xe_gt *gt = node_to_gt(m->private);
>  	struct drm_printer p = drm_seq_file_printer(m);
>  
> -	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool.base, &p,
> -				     gt->kernel_bb_pool.gpu_addr);
> +	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool->base, &p,
> +				     gt->kernel_bb_pool->gpu_addr);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 9d3117fad2e4..7c47d67aa8be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -214,7 +214,7 @@ struct xe_gt {
>  		 * behind any user operations which may have resulted in a
>  		 * fault.
>  		 */
> -		struct xe_sa_manager bb_pool;
> +		struct xe_sa_manager *bb_pool;
>  		/**
>  		 * @reserved_bcs_instance: reserved BCS instance used for USM
>  		 * operations (e.g. mmigrations, fixing page tables)
> @@ -304,8 +304,12 @@ struct xe_gt {
>  	/** @hw_engines: hardware engines on the GT */
>  	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>  
> -	/** @kernel_bb_pool: Pool from which batchbuffers are allocated */
> -	struct xe_sa_manager kernel_bb_pool;
> +	/**
> +	 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
> +	 *
> +	 * Media GT shares a pool with its primary GT.
> +	 */
> +	struct xe_sa_manager *kernel_bb_pool;
>  
>  	/** @migrate: Migration helper for vram blits and clearing */
>  	struct xe_migrate *migrate;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e8978440c725..8686a2a7b035 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -161,7 +161,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>  	u32 map_ofs, level, i;
>  	struct xe_device *xe = gt_to_xe(m->gt);
> -	struct xe_bo *bo, *batch = gt->kernel_bb_pool.bo;
> +	struct xe_bo *bo, *batch = gt->kernel_bb_pool->bo;
>  	u64 entry;
>  	int ret;
>  
> @@ -229,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  
>  		if (xe->info.supports_usm) {
> -			batch = gt->usm.bb_pool.bo;
> +			batch = gt->usm.bb_pool->bo;
>  			batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE,
>  						&is_vram);
>  			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 96c4b0ef24fe..c16f7c14ff52 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -33,13 +33,18 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  	sa_manager->bo = NULL;
>  }
>  
> -int xe_sa_bo_manager_init(struct xe_gt *gt,
> -			  struct xe_sa_manager *sa_manager,
> -			  u32 size, u32 align)
> +struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 managed_size = size - SZ_4K;
>  	struct xe_bo *bo;
> +	int ret;
> +
> +	struct xe_sa_manager *sa_manager = drmm_kzalloc(&gt_to_xe(gt)->drm,
> +							sizeof(*sa_manager),
> +							GFP_KERNEL);
> +	if (!sa_manager)
> +		return ERR_PTR(-ENOMEM);
>  
>  	sa_manager->bo = NULL;
>  
> @@ -49,7 +54,7 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
>  	if (IS_ERR(bo)) {
>  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
>  			PTR_ERR(bo));
> -		return PTR_ERR(bo);
> +		return (struct xe_sa_manager *)bo;
>  	}
>  	sa_manager->bo = bo;
>  
> @@ -61,15 +66,19 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
>  		if (!sa_manager->cpu_ptr) {
>  			xe_bo_unpin_map_no_vm(sa_manager->bo);
>  			sa_manager->bo = NULL;
> -			return -ENOMEM;
> +			return ERR_PTR(-ENOMEM);
>  		}
>  	} else {
>  		sa_manager->cpu_ptr = bo->vmap.vaddr;
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
> -					sa_manager);
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
> +				       sa_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return sa_manager;
>  }
>  
>  struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 742282ef7179..3063fb34c720 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -11,9 +11,7 @@ struct dma_fence;
>  struct xe_bo;
>  struct xe_gt;
>  
> -int xe_sa_bo_manager_init(struct xe_gt *gt,
> -			  struct xe_sa_manager *sa_manager,
> -			  u32 size, u32 align);
> +struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align);
>  
>  struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
>  				  u32 size);
> -- 
> 2.39.2
> 
