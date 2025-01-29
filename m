Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B81CC02192
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 16:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73BC10E841;
	Wed, 29 Jan 2025 16:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwG6IkIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09910E83E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738168819; x=1769704819;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4zrCjvJpRZQ8lLdRum3zEZlzKRGFAUweplU+yybJuz4=;
 b=UwG6IkIYhbE6LqePTGx7gpGknfQB0zWlCtJs3hdt2aC5RTYu1Mho7VcT
 alKIOPiFBB7AZPD2s+ds+ua3HBp8csNyNBA6uMGlOq4/QW5pSvfY2CM9A
 9MnhhDpPuzFifQKPNvz+B5Ew82miP46Fdggt1/XfCerRKseAIKteAD6tb
 eYcqk8Q8trVV3t3sxaGrl9FdV+xXZKAZsSj+4JnG7DOuXYBAV1kxyWaV5
 ESgIbs8ZxYU2zuixkPL0xDwQuKPPjff7e0WeNVZRogwuvtTMGgK1xKWSV
 ThJIsUr+tsB/1w0VW90XwAvpLQknKX/gyA0dSgk0KmaLRS+msETX284cd g==;
X-CSE-ConnectionGUID: FjYhct6mSPmi4EU79zXOLg==
X-CSE-MsgGUID: Ti6NLimzQfm/CZJBq6EoIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38578614"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38578614"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 08:40:14 -0800
X-CSE-ConnectionGUID: Jwk//dtRR1GCtJbZ6jy3Pg==
X-CSE-MsgGUID: n/8Es0wBSx6gd0xylSmwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109637620"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 08:40:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 08:40:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 08:40:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 08:40:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw9yW2UUg4UNMsxFO5AQuHbXS6Cb1GjTaNHzr7wEZG/jnH0BMTDZ3EZioCvzX9B1AwtHfKMpoDkdjL0qb7TtQGX/uSM70Fu+AeVx7SG+dMMk2qHC86cuRvIyGe8ZamO/88teRufHlF6BosEsMXDL1JAR4mhahD8rnqtLAHxg9bPUrDHxYcJwjTcuvHWxOREfLc4MERml+o2D9gI2Qn2ZeTkkyIHyhumaUGxIymTv2bN2dOkQcWm+tdS/WlQoRPqt4YGwjru8RFkHfLi9K3Iny/P3bql0T7O0XCRz8bnngAZwM/b1wj5zGq7JPc0mg8AugKkIJQ5UTcpWae/WgEMaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ls1HI6nLSdLVX2PboQEPisKLmSB9VNA2w4bhkoELp8=;
 b=k0dV2A0dzH1eiPKTdDHC9S72aZnoJWBXubGco1DlmJyzloBC21fmGRE7n55k9THQc1gsk84WGeiyVoAoBf23cgozn1BSBwo+XAjtJ4BVFEtKaVYmUbH+sWKHPy87O/kbjIhCLN6Fp98UOdG+Z/bECkLBKdKH4GP6uprnmXyRVSkqliEq1qe46MWuUJ1GGGICaeVZV067DDxuTk9G6hhTq8cjnFzZyeBvHblJ3wsCHzzyC3wTGcw0LC96uWd21EzRIlOwOrdzLEw+uWr5/rV+fFOLQYOk+rIx1hYTNPxYy1xFhk2croLRgGO2LA5vqU8/FkR9vLg4iQ+paOFB55NIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 16:40:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 16:40:11 +0000
Date: Wed, 29 Jan 2025 08:41:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Oak Zeng <oak.zeng@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Message-ID: <Z5paI4u5C1Oxr2zJ@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-3-oak.zeng@intel.com>
 <ca61d5a98bb2e6bf778912a10f189512bae4ef1e.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca61d5a98bb2e6bf778912a10f189512bae4ef1e.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bc27ba-4476-422d-92b7-08dd4083993e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pPzZ1FwI3QcECbLqFsUYEUXRy69eSgmYhscj0Xzw4R/R1ERp7b5wqIBa8s?=
 =?iso-8859-1?Q?RHLOpIYDTE5yo4Bdl/y46r1hC4UdO4X6DjvtrZrr+MpxExy2va0CCmdB6P?=
 =?iso-8859-1?Q?I9ArNfQmY/j5jBMyPVqXbgGcnLZ1YC4CB6ZsfO8E5IE5cfdg/120vnExBi?=
 =?iso-8859-1?Q?ddkS7phd2zAmn+fWML/kPE3cnCIjY7MqYze++LBANjBIfttM/3eWTLZ+Mq?=
 =?iso-8859-1?Q?0UBTfUe8JhS6/xozXQtVJpnbUCjI8NrTm/erVn2TA0qh64u/HegRBpEdLM?=
 =?iso-8859-1?Q?ueDZdt6nIj8SX5V1uKdkqBUmPkvdfSyY1NN0z4JxCP2GuSidQgdNz5f0vh?=
 =?iso-8859-1?Q?JUiszTziPfnQZpvPZU4phKLQZXzbmNc5Ee5xkW2cvVeagNr7LvuwpPW4uu?=
 =?iso-8859-1?Q?kOLbAScxp21lLzT+7ZQHrSwtRhKjcXZVE00GWXgwklCJmoTaUbrUFD8/mZ?=
 =?iso-8859-1?Q?5TmKKu42HFfnJpaxO0TOqRLwq33kZF9pg4enJE84jVqD10Xx/hl8/jMEmX?=
 =?iso-8859-1?Q?2lvg7h2uMLyt5asEiIdzUGUKxo+hGb6VsOHPJj9mkb8H+fHKyQpblB4CKK?=
 =?iso-8859-1?Q?vIwJbDTyIJOYCLl2zQq74e+pFpxj66BHxlYr0Qje9syYZ4/LQ6orOEhixe?=
 =?iso-8859-1?Q?6aqR0zPu1REE7IscsQoRdDsBSmNyJlCM+oYV2Irs+NG+cFF7XiIcn7xluV?=
 =?iso-8859-1?Q?NPspDyfyCzi+L2jCpI1BzoJ9KKzMRAP7uIIAN6toys6XW5FEaugYSNGp4a?=
 =?iso-8859-1?Q?mwi4HvsRLWK1TalNMLh1BFPOhFlKMnOE28/Ec0SxGmpyZZP5/rr2oEAwpc?=
 =?iso-8859-1?Q?SicL2HsDfKa6XxiaiTPZmINxv2/WY/WlUiXbHHBUFSQlxanQjrBVviheBA?=
 =?iso-8859-1?Q?Mg/yVB3DWQjG2GZQrroRF/cSBhJdKDl69ehxT1b+ftf+P7xfgUhpFxTAHY?=
 =?iso-8859-1?Q?wwuVpC1VKmwsyh2MrZ4HMN0qiHfQJtwcDn6nxo5A78GS5MFYntZDguKw0L?=
 =?iso-8859-1?Q?cYTUA69ufvnTAQfNor5UehpjQk03vt+OjNcYnHBtiyKr9qd2Z55pn/ALqz?=
 =?iso-8859-1?Q?gJ6vstlm93dNBjrWwRT04vfYfae58NE+mhFLeDU+g9CWualbhmzUzPfwYj?=
 =?iso-8859-1?Q?e/GN0s3AHFs0FYVN6e9Y2G4/Rz6SRsyIb04npWBqgev2G5p2DrqZkCToxQ?=
 =?iso-8859-1?Q?FCFFQsHbw8s75SiUF9RNYV9eNHBVvjrZsRQeRmdo3I3bAGE47J4A4sFJ+u?=
 =?iso-8859-1?Q?lF3F9G/cwpnQ6Wky66CdbLDLnvjRT90JtPCiMfdezrASEgJVkL57umnUPy?=
 =?iso-8859-1?Q?Tf+SiEx+bUwSj9VyBdfLEwsw1qnrkmDQGYOYug+AJb9V99h/R7vVcwwPsq?=
 =?iso-8859-1?Q?dPzX0QiYsbUXB0jEyjKWWUcUr2CX8OxloTjYIu93JGwE39X9ho4t1y6Hxf?=
 =?iso-8859-1?Q?52YaHPaziUJ6+aNv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?72rVShTwaqCfvLb65uhONJzRCIFb8MKCtHhx8Nrrnl6wxQQRbd+sgo1oMB?=
 =?iso-8859-1?Q?nnAfHeemCaL3CjwugB18qZ3AO8xTkxauAe5jqcIubUCpW3h8zQkPyjUJsS?=
 =?iso-8859-1?Q?wXXWIgwvQpGquERyIEh1tJPrc6JH7FLWbrrBnCYxqm21xBF243TojTKNyJ?=
 =?iso-8859-1?Q?bour6FIw/nxBeb4va2wJnJpNhxMkMLmtV7pWVQNgWKBphU+xIOmJl0zgkH?=
 =?iso-8859-1?Q?sH8NLo8Cy92LI824bNrAynrddsq99Cs08Y1fMfJwhtAb9nnfynj2PjAIZB?=
 =?iso-8859-1?Q?DD2u7J18fjoYH9EOliBTvgTYlXoXjd2C9JX7n+gX9iXmrSlor80jOCCfWH?=
 =?iso-8859-1?Q?XadxPjXiixRB1KWhPZtas921N8QrgdUP4IEw+z38KYQiV5jYsmiWMXUk7N?=
 =?iso-8859-1?Q?b09ytFZHp3m3Fg8VJhM0XGLVxdJAV5pnSKfjjpwmUctctDL1VDX934xcNp?=
 =?iso-8859-1?Q?M/mC5D0ZxCKxUcNfMwgaHgJt2nVdUfV1ch1mNZDs+CA3Fw0+lQlKwq1yXn?=
 =?iso-8859-1?Q?eSAf7MTwvq2CeMyTZvjQikb6I4Gd7GMMhWL0SIU7ll1XXaWdXMHzjczEyN?=
 =?iso-8859-1?Q?0/O0ge26sdqcSeb2Y4jgUQMJXaK3sB/nJFJQ7msAUYNE4P5pAODFTTMOWn?=
 =?iso-8859-1?Q?o5hfaiwXKduXmSaT9p5v/R4Xvk80yDVvfhImeElrMxIP6NmyH/ukmTlxEb?=
 =?iso-8859-1?Q?XAoy8/Dofrts2g6JHvN1xTorlUDN6QYA8Mcx794zQFOF8oDcXJJDMwNv6Y?=
 =?iso-8859-1?Q?MDCIx0oVKcFfHPYifd8IEDNkeADIHz3Ju6mxFFd+mD2McbISJWhdm9Ig9S?=
 =?iso-8859-1?Q?5kKqnWXt3ipNuzD0IsqpPY61wfav+BGyM8SwJk/5HzfwTlYZscKBil41n4?=
 =?iso-8859-1?Q?30T3dDcWim+EenaFa10xXWHFlx+yVEeIeqWYTcXr0pusre7u54Ay1NJYis?=
 =?iso-8859-1?Q?iCtOSspK9Nz5vogE0cH+BMki8fev6A+fEVqCkgt8tmYgoI5HH0V+4O8xPt?=
 =?iso-8859-1?Q?0qTfK9iVbAdsj3yktYLcIfvfjpBJOs3Qy0NCQag9dZr/LEZWvq4SSWHek2?=
 =?iso-8859-1?Q?+EoAa0XWdjGMuSwndyHi8pglWjmzjPaCJuc90dYkVqreaKI55OuEr1v9V+?=
 =?iso-8859-1?Q?rjVMNUWZXmkIekk7uOAXMlaynwG4YDcVrfR4XDXh6CJ7PizloLeKy2CGhH?=
 =?iso-8859-1?Q?BXOtmRFN6NrZzRY8xPSkkKfys1P7HTEIKN+R1TvXj49RC4mwiI6CQuNd2t?=
 =?iso-8859-1?Q?SPbAe2JfvS4SVKjxTP4M9+DZKvoKhlQpUAnKsweQ8uti3fYI7bMTrksiw+?=
 =?iso-8859-1?Q?iLG4wdMEtJTaQedrnGS8ZXbeMldbQ3lbCjUnjT9m4naCyR/rEKU/BXoHcE?=
 =?iso-8859-1?Q?sD2Cdq57/HeXwpHhWSg2s/6oIHBgy/BVhaw4ZhbUtjDIUDMcl1O5FYEjiF?=
 =?iso-8859-1?Q?3RGZGU9GlD0qHpLJMw53f8TP90FbhzTlVVHaJZHLbrG7ZiO2T7D6/BSReS?=
 =?iso-8859-1?Q?TjXI7D86Rqx3pdsmatoZA75DsN1E8EcACXUn5aCJhl7gdhiooOL0Qliwk0?=
 =?iso-8859-1?Q?mmwmA8Gwcxdy9UTDtfaIKRpKoSIaAl3kN3TRsb+F+Py6mnHwveOcufE+Zp?=
 =?iso-8859-1?Q?Nz06VKi3RCf8XSoy1a/sCzLskLGFYE3GDglJGTqDmoLlTjiJZEbspP9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bc27ba-4476-422d-92b7-08dd4083993e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 16:40:11.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aGEgd842oRErL63Ubw0fq9wZU08S9J4NdicmxroI7urRfjVMFoKUvq7ODkIBoV3NkhEKs1vyMeRuay5HxmllQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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

On Wed, Jan 29, 2025 at 09:52:54AM +0100, Thomas Hellström wrote:
> On Tue, 2025-01-28 at 17:21 -0500, Oak Zeng wrote:
> > Normally scratch page is not allowed when a vm is operate under page
> > fault mode, i.e., in the existing codes,
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> > and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> > is fault mode relies on recoverable page to work, while scratch page
> > can mute recoverable page fault.
> > 
> > On xe2 and xe3, HW prefetching can cause page fault interrupt. Due to
> > page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> > the page fault), HW prefetching can be slowed by many orders of
> > magnitude.
> 
> The problem on xe2 and xe3 as I understand it is not the overhead but
> the fact that OOB prefetching causes pagefaults and we can't resolve
> those.
> 
> > 
> > Fix this problem by allowing scratch page under fault mode for xe2
> > and xe3.
> > With scratch page in place, HW prefetching could always hit scratch
> > page
> > instead of causing interrupt.
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 196d347c6ac0..3346f88f284a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1732,6 +1732,11 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> > void *data,
> >  	if (XE_IOCTL_DBG(xe, args->extensions))
> >  		return -EINVAL;
> >  
> > +	if (XE_IOCTL_DBG(xe, args->flags &
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > +			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> > +			 !(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> > IS_PANTHERLAKE(xe))))
> > +		return -EINVAL;
> > +
> 
> Could we perhaps add a bit in the xe->info structure?
> 

+1. This seems like a good idea.

Matt

> /Thomas
> 
> 
> >  	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> >  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> >  
> > @@ -1745,10 +1750,6 @@ int xe_vm_create_ioctl(struct drm_device *dev,
> > void *data,
> >  	if (XE_IOCTL_DBG(xe, args->flags &
> > ~ALL_DRM_XE_VM_CREATE_FLAGS))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, args->flags &
> > DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > -			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > -		return -EINVAL;
> > -
> >  	if (XE_IOCTL_DBG(xe, !(args->flags &
> > DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> >  			 args->flags &
> > DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> >  		return -EINVAL;
> 
