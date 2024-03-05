Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D06C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 14:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0B1112B76;
	Tue,  5 Mar 2024 14:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd/7MATs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0F3112B75
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709650018; x=1741186018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TS/kpKhHazkYrneHEEIre21QhdYnVZwl0Pv2q++qqSc=;
 b=Gd/7MATske07PdtrrbxYW8JsgXlETZ0PQygBOzztpfi8eHVVtD3u2EX+
 mFSnPD3JaSRCmnQ9JYpalJeMxvHPcddGElkqjEX1w2x3tpGdbhF3FIgwc
 y1O9GRg/NZ0HzqMiDDyafZC8CBXAQJTx/4sPWUuXMMQOvG7jXhruwpdav
 +JjsRkv2KujmHKnxn+RSA+G2an9VqUSD8GRKamEGLjBlBH/nu0gQbg33g
 Z6/IWD6HaHyE0r45lJNmxlXRLoz1+tUAslHTXwzsCAtnmuDc3MO9y3c6q
 0RAK6zHP1sZEoPYxVMR+Wu7nWf7EK87Z55v17fmYUoiIcImk3EOvl/ocw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="8023289"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="8023289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="40286576"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 06:46:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:46:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:46:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:46:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:46:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3S+Y1GRKWxjtbA7Sy3q814jrxA6rUK9T+lvhJBE0xSUioclSi9AlAKmyr/ZDcxc4qclXQTnQqNqOSq14boeObsP2jNNd360dGtQ5AS3MGsYiMz9gWj4MsbjuyDkWZS+azA/egQon/4xEUbG8S1NM8Sd0o9SgaYPPMaIfpxpZ+eyNakJe5z7aZ0Hv75dPnQ082y4G0e2vls7qmvZOUz8pAjZdI8noDeIuLgV2sHbOFYTrfwybTp6GpVnrzlRkNZfXAtd3bzIInOMpbgYj8Rx3vhz4GySGRDxYUQhm4l7B86Ha+cZiVJwpDz7fas0zKMnvLbSEsWp+EuJD/ajMDCXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgMb8/xIZY/aeyxciAkmVHI0MYSa6pnvElZLILuX1Cg=;
 b=S3ICiByPt9/vRUNvL5+xQvAUrvEkYgH74/1pnv6WPfTy/wBFl7tp8Zq00kTFQChBh9l3R0sNPXciW/Astsd6SDAX+qTciyecfrR47v8oWb/cBWqXHJUiiljO5fHzwS1hSSUgj2PKrmmdjhKcEYM1jg+E/tpA5Ff5cPHjpyqyBk8HakW4co6dAkeqo/ox/k0hEiiVEXP11sAGPQeK0jsow9pchc9q1qw94EhzSYtCGpYLhSzZcG6Avl0YZ/3G0i5uVKFBiSuabDzHkkZap4ISBjDyJ6GGVVhfboRg9HAh/zMqQ517ic4AdAR4ocf01NFr7RapJWbnLbAW2zv51DFSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Tue, 5 Mar
 2024 14:46:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:46:51 +0000
Date: Tue, 5 Mar 2024 09:46:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Do not perform GuC TLB invalidation for
 display GGTT
Message-ID: <ZecwVzfIoKwhHj8z@intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
 <20240305131250.5330-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305131250.5330-4-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b378980-4f97-4f70-1350-08dc3d2317ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GU09NBBEmFvWj6+wOEWnGEzUKgFrGnVjjrC+6YEhKclzbhZnJtJ2TSHL2Kw3AEpCgz37kZ5UtwRIIW0Lk8ZjlIQAaRZeuT7l2Ybdy7JyzfFzQcMHv3508QeHXac/u2NFOYACUfWc/phgDWpRQz4gu8JKQJ7nL4+tQGKktI3w0Zf+vtMoAuvntmDja6nsPD1tlB0NMQ8HQKQljHnTWOshBV5tLvAeVapO9mC6panwuuNks9BpVU+ZNmbqmFihUmI+P7BZJjvOFe+pXdrn6CwI86o9pI/sV7YFs8k0NilEZrnBZLcocmys39TnFYDM/pskpKYWjYA7LpotOUjmtTIgx71Zjon/U+JTOudy9np9BfFztDzY0XIrCSKzRUS9AsvszW0kXQkB65B7VFFvO4eyORS+YI+ShF7vUpsm6hJ1/ADX83mge96fc61yRMC8NkosQnYAfUu92Vm75fpQ4DH232ZrwjcUVSThT2LYcZhZcC4jIrgEB7CYyAHXXHhzAqkNf04kTNT1h9mjiV5/lb5Pyot92sFvOmg4uX+e9jnALbZI0b4EeExpQ1mk1AGy6/EQfXvrdarWIKWYlgU6RZgma673CNbdpVq4VSQgf7xj4HiatO42dsQQsE7bQnJkztWKEIaf4JsnmNXT3MHG2oj/jp7GYdRefp6B1Bz4O5e09f4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HPFVw9qefcdxPZ4OYNEF+G4t6/JBbXqpbD3ajHNo4rCN4gvS7yUEeYJcw5yL?=
 =?us-ascii?Q?VN+rYJQtz+s/PvQygiKNtXkQoHfP3lLor30bSHbujRB492fv5B38EuFvleEe?=
 =?us-ascii?Q?U8vqXJqmANEyZ2zBcE29W+ABYD0b3PQkoTcrsKBdSfRDem4SBuH5VMVBwl8N?=
 =?us-ascii?Q?LbsLIVMdNgz6dHRU1nGFTDDyg9bxA6C6FzUNe8RJAGVeqEvZeWpH8YPMq1cw?=
 =?us-ascii?Q?AQ61Grd+uei5iOIhNnAPreWYTf18ntSEXvlj7Ps3rud01U0AzVX/yqbY0b56?=
 =?us-ascii?Q?bIDGEvlIOfSeJCgTtoQ56G3m371G0vvvz15iMuM795M2RwiZPAj4Xu9zeW9m?=
 =?us-ascii?Q?s6KFXef5PuNXoRz6DC2vhcR7I71GkWAKmqSd7YUrbZADSFSHISsPtrxelLwI?=
 =?us-ascii?Q?40rD5Vi8w52DcrpTo0Do1tuyBVrVDumkJxXKsRX98KGvXyl5UMuM0keJQF1L?=
 =?us-ascii?Q?M9LARuT2ms3oDkthmjhVwIy9MBaA1rDGt/TyP2UZRy7rHbUl7Yc13881mG4E?=
 =?us-ascii?Q?uTXVV/pGc74kwYGA2pZCt7LsbX0L+Izo9VHjiCwc66HWTS8nwHw2GJJc4oig?=
 =?us-ascii?Q?azCs/NCBqupNBL0XnFY2YfUxgAFRbK5DQ4ufu1BpkjpK2eFMhcAQT3qNL+ui?=
 =?us-ascii?Q?5ILzI41RVYwJDzoIAn1WNEK2ZdihNNSNRZJXfEfatIJJITDohuDXHQon3OHx?=
 =?us-ascii?Q?6/HKFk3x+yHjzAnk0XYaDlKzydHXoLdFlBeNZcukNtRYtSrZF8vz4O8FS75X?=
 =?us-ascii?Q?SeaS5iKmfP9YkNrbtRTyar2ZprRXZzX0OthI5iGCMFrjNGDOhIjaIbjKYs3J?=
 =?us-ascii?Q?HPBKVLdB2OvNk4aqlVeoP5u6K0p3Bd1DexNPKOwbuw4vHq+zIK/msNtHOpLG?=
 =?us-ascii?Q?K0a5XHDDptrzwNft8Xm2qpXvWDyeE6UdQlvCQlRuvaWB5o0R1sA4GejjhK/q?=
 =?us-ascii?Q?jmyT82H56qFLilJG8vo/gwryg67r0XQG3C9CXWcsE4Nb8t8VgMKM6qvYt5vh?=
 =?us-ascii?Q?j4OJis39A2d+xiz17gjtla+pEsKbdiv8O42MoyD2rGyvWvqBhTbvcKRSJpp4?=
 =?us-ascii?Q?OvO3I1aOK1X9TWKR4IxmEypRtigemeGhyUdZt0WOEg8QbbCCbQ5bijcUM/xt?=
 =?us-ascii?Q?JMJtmFrO3jYocAQACs5NGVlAi91x8ksXmgDVh/OE9ABRGPuI6l91P+lDxvPw?=
 =?us-ascii?Q?Kk2leoULUqe5E0+p7XCs1FDKGzzA0xYSD5ntsTzZ0of4UuyDGocgumH24hVw?=
 =?us-ascii?Q?Y+BhiSJX91hAHSpLH49bmqhhsC8vIVzMHKHEOF/Dk6BhpkfhDHX8kieXPMls?=
 =?us-ascii?Q?j0InQBXUEVN76ZaG5zyDu/fFJGIZpGyhQCvvr3rzoIKF6rgCDKlE1YjHj3NV?=
 =?us-ascii?Q?o99vO4QXkhkeUgqNBNUhg84g05PSt5NVew7n3AepwHb+ZtPAO6V+8IjM8eeP?=
 =?us-ascii?Q?KErLTRff2Mc5pNG2cjqpxX4Km5RIhABOTr+KvwIjDBdII1u8ttYXCquyLXmA?=
 =?us-ascii?Q?tav0Xx0yhCre7BrGNjIB0gNNLy+kZfLsoczoObwSvbJtb7CgR7SPdJdh5EQc?=
 =?us-ascii?Q?KTbrVn6xXwc1+2M6/rIXZwM9uv7kN2HFozrhpSn5L9+kbXru5lR94i35yXS4?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b378980-4f97-4f70-1350-08dc3d2317ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:46:51.4703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jswmuWaUWgMh8oigA+NtD/vW+ukRWBEyvaiF12LXRRpC31dmxHyQFvoj3t4zP/9JK+UYTTJCBdXoQdEVpqR8TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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

On Tue, Mar 05, 2024 at 02:12:49PM +0100, Maarten Lankhorst wrote:
> There should be no need to invalidate GuC for display, and it adds
> a lot of latency for pinning/unpinning.

why 'display' is the special condition that doesn't need invalidation?
isn't there anything else we can use to differentiate the issues?
aren't we over invalidating then?

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 11 ++++++++---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  3 ++-
>  drivers/gpu/drm/xe/xe_bo.h                    |  2 ++
>  drivers/gpu/drm/xe/xe_ggtt.c                  | 16 ++++++++++------
>  drivers/gpu/drm/xe/xe_ggtt.h                  |  4 ++--
>  5 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 722c84a56607..95595d2cf1dc 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -100,16 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_CREATE_VRAM0_BIT |
> +					   XE_BO_CREATE_GGTT_BIT |
> +					   XE_BO_DISPLAY_GGTT_BIT |
>  					   XE_BO_CREATE_GGTT_BIT);
>  	else
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_CREATE_STOLEN_BIT |
> +					   XE_BO_DISPLAY_GGTT_BIT |
>  					   XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(dpt))
>  		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>  					   ttm_bo_type_kernel,
>  					   XE_BO_CREATE_SYSTEM_BIT |
> +					   XE_BO_DISPLAY_GGTT_BIT |
>  					   XE_BO_CREATE_GGTT_BIT);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
> @@ -201,6 +205,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  
>  	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
>  		vma->node = bo->ggtt_node;
> +		goto out_unlock;
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -238,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  					   rot_info->plane[i].dst_stride);
>  	}
>  
> -	xe_ggtt_invalidate(ggtt);
> +	xe_ggtt_invalidate(ggtt, true);

this is a bogus call... isn't it better to simply remove this line?
and perhaps not even adding the display condition inside the function
but checking on the outside?

>  out_unlock:
>  	mutex_unlock(&ggtt->lock);
>  out:
> @@ -321,7 +326,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
>  	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
>  		 vma->bo->ggtt_node.start != vma->node.start)
> -		xe_ggtt_remove_node(ggtt, &vma->node);
> +		xe_ggtt_remove_node(ggtt, &vma->node, true);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
>  	ttm_bo_unpin(&vma->bo->ttm);
> @@ -381,4 +386,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
>  void intel_dpt_destroy(struct i915_address_space *vm)
>  {
>  	return;
> -}
> \ No newline at end of file
> +}
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 866d1dd6eeb4..79766b561d16 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -62,7 +62,8 @@ initial_plane_bo(struct xe_device *xe,
>  	if (plane_config->size == 0)
>  		return NULL;
>  
> -	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT | XE_BO_CREATE_GGTT_BIT;
> +	flags = XE_BO_CREATE_PINNED_BIT | XE_BO_SCANOUT_BIT |
> +		XE_BO_CREATE_GGTT_BIT | XE_BO_DISPLAY_GGTT_BIT;
>  
>  	base = round_down(plane_config->base, page_size);
>  	if (IS_DGFX(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c59ad15961ce..1290c17c10f9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -45,6 +45,8 @@
>  #define XE_BO_PAGETABLE			BIT(12)
>  #define XE_BO_NEEDS_CPU_ACCESS		BIT(13)
>  #define XE_BO_NEEDS_UC			BIT(14)
> +#define XE_BO_DISPLAY_GGTT_BIT		BIT(15)
> +
>  /* this one is trigger internally only */
>  #define XE_BO_INTERNAL_TEST		BIT(30)
>  #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 325337c38961..bda5055a2a18 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -211,7 +211,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>  		xe_ggtt_clear(ggtt, start, end - start);
>  
> -	xe_ggtt_invalidate(ggtt);
> +	xe_ggtt_invalidate(ggtt, false);
>  	mutex_unlock(&ggtt->lock);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  }
> @@ -261,8 +261,12 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
>  }
>  
> -void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> +void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display)
>  {
> +	/* Nothing to invalidate for display */
> +	if (display)
> +		return;
> +
>  	/* Each GT in a tile has its own TLB to cache GGTT lookups */
>  	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> @@ -388,7 +392,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
>  
> -	xe_ggtt_invalidate(ggtt);
> +	xe_ggtt_invalidate(ggtt, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
>  }
>  
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> @@ -433,7 +437,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display)
>  {
>  	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>  	mutex_lock(&ggtt->lock);
> @@ -442,7 +446,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>  	drm_mm_remove_node(node);
>  	node->size = 0;
>  
> -	xe_ggtt_invalidate(ggtt);
> +	xe_ggtt_invalidate(ggtt, display);
>  
>  	mutex_unlock(&ggtt->lock);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> @@ -456,7 +460,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	/* This BO is not currently in the GGTT */
>  	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
>  
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
> +	xe_ggtt_remove_node(ggtt, &bo->ggtt_node, bo->flags & XE_BO_DISPLAY_GGTT_BIT);
>  }
>  
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 42705e1338e1..bc2a6379a2e9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -11,7 +11,7 @@
>  struct drm_printer;
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> -void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> +void xe_ggtt_invalidate(struct xe_ggtt *ggtt, bool display);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
> @@ -24,7 +24,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
>  				       struct drm_mm_node *node,
>  				       u32 size, u32 align, u32 mm_flags);
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node);
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node, bool display);
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> -- 
> 2.43.0
> 
