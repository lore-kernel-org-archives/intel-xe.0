Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802CFEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367EE10E8F2;
	Tue, 10 Sep 2024 18:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxfMkmkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748910E8F2
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725994177; x=1757530177;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tsBr+bSrek1NMcNO64ah0cSlUQ2hOEO1Rs2aDw0bz1g=;
 b=VxfMkmkDJGix/6HUtUY90Pg3yfSoyB0lrrqF0TNwDz9oVCi6gX0OVUB7
 /ZfMzz6YoohLaiM6Wo5Jmrra4hU3aKL3r/vspLdD3/Ni++K49ZPVcw3ka
 Fk1l2SY6TSGbSqD/WAUdSEm0f8vXbG1F/CfHJxB1cG1ChlhQTyh4zfjql
 MPGiiOW8f3GmfDeYcfkuu9ECSx5LQ0gNM/L1wnMh/lMh5dpHSN4qLQf7T
 E5LuRcndJxhLwfQuFtztt8ABV35Hatk06tno8klnzJi5BTcLh/wC3dv6F
 MmHOoO91g6nLOsmHMQuD3H2/BdzWhL6WZLfAFkQ6KnhecHkQOKl3giC1o g==;
X-CSE-ConnectionGUID: xmGlGheiTi21taacmo3zZQ==
X-CSE-MsgGUID: rl9APYi9RSiYdFbq8i7OXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24639989"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24639989"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:49:37 -0700
X-CSE-ConnectionGUID: fIMk5bepS8KtFd4tvEf+cA==
X-CSE-MsgGUID: 0yQmAFqNSg+ZJ7kAo/GCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="104592517"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:49:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:49:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:49:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:49:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a56mZgAnHpIV4i+lF4wgPnhEs+keRpAzJSAR8a7Nb2F6OrUUPRF6O/D799JN5PCzS09ZTKgATgR4HVZJl4BW+I6PSkeN4deieyqPP418vSKZnoV35ZbKw3792WiSduJG/kU1aAlks6iYJg18L9k5A7QEB91KKsyb+Y1VZL+RJs/whQpxIN6ICkaizbqYd3eBOdMaCxgBLseIN9WCRI7SY5vV3WWullDL6y59C6osm8jn4SlxbbzdyxzHf3NIO0ipH38dEI+GIluRddPaRU/J0UMhi2yJ0LVtu9xL1ViEjgsApmOxW/RzFmRhgsG6od5tctR5d7eJWPQT17MgUvNVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBook0nAd2SvfqD913aQDszIO57ILoii+/LunTVxAp4=;
 b=reWVbqPJJfJNmbCoDFCcRemuLpICHSOyXNk/XglZ8olWF0TTRSS1ERNPitcrtM5BgTyHLam8SW7s84Qk5Gb2g1OAmio9WfoUCb/uY9spYZKgesRaM04xu1J1IEkt6fyK5QVrwqS8LU+YnQCnuY2DnyaBE1vic+MTMBuAe9f+QuQpezlnVgQO3xRRIZf6CwGyoOCbo7o2TQ+dshMPIfokp6yH9nSu1dkUF20bwljmj7y7p8YugvlyTYlYRJDYEbyNodHPY+ie0gaRZ7c287RAC41qN8JfCLGDgiVs0v3j3A8kMabtzySb3csD+3gH/KxGO+jPVyMfgNRzYQehVBY3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 10 Sep
 2024 18:49:33 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 18:49:33 +0000
Date: Tue, 10 Sep 2024 11:49:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 25/43] drm/xe/mcr: Convert register access to use
 xe_mmio
Message-ID: <20240910184930.GE5774@mdroper-desk1.amr.corp.intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-70-matthew.d.roper@intel.com>
 <ZuCLuLRwzB-F-_KK@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuCLuLRwzB-F-_KK@intel.com>
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|MN0PR11MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b21fe76-1318-4cb0-65c8-08dcd1c94f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cdN9dl77b9/Rm1bUGKVi3xrf7Z9J3DFv8oXkrcJbPH34uizMXLfMCBPQHgfF?=
 =?us-ascii?Q?8KAcFAIzzT5cpHqs/B0WIpE3QmZz/cKrveNYGJIG8Zwmz3K0LAWtgGwgLv+F?=
 =?us-ascii?Q?PTt9OddIbDaJrjIDaCOm0JGZKamoBmsW0nOVsbfcx4+6v2OCGkdRO25g/AF/?=
 =?us-ascii?Q?ReSJ+kKo8smpd5Xrl1om6DGI9yloJJ6dL5e6mtF2S5gYhNZQV4xYi8I+dFY0?=
 =?us-ascii?Q?iF02Lv1BUQ3d/gPWw5kxMnTWrYT0F/VVsTK4hD5vnWoD6oAVKNPaM5zbDGxU?=
 =?us-ascii?Q?dDkB2ysN+thy8uR7aP+CKoSGsc+b4PJsksfxpF6D9NkiZyCrnFTRkJdMzFOG?=
 =?us-ascii?Q?qC6/oB8a3sHSwB4R9iDAV/3ogAqeLaFnClSMGPxnog2UIOR2sV1lmm+h/OD1?=
 =?us-ascii?Q?PONAgWpwq+W/b9wI2SCzo1WDVAojhZhM6UDmb4Wt3BmJAz2urmYZGP3WifVm?=
 =?us-ascii?Q?j6ThNCRN32IRkTtyJJkIz1w7KwHUt5r9CUjO59hdemx1jkjUDKJb47SATKC8?=
 =?us-ascii?Q?RjjiCV3YkzCOFPyRGVrMTi1rNz2uSmpgWjUHp5sZ+O2At2m8tesbtx4ECCrt?=
 =?us-ascii?Q?K9ynlCTlRPJRjK4o6rR7Nu6q+mHsY3WicF3X971SIbemvXpjzHM38V5c0dtg?=
 =?us-ascii?Q?nV4xSoLIIBM04GD1/jCvh0zjYiWMb3aGOcdxUX9h3ChDRm6rgZCvnsFNfW9n?=
 =?us-ascii?Q?wdDiYs9IQRVdIce9tlx26rLllnIfrrcJPwnxqUtJplZjdh2ebZaKrbM89LpJ?=
 =?us-ascii?Q?KLKIvMf61OMbQjhLry6BBxjJLeSTlAQiqTKHlx2PkEroMyLaIuhJmrVSoTsd?=
 =?us-ascii?Q?+2HuBAjG7EUqFo/9MFOul9Vw0E679VMNgnscTN2W9fr1/sOleM12cbUUxEqt?=
 =?us-ascii?Q?CG6pjT7Dona3HO1HqOby6X531mYIEJtuQbyk5mmchC5xqnan75oNgry0p9H5?=
 =?us-ascii?Q?szfQE6egEzzz2ybJQJExedEVB+BVJbtBuuifg2HgdoouCmdoHqVuizI6WP4/?=
 =?us-ascii?Q?olCdsOesARZWPUAqYOccFeSzQe7JXqTrVgWDd7aVg5MfFH124o1G/N2iihlO?=
 =?us-ascii?Q?zajmQhvaIJOBzhA7OucHvYAJaStCLGqRaspbv9ve8zThHj5j+JeFktbP6xGr?=
 =?us-ascii?Q?CBh3NLwnZzwfwv6ireRgP91VbRxtCU1nWNLgNVO1iVF0/Xnj8glCWOrVvyQA?=
 =?us-ascii?Q?Rg6dyN15hFQa0Qp+J8UrCMHe1pOvgp2HvzFjQAoU/yvho6ySGfdntXLIOUGl?=
 =?us-ascii?Q?ihD7JqW+q9BFlEQOhWEoA+i8WWmomKu6s/Pgt5ADuQChV6kZKUZizFh3EAJb?=
 =?us-ascii?Q?bMej8r85stEsEPFyeGZyBds05PY/eKimNxPxoZ9y/g62ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOr+86lBBMpWRebr3q1OSWlCHZQS+CKjv6y9lMM6MOAIhWSFQ1jUNFh4QxxX?=
 =?us-ascii?Q?fBcFQSL/XyU0xQdyTkhAnLXLEbRot+6UbxHJAANmrRkSv+2fwFbkwPT9IPVN?=
 =?us-ascii?Q?q9kN+VrZ5ekPNyUSyd5L9czUUrrbji52JjGk35g8USgDsgBjg9v/vEOYsYJp?=
 =?us-ascii?Q?04Ogy4Puv83bjtheAJdURxad6eh+Rvq2gkBLplL63Bu6wjXE+bVT+4hoXjLq?=
 =?us-ascii?Q?hlCKDUnT8qagdtJZC6cJPeSUXk6GFWsTS0/RaQTvtiyiRETh4pLCVP6CmoHU?=
 =?us-ascii?Q?YQ2QK/9xqNVmQtnpyFNNsw02t8cVDkH7Vh7lpMdiJPhi82KvByYwFHVZJN6b?=
 =?us-ascii?Q?qW7E4O27f+kd5fI17wRKU0q2G7wLakiTjcn2Jdm0nTf0lWrXElqlx53Z2f4R?=
 =?us-ascii?Q?2hUE34MyWn4P1inKrn3tpSMMKbCQZivEdUI0I6fuhIhXyzQSZLd4GKIIzTie?=
 =?us-ascii?Q?0DFNEWsdSFrg+H09UFPzMUCzo+Dv50oy7RgH5TBU0EXhXiL0lSWanAMnXCA+?=
 =?us-ascii?Q?nKfFcHKqxepfjGTV1eS+Xx29IyCmG0aWTSG87YN5mG/ynS3T8FN/8qRUlgvk?=
 =?us-ascii?Q?ItkgWok6HUmNe2eeU5BayylGmkogGn6rlrXclamm9uy4KAAEFBVjjwsWPYgW?=
 =?us-ascii?Q?SUeKpf/P13awfdpYmDQ4fjonSrNQ2bRTtdD72H77vKsfgs7r1bDSK+0xyMa6?=
 =?us-ascii?Q?b9oH35er+vXEyKzeP2AKAWjUFoSTdWmziZoVkT485wRzwWAWiViikmZJw5Gk?=
 =?us-ascii?Q?wU0rnHD+ILcnSM4XzkCNLPhfnUdTsrsdDRNEB7ZV0uSoo3l2gYLb2Pnz0Yml?=
 =?us-ascii?Q?itHSISMHQkV6Y0Czep4nAgxNsScvJhcNcZyiadNGYWE3FkRzOeFgV3e2oA86?=
 =?us-ascii?Q?hLTGucrlSeAdeEkNBnnqRKqtTe5ZQjeserN1ILFoFqaWuNuyy/8HFnk4tmoX?=
 =?us-ascii?Q?N2lgmcl22330zaod5N2klMSdyWlgXdozE6L7THIuGZR0wg2oIpskPvfQLcjV?=
 =?us-ascii?Q?2iuT+jPIEKXN5fUsN5Z55KQEEzZlyjTR2HrjlZuwBW4RM6+koRjdY6jweN/U?=
 =?us-ascii?Q?SFl3N4hP0v1vai7GM3O0fKfA2j/83y5+smYaeOlOMrQtZGgucl/MkKTnuGJ0?=
 =?us-ascii?Q?Ef9va1TNCKiSecIf0btfvQxDpmjl7OM6j4NAhfKAfhJJT/oTaRQzVLR5pBVm?=
 =?us-ascii?Q?NjShqmcYnHgA4ymUag8uep16ZHLstdQ4NdHltMk+UgGRFOyENim/blEtwvgo?=
 =?us-ascii?Q?FeqhlvbFAM/VE0NDQ0BT5SmESb/1ytolVTjHaXKhSH+Esj/EyPm7ciKddJNV?=
 =?us-ascii?Q?QoHvl1lP+lOOm10wlSHN6jvj2UFjmuG0ZICqj3Gi7hEImr7l4oc3Tcuqz5K1?=
 =?us-ascii?Q?S9qM5eOAxUhXG2Q8dU4TbqvB2kDOMpnzdB6LvuI7Bv4Gv0nrilFNO5zIdjBf?=
 =?us-ascii?Q?xCaf35D+5adAlN6hqfqkL9G1ShHuoozizxhqOIduVS8ZEc7uLqWBVYdgCd4/?=
 =?us-ascii?Q?UeuSHbWby6i20wxgVHO4fyE7mP5Q1xyDz+YY9QAqMB+Vz2JIl2I3pnhqCMmF?=
 =?us-ascii?Q?htFXZjCspJQABHjIvpd3LcpvXmAiGj8abfvcs5FkRnGvtT6r/sSqW4wVG5IJ?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b21fe76-1318-4cb0-65c8-08dcd1c94f55
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:49:33.0477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWNzJuPMeR9YC82916xmTrhrL4ynvuS7Ggwz+RmeZlQ10UU5aGo4h7JmY74NEM/o5BQ7f9q58v0+s0PYKycztvElxma8WS5WbB8yi19uLVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

On Tue, Sep 10, 2024 at 02:11:04PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 06, 2024 at 05:08:14PM -0700, Matt Roper wrote:
> > Stop using GT pointers for register access.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_mcr.c | 39 ++++++++++++++++++----------------
> >  1 file changed, 21 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 7d7bd0be6233..2671ce6b1a76 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -239,11 +239,13 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
> >  
> >  static void init_steering_l3bank(struct xe_gt *gt)
> >  {
> > +	struct xe_mmio *mmio = &gt->mmio;
> > +
> >  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> >  		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> > -						xe_mmio_read32(gt, MIRROR_FUSE3));
> > +						xe_mmio_read32(mmio, MIRROR_FUSE3));
> >  		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
> > -					      xe_mmio_read32(gt, XEHP_FUSE4));
> > +					      xe_mmio_read32(mmio, XEHP_FUSE4));
> >  
> >  		/*
> >  		 * Group selects mslice, instance selects bank within mslice.
> > @@ -254,7 +256,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
> >  			bank_mask & BIT(0) ? 0 : 2;
> >  	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
> >  		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> > -						xe_mmio_read32(gt, MIRROR_FUSE3));
> > +						xe_mmio_read32(mmio, MIRROR_FUSE3));
> >  		u32 bank = __ffs(mslice_mask) * 8;
> >  
> >  		/*
> > @@ -266,7 +268,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
> >  		gt->steering[L3BANK].instance_target = bank & 0x3;
> >  	} else {
> >  		u32 fuse = REG_FIELD_GET(L3BANK_MASK,
> > -					 ~xe_mmio_read32(gt, MIRROR_FUSE3));
> > +					 ~xe_mmio_read32(mmio, MIRROR_FUSE3));
> >  
> >  		gt->steering[L3BANK].group_target = 0;	/* unused */
> >  		gt->steering[L3BANK].instance_target = __ffs(fuse);
> > @@ -276,7 +278,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
> >  static void init_steering_mslice(struct xe_gt *gt)
> >  {
> >  	u32 mask = REG_FIELD_GET(MEML3_EN_MASK,
> > -				 xe_mmio_read32(gt, MIRROR_FUSE3));
> > +				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
> >  
> >  	/*
> >  	 * mslice registers are valid (not terminated) if either the meml3
> > @@ -380,7 +382,7 @@ static void init_steering_oaddrm(struct xe_gt *gt)
> >  static void init_steering_sqidi_psmi(struct xe_gt *gt)
> >  {
> >  	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> > -				 xe_mmio_read32(gt, MIRROR_FUSE3));
> > +				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
> >  	u32 select = __ffs(mask);
> >  
> >  	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> > @@ -494,8 +496,8 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
> >  		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
> >  			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
> >  
> > -		xe_mmio_write32(gt, MCFG_MCR_SELECTOR, steer_val);
> > -		xe_mmio_write32(gt, SF_MCR_SELECTOR, steer_val);
> > +		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR, steer_val);
> > +		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR, steer_val);
> 
> what's your threashold on the places that deserve
> struct xe_mmio *mmio = &gt->mmio; ?
> 
> 3+?
> 
> But no strong opinion on anything different. Just curiosity.

Yeah, if there were only 1/2 places to update in a function I accessed
the gt's mmio pointer directly, whereas if there were three or more I
made a dedicated local variable.


Matt

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >  		/*
> >  		 * For GAM registers, all reads should be directed to instance 1
> >  		 * (unicast reads against other instances are not allowed),
> > @@ -533,7 +535,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> >  			continue;
> >  
> >  		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> > -			if (xe_mmio_in_range(gt, &gt->steering[type].ranges[i], reg)) {
> > +			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
> >  				*group = gt->steering[type].group_target;
> >  				*instance = gt->steering[type].instance_target;
> >  				return true;
> > @@ -544,7 +546,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
> >  	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
> >  	if (implicit_ranges)
> >  		for (int i = 0; implicit_ranges[i].end > 0; i++)
> > -			if (xe_mmio_in_range(gt, &implicit_ranges[i], reg))
> > +			if (xe_mmio_in_range(&gt->mmio, &implicit_ranges[i], reg))
> >  				return false;
> >  
> >  	/*
> > @@ -579,7 +581,7 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
> >  	 * when a read to the relevant register returns 1.
> >  	 */
> >  	if (GRAPHICS_VERx100(xe) >= 1270)
> > -		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
> > +		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
> >  				     true);
> >  
> >  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> > @@ -589,7 +591,7 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
> >  {
> >  	/* Release hardware semaphore - this is done by writing 1 to the register */
> >  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
> > -		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
> > +		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
> >  
> >  	spin_unlock(&gt->mcr_lock);
> >  }
> > @@ -603,6 +605,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> >  				u8 rw_flag, int group, int instance, u32 value)
> >  {
> >  	const struct xe_reg reg = to_xe_reg(reg_mcr);
> > +	struct xe_mmio *mmio = &gt->mmio;
> >  	struct xe_reg steer_reg;
> >  	u32 steer_val, val = 0;
> >  
> > @@ -635,12 +638,12 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> >  	if (rw_flag == MCR_OP_READ)
> >  		steer_val |= MCR_MULTICAST;
> >  
> > -	xe_mmio_write32(gt, steer_reg, steer_val);
> > +	xe_mmio_write32(mmio, steer_reg, steer_val);
> >  
> >  	if (rw_flag == MCR_OP_READ)
> > -		val = xe_mmio_read32(gt, reg);
> > +		val = xe_mmio_read32(mmio, reg);
> >  	else
> > -		xe_mmio_write32(gt, reg, value);
> > +		xe_mmio_write32(mmio, reg, value);
> >  
> >  	/*
> >  	 * If we turned off the multicast bit (during a write) we're required
> > @@ -649,7 +652,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> >  	 * operation.
> >  	 */
> >  	if (rw_flag == MCR_OP_WRITE)
> > -		xe_mmio_write32(gt, steer_reg, MCR_MULTICAST);
> > +		xe_mmio_write32(mmio, steer_reg, MCR_MULTICAST);
> >  
> >  	return val;
> >  }
> > @@ -684,7 +687,7 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
> >  					   group, instance, 0);
> >  		mcr_unlock(gt);
> >  	} else {
> > -		val = xe_mmio_read32(gt, reg);
> > +		val = xe_mmio_read32(&gt->mmio, reg);
> >  	}
> >  
> >  	return val;
> > @@ -757,7 +760,7 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
> >  	 * to touch the steering register.
> >  	 */
> >  	mcr_lock(gt);
> > -	xe_mmio_write32(gt, reg, value);
> > +	xe_mmio_write32(&gt->mmio, reg, value);
> >  	mcr_unlock(gt);
> >  }
> >  
> > -- 
> > 2.45.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
