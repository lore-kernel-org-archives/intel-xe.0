Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ED4EB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 23:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540B10E0E6;
	Wed, 14 Jun 2023 23:36:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1231710E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686785772; x=1718321772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6wHh6aQU+MUhjDsTUsLLgowmq8+srmrZ3xEfSNJTu4k=;
 b=U8JiUdcsChTc9i2MGayetyqwCuN7S+2z43g4xN2Zi55XDQy17q9U2fhW
 L7RbMITa4SYr49AqfnFxLGLEvUkHjRWh0ovzS8gqvdNI4ZpGCicRTt/lL
 kWYjdAvmgI2jqdtlyTdhGNxd+Jxgyh+LYeUnfVgFnJrN40if/3h7eDZkp
 Gufi+PP0b/tEYFBtgq+E4BJRhNsS5xZ0W2ryDrI1e/+iRtbTpv9A4Ss6T
 32uinJmrkw9eMsD/6D2doGqr5EZrcZImRDXaumCETntxr/3cFyjGjWuQu
 1MF9xw6N6+XaK152HYrsv8zEwI1gFxO/HY2s/xei8NX/5sWdmNMg7GPrL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343460815"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343460815"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 16:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="662573615"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="662573615"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 14 Jun 2023 16:36:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 16:36:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 16:36:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 16:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmQZ2O9kFTtrp6FWqqTIw/tZZOrFXVxaVFCuzwVIze0igcljXjP4h9adpt9ELGYQojK70ZcPqeK3Tjeb8pygwNcljZo7uTcQqQikDFc+tTSzaX4+8e+Nxb8DQRdMRn4wn9Zcv1+bWICF1qDkAT67KMm3V3Avf1pKx+tSBhmGzJFoy2qVXOLKx6yYhlSUyu3Tpxjlxa7UH6x8Ns6hlY7oQwh8a7tLzKlpDklV6ZZceFZgapd1Lw9+bmkOX5ARTUo40Vzq1BQvTTZ9atslhWg9x+bAkb63FAx8LYwb3u+2xm53qDAs+3gpmhPlZCbzENF8H672uQK+tJY0IJEn14nN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNqvJbqeJ/rrBGLjyQDpAxG+hD5mZ+P548rAUIn06Lo=;
 b=U0r3c7sLMMcih0gxe4eBtIWBclc1vjiDvDVElXDAz9Qx4YSKUBvqv65HIBveF5SpNtSo75r6P7/WTtyh259uaBYup1A4QXO5azj9JLhdqG4kQDRoe/ivTKVJCLIe3VniQ5luD8bovb+U6BTcsAnm8x1WKclMzYNva6UbxmUOLTQ8NM55/76zajZACGGTNQdMjG0o84X0JdJRP1wWyIEwIwixRED3dgIZl6lECjMsMkvLYcsHk9873yC4L0V2mguRVtj0ZbtT+LyC3ScWogEjvl4HA1fDO++5jTAP4QSPIru2sGGqoBLNDVXWcSCjFcVZshr+0i58FWz5ubr9rM4x4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.37; Wed, 14 Jun 2023 23:36:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.043; Wed, 14 Jun 2023
 23:36:04 +0000
Date: Wed, 14 Jun 2023 16:36:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Message-ID: <20230614233601.GT5433@mdroper-desk1.amr.corp.intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
 <20230601000403.432517-3-matthew.d.roper@intel.com>
 <64f52aee-6d7e-1ed2-62de-53e8d028dd04@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <64f52aee-6d7e-1ed2-62de-53e8d028dd04@habana.ai>
X-ClientProxiedBy: BYAPR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::42) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: f328036c-9e81-4622-2bb7-08db6d301e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46h2A1y+Kp4MVeWTwlBPssJA94rugrdy2guamoF8hQb0aqBuAiZPnviQbTNZUpQ6w81nIPqYkcgQlQV4lYJiMopoq94pnawsOm3eON+52Z704WJZXppsTUl2hE2WfrodNRZFV6rxtN9zTKYIMv0LOU31ttLg/q4d7hop8Y3atc1gUSoSMPJjSOBSP5bXsTLK7YyeiAWamOLYK2pZ2KdYOurq9SMJS14/rewoMTQDHGUzMCEbpjnhoLsgfviK1AzFkM4rTRbA0/TN16vYj6ZlrFQcOh5Mp/DDexJ5HPOvKSmH9WaPm7soXFP7bXdDtZVWLUnN7182Odstnbr06byoTkt1+FrHz/uEWwPOu1VGT9i9vLas4YsQ+wP7KXnlJOagnXn74G5a2mI5VYcTM/Qa5hAS+HugF8F211KD6vliK6TyQ7d60FE3ixkyHa5aThWpvzR8CWiNNrj9fVDYv5SkQGcovOkNb7hOvpLLoDcDrgnTNEl8vfHzUibPmEV986DnnOPDMb22wC4kH3mqDnUmKVUtow3Ad3BXz71UIFDaNXTqxw4UHdXIQzHDHVLBh7bt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(38100700002)(478600001)(82960400001)(66946007)(6916009)(4326008)(66556008)(66476007)(86362001)(1076003)(316002)(54906003)(33656002)(6666004)(53546011)(6506007)(30864003)(5660300002)(83380400001)(186003)(107886003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bsMuhmi/5Omz9A5A1zEnuWJ1Jo6tW1zQv486tH4nKryWIr9shWbzhshKPM46?=
 =?us-ascii?Q?oKY2Dk5SymeUG5LQR64mtpVGqnbxKAbWtxsPLHfrLRR8xErnnrnAp4pCKo7g?=
 =?us-ascii?Q?RfQ5vYqpXPJJcDZnY0HS/hKjIt2K1lDYzUdCyDqrvh2jnWpEBR3UP1ur3e8c?=
 =?us-ascii?Q?GfSKmkVqG58R1JlaP4hIR88mAWBxOPlA65qa6Ej1KNS0lrZtyyR96SNYPaSG?=
 =?us-ascii?Q?rv+rlKRWcniuSnb2kvyPE3eKapJnG2TEjYCoYMUvjAlLCUaotWbzBS/sN7Dy?=
 =?us-ascii?Q?c6GNEXEfktwL6Vc7iu8Uu4T2QTb0utj4iH51m3Dd1frmMpN5XbQ5aTr74rDo?=
 =?us-ascii?Q?bbJY50GsXtdRknGdXhyYzw7MN+UgSgL82+7nlDoLDRstJfjWANUpMcqEO23E?=
 =?us-ascii?Q?iTByOja1UfBojkXYHnlMeLLz/XhoKhce9DZpFlPOzGRh/9LHbmNYcayXe1hL?=
 =?us-ascii?Q?e/U4oi8omo8NSTkA+YjCjqN/I70ftLmRXRdCOZAXyo0yf8XMvVAGGVEZLFR3?=
 =?us-ascii?Q?oF0HsGsFTyT8Qc8XmYfZ2mOxJ3m+1M70Hrylr+orKsgpyUKFAj2KKRd13eUb?=
 =?us-ascii?Q?1iGnbzMs1Qy/AzOLfyIwSThsSdgYcuUVEJmi19osgof8y01F68WyAZfl3i6S?=
 =?us-ascii?Q?uIpoOx7bX2txHHQjjlhweuWtOoHKKrUIZgWr+JG9ee8sjBZE+gO4wEG5aGxO?=
 =?us-ascii?Q?t+kVIXdc8XtnBBxymyvuHaOniGCeg/yyaB5pcmhAxPACPoFwSbKqSlXUPLMV?=
 =?us-ascii?Q?GHzRZaco5ClOX4ZLS11BS4e6exv1Ib4pxyKmMYigaKciFOOL4OW4eIYqLCyc?=
 =?us-ascii?Q?5fOCUd08Yjmprg9q/J3TBu/64FFmcDBJbaUED/M7RVsAZvfSNZ4ihzzE2Trp?=
 =?us-ascii?Q?oCxjEgmEu2st3ULj27HGCyazqxn16Bijj4C6YUh9t6GgNCRChpDXwZtSCIYl?=
 =?us-ascii?Q?EC0zkxcmlOTGtViUv1zK71ZkAbkCaO668tb0j3S767kmghxM7tGvlySNSCWT?=
 =?us-ascii?Q?X8i5Ym9FR7qxpZy3JKFq/A2adZDEjfaHYuuWN1XjcpJE5gDAgnd7inNMIBXN?=
 =?us-ascii?Q?qewdMYf3U96nDWA3MiITVRF+C85gSe3Frue6wNdl8MxiG3MCblXRc+xRcmDd?=
 =?us-ascii?Q?BrqIFXicjZ5ueqR9z7XTGVjEqeqbdT+iBW6Jez9Mmc2UwS30AkOwzMgarNS7?=
 =?us-ascii?Q?imcaexkDtFIH3cwlXnA6Gysh8AxLgpehOKrTgMnFJtASL6nlaaKZ9qJB5W50?=
 =?us-ascii?Q?olJBcThVEEWO0FBi2rFKoZRW7WYOd50Qc/42gVVdgyqscsTdeFOYxnD0oCc9?=
 =?us-ascii?Q?SJFLK5LD1cf5qA/Loo8oXorEgdSG90pBsadC6GCZqmVuGD8ATrBMdP1lPqxu?=
 =?us-ascii?Q?AIZI5oHAufQD83IP4FszmQUlPp9cLXA9GJcLEJTBczszRX8dfumGJ7AO0z4p?=
 =?us-ascii?Q?GOaZfbJbS9ivM61gGTR/3VdSdR8kvy4Zy7+63+7asl3IrcDQtx7SeKxFXk7j?=
 =?us-ascii?Q?uE3iegnyhPUL//yfAlp4DXqwr6vaV+Im4dNos5SAnEofZ4t1wEtZCp4svH6q?=
 =?us-ascii?Q?VBpG8ocPoLvioM2ViOFI6BV7joH49MkwT6cQVnCCUCp03cd1qwU4aP0p4FaM?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f328036c-9e81-4622-2bb7-08db6d301e5f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 23:36:04.0873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbziD7eWEc709iy8H/NxoDIyg+PfiClHfBExlxyc9qj8NvhtQcMcTQCfHCkms5vOlGz27bxZR2MCVF4j3qK35n8cFAUo/191HWfepHTMx1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 02/31] drm/xe: Introduce xe_tile
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 10:41:04AM -0700, Ofir Bitton wrote:
> Hey, sorry for jumping in so late, few comments, not a must, we can
> refactor this later.
> 
> On 01/06/2023 3:03, Matt Roper wrote:
> > Create a new xe_tile structure to begin separating the concept of "tile"
> > from "GT."  A tile is effectively a complete GPU, and a GT is just one
> > part of that.  On platforms like MTL, there's only a single full GPU
> > (tile) which has its IP blocks provided by two GTs.  In contrast, a
> > "multi-tile" platform like PVC is basically multiple complete GPUs
> > packed behind a single PCI device.
> >
> > For now, just create xe_tile as a simple wrapper around xe_gt.  The
> > items in xe_gt that are truly tied to the tile rather than the GT will
> > be moved in future patches.  Support for multiple GTs per tile (i.e.,
> > the MTL standalone media case) will also be re-introduced in a future
> > patch.
> >
> > v2:
> >   - Fix kunit test build
> >   - Move hunk from next patch to use local tile variable rather than
> >     direct xe->tiles[id] accesses.  (Lucas)
> >   - Mention compute in kerneldoc.  (Rodrigo)
> >
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/tests/xe_bo.c       |  2 +-
> >   drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++--
> >   drivers/gpu/drm/xe/xe_device.h         | 11 +++++--
> >   drivers/gpu/drm/xe/xe_device_types.h   | 40 ++++++++++++++++++++++++--
> >   drivers/gpu/drm/xe/xe_gt_types.h       | 15 ++++++----
> >   drivers/gpu/drm/xe/xe_mmio.c           | 13 +++++----
> >   drivers/gpu/drm/xe/xe_pci.c            |  7 ++++-
> >   drivers/gpu/drm/xe/xe_vm.c             |  2 +-
> >   drivers/gpu/drm/xe/xe_vm_types.h       |  8 +++---
> >   9 files changed, 78 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 9bd381e5b7a6..6075f12a1962 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -174,7 +174,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
> >       struct xe_bo *bo, *external;
> >       unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
> >               XE_BO_CREATE_VRAM_IF_DGFX(gt);
> > -     struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
> > +     struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->primary_gt.migrate);
> >       struct ww_acquire_ctx ww;
> >       int err, i;
> >
> > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > index ab6f7a47db50..45f2614f91ec 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > @@ -13,6 +13,7 @@
> >
> >   #include "regs/xe_gt_regs.h"
> >   #include "regs/xe_reg_defs.h"
> > +#include "xe_device.h"
> >   #include "xe_device_types.h"
> >   #include "xe_pci_test.h"
> >   #include "xe_reg_sr.h"
> > @@ -236,9 +237,10 @@ static void xe_rtp_process_tests(struct kunit *test)
> >   {
> >       const struct rtp_test_case *param = test->param_value;
> >       struct xe_device *xe = test->priv;
> > -     struct xe_reg_sr *reg_sr = &xe->gt[0].reg_sr;
> > +     struct xe_gt *gt = &xe_device_get_root_tile(xe)->primary_gt;
> > +     struct xe_reg_sr *reg_sr = &gt->reg_sr;
> >       const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
> > -     struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(&xe->gt[0]);
> > +     struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> >       unsigned long idx, count = 0;
> >
> >       xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index cbae480a2092..f7acaf51a1fc 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -48,12 +48,17 @@ static inline struct xe_file *to_xe_file(const struct drm_file *file)
> >       return file->driver_priv;
> >   }
> >
> > +static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> > +{
> > +     return &xe->tiles[0];
> > +}
> > +
> >   static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> >   {
> >       struct xe_gt *gt;
> >
> > -     XE_BUG_ON(gt_id > XE_MAX_GT);
> > -     gt = xe->gt + gt_id;
> > +     XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
> 
> Wouldn't it be robust to check (gt_id > xe->info.tile_count) ?

This code changes a bit later on in the series, although it's still
using build-time constants at the end.  Your suggestion of using runtime
counts (tile_count and/or gt_count) is valid as a follow-up, although
the handling of those counts, as well as how IDs get assigned is an area
where we're still expecting further changes once we settle on exactly
how we want to expose tiles and GTs through the uapi.  There's a good
chance that we won't even be looking up GTs with device-wide IDs anymore
once the uapi changes are in place.

> 
> > +     gt = &xe->tiles[gt_id].primary_gt;
> >       XE_BUG_ON(gt->info.id != gt_id);
> >       XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> >
> > @@ -65,7 +70,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> >    */
> >   static inline struct xe_gt *to_gt(struct xe_device *xe)
> >   {
> > -     return xe->gt;
> > +     return &xe_device_get_root_tile(xe)->primary_gt;
> >   }
> >
> >   static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 51c16d207780..396ee281e499 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -35,7 +35,7 @@
> >
> >   #define XE_GT0              0
> >   #define XE_GT1              1
> > -#define XE_MAX_GT    (XE_GT1 + 1)
> > +#define XE_MAX_TILES_PER_DEVICE      (XE_GT1 + 1)
> 
> This define will change each time we increase tile count.
> I suggest removing this define and use dynamic allocations everywhere
> according to 'tile_count.
> Another (worst) option is to use some higher maximum (32?) and
> initialize only the relevant elements in each array that uses this define.

These defines are driver internal defines; they aren't used anywhere in
the uapi, so having them change occasionally when a new platform shows
up that breaks the old limits is normal and expected; there's no problem
with that.  We could change various internal arrays of constant size to
be dynamically allocated at runtime, but that's a sizeable design and
behavior change to the driver that's orthogonal to the GT vs tile
refactor, so this series wouldn't have been the place to make a change
like that.

However we do need to make XE_MAX_TILES_PER_DEVICE just a direct define
as '2' since that's exactly what we want for now; it shouldn't be based
on those "GT" defines anymore (which themselves should either be changed
to something like XE_GT_PRIMARY / XE_GT_MEDIA or removed entirely).
I'll send a patch or two to clean those up when I get some free time.

> 
> >
> >   #define XE_MAX_ASID (BIT(20))
> >
> > @@ -49,6 +49,40 @@
> >        (_xe)->info.step.graphics >= (min_step) &&                     \
> >        (_xe)->info.step.graphics < (max_step))
> >
> > +#define tile_to_xe(tile__)                                                           \
> > +     _Generic(tile__,                                                                \
> > +              const struct xe_tile *: (const struct xe_device *)((tile__)->xe),      \
> > +              struct xe_tile *: (tile__)->xe)
> > +
> > +/**
> > + * struct xe_tile - hardware tile structure
> > + *
> > + * From a driver perspective, a "tile" is effectively a complete GPU, containing
> > + * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> > + *
> > + * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> > + * device and designate one "root" tile as being responsible for external PCI
> > + * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> > + * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> > + * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> > + * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> > + * have interrupts that need servicing.
> > + */
> > +struct xe_tile {
> > +     /** @xe: Backpointer to tile's PCI device */
> > +     struct xe_device *xe;
> > +
> > +     /** @id: ID of the tile */
> > +     u8 id;
> > +
> > +     /**
> > +      * @primary_gt: Primary GT
> > +      */
> > +     struct xe_gt primary_gt;
> > +
> > +     /* TODO: Add media GT here */
> > +};
> > +
> >   /**
> >    * struct xe_device - Top level struct of XE device
> >    */
> > @@ -256,8 +290,8 @@ struct xe_device {
> >       /** @ordered_wq: used to serialize compute mode resume */
> >       struct workqueue_struct *ordered_wq;
> >
> > -     /** @gt: graphics tile */
> > -     struct xe_gt gt[XE_MAX_GT];
> > +     /** @tiles: device tiles */
> > +     struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
> >
> >       /**
> >        * @mem_access: keep track of memory access in the device, possibly
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 093d650c35f4..456e3e447a2e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -77,12 +77,17 @@ enum xe_steering_type {
> >   };
> >
> >   /**
> > - * struct xe_gt - Top level struct of a graphics tile
> > + * struct xe_gt - A "Graphics Technology" unit of the GPU
> >    *
> > - * A graphics tile may be a physical split (duplicate pieces of silicon,
> > - * different GGTT + VRAM) or a virtual split (shared GGTT + VRAM). Either way
> > - * this structure encapsulates of everything a GT is (MMIO, VRAM, memory
> > - * management, microcontrols, and a hardware set of engines).
> > + * A GT ("Graphics Technology") is the subset of a GPU primarily responsible
> > + * for implementing the graphics, compute, and/or media IP.  It encapsulates
> > + * the hardware engines, programmable execution units, and GuC.   Each GT has
> > + * its own handling of power management (RC6+forcewake) and multicast register
> > + * steering.
> > + *
> > + * A GPU/tile may have a single GT that supplies all graphics, compute, and
> > + * media functionality, or the graphics/compute and media may be split into
> > + * separate GTs within a tile.
> >    */
> >   struct xe_gt {
> >       /** @xe: backpointer to XE device */
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index ef2353eef6fe..9bc5715e9ebe 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -438,6 +438,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >                 struct drm_file *file)
> >   {
> >       struct xe_device *xe = to_xe_device(dev);
> > +     struct xe_gt *gt = xe_device_get_gt(xe, 0);
> 
> Better to have some define for '0' for example 'XE_ROOT_GT_ID'.

This is just patch #2 of a series of 31 patches; this line gets replaced
with

        struct xe_gt *gt = xe_root_mmio_gt(xe);

later in the patch series.


Matt

> 
> Ofir
> 
> >       struct drm_xe_mmio *args = data;
> >       unsigned int bits_flag, bytes;
> >       struct xe_reg reg;
> > @@ -480,7 +481,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >        */
> >       reg = XE_REG(args->addr);
> >
> > -     xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> > +     xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >
> >       if (args->flags & DRM_XE_MMIO_WRITE) {
> >               switch (bits_flag) {
> > @@ -489,10 +490,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >                               ret = -EINVAL;
> >                               goto exit;
> >                       }
> > -                     xe_mmio_write32(to_gt(xe), reg, args->value);
> > +                     xe_mmio_write32(gt, reg, args->value);
> >                       break;
> >               case DRM_XE_MMIO_64BIT:
> > -                     xe_mmio_write64(to_gt(xe), reg, args->value);
> > +                     xe_mmio_write64(gt, reg, args->value);
> >                       break;
> >               default:
> >                       drm_dbg(&xe->drm, "Invalid MMIO bit size");
> > @@ -507,10 +508,10 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >       if (args->flags & DRM_XE_MMIO_READ) {
> >               switch (bits_flag) {
> >               case DRM_XE_MMIO_32BIT:
> > -                     args->value = xe_mmio_read32(to_gt(xe), reg);
> > +                     args->value = xe_mmio_read32(gt, reg);
> >                       break;
> >               case DRM_XE_MMIO_64BIT:
> > -                     args->value = xe_mmio_read64(to_gt(xe), reg);
> > +                     args->value = xe_mmio_read64(gt, reg);
> >                       break;
> >               default:
> >                       drm_dbg(&xe->drm, "Invalid MMIO bit size");
> > @@ -522,7 +523,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >       }
> >
> >   exit:
> > -     xe_force_wake_put(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);
> > +     xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >
> >       return ret;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 6f0c4203fca3..0ecf875e4fb4 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -496,6 +496,7 @@ static int xe_info_init(struct xe_device *xe,
> >       const struct xe_graphics_desc *graphics_desc = NULL;
> >       const struct xe_media_desc *media_desc = NULL;
> >       u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > +     struct xe_tile *tile;
> >       struct xe_gt *gt;
> >       u8 id;
> >
> > @@ -558,7 +559,11 @@ static int xe_info_init(struct xe_device *xe,
> >       xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> >
> >       for (id = 0; id < xe->info.tile_count; ++id) {
> > -             gt = xe->gt + id;
> > +             tile = &xe->tiles[id];
> > +             tile->xe = xe;
> > +             tile->id = id;
> > +
> > +             gt = &tile->primary_gt;
> >               gt->info.id = id;
> >               gt->xe = xe;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index dd1335e12d4c..87416b8bb878 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3389,7 +3389,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >       struct xe_device *xe = vma->vm->xe;
> >       struct xe_gt *gt;
> >       u32 gt_needs_invalidate = 0;
> > -     int seqno[XE_MAX_GT];
> > +     int seqno[XE_MAX_TILES_PER_DEVICE];
> >       u8 id;
> >       int ret;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index fada7896867f..203ba9d946b8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -159,7 +159,7 @@ struct xe_vm {
> >       struct kref refcount;
> >
> >       /* engine used for (un)binding vma's */
> > -     struct xe_engine *eng[XE_MAX_GT];
> > +     struct xe_engine *eng[XE_MAX_TILES_PER_DEVICE];
> >
> >       /** Protects @rebind_list and the page-table structures */
> >       struct dma_resv resv;
> > @@ -167,9 +167,9 @@ struct xe_vm {
> >       u64 size;
> >       struct rb_root vmas;
> >
> > -     struct xe_pt *pt_root[XE_MAX_GT];
> > -     struct xe_bo *scratch_bo[XE_MAX_GT];
> > -     struct xe_pt *scratch_pt[XE_MAX_GT][XE_VM_MAX_LEVEL];
> > +     struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
> > +     struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
> > +     struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
> >
> >       /** @flags: flags for this VM, statically setup a creation time */
> >   #define XE_VM_FLAGS_64K                     BIT(0)
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
