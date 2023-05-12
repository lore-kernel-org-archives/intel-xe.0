Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB91FC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 15:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD0710E19B;
	Fri, 12 May 2023 15:39:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B64310E19B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683905941; x=1715441941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wrvV8/z5e8qhv9Dn7oEwtADEE7hO1HerPohwJLNyRFM=;
 b=j0wOHpFTWYOJe2Udfrk6+KmmihIuW6CskD/gw+GZxOF+m9OR1ThLfKgC
 zdtGiBBDc5gYmJQ1hOt81ohyd1EA74yE68Q1WRoQ82JQOZROCtsfhCexQ
 7iE2YBy56jkEVbF+twIccxM0bEIvXXOchpUmdZQAly9Eo1PAgeUyWnmJd
 Hcvc796AGQN/DSRYVXbcNHOC3+l0FKOl4KxFUS6VaAJyUbHO3qO1hrBes
 ELDSw2rFBFEGa6YWQzQRdw7QauH5DdN/Jgr/IVx73T8Um+5vlBMSRnuO4
 yLMhITWF4d/yqT+FhaNTYgUc+bQx7k3V38AZ7l8UUbY7YdJFZDP43E26S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331178437"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331178437"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 08:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812123055"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="812123055"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 08:38:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 08:38:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 08:38:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 08:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLmWUoXlemFH295hRmMMiOPMCzmszshL6k2P8F7Rgtutm61ZNnmUNOgy8aK6DD7oKDZ34sXYKy9WDFCX3BoxApuffH+xBGWMPOH+P7o0+GIPXLpT/xlhiGZCROL1YobKqGLXscl+wSSwXy/WablpjcWIo7v3ICD1IuCOKZNsxqOtH3kf6+qaPsIpv12PidmXM4gDKiz/OW2GY8EBzSlP/LDFdqTgv8MActB3jIdZVszxrZiAnCLoaUDvd7OCiVH057gApC9KRrIwBLICp1INgBqmcYZdxcq0SPyRRYAJDv1RRPBvFuDnIFwWTvToGd56l40bBO/y/o79LBo06J804A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL3TxDdrLU4gmHTeXmFx95FdkvdcTLwIoCwmQXxNO5I=;
 b=kWA1OXuiuDF25Ygh7Dapeja8OCfJ6rEa+Q52ck4/cvXdfALW1fe7Ji6LyIVxTXfC6T9Po59hH7+caUHoR3MyfWwIMH4sube4OYt5gFXohofkOP0wNWD2S6f1Uep/TGjpqoALXSTQ982KnfrmNhsi5Pci2sWxIjjUq+7e8w04Pczo07izWOZb4w3GzgQ8AODFVCuQI0vtzeyqs9yxHFXxBmsAAu/oeB3NzGgZFDAPizn9phWMyvMSFzqby9eJmDHuUZInsoHG2dk29gxACnj+YSJGjULKQb5wcelpxcMACQwPEuSUEDumFJZAnMVn3T1M7LlGS8HeSNkkixscBhMDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.20; Fri, 12 May 2023 15:38:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Fri, 12 May 2023
 15:38:52 +0000
Date: Fri, 12 May 2023 08:38:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230512153849.GT6250@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-2-matthew.d.roper@intel.com>
 <4yoscvqo3xq6my647273h25mqnx23ena7mcnj7vvog3k4o2ane@azity4pbplx2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4yoscvqo3xq6my647273h25mqnx23ena7mcnj7vvog3k4o2ane@azity4pbplx2>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: daaebbe8-8d2d-4c8c-e11b-08db52fefca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVz4o0wXedvdTacLbwc1f5x3NGcmwE8cnqjU1UM6c4/3Dm80Lx+/V+f0Kc1WsBtBv2a/CVzo8LuXcnP100tv8FtKu3+h7qvvdaFLA60Pv1DYxgMyxDFUlBVQipSesbWsD6tsivhWLYD8duK+vy6hMVdi8Du1TcoEZtqxoeJoe8zBBF1501yOywVKxPrmR1j3VB5u0Urk6Sd2disbRkggy/nGv9EMy8G1XxNm8emd5DvxjXlNIzPsfjlwpVGo4Ta3IIJDW/w+9eJTvm5DRb1YGtEmPbypKbYs+/D7idzhMkNv9mQg8hZ3nSc5MZmrFeagGqeHKg4hxVer/desH+ILwtJUzM00m0CBE29ErlDJowZ1V8T3211OPWaIaXFUeszg5969XuaJceVDs2mJ0jT6sZS2aYQPA12l3V0GLrtD9g2KbrY8xgToJKl/2px/11gllnydk0u9q6kDXK8ipSSi5xCvFtnyocA5lcBYnA9L+kkTdUhINAxVXJHQkey4ohp3ykXxeaZcB55rVG3cjCk7MU69ZFwqDOYKf56FPMuMwMdGr4OZKqz0KGGp4VO0U76T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199021)(4326008)(316002)(82960400001)(6636002)(83380400001)(5660300002)(66476007)(2906002)(41300700001)(6486002)(86362001)(66946007)(66556008)(6666004)(33656002)(1076003)(26005)(6512007)(38100700002)(6506007)(8676002)(8936002)(6862004)(186003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m8wkTjZRCmyhW9NKd5XKw/p2QwvZOEt8QqmvZTifEZ4ZMzgAt8gf17iU+5qN?=
 =?us-ascii?Q?03GqVglecTUP7sox++xz0sk0TI+hNMiWEybCj9aFiTLnQq6V71tqFY5FjhZQ?=
 =?us-ascii?Q?YNIvF6FfGk9T3v+f6TTubPcYuyo8/unolLaRHL4rlD5xxvW4GrCX3uOWvibn?=
 =?us-ascii?Q?jGccnDeKVZpHIAvaZ0dZc4dIM5IocJHjqGIARD+v5riaVkOprvTII2SfWDXb?=
 =?us-ascii?Q?baDGVq4TTUr/UM65eERMVNgBeT7zjliiFITmuRHicy3LyldyD6cJUfHk9O52?=
 =?us-ascii?Q?s6XeCItmvH1y0Kq1nqK+VC2KafcK0AKWVQAxzBJaoTTNFDV5WrHKbcXsh7Y5?=
 =?us-ascii?Q?Ww74XAQURKwhjGFTxzDXCP9Wck5nxd6zzMZ+MFVwfng0rFd6/Bsmspi76uIS?=
 =?us-ascii?Q?c01s6IvM5sWauRz2cPXfzTv71nO0rzneQ3O6qOjqQ3aE1cBTLORwBl0x899c?=
 =?us-ascii?Q?blAKxHRmrdsJHVdch9JPwhejEiUTDKfYymZN+wyXisoWCLneQ1OlhmK6FdlT?=
 =?us-ascii?Q?xqCGzDzx1iwCUJfk4km/pAkjgDe1cPR/Ti6v8v3Zig/0mA9OoFT7EPzlF/bo?=
 =?us-ascii?Q?s4Ue06hbjhuxhocpIFNLgPxYghRe/zfFiMfSVYHLU5MQV3HuaZfU6EovQVSc?=
 =?us-ascii?Q?2Ok8D1mS2mlse65M5rfYT66S3+QWbjW0XGzYGNEKT9j87Zzkm+OTYj0YO4vz?=
 =?us-ascii?Q?R9mz1UVTYSNLkbsQHHfZB+kWNdwbcmX76riSLALY8u3DmLKbulAFJnMgS1sI?=
 =?us-ascii?Q?Fpt5tjrbKlzpOO2akB7cP04VbvK7SWLi6BlyhEwIAuy9OLWbuDwA2rGNx7kc?=
 =?us-ascii?Q?19CTI+G6La6iouEIc6yTyQFGzx5FQNEYfVDcneqC19YEXTbT2DR5zKnFHPRF?=
 =?us-ascii?Q?pkGwDD4OmEYxffFW1xpX3RDUIwviS8UuJKauXrlEqUogyp7C+mTpOX03clHl?=
 =?us-ascii?Q?pYd69OdGF3LiaG/cKoUteoyqh8+4jvplq8U/xNBeTIFy5EJzQrM2DrhXEtmx?=
 =?us-ascii?Q?+hzyjIkQWjsIcno7V1kgA1PupZX60C8KKNIMAb9MuWLn2OaLkB7SOEBe4Dng?=
 =?us-ascii?Q?0PD8LbMZCaO6wdCaNTDWBP5eVb6vze/h9Eqv3H52DxcOSbe8MS6YvVWww5FE?=
 =?us-ascii?Q?QEnZPqVm9CHkRH8cXe3H24DXzAkTnj/kGTHSYl6S76oJ37LRnF7ldqUkjygk?=
 =?us-ascii?Q?hcAgA4T4go33dnwSpiVpYELD6L2qqxh6zydxFWG/1Mq++Z68ptO6SvtMgfya?=
 =?us-ascii?Q?Jo8FO69lQr3Gb7wEmZNQ9GmFdltW9KbQYb2bEF66RJYoy0bsm0smRfICJ5ed?=
 =?us-ascii?Q?/E2SmY7vI7BNRXU1YRTcLonesjHUXNtijpGfIpOkMF+3DyVo/8yX9jd3bgNB?=
 =?us-ascii?Q?QapYj43Vcq5NTZVjn/rls3TqhF61otE+4DOv+Ze9nQuP22OcEDiyxAkWs0QH?=
 =?us-ascii?Q?k8kzoArg1kOR54fJMYrXMmiH3JtNAAWJNfaaAaibhhyrn+js+nw4lvOlvNSL?=
 =?us-ascii?Q?80ft1lQHZymxdXqYq6Y9cPaoXncefXYbEh8EA8CHpYL2zOljdmjUSjd2uR9B?=
 =?us-ascii?Q?Gym7We+ZQ4dRq1ndhhmvLPPe/XuX79BXNjqkTg92unjpmve5HcLyjqRanRR7?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daaebbe8-8d2d-4c8c-e11b-08db52fefca1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 15:38:51.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kmxfN77n3izdzTkvBiwIXeIsRbn1CPhwLs3Vs6WMP7Xbprl5oxMoHJbGPOGh8wbCWQw+HoYNZDw/nWXG96ldcEQ+5+duYrn6zZg7KaMhAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/26] drm/xe/mtl: Disable media GT
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

On Thu, May 11, 2023 at 04:29:55PM -0700, Lucas De Marchi wrote:
> On Wed, May 10, 2023 at 08:46:57PM -0700, Matt Roper wrote:
> > Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
> > media support is not yet functioning properly, let's just disable it
> > completely for now while we fix the fundamental driver design.  Support
> > for media GTs on platforms like MTL will be re-added later.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_mcr.c |  2 +-
> > drivers/gpu/drm/xe/xe_mmio.c   |  2 --
> > drivers/gpu/drm/xe/xe_pci.c    | 15 ++-------------
> > 3 files changed, 3 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 3db550c85e32..be80fdc4b5a2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -293,7 +293,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
> > 
> > 	spin_lock_init(&gt->mcr_lock);
> > 
> > -	if (gt->info.type == XE_GT_TYPE_MEDIA) {
> > +	if (xe_gt_is_media_type(gt)) {
> 
> was there a squashing issue here?  if media GT is being removed,
> why are you replacing the gt type check xe_gt_is_media_type()?
> Shouldn't you then remove xe_gt_is_media_type() is all this branch here
> since it's for MEDIA_VER(xe) >= 13?
> 
> or just leave this branch as is...

Yeah, I think it's more a matter of me changing directions while I was
working on this and not completely removing all traces of the original
attempt.  In the next version I'll drop out the unnecessary changes (and
maybe add them back as a later patch, since they are a legitimate
cleanup on their own).


Matt

> 
> > 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
> > 
> > 		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index c7fbb1cc1f64..4804616a3c44 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -301,8 +301,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
> > 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
> > 	adj_tile_count = xe->info.tile_count =
> > 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> > -	if (xe->info.media_verx100 >= 1300)
> > -		xe->info.tile_count *= 2;
> > 
> > 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
> > 		 xe->info.tile_count, adj_tile_count);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index a6858fc7fe8d..bf2c234c4f6e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -19,6 +19,7 @@
> > #include "xe_device.h"
> > #include "xe_display.h"
> > #include "xe_drv.h"
> > +#include "xe_gt.h"
> > #include "xe_macros.h"
> > #include "xe_module.h"
> > #include "xe_pci_types.h"
> > @@ -271,20 +272,10 @@ static const struct xe_device_desc pvc_desc = {
> > 	.extra_gts = pvc_gts,
> > };
> > 
> > -static const struct xe_gt_desc xelpmp_gts[] = {
> > -	{
> > -		.type = XE_GT_TYPE_MEDIA,
> > -		.vram_id = 0,
> > -		.mmio_adj_limit = 0x40000,
> > -		.mmio_adj_offset = 0x380000,
> > -	},
> > -};
> > -
> > static const struct xe_device_desc mtl_desc = {
> > 	/* .graphics and .media determined via GMD_ID */
> > 	.require_force_probe = true,
> > 	PLATFORM(XE_METEORLAKE),
> > -	.extra_gts = xelpmp_gts,
> > };
> > 
> > #undef PLATFORM
> > @@ -528,8 +519,6 @@ static int xe_info_init(struct xe_device *xe,
> > 	 * treats it as the number of GTs rather than just the number of tiles.
> > 	 */
> > 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> > -	if (MEDIA_VER(xe) >= 13)
> > -		xe->info.tile_count++;
> > 
> > 	xe->info.subplatform = subplatform_desc ?
> > 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > @@ -553,7 +542,7 @@ static int xe_info_init(struct xe_device *xe,
> > 		} else {
> > 			gt->info.type = desc->extra_gts[id - 1].type;
> > 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> > -			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
> > +			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?
> 
> same thing here. /me confused
> 
> The rest of the patch makes sense and we could leave these lines alone.
> It seems the main goal of this patch is actually to free up the
> tile_count to be used with proper tile in later patches rather than gt.
> 
> Lucas De Marchi
> 
> > 				media_desc->hw_engine_mask :
> > 				graphics_desc->hw_engine_mask;
> > 			gt->mmio.adj_limit =
> > -- 
> > 2.40.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
