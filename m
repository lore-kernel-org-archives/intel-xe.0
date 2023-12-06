Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975BBC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E2010E129;
	Wed,  6 Dec 2023 17:54:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B4310E129
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701885267; x=1733421267;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MyvkdgNRQs8jlfzCfq0hMdgANQYwXaMc6odXPGHK5kc=;
 b=GLYEggzwgk6nmKf4I2SlI13sT51Ym2sTmGoNKSXnAcrDvZRToIlVgm5v
 ffgHgP/tHQTlDj0WkBbc/orkApb/FJ+yYWeUPlKDhiflcnMTKHBPxlSP5
 1iQyT7fkJKgDcio+ACZ1vNFMHCLDTDRpVQDFQTw2hH6gLWuN44ZphIN0K
 Wv+13OYsc/Fuj/5dRtkmDyNwFGJte3wZUyApDAYB7VWlvugJPk++yB/nM
 zJwvb/j21vCk0EmJyZlo+xnpBS5aL7s+gnkJxqSKPmdrE8a13Jb3oczOl
 MOHAzR6RadJKhtZPrN0v3mAJPR10FqPf+dNHyWzVQPlvGqkxclwQtZ1ju Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1167061"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1167061"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721156366"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="721156366"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 09:54:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:54:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:54:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 09:54:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 09:54:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1pz2l00+vYn4C4wfXhKw4BJbp7+Q3S+8TLuYDtnVKqmgRwU1RQZZ+C0Fj6oDNGGA9LEUbIA+ywAq8v67NP00cOrl0Y7S1XeTfkeY97l11ihNjtocRStaD4af/su4d+ylFV4DYdBt/JPVctoouhXr1EmM/WHlbtw297GN+OqHEezJm5VqqMSzycz+ytdllbQBV8LxYK1Gt3BTPOENIBrdE3qgeCGIeN4eEWArsiPxDIHP0Ri6xWHiOn1RdNzpsDEkHLTkmXBKiUCq/9widgVopU1jQind3dPsTE1TsWE+jGjNtNAkAXzRfvFRQUa3LwzH+aLzRt9tap9hlHdirD4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IydXZHcwdxnoDGYC1RZa4rqRCwnwqL28Eo8PD2FFkRg=;
 b=Qonf/z6KdMXVmifN69phAHn5e1yCnicRLYFA5ZBqmH2AieFmrgpvCrbBqnRnWoXOiBDlhs+da48AGhNzZ/XWqCdksEimvCFXPMeaZb9YSq6Q2CN71CUGZ0m/O20Mn644fA3mjiPH0EvSUO1fNN4E/Bi3lCIBxz7/sWLUeS76mPYKc5lBFcrHBTJEIUVbjd472Bsw8K8z77AsZW6E8fP91BysncI/29bjz3eMBcsmCRfCW2KocDLJVwKusBhG+0+sd63J7osWN/ZCfOCfgD/tO4gEG64zzdsQhf9hh3JYKQeyLl/0r2CsJfMYhKLH1O2QLy30/egnXsRvNLDnQgdBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 17:54:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 17:54:19 +0000
Date: Wed, 6 Dec 2023 12:54:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZXC1R8VQbDmWwja0@intel.com>
References: <20231206170729.378338-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206170729.378338-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: fca4b6e2-0123-4fd5-41c4-08dbf6845ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9oIphnOXdg3os8cCXtdxqeleYlGoYw/8IMWbRjH8gvVdwQrG0mFzhMJE/+H4Sr3oNiucZ2xTWfEDy+nDj4DTd/E60IOsYa4KtEqVWVXaEB54X92BhK+MVBbLViUJ+kjN1ru1BlxJ9PDKN4pn1jSNYxR7BUIC7Kx7lG1WhZ+3XN9+HdYxbHQD2IPdZ9bhi3w5iGMdAB3L8WHQ4Jh9aYRv2/Cv6d93nBfAOUahbuYVHYdErh8by3t690GKacSAk3ZhP8BMXdKYXXT2nRvgJ16GaEmBabdKiF4/m04uVqFHHRagxuzBSXZg25rjJZiSXoN4jqptd37ZvC8wYH8BbAPCCwbL1Cc997QpWgkEh5bS+z/VbdJDjPcYxZ9HIs2keFDVeKvFVNG3u3M3eUC84NrnpFf3bh8iS57KPQlVQm3GG1DHGdx7h4fEdFZSA5Wn5i1nxGP3XLJHh6uAMueuBlXBuQZTUBwbpu7I5eJ4/5Nkf3k/m4Dvcs16Lnxk88XoTN5mTaQU8hKiUK7V1PATNFJzgFPpWRhNu7FiiD9TUONG5c+wF6v7t/woqnnfqWnlOmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(86362001)(26005)(107886003)(6506007)(6512007)(41300700001)(2616005)(44832011)(6486002)(36756003)(478600001)(66946007)(2906002)(38100700002)(82960400001)(6666004)(66574015)(66476007)(37006003)(316002)(6636002)(4326008)(8676002)(8936002)(6862004)(66556008)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4VsXCJfK2BI2jg7bTcWTSnfy2aJMibKAUs+j/U2K29E6Fz8x3OJHextweB?=
 =?iso-8859-1?Q?QW8FxH/rEmHnBlNLhsSipPbSJFLj7OPhH+fZAOvPCysLCV+xY9H5ltZyJ/?=
 =?iso-8859-1?Q?BLBDleRk71wkTAD6iLg45Mo4W443Tzl90esVndDOZeNkGaEXedz3ENAMic?=
 =?iso-8859-1?Q?wcAT2R3qlatUvCX8RTcHfPqqRlDeIW0zyAYp79qjwY/Xb+OORq16PDtjQy?=
 =?iso-8859-1?Q?93xKxtujtAwSeivRZNyZcB9LDN16pSK17wlF4ZSjfjkzbwfG6fWoWFLIIW?=
 =?iso-8859-1?Q?FpmSt0vnU/HJHAs5um3bYI5TTwzWLjQjJ1QQl/Kgw4oCOv29N8tmqWITo/?=
 =?iso-8859-1?Q?dOWVS3Tc4ZMhc5dYs1luvZrRiZ7gKFoSXhT80T/9LEYV4Zy3aAUbrTI5mT?=
 =?iso-8859-1?Q?weGgz/ynV3+klwnrP6lmcBz4QfkPNCcvGLzYllaAtuRsCEUDp+bw8IaLGe?=
 =?iso-8859-1?Q?BxqymHKVUNi5PDnj6MaJkBPzXXVHJIixH+dNZ1LPsWKZqj3TrF0I4hP4LY?=
 =?iso-8859-1?Q?JAKGA2+cgqrq8prNYOar0NlouhB8c0+wzIljPdE8BGbBwnSq3Njyh+CcQM?=
 =?iso-8859-1?Q?2f3wOfwVlNQlsKhS/a7mdIKLZOkmYNzzwagOAdCrDKAPVR6eKYt6B19yBD?=
 =?iso-8859-1?Q?yS9X5iABRfUQPAWAK+p2jLaE8EKib3xrcQquOtL57gBt8Mu3umOyrHhGyK?=
 =?iso-8859-1?Q?wKgpaEIkFOxXvCy/TYyhd1Bfm4Jeioolv6vpPOIt9rirZaiuIyDse0F6ya?=
 =?iso-8859-1?Q?lfzLQl+Fl8YdG+SwChL9mgRZ0zVyDbFZ7tWhKXnWbB4VtqRPaW41JSzVVO?=
 =?iso-8859-1?Q?l42oyQulDoqScobP+jrJNY3rdtIBeW5dvIhf3VHV/CnnoIneT4e7gC5xjn?=
 =?iso-8859-1?Q?B23nTCuK5n/BPxYN8nQgZpmYitP4496lMuCeonj+LU7Cf85fcm88Wi3y0E?=
 =?iso-8859-1?Q?f47GdK17ftxX9ssUQez1yQmTwixPVKGidCkkeY8IUPAylDHmKpTqvrB1A3?=
 =?iso-8859-1?Q?+i6hLdHGnPVcBIFu2LpITy6ahRlgT33kg+ejmK/BwFNVPNq2R7WYr64hU8?=
 =?iso-8859-1?Q?8UQfo98ZE9Zpoo4VCNjJ1GfR54LRtZZ/yUpBPzTTESezDlZOwQs//JWiT7?=
 =?iso-8859-1?Q?HG5AMyISytpmyjasIocIe9mhchj4CSLCjYcNty08xVkb7aRtN7/3VQnIUM?=
 =?iso-8859-1?Q?Axc7vp46DrjToluThqsvO73e48/CDWbSIbv3dKRv2+VHxb01US1kZJ6R2j?=
 =?iso-8859-1?Q?pPVA3H42kaoruReZrvdruwbyWhJU2iQ8dvMzaeXgteOEvxu8f+uje4R6gh?=
 =?iso-8859-1?Q?H/2ZNWvRmTIH4q6ji2beoDh8yYVt6V+RI1wLNSZws2dVZ4EUTJvs+uzmJ6?=
 =?iso-8859-1?Q?3qHiZxh015MaSgu7vGO5eY4ZW/+E7mtcw61b2EYs+5WXqPO+3XfBUVq0rn?=
 =?iso-8859-1?Q?b4gQZnQ/JIqDEeKLeKF9X6ieJBwFh5bdpRw2qnTfujFPgf2n5Eb+RDaOja?=
 =?iso-8859-1?Q?2Ziez6B1GQvrl1+4feDhkbNGs35IoBIdEWoNTZwQQ4KlVAdbxJ9fH7FG3V?=
 =?iso-8859-1?Q?acL91yUSrVxKcJ+GNbTMcMhHeU7NJcvnIWtbLoE9jOcXXuAcUTO/yoS1WC?=
 =?iso-8859-1?Q?aJBZ1QxOdOagjgqa5naRqLucPwdNbRD76cX5B2JlpyUa0nt76cPLRh3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fca4b6e2-0123-4fd5-41c4-08dbf6845ee2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 17:54:19.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW1eelGVkPWVf5NFvsv1fsdb7XY/UNnjnLAx8Z5+nZtm2oHQb5Nvo+i2xFv0G7cRmQ0KQclb3/Dqj5rEDxBPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/uapi: Uniform async vs sync
 handling
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

On Wed, Dec 06, 2023 at 09:07:29AM -0800, Matthew Brost wrote:
> Remove concept of async vs sync VM bind queues, rather make async vs
> sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
> a singular flag IOCTL rather than per VM bind op flag too. Add
> DRM_XE_ZERO_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to
> support this. Support this new flags for both the VM bind IOCTL and the
> exec IOCTL to match behavior.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index eb03a49c17a1..8f4fc08402fd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
>  	 * Kernel only classes (not actual hardware engine class). Used for
>  	 * creating ordered queues of VM bind operations.
>  	 */
> -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
>  	__u16 engine_class;
>  
>  	__u16 engine_instance;
> @@ -660,7 +659,6 @@ struct drm_xe_vm_create {
>  	 * still enable recoverable pagefaults if supported by the device.
>  	 */
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
>  	/*
>  	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
>  	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> @@ -668,7 +666,7 @@ struct drm_xe_vm_create {
>  	 * The xe driver internally uses recoverable pagefaults to implement
>  	 * this.
>  	 */
> -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
>  	__u32 op;
>  
>  #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
>  	 * than deferring the MAP to the page fault handler.
>  	 */
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  	/*
>  	 * When the NULL flag is set, the page tables are setup with a special
>  	 * bit which indicates writes are dropped and all reads return zero.  In
> @@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
>  	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>  	 * intended to implement VK sparse bindings.
>  	 */
> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -844,8 +841,14 @@ struct drm_xe_vm_bind {
>  	/** @num_syncs: amount of syncs to wait on */
>  	__u32 num_syncs;
>  
> -	/** @syncs: pointer to struct drm_xe_sync array */
> -	__u64 syncs;
> +	union {
> +		/** @syncs: pointer to struct drm_xe_sync array */
> +		__u64 syncs;
> +
> +#define DRM_XE_ZERO_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> +		/** @zero_syncs_flags: when @num_syncs == 0, flags */
> +		__u64 zero_syncs_flags;
> +	};

I like the unification of sync and async and the flags per ioctl.

But I'm not very sure about the the union and re-usage of this field.
I would prefer to keep all the flags consolidated in the .flags field
with the ioctl name as the prefix of the flag instead of this ZERO_SYNCS.

Then we can add checks for only accepting the
DRM_XE_VM_BIND_FLAG_WAIT_FOR_OP when vm_bind.num_sync == 0
and
DRM_XE_EXEC_FLAG_WAIT_FOR_OP when exec.num_syncs = 0
and
get this usage documented.

>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -980,8 +983,12 @@ struct drm_xe_exec {
>  	/** @num_syncs: Amount of struct drm_xe_sync in array. */
>  	__u32 num_syncs;
>  
> -	/** @syncs: Pointer to struct drm_xe_sync array. */
> -	__u64 syncs;
> +	union {
> +		/** @syncs: pointer to struct drm_xe_sync array */
> +		__u64 syncs;
> +		/** @zero_syncs_flags: when @num_syncs == 0, flags */
> +		__u64 zero_syncs_flags;
> +	};
>  
>  	/**
>  	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> -- 
> 2.34.1
> 
