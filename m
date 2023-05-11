Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C35C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 13:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28C10E259;
	Thu, 11 May 2023 13:50:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D63110E259
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683813033; x=1715349033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OpiuCBkBbNibE2y79d/i43iPTx/4qVFdyTVGy7NiRPA=;
 b=XERfY8Gazqjvz0wGBqq+v5V/PBaP5WM9kWTUpAYTRVfMud1nYgIu+fLZ
 5fSx6dZcBsF4D4Vmud4YOVgL8n9mK0nSE5GgJfspZ0Lc3krX8ykGVWn+Y
 N1Bj8ysbRt2hcuPnVP/JL0jVcD2OqkfGwx/m+NNx5X0oSyVLR2eTrZadH
 1uOrk/oMbm90rQC7ykxyOJmgPkphE/ZaejfZYe09LTLQpfimN6OZ7XnEA
 l+jnn6szS11MBpTPXFdYXBt69u8juDPdZBrH18/5FxjgZ0mYh8kkNIIVK
 /RW4bpZtbuS0HyGyDz3PHYlItO+bhmnai2YVFaJsUKUGhhpL0OnN1QSIK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413852161"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="413852161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 06:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732589166"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="732589166"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 11 May 2023 06:50:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 06:50:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 06:50:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 06:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYCblrD+tSaMVsMK7lABG1IFKIquXTT7mEb9epihPI7WXH3kUbWnUwiQgrykXGNHGLWDdIROTEesagmHCH6B73VDoLeuAHx4Chq4vcXWnw7EwY88ZEB5b/5yPahYVRhlnQWdJpQPGSiI+WBBHTRaP9oJVjg3b51F9D+TWXpM2ImFFPXztejtMlBWMdblghZOXKIri39aZKz/Sf2nZWd/lX0OcfAzIojAHPPNP0D9fKwbdPrkyCFenslRxnttVYbMd1FqNkBImmAWxKzWqBob0MACsF8hHN0aAram37QZ3zJKDSAQM4oytI8DqRysZ4fdmmtthWKpAqi+WZn/L2Ecmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O7Cn3xI/rYP2lj/uICHR/TkM1NYk7IUZ+/p15EpSpU=;
 b=Ppvc53YBIjTrJQAI6XDWvwhrpWdOF1O/NS+PjqGgQ+8RRRxRQr1VfkDSEs9KizLVZ9Hbf9dRtCciSfzzoq3+08Poi98p0zcex1oVmDva/7YrV/OQjKVpwqSKWXrxRTymsAmnBZTao/Hqs1iyVZ1GZNXq9RyyVd3MheSYk11rE5SvD9rDkkn7bQLu//Ig5xS26fjClNgwSiGCTCMyo1giEtnXUywnNkkJaUu1QJMyfPK+Wua9LR0ChY0QkgT8J0XTLhSeyCA6tWY8YyHzptX6O+6gN6YKYCV3Ri9VJ910NfMkpZHA6k7by7JDtELo7d3N605rp1/floH8rToayWcUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7980.namprd11.prod.outlook.com (2603:10b6:806:2fc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 13:50:15 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 13:50:14 +0000
Date: Thu, 11 May 2023 06:50:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Message-ID: <20230511135010.GW10045@mdroper-desk1.amr.corp.intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-16-matthew.d.roper@intel.com>
 <5dcf50c8-0963-813f-68d4-b206549f1c31@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5dcf50c8-0963-813f-68d4-b206549f1c31@intel.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3f6942-c687-4041-e83f-08db5226a553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Up/eYafRd5tRuMMxZwzSUu+phfx6bHwIGJuShyJ1ep5Xt33rfp01MhEvRvVwL+uVGC8PN9NivWt0XHAVKe0fPslm2vHkk/Mmx1PNsooBKgx4k22m4FsMYXJ4dv5WBbJUM8k04+smUNMp2eeCUEzM4QEM6mjFOgzWy71ISKyueLAlDADCKwXhqTCKRnP9ji4EkATfb6Kavlx+i55n6bjt3oFwK+bjXsV62W1MLd4/NScUXcd9xZpOTTCnAmdsVWrPwf5OXHOdSBncSiRrIN1QqTPa/VMklSrsXQc1sa7Sz0ECoO5j9Bb6Uqv19/7MnDcGrHkbeWNTofao3fQePv1HPL/Tt3lKsHnftNlG6Oq11gCRwLs8FY9dkg00XyfZ5aIJN4KNcOyDeb9ASGRrhWAUeitG46ZHFZy65HWCNYze8r96+1lziTU5v2wJtarGpfS3ub0Daq6bb5/R6E97aj4gbPvXSTPQDzEEAz7nUXDGT014MCEzFizB+CkYFWqxUXN/ScSip7fTobiGfl42Srf+jqvtHfnO+OQDeR9yks03MDI4+n8GA7QoYquPvWvXEj6d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199021)(86362001)(33656002)(6666004)(316002)(6636002)(4326008)(66476007)(478600001)(66556008)(66946007)(6486002)(41300700001)(5660300002)(8936002)(8676002)(2906002)(6862004)(38100700002)(82960400001)(186003)(6512007)(6506007)(53546011)(1076003)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tkvUAUKWR1LI06qf5xq7kEbCAwdSBNa3u/YT98gjlaI5JKsaxFhADoT1CUdj?=
 =?us-ascii?Q?OmSJ/HilNZMDptResohC2Danygz4/m9EDeq3eJdks+zOeUACriZrlAXIqLyV?=
 =?us-ascii?Q?TGtiNnurnri/pN/bX8F22N6E5tRvJui5g0s0/x4Qd2VYfqkMaGGOVYa6k977?=
 =?us-ascii?Q?GHhNWdzz5eTaKZhIJuH5t6jGybCVlEpkhqDkErNhB1pYl8L6/HHrpTNgWA+Y?=
 =?us-ascii?Q?lmt5/htBc0e5hJzcTBDjnkRpmGU7NC85gyXShCXEDd/ZgScnhOGEfJlGb0sl?=
 =?us-ascii?Q?kCY9O76YZoLSCDIRSnb1iSmDv7NCJU6K1vAxjNo5acCNe0kc2kVRsk7aeaNj?=
 =?us-ascii?Q?sAf3H3tIpvO5NArKH+rgygFjmxDzRzdBiu9rh3J5IkyegeESc74goXFHtUvt?=
 =?us-ascii?Q?O7p4YvTCvd/mgWtDUm8CV8rCbbYSPyyLBWbtcKNqnCJn8nYUZPKNiEWXYFzI?=
 =?us-ascii?Q?7GBdM+90s4M87Lt0gPC6xEKDx4sTajDSE6Ui3OBsaX/S3xM2urBEYE/kQwsN?=
 =?us-ascii?Q?15jj9ZJirPdJ1SLpIJtcHynNdLjecKZCRQKpW3JckhGnHp378oPI5466Nw6r?=
 =?us-ascii?Q?oCuKbOuqpPtzBdEWX6j4fwkZbm5fgdZI8Ngmvrut/MFkvbYyjdO12FFWgbZv?=
 =?us-ascii?Q?tDOqYrbOWnDP9rq8BDB8ReFBfry9wT0HTsTnDD+Jm6Hp3ewtHPlHhBQCU2t4?=
 =?us-ascii?Q?gwW0bEz3+NKS5o69qf5H1d+GFWoHCO3Go3FdGb7W0BwBRUJbiWU9Tuh+Hcj+?=
 =?us-ascii?Q?nsyMvcYizcFgJcLd1o9nVJxNVN8DNvzVVEo8QO0QnLHcCIYgfqaMaX8A5mkV?=
 =?us-ascii?Q?YTfUeMI5uRgB59ZO5R23WzDbcDdZgB2qAbsSKLN/CuE+1xF+bdGL6WV94RKt?=
 =?us-ascii?Q?1tEgfB3GeH5bo0patSYLgCYF2AQbXdXWdvOB0o9GUOyClJ6DfhinwlYXxBs1?=
 =?us-ascii?Q?eqxUQzw/urv/CzKjboFzJYjVM4akUn8hQZF1tbxlYb/TKJ9zbrrzPBIQJgvz?=
 =?us-ascii?Q?KxSj2tsnlmA3jMcVJijheRbbPwK/+pvH/dF71cZUhfS1WrkR2amNFof10QUu?=
 =?us-ascii?Q?9WPEqnIlVU879Z83mH7skLU4NvenB2kMOjtis513LbhXUICqu8nm98A8CtFn?=
 =?us-ascii?Q?h/3T3t1EPX9iK8rJNpi3ecqa7g2mtDyEXtDGOvmka4l7mdA+RdIpBEfQFkxJ?=
 =?us-ascii?Q?S/jlN+k0UJJTLhp9w0JLLOTfXXN24mhUulshwPxTLyYv/H4yZ+fR4L4JGynm?=
 =?us-ascii?Q?Ul6N7qN0ABf0HoIgPM6IuJrk1GGe+pnFJft93BsxF2xnLPncZEbVpRXZp6MD?=
 =?us-ascii?Q?Pr5A34G+dnPa0haq/p3zILWIhYZj1+BxxrkqYnHOtFbYhvi9k3873r6Zub80?=
 =?us-ascii?Q?ULLiraEqW8HXmHaRFuUiiEjLWWjA9sFHoVRAdDBtENcFGU3Iv27dUu9YafoT?=
 =?us-ascii?Q?0UYH7kKVH96gYlNGNSE+W2C5+XQwyZUXfY6rTPDMhheV668KHMd/7CD7wqlQ?=
 =?us-ascii?Q?YluabfF7eO8Rg/E7Dc7sRo2DhgDSnQZ559xuqOxmOWw2g4eTkHVFIlqAfRrk?=
 =?us-ascii?Q?W6RXwICthbML4TgkXuF4PvNPaQaHi0d5FimycZzcLpuxfu08GPmh+Ywg0MQX?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3f6942-c687-4041-e83f-08db5226a553
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:50:14.1501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE9c6MtX2F9rHGtjWKzPaQNeS4t43QLcejX0vb6giPSVmErvTishcMn0RuD9kxX0J1gpXxhqDle1NCIoY6lNrswSwL6koSvMyJ51dZ7ykN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7980
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/26] drm/xe: Interrupts are delivered
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

On Thu, May 11, 2023 at 05:44:18PM +0530, Iddamsetty, Aravind wrote:
> 
> 
> On 11-05-2023 09:17, Matt Roper wrote:
> > IRQ delivery and handling needs to be handled on a per-tile basis.  Note
> > that this is true even for the "GT interrupts" relating to engines and
> > GuCs --- the interrupts relating to both GTs get raised through a single
> > set of registers in the tile's sgunit range.
> > 
> > The (mis)use of struct xe_gt as a target for MMIO operations in the
> > driver makes the code somewhat confusing since we wind up needing a GT
> > pointer to handle programming that's unrelated to the GT.  To mitigate
> > this confusion, all of the xe_gt structures used solely as an MMIO
> > target in interrupt code are renamed to 'mmio.'  Reworking the driver's
> > MMIO handling to not be dependent on xe_gt is planned as a future
> > update.
> > 
> > Note that GT initialization code currently calls xe_gt_irq_postinstall()
> > in an attempt to enable the HWE interrupts for the GT being initialized.
> > Unfortunately xe_gt_irq_postinstall() doesn't really match its name and
> > does a bunch of other stuff unrelated to the GT interrupts (such as
> > enabling the top-level device interrupts).  That will be addressed in
> > future patches.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c  |   2 +-
> >  drivers/gpu/drm/xe/xe_irq.c | 334 ++++++++++++++++++++----------------
> >  drivers/gpu/drm/xe/xe_irq.h |   4 +-
> >  3 files changed, 187 insertions(+), 153 deletions(-)
> > 
> 
> 
> <snip>
> >  static u32 dg1_intr_disable(struct xe_device *xe)
> >  {
> > -	struct xe_gt *gt = xe_primary_mmio_gt(xe);
> > +	struct xe_gt *mmio = xe_primary_mmio_gt(xe);
> >  	u32 val;
> >  
> >  	/* First disable interrupts */
> > -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, 0);
> > +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, 0);
> 
> if sgunit registers are replicated per tile, but why DG1_MSR_TILE_INTR
> is handled on primary tile only, is this not a sgunit register?

Right, this is an sgunit register, so there's technically a copy at each
tile.  However this specific register is the one responsible for showing
the interrupts that were forwarded to the root tile from the remote
tiles, and for enabling/disabling reporting of interrupts to the OS, so
only the copy in the root tile is relevant.  I should probably add some
additional explanation of that in the commit message.


Matt

> 
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
> > -	struct xe_gt *gt = xe_primary_mmio_gt(xe);
> > +	struct xe_gt *mmio = xe_primary_mmio_gt(xe);
> >  
> > -	xe_mmio_write32(gt, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> > +	xe_mmio_write32(mmio, DG1_MSTR_TILE_INTR, DG1_MSTR_IRQ);
> >  	if (stall)
> > -		xe_mmio_read32(gt, DG1_MSTR_TILE_INTR);
> > +		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
> >  }
> >
> 
> Thanks,
> Aravind.
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
