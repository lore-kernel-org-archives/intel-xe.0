Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937CC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 21:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3575710E83D;
	Wed, 13 Dec 2023 21:05:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212DD10E83D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702501546; x=1734037546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IiE6E5wfhOOnxtzcf0ezXikYCPihm1H5q8Ij4ad2obE=;
 b=OrXdsK0ax++KZwGklXNscVWBOcWReKfakLmenCMdMFUv5XNKjWp481eG
 jIeNf9707kCdFIfyfHKgT6GkqG0PdJM9hGgFJ3YBLW90Fd67G9e+Hlr9S
 mx1gFsv3RlKgeXuWD4ygDgyZN/RC5K/dJSegqgPhqsNjX+qDRYuNQZxcG
 cF5UY+iGrukXznoAs9wKPkgi2N9q/2s8vtbLWSK/zYam33JOkV3aiQ1Js
 o0wSAtdZd4fCBvvwhI33O+vSiGgFa3oUzxV+PIr+sBzMIIgnUy6gMMjt6
 pMtD+3K6js6yVU1SeZyn/ncpoaDzm2KJ1uYbySHpMsEFj5uOceUoAbkM4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459347108"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="459347108"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 13:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774083353"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="774083353"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 13:05:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 13:05:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 13:05:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 13:05:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7n/6yucwDAbBqZj8G5jBLkkAWJiYo7/Z5U5mtB1+pLdYaRLt10c1csHRGP6OBEr7VFoxtNdfE3w9lNi8yoWw148W6BcCN42wHxxc+EPUmXOXgQ99kpPQBm88w5XRRbgFN8ogE8x+FAFpXjUgv+WNItcv36ISGe5FRjd2wkDy0J0WzIbj5sDUcZI5SGgmGagsmZa9/XaC6pZba1hYEvqyrLviPYEBsDTKeVYP7Ix2NS8Kf5ruvAqbim5WxBL6TKTAhPq3Q8j2QeCZHpa67jjBu04hKkJuasuKRl0NoUnCrggG/mOv2ssovcu5djOUuN3kvPH47SE5E18UM/rAZ3gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7Ph2jrGDnSTaVLN0yHZvfoHv+eBUtcJO1DM4t7Ytew=;
 b=dtUhxqrdHlGVz54RmltkEyLM/an5q82QyF9Jc2LI/B5OvFJkP8g87Ui+RbYaYtJf4egPUzdAzARjTNx8KFdm4y+fnvKnImu6j1fjbpSBZ6yzjtPQdszRlJHygp17jljGLfJsrwSzxGCafLyvJKdcOgPIIr8ZMkamKpBCQ3rVGcTsozZNmP9BArKmtaWfz+erip/QiDMt8NrBwPOUUmQN54vCwOKnKxO280uWKGXhgPHRsAzfyTleeoIe+UxtSyQNkwww074lrXMYAQwXXDx8N6xo9kcEa9UU7OigzoSCDcBRgveUd4vbfJFhA7IlSVnDZxvpH8fxCPj+GpTbwxvrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4933.namprd11.prod.outlook.com (2603:10b6:510:33::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Wed, 13 Dec
 2023 21:05:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 21:05:42 +0000
Date: Wed, 13 Dec 2023 21:07:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
Message-ID: <ZXodE1j+s9uvrUbB@DUT025-TGLU.fm.intel.com>
References: <20231213200327.1425151-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231213200327.1425151-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:a03:60::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e45343-fdde-4b11-4e74-08dbfc1f448d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQ2dYXU+UK6cPjuCxJhFnLHfB+7V5URER1xROsJGM5efh0J3I21DP5HgQCVL+OB/ClcA6ZLqSE3AwoPp/Nk4brWua/4iPspJjlUbLB9YjxCiCYsh9roaPv5Sebi0UdIRRjVzv6JWcH7YFVs3DAXebu1HwbvEnADJmQj8IWC+bxZyKgobZUe24mJv1W7ALBZqw8axhGk1T3E5veXcrCPJ9v5z/Sja0+ZzuwtiNa7q/zIk4jQYV7pxq3n0rNkC5VwsBgck6IokhwHiFE1hvgy01w0i8GDGU/2xEa3O5IeudFJWKVtNSYXsigOfHimE5650LvM0/VvnhfO3d5aP/FkWjoAqYmB621QdjLq6DqrPjsQau23kO6zqv231KM2SvcZsXwWuFN1bUtBfF04ZSiv76aHWhivWYkkabAzOkMkAU8eYvYF5EZMY6h+8bsIiWPe47Yy7gkKEjgfNBrqT7B68kVRE2dQs5Oppbx9dqaEOzvYEMupJj0vx0gpcZnh55VCS5zm3I+IZ6iCGBwylARYCg5rIaZYTR5qxKODcT8dLvO7tFqYH1AlclqkeQTLQKwlaa/Y/LRnuZxAPDBf7rObpPlKMBoC5xZo9TdrOMvp6Oio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(107886003)(38100700002)(8936002)(44832011)(316002)(6636002)(54906003)(8676002)(2906002)(4326008)(6862004)(5660300002)(66476007)(478600001)(41300700001)(66946007)(6512007)(6666004)(6506007)(66556008)(6486002)(82960400001)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVomcr5EPBYvAtjmPJHtVNd0ChBRrgfmboK7sQZhreQK9VzS+y+pHIcIN/+b?=
 =?us-ascii?Q?ssz85glj+yIqTzT5U7avqR33NcEK7Lh6Nm78Lutvlxer8PNAGnsNmLqer6wT?=
 =?us-ascii?Q?PeeFUhRogPDRuWJO/3fkyXhnyIY0DjSgtxugPqULhhT/AGHoKQlHHuIkQpt1?=
 =?us-ascii?Q?3YSVqlw3SqoqPaCOCg1AN+C6IfrR74HzhSJcJdz2HjsBNPG2TXzeCAHaWrUs?=
 =?us-ascii?Q?kROpBPU8TqmEQPO6nK+Ip5ntmVArC6+grks5fWh8GFKq/Ewvh1odhIjUmUj3?=
 =?us-ascii?Q?lkKTdX3aNJlDDAD+V09al3oZPvegh3oZT9cOOgD4BUf+VkDpNC93iTCXyMdn?=
 =?us-ascii?Q?mZk1VHphuLu42n2l2UVRpuWVbZFaB6937ZhxaRi9mZqKADSiv/MGpla+yzC+?=
 =?us-ascii?Q?Ev1Az0I7hs/uoptR0VCIw4WlbB2tmUWjoqiHbI1B0bImVdo6SKX8PDGJ06Av?=
 =?us-ascii?Q?iYiAlrLPuWG+Cajhv9zRp7X84ctos+a7tKvnHQY88DpKIXQjbyJTuMDlK9cy?=
 =?us-ascii?Q?uPSGIzT+r4/gM6vx0DAvrayBFYK/PtFVQwt9GuG8N4rBM7PiiqTwR/8Zgte9?=
 =?us-ascii?Q?mVkmeL/uuSbZoYjB8HsufoPZ49fBqta/xFDglgAr7BWr5j5gm64b8YXPrccZ?=
 =?us-ascii?Q?F8NhagHOk2YwiYbTN1U/Po8oNENZQn9NsvyGCaJg+/CaIOzHl9TQT0u5XGwa?=
 =?us-ascii?Q?wfosqqQ6AZHz8mwPALJ1sONVB6rHXwKVauQcuhMDBFKLOKi0y7RBMqRDRP8l?=
 =?us-ascii?Q?53u75+p49Xf+d5pz0EJJ7ozBOO0tAsvNrwhiYAdvqKGFa2o0ptQhYNdJKgje?=
 =?us-ascii?Q?mdg7zazju5zpERB5F5PzBNwjKWsSCfx724tZZ/CihlWrAOJdD3VpBQjEV3Jr?=
 =?us-ascii?Q?asDbGXESX2dmP5R29ou3q7+w8JqvNTZ9r2On/Ff5OBLi0O+alkx0cKMM7LtO?=
 =?us-ascii?Q?IfGiq63QSNmJYgbR6HyDM438ht9Ow/vT1sVhlm258dGo7On9sUclDiGfktBK?=
 =?us-ascii?Q?5uBiqUEWq5hoxeBHMaRse/4jQXZcQodkOpDchLGRtttPWnl5Uo2lKNjKFueh?=
 =?us-ascii?Q?nkEZcwLETxDcS2e+ZguO97Dfyb1UOTGYV5nGT9chKQB0PyC1r7s6hOpT66Md?=
 =?us-ascii?Q?a98ZTSTwRx/+qvf0kCIBwmHzkhlv5bfwT2eBcCD9waH3kbmfdl/biC8lr9C2?=
 =?us-ascii?Q?gzaK1jlXhw8i6MCkUTNSzKxwvSonj8wJabKkwDLoJEvsqYZQqT3HBM8XIkzM?=
 =?us-ascii?Q?CgccAltGBmowEGewjgHnOV3FteRZ+tjZi4/7cBVT52DpGUx5iO8B1kr1REKT?=
 =?us-ascii?Q?MSj/ATvPjARgZ0BeL2sARJn3w24Uyt4uGtfoN2nshEldXko7kQf5Mja6tcZl?=
 =?us-ascii?Q?O+/DO0L+fA4pCKA4AfFda3uvY7JCpK2yl0AuzQ6q/xZl8kWQvZqoBSPGPhSC?=
 =?us-ascii?Q?iJVRXOiVWDi7Wo4mve8hNiCXE7HGayy6XcCBKOLUypA9YVF/Xpa5TPFz8alT?=
 =?us-ascii?Q?h4bAwk6Ik/XbcNA9G0YdGifJDO9Xaz4+z2AeLuH87wryjv4NXME7tpqbNK8Z?=
 =?us-ascii?Q?MI7zAZ+Q+wSdcocBbgvFi8gebGae2RYXpLFOWBxPXz3cCBMTezeqKehZN0fE?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e45343-fdde-4b11-4e74-08dbfc1f448d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 21:05:42.8805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM491mROKKwt0eyLGJ0ZrKAlHFRKwmLJUZOSG/26jNq0ejRnlKOSVoAVP0xcYRk2OrCxU1HEBcaeHMAMR8TDfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4933
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 03:03:27PM -0500, Rodrigo Vivi wrote:
> To ensure consistency and avoid possible later conflicts,
> let's add drm_xe prefix to xe_user_extension struct.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
>  include/uapi/drm/xe_drm.h          | 18 +++++++++---------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 85bc25fe99ed..b67097ffe6fd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -453,7 +453,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  				      u64 extensions, int ext_number, bool create)
>  {
>  	u64 __user *address = u64_to_user_ptr(extensions);
> -	struct xe_user_extension ext;
> +	struct drm_xe_user_extension ext;
>  	int err;
>  	u32 idx;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0895e4d2a981..8fc3f8caecde 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -27,7 +27,7 @@ extern "C" {
>  #define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
>  
>  /**
> - * struct xe_user_extension - Base class for defining a chain of extensions
> + * struct drm_xe_user_extension - Base class for defining a chain of extensions
>   *
>   * Many interfaces need to grow over time. In most cases we can simply
>   * extend the struct and have userspace pass in more data. Another option,
> @@ -45,29 +45,29 @@ extern "C" {
>   *
>   * .. code-block:: C
>   *
> - *	struct xe_user_extension ext3 {
> + *	struct drm_xe_user_extension ext3 {
>   *		.next_extension = 0, // end
>   *		.name = ...,
>   *	};
> - *	struct xe_user_extension ext2 {
> + *	struct drm_xe_user_extension ext2 {
>   *		.next_extension = (uintptr_t)&ext3,
>   *		.name = ...,
>   *	};
> - *	struct xe_user_extension ext1 {
> + *	struct drm_xe_user_extension ext1 {
>   *		.next_extension = (uintptr_t)&ext2,
>   *		.name = ...,
>   *	};
>   *
> - * Typically the struct xe_user_extension would be embedded in some uAPI
> + * Typically the struct drm_xe_user_extension would be embedded in some uAPI
>   * struct, and in this case we would feed it the head of the chain(i.e ext1),
>   * which would then apply all of the above extensions.
>   *
>   */
> -struct xe_user_extension {
> +struct drm_xe_user_extension {
>  	/**
>  	 * @next_extension:
>  	 *
> -	 * Pointer to the next struct xe_user_extension, or zero if the end.
> +	 * Pointer to the next struct drm_xe_user_extension, or zero if the end.
>  	 */
>  	__u64 next_extension;
>  
> @@ -78,7 +78,7 @@ struct xe_user_extension {
>  	 *
>  	 * Also note that the name space for this is not global for the whole
>  	 * driver, but rather its scope/meaning is limited to the specific piece
> -	 * of uAPI which has embedded the struct xe_user_extension.
> +	 * of uAPI which has embedded the struct drm_xe_user_extension.
>  	 */
>  	__u32 name;
>  
> @@ -626,7 +626,7 @@ struct drm_xe_gem_mmap_offset {
>  /** struct drm_xe_ext_set_property - XE set property extension */
>  struct drm_xe_ext_set_property {
>  	/** @base: base user extension */
> -	struct xe_user_extension base;
> +	struct drm_xe_user_extension base;
>  
>  	/** @property: property to set */
>  	__u32 property;
> -- 
> 2.43.0
> 
