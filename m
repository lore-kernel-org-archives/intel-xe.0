Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF87ACA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C90210E360;
	Tue,  6 Oct 2026 10:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klkYI1WP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEC810E2A3;
 Tue,  6 Oct 2026 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791281774; x=1822817774;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=z3lwzp0wfH0osS/zg7y/u8NTf4p+pMfxIoCehKO4tZU=;
 b=klkYI1WPDco36KuAyRBEanGKvql7dcjlaGy0qqYv8mzGkSAvHP0lga1P
 GrG0WiDMWMIRT79hmYV4u2iGFOb2apXBG1b1LUZk6luTGoZb2Jc2oOTHQ
 77KzJSyI4PnAucewIweMJdbLfSvFm83cBrUxRX15h9+TaY2VZhjxYpcYb
 TczYGKrFR7WD/RROlCX4OYvkz4lDzpqmd1NFPY4GL4FVBtA60Tj/gtRIN
 nok0Y7NmDayK8sQTn6tCXHznf9It2G/y4Hdytv9T9h7A1DGF7rHYx8iri
 tsDNqjzQ9Agk9aH57Do4y2IoZYr5yiqt+PRfwetpUEhTkB9cdxnmZDA4s A==;
X-CSE-ConnectionGUID: CL6dSD+wRECqEWL+NFW2Ig==
X-CSE-MsgGUID: kc4NugZtQ/uRsQ1jrPcNgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113753274"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="113753274"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:16:14 -0700
X-CSE-ConnectionGUID: nQ/mAWwsSA2qKkEim1ZTsQ==
X-CSE-MsgGUID: tmkx0NgARjie3oVzN350pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="281893234"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 03:16:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:16:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 03:16:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v89zaqn/0SLZAZc7b+zvzI3Irvs4NXfUl6IKzQ5vIg9rWUnXY9MYvnHaSgxPger3GyKTeQK/+jQyBmvpIfeKVptIiqc8cCoXssGsZ0x9y2uuGhzjwcZ15AVPEv+AVCdOeivSdPzqZMOYQu2r7apVDSvFkW4MsJiFIzWxKOKCKU37pdBrdDTj65bey3aL0Qwc0wQP6eVX1GsOIeMXNiLtwEwu3et4pyDm6EVJ54MBYQY+uLHy3VTlTA8xZ8xeM+hSVpTKLADvukfW1zNzyQpi/vGhZtdseLseHXdTIgDZiP93N/Snr90RJ0WVGc7Gn7AK1J3NLtr98pkyTBcFNPS5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/YNCUQ0tOdYNWm5PK+s77r/0HqahbEXBS4FbUS0IBg=;
 b=g16iPYBt2gwlkHuGzzU5jl2qwoelHD2y0xKobVMbYkMPTEQ7R+koJ1l11dmPx5nexkcF/sy3roflm0fvEgQt0BnDjr7VmFvUDx2m769Q5E8jEWKo4qYfi4vqcTLv/ivjt6Y3rOPcQCnz2Xl5QGCWl4ia3cYKTovhchJZaAfWuAia6AHV7LEztAtPaXAIbZmr2uPsRV9iDKV2X9VTRl3wwFmDvmxXOJZ3H5xvE/bxtcQOH8RUa1acEjvoHLVzLlZznI5J5w96WaN/sfM7G4L5pOp6a74+hgZ+SsMTPLDFoil+/wpd9bp61+vVOnidzri0DBfvT+EYzMU0qEq4UbnNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by LV0PR11MB9837.namprd11.prod.outlook.com (2603:10b6:408:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 10:16:10 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 10:16:10 +0000
Date: Tue, 6 Oct 2026 13:16:02 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nautiyal, 
 Ankit K" <ankit.k.nautiyal@intel.com>, "arun.r.murthy@intel.comm"
 <arun.r.murthy@intel.comm>
Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Message-ID: <asTKYt20sv0MZWTR@ideak-desk.lan>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3P280CA0119.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::20) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|LV0PR11MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ad2200-14da-4a1b-ac14-08df2392d753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|5023799004|4143699003|56012099006|22082099003|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: +84oDuKWVjam+pk3F6AMiS3lID0Lwz/YjKxPkXs0IUa9k5TpdfRQCzLXnf9OebWg+gr0XvLwCL2ud1a4XSi3tdVklOH7GeJZapFhdvpSDo8Ctqbe9gnRswE5KQrrm1omWg9vFmTKA/vPvgKP5J8diyPaSD4mbTrKss3oO2cMJdfFB8jQ6RhPGUfgWlTfNyMRkXQpsOPMHDo5mVl2SFrAr5sx4dYWjcBLHafk1ZJSFuwt0lyrsFbeTITLcKZkuZMTnl+GC8gLaUaWLm/7Eaz5kMHMOlsa3T+GQdFv0nVX6RjfpA00LXSAgf25OEdoT2smrZ7/9yLKradC+E8voEyfxkD/hFqhTzun0wfLxeUn1/8hNQd8LXq21lwkV6/Di+vIX3i7PgEUy0uIPE38xpaMyJQxc19ggYRR7lwgNRi4GaT7QhX8Yfn3CtOb6HeeYWGEA+x6no1l8VSKpgbuSjvmQkm5jWpnuiZnil6X7Z8Y/cKpTOXxscv1D/BdKPMxvTAaRpKV68QHqDxgxPNoitKKgGvWEv0ASOr8VVmQFDZgKsoHEExVtX3BmmulMxV7CU9hPYa2E7kXOx4q6Sg3M3FL44YTdtneF/Rxq2b38I3kwTO1xFb+0vZ37rD1WAdcCaeh5ma50XRTuRumzdtdS5XIdhqGb8YvwbZ3D9vBxSIQTNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(5023799004)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hnUEwWSI9X588rAWCoypWbTnRehFSxRplB/w+OaF9x/t6OE13X8GfjQAbp0?=
 =?us-ascii?Q?Ecr+84Ei+iOfQjSwZGQ+eyiClTxRCsE+tM0/eVqhX8L7hRly7PnWj1Sj3mfA?=
 =?us-ascii?Q?hPwZdQ8MefrMzdVbg33S7oc70y9OUlzUmBF9i2o8HvmspvtjMag7Zg7S2Lw4?=
 =?us-ascii?Q?pJQGkoH+aDHKajMvampES9ZmvQmv8zvFv5Nj2C6Ab/EtcMf1HBLvJJD22Dma?=
 =?us-ascii?Q?5EwNfhlRTgLvwb/UdVMAGrkBo0FCmzzVY+xG03m2BY966jDJzm8gBQv6iA40?=
 =?us-ascii?Q?45xqs5QUYMhRlQqqec5JZcSXK36kVvWzaG4c4+n9cLI43sEjmi+EUPbUAif+?=
 =?us-ascii?Q?zovIggoorh5N6Kw9h+y/+8Q9wQX289giLVlcfjKgSF6/11cAY3Hus9HrmlmT?=
 =?us-ascii?Q?odhaCRBR0XylwIRcGauZwjlp9wQftviaovymcIMAPJZxc3zq2yayPsMrKlX9?=
 =?us-ascii?Q?UCU3bpACt+VQAtGr3ql3PVzQdP/Ncxq5SuRph5wqStcF5I3pwKrnbmOclzYk?=
 =?us-ascii?Q?B/T2rwngyjddGiXl0iWuk7+bwTCX5XS8/6dg37Od1KQIOfSDKc7zlbbD4n+P?=
 =?us-ascii?Q?eVU7Hjuuut44iUapHia20it5qKrkldlopaYUip2DfRDgTmvAjOg01z7a+Hqa?=
 =?us-ascii?Q?9atoAqchEbygqJid6+HlqGHB5oqbUlTaYTKxSsPR2gppHkDXcV+PZBEw0eF5?=
 =?us-ascii?Q?rf5OObWYZdUH5/ao4NHo/X5cE/ylRVY582djKuz/RriCLmHKcF5ul4lq7WnM?=
 =?us-ascii?Q?maWiUByjFrloAKJGvHb7p/9jfVjI1EOOGatnmRG7u4kOtfSTIvt7lWa93gJL?=
 =?us-ascii?Q?eTplkyhSqxnL+/x4uF/czcfWSxeX5EEDNECYW4CDTRnEW/iCdQngfX8fMmpk?=
 =?us-ascii?Q?m7V/6+120gTm76RbcK5d7VmBhtV8NUROUCQLsNRlf1JHZ+KFIJRebqj3g1dU?=
 =?us-ascii?Q?9uFTzrodobXCocXFMgupljVVsCQe8TazXpv0yuOwb4Ubl/FE2xMwA7IEqivL?=
 =?us-ascii?Q?LDqi8NN9cvsd88AndizjDV4AN48wIHtwpx3P7PAmVzYXLMJtxvg9LR2c6+oh?=
 =?us-ascii?Q?LN1wJ+txL69cPWnwQPETryGP6tFCR98UGdI8MJ7zOyDB9Kg96tN3f2G/de9L?=
 =?us-ascii?Q?Ryg5Ze74RCLB/lCoGtzG/WOhIoJqbvq0iJ+w818e7XjCvzK0kUjpr9AVbxFJ?=
 =?us-ascii?Q?KAwcR2FEpx5zVoSFgwJM9B7lK0P/9sWX2fxGG1OY2kW/cPp4xim/f5ChmSAt?=
 =?us-ascii?Q?Q7CGnxNX/n/I7q5sEes09dfH6yCCe8sKA/6SY2JbjAqSlHM7ULFjd6cYB16W?=
 =?us-ascii?Q?hnPukJ/ST2JH0hWUnjPAHKedFl0pWfqqERfIRb9zlgMP4wkTKsXoo77TLi3s?=
 =?us-ascii?Q?vBubNbFt4ifXXb2DZu27mAFD7t5Ral5Wync1V44E9c6Psay+hS3YonkJvbUk?=
 =?us-ascii?Q?HLmzJOxaIL4jr8jdp3BhJDuj0b6mcdx4B+yagC727Aj/OBghyDy8ZHAHrYDI?=
 =?us-ascii?Q?BtfrwdLPU5ctql31mVrNlAKT8A/f0zczTLYA90VgXYqFz4DaS02f6/P3bqYb?=
 =?us-ascii?Q?3XwMH8fmQUoEh+xDZG10oGw2DozuXotm2PwQKBO01C1pjgfbO4EnrhzXEBKN?=
 =?us-ascii?Q?JY6mcptwTSHmD+g2zo6OhW3yQEVen4oUNEMX1XyF33tdkjWOPDjAm+sApEOk?=
 =?us-ascii?Q?sjNgYyvHAk2/dmElrnkurXr5ZsBqLuDApk2q6dtywpiPVzHWddRrsyH2Wqi+?=
 =?us-ascii?Q?ez+zMmADjg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 5uHho3/S13+g5W50bsohYEtpJ+vv/mfu2bfUk4upSp2lGf7UurgsFD7Q+GOzhR3IIFDqejRr/SLaoGF9niiZX+MYqYmx2UZ9Ji4sQcjQVpHePnvAjo5yMU4hoFKMVEJtolWjV6nK9YQuXAvz2peQc1DZk4WGD/uBJPtH1y3+d7EvDDaD0U5NcLPn1uZGxsdMsOMGuU2D4cdm6+LCEqNjBnM0ZcMN4fSwnFerWeLQKq7OPkoEje4XER/X3FTVmfPnKzQAg/yKUyt7RJiQjBgI7pvhOEmsqHzU7PngsjP2atGBoXV3G664eoCaUKBTrYOqgrcxdxV+u8BXUUAiMT6zRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ad2200-14da-4a1b-ac14-08df2392d753
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:16:09.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAPTGlPqrVkcBIsftc1+IU9ULK9oIZM43XPEQ6R1C6/eSMhQXkx6xvZugVZ2PF4wAKxAnHWmaKVmyCrIXtwtnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9837
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2026 at 11:44:13AM +0300, Kandpal, Suraj wrote:
> > arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> > override is held
> > 
> > On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it
> > > until
> > > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5 ms
> > > after the last AUX transfer. That is seconds on a typical panel.
> > > The AUX domains now block DC states on Xe3p_LPD, so that reference
> > > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay and
> > > never gets a window, and its residency counter does not increment.
> > > Nothing in the panel power sequence needs DC states off for as long as
> > > the override is held. Take AUX IO instead, which powers up the same
> > > well without blocking DC states, the same split
> > > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers still
> > > take the DC state blocking domain around each transfer.

What causes the continuous AUX transfers which leads to "DC3co never
getting a window"?

> > > Bspec: 49277
> > > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> > > DC_off")
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++----
> > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > > b/drivers/gpu/drm/i915/display/intel_pps.c
> > > index d4c98b150fa2..bdbaa10bce23 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > > @@ -11,6 +11,7 @@
> > >  #include "g4x_dp.h"
> > >  #include "intel_de.h"
> > >  #include "intel_display_jiffies.h"
> > > +#include "intel_display_power.h"
> > >  #include "intel_display_power_well.h"
> > >  #include "intel_display_regs.h"
> > >  #include "intel_display_types.h"
> > > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp
> > *intel_dp)
> > >  	return control;
> > >  }
> > >
> > > +static enum intel_display_power_domain
> > > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> > > +	struct intel_display *display = to_intel_display(intel_dp);
> > > +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
> > > +
> > > +	if (DISPLAY_VER(display) >= 35 && !intel_encoder_is_tc(&dig_port-
> > >base))
> > > +		return intel_display_power_aux_io_domain(display,
> > > +dig_port->aux_ch);
> > 
> > Seems like this is something that the power domain framework should take
> > care of instead of hacking together locally.
> 
> Actually it does not at least not for Xe3p which now has DC_OFF when taking AUX domain,
> Because of that when PPS take AUX power domain it also takes DC_OFF(exiting DC states) which is not required
> And since it keeps the reference for longer than what a normal aux transaction would DC3CO does not increment its
> Counter.
> 
> > 
> > Cc: Imre, which you should pretty much always do when doing anything
> > related to power domains.
> > 
> 
> Sure will keep in mind going forward.
> 
> Regards,
> Suraj Kandpal
> 
> > 
> > BR,
> > Jani.
> > 
> > > +
> > > +	return intel_aux_power_domain(dig_port); }
> > > +
> > >  /*
> > >   * Must be paired with intel_pps_vdd_off_unlocked().
> > >   * Must hold pps_mutex around the whole on/off sequence.
> > > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> > > *intel_dp)
> > >
> > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> > > -
> > intel_aux_power_domain(dig_port));
> > > +
> > intel_pps_vdd_power_domain(intel_dp));
> > >
> > >  	pp_stat_reg = _pp_stat_reg(intel_dp);
> > >  	pp_ctrl_reg = _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ static
> > > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
> > >  	}
> > >
> > >  	intel_display_power_put(display,
> > > -				intel_aux_power_domain(dig_port),
> > > +				intel_pps_vdd_power_domain(intel_dp),
> > >  				fetch_and_zero(&intel_dp-
> > >pps.vdd_wakeref));
> > >  }
> > >
> > > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> > > *intel_dp)
> > >
> > >  	/* We got a reference when we enabled the VDD. */
> > >  	intel_display_power_put(display,
> > > -				intel_aux_power_domain(dig_port),
> > > +				intel_pps_vdd_power_domain(intel_dp),
> > >  				fetch_and_zero(&intel_dp-
> > >pps.vdd_wakeref));
> > >  }
> > >
> > > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> > *intel_dp)
> > >  		    pps_name(intel_dp));
> > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > >  	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
> > > -
> > intel_aux_power_domain(dig_port));
> > > +
> > intel_pps_vdd_power_domain(intel_dp));
> > >  }
> > >
> > >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
> > 
> > --
> > Jani Nikula, Intel
