Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC5EC64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 13:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8742210E5D5;
	Wed,  8 Mar 2023 13:40:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A90D10E5D5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678282811; x=1709818811;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3zrsmHs2kF/ZOBDq8+YfS2AJICyqVa5nJa//PwMJCI8=;
 b=jSAfe4Tb9x0IziKy5/sv+bvU3UX5FYuHSujfTa4jcoJmIW+2P+PlT2fz
 Qx4UqRRNn92Q+4zdcJ3E3UCXVRciXpUxuUnTz/Su1/cRpFAkojm17PP45
 Y0LURwgzyP46Av+S8oYHj6ahmyUx0mPNLhNu3ox9ibwBBGsgoD9jsqqwX
 c135L28eyNEevyXfklS4YMynjhpTR6w5Tn6PvuiVaonfGcONKeOnEVPBm
 A0dlYv7/TfNi67BVecqUvgUj2pkunWxSf2sKQY5IwQgTJSYxQ9+N8QBaP
 wqDxaYKUYEECttJSl8sYS2edG29kxbeBwIwo9YvARFI2yNLhyrXWclAFN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="319983893"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="319983893"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 05:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765992341"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="765992341"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 05:40:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 05:40:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 05:40:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 05:40:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke/OPrZFI+RtB+sZOe6VR+uR3oxO+MiaWQS/FDDMLMYt+7m8VfoA+KzCr5zU6i33q2zVHtI2HVryWT9u+IwJPngxiTkJQm5tRsmKLa81ilmebDoWSt4pPOenghqTR6dgQhsq6pbGhoxRpwSnRoFDfSy0iLguXq521b4IvXKA16dH0CDKH8k9x0Md0iM+Kmy9mXcuaRC6D2TupOa5m1vOZ6V31cNbh8KO0gC+BJ/Eyqs7L0ZwJFHmtVYYev33o4I1Ja6+j+eVMdUJ8smfyzadQsiTaLEJpgPS81dRlEN5usJFP7nPo1ofuxVzxe1lluNxDueAM9XVo0HR8L7gWxofQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZSqC5EiUCyLAOOsS/BgqDRLR1osaebkmZBd9z0I5Ag=;
 b=Kp825mQ6v+WPxt6T7NJSxKMJusaN50IL2u6D3uviNdLZUOHU3IHUNvEVlPBxKCDun/3LThElZ5r1Vhx90lijxA1irduLmtt87BZdBxlRhpUuNangqOO41zTSKmNw8HTGguCMCKxkH/+OF/+VsyhoStLXDNdzqmWl3xbdp+JbBMd6buTu+0ORT5vIX6GTy5wCSm38XX+02RnddsRXntKK3w+hsV7gbda6I/sXO+k8GAHdc9TEOxxosmTLI8hU2LqveXsJxeeJSQqxz32UPsJZhbkZDh0pqk77KGChxBjt4/tSMVib1dHgmCSaaATOOs6oeufEaHNO1JH/1h3sOx3enQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 13:40:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 13:40:06 +0000
Date: Wed, 8 Mar 2023 08:40:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Message-ID: <ZAiQMYlugCPv4eM7@intel.com>
References: <20230308123012.247091-1-matthew.auld@intel.com>
 <20230308123012.247091-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308123012.247091-6-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7e3caf-2315-4df2-d407-08db1fdaa0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWfs2ho1W/X3FBecz5gXsJADgLwIOZYYVfAPboXRa82S0btgozuKzODigB8NkmggFT+CZ06x8ux4RrV3IjLc9N+gkxMHhrxSJwyLIWWrtjFpMq7iKxKRpI8OvTE8B7WIS5GgVLODoXjDEjIqSvAFG3vDqGDGVFmRceTHyKslWE66QDFY3dUgVmkHBaaTJ5FEufj2usFHDFPttUN11V0QtOT6NPl3MHkGRe+WTWJYM/d0rzphkxzdl1B5EQYYSZGryG4q5Q1pvH6mYJpx+DZnssP3dEbV0e2OgfMtiCHatN+I/4qylJ3/5ubwgDPHsRdb23i/aPA2Yu3kRMKihDfApIyMbDd9E0uCtNrWYbNn8d8svkiFQz+WgBkndd9GgRYpdBA3PYmZsXkO3XLl8Pl939RDkAgM3AwFZrTUApgQxaCqhRLbzBfloQBCh6SFKxiT+ODG1W8cbEmMLEa/EAVUf4xDdf+w9XCJhwGyzzM9AaO+DvAY+Gp/CQdBvrppllWffFndVsMrx4yP9yjqDF4Xghov5UfDerjxABFDx544iFXS5BiIP2U0vN48XeHw2t1hoynYv/DV7gKk5b1sZR22n/BN0sRgVgkZA2TWeppKA3omogNtCGQTiSYPnb2pMIpuEOWU3zGlpI+4WmDStdVz5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(6486002)(186003)(2906002)(82960400001)(38100700002)(66476007)(4326008)(66556008)(6666004)(478600001)(30864003)(41300700001)(44832011)(26005)(5660300002)(8676002)(66946007)(8936002)(66574015)(6506007)(6512007)(2616005)(316002)(110136005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ewedoD2RlcYHC+qx+hwH6Ku3NpPTMAqzHAxfTrE7OStwGjqC5FtAKWB0gB?=
 =?iso-8859-1?Q?D2ueAGArXiMRiEkQ6qEUE5UAWZrPA4wR0jAw6EVcnFucuAzHrdpy70nQgx?=
 =?iso-8859-1?Q?gDo8GbaH1xJpjhLOeRhVU2lLcsVx+buKeL4AEDrrCi/0bifhl5G9Gva/2o?=
 =?iso-8859-1?Q?U6KT6hlAYDBmi6oKlB6dTTuLhP7WWDsfTPWpcfXR8zgW+pfWkfs2mqCq7c?=
 =?iso-8859-1?Q?04+qLp6svC39uFlvQ1bJB9UycryOE3WwOSTwbSoECCscWq/SxcCKYPcuRp?=
 =?iso-8859-1?Q?UgUoUbycQ+LV+oc8ciAEeYcN9w5jRA3DsGwLATxOytB3Z60dhNefAap4OI?=
 =?iso-8859-1?Q?Kirbc5e+GZQpaA3c5oXAqyPejmQERDjHNcN5C6vy652QSJugVO6cgCxqQP?=
 =?iso-8859-1?Q?0357Rzu2g7tUok96e4rXgTIECYfujmh8hc143jxJOZiNGS8bxwKlWFV+7d?=
 =?iso-8859-1?Q?AVB2z7vyAZYnn04dH9ZyqMo/hgenlw+Fsj4gbqvnz9bpSeEEJQ2YVNUmA2?=
 =?iso-8859-1?Q?LpHocQTbzMiICmsMI7VZizumNIot4ZgqkqxOGu2L8wekn9qrRWAdAfE1EW?=
 =?iso-8859-1?Q?LrirluJxckk5j38suPUugiggjHpZ2I9bJYNHSvi1CvMq0gS1FLxlhRDdF9?=
 =?iso-8859-1?Q?sCvl5psN8rTVcCXmr18rlHn4ySBMWGeAaAbFC15x9wwRJYqXvHGKum+iw3?=
 =?iso-8859-1?Q?Q8TmM1tCNUqwRENESx0C2WeVUatYq+H4RjmpgntWujGLmsyZi3TvzEJaOq?=
 =?iso-8859-1?Q?KxBD87wjE+8jlondtL+i3y4e4qyAz6JMBPSwyauvqZh2v2o6K8CgtIr0PX?=
 =?iso-8859-1?Q?hDC79QiczXaU15h2DzGMGsEGzD2ULIAquXoP4JGjMB+tIhd+ZddmkdwCFy?=
 =?iso-8859-1?Q?gX5+2/ELYMiWpHIXSb8uc9TdlO7QBlxOKrft7gQOGaWvHrFH3qJyOyNHFF?=
 =?iso-8859-1?Q?bZOKfdT8VRfiXH4cpysSNOgWeY2l0+rteRRTA0Xuxn7CVPhk9fB7HeLM6I?=
 =?iso-8859-1?Q?nIwm1/MNS0UIPsURLWc18GRNDU8NcoNYBEYBysqWic7lXJsRx/Z818S1aA?=
 =?iso-8859-1?Q?dVH6pJFUGeBIJY8me6Zlkb333Pfge15bQZS+g7EYs39T4SM9bzle3SwhGQ?=
 =?iso-8859-1?Q?e2EIvLIhuczD5bB/u/z/apk3uOv2nlUHmJsJK+VgesAY7bYAEIPRTrFWZi?=
 =?iso-8859-1?Q?At2HqQgMSxzjlfvp6BHsHPhkCSw9e1AE+f7e83u1gDnLDpDm9hjRQH0rTr?=
 =?iso-8859-1?Q?GXiK2fpZHTLZF7DSs7k8kWwN/5OjTplT7gfjZ5q4WFH8e59F9csQrT4RaX?=
 =?iso-8859-1?Q?LssrmDnYRogmrb0446dYBIO/artL8tWdde5B+BPuwVuEbsoOvJH1d2Ztda?=
 =?iso-8859-1?Q?8lU2jNGvWWUQC3fwruVAWAZDNisfrjbQL1Uc/bWAd7WiHB6+MDosqEl3d4?=
 =?iso-8859-1?Q?7/PwMsOodnKAj6T1mvcmy264zyPT2Gvec+VDmDPxtzQaxWnx11Eax/7CNN?=
 =?iso-8859-1?Q?Xd6naEyI9m8PTWUhoEeQsGgMbKcvjA34RHBFyqRRPJ4pPCB1XtM4gkMdpZ?=
 =?iso-8859-1?Q?07snW4ZiDGGd5l84pI81o3EEFrT1+ZhMJ1fYS+a1stL1IBM/l5VjTWz9XQ?=
 =?iso-8859-1?Q?LBidqBAVt5+K63lG1Y8ZuQUdVy8zF8zPt2ZDPM8No3ZB8TEN8K9iCSng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7e3caf-2315-4df2-d407-08db1fdaa0a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:40:06.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCQztZ4PhoEXIgzAskGimNbFV5IvkMo9Z4V3Sg/orJ5+6Iz21NS9ErF2WZ1fDuydV74RPNAtQEnA/yvUfv+gOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/6] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 12:30:11PM +0000, Matthew Auld wrote:
> Replace the allocation code with the i915 version. This simplifies the
> code a little, and importantly we get the accounting at the mgr level,
> which is useful for debug (and maybe userspace), plus per resource
> tracking so we can easily check if a resource is using one or pages in
> the mappable part of vram (useful for eviction), or if the resource is
> completely within the mappable portion (useful for checking if the
> resource can be safely CPU mapped).
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 201 ++++++++++-----------
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>  4 files changed, 118 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 0ad0f1820f4b..7e403dccf9d5 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -129,7 +129,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  {
>  	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	u64 stolen_size, pgsize;
> +	u64 stolen_size, io_size, pgsize;
>  	int err;
>  
>  	if (IS_DGFX(xe))
> @@ -148,7 +148,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (pgsize < PAGE_SIZE)
>  		pgsize = PAGE_SIZE;
>  
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size, pgsize);
> +	/*
> +	 * We don't try to attempt partial visible support for stolen vram,
> +	 * since stolen is always at the end of vram, and the BAR size is pretty
> +	 * much always 256M, with small-bar.
> +	 */
> +	io_size = 0;
> +	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> +		io_size = stolen_size;
> +
> +	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> +				     io_size, pgsize);
>  	if (err) {
>  		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>  		return;
> @@ -157,8 +167,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>  		    stolen_size);
>  
> -	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
> -		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, stolen_size);
> +	if (io_size)
> +		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>  }
>  
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index e3ac8c6d3978..f703e962f499 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -49,45 +49,26 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  			       const struct ttm_place *place,
>  			       struct ttm_resource **res)
>  {
> -	u64 max_bytes, cur_size, min_block_size;
>  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
> -	u64 size, remaining_size, lpfn, fpfn;
>  	struct drm_buddy *mm = &mgr->mm;
> -	unsigned long pages_per_block;
> -	int r;
> -
> -	lpfn = (u64)place->lpfn << PAGE_SHIFT;
> -	if (!lpfn || lpfn > man->size)
> -		lpfn = man->size;
> -
> -	fpfn = (u64)place->fpfn << PAGE_SHIFT;
> +	u64 size, remaining_size, min_page_size;
> +	unsigned long lpfn;
> +	int err;
>  
> -	max_bytes = mgr->manager.size;
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		pages_per_block = ~0ul;
> -	} else {
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -		pages_per_block = HPAGE_PMD_NR;
> -#else
> -		/* default to 2MB */
> -		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
> -#endif
> -
> -		pages_per_block = max_t(uint32_t, pages_per_block,
> -					tbo->page_alignment);
> -	}
> +	lpfn = place->lpfn;
> +	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
> +		lpfn = man->size >> PAGE_SHIFT;
>  
>  	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>  	if (!vres)
>  		return -ENOMEM;
>  
>  	ttm_resource_init(tbo, place, &vres->base);
> -	remaining_size = vres->base.size;
>  
>  	/* bail out quickly if there's likely not enough VRAM for this BO */
> -	if (ttm_resource_manager_usage(man) > max_bytes) {
> -		r = -ENOSPC;
> +	if (ttm_resource_manager_usage(man) > man->size) {
> +		err = -ENOSPC;
>  		goto error_fini;
>  	}
>  
> @@ -96,95 +77,91 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>  		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>  
> -	if (fpfn || lpfn != man->size)
> -		/* Allocate blocks in desired range */
> +	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>  		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>  
> -	mutex_lock(&mgr->lock);
> -	while (remaining_size) {
> -		if (tbo->page_alignment)
> -			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> -		else
> -			min_block_size = mgr->default_page_size;
> -
> -		XE_BUG_ON(min_block_size < mm->chunk_size);
> -
> -		/* Limit maximum size to 2GiB due to SG table limitations */
> -		size = min(remaining_size, 2ULL << 30);
> -
> -		if (size >= pages_per_block << PAGE_SHIFT)
> -			min_block_size = pages_per_block << PAGE_SHIFT;
> -
> -		cur_size = size;
> -
> -		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
> -			/*
> -			 * Except for actual range allocation, modify the size and
> -			 * min_block_size conforming to continuous flag enablement
> -			 */
> -			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -				size = roundup_pow_of_two(size);
> -				min_block_size = size;
> -			/*
> -			 * Modify the size value if size is not
> -			 * aligned with min_block_size
> -			 */
> -			} else if (!IS_ALIGNED(size, min_block_size)) {
> -				size = round_up(size, min_block_size);
> -			}
> -		}
> +	XE_BUG_ON(!vres->base.size);
> +	size = vres->base.size;
>  
> -		r = drm_buddy_alloc_blocks(mm, fpfn,
> -					   lpfn,
> -					   size,
> -					   min_block_size,
> -					   &vres->blocks,
> -					   vres->flags);
> -		if (unlikely(r))
> -			goto error_free_blocks;
> +	min_page_size = mgr->default_page_size;
> +	if (tbo->page_alignment)
> +		min_page_size = tbo->page_alignment << PAGE_SHIFT;
>  
> -		if (size > remaining_size)
> -			remaining_size = 0;
> -		else
> -			remaining_size -= size;
> +	XE_BUG_ON(min_page_size < mm->chunk_size);
> +	XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
> +	XE_BUG_ON(size > SZ_2G &&
> +		  (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
> +	XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
> +
> +	if (place->fpfn + (vres->base.size >> PAGE_SHIFT) != place->lpfn &&
> +	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
> +		size = roundup_pow_of_two(size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
> +		if (pages > lpfn)
> +			lpfn = pages;
>  	}
> -	mutex_unlock(&mgr->lock);
>  
> -	if (cur_size != size) {
> -		struct drm_buddy_block *block;
> -		struct list_head *trim_list;
> -		u64 original_size;
> -		LIST_HEAD(temp);
> +	if (size > lpfn << PAGE_SHIFT) {
> +		err = -E2BIG; /* don't trigger eviction */
> +		goto error_fini;
> +	}
>  
> -		trim_list = &vres->blocks;
> -		original_size = vres->base.size;
> +	mutex_lock(&mgr->lock);
> +	if (lpfn <= mgr->visible_size && size > mgr->visible_avail) {
> +		mutex_unlock(&mgr->lock);
> +		err = -ENOSPC;
> +		goto error_fini;
> +	}
>  
> +	remaining_size = size;
> +	do {
>  		/*
> -		 * If size value is rounded up to min_block_size, trim the last
> -		 * block to the required size
> +		 * Limit maximum size to 2GiB due to SG table limitations.
> +		 * FIXME: Should maybe be handled as part of sg construction.
>  		 */
> -		if (!list_is_singular(&vres->blocks)) {
> -			block = list_last_entry(&vres->blocks, typeof(*block), link);
> -			list_move_tail(&block->link, &temp);
> -			trim_list = &temp;
> -			/*
> -			 * Compute the original_size value by subtracting the
> -			 * last block size with (aligned size - original size)
> -			 */
> -			original_size = drm_buddy_block_size(mm, block) -
> -				(size - cur_size);
> -		}
> +		u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
> +
> +		err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +					     (u64)lpfn << PAGE_SHIFT,
> +					     alloc_size,
> +					     min_page_size,
> +					     &vres->blocks,
> +					     vres->flags);
> +		if (err)
> +			goto error_free_blocks;
>  
> -		mutex_lock(&mgr->lock);
> -		drm_buddy_block_trim(mm,
> -				     original_size,
> -				     trim_list);
> -		mutex_unlock(&mgr->lock);
> +		remaining_size -= alloc_size;
> +	} while (remaining_size);
>  
> -		if (!list_empty(&temp))
> -			list_splice_tail(trim_list, &vres->blocks);
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +			size = vres->base.size;
>  	}
>  
> +	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
> +		vres->used_visible_size = size;
> +	} else {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry(block, &vres->blocks, link) {
> +			u64 start = drm_buddy_block_offset(block);
> +
> +			if (start < mgr->visible_size) {
> +				u64 end = start + drm_buddy_block_size(mm, block);
> +
> +				vres->used_visible_size +=
> +					min(end, mgr->visible_size) - start;
> +			}
> +		}
> +	}
> +
> +	mgr->visible_avail -= vres->used_visible_size;
> +	mutex_unlock(&mgr->lock);
> +
>  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>  	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>  		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> @@ -213,7 +190,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	ttm_resource_fini(man, &vres->base);
>  	kfree(vres);
>  
> -	return r;
> +	return err;
>  }
>  
>  static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> @@ -226,6 +203,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>  
>  	mutex_lock(&mgr->lock);
>  	drm_buddy_free_list(mm, &vres->blocks);
> +	mgr->visible_avail += vres->used_visible_size;
>  	mutex_unlock(&mgr->lock);
>  
>  	ttm_resource_fini(man, res);
> @@ -240,6 +218,13 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
>  	struct drm_buddy *mm = &mgr->mm;
>  
>  	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +	drm_printf(printer, "visible_avail: %lluMiB\n",
> +		   (u64)mgr->visible_avail >> 20);
> +	drm_printf(printer, "visible_size: %lluMiB\n",
> +		   (u64)mgr->visible_size >> 20);
> +
>  	drm_buddy_print(mm, printer);
>  	mutex_unlock(&mgr->lock);
>  	drm_printf(printer, "man size:%llu\n", man->size);
> @@ -262,6 +247,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>  		return;
>  
> +	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
> +
>  	drm_buddy_fini(&mgr->mm);
>  
>  	ttm_resource_manager_cleanup(&mgr->manager);
> @@ -270,7 +257,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  }
>  
>  int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size)
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size)
>  {
>  	struct ttm_resource_manager *man = &mgr->manager;
>  	int err;
> @@ -279,6 +267,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  	mgr->mem_type = mem_type;
>  	mutex_init(&mgr->lock);
>  	mgr->default_page_size = default_page_size;
> +	mgr->visible_size = io_size;
> +	mgr->visible_avail = io_size;
>  
>  	ttm_resource_manager_init(man, &xe->ttm, size);
>  	err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
> @@ -298,7 +288,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
>  	mgr->gt = gt;
>  
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
> -				      gt->mem.vram.size, PAGE_SIZE);
> +				      gt->mem.vram.size, gt->mem.vram.io_size,
> +				      PAGE_SIZE);
>  }
>  
>  int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 78f332d26224..35e5367a79fb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -13,7 +13,8 @@ struct xe_device;
>  struct xe_gt;
>  
>  int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> -			   u32 mem_type, u64 size, u64 default_page_size);
> +			   u32 mem_type, u64 size, u64 io_size,
> +			   u64 default_page_size);
>  int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
>  int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>  			      struct ttm_resource *res,
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 39aa2ec1b968..3d9417ff7434 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct drm_buddy mm;
> +	/** @visible_size: Proped size of the CPU visible portion */
> +	u64 visible_size;
> +	/** @visible_avail: CPU visible portion still unallocated */
> +	u64 visible_avail;
>  	/** @default_page_size: default page size */
>  	u64 default_page_size;
>  	/** @lock: protects allocations of VRAM */
> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>  	struct ttm_resource base;
>  	/** @blocks: list of DRM buddy blocks */
>  	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
>  	/** @flags: flags associated with the resource */
>  	unsigned long flags;
>  };
> -- 
> 2.39.2
> 
