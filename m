Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318E5C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 16:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51A10EA50;
	Fri, 28 Mar 2025 16:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOSc/v2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42BB10EA50
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 16:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743177797; x=1774713797;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zznj7UYwqbX2yGgPWCRCarWiA8PNtAU2ttBZLnXUSKc=;
 b=JOSc/v2O4r3iWwbaP83dCiwm6CjxvMYFX1Btmf+asJNGFiXvrpcJJBUm
 mAgJuntBoaQ5KKAkxqnYgC6ehlWcOzsEFDZII8PWScRkXnBELkkpWdjwp
 KLovcZparHvZUpBy6uR9My1x7Vh6fL/DzS+LfsTGzeqWsxHtnZ21MUcJq
 kkfx5Yxii4ThcXGMzLCobw9GqA0Pggj3DHYTV5r2oT20JS77S9gAEhtWb
 RMwNSm+k881ihg8bEyTrr4o/oh+hQYAX4q6sYI4BqGkd90fU+xic8rh+E
 wvkY36SIN+4s+zgqc0wxDjEX+hTAlYM0dKQnRWXSiwLp62WqV3fTlHo75 A==;
X-CSE-ConnectionGUID: P3X0+LwSTpWrp/WZCASrAw==
X-CSE-MsgGUID: aLpabyE3RPC9Jb5FkaXllA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="69908326"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="69908326"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:03:10 -0700
X-CSE-ConnectionGUID: lXw1ngLZSQy1fGlTYRbPpw==
X-CSE-MsgGUID: j1tqq86ARLmgCJxnRLbX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="126401130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 09:03:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 09:03:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 09:03:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 09:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GexdpsAs4ZQXVPsHrEnXq6cwuhqMDzdLZHugek/JuRC4IKslDTrVb6YZ1aY/zLfDopHlZahW29MSXh5LohnnVh/JNyH3LPuALTtz2q5vqIMyoYAMwBIomkP1c0sVIkRg0IOhY1CQlDXF8jcfHuPgLFEtulhX9WGxEWi60gBqAG/+PCXP7+zvtbZZKWVr9Wb6qTID1m8FoGpiY0Kc5ZXKvotyM/Ntzy97MPomJb5A4P5D2yjgDy9qgEZyWMn5qssrVxZPlTvg2fLmT6ryxCrrxz7l5+3G0QpAZAIKPS276m5fowh/roSGgA2haTJiglL9HSjCfPdF9g86GsdxEDSB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fPE+qpRGFeAMA8anbw+oT4HZ+sSB0WMsX983155xmI=;
 b=ZWKDUffkDaK/SnRTZLutsdosAQvNl3VCiO1CWCe5pGjgMj7Swp4x5Z/XOCM/UOrplcMenbTJxwhfg/9yvIOVLziKXxSuWhqbrCkh0Eu2wuZu/W+Xbo7yH0X+1Mf7YAZqq7/Un+sJdr806Zpu5qbxitEVAUuuqRnNSdVfF+x58XpwepXo5moWPai7+Jm8ELnZndDZbq4DLjzwGI/tmjpJR9ivRGmqmKDsdICZqlJ2CNmkl/39fbs9ua08gmonH3SAyHWklXhS1/m9bJ8tw/Yk/5jOs/5IUgDH78EM6VQ6E+1HBGkvmoFGXrbnKqbtoAQ7g4aETDoZapBtDvtJ0GsPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 16:02:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 16:02:20 +0000
Date: Fri, 28 Mar 2025 12:02:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rafael.j.wysocki@intel.com>, <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-bICZUBN_Fk0_mM@intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
 <Z-WHYbhu1QdjUFPR@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z-WHYbhu1QdjUFPR@intel.com>
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: dda08bcb-1b1c-4588-846c-08dd6e11eb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XU/rYVI+PeOUOkMWCdhA2pZF+hHjB1CrXAAK4FR97qHnawQhWh7QaUqZV6sl?=
 =?us-ascii?Q?Gz5QL6LOtwe3lfvB2LvRIygu0EgVkdFnJ+s3kaJ+u0vUUA5XYWolyFc0zRNB?=
 =?us-ascii?Q?51G1CiP5ZcMjC0X99ezyCvbCH/pOO+brnmJ8togTJHgyb7vPDF7rOORgjfdT?=
 =?us-ascii?Q?V7LKMtLyF8RwLHBkaXKTD483J9R2x5Ft0qPY7/t4eKCUbULuKPBhSGvy31q6?=
 =?us-ascii?Q?5lSU08MveujBo49tppwCsWe1pEkAaOF658NqqlIJfgNLpry02buVrnbWVMbU?=
 =?us-ascii?Q?Aw14SyTcIsSHjPh1MrQSCE6tk5dC0BBSKwsJsG4wVPWl9xA0jD4nNKVdUI6V?=
 =?us-ascii?Q?DeQXvRUKBOjpTF791pNM1ulH95vvty6TTnlEBtcj35B6+2Q11fPKZXf2E2/Q?=
 =?us-ascii?Q?DcKEjBny/84Ikiav90m9ciep1bcM547IVPhkXChcyGf1wMzIWtgjzHF7JOrA?=
 =?us-ascii?Q?CyjHPvEN1fbUN4Zt7bQuMR5IaXocGtXXWSz59Xe7tEX1ZbfpDWUivQrVHs/7?=
 =?us-ascii?Q?VcPP0HfglLUaEG5E19I/20qnQubIdaJ+qspQiPl3Iscqs/jlUTOfT8oV5Bdr?=
 =?us-ascii?Q?1IE+HWhhhoMIQn9Dem8uffUigVghZEpLEyTc9//eUuJjMQ3nztKTDWYEiW3u?=
 =?us-ascii?Q?7YeMu2VLZfYWqTHmc2+9Krd5skp9jn5B1V3F0VGTduTkFNAGBW4uzOFSI5g8?=
 =?us-ascii?Q?8bz/7qhwF7J69IwTQ9xwpFWcHgh52GrlAQEnBCnEWq3RjQy+7XRz4giVqpBT?=
 =?us-ascii?Q?VhLBYlNzWmsNnDp9+BlLO7H9F4Tc5Xj6iyleBH8g7xv76rJYYSDTgsx8TWcj?=
 =?us-ascii?Q?R6NJ6YDN5ntyAVm08g0IDuuokM7zaFbJ+I3NhfZ/tpmHkRhl+C2aglzJQZOx?=
 =?us-ascii?Q?ccELse2bkG4sF0/lqmNcad2KZj6BPC27kssD5iJnrQrISXyB3/UJZQTudVtH?=
 =?us-ascii?Q?JO1nTzM42+rdLJanOIYUX51+8ybQLSlQoZCl1gbDBMN3QJJXaE7JX4GPRvwI?=
 =?us-ascii?Q?yztQSbRKurI0xllU+qxicUy4jSn5DnBQJSXNvlO+lsGvhc0kNiBypi9Umvgm?=
 =?us-ascii?Q?/o7eY3pUxWiBXT/khyl2K5y5jnFNI1E4e+MnIalYOiMRULkhZrS6KA4//yre?=
 =?us-ascii?Q?rcZvBK2k+5FxdpjZzyzFmdVQLRPbh+AbWaGplzz0fCNgdwoodgQ5hMabISTR?=
 =?us-ascii?Q?KopPVQ4E3Li3L75WWGaBetd774l5qUz/r4oj78R8PDS4hK79m8m1pGnsjEAH?=
 =?us-ascii?Q?B8/AFiOs/mKlznvJdyG8Grn1+g5w2DAuXiDFETrx+ZeFYiqAdXLTcXRyMT1c?=
 =?us-ascii?Q?LKpm1qqapWJmRyNTR5eZiebFbN6ug8JzYTCmXSdTiug9741LyKO0SQphKB6w?=
 =?us-ascii?Q?XoIH332kVGkhMr3UZ7WrRorLB3rV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGub2kaLOIaiDyDGgv3PklhBqNSr2Mm2eJAYaapb9mj8q00ezTT55rUl0Kz7?=
 =?us-ascii?Q?xnNGDnJctbpG7D+RXTxWdxalx63JdE91L6qtOwpdVqX09aAo7iQG7RrV9aYN?=
 =?us-ascii?Q?LKOW8WwoytsWuRaNS2/TAfMRcce6qs6OGo3xrEPYFU88CsjNtXlFTF9gwrSF?=
 =?us-ascii?Q?4fm6updZcLvXyr1uca3WAHNu0eF5GRjp+SRDTulJ9OuPYhwLhqBOAFQm/aSW?=
 =?us-ascii?Q?7ZPkpiqawDO34oAysC4RoalFYcg2SzaZZsRr0+bdairAt/1BgCmG7SqMDCBZ?=
 =?us-ascii?Q?PeTrGdnXh/1J+hRfRz714Z4vTBPqokm9lYLAO/jLgdOjlIkdKtIus3NHNcru?=
 =?us-ascii?Q?B+GYfQoLhD5u+TrYj6vjASGgvV9Bhs2pXJ1q5No6g0VEkG3l3oS6WuVhq00L?=
 =?us-ascii?Q?NwDIk008QCnMQdsiQ8GlwhhYC1epSpsDQjcaYAUR1Kgrm5THv2rrcjaSiqC5?=
 =?us-ascii?Q?E/q6FNCXMRw2FBkovuFWcWI16InpRyLsScBzuApafrGykO1fR/msDwx8/9EG?=
 =?us-ascii?Q?5nC2KhHjXIviEDzgkJEYtKioIlLOhMM99asUCF3KaNo4WaL314xXK/yOPW+1?=
 =?us-ascii?Q?zSBdEQZldBp5hT9nyOtGqoWdwW+PmOKRoPa0PJ5LHtECRmT9iJcA2QpKBAA3?=
 =?us-ascii?Q?+PgUqC7c7rnpgLbe61ishCO7uS5jA2o4p50BEHZCXJ0nXF40wOF5Sumy2zEZ?=
 =?us-ascii?Q?nuU5XU5xJCSw8U/tM0O+sBbuVftaTEQb9e6N5/q3Dntzjt5OA8bC+tC5RG2Q?=
 =?us-ascii?Q?WccQboIqKL5sULa7dj0Glf4RTFSX6SkqyBTKo3Zl59DZrMu0Dl6H13Jo16uR?=
 =?us-ascii?Q?rZvA11XJydE0Yj3FnSBDB1hYGMLtjdx5BopEjRqb/BSGXK5A0GdeqslRN0N2?=
 =?us-ascii?Q?iRgzrsOMU9DSrjGrj1C/5BP2r0LF/bxgHGBZAVv/30XumtQQETNTg3Ak5m+K?=
 =?us-ascii?Q?WdMgIOtIdCQXN2Z6CiQ3EELHJaYqZQu4tnK1XSAmhzK6smx2oaqabTfWMRw2?=
 =?us-ascii?Q?d9cR0n7dm4BFi0xA7zKmFauPCK9rJSW22gayfE30z3lk58opPRegtl0zF1V3?=
 =?us-ascii?Q?vQyr11xc70OswjMgkeDGPcx4g4AcfPZjmSEreQl1J4j30IDFB6x+d3E77e25?=
 =?us-ascii?Q?GrMzH2Ntv/u1hvU+29uuOqjQuL3dM865rmDMG5c4WRJEj/Geqv16scnc2y2i?=
 =?us-ascii?Q?nCK73fHEHvZ99gLnFulAjhwJMNpc8sdtB39fKRl4K4H3oXpG7JUIe6KO8vPV?=
 =?us-ascii?Q?lRO1g7tphRmgpC7e1VvlXnRB2NQ51OZwBTS4nUli5H6pkYkPdeqxwF2aLsKx?=
 =?us-ascii?Q?7M2RckSvM3Dz4sl33hE/cz49VJV23LaLt1+P5+aeN76fSUmgh8k70qeB2a1f?=
 =?us-ascii?Q?UMD6oDgSa6YdS3W8lxcGMiDcwJfqjiyS+O/JKFIYyRQDOI+XhfJYh+Qggo7y?=
 =?us-ascii?Q?sOthOphSCFtjw8oMzmDikkAkeJSkoe4FJb+04P5hA/m4M6sNsdd9UaREtpcS?=
 =?us-ascii?Q?x4NkimlHM1Mc3wvT0v1Mqn2hdpKZz7JZotZZb+f7d9OALIWQSjqTTgcJssyu?=
 =?us-ascii?Q?wcbCPLyxth93KCxfzzm5GXufVzKNWU8gt21K3QOMm+IconGp80yNchKf7z66?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dda08bcb-1b1c-4588-846c-08dd6e11eb60
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 16:02:20.1732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCtOGaautKYV452LOVSyPrPidL59vrASNJe9en2Bv39Ds39r9P54e6ppl1b9umSsCXLDUiwgkaSQ+fbI6V6xpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> > 
> > On 27-03-2025 21:49, Badal Nilawar wrote:
> > Hi Rodrigo,
> > 
> > > According to pci core guidelines, pci_save_config is recommended when the
> > > driver explicitly needs to set the pci power state. As of now xe kmd is
> > > only doing pci_save_config while entering to s2idle/s3 state, which makes
> > > pci core think that device driver has already applied required pci power
> > > state. This leads to GPU remain in D0 state. To fix the issue setting
> > > the pci power state to D3Cold.
> > > 
> > > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 7046e7e9a6c7..3317d475be79 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
> > >   	pci_save_state(pdev);
> > >   	pci_disable_device(pdev);
> > > +	pci_set_power_state(pdev, PCI_D3cold);
> > 
> > Another approach to avoid calling pci_save_state and pci_set_power_state,
> > allowing the PCI core to manage this.
> > Currently, the above change aligns with the Xe RPM suspend flow.
> 
> Either way is fine it seems. Or we don't save the state and let pci subsystem
> handle that for us or we save and set explicitly. So, let's move quickly
> with this option here that is already fixing our current issue.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

now pushed to drm-xe-next, thank you!

> 
> > 
> > Regards,
> > Badal
> > 
> > >   	return 0;
> > >   }
