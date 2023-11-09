Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3F0C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187AB10E92A;
	Thu,  9 Nov 2023 21:59:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6077B10E92A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699567193; x=1731103193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gng9z+XsKlDLAndkcsNMfHZ8+VfjL+VXZeMh6POwBzc=;
 b=J6zoBXeYsYMD4nMWFHGZ1fWAfXw29BYip3M9awy8+knd2xPYxbU0/rCw
 okFwdaOo+7xc2NJSkeH9WQ1Qrbn7J+AI8VVzfbXd6fmiGeAio1Tz33NuL
 UcV5QvNzQ730fx/XA5uORV90qeJk7I830OQ3Dt8blmIpYBdZFkzOW7v3d
 uX7HQQlPaEjmJr46R4dyNeLMtCEQpX6nE59p7KKxF3ufQOu9xVcR5iAoB
 0CqAGDfZdpMYeu3JmtV7kFVcmZt9yxz7Ra9Tq5YYWnGxlfR127PH1STYG
 OTcHhmzDPXhqJQ0D757343Onvv6tNnke6dUi17U3K6sK0EF3eHCw7n9Pc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389890043"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="389890043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:59:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887156124"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887156124"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:59:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:59:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:59:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:59:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKJaUsNcuMbtSJDmvksVi84v6UymKWBUyuDPq3pLwd34gk5p9PCr9Wap2O2F51DPihJD0xoseaKcKDupcObPPCbws8VNkhF/5aemT11vvPdrbqGNb2pA2jBXCPXeItPBbwudHWXHX3FNgmCXVcNXUCusogb5J+W2OHjrHGPeDAr2ESuYfqzyjduaw99vxcPTWbbq/B4p/7/3wRNCk3SOfRh90qOZGpYdQvYxbd9ZcqfFIHaPv1U8kbpKrUG+09+wDmCRm7SdjkLbRsLex3YcwnRawVpIDfG3AqFTnNHAgZP9qBMlDOydc3fqWwQvktGbrxn+nUUifNU3OLxEEQToow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QMr/qFNWPUcdXpp5BCS+IjIsGoSqwo2IUxPFWoifPQ=;
 b=YFswBIbd/bpe/cUKw1mFvOr4PPKEtuydcdftLNzNLL4miZiz1fZMaEveVpPd+YXnfvPVdhCMs/P+te8md5TmKwg1/qJAOvxMXllajAqc8+ekTV1RS0uNme+b6pQY7WbjpgnrVhXNzmm6SzfyYB+Zf8PnVd/Piq/1Ieg09KCOw27UdKX+KV01DfgnB0d9a23G3Cgf3kTBw/3L7KZ2MfdFFXreEmOS1tJtrLlfO7aHsKqDD9+qb1dSnIY4f+E9XuWKETJ2dfJaCskGoPTGmk3RpuScpMHGVCN+/j+Q3TCHMMniMSivwrgcMJvULR77e9x69EhsmBwrzMLbRFrPCPZx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 21:59:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 21:59:47 +0000
Date: Thu, 9 Nov 2023 14:58:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUzzri6ldhWha+NZ@DUT025-TGLU.fm.intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
 <20231109154457.7-14-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109154457.7-14-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d83d4d-8be6-443b-5f91-08dbe16f3086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBRZFwYeGPYqSmzJSkEwo01mmIkgkcwRTuObRWfc6r4CghRU3XA0lXyiZcxE48MK2bc9biKtR46q3xSQbPjJycIO/MGSRwzJcCr69rtbKkSb2PCBEFeq1PlzdPd3YkDqJUa/x6hkhltpDlxllwNPQuevRIwhqzCIbZE8BmAOj3PuqVO9PbEp8Rba3CHbxLub2Quh6OAFYP44Y7xDU7epe78UIMAl/9LLglUGmIYKgP0qn/C3Bufg4tKw2krbmMdSLPPa9OfgpiofgUixmHVFsLCAHSM12gLal+Ygth1XZ6oPAg3iO7CCtCqnOhetK0ctnQvLhGrtx+JsYyDq8sNctn+0tPJxTxIrd3S7S5NDH8Lc05t0VNnhjzfmAE+GximpFy5RalvM8rA2zw8AcNqFOlyB8aXmwH4+Zvtv+GoVTkwXO4pV6ckpxgpsIvLjAk1i/fRUZseKjgpV9KssswTSd2xfzQwJV/8yn1YB+m3x0qBIhVOu1U2JO1gCLE0xX+z12e0JHC3UyOipgbIAbISwzCOlT7R3LYPw8UkF7dNl6cdyHbkEKJO4QRblDACYvk3DI9NZSyD7/UK/zz9gi/DL5PqaTLRuXsKglHp4guyG+Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(478600001)(44832011)(107886003)(41300700001)(6512007)(6506007)(6486002)(83380400001)(8676002)(4326008)(6862004)(66946007)(8936002)(316002)(66476007)(5660300002)(6636002)(6666004)(66556008)(26005)(38100700002)(2906002)(86362001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kjk59Nf333KL/FrUQjEbG2la7LonFKkK38d1D+Nc4dhzrkrLjzdEXJ+muv6l?=
 =?us-ascii?Q?lPnDFmr6rkvsNhGWgQtiKQuOeMYp5NvgxgNm4R67NDK1ubn6OkoBBouZLiJj?=
 =?us-ascii?Q?W2R0oKJgH5DGoKoQv6unsK0fuHQljTvQ0zPySheohLIoFQP2nFiPxtjsm/nG?=
 =?us-ascii?Q?RFPH+E0aLZC2zRKvKFR4zygSHDOOf23tfTJjV84XHatWNyUpmlVTwP7QB2Ty?=
 =?us-ascii?Q?3lYiJ6YVHrGEL5vS7zFf8Lnys1u9dlps2qZNfKrtUXAQenhibOkHVcHACn6P?=
 =?us-ascii?Q?sda2EuVputmlom6bILQzCCzMhqT/ElCydUYVZHjIwsno3WynKSuintxk2zZf?=
 =?us-ascii?Q?w53LdKH17uKw14ud2t5u4REbf1lPR7lWvKkeYXh7fmjBmVm8f8U5NCraEvm2?=
 =?us-ascii?Q?y+LWctyAa0btWey8Y9HOepkgWWxo4gUBvZ4N68w5A2BTMef4goTRexCMyZuS?=
 =?us-ascii?Q?Hefy20o1DMquK/0SLcarZHhXSpUBLJnDY2WP+17L99Vab5cbqHkHl24RI21B?=
 =?us-ascii?Q?XtHh7eylPp4VpmzJR+a+ZSzcZP5sX8YwgOykdqI8kXwjk85pt/SM9T4yAs+t?=
 =?us-ascii?Q?APmpUSWGLd4H/YDO8Nmf2ts5eLRpXqutI1EQAKh4r33jTF9DR1i9BNREmj5R?=
 =?us-ascii?Q?VRclBEfsGOT11t9kYCxXLlNhbLAI+XVVIBCO92zoTSyQZe6WonubRooWtSUn?=
 =?us-ascii?Q?OAp3ZMRxDVAduEW9TamlKCtH80ZoxBL8YCxF8QYZwiL+fHr8AqeHSgbKTZXh?=
 =?us-ascii?Q?AI9BCSVsoqqZWs6L6eN10KS8ke6oShFYf4p8qlNWbI9UetJiQ4v/NutccNjI?=
 =?us-ascii?Q?zTB1IvTGQkd9GsDwWCGpFJ6U0BfIlRERdvnlHKBOF9tOjW5kNAKdnEm4qASW?=
 =?us-ascii?Q?cgfdxlp5FZHOy5dPUSPli/S6cJtZMavExWWjjTUUg2x2Nz6Hx1GfBhKkVONz?=
 =?us-ascii?Q?XpKnzsz7AvCq0qFutSXHeHGrw4wUGr2XXnD4nWj5yReRAnEklEjRC0Qt+Qqa?=
 =?us-ascii?Q?QIRDEqzG/AcMga3gucSyzCf0UdtSArA1y4eOWvseda/gFMyos2ADgcdLeLsW?=
 =?us-ascii?Q?BuWBTooEQpgaQ4AZFm8KIolK/Va+R7KfNpGL/AclIK1e09paXqskdAgQWEaT?=
 =?us-ascii?Q?zBGbfsn4EL3NWFHRlcpnOsO19Deeo39+mp/EUSR2ObFteUzo1cuzjUqp7LJs?=
 =?us-ascii?Q?2l+DnQe3cz0qShfIMfxRgU5Ma2e/tR5Y6UX3ysqp0gIJ8DLy0fJpQxypQRSZ?=
 =?us-ascii?Q?GEyA3AH4pIA7v9TCEEztZFO0V6T6Ce1ELgdzKRRbjVyGRcz+jg54Kfg8oZqJ?=
 =?us-ascii?Q?UxtqG3Oj/tQwEEFYTFV0SIOPoDY9f7T2E+AGXs9HJ6rD6Xz5BuwmzyHwlbGA?=
 =?us-ascii?Q?ZhiSEeMJ4sIdWufhYZ5+X+V63xqElQKC41mEXKtA/Wa/JLdzdpm7POY9AJ7i?=
 =?us-ascii?Q?Fxh0/cSjH4WFTtldCYLuFG/hZ95lOvEQxFZvJ4V1rYTd5VU/Gl33UTFYIo/i?=
 =?us-ascii?Q?na01CqYVCWDcNOasgW2oHmvQMYgc5GfQGBvcWIzPsePtLXO0A09ovggP4XQh?=
 =?us-ascii?Q?KFdbT7aYQR9p82DFDXvLyJBVPc4SvJ449y344u9QzicF9Dh+u0PM4oDQUU4k?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d83d4d-8be6-443b-5f91-08dbe16f3086
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:59:47.6057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ms6Hyeb/MK7lRtVeO7lq4P9dtXng+K9ek+UunrF4vNKNeAUYKFNZxCov+bXKntFBfs0BHBaQB45Yy33Z3sVXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 13/43] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 03:44:27PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Although the flags are about the creation, the memory placement
> of the BO deserves a proper dedicated field in the uapi.
> 
> Besides getting more clear, it also allows to remove the
> 'magic' shifts from the flags that was a concern during the
> uapi reviews.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
>  include/uapi/drm/xe_drm.h  | 12 ++++++------
>  2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b955c89da42c..87971f4faa58 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1799,19 +1799,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	u32 handle;
>  	int err;
>  
> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
>  
> +	/* at least one valid memory placement must be specified */
> +	if (XE_IOCTL_DBG(xe, !(args->placement & xe->info.mem_region_mask)))
> +		return -EINVAL;
> +
>  	if (XE_IOCTL_DBG(xe, args->flags &
>  			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>  			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
> -			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> -			   xe->info.mem_region_mask)))
> -		return -EINVAL;
> -
> -	/* at least one memory type must be specified */
> -	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, args->handle))
> @@ -1832,7 +1831,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>  		bo_flags |= XE_BO_SCANOUT_BIT;
>  
> -	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> +	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
>  
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>  		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 2ed69b02a2e8..3685eeff4b8d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -622,9 +622,12 @@ struct drm_xe_gem_create {
>  	 */
>  	__u64 size;
>  
> -#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
> -#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
> -#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
> +	/** @placement: A mask of memory instances of where BO can be placed. */
> +	__u32 placement;
> +
> +#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> +#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> +#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>  	/**
>  	 * @flags: Flags, currently a mask of memory instances of where BO can
>  	 * be placed
> @@ -648,9 +651,6 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> -- 
> 2.34.1
> 
