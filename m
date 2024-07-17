Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D0FC3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 23:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA4410E494;
	Wed, 17 Jul 2024 23:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUAwAelT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EDD10E1DC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 23:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721258932; x=1752794932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bOWKwiqa7wgA4qr+iVHLYubmRi+G/78yO04zwyqQX24=;
 b=VUAwAelTAoDT/AZvQm23wDM0Jrdaqt/s+dq0ErJDKPKPA8+xFttO4Dch
 AU+pqDG6lkRIhqH7GN9Pfmrk6kRdFcqg2yMUGl22GlkbGeEuZBchYBEZl
 yUSyKr36GIuefqXpjUur0g3A6gud7lC0nPC8DG18PVX1ZPuOKYiVHdcen
 tyVchy9mT4gSgDv393/9a1hsxcYAe8ycQkE5C53+ApVLFMOap+3ZO8dQg
 Y4XHmheljdx4KsTeqWuri56Fv0Wr+km5t598HRuvw4VVBmd1e7Yvv98+2
 D59a8k43r//fq345ZiRIxk0qFanLgcYwrmDw1Ij54JZuw5MPO8y4tb89a g==;
X-CSE-ConnectionGUID: 7Y8ww6zYQ6GOhNbtQrb3+A==
X-CSE-MsgGUID: 6HbqeD9/TgujMoczhPakVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36239929"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="36239929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 16:28:52 -0700
X-CSE-ConnectionGUID: J+xzOCMOSVCI1Tt/n2uhng==
X-CSE-MsgGUID: dyG80+/yQnGprxIDiT82UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="55697487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 16:28:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:28:50 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:28:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 16:28:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 16:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqjoQk/rIOaIe21DWzypMywefSPgw7aIVdEq79dHMWDU7fc9o18GHhTxzwqMfwsO8ugadc8YMUbWPiTQsKfHgHMj/K86ValtRSNlrCQOTUOeiXEyozoI4pD2+qitw/kjvmpMFB6yKGT4hOaaqlqwY/ADFuq2kP8bAVvE0JK9esZkmaVd5gEGW4eXMOTQytgPQ+JqwhuFDLV+74gbHXBXlc60t41CbYG8Fg2BUTSytcWP9Tlt6MGqDJbbbP8btthCWPu8Yt7B2DJnp3vGaVrz9q6ml9prZz4bwP+Sn11z12UDrm6YHctu7NdlJPAoZfYuCD57btpXZIVxbS7Re2dNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbnmYLAJ4bfrmSQv3TKNb5QBoMNkwql5g4MzSB9klB0=;
 b=oH0W1vWPrN+9j2SPW+Kb83jeHRaHU7eun111q+7kDvXRunWnyRio29ZRWbfgRoU7iwxcKKI2wSunjLGDq0Q2b4/OihSqbK4VnwSNy8pk09X2tO8V7L4BKOF/uXo0Ki/osaovJnY/pSkU3Q0kE4yxKZjMN58voyxXhY8nhnlizaHQr6fswKTF//zP3qoaN2HCkQZSFw/R7icXnrpxlfsXbPjTH7MeWaC+T97++e/mYwTK3k6vWWE7IqmHHiOXmI/FuniZVO3PATqYLv/wGCqx0LjCapuSLgt4A/vf9aTFe2bqSrx01Xffqe7iict7CDcxZfAyXaR8tmIR02v2eXcHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 23:28:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 23:28:47 +0000
Date: Wed, 17 Jul 2024 23:27:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Message-ID: <ZphTfBPWb9JqY5TY@DUT025-TGLU.fm.intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711171155.173717-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db514d1-57a5-4564-3ef5-08dca6b83505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5TPLv6QIPIbSNw+1TTCdIObrI4hPdA/lYfoJiJeRcCz17IqO7Fo6WG0YJBSU?=
 =?us-ascii?Q?BrXO/9xcj4HhGNLHhchoEKinouofFhBwVK1w0av8ANCNWw+vm4ZDpD7VA0ST?=
 =?us-ascii?Q?eBTMFTqXsMHhR3covNV0/9PAQHQgIx5q/KNMRiBCVY/KhZEb/ShOgiy1z5Jl?=
 =?us-ascii?Q?rUOH9EEtMOh61YcO0tzWW6zK+jzuBdUab3Z1wuaGYC+FJLKaclgQWHnPDDDB?=
 =?us-ascii?Q?MEcujEQNYVhReDr/WCNE18WmKAEJz4UuXciDhPsfI/ADZvrA7g1slzLk0P81?=
 =?us-ascii?Q?0ayAN8HAuEA6vwq/nl7JHCuh812rW5bxJHmOeTlCypvnzyz0q7hYnLHRPZJx?=
 =?us-ascii?Q?Fvq6C3YQ/R09ZeGO2TPw3nym+4OYEcuaFZThQnUZmNM66tTghcY84TbUImSL?=
 =?us-ascii?Q?oB9QeoiXzAPmPoD6t8i5acCRLu6L+qBF+4WZeZgqnrzBq3EMb98bJZ7kzUBs?=
 =?us-ascii?Q?zPGyLtNX8dGeIjyCVGbDz0qbD4QVE82dGvqNJcuYAUOxKUp3JqkRjlklnXsz?=
 =?us-ascii?Q?mnmAA79SpD6Ld7NXI3XCzVULG50SbGc4bpaFDiIB8PReqresIX6DBINBYGmh?=
 =?us-ascii?Q?DURjjHjl+sVXMlNhLDkfZuzVUoItV/IFWs9Y1XK0s0Xng00BtoN5B848+kEL?=
 =?us-ascii?Q?Or4F+PKgeUHh+5Sn8J2ADYlNty/3Ncc/tmFRdRIT4LfW3ZKzI8VQEJaMmfgk?=
 =?us-ascii?Q?9q0x8IIwva/s6KOjSJBsapHqJdGDQjh+PtgV5rDXO7CPqLVPu7Rk9/Smbg9n?=
 =?us-ascii?Q?1mBbnaQNp/q5ck80meJ58tnUPtcNhNOKXCRMZ6L5s6U3y8N540QvHITGAC1b?=
 =?us-ascii?Q?VCFqy+tp83lv38oWmI0fBEF/fde3ggSIbS25ZPKmccXcqxcjA5dOKR0qUFNi?=
 =?us-ascii?Q?HeJATk1/gB3FeeksdH8Xi9dZc9Sjv79kdoZGBC9Jmg+Ot6h+Vuf4SvKm8J2H?=
 =?us-ascii?Q?dS7J0pjzdVTA38vQn4iUZTihm5HAIt317p/t3lMulOpPdkN0bxl/iU3Ig1od?=
 =?us-ascii?Q?VNvKd0ep66uQQhMvBaO9DD+X9tjre4kV6gRox63YYG5CS1lRxSu42ps4amc0?=
 =?us-ascii?Q?CWEtuimmJeOT5KH6ZUOtWxQO807mTDYSYRatFT/uPiwZ8K2eyncR5noyX72V?=
 =?us-ascii?Q?unwHVte2ywK6k/TDyYHUsp9sR3VvlRKejl2lPk4XLGrSxPlxEaAqJcrXWX8t?=
 =?us-ascii?Q?LIeT/N8hIv06l07wFrecX07+zDeRyW+pUavOsvjW8SQ2+YxCZJ8qf1GX1w/N?=
 =?us-ascii?Q?RnIdWQ1n01ieNzUYcoeAhjf/BUMtc08C4xPfSK9CCzt6Nime820feIP/Omm1?=
 =?us-ascii?Q?9WCBTDecRqXyLKU1qs7EqEPdijUYhBtRhAYVEopp8AuVNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XYLjAz/7Xtg6YRrCv7Z+EhLRnDDSdxIs9yYC0vb9AZwbNkkCcxcIFJaIWHbj?=
 =?us-ascii?Q?/zGAupv43i8PnSre6OBfs+8ow76lEeEQr76RcNSGPnSgf0FZw89mv2Xvr4B9?=
 =?us-ascii?Q?W/NjoSYbwog7/Y9VF3zVEeVX8eq16yhCviCDw5amcnfC2fO1VQ7Jx8+k+Isg?=
 =?us-ascii?Q?u3DIuK7rx/enZy+sYEFj2D4dL4dotN3PpCtpb4LC3/xQwVYhm4YWTkHSJy+4?=
 =?us-ascii?Q?nncGQuPiBomMIhtnUL7Z6ojKv2pOiJfpG9oxGNsJ3LyNcUuR5CeO4BwDwEQd?=
 =?us-ascii?Q?j5PhESxb/GepEV3scT1VisjfoiqgiBlMUXaC3r7KcIoxuxsBOhL4N2tIPGIT?=
 =?us-ascii?Q?xLeeinTRfZxZxu/1MKncqieQoZfsZ03MpJryANwZeGzp01Nu2bZcg5+xX8u2?=
 =?us-ascii?Q?sXv5A9Oszr/5NBik5iQjR/O+hkExszsCLM0XlNmSyLm/I9OFlsf2GVyEyeDb?=
 =?us-ascii?Q?o14dEzQo3SZDzeOvXyE9THEWxxEkG6V95n6mpBTDFyPxcYv8llLPEh0ApE/s?=
 =?us-ascii?Q?B2p2n6O1bxp+lj1C1sbApMWSafY+OZQ1oAR0PBtIVxES/FnZGZHyxFUgsUGm?=
 =?us-ascii?Q?FBjl14qDkE/UmOx9Nke9gHTHFFDY+zM6HiWq8vfdV+pXIV7KPRmnwHGK5I5F?=
 =?us-ascii?Q?8RYYQnh7uWGng5frwfnmfGWzWBmReQHl5vPYTultWMhkO56jRTaMYuG53ISR?=
 =?us-ascii?Q?w+7ST+QfizxoGLNsjhJa3SSBWxchwdmjtlNrdHoW9uQNdjKZnN6NxCWIw8ut?=
 =?us-ascii?Q?vrpAZXRfaCuehug9+lmIAlDIJ+pNzUtysH8KncELb/qshjWxy/T5i+FNPDeM?=
 =?us-ascii?Q?H20mMtG0W2yl5QvPQEmS9CmKtI7LkiwT1iXGP9HRp76zYfeYPpDBJ/OgS20m?=
 =?us-ascii?Q?JUTDduSooSn/XAUpVSqs1u1z8FUCM2rfHKVBuRuuBPOdCyj+S6WVmHIZGoS+?=
 =?us-ascii?Q?djUZ2INA89scC6RSkQn6sgfnWPcHY8m6GiZ/9LkB200KrTU0GpnuZ+puQnRi?=
 =?us-ascii?Q?PPtWEAbY8au+ZOP+Rh7ABijtyrm/EvZZt73SeOYLfiyVmVipDotniia3pSYj?=
 =?us-ascii?Q?ZYEyxy3O+zEYAZ421N5DA1LF/dE2Az07GskgFZlF6IVRAGrEPt5ggahtRhnc?=
 =?us-ascii?Q?z9fwqT7jKIYIW+G86zVlzTlxU3KaDI6WRDsHTPe/ZUS6pf9/+TKA7G9E1B1M?=
 =?us-ascii?Q?NWZy/tQsuVTBGN5GTGa0kKD4VXMqW011TH9R/8bLnPtYhB8SI9ySW1fSRdMn?=
 =?us-ascii?Q?lEwGXa2SAO6NQ5YsfwvksqjkNI4R2PVR67w5KReBUPKaQUFQRIRn8l7y1bZt?=
 =?us-ascii?Q?nYBrSJ1ncVHKhjjduYJNAwnFEuV/F6y73R8ArlpJm3YFN3dihZP2MNnZGbJ/?=
 =?us-ascii?Q?y1c/TptzKYnM9eZeRKHMoiras9znEU9MU6g4QVz9iEbeWY9cbMWTpe+JbPb/?=
 =?us-ascii?Q?IefkmWWzAY6pmyq6nWZ4zYutHe92M2q3xraK1UCGyVQVKXoN2Bk0axR4s+95?=
 =?us-ascii?Q?ZIeCPEtgQVGL/PkZISswoOzXbLtOW8KpBal58QQ9/uuzqVNJ9idGZ13QOGfE?=
 =?us-ascii?Q?gsIPByd+VP44pXS7noYG+FWSmLxBano3V4WgziQjhTLmUXK42yNifobVszX/?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db514d1-57a5-4564-3ef5-08dca6b83505
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 23:28:47.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0kJ0H43hkoRqJnXv/qXCFiG1OaIx3lrgM2QQHlvANn8fcG2MdKg5+ZX7YEhCeDZo5llauSi+9hNCkaAPvbPRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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

On Thu, Jul 11, 2024 at 01:11:50PM -0400, Rodrigo Vivi wrote:
> Continue with the encapsulation of drm_mm_node inside xe_ggtt.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
>  4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index db74c3395ef8..de4930b67a29 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
> +	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
>  		 vma->bo->ggtt_node.base.start != vma->node.base.start)
>  		xe_ggtt_node_remove(ggtt, &vma->node, false);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 3ab29588a068..67337bfeb81e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  	drm_dev_exit(idx);
>  }
>  
> +/**
> + * xe_ggtt_node_allocated - Check if node is allocated
> + * @node: the &xe_ggtt_node to be inspected
> + *
> + * Return: True if allocated, False otherwise.
> + */
> +bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
> +{
> +	return drm_mm_node_allocated(&node->base);
> +}
> +
>  /**
>   * xe_ggtt_map_bo - Map the BO into GGTT
>   * @ggtt: the &xe_ggtt where node will be mapped
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 5147930357de..f816b3c0732b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -23,6 +23,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
>  			       u32 size, u32 align, u32 mm_flags);
>  void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			 bool invalidate);
> +bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index dfa71bcd0f56..efaf188290ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -235,7 +235,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
>  {
>  	u32 n = 0;
>  
> -	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
> +	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
>  		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
>  		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
>  		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
> @@ -376,7 +376,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	if (drm_mm_node_allocated(&node->base)) {
> +	if (xe_ggtt_node_allocated(node)) {
>  		/*
>  		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
>  		 * is redundant, as PTE will be implicitly re-assigned to PF by
> @@ -406,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	size = round_up(size, alignment);
>  
> -	if (drm_mm_node_allocated(&node->base)) {
> +	if (xe_ggtt_node_allocated(node)) {
>  		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
>  		if (unlikely(err))
>  			return err;
>  
>  		pf_release_ggtt(tile, node);
>  	}
> -	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
> +	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
>  
>  	if (!size)
>  		return 0;
> @@ -439,7 +439,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_ggtt_node *node = &config->ggtt_region;
>  
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
> +	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
>  }
>  
>  /**
> @@ -2021,7 +2021,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (n = 1; n <= total_vfs; n++) {
>  		config = &gt->sriov.pf.vfs[n].config;
> -		if (!drm_mm_node_allocated(&config->ggtt_region.base))
> +		if (!xe_ggtt_node_allocated(&config->ggtt_region))
>  			continue;
>  
>  		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -- 
> 2.45.2
> 
