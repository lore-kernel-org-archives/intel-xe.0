Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B151C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 15:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5372110E17C;
	Tue, 30 May 2023 15:58:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874DA10E17C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685462310; x=1716998310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZEafKgEjZAWxgq94NMJdmZXWIx3Bd7dOvHa12w4gOHQ=;
 b=P3xaize6EVve/LCm3dvTgpTokzeDrKW7ZShOZh8YhL7qcdC3U4wwO4kk
 SdFDh1BeHwnnN/Pc05UD/H6jGerl2PwLEmDRpjVZADHMROY+9O82onElu
 sWSwTeOBSISDSjpWrIfmEWmjZY0baD/Z+AnMGrvhinP+GE1uXLK24zYnh
 V5AiIESDTaI1X4HK6O5+9GdI33gdbCNiDusu3y1aN4edMLFptTNUqtYD8
 eJ+w3MpyBmcTaF3remZoKd/fzNbpKIFhaob1xSdE8yBmcgu3eYHeEWgFl
 dR3NcqveGrg0LFYgDCqcF/Dwe83HvSeeFU2l1W21aZfGHpNa5GFraKejd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353801163"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="353801163"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 08:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="1036647001"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="1036647001"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 30 May 2023 08:58:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 08:58:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 08:58:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 08:58:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 08:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+UMNoBcw7/30YwSDvR2fR9JTGzcEJGWpZWMOakfQkPV520ECfZViOgBW+085KT0t7SdsAnPoqdCpKy3XHMRHimTg8a1zBruvLadLeTuXFaLnZMP/PWlBJtzD2Xd8AK4jwmHbpdZ2QLJ5hJiTJF5r6ireJa1NXUZmI44UtpWMvKr7D+Lk4qRS4FKWSKsuVAwmeaXDsKHPEJpJY7OKW3SvADKP4J4SZmziAOZ/ctlHdYTiFF6nX1GuFw4PQ+tyjKuViZwWwjmN0DFTfNL/fK8yR/UYiL1V2Cim3PDP/ukhLcbbrcoiv931ynI/d8FFPs0wIqzKW0R6eq/WIBcqHSp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ago+q8BKrukbWNAHVyrVDEbwQvhSFkXkm4uIVnLGlOo=;
 b=Vv8pFVn0GWmGzk+UKLuOQ+AyqbE0Xz++Ldt/BsZu8GN6obtpn8ytUkuDzR7TJDp9AK5LGuQLuDNi1wPyKIsgVt9y1NhJppbuyiswPK6TdnjJrAxv06nzcx/DoQNoYjE9UT0yy928kjI7L+A93GfuoaxnxsKlAfDPiHPNATISDVSy/438I/ljbdq5FFPbWQhzyW5ajtTYvNR4YfkxXi55zPo2DjQ5vzApVx0z1rksK8qe20+mVCEXrkKmZ+pB2mzkmZr5CDPPMRM4XXkXvaqYOVg2Tl5aaoQBaSUhZ9sfg1LXdENEsaA3mppE9/OzehvfBcv0gPvbHK+6PR85sbOQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Tue, 30 May 2023 15:58:24 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 15:58:24 +0000
Date: Tue, 30 May 2023 08:58:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <20230530155821.GQ10045@mdroper-desk1.amr.corp.intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-21-matthew.d.roper@intel.com>
 <7a5e9234-033e-3090-894b-115fb83de201@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7a5e9234-033e-3090-894b-115fb83de201@intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 054bddf2-b86b-42ab-163b-08db6126b306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dqT3CG8wIoJQXW2mXaWWdnqcv2o12tLkfbJEC1nW94sdi8RIuR3bhyFo3zATkwinUe2P4s9ZZX0SVbkBhk5HotFZgtUxDgc3uOzIx/3PQFC119mwo5S7kffNSi7CJPGnTYaGmAY5bOgbji5ot+IX6ydV8wdSxd8gPX+TIDKWE1Mi1xivHp4enhrBHkTtxn3TdL3CauckBq6bJ76ESpEnEY+MJ1nZihQfYxQvmUBBnzFhJ4MGBeabpnVQnQh8K8MUexYK+aQV81i0j5bSDM1x9tGcgmvTV16mBX61vL6diZHZAlQSKKpZonNhpnx0Qjjx12FumR/Gx1AV4yrTfZB1ZzzYixlgElBL6sTdjjKGy81HKT9sZpGhVeM3wkI5oFYnVvwidayXC6qNftu8rdQeZmiuHl7alnUJf9vQxW+JDrxUD0uTlC2toLJpPACvnPcVUaDC40xYEetbhcaZTuHSmFEUxTJ/a8u90A0x1qZjOTKKLLFA1XHwY0uAbs6UmDhPqZdMoqqwfhM3ecsvehQWaxKaSTbYZriq9H7dBUjGFwWvxMgyTGKlvw3prV+OhuNi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199021)(1076003)(26005)(186003)(53546011)(6486002)(6512007)(6506007)(316002)(33656002)(30864003)(6666004)(2906002)(5660300002)(41300700001)(6862004)(8936002)(8676002)(478600001)(82960400001)(38100700002)(66899021)(4326008)(6636002)(86362001)(66946007)(66556008)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gGY7FR2oOOsxEh99f7aEjJvAriGTRhzjBjEyK/bcXiLzyB8LLFpt6pJQhEW?=
 =?us-ascii?Q?AayBqspSr5j3w2Sonlzv0avgIl96xEU6K5CLBFzac73ivzdAUIbjKiz9dJTr?=
 =?us-ascii?Q?h8GD0EaS17rmDozJ9Kbl4mpgijHlg2FPy4m/HXyg/FV3e+qI0Wt10S5LeiJ7?=
 =?us-ascii?Q?6AJDHy4pKunNZY+CEwHjKSJUT8wRuLA0K1QHjorCdHA06+sH8972f/Wpj1NW?=
 =?us-ascii?Q?8614pvutQtf3rK+xJXzpViB4YtYwlixLw8+SteZrC4rNOArwsO+ISI067ILE?=
 =?us-ascii?Q?h+7UoSCvQ2Kh1/UUC4FIBcOtvKWpedvTQvRFZK//ytmSM32tr6Uw1aN7SUPj?=
 =?us-ascii?Q?q6Pc7YjcaZksvej3KKMsrMy6Dm4Lzuj8oyePqkQAkTHpJx56ajkl/eP8pqDO?=
 =?us-ascii?Q?ociLoo8M0iUPJhRzg43pO9Q3rubulK4yD+NyzLlqShXYZKmmLSDYBjx3GcZr?=
 =?us-ascii?Q?lQ+PVyIk769HQtCXgIh/TiyvhuU5aP3VEJ69Kkw4Qp3rDwEM+R2u6juWZkMd?=
 =?us-ascii?Q?yus+FO0FflnaDP6V+l8bldxlsZOxF4PeUGl4JplAQq+wb2cKdkRRGYEZJONw?=
 =?us-ascii?Q?XDGPK2p3ASKQOIgU0hAARGrkQJgYgYLNZ+P/WwW4akF1CJJMMwWDmOEftZ2B?=
 =?us-ascii?Q?afUw/oINTPt4oFLRhSsWudQabIe6YzwA8XVk0bF+Ge2S+/Fpeas+8b8QeZHA?=
 =?us-ascii?Q?SB8xj35qcSVxYsV7T6t/L5acgt1eAjFFmmcCeH4tSlFNGbazFjHu3iA9JWTM?=
 =?us-ascii?Q?i1Bb1eKfhNIf7zjQHcwRzbV9orIo1SjH42jApc+AfhSazD2FFPwFryS1Ad/n?=
 =?us-ascii?Q?bnZ5BFH4sAuWQtjVtATMO6pSQ6xF1PoOEgHDCXPQMWIHX28RU3wgkBjAW2e+?=
 =?us-ascii?Q?e+fuR/F31G22TkyD9bD96/LpbjeaEcGfrCR4YL04vaDFy4xvsagjBMHK0GUI?=
 =?us-ascii?Q?pvmCdM0MCBgVpCgjkgrJ9FRNIBnkvRwU1H/CzRQp8Up5vEL97aeAXR0Fi8VA?=
 =?us-ascii?Q?4Y7+MtBO4BU5GW7kJvpi7AItTFnDw/dS+YysviEL6f0M20g6Oqoug5geNbVY?=
 =?us-ascii?Q?GdQGwqsFAa1CH+B+UV8596Y8/E9IMBMqYVozBoVTD15fpe9oIU1VP72qxn29?=
 =?us-ascii?Q?ZDorEg/RG2Gi2fd4BIETVjNt1Ed8ATCeWxCme+EVHp4NZ46USnrIzpQHUja0?=
 =?us-ascii?Q?kazG8dDDYXlG+BeX2/tCqGiOM8ALbjudsBD7Q3oGnMeLPEPxviKbBDpvKZ23?=
 =?us-ascii?Q?fmjfYfwd/ZZaOWzciW0qfKKhpSmI+9lZRE0P8P8huqp9M3oUj5OGNaNO+OaZ?=
 =?us-ascii?Q?Rj7B0Zqt2oMXpHFWBA+0757BuBmlHncPQt1Jwe+1LlaI0KQ0a9aVTOQ4WjFV?=
 =?us-ascii?Q?UuvKZ4GbHa5jH3CfxKGNobDNi9kPT8s5XbtFhQYNuXX/4IPZDCgUCJKLy3s8?=
 =?us-ascii?Q?fVcOcl+gJhl3BJtyY60gu4EHa8rP0oDzuN1/Eh+bgqhtTLC2n+LqVG4ByJOs?=
 =?us-ascii?Q?tntLqbaJNOKGtNOJBOg1PPEoOM/PJ3APXE9co8/frN0gyy0bNNW7f5Rp1Pgo?=
 =?us-ascii?Q?9Ogjp/WbLGoBbOMdZka50LjbfhlLJf8lxRwDSppPbZELNIK6Kh7OX9g9xQoJ?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 054bddf2-b86b-42ab-163b-08db6126b306
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:58:24.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaAA/sxXrpiedg4JXDF7vVl38uywJUrZK1Hzmd3qKKYy0M1VaFRs8ofX0pFG0ue8CHH4+etXY4mMhdjLTMu2WPpJ8B/IDBAn1sDlBD6EDRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 20/30] drm/xe: Interrupts are delivered
 per-tile, not per-GT
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

On Tue, May 30, 2023 at 12:06:39PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 20-05-2023 04:48, Matt Roper wrote:
> > IRQ delivery and handling needs to be handled on a per-tile basis.  Note
> > that this is true even for the "GT interrupts" relating to engines and
> > GuCs --- the interrupts relating to both GTs get raised through a single
> > set of registers in the tile's sgunit range.
> > 
> > On true multi-tile platforms, interrupts on remote tiles are internally
> > forwarded to the root tile; the first thing the top-level interrupt
> > handler should do is consult the root tile's instance of
> > DG1_MSTR_TILE_INTR to determine which tile(s) had interrupts.  This
> > register is also responsible for enabling/disabling top-level reporting
> > of any interrupts to the OS.  Although this register technically exists
> > on all tiles, it should only be used on the root tile.
> > 
> > The (mis)use of struct xe_gt as a target for MMIO operations in the
> > driver makes the code somewhat confusing since we wind up needing a GT
> > pointer to handle programming that's unrelated to the GT.  To mitigate
> > this confusion, all of the xe_gt structures used solely as an MMIO
> > target in interrupt code are renamed to 'mmio' so that it's clear that
> > the structure being passed does not necessarily relate to any specific
> > GT (primary or media) that we might be dealing with interrupts for.
> > Reworking the driver's MMIO handling to not be dependent on xe_gt is
> > planned as a future patch series.
> > 
> > Note that GT initialization code currently calls xe_gt_irq_postinstall()
> > in an attempt to enable the HWE interrupts for the GT being initialized.
> > Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
> > does a bunch of other stuff unrelated to the GT interrupts (such as
> > enabling the top-level device interrupts).  That will be addressed in
> > future patches.
> > 
> > v2:
> >  - Clarify commit message with explanation of why DG1_MSTR_TILE_INTR is
> >    only used on the root tile, even though it's an sgunit register that
> >    is technically present in each tile's MMIO space.  (Aravind)
> >  - Also clarify that the xe_gt used as a target for MMIO operations may
> >    or may not relate to the GT we're dealing with for interrupts.
> >    (Lucas)
> > 
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> >  drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> >  drivers/gpu/drm/xe/xe_irq.h |   4 +-
> >  3 files changed, 187 insertions(+), 153 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 0abd0d912610..290935e46059 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -304,7 +304,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  	gt->info.engine_mask = gt->info.__engine_mask;
> >  
> >  	/* Enables per hw engine IRQs */
> > -	xe_gt_irq_postinstall(gt);
> > +	xe_gt_irq_postinstall(gt_to_tile(gt));
> >  
> >  	/* Rerun MCR init as we now have hw engine list */
> >  	xe_gt_mcr_init(gt);
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 654c34a5b99a..ad2f73b2a031 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -27,60 +27,66 @@
> >  #define IIR(offset)				XE_REG(offset + 0x8)
> >  #define IER(offset)				XE_REG(offset + 0xc)
> >  
> > -static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
> > +static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
> >  {
> > -	u32 val = xe_mmio_read32(gt, reg);
> > +	u32 val = xe_mmio_read32(mmio, reg);
> >  
> >  	if (val == 0)
> >  		return;
> >  
> > -	drm_WARN(&gt_to_xe(gt)->drm, 1,
> > +	drm_WARN(&gt_to_xe(mmio)->drm, 1,
> >  		 "Interrupt register 0x%x is not zero: 0x%08x\n",
> >  		 reg.addr, val);
> > -	xe_mmio_write32(gt, reg, 0xffffffff);
> > -	xe_mmio_read32(gt, reg);
> > -	xe_mmio_write32(gt, reg, 0xffffffff);
> > -	xe_mmio_read32(gt, reg);
> > +	xe_mmio_write32(mmio, reg, 0xffffffff);
> > +	xe_mmio_read32(mmio, reg);
> > +	xe_mmio_write32(mmio, reg, 0xffffffff);
> > +	xe_mmio_read32(mmio, reg);
> >  }
> >  
> >  /*
> >   * Unmask and enable the specified interrupts.  Does not check current state,
> >   * so any bits not specified here will become masked and disabled.
> >   */
> > -static void unmask_and_enable(struct xe_gt *gt, u32 irqregs, u32 bits)
> > +static void unmask_and_enable(struct xe_tile *tile, u32 irqregs, u32 bits)
> >  {
> > +	struct xe_gt *mmio = tile->primary_gt;
> > +
> >  	/*
> >  	 * If we're just enabling an interrupt now, it shouldn't already
> >  	 * be raised in the IIR.
> >  	 */
> > -	assert_iir_is_zero(gt, IIR(irqregs));
> > +	assert_iir_is_zero(mmio, IIR(irqregs));
> >  
> > -	xe_mmio_write32(gt, IER(irqregs), bits);
> > -	xe_mmio_write32(gt, IMR(irqregs), ~bits);
> > +	xe_mmio_write32(mmio, IER(irqregs), bits);
> > +	xe_mmio_write32(mmio, IMR(irqregs), ~bits);
> >  
> >  	/* Posting read */
> > -	xe_mmio_read32(gt, IMR(irqregs));
> > +	xe_mmio_read32(mmio, IMR(irqregs));
> >  }
> >  
> >  /* Mask and disable all interrupts. */
> > -static void mask_and_disable(struct xe_gt *gt, u32 irqregs)
> > +static void mask_and_disable(struct xe_tile *tile, u32 irqregs)
> >  {
> > -	xe_mmio_write32(gt, IMR(irqregs), ~0);
> > +	struct xe_gt *mmio = tile->primary_gt;
> > +
> > +	xe_mmio_write32(mmio, IMR(irqregs), ~0);
> >  	/* Posting read */
> > -	xe_mmio_read32(gt, IMR(irqregs));
> > +	xe_mmio_read32(mmio, IMR(irqregs));
> >  
> > -	xe_mmio_write32(gt, IER(irqregs), 0);
> > +	xe_mmio_write32(mmio, IER(irqregs), 0);
> >  
> >  	/* IIR can theoretically queue up two events. Be paranoid. */
> > -	xe_mmio_write32(gt, IIR(irqregs), ~0);
> > -	xe_mmio_read32(gt, IIR(irqregs));
> > -	xe_mmio_write32(gt, IIR(irqregs), ~0);
> > -	xe_mmio_read32(gt, IIR(irqregs));
> > +	xe_mmio_write32(mmio, IIR(irqregs), ~0);
> > +	xe_mmio_read32(mmio, IIR(irqregs));
> > +	xe_mmio_write32(mmio, IIR(irqregs), ~0);
> > +	xe_mmio_read32(mmio, IIR(irqregs));
> >  }
> >  
> > -static u32 xelp_intr_disable(struct xe_gt *gt)
> > +static u32 xelp_intr_disable(struct xe_device *xe)
> >  {
> > -	xe_mmio_write32(gt, GFX_MSTR_IRQ, 0);
> > +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > +
> > +	xe_mmio_write32(mmio, GFX_MSTR_IRQ, 0);
> >  
> >  	/*
> >  	 * Now with master disabled, get a sample of level indications
> > @@ -88,36 +94,41 @@ static u32 xelp_intr_disable(struct xe_gt *gt)
> >  	 * New indications can and will light up during processing,
> >  	 * and will generate new interrupt after enabling master.
> >  	 */
> > -	return xe_mmio_read32(gt, GFX_MSTR_IRQ);
> > +	return xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> >  }
> >  
> >  static u32
> > -gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> > +gu_misc_irq_ack(struct xe_device *xe, const u32 master_ctl)
> >  {
> > +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >  	u32 iir;
> >  
> >  	if (!(master_ctl & GU_MISC_IRQ))
> >  		return 0;
> >  
> > -	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_OFFSET));
> > +	iir = xe_mmio_read32(mmio, IIR(GU_MISC_IRQ_OFFSET));
> >  	if (likely(iir))
> > -		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_OFFSET), iir);
> > +		xe_mmio_write32(mmio, IIR(GU_MISC_IRQ_OFFSET), iir);
> >  
> >  	return iir;
> >  }
> >  
> > -static inline void xelp_intr_enable(struct xe_gt *gt, bool stall)
> > +static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
> >  {
> > -	xe_mmio_write32(gt, GFX_MSTR_IRQ, MASTER_IRQ);
> > +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > +
> > +	xe_mmio_write32(mmio, GFX_MSTR_IRQ, MASTER_IRQ);
> >  	if (stall)
> > -		xe_mmio_read32(gt, GFX_MSTR_IRQ);
> > +		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> >  }
> >  
> > -static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> > +static void gt_irq_postinstall(struct xe_tile *tile)
> >  {
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_gt *mmio = tile->primary_gt;
> >  	u32 irqs, dmask, smask;
> > -	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> > -	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> > +	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
> > +	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
> >  
> >  	if (xe_device_guc_submission_enabled(xe)) {
> >  		irqs = GT_RENDER_USER_INTERRUPT |
> > @@ -133,57 +144,57 @@ static void gt_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >  	smask = irqs << 16;
> >  
> >  	/* Enable RCS, BCS, VCS and VECS class interrupts. */
> > -	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
> > -	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
> > +	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> > +	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
> >  	if (ccs_mask)
> > -		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
> > +		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
> >  
> >  	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
> > -	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
> > -	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
> > +	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
> > +	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> >  	if (bcs_mask & (BIT(1)|BIT(2)))
> > -		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> >  	if (bcs_mask & (BIT(3)|BIT(4)))
> > -		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> >  	if (bcs_mask & (BIT(5)|BIT(6)))
> > -		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> >  	if (bcs_mask & (BIT(7)|BIT(8)))
> > -		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> > -	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
> > -	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
> > -	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> > +	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
> > +	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
> > +	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
> >  	if (ccs_mask & (BIT(0)|BIT(1)))
> > -		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> >  	if (ccs_mask & (BIT(2)|BIT(3)))
> > -		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
> > +		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
> >  
> >  	/*
> >  	 * RPS interrupts will get enabled/disabled on demand when RPS itself
> >  	 * is enabled/disabled.
> >  	 */
> >  	/* TODO: gt->pm_ier, gt->pm_imr */
> > -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> > -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> > +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> > +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
> >  
> >  	/* Same thing for GuC interrupts */
> > -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE, 0);
> > -	xe_mmio_write32(gt, GUC_SG_INTR_MASK,  ~0);
> > +	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
> > +	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
> >  }
> >  
> > -static void xelp_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> > +static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> >  {
> >  	/* TODO: PCH */
> >  
> > -	gt_irq_postinstall(xe, gt);
> > +	gt_irq_postinstall(tile);
> >  
> > -	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> > +	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> >  
> > -	xelp_intr_enable(gt, true);
> > +	xelp_intr_enable(xe, true);
> >  }
> >  
> >  static u32
> >  gt_engine_identity(struct xe_device *xe,
> > -		   struct xe_gt *gt,
> > +		   struct xe_gt *mmio,
> >  		   const unsigned int bank,
> >  		   const unsigned int bit)
> >  {
> > @@ -192,7 +203,7 @@ gt_engine_identity(struct xe_device *xe,
> >  
> >  	lockdep_assert_held(&xe->irq.lock);
> >  
> > -	xe_mmio_write32(gt, IIR_REG_SELECTOR(bank), BIT(bit));
> > +	xe_mmio_write32(mmio, IIR_REG_SELECTOR(bank), BIT(bit));
> >  
> >  	/*
> >  	 * NB: Specs do not specify how long to spin wait,
> > @@ -200,7 +211,7 @@ gt_engine_identity(struct xe_device *xe,
> >  	 */
> >  	timeout_ts = (local_clock() >> 10) + 100;
> >  	do {
> > -		ident = xe_mmio_read32(gt, INTR_IDENTITY_REG(bank));
> > +		ident = xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
> >  	} while (!(ident & INTR_DATA_VALID) &&
> >  		 !time_after32(local_clock() >> 10, timeout_ts));
> >  
> > @@ -210,7 +221,7 @@ gt_engine_identity(struct xe_device *xe,
> >  		return 0;
> >  	}
> >  
> > -	xe_mmio_write32(gt, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> > +	xe_mmio_write32(mmio, INTR_IDENTITY_REG(bank), INTR_DATA_VALID);
> >  
> >  	return ident;
> >  }
> > @@ -232,10 +243,32 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> >  	}
> >  }
> >  
> > -static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> > +static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
> > +				    enum xe_engine_class class,
> > +				    unsigned int instance)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +
> > +	if (MEDIA_VER(xe) < 13)
> > +		return tile->primary_gt;
> > +
> > +	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> > +	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> > +		return tile->media_gt;
> > +
> > +	if (class == XE_ENGINE_CLASS_OTHER &&
> > +	    instance == OTHER_MEDIA_GUC_INSTANCE)
> > +		return tile->media_gt;
> > +
> > +	return tile->primary_gt;
> > +}
> > +
> > +static void gt_irq_handler(struct xe_tile *tile,
> >  			   u32 master_ctl, long unsigned int *intr_dw,
> >  			   u32 *identity)
> >  {
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_gt *mmio = tile->primary_gt;
> >  	unsigned int bank, bit;
> >  	u16 instance, intr_vec;
> >  	enum xe_engine_class class;
> > @@ -247,27 +280,26 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> >  		if (!(master_ctl & GT_DW_IRQ(bank)))
> >  			continue;
> >  
> > -		if (!xe_gt_is_media_type(gt)) {
> > -			intr_dw[bank] =
> > -				xe_mmio_read32(gt, GT_INTR_DW(bank));
> > -			for_each_set_bit(bit, intr_dw + bank, 32)
> > -				identity[bit] = gt_engine_identity(xe, gt,
> > -								   bank, bit);
> > -			xe_mmio_write32(gt, GT_INTR_DW(bank),
> > -					intr_dw[bank]);
> > -		}
> > +		intr_dw[bank] = xe_mmio_read32(mmio, GT_INTR_DW(bank));
> > +		for_each_set_bit(bit, intr_dw + bank, 32)
> > +			identity[bit] = gt_engine_identity(xe, mmio, bank, bit);
> > +		xe_mmio_write32(mmio, GT_INTR_DW(bank), intr_dw[bank]);
> 
> as I notice earlier we are doing the above processing only on a non
> media GT, with your change we are even processing on media tile, was
> there a bug earlier hence you made this change ?

The media GT is still disabled at this point in the series, but we still
need to put the proper handling in place so that we'll be able to
re-enable it at the end of the series.  So even though "engine_gt" below
will always be the primary GT after this patch, near the end of the
series we re-enable media GT and the pick_engine_gt() call willl start
getting used.  We're just putting the infrastructure in place right now
so that it will be ready.

Note that the 'struct xe_gt *mmio' used as the target for MMIO
operations is unrelated to the GT(s) we're handling interrupts for.
It's unfortunate that 'struct xe_gt' is the target for MMIO operations
right now.  I'll have another series to update that design once this
series lands.


Matt

> 
> Thanks,
> Aravind.
> >  
> >  		for_each_set_bit(bit, intr_dw + bank, 32) {
> > +			struct xe_gt *engine_gt;
> > +
> >  			class = INTR_ENGINE_CLASS(identity[bit]);
> >  			instance = INTR_ENGINE_INSTANCE(identity[bit]);
> >  			intr_vec = INTR_ENGINE_INTR(identity[bit]);
> >  
> > +			engine_gt = pick_engine_gt(tile, class, instance);
> > +
> >  			if (class == XE_ENGINE_CLASS_OTHER) {
> > -				gt_other_irq_handler(gt, instance, intr_vec);
> > +				gt_other_irq_handler(engine_gt, instance, intr_vec);
> >  				continue;
> >  			}
> >  
> > -			hwe = xe_gt_hw_engine(gt, class, instance, false);
> > +			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
> >  			if (!hwe)
> >  				continue;
> >  
> > @@ -285,24 +317,24 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> >  static irqreturn_t xelp_irq_handler(int irq, void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> > -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> >  	u32 master_ctl, gu_misc_iir;
> >  	long unsigned int intr_dw[2];
> >  	u32 identity[32];
> >  
> > -	master_ctl = xelp_intr_disable(gt);
> > +	master_ctl = xelp_intr_disable(xe);
> >  	if (!master_ctl) {
> > -		xelp_intr_enable(gt, false);
> > +		xelp_intr_enable(xe, false);
> >  		return IRQ_NONE;
> >  	}
> >  
> > -	gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> > +	gt_irq_handler(tile, master_ctl, intr_dw, identity);
> >  
> >  	xe_display_irq_handler(xe, master_ctl);
> >  
> > -	gu_misc_iir = gu_misc_irq_ack(gt, master_ctl);
> > +	gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> >  
> > -	xelp_intr_enable(gt, false);
> > +	xelp_intr_enable(xe, false);
> >  
> >  	xe_display_irq_enable(xe, gu_misc_iir);
> >  
> > @@ -311,38 +343,38 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
> >  
> >  static u32 dg1_intr_disable(struct xe_device *xe)
> >  {
> > -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >  	u32 val;
> >  
> >  	/* First disable interrupts */
> > -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
> > +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
> >  
> >  	/* Get the indication levels and ack the master unit */
> > -	val = xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> > +	val = xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> >  	if (unlikely(!val))
> >  		return 0;
> >  
> > -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, val);
> > +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, val);
> >  
> >  	return val;
> >  }
> >  
> >  static void dg1_intr_enable(struct xe_device *xe, bool stall)
> >  {
> > -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> > +	struct xe_gt *mmio = xe_root_mmio_gt(xe);
> >  
> > -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> > +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> >  	if (stall)
> > -		xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> > +		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> >  }
> >  
> > -static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> > +static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
> >  {
> > -	gt_irq_postinstall(xe, gt);
> > +	gt_irq_postinstall(tile);
> >  
> > -	unmask_and_enable(gt, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> > +	unmask_and_enable(tile, GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
> >  
> > -	if (gt->info.id == XE_GT0)
> > +	if (tile->id == 0)
> >  		dg1_intr_enable(xe, true);
> >  }
> >  
> > @@ -354,8 +386,8 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >  static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> > -	struct xe_gt *gt;
> > -	u32 master_tile_ctl, master_ctl = 0, tile0_master_ctl = 0, gu_misc_iir;
> > +	struct xe_tile *tile;
> > +	u32 master_tile_ctl, master_ctl = 0, gu_misc_iir = 0;
> >  	long unsigned int intr_dw[2];
> >  	u32 identity[32];
> >  	u8 id;
> > @@ -368,12 +400,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  		return IRQ_NONE;
> >  	}
> >  
> > -	for_each_gt(gt, xe, id) {
> > -		if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id)) == 0)
> > +	for_each_tile(tile, xe, id) {
> > +		struct xe_gt *mmio = tile->primary_gt;
> > +
> > +		if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
> >  			continue;
> >  
> > -		if (!xe_gt_is_media_type(gt))
> > -			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ);
> > +		master_ctl = xe_mmio_read32(mmio, GFX_MSTR_IRQ);
> >  
> >  		/*
> >  		 * We might be in irq handler just when PCIe DPC is initiated
> > @@ -381,124 +414,125 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  		 * irq as device is inaccessible.
> >  		 */
> >  		if (master_ctl == REG_GENMASK(31, 0)) {
> > -			dev_dbg(gt_to_xe(gt)->drm.dev,
> > +			dev_dbg(tile_to_xe(tile)->drm.dev,
> >  				"Ignore this IRQ as device might be in DPC containment.\n");
> >  			return IRQ_HANDLED;
> >  		}
> >  
> > -		if (!xe_gt_is_media_type(gt))
> > -			xe_mmio_write32(gt, GFX_MSTR_IRQ, master_ctl);
> > -		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> > +		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
> > +
> > +		gt_irq_handler(tile, master_ctl, intr_dw, identity);
> >  
> >  		/*
> > -		 * Save primary tile's master interrupt register for display
> > -		 * processing below.
> > +		 * Display interrupts (including display backlight operations
> > +		 * that get reported as Gunit GSE) would only be hooked up to
> > +		 * the primary tile.
> >  		 */
> > -		if (id == 0)
> > -			tile0_master_ctl = master_ctl;
> > +		if (id == 0) {
> > +			xe_display_irq_handler(xe, master_ctl);
> > +			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> > +		}
> >  	}
> >  
> > -	xe_display_irq_handler(xe, tile0_master_ctl);
> > -
> > -	/* Gunit GSE interrupts can trigger display backlight operations */
> > -	gu_misc_iir = gu_misc_irq_ack(gt, tile0_master_ctl);
> > -
> >  	dg1_intr_enable(xe, false);
> > -
> >  	xe_display_irq_enable(xe, gu_misc_iir);
> >  
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static void gt_irq_reset(struct xe_gt *gt)
> > +static void gt_irq_reset(struct xe_tile *tile)
> >  {
> > -	u32 ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
> > -	u32 bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
> > +	struct xe_gt *mmio = tile->primary_gt;
> > +
> > +	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> > +						   XE_ENGINE_CLASS_COMPUTE);
> > +	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
> > +						   XE_ENGINE_CLASS_COPY);
> >  
> >  	/* Disable RCS, BCS, VCS and VECS class engines. */
> > -	xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE,	 0);
> > -	xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE,	 0);
> > +	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
> > +	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, 0);
> >  	if (ccs_mask)
> > -		xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, 0);
> > +		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, 0);
> >  
> >  	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
> > -	xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK,	~0);
> > -	xe_mmio_write32(gt, BCS_RSVD_INTR_MASK,	~0);
> > +	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK,	~0);
> > +	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK,	~0);
> >  	if (bcs_mask & (BIT(1)|BIT(2)))
> > -		xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> > +		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~0);
> >  	if (bcs_mask & (BIT(3)|BIT(4)))
> > -		xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> > +		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~0);
> >  	if (bcs_mask & (BIT(5)|BIT(6)))
> > -		xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> > +		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~0);
> >  	if (bcs_mask & (BIT(7)|BIT(8)))
> > -		xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> > -	xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK,	~0);
> > -	xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK,	~0);
> > -	xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK,	~0);
> > +		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~0);
> > +	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK,	~0);
> > +	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK,	~0);
> > +	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK,	~0);
> >  	if (ccs_mask & (BIT(0)|BIT(1)))
> > -		xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~0);
> > +		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~0);
> >  	if (ccs_mask & (BIT(2)|BIT(3)))
> > -		xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~0);
> > +		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~0);
> >  
> > -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_ENABLE, 0);
> > -	xe_mmio_write32(gt, GPM_WGBOXPERF_INTR_MASK,  ~0);
> > -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,	 0);
> > -	xe_mmio_write32(gt, GUC_SG_INTR_MASK,		~0);
> > +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
> > +	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
> > +	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
> > +	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
> >  }
> >  
> > -static void xelp_irq_reset(struct xe_gt *gt)
> > +static void xelp_irq_reset(struct xe_tile *tile)
> >  {
> > -	xelp_intr_disable(gt);
> > +	xelp_intr_disable(tile_to_xe(tile));
> >  
> > -	gt_irq_reset(gt);
> > +	gt_irq_reset(tile);
> >  
> > -	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> > -	mask_and_disable(gt, PCU_IRQ_OFFSET);
> > +	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> > +	mask_and_disable(tile, PCU_IRQ_OFFSET);
> >  }
> >  
> > -static void dg1_irq_reset(struct xe_gt *gt)
> > +static void dg1_irq_reset(struct xe_tile *tile)
> >  {
> > -	if (gt->info.id == 0)
> > -		dg1_intr_disable(gt_to_xe(gt));
> > +	if (tile->id == 0)
> > +		dg1_intr_disable(tile_to_xe(tile));
> >  
> > -	gt_irq_reset(gt);
> > +	gt_irq_reset(tile);
> >  
> > -	mask_and_disable(gt, GU_MISC_IRQ_OFFSET);
> > -	mask_and_disable(gt, PCU_IRQ_OFFSET);
> > +	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> > +	mask_and_disable(tile, PCU_IRQ_OFFSET);
> >  }
> >  
> >  static void xe_irq_reset(struct xe_device *xe)
> >  {
> > -	struct xe_gt *gt;
> > +	struct xe_tile *tile;
> >  	u8 id;
> >  
> > -	for_each_gt(gt, xe, id) {
> > +	for_each_tile(tile, xe, id) {
> >  		if (GRAPHICS_VERx100(xe) >= 1210)
> > -			dg1_irq_reset(gt);
> > +			dg1_irq_reset(tile);
> >  		else
> > -			xelp_irq_reset(gt);
> > +			xelp_irq_reset(tile);
> >  	}
> >  
> >  	xe_display_irq_reset(xe);
> >  }
> >  
> > -void xe_gt_irq_postinstall(struct xe_gt *gt)
> > +void xe_gt_irq_postinstall(struct xe_tile *tile)
> >  {
> > -	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_device *xe = tile_to_xe(tile);
> >  
> >  	if (GRAPHICS_VERx100(xe) >= 1210)
> > -		dg1_irq_postinstall(xe, gt);
> > +		dg1_irq_postinstall(xe, tile);
> >  	else
> > -		xelp_irq_postinstall(xe, gt);
> > +		xelp_irq_postinstall(xe, tile);
> >  }
> >  
> >  static void xe_irq_postinstall(struct xe_device *xe)
> >  {
> > -	struct xe_gt *gt;
> > +	struct xe_tile *tile;
> >  	u8 id;
> >  
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_irq_postinstall(gt);
> > +	for_each_tile(tile, xe, id)
> > +		xe_gt_irq_postinstall(tile);
> >  
> >  	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> > index 34ecf22b32d3..69113c21e1cd 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.h
> > +++ b/drivers/gpu/drm/xe/xe_irq.h
> > @@ -7,10 +7,10 @@
> >  #define _XE_IRQ_H_
> >  
> >  struct xe_device;
> > -struct xe_gt;
> > +struct xe_tile;
> >  
> >  int xe_irq_install(struct xe_device *xe);
> > -void xe_gt_irq_postinstall(struct xe_gt *gt);
> > +void xe_gt_irq_postinstall(struct xe_tile *tile);
> >  void xe_irq_shutdown(struct xe_device *xe);
> >  void xe_irq_suspend(struct xe_device *xe);
> >  void xe_irq_resume(struct xe_device *xe);

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
