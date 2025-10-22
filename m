Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD3CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3353410E7F3;
	Wed, 22 Oct 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4GKgsWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEACB10E7F3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761147503; x=1792683503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kBFAogR7SNqD5XmGiC4v4o6FRSWxdBSi945pugs9yCU=;
 b=F4GKgsWghim4PnuOKgmhD+HvcpYtEaSGnUpe8uJPDmttm7AXOxGPeyHt
 nKH7fVLXlffjiydANsSVcUrzSMM8icrlPQ4801DKG9xczG3KAVm/lnS43
 92APE5ZgJYKyvqm7tPtJAoVblP3QK7RuDHNaEYIs11HYDki9UH0iuuQpD
 ZhCoVNLUGaII9EamyS+TAMiUbhG93f8vYLhnkRqwMYfJqEaSPSnZImp7I
 p9h6xhMxeYODv558Ks5KSsT55/4SY8lesCZ6thjLq77M7DEWNyVh1eGcU
 7N5vM/7Bf689Wl5uKrzW9wPkZXtB5gOIwOmFccHwNCC2welIoWYPo5/yu Q==;
X-CSE-ConnectionGUID: rafGNtgpTJCekQTP/EUX2Q==
X-CSE-MsgGUID: JomhbBfjTHGy7GtA9abIug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50876046"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="50876046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:38:23 -0700
X-CSE-ConnectionGUID: TbfS718KQfuU0THxDzr3xQ==
X-CSE-MsgGUID: VQW5seUyRRyWMVXzmWBMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="214847283"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:38:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:38:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 08:38:22 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEHoK8nBUSZPyYGhuF4gAJqW+xXks4WEIsVqJCLEhm6OP98CbgzBE0lMtY2dj+ZUvuhXODH/IwjCal0OJUtrVDut+te+m3htOZaFd0Esh04g8tyIrE4LfzfVcBAt0/8pf+muKa/u4UDawb+nbgL12TTn0WcahklOfbXfpyB5emseXFozea+GBuutDOkDHvwz8qeExZVZWzF+/0tk8AcUJ/p6hiCKLQwFM3ik+P2FaLKdzPhF+MYhn/GaDKW9D6WXuRc5GctL1DhF9NBtY8vp7SiOxE08VFwgHX/OqimWJZNs2rXdhiAuHSWFY9PODsDxn/AaQDjcD7hzUsW7qJ9Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5bJwO8WpphrVewTQakizUQ/0LpDzqDAU5ilQOU3T5Y=;
 b=fcyfPLEdiUk+oT2szc06bkO437XLqwYaq1M5b4EV5XoV9jR+aglrcZGdWzovlq8y3tMGPbJOS065sPqYZlrkitbH/WI1oDnPS4OxXG3rgBwEZUBnWTtFOEgjdMqYc6OsnTn0JnRPOmoQIVnRo5D450ssDQxbRkYmtuQcZzYlb1F/njHHfeSu7g3He6McU/KBYHs5JaxoiuF2UGxC5nLFLINB7zOanQfnMp93eLZi2MvzGR6LasiHjmuV/2+fxO9vPfN0HrZZwC2iI/zfjMtzYwPTjgBIY+zgF1No1Ohl5liWrOcmoNMp70tq/ZKT1R+hCg39uxZgZMIwXPGxqPUj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 15:38:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 15:38:19 +0000
Date: Wed, 22 Oct 2025 08:38:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 4/4] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aPj6aFwHyd/h3puT@lstrano-desk.jf.intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022094246.3584785-5-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c85ba89-3fdc-4c4b-4c84-08de118106a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HYkrUBRDD0k0ORXdp0hYGcvprmrdVGU58JGMOY9JolsHZT65TonnZKFwUbbD?=
 =?us-ascii?Q?dCYdGOSPcbQeKkARTmnO8nMv1IasBTS0WqhK0xPIo2sNoXwwa4V+D0/vcN4l?=
 =?us-ascii?Q?QBmM7TxHySZe8kM9rgGfG5wQDdSOrtWJQ1U5sHvw2KH1oId8ThuFGlGOKE3z?=
 =?us-ascii?Q?CGrWV/QN5xOfDwCC5/2U01dtCQNU1If6N8ulOVyg5zeZUoahtdhdWtBY1Bfg?=
 =?us-ascii?Q?znPP92n0n0caFE6rZL6mWLctUlM4Bpjrxjnxp5FZshxqoNKx0J3nYXjZyrRo?=
 =?us-ascii?Q?qELxFLi/1UGE5JNxs9Io66faitujI/GT6ipxmFDcypDnjXhrlaVefHSvSf0z?=
 =?us-ascii?Q?Orbyi/m8lxHRepvQBtDfLUrubY02ILHjAH9nK1d8FFcaSW1Ike2H0GMlN4bP?=
 =?us-ascii?Q?EOEd/3ipW0YJBOvNLz2WShlhPHIxDe24+yQlBMhR82+scaNClj3Wbv4zIRs9?=
 =?us-ascii?Q?24UvHoSQWJKluKD4exqRteyxt2Nm1mVZofel1sg0YGrE8WUmI8EImmKoK4YD?=
 =?us-ascii?Q?WpKEuo4PROHLH0P0QS8v1R1IoOdFO+YPT1uMLMOTOwn4IMCEntkwY0JThiMf?=
 =?us-ascii?Q?XDVBDxPjMilXv6f0tl6uC+AjISj7E60Az+HL2oLZYuPUvf1OFBA/g3dEFZvz?=
 =?us-ascii?Q?tlIg0qKSfW3YaiA5qIcDVmxxEiroFsjt85qN9qPkBV0Bc+3ULqcmvUfB8e3j?=
 =?us-ascii?Q?7fSWmjUX/2sRBH+/LG/7q0duShcGteB56yDT6xHjURrwpy8OjqrN/XoIUHVE?=
 =?us-ascii?Q?WICRnlwSA0T9W0n6WZCxJso6hSzqPIV95p0iwBdEggM3gfrahwvgiEx4q8gg?=
 =?us-ascii?Q?fEsbSi1jAQ1d8btNBe6FIJ3Hw+xd302URrQfSqldYalteGUfYMyTYb18KV29?=
 =?us-ascii?Q?yKSO1XdGoe94VRDDK9einaK/tzsFbPpKNfTNYvx8IbjD8XeU12bY2ODJekkm?=
 =?us-ascii?Q?iA/6+pdJs+O+abZF5ZCk0THjkSiZf5H/3R0JOlqyqf0qdq/YyUQhgTqsNJAp?=
 =?us-ascii?Q?5iG079DKTNxi5yQR7fvZAJR/BZTVfSoAlcOc01ZE4BEET8brUUy4QPQwcy8s?=
 =?us-ascii?Q?7ESoplHOAX7USQv1NF4WTd7MBSILq4qLdiVNFEle9GC6ptcd1ndWqKDPnxqV?=
 =?us-ascii?Q?vEVtE/CsYi5E9mg39oZ2rMa+XuWucrSOscYCGwHBaVgQlaKIj4bv8ILC/R9U?=
 =?us-ascii?Q?MCOvs8h1dj+tOVzcJf98LkOeQDHbddhYTSjLSPhcmOej8g3RVM5dVZ9xrnZG?=
 =?us-ascii?Q?0ENgABqywN9kbTwp1AMjM+/MIsTPNwug3dKWvXpz1XMTkj+mCXhomkSTKfpw?=
 =?us-ascii?Q?P13HtEgvWCS20AwgzF6ECxWp/KpiNHOelR24xW7yYZ0MTeoMjR/LhQW8Yoxc?=
 =?us-ascii?Q?WmzeYVPahL+FNha7f8n3+WIDRAl8PcbjQDzxDST3UlDF+QwgoN6+EssYRzrE?=
 =?us-ascii?Q?EL/DJ6N7uF7n4VWRpc7fpjBp0vpE+bEw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBsTrRtv5Rk2M8UL/29IcwU9OaRPTlbHRT+Gg1oo7rOsVjXoS2dgWpRYdONw?=
 =?us-ascii?Q?by1DlgYmw51yEDUlTa7ZuX5YNTMvLWzCFctn8i0jqihNucL6crkCDpdNyXOw?=
 =?us-ascii?Q?sPcbOZZSPRYkOTt3B8YD2JgSbdMdxLiuZD6tpY9vUV9GmjHWV0jJsUHqIR4R?=
 =?us-ascii?Q?MXEfMLb7b/QOUP9fT4Ic3AezGQiYXLupK7VyEBhSSwkBMH8TazTsCNhb178E?=
 =?us-ascii?Q?atEBJ6FSTIJ5J3wa93Gil6C9S1PpmMPLuVWcpAtxqrMMZ9BNeuW5Di7spSrr?=
 =?us-ascii?Q?L4t0bglXobX2kMyZtObkj/q4bPb6UEjn8gwfpB/KNmte+gPuCxWEXP+hc9TC?=
 =?us-ascii?Q?4/AyPG9AJA9l9aaumvyJuCh/1VIrhpFRceJkv1CUTYd6POpDVsKsMdzwBse7?=
 =?us-ascii?Q?c8MjKtOupZNxV5eMp9WYlZ3KZFHIPQLDhpFcyZs6NakzDGnDI2WYycNqM+Ja?=
 =?us-ascii?Q?noqSkQILROOfTKYCmq3TpA18YNMn7ck+tjUH958wCRP2Zkw09t8V+U5Skx/2?=
 =?us-ascii?Q?3uJffwS1TUnrkWUGGb7nvo7/3CHzow20emLGyfqrvNkgVMakoKWuoDi3gI/l?=
 =?us-ascii?Q?h1HxUAFwfJvRf8xWi0LnBZ3sn/nvj2YZm6Mg8pDmbraxWmfEe7LLZICwegOl?=
 =?us-ascii?Q?sGEj9fXPqJTdPXEXjyHBG5i1l9czQtS8NYz7oBx7Gks1gmu75WIivdWZ1reU?=
 =?us-ascii?Q?6F3QnRYBD7SUN5uN6b6oPgT19y0qSJWMX6LHizOUYshVCUAqHM4LAH95BTfp?=
 =?us-ascii?Q?4hu7cPgL8JQg5mu/NTxM8SOyeJQM7IWoJ7sb3HSGPSiijHHg0MKsntuvPiiR?=
 =?us-ascii?Q?RrtIc1KsqrRj6RXyIBCCBx+rz5g52DWdTNcffoghsy2Vov8ZemWUlECypctK?=
 =?us-ascii?Q?9ZG4u54oij0J0pt3atj7yk97n+zIW5JCg8Y/z9ncyWu2xWEEr0SdLX0dkZDo?=
 =?us-ascii?Q?m8OTLDvvglsgAeXDv+vFzuMfdlJ3XHVZqz7IbxIw8PhoGWLA6WuQG8lQdobn?=
 =?us-ascii?Q?rcZRQudPn7zQPQBpq3/czwpakPXDzXjdstGr1o4HaUhYjZMYuLA2DIn1lAGl?=
 =?us-ascii?Q?5+cDluROx+3z+tEIbOaoX1wJDkc2Fk7A6olexLJ+bCInijy/UaLAIXjNTcYH?=
 =?us-ascii?Q?BLX2Z8R1zdYhC4s3v+FdywfoZGsWFH9rJR2tuNj1vKFGRRQ7Swgldtstc31O?=
 =?us-ascii?Q?nCl7N2VEkN6L8c/5+laBk4GoDtgF36TEZLtqPRCSJEehmi1KyIG9xRFD+/yD?=
 =?us-ascii?Q?GwDSe96agaBsgMadv5qx2VAsBaOXOMIG+sRZmTWVf3VktlQwJfGuGUSEMxMM?=
 =?us-ascii?Q?kk6ERt67VrsBs11Brv7dkCAroSVVG97cVH8ceslsSoklnONW72TlEuJSnW7Q?=
 =?us-ascii?Q?sFl3gty1EEJGyBssF9AcArBjZLnUZbxc+l/EmfCcCbWO35q8mrX9q/e+8AVk?=
 =?us-ascii?Q?pxmPDJGNVTQbzHrKjfnZ/djamYY4UeUQYuXuncoELf+GNTYpc4g9gwisJ8Wz?=
 =?us-ascii?Q?zHYxToPDNN4Amphfd50T2nPJvza67M1ZqrjkLelj1ZGPinBo6g6ejdffR1LG?=
 =?us-ascii?Q?AMS8+tIcf6k7b2WKbuXAaxFXLG0HVUOapUaFB1WBQELUHrWYskYqQnFM4lwJ?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c85ba89-3fdc-4c4b-4c84-08de118106a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:38:19.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDbVxL+VAL1cxZkKHTJUKQGQmdC+BUI1u0GQkR8hFKSOdIXdABTvaR3Izcgwdrg31IM0/p49PDJteCRT38xmrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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

On Wed, Oct 22, 2025 at 03:12:46PM +0530, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full GT re-initialization. Introduce runtime helpers for GT
> which greatly reduce suspend/resume delay.
> 
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>     Use runtime naming for guc helpers (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>     Use runtime naming for ct helpers (Michal)
> v4: Fix tags (Rodrigo)
> v5: Include host_l2_vram workaround (Daniele)
>     Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> 
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

I just looked at GuC CT, scheduler interaction. All of that looks
correct.

I'll leave a full review to others already looking at this patch but:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d8e94fb8b9bd..0eacca14ccbb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1003,6 +1003,66 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +	xe_gt_disable_host_l2_vram(gt);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_gt_enable_host_l2_vram(gt);
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9d710049da45..94969ddd9d88 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..ee35f1d8c21b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1607,6 +1607,40 @@ int xe_guc_start(struct xe_guc *guc)
>  	return xe_guc_submit_start(guc);
>  }
>  
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	xe_guc_submit_disable(guc);
> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> +	 * directly enable IRQ.
> +	 */
> +	guc_enable_irq(guc);
> +
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	xe_guc_submit_enable(guc);
> +	xe_guc_submit_unpause(guc);
> +}
> +
>  void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e2d4c5f44ae3..fdb08658d05a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e68953ef3a00..a7b8d16d4041 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(ct);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_restart(ct);
> +}
> +
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  {
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index ca1ce2b3c354..5599939f8fe1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 53507e09f7bc..403a61e98ad8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out_resume;
>  	}
> @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>  	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
>  			goto out;
> @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..6a58b33248f5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_declare_wedged() - Declare UC wedged
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.34.1
> 
