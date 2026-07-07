Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADEFC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D4C10E520;
	Tue,  7 Jul 2026 22:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzBBA/dy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681C10E520
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462533; x=1814998533;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kkj1irdIDQHsnICX5uJHaAVb+vfMxV8+WNEvu2bbzF0=;
 b=QzBBA/dygCNYUs0QEjkrotDi8wvUKVin0gfcmQada62y2ecfqL8Njryh
 GDxF8hSosxUqO56dxs5xkmI2Srb+9qsOKuneL+kA793BExsu2+SXnY2G2
 Xurv66QI8DvpB0TDg4Oc/Vzh5nrx3XGNeuTFy/OTeMzetJnshItCaYHzw
 HzMztapAlStDa2P/ZUod8s5XiSS8bKVS+eppFTKW3kBnO2ka8OfY69agQ
 Urgz3/H3zJSYcDT0AOuaOo8bjhXX15eSgeBlzNMeIXed6eRVLrIj2dmHF
 s3Xz00g/1pgkcFxWxfPxbts+JzXm1yvz3++EOSgO3PYnjoufY0eSkHydf A==;
X-CSE-ConnectionGUID: 5XI9jjnsTT+BienxBu4aPQ==
X-CSE-MsgGUID: b69LvvrVSZqyASuthjuTEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94475130"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94475130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:15:32 -0700
X-CSE-ConnectionGUID: 8Mu6edZiRga9FMG9ZLoG/A==
X-CSE-MsgGUID: d/PBrBy9Rk+d7JjGISw3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="284220457"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:15:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:15:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 15:15:31 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt0JQ+qZbkytuMma5VPoJN9jbPYjzNW/6mT2iTzwwr0SFb1bnt0H3HG1eLtBqre8hreCgWmbNZipjpqE58V4gpixOE6J5/HjyNqzrC6bhUZJYnEVE5ZGmFsD9Shf816F4LOmAWnGGSTA2QjYwgNpHrJficvSUHExHtbwvi4XlnGSHSVdrbYaet0fbeWu5mN6gl0Vw7oQvSHfp/ZtPH8s1xFKnVpo2sCgJDyrvRnDOGW/fmZ+Mc/zmjNP36E6V/JWcKm5MOEOb148tanfzGZsBEK+7RH2GPoSdXDhJiV6AU/GcsJgmTmLCdOFdp8ioM82unuKwSGtbbFB+dl6WL5eOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an51u36edBNaINSYQ0DugF7k3GBjP0ECrQ/T8/jB1jQ=;
 b=tAh/MgFhzEaMGYS4qRHLPy6eTelAJJrgMz8eBTTSp1OG73aST43ti9EEhvn2ZIeiOdkbaowQpaB3bU6OXMpKJTihFwSlVU/knOpOs3AznUAJb9AVS/0iRzeZt5V/NRPOXzbiJF4P578rHb4k6i5hB3JijlluHDPdO5I2Yn1/djxBf+yib8VTFWacTi7xABydP1uhvJHSgYCXD134oRUkZlOzUNZRTbT5Ozwp1QCjX0Lv28hyGgvUw5igEWZGPi7u9Ca2YH4tPlJDm4GOANk2HTZten1A/77bBgsCkixyH2BrZV7TSlKPHL8kYomxP0NyBQdgmi8e5HbysciBQXHtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9155.namprd11.prod.outlook.com (2603:10b6:208:569::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 22:15:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 22:15:28 +0000
Date: Tue, 7 Jul 2026 15:15:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Message-ID: <20260707221525.GA80957@mdroper-desk1.amr.corp.intel.com>
References: <20260617015422.226177-1-ashutosh.dixit@intel.com>
 <20260617015422.226177-3-ashutosh.dixit@intel.com>
 <aj21Z9pO9JoXvRVi@soc-5CG1426VCC.clients.intel.com>
 <87fr25jore.wl-ashutosh.dixit@intel.com>
 <85mrwdqmos.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <85mrwdqmos.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: ab530a2b-ce20-4b1d-a1e8-08dedc75408e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: l2BooM+kYeCS5wpTIcTj8bDcoBGQx1M7q22Vu+SUKQV5l/hA1FIRFyvjvNOmVeGaNlKDVM8L0CMBkLThTih/l5ciUdzQJdI4ouRPejpF3TzlvW7C9hM8aAZp6gsz8rgxV0Xnjz+eUyir9cIiBigMnIeaxdUtr1vwVtasS4J9p+Ks8HG8FbrN/oGTK3UfSW0WyhgEHdZlKV6gxKiKKuRmOs64YQwy1kGxjXqxsARTc00jBTbtErBMzuETraWk4ouwZC/2V7NsDCkNC8kRj4m88Wks82r5dHlm4C8A4nmeCyyyRJD4QNe/+4ZITy/rEWfsdJBfv7fzbOdqrtyC3Nbk229xO124s4QkcmrW+Yv4UsxOgByLIfNjoyNmnT9t4sQvoDQX4y4reHz59myFtg7TIf3kuFPIRIaEjr87/T2YMrWgdazw0JcE2Agnh2YkJNwYywOEPunGisQSqosQbnikmrOT9IqiliJCWdtXuOCa7ZpLlKhEOuCrmhbvWxEfH7oSD6HOQelREX7vu8fA+AUAMZs0vZ4Jw00UL+wQj+enZXfeh+spAoKQ/0tjLGdl2xUKajit329ws0Y0XqiZ+SkBfF+h97PJNCn9YpY78l2jT1/hRPqe+yTfm1fosql+A3gF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgUl2jdGwW9h0wFDcRudjQURfj7ydrM94Bqn73t/rSGRv8Ypyl4wJ2DCxOym?=
 =?us-ascii?Q?pst2uZ62qok6rv0jsrOBKK5cfyJ7+XVIRvdhWN9UkSf532kPrfYN4CC4ULfc?=
 =?us-ascii?Q?EaoWoWAMBWG3RBNROwTIzYMifCKEg0A27gnwuTQHubsg0ad3TZ9iCJoaUuXs?=
 =?us-ascii?Q?lyVN9XwWHvc/fudWDYZLBPKOKAjvZ84HtSaYBYT9IdP1Tkp/PWJHWRHPa4R7?=
 =?us-ascii?Q?ImMyrpCQFbTwVaS+/7rAXweD/PaQnuADw/sEsJolOhkd9kU3eMBi4bD1EezG?=
 =?us-ascii?Q?7kkKrIBswBd0soWq0PyyTI7aKoj+To0vqNk9ILow83TMInqf76Hje58NQxJ4?=
 =?us-ascii?Q?sEvqWI1r8edAF0UMcQunG3zRnGUU3WmsMA1bRDCeWVHbKtv/SyzQgHG5sQTh?=
 =?us-ascii?Q?6gAgmK+A0jTrb18EVJE1oV32lcKq+XOXUasVsLec0J7/RaAusL2dfT82kw9I?=
 =?us-ascii?Q?4e6CzOQ2JjijNiIDzPGZ6aqVcs7pNCocUx2ag8/iyhw1Ns+tVagkzMhhwIJf?=
 =?us-ascii?Q?3s/N9GqaEOMp7TORGQs7Zv4vN6OGo4XGg+IpnYcBBJyeUJeSFJCrSV1azSTI?=
 =?us-ascii?Q?7k2QUZXMw5kPgbtfosxhPb8d/fL9cc4O5Pv38Lqb4nrEV+McBRJ2xxvG/kdM?=
 =?us-ascii?Q?52gxI8rKAksHG/erGfBoT87NI+vBcHaab9fhjGwbQp4aCIQTvsh8p56jBC/a?=
 =?us-ascii?Q?rmgo09ifTAMy6vxNwX7EgELwuwx9ccu6wf/Y7cJj13i9jpn78RZnkAHDMcPJ?=
 =?us-ascii?Q?xWWZUHRPVlwS8GRfnVqLiN8NgOWIfT8/AfOBIqhE9VUUU7HGcOPNJKfEk0GR?=
 =?us-ascii?Q?ASpEDY5lDtuGtu0VpKiPBOXj1mKNOeppIXRGwMUOo9m31lomZ6D7RemuUB0S?=
 =?us-ascii?Q?IrtabnP2TxcLrdga+qni6rrNh3otpiHaXyTrhWN5oCm9lAGtb2PQpmAYgHlb?=
 =?us-ascii?Q?PmxSWFrMF0FcOVnvUgfhWJpBxfkezloluN/TEbzjkrkDbOALy8AY0baUJ5Gj?=
 =?us-ascii?Q?6SaUIUes9C6lDj7D2m2T4mqIurjpNcNAeH8375BBwfV2hWuQjqFyUxyfWW7p?=
 =?us-ascii?Q?JvUm+ZlkNnf5kfYuK+6bScpagsCyfTzemUUTbWuvtkckDrolghmutx/EbHcC?=
 =?us-ascii?Q?Sk9lVA8Yae+0uB39MRQqbwErz54JqebiUyVl9ZX3WV307VLi4KR6UkMHT30T?=
 =?us-ascii?Q?/OI6VJRY79N6SyX7JN0L5J9lwuKf/T9HRTaKir0lMURic1jB/O3uYg5FOMFI?=
 =?us-ascii?Q?y6OMCPavAjpmp3ab+aSLvChOhpKPsV/CA1mRjkKJzaan+aXA3owbW1+Dg+x0?=
 =?us-ascii?Q?zq9fbvXgYqf3VD4O97b/70daxTxzn5RHzv1hjnIY0BqlDs7WhqKhUPN3GLmV?=
 =?us-ascii?Q?d0KVfibk1eauvKuXUrBcayh3mVp2bB+49EjYu5nHoxGUX49iBTSyk/zcQ1Fy?=
 =?us-ascii?Q?NWpZ32dIv4+zWi8vqO17uML54CnsFcaKkG7TfUiQEb3MJ5azWcwKclFMUf0G?=
 =?us-ascii?Q?P2Xm68IWdXft5d/mcdf0owvQ758PTWLsNaa6lIY7GL03hCDDz25e71pxA/qL?=
 =?us-ascii?Q?Z1CWudetLA8oSgqe3dhDwt6S0Uz/kaHUnsygbZ81fCtBVObQK79lu3yqUWku?=
 =?us-ascii?Q?Nvqyou8MfkoKoGY7M91kUrG5QbqYQsL4Bb/Y6VHD6nqsEyzscelPh3wYmdf+?=
 =?us-ascii?Q?Uvf3aRNb/iWbHzdPfP0p0HVvRJuNFm4PIvyPt48QDTIS7zer8iHBCN/gsqWU?=
 =?us-ascii?Q?ODlxWlsFUgjbcu/ZOScDnKq0S/599S0=3D?=
X-Exchange-RoutingPolicyChecked: N/TBylANp3fMqqLcxAXcrC5XEqHXyAJdBj92r5FS2yrHySfQmbJSEY8fQaE48tURWUuDNOQKTRicBFpKl413msBu00MqyZ1EOaJttHGudqEWmKK4H/3YkBEg6IX3+xLdvpBKCq//ynNyCQP/evRkyRvNSyRyhRh58877VQWDTe6UR4j20sh3JGRHH3u/8PSlQp/FrV3jyiyavFjrDe0kahR8OcXwq6nZEamizyf7/6M789+dJfcZGqpNxbWoVH0LraRz56UuFIXLg7zTn4sSDms+bWXI/Im49+k956Pzv8kztzQ8NhmOF3FoO7DBwHgeFA7ZtFNFPBHyOoIhp6EK/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ab530a2b-ce20-4b1d-a1e8-08dedc75408e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 22:15:28.8315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grwnw+PutZM5lbqBQZFacx2HFEB1lsZb975/6KKBv0x0AWpdbVyoFYqCrKDYQYn7N0feeW+wJWBHOZpnK+6yW9q9GhfC8JHjSYTWiOZ/S0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9155
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

On Mon, Jun 29, 2026 at 10:30:11AM -0700, Dixit, Ashutosh wrote:
> On Mon, 29 Jun 2026 09:27:17 -0700, Dixit, Ashutosh wrote:
> >
> > On Thu, 25 Jun 2026 16:10:31 -0700, Umesh Nerlige Ramappa wrote:
> > >
> > > On Tue, Jun 16, 2026 at 06:54:20PM -0700, Ashutosh Dixit wrote:
> > > > 'tail_buf' argument for WHITELIST_OA_MERT_MMIO_TRG was previously
> > > > wrong (not multiple of 16). Fix this.
> > > >
> > > > Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > >
> > > Note that the SW whitelist needs to be documented in the relevant spec
> > > sections here: BSpec 53688. Can you please have something to track that?
> >
> > Sure I will do this.
> >
> > > With that this is:
> > >
> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> >
> > Thanks!
> 
> I have separated this patch out, since this is a bug-fix which also needs
> to be propagated to previous kernels:

This should not have been propagated to previous kernels.  OAMERT does
not exist on any platforms until CRI, and CRI is still in the process of
being enabled behind force_probe protection so we should not be creating
unwanted churn by backporting changes like this that don't do anything.


Matt

> 
> https://patchwork.freedesktop.org/series/169445/
> 
> We can continue to review the remaining patches here, since they are not as
> urgent.
> 
> Thanks.
> --
> Ashutosh
> 
> 
> 
> >
> > >
> > > > ---
> > > > drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
> > > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > > index a17ebacc1455b..880079473c26b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > > > @@ -124,7 +124,7 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> > > >			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
> > > >
> > > > #define WHITELIST_OA_MERT_MMIO_TRG \
> > > > -	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_HEAD_POINTER)
> > > > +	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_STATUS, OAMERT_TAIL_POINTER)
> > > >
> > > >	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
> > > >	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> > > > --
> > > > 2.54.0
> > > >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
