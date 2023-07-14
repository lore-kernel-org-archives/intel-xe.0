Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB91C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1F810E0D2;
	Fri, 14 Jul 2023 14:14:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E625410E0D2
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689344056; x=1720880056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nn0x4Zqqtcfqlvib3LG1m7J7IKQcirJdqmBmp1w+6zI=;
 b=CqGG6jm22weNzZtguiFo2N9HaCnyEnuaQK6L9isXvKEyRGWKcdtDaX+E
 1yARIBfU+8Ck6RoFOGCCiGKPvqwl6Gzw+bASQN0GTLaNNbcpuwK4ze5Do
 s39g5SWXfnCmnF2Xij+PKK7OMYm4rM7YMDJN2oneiTiPkQkzDupWTAygF
 cQxNl7pBoygsTxO1bx+hJBik3TOG8r1ffyyEb3VvcgLjlJtG9N/8Fu8HO
 BQTfbm5/RZBvcbtrXvesCfxQZt6/HNfxHzCUbCW1EQRxp2SJiHKsCVwl9
 bqmbxGkPuQedO8d0q8ZEBDGAhrOQ/z8fXzD6YhFv6rAEE4qoZ3A1Hi8wq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="365522578"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="365522578"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="792457174"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="792457174"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 07:14:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:14:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 07:14:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 07:14:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 07:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3tTmnsQ206ruovNk7ahT/MU9PLOkNFe70l6FBpV9YpHmGoG0QVBdGp/q5vZvrtFdRPu7gzZojAAjKsu3gCFm7Y6UJDMpxuf/YYxgrLDrXPRg/lHulmSCa9XcxEWOBNFbDyNJHixXljrKBaSIH0NMAKbeShZkgYXAJT2UBuNTcQnSEEjDmWnc6XrfQzFaQk3vz9/0W1oN0eYJt+olynyC5SPFS68ZYhpVmBh3KHprAHmeXmTCes+1K8yvawDo33xZBeZKAYjUYjhlX49ol0KAsjMXG/Bpyb9vtzBgAZczewSq7ZGs1WQv2sB4T5A25Mlp5qWjPlftjTzTQBdN1OgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jafPqPrEmkTH1LTxDzvE1J/dXhRb3eQ502iuUdJBteE=;
 b=jrO+E72Grr6BuAv943KxrEgxx3WlhfQ3FuYWdxotIn85bpiEPF3rseWw7Eh5FUWHxmSf+jK/nhQLR1hTPu4wkQ5ekAW9SpGyfBW2E0GyAyTIe8/wGwCh5fdKu0Ger3RdjTwAFNJqYXsuTDfDLt6Z63nEzkR53kt5H3FLbbmM45wh3qM29DSXRWhtiTzzPcZkke8+nBAYiAKCN+KquABLXLh6cHUsY+Zl6zv3gV5hFLd+LO1STAG3RRy5XgbY0O/jud6EhNSss3EbPZwTrMlmXQDWX9q+7DVXFy/q1aYTh6qi1elAd/aVqMx0LROMayxLb2s6RMUUXDAuSWjkiau6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Fri, 14 Jul
 2023 14:14:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 14:14:12 +0000
Date: Fri, 14 Jul 2023 14:13:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLFX/JX0raLSQi1g@DUT025-TGLU>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713150611.7-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: e93da206-a9d2-42e0-996c-08db847498d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DucYXOXZNDqxwwtEBiyx2vDAd5UXl6oxGD993QajKZynsOElxsPwbI1/tv5nviyJwnTKyQ+KsUO8w98tkoYzFBX1up0oc5KePOgl1pyq2xawlYSG697mOSgNLa+HDGDePXEgue/P01U4+TA+GrA7mQy8fSiW5HA+cLI3YwgUJ1OLMhlKHOsOGUuOn8L5OfoNE3sHqYiPtBl12UsngnflL2JMYrnOe+JYex8Am4yYvWajAXRcH5QzktLMI+OdO8rK0mPEGHAji+vAMl2+Qeot7jVK5aJqoMlaMlR+cAEOcwWdhPhfVepE+pI4fVjwIbXnUwC0wdNtXmvES2q6MZ5KT5wAlc22Ro37QGmBjTe5/utVnoXJ/lMnUNdWUgQqCNaC4SJkO+pHlX0jzdABqeYlHp7QaJH+4MLucLWY46x6TLLEMvvwmNKLaoq0KXM3k35CQ77jAkUzGiqR2FrROsLxhk2lP+/qlmgYfQOYyqOwOjL1d88DOjeKWsvLqGdnVdeETueB80zxBxKtBv7w73Yo4uTGsQJdtSYkHGFDoFK2E4/63j5ttwwfRDklc9+Fj8lr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199021)(6486002)(478600001)(186003)(83380400001)(6512007)(26005)(6506007)(9686003)(33716001)(6636002)(66476007)(66556008)(4326008)(66946007)(41300700001)(8936002)(8676002)(6862004)(316002)(44832011)(38100700002)(5660300002)(82960400001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hrw+Gg3xY9SswtTAYuvLvAD7pkfb+5pA11ZWUgdBJEuE2hpxCF2905yMPAUR?=
 =?us-ascii?Q?dc8CHDrqtsqRntgC3p3N4PBtJzK0tfrk/WFZ3lr9NHUg8AuP0dM2QvRPC8p6?=
 =?us-ascii?Q?wLHdGBfCs0qDEtvMqKEt/gScj3QJLznHolF3R+O7xrlBcPh7eCcyhOKcMfJ4?=
 =?us-ascii?Q?vmrv7+3U4J0sE/LQYSfm9yPqVWfRf/2dZ47S5fVWEona+QHFnQM3O8nTGvZ1?=
 =?us-ascii?Q?FtyT//gFmoL2u9Mqc1677ILznUsndQ12tPWlPMaZft7ryPDG0ZvLdvbtX7EW?=
 =?us-ascii?Q?dWArorwz8uAYG/Ckwc28LbFVYoTKD1qvjlNMW9SalwwR27L1pH6ffnqSHWbQ?=
 =?us-ascii?Q?sfuA/PQrrhRDDIQb1wTAQTu8Qgw6V9BHBMreVqFT7n9I4l08JR8L9LhxJu1r?=
 =?us-ascii?Q?yW+YbeKKdD9Ad8uWAaOPck9RJvAvpcxbZP+TGLiqjfTuFV7KCH3wXLa/tsIz?=
 =?us-ascii?Q?pvYOd3jGdtbi3FMON12nH57NkA7VmKtlLFBbLkdDLrK3yH8h0dHGoSpaLdUU?=
 =?us-ascii?Q?NPOQs6amFzv8dDcZweGLibNgfYS0WMKqKhnDMspDJKGdRcfkibXRnIL7TFbE?=
 =?us-ascii?Q?MP4fmEspLHygfpcok0l4sKJf1QnAlkYoqu6DYrJ8ApX6NuoOXjTyEtNYSK3l?=
 =?us-ascii?Q?uOQ5MgQhsv9Hw01XkW/GuLSRadGfj76dsxizFh1U7ojUZjIB52VBL5hsFgpT?=
 =?us-ascii?Q?cdyZ7kHm97jiHnldniSXjbAbXFYJMH8WzxEBYB+Cj6ADGBXVDjIG80l2KRnB?=
 =?us-ascii?Q?/fvtlCMM2XNvCifzgc9G9m+STHqzeYF0hbgNE8SZAAs00rcjG4jDbeYiQzUH?=
 =?us-ascii?Q?8HBo2ZCF1jMT3urHZO04nPWJY/89efEUoPNUWY8V0t3fsJ7LxDAEPRjg9y21?=
 =?us-ascii?Q?VxT1n08CxVBg+0uZ6G55T1StIPiiBB+AM7QSxTqdJ54G2Y0j0D/6yP9HK7sR?=
 =?us-ascii?Q?NAK3VRfc/j/Qmg4VNEv57q6bDEX26LDHSvrUR3Jliyr6+ysphq/2VfLis8F+?=
 =?us-ascii?Q?85COPbH1xyklULQ/hqKEPvAliwZefpgWzsebs89fZCwCxEg8fIFDPaG1opjG?=
 =?us-ascii?Q?pS/rd+qrQgetCgaXjL2XzAKSNJSPhmDOLXvsvKXaRogKGyk9YaCaYDP+j19j?=
 =?us-ascii?Q?P3gWn+Zw9UV7SVArKIeCubYoNmfjs/braadYrFL1qxqP63wGmOI7lesBLddY?=
 =?us-ascii?Q?rBfiyUDPIxzvT7Xk4s+XaRwVfFT0H6YWrzycuWno4dp+bkUfHrLncEtFXXgl?=
 =?us-ascii?Q?KES8b4N/yLzO465AEiMr5w42bbcJ4p4ZXOzblWaUq83AEp1J4CvU9qk2X9Ah?=
 =?us-ascii?Q?rVgT7uom1qoVSd1tZJ5ui6sIth+YGu46m8fCxZjvpJXFhYvZMZJLhEEDHBE+?=
 =?us-ascii?Q?X7XAb0ctgsoNlaC+rzvM3L5KTbUXyKQD50AB1htSq3TyOnIDJu7v2rjvmXSL?=
 =?us-ascii?Q?vYSyP1f+2ogPLY7dwd3rSwXOs4V7IaWVAJAPGNVn0USnLq/TqrDbBkXnY/td?=
 =?us-ascii?Q?8/ESV4ZHR4UH97o/7LF5CviZfQkyKoF6pBASHaQSd/JOXljGlXCP9/acjCTN?=
 =?us-ascii?Q?IWalcQHAG/Eqn74BTqozMKZHBCAD0JxzIS8ax2lpHjhtIa3oc+aeRgOrCQ//?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e93da206-a9d2-42e0-996c-08db847498d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:14:12.0238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nCchxk2n5YQeewf/jzwnozP63FMO6iMgzttxVy5W5wpafueM3voTNZveNm4jXE75z2VtvaHdG6PFVdJ8vk2SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe: Cleanup CODE_INDENT style issues
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

On Thu, Jul 13, 2023 at 03:06:08PM +0000, Francois Dugast wrote:
> Remove all existing style issues of type CODE_INDENT reported
> by checkpatch.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |  4 ++--
>  drivers/gpu/drm/xe/xe_engine.c         |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_fwif.h       | 12 ++++++------
>  drivers/gpu/drm/xe/xe_guc_submit.c     | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c             | 10 +++++-----
>  6 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 83c9245dd362..2865e989c30c 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -275,13 +275,13 @@ void intel_unpin_fb_vma(struct i915_vma *vma, unsigned long flags)
>  int intel_plane_pin_fb(struct intel_plane_state *plane_state)
>  {
>  	struct drm_framebuffer *fb = plane_state->hw.fb;
> -        struct xe_bo *bo = intel_fb_obj(fb);
> +	struct xe_bo *bo = intel_fb_obj(fb);
>  	struct i915_vma *vma;
>  
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
>  	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_SCANOUT_BIT));
>  
> -        vma = __xe_pin_fb_vma(to_intel_framebuffer(fb), &plane_state->view.gtt);
> +	vma = __xe_pin_fb_vma(to_intel_framebuffer(fb), &plane_state->view.gtt);
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
>  
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 3831c5f82773..957b084629d6 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -173,7 +173,7 @@ enum drm_sched_priority
>  xe_engine_device_get_max_priority(struct xe_device *xe)
>  {
>  	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
> -			               DRM_SCHED_PRIORITY_NORMAL;
> +				       DRM_SCHED_PRIORITY_NORMAL;
>  }
>  
>  static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> @@ -540,7 +540,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  		return -EFAULT;
>  
>  	if (XE_IOCTL_ERR(xe, eci[0].gt_id >= xe->info.tile_count))
> -	       return -EINVAL;
> +		return -EINVAL;
>  
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		for_each_gt(gt, xe, id) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 27d132ce2087..e215e8b2c17a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -64,19 +64,19 @@ struct guc_ctxt_registration_info {
>  
>  /* 32-bit KLV structure as used by policy updates and others */
>  struct guc_klv_generic_dw_t {
> -        u32 kl;
> -        u32 value;
> +	u32 kl;
> +	u32 value;
>  } __packed;
>  
>  /* Format of the UPDATE_CONTEXT_POLICIES H2G data packet */
>  struct guc_update_engine_policy_header {
> -        u32 action;
> -        u32 guc_id;
> +	u32 action;
> +	u32 guc_id;
>  } __packed;
>  
>  struct guc_update_engine_policy {
> -        struct guc_update_engine_policy_header header;
> -        struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
> +	struct guc_update_engine_policy_header header;
> +	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
>  } __packed;
>  
>  /* GUC_CTL_* - Parameters for loading the GuC */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 86c445903560..efbc4b13e9e1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -352,17 +352,17 @@ static const int drm_sched_prio_to_guc[] = {
>  
>  static void init_policies(struct xe_guc *guc, struct xe_engine *e)
>  {
> -        struct engine_policy policy;
> +	struct engine_policy policy;
>  	enum drm_sched_priority prio = e->entity->priority;
>  	u32 timeslice_us = e->sched_props.timeslice_us;
>  	u32 preempt_timeout_us = e->sched_props.preempt_timeout_us;
>  
>  	XE_BUG_ON(!engine_registered(e));
>  
> -        __guc_engine_policy_start_klv(&policy, e->guc->id);
> -        __guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
> -        __guc_engine_policy_add_execution_quantum(&policy, timeslice_us);
> -        __guc_engine_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> +	__guc_engine_policy_start_klv(&policy, e->guc->id);
> +	__guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
> +	__guc_engine_policy_add_execution_quantum(&policy, timeslice_us);
> +	__guc_engine_policy_add_preemption_timeout(&policy, preempt_timeout_us);
>  
>  	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>  		       __guc_engine_policy_action_size(&policy), 0, 0);
> @@ -372,8 +372,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
>  {
>  	struct engine_policy policy;
>  
> -        __guc_engine_policy_start_klv(&policy, e->guc->id);
> -        __guc_engine_policy_add_preemption_timeout(&policy, 1);
> +	__guc_engine_policy_start_klv(&policy, e->guc->id);
> +	__guc_engine_policy_add_preemption_timeout(&policy, 1);
>  
>  	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>  		       __guc_engine_policy_action_size(&policy), 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b7b02c96e998..1af5cccd1142 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -312,7 +312,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
>  	const u8 mocs_read_idx = gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
> -			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> +				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  	const struct xe_rtp_entry_sr engine_entries[] = {
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..e244d27b55d5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -201,14 +201,14 @@ int xe_uc_start(struct xe_uc *uc)
>  
>  static void uc_reset_wait(struct xe_uc *uc)
>  {
> -       int ret;
> +	int ret;
>  
>  again:
> -       xe_guc_reset_wait(&uc->guc);
> +	xe_guc_reset_wait(&uc->guc);
>  
> -       ret = xe_uc_reset_prepare(uc);
> -       if (ret)
> -               goto again;
> +	ret = xe_uc_reset_prepare(uc);
> +	if (ret)
> +		goto again;
>  }
>  
>  int xe_uc_suspend(struct xe_uc *uc)
> -- 
> 2.34.1
> 
