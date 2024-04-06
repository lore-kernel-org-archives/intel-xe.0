Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1936CD1284
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 18:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F40710F344;
	Sat,  6 Apr 2024 18:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvMMPkgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919B510F344
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712428144; x=1743964144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E9ERRV//gpT3jnJGJAHar/7kiW3eoxzACtWNyPTvBYo=;
 b=cvMMPkgETqiYIU8k5lcWDco4GJgo12vpbld59aRfMtH+Pbs7RKDkwBvb
 XlFY4tRFbqj54XOpCfmnEZN7h3gVUOaW52BNIDfgw8dUwlFYzJa3ln5N+
 hvqtKMvXYFQF4yU6fMzvEgRNyQKetW6Fji280iEf9jO/CXJrQx2l61fTy
 +I/vKn6CGq5GNJUiRAUCYP8lhDtLANVor9ME/DWgZpC3Ir4buo14AWarh
 MEgVRr1BnjChw+I1Iz2h8TknCdKM25rfBxsAkezHhWIBi/BWpDS7fpdIe
 ZYThGa87vafxv3Z85sJnJOph39yaMPPZt8HSr2zXzDKGtX393BKZICA7R Q==;
X-CSE-ConnectionGUID: tDGNOEbWQtKGGXTpkzSazg==
X-CSE-MsgGUID: L01+tsSOQRyRCwi4ONRtOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11515272"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="11515272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 11:29:03 -0700
X-CSE-ConnectionGUID: FNXJROmORbabxCvAuCryvg==
X-CSE-MsgGUID: 0/HCeTJXSwOwbchnx278hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="50685764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2024 11:29:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 11:29:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 6 Apr 2024 11:29:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 6 Apr 2024 11:29:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 6 Apr 2024 11:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niKwN3LIGlGSMRMwubBWL4CrJwgDYBrpaGCcnzXKfO0c/RzTglJlora0wmv1fFEoT0INTulqwCwx+dDu5yjaxyJ7RgeRHwmuJtElVM6E4wPrzr/74yonb1Go6OFCcxjWvXEcJT+Rb5iTMXPEzWxuUcWkoK/Oa5kgBwbWf5HNwsh2Q9tWfwASJtfVp1mhoCNnCai7GWBd74RQR2DzreBqsv+ZmZwjVMmpVLt5kjQvFDKGfM1WuQGWaGFIpTtmV5wjkmfoL36TmkoHaJTKoZjnms4Mg3c0e893ePIsl4zd6yu4w67OP4zZq7rnkpuX+nlGGhSeud07D/lpw6QeCj2C4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkmgjEBLpY70/Zg0u99n9ZeUMrlNFVduHAMbe4pyIO4=;
 b=R7eVPjBTs8dYuJ7HjLRGm6lF8oxzJrQQmBYbaSGsB3IqF2vjY2zaWVZell50Ih8FOnmo83UuqjwMhdSte1k+AF6Qf9vE9OAityFKEJC66TUo6MMWJ1IIC296/bgtKYSUKRipXyciZtWKRvuP1hwsOV4okcAGv4UEMGEcchdVENOK9egZSdVIRXZ8sUs37cvhqm5i6G2P9iveQ0YY+hQpLxrc4l6znt2MWw+PHee+AzLygs/dK0QVgS701BgpRZ26w8Dix8ItZpVOUKiPfisyYrTsinZha0XCYdfXBoT8DzUiiWI6KpNyeymDIRcshbf5tgd3P6OvHF2h9hFD2Xra3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Sat, 6 Apr
 2024 18:29:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 18:29:00 +0000
Date: Sat, 6 Apr 2024 18:27:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Initialize GuC ID mgr before registering
 guc_submit_fini
Message-ID: <ZhGUKSnRO72DRnUl@DUT025-TGLU.fm.intel.com>
References: <20240405212747.226263-1-matthew.brost@intel.com>
 <d9b2af11-26a4-404c-9696-aa75e3a1d7ee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d9b2af11-26a4-404c-9696-aa75e3a1d7ee@intel.com>
X-ClientProxiedBy: BYAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quLziFJiUiLmjC7yQCQ1thrvkNf05zxMl1DlPgcKT7Th8eG/pbvzWkM4LIX15soaZsum715m2CRjnp/9y3qE5cezIs/Tc1NJa9Li2s9Y/cuWgA4H2DXuyn9ijwl5SKLU0m7lQf84m/S/bNwt9j1n/iZJeqYhnU8Q2Elw53ruEv38KEAqiF4Hf/fsb3nR4NgY+fSIgDaMIDjSH79Klsd2rP0TDzG07CQ64XtvYBad/OKl//dMiabNNEe8zL2fkJmUc5y47lN96FCYmco4dRvG5Xr6kac4XNiiEvMnINDRWPXQMQ5ZfvGviqoKiAR4KnbZrwT6n8/UI8AjiU6p86PQo0ELE3CXm5rNh8y+1LV95hB9oHB7LDKroxOAcLT+8gVAB7Bfw0eosFDkcv2OQKMk7df2wmxzAEiJyRN224DbV8N/MkqxHyNS8etmAwkoBs10QCScN3cjQb13/UbcLc1/IAEwjeHe4+EFVzuoc8n65Hzlcxv0BHu8rg2l1ruMko5bcBIQpxV13Vi0RiHSIzkt0pFN2ONosdG1nScUaZz6R7/tkNIqfxyp0aUAGaHLBGmv3tqdZzZiysFr5k8rkZafW+iKV8fXiEFnTyBpK2R6OBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2trQQN6bIJFkREW2DB4YUsxmv2N+XEceIJDjN/ZKRMMi2OFLfY8AtKQVOiEO?=
 =?us-ascii?Q?8DiwpF8HjzaEd7mWdAYg2WwEKu2+gpVnO1gJxgmr8ccfQ/EzIr7zmCQ9qp9C?=
 =?us-ascii?Q?VciD03lGwmyFKdYFndWCpy/nLmivU0Jz8gqMnYNITsCQq08HVtKlP1KOQMYg?=
 =?us-ascii?Q?1t5e1N5Ougf8KeiVmwxEo1Ay1O/v6mM5tynPxiBpMJFIW/uk3xoZmN/kmTRj?=
 =?us-ascii?Q?/CTYGgx30fcbAxVFbEYn3KyxTLjGudvE/fIjTYZzGBi6/kbEmO90PAYKCyP/?=
 =?us-ascii?Q?4riOViHn/I2zDpGfGwvGSqRPGk/EolmLI77UCvqzv/1W9LE8mL0AWzjHiaJK?=
 =?us-ascii?Q?jzkOaFaibSL5/IoicSHiHwfo2P9TCcTL0L9TKUH3COLTTy7zluhTEngVrsvN?=
 =?us-ascii?Q?p/Tvj6QIofF3BOKp04tO1pwHGUCebYtrpNDRDiS/YrFQg3NJyEjX+/D5J3OG?=
 =?us-ascii?Q?SAuJrwamHvx+fPHCjTXZSbiEJnx6uRX7cgrihr8uoDSwjlhFR9xU4SzDiSo+?=
 =?us-ascii?Q?fWn8VT2EQxzDV1q52JyWK4qZtYO/U0hFMrcgj+sqk8JQD9HtmucDneh1Z5bH?=
 =?us-ascii?Q?2G6XQOXhKkLvKYk1tSDivnag1sHNuT6gUwPRjGHZtZFesChHRrYJ/8AzsYin?=
 =?us-ascii?Q?l4En94eBR9jZgjCchz7+NOd7f9tPJ+y5Au7PCUR6dw9SIEvTm4eqnNpE4exE?=
 =?us-ascii?Q?VRQdpLEinP/yfjR1kpuWoCXUNIaUl8QutnJK44DlP+u4MIkMhks25Tcyhnhi?=
 =?us-ascii?Q?D1kDscSsXrpMufBDGWHC0jhYuNn/BBs7tzWFyiKmLovH7e3hJ8byZQLuckls?=
 =?us-ascii?Q?hb/3xHuBT1xBDNh/Gg+1cZOu53y3IAgiyNVPsrVW11KaKCMvbS6Z8EZwFxWD?=
 =?us-ascii?Q?jKbxdZBj4QNAwzepkAUhfaLqcOIosUC7+0Z8q84N2FlWa9xWqNNzZO4clWLO?=
 =?us-ascii?Q?TXm5TPOAwn1Y+6R4hTsyVQ8znRKD+hj13zLtPeniuoMgY4rwF98nADvLDzrO?=
 =?us-ascii?Q?5K91VbZQJ+XFAeZ/aRMw+dmLG3VXOf7fFR/ND9RUelBFYWuBLbMc/Y/E4gZL?=
 =?us-ascii?Q?wAz7zVaw3uy8lb373YE4h15HBx1RoedeVOy0RgV7Lvxgfo2Gk3J7t32z1xvr?=
 =?us-ascii?Q?T6SB7SKgptQuW10Mc60XpOv/9wYaG3jyEc47+SqISUQlWngwu5aE/6isNu2P?=
 =?us-ascii?Q?KzoVsmaNvtC3xlV23Nyfd+YIPjrXhM+Vo56pmqupuvgYi5MYCpVwFIyOF+le?=
 =?us-ascii?Q?LYrUNxVd26o0fzFwX/d4DBg7VRsGK/45XCYm+WrFRKW9C+W7DRArenQnPibb?=
 =?us-ascii?Q?mH+IgpdbStgYrlmtN03tKjXh+MmotOWNwJwQJtoBySo0eoXPHItE4B2UFg1x?=
 =?us-ascii?Q?hW/EPzgPcwou+zOtB26AmQ/ZKt5+nS4w0XRVVwoquNq71ODiLT4MNvTdgIuz?=
 =?us-ascii?Q?YvNs0qLP5sLp/a3VRqKAXWazTp47E/XgtNRCS+FyD3zvpETQSvGAZIi3VhC9?=
 =?us-ascii?Q?T+g5oBEr2XGMrHz9ZdHYVA47dXc8z23hdfn0sHDNqfpZ2SR1Y7/HDCXq+tBp?=
 =?us-ascii?Q?q7VrR91MVsZyiCLIXYd7ikOAdC/vkjL1v3iizo3ixmhGg5CP1fwlK2O4ZbOK?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f32ead-366c-489a-f39c-08dc56676d92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 18:29:00.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljG1bUoOcL9nZC+TE60hTxgdM8oBPurPClHd7uSMOtujAQBnSTAt2Z6e7koNuh10UjJ2jkrJmoneYL4127/aPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
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

On Sat, Apr 06, 2024 at 04:46:51PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 05.04.2024 23:27, Matthew Brost wrote:
> > It reasonable to assume that guc_submit_fini may rely on GuC ID mgr
> > being available. With that, register guc_submit_fini after initializing
> > the GuC ID mgr. This will ensure the GuC ID mgr is available in
> > guc_submit_fini due the reverse execution order of
> > drmm_add_action_or_reset.
> 
> that wont fly right now as GuC ID manager expects submission_state.lock
> mutex being still available during it's cleanup, but now it will be
> destroyed in __guc_submit_fini() called prior to __fini_idm()
> 
> please take a look at [1] which should solve all the problems
> 
> [1] https://patchwork.freedesktop.org/series/132118/
> 

Ah, yes good catch. Had CONFIG_PROVE_LOCKING=n during my local testing
and missed this. 

Anyways looked at [1] and gaves RBs there.

Thanks - Matt

> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9c30bd9ac8c0..148c5dc2c1ac 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -232,15 +232,20 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> >  }
> >  #endif
> >  
> > -static void guc_submit_fini(struct drm_device *drm, void *arg)
> > +static void __guc_submit_fini(struct xe_guc *guc)
> >  {
> > -	struct xe_guc *guc = arg;
> > -
> >  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> >  	free_submit_wq(guc);
> >  	mutex_destroy(&guc->submission_state.lock);
> >  }
> >  
> > +static void guc_submit_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_guc *guc = arg;
> > +
> > +	__guc_submit_fini(guc);
> > +}
> > +
> >  static const struct xe_exec_queue_ops guc_exec_queue_ops;
> >  
> >  static void primelockdep(struct xe_guc *guc)
> > @@ -277,11 +282,13 @@ int xe_guc_submit_init(struct xe_guc *guc)
> >  
> >  	primelockdep(guc);
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> > -	if (err)
> > +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> > +	if (err) {
> > +		__guc_submit_fini(guc);
> >  		return err;
> > +	}
> >  
> > -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> > +	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> >  	if (err)
> >  		return err;
> >  
