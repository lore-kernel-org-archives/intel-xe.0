Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C5CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 22:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10510E415;
	Tue, 19 Sep 2023 22:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14EA10E415
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695162700; x=1726698700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oVyfPol6q8zrPsmqf4uuRvVWjYz+coTRhcMt2dxe5kY=;
 b=cSwyjEBQhRMGk5jozr8f2uvc7sj63YODF7Pnn9Q9J0I3z+truCS5cnQR
 7wbUmq+W7D8ooiq0c1MuCYD44K3X/EVN8UlK9t91CC5WHMc2TD2Vsr0LR
 xLaGosecDaZBjho5Pae8rq/ZGp3z7VkSYB+yJ+sG5cXWzRzGS7gJMu5C9
 FwF910OIX5JtQEkPHHHmM9zJEjgDRHx9fbQFWYEhvMnoSGCHWmdW+3PNZ
 RE/0MLCea32JsMpAogEZZZqvFK4N24wfZS9bChJ/pCICN2MQ6fpuy6eMy
 tLQystj5D3R2Msr9ujhqdmPDikkwwc9/aRJM0Oo/2J63ZRc0g1y2EAzJb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370382052"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="370382052"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 15:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811890434"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="811890434"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 15:31:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 15:31:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 15:31:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 15:31:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 15:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZIB3+UqvWxgMOnRrvd7kYlpnHks/t0gNXFpuvZdI4R8JOUvraSJyBS4U5GgoLzHxwfN/nprJSkHrxmx86gO6G2IsIauULB4nDYO2Ff7NmbjVdZgYKAdycknn/ujZgurqIdWmS2x3/UOveRJxhCYqk5U6TcmVHvR8tUhjZN7Rj5tPeiJhw0GFN4fBeu7Kf5nbAfbZfUIQ4R4Ps+UFrcFwRaRz2VuPGTnbcxgzA0DBRcvwYM+ua4ng0uJ3IvXHvwz2jRKElZAEqDUnORpgyhZtFzIVrQPHuimEpk3oMi1Z96J/usctbnM32uHeUJ5fJe6tWflJm5THrEwsoU46LPuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cP+Bah5uKXWpOG4kgrEHMdu/oPVclWR2Lki/comgYc=;
 b=DgEV5M7fFysF+CcyPD76zQGiW0gpR87dcL95exwyuW4bfpVaymVKbDpA9tsyjMxzXp2CVucK1dDZJkeMK70nSrx3iwRl+RijQcJ7v0p4t7SHGVVXTPJVEvbFr5KfJ3uqe3vnyAHqOfq1IEEi2xCAemY5cPa+ZJFFZCC6rkWl0aTZmahDZ8q33Tr5lPrWGlRK0gVgUIlkvtTfRe1CkXG7h8LelhxO5ONAhsqQZNNJBNFbKEKK4qsDQHpcwH0CqszSAvSuBaXjSiayMdGBl0jUz7h43RZR5zX/+JH20g5WxCFvu/wyv4HN3eEDKRdbvxTFL5Ui11CH6k6/0fVskvO9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.24; Tue, 19 Sep 2023 22:31:24 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 19 Sep 2023
 22:31:24 +0000
Date: Tue, 19 Sep 2023 15:31:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230919223121.GI233750@mdroper-desk1.amr.corp.intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
 <20230913231411.291933-13-matthew.d.roper@intel.com>
 <wnophaogmq2o3feqmle6yo74j5dmpqko6lfyvgjyjl62nis4be@2gi2jslmugcf>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wnophaogmq2o3feqmle6yo74j5dmpqko6lfyvgjyjl62nis4be@2gi2jslmugcf>
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 025506a7-983d-4796-a7af-08dbb96027d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nsuHzvYSa4phisUfNTd7nsvrGF+XYxjWG/7Cg7JnzIe7hbRfVmFFGWNfi5GmfQqeHf3hw9wtiJlGmYr5WT+qM0TOC2a4BeA87mbillf32V2z8sC28ehWFyogiSIc6gVZfJPrVtQ1NDjekEHOTOGX+RR1Q74Z8UtnNB7tri20c1xfVgTU+SDBB4BkxeV2ls1SPn9efuk407c4kOKlv1bl2VVW81nBmECoEradHD7jZcxmuhZ2yK+qD79Ec2z+9uR3ICddEwze4mwxD1cJYEDlTK1Gr1Q1KEpRvN3otu1BNoAQf6kqdW5IwKvpjQOpg6kEEnoAUW4W1v4Y25BHNfC7yTVtMZTUnZzZ3F1iTbMCwMRIl9cMdtMthma56fWM5fSmXUssesASWW8YkKMS3iLpWtJfbrgto+5KFiSC3ODO43/WZDlwV37iZHnhjBOjNnpU7U9w6eajLE3PBjpnq/eiK0wlPrQcy876/bcVOcySpv83XoWlvVefh9vY+eseUIX49Aqy3dBzI48Xxutk1yBo48L8uxl+h7K+APrGjU9hOhsw9AcRXgvP5OJG9Ljdc35
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(1800799009)(451199024)(186009)(6506007)(6666004)(6486002)(478600001)(6512007)(26005)(1076003)(41300700001)(8936002)(2906002)(66946007)(6636002)(316002)(66476007)(66556008)(8676002)(5660300002)(4326008)(6862004)(82960400001)(33656002)(86362001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uh0WzHDxift/b7TskB+pOUcZyYRwZy654TUTHpborI1ME33E1vDGjy6hFOB/?=
 =?us-ascii?Q?+EfiuDHfV+WnWylqZgIi59oB+qp8KmdP1nD08DDNxENpnLrYCRxLNEkHAI+N?=
 =?us-ascii?Q?rJ6y9rjBdQWlQZ5FLUtZU/AoaLAYan1bR8lRKJlNvesDXUl6T7Rc5DjZjxnX?=
 =?us-ascii?Q?nNLE4M53WCBmjlbqJW05TUkH8KQZeVMLZJTXpi0QxhSLJDpcnoj9qScPwXgW?=
 =?us-ascii?Q?QfOdBR5ILn+LWgISjalWQZWYea/XRCtcdqkzPfyuAUFABLl3Ezbz8s7yvXj3?=
 =?us-ascii?Q?Ve+ebFnlZqPyqQ8oYW529yV+QXlQgxJLGRMlEm49Z1GZI5FzOLaXHV43T9pN?=
 =?us-ascii?Q?B1YusZ5adi2OHEleLHrB0kOwVrrTFHeVYy2I0U4EHdbCuzuly5IHDJIt1JzA?=
 =?us-ascii?Q?OjKPy5oC0x+S/B8M95yzzc4Tml0iIazPn9Xpa+TtaJ0l45DKuNRcn5zou9tU?=
 =?us-ascii?Q?FDKcQGtFzn+tzFIhrlRdFpPyhabEDiBhpSwvi0WxftjqvAcVtG0o4D+RrRvH?=
 =?us-ascii?Q?vHba6lZSB29QvD0IjL1XG0d0wjP+2ce1F7a/OY5lC7vW+6SZLEuvIRDUC9k5?=
 =?us-ascii?Q?yhFhVTo2FRTmqr/NUffmoKZ11PA2peurd5OlKFheIxeybA2rlCleLwK4lbqu?=
 =?us-ascii?Q?DT7JKlprJ4LpVEnMvqBNFgcgm/ZYXx2yVWCbJ/wo3gfK9Bo8zKHQqr4KjQjG?=
 =?us-ascii?Q?bnU8i6y2Mr9CL3yd72F2/dbW+AInDdA29Nl/JHPFdTTOH1EBYqrigtxqJNEA?=
 =?us-ascii?Q?eLbGM5Wiv5i64ZNZ7mizuYjxs+vMnN5WBt1DgCZI7USUOk55FzhRKmKZKWSL?=
 =?us-ascii?Q?fzysQfqmH04RY1fAlwIj1KbOFyEKN8nd0FGb5Rzf4IVbZkE9xam8ckuFDxkC?=
 =?us-ascii?Q?nFZsOGv3XQAEshE0Ah79OMGZcbUrHXJ06e1nCUkR7YfHJ+mjiC3yCoSQmZWK?=
 =?us-ascii?Q?AdDU9t1x02Rkjl9i1WLoDn71rhhiCli2lVLnkpCKCIH9gzIIt6JuPLb/X9ZY?=
 =?us-ascii?Q?To3P6IS2SEyQZIHHrOJc35iFyrdynikUs+vMQ29lTH2W79+ejNsACYTjfIFU?=
 =?us-ascii?Q?x9EV0NY2WmvJ2RSBvUEsAOeNYvNdDcV/GZUsHaMuQ1+bYFn+oHQKPay+JQ2M?=
 =?us-ascii?Q?bWKxdCM0uRJsekdbSZ6GIE24dXQn5FvILbwnpK1635g/vy8Cd6O/rH+gtSgR?=
 =?us-ascii?Q?oRwfoduiGYHhahpNkx/zOIcFZRN9UBjteqDQ/M3zjrOBmng0ktAeqcsh7AA4?=
 =?us-ascii?Q?m8XpAM38kzYhtBBFJWO1ypQBFU4WlZ2H9cuDjk7O7EUJ/EwrDyB/6VCUDcT5?=
 =?us-ascii?Q?sjRg3uUvUTCi8+VgADfaDaLfzK9eepK6Qu9UR6vC2sFDHQS0jAgsyjyVFEAL?=
 =?us-ascii?Q?QHUM1GqULwJRlaMVqU5PR8Zz1plebSjwA5PgXOMpJeTp2lmDGqvRZdey2t1L?=
 =?us-ascii?Q?AL+B43+ZOGk2v/0VLxkvUDmjd27VkjHXC2wPL4XPngPb2Y630g6l6zrFk4vs?=
 =?us-ascii?Q?aqlhGrBsGbLOeH8UEEri44sjJpvBd7ebOKkmqQwUvhCRY+TdiYaYihUxeGi/?=
 =?us-ascii?Q?Fh+Tjt3RrAXVpPszA5XDmqn+wcMyPrYgvBylYaE8Slqfq9lBnMJXI+xTY4VV?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 025506a7-983d-4796-a7af-08dbb96027d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 22:31:24.0612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 333g9v85bPhkUHjOJl/UMc0MAvTP5y36cqvBkvq85XVxyKR5EiGf6sXXkL2azPZdzxXzKzcfiLQ06PTVqlkcDKf9DKhkiy0CeaAIo6E5WLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/wa: Apply tile workarounds at
 probe/resume
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

On Mon, Sep 18, 2023 at 12:11:10PM -0500, Lucas De Marchi wrote:
> On Wed, Sep 13, 2023 at 04:14:17PM -0700, Matt Roper wrote:
> > Although the vast majority of workarounds the driver needs to implement
> > are either GT-based or display-based, there are occasionally workarounds
> > that reside outside those parts of the hardware (i.e., in they target
> > registers in the sgunit/soc); we can consider these to be "tile"
> > workarounds since there will be instance of these registers per tile.
> > The registers in question should only lose their values during a
> > function-level reset, so they only need to be applied during probe and
> > resume; the registers will not be affected by GT/engine resets.
> > 
> > Tile workarounds are rare (there's only one, 22010954014, that's
> > relevant to Xe at the moment) so it's probably not worth updating the
> > xe_rtp design to handle tile-level workarounds yet, although we may want
> > to consider that in the future if/when more of these show up on future
> > platforms.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> The missing part to make it official as "tile workarounds" is
> very small. Maybe worth just adding them here and avoid the todo?
> That would be:  have a tile->reg_sr, xe_wa_process_tile() and where
> you are calling xe_wa_apply_tile_workarounds(), just call
> xe_reg_sr_apply_mmio() with the primary gt.
> 
> But up to you if you want to keep it simpler for now.
> 
> > ---
> > drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
> > drivers/gpu/drm/xe/xe_pm.c         |  5 +++++
> > drivers/gpu/drm/xe/xe_tile.c       |  3 +++
> > drivers/gpu/drm/xe/xe_wa.c         | 20 ++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_wa.h         |  2 ++
> > drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> > 6 files changed, 34 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index 39d7b0740bf0..8a93ab169e04 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -56,6 +56,9 @@
> > #define GU_CNTL					XE_REG(0x101010)
> > #define   LMEM_INIT				REG_BIT(7)
> > 
> > +#define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > +#define   SGSI_SIDECLK_DIS			REG_BIT(17)
> > +
> > #define GGC					XE_REG(0x108040)
> > #define   GMS_MASK				REG_GENMASK(15, 8)
> > #define   GGMS_MASK				REG_GENMASK(7, 6)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 0f06d8304e17..ad3c08c4ff22 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -20,6 +20,7 @@
> > #include "xe_guc.h"
> > #include "xe_irq.h"
> > #include "xe_pcode.h"
> > +#include "xe_wa.h"
> > 
> > /**
> >  * DOC: Xe Power Management
> > @@ -86,10 +87,14 @@ int xe_pm_suspend(struct xe_device *xe)
> >  */
> > int xe_pm_resume(struct xe_device *xe)
> > {
> > +	struct xe_tile *tile;
> > 	struct xe_gt *gt;
> > 	u8 id;
> > 	int err;
> > 
> > +	for_each_tile(tile, xe, id)
> > +		xe_wa_apply_tile_workarounds(tile);
> > +
> > 	for_each_gt(gt, xe, id) {
> > 		err = xe_pcode_init(gt);
> > 		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index e0bc2b60ab09..131752a57f65 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -12,6 +12,7 @@
> > #include "xe_tile.h"
> > #include "xe_tile_sysfs.h"
> > #include "xe_ttm_vram_mgr.h"
> > +#include "xe_wa.h"
> > 
> > /**
> >  * DOC: Multi-tile Design
> > @@ -143,6 +144,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> > 	if (IS_ERR(tile->mem.kernel_bb_pool))
> > 		err = PTR_ERR(tile->mem.kernel_bb_pool);
> > 
> > +	xe_wa_apply_tile_workarounds(tile);
> 
> do we need to apply them here considering we will still go through
> xe_pm_resume()?

We do?  I might be missing something, but I don't see where
xe_pm_resume() would get called on the probe path?


Matt

> 
> Lucas De Marchi
> 
> > +
> > 	xe_tile_sysfs_init(tile);
> > 
> > err_mem_access:
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index f45e9452ba0e..d84e67a9af07 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -753,3 +753,23 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
> > 		if (oob_was[idx].name)
> > 			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> > }
> > +
> > +/*
> > + * Apply tile (non-GT, non-display) workarounds.  Think very carefully before
> > + * adding anything to this function; most workarounds should be implemented
> > + * elsewhere.  The programming here is primarily for sgunit/soc workarounds,
> > + * which are relatively rare.  Since the registers these workarounds target are
> > + * outside the GT, they should only need to be applied once at device
> > + * probe/resume; they will not lose their values on any kind of GT or engine
> > + * reset.
> > + *
> > + * TODO:  We may want to move this over to xe_rtp in the future once we have
> > + * enough workarounds to justify the work.
> > + */
> > +void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
> > +{
> > +	struct xe_gt *mmio = tile->primary_gt;
> > +
> > +	if (XE_WA(mmio, 22010954014))
> > +		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > index cfe685989524..1b24d66f9d80 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.h
> > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > @@ -9,12 +9,14 @@
> > struct drm_printer;
> > struct xe_gt;
> > struct xe_hw_engine;
> > +struct xe_tile;
> > 
> > int xe_wa_init(struct xe_gt *gt);
> > void xe_wa_process_oob(struct xe_gt *gt);
> > void xe_wa_process_gt(struct xe_gt *gt);
> > void xe_wa_process_engine(struct xe_hw_engine *hwe);
> > void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> > +void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> > 
> > void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> > void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 599e67169dae..f3ff774dc4aa 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -18,3 +18,4 @@
> > 14016763929	SUBPLATFORM(DG2, G10)
> > 		SUBPLATFORM(DG2, G12)
> > 16017236439	PLATFORM(PVC)
> > +22010954014	PLATFORM(DG2)
> > -- 
> > 2.41.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
