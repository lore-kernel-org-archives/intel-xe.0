Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E8C52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 19:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C97310E528;
	Wed, 14 Aug 2024 19:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+7S8crA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D785A10E067
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723663433; x=1755199433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cONwqNMPkPsFn1I6TXMvxbeU0ocAvBEzN1c8m4lsOI=;
 b=J+7S8crAxWf1i/loLMPfWRniSC8IEBDe9q2j5SwtR4i/HNHhab+yjqVz
 VdzOmAI5BcpzFF8VLYSLVfxQR6X7x1Brv39KSmNK5IgpOj3vuWtur6Bcj
 TUh3v+NOS5Z0CSaweZCdXJMZTC7apDwNuLPJDIEHYrl3zFQGftK598dGm
 Iwv9xNZVdlzokHuekcn3gIqZEoZVFeYQUusc4mMxAAdPqXCMT5wCCc7EZ
 88P7gKahgFAddgfv1N/qKqSHb2yYAFzcEjRDJWvK0xA9OT1uTqi4M5OsF
 7s8wcQ/jqN4G+SCh/grO+eGTWAScr7uEnglnN/B5ZOq8ipvk2leAbGovu Q==;
X-CSE-ConnectionGUID: 5GWpNUI6Qwy522cvvPbWtg==
X-CSE-MsgGUID: SWbgD4/YTu+8Gg7QkW009A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33310155"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="33310155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 12:23:52 -0700
X-CSE-ConnectionGUID: Jc3mTLDrS42BC6XwYZPaUA==
X-CSE-MsgGUID: sP4PMY+kR8m+TZxyZb17yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58984924"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 12:23:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 12:23:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 12:23:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 12:23:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 12:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMjrjUG+oPoTacApkXyVAPwgUnTPbsDq5NCfc4jQ572UYsSvGD0sZkbAhj2whClKqot0kPk/yw/w+8o91Kg5WfLYP4UZaOYQ06+LEQMiLZX7mBbUj3fekLYp0PAbl8/PuzPnlgTMoo+m3PAHxpBdqSv2uBInYrkLa8hTxmQiufD4tUAwjuHvux/LARMiBQsDE2ujOisRvsfZJPSBwYx5TEDA/Xsb0HebQ7GJADvzXU4okWEZ9Xc7adU2r1HADKw0YnTAMj1sdxJEtMNjnZA9fuZfUTHiEUlc3Xzy0dV8ryiDjqzBf6Fyz6ZbAYpOVEJkx49s/+ptQ5Qc0BgA+77hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiFoO9wB4Z0Ef73lsn3d6B/90GORo2gYy54woqWi6ZE=;
 b=qPUufiv0alkJijCknwY/s2bzlXwvHvzSNORw3j94qeZCitD7Rndyw5284LXlyZiJtr3BgPKrffWR5BIxX38EPah0ehVDoJznpb7g7co5W1zkE2/l8FfV2dGzevQxpKhaU9jzeUYbPXoZQC7szA2QFFXNMCAEVizFd8LRQ1D2iE8gq5FTKsz3dB28Nn+nRdXZji70zS3yBiBchqxZB3dCz02Kx4PKAUi4b6NDuJri+LMwtS9sute2CHBOS9iRtEB/wN/n7EPz440uq2BcevvB7obugmTVRRZSpqyE9IP3eSXKv/gALh3eppS+h0oIrYWu6jy7MUc16rugGsOsgEWyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 19:23:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 19:23:49 +0000
Date: Wed, 14 Aug 2024 12:23:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH V2 1/3] drm/xe: Move enable host l2 VRAM post MCR init
Message-ID: <20240814192345.GI5774@mdroper-desk1.amr.corp.intel.com>
References: <20240814095614.909774-1-tejas.upadhyay@intel.com>
 <20240814095614.909774-2-tejas.upadhyay@intel.com>
 <xwmsqnf33e2itfsgcmy6csqd7wos7hcixfy3oyr7jcxqknmvab@wv2qijzrkql2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xwmsqnf33e2itfsgcmy6csqd7wos7hcixfy3oyr7jcxqknmvab@wv2qijzrkql2>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: e24e71a6-a0f0-472b-8564-08dcbc969fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: LrdTsHWrZwfNpqgocVEFBuJWhV0Ho7xmGCF5CaLjHFdupWnwcNV9c/YwjBzAAly4SkKdJ46U5upmsKKQ/sw73zY4GhycAMo/0U9JdFUGjMxyNpU3YREFVtj/oJpUTAmZlj2UFjm60sAQGDeCSqO/Q76GWYnBOEIXJ4SGXsO0wzg/BmLI6HylIPPa/NttiXYoGQ+QB2j/yECx6/RGCTUaV+hr2FcITZ2Ox56GeyUkEPsjy+O7fBOJMdlylkW8PiSHeGN4feKhezyJI5d3QYX+f5cUbNvzN1SydKWiqTSYJDWlHgQoZXgeXt8g8FHhVaIRkDqpC72cZpYPluoTaSm0SNf4nkumgqkQBCLvUK0c/F/mukKL/ld0iNrcjz1NL6eY2B1ub87DDOUa6hedevOk2UeJrt2jhvZSSbvC5DTlbcP1h1SEx0J2qX1XJks9vwBEzAeHCNxFlx14ol62e+ivDrSg/NX2RzIgr8XUawAMwFVZiLk8qXMiLpRc0zJYodAVXQ1jZ4piA1mzh/L0Se2IhuqZOsSY0kxI3gCW2O3VWU+ibg1Waz9Wd7zORQW+IW3Spt5yhp2cFp+PxpCwA0aNQrZKy7E3tZy9AEeg8FzsHWkXOCyZKWF3DeUzz33rr1ABWg+MFqb9g2PxmDPOyHzIbILuxEj4QxEOuybFKHNbiAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a2BwNCLDQLeJxhOrVHDF5IxVhzVOh8mBkIYqpS4VaTc4jNcP5KF7mQ/1kHJ3?=
 =?us-ascii?Q?I8cWdsJ5MZDb/AjmqTU/dXiFEkRoj4/y7qJr/5HjD4yPY7l0gI9Dz/9EQDS9?=
 =?us-ascii?Q?yJySYL0m3ZZ0+PjoADWuEeCBhGoxJ+u91KG+B8Kk7R0xoXZj5hoafWKOuVsh?=
 =?us-ascii?Q?mrCKmk6I07MfPtHkotE2yo7exu33uwq5uRyKNZO/ctD0SB9M0iKTMEXe+Q5P?=
 =?us-ascii?Q?4rJNT9ygJtxMdHSgiFhxetr0GLan8PC7J9UJHPdUoI226xG9cxO8xr/KTKLp?=
 =?us-ascii?Q?LXtYmWUs90oynuxjDaD01GdkrNV9gWn8LhcGPDuGMwXc7Hb01jWDjOaNjF5a?=
 =?us-ascii?Q?UAGHBh0CuOXlXp3OJ95gAWpAcXBWQJfb7X58xd+6TxdPmTlP57GWILC7/RMX?=
 =?us-ascii?Q?ghGNuk/60bDiWA/06JYz9FGAaLC6bQ2xSBoCp+hMxaO9Plru2ReayWjvasHh?=
 =?us-ascii?Q?fnlRkMn6gGa7DLNLSBRQ2qNgVjoddDKTG+D2JvI4bV2fZd7TUoK+xHch9gPI?=
 =?us-ascii?Q?smd87OO7Bgmqn7VBnU6GcZ1HUXMiZWTTLUuMsqRTayhmwBiYpDe6DA3qjcX5?=
 =?us-ascii?Q?ey8lfqBQ5niDPCqn2F08mg21XUY9jNHtBacMXhheCicrm36vHWgjjmWbMDJb?=
 =?us-ascii?Q?fS9cC/Rj/vkfBw0QOcM+93R2MSmtv+9y9fGvPpDnrzxdvoV79QwrEnHELPEw?=
 =?us-ascii?Q?+z59butTJsnkBKSMdlBlPnHO6mURLFDh9R4iPKG9nH+82l+p1FgikACw9Ip+?=
 =?us-ascii?Q?xC2OGhzLxVRZiR084W8NthPtWW3QY+I8rNvRYoiFM5lV7S3X27zviXLiv7G6?=
 =?us-ascii?Q?cINbWhYJA2kO2+XSHSuj/Ct6ZE8GG57ZxNGj0KcSYeQVpWjJX+MQMcFP+EgM?=
 =?us-ascii?Q?iZ2LmWEJPNEsOO2BgagI3SSP/0F+v4A6OeYstDmW/PsCBiWYaliSaKIezZf1?=
 =?us-ascii?Q?yo6NcojRZGG/RZP3gGymsf3GazYDhzKZiJM74YpKs4sOZcNjTsYJsEVtnB6g?=
 =?us-ascii?Q?zv/7qidZJLs/gXbwBv+iTtsiKCTvTYlchOKYk3Bvg++64RV0DotSvjnFNCva?=
 =?us-ascii?Q?GDS5Xty/r9WrrMInFq/09hJjcAeFZ1Z8n8prKgPGrBxUxM3/U2ZN1mk/ZBbj?=
 =?us-ascii?Q?SL48vP6/hfwze6ir9G3vsbssf8jMZ5SCBkqhn5H/GV69SDVnAsrp62nHdDUJ?=
 =?us-ascii?Q?yLUEV5L5jVqAUlyIMOrlYqn9Jk2tlS7Md65AOhw/hVlnPFsOge5y2agft+BA?=
 =?us-ascii?Q?iCYN6YllG5ayMbh6TvFrNrbtqb9ec6pNIc2Hsih+kvDnga21u9DVyOF5+mVV?=
 =?us-ascii?Q?Q77OUk9g+tlC91j5guqFQgaHiz0lLyHOVpZtRB8c8DlhfSel+tS0RSqi0fNI?=
 =?us-ascii?Q?UScam31o+X6njE+XOoUbncTiNSgj5ZluPOcRDSGy43QhR/5f6rmjysVCm/U7?=
 =?us-ascii?Q?3oR6P2jLlh7gxoDWNeRoE1uhX8RNGyPjZM1Q5IW3ZA/iwopVQ6AmctikkBwq?=
 =?us-ascii?Q?duojcGV/UdEB6mwIS+bmPJLuvxW0CuF6DZy7GDttKYX3UvTQqDeMYErAXu0/?=
 =?us-ascii?Q?exrYfKR2JLYn9nbbjaTRtFCnSyxh9vTb9OfZAIwXHvz7yPxolPdw0zk9oovH?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e24e71a6-a0f0-472b-8564-08dcbc969fca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:23:49.2864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9olYDGKyLMrGuMAMal2QP3xh+LYMoUnVfrwBOvqH04BFlO92fW0BrzV3DT08618gnUWDJRt546bNBpVWXxTG4iqOlyYd7qQb4lAjxOrOqBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 14, 2024 at 11:34:21AM -0500, Lucas De Marchi wrote:
> On Wed, Aug 14, 2024 at 03:26:12PM GMT, Tejas Upadhyay wrote:
> > enable host l2 VRAM is reading MCR register thus
> > should be moved after MCR init is done.
> 
> This commit message skips a lot of the details on what was discussed in
> the other thread. Let's improve it and for future please be more verbose
> in your commit messages. Suggestion:
> 
> 	xe_gt_enable_host_l2_vram() is reading the XE2_GAMREQSTRM_CTRL register
> 	that is currently missing the MCR annotation. However, just adding the
> 	annotation doesn't work as this function is called before MCR handling
> 	is initialized in xe_gt_mcr_init().
> 
> 	xe_gt_enable_host_l2_vram() is used to implement WA 16023588340 that
> 	needs to be done as early as possible during initialization in order
> 	to be effective since the MMIO writes impact it. In the failure
> 	scenario, driver would simply not be able to bind sucesfully.
> 
> 	Moving xe_gt_enable_host_l2_vram() later, after MCR initialization is
> 	done, only incurs a few additional HW accesses, particularly when
> 	loading GuC for hwconfig. Binding/unbinding the driver 100 times in
> 	BMG still works so it should be ok to start handling the WA a little
> 	bit later. This is sufficient to allow adding the MCR annotation to
> 	XE2_GAMREQSTRM_CTRL.
> 
> > 
> > V2(Matt):
> > - Reword commit message
> > V1(Lucas):
> > - Reorder patch and reorder flow of L2 VRAM enable
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Matt Roper / Matthew Auld, do the paragraphs above capture
> correctly the discussion we had in the previous version?

Yeah, that expanded description looks good to me.  With that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> with that,
> 
> // Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_gt.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 58895ed22f6e..238c7d1053f0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> > 
> > 	xe_gt_mcr_init_early(gt);
> > 	xe_pat_init(gt);
> > -	xe_gt_enable_host_l2_vram(gt);
> > 
> > 	err = xe_uc_init(&gt->uc);
> > 	if (err)
> > @@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> > 
> > 	xe_gt_topology_init(gt);
> > 	xe_gt_mcr_init(gt);
> > +	xe_gt_enable_host_l2_vram(gt);
> > 
> > out_fw:
> > 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > -- 
> > 2.25.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
