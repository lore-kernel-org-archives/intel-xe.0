Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6874ED59D8E
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F03E10E368;
	Fri, 12 Dec 2025 21:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnDEns9z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A4410E368
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765574685; x=1797110685;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eAJKCgvjvr1vm4uqgS7lA0JdStl4Te5r6GeRK7LqNIU=;
 b=ZnDEns9zVLEPUbuw0k3Iv1b1KdIK1qSWLk3OuZ9lrhEnf6y1l8zmh02M
 PuGe5Is9qBMfYUzPANf8/mmXUVR/NQpntCBwAdAWXrj9wKnjQgH7G4BqH
 xmnx/4RraA31vGOWkxnDXk5PopAi7UahZH8NRamL9pzI4Yv/rv1ycTaip
 MWwErUq9UJAe7Kb97FPPbIvJCxnrV2Jm5GCNTUwp1E1rBISpIAAqN+LyV
 Eccmmj44BjZhEek6KzlqXApB6/EvEgE5BJjqvUOivrPjIvnWoO2aDNNWN
 L3Pn72YFFskdX0nM/8cZrGBetdWgblHJ02/Xl02tHy6HHvyUQMISw3tQS w==;
X-CSE-ConnectionGUID: jpfoJAG/Sm+mn7CSIS6nLg==
X-CSE-MsgGUID: OlYJaQbWQHWETh6kTnE6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79038891"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="79038891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:24:45 -0800
X-CSE-ConnectionGUID: sBeOYVwlSx6/r1Xs4bfOEw==
X-CSE-MsgGUID: BI6FuzsmQrqFIhmjXcpu8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197449097"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:24:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 13:24:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 13:24:44 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 13:24:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb7zKDHQbMmL7NrmIhVcXqOEBm3NUioG6xUPcG2UBTvH+cKAUmf97gdzsWcXOGTE2Pe6OxL8BMB7bN+8LNsdmWYN1iMONW2PaqwPYDvUb33Nai5HaE5mz64GMD3QmcpIhlNMhw1/y3e5+ecDchEIL+AkJQiFbZB0t43WbMrjh03cNlMBw0wobMxR1SkKyIBbksG4QrMU76bg0nSGyqxw6fSoFwfdSKpS+CHqm4t3JzvRw1q/M35SJjzx+tskGTqDcEQ4Qkk0teCIhdpWS2gbjnqUdO2cBohsiXEJlOFTLMdVEHD4sl3cdin8MzdShiojq092xCHtflGJGhNFNILLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCVIZ0d3F+ed7Req3ace/NkISJERz3/m8JM3ts8cDcc=;
 b=f8Hj+M5JIr60mr5Dya5xyHnnQtdAatF+IXj/Scx4Nj9jWeoBcoxmKVCAqOWL73dy45oTQE/CtW1fchwTTInnzkdUU/XSLLEMQ8Qa7fgnlsaK4fOUSEbjbpONkl3ojpbK0CS45s7F9bkBWpTN5Yz7Q8mPfBG7MJQhOVAuzuWCO6GYAa13idt6Xyec0A4MaB83fRqo4V66q1hdodfzPXGuIsUzFq4beUAUQvUMBFGoqZf15YDrNb+4Cc4MS/bIxQJFPG4p2oRUFQCnthJ3k7UGJUMqWRYyXnXq83cC+58K6fbOLfmnouiyZ54dVANBa8lv42UyPajZUyq80qy1dJ7Ncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 21:24:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 21:24:41 +0000
Date: Fri, 12 Dec 2025 13:24:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 04/12] drm/xe: Add vm to exec queues association
Message-ID: <aTyIFtn68vo1Xp9h@lstrano-desk.jf.intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-5-matthew.brost@intel.com>
 <0da94fd75261b3f00e54325f8063515923d10184.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0da94fd75261b3f00e54325f8063515923d10184.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0320.namprd04.prod.outlook.com
 (2603:10b6:303:82::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: d400300b-02fe-41dd-8fa7-08de39c4dcd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4ld7ACYkXkbCfIyK8up7QiaGQs2xZqkJVRUfg/00m+DJlYjAFez6sbuI+h?=
 =?iso-8859-1?Q?pYv52fy6q3VfvtNgBIAwk97Oo5wLjgr/1L4tfzW3RduxGLppe85L8tJmjv?=
 =?iso-8859-1?Q?pguNl8224DMWK6W0p2ZoihIVjz1pYHihYsW105I8H962o/BuZZKBGeivs4?=
 =?iso-8859-1?Q?g8d96UpS7anDtClhSPsgO5hAbn3ek8Rgpv8+CFe8g6D8ZPJbzSUzYNDfpt?=
 =?iso-8859-1?Q?7LpeMZN+ojz9RwIdQLcrli1bVtxsYmiDlSpHNZaxuY5P6vo6/ynHllzSZG?=
 =?iso-8859-1?Q?HGi5lEYeAAvA5D4LTmA4wzWltMG0KbBf2OggnxnxBvlM+71QdNGIqk93a9?=
 =?iso-8859-1?Q?GTILKxNQ6dS3Z/+y4jbVFRtb4WB5gbiJR2ihJNVPufhE0stSWt3JVdZNG1?=
 =?iso-8859-1?Q?OR4QD1VsW2HsEAwcxZVW6JcYYo3QwkVvDrkn5nhCxFqRfWGKl5bd/hVQz5?=
 =?iso-8859-1?Q?DX7ZFpkTM4Quq1Foe7PTYhSGJE4Rv622D3x6f/Ox9CdWDiEDBCW8JDUoIA?=
 =?iso-8859-1?Q?UJHTMFhoiYA60rHBlY1YWpQdlY0hkG4KFf1tsEdOEbA2TjcztK43pi0yng?=
 =?iso-8859-1?Q?qr8lvxXCM1dEufxONZ56lfQd6w79wE7rmBhBpwMGkMO7h+YZJfwyuttH/x?=
 =?iso-8859-1?Q?pV5rRQXHW5FsClB3NQUxsCB/UFt/As0pscQaQ+kSzl2TNcAMGkoRc7A/xw?=
 =?iso-8859-1?Q?IL4ai3NExe9zN5l56GrVWWD0v36vgFkZTuF13HFcCkvuBtr662Nl0P1+Rq?=
 =?iso-8859-1?Q?npQDpIorwOHOe6d38RIzSesucjxqttVG1n75zgwbp6gGG1Blfz2s0Z+uv9?=
 =?iso-8859-1?Q?U38dTTMb+tZRD73JvvdbuPCFxMbLDjA+Ja2UE/4gylxEtzxKgq3kckAJmb?=
 =?iso-8859-1?Q?BlJYcGu/E7j7HWkD53U/aTweWsuU5ZwmYQLFSCH9nRkgTJ9P9trWPqekmq?=
 =?iso-8859-1?Q?0oxQAZJLs2qAMt5PDccNxcvGiaERTEVxdZ3JKklQo6zOjajXOub4eohUL6?=
 =?iso-8859-1?Q?NTCMU1e6bOtb8ALHSXs0de2e7qIfWc9iQuIMSKP2FVQ55h+slhfEKKrpTo?=
 =?iso-8859-1?Q?9RVc2PFPkqnJJ6OWAFSU3OuB1JX5l5fLMrmlZY4ZVQrPhv0IuM63gaWBDt?=
 =?iso-8859-1?Q?bSH8LnIrru1pqhTNvjxA1yA/oe5JeT9VrGAc6V9xWR0JlTyllZIaJ+dYfN?=
 =?iso-8859-1?Q?9SjQHykhr3KtgX0OutlenVTbdxtuJ58ky6GCXJ8xO2Epe33WuSV9L69ce9?=
 =?iso-8859-1?Q?Y7fhJi3+gYFruh+ikohkW+2tElu4o2AQTrZ5zvv1RkKCQhLbdMWbhyVUJO?=
 =?iso-8859-1?Q?daKaBYxZwmSykrR4grUp3NTOC0eXsBMymHB5LhPyeEfBQQfRf8v7jkEObX?=
 =?iso-8859-1?Q?z3Lcrm6zX3CZXwl3CQsJTT0FXMHQaX7voI2dyekD9G0sns4m0qt1oo9h5U?=
 =?iso-8859-1?Q?DPD0DD4uoUC4DYYaG3n1SQHl1MMLtrH4Iy+HjL7ThlqwMeVzw5Ca/V76lC?=
 =?iso-8859-1?Q?QPwYZX05QiydW4hwv9FMGO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W4dWmjIyiOP+/n3863gW88hFH6BEK1AHe3yjXDAKY78rg03bL3cDigrbWH?=
 =?iso-8859-1?Q?YmoN5p0bnZThR0KMhrDiV3Dj6OYrayf0v2B4dFXKamGMTuraQC6R1n9RRP?=
 =?iso-8859-1?Q?IBbSBlm+RmI7DVBz+ZZbnobgVBiatnSlvzGa5w4+ApK+Rx/LHrgoqGUhmj?=
 =?iso-8859-1?Q?pfJOyGBDZrN9LiO8a1njBWrm4w/B+fMFSwrem4f0YvHm68mu62eFqbkLId?=
 =?iso-8859-1?Q?Nahdkrbg/lwQ/+e+8/yqkBq3kwePFzekpKcQA/tc06ApNpKLYHVBai/O4P?=
 =?iso-8859-1?Q?+wSVkg8O9o/HFEfYsOTRDqbYkMqKObL3XFkthVXMEMp9IFWjPsQqZ9kx9g?=
 =?iso-8859-1?Q?i4MNvr9ZcbWzG3+P3s7Ha03qOnqBoD8PxH8EtTHj64pbN+5NZoZzXXCKnF?=
 =?iso-8859-1?Q?xH+xu5DtEdaEdt/MyDjErTJOnZjPaNCyC1OtPdYjTNES6gVu4dC88utClS?=
 =?iso-8859-1?Q?LfZyeXXbFCB9TrjgAbk0fm1flTdCBSuNKO3xyD9LFSdsnaod1YxpzSwuuj?=
 =?iso-8859-1?Q?7SDpJrr+Y2xIoFB8UWQuailcVTjuXuKCx3lPn+5YIS9R/s4JAbqCD3cP3V?=
 =?iso-8859-1?Q?qGYLfKS1DQR+HI8Ev9XlWnLPz/mx38soVIS8XmO5zcPCk2s3wlB6eqNVif?=
 =?iso-8859-1?Q?FfENzLqVwDCv61RaD7j/Pik0S+d/N3GA4FQEOGzLTwJUliV7OlaYXv4qXq?=
 =?iso-8859-1?Q?u/vdM2tUUICXBr/BiyyRZUY3+zvYccun5oazJYivwEMFaXr2C51ULXmeiS?=
 =?iso-8859-1?Q?prFjOA5dfc7nuIohHg+uKsKzKMnTVCB6Cixq6ETlWm+qHH8ZITZdPk9u8z?=
 =?iso-8859-1?Q?jdXuhb/PYF6JJBHfc/f/Vkk5wGe9Fr+VUjTW40SIrKEFVGHjfq6BJMhLEH?=
 =?iso-8859-1?Q?zKTzmd3ZJc91/4rTmGQyaBee8/K2sHI0u5ME2WxiMHLrtaHcJPZNNOUYE2?=
 =?iso-8859-1?Q?04Thz1cL8YYNoY8npycD984ZOoll0kTzSL1XVoB4xDsjjYFzJ5HxeKxZGu?=
 =?iso-8859-1?Q?zEQz+F8+OI2ItN/SQB38sO/3W9xEwPcAqa1bNKvDFfdeDU3DVWdTUoo59K?=
 =?iso-8859-1?Q?mwwLjNCoqUNvYPps8sgDuUmOulWJVCV1vT/ySczKPzdI+q2hEcmi3hg9F6?=
 =?iso-8859-1?Q?A5nknn02ZcYgnKJJUN5PcJ/5qKvE3BcmxVJvEBPc+tBupYSAmpVRYTQvAf?=
 =?iso-8859-1?Q?bIX/6queBIaC61YIcDG5ZwYh0rTLFeM9NWwrEQPFM1KWSzdS8WzzN+WotO?=
 =?iso-8859-1?Q?di9QxTphPvXny4CLj1uVNfpgIEgmrLVtrmXpfjBE86YJ3Iv3ABaiLs7PGF?=
 =?iso-8859-1?Q?EpEB4QJ52iHIF82gV7EvqvVwiyZFXvmOpn71k7hRQQnwm/rBxJOjvvpgJl?=
 =?iso-8859-1?Q?X8Yh0xPNMx3XGzwSe6OA5ib8Pwxzf6LEmd2p0Dozbudh8kPDOOUBsTBnaR?=
 =?iso-8859-1?Q?hfunrncRardD5vtqa1ofWjhE5+eTQwoLbFrzrupMA1dMcDnN1D1A3HtsBL?=
 =?iso-8859-1?Q?bNm2ERts+w+7JwE3vnXub3DzbAPymTqAL3GmCMHx+3/nhn5IR3dJZMTPv5?=
 =?iso-8859-1?Q?eyh/tnrRMuIP0MXu2qlmxIbbQ790xwN6lMKc/4UwDSscTaDZqLrDwoX2VT?=
 =?iso-8859-1?Q?Aira6yERQdbIx9KOaTbRzLlj+n/3BRiC4uY/fucyCngPxTwLy9lq96fQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d400300b-02fe-41dd-8fa7-08de39c4dcd6
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 21:24:41.6300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVZuxbXZROfkczGARcONasPjAGhtEBMhBp4vmFBd+yhw7iIApWMgyF2WwS3mAgt+JydVOiRa6UeW43wiyEqXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
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

On Fri, Dec 12, 2025 at 02:03:32PM -0700, Summers, Stuart wrote:
> On Tue, 2025-11-04 at 11:56 -0800, Matthew Brost wrote:
> > Maintain a list of exec queues per vm which will be used by TLB
> > invalidation code to do context-ID based tlb invalidations.
> > 
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.h           |  7 ----
> >  drivers/gpu/drm/xe/xe_device_types.h     |  7 ++++
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +++-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
> >  drivers/gpu/drm/xe/xe_vm.c               | 47
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h               |  3 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h         | 13 +++++++
> >  7 files changed, 79 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h
> > index 538202eebc16..764f24f4adfc 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -62,13 +62,6 @@ static inline struct xe_tile
> > *xe_device_get_root_tile(struct xe_device *xe)
> >         return &xe->tiles[0];
> >  }
> >  
> > -/*
> > - * Highest GT/tile count for any platform.  Used only for memory
> > allocation
> > - * sizing.  Any logic looping over GTs or mapping userspace GT IDs
> > into GT
> > - * structures should use the per-platform xe->info.max_gt_per_tile
> > instead.
> > - */
> > -#define XE_MAX_GT_PER_TILE 2
> > -
> >  static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe,
> > u8 gt_id)
> >  {
> >         struct xe_tile *tile;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index af0ce275b032..145951dd95c9 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -57,6 +57,13 @@ struct xe_vram_region;
> >  #define XE_GT1         1
> >  #define XE_MAX_TILES_PER_DEVICE        (XE_GT1 + 1)
> >  
> > +/*
> > + * Highest GT/tile count for any platform.  Used only for memory
> > allocation
> > + * sizing.  Any logic looping over GTs or mapping userspace GT IDs
> > into GT
> > + * structures should use the per-platform xe->info.max_gt_per_tile
> > instead.
> > + */
> > +#define XE_MAX_GT_PER_TILE 2
> > +
> >  #define XE_MAX_ASID    (BIT(20))
> >  
> >  #define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)   \
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 1b57d7c2cc94..49822baf5967 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -72,8 +72,10 @@ static void __xe_exec_queue_free(struct
> > xe_exec_queue *q)
> >  
> >         if (xe_exec_queue_uses_pxp(q))
> >                 xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> > -       if (q->vm)
> > +       if (q->vm) {
> > +               xe_vm_remove_exec_queue(q->vm, q);
> >                 xe_vm_put(q->vm);
> > +       }
> >  
> >         if (q->xef)
> >                 xe_file_put(q->xef);
> > @@ -143,6 +145,7 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> >         q->ring_ops = gt->ring_ops[hwe->class];
> >         q->ops = gt->exec_queue_ops;
> >         INIT_LIST_HEAD(&q->lr.link);
> > +       INIT_LIST_HEAD(&q->vm_exec_queue_link);
> >         INIT_LIST_HEAD(&q->multi_gt_link);
> >         INIT_LIST_HEAD(&q->hw_engine_group_link);
> >         INIT_LIST_HEAD(&q->pxp.link);
> > @@ -796,6 +799,8 @@ int xe_exec_queue_create_ioctl(struct drm_device
> > *dev, void *data,
> >         }
> >  
> >         q->xef = xe_file_get(xef);
> > +       if (eci[0].engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
> > +               xe_vm_add_exec_queue(vm, q);
> 
> Discussed this offline, but because of potential memory corruption in
> the register/deregister path, the plan is to continue for now in the
> queue create/destroy. This means we'll get errors from the GuC when we
> race for the register/deregister and submission which will be addressed
> in some later cleanup. Since this feature is blocked behind a feature
> flag anyway for testing, it shouldn't have any other adverse effects.
> 
> One other minor comment below...
> 
> >  
> >         /* user id alloc must always be last in ioctl to prevent UAF
> > */
> >         err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b,
> > GFP_KERNEL);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index c8807268ec6c..a2281fcb55b1 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -147,6 +147,9 @@ struct xe_exec_queue {
> >                 struct xe_dep_scheduler *dep_scheduler;
> >         } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> >  
> > +       /** @vm_exec_queue_link: Link to track exec queue within a
> > VM's list of exec queues. */
> > +       struct list_head vm_exec_queue_link;
> > +
> >         /** @pxp: PXP info tracking */
> >         struct {
> >                 /** @pxp.type: PXP session type used by this queue */
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 84f4c8f1be33..cccdd931dd5e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1507,8 +1507,20 @@ struct xe_vm *xe_vm_create(struct xe_device
> > *xe, u32 flags, struct xe_file *xef)
> >         INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> >  
> >         INIT_LIST_HEAD(&vm->preempt.exec_queues);
> > +       INIT_LIST_HEAD(&vm->exec_queues.list);
> >         vm->preempt.min_run_period_ms = 10;     /* FIXME: Wire up to
> > uAPI */
> >  
> > +       init_rwsem(&vm->exec_queues.lock);
> > +       if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > +               fs_reclaim_acquire(GFP_KERNEL);
> > +               might_lock(&vm->exec_queues.lock);
> > +               fs_reclaim_release(GFP_KERNEL);
> > +
> > +               down_read(&vm->exec_queues.lock);
> > +               might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
> > +               up_read(&vm->exec_queues.lock);
> > +       }
> > +
> >         for_each_tile(tile, xe, id)
> >                 xe_range_fence_tree_init(&vm->rftree[id]);
> >  
> > @@ -4387,3 +4399,38 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct
> > xe_vm *vm, uint64_t start, uint64_t r
> >  
> >         return xe_vm_alloc_vma(vm, &map_req, false);
> >  }
> > +
> > +/**
> > + * xe_vm_add_exec_queue() - Add exec queue to VM
> > + * @vm: The VM.
> > + * @q: The exec_queue
> > + */
> > +void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> > +{
> > +       /* User VMs and queues only */
> 
> Why? So the expectation is we always do a full invalidation for kernel
> VMs? Do we want the potential performance impact of that, particularly
> for the migration queues?
> 

We don't issue TLB invalidations via H2G on kernel VMs; instead, we
insert ring instructions to perform them. We fully control kernel VMs
and queues, so we can trust that TLB invalidations are correctly
inserted. TLB invalidations are only issued when we have a VMA and
attempt to move the backing memory or perform an unbind. The migration
VM doesn't have VMAs; rather, it has self-mapped page tables that are
dynamically programmed to perform operations such as clears, copies, or
updating another VM's page tables. PXP does have a single VMA, but the
memory it backing it is pinned and never unbound.

> I get that in the current version we are doing this as an explicit
> result of a user queue create, but I don't otherwise see why we need
> these restrictions.

It is about ensuring correct usage in the current code. If we need to
add invalidations to a kernel VM, we can remove these, but any change
like that would require a proper review. That said, we likely should
have more asserts in the TLB invalidation layer(s) to ensure we are not
issuing TLB invalidations on kernel VMs by accident.

Matt

> 
> Thanks,
> Stuart
> 
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
> > +       xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
> > +       xe_assert(vm->xe, vm->xef);
> > +
> > +       down_write(&vm->exec_queues.lock);
> > +       list_add(&q->vm_exec_queue_link, &vm->exec_queues.list);
> > +       ++vm->exec_queues.count[q->gt->info.id];
> > +       up_write(&vm->exec_queues.lock);
> > +}
> > +
> > +/**
> > + * xe_vm_remove_exec_queue() - Remove exec queue from VM
> > + * @vm: The VM.
> > + * @q: The exec_queue
> > + */
> > +void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q)
> > +{
> > +       down_write(&vm->exec_queues.lock);
> > +       if (!list_empty(&q->vm_exec_queue_link)) {
> > +               list_del(&q->vm_exec_queue_link);
> > +               --vm->exec_queues.count[q->gt->info.id];
> > +       }
> > +       up_write(&vm->exec_queues.lock);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index ef8a5019574e..5f3341ef99d2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -284,6 +284,9 @@ static inline struct dma_resv *xe_vm_resv(struct
> > xe_vm *vm)
> >  
> >  void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> >  
> > +void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q);
> > +void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q);
> > +
> >  /**
> >   * xe_vm_assert_held(vm) - Assert that the vm's reservation object
> > is held.
> >   * @vm: The vm
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 830ed7b05c27..180b48d62480 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -290,6 +290,19 @@ struct xe_vm {
> >                 struct list_head pm_activate_link;
> >         } preempt;
> >  
> > +       /** @exec_queues: Manages list of exec queues attached to
> > this VM, protected by lock. */
> > +       struct {
> > +               /** @exec_queues.list: list of exec queues attached
> > to this VM */
> > +               struct list_head list;
> > +               /**
> > +                * @exec_queues.count: count of exec queues attached
> > to this VM,
> > +                * per GT
> > +                */
> > +               int count[XE_MAX_TILES_PER_DEVICE *
> > XE_MAX_GT_PER_TILE];
> > +               /** @exec_queues.lock: lock to protect exec_queues
> > list */
> > +               struct rw_semaphore lock;
> > +       } exec_queues;
> > +
> >         /** @um: unified memory state */
> >         struct {
> >                 /** @asid: address space ID, unique to each VM */
> 
