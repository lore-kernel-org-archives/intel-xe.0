Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D0C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 18:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D7210E4B6;
	Tue, 14 Nov 2023 18:47:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEA210E4BA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699987667; x=1731523667;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b74OfWTlkHa9exEsHTrLJW5/KXVhkCGw1S48VSXc7KE=;
 b=UHg9qa3+IWapiPLwa46JA6ZMNeVtAv7T5aU7TnnwELn1MMybZ7vV5Q4d
 cndgxJ4MTmuEEXVJG2m3fnGdr1Ps+vTUGM+7GNFNZHrF5FF2Zzt7yk5wA
 mGN/tNWo3qLjRAjus//9sMgKpIM08UDRhj+26lk01MaU3auAYaXWXsWXG
 mJLpfSDwzu2QKLs1GkrJ49qszWlGcUV3L9C6vlp2xDF+FW5qc1iZcBq9I
 nsRwWRgwbvi3NBWc/kq4g9pd/UGccJ4/EyuFa5r7oxa7spvuBKb7t+CJw
 d0KqnDbacByNhwz752r9ruKA1BY75EpidQIU6nMe6QnHU/v+sqE6opT4J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="389580271"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="389580271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 10:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="758251963"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="758251963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 10:47:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 10:47:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 10:47:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 10:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcpmdX+arlDlaW7b1czPqEMXelNKD7M0z4W0El8Ozi/Y7RDLSxyTS6ahUC2zkR9TP/zefe5uw1JMr/PSpCjSYGWKXmghf3Ixv+3GP11zEhItcpIQ2HZDmJOEXIA16IJycsqTJJ2Vnukoyts62mfC+X1f10mulleYcK8Xdr3O7Usatm3qlZhYoYdiv4TJ4QPfw+ou8tnk0YqlYzKDWdMijZqUXNPbw+eDfJ/AG/3NCbD8wrlC+f+C4scSCmUYk1vFpRwFy0WNGwg1rUqHzZfUY44wshNGcxLY9ZWjFn4vSKDD2X1wZunclOFyvbp7gegYXCOjpX4dLBPH5K92V/rgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aR5V0KshmP9XxpFAa6GkGCGYyv63oLjcutyGFeC54I=;
 b=UpxZFxLU2wK3uhzxJO1g14IA/lsiIV1KjAhbxOF5goVZ4SafRygH+9GGfteP8k3JLsk9/ko5JFNhkoszekSzHFRhA7wWSl10o5g2fz8xTRpgdTEJLCcny3omRkp0kjBe3bUzZppAHLcVEw0aqKDDe9GvH3hfCen5Ys94DTYbgXpMVa+Z7CpHMDFihw3zbv0XjbFFopUN49IKdxJWQLKVQjam7qeKmrOjj6RSWl9Ieqe/EAmNPsK7Bvk6Ud/H7qM8bpSaafzbeP18dB5ge+lisLqP27yovFX8KTtTFeVVbHOw+c6UFaaqA5Hc30or9LOJez+Pm2m8M5wZhGrlptOVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5466.namprd11.prod.outlook.com (2603:10b6:408:11f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 18:47:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 18:47:36 +0000
Date: Tue, 14 Nov 2023 13:47:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZVPAxJb1izaa+zOs@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
 <20231114130443.2503708-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130443.2503708-4-jouni.hogander@intel.com>
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8582af-2432-4500-48b2-08dbe5422b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGF2ccKKeCe4zSPwKyBofsQrT7NTVGgWoe0X1gf8RgJtXXfAV22qwwij5kP4ulQmOLzUD6aX6xiuz2E2iceNXzyH8MZmKS8S5dOpJ5PnEHR06Dl3OUUWIwKhy6hfsGgt6aPGR3z7DPi1ElZLHV+CSaMb9TAhg1iowijRBX8Uh/GGhboipYyQi/BVY/nAv7TKDD8x88KVfs6STvTc9+u8lTCdiHyCWklykEgrog8YoIZ2MO56+gx2PyIjCWPcDVN417f5bUv3eO4c2lR77/gKBToiMg2P/qb348i7//0RykzRzGbAF7PJ2dXtDyXAy70KlWgMzRw57Wqp/D+Il85YiKaai16xl/YczySCHXJXdXhzj+JuHdea71k2fDg6a9R6PBJSxzOKJf5Jh45AuvmGSZhkoUq98OcoR4+RuJQRyqgiUPBXTPRIGwS1Mwa4XCu+CLQRYuFu9zhWnQ4lrfoAjx+xwywNvHeKpgJIGFub5wWsDY8LZD9Bpys7BFgRyyLVLLPOF5MVN3Zs4l57AmBU2oxkAbpuSy7mMdI4hd+YheP+wt/dv6sfUVj5IAFdhxxyZ9xo3uL8uEm+9LZc73tw1XrGgLEywKEhKgG0N/Sdx/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(26005)(2906002)(83380400001)(41300700001)(30864003)(5660300002)(478600001)(6666004)(6486002)(86362001)(36756003)(44832011)(66574015)(316002)(37006003)(4326008)(6636002)(6506007)(2616005)(6512007)(8936002)(82960400001)(6862004)(8676002)(38100700002)(66476007)(66946007)(66556008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JQ2S7M4C9GAvnrTNAhHht5p82FxJ4JOqX94QnmnXELLvdIsPz4E1TpHI7m?=
 =?iso-8859-1?Q?ZcAbcHxqtd8YVmwBB2sIsly+6YHlXp0kBR+K+dUad9NA7anzKtZfv7Fzcb?=
 =?iso-8859-1?Q?S9SA8fCZG3+0IfWilQqq5kEJUPTm64bAwf6q6kQ5p7TOfKnMcgJkq9eHQ4?=
 =?iso-8859-1?Q?M787cll5wseW0tbQUEnh0zd/dMV8Qh89enIfjDAsvQVW4d1d0Sb8/uvt29?=
 =?iso-8859-1?Q?QI8zcFMmfeiMU3aZa2mYSqHd5Qw7Ionlw09HqStPTbjgT1gSLkpfqhk7p/?=
 =?iso-8859-1?Q?9+nYIsgXXrVfkftr7PqjXSq0hZW3TxshH/SCqp997zKsmPtpvgcvG2s+Oj?=
 =?iso-8859-1?Q?rnInNXQUtWqATc9O+sun1MZEINy97o2dYV4R14a1h1yaX3vyesult1bwAA?=
 =?iso-8859-1?Q?0KpL8ntQRNTUkPxEzRSQdS74xhR7DX7MKiq0PEystwX0VtsrHAXFvS8spD?=
 =?iso-8859-1?Q?FvvKEj+b4J3cDd4jR0vj2IJOpxGHkLdDyaCAANNkramz1dqHXhTTZUUw/F?=
 =?iso-8859-1?Q?26n/+eETjxTkznzo2WgXiIOQuTf2FABP8aVxw2bQvNBEJUYqhYlYNduZY8?=
 =?iso-8859-1?Q?SGa7xRvBRcR+p+hXNDNgmGAFgrB5l4Y3xjndMdYswXkePLb+mjrPHc3iCH?=
 =?iso-8859-1?Q?bOrCmIrcA/CvmYem1zrNdQHVD3dBn/Y1LkwE05/J8smeviG53qa7OPVqcy?=
 =?iso-8859-1?Q?uZm3REsNPXo8t7m3hWaT2B/hpf9Pd9cBGkNGqFIKg8lG7vIzwTo2jFE08w?=
 =?iso-8859-1?Q?DqfNMOf3nDpZ2R+RPa+7P5qnx6UPiuNokfEdAMgTouMQy3cU26gPIV+Du3?=
 =?iso-8859-1?Q?Dk3WqPS2DFLHEqdCO7jU7ma8NFr3UCi16cND3GxOBmZAIXk9sQMOSM3zgp?=
 =?iso-8859-1?Q?hrWwl0SJSkxOn0vxKhPGdLjczAJCVlL1OVWRlqzJ5diqFAXlxExVg/BFWy?=
 =?iso-8859-1?Q?DeZTse6Cybhf+tXz+CnOQHSMHnuWoU5KoBdxKMtI/1VAeTdZB5khcbg8O+?=
 =?iso-8859-1?Q?Jp85zDmcUZWLkg4Tj1ZA0sEk9LwXT8prJLLBbHrPgaa+jgPXpCRQ2s4RZb?=
 =?iso-8859-1?Q?q+jYTCGOXGvRq1fn9uVbezcb7eidOjAeAnu0mvvTiO0CMPPvmdexodNj2d?=
 =?iso-8859-1?Q?gDfjHZ/NP89QyxlZHvNNBgD1FGXPWs5U4RvT02lbJn8HsSnV2ZzSjn+8zU?=
 =?iso-8859-1?Q?OhduQ/7PLkt/Y7J2PkGDOlYIWUDAyUv3/DthHnvz3NQeRjmPifgYeWJml9?=
 =?iso-8859-1?Q?IeebwsBXswvrALiDiS68b5GgX6zlUZ3466BfceA60FRzkVw2cHBW0AvnzV?=
 =?iso-8859-1?Q?HVmMCednOOJzAJkUMr0zhhUDv0TDryIDOlwoHyhsFfYbzDdc25QVyxNWmT?=
 =?iso-8859-1?Q?M8JgmbjhhLSmCl3w5mcpB7bVNkqtNPCr2uxMnhvWBNn7sLfJaIlmaMC0kf?=
 =?iso-8859-1?Q?qLxSspZz0jA413toBI8yaAk6Ax/+ct1VjlIVj1RT54BG04QjCxaddOOE63?=
 =?iso-8859-1?Q?6uAIJ6rgfYOtr3CxLBH639sLKeMGpsV6d36NMCyXX3DAXJT5JWvjby35IE?=
 =?iso-8859-1?Q?+5Ehe2ZKGEAo4+msykXm7YnKlqJs0TIbdhI8owcmi7fsxSQLOTohIJGXxW?=
 =?iso-8859-1?Q?LYZvby3GoWat34auMWEJKjb6nMQ6kUBDVG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8582af-2432-4500-48b2-08dbe5422b3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 18:47:36.2917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm+Q82FGLnhyFqEiKupzeoc0HdQV5+UDXNN3Pz7sQsUj77qGNO9xWIS0IM46vot8IoX2ArYnP818gTfMKnn9Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5466
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/9] drm/i915/display: split i915 specific
 code from intel_fbdev
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

On Tue, Nov 14, 2023 at 03:04:37PM +0200, Jouni Högander wrote:
> Split out code from intel_fbdev that can not be share between i915 and
> xe. Create new i915 specific source/header file intel_fbdev_fb.[ch] which
> contains this code.
> 
> v2: Add missing forward declarations into intel_fbdev_fb.h
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   3 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 ++--------------
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 116 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  21 ++++
>  4 files changed, 147 insertions(+), 101 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3c26e9ae3722..401fc5778843 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -302,7 +302,8 @@ i915-$(CONFIG_ACPI) += \
>  	display/intel_acpi.o \
>  	display/intel_opregion.o
>  i915-$(CONFIG_DRM_FBDEV_EMULATION) += \
> -	display/intel_fbdev.o
> +	display/intel_fbdev.o \
> +	display/intel_fbdev_fb.o
>  
>  # modesetting output/encoder code
>  i915-y += \
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 31d0d695d567..252f254345a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -43,7 +43,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
> -#include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_mman.h"
>  
>  #include "i915_drv.h"
> @@ -51,6 +50,7 @@
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
>  #include "intel_fbdev.h"
> +#include "intel_fbdev_fb.h"
>  #include "intel_frontbuffer.h"
>  
>  struct intel_fbdev {
> @@ -146,65 +146,6 @@ static const struct fb_ops intelfb_ops = {
>  	.fb_mmap = intel_fbdev_mmap,
>  };
>  
> -static int intelfb_alloc(struct drm_fb_helper *helper,
> -			 struct drm_fb_helper_surface_size *sizes)
> -{
> -	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
> -	struct drm_framebuffer *fb;
> -	struct drm_device *dev = helper->dev;
> -	struct drm_i915_private *dev_priv = to_i915(dev);
> -	struct drm_mode_fb_cmd2 mode_cmd = {};
> -	struct drm_i915_gem_object *obj;
> -	int size;
> -
> -	/* we don't do packed 24bpp */
> -	if (sizes->surface_bpp == 24)
> -		sizes->surface_bpp = 32;
> -
> -	mode_cmd.width = sizes->surface_width;
> -	mode_cmd.height = sizes->surface_height;
> -
> -	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
> -	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> -							  sizes->surface_depth);
> -
> -	size = mode_cmd.pitches[0] * mode_cmd.height;
> -	size = PAGE_ALIGN(size);
> -
> -	obj = ERR_PTR(-ENODEV);
> -	if (HAS_LMEM(dev_priv)) {
> -		obj = i915_gem_object_create_lmem(dev_priv, size,
> -						  I915_BO_ALLOC_CONTIGUOUS |
> -						  I915_BO_ALLOC_USER);
> -	} else {
> -		/*
> -		 * If the FB is too big, just don't use it since fbdev is not very
> -		 * important and we should probably use that space with FBC or other
> -		 * features.
> -		 *
> -		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
> -		 */
> -		if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
> -			obj = i915_gem_object_create_stolen(dev_priv, size);
> -		if (IS_ERR(obj))
> -			obj = i915_gem_object_create_shmem(dev_priv, size);
> -	}
> -
> -	if (IS_ERR(obj)) {
> -		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
> -		return PTR_ERR(obj);
> -	}
> -
> -	fb = intel_framebuffer_create(obj, &mode_cmd);
> -	i915_gem_object_put(obj);
> -	if (IS_ERR(fb))
> -		return PTR_ERR(fb);
> -
> -	ifbdev->fb = to_intel_framebuffer(fb);
> -	return 0;
> -}
> -
>  static int intelfb_create(struct drm_fb_helper *helper,
>  			  struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -213,7 +154,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	struct drm_device *dev = helper->dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> -	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
>  	const struct i915_gtt_view view = {
>  		.type = I915_GTT_VIEW_NORMAL,
>  	};
> @@ -222,9 +162,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	struct i915_vma *vma;
>  	unsigned long flags = 0;
>  	bool prealloc = false;
> -	void __iomem *vaddr;
>  	struct drm_i915_gem_object *obj;
> -	struct i915_gem_ww_ctx ww;
>  	int ret;
>  
>  	mutex_lock(&ifbdev->hpd_lock);
> @@ -245,12 +183,13 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  		intel_fb = ifbdev->fb = NULL;
>  	}
>  	if (!intel_fb || drm_WARN_ON(dev, !intel_fb_obj(&intel_fb->base))) {
> +		struct intel_framebuffer *fb;
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "no BIOS fb, allocating a new one\n");
> -		ret = intelfb_alloc(helper, sizes);
> -		if (ret)
> -			return ret;
> -		intel_fb = ifbdev->fb;
> +		fb = to_intel_framebuffer(intel_fbdev_fb_alloc(helper, sizes));
> +		if (IS_ERR(fb))
> +			return PTR_ERR(fb);
> +		intel_fb = ifbdev->fb = fb;
>  	} else {
>  		drm_dbg_kms(&dev_priv->drm, "re-using BIOS fb\n");
>  		prealloc = true;
> @@ -283,49 +222,18 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	info->fbops = &intelfb_ops;
>  
>  	obj = intel_fb_obj(&intel_fb->base);
> -	if (i915_gem_object_is_lmem(obj)) {
> -		struct intel_memory_region *mem = obj->mm.region;
> -
> -		/* Use fbdev's framebuffer from lmem for discrete */
> -		info->fix.smem_start =
> -			(unsigned long)(mem->io_start +
> -					i915_gem_object_get_dma_address(obj, 0));
> -		info->fix.smem_len = obj->base.size;
> -	} else {
> -		/* Our framebuffer is the entirety of fbdev's system memory */
> -		info->fix.smem_start =
> -			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
> -		info->fix.smem_len = vma->size;
> -	}
> -
> -	for_i915_gem_ww(&ww, ret, false) {
> -		ret = i915_gem_object_lock(vma->obj, &ww);
> -
> -		if (ret)
> -			continue;
> -
> -		vaddr = i915_vma_pin_iomap(vma);
> -		if (IS_ERR(vaddr)) {
> -			drm_err(&dev_priv->drm,
> -				"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
> -			ret = PTR_ERR(vaddr);
> -			continue;
> -		}
> -	}
>  
> +	ret = intel_fbdev_fb_fill_info(dev_priv, info, obj, vma);
>  	if (ret)
>  		goto out_unpin;
>  
> -	info->screen_base = vaddr;
> -	info->screen_size = vma->size;
> -
>  	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
>  
>  	/* If the object is shmemfs backed, it will have given us zeroed pages.
>  	 * If the object is stolen however, it will be full of whatever
>  	 * garbage was left in there.
>  	 */
> -	if (!i915_gem_object_is_shmem(vma->obj) && !prealloc)
> +	if (!i915_gem_object_is_shmem(obj) && !prealloc)
>  		memset_io(info->screen_base, 0, info->screen_size);
>  
>  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
> new file mode 100644
> index 000000000000..288ca4ec09d8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_fb_helper.h>
> +
> +#include "gem/i915_gem_lmem.h"
> +
> +#include "i915_drv.h"
> +#include "intel_display_types.h"
> +
> +struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> +					     struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct drm_framebuffer *fb;
> +	struct drm_device *dev = helper->dev;
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct drm_mode_fb_cmd2 mode_cmd = {};
> +	struct drm_i915_gem_object *obj;
> +	int size;
> +
> +	/* we don't do packed 24bpp */
> +	if (sizes->surface_bpp == 24)
> +		sizes->surface_bpp = 32;
> +
> +	mode_cmd.width = sizes->surface_width;
> +	mode_cmd.height = sizes->surface_height;
> +
> +	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
> +				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
> +	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> +							  sizes->surface_depth);
> +
> +	size = mode_cmd.pitches[0] * mode_cmd.height;
> +	size = PAGE_ALIGN(size);
> +
> +	obj = ERR_PTR(-ENODEV);
> +	if (HAS_LMEM(dev_priv)) {
> +		obj = i915_gem_object_create_lmem(dev_priv, size,
> +						  I915_BO_ALLOC_CONTIGUOUS |
> +						  I915_BO_ALLOC_USER);
> +	} else {
> +		/*
> +		 * If the FB is too big, just don't use it since fbdev is not very
> +		 * important and we should probably use that space with FBC or other
> +		 * features.
> +		 *
> +		 * Also skip stolen on MTL as Wa_22018444074 mitigation.
> +		 */
> +		if (!(IS_METEORLAKE(dev_priv)) && size * 2 < dev_priv->dsm.usable_size)
> +			obj = i915_gem_object_create_stolen(dev_priv, size);
> +		if (IS_ERR(obj))
> +			obj = i915_gem_object_create_shmem(dev_priv, size);
> +	}
> +
> +	if (IS_ERR(obj)) {
> +		drm_err(&dev_priv->drm, "failed to allocate framebuffer (%pe)\n", obj);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	fb = intel_framebuffer_create(obj, &mode_cmd);
> +	i915_gem_object_put(obj);
> +	if (IS_ERR(fb))
> +		return fb;

if you are returning fb anyway you don't need to check for the error, right?

> +
> +	return fb;
> +}
> +
> +int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
> +			     struct drm_i915_gem_object *obj, struct i915_vma *vma)
> +{
> +	struct i915_gem_ww_ctx ww;
> +	void __iomem *vaddr;
> +	int ret;
> +
> +	if (i915_gem_object_is_lmem(obj)) {
> +		struct intel_memory_region *mem = obj->mm.region;
> +
> +		/* Use fbdev's framebuffer from lmem for discrete */
> +		info->fix.smem_start =
> +			(unsigned long)(mem->io_start +
> +					i915_gem_object_get_dma_address(obj, 0));
> +		info->fix.smem_len = obj->base.size;
> +	} else {
> +		struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> +
> +		/* Our framebuffer is the entirety of fbdev's system memory */
> +		info->fix.smem_start =
> +			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
> +		info->fix.smem_len = vma->size;
> +	}
> +
> +	for_i915_gem_ww(&ww, ret, false) {
> +		ret = i915_gem_object_lock(vma->obj, &ww);
> +
> +		if (ret)
> +			continue;
> +
> +		vaddr = i915_vma_pin_iomap(vma);
> +		if (IS_ERR(vaddr)) {
> +			drm_err(&i915->drm,
> +				"Failed to remap framebuffer into virtual memory (%pe)\n", vaddr);
> +			ret = PTR_ERR(vaddr);
> +			continue;

why don't you simply return ret; in here?

with this 2 returns cleared up or clarified, let's already push this to drm-intel-next
with:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		}
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	info->screen_base = vaddr;
> +	info->screen_size = intel_bo_to_drm_bo(obj)->size;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.h b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
> new file mode 100644
> index 000000000000..d4976874239f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.h
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_FBDEV_FB_H__
> +#define __INTEL_FBDEV_FB_H__
> +
> +struct drm_fb_helper;
> +struct drm_fb_helper_surface_size;
> +struct drm_i915_gem_object;
> +struct drm_i915_private;
> +struct fb_info;
> +struct i915_vma;
> +
> +struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> +					     struct drm_fb_helper_surface_size *sizes);
> +int intel_fbdev_fb_fill_info(struct drm_i915_private *i915, struct fb_info *info,
> +			     struct drm_i915_gem_object *obj, struct i915_vma *vma);
> +
> +#endif
> -- 
> 2.34.1
> 
