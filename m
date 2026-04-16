Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AB8F8D775
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 19:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D010E10F;
	Thu, 16 Apr 2026 19:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFtsQI0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BAF10E10F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369188; x=1807905188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WeoC/NsD2j1XtY1KzKwdYPdXwQJnFrUbrjCHZCh45x8=;
 b=kFtsQI0oJX4VOr5/RW1ju35ResX8g/UPG46tAK0xQeMYeT0y7pR1vn2k
 2qxU44djBYMRPbCI6RnbDUgqX0+MRiC6ICJD8tC9ICDn810clpT8OacW0
 Xexw2oLV0rkd3m1xIdolMDFg5duUDfgvhwCtxHJvE7c+7lCgJE02Mpd/l
 mmbCZaaE39ygYbqMW0Tldj0chYOcJUoTaSbEa5Hpg+GJGp582XaqkjAff
 rxolKZyU5I9l656jPm3HcZAH2wLTH0KvmtWbpGBH3ImWyPlBh6DQlIFhV
 FbRiaCo1c/DNflsvrk0m8W/TWaS+dxxSmKCwOvPGO8VpVqV0FqJjiJjTS w==;
X-CSE-ConnectionGUID: P8PA2jnzRzq/fwE6abbT6Q==
X-CSE-MsgGUID: ehAj2I+hQ0KxG4KuijiBPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="64922309"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="64922309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:53:07 -0700
X-CSE-ConnectionGUID: mfwt/KatTeWyklK5AvgTOg==
X-CSE-MsgGUID: 5lXt135WSb+LKPIViRjjOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="228161701"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:53:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:53:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:53:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:53:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GirGk3MiSHwSsi8BMuYmFup9oKG2cK5mbTG+Q7DquXBggfc3ua5EKkkUhGUWgv2m1PL31Y5GOf/VQdUJHAtFbpoUFKIKXkSMkgtE0KCJ61oYYXPLx/iTTD0ClkFs6NPpgIuF8gPdp+5Rqwfe/qzpj9nMoqnp8WCBwPHNKrVIULAQRvObbTijKAIJkH1Y5xfEEOve7oPwiAXGlPpkmH1WT0MrkWs53S6/VaLqUcfncDfRGalhzrC3EtvaA+MIlUzAbfaiuEhSsQf2yPvsZyUm4ZWskdkq0Z6cOK7q17ZAXpc6gXohIb/jxP9um0HJQWQkNThAoZLAO5eq8+1hoHOE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po2w8AREQJB/Abyl3M+18OMpog/uiWVNpP6OgCRDAtg=;
 b=STUX3YpBpEbU4cv8dMB3JUonJo622B0StcXClKV3ZLeE/+H+ICmtr1bPzjE6YIwrBbgguXP1ozcGw0XITDISk0H1eEA6PNx3lSLndA8j0o1pp0BDP7iJ8nS+HGaTuCavGj392se6kR9YQIUO9K+HZeBnpoRoWD/YULqOToTsJWD9LIEK5lOGdveCqeO9HUCXd9qvUIYQ2Tei+eUHyFkQ2oYg1/GJRbqyCfhKremPzQk9gKFMzyp1f/iUKJSFk6pF1PwryUofru/koSmStdE1wn0hqGVK3kaffba+eLMRrcBTHce1Gmn4PkBu5l1TaO/XVy9MrnRxNJJ+t4rWni/YZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 19:53:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 19:53:02 +0000
Date: Thu, 16 Apr 2026 12:52:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
Message-ID: <20260416195259.GH755471@mdroper-desk1.amr.corp.intel.com>
References: <20260326161628.3566067-1-varun.gupta@intel.com>
 <SJ1PR11MB6204EADD5B9E90199041284E81232@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204EADD5B9E90199041284E81232@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3996c91a-e704-4d7c-6e21-08de9bf1c479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: gyZ9d6/dTtDU8EJdEtjfxZDjIHW3L6COzg0PkpSIHf+X9yRMCPIuuGsczDzfB2y39JUp4hLoCpQczTGN1tAJLymK3Ooiz7X4mmHR3YCGjttwue2RRtJwAgqSc08NJsNXomNSMdyB/bO5Sxc8kZxQSqPu+NuW8N+7LLgLR+3tENaNTNvlRo0T7RKoJXYnj+xSPUCnHms8PtMlGfkvmx/oe1Atp5Gs5HxD6wikbEVeyKf/0y3DS8ykUq2zlXX4G+m6Rbf0BaPqR2Zx4RYVFSEUSIV1J2cUeYkgHq8leSpHZ/ww8HV6Y3ECKEqbZd66zkOmbF8i/fsiNG6npWhWBTTXQy3di8XCSMuyMcgITrlmSMH66fKoIJjQdgcdR6TyU/KkZJiG03nQn7qEpympMZGvihMmem5nIO55qyhwOsi1Ni24Fz03M3u1iDbsciwygLXww9rqzj+BAzUTmt9ZoLT/bus760xEg9rmjZgLcvmdaYL3FVRNdmU76DyB2ntMmekOCwcKVbIfEQN0qDzRggxBPpjkRhPODJZYrJ1OaVy4GOr8J0W/KghcUOc6npw2Qo4mGzx9f+zQm28sgNhv9ZWT/MjCmbRol6V8ZMEuA8i6G4HQ6zsHzZXmQVP38EzRnH+H3v07jwlyB781HFmNMiUqdv3pcKAz7ipw8BBBJOGuqwomHuE637ZIgs3fTEsxYa77EJr+VsWDvaVGwFg90abXwHEy0Xx5d+qRgl+sgjJIED0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tcr79hZK+IG3YVy8NDZSDZxNef4kSSb0fNx/Epq86u1DsJ/EkPWwkaGZ655c?=
 =?us-ascii?Q?kg/cLqjQCV6mgxhvPf5tmh3IfdJ1b3dr5qO4taQInyNPrrH0a5RvgC1AIc04?=
 =?us-ascii?Q?cCcBm/gVHqytXBpkPKyxjnGzmr9+cEh2Daliw+gREvEQK4oEs2Shs2a4ODv4?=
 =?us-ascii?Q?1CQ6EAIGQVtL7oCanysF6Q5XqfdA3TZ1aSYg2wo37mJTawKkXNRtmzioIoK/?=
 =?us-ascii?Q?/YDNnrbAcYqE8slpvParsbRBrro7wioWFDRq7S0cpGt51tJuh60Tg1vUDQuT?=
 =?us-ascii?Q?+ILCLqi8ddanY6K+eO0pZZejeYei5OhuGRCO1h+ZAFbTW4NG8eUOL1pBJfLW?=
 =?us-ascii?Q?S2383pCixLoKa8EEM/VGZv/Rx1Mugba0HX+l7u46vbxAYlK/F6aY6GVNrs4y?=
 =?us-ascii?Q?pF9LnDNNffpNQ5tvaB2IJSmKorCAPfY4DJtFCrG+XPnMf+94W8L+joGBny23?=
 =?us-ascii?Q?4KIKH9b/aRYtuCN2PZqol/GUemXb2j1ogJ0ys+bQ2q+G7AwPuS0n1rfOgL2+?=
 =?us-ascii?Q?hYZnyRfmnJQ0lapH4/k98gcpULHf4iqFFNqqJY+noXCg7ofvPRk6N5y1XeX6?=
 =?us-ascii?Q?ttQPoPzrJwNzJO0G2hGE8j20PlY3inG5qMGePvYHeWxY1df9XsdqSqBupWVL?=
 =?us-ascii?Q?4H3gWI40e+WkElWjq/GIkW2jJsAb1QhiWD+NuLu2qpOkrMNFAWz39r3QbADl?=
 =?us-ascii?Q?3o1UDaUuBoZuSCbWXj6T2JqghCZ0C5WL7oNdtGaNHqa5E86qZ2jwD8Rj9zVs?=
 =?us-ascii?Q?X6DKXrKIb4n9hGD5M/jVyoRiiLVkGPI8lQ3X47pO5CTt9ncU276C0FDGqsVc?=
 =?us-ascii?Q?bqflDLjUnhsgedBBzHVx4UfZuVDcW6KFWaow7Wb4GpQCfAotKO07D6Y9YyhJ?=
 =?us-ascii?Q?/uyvgD7btZiHNYUWBdmeE+yyipYY0rXaOjmtYDLTHs0qDMEP50sBpMa1Otej?=
 =?us-ascii?Q?n20Y3v6EV3l43IxqfnQXjh1ySDVa3WTQnYzYvDARkWRZMdcnjaliLbf8GWKd?=
 =?us-ascii?Q?Cb+Etr7GtgtpZyhdPl+Fc3m44ADIPiPiaHLDZJTUzqc9o9Dh6Vc/IXCQJoUR?=
 =?us-ascii?Q?sckNQL2FEbGQSvaQ7mwP0CUN1HXgJy89gtF3WyO5YysV0kafR55Fu7tdtgPd?=
 =?us-ascii?Q?2MXyVk5xi6aAxLAgr1iy9VzdgMN0vh9gTrAMH0QwF5ztljue04WmJW8rtinK?=
 =?us-ascii?Q?dGKfkK5sXqzOEk1ZlKvPGWwbkfH4AOmuakiqdQo0mFqj0R9DQQhB9f5mnxye?=
 =?us-ascii?Q?/RHQmII168FN13ob+JJEjFziPTO29jFt+v14z4pcAYkpERtTngNikP+lVHTe?=
 =?us-ascii?Q?pAmlpM9DXErraV3RFIw4+Mx4o7vGhkN+Dj1wElYWrd73jwLTTZKEbadFYQUj?=
 =?us-ascii?Q?ouEh610I/P5Qn+K7FENVlVlLeeTtZFaCJuoc39lzLrjGjO7IF0UBqNthPMKX?=
 =?us-ascii?Q?e30BKv0w50TJEilUD1x4lUTx0BWTjTxzJ1laWSfrZCuSTRAyPAkvYbRUXY5K?=
 =?us-ascii?Q?kkwChlg+ECLX6QVCJUpdRdJHhwAr3MFWwUqmhXDZiAGHVdP9qvpdA7GzFp5z?=
 =?us-ascii?Q?SqkzrCKqMQj1ctd03vC16bFfslSNeF9aR+wio2qBGGzL8ALlvH+co+fqw+n0?=
 =?us-ascii?Q?Wi3hu+t3oSEjGarjv1rsevZ/AsIVM/L9jxuI3DGGNGuUoUCDHC3W/cGvfdqK?=
 =?us-ascii?Q?mBTVtQHG0UGhIUZucOkc39WiUOK+Xe1SxADa+IY7sEGMIarsfqFwE33LP+Q1?=
 =?us-ascii?Q?tywtNy3BFAvrMHwo9ssbVqtB9DK4S7Y=3D?=
X-Exchange-RoutingPolicyChecked: JFHYmHhSs481p8WOymE3My0IacH1v6UHr6CLBGMJQ1uUoXx0udSZjoS/GZcK/+bUnNUUoVKxt2dvqFH8SqvmO26ESX3EKkCMTD9vnahgLvKeuTcsrm1fe2ni6rPPNTmKILeHfyJObwAyhCNu6tfkS5TW+oPLPk8QnG8IvRtqei8+P4akLRGphiNZ/1aiMhvB2WvrfEG/yFNX04vZPzU7tDP9PB82CSEjTzknDCKYB21l4LTg7DTXSw68V3uMaFz2rOqaKbA59v6iqLweQh+4/25P/aF8Shz5/a9oSlTPHe3AY/StqGOughODzAEkpu17yyWUO/dPJaC+g4YPTQPcEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3996c91a-e704-4d7c-6e21-08de9bf1c479
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:53:02.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43lCkbS4Wv3utnDmLND85YXQrwijsSRlksX/1d1C2p58R18ouhhZIwpQ6WL3ZMWHu7cEoZOwaf3rULjBtp/TTssAahgVO04k7J0QYBtCfKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

On Thu, Apr 16, 2026 at 09:58:02AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Gupta, Varun <varun.gupta@intel.com>
> > Sent: 26 March 2026 21:46
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>
> > Subject: [PATCH] drm/xe/xe3p_lpg: Add Wa_18044193044
> > 
> > Add engine workaround Wa_18044193044 for graphics version
> > 35.10 stepping A0..B0.
> > 
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 4ebaa0888a43..f92c6ffd4d0a 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -560,6 +560,7 @@
> >  #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
> > 
> >  #define TDL_CHICKEN				XE_REG_MCR(0xe5f4,
> > XE_REG_OPTION_MASKED)
> > +#define   BIT_APQ_OPT_DIS			REG_BIT(14)
> >  #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> >  #define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> > 546296f0220b..b10cfd921b11 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -601,6 +601,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18044193044"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0,
> > B0),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, BIT_APQ_OPT_DIS))
> > +	},
> 
> LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Please check if it has any merge conflicts, if any please respin, and you can retain my r-o-b.
> 
> Tejas
> >  };
> > 
> >  static const struct xe_rtp_entry_sr lrc_was[] = {
> > --
> > 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
