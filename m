Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E644FD9E2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 00:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702810EA13;
	Fri, 27 Feb 2026 00:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gn1MitZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C8610EA13
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 00:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772152223; x=1803688223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vqfMRFkEWVRnqt/iDetkHwkXyyst09m8NOzlS9f3gQ4=;
 b=Gn1MitZEk70C95bsezwdudaEwkekIxNBlWnWCP2Uajcay0GG6H9ZtSJy
 ldZsRLgOd26IPN77tNQM+8KmtC0qbURtznDa8TLCfoepFIpsPtQXhz7MH
 3WwPRixlGueuCIx0Snu9H+IyuWqigKLdO500jwqmWt53KJ76GtwFglpxE
 LLGWPMpA06ODIaNMoe8lgbQV2JrRuC6vyPRvP7sLXQQB71dlERz9ORYHE
 VuigB5dydeENp4QyWSTpKHqzotuH2uO8Zt2jXAsPoK/u71DpSATd3/8o8
 aarWctdGyZbGOcJzsdwlUvNejGv5hZT3VMeWL+48T/9n8hhvnUW6T/Myb w==;
X-CSE-ConnectionGUID: eZOjVTkETv2JFoOcWxygbQ==
X-CSE-MsgGUID: PKBJp6kPTR2NyuB28n1rFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73140188"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73140188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 16:30:22 -0800
X-CSE-ConnectionGUID: Y7IneZQkRlCO66SrAiITGA==
X-CSE-MsgGUID: sRo9BrCIRyS8pNVG1IawFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214641024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 16:30:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 16:30:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 16:30:18 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 16:30:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1Lb5EYZ8xRApsyaX3w1UUKwoLN/d4xHhYwlJFw5eJD8ISjL3XglKlzhi4jDOteguIe8ASntGCkEM0wz77J+yhMSaEND8OSwbyARs3UHRHJkaHRYSz75Y1yzl4irszv+a2T1nF7m35o3BoT6T3D8zbsfh0yHZZJ2DmaZVmkPFRqmv4yrsHpEqWZxcsxR3V5qMOKuYni30Q5MsQ796APwE8Eds8xCfmML1qPjpA2J52tNqxFMr6TGrMQ1GaLW1Oc+HwzTxtjuj08MzTAl5Oaqe5YxPc79Rbz6VTN0iRhaOcS8/kd4AhLO5eyB8Nm3M0qOxjaFBNYlHJOb1Lx78FvTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P4AoBYwMd67CoAGepFvKIjJSghMh+UenluZzcjILkc=;
 b=UNQolKeMwfj0vdzdGmDdeFU6guATE68KbLEOwRGiXWwYtcdJXxbxkbylxPjz46qmgKr2uleidmzyDjshV4v4yj8IMuDZO17vHY61dLaCKPIP2cDinv7xKKyYj7Upi5YmU1ZbXOiNum4RYV1u156KgH918tCWekkCPcPLVIJol2KYHSvk8brrz0VrcQvT1HaeE2lGlsNyjRq9GmB7ZCJP9+1uO60B9fLviYLVF5z7fuTKaC0FK54cNjTmOzm2eAJLvG1KlXbNwqH5QOZqDy9+/4uBBTdJT8yb6haLAH4F3B4KfqKNoD7fEMeeJLQw9jlBmVZ89GuBnJW3om5Dr1nB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 00:30:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 00:30:15 +0000
Date: Thu, 26 Feb 2026 16:30:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, 
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Message-ID: <20260227003012.GZ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
 <cee11fc6bf06997d88c0b100c0ec2ecbde512cb7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cee11fc6bf06997d88c0b100c0ec2ecbde512cb7.camel@intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d96201-222f-41c7-f6bf-08de7597608a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: LCftq6H99TvyQooN0sFUhWEs6+Ro27iKY5AFqNSYwmz0YVmeTXFJBkG7FDhQnEcUw/XQ+oYKICD7sL6CMAPpgBXmJhS6tBb0ag9tp9tomegnQVHPiQxrCivd7WnR/uu854CE7x4KF4wzVhGNTZWSBGtLbHOP5rLLGwjslP7LidXcfQD6ZjMNCspF5LGQJWtOjgQTkCWGnDKZNlNwAOJUHIYvLbEgdmaZiqwDZGi2t6BGWU/JgB7AtUuq9Niue0eMMu+vCoIPPthw6lD6G7EGYwBGbChy+JKlVa/aS/kENvbzvl684/qCbf/elfLdtcQ6RJ1m1ePYgWnpLaKBtmfDrDu1ECX7fCaSlpJn8TXE09RgaV+upZOhAvsC5PLj8ddDsHyJ4YIfGElGpPSuN3vhq4eXK1CU/qFSSTrK6GpkRyBikVlg53UYS9ShDRnd/q8yFOpWdoe3x1+JwvbZy967ff/XMV1O60z+HhPyI9WFUAg/x9CF4v2SElCEGfaxUGlWdhGlAtD4SHPLPKafT9hFG21vVxzDoEZ7zSch4zwSO7Yh23d+fMi2wlksHA3M6qvHptyQhYWlrMEIWmYxh5nAkedTl3AsmtUgMe8ubHzDKp0K0TGTRaedjWUb5cugASWo35KDDb1PK7Vvs3wNsMTtO9XagIUT5B2LOI+Tyd+F9s6yPPLUtSQUy7FuXJbeDEHxmBpiuVvRDaPWwGGGWSsUCjKvL8iwltATMEbleuwoy/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7ljhqvFxgSEhj1kYKqxkc8gym14wQFR7UoiOyKC9S/ZmLDicoKVFz5Xqee?=
 =?iso-8859-1?Q?3UOCgg/mCER2yvzmtGzLXDqkbGAOTiJIzUGlWCtPQKqb5/McgBaK/6IKhK?=
 =?iso-8859-1?Q?C+RYpnnclv/UI559E3dup36M4gel2uV0JqkT4SZn3Gp9tcRJj5cnQQXQ1l?=
 =?iso-8859-1?Q?glDgU4Oh86FQ7GHkdNqY1/zEq/G2NdPOTOKJpozjlg3slH/nFbNbSs7tE/?=
 =?iso-8859-1?Q?kCK9TuKjEBUeC6E+jWTpjZS93xfrnUzQpNZYziTL6C925fgg+8jqQPFuXm?=
 =?iso-8859-1?Q?X4R2sxs6/BvNFdowbQIlnmtHRpAapBv8c5150GWvzTggb6mXu0ld2Ameyo?=
 =?iso-8859-1?Q?TYdH1WBuym0P1jClLf9wpXhoSqqp3gan8XPge6eoX+VVXohmpaRKJ8Wrzq?=
 =?iso-8859-1?Q?R1SmKGoNcvtZyMCqLccIZA5wDKnggQMS3r3c11+mqSlBaD72u2CGojqCtN?=
 =?iso-8859-1?Q?Rfyg/C5wU3qxwpywFKLKtLrpQTsA3fA01/3jaOytTXPzJg0ww5SZ6OObZu?=
 =?iso-8859-1?Q?vTLtRqYgOh2WG1HupBRYXSBnpgV1R8iTEs8ppJKdjxMRxWjQU2Ye6k1uWe?=
 =?iso-8859-1?Q?aj4A2mxgkc8/QWywbeMAdJyPdxd3fnZ18QGC3zxVQMa50kALZaJouw5bvn?=
 =?iso-8859-1?Q?QmZ4QtlGhtPxJ7iRAjOySXZ8HGzyIlAjPj4H35V0GPMB2ZF3/LnKe0mags?=
 =?iso-8859-1?Q?yOIXMosvA+yO0hpsLgnNfpmSnVRhJkHHjZo8twWA4OmFzhuedUX4RbH5wn?=
 =?iso-8859-1?Q?GGGM8YvKyKmLFFXf722mdHgGa6RSt4bjL5QXNDRhc9E0RZ8C0Hq9VC5TAf?=
 =?iso-8859-1?Q?qk0vc5O/dVh19341SJ25Lo2f2zgQwQEuKRiapWcrwG0kxi49usx9bruSAK?=
 =?iso-8859-1?Q?mY/W1i75dQHB0L9V9USJFZJwnRHMxXXh85NWYwqmEN91IOgOTmq4w0HR3O?=
 =?iso-8859-1?Q?GNTCxtjZImZAK8q9eGgLkzNnSz/qzs56MGQ/kf/XFbPhirutls7LsK4Sz3?=
 =?iso-8859-1?Q?kcBxCCK1XRDA3SUy/zrwmhVW1Jan3xT+n2mG/uSh3ra1f+9Ap8yIBwxbBn?=
 =?iso-8859-1?Q?KAlVRJFzpGs/cFkHyeOPVU0Qml4lLbWXPsSWwxaNDYfPLlD2uheBM64AEX?=
 =?iso-8859-1?Q?M3aWU0ksmxIekZMX04QTDt81QWa8ix9/O1zHQyFeE7whgmfUYX19TwFnEN?=
 =?iso-8859-1?Q?VovAiUBD3XdNDjMCA7iBAUzZAeb+dxXIwDViomDjSh+D10K9WOBltrGB4f?=
 =?iso-8859-1?Q?6doppiI04mzM/CzLTjmsnEzCt2/7ig2TE8SFg1Iek083VER3R5tRYmehuZ?=
 =?iso-8859-1?Q?c8TCHpLyQF40jiTBr7e+UN3QPYSZbNfwG//ONPnBULTyCmDGLT2p8iTBMQ?=
 =?iso-8859-1?Q?39Vj8PlH62S8Dj3xKKhVn7EEUkhziaCRNGFXPh8Ibyg53d3omIkV8yrToV?=
 =?iso-8859-1?Q?gPDFbzCAB8P/OYlQvB9OZmQ2ClO0X4hl+YsjS6k/n27nweBkfJJRlCoVwQ?=
 =?iso-8859-1?Q?GBBdkOsCfk0UJf6hRiDNesGb1T4h2k1qHvhirLielJtmMZMo8JWSq89oRK?=
 =?iso-8859-1?Q?QIHy01RUvv+OD6ctBxz9tqcu7o7sskvqKyBbMKfJGdemieUi6FK19BNOTg?=
 =?iso-8859-1?Q?P6JL21v3TW+p4E2IMPjeSgZokZwv0DjtR76sWsMpRZWTvJy0qLixNmaKPc?=
 =?iso-8859-1?Q?lEXRvBAoL8O6NKxNFk49jPfpGt+hwcMbTdJiStBHFqUAj/N443Kgq5VIGS?=
 =?iso-8859-1?Q?6U4UeVE75OwKxbSqagXOm5ecPioxe1fT1HoX4M9v7SB6wJA0W8eh6CYsGf?=
 =?iso-8859-1?Q?A9NgET3Huh97oOAw1Qa/fNiM6dfk1UA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d96201-222f-41c7-f6bf-08de7597608a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:30:15.5625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUQIMe3NTrsvN/2W51GHH2u38rcTpPctmwNkmTEXfd+/VpNEUThQJeK1aEul8wsNiGRz5d7CpxTg2NIGYD00SMVXVsRSjPznif9ohekhdGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
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

On Thu, Feb 26, 2026 at 11:37:17PM +0000, Summers, Stuart wrote:
> On Mon, 2026-02-16 at 19:21 +0530, Nareshkumar Gollakoti wrote:
> >  While previously applied only to the BMG G21(Battle image) platform
> >  via workaround Wa_14022085890,this 1.2 GHz minimum is now the
> 
> nit: space after comma
> 
> > default
> >  for BMG and CRI platforms.
> > 
> >  Setting this frequency floor(1.2GHz) default is critical in multi
> > GPU
> >  environment for supporting effective Peer-to-Peer(P2P) transactions.
> > 
> > Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 5e5495a39a3c..881054c9cf92 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -860,6 +860,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
> > *pc)
> >  {
> >         struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
> >         int ret;
> > +       struct xe_device *xe = pc_to_xe(pc);
> >  
> >         lockdep_assert_held(&pc->freq_lock);
> >  
> > @@ -885,7 +886,13 @@ static int pc_adjust_freq_bounds(struct
> > xe_guc_pc *pc)
> >         if (pc_get_min_freq(pc) > pc->rp0_freq)
> >                 ret = pc_set_min_freq(pc, pc->rp0_freq);
> >  
> > -       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
> > +       /*
> > +        * Setting GT RP min frequency to 1.2GHz by default for
> > +        * all BMG and CRI(For BMG G21 WA do the same).
> 
> Should we add a comment here that this is the active frequency, so if
> the device is idle we aren't expecting high power output across the
> board with this?

But I think we are going to see higher power because of this?  We're
raising the minimum frequency that the GT is able to drop to, so during
light usage (e.g., casual desktop use) we'd be using more power now.  I
don't know how much extra power (and heat) the frequency change would
translate to in real-world usage, but I imagine it's probably going to
be measurable.

I'm a bit worried that we may be adding a power regression here for the
majority of existing BMG users in an attempt to improve performance for
a very specialized corner case (multi-GPU with cross-device sharing).
Can't we tighten this logic up and only boost the minimum when we're
sure there are multiple GPUs and/or there's actually cross-GPU sharing
going on as suggested earlier in the thread?

> 
> > +        */
> > +       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
> > +           (xe->info.platform == XE_BATTLEMAGE ||
> > +                        xe->info.platform == XE_CRESCENTISLAND))

Aside from the concerns above, I think we should also avoid putting
exact platform matches in "random" functions in the driver when
possible.  If this truly needs to be based solely on platforms then it
should be a feature flag in the device descriptors for those platforms
so that it's easy to extend when enabling new platforms in the future
without needing to track down specific spots in the code like this.  Or
maybe we can even use an existing feature flag --- is there anything
truly specific to BMG/CRI here, or should this really be an 'is_dgpu'
check?

If we can tighten up the condition based on runtime detection, then the
condition here could either be a function call to a function that checks
the necessary conditions, or an xe->info field that we can adjust
elsewhere as the conditions change.


Matt

> 
> Thomas already mentioned the indentation. Would be nice to get an ack
> also from Vinay (cc'd) on this one.
> 
> Otherwise:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
> >                 ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
> > pc_get_min_freq(pc)));
> >  
> >  out:
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
