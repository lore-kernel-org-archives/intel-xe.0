Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E4AC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE210E20A;
	Tue, 14 Nov 2023 13:45:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB85210E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699969524; x=1731505524;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=idB3AawXWLMCPnLl73B1GfLQo2MU8qSrHu90SSuPPhY=;
 b=DTwTpLlcVWubmM8+nP704U5IRI6p9de99mM/DlsRk16Mp1UnuhssQ0fq
 P7kS4tx6q++ILMV6oOs+CMCi5FsAqfUzVLwWp9u+MGVzSWtJ4zN4dUpSm
 d8znQ+Rezr1ibf8kOic8D+Khu77KnpryBUk15BvI4QBj1M4W6rmxDphMP
 LGxp0iIYw8m9l340XXQS8WB5uwEdwcB/srAtEhDxI60X6Tt47LbiZA/VA
 LlssStWe9dsIdkOpuQlj1DQvqhbQRDdjoP1u5NrtjmT5W0r5Uk7nfUGxw
 k3mATIBG+SoV1PXtenB+313nIvpmByoSKQwl5Wu9IZnDmfEMLxviPgXSC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="9295600"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9295600"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="764662380"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="764662380"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:45:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:45:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:45:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:45:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:45:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLPMvkGNUtfGa4JfxzksgDu3J2DhwYa9epQ8g+/avPgZ9hoXYqH04AwV4q+GtTVP9M6yde+uf5G8HOy8cYr0cc1Hl1KMM2CEURsq0mnfRA/2JKgHPWgPyA9DfN7pDDz5W786gGj+QlkL/+YAcb7OSqqx3lGx8TyEgZop3Hfu8rgW54oLj506aDmpWEWBb4Na5+EgNjLbAq8XPvGSi/KrsYjQ0KhrWjOO/JPV0TgjZH+JF8f0ZvsYm4x2MWMdNWqhO0q0xs2yQJXwVUUg2GvWaNWeA2EJ+ypTzX7EymHzutJtPJKA8f4joEE+Dd2cMYo9uRPrbqGGxAXkUbxeCHoY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP9BZDLv+wS5yUMnO+6NdHF3QjCJNyZWl0Tddogc9zk=;
 b=XCTcv5NcY35/Ln4/IwWpKKZKfX672nfD1n7f0bejHWglqYvnVBMakXlw9h0PCHxD8lDZF4ISW29Xqmo9E785HQEVmenHwZQX2Z6+qxsmR2+PRyqZF4roAAhJtWpsxsxSyZNvauN1aWMKSkmeVVM5hBfdZJ5BTZJrwngVKhryX4tIFUaKxM8dlrzlV6igcGdEEboTDlVSBXegJRhu5tLotiyG8eoNaf9j+8wDnImlvCV/9LHznN+5LxtJCSeCyxjMeGh3oWri7s0za7F6q9sSX30hmAYV1uJk8EKNJIYrZSqeZNLgFuRP90/5Rl+kpXVc9b2VYnNftGu4kToYSCTGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 13:45:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:45:19 +0000
Date: Tue, 14 Nov 2023 08:45:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVN563dvkPBr28zM@intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 8202ba08-0718-4cd6-48df-08dbe517f0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XM4/5MrDhENxRZekpvjMSzsqPWw/qMEWSeRIoTWbLRIGNzEm9TKw5kRkyKHH9WeKC88mdQ1nsgY4Wl0MXHo2fyhUVvmC8ncAMyjOG4T45BPdO1/A9ro7qmmfhZFZ5RVn1M6LKOysa6XHnT8AMpGVBt79pRNfyak/5lPhktLDJM+pQrt3zUvJvx7DDZ05K8dOgL+3iRHAZ9s71TUQxG7oxtD6LvxcYQ8Kdyao2NnhvKqZTWimts6ND5uW7XGM0mlcGCrnva3KVIVV0luL+/Neb2TjO5hPpd5KUEuNNEzNHm/jC39L2mbyshpKMWr/+5DaTAPW2XNWN5WRS8TWxjBkWGnHUpAF9EjIXUknSr34tsPTK4Pvsl2T1A5RkAFKK5MW6T/BtI8VsPlpLwqHiAGbeEPbO7nSHejACr7DmIDLCfNDOQbraf21bcGWshOgVDTEydiEV/rw30hWkq8jGpJxPfwpKFlYLb14a2ZApTCmCyUW9Q7GfQbg4qVU38x6Pn9z/jrtwfuyK7YCIUv9tC4dAAD5xonVEVdaqYRF9qcHZepJ8KEIH1IO+yfSKh29U66V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(316002)(66946007)(36756003)(66556008)(66476007)(37006003)(6636002)(8676002)(6862004)(83380400001)(8936002)(30864003)(4326008)(26005)(6666004)(2906002)(41300700001)(44832011)(6512007)(2616005)(5660300002)(6506007)(82960400001)(6486002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bqdq8ZqBeS3Xdy+NecvIoa71WTIr1q35lQV1TXLFM7JX5ZEXVF1htZrFfjWY?=
 =?us-ascii?Q?oBUFTaN/rDUkPBHUOdTbHjxQsdSVJ/ENfYnq9EaF42dX4UqMhCYFFQHgeBvn?=
 =?us-ascii?Q?hd9dGKVdjKoFuXu9sRjKZvlcbjO719gxg0S3NaAiSOzHX2dOGzhqGsLRhTs7?=
 =?us-ascii?Q?A7Jbpm+/aTb1a93ypo0gv68vBgQ0Kzt3H4yutgDouhhR8bAE5fr2fw/77iOG?=
 =?us-ascii?Q?+QV6a1c+hyw10o21zzz6jhXfSLJP+zBx+RgalKMOASohWSYNUa/p7q+BA4/t?=
 =?us-ascii?Q?WXErThTNfE1cUcB9WHR99lojgnnfShnNXHM1iIndp55OTxm2NzKLOmU9sLUG?=
 =?us-ascii?Q?2OJ56CgdjyGr1jImeTYE3Qs06wY8DfTBhVf9F6hbmXeYrELNkxwXu9iHHtKk?=
 =?us-ascii?Q?PjfIsAAFA8ZHkiIQav5BeNnr2kRgP+qtM//a2oi2uyE/4+8lylh4kq/lojFH?=
 =?us-ascii?Q?vlSjNS+HFFDDcwucpSCYCz3HG/Rpnf81S5/fc1eTcsUK51cdXXPcqKK3m55+?=
 =?us-ascii?Q?245B/twohsZi0LKYUeQ3m7A2n6Cxt9DAeoRVUEnBjPa2N+diI3UxThXB6UW2?=
 =?us-ascii?Q?gIIufa0EEIm1e25y3HLF6JRSqzaUco2hiKKuYjNTit1Wk4YO7iNih222jDm8?=
 =?us-ascii?Q?1PFGy0OvoycTiT9I+V9kr0+oMoLxokhvp8NcabKrMpWaLbdxpqUBbG3pRXI9?=
 =?us-ascii?Q?rUEQ3GKbJF2fn+nmeQHyFoixPUFGiiNKUHZA2QkyesNvWEke7EpbUL4EYI6D?=
 =?us-ascii?Q?boEh4klTilii8Y3EzTT2kGqXnKVm9qXBaM658mmGRv8UF/6RHLIvymCWJJOq?=
 =?us-ascii?Q?0U7h8gIEgj9eTeJU5ZNGkIiAPTSVcdlCAKT3xuZUXQfB0QlUg1CZ5qJ2wIZ/?=
 =?us-ascii?Q?nVB1gLsnv3WqDFo3EFjWf16sbp1BjmYrfAJ7Kxwu4kLZm9NdUCMqCNvek8lh?=
 =?us-ascii?Q?LCx1FbvGMY36eMTlshqclnIkfE4iZW7c/N4RLTL6ZVl95edLvgCKt854xHoE?=
 =?us-ascii?Q?Gtu06RRAxAv1Y1kKJrQxw+wsM2Bxt+y2s//MX6qoMI22q1Boqu5C9N/Lrnq6?=
 =?us-ascii?Q?VGkwz8XUoSu/GOp8R5yusEbEknYo+U8O4c2GRqUF5amzpdtICjQowaeYxHVH?=
 =?us-ascii?Q?LfmKvlw4PufgkvyNPepy8qbMWorGZBWfo5PXfYiv+BD26Mzi9XAdQtHpiLyK?=
 =?us-ascii?Q?b48n7p4w8x8iK5dmUApi34G5fu/AP/EQ3PQSdBuyGfvq+ILStHlrw1/b/WjZ?=
 =?us-ascii?Q?ML/dTvvACF0c0VY0s/mvUBn1U4+pyUIVgmKEFybOuNtq4AubW3E1C2awBpRx?=
 =?us-ascii?Q?Rgrp2ZiwYyeyMWw8/5W0kmvUA1sKlgZhmN0EBuPoZn6T4hkUSBM97F9Ii6HN?=
 =?us-ascii?Q?jLVX3OwUX5uAN2uxbDB5ePf7T2Q/FP4pg/4ZaYsJGDYLZ7/yuAwOVqOR6HEb?=
 =?us-ascii?Q?2arntSfInoyz+P7ItJKc2P3CrNF07c9WM4dGAIcC8P6nNW922x9fvvZnwZbA?=
 =?us-ascii?Q?ulH9qDwSH5wmngl9Vge1LphEmmNyvsQS9nyY+02RpqJAdQs2ord0cmgoJ84r?=
 =?us-ascii?Q?LiYLDwyF/o8UEVSxaRIP//661FH1U+iLORkxeZRW2m7BtShXVrRAZJbcIFyL?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8202ba08-0718-4cd6-48df-08dbe517f0c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:45:19.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iE8LwKoJ8mefMV9RW6VLBYTA3P6p1cmZ1Cnn3avwmqjdMCFNWA+Y4qz9OA7zyZWKVDIqJtD0ilTZkRvmw+8Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 2/8] drm/xe/uapi: Add _FLAG to uAPI
 constants usable for flags
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

On Tue, Nov 14, 2023 at 01:34:28PM +0000, Francois Dugast wrote:
> Most constants defined in xe_drm.h which can be used for flags are
> named DRM_XE_*_FLAG_*, which is helpful to identify them. Make this
> systematic and add _FLAG where it was missing.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sync.c            | 16 ++++++-------
>  drivers/gpu/drm/xe/xe_vm.c              | 32 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_vm_doc.h          |  2 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 10 ++++----
>  include/uapi/drm/xe_drm.h               | 30 +++++++++++------------
>  5 files changed, 45 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 73ef259aa387..eafe53c2f55d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -110,14 +110,14 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		return -EFAULT;
>  
>  	if (XE_IOCTL_DBG(xe, sync_in.flags &
> -			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
> +			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_FLAG_SIGNAL)) ||
>  	    XE_IOCTL_DBG(xe, sync_in.pad) ||
>  	    XE_IOCTL_DBG(xe, sync_in.reserved[0] || sync_in.reserved[1]))
>  		return -EINVAL;
>  
> -	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
> +	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
> -	case DRM_XE_SYNC_SYNCOBJ:
> +	case DRM_XE_SYNC_FLAG_SYNCOBJ:
>  		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>  			return -EOPNOTSUPP;
>  
> @@ -135,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		}
>  		break;
>  
> -	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> +	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
>  		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
>  			return -EOPNOTSUPP;
>  
> @@ -165,12 +165,12 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		}
>  		break;
>  
> -	case DRM_XE_SYNC_DMA_BUF:
> +	case DRM_XE_SYNC_FLAG_DMA_BUF:
>  		if (XE_IOCTL_DBG(xe, "TODO"))
>  			return -EINVAL;
>  		break;
>  
> -	case DRM_XE_SYNC_USER_FENCE:
> +	case DRM_XE_SYNC_FLAG_USER_FENCE:
>  		if (XE_IOCTL_DBG(xe, !signal))
>  			return -EOPNOTSUPP;
>  
> @@ -225,7 +225,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>  void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			  struct dma_fence *fence)
>  {
> -	if (!(sync->flags & DRM_XE_SYNC_SIGNAL))
> +	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
>  		return;
>  
>  	if (sync->chain_fence) {
> @@ -253,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			dma_fence_put(fence);
>  		}
>  	} else if ((sync->flags & SYNC_FLAGS_TYPE_MASK) ==
> -		   DRM_XE_SYNC_USER_FENCE) {
> +		   DRM_XE_SYNC_FLAG_USER_FENCE) {
>  		job->user_fence.used = true;
>  		job->user_fence.addr = sync->addr;
>  		job->user_fence.value = sync->timeline_value;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ca4abbb86585..76926ee756c7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1918,10 +1918,10 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>  	return 0;
>  }
>  
> -#define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
> -				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
> -				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
> -				    DRM_XE_VM_CREATE_FAULT_MODE)
> +#define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> +				    DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE | \
> +				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> +				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file)
> @@ -1939,9 +1939,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  
>  	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> -		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
> +		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>  			 !xe->info.supports_usm))
>  		return -EINVAL;
>  
> @@ -1951,32 +1951,32 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE &&
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FAULT_MODE &&
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
>  			 xe_device_in_non_fault_mode(xe)))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
> +	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
>  			 xe_device_in_fault_mode(xe)))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> -	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> -	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
>  		flags |= XE_VM_FLAG_COMPUTE_MODE;
> -	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
>  		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> -	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  		flags |= XE_VM_FLAG_FAULT_MODE;
>  
>  	vm = xe_vm_create(xe, flags);
> diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
> index 516f4dc97223..bdc6659891a5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_doc.h
> +++ b/drivers/gpu/drm/xe/xe_vm_doc.h
> @@ -18,7 +18,7 @@
>   * Scratch page
>   * ------------
>   *
> - * If the VM is created with the flag, DRM_XE_VM_CREATE_SCRATCH_PAGE, set the
> + * If the VM is created with the flag, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, set the
>   * entire page table structure defaults pointing to blank page allocated by the
>   * VM. Invalid memory access rather than fault just read / write to this page.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 78686908f7fb..13562db6c07f 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -79,8 +79,8 @@ static int check_hw_engines(struct xe_device *xe,
>  	return 0;
>  }
>  
> -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
> -			 DRM_XE_UFENCE_WAIT_ABSTIME)
> +#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> +			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
>  
>  static long to_jiffies_timeout(struct xe_device *xe,
> @@ -107,7 +107,7 @@ static long to_jiffies_timeout(struct xe_device *xe,
>  	 * Save the timeout to an u64 variable because nsecs_to_jiffies
>  	 * might return a value that overflows s32 variable.
>  	 */
> -	if (args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)
> +	if (args->flags & DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
>  		t = drm_timeout_abs_to_jiffies(args->timeout);
>  	else
>  		t = nsecs_to_jiffies(args->timeout);
> @@ -137,7 +137,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		u64_to_user_ptr(args->instances);
>  	u64 addr = args->addr;
>  	int err;
> -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
> +	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -206,7 +206,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	}
>  	remove_wait_queue(&xe->ufence_wq, &w_wait);
>  
> -	if (!(args->flags & DRM_XE_UFENCE_WAIT_ABSTIME)) {
> +	if (!(args->flags & DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)) {
>  		args->timeout -= ktime_to_ns(ktime_sub(ktime_get(), start));
>  		if (args->timeout < 0)
>  			args->timeout = 0;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 3ef49e3baaed..f6346a8351e4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -585,10 +585,10 @@ struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_VM_CREATE_SCRATCH_PAGE		(0x1 << 0)
> -#define DRM_XE_VM_CREATE_COMPUTE_MODE		(0x1 << 1)
> -#define DRM_XE_VM_CREATE_ASYNC_DEFAULT		(0x1 << 2)
> -#define DRM_XE_VM_CREATE_FAULT_MODE		(0x1 << 3)
> +#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
> +#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
> +#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -831,11 +831,11 @@ struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_SYNC_SYNCOBJ		0x0
> -#define DRM_XE_SYNC_TIMELINE_SYNCOBJ	0x1
> -#define DRM_XE_SYNC_DMA_BUF		0x2
> -#define DRM_XE_SYNC_USER_FENCE		0x3
> -#define DRM_XE_SYNC_SIGNAL		0x10
> +#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
> +#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
> +#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
> +#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
> +#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
>  	__u32 flags;
>  
>  	/** @pad: MBZ */
> @@ -921,8 +921,8 @@ struct drm_xe_wait_user_fence {
>  	/** @op: wait operation (type of comparison) */
>  	__u16 op;
>  
> -#define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> -#define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
> +#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
>  	/** @flags: wait flags */
>  	__u16 flags;
>  
> @@ -940,10 +940,10 @@ struct drm_xe_wait_user_fence {
>  	__u64 mask;
>  	/**
>  	 * @timeout: how long to wait before bailing, value in nanoseconds.
> -	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
> +	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
>  	 * it contains timeout expressed in nanoseconds to wait (fence will
>  	 * expire at now() + timeout).
> -	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
> +	 * When DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flat is set (absolute timeout) wait
>  	 * will end at timeout (uses system MONOTONIC_CLOCK).
>  	 * Passing negative timeout leads to neverending wait.
>  	 *
> @@ -956,13 +956,13 @@ struct drm_xe_wait_user_fence {
>  
>  	/**
>  	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
> +	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
>  	 */
>  	__u64 num_engines;
>  
>  	/**
>  	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
> +	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
>  	 */
>  	__u64 instances;
>  
> -- 
> 2.34.1
> 
