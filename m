Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E3FC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440010E1F7;
	Fri, 26 May 2023 21:14:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9F10E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135649; x=1716671649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBhNkVevjI67kD09IMF5dO1cTITxieWjOmxs2Sklr/M=;
 b=FEbJ4AxY4OK3S95LLLLTriao3gvuyzLWEnztfEusDzIFv9juktA7iJV8
 IaAyBaQjMhg88eITdBkFtb5YC8R5bO0zI1ATWDuwPM9atBEswDDkDhZBP
 loy5UXLusFo2xn5YLI+SLgflQDrZPLDUDOc82Ve66TC66fUf6P3/Fx8JN
 Z8juvP0qQtMVQtjEBW/zOa07MUTKAqzcEwKscEzX6t6bttUdUw+wJ13U4
 SoaeX5VTIOQwEN3QeG2spJWBtkNNyBte/NsXEywTQoAHlopwLLQu8qX8P
 qRGyCVVyq59tFCk+JX3U+0tpMg/cGeh77+JBqMG1Po61vM0Jb2G9N5CA5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334659955"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="334659955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="952018510"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="952018510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 26 May 2023 14:14:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:14:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:14:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 14:14:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 14:14:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTljzA56+riPquRyGxAzFX2zRHnT60ueWJA92S0th8D2UjhgyqomPmV93YzxZCWfQonjWrF1Fb3EQjqCRDOSIdAjiq71JlY1wLioRCMTbdcvlNadSMPTbetAYr/TEKJHjkXAUZoZushIYrFYKQRLMCQ6iz1/XQqFx1eGnMdOeQs55vsW7zW7wrT/fx9UwSGjQmg1rE6KHXj4Bpyjz6KsgaO1DQngriAfP3CrqNLVyrN8CM/MJcO0a3PGvCxu5JWV/LearwXsJ6l4rpGlyPxbJaxkLFD7K0cakydP2vtho3SbnR0HUCnQfepNHQQA+luA7085DA8Tkjo3+muIxETgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l+PU45pbb7QQHyOdbBid0782bQrtS7+G9Il5JecVh0=;
 b=URTOsfBxmkq7cAnbiWeYNq4VDyDQPJOt48dRB0U9HItFnfCHM22Be8I5NDoCYyTWD96U0B6SAUlFqBlQHzV4rJP/YapXvXhJob8il09Ex3FUcl+LspGZoQiWO6WQQw6o/+LPPYS8cVKIMkyMMZh6lwnUgUrmQvei2cow+I+J6wblpKAiFP5y9dvB1nKXmzLTbdZ0VmEaE4R9a+ZgN/gdUcfePQjKQRNgeDJYFWegWKiCfMspbA9wwuQqwRAT8nnxZoGtLiQ71evuou7VGZZBgaLt/374fO8ULegs9izmwxIOHwnkQ1dssF7b7kJsUqxW7GdRSSWK4Ls51RH9ZVSUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 21:14:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 21:14:05 +0000
Date: Fri, 26 May 2023 14:14:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <vveaqty6j2udddahhd4qjgb2p6rn4ufzquc6z4fw46vg2wcjmt@6l3yknawpt5g>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-13-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-13-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0083.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0829ff-bb1e-4b9f-b334-08db5e2e21d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4CDKnYqCV1kChIXCTMAZvfgcjDT1oQy4HV7rFzakHtqm7ebJMB/llWlgfkVc7G/r6SKti/WAVjjgxLbtU9DH5HcngN7s1mtoTJdz1JiM7DRJ/ohwGQiYEsH0Pqye3xmTazoj0oLxqbPoXpOT2ldx7fjW96KxGpky7/aAuKn/rBT07ozBOjiy2uK/JPUfoikz7P+Euw+dSq7UJsA0vFIycS1dmZexBGt/TgrCIfiq0+Z4Pa5njt5aEhOX00ngQDPDoEd8s8ojxUmIxwDN2V/vTM2YsxueIfax5Cgiz+OoFOuHYlnl1uRxOOoSnRHZdYRgAfqqvNhyKDXeVmCS79MzBZ97ICGzgzC1geDZxp0ehRM/lOCFiEUDRRC8CyUup6RLnZrJl/D7nB2yQJqRLC0sswU6i0Wd1vCDeoHVhg0azn4a21XnH9gpaT0AXEJFUAzRbM0T1t4WAIBPF2Fw5etBfF4RtSCZUbjJQwDZnjTYCUp0o3zW3q38L30DttvWqRZPJhUo0ZKy4AN0PYDjSX4zR9lYEl10amQ/ODSvbRWosFUQmfDug33xoCnSg8msv+a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(6486002)(6666004)(478600001)(83380400001)(33716001)(186003)(9686003)(26005)(86362001)(38100700002)(6506007)(82960400001)(6512007)(41300700001)(316002)(66946007)(66476007)(66556008)(4326008)(6636002)(5660300002)(2906002)(6862004)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vZMuZ7LuXcV+RbcottICSQjgvwP9Cz1ndaHuIC6IeSx/zehrIGSr/Cwpsdzk?=
 =?us-ascii?Q?3z6WZosYDDGIlqasFB/hj663TKJEEtFUkXfqQBC+sN6QuRACyhHroLJcR8m7?=
 =?us-ascii?Q?LruDKjOUFIVgcrZcew1/hv3e8LsZzvLob3oF2C1IQfEYfOwpoSIQHyLw0bHK?=
 =?us-ascii?Q?JzLBSksp4CkULXO/tKZjuzd376/DGSYDncwLQNoD6sK2kWY1u0eg8I9CMaxP?=
 =?us-ascii?Q?1QD2kChYsplp3aBAe2CZl5GEOygAhojnxa1Ld1c9mfueoEi1Mpd90PaGCE6m?=
 =?us-ascii?Q?jO3ohjjN1M2AS4lHwJ7tD9GvKy4Tgol2V59vVrKemkUpDxK0+IIfgvEFSiJR?=
 =?us-ascii?Q?iMokhwpSsgf5ms7oI9LSJ5CLUAlovcl2hUFElElkkFjxV/YREcFpa36GXHlr?=
 =?us-ascii?Q?JXDZD0INawu9WPfEU/j5uOw4rC1j0GYC8dQYp7iJc5wxctLcLJZ9mLWr8LGR?=
 =?us-ascii?Q?riphsgaezH7nWVPgwV3oEE3kX5+dFNuvd8kZHWl0SMBtBbein5qYspUNpWOJ?=
 =?us-ascii?Q?68I2Dh5oyoFwYOMpV/3UMmxulnKRBxkRRlNWrQXq96DIJrWe3Ts2YvetLB8e?=
 =?us-ascii?Q?ggBu8N8Nk8g4jGI/qBBnwnYX1TuWJz+oRtj/B+mnJx5VfM7f56GlkPIj1nUk?=
 =?us-ascii?Q?cHpNvqkHVBg3PgvRiYbMB+9f3/d9zH1Uib8S21axqqETKsdQwG+8FWdTCPiv?=
 =?us-ascii?Q?NBmL3CfT9xksB0X0HYCxFz8DxwC69GuZRRYbeQz/AGbO0V0vfmKOJpWcinS5?=
 =?us-ascii?Q?9xabIY0JW2SydZzUdvSEaippVFP5uI80Oqwkah+kJz9v9m0onA1ioJs5noyH?=
 =?us-ascii?Q?kFqvK17MJ9Gwo33uZhItXosSahCqumduEjkrB+BWQ2ZrPUh37WsTaHohtviQ?=
 =?us-ascii?Q?5oZiE13vTjJPTLGuCi3HMd15QZFAQ3KTz+/haTvEgbvIaLPtMx04wPAF/lDH?=
 =?us-ascii?Q?WLlRVkjO9CgBaGHMQohNFCNYhohQJ/ew8XB+clDlRWW7T89/rQgBtGsqcuvg?=
 =?us-ascii?Q?jIspdoXLmMADjyUl0/xuWO4HvFwNZS+4C+VDZft+7bqe+zCtHJEdRD4492oA?=
 =?us-ascii?Q?op+2h5VXYHR5qIazPLuDjNbvkhd3sDsNjjx95WkrVmNZ01eIL43Wg4TVpkuY?=
 =?us-ascii?Q?/Trmvg0gDJ69uhfFMjizGPTpK9qDsSkK502x/sUvnqrBtnWcBam8AmZbdgbL?=
 =?us-ascii?Q?UudYbQlLFo/oiLA7co0VKxQEQeIzbZ+u6iRjvlN1QYXo4iKlJfFfsAfYOzJo?=
 =?us-ascii?Q?0KhP7c2ldNfN/xiyQL/BSr8Vm3hNZTre6LNfCy2k5npcv6krO+z2x7eIeVZM?=
 =?us-ascii?Q?ctLratQ3kk14j1v7j1T3yj4r47cRCwyXzqxq6h55tbVDo7OfeQsMf1Zzu+lx?=
 =?us-ascii?Q?lHKFlr1BMVK1M8ZyUyGWMDI0dc8YNT1JbqSxg5JFiWhVE/09CRdrlkWldio3?=
 =?us-ascii?Q?UyDnqs3uLh2bvUz4qPsigsgUItGfcgf6zcunJ4HQ1TOcxwoiBwgnpkGxJ2il?=
 =?us-ascii?Q?B/aq9YScDXyWj3t8+ENAX9ad6RXfrMYq3rbX9BHu7djX15Tz3uNk/ELl+oDC?=
 =?us-ascii?Q?n0wr0t9rYSSiKm0gklAl4J03FJ5QEJCzz9xXqU/qQ1hKahKpks+jwpU20pL/?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0829ff-bb1e-4b9f-b334-08db5e2e21d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 21:14:03.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJhU8A3tFe2sEgNPPpkHbmrv564idqiH5Mu5me9TJ24+vLponCChOii3oeViFPkUOdRG1CJYSBnelBGnnsqk5HARfE6ro6ryVFWrTYllusI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/30] fixup! drm/xe/display: Implement
 display support
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


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

On Fri, May 19, 2023 at 04:18:09PM -0700, Matt Roper wrote:
>---
> drivers/gpu/drm/i915/display/intel_dsb.c      | 5 +++--
> drivers/gpu/drm/i915/display/intel_fbc.c      | 3 ++-
> drivers/gpu/drm/i915/display/intel_fbdev.c    | 7 ++++---
> drivers/gpu/drm/xe/display/xe_fb_pin.c        | 7 ++++---
> drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
> 5 files changed, 14 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
>index 7c93580282b4..3830309aacf4 100644
>--- a/drivers/gpu/drm/i915/display/intel_dsb.c
>+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
>@@ -379,9 +379,10 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
> #else
> 	/* ~1 qword per instruction, full cachelines */
> 	size = ALIGN(max_cmds * 8, 64);
>-	obj = xe_bo_create_pin_map(i915, to_gt(i915), NULL, PAGE_ALIGN(size),
>+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
>+				   NULL, PAGE_ALIGN(size),
> 				   ttm_bo_type_kernel,
>-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(i915)) |
>+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
> 				   XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(obj)) {
> 		kfree(dsb);
>diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
>index 9dc7083fe974..0e8e899f596b 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbc.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
>@@ -71,7 +71,8 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
> 	int err;
> 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
>
>-	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
>+	*bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
>+					NULL, size, start, end,
> 					ttm_bo_type_kernel, flags);
> 	if (IS_ERR(*bo)) {
> 		err = PTR_ERR(*bo);
>diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>index 95f4cbc2e675..ebb07d0ccff6 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>@@ -210,7 +210,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 	}
> #else
> 	if (!IS_DGFX(dev_priv)) {
>-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
>+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
>+					   NULL, size,
> 					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
> 					   XE_BO_CREATE_STOLEN_BIT |
> 					   XE_BO_CREATE_PINNED_BIT);
>@@ -220,9 +221,9 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
> 	}
> 	if (IS_ERR(obj)) {
>-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
>+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
> 					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
>-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
>+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
> 					  XE_BO_CREATE_PINNED_BIT);
> 	}
> #endif
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index 27e4d29aa73d..97e9be79b154 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -45,6 +45,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 			       struct i915_vma *vma)
> {
> 	struct xe_device *xe = to_xe_device(fb->base.dev);
>+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
> 	u32 dpt_size, size = bo->ttm.base.size;
>
>@@ -55,17 +56,17 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
> 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> 				 XE_PAGE_SIZE);
>
>-	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 				  ttm_bo_type_kernel,
> 				  XE_BO_CREATE_VRAM0_BIT |
> 				  XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(dpt))
>-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_STOLEN_BIT |
> 					   XE_BO_CREATE_GGTT_BIT);
> 	if (IS_ERR(dpt))
>-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
> 					   ttm_bo_type_kernel,
> 					   XE_BO_CREATE_SYSTEM_BIT |
> 					   XE_BO_CREATE_GGTT_BIT);
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 39dd97acae08..99c35a4ef673 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -115,7 +115,7 @@ initial_plane_bo(struct xe_device *xe,
> 			page_size);
> 	size -= base;
>
>-	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
>+	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> 				     ttm_bo_type_kernel, flags);
> 	if (IS_ERR(bo)) {
> 		drm_dbg(&xe->drm,
>-- 
>2.40.0
>
