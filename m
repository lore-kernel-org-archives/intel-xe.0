Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4117BC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 15:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C110E0D1;
	Wed, 19 Jul 2023 15:55:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B548110E0D1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689782109; x=1721318109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GCqpsREnZoTYnjftMI/v75w2AdB9pDx2SxG8YXOIlBM=;
 b=A4oDLExJ/euUG8RKU0V5nNr/+HXYd29X+QmDdxbh4q0w0IzghMhFdcx7
 XcCQEVvWIP6vsXxluIx3eUF7rZcOGV865CRBdvhNDWXXgLef4VsAJl2aC
 tbTxd7zXdPvzXygspD0logYd7gP38+S3K5oVE9HfTaiad2/WufBiDkKhf
 1S4MBU7fl28dNo100i4tp3GMhG+zXjr5fjPhKFUKALHeQPzsBqlBs4gyZ
 UiwLw5EzgMoivtFMCb4jhWcNjbcyiyXiUE4416e7Y+4viQfD22baLO1QL
 R2JkmWZP0szlZFLZM3Q329o8ZJ1R3E75Gk1VxFyBzt6y4+6R0+u6T/edY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346095150"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="346095150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 08:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789461769"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="789461769"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 08:55:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:55:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 08:55:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 08:55:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W24iXg5Z90OzhwDwvzKKxcIIIs1kMraxzJ1Y04wTTLH3/qHJlJbB7lom6A+TVAihxc1L38V/RDDZe8bkIYf1v12NFMMkWM006LiV+LNe7i4wynVNC8433B53qgOz+4XXC3ZxbwBQoZib10uDSZ1ZRouHvW5KARziTwK+o/8t3RTqGdR46hsUVPS7TDdfaE5xBdM5y/MDF9t/aLw0xQ+xdwjZ4zDi00+yTo5njgPaq8WC78Ii3tfpzKuj3EEuDiuFwiAK19EkzzKETEWgZFAQicr73t1dLPrAMIThwra6VtqZ+BP/atEXtiSIaKqV4vgf58bhc9pQUSazKHWNY+reuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svPxe8A//ShJPXxelC9bj6OmGqrG8QHZWfrSkKnVyo4=;
 b=D/xKMYeeaFTSihO2YrRDMPElPfcHbumK42ZNKa7V3atD43nHocOD+j1vYv09XNKAzGuIl/K3COG25h9M/Z96j/eUSlmFnONOLVb8lHuv5jxXFRPxHUoHf5dQtHbQyfifol/FfhgxTojbxnQirul/jSM+YIwpNPXv2LO5oLlh7AMArfXcYEh2qhBfnKpReDpE7Wi++FmR4EdNWxwkWaYNRFEsfFkobrr9KdN3VegDV6Rd0l8Axb1DDPe+R09QA8UORh0JFIu48+rBaH7j2MNxPsUX11bDcpKcsnpPHQ6D1yO3FecoLVUGvf7QRdKJ8c37kOW+Lhb4N28u+cQNUtt0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 15:55:02 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:55:02 +0000
Date: Wed, 19 Jul 2023 11:54:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLgHUyLHDvFuKbb4@intel.com>
References: <20230719135108.7-1-francois.dugast@intel.com>
 <20230719135108.7-3-francois.dugast@intel.com>
 <ZLgAgdqe9X5fuFUL@intel.com> <ZLgDwdTBzgukRriC@fdugast-desk.home>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLgDwdTBzgukRriC@fdugast-desk.home>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 388fffeb-b05e-4134-7a6d-08db8870833c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcveUM16QsOzvVmtJ38c7KYiS3e4vYAtXOPnfQV6oLLLUynNJE6ylXhdcwyZ/qPLjn3Z8kOKWvLyC8HjuwM7mkk80gbUDnxtaIYl8yBYmzhYAumEDlM9WKRFStJHIPxD2wgHl+sHPM03Zh5jiilRM5ddobsdUpg9Wt1/Kg0K1VGhVkthY+cIcKYWuXDTc4GC9SdX+tQIXTGJrzX/EBtbo08FPJgUxR4qKVzOmesiHN1PmwV3uPXlRvvFdi7hyZzg67yuEBaT90bkeBvyCbEe7IBykWoP6syVvFgO4ATfMhpIlUQ4arjsTmaLjjEUGbmsCkUqadi/RufsK17G8VqCGM42tMiqB7kIDq6kbVuaZqU02d+ThPbXCl3biGtjBEqeESFWwa3HtoCCdDuHWoquQ3A+7dTewW37XfEQVA/b90+c2+c4vGL2HrKOuWUythlwRpcPl+aYkuyNKoGuAb8Vnp8FWINRGDgb3ZjmH5KEJFMenMxdTAe43i6vJIqWikuP4S3EVffDFKfjJZnkc1ndxXPKoEMU3Tzk2+29v+/92kDWRiAbrRkHPSOB8USGMGz5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(2616005)(82960400001)(6666004)(478600001)(186003)(83380400001)(6506007)(6512007)(107886003)(6862004)(8936002)(4326008)(41300700001)(8676002)(6636002)(30864003)(2906002)(86362001)(6486002)(66476007)(316002)(36756003)(38100700002)(37006003)(5660300002)(66556008)(44832011)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?upxCLgd05Dor41e2B6318KhOKm5E7hWO0GSkdoZj1arGfGwiwKZ9opCN8/?=
 =?iso-8859-1?Q?KKkSbPZg93/r1vD5lYG4H9Tu01735YfJIqDI6DcoMWYn4rQ+XmW+iiMMlC?=
 =?iso-8859-1?Q?OdvNnVF//aMbiBqMYIyzCT7o93mbNYx73khWoJ7XRo8wfa4UvF3/Ooeot2?=
 =?iso-8859-1?Q?JFY4p4bJ//6tbtpXVAXuKN3ORfPuJcvSEjhrIRDgcpUVPPEvBoAKum4owN?=
 =?iso-8859-1?Q?NImr0NNldv1OO3tWhTrr5sn8uOcBqN9TJsGPHMqkJY6iOwG2SrJ1twX58k?=
 =?iso-8859-1?Q?+pGkIW9pk3473+vUljHvueAWsVup4Ifi1F/7mThJtCR/SezuicgeTXxiij?=
 =?iso-8859-1?Q?B1nGhVyVpLRoDijuBx5HOASPgyObXSvyGVruAHMAo7xHGD83OMf0+CJonp?=
 =?iso-8859-1?Q?JCQvXWkYHfTMudENGZ+fAZzjYcXl0kkio4jbzXo4qOtJlF6I3RH/6dHGf1?=
 =?iso-8859-1?Q?SbMHLNLBpe733CjsurOGsuTRY6jutvQ9ldfmeZYPGx42E3ena6TXw8Q89g?=
 =?iso-8859-1?Q?ByArtTZjeouImrzOxaHUIOpVUnWxHDxv4VgvXBvTRKKb4qfbygxVkoytxv?=
 =?iso-8859-1?Q?fTXPONtmCBrh6BWurmk6+kev+bZM0A8KXCP2QBa3WahFjGWfL2TJD+8F2a?=
 =?iso-8859-1?Q?Kep4lr8gsDIhuSAQNCOgPwTgGM8MKN+AxhKT0jJuAoDV9fVoDKr8GjaWgE?=
 =?iso-8859-1?Q?Mwp/YyeBrSlxC/e+AzWav89+R3BLdMFuw54kKN1CCzNxi6QT18nKKV/xwF?=
 =?iso-8859-1?Q?CbbV6y2E6NxCdPTdDWKFysRf0lTNFTNs0r3smqjeCCbT4Q5T9BH52PWERV?=
 =?iso-8859-1?Q?ltcKGVVx8K8nYMPNkMcldgbftVWu2p0RrseT4gBzMJ4LdRC0k3U+U8OMsZ?=
 =?iso-8859-1?Q?sZtSRZ0+x91zBhp50Gsdj2xbVW14eaLcTeQhNmYxwUIEFwhZ7qwvAWYZx9?=
 =?iso-8859-1?Q?3Z/L+YPClR/eiSwQVaoa6rWiM3cs8c8RP4c7FIzmGEenHEdaB/mM4TXEvL?=
 =?iso-8859-1?Q?kH/0gFTxl4wuVMUEWckYeuwxXC7wsptmRVbhDqJxHg/KrGmfQ83V4lXOn2?=
 =?iso-8859-1?Q?8oq0d3z4sQvqF7KGFMRgv4DjLcNqIfcJHcLhnBcIt4Wg91PNMx95Ac1hU9?=
 =?iso-8859-1?Q?wx60yWPLuI3tkxKh4R9uoYUVm1AmgIGrt8v8DtHiEcTEbLS8LEPYo2aKN7?=
 =?iso-8859-1?Q?VOrta0c3nUeT35UrPAPWHw3r2nHAeg2aLaaYyedoc0g1Krn/WBUpIFC5AZ?=
 =?iso-8859-1?Q?Xjbive9vftVx7aaGE78YKEGaZKZXVeWuHHDw3JggZNG4BTBd409S9/7N6D?=
 =?iso-8859-1?Q?8rtI4Z0ZFJdP6+3xoXHx1XAJY7P5tv87KEE3vGBppwS8X6z1fAGf/A8Gdc?=
 =?iso-8859-1?Q?T1pKzMuq/KhjMQRhWt5+CAY6Wbu3CieMUatpwW7TNjI+r58MrdCid21fB8?=
 =?iso-8859-1?Q?23LHg60K2NwRWH0SnhjosZ5NCFkYaFEAlNySK1iEc1L+Fkas+DdfzNFKDH?=
 =?iso-8859-1?Q?/FPLTX20BK2FVR3AnHfU2mYFJVpNLQaIoYirKNEGDgcrv1swxxVRz2hGCl?=
 =?iso-8859-1?Q?FzNBJjMYIs0HAJfcKJJfbt/5AkJYJ/sLbQL1dzckVPbtWPA4Iwu8HGfId7?=
 =?iso-8859-1?Q?MEiis3EDAK2oNAg/yGDoLHCYLpgq6RGybWPTupEs/ulRdB8fmkhXTRNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 388fffeb-b05e-4134-7a6d-08db8870833c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:55:02.4869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gV3SNgx0njPL2Ps20fJhx+PgPqWONxSSqQTyK9MOTRh87DkvsFq3cSdjmH6ahl7LcdFFeJf5aYimGnlNg6W63w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Cleanup style warnings and
 errors
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 05:39:45PM +0200, Francois Dugast wrote:
> On Wed, Jul 19, 2023 at 11:25:53AM -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 19, 2023 at 01:51:08PM +0000, Francois Dugast wrote:
> > > Fix 6 errors and 20 warnings reported by checkpatch.pl.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
> > >  .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
> > >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
> > >  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
> > >  drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 +---
> > >  drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
> > >  drivers/gpu/drm/xe/xe_map.h                   |  2 +-
> > >  drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
> > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
> > >  drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
> > >  drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
> > >  13 files changed, 49 insertions(+), 36 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > > index 1532ca7e0af6..65707e20c557 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> > > @@ -1 +1,6 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > >  #include "../../../i915/soc/intel_dram.h"
> > > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > > index 823803f7e853..9c46556d33a4 100644
> > > --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > > +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> > > @@ -1 +1,6 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > >  #include "../../../i915/soc/intel_pch.h"
> > > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > index fad4c66a8226..37cba91be10d 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > @@ -250,8 +250,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
> > >  	 * pretend the BIOS never had it enabled.
> > >  	 */
> > >  	intel_plane_disable_noatomic(crtc, plane);
> > > -
> > > -	return;
> > >  }
> > >  
> > >  static void plane_config_fini(struct intel_initial_plane_config *plane_config)
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 8e086c9bd309..828a9fea420b 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1821,7 +1821,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > >  	XE_BUG_ON(!ww);
> > >  
> > >  	tv_bo.num_shared = num_resv;
> > > -	tv_bo.bo = &bo->ttm;;
> > > +	tv_bo.bo = &bo->ttm;
> > >  	list_add_tail(&tv_bo.head, &objs);
> > >  
> > >  	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > index ff4075387564..c56815af0686 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > @@ -273,7 +273,7 @@ static void init_steering_inst0(struct xe_gt *gt)
> > >  
> > >  static const struct {
> > >  	const char *name;
> > > -	void (*init)(struct xe_gt *);
> > > +	void (*init)(struct xe_gt *gt);
> > >  } xe_steering_types[] = {
> > >  	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
> > >  	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > index b955940e8dc6..c69d2e8a0fe1 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > > @@ -37,10 +37,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
> > >  	int err;
> > >  
> > >  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> > > -	if (!kg) {
> > > -		drm_warn(&xe->drm, "Allocating kobject failed.\n");
> > 
> > why is this getting removed?
> > 
> > I know, it should probably be replaced by a drm_err instead of
> > warn, but what's the checkpatch complain here?
> 
> The issue reported by checkpatch is:
> 
> 	WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
> 	#41: FILE: drivers/gpu/drm/xe/xe_gt_sysfs.c:41:
> 	+       if (!kg) {
> 	+               drm_warn(&xe->drm, "Allocating kobject failed.\n");
> 
> I think it is valid.

oh, indeed

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Francois
> 
> > 
> > > +	if (!kg)
> > >  		return;
> > > -	}
> > >  
> > >  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
> > >  	kg->gt = gt;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index ed90d738d673..8ae026838702 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -396,14 +396,12 @@ static int guc_wait_ucode(struct xe_guc *guc)
> > >  		struct drm_printer p = drm_info_printer(drm->dev);
> > >  
> > >  		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> > > -		drm_info(drm, "GuC load failed: status: Reset = %d, "
> > > -			"BootROM = 0x%02X, UKernel = 0x%02X, "
> > > -			"MIA = 0x%02X, Auth = 0x%02X\n",
> > > -			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > > -			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > > -			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > > -			REG_FIELD_GET(GS_MIA_MASK, status),
> > > -			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > > +		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> > > +			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> > > +			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> > > +			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> > > +			 REG_FIELD_GET(GS_MIA_MASK, status),
> > > +			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> > >  
> > >  		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> > >  			drm_info(drm, "GuC firmware signature verification failed\n");
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index d788e67312b9..803d557cf5aa 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -104,7 +104,7 @@ struct xe_hw_engine {
> > >  	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
> > >  	struct xe_hw_fence_irq *fence_irq;
> > >  	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
> > > -	void (*irq_handler)(struct xe_hw_engine *, u16);
> > > +	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> > >  	/** @engine_id: id  for this hw engine */
> > >  	enum xe_hw_engine_id engine_id;
> > >  };
> > > diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> > > index 032c2e8b5438..f62e0c8b67ab 100644
> > > --- a/drivers/gpu/drm/xe/xe_map.h
> > > +++ b/drivers/gpu/drm/xe/xe_map.h
> > > @@ -1,4 +1,4 @@
> > > -// SPDX-License-Identifier: MIT
> > > +/* SPDX-License-Identifier: MIT */
> > >  /*
> > >   * Copyright © 2022 Intel Corporation
> > >   */
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 2bb7d524af24..4c6f299fd024 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -475,7 +475,7 @@ static void emit_pte(struct xe_migrate *m,
> > >  			bb->cs[bb->len++] = lower_32_bits(addr);
> > >  			bb->cs[bb->len++] = upper_32_bits(addr);
> > >  
> > > -			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
> > > +			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
> > >  			cur_ofs += 8;
> > >  		}
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > index ea6dd7d71b59..e83781f9a516 100644
> > > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > @@ -89,18 +89,30 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> > >  	deny = val & RING_FORCE_TO_NONPRIV_DENY;
> > >  
> > >  	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
> > > -	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
> > > -	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
> > > -	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
> > > +	case RING_FORCE_TO_NONPRIV_RANGE_4:
> > > +		range_bit = 4;
> > > +		break;
> > > +	case RING_FORCE_TO_NONPRIV_RANGE_16:
> > > +		range_bit = 6;
> > > +		break;
> > > +	case RING_FORCE_TO_NONPRIV_RANGE_64:
> > > +		range_bit = 8;
> > > +		break;
> > >  	}
> > >  
> > >  	range_start = reg & REG_GENMASK(25, range_bit);
> > >  	range_end = range_start | REG_GENMASK(range_bit, 0);
> > >  
> > >  	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
> > > -	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
> > > -	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
> > > -	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
> > > +	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
> > > +		access_str = "rw";
> > > +		break;
> > > +	case RING_FORCE_TO_NONPRIV_ACCESS_RD:
> > > +		access_str = "read";
> > > +		break;
> > > +	case RING_FORCE_TO_NONPRIV_ACCESS_WR:
> > > +		access_str = "write";
> > > +		break;
> > >  	}
> > >  
> > >  	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
> > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > index 2a6fdd284395..dda963fe3300 100644
> > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > @@ -51,15 +51,14 @@ struct xe_res_cursor {
> > >  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> > >  {
> > >  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> > > +	struct ttm_resource_manager *mgr;
> > >  
> > > -	if (res->mem_type != XE_PL_STOLEN) {
> > > +	if (res->mem_type != XE_PL_STOLEN)
> > >  		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
> > > -	} else {
> > > -		struct ttm_resource_manager *mgr =
> > > -			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > >  
> > > -		return &to_xe_ttm_vram_mgr(mgr)->mm;
> > > -	}
> > > +	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > > +
> > > +	return &to_xe_ttm_vram_mgr(mgr)->mm;
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > index 35fde8965bca..d9acf8783b83 100644
> > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > @@ -47,12 +47,10 @@
> > >   */
> > >  
> > >  /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> > > -#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > > -						   for 2 tile PVC, do a proper
> > > -						   probe sooner or later */
> > > -#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > > -						   for MTL, do a proper probe
> > > -						   sooner or later */
> > > +/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> > > +#define DGFX_WOPCM_SIZE			SZ_4M
> > > +/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> > > +#define MTL_WOPCM_SIZE			SZ_4M
> > >  #define GEN11_WOPCM_SIZE		SZ_2M
> > >  
> > >  #define GEN12_MAX_WOPCM_SIZE            SZ_8M
> > > -- 
> > > 2.34.1
> > > 
