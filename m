Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F52CFD2EB
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 19:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482A10E0AB;
	Sat, 22 Nov 2025 19:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoSGIaVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603A810E0AB
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 19:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763840569; x=1795376569;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GIYEMT6G2mqU5ClEsqRWBO4htbPpSTAIfCFi4jvZbEo=;
 b=LoSGIaVtW0xRfSbKdMQ5m0jXVxMGFFAPFTXiZWX3FqYP3BwPTE5ZvPaq
 4kIsDicMixNoa+tAlWyxv1geb4kW+L7ycdpoDnoi5XWpWAZe1TQZpLz81
 A6Ma9BriOetPfGlQrcQe6zHGKSp3keybMP83qgbKxLOXVLdnItP0AgzJ7
 4b4B7ujhbygNXxw4g/E37L5beZ47ZivlFvN7ZMxH3iOWGSzd2GjPFm0Bt
 N27Ld+ato4Y4z12xQ0gINC/DmIvWCBTy+osAFUKi052c+pTU1HzQTOvyl
 DfMYyraoDOdXWnA8YMIJSSvBLl+MPOI3DrTvQVqGmzwIu5eTaU1DM9WN4 g==;
X-CSE-ConnectionGUID: jf7auS1GQOWW2CHBbFfOZQ==
X-CSE-MsgGUID: WfaZIj3PTAacdOlVZyvEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="91383641"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="91383641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:42:47 -0800
X-CSE-ConnectionGUID: A+EdKLOHTWuKq+qczDvqfQ==
X-CSE-MsgGUID: h2yCSvtjQ6ODRHmn1Vk82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="196442075"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 11:42:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:42:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 11:42:46 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 11:42:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fljv2nnoxF5IoEZjTiPOWNQHUwhYTXcvnMm4xM9cccR5VQMUNXWmGUDTdKhMCQ5BU1YuMBPEPGceagMj7+w98jsBF7F3ZGY9ildrMiHuKOmLsBNOT3Yi611aLXdErGYmYpHPdM5h+OqWkE94kwj7GuTQ8YXSRXYJ0z5lxHs1ROPOdZLgHKYqEzr2MdXCDvVmYzt0Ce3BO1I0uMHOGOxyZmi4bG2NIjkTeGcomccfxdXCJBnoA4B+S+71SVeGgfHFEbhGDj9EExCGHDlgB4NKCIA+TwbbYiI8MPTQkibvrfOYG9VIAhoUCU2xW+dJHbF1Qe1P/Vsx8EYS2naZeNFrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNnXZicJddc3pDwc+GQhdtGF2uxwU+CvexuSFYn1sqM=;
 b=pQ0R0cLbzVoa785HY8ACkvs2UTx5uppkwS9i/PK+ZWMR6DnUU0C8stMFVHHy8ig7rIwuIJfunFjjblxo0ICyYvFGmIqc2xtkatYiLJEygMtJ/II8InRT+Mp0q8GMdxDD6gvBiaVRTW/8BP657BT7yqidlsUOf4UoZ5ozZPLP73b+ui5UvsuiQ2grE5RzU8lV89aRwAc3pcCh/J3Asu6bZyawcc4hXRGgDYKdWYK91tfjxQXiWb9G0U4vrcgmAuH8QLMoUq1QSmw4OyhehYV50t78swQR+0UkOtF1s+iq2Dqphb3dYjF1ABDTf1128a46zmbpdpmgvk1ryeuUxT19wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 19:42:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 19:42:44 +0000
Date: Sat, 22 Nov 2025 11:42:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH 07/11] drm/xe: Suballocate BO for page reclaim
Message-ID: <aSISMU58l2MPAFcd@lstrano-desk.jf.intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-8-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118090552.246243-8-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: df860a99-8845-45e7-f16d-08de29ff4e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5prAv0B0QB57dJ1g+8tfmC+1rNNNab6kk9HUfV2+Wc68SfbyO0DIk+/L2kV8?=
 =?us-ascii?Q?2tpsCIyW4fWeKc46CT0Y9OcM22CBA3QwyeJnjq0BpiRqCTRgUbEuoDtRZN51?=
 =?us-ascii?Q?v2QTLo6cUaniCwTetxCYjNqF7CDC/9y5YmY+70qV+a1mhNQ39rd3SYA1vp1F?=
 =?us-ascii?Q?qvUvQQ/1HgwmOTkJ8QJC09FMVc2ptsNqBJtwzzQrqdQHP5RNCaJUnKe7on7K?=
 =?us-ascii?Q?WLZzupx6QT8SX/aQ7IhkCNChC90u6MT6hmCabrawPeIKEoruFoW9wr6ZX0ps?=
 =?us-ascii?Q?BUeqBK+8UEkPjqErQRPRUyCNQ811CIW4oRlPqhc48NIm8wndTEU0B14x5fdl?=
 =?us-ascii?Q?DLwHTxTpGrbN8jELZJeJi/hptNqjZhjoUUZ71ipO3jALToTPG1aicayUc7Gs?=
 =?us-ascii?Q?L+8rNwS7Zu7qz3qgRXAU/e8HUS/plG9KxEWTn+JVgyAhh/vZSBoMDhMuRYpg?=
 =?us-ascii?Q?XLTVkKd/HEgyr64ivzqOf4htFXWn+PzDmFvpWgqyoQa/W32QbYmZ3wdLwL//?=
 =?us-ascii?Q?IotHGAB6q+PKOWimwYCDZB76RLkfPy3ZoVY2SCXYD92/yK9Tm/nTpXT2WGaM?=
 =?us-ascii?Q?GiypQzf2aRFPlPDg/Hgx0OFPyTVhj3FEMi+OdARUyEGwlx6A1sMeE8Wng/P8?=
 =?us-ascii?Q?FcxQ91pVejAc2n46LwSHhp/xt4yJbzqS25vh/M9Iw3eBw3VVlZDB6C/gf4eT?=
 =?us-ascii?Q?hI4SHpNqLy7YBi5QUPjxWDP3n1+jaPBRzxjbZiqSMKU3UShWromuKMlntBYJ?=
 =?us-ascii?Q?Pj/QPLOjRv4nA3/1ykKPHxzHGL1gih2jy4Opp0pUdiLqysPtQNzcfqrmS3qi?=
 =?us-ascii?Q?CSyevwR/mKjK/PmGrdZ1uoufZ3RTcuU9vRWMc9C4jTgZ2gNCX8H1uEBV9VsQ?=
 =?us-ascii?Q?TjvWqgKblHAOeITUIRBl08NwOIqgjpnouZv+Qo+rI58Cp7mi0LzaXjX+SVcB?=
 =?us-ascii?Q?TwWcaXJNID32Ci7+zYfh+4FtqveJ4cKmESgay/HNeiNe77GbZAXAxm07iM+b?=
 =?us-ascii?Q?wZSWNR05+tWMx4Oie+Xj6jx933lWzrM4ULKKuIsrbWPWh9A13XkZvPTM4nz1?=
 =?us-ascii?Q?trCpTdMbXyiv4H103MnGIr0+ZJPOzdvJS2g4O97sR4qI1WPN7QgOycc5PeqR?=
 =?us-ascii?Q?SV48Ff1XSjjSSoqAwxXXEu3zbKedqe3ghj/V5AMhFM7TXHF1GkTBtdbYPDMu?=
 =?us-ascii?Q?fyEInsTJaI7mqmjx+aqZ59geuM7j+2USTT5CYsK9LMa3VjPy3C4oHSYJ00FH?=
 =?us-ascii?Q?JsbqZM5SB/J/PoN+tC/r52WeSRzQLVojA6tBoB9I2q8LLvh10FrsJChOc+yX?=
 =?us-ascii?Q?pJg2T6j38BBfacdaRQTUEvxZqDBBFIX/0groVS8BDMOuJZysjDqBgGmBndLY?=
 =?us-ascii?Q?GtkYWjMcBoILYMq7XW9KPqcJOzDahiZev7F2ZUHsJvN+jGg6Eg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0SvJCtbT4ilLr6XNnovQx240x9MjNCODS0NZynskvJTevbuAjZfG6fK76xC6?=
 =?us-ascii?Q?3JSdJbDh8QUkuAYlqOwoGaPzVCEsDiH0/FYll5KCur5ZdSlyTr41lst4qhpi?=
 =?us-ascii?Q?O0uHiNPUUEmg9sMlIXcPky0haKuSr6Gn8YWsUaYmCsRsnAhq+076O6U3V2AL?=
 =?us-ascii?Q?YMuMXQiRszubLe6JwHujkIw/9tZDom4BTo756lD/pMdw6GqsogddHDq3cFR3?=
 =?us-ascii?Q?yxwkd8K+n0Kg4eOM17brAPj9Z5SXBFQsTJNe/DBYEwTIJ7VSuSId0Ma46N0B?=
 =?us-ascii?Q?Lsg1Rb5yD9wjfuSTgmilQWfiXtxlpMJqmagtXDBNCpeB1QuNf6yA3RSKglDg?=
 =?us-ascii?Q?ymSD9e8Rx1GQQRguqbf7OH/GswnvyhSQKx/CwQVcWCGvz4ZQPISj5WK/j5RV?=
 =?us-ascii?Q?KUVZD6veBJuyclgIL5onhET2YnsDFFA56Orzjg3Rbmv9uiWX/6G13cixclsO?=
 =?us-ascii?Q?/JpbBRZ06VWn60ZsjnOODWYpb3v8BjJLYtYCAfMIu9AjOo62MJc0eSuaACSq?=
 =?us-ascii?Q?cIXWoYbKyHMeCFsCcYh4A/ySO2Ivw8DA8nJKz2/6LfjUrCimcD3wfwjZdvAX?=
 =?us-ascii?Q?QMXm6T1lLXqrN22bOon9JkfYUUZj8k0nC6m8GKesqabgwPPFqWr7hkurDtEP?=
 =?us-ascii?Q?eh0BMjLPJXmh4dO6+2KH+CtAaXbBb/dHKMOBI4I5CSKomL5HdVAjIwDB/FfO?=
 =?us-ascii?Q?GRXfZiiFWsy7quR37VAPzt4E4XMnclTz3bh3gaUz4dLZ+GlqAe3ZDzFB7dNY?=
 =?us-ascii?Q?yHdJ4x7nQd7TYN7f7G1TvFrQa5xZy4mAc768aV0n3D1q4DmSfsxEocPO3m9X?=
 =?us-ascii?Q?J9dJujxO03BganCMb0jqQCF2aRwGA3uEG1KscYqOcjoC+uzyo4lJO6QrFvCV?=
 =?us-ascii?Q?JKqTMYw+bNcB7r1JiUQ7Y1wfl0RSgminohhc6fl3rUr0/IBHOGlqZD34g0uM?=
 =?us-ascii?Q?zoWZPTI5lDcn+zhhziSkZv3tcGbTlcSknm4R6B2ZQAzFfGDC/4flV1OrlOra?=
 =?us-ascii?Q?msVbZgwu6ZVTWZmeo7VGOi7d7w1j9nT0u0oMIWWhDAOP1gKINYkJgAgUrsHu?=
 =?us-ascii?Q?iiPvtE+6DwB8NsMJb2OW/AJPk5oD84avzFouXR37e3r6Uh8R9iEUIxLgA2Le?=
 =?us-ascii?Q?OoAecF+48TZ6HxanqGn4/cikelfEimu5z7bhlW2rzCQmLIBi7VcMUGzBg7sT?=
 =?us-ascii?Q?6g2KzjzqqLggG1FiIYehYwpmHOroPAA7pfFkhod5o6XBZhrQvro8fjh7Qq34?=
 =?us-ascii?Q?OcvkVYksOChxTipAxTapUak+nu3uRq5YuHYoBJY6EB2kkPXZg1wezrEIVIpw?=
 =?us-ascii?Q?HmRoFuKJMTb6wZzyvdWUWmJ/rNDL2R+y5/3wH9VttrpIT3F4P/OSp2yP8fHk?=
 =?us-ascii?Q?f0H3QWDpYPiT+p8ECfNTE0mLC73vj7kQRWLpMMCBAZUVl5/PXxVEc7KN/ivj?=
 =?us-ascii?Q?4qt5x/yDLmEky2TpPf3/+NbX6M6pec5HRaXps8pgDX5YHm3jlvyynHXzwhlm?=
 =?us-ascii?Q?9kRBQa6/PLBWvZr+LeyMqzxdbC3LStx21nEPEe0zuOTybVr6Hf/jqtuHOgXo?=
 =?us-ascii?Q?dUP5Z53E+u7eiBOs+Cy2OtLz0Yc3q52S2eaC8NpagEFzQ/EoE4p7y1z8ircQ?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df860a99-8845-45e7-f16d-08de29ff4e66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 19:42:44.3426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/Lni1ty87XsdLfNSXB7Mu+vbmpV+fy/faxH1eVJqBQuA7fFP9N7rhg7356Kx6WuzL7xOYcIvYkdDIYGcw7mbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
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

On Tue, Nov 18, 2025 at 05:05:48PM +0800, Brian Nguyen wrote:
> Page reclamation feature needs the PRL to be suballocated into a
> GGTT-mapped BO. On allocation failure, fallback to default tlb
> invalidation with full PPC flush.
> 
> PRL's BO allocation is managed in separate pool to ensure 4K alignment
> for proper GGTT address.
> 
> With BO, pass into TLB invalidation backend and modify fence to
> accomadate accordingly.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h    |  7 ++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.c    | 33 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h    |  4 +++
>  drivers/gpu/drm/xe/xe_tile.c            |  5 ++++
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 18 ++++++++++++--
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++
>  6 files changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 268c8e28601a..057df3f9dc1d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -184,6 +184,13 @@ struct xe_tile {
>  		 * Media GT shares a pool with its primary GT.
>  		 */
>  		struct xe_sa_manager *kernel_bb_pool;
> +
> +		/**
> +		 * @mem.reclaim_pool: Pool for PRLs allocated.
> +		 *
> +		 * Only main GT has page reclaim list allocations.
> +		 */
> +		struct xe_sa_manager *reclaim_pool;
>  	} mem;
>  
>  	/** @sriov: tile level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index a0d15efff58c..801a7f1731c0 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -13,6 +13,39 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_macros.h"
> +#include "xe_sa.h"
> +#include "xe_tlb_inval_types.h"
> +
> +/**
> + * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
> + * @tlb_inval: TLB invalidation frontend associated with the request
> + * @fence: Fence carrying the PRL metadata
> + *
> + * Suballocates a 4K BO out of the tile reclaim pool, copies the PRL CPU
> + * copy into the BO and queues the buffer for release when @fence signals.
> + *
> + * Return: 0 on success or -ENOMEM if the suballocation fails.
> + */
> +int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval, struct xe_tlb_inval_fence *fence)

As discussed here [1] let's try to avoid storing anything in related to
PRL in "struct xe_tlb_inval_fence". So I think reclaim_entries + number
entries should be argumen to this function and return "struct
drm_subaloc*) or ERR_PTR here.

[1] https://patchwork.freedesktop.org/patch/689042/?series=157698&rev=1#comment_1267062

> +{
> +	struct xe_gt *gt = container_of(tlb_inval, struct xe_gt, tlb_inval);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	/* Maximum size of PRL is 1 4K-page */
> +	fence->prl_sa = __xe_sa_bo_new(tile->mem.reclaim_pool,
> +				       XE_PAGE_RECLAIM_LIST_MAX_SIZE, GFP_ATOMIC);

Any reason we can't pass in the number of entries for better
suballocation? Or does PRL in GuC interface need to be page aligned?

> +	if (IS_ERR(fence->prl_sa))
> +		return -ENOMEM;
> +
> +	memcpy(xe_sa_bo_cpu_addr(fence->prl_sa), fence->reclaim_entries,
> +	       XE_PAGE_RECLAIM_LIST_MAX_SIZE);

If we had the number of entries we could save a few instructions on the
memory copy too.

> +	xe_sa_bo_flush_write(fence->prl_sa);
> +
> +	/* Queue up sa_bo_free on fence signal */
> +	xe_sa_bo_free(fence->prl_sa, &fence->base);
> +
> +	return 0;
> +}
>  
>  /**
>   * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> index d066d7d97f79..f82b4d0865e0 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -15,6 +15,9 @@
>  #define XE_PAGE_RECLAIM_MAX_ENTRIES	512
>  #define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
>  
> +struct xe_tlb_inval;
> +struct xe_tlb_inval_fence;
> +
>  struct xe_guc_page_reclaim_entry {
>  	u32 valid:1;
>  	u32 reclamation_size:6;
> @@ -32,6 +35,7 @@ struct xe_page_reclaim_list {
>  #define XE_PAGE_RECLAIM_INVALID_LIST	-1
>  };
>  
> +int xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval, struct xe_tlb_inval_fence *fence);
>  void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
>  int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
>  static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 4f4f9a5c43af..63c060c2ea5c 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -209,6 +209,11 @@ int xe_tile_init(struct xe_tile *tile)
>  	if (IS_ERR(tile->mem.kernel_bb_pool))
>  		return PTR_ERR(tile->mem.kernel_bb_pool);
>  
> +	/* Optimistically anticipate at most 256 TLB fences with PRL */
> +	tile->mem.reclaim_pool = xe_sa_bo_manager_init(tile, SZ_1M, XE_PAGE_RECLAIM_LIST_MAX_SIZE);
> +	if (IS_ERR(tile->mem.reclaim_pool))
> +		return PTR_ERR(tile->mem.reclaim_pool);
> +
>  	return 0;
>  }
>  void xe_tile_migrate_wait(struct xe_tile *tile)
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index de275759743c..67a047521165 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_mmio.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pm.h"
>  #include "xe_tlb_inval.h"
>  #include "xe_trace.h"
> @@ -326,8 +327,19 @@ int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
>  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
>  		       u32 asid, bool flush_cache)
>  {
> -	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> -				  start, end, asid, flush_cache);
> +	int err;
> +
> +	if (fence->reclaim_entries) {
> +		err = xe_page_reclaim_create_prl_bo(tlb_inval, fence);
> +		if (err) {
> +			flush_cache = true;
> +			fence->prl_sa = NULL;
> +		}
> +	}

Should we do the above step in run_job of the TLB invalidation job? I
think that might be cleaner wrt to layering and make it clear only TLB
invalidation jobs can use PRL. I don't see an easy way to implement
non-job based TLB invalidations with a PRL as those are typically in the
path of reclaim (no memory allocations).

> +	err = xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> +				 start, end, asid, flush_cache);
> +
> +	return err;
>  }
>  
>  /**
> @@ -461,4 +473,6 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
>  		dma_fence_get(&fence->base);
>  	fence->tlb_inval = tlb_inval;
>  	fence->flush_cache = true;
> +	fence->reclaim_entries = NULL;
> +	fence->prl_sa = NULL;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index c3c3943fb07e..7cf741e6a0c7 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/dma-fence.h>
>  
> +struct xe_guc_page_reclaim_entry;
>  struct xe_tlb_inval;
>  
>  /** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */
> @@ -129,6 +130,10 @@ struct xe_tlb_inval_fence {
>  	ktime_t inval_time;
>  	/** @flush_cache: bool for PPC flush, default is true */
>  	bool flush_cache;
> +	/** @reclaim_entries: list of pages to reclaim */
> +	struct xe_guc_page_reclaim_entry *reclaim_entries;
> +	/** @prl_sa: BO allocation for page reclaim list */
> +	struct drm_suballoc *prl_sa;

Again, let's try to hard move all of these things out the fence (store
them in the job if needed).

Matt

>  };
>  
>  #endif
> -- 
> 2.51.2
> 
