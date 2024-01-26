Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9148EC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 16:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1A510FC08;
	Fri, 26 Jan 2024 16:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2417910FC08
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706287114; x=1737823114;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEFN8W54FEvJDZLQ3SCoVJIvyFQjr/bfbMv+SSeYUZM=;
 b=UQIgj3/FpllTb8jBnCr1FRgkx0MPL9bHBBvLo0A4VrrWlHdUFlbHvrot
 ZpCe/X7hBq5GFiYDm5FK0m953YiUyFf9Kzzdu5VvAHPse0oI83M9G8nRI
 izzT5iy4CWsQyRSXsk2CHpS565m5V9zy6iPCbO0MtW0Qg/iOr/wYZILyN
 kzww2rLVDipNICbGyzTMxRF/k0ug/9zU7e4NkTdA+mrWpP3PevkQ9PdWt
 MsYt+27juaCqD+t/ExZKUpPQclTHLjSHqOAdtLi5eI6EseeBwWfZJHtN1
 mSpidpMKrVnbiHEJ37kfhTQcgKjQo37JUbCO0KioaBnA6C+Ohfnhk1af7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401369108"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401369108"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:38:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736730021"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736730021"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 08:38:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:38:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:38:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 08:38:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 08:38:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNYgGJ1OyxKMifyEQC9rqxhtZ3E3nVqoUsXfSxbJZMOqezNz8Ur59SDgb5GArtuQ6HjdPuC1l7CI1Ha1Umc4Li6T8nGwZe9EsJE4EgYAJCSeO0E2jwT9pEfApW9xmd9yigw9gFXaJG2NSGcIkAGazh2dT6fHBOZx9cWk/d/tLNp8K0P68ympk7zVOZPLLp7ozYJDYIIqq9rrKXFukFns5YlKmMnLG8uDyTJYuEb5qXYLwpnkpxLcRYKIkEqMkTHhhXK95EKX7T93YWZhPXmV/SHHa+8t2I2rtYP6jLGXFm6BRjX0Wj6fKfZ/i3VPmj+5txwBkmRf3v/MDfLhlAblZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FcxMW8i5Jw9C87OaZuXtHMrDLJn/Hw3eCRzfIJBFbs=;
 b=Kchc3KOB5c1wh9rSOkiVUWFMF8igjXrHAgxJjdnDsnVchpA20czNlzzVgR63gpRdvwA2LGrNZKgNF3CS4HMxhddw0hrGCm/feJhfeZNQ5cxMdBAlMfv6+namDWAeNbXe+w43wNPEKwaG3r97mcvEJFykQldVRAFAywvFEeT5GhlHx7JWZepxRbk2JMwWTuLOZhiMRiSyrAamfnaMeXuIEflZY0d7XpOHMD8X+1EJFU2pou8Ri7sPgtTR9/J2kny7V+NgjzvP9+/jYNi7P24l0pr9SimRMsTQ2/MwtV/GAqKMlDvS9uvxpvAO/H5Wi641j5cQs+aoSvmLCGBjDfMn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 16:38:26 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 16:38:26 +0000
Date: Fri, 26 Jan 2024 17:38:20 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Message-ID: <ZbPf_LUg6Q1I9zvZ@fdugast-desk.home>
References: <20240126153840.7-1-francois.dugast@intel.com>
 <CH0PR11MB54447377526CBD16DC719A3FE5792@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54447377526CBD16DC719A3FE5792@CH0PR11MB5444.namprd11.prod.outlook.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0083.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|LV3PR11MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: bae67b75-7392-4847-9103-08dc1e8d3870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLASxvC7ZLn11NGW5ZZvBOEt/SsO1cYqZmez5p1DytdyIkHUgRSZoj5Wm15MdlXzs9wA9l28aZTuMa95xt1PZ+mgVLGDywwcNYbj6DGfoDW+P8+DQ4jP/VPrPWoHc+M3NhVQ/WXtYGT9vVqdhyl3ijkqFqEcgzRxmxZ22ERTMutLBwt/q/zsnOYNlt7Zom0FbMpG5oagO67zXMbMCnyQEbelT6ZBIy44DR1dOmSyhXkHf7TZ6VsJWSJL4tRiHntkwqe2BObdzeNvykD3hWeI5hU4JLQ8OScT3IKBLHgPxI+bD+iqRv375E6EF55mNvw8JyoDqTbt5Rj2/2T2VJCRn186lC88NeEGPdVAFKAY3K/aGqIYe6TnWyj4HeLQ8DU6xdntrI5uW6v+x6FC6BEBB+DreGAxx/8n0EifEaa1xoIO1/hjk5ommMxcr7FmOEFChE1viDYtepyr1SwL023ToTlmv/ivsxf5EywYhHAlx41vKBV2hcIY9wbastePf+COEZMqbBAieJDx+ubPl+X/tH7pAHoAtXA6tVu64NfoDgzputBKz1KhNaCdp+hTtC69
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(86362001)(5660300002)(2906002)(15650500001)(44832011)(316002)(66556008)(6636002)(66946007)(54906003)(4326008)(8936002)(6862004)(8676002)(6512007)(82960400001)(6666004)(478600001)(36756003)(83380400001)(6486002)(26005)(9686003)(38100700002)(53546011)(66476007)(6506007)(41300700001)(36916002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aLqBVSHXxBEDV7ZyGccCC3ERdrqcyfZj8tJMISXSnxtqgvJmLgqa419ApCqV?=
 =?us-ascii?Q?i68kk8NRU+FsDwyq87xgL0wxAtLDf4gGzFFOD4upyP6YZ6lzNVHeejTqvf0X?=
 =?us-ascii?Q?NY6qqpe9p5iC9uTKW1Hvyp9xcAWQ4y3xqPm2EDN7aBGs5dyI00ysvIrbnRta?=
 =?us-ascii?Q?6l6wOztQ9Kq5hNqiuuJvt2UacrW4JDi7HH0HJgdDPC2ekj2GgMCDnalinNIK?=
 =?us-ascii?Q?jWiqaBDmaWKM10wQSfyQLswXMsxlwAlnQ5n2GIsWQMk745NEhNXUzkc+Lm0o?=
 =?us-ascii?Q?Btt0Ff74msrCLgv61eup0TLIhv6M5KEoElTI0iFBlL6+fUwY4bdtU/+9jbFt?=
 =?us-ascii?Q?T+AsL2Atk8JY14gLSJEfh7/p2jTkAkIKaLxSGGfZ+Zxd2yw3vJs0OjUozvGI?=
 =?us-ascii?Q?Siz1ayryrY+GMwaOx8o3Aq2wx/HGcwt4Aii+mqa0BBHvd+hPKgpGLjqCpxtz?=
 =?us-ascii?Q?xnWJqk0KY9SSxoWmSYlWuK7doV5YUBKezpH4hFDuT9lWF4c5rn+U6Qonaav/?=
 =?us-ascii?Q?1RbELKYvGm07KmOwG7NWEhGLCHnn5psVLvZoy8kiGk44ebdwDDVl9vAY/mXg?=
 =?us-ascii?Q?nfcxk5LIxQqZGPvSZyBdI9vbWrbquggeGVxMsg3/snTibhZitJWvI7JabZJU?=
 =?us-ascii?Q?LoxM/ilND2FG8R4C2Q32Kq1UdfzER1EymTgRh+5BevcZBDSyqcKToXEu3eBd?=
 =?us-ascii?Q?cXU952hlt8lrGnTAt/jbQYd7ZAh+HobsauD3XL3AyqryMpk3P9QU36ANM2b1?=
 =?us-ascii?Q?hlB3XrPrunmGcjIbmFm7/UGSP4wGxXD8j2fT8LpDyWkBsPQ5RMrfoLU1oUtk?=
 =?us-ascii?Q?ojv0tnbn9Iohy8XfZePAu0D+oNIl+whjIWCGhgj5Muq5q5x/0byOvl5MnfcP?=
 =?us-ascii?Q?E+Mo0RGP68OmF2gRM+uEXx+anFfv/3ppW253M1GH1XFtd7a3blY5QOxRO15a?=
 =?us-ascii?Q?WnSgShjiZL1lV0XbqLCCNEKDBNglcIM7HtWGFvazXxOOpuIYXFQeijpqFUxo?=
 =?us-ascii?Q?1HNzKYZiffYJP4zs16hiwAZBG8+TOT43QeMSvDmM+OeWX9cEnWKE5GkZZ6DX?=
 =?us-ascii?Q?p2nGX2nRfY1MsDn5MU8rs5y3ZBRPgWCLm1k2X+sCg/426xo+vx0FLSF4kvVD?=
 =?us-ascii?Q?Za2YJYgdMlpN0Y8VjUx+9wjNlBNclD/cYIl8wgLL6CTiBKOUgxeDfh0j5hhk?=
 =?us-ascii?Q?OyO49uGOuDomEAtOUSB+hCbO9RajYMTwziLuU+UpZJRuPQxcM5dqZyGBFn/7?=
 =?us-ascii?Q?wRhkKyMyqs3NZP16Mw0jaoha0Q1Z1W3RZB8wbFi9+WHH3V6yOmX5OeBcfEmB?=
 =?us-ascii?Q?VtoaPgql/OpeC+j8cdDGrSqxIHnE7w2TjI92AVCuM1bmjWcoTs91e8ppRsuy?=
 =?us-ascii?Q?t3yDjjiDWdPo/yhhVoggof2CfeYxNF9KiMgR1jAJVc3iV0KTfkHzy1ShJ3Qf?=
 =?us-ascii?Q?53XeTjXSKLel0/re1a4fB6ijweNZq6+6GltRog52OMx/emBjSSGD+iMMXL9U?=
 =?us-ascii?Q?AcykAEomcWFF9qUNoOpDd+a9Bdrvd0huzs/e5Cpmk9U046w8HJDjX2PX5JDE?=
 =?us-ascii?Q?+UG75ZCccnSdLRHtzCU5gv/Rm/LGZE4kcL5ztOn2A7k3jzuaTQOIeb53YYaI?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bae67b75-7392-4847-9103-08dc1e8d3870
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 16:38:26.7593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haYNo/fg0og5M6E/NHaYxFJvmin+figlHDhUnmdjG4C7Lr6kik0BaMglFSIx1vIjgHea3W8kiD4qapqWXyFhCOo+6mkQ0owW+cJmyGBFI2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Krzemien, Robert" <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 05:05:02PM +0100, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Dugast, Francois <francois.dugast@intel.com> 
> Sent: Friday, January 26, 2024 7:39 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Krzemien, Robert <robert.krzemien@intel.com>
> Subject: [PATCH] drm/xe: Add L3 bank and node masks to topology query
> > 
> > Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
> > sufficient because in some configuration not all banks are enabled, so user
> > space needs to know which ones.
> > 
> > Bspec: 52545, 52546, 62482
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Robert Krzemien <robert.krzemien@intel.com>
> 
> 
> We likely won't be able to push this change to XE until we have IGT support in place to exercise the newly-added L3 Bank component of the topology query.  We'll need to get that implemented before this patch can land, unfortunately.
> Besides that concern, nothing about the below implementation seems wrong at first glance. Though IIRC from I915, userspace only needed the number of L3 Banks, not the raw node and mask values.  This may have changed between platforms, though, so I won't block on this discrepancy.
> -Jonathan Cavitt

Yes providing the mask values is the ask in the context of OA events. Robert, feel free to chime in.

The IGT tests for topology are indeed light, even with the new addition. Let me extend it.

Francois

> 
> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
> >  drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
> >  include/uapi/drm/xe_drm.h            |  2 ++
> >  5 files changed, 71 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index cd27480f6486..f8606649d1e2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -156,6 +156,7 @@
> >  #define	MIRROR_FUSE3				XE_REG(0x9118)
> >  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> >  #define   L3BANK_PAIR_COUNT			4
> > +#define   L3MODE_MASK				REG_GENMASK(7, 4)
> >  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> >  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> >  #define   MAX_MSLICES				4
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index a8d7f272c30a..6f4cf147a7aa 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -13,6 +13,8 @@
> >  
> >  #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> >  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> > +#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
> > +#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)
> >  
> >  static void
> >  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> > @@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> >  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> >  }
> >  
> > +static void
> > +load_l3_masks(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask,
> > +	      xe_l3_node_mask_t l3_node_mask)
> > +{
> > +	u32 bank, node;
> > +
> > +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> > +		node = REG_FIELD_GET(MEML3_EN_MASK,
> > +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		bank = REG_FIELD_GET(GT_L3_EXC_MASK,
> > +				     xe_mmio_read32(gt, XEHP_FUSE4));
> > +	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {
> > +		node = REG_FIELD_GET(MEML3_EN_MASK,
> > +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		bank = REG_FIELD_GET(L3MODE_MASK,
> > +				     xe_mmio_read32(gt, MIRROR_FUSE3));
> > +	} else {
> > +		/*
> > +		 * Here the mask logic is reversed: a bit is set if the bank is
> > +		 * disabled.
> > +		 */
> > +		bank = REG_FIELD_GET(L3BANK_MASK,
> > +				     ~xe_mmio_read32(gt, MIRROR_FUSE3));
> > +		node = 0; /* Unused */
> > +	}
> > +
> > +	bitmap_from_arr32(l3_bank_mask, &bank, XE_MAX_L3_BANK_FUSE_BITS);
> > +	bitmap_from_arr32(l3_node_mask, &node, XE_MAX_L3_NODE_FUSE_BITS);
> > +}
> > +
> >  static void
> >  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> >  {
> > @@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
> >  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> >  		      XE2_GT_COMPUTE_DSS_2);
> >  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> > +	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
> > +		      gt->fuse_topo.l3_node_mask);
> >  
> >  	xe_gt_topology_dump(gt, &p);
> >  }
> > @@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> >  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
> >  		   gt->fuse_topo.eu_mask_per_dss);
> >  
> > +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> > +		   gt->fuse_topo.l3_bank_mask);
> > +	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
> > +		   gt->fuse_topo.l3_node_mask);
> >  }
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 70c615dd1498..adb1de613e77 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -24,11 +24,15 @@ enum xe_gt_type {
> >  	XE_GT_TYPE_MEDIA,
> >  };
> >  
> > -#define XE_MAX_DSS_FUSE_REGS	3
> > -#define XE_MAX_EU_FUSE_REGS	1
> > +#define XE_MAX_DSS_FUSE_REGS		3
> > +#define XE_MAX_EU_FUSE_REGS		1
> > +#define XE_MAX_L3_BANK_FUSE_REGS	1
> > +#define XE_MAX_L3_NODE_FUSE_REGS	1
> >  
> >  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> >  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> > +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];
> > +typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];
> >  
> >  struct xe_mmio_range {
> >  	u32 start;
> > @@ -332,6 +336,12 @@ struct xe_gt {
> >  
> >  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
> >  		xe_eu_mask_t eu_mask_per_dss;
> > +
> > +		/** @l3_bank_mask: L3 bank mask */
> > +		xe_l3_bank_mask_t l3_bank_mask;
> > +
> > +		/** @l3_node_mask: L3 node mask */
> > +		xe_l3_node_mask_t l3_node_mask;
> >  	} fuse_topo;
> >  
> >  	/** @steering: register steering for individual HW units */
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 9b35673b286c..fe3906e8f721 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
> >  static size_t calc_topo_query_size(struct xe_device *xe)
> >  {
> >  	return xe->info.gt_count *
> > -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> > +		(5 * sizeof(struct drm_xe_query_topology_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> >  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> > +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
> >  }
> >  
> >  static void __user *copy_mask(void __user *ptr,
> > @@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
> >  				      sizeof(gt->fuse_topo.eu_mask_per_dss));
> >  		if (IS_ERR(query_ptr))
> >  			return PTR_ERR(query_ptr);
> > +
> > +		topo.type = DRM_XE_TOPO_L3_BANK;
> > +		query_ptr = copy_mask(query_ptr, &topo,
> > +				      gt->fuse_topo.l3_bank_mask,
> > +				      sizeof(gt->fuse_topo.l3_bank_mask));
> > +		if (IS_ERR(query_ptr))
> > +			return PTR_ERR(query_ptr);
> > +
> > +		topo.type = DRM_XE_TOPO_L3_NODE;
> > +		query_ptr = copy_mask(query_ptr, &topo,
> > +				      gt->fuse_topo.l3_node_mask,
> > +				      sizeof(gt->fuse_topo.l3_node_mask));
> > +		if (IS_ERR(query_ptr))
> > +			return PTR_ERR(query_ptr);
> >  	}
> >  
> >  	return 0;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 50bbea0992d9..eca8f5f502c3 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
> >  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> >  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> >  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> > +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> > +#define DRM_XE_TOPO_L3_NODE		(1 << 4)
> >  	/** @type: type of mask */
> >  	__u16 type;
> >  
> > -- 
> > 2.34.1
> > 
> > 
