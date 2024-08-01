Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB7C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 21:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B9C10E0CB;
	Thu,  1 Aug 2024 21:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISSfvvOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2397510E0CB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722548222; x=1754084222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=leSpq5bKQS/nnmYH5+lLW2lMrzsWoQSEojRfXUneLiA=;
 b=ISSfvvOYEV1kNa322fDeuP4nCVqxMcw0pHqEsorOgK7EpXgryn6/0ZrG
 1ao5i8lPjTQAlJfjou8KCzs3OYYolA3fDLP5MV3ZOOavlmsRinpOhuuSy
 8yj8GgV0DXu44u4Y2Cvpw3aJ/LM6YdUAK/kaELY2HVqTSbDfXiq2PXhmL
 iBYoEokFmx4F+cxBB23CaC9L6MsTB/jyxNwIPGKyldE/it/3UgrBJtSyL
 fBM7PTD7315W6IXPm9B86ql/P7kvJnMDCuqPeLb1dQNJzbx8HV93NsT5C
 LLCScUwgxkiGiYJXxQRF6lirE5zgRFwoN8p5LWMN7+unwjxgnzk1QxW43 Q==;
X-CSE-ConnectionGUID: 65w7NKkhQMKE9exoeWth4A==
X-CSE-MsgGUID: t7oGQOAvTPq5ezhGWHgw5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20655450"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20655450"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 14:37:00 -0700
X-CSE-ConnectionGUID: 3MufdaKHTSaiG8fSdnVP7A==
X-CSE-MsgGUID: PitTQkPTQrWDwB+2xAzZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="92724609"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 14:37:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 14:36:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 14:36:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 14:36:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 14:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTr/ZfEP63NEWNalTP+lhqKh31C3414WlKjajvPBE2e9ehRdJFgKC0l9/PQKTzII9SgSprfD7oe4AwhQ9ZkY2UrK94KbRVp9xCzQpXN8MUEcFWooD6kw3ZAub1L8UdeVCvgLvVtmOJgURWUSg6TSeIDahLkQ8DsVqN+J5xr/hCoGGl003acHJvbrhsiO3MsJYrJec0YtZyr9O1eI901FnFiGY0WQhreGvWWbF/XomtKlAo6Y+uS66AVWkBtCc28PoDqkN3XcXc083F0LW+Zvlu74JbklvUW84TAPjSPNLtnxzCA9Z0MoYTXZCo3boP4U9vgETKRSQZrf8AXZF7F+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KOQSXMXGnyQj7VPvFBCHp24rfhhnCAWIzCSHSmXR+A=;
 b=RriiZl1E0j8a1qsh7hSuXWWMwXq9QeZjkcWtpFO2eSKTaSNzbSVaSbryyC8h0/VxT2zafrStwmlrrvdpHCkZakqBytkJ39EUegSftt/Ovie9HIyMMcjAkuh2+SC+qM4X1mVwppKOCE4nL8wqtTpzKRzVrbcnB3nYxqXmmnbLhF7u7enMI/CCshIHXqx+bO7g6dxB1Np8q50z6gH9QeQdG73iEe4/iRAX2Zi0O0gC6URdLLEKe0uUlUVSfI/IoRVstcRZSyb0CPOME7ym6E2qYNsR9YZ0R1n08X1aBhLWISdmnXTgXhd1nbSumVl7dtS3I/qhwOBlG4B8Lze9Kbm1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.32; Thu, 1 Aug
 2024 21:36:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 21:36:03 +0000
Date: Thu, 1 Aug 2024 14:36:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/xe2: Introduce performance changes
Message-ID: <20240801213600.GJ2685051@mdroper-desk1.amr.corp.intel.com>
References: <cover.1722591343.git.akshata.jahagirdar@intel.com>
 <3e8ff481eeba3f9b20bd542fa8d304e5736bb704.1722591343.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e8ff481eeba3f9b20bd542fa8d304e5736bb704.1722591343.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a81111-e12f-495e-1390-08dcb271f1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tXcj7gOkDCeXL4xCjZzkrHnoKBV0vW/8E1p19u2APJ0MMwfdvuvutiSudc+l?=
 =?us-ascii?Q?e28OCN6kz9iCgDEBhyoDUF6VZjhF/oZthoFCEMETwpO7L6baS/L5J3j2G16j?=
 =?us-ascii?Q?PN3MpIf6JlHllmUFdSDjkRrgULfe4nka51FCJ1dBr43VaMPAfJ1fV/zwZyC0?=
 =?us-ascii?Q?17L4XiwvOh9a4RKzEuT1t/Qh7ZWYgpku1344YRLDSeCKhhjv/QZVOlv+uv9W?=
 =?us-ascii?Q?iGu+/xuHy7dPUx+IZrfg+I5CHKHeJWX9tBatx+/4UsPLhtjgpSDxuRvG8Ndk?=
 =?us-ascii?Q?FTCOa/2zMyMmtrtwr2c3a/ZB9mjt/rmrM0PMbmrqwlxfZgdlYMQdC0modZo4?=
 =?us-ascii?Q?h+C0dDmCVqyoNRjhtivP7EHvGamoDl5XLHpDf90n3OhUcfGnouorHHSo5I2h?=
 =?us-ascii?Q?apZVrML9iDxwJxDYrA6JjbCMZryd7J7YUk++476O/oPgbLtLK30lepqpF//L?=
 =?us-ascii?Q?Ccho+mltutyDPGPvUKK4Q6oNwOLVSLxlcHdPIxMjCcMvVEBDVDR2XxdFr2Sj?=
 =?us-ascii?Q?XWyLkW9KLHLY+E5FUl05DtyPzdpxtqaOfzLFpYcWkL68A67oR25D4qp52OeN?=
 =?us-ascii?Q?DOoVqwkqUXep2tGe9XII4YfzCnODzUAGhr6dsKQvmQgU83XmEMhxJ1WVMErw?=
 =?us-ascii?Q?ZbwohVFuy7w6OPTEKq28sQI5IUzzm6htlHw2W5TeoKqDfK6tM5R+vZR4MrMo?=
 =?us-ascii?Q?bf0BV4BslaQrGce2A6xGirFzZvmprTL/mnQIOQjBoZGPPkY5DaJ7NFB5eXlp?=
 =?us-ascii?Q?gsGroVOBFluaxV/ImVaCKY/xrvnGi8tQg/l6kIXqH3OrRLbq85bEX3RVF3d1?=
 =?us-ascii?Q?z1Y894fOahj9rv9eOPGrh002l6kMU2f3AxgoFXIgqkM/ZfBRTCiiDuNn/7UA?=
 =?us-ascii?Q?0gIbqCc1nIdQsbowwmlxHSf7pFe5WGdGwD0StHLmk0w6EKvV+OIx8UV/Ksdj?=
 =?us-ascii?Q?dE2B81StHL1+nf40llUU59GhAKiK5QNGM1pjHMXoJ3IS/IY2lKcErelg7Itr?=
 =?us-ascii?Q?PbSW2Nj68KXWjgNqHAMLzJfXGdJM2GJL4Bem86NThAT/YCD5wyw7zNZ4MDb0?=
 =?us-ascii?Q?e9fS4j6+iBUwMuxAhs1DnRUaTE5HJPIGua3sc4tUxv+dmkXo7kCxe7Hs76We?=
 =?us-ascii?Q?65lEVFyUv+630LfW7KVPVxShjjyZem1FxyV3s7LnZS3NvTsVV3/nd6BpumzM?=
 =?us-ascii?Q?LHuST6ONDkPNaixmQNETyT+eSY2lO8FHCDX0I91MCJkDoQdgxPcFcKnUOOUV?=
 =?us-ascii?Q?hncv86/wlI2CiP0GLzFulDw/Gj0KMqn5BiSSgtRUePrJNdGFB5bequeulRnu?=
 =?us-ascii?Q?CpdZhFsU7PwNM18AI1xDnCTgtzcZOtmiQIqIg9mQuQxsEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H08kIPaN4xLkZghwXPavXGXeg/qPI7DRhv8AaCnm2TKV4mcJI30MLVhGYOTI?=
 =?us-ascii?Q?IY6zPGWL93D075x3s1PiRIyXrZodLY0+ikj2e65f3XmxlBMUSJpp5HlbD/g5?=
 =?us-ascii?Q?0xFCEWdzuK0Eg8Xjqh+rwGA3yftz039FxDX8M8vmMR6MGl66Bs4FyROQUDct?=
 =?us-ascii?Q?i4dFwKCiudJRDvgenQjOf2TuqNqphHXygtkJCbpUA3Y7mBoDHEKK2yNX2exl?=
 =?us-ascii?Q?0WFXPiH3ZjDuh1P4XObkYPR1uoTNQMpSwOM3WiYJWAYZ87uflYMFPOpwJPWJ?=
 =?us-ascii?Q?b9f8dk1yLAMxxC7dzWuAxJnproxWcxTCVkvVlVHr8QukTow+Kva2n1pD3uvR?=
 =?us-ascii?Q?i6HjSagHENLnLCTclRDtsD7XEqY5U1fxpvDYR6uEbI3RT6BiDVSE0GJFesRO?=
 =?us-ascii?Q?wuGfxbK9BcCknvY7+z/vwxAW+If0cb25Oqdl+Z2aqqF40VvQrH/QOicXZqQ3?=
 =?us-ascii?Q?wnI3Bq2yDOSvA62xwjvxXtPgtoUr/5fGkmb7HUatWSURovHclpMSSv9tRonf?=
 =?us-ascii?Q?ETIUNBZqQu5151mjrn7Nnxm+CJ++KA7h6PxvrBGB6FgIwhDe3tCV+PbobVeP?=
 =?us-ascii?Q?rsBOC2o7kmuPsTskn8cYC7DAyxmZx0/L75qDDhrSESTlZVl0mpVvOTBXSeVr?=
 =?us-ascii?Q?v1wpmRNyOcLufu/0OiiyBd9cYv9pxE4JuEkBMW6jzr4GT+HbYtDjZgxvaN3C?=
 =?us-ascii?Q?j8NVnnoapdKUST8G8drv1tNFzI7UUoBPxVk9QO90JTuqW3n3k0UuGwCubprB?=
 =?us-ascii?Q?5Szfnl/kqDpfvZMjAFgRlo5dWfQeSNwwqYu7QMGJBYRpzEqqjzbo0t68PS81?=
 =?us-ascii?Q?ScgROv0HJsEc7wI72AhAz4nXfieE3bHYPSzX6hgFLF8wY9gfcCrKg86zPNqA?=
 =?us-ascii?Q?A1nMPA/TZqEkNRgt9fw633Od2z+L36IWKfV8jIJqxvop4pio6Pjzf7F0vlw4?=
 =?us-ascii?Q?a90aej8q55S7+cGp/kSFTofEE+D+stNmQUZ3Vj+bQNiD0kh+Kuu1yMzK8+cg?=
 =?us-ascii?Q?RYyCaBgta7HyPRaDWcPh0ryoIdKAqB61TeMhiByxgVDFDRbBNdD8Dm8w0s+2?=
 =?us-ascii?Q?zqJIEbxSL5mjYbieK4zienC9bsxeU11aoBjh+eaNloJBo4cML/uqwGfqXsBU?=
 =?us-ascii?Q?v/m+nu82uTUytLKzUV7WSk13IfLE0KVJiBVrdJlCSXHExvnVGCx66Qf0yf1q?=
 =?us-ascii?Q?5bIByM/jzUR/B6Uqjhnqt3yMTvjqfDgAYvdiPNCRg0jTsqEx8g+zsE2evVwW?=
 =?us-ascii?Q?ygDNdWIClA6tPhniL5zTnJPyn6ZQQTsrTrQm91xj0NQ1Ff3X20REOgAuNdhV?=
 =?us-ascii?Q?kEbCNi+TbCcxYFQsESQAq7kA2fEdZUBAWnFlK+ce/f6BcE05Z1/9rNfSNGr3?=
 =?us-ascii?Q?zT7oNyCkv8xt6f9Vnk3ob2LMSBIT0eXVbrYqki1WB8tMbJgkfAMMCtskVFGb?=
 =?us-ascii?Q?72bD6b/7eI7lprUsJzBPiIJdwvB/en1QC4Pk8PDpjiy7yfqAumElsxyJcAK0?=
 =?us-ascii?Q?mZwLhnZmIc8In6e29j4jYmyl0CbhC1juZTZ3Ref9CSGYgMpGGn4TxTsN2oLn?=
 =?us-ascii?Q?6BalTXnA1zYhGIlv3Tvedg4btkgF5mJwVfbEh7dCHzqSKYgBvJnm+sisrWJ/?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a81111-e12f-495e-1390-08dcb271f1d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 21:36:03.8982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zcu9HSCn8Xsk8oMIJM+hKjW8kafE0ikbsVw5nUXbGq0SzbfntwEouXT/vBnhgZZ0YtsUkRYysLDAil1DFGjf+eQyoX/lqqjdA8LxacglRJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

On Fri, Aug 02, 2024 at 02:39:29AM -0700, Akshata Jahagirdar wrote:
> Add Compression Performance Improvement Changes in Xe2
> 
> v2: Rebase
> 
> v3: Rebase, updated as per latest changes on bspec,
>     Removed unnecessary default actions (Matt)
>     formatting nits (Tejas)
> 
> Bspec: 72161
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 ++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..0d6a73a3c8c7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -367,6 +367,10 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define L3SQCREG2				XE_REG_MCR(0xb104)
> +#define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
> +#define	  MEMRD256BOVRFETCHEN			REG_BIT(14)

Looks like we still have an tab character here where we wanted a space.

> +
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 77d4eec0118d..b41fdb350411 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -45,6 +45,12 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
> +	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG2,
> +	  		     COMPMEMRD256BOVRFETCHEN |
> +	  		     MEMRD256BOVRFETCHEN))

Bit 14 = 1 here is also the hardware default, so we don't need to
specify this one explicitly.


Matt

> +	},
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
