Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4DCEB8FDD
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 14:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B0510E684;
	Wed,  6 Sep 2023 14:38:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86F610E684
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694011121; x=1725547121;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oi+8eEEKxE+LvG5Yers4sjz0knyAhQqT0t9gP30rTkw=;
 b=W37SKZ7B14DIMY/jXVYjkV4DT1zTeXxKnWVZCwhds4RcirIEdDH18I6O
 P1ThwxHvcgBum7E8qoTiyYmJCpxUeO1OP47VGuSjzeehjk3AbdsuWkvVE
 iGHNLP6+7RoXqGbcJaLifD71HwITBLjrk5GdI1bPQybQ+78zuRu2cGfIA
 o4+FiA5zvEfmkoDWbPB/KAWTBdiHCz/d/0JtxVBlYokXOd2bu0EQKkRPs
 poNiGV50mZzoS9VQK+TdYHuA3aXR1UwXux605JHHd9MU8ipyaBxZAyHzM
 Kq6fEsKz+gY3iytcmhEZoSaq3+ZjQXLRVtddkr+xsWnke+O6kIaWtwWoi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357392603"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="357392603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 07:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718291297"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="718291297"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 07:38:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 07:38:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 07:38:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 07:38:39 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 07:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYF4uI8CfzQSazhq5fM8uucp8P/dCwHLm42AxhrwCFbV8pjMOQnuHeEZV+kYrKh1Pm0SoGhTIsncL7tbZ/ebOFqe8idk3mUpjzHQ3+pZ8Zs1ZjpRjcHEgfk1EZZ8hHzfO2h6aVvFaRtqBp2iZNYuowOzChHoVawKL7NzV4k7b70Fl5RJLR18o+nJyziSiI6a+ThGCMxBudSzpX3aDK3zOirdargZ6bNuYiK4DzY0jn6DEaLnJgDE54L8MTfk+i3ZsM+Em8GTXKUimrnF5pQUaq40RPI2O3KGninNwXg/iDQ120n3PXDi+yo9RHOxfwYuvVc9U4FCPEar38e5ZmHMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cht8S2GZC/3zGcsRs+IX5QiOSNe1DTR/PcK2xxqcyKc=;
 b=GcScgh+klWU7ofq4QSmOsKoIn372UhhIA8UjYaGAPdHYc5NnDkMgI3S8y3MV7bwKqjvQTM2acpdp0NIIzHv14OgYP9Pal8hIogIo93EA8lsjGu7bIPy1TRdH7SekRaJFUgbytJ+YJKTztk7xe1YgQxc00kb4bzYormeFX+NwU2Uzksc1WTq+1dKdhMs+AgjiT636PxME7cGLP3kEopcVKiy8Yu/+/wAVikcB5hnCKKYh/6WkeHu3jdbOelwxdBsrq2Eyi6o1zGITnGHzTjfKOBAdwdbTrLG81SMPr/rsVJuw2R6k+yRZ1n8w3KKQd40Jsx9TdODL8s39QPTVPL4mng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:38:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 14:38:37 +0000
Date: Wed, 6 Sep 2023 10:38:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPiO6VMKLu10Sq5C@intel.com>
References: <20230830123722.6-1-francois.dugast@intel.com>
 <20230830123722.6-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230830123722.6-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 2291fe8f-e3dc-4b5a-5054-08dbaee6f483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6GsGsentW/I3YgwVbKNSN6ns4NuCUxb+6FXfJpi5G2s2bb+abk8i5wDohsdzRzUv6ontx7Fg2C5/Nhc+hsdEvBv04qC5jgeFvWIxsV0zZODl3HZLgoTYUZJqBIIN94gOz0B474N8b98qcY4S+RG6z45Gj8qujrF64H7+594F9+rJcFXW413v4c9KbUSIxE5w/b+1bE9TeM1GhaBjrAOBB2bzhQjagYCaAY8JH1G291krQeSg2l5ipoW6l6BKoWKuANytYeSh62+A5WXpjM/cA2iB/0vnCe+9XXjFhi5EK6ScA8uP7hfgJqwdN4r1MsFti53CMBadVsDjXQByLl1qJVL8Z7FJkxVRxm6HNJ6uky1bhUM+aERnpf6Fj1v6VE7Lwv+anSkKRmc9REenehgx/WQDW7bbRGz7x5pOyKay6NlPPveNTbhVzAM60IkCuHU8vBobWnA5zFe8NXZfSVIx0WADamL+ow/kGxRo/GhWwhRceipvP0Jn57fM4+dLsl8Rs8T61SEpG55bHJz2BP8VqgLtvlAUbWpSK9z5pqF723NZJrxu3NVyvRlhbrKq4Di
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(2906002)(26005)(66476007)(41300700001)(6636002)(44832011)(37006003)(66556008)(316002)(66946007)(4326008)(5660300002)(8676002)(6862004)(2616005)(82960400001)(36756003)(86362001)(38100700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XPR1SBTjoBJLNXpwnXIV54TETWz0QaV+5VWDgjXhUUaGwYUYscMPsy+bDYjh?=
 =?us-ascii?Q?ixUhuZZuyt63AFFgG/2lp3avVz05K8L2Pte5VSEi/6uQV4fYzk42Nmll6oeY?=
 =?us-ascii?Q?eprjNWAA4hNGXOGopjzZEXVXCcBLX3MA7C95MMpzQ35luinYRIa3gQgoUmFs?=
 =?us-ascii?Q?GMQNwnsT9vSnOIBXnEe0ZFtqpODsk2lwJ7DUD3uQDX6KL/m4QNiw4z64OFfa?=
 =?us-ascii?Q?mbDJGQ35cQl/nZBzLNhnsQ0PoRycAkg5Bj9u9O7Hm4dG5QF+a/IpGTgiIYhD?=
 =?us-ascii?Q?rAzriuIpSNJabzaPRM9m85SKupjaw/3K0t/S64Xtz0pVca9I3boqmEMRgIqi?=
 =?us-ascii?Q?+pVEIanNOCXfJwJV7yGkXAgSsMYS0hjrea4Kj+elsd/++klxzHJBdnblstZJ?=
 =?us-ascii?Q?N8FofNc6QR8vtJ9j5nJ8hSQ5g09l0UO5eBFSjlkVGPBIOIy9g/DZEUa8AK4x?=
 =?us-ascii?Q?+daa0SCPpsu7s7vhn2LMSZ55w+noZU7jcdU4zmSl9iS9q9BW/13gMwapye/F?=
 =?us-ascii?Q?QcWY5/duXAY3RzPoJIaYn7yxHkLO778ZgUhEU6KQjImbMLknsoA7SZ7eyh1L?=
 =?us-ascii?Q?jSjvkFId8VXuZE9KqbSQJTEoLsQOBgWymatpiTdmZPZQ3su98Tb/1naU6W30?=
 =?us-ascii?Q?nKqEJPV1KMpQTn5p/EQc9/JpNCcgJ0FgrQs4dzX5uYHSVYIutlcgevfrZs/o?=
 =?us-ascii?Q?XGfq9eAE6LCdZi15G4TwPiZUjhCN2wImLt5q+Y1x3ULxaHMKsYpGnhXchpBm?=
 =?us-ascii?Q?2k8ZjOE4io1v+q3HgFt3sEIlRQwHh+bjvI8HolOO8uR/4wbGcy24IPwMHNPG?=
 =?us-ascii?Q?oiYmucooU/u8nydW2QA7hT1K2DqzK8u82UvIITEm7IB9CBt2VD5EIYYjq8LP?=
 =?us-ascii?Q?10NWGGnhfgOQgTl4FjkV3yx9c7kZgXCbr6x7fDrqhEZkzlp3Qz4m5UU3PTAb?=
 =?us-ascii?Q?C7EdgOuFtIAnswIRIEZ0JeNsxBNxKVMIUHucuGHC3BqREjtr9BIQHAOq6Hvt?=
 =?us-ascii?Q?lExk2+3KZVvE1+gzOLXsk+x32YUnLXo7bW/wqy/T0aKDrYpkFD81oebl0zcm?=
 =?us-ascii?Q?xydtAQKvoUyiUhPPlPjP1Bvn0BlDSyLTN5IWP2ZBZ1RMLbLjA+lAZKHLT5Wm?=
 =?us-ascii?Q?r09cODvH7kQKBJmdTblt8k+Dj2RZ6FmUU5xbYmTZamO/qhrB8w/CRAFKS33g?=
 =?us-ascii?Q?DX/HdTf+K+HNGpxyTpN+djMZG9ug9sflDfxZmqD6CIONRagciuEEVhA3iJ0h?=
 =?us-ascii?Q?Grb+fKeevG5X1qzl/4oMuNXZYH5yVpDCDD+nA442dxCaiAIVg6/rCFdqn+4C?=
 =?us-ascii?Q?r3zvvzYkgFq4/J80c+WrCaTNwr9x82GSQCaZS8GBqNQNwZijGRYKgZ1Mm+EC?=
 =?us-ascii?Q?C0uiba4dDx348CMnUaVJ2EOHbHWjOhSJo2yvJW8+aH7XC/kPtKiDJ9EgikTU?=
 =?us-ascii?Q?nOtK0kKEuJZe7SpFMRr0iIi+tkeYX8EPiwFxh8u02pyjJibmC4/hxBWpcr9P?=
 =?us-ascii?Q?V02NUfo7nYJQTVhtzwaqnQixxhkH+QuDRo9ip93zQDdm32d/ppXR+9AQAboj?=
 =?us-ascii?Q?woVuNB/wrFNKX6HN3eGceLjpQB4mtyBotG1uXoe8Jggdl39BSKRXSgzDXJ1N?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2291fe8f-e3dc-4b5a-5054-08dbaee6f483
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:38:37.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byKXvmSIDaERwCwcNIxffn786EYG9iat4qaPXxEJyagyxxjY6+0LakiLAFgE0/AqyhzUv/53mK66KcWHrKdOYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe: Replace XE_WARN_ON with
 drm_warn when just printing a string
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

On Wed, Aug 30, 2023 at 12:37:20PM +0000, Francois Dugast wrote:
> Use the generic drm_warn instead of the driver-specific XE_WARN_ON
> in cases where XE_WARN_ON is used to unconditionally print a debug
> message.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   |  5 +++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  9 ++++++---
>  drivers/gpu/drm/xe/xe_vm.c           | 18 +++++++++---------
>  drivers/gpu/drm/xe/xe_vm_madvise.c   |  2 +-
>  6 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b871e45af813..9229fd5b01cc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -151,6 +151,7 @@ static const struct drm_info_list debugfs_list[] = {
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
>  	struct dentry *root;
>  	struct drm_info_list *local;
> @@ -162,7 +163,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	sprintf(name, "gt%d", gt->info.id);
>  	root = debugfs_create_dir(name, minor->debugfs_root);
>  	if (IS_ERR(root)) {
> -		XE_WARN_ON("Create GT directory failed");
> +		drm_warn(&xe->drm, "Create GT directory failed");
>  		return;
>  	}
>  
> @@ -172,7 +173,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	 * passed in (e.g. can't define this on the stack).
>  	 */
>  #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
> -	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
> +	local = drmm_kmalloc(&xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local)
>  		return;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b6f781b3d9d7..845cde2fbd01 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -328,6 +328,7 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct pf_queue *pf_queue;
>  	unsigned long flags;
>  	u32 asid;
> @@ -346,7 +347,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
>  		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>  	} else {
> -		XE_WARN_ON("PF Queue full, shouldn't be possible");
> +		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
>  	}
>  	spin_unlock_irqrestore(&pf_queue->lock, flags);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b92e04ba8f63..13f2bd586f6a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1022,7 +1022,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	default:
> -		XE_WARN_ON("NOT_POSSIBLE");
> +		drm_warn(&xe->drm, "NOT_POSSIBLE");
>  	}
>  
>  	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c6a9e17d6889..0a6c938ad3dc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -703,6 +703,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  					  struct xe_exec_queue *q)
>  {
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
>  	set_min_preemption_timeout(guc, q);
> @@ -712,7 +713,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	if (!ret) {
>  		struct drm_gpu_scheduler *sched = &q->guc->sched;
>  
> -		XE_WARN_ON("Pending enable failed to respond");
> +		drm_warn(&xe->drm, "Pending enable failed to respond");
>  		sched->timeout = MIN_SCHED_TIMEOUT;
>  		drm_sched_run_wq_start(sched);
>  		xe_gt_reset_async(q->gt);
> @@ -794,6 +795,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	struct xe_guc_exec_queue *ge =
>  		container_of(w, struct xe_guc_exec_queue, lr_tdr);
>  	struct xe_exec_queue *q = ge->q;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct drm_gpu_scheduler *sched = &ge->sched;
>  
>  	XE_WARN_ON(!xe_exec_queue_is_lr(q));
> @@ -828,7 +831,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret) {
> -			XE_WARN_ON("Schedule disable failed to respond");
> +			drm_warn(&xe->drm, "Schedule disable failed to respond");
>  			drm_sched_run_wq_start(sched);
>  			xe_gt_reset_async(q->gt);
>  			return;
> @@ -906,7 +909,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  					 !exec_queue_pending_disable(q) ||
>  					 guc_read_stopped(guc), HZ * 5);
>  		if (!ret || guc_read_stopped(guc)) {
> -			XE_WARN_ON("Schedule disable failed to respond");
> +			drm_warn(&xe->drm, "Schedule disable failed to respond");
>  			sched->timeout = MIN_SCHED_TIMEOUT;
>  			list_add(&drm_job->list, &sched->pending_list);
>  			drm_sched_run_wq_start(sched);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 15bff0783ec9..cc4fd885c264 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1388,7 +1388,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
>  	}
>  
>  	if (copy_to_user(address, &capture, sizeof(capture)))
> -		XE_WARN_ON("Copy to user failed");
> +		drm_warn(&vm->xe->drm, "Copy to user failed");
>  
>  	if (in_kthread) {
>  		kthread_unuse_mm(vm->async_ops.error_capture.mm);
> @@ -2190,7 +2190,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
>  			return -ENODATA;
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&xe->drm, "NOT POSSIBLE");
>  		return -EINVAL;
>  	}
>  
> @@ -2248,7 +2248,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&xe->drm, "NOT POSSIBLE");
>  	}
>  }
>  #else
> @@ -2340,7 +2340,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		}
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  		ops = ERR_PTR(-EINVAL);
>  	}
>  
> @@ -2585,7 +2585,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  				/* Nothing to do */
>  				break;
>  			default:
> -				XE_WARN_ON("NOT POSSIBLE");
> +				drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  			}
>  
>  			last_op = op;
> @@ -2647,7 +2647,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  		/* Nothing to do */
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>  
>  	op->flags |= XE_VMA_OP_COMMITTED;
> @@ -2765,7 +2765,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  				     op->flags & XE_VMA_OP_LAST);
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>  
>  	ttm_eu_backoff_reservation(&ww, &objs);
> @@ -2824,7 +2824,7 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>  					  op);
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>  
>  	return ret;
> @@ -2900,7 +2900,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		/* Nothing to do */
>  		break;
>  	default:
> -		XE_WARN_ON("NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c9bc59be5094..70ec2c07a3bb 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -192,7 +192,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>  static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
>  		       struct xe_vma **vmas, int num_vmas, u64 value)
>  {
> -	XE_WARN_ON("NIY");
> +	drm_warn(&xe->drm, "NIY");
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
