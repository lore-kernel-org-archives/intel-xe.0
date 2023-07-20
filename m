Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2B8EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 16:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6B710E5DE;
	Thu, 20 Jul 2023 16:17:09 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694810E5DE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689869827; x=1721405827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JV3MIfBnP1UGNylyJjXAPQLtYieMaRYrpJIdn4npix4=;
 b=VvToqe0Oy5UrBHR7a7t1GdWiRRbereVcf6XRr1SBXzTD82ljo2BUlJ82
 Aptz1ctnAJnYHBR/yNSIFoyikNIReq/oIBTPZwctyoApLZJLgpoY8Apph
 A36+8A0W6uEmVgPJIg3a95on9i0a0DSIP1QxfnrB4W3xj/JVJy6TONheB
 hC64iuFLeI+SyrdKsYmJ2+OGb59Tk+o+mCli9BaQX48kpZVTQ+Tnt/U5o
 ipn4WLACIkTGoqCWSt//FR81H131imrl7QniE3CtsdpRepTWgUIeEjtkD
 kVjMNBPkxAZWO36lvMCAfAeayuuyiSKwETFRtcYtBYC7Ss9KH7xuyI1dK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430580352"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="430580352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 09:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754109186"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754109186"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 09:16:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:16:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 09:16:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 09:16:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4Wuy2eFdmvXi6DIrj6VC0j1biQMrAjzAz+rzN+RauzaCdy0goG1uA7Sdh6g4VuGd5nO0utu2CONs6n1BWmvM9iUadZrAzIlUTOJynIK8kZBYhAfu+axTFDl3Ve2bMaZyCIDuy/TYD9mQPPpPO+V/zxEf3M+C3Dby19J9yaMpzHvjhFncNG7KD3r/6rDwMe+xw1/PMlW+K4biu+VMp7FFHbDZVFsbyUJqZ4BjVOKigTRBq4ztui/NqVZeBmrmzCL8dBjq4SmoibDkT1HVojLi8pX2NqRGRYwWmnvG03GM2OaiypHuwasxaQW01wudXBne2Rj3WnW9V+wY94YOhNLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1eeI563XkZ/2ssBD8//Kx3eYcwDeb3k51vjImy/0K8=;
 b=hCVVJJkZi3OA+0eWxvyMRJTrrgdt205C9XT/fJtahIVvQy9iTdgCgZfRtou2EHPXhLBd57pXhQGU0qUIvcYezvOWMyjbiAI8Ap2g1oAbOK6AdUgPlhkUy4CpDPW5DCSq6cAUpGU1eUcFcp/Mug4jPrzwvIf5oDHemhlLJp/3g776bhIpWpm5LFdj/bZ7XCztbJXRFsC95WlZLZK8TTNBlQ7MPDhxPTPBMe0kfrgid9GJEIWdbF8srHVQrY6fX7u6XDX1A1JwoEMATRGwZlADbqhcNUK7u7q3SJICdOBgT+7qMdHUTPuFv5qp0bv4JOwE7SsewP42NIc6SVZ2ysPnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 16:16:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 16:16:01 +0000
Date: Thu, 20 Jul 2023 16:15:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZLldlHgQuUbKs7Lu@DUT025-TGLU.fm.intel.com>
References: <20230720081038.24822-1-niranjana.vishwanathapura@intel.com>
 <20230720081038.24822-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720081038.24822-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce1acba-860f-4473-e92f-08db893c9c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQ825UAp/RrbPgxDsxj/YM6tPgMsdTNskovfjr//Mt6kYJusT81p15EbVeKFL+ZCvVemsgijFFx6pWA41plrW2NDSFHLH6yurqs7JZPQn3vjcvt1RF94BKJXi7kWJ2ytJWiWftoKit2gppk4Ub79CsocWKN131PdfTPkWwlgNx8EXuuY/IvMxGRpE6gkOjq22Hit0Yi4uIamPD+BtHwy1O1UPaOGU/tPkbw3ElOGMlZcrmvkWt3jH0Av8TY3QjNI6wc779F2cEN+lN3GtuMfmTSlAtV+5HWejlywoL4uEV2HmlM8bb6vMexyarwdZ4vbyNEfSUHsvcK7ipZk0K4e5OkhU2CsapuYOVe5yQuI1NzyWXnv3o+c7Q+K3LRj+bYGLQqr4QfNOLl27NOHqoZ6UPcu0QUWIs1dfAV8kjXu5OqurANKTJ2yAo7z/nn9KC4UGnGAcCPH3/UEELq5N4x0/x5H/0QzjMnfEd2EqaKEeHQu2VzAZIu/wd9/CjRFLH7+/wYr7wIHICDE9xt43DlXY5SIGfvitQhUHWj7nB+X1fuCvVMvVFM3Wob5Ej2P+R1N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(66946007)(6512007)(44832011)(66556008)(6666004)(66476007)(6486002)(107886003)(2906002)(6862004)(8676002)(6636002)(316002)(8936002)(4326008)(5660300002)(82960400001)(6506007)(38100700002)(186003)(26005)(41300700001)(83380400001)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdPFp+iSaJq8s7ijZs79VmlbjZa4vUa9DyzjevZstyhDT0nDPROXq1ajcl3D?=
 =?us-ascii?Q?wOAdVwEn3L9Jv0m/V8qvc6STfreX4Hlsm/JWpbfpOPWK8d3X2khEZevYp1sR?=
 =?us-ascii?Q?TfArsFmWVt/BKppZp1lQe+3Hz8h7ACDW/gq3/cLGajArLHPLf3lZccLC5/zk?=
 =?us-ascii?Q?vqmA1+mdRpeePOeoqnIyE+8bbQLuPm2w/cgZ9XUxQ7nXGKm/s73wgfiQy/xs?=
 =?us-ascii?Q?YedtdRQE8SKmhxxgnTswYLCuZi6TBIh/CBMPJMQZd0ZR/aK6QZGlvbkOD1uc?=
 =?us-ascii?Q?GUgLfNSeWfzBZpzvigaQ9v+7r5ELyj5JJ4Gsy04U3Meb39NrTWdb+dh5D064?=
 =?us-ascii?Q?vMI3pzqw7GQMKmy4+SEdhYvzY4n65Jn79IYCvh/qvHiq05c2AASdom5m8gFA?=
 =?us-ascii?Q?ndxIKNFFJuM5WR/oG9oJoqEQZLKcUjIeegldNOry94wkUxo8U53UWCVdq1zg?=
 =?us-ascii?Q?W06PEc8V5gDfZ72JkMOl6UJEGKuTZ0tVq0GB1TmmGgVaRRV5eMfChBq1KSPl?=
 =?us-ascii?Q?3IyyiBkUK/5Kp4bWv5WuOJhPCBpyrWTBv3XtRAizq8JqE6oIsaOX0dXIBCHd?=
 =?us-ascii?Q?+rsTe+C+oxYQOOP+5ygFMIUqfWRIjdjDq2u4HkF86P/vwhD6u73MX+OkE0S6?=
 =?us-ascii?Q?JcKBV46Nyp5mEFRWfx87WZgyuh7FxF3aMZB8N13rMsa+gKwKUewW+mTXYkAG?=
 =?us-ascii?Q?lIFa9Yue7EZ2W1QUHDj643lJAKx2e3cTxB8cstgCTWR3On7jlzTAWPr9q9DV?=
 =?us-ascii?Q?b8JAZ4i9IZp2abMHczWiQ+hsx+7YjS7ucgXHEe6Gkb+Mi4P5lI7tliE3PZVB?=
 =?us-ascii?Q?uahPlx+BrsPNvUAQspKzbRsyrVbejINF3PWCdi8B2H5c+3riBxEaFSt2gPwe?=
 =?us-ascii?Q?kYWc3VunEjaMyLvkB0MQKJ3Trf4/7MeOP5ukcqWQsY6av4U1a5eV6uSJw9YQ?=
 =?us-ascii?Q?QyJoaJTUoeuvaVvHXIEGDaZP6mrK460ZG8JrDBOPuxKZ/+B5RTZkhvMpkQ6w?=
 =?us-ascii?Q?70pqmX1x08TmyqcNyh/D7RND94CpNMyupfuwaHP3BoIN4+H+L/pcBVgQjgSN?=
 =?us-ascii?Q?kRvANQpTVkL0EZA9zsG6u/gKiNLuUz1WzCSjPmMZ7rDaUUV1XBLVgURlU+4t?=
 =?us-ascii?Q?xYtsAdX1sUkjKKrj1Jfvj/0LixoTmiYzpWkWPLnYnbao+OiFQm7ZDhVI34aK?=
 =?us-ascii?Q?x4F01XB7TGy8sreTnA8aCydfUzO5JYSITYK/iezVqKJcZQPOeFA30RYEF3do?=
 =?us-ascii?Q?X+raHLdBK9nYTu6ZpAvj6IuG4K+HqyABfYmdf1d8hLaegBBVPmZ+r3epBJib?=
 =?us-ascii?Q?e4PFonV89Y/eAtwwc7csxWMIkpnLEXPuhGxDmzm/NZQXb0opJ73f5JAWfXKN?=
 =?us-ascii?Q?x7aEG1qf+3Y2qgXlPcKNM44rFwFPk3coNIL0Rr8qGK3JqubNe6WzTI+SLfSr?=
 =?us-ascii?Q?8dMd+tdiBVlcpxCnSCc2q8ltyKLCFthjDFF2xHRMYbOtdoj2aNxZ6/9DzP1l?=
 =?us-ascii?Q?mtX18Z+l5oCYc8IIFRQkgC+brU7iNB5ELYdNnLd7SsgIOmP6qw7fbyCIh2B2?=
 =?us-ascii?Q?4+/bot42Si80dGNCXuvtHpzfs/NJyIEkPJytc7grwC1QzIW3HyOJL/Wa5LVC?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce1acba-860f-4473-e92f-08db893c9c2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:16:01.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+Ag24d8G2mwP0rQ7AZpp+V4q1W/p6RpxLl/x9ZE541O2wSUIONdJRVTqytfM2cETu+X17IWMs02erRHbIvOEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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

On Thu, Jul 20, 2023 at 01:10:38AM -0700, Niranjana Vishwanathapura wrote:
> Some copy hardware engine instances are faster than others on PVC.
> Use a virtual engine of these plus the reserved instance for the migrate
> engine on PVC. The idea being if a fast instance is available it will be
> used and the throughput of kernel copies, clears, and pagefault
> servicing will be higher.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
>  3 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1af5cccd1142..8738888283b7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -773,3 +773,34 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
> +
> +/**
> + * xe_hw_engine_migrate_logical_mask - Return logical mask for migrate engine.
> + * @gt: gt instance
> + *
> + * On PVC, due to workaround 16017236439, odd instance hardware copy engines
> + * are faster than even instance ones.
> + * This function returns the mask involving all faster copy engines and the
> + * reserved copy engine to be used as logical mask for migrate engine.
> + * Including the reserved copy engine is required to avoid deadlocks due to
> + * migrate jobs servicing the faults gets stuck behind the job that faulted.
> + */
> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 logical_mask = 0;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	/* Only support this function on PVC for now */
> +	if (XE_WARN_ON(xe->info.platform != XE_PVC))
> +		return 0;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe->class == XE_ENGINE_CLASS_COPY &&
> +		    (hwe->instance & 1 || xe_gt_is_usm_hwe(gt, hwe)))
> +			logical_mask |= BIT(hwe->logical_instance);
> +	}
> +
> +	return logical_mask;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7eca9d53c7b1..8eb70958073e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -16,6 +16,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> +u32 xe_hw_engine_migrate_logical_mask(struct xe_gt *gt);
>  
>  struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4c6f299fd024..2dc3e4266dee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -344,11 +344,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  							   XE_ENGINE_CLASS_COPY,
>  							   primary_gt->usm.reserved_bcs_instance,
>  							   false);
> -		if (!hwe)
> +		u32 logical_mask = xe_hw_engine_migrate_logical_mask(gt);
> +
> +		if (!hwe || !logical_mask)
>  			return ERR_PTR(-EINVAL);
>  
> -		m->eng = xe_engine_create(xe, vm,
> -					  BIT(hwe->logical_instance), 1,
> +		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
>  					  hwe, ENGINE_FLAG_KERNEL);
>  	} else {
>  		m->eng = xe_engine_create_class(xe, primary_gt, vm,
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 
