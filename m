Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B829C369CB
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 04:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9D510E341;
	Sat, 26 Apr 2025 04:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyL70kZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2110E341
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 04:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745643217; x=1777179217;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O07+WTvKtCfYgIWnIDjVkuyJyQidfpvT+WwqVGWrwlo=;
 b=DyL70kZ80ryIhYDw6WABy84CSfgohfwXq8TPzrKmdL6O86pjGE0z+RjN
 z4bBlbsf4b3ZIi7s7MeTwCB7Rw7hsuO9a8/wGX67wxG+Hg6OzLYnrc09M
 5IJMi1cZ0zycOUXNjb9euEuTGrRZZ/zNdPGV/RFT+ptMRlAkgxH0yAxUr
 5OYLh+njtbMsmaAU6SdKDMdThnaldtCmp/IfsFJZCMDI/c1kSbZPUOVqh
 BR41zdhpsdwoS7gGhbk+SQLwHEsWsUEqBQAKWMrBHXEZk5bl5lPFxwVMc
 7sGL644iKqUKkJsVSFt4xiBHXC1c+m3tOI6RxPeki+4NRlwwsrXiYMUnE A==;
X-CSE-ConnectionGUID: S5+01b+3So+3fDuWGXMi7g==
X-CSE-MsgGUID: 4nDLBgjwTXiow9tmzYeKXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="34920708"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="34920708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:53:37 -0700
X-CSE-ConnectionGUID: xVO67/MzRuSOJXWRJ13uOA==
X-CSE-MsgGUID: HWJOzIxcQOmN6s9riDTIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="132982211"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:53:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 21:53:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 21:53:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 21:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TioF4CbZr0wD9qWeQsncUex2l3nVT8yEmycsrDuG/BeE4r/dBAlPvjQo8QNiso2WyKHFZSIP3StmuRnuMOuz9L2Hnv9G1bHoKWLJKWCMZW9+TFgulQOR7TXBBAhhvT3ZbbRJH6IjfAH9+h8uldCH3zTAmPfc4Tw8tdaU0uGjs9c3/pdoPjLJGJjWQSUgf2CVj6Kk7rSGlN/RhQstHvgi2o3tr36WWUVrt3jvns+WIyDXH+b6uDbCR/EQxxzApde1MP5nkwu7sDMN3uqowU1uLcLAfJRTwd2Q6E4xjAwQ6KjpxnvY6JAerEJ+b7VOQeHe6qCSvvrSAt+1agA96hMN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQKhVTWLJg1DX8mBm3y/s4apx8cjwxuELzMVb5gjWJg=;
 b=pWWZXT2k3n0mlVIL0pGaskINH1JDseNtKTkVa9xGRDDU1jiOwIdMA1d1WUWHEFZlHXvSlGZQUyfHOgxMagIN+5ihUGpKw2sT9PsjG70Jh2K4DrwKoWucqPb69Gj59ceOVxh9orU8tgKqYLQH8VUlu9+xO8zXNDP2hv2RTUkyGBNEM6+CdgBpdrFTpq/B6XjtA0Iev6rR+g9s0d5h37Iv1uusQaMNFmoZIWQ+sn2o/qhHdCl2IJ1SRTk+8sRlzNVuWDfjeF3H3K72t8WfivcpapRwaUvez+1b0GbfSYI1qAMcKq0NsSf4euQuQvEyvSLyNVk3etbTuq/mo0vH9EICCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 04:53:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 04:53:31 +0000
Date: Fri, 25 Apr 2025 21:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <aAxnHOj4/r/fMGJh@lstrano-desk.jf.intel.com>
References: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
 <20250426002951.1795492-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250426002951.1795492-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a42891d-4904-4cce-ed4c-08dd847e4aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3d5W6OoQUrJ7LDEsGzF5qkdFsVp5m6ArlEdJM2FJbUhc7k+bzni800rvVME?=
 =?us-ascii?Q?pdw0ggFREtzhcL+VhUcFXRPPtEDRq8l1++pGJvGntDE3jUFQrGqFUj/LBc46?=
 =?us-ascii?Q?eD591WsiGwMr0AZXBp6/HDfWZZ9T4ElDOx/7luP7j4R3KThajRPZMhtFcw1J?=
 =?us-ascii?Q?ItmuAa4P56uQ+k4e7bNLarkejLvc4yk6rUOvPg9FQWGR9PiRKmijsjc2uJr4?=
 =?us-ascii?Q?tfP9U69F8qA+EUSribkVPHURYtCWU6dJtSraQ0VE/HiiCkeaUI7gj7At0XC3?=
 =?us-ascii?Q?HGeRHnVZEH3yCn7okgMO7BYMlPQLhsDMbMKpSsQOZdZAYi3jcWLnlTxW4EKR?=
 =?us-ascii?Q?kdzj5EM7taXr327L2B1awCLJ60WCEcu/wUhrUFywOnxFglxiDMgaal3cxpBU?=
 =?us-ascii?Q?g9sk/lYJS/zNs06MMjFgx+SmVwLyqXP5ia+owI41TeZtWGf+xi+P1Rh5ZRgd?=
 =?us-ascii?Q?sSau1U9547a2sY3xIIG8weaxA8LAShd4zTQgV4OP0twG579auaEsagNQbOpw?=
 =?us-ascii?Q?XIab113Cf4+zv70IR9MBnZmitpz6ZcbjARCOCRsDD0Pr8HElgk5gerl4kks6?=
 =?us-ascii?Q?gc+EBcUayOhtd1QDmwIKJd8Nqr1pkPxUqi0qn0tBcydXoyhGF2vuM7CfKem4?=
 =?us-ascii?Q?16Jhl1yz9NQb2xAdqXJ2KIQcEa65NC6IVWnvkTbqajS5+An8p40vBeJzHh4B?=
 =?us-ascii?Q?5We5sTTktnWLZZ6BmufhPN+jJ9/tKhSlzu2unB8Jf2I98oKSTIqPL3sTtH8D?=
 =?us-ascii?Q?LSrlUZ/C3Tl3PyV+jbofMJ4V6IHePDSafyWX3i3AVso6MuL+/WQ9KlidikSz?=
 =?us-ascii?Q?fO4AwRGjcRioqRavzE/2pgTHCzR7hyQtfH3lBlY7M7D9C/8LngCSMfSaW/Ok?=
 =?us-ascii?Q?7W7zdluj/KVDu52bqC+T4fid8817pa/BtImp9AnDRBfMDmTPe42j7MzymIDR?=
 =?us-ascii?Q?NGUh8DdlVYjrd/TrFxZ36SaS8rJTFEF/rKS46Fv8f4sEHh0A+aO3E9QJImjV?=
 =?us-ascii?Q?Ppdc3c1x3skAgqFKYu8OoVbJnyv8WC6DoLLaiGT46nGl6MSxZg063mEQ6qJw?=
 =?us-ascii?Q?lZX1JelAd+rTKmCO5rCL084oOTbGj1zNUejsWqThTPQx6/dfQuYLlpy+bgSu?=
 =?us-ascii?Q?qfAyHYNUDs+1Eiet5ATzb0xDdj6smClSaRg9olI4WN/QDa8tq3yubyzuDWnZ?=
 =?us-ascii?Q?wM7Nzvry5nCirwOaE4++EpypF4sGte5xGtZrGZUcRXAbnintNm0xtDIIQVrV?=
 =?us-ascii?Q?MecYowTv2pUqDWh9h6iwK6sXepn2U8W412Fp338ZmNDAa+TQsEpGz1Thh1A9?=
 =?us-ascii?Q?sHR1Jlzf0uF5ZU3VJV4e7VH+8YUwxHVnWF5W8OTtPN3WacZP5kXegHJ3iz6R?=
 =?us-ascii?Q?bW9XTKaalo3sa5vjHBvsjES6h2++Z54mUbEINxcMQufvo9xmTuYNDmNhbQpO?=
 =?us-ascii?Q?MFUtJV3N0iA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WWaWGzeLAjMXbzIYYWCTi6vLUCOtg+3h4VkVfFxzyVlVKcNrPEKdYYY2qxX1?=
 =?us-ascii?Q?rPYSdQLFYaXD6eytuGOXBIgLNLYH7AjHymwX6CgsBbw/LkBy59hJBdUrJXrA?=
 =?us-ascii?Q?VFGPRhKIWIkfhrI892gZtwb/BjZB0x6PteE+dwtpLuY/XdgOAAiERWVmJ4v8?=
 =?us-ascii?Q?aw24opVu9k7e7hiREZ53t2WGywuNMCu3QGMxqS8UVusXiydF6EqMnhwyIOby?=
 =?us-ascii?Q?2UC+ZNLY6gqczEH5zzxIrWmrYbfsxjdHlqGvfmBn8469Eb5aYA7Mqg0BQxsO?=
 =?us-ascii?Q?VPdhOQcdHTsbi4Oi9w1tMA48MoisDei3dJdkd0JVP0wOFspskW+SNvlPYF1U?=
 =?us-ascii?Q?cSnZPOLepb+Kfbcdg3VEs4PWflY90gdXiDOtJ4pXRvInpAGfSmLySWEsvP/u?=
 =?us-ascii?Q?htapnl9vqwsXnXWonMht9s/iAxGuYVkk2VRjStWP2ySwbcVUCKpgMeGvk9jh?=
 =?us-ascii?Q?JUvOhT6JslCQOaNe0qE+jbF187TRf4Ali3R5Wam/pOQdhtzUeCUQUKIoK9ko?=
 =?us-ascii?Q?ES/f/GyJe4FTVjLZwNLk40zksqK5X9x+M5Ruv7atbXk9AbdoU0AbjY16I07R?=
 =?us-ascii?Q?KVs8SPkCoX7wZloc4ShsXd2oymqrn5rO7nt/xo0FR5YcO4vvigB0lbcvsuqL?=
 =?us-ascii?Q?ErsHtPHQk4gep60l1nOAxbKHyuWz0fMWeVYuOR2qowjRFRU7GNt3dr9D4NVW?=
 =?us-ascii?Q?CsknUB1KhTBG6die9qlG2laSF9u0ntWH5Fphm3sPaxQZ/C9L5ysOz1j6ev9G?=
 =?us-ascii?Q?oOhzH9flInEVeBGj/xMaKC5OTQ4X3b0YwtIXfK7CCL5C3WaHy0fR1hI0FwiM?=
 =?us-ascii?Q?CNjLlhdS7XJbgaKnw9SY8nj4xtI8smd58RQuKLkB7xnnMaYOPpEgILGtkKQ0?=
 =?us-ascii?Q?XIzagrymujXiHg35E8md6j8MRwxM5/0uqVJZwTMBjeoJ/QcC3UkBtE4xzCyU?=
 =?us-ascii?Q?EUEeqkD6FhxWmAdnzjwPMnNgNdga5ZDebxfzkZX9qqmWb/dlDTHVm1TP9ayo?=
 =?us-ascii?Q?j4B1GQP4IqcSZOoczEbNjlrbm6mz8oVBa8b1PqodWkJjnklc8jTW14iMoypB?=
 =?us-ascii?Q?1JsPk4/gl9aN1piSrCnwVSRu+taIjN1QnF76kqff/2jdO/ZGaUVcWF86Ynw7?=
 =?us-ascii?Q?ISR/qvsttvJZK5NpqqDS5LiikMB9FPr/50cJwAxkS1vRfbD6cUS4OtXjpuL2?=
 =?us-ascii?Q?oxbKMfYxqU9NVwfnLhjUqW3G99p2GB+mje0Fiei8UFPjp7z/Nz0e+rkuN1bz?=
 =?us-ascii?Q?FvT+K+G1R1tEhjwfRqNAuwRCJTyqkHl+ZMifWroaKXaQvj95QvgIBGF8+5/N?=
 =?us-ascii?Q?fOhE7rLWdCA4PRFXAbf2VxUXkgD1lo41EHThviK24GX37sgPLzJDNnYbLlMv?=
 =?us-ascii?Q?hHWZi35WDXmRP8RyLTiYwchBVM8rIKQXvtIZfBO9Bfl5P6tTfFXSiXZr4aBc?=
 =?us-ascii?Q?eK3EafPThzIZZ6M2FCcfeep5D1dggw7JRTAuVkq1/agjFwRJMfSDGRbw+b9b?=
 =?us-ascii?Q?fztKaoEnfl7TfAy2UOADCf98GNGgQktxs4SpvLX5nzL4TcxHYA+YkannPjAa?=
 =?us-ascii?Q?YxI4AGPUkUj/5BcjXUUxAujANsbagHyiEYN5lUw1IJkUgU0vQufo+X7eniQ8?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a42891d-4904-4cce-ed4c-08dd847e4aa3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 04:53:31.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn1zNkZ9D+CueXa7Z9bcG4yqOUIElIDzUgumuIAAV0zDcskuwgb8uIfAw/LHXj3V/rBQ44DZHbQbdK8RooPrkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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

On Fri, Apr 25, 2025 at 05:29:51PM -0700, Umesh Nerlige Ramappa wrote:
> Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
> of the context, but only gets updated when the context switches out. In
> order to check how long a context has been active before it switches
> out, two things are required:
> 
> (1) Determine if the context is running:
> 
> To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
> in the lrc. The value chosen is 1 since 0 is the initial value when the
> lrc is initialized. During a query, we just check for this value to
> determine if the context is active. If the context switched out, it
> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> Note that wa bb will run after the context has been restored, so reusing
> this lrc location will not clobber anything.
> 
> (2) Calculate the time that the context has been active for:
> 
> The CTX_TIMESTAMP ticks only when the context is active. If a context is
> active, we just use the CTX_TIMESTAMP MMIO as the new value of
> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> for the specific engine instance. Since we do not know which instance
> the context is running on until it is scheduled, we also read the
> ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
> 
> Using the above 2 instructions in a WA BB, capture active context
> utilization.
> 
> v2: (Matt Brost)
> - This breaks TDR, fix it by saving the CTX_TIMESTAMP register
>   "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
> - Drop tile from lrc if using gt
>   "drm/xe: Save the gt pointer in lrc and drop the tile"
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c                   | 167 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
>  5 files changed, 177 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index eba582058d55..9153a7cd2ceb 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -62,6 +62,10 @@
>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>  
> +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
> +#define   MI_SRM_USE_GGTT		REG_BIT(22)
> +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
> +
>  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
>  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
>  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index da713634d6a0..cc698136a6f6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -43,6 +43,10 @@
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define GSCCS_RING_BASE				0x11a000
>  
> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> +
>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 57944f90bbf6..210be0ef12f2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 089b195e2635..a78acec1a358 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -24,6 +24,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
> @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>  }
>  
> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> +}
> +
>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>  }
>  
> +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	/* Indirect ring state page is at the very end of LRC */
> @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
> +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)

This appears to be unused.

> +DECL_MAP_ADDR_HELPERS(engine_id)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_unpin(lrc->bo);
>  	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> +}
> +
> +/*
> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> + * context run ticks.
> + * @lrc: Pointer to the lrc.
> + *
> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> + * context, but only gets updated when the context switches out. In order to
> + * check how long a context has been running before it switches out, two things
> + * are required:
> + *
> + * (1) Determine if the context is running
> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> + * initialized. During a query, we just check for this value to determine if the
> + * context is active. If the context switched out, it would overwrite this
> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> + * after the context has been restored, so reusing this lrc location will not
> + * clobber anything.
> + *
> + * (2) Calculate the time that the context has been running for
> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> + * engine instance. Since we do not know which instance the context is running
> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> + * store it in the PPHSWP.
> + */
> +
> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +{
> +	u32 *cmd;
> +
> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +
> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	*cmd++ = ENGINE_ID(0).addr;
> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +
> +	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +	*cmd++ = 1;

Nit: Rather than '1' can we have define indicating this is a special value.

Also there is a small possibily (1 in 4 billion - I think) of a race
here. It is possible than an LRC switches out with a value of '1' and I
believe we'd read garbage from get_ctx_timestamp() ... Is there really
not another register in the LRC we can steal a bit from?

If not, maybe we can live with this race? At minimum we'd need comment
somewhere explaining this - at worst we'd get some bad stats or in a
very unlikely case get false job timeout if we switch the TDR to use
this new code path.

The patch / design LGTM to good me though.

Matt

> +
> +	*cmd++ = MI_BATCH_BUFFER_END;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> +
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -921,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +						  ttm_bo_type_kernel,
> +						  bo_flags);
> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> +		goto err_lrc_finish;
> +	}
> +
>  	lrc->size = lrc_size;
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
> @@ -1026,6 +1100,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	xe_lrc_setup_utilization(lrc);
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1245,6 +1321,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>  	return __xe_lrc_parallel_map(lrc);
>  }
>  
> +/**
> + * xe_lrc_engine_id() - Read engine id value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: context id value
> + */
> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_engine_id_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
>  static int instr_dw(u32 cmd_header)
>  {
>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> @@ -1792,21 +1883,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  	kfree(snapshot);
>  }
>  
> +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
> +{
> +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
> +		{
> +			RENDER_RING_BASE,
> +		},
> +		{
> +			BSD_RING_BASE,
> +			BSD2_RING_BASE,
> +			BSD3_RING_BASE,
> +			BSD4_RING_BASE,
> +			XEHP_BSD5_RING_BASE,
> +			XEHP_BSD6_RING_BASE,
> +			XEHP_BSD7_RING_BASE,
> +			XEHP_BSD8_RING_BASE,
> +		},
> +		{
> +			VEBOX_RING_BASE,
> +			VEBOX2_RING_BASE,
> +			XEHP_VEBOX3_RING_BASE,
> +			XEHP_VEBOX4_RING_BASE,
> +		},
> +		{
> +			BLT_RING_BASE,
> +			XEHPC_BCS1_RING_BASE,
> +			XEHPC_BCS2_RING_BASE,
> +			XEHPC_BCS3_RING_BASE,
> +			XEHPC_BCS4_RING_BASE,
> +			XEHPC_BCS5_RING_BASE,
> +			XEHPC_BCS6_RING_BASE,
> +			XEHPC_BCS7_RING_BASE,
> +			XEHPC_BCS8_RING_BASE,
> +		},
> +		{ 0 },
> +		{
> +			COMPUTE0_RING_BASE,
> +			COMPUTE1_RING_BASE,
> +			COMPUTE2_RING_BASE,
> +			COMPUTE3_RING_BASE,
> +		},
> +	};
> +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> +	u32 mmio_base = base[c][i];
> +
> +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
> +			    "Unexpected engine c:i %d:%d for context utilization\n",
> +			    c, i))
> +		return 0;
> +
> +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
> +}
> +
>  /**
>   * xe_lrc_update_timestamp() - Update ctx timestamp
>   * @lrc: Pointer to the lrc.
>   * @old_ts: Old timestamp value
>   *
>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> - * update saved value.
> + * update saved value. With support for active contexts, the calculation may be
> + * slightly racy, so follow a read-again logic to ensure that the context is
> + * still active before returning the right timestamp.
>   *
>   * Returns: New ctx timestamp value
>   */
>  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>  {
> +	u32 ctx_lrc, ctx_reg, engine_id;
> +
>  	*old_ts = lrc->ctx_timestamp;
>  
> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	if (ctx_lrc == 1) {
> +		engine_id = xe_lrc_engine_id(lrc);
> +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
> +		if (!ctx_reg)
> +			lrc->ctx_timestamp = *old_ts;
> +		else
> +			lrc->ctx_timestamp = ctx_reg;
> +
> +		/* read lrc again to ensure context is still active */
> +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> +	}
> +
> +	/* If context switched out, just use the lrc value */
> +	if (ctx_lrc != 1)
> +		lrc->ctx_timestamp = ctx_lrc;
>  
>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index cd38586ae989..a62d0b8ca8a4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -53,6 +53,9 @@ struct xe_lrc {
>  
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>  	u32 ctx_timestamp;
> +
> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> +	struct xe_bo *bb_per_ctx_bo;
>  };
>  
>  struct xe_lrc_snapshot;
> -- 
> 2.43.0
> 
