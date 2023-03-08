Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D6C6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 01:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F094A10E14C;
	Wed,  8 Mar 2023 01:03:48 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A510E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678237427; x=1709773427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J8LR+R1Y0lxBORDOltW1Fx5VyFitCnBq5y5LLdef6CI=;
 b=ENDtccdtzL0k5PYTqzvQ8q1tBF3lPmupQt/xzJgeb8wSVWYWr7PlLE4d
 PZ4KLnQ81uWKbAiyriGaJ09sBeC4o2XtcGfFTjxbLi+OL9QJUHugCHMsf
 0HVlkJ7jSchSnfGGJVzmmN8eGlSXrGi2mOJVEg/kbscD5jYHHErCkQrDi
 YjCWtxUaF4PJA1JQHWCgAlO3Gzpttz8X/FeKBb2mIC3kmd+03bcC85XHe
 XbpVUMpNIAOaUCnWONhUAs/a3eBx3Oz9Vr5hgZokeACDEnLUFBQyXwk/q
 2XYkkkUUKPHwYOPHAz2pwyb3EVbEXFH9KLVpKAcfKyzTPN5SFOFTIILY0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336039356"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="336039356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707000228"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="707000228"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2023 17:03:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 17:03:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 17:03:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 17:03:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQtmshH0xfpOwv47BL71g6pB5x6+vR6rGgOQQatiqdJXV+2XCjYzPQm7OmYe2wvntqoAxtsZH4YWUGgCucssnq7K8PvozPDgpz2uKfLmBnniAVclsOLgVMjLBU8Cg3DZKhjwAmiepvqgG3g/fJm3odktqcGSRKRyqSiSAJlUaaqg0SmaViKgmD27i6g3noOI2xxHesIZ45t323IeX47UEmzq7xwgSlFrFz1u9I0Xk9n80ShZqiRp/ly48NP1TzDeM2gVGxUdua4j1kJKoi6ViUPKDkR1VGe7SoaoLq9Mxd9ahvuYiQACrLq8K2TYxGKESqvu7NU75ohkwIn1FrmZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAwQTAm/llUq1+rJwlsX2N6f9zDrNq28Z2f/3Vbv5b4=;
 b=R/X32dG1TLLdLlOLdSBRT8gRd9zTW8/ww3rY9zD06HC9zpkOj6KO2zFOBba8cCrW4mGrPPrPQj9wjaCgqk4BMPNwA+gHIxr51iaw3OO+gGFSYl4m04kIR2iyvpKhS5yFeLlnkFEmZa80Ai06PG1OqsBXIERIgC2CWaJRK+WX3AtUu2bQVHSSu7ER6sUQMCrdNBdxFXNtVJVf2GaPSYepWXOqlXsYWSFbxsTgCGCCBNy4r10U9aIL4IuQlsF3bVFgcK9TUZLyMX3IxmvVvKsEn/mcfqDJCaQemaXJzOcA6r7fW2kOQWF2Kd0hvlMIdc6+fnU+WJKxQqioHy6cVao6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 01:03:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 01:03:38 +0000
Date: Tue, 7 Mar 2023 17:03:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308010335.tyrhwkdr5xu6mhqs@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230306223651.2428170-1-matthew.d.roper@intel.com>
 <20230306223651.2428170-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306223651.2428170-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c46467-d062-4827-66d7-08db1f70f2e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIG2Mz0dBjGGJm2iETPMGHju6xuzUqIem9jFCHtLRG0oKAz7IQEVPndBp0DjZA+rZhWFQ4CFMM2H5bGEoqKIuwAgC3zabPLZDLl5+HuiKjO33Je5furZ+M3mnHR1lngCg18u2uGOmBzH6TrDUoE3c13DWzYMCvpfMqJYCNOupnHVkydUtIyQhYf6LfVIhBZprZG5ufBIQTAghrqstkkVblpBp0kJce4V7jliV8Kwrc7kYCTlPtpsPoS4Zp6KV8dxSDldKtCkaDHcaARYDF3+tuHZVREzBmd4vytbnCj8NvRffGwB8n0QXArSnM03qDNH0fIGAbH3D6/exrnjfJtlqyMYXRLTWUxAsrbuhxDEgJFOKDTqpXE7mFee6DdnHAKwgfcQOfaLHuDtYhImDmJg3qG3qBYfcGSb6UklGX8oDpFvxaXIlLPZUx+ReaBL05FktVppwzVTZDmWLHUf2XkzKGyAQiKY2KK0+uWbYr/wI6Aq10GrxqckqiC691v9qQwGSJHAbpzVtAfav0GgZeC2MSAJYGCK2YyA8FlGd2MVhLaWX4D2oWnMen9wbEq7OJ1W7v9hzrt1sLTV5gSTGguysSvI8Z3VFJId8OksU1VayMlijflTozr6vbGTZk+uwGg+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(4326008)(36756003)(66946007)(41300700001)(6862004)(66556008)(8936002)(1076003)(2906002)(66476007)(5660300002)(38100700002)(86362001)(82960400001)(8676002)(966005)(6486002)(6636002)(6666004)(478600001)(316002)(6512007)(83380400001)(6506007)(186003)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5D8Aa72RLp31hD6WIokMB/8vZanJ9hvF7/oO7FvC7zsUzkL4QZzmGW7PaZj5?=
 =?us-ascii?Q?yXq0G6NXqowCcElfn/ciIvcEv1E0T80aKVJsfgLTO9WqB8XppcyOBeERCvzB?=
 =?us-ascii?Q?Rx+e7tYt1cq08RbtmX2f938l8pNctAMct/0sTv01GSqWyoILtXRK8CfY7eYe?=
 =?us-ascii?Q?DonEhCQPoHlrO/L4IR8eKAVC3AH1gUBeMvg0fA1DfZZJU7uzavwW14RouzUd?=
 =?us-ascii?Q?+1fdATpntDiMUY86doAnNOP9xS6HB4AHU9uZwnF8VMOGp4HCU85KEEnc1wlY?=
 =?us-ascii?Q?di3UYGZve4IicKMAqSxsANVw5VCeWQ5E0zhIeeHx2BD6sTvvNSyyknY9LkJq?=
 =?us-ascii?Q?dk0Wen+ZlrCSrZfHIUylDo3aHDzhaZW1Idl+Fsjn0cpRanessMEm4JFP8etc?=
 =?us-ascii?Q?EIvgCv31Taefexul177Ym1GLbAHaPOH3r2xUObUwSwmg1oZkcK7BhkMVLaqW?=
 =?us-ascii?Q?2R/JVzXl1SD3ygi4htnIv2BYYFcK6io7yaGH+rAWfAmHOUQSpW4xJ5WbeTaO?=
 =?us-ascii?Q?8bEAG/CJv1zp4wTwqWiSEKmSXrdWg5BCez7fhU1izpTsZraMoblhzib4dnW0?=
 =?us-ascii?Q?/Km1nW/lavyW0++g8TILe34dzSwYC7RxFIGqaIVl02SvRqkgj3AlyPk7sAR5?=
 =?us-ascii?Q?8oj0MUF9clz2JX26Ra0ERRhlYt+XJoUgLX56VgRCHpxBD+8enRyzcDey1+ck?=
 =?us-ascii?Q?kf1SaB5iO0rNsQxbITovvxNJIiUB+wa6+nmBthQzC9i5hJSj7aT6VHGpLGW8?=
 =?us-ascii?Q?u0VMfbRr93KUIV77lXmL+uHXinxTYr54aVbKEnVDt6atzXZVU8WLuVcD1auU?=
 =?us-ascii?Q?OiGeZrHXIqxt4lJPiYvbO4ze8en+TFiLYk4uRxcOwkHASJIlJazS8Q8ergf8?=
 =?us-ascii?Q?uV4bSwDrBjZ6HrAFaC70+ynhsSgyzj0T7vcoob3AsIlnicChBT5/F3t+NZH4?=
 =?us-ascii?Q?01KgN4V8HcY7u2W1vbt4A5Zgrjf+sdRFlP7kSN0r2bSGrxkTMfT6m89kLsTx?=
 =?us-ascii?Q?4cy9IB/c1xzjTTX/7qo070rhKh5D9ISRQPU+sEo7NrlSZCAsFyV4soqXoTxi?=
 =?us-ascii?Q?bK2lmfLwczrdYHxAQgU/89LqrGmV69joC7kPolQ4daEacECHX627Ykj7NTy6?=
 =?us-ascii?Q?9BErk7cvtDpa9HxLl2p1+oYu0tjbKBeu7/3oVVv2x+vZrYBYx/kBD3J01w3+?=
 =?us-ascii?Q?UQVshSfdvlqeK8SEfukpT3U7sIvnJ3S08j6UrB21xZ7gOoVAkg/iscK8EGIc?=
 =?us-ascii?Q?1XErWL6NpCRDcAI4wcfe+xAP8+uQNBO8IbhuuHfyJ4pWX9n7WM74rXmzUDVZ?=
 =?us-ascii?Q?g6Zir95IZqGMv1UJPpv0cP+Y+EM5FwlT3PZ9b45V+FPJVOgX9lCmlj2GRMeN?=
 =?us-ascii?Q?JxwJklIHUIGgkkCR8Pc3wdEFvKJ2hDzultnef7Cnb6SZbmInBAw5/D8PNoSm?=
 =?us-ascii?Q?e7PmljnDIaF3+3BV7vvUKoNawL/Dh2ZBm/43mBMNRHEyOsHgpJLK3/iRPagO?=
 =?us-ascii?Q?UTZoHgeMhoB8KuZQb373A2w/s6IQSJvZSuNBgZlAAZbZlOUwhr7noUNIJMib?=
 =?us-ascii?Q?g80YbNWQFUarkVGxvg/pJC9NN3vm5lUasm9+/tV29eCIH2iLiiPBfqIGMXz5?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c46467-d062-4827-66d7-08db1f70f2e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 01:03:37.7606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IaDlgTlwWdlQlHDhOu4llHSa6M/xTdJbpT94776k4eIRJ2iW7RaA7Vv0pIgSsjJchhUSE65PwhTjzS/lV54P2wDMolFcTsZhCbExQPAlSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add support for CCS engine fusing
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

On Mon, Mar 06, 2023 at 02:36:51PM -0800, Matt Roper wrote:
>For Xe_HP platforms that can have multiple CCS engines, the
>presence/absence of each CCS is inferred by the presence/absence of any
>DSS in the corresponding quadrant of the GT's DSS mask.
>
>This handling is only needed on platforms that can have more than one
>CCS.  The CCS is never fused off on platforms like MTL that can only
>have one.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 47 +++++++++++++++++++++++------
> drivers/gpu/drm/xe/xe_gt_topology.h |  3 ++
> drivers/gpu/drm/xe/xe_hw_engine.c   | 29 +++++++++++++++++-
> 3 files changed, 68 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>index 2123f84be336..9f1930381d52 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -62,6 +62,21 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> }
>
>+static void
>+get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>+{
>+	if (GRAPHICS_VERx100(xe) == 1260) {
>+		*geometry_regs = 0;
>+		*compute_regs = 2;
>+	} else if (GRAPHICS_VERx100(xe) >= 1250) {
>+		*geometry_regs = 1;
>+		*compute_regs = 1;
>+	} else {
>+		*geometry_regs = 1;
>+		*compute_regs = 0;
>+	}
>+}
>+
> void
> xe_gt_topology_init(struct xe_gt *gt)
> {
>@@ -69,16 +84,7 @@ xe_gt_topology_init(struct xe_gt *gt)
> 	struct drm_printer p = drm_debug_printer("GT topology");
> 	int num_geometry_regs, num_compute_regs;
>
>-	if (GRAPHICS_VERx100(xe) == 1260) {
>-		num_geometry_regs = 0;
>-		num_compute_regs = 2;
>-	} else if (GRAPHICS_VERx100(xe) >= 1250) {
>-		num_geometry_regs = 1;
>-		num_compute_regs = 1;
>-	} else {
>-		num_geometry_regs = 1;
>-		num_compute_regs = 0;
>-	}
>+	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
>
> 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask, num_geometry_regs,
> 		      XELP_GT_GEOMETRY_DSS_ENABLE.reg);

particularly now that it is in a separate function, it seems
dangerous to keep it like this as we the number of registers dictates
the stack being accesed.

can we add a warn here if num_geometry_regs > 1
and in the line below if num_compute_regs > 2?

>@@ -113,3 +119,24 @@ xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum)
> {
> 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
> }
>+
>+/*
>+ * Determine whether the given quadrant has any DSS that are not fused off.
>+ * Used to infer CCS engine availability on Xe_HP.

please turn this into a kernel doc and add a sentence explaining what a
quadrant it.

>+ */
>+bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	xe_dss_mask_t all_dss;
>+	int g_dss_regs, c_dss_regs, max_dss, quad_first;
>+
>+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
>+		  XE_MAX_DSS_FUSE_BITS);
>+
>+	get_num_dss_regs(xe, &g_dss_regs, &c_dss_regs);
>+	max_dss = 32 * max(g_dss_regs, c_dss_regs);

instead of max_dss, maybe:

max_quads =  32 * max(g_dss_regs, c_dss_regs) / 4;?

>+
>+	quad_first = xe_dss_mask_group_ffs(all_dss, max_dss / 4, quad);
>+
>+	return quad_first < (quad + 1) * max_dss / 4;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>index b2540dc266f2..f47ab1b1269c 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>@@ -17,4 +17,7 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> unsigned int
> xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum);
>
>+bool
>+xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>+
> #endif /* _XE_GT_TOPOLOGY_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index ac00693ba0b2..f72f2e3b8c9a 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -436,13 +436,40 @@ static void read_copy_fuses(struct xe_gt *gt)
> 	}
> }
>
>+static void read_compute_fuses(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	/*
>+	 * CCS fusing based on DSS masks only applies to platforms that can
>+	 * have more than one CCS.
>+	 */
>+	if (hweight32(gt->info.engine_mask &
>+		      GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)) <= 1)

I don't think spreading the engine numbers will scale well.
I added XE_HW_ENGINE_CCS_MASK and such in

https://lore.kernel.org/intel-xe/20230307092446.1263266-7-lucas.demarchi@intel.com/T/#u

Should I split that out of that series so it can be used here?

Also info.engine_mask is u64, but here you are using
hweight32? I think the right thing would be to use hweight64 and
GENMASK_ULL() like in the patch mentioned above.

Lucas De Marchi

>+		return;
>+
>+	/*
>+	 * CCS availability on Xe_HP is inferred from the presence of DSS in
>+	 * each quadrant.
>+	 */
>+	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
>+		if (!(gt->info.engine_mask & BIT(i)))
>+			continue;
>+
>+		if (!xe_gt_topology_has_dss_in_quadrant(gt, j)) {
>+			gt->info.engine_mask &= ~BIT(i);
>+			drm_info(&xe->drm, "ccs%u fused off\n", j);
>+		}
>+	}
>+}
>+
> int xe_hw_engines_init_early(struct xe_gt *gt)
> {
> 	int i;
>
> 	read_media_fuses(gt);
> 	read_copy_fuses(gt);
>-	/* TODO: compute engines */
>+	read_compute_fuses(gt);
>
> 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
> 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>-- 
>2.39.2
>
