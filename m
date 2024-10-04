Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BE2CF884F
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C2710E0CB;
	Fri,  4 Oct 2024 22:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlblZ6H0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629DD10E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728081963; x=1759617963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6ts59W4vvllXgg1fvFkG7Y8CGf7uEenk4dpzfiD5MOU=;
 b=ZlblZ6H03MxsDXQceUVnxEEEmGSF+4T+8HY17GaZ0seVY2imK+zr3itH
 YEqTND7pyiIoFkporWzwG97mIv38fcQzt3h9Sd7Xl4RiDqeng0rSNZ/Wp
 QDNfEC0WFBKViHAbbWE1jmtQ/yza3pcZyzaLVwwCcu4deDa/tMPNDip/+
 URuuywXDuW98vXWrxxLiLxfaY93wqFrqf4+oI5xa1LQTl9aTyWIWTXKRl
 izh0OqQ/Cksdc4ZhY49CEsUkta7B4Q1n4fk8witatdkO8axbr4ZQNY2iD
 4bfyxgpNHsHEFCsZTusvtm58kDm4i3eYcBnNhnLbLO8fexQSOuwChCcCb A==;
X-CSE-ConnectionGUID: gNVRpLpBRRKRtd+n8Qr7EQ==
X-CSE-MsgGUID: czBOgmncRbG1dlmsyo9Euw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37973213"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="37973213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:46:02 -0700
X-CSE-ConnectionGUID: Tz+yWkngQt29sMOMvgzsrw==
X-CSE-MsgGUID: FGACuzybSr23WbYE8vtyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74521466"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 15:46:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:46:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 15:46:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 15:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHv2yJxkjPsdPQyWv7mQJuhHWyu2tlJxGcAwmY4CdV5i6vG8TdpbDrY+D0z2QV+KX+frXTeEq9XkRZsB2mf0tqNHVApAfHdxZItaSbuCC5pm3EII0PoxT2DiV+bcV8CZnWnPK1wbFUcXMCrxRuvhSzm5y2/PskiF83eKOZ27n6UeT7zkDJmUZmT2VJ21sEwww6FdGjSem6PYVwqRIVdov7VuWwrJrK/f81X4gKFKpdopIHU6LJT8B2ORYrOaEm7m78YySPo99qtEIYdtFG/yG8cODSX7W00POgw1s5skR0Mckmv/M6/ccL3r5YOuVFbrOO9if1A5ewSCuf25De0AmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwLRsLPeGjkUsbRb3jH8gaSLAkYqHtd0gWtV9FqM6gw=;
 b=nE+IkEf4v5JCOu0UFYqJo8A6QUgXoGLP/+9k9NzCe5urA/8Tw6IY061UyeI3fwdZcEyLJy0jQr2Ouj/hVsvu2lotIsvyDIMOZ1h4+Pu5in7cHHuV7kSGx8z7fwIBGEa1zMhml4168r19HJsJeFs4djofg3PlpTbabGYR5vSWXSkWgR1CWmXhhB45j/e2b7n5hzKHi0hfTdrZpbLxteW92ZxADSBisJhwrqUJb9XA8IZKW8Sw32GCGJDVAkZK3zBBWwpu6qxosCdo+KFBlugocxkKhIoROaIdqjInbml6BDTyM2xlusyUiSLsajhZvgw0H6X/AxU15zncEwj72KzxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 22:45:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 22:40:30 +0000
Date: Fri, 4 Oct 2024 15:40:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 3/6] drm/xe/xe3: Add initial set of workarounds
Message-ID: <20241004224027.GO5725@mdroper-desk1.amr.corp.intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241004220550.94308-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: ffaa9ce2-8ea2-4392-dab3-08dce4c58ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JMwHfJ7HwSt+mXVzscreYuJDejrZ2gY1HPTcvKQ3bgB4a9XLTr86v6M+t1iN?=
 =?us-ascii?Q?5EgvpSp1cnMcQ0XG5aWp75y7K6j4hnqgXwwG4lATF/tmYBM2QIq5k6cQG6et?=
 =?us-ascii?Q?ZvBm4N8VAhiQ01pOuHY7K2g5gASiSE9LLPlReFw0iPDtMvE6PGrrZUVEDWub?=
 =?us-ascii?Q?8z8rVNZq+u0Ud4mv3JlydeU879gceizisF04tcsbSLMsG/S/eaSO9ovYyzi9?=
 =?us-ascii?Q?mvczhYEwnq/YsGS0bDJPFwU7MamaVGMc4dc27lYJuHy2FfRW5/uaxLU7c8n+?=
 =?us-ascii?Q?jMFMcb+FlM+SwZc6FK3iOvTldFZqRB+qKfv4odn3vwxVou+sj5nK5WjSfltm?=
 =?us-ascii?Q?SfbDKvTRemFxzbpE6SNCRlaTbfNl/Mr/Uy37lUGqtV7sxVlbzrRBnuvznvZn?=
 =?us-ascii?Q?483z24Z8YXqk9xRxOtIVd78sAZfV+pUafyW4q1+dnwrdGpUZXvej28VDgJaA?=
 =?us-ascii?Q?tRvUKapBGIkAHAtIcARMuAbzW8/cST8YJ/H/IDyW7behFEOOTJU5IrIdBcQB?=
 =?us-ascii?Q?R2ZxdGmk1kIULSjQvS/AF/8DF2D9TsCBEriEDF4j5y5Dx/pIDSk2MjLMC4nq?=
 =?us-ascii?Q?AjgLKXDHJ9vsilqQ6iZZbc4EJdU5Yego6YQQoHl+5OlxhA2VtM2IcRs6VSmV?=
 =?us-ascii?Q?FQzn44k7Vw7KielXQgY2qi0foXq/eM01vRZSgYs49VbSj+Pmo2I3cxcd/H9y?=
 =?us-ascii?Q?dcfl6fAjw+6fNT055tvakaRnca0ybnASfbp/GmnfNXhTKWC3zMwn+r0ishEI?=
 =?us-ascii?Q?tXiPK19obBxuwkWGfl6iimVv9k05DTewmRm8bKpINiUxmw4Ywu36mmLMkLkw?=
 =?us-ascii?Q?y9+vzVWP9V+7e2UEtIA7Mgfymt7FJ4RJf9EXbRwaO9SXH5ULHDtwrcJUS9qc?=
 =?us-ascii?Q?B3UKOE7R1Oh725OGqQOhNgzIiXv4KgpTv8WaWFwikqAmhFMXibx6CJ6GgHvq?=
 =?us-ascii?Q?Bhw8+o5Ki4YIkEhLy5oNkzS/gLBp2mJZ7KVJpgG9PqjfLhKomOHG3riOHkwv?=
 =?us-ascii?Q?DzRGhIBoMmt5fJfq7HzG6CU08ex6uEnQQn20jA4rCWg8lVtd9YEcxswM4FSd?=
 =?us-ascii?Q?jVU9iFhF9dOftvkrMdQ81Xm/7pxiY6/uRpY0qQ+uc3V6w5lQCnO65QG5LU3M?=
 =?us-ascii?Q?EyCpojApkjEbyzDMpljnL4NHj180W3e56YLD+YP7V9MWNLvi9UvI2GD2SzVq?=
 =?us-ascii?Q?EW9ffs094UxIM+26Zscys8935KiLa/dYYKdK1LG33eFXYECPJJpw2X85705S?=
 =?us-ascii?Q?jHyAhzSDJHIUWPeA5j1cWZi4wdzhFOr7u69xheLUYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9z0LoiMJ8/FnZ/5osrgvsgLOobWmGK+zHhdPCosRJeeuPB4S+JZgVJAO7dBG?=
 =?us-ascii?Q?hpqFJH4OZGF5OXsgLlZBgG1N4nirC+VyLJdz/42vx0BptCukSAJH6qHL2v7N?=
 =?us-ascii?Q?79tWsgZrcoe9CncW5POXNWPZS5AaY5+O2douD59Fq8WWrfkQNSsSAvb7lAnG?=
 =?us-ascii?Q?xJSf0QC8v6GK964mHAY3Lw2Bsiv48YPk54kRaCAAKdtWfsjdJUpr1DRZi0bk?=
 =?us-ascii?Q?MPdh6FLgj0eVGdNqsknRvMtvDfm/ZSb8SDG8h3RI4X/PXwHRt/02JjJ/dcvi?=
 =?us-ascii?Q?3cvowe3UJJnhgh0cKCbtd+N90lB88yzcERF7r6nZzNm68+iklFQ8DBeBpMjg?=
 =?us-ascii?Q?NtUxJ+8kckgh5Fh+q3kb0gCidzQnBAC44isBqqazZ65ATW5O+cveJ54LIOP7?=
 =?us-ascii?Q?/pNsrPRXZSuFNpJamZBmCO8t1cNnoPw2tRs7Fm2uxp2/eGaZGydDuMF4Htcb?=
 =?us-ascii?Q?sgbUA0alpa4cusPdqeFdgBn1t84dW5ZkbDNJDUEoe2zZNDH8/kU78OKnkeHM?=
 =?us-ascii?Q?XwnRCaaGnyoSOZq9caQhVkiGASVgBnWbgxNYV0TPf3L74pE9wVRo8WxnnELS?=
 =?us-ascii?Q?afDq8EHhlinjV+3dkpBtn6aWjD1ZbXkrRm5Dzcv71+/wGxFIj7Ms0+5YPyTL?=
 =?us-ascii?Q?dbSZo8qi/pBvHfxumyCrCWgiaqDyeumlB0QxsK7hzI7mY0ZTC96yEoUZ1zZp?=
 =?us-ascii?Q?AopSFTeq7BosQmXXCdnh6a6ECztAIycar4JymZcDsAp9o+dt2MrdkVRmteix?=
 =?us-ascii?Q?EY3itDUZXogp8G9Qmwo/aNk1bAMUE8R8h9bECCqg0Rjrlo9/alXhcjoirFb4?=
 =?us-ascii?Q?VHeXeLNE+iDOe0u+PLSca7PCZIwBMVVesWDcdhJVrom+y/e6Y8BWd+ijkw4W?=
 =?us-ascii?Q?prMbGNXd3+ejY2QbJLWIcBU5qi5aciWK6+KEMsVIoPev5NRWdoLsJY/Q1u8Q?=
 =?us-ascii?Q?MP3lYCZKDvaoStxw1Y25SZ7q+C1bcow+AGhw0kLmwoRhx85vBAh4WSDASuB1?=
 =?us-ascii?Q?a3wgmeEg18pMCOR9OZNliKBZSELecjJ5Ns0qtEKOpwt/BGWjRD/QyNF/tOL7?=
 =?us-ascii?Q?cBehUQADWWVJAGPkKg2OedsZtAodmBFB2Nsle6CIdhJU3cXkTzhGkDV3dWFP?=
 =?us-ascii?Q?GETyWPNpBDEAhY/sfmpmD9tr7w9jh3ou/Z5UWgqeS1+JnwgV8wBPo3X/rr/8?=
 =?us-ascii?Q?aS67kqgGRIUkR0P4G36BON61NLOw8Yr6vU+/VjPFwo6WT49Gi8HyNS7fn/6l?=
 =?us-ascii?Q?IKqpRsOHTtVMGExDYdVOSobnGjdPSUqIUyhHe9hxbEGuP2tTPJLTKwYkwGW2?=
 =?us-ascii?Q?IOs5hLAZGNuNUeTz6UcYq303ShgavTbUSa3772bC32Mwelp6rShgd0F3NDVl?=
 =?us-ascii?Q?23NHzhl011SMuDv1apKFFp6rFvVwdh4AcwaahPAn3IAnYUdoz55A+jMr5Ipk?=
 =?us-ascii?Q?+BxUKSU3nv2eZG5EMyx7BPbktom5612JzKdrCaLVYy+exycTjn04c+7XJRMd?=
 =?us-ascii?Q?JyO5WVjHi0tG5uqTUnv1YploAPWoiOBy50Pd4A10zwG1ouIiezMKZ6yt6EcO?=
 =?us-ascii?Q?fdwitWzPkXy6zGprMKcOLYM5bZS7+tqTkPKYOM/oHI2T1U7a6qVkabL+vD0r?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffaa9ce2-8ea2-4392-dab3-08dce4c58ce1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 22:40:30.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dHX1lFUyNNGYbeIiYMdf0cP8eg88RSLo8eKhu61hVP5LEDlAIfRNk20jWOsDBuUhTDwdxnbkxdMhcPGxc21LiSrKt+Dqqbbz7IiXTooVTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
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

On Fri, Oct 04, 2024 at 03:05:47PM -0700, Matt Atwood wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Implement the initial set of workarounds for Xe3 IPs.
> 
> v2: correct steppings for 14021490052, 22019338487
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>  drivers/gpu/drm/xe/xe_wa.c               | 49 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  3 +-
>  4 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..7c78496e6213 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -186,6 +186,7 @@
>  
>  #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
>  
>  #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index fb80042cbe0d..ac5a9ae94eb1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,9 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> +#define UNSLCGCTL9454				XE_REG(0x9454)
> +#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
> +
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 94ea76b098ed..91c272041970 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021871409"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
> +	},
> +
> +	/* Xe3_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14021486841"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> @@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
> +
>  	{}
>  };
>  
> @@ -703,7 +738,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
>  	{ XE_RTP_NAME("14021490052"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), GRAPHICS_STEP(A0, B0)),

This is incorrectly modifying the LNL workaround (which applies to all
steppings).  You're already adding the PTL entry farther down, which is
the one that applies to A-step only.

>  	  XE_RTP_ACTIONS(SET(FF_MODE,
>  			     DIS_MESH_PARTIAL_AUTOSTRIP |
>  			     DIS_MESH_AUTOSTRIP),
> @@ -739,6 +774,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>  	},
>  
> +	/* Xe3_LPG */
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca5060146..d17649ebbace 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -32,7 +32,8 @@
>  22019794406	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
> -		GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2001), GRAPHICS_STEP(A0, B0)

The BMG graphics workaround still applies to all steppings, so this
isn't right.

> +		MEDIA_VERSION(3000)

And the PTL media workaround is the one that's A-step only.


Matt

>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.45.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
