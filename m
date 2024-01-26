Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC0C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 16:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07DC10E1DB;
	Fri, 26 Jan 2024 16:26:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06CC10E1DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706286400; x=1737822400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T0fzR+kYcRoJG1YvTQJSNzE52HWAeuo3192bBZMsOEg=;
 b=BICG+gEHZcxl5cTQj+FY4mNCDkAUWazdNCUeSZSWwkHJdqJ5DWgM17ki
 w+EOpO8qWCQ+LZVIJMAsoqlZ5SJvqR5iUbJGdMuDgQAVTSJccdN4nkNNB
 YxCw1qRmyCMSEkxPwmOxLMnMDNOrjkNcmgH2x92qiRgvob7Tj1LU9qIpd
 ARr3Rff8ShWYyD01wUu24eAn8N4KEUaNA3TAZBm2ru8uG2BpIQiM261H5
 djxi9COqr4Xv+BzEwjiiLh8z1/hE0JDhwD8uLUJKSH5wUZIHhx9udz3/B
 aVZicUfy8NaiN8eXOFOMcFI+R8MRZaMnnIp4ScTt9uZpPxyO0f1XEMd/W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15866906"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15866906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 08:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2698094"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 08:26:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:26:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 08:26:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 08:26:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 08:26:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyOftEr+ApoeFnCEY80moacangkuEiAu5eineGtLMhzGaf4Y9FwS4OaFXwTiD6Yd17Vq9RFsWrc2OLlb/XDhGV3U81IjQ0/bwCAQbb1RxBYYPg/1bDc7HdsbMAl0BibUqhB0XHYke5flMvdhOP7cwQshVO/+23f9hiukCeSaL6qJ3570lOyfEGyuIKqD4uMBi6wV6QyB3qcjIXUKCzHr9y4k1ikOjImRntbmU3EA8pve2QfX19efCd/0cQS36i9BQBR+qR8VR0baHiuazGG5VurQAJQQaUMco5YOgfWFqdVjqqwxg3kQUhbulVt3bOLAcbUK3ueVrsuySWxDqr9eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6bT2YU8VzIxGsnOo0TZJRbW0JKeBzETaaGadP5zpGk=;
 b=j1OamuM4REHotnlrfc6sw1ui85hZYmI8XSrj5lVahoHiG1u6qN8+eokxh+GpwDMiUkwISah1IB+LzNAMuxI/O6iRPMejIX9+0gg90bT0nr3XgAs/Za1hEPgbYEacbNx9WcXX0PqtuMtf2rBacK79sky618fkM+sYTlaliLl86hyNQiDw9uwWjLhXPWf/DG42Dzq+g2/MnTlOrorPmSG3hY5Up/ArgN+RuGblqe6wEdfBHCKvXLXPMH2WnXgvKNm6cPz+G6Cy6C+2IawihylVoDxaFVYfveqNCMV/5pcMLOTxK0QO1Lbk3FJRSH5yx9YFSdHCN3ik9KOzr+YlgYJdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 16:26:37 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 16:26:36 +0000
Date: Fri, 26 Jan 2024 17:26:07 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Message-ID: <ZbPdHz8aVlqqj6om@fdugast-desk.home>
References: <20240126153840.7-1-francois.dugast@intel.com>
 <dh3ndb2b5efrcsgqxn3auzrgvn2pwa3x55pakjkcvdf5lml44e@i7dourwtt56q>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dh3ndb2b5efrcsgqxn3auzrgvn2pwa3x55pakjkcvdf5lml44e@i7dourwtt56q>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d98e2f2-e0eb-4d29-1cb1-08dc1e8b914a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rjx67rVD0l+xrBrJCxnH70d5rnc5UVRW1XODCB0b17PgyGLMAm34FjH6AZbIFp89Xy2axPRaOMsNCHnR1JwwerzxSGjLCxnqlOUcK0/6fvQOViElsxf0WUGUuxxLoNqMZAWXbaGLFzjZZ5icll5E+ULPCKZNA1NevDzOBSRrVUoVovy+12aiS+EnnNV80Ct/zVYBOMoH9H3SES2E65HF6XqRmZDrQhasv3Du7QwJq1BV6ZLdRXwGplz1rWogvjj4A7gXqz142ioX1xqbVQnuycRCe4tdiFvrSbebbRva6cNyML+z9Khm/P9qqf5hTKFLJf+wtqVtPL2cSOTmzXkEUUQqvKJ6kigpfYNcJHaykiXIk+g1dbeXygOM6Q0XdZNpZtqoMx7jxcnvzlpykhBYiWlVC42pq+Jm6AUhncABi3GFcnxJLXSIKlmwIbxhp45C/5ezAiUDWNBWXwBpXrDcXlAodApIaHdj4hAfZPwku668JPm9fCtMLeuJbMiXI11DjNMVecCgGK7+Okj1SHxMmHUATHWDZJ/idpREKZqNSuAMyrU6rI9e4mEExhBVOzzT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(36916002)(107886003)(9686003)(6666004)(6506007)(6512007)(6486002)(86362001)(82960400001)(8676002)(41300700001)(4326008)(478600001)(6636002)(316002)(6862004)(83380400001)(66476007)(66946007)(8936002)(54906003)(66556008)(15650500001)(36756003)(44832011)(38100700002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Id3p/VBhBdBGzwPioM0GvTTxSXNjZiRp6MyKKbxCoewIxBK8GnwQG95Ep4jH?=
 =?us-ascii?Q?6VOBEYszWQrY6RQ9LgsM1/RVbu/yVgmKZf/B2nTxwbqLW9ZO5nLJGFjCD0+5?=
 =?us-ascii?Q?OiHLJTGQ9WU5PCGHaL//CW3CZr7IUJmMUaEv9EWEtrXxA6YfqvCdMxtYko2d?=
 =?us-ascii?Q?afVyabW4FzOgIBVgnazluYaVn1bQoEkT2pVasTcJjvzhSpR9e2SbRzYzRsTM?=
 =?us-ascii?Q?Fxpa+4jivxkWECgCyN+sCf3SeRBHGIhn+WF8c7LcWU1ZPJdmgpjlq2491tng?=
 =?us-ascii?Q?izbA8/o54exXqYhnfM/0bh+mjQm7HuMiStlDWgXnXMlThnp9CEkBKt/o8IUH?=
 =?us-ascii?Q?C72qZxb+Xy/bsAgwWuVO9QOmNiFFCClRG+HVEuUxjDL6ao8r0/F4yo6sBLW1?=
 =?us-ascii?Q?7z72C/3xLlDQg33MDMSDNDanOPTEO+uhTGjOQR95REH2XJ/ciK3piUV1KfC+?=
 =?us-ascii?Q?W7IL2uthadrCjAnHp9+y4aGB+EIcy/EbWeww4RzYQVkbYmewG5yM5HRRyKPR?=
 =?us-ascii?Q?iO3+9upAMKYzcKztcZHtqu9yXu9PO3j1k3g0s9mcRkpupiW7PoY7B/kkkq5g?=
 =?us-ascii?Q?sDe+tSds/6A3+5TQ5qXHkK3EvWjMxcJVvDzvkwKzJ+wmAw1RGrp0vUL42OKy?=
 =?us-ascii?Q?aNR6ew/5LXT71lb/g6TqBvbgIjCP46V5QhID91QuUnTxTgk4v/xdG3aLJHzi?=
 =?us-ascii?Q?DCgvjBEXFlEE+RSaSBQbxSQ6tTvLnEEHQfes0kOjOm53dl8DuZhWUmvIZosd?=
 =?us-ascii?Q?6ro03ND3eUlfQ5eLldAlbhZ0b5IZZpobNllTHaC8gfZE7ROvKTGDPAiY2qah?=
 =?us-ascii?Q?D2t+TSf/kAGuxcTjdLAfer6SgnJ2OAZXQ5+2BUuilQ+qs+Zx8VhQVmqHOrEE?=
 =?us-ascii?Q?zN3OqyRBZIgrvdOFsvXc/pi8xRG2hodr4fjUqwi5E4eDg8J2ubEleQBUithB?=
 =?us-ascii?Q?kCAjKxgaMJkhjQVogu4j8JWiEIUmxXSwlSgVtnKMw+D/oSeincJYRSKl+kGl?=
 =?us-ascii?Q?nJdN2lchlp85D68ebmnweYxEbbbhQ7OtrbwEjzyEv0vjPavHUBCYJQVsdmZ/?=
 =?us-ascii?Q?2o3Kw3TNkThnVg4utcrx+J+qh518gOKt9W9xCtSBVIPRESZvrLyg5x+VaxSo?=
 =?us-ascii?Q?5SgOWommvi4Sc+/eh+7Vxte5sc3viAYWq8XPYWabvlDv0DxEfk6JwJsNCiu8?=
 =?us-ascii?Q?NtEowJkMUfWBm4yZCrUha0zvPxrlI94EipSI6DV9B4YHu7WK8/dbj6/W1Oar?=
 =?us-ascii?Q?iX9J1GVfbTfvby2c3SAFt3VQvLDSZaTbXeh0tyCyUV45QYyuwUNsxsG/+/uY?=
 =?us-ascii?Q?x3CUnObNzur6DfCnKz/4GvPFvdztasLTnoJuD5t78ujNxtjGEzik+95XDsqg?=
 =?us-ascii?Q?LgTqQ/5yn6F3Se5coKdE5dZxS5YkYA8UMBkmDhAf5G8uEaEyPgDHDIwlrTvU?=
 =?us-ascii?Q?bwgalBxit4Jzf9u4mBh2uaGi4qTSdIS3JneM/KhsuOP2F6O2kbJDCs1iodrm?=
 =?us-ascii?Q?3fDjMbFE3slhSoWIO98FP7AYAhH6N8czZNXbsw/GBIrr1BztBRYWHRVNVx4s?=
 =?us-ascii?Q?slV5lAAmkB3YPLSqmyTkLMMJgnWubOBpcyNAEKLGrqO3uLYyHtPHxugRlk6Q?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d98e2f2-e0eb-4d29-1cb1-08dc1e8b914a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 16:26:36.9075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgIGF9+sD6Ze22Enj+lYazw8jgDMb9NFwvpKou/DP2gO8zLSCzfRMz2Zu/g6THIakMmPYTV6FvZ1uF1ZQEm0JSQm2/J0012dvhrzaKLqggM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org,
 Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 09:53:47AM -0600, Lucas De Marchi wrote:
> On Fri, Jan 26, 2024 at 03:38:40PM +0000, Francois Dugast wrote:
> > Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
> > sufficient because in some configuration not all banks are enabled, so user
> > space needs to know which ones.
> > 
> > Bspec: 52545, 52546, 62482
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> 
> these are reserved for fixes, not feature additions. Particularly ones
> adding UAPI, we don't want to rush it in the current kernel.
> 
> +Matt Roper

Sure, the "Fixes: " will be removed in the next revision.

Francois

> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Robert Krzemien <robert.krzemien@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
> > drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
> > drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
> > include/uapi/drm/xe_drm.h            |  2 ++
> > 5 files changed, 71 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index cd27480f6486..f8606649d1e2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -156,6 +156,7 @@
> > #define	MIRROR_FUSE3				XE_REG(0x9118)
> > #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
> > #define   L3BANK_PAIR_COUNT			4
> > +#define   L3MODE_MASK				REG_GENMASK(7, 4)
> 
> is this supposed to be L3*N*ODE_MASK?
> 
> 
> Lucas De Marchi
> 
> > #define   L3BANK_MASK				REG_GENMASK(3, 0)
> > /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> > #define   MAX_MSLICES				4
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index a8d7f272c30a..6f4cf147a7aa 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -13,6 +13,8 @@
> > 
> > #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> > #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> > +#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
> > +#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)
> > 
> > static void
> > load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> > @@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
> > 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
> > }
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
> > static void
> > get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
> > {
> > @@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
> > 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
> > 		      XE2_GT_COMPUTE_DSS_2);
> > 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> > +	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
> > +		      gt->fuse_topo.l3_node_mask);
> > 
> > 	xe_gt_topology_dump(gt, &p);
> > }
> > @@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> > 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
> > 		   gt->fuse_topo.eu_mask_per_dss);
> > 
> > +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
> > +		   gt->fuse_topo.l3_bank_mask);
> > +	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
> > +		   gt->fuse_topo.l3_node_mask);
> > }
> > 
> > /*
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 70c615dd1498..adb1de613e77 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -24,11 +24,15 @@ enum xe_gt_type {
> > 	XE_GT_TYPE_MEDIA,
> > };
> > 
> > -#define XE_MAX_DSS_FUSE_REGS	3
> > -#define XE_MAX_EU_FUSE_REGS	1
> > +#define XE_MAX_DSS_FUSE_REGS		3
> > +#define XE_MAX_EU_FUSE_REGS		1
> > +#define XE_MAX_L3_BANK_FUSE_REGS	1
> > +#define XE_MAX_L3_NODE_FUSE_REGS	1
> > 
> > typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> > typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> > +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];
> > +typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];
> > 
> > struct xe_mmio_range {
> > 	u32 start;
> > @@ -332,6 +336,12 @@ struct xe_gt {
> > 
> > 		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
> > 		xe_eu_mask_t eu_mask_per_dss;
> > +
> > +		/** @l3_bank_mask: L3 bank mask */
> > +		xe_l3_bank_mask_t l3_bank_mask;
> > +
> > +		/** @l3_node_mask: L3 node mask */
> > +		xe_l3_node_mask_t l3_node_mask;
> > 	} fuse_topo;
> > 
> > 	/** @steering: register steering for individual HW units */
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 9b35673b286c..fe3906e8f721 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
> > static size_t calc_topo_query_size(struct xe_device *xe)
> > {
> > 	return xe->info.gt_count *
> > -		(3 * sizeof(struct drm_xe_query_topology_mask) +
> > +		(5 * sizeof(struct drm_xe_query_topology_mask) +
> > 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> > 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
> > -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
> > +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
> > +		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
> > }
> > 
> > static void __user *copy_mask(void __user *ptr,
> > @@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
> > 				      sizeof(gt->fuse_topo.eu_mask_per_dss));
> > 		if (IS_ERR(query_ptr))
> > 			return PTR_ERR(query_ptr);
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
> > 	}
> > 
> > 	return 0;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 50bbea0992d9..eca8f5f502c3 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
> > #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
> > #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
> > #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> > +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> > +#define DRM_XE_TOPO_L3_NODE		(1 << 4)
> > 	/** @type: type of mask */
> > 	__u16 type;
> > 
> > -- 
> > 2.34.1
> > 
