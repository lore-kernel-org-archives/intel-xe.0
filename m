Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277CCEE14D0
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 07:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E6210E778;
	Thu,  7 Sep 2023 07:08:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03D410E778
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694070531; x=1725606531;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iqDAqHR56pMZylSJtDNquhOeHlj3AKV7JZARN/5OUsc=;
 b=cEMTwOba1QU8U1G6tL9PEYV5agDEG/rxnjTqPhUvuAPNLBVCjdYrG4Ep
 yzIrBaq2QN8gqWXf5MnqB9cA3PmC2mm1EJlRGxFkvJ7W73+ZIDU3aGqcV
 SuBosnFrxcsWZsVsLAooCVw9UYFZieG/vC9W7WDPp19Tb9KaMKpcIJmjl
 f84JQ7YIdp+Y0U79wnRqyFEU5Vlyo6FAdrq3VS88ntGiMNXP5rXGe2B1N
 d8ybIGCqJf8/S5dsld9UfHcTzMWID3ah8tp891bRZ/7Ci1l4y1DQKn9eg
 oceD6pc9MXXzAGhE4mDVph9h+urMK1a9/SoW6VcctxDlHo4KuXxLozQfS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356760206"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="356760206"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 00:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915605656"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="915605656"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 00:08:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 00:08:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 00:08:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 00:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLdd3EvfUyDA9eatGrYC0y4ZN54QxVhXx9rzeVB2EA6l8QaTxA4R7442sIxRh7HxQfQLWXnLuh+GdisdrKadjcORnYc+cJIhtQePIsRbrwJuEM2YJLlTYHuRoke29Ajnm8KvXETJ16civTszFudn/xDSOZ6rD/LU/M1//g6PdvWJ9aZLxLS9Qe4uPudUK8vMApDxM9lWH50qX3CHilUv/MRYdwtdBLKzYyZ50R0Rja9g4zhxdu197aIKHn52COn7gU7UlkTAgJV4Ze5He1Fu2TlQSkRvbMyR1Bz89W+HxcOCZ3H5Feh45/6jUaL8SbOFmqHy6/NaxaLtmdi5GhTSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d/ZTwsrSqcK36MClqO6x7tW141EDhxW549v5vmnLqY=;
 b=nABr31c50euUx/5wt+36s3u4OjmOoERA4cHaGFX8ttlFjN0+HStnLWh9TtUoovPtijKpjWZ356fKRNzCyuRl/lwjyt9PZR63EQGccSoyEcEo7YUiqcSbBbehW6JTWBWOolvoh1xaVUYO1mTFYE54dOunt0PnDGYD2Ebw71hdeI2T54vlc7faYIEPuTfLIl0fHWvMlBbFIiuJXJ2zsGpvvBE0X5CxYAkNuAq4mmInUWetBx1Bq5BN11ZK7auXk1XSYcy86AtUeqr/8Jx0DaKgxGBjEPo5o9IT1QEL1K6o6AJFR/W/PW/ZdELTw5FOGlzAY8JUsoHpWoJ8ZY8q1Yu4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 07:08:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6745.026; Thu, 7 Sep 2023
 07:08:12 +0000
Date: Thu, 7 Sep 2023 09:08:04 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZPl21CVXOINtKwaT@fdugast-desk.home>
References: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
 <20230906181632.342494-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230906181632.342494-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BL1PR11MB5480:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9be953-d737-429f-6c9b-08dbaf713282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JQy9EzwRBEUlPpeU8kkqrOBKt9rBO4UwuELdzVIK6vv11epnPvfgHmsRVodpD2gJ0Pc5aIREBiAox+IMD/hl+Hdv+zAcDN+KzHCSCWr/Bg30C+VdhvHmrCVJ+DHjSVmSvlUF+I0LHrJp96XJDIzDZq6479hoBmdkNNpLCMlsB6F6w6bgNkB5AMqdI/e6fkLmCOO7/QVPPtZY8jOIxZJWjBHAMYoRN2FJ4SVTgWtaiXWFsFuho7so0xwoF9fkk0LW0D5MzngsMgas+BGrCYgeL8FI6vUbDhwMBKBMq0Xk/I7EJ9OkLOg8EGIJSPGVeX4f6883/YyA3PJ3vjfj5+XXB5yZYSXEPv1s9r5U+FfuNNfaPttuLzUskOncM/TghNiHk4y+YrLQNGCP04ZBXdXouagHy2I+87LmV7zRyFHjZyu1W+RPoQ2r3eGSzrSu8cpbe9N01d0IWvPhyxE/ntZf4e1NVXvlCuqxuSL0diMrDxBR+a+WVlo3JBajkODavejLMkgx/x9fHK/jAx9mZjmBlG1SqOi6vvcgHBs6u7A61Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199024)(186009)(1800799009)(966005)(8936002)(6862004)(8676002)(4326008)(478600001)(66476007)(66556008)(66946007)(44832011)(5660300002)(83380400001)(41300700001)(2906002)(316002)(86362001)(6636002)(6666004)(36916002)(6506007)(6486002)(6512007)(9686003)(82960400001)(38100700002)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SFPKaZrG9IdThHsW/oW8kcwXgjZ4BffJDNkxCKjb5ZDGY4qdNxR8xpac+Q?=
 =?iso-8859-1?Q?xsZYu3MFp2mpCi2DX1FuOz5OhK24kWK+UAe/GNg+JmfvpB+NZRM1IwdBP8?=
 =?iso-8859-1?Q?gZwfYzXrKkSlnKDKaueeREfh4aMGRk+LNTfGzLPKw0E5bSaK24sAQtUIc/?=
 =?iso-8859-1?Q?iQ5/BjehJsGlz+RrW1R7WNkikm4AH/Y3wtcjP+5SNCrTiPlqh6cxCmkLh/?=
 =?iso-8859-1?Q?zP6bPkBLrYMUIX19kuBNkNYvIrF9ss5hTr+IbqUPPYn6u3yfNZz1jjQGq6?=
 =?iso-8859-1?Q?+HK5LVcpW0CH5QbPiCLzMSqi9xn+hp+lu0t0LcVkKgId+zMRqYbG4TOUCP?=
 =?iso-8859-1?Q?S/gS0Xcm+YT7ASIXkuitxgQb3bvuqw8adPg1as+aqBxnBu+n0NwCwU0drs?=
 =?iso-8859-1?Q?e7bSJlPy8XHZVCTB9ZlfI/bj1mspc/eVGz8Tz9U9bKsWRpjdwLI8k7PS7i?=
 =?iso-8859-1?Q?7ZaU4+af+B8A4Ft5/d6nShH1wtmCHxb/B3BWtlSILJ3kpErO6SoXigsaen?=
 =?iso-8859-1?Q?NbrzYcrhgIWeio+Vr4u0tBbAX/LMWX0zHUszXIh+DyIMCTdl2aWKF8RBa2?=
 =?iso-8859-1?Q?2S1eVtUEaTr+8rfPR2PlX9myBt282CR3WfN0sjS0MKBZ5/ikC8i1RtkL/X?=
 =?iso-8859-1?Q?knlLB5bVhHnHrJ6TltIGlzNXB8X0gWdSJ1n3q1SCbR3/bLEIgM+VtJIdoT?=
 =?iso-8859-1?Q?UnXo10ptBLC7LeWSTNmURgatBv/yZZfSCaaQbi8ptE/7qzITBM0eZvMoje?=
 =?iso-8859-1?Q?yDbwzIeqYWS8HSeCpJpnfzo4tKiEk7oSyEf13ybbZat5FSaxsrnu7f4TqJ?=
 =?iso-8859-1?Q?kKxv4LrhWBxckKfL08kvpn0+/VgdoC0oCT6rwW4AM4raLHPSnomaVfoGRf?=
 =?iso-8859-1?Q?szxHqyda23DLo6CBbuWUBANedxGeSQz5ujyb2zBB/fqKP5/qVoI9vayHp4?=
 =?iso-8859-1?Q?7v/aQB2QdqxF9aHE4AKC3R77hwwrEYZaQG0ksV5PodA6szAuvdX5aun+5G?=
 =?iso-8859-1?Q?vgUtwWg/Y3IOodE36ZOfnhqWRt/9qPfK6KJvaB6ZJlWYep0YbmGxJgdB0P?=
 =?iso-8859-1?Q?J96eD7bAIyeVCamsR9zzcw8Qui1mLCrJan7m7KdTcQ5eZmcYOdZ/DYIkKV?=
 =?iso-8859-1?Q?uCh13lPiTJ9Yn29mX/P7SONiNw8DeQ2kxxf60iYHmcO8FXzcBt026bEYl+?=
 =?iso-8859-1?Q?Vm2rqSv18ztwxf9fI/DwN1LMORJqYw2KKgxFp5qmcwhW8ztfu+MtmqjYg8?=
 =?iso-8859-1?Q?2Nee1O8Zl64aD7eF1Q9E64DOVRMuPo249jUB7DSv4qLJbH5RCPI0CtKd++?=
 =?iso-8859-1?Q?65unAtpx0NhFhZZOTqALNo/DJkXrwut6ROOzvB3VuQeVC0vVXtN8A0Qbx6?=
 =?iso-8859-1?Q?9nI3VJAJ6EH0RX/9yHL6W6SNxGwa5DNQ4i3WCpqDi4UsbkSs9YmjwN4OYi?=
 =?iso-8859-1?Q?GVpilE660xZ6r55ww3RtguNz2InRvEQgxdBh6EVcbprDD+41/nfvmYN9mp?=
 =?iso-8859-1?Q?iJ3Y0VNqq7zC4YZBbwIFqhji59f16+YLGP742NjQPnj+C4FioegHMyn1PV?=
 =?iso-8859-1?Q?3wJCSdthDxaFGMXKCJr2pYpVJwuVcW8RBlWmOFf0crrIJaH/InFB79ULIY?=
 =?iso-8859-1?Q?haGAfCRDLywn/bI8YweqyP+G+s8taRZH0LtWlXCHX4va/4S1tcL2Bclg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9be953-d737-429f-6c9b-08dbaf713282
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 07:08:11.8989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ56ASyJuAaY0Ro502b9CTenhe82/yKci3lKV4nMKmbLxyMcQEa6d9AHUlUDxP60L1Y79fcyr0iwmc21fgtMmhWrxR3ju+PruSJ1rgOHcb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5480
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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

On Wed, Sep 06, 2023 at 02:16:32PM -0400, Rodrigo Vivi wrote:
> Fix typos, lingo and other small things identified during uapi
> review.
> 
> v2: Also fix ALIGNMENT typo at xe_query.c
> v3: Do not touch property to get/set. (Francois)
> 
> Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c |  2 +-
>  include/uapi/drm/xe_drm.h     | 19 ++++++++++---------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 1db77a7c9039..c3d396904c7b 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[XE_QUERY_CONFIG_FLAGS] =
>  			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> -	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
> +	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..902b5c4f3f5c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -256,7 +256,7 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> @@ -449,7 +449,6 @@ struct drm_xe_gem_create {
>  	 * If a VM is specified, this BO must:
>  	 *
>  	 *  1. Only ever be bound to that VM.
> -	 *
>  	 *  2. Cannot be exported as a PRIME fd.
>  	 */
>  	__u32 vm_id;
> @@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
>   */
>  struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occured */
> +	/** @error: errno that occurred */
>  	__s32 error;
>  
>  	/** @op: operation that encounter an error */
> @@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
>  	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
>  	 * Once the user sees the error (via a ufence +
>  	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> -	 * via non-async unbinds, and then restart all queue'd async binds op via
> +	 * via non-async unbinds, and then restart all queued async binds op via
>  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>  	 * VM.
>  	 *
> @@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than differing the MAP to the page fault handler.
> +	 * than deferring the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>  	/*
> @@ -907,7 +906,7 @@ struct drm_xe_mmio {
>  /**
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
> - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>   * instances list and check if user fence is complete::
>   *
>   *	(*addr & MASK) OP (VALUE & MASK)
> @@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
>  	 */
>  #define DRM_XE_VM_MADVISE_PRIORITY		5
>  #define		DRM_XE_VMA_PRIORITY_LOW		0
> -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> -	/* Pin the VMA in memory, must be elevated user */
> +		/* Default */
> +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> +		/* Must be user with elevated privileges */
> +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> +	/* Pin the VMA in memory, must be user with elevated privileges */
>  #define DRM_XE_VM_MADVISE_PIN			6
>  	/** @property: property to set */
>  	__u32 property;
> -- 
> 2.41.0
> 
