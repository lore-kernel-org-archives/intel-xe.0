Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB64ACCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 16:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D41310E440;
	Mon, 10 Nov 2025 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esI8RtRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94EC10E440
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762793754; x=1794329754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7P3ZklAag/hAe1pwE2zFqn+1D2FTRfRZWBbMr3CB+2Y=;
 b=esI8RtRsrxFsO7kkCC2Cbw+wx8/u88gbD6yM413jQOqTZ9t9lyqHWN4k
 jeZtzx9oCPD47SduMNQqC8YiIMGPhYfCexm9vSZZonoAxzQPALpBdpTnR
 VGJrvF5xAmBi5rGFV2qqG7kef8wuK2HET4PDcEugRkPIN9cU/CcXdVAvs
 oqR+GdiNsCJRCO/g8fA6BHcEdWZXozACCvXy18+6ge6jl9EJY1ve00s8m
 hGtO2HUELoXDcTXqGU1KnC2sHUzlS9rQxMlSuI/N9lF2hkePe4Xt2yOmW
 LhjeZ5CfVD47jdpzqw76s0+on+FO4CT261F8EVB9on2Aip4typ+g+NTD0 g==;
X-CSE-ConnectionGUID: duYE/NjgRRm1+vqWVE7rTg==
X-CSE-MsgGUID: eiTpUHOmQd2AcBXSV1kSAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75533278"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75533278"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:52:57 -0800
X-CSE-ConnectionGUID: fiTHLZn9QReSqPeCFpDcmQ==
X-CSE-MsgGUID: s7KSkG5iQZW1+654rfEw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219375304"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:52:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 08:52:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 08:52:56 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 08:52:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyYr5sCIlywjUYn3+JuweIa9P7T9oDit68acYWuCFuIle9/2fi9QRXPlsql7SXUHgZGiTGfFnP4l21PEwJ9D96SBi4nR7UwOZjs7r7SvR+sJk1pka+42PcHVAjJ36hOje7nLmmFUmKzA4UTt6Iq7/+NM2//vbcQDpCjT9SwhKuqnQy6lQkwPituIbgtyaJ8dXT0lb6zRFSNJ9zozPSaISZOrRBZmWM95OGRAK3cAwPvo/ASPygXfNZC8vkqoOK2JlohY2PCYNmueDwNHsqXz8lpFL3DomPOYHIJbsfLqSFhAZ1ruECVeARPsCBhKsFsQTkOLAvKvgT9YgSzWg8LCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBAO0VKjhwUBfmx4pbQhGXlMb5wuc0/O8zRDOW7C0v0=;
 b=QFBiHlTCAK8oz05HisXLo7M3udqA0o71oKAZ+MlFYdYapiaD3nogndOGa8J16QPZgq7wfNpZMReRGWIqmNeQqsMQh2uyZkGNegVnnvit1nQ4sZ1szDHOjuCUsDkyyL/qJhr2Pg253O1spG4eH6Qs8yv+klzOOP2SRpYOqNf9TFYh3ubTJ80QB1E3oRf1fseKBE1npgkaDj3uIahiSNcHTMVwaJqSfjx0zPzf8ujrNnx5qg5Z6wF8et6AdMzx4h6hC/Dc4Rv+L64T5svNl9YlU6v4yzJwU6xhOyaZdpqTTQtDfZlYsE08bKsebYlBETSRYM9wz7nZ/on3s9aEG5q0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:52:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 16:52:53 +0000
Date: Mon, 10 Nov 2025 08:52:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [FOR-CI 01/10] drm/i915/display: Make get_vblank_counter use
 intel_de_read_fw()
Message-ID: <20251110165251.GE4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251107193946.1075137-1-dev@lankhorst.se>
 <20251107193946.1075137-2-dev@lankhorst.se>
 <20251107204300.GJ3905809@mdroper-desk1.amr.corp.intel.com>
 <3cdfe321-0cf2-4992-9163-f227581ef1a6@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3cdfe321-0cf2-4992-9163-f227581ef1a6@lankhorst.se>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 699fc381-94bf-4aed-57d8-08de2079976e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DUC3LBXYNNIYFrwlrCqaCtY5n65O1vWBa3qOHSlAYe4HlHzodqmk99WT7BYb?=
 =?us-ascii?Q?c24RsDeBHz14BEdkKfFcRZkuScUK5r46kmnNcN+CG2k37Z7BEo/zCm1RzbTy?=
 =?us-ascii?Q?Y2mEBKMROb6SAT+kSlrURGzKyjz++4iHUwNNiXBK5c2Qg5d4Uisb87g8T2K/?=
 =?us-ascii?Q?eendQy6iBYCvNFyW33GifdUMAf3BA+ZrX3NfrxXzeQXiicJnNBpbBzlv2Gei?=
 =?us-ascii?Q?kcXAeuvTZ4K3LG5xOyHvCfr3JlFEKPLH38JcXn0FIuyCnBGh4pGfb+0GRN6l?=
 =?us-ascii?Q?+RicLKB8djyNm8XLymtCbDrGM99olB1fZ21hXG8W3Kqyw4dN37vJWLbHPp2J?=
 =?us-ascii?Q?PsB9DkujgH2NyjfsPeYHGUrajBQyxU3T4SzzA7/UFzBuePRHVsIYOGH3yDSv?=
 =?us-ascii?Q?N6xrvWYIERzOV116YAeSaOx0i+va2XYugtyI8YdTch+kieUR71oQCDMx2Sgs?=
 =?us-ascii?Q?2tW8ZqTt6lOr5aJ9JG66EznV+pbk51axQ1NhpB0uQPWdrT5Hm4JhZANwpC2V?=
 =?us-ascii?Q?KhWHXadWaBwqHRErADrynCeVyaNs7o6EUuvDsJaMtoZPY0cWLu07YFQ88Xew?=
 =?us-ascii?Q?SRyjm0tAYgJnpXddcvbSuCEFRwVacwUFGu4rIfTUaGJEz+Aa8aTGV1vx1W1v?=
 =?us-ascii?Q?Dyxz9FI9zQlqnKkTw5qRCITceGKplcjEX4ZwrAJEwNPl5eLmhAHUxFoGcrqA?=
 =?us-ascii?Q?xLt7crQ8t+fxcGtW0XYXeUF85P0/ZO3ObKmAeeuyHnkDu/6r6xYVkeXrenzn?=
 =?us-ascii?Q?ZA9epYe4mjnsBbSO81vBdZOIz3k46x39LCAaBzZD4mqD38BuYcGlZXsGUy+q?=
 =?us-ascii?Q?gU5Al+qncToqjMA3a7nV6+Bn7yZrij4j6DS2m2sthgUHWZ4qyvtiUB/Zci2H?=
 =?us-ascii?Q?JmHnrORGVxFxVlr415PDH1E6/R0mjpcA62tMyxOsKbzywj53lDOnNTdU+0Ax?=
 =?us-ascii?Q?sjgI7XwPIUADtAUIn3vMycBhlZ4tyC0lsRy1LzyLWShf74jL6yIaPnga1GNn?=
 =?us-ascii?Q?vJuM4SGouzd41EhlBipkdkKz2ihOeA//+PhZhYARmYqVE8PoZlvJnzZhlaes?=
 =?us-ascii?Q?soR16MxObEFO3AVFiPpeZCe0wPE7GDsZWNZBHkKVAFltiVDWe/iYEQuMMh60?=
 =?us-ascii?Q?aw4s0Iez2LVyTHCu+vijeupVL63UYTMXCDoX0bivr5UVf2a4UXOuBurariwl?=
 =?us-ascii?Q?WIJMBTzrLIWZ8Pd0I6w+vObsUHzdH71QcEn7TBLBPNVICY0vxEFKsIab5UZJ?=
 =?us-ascii?Q?L5ctanxue5HIdOewHIWpc33X5Zblcm6O7jlUIfraAkM10TcuaoaoYypsGsPa?=
 =?us-ascii?Q?+h/CdgcgKS9vNmt7xQzFGYciIjOdsoVGlLCJpA96yfhA6mLJW6F8kHxv/7hq?=
 =?us-ascii?Q?CofnaXRWlPFx43qxFzxZb2bDTe50FwNXBak91zFtMffW+q2GcNlpmDfMs2qe?=
 =?us-ascii?Q?TTMFstTRnGPM/YjuB+nZhOLdxbMYGBDS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JHdaMmxszFTW2cg8UD9wt/qswwquxWSicHao2iIjdk6bxVhyJ3l7JHjXXaeB?=
 =?us-ascii?Q?Q8E3MdnAWAHr2oUfsT5kKd9OMKnjbD26UoljmC75xhlk7zLdyJsj8mXLU7FL?=
 =?us-ascii?Q?R13+jPxKe1H23Jy3niS7XmKCbpFe9Cx36lJN9aGb49ZOguHtqCdkxPt/0NoP?=
 =?us-ascii?Q?VRQTT3jvidkoOnHVzLBr6WGgVp5uf266k4IG7bbWx1SX1KbKMoIZMTqU7seC?=
 =?us-ascii?Q?MH5/5e9D6fKz2wqQhj2kDO+cXVI6OzLoDOyKC8K8E88allirvbViQQvZG5CI?=
 =?us-ascii?Q?Ua2nlZXjOxD0x+D0AiY2sJPJXsdAvj2CHS0sHYUZLSqMHj/0y54ZMKydSRc4?=
 =?us-ascii?Q?Y69ZnSNLq7Rgj3mo23G19EsZlYi6twlG4GDP8NYTDXVbiq1psL82Iklg+Ivu?=
 =?us-ascii?Q?jPlsnqk3teuRk5WjU1+nJ41VhFfsDfzfdTjEDnl9Iv6S6FkJ9tV6JskUdJfX?=
 =?us-ascii?Q?YGPe9n+ZRwAXpMl7NdM4FHYbKZvEwpx1B4gw0wFo64Dfifha3r9NsLtbp+4E?=
 =?us-ascii?Q?FQ+eQ7IOaQyNLH2qkCD7e5bPLb2enrkmsIwCTMXTVZ3Jkxpe5690Bbv+/6KA?=
 =?us-ascii?Q?c/sV18fcVBHgN9O2YytgG8UFh7cEvNQNPcKIPgapSRzGo4bY6qsr9f5t9aVk?=
 =?us-ascii?Q?ZFT96u//MVDKRctnxJ5W7ZDZ00g7Hbje52Yp/DQ/hnfdp1VG5mBgYstTZxuH?=
 =?us-ascii?Q?hKP4apcC70EzcXKBcsCHS2fnLeU3OUpCOLdSWXUnpsiuibFZgTsbAhLi9dRh?=
 =?us-ascii?Q?SZ1/oRRBXoS6FVld8CaYxpnP65YmyFM8kgqPldyRgrm9r6/Fzyu0WB/HoIv3?=
 =?us-ascii?Q?6/ukno5Imf6wO8sljq3x9zmeNlIaMwlJmr+NGTdzDGQFG+BtxWMuKbEnCZYf?=
 =?us-ascii?Q?w3F8nEUy8/aR3r4MXTj1Ok5Btyv/8b56TTbKA1uLzvcoWLrsVfkVTpfimYB6?=
 =?us-ascii?Q?L/PIL+xhY0WkpLZkY/2Gr5yRXdy6FNr6FB5p1BULzYUnlVNrqj6BYVtq2VPU?=
 =?us-ascii?Q?4r4HqU6fTluELsuMdpQsWCDE/1C65Vi5/MZicXOOjpTnrs7VlfJVtu1FCz3t?=
 =?us-ascii?Q?3V/nePCv338WOE2Qw4VlJY3vqxnDi6vDInFh5eN11hRlS8B4ZVLTHnkVowat?=
 =?us-ascii?Q?ZSOTGGGIhLg5FfVSyTtFO9b/3EVKCLeWB2zph99wArs6pW7Q0OH6lW1Wu4Zt?=
 =?us-ascii?Q?D3fYgNNhOYKI4S36M9LTBN54+/QXtzNsD27RWevNIJ36XJ2pk/fQR0NLTFQo?=
 =?us-ascii?Q?T2fVxEDH1Us5IlL9eddug1Y6FjscxDIP6UFg37A/BiJ9RBgYdxbPMrbN5JmF?=
 =?us-ascii?Q?+d7x9Ev5ShuBs1NSIITWzFHDpppJTQ8pzSiEjyd2y7tmfodPa0NekHVVosi1?=
 =?us-ascii?Q?+cJBhGTihvSLBoOm8bISxt3tnaTWpRfPSWM7mgNKf1JoIPEfQ/CjfMFfjtRu?=
 =?us-ascii?Q?sZVEs4mlkD60kx0/cnWsWvGQFY1vDa7Ct6cKSd1rHptT6EJ6aG3F+nJJS3lS?=
 =?us-ascii?Q?bdqYCYb7Q1Qfm8kcOEwVbWBSEozirASWxRCzHjul1o3sdM4ejRdCE9YSglYO?=
 =?us-ascii?Q?6GmUKd0w+otao95pZdRqh2RZTU7EwOscbZfs/ONRGipZ89ZA1pFlewVBZGj+?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 699fc381-94bf-4aed-57d8-08de2079976e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:52:53.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YilLCtFpnZb1CycA7wrvZJddAf1QECg9wcwMBBt0e45FiLf3QaJ+qFs8YulGePb+IApibgSb4TP7YkfYN9smR6VzQk9sy51XiuIj8VgDsCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Sat, Nov 08, 2025 at 08:40:17AM +0100, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-11-07 kl. 21:43, skrev Matt Roper:
> > On Fri, Nov 07, 2025 at 08:39:36PM +0100, Maarten Lankhorst wrote:
> >> Fixes the following lockdep splat on PREEMPT_RT:
> >> <3> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> >> <3> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1373, name: xe_module_load
> >> <3> preempt_count: 1, expected: 0
> >> <3> RCU nest depth: 0, expected: 0
> >> <4> 11 locks held by xe_module_load/1373:
> >> <4>  #0: ffff888107b691a0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x104/0x220
> >> <4>  #1: ffff88813cd30280 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x32/0xe0
> >> <4>  #2: ffffffff837f88f8 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x1b/0x50
> >> <4>  #3: ffffffff835985e0 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x6f/0x90
> >> <4>  #4: ffff88812589e6a0 (&helper->lock){+.+.}-{3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x7b/0x110
> >> <4>  #5: ffff88813cd30158 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x20/0x50
> >> <4>  #6: ffff88812589e488 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x2a/0x1b0
> >> <4>  #7: ffffc9000031eef0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
> >> <4>  #8: ffffc9000031ef18 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_atomic+0x4c/0x2b0
> >> <4>  #9: ffff888114f7b8b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at: intel_psr_lock+0xc5/0xf0 [xe]
> >> <4>  #10: ffff88812a0cbbc0 (&wl->lock){+.+.}-{2:2}, at: intel_dmc_wl_get+0x3c/0x140 [xe]
> >>
> >> This splat will happen otherwise on all tracepoints too, for similar reasons.
> > 
> > Drive-by comment, but this isn't really a proper fix, right?  Using the
> > *_fw register access variants means that (among other things) the call
> > doesn't acquire uncore->lock.  On some older i915 platforms,
> > simultaneous register access from two different threads would hang the
> > system.  The uncore spinlock ensures that register accesses are always
> > serialized so that we can't trigger those crashes (the uncore spinlock
> > also protects other stuff like forcewake handling, but that's not
> > relevant here).  If we use the "_fw" variant of register access, we're
> > removing the protection and allowing register accesses to race again if
> > we aren't already holding the lock explicitly at a higher level of the
> > code.  I'm not sure exactly which platform(s) had the problems with
> > simultaneous register access; it isn't a concern for newer platforms so
> > Xe doesn't need to worry about it, only i915.
> > 
> > PREEMPT_RT creates a huge mess because it silently changes spinlock_t
> > from a real spinlock into a into a sleeping mutex, and that means it
> > can't be used anywhere that sleeping is disallowed.  Since regular
> > register reads/writes require spinlock protection in i915, that also
> > means that we suddenly can't perform regular register reads/writes in
> > those areas either.
> > 
> > I guess a real fix would be to convert uncore->lock into a
> > raw_spinlock_t which is still a "real" spinlock, even with PREEMPT.
> I think you misunderstand the fix.
> 
> Vblank evasion flow:
>  - spin_lock(uncore->lock);

As long as you're grabbing uncore lack explicitly at an outer layer
before doing the register reads, then yeah, using the _fw() variant is
fine.  That might be all that's needed for the vblank evasion case.  But
I believe we still have problems with PREEMPT_RT + uncore lock in
general because there are other places where we currently do register
reads in non-sleeping contexts.  For example, there were some patches on
the list recently from Ravi trying to resolve the issue where the PMU
subsystem grabs some raw_spinlock_t of its own, then calls into a driver
callback that was trying to grab a traditional spinlock_t.  It leads to
the same kind of splat you pasted above because we're now doing a
potentially-sleeping lock within a non-sleeping context.


Matt

>  - local_irq_disable();
>  - while (in_vblank()) {
> 	local_irq_enable();
> 	spin_unlock();
> 
> 	/* Wait for vblank completion */
> 
> 	spin_lock();
> 	irq_disable();
>  - }
> 
>  - /* vblank evasion programming */
> 
>  - local_irq_enable();
>  - spin_unlock(uncore->lock);
> 
> The other timing sensitive call:
> 
> i915_get_crtc_scanoutpos()
>   - intel_vblank_section_enter()
>       spin_lock(uncore->lock);
>   - preempt_disable();
> 
>   (do magic stuff)
> 
>   - preempt_enable();
>   - intel_vblank_section_enter()
>       spin_unlock(uncore->lock);
> 
> 
> Using raw_spin_lock would just mean adding more contention. And still deadlock when using the _fw calls..
> 
> > 
> > 
> > Matt
> > 
> >>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_vblank.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> >> index 671f357c65638..2b106ffa3f5f5 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> >> @@ -133,7 +133,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
> >>  	if (!vblank->max_vblank_count)
> >>  		return 0;
> >>  
> >> -	return intel_de_read(display, PIPE_FRMCOUNT_G4X(display, pipe));
> >> +	return intel_de_read_fw(display, PIPE_FRMCOUNT_G4X(display, pipe));
> >>  }
> >>  
> >>  static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
> >> -- 
> >> 2.51.0
> >>
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
