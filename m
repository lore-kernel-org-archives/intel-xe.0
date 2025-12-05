Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4124AD37497
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 20:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0343510E27E;
	Fri,  5 Dec 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4DoR3VX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC2A10E27E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764967080; x=1796503080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=78cGDRIE5CFOO8vIHkFY00qyfaYpEfGj9V9Yr5bpmW4=;
 b=B4DoR3VXnD/zsWOqFcOQGPgCNDY/X4ngCfnmJ+YnCaIvOw6JbuO/i7jS
 iJLIrKcmfsORuSFcbHqObQwWNpw0KxvYZoxc7v7xIfKYXsTm+FRi7TFTc
 hRRey29Nd4UapDmfB+waHCbtPG/WMRMu3eKS6bTKcaczYAPkO6p7nOnUw
 5y/VAm/gTg4rLn1Qv2buaX2Yj824vguS7eCGhmi16Z0td+QAcMlu+PfiS
 BEyoBjPZUwKkAWOKT3eDtu8ZuEqH/m5XAPQZ9KPh/M4+1PQjyw/hkvYFP
 gTzhye+wyHToExBcZssxo4acSasJTaNumWHy0HtleGxtBBhTg9efwhEzq Q==;
X-CSE-ConnectionGUID: t9/8Tr+/SE6p2uyTojkBJQ==
X-CSE-MsgGUID: Yk8dOCGzT2mks7HD1ny25A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66891260"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66891260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:38:00 -0800
X-CSE-ConnectionGUID: hdU2rTsxSjqaEe0BzQJD6Q==
X-CSE-MsgGUID: ire2Ov8zSZGhCvErpehVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199857438"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:38:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:37:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 12:37:59 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 12:37:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwevHiCpW6ix7vLjJ4PGO+BqzuCMOjUot0lJSGrzt4cXvQNh47xRcyRaUD0cLW8v4/tmGCEFNalifFxCF+HmjrxksD29pLshJjC9g8YNZVcaV2b/3L07cf0eOTYwYyrXTb6j3WAJX1YmPTrWs2UxnOC83y3vh1WB/+eU0JS8x6v/Sa5Tha0yNI8i9/cje/UvyjBXkdWCxSqkpvjDUdaI9+PTtufmoETOvvxb+BUas6PNBy4yMvy1QTrhclLEx0piB2bor9X3qDd4NRnTebhmrdnhUkSz+My8Hr5IUPCvnW8vNeeC/vC2Kh5sq4lHds2+HoEUitbS6v6opS6PJ/2R7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL2TO5wzEKvZFqYP6tQzc31Qn3wqaoKpmjkZGhsiluo=;
 b=K6afxMPS90RZ8H+RIdWXWSo1IErmeQR0iZffgol1sINahjRewhZJBIauVALDuubCSavGn52CR1I2DolpWuUGUDVa307BZqcteRDnLxm1DhhGWUQTso8a2BiUGRLdM9tk0INBRPoCR8F1VfWkRk9ZwwMsGWpRP9x9MCHXt7S9VAqCxXYIdMRVnXZuRH3BR2ATcP2GO2rg8FELMrNCJwiHr5d5vr/Rwg6YT5vW0+ujg/JXWd/uB93iSIByZn2Wd+V3iDlC5vUQPTnBipywD3JITu3AdXYnSrUhMKwRg40sKbkGTMjg+UY3DI+3340u2rvIcvDCVwXYbqt7YvToV853Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 20:37:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:37:56 +0000
Date: Fri, 5 Dec 2025 12:37:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maciej.patelczyk@intel.com>,
 <joonas.lahtinen@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Message-ID: <aTNCoWlUZk/MwmWI@lstrano-desk.jf.intel.com>
References: <20251205045529.3801762-1-jan.maslak@intel.com>
 <20251205045529.3801762-2-jan.maslak@intel.com>
 <aTNCY3LFsqgy9My5@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTNCY3LFsqgy9My5@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2db1ce-037b-4bea-1551-08de343e2be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CqD+1g8cmbB4UOeJjT3jZ6mKJvMdIQJB+nUSy8PXFTKtSudKGp5d65CNM5pT?=
 =?us-ascii?Q?vy8tLOhwVYmtWrioDBHnDp93mD8IoLUMqWGEaaHP9jIhSIRteNsPQAyXokuC?=
 =?us-ascii?Q?EJcC9P/aHYkpoC8RKtMKhAjY2AwY3BbZF4iyfxg6Ru0F0VeUSUWcHDKZg9f3?=
 =?us-ascii?Q?x2QHUpfAMjJY/1VQV43EJ9zQDP07ItfUkEyJiS62WLfiom6eXAXJkaSCrxYG?=
 =?us-ascii?Q?/IfPM+BqmxG523BpSK+VdFMTxJR2KVLq8LYru+ZOYQK+pOC8Wqf466deZYeH?=
 =?us-ascii?Q?2zJVfZ8Vqi3TB0FdWQC6fHwhsjvGYfMhJgnvC0BlKFVVeDhycKt1SAp1E6gF?=
 =?us-ascii?Q?jv5vJLdACo4JkuBmOvdqMSWpiZBe7CEhXjLTPYayqN8l6z4rCxsc92y+vD4Z?=
 =?us-ascii?Q?K4/k0RTsZGhE94gneJlEkP2Q4ZjDKAS8j9yLp9AbZ9OmS/F6A7RWtqIPkHY/?=
 =?us-ascii?Q?FkkYqCepG9HqvpB9LgZ+1CI1ml5SbIfrBiq0mTHyPRvdoQrDNLyZW2Jgxihu?=
 =?us-ascii?Q?ByR1jJFIGSs1Fs+gsnBEzdGD86mM1nURf4DPsxlrze8e8OJsRA8zlum9QZ3r?=
 =?us-ascii?Q?n+tuHFHojZxkO6VTnmej3S5VzBe2JzjMosiXtEkbQuYxH22ap4XJpnqx9XWZ?=
 =?us-ascii?Q?rmMBykbqJCE1GNx05rhnwK/4gxPqbH+7G4vczFY8+c2e9E7Co0Xf4o6Xdg2d?=
 =?us-ascii?Q?+PmkYEZo9FAZZel2bu6PSVLryxHt7EK2l7aJomWrlvb9qrmzebr+fnfbvtTz?=
 =?us-ascii?Q?mk4ct6z80GpvEgen5yl5QHI4RqDXgwOMfIcp50lH+0cP/1O45zM0cnnznpd/?=
 =?us-ascii?Q?SmLuaRKgnM1hrZArsqe3eElgWoknj3dstum1kjFPZ4Qhfx8bK5DFAc/nFEy4?=
 =?us-ascii?Q?5AcRN+nDBkAuLMhJilO6RDsIuDAiau8monJzO2wmxabdhi0ybvqYt2GAVhWR?=
 =?us-ascii?Q?tsFm0S4bp9RZQOOtYxUy85X6ADYa5CDpQ9aoP7T8NCcNxy5KHmjBvQfDrotO?=
 =?us-ascii?Q?Vat63QEQYWqB3+3bIIGfJOz68qJegO781quDTfZYAOTi9Fy9xE7KVuZvDfDj?=
 =?us-ascii?Q?xaFk1duCX3+sn6S0oZk9P53xEnm9tynYzT1iQ80SHGE4GiRlamXwk2IPGHH+?=
 =?us-ascii?Q?4DfeaCWAtgTV5qAZ71wRyGhhO8vP4POdr3J+6qrvJiFCc9Qr1Pbowjf2FVyo?=
 =?us-ascii?Q?oKyoxMUS9//uT+OxVR6s/l4cj7HN4/3eTqIeGIhFMyolzhgv9RHdJYFha2Kj?=
 =?us-ascii?Q?Qnf2xRgnADVFWjw8PX34wRH7LqQsAuNS9wVcYUjyT744iE9gylfsK0qTczNJ?=
 =?us-ascii?Q?oREs6Yi/PG9JG5EVX+zh1z2uLf31ZCobzCD9Jcm1l3yBSJ60tnBCMJm+ux73?=
 =?us-ascii?Q?aqNmHgKrLFXdGwumJ4QiK9N4hSx7pHLfSeKk5mzTgfolFw49ugVh+doSApUW?=
 =?us-ascii?Q?PQu/sZwIeVEmxzHPAn7Cwot3yQ24OL70?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qThLVcA3qm+waAoyYDPJFqYhp2ZhpOUy+bz2EUZWUO1IwTbzJRjjkJTNrh3?=
 =?us-ascii?Q?VewMXFPC0Wp2VOxktjkWwnYKX4N7W0+sicB6P0XI0ha0fRCbAFGAbliM4L2L?=
 =?us-ascii?Q?tkHl5S91VtC10hUj2yAKbQ/qvPXAb7J7vyM1uoTAajtqNW3Hbx0XbPn54g9K?=
 =?us-ascii?Q?GaxTGYTlkPHmZIjQUV+4bN+XQXv4hRCAGX07Rllcn7IYyNGy4gAcuva0KATL?=
 =?us-ascii?Q?oqhtbjTh29yvnafM2MxIHJZvvGrnbJecmnu8HE1q4XugweOaqrspMPvy6qlX?=
 =?us-ascii?Q?KvTxaunqMkoCj8HXOgOehj7SvzYotkQZ9+vbEdssDMW7LBVS0xwRV4MypYG3?=
 =?us-ascii?Q?nNtA8Ttgapb83av08YEzxsRvQeqrHg4EggTLb15F/iGG6+eTTcA3FdSw6mRG?=
 =?us-ascii?Q?h2jEyMVkuCQ5qUl7EWvUAO662ueNuDNbjejTfw5D31OjpAUgiPjl2DdVilb9?=
 =?us-ascii?Q?YPl/tND18vp9MUaBS+o90vwesiktHTAamqrh497ve3nU6G/NosXw0BnaqmXq?=
 =?us-ascii?Q?+ZqQpgUQAU1Esm7u9KvIN4VxYlyQz8ms3Ug4atGsqxSFLOaS9YW6nGeXcGcs?=
 =?us-ascii?Q?y4/MFxIR4u9sza6AmZF0SsY1Gimf187aD1Cg/MQoQaMtCK6O8mwXO4hHX8IZ?=
 =?us-ascii?Q?5ShMa4gGX5grRq8bLaRQ40SaAcvqcUuPW02oy3Cwno/N0ZIqICT/nyW3YyiW?=
 =?us-ascii?Q?xYr+USYaaYaiTuCavleosV+6sx3QfkwZIqCbKpD8+fv1M1peHzZ2LYIjYr+k?=
 =?us-ascii?Q?Ksac3kzHbFHg19Lf5clfeGhQ506T8cxyG9HHM+/Mr2ns7eJtQwj/140+2IPQ?=
 =?us-ascii?Q?TuTKOWcqYJnMnXfPLeVsprIWGox1Ph+9MmfscKZPBJjEhg4ZqYG4O5xyjJcL?=
 =?us-ascii?Q?SBIYEwnFcqJLMPXwsvbtnWFBETNhuV6YtepYohwfbKglyw5WlHlTqgb3IQdM?=
 =?us-ascii?Q?GDAZAuzAMtlx+imZMek2weiL1VknWcUhlUbfO3ZXHZzlUYZshOuthsL5Kdx/?=
 =?us-ascii?Q?VAEwwgR353Z2DTSQvtJ5ZvAAH9t/O93ykRsN8cBdS//LdatkUghPYvV8zLol?=
 =?us-ascii?Q?jDiKxMt4/59mp6EGSTXypvsN61S215CGMCJagYMKgHb8pQJVwq7CArtrvkqx?=
 =?us-ascii?Q?E/FpEmOm58AXXJSqwM/d1q+ucx5A43qpA9f3edeuze6uW5Mme7Fk+N1cEzhP?=
 =?us-ascii?Q?wJ9MwqhNbSz4w7ABb6/XYLB3qn6L/PU+GZMUY6Wu6p/1BH8X0w9Dy1K68yJT?=
 =?us-ascii?Q?78D4O+GXTdeICao/tmRnyVglEHoKLyWfdqLHRASRBFfsNvQm1uM2So9prOVB?=
 =?us-ascii?Q?Rxp+f1u45zh+OiMrrb3ayv0kYci87ZHKvfMoAaQW0y0HUPtUb3Juez2PUzDb?=
 =?us-ascii?Q?b/AfmULgRJyjaz0a1lIpehlqdLGtwUDSfMtyi6J4gqmbFVoT3DdIBGoz9N2X?=
 =?us-ascii?Q?2BGd32aSeNwoOgn+hpnK8hLQvZGHBj0NKAexm5wKMzeE59KsefFV8Kw117eS?=
 =?us-ascii?Q?tCubDlGoO3RP2YxxrU1lDBC0dNzK+vpFV/aNuiu82OLz4VOB9ZdYcFV041As?=
 =?us-ascii?Q?XhV99Pbn7Qenn+ogH5U7FYKGWdLBr6uJv9g8i5GRuv0O3vg8nFiqCLvnNV66?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2db1ce-037b-4bea-1551-08de343e2be0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:37:56.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GtXIM8CMpRjgw77ctUGGJ1XLsHvnB2/rEnPuqGui/foTNiLrhePDhDVQtCM8ekj7zM9iIOWZNqHckrEoCAURw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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

On Fri, Dec 05, 2025 at 12:36:51PM -0800, Matthew Brost wrote:
> On Fri, Dec 05, 2025 at 05:55:29AM +0100, Jan Maslak wrote:
> > During GT reset recovery in do_gt_restart(), xe_uc_start() was called
> > before xe_reg_sr_apply_mmio() restored engine-specific registers. This
> > created a race window where the scheduler could run jobs before hardware
> > state was fully restored.
> > 
> > This caused failures in eudebug tests (xe_exec_sip_eudebug@breakpoint-
> > waitsip-*) where TD_CTL register (containing TD_CTL_GLOBAL_DEBUG_ENABLE)
> > wasn't restored before jobs started executing. Breakpoints would fail to
> > trigger SIP entry because the debug enable bit wasn't set yet.
> > 
> > Fix by moving engine register restoration before xe_uc_start(), ensuring
> > all hardware state is fully restored before any jobs can be scheduled.
> > 
> > Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 7caf781ba9e8..17642d71f98f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -771,13 +771,14 @@ static int do_gt_restart(struct xe_gt *gt)
> >  		xe_gt_sriov_pf_init_hw(gt);
> >  
> >  	xe_mocs_init(gt);
> > -	err = xe_uc_start(&gt->uc);
> > -	if (err)
> > -		return err;
> >  
> >  	for_each_hw_engine(hwe, gt, id)
> >  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> >  
> > +	err = xe_uc_start(&gt->uc);
> > +	if (err)
> > +		return err;
> > +
> >  	/* Get CCS mode in sync between sw/hw */
> >  	xe_gt_apply_ccs_mode(gt);
> >  
> 
> I think you need to move this xe_gt_apply_ccs_mode as that is also

typo... s/move this xe_gt_apply_ccs_mode/move this after xe_gt_apply_ccs_mode

Matt

> writing MMIO registers that should be configured before bring the chip
> back to a live state.
> 
> Also I think you need a fixes tag here as this is pretty clearly a
> bug.
> 
> Matt
> 
> > -- 
> > 2.34.1
> > 
