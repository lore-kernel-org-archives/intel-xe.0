Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84955C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 15:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784910E0DC;
	Tue, 21 May 2024 15:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CywVhIw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2581610E0DC
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716305987; x=1747841987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fYsMvU8/qvP8vW1CppwImz6ia3NyooBkspRihO7lJ64=;
 b=CywVhIw1p9MFFyCc/9l1mPSKBO2rSbEPoTdYY9n2j7zKP9bjQ+5hEYpE
 oaPOFd/ixINtEFUFWzw+EUvqGatczwrbMgEduEbDUDPBOx+wx6bouQ5u+
 NBVR33tXj+YZfhkD59VMfkne43+yUe/zI57X1q8SxVHa7GpJ/K/onGjRc
 P9WNXB16tDtsz51iNu5j6KIulZahwZoyNMeM/zzVvngDspLAkW9WvQ6at
 c8UcFGUHxA+po1TJAs5Y7fAtCXY7SzDq5Ax5o9/P1WIUmSCzlaIyii8jj
 Ika+OIlp6xwggDKAQDJ29X2VLkwbCvznGu1HTI30DGugSy9tC6GEYBSkF w==;
X-CSE-ConnectionGUID: Qro9VwUXRZ2ry5uxQRGZXw==
X-CSE-MsgGUID: DiKlB0iITEiHlbN2nbpsoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="35020150"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="35020150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 08:39:46 -0700
X-CSE-ConnectionGUID: w+qwiDDQRyex6ANaW9CE+A==
X-CSE-MsgGUID: 7Q7RxhGPSwe+6uPzDL8MGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37457906"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 08:39:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 08:39:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 08:39:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 08:39:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g45597stXCCnGoGcSl6CMxu2KL1AkModMYtjMPIhnWCkLfFdkn8rzEApzb3/xWYSZsKllSbSwT7ns4or9lQ+rf8bSMfzsdzCj0i2ROnoK7mylm2NJLsppBRibbinlD4rkLqLmVRL/sy3nifp7QRWcNtJFddL2GfnoVJVOS7kyEa6VHq8/Jt8gZQewHI3LArP621iES5i3GjSOZM6Q2/YPp/F/wlNE1oWyrd8OAJEUp9e9Hu51qUNONIgtASX63+5UHZk6A865jN252ubgNQt/PDs+0Gh5TUKEXZ18fSPG1CKYkIrvwT8QdOKiC98iSGD++HZl6qEL+TaEaHBz+Ihyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcrckI9nYq3yhfF4/QayQQIpUvOgsTG8TGlZg2L554E=;
 b=nJyt1htH4AeZM9SKqjzcLymDIrCifDv+61T2DzW4RL98l99KfoZQSMWOOGOC9FuVdpgWBxd6LuW7FW2izbQJcyH+C6OOhYQ5FQSU5gK5xV8GzckzYkU5o3uGudd2jkjgzN4GMmdkEesN1XlkEMDv/SCJQIZWehl+zfpN7rJwRw/qNlcbQ8oS2PedD0oeg9XJIRU5aWLUZX3WlToeDs3qnjllwRJrr7BiEPv/F+Z1Kqw9i5silieVY+2TT7PxRWWqf55UEe9poRI5MWxzpoGY/QWDjI/G+wd1QuaT0TElTH4f6Kw7wuRJLDHPVJANqLqY9LPFk/4dEDNXq0uiNvynaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 15:39:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 15:39:42 +0000
Date: Tue, 21 May 2024 11:39:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Enable Coarse Power Gating
Message-ID: <ZkzAO95DC1LXkgho@intel.com>
References: <20240521092201.4183305-1-riana.tauro@intel.com>
 <20240521092201.4183305-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521092201.4183305-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: bb61c063-93c7-4d5c-81cd-08dc79ac3bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSW+oBHp7gj72c4q0qslH2EW9luv6q5URfruoV97JV4NE8vcj7WTO6VE0ZIg?=
 =?us-ascii?Q?oIuwcbmp5pYPX0UGCvg2mIwyFQeb1v2O2qm+02yjEtNNSjkEmb4h9wzQUBxv?=
 =?us-ascii?Q?/QACoCBvpGDb3rYIfwfh5DHqoDtePgJ6bKq18gXQ5vEqJx5MAJjovVQMUizR?=
 =?us-ascii?Q?vZksESZZxuY+pYuLYUVlb2mIHSdS6Sph++Nd3h1wXnolTcr0xZ9UYHb0Q6kt?=
 =?us-ascii?Q?kap1NN421soVO30V3BIisC8RLA36/NqgVc1aACtUD1J8Sh6g1oaHfYtxx5S4?=
 =?us-ascii?Q?SdlFbvCY5FsfRsMvOH33PzdIMgYbVJ8IyMcUeUzrP+YO+CwcPXzaFP22q3oe?=
 =?us-ascii?Q?f1e2uH1LblrBG1omOU318ZA0lhnyu1SQflg43l56tZq6Vg6zGy5H9iJcdCOo?=
 =?us-ascii?Q?N8qo2fp7HJ+eX1BQrPrVIMr26lA/i/aMmJC0HC7vlX9yXYiBkcbwFOgTOYgT?=
 =?us-ascii?Q?4ceXfPVmJx/2NkQ6ISLl7rdqyqOzJ5n9h2Rz9SoZ0XP/j3GlDWnu7vk7pQbG?=
 =?us-ascii?Q?dYgqwJZQ7suZpJzpDqCUxPd2RQTj3abFpAnfvmC/EVdpJF6El70emGhp8l5k?=
 =?us-ascii?Q?lOdraRgQ6gHruj9UH7A7R/D+chbWd3x2eczrcMUbivKmNyQrl8WOksKLKAHT?=
 =?us-ascii?Q?V05OpxZVsnijq4rxqjdAug9TMCbUAV2c8rWGB4FznY+OU/R9rcFrsxXS2TyJ?=
 =?us-ascii?Q?BD4vHm0FbkOz6e7BETIizhlWl/KgmPvZqAIxkFpy+0P73pbTeHqZVokQMqOZ?=
 =?us-ascii?Q?bzwRzqiCVNG8/e77DVQt2xm0m2u5fcgON8oN7OnKVLSp14mZ0Ih+fTJeGa4T?=
 =?us-ascii?Q?g2gVft32M7qeYuPuNCxSDfvQBonqQ9c8hcqrAldTKS/GO0ZH0ZkqIuSHHwnT?=
 =?us-ascii?Q?sxtyAYk9yqkgjBaNT6sSUstA9/oa43s1he9MORSGb9ja9Hf5dHuB0FxMxyJn?=
 =?us-ascii?Q?BVAkgkOLUL5XtS7vRMlFXqJqz1hHlvV/aUR2hlrAEYRXRqj7JolwB1lQg5kW?=
 =?us-ascii?Q?Zt+uRefKu0c2Wx5IwC8QIbHTfU8oy8L2wZ1xYqH+5w2yFhFnv2TWdqAMCMf+?=
 =?us-ascii?Q?4e7Z6rFm5X/iJJ8aLJxqjgk5wOGVa9KRF5qf/uRSNBk1njn92FySdKDM7ddP?=
 =?us-ascii?Q?e+RHpI02rs3LZ5gJC2TVKp0jQwJ0El4LEPvgUVZFoFWojyuTIweXB1q40WN1?=
 =?us-ascii?Q?z1SRba1WsiQi+yR80/VZd3bJ0ruw/XIGXnMW/XyRcVBuZh2Ex8ZzWPDnZYCq?=
 =?us-ascii?Q?NhLg6CTh1EdOe8YyriprnyPC/Onv7zGUFwgLTDxN6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gbmY+Z2Mwq4khysewcR/+y8QuYdFpjcfJt2OahqjXj7ztRFRP+FNSc8jBY3A?=
 =?us-ascii?Q?oSmY48k2MNZb3gG87OiZ+T20UjoXZTi56I2yYY9t0JRTfb5pK7m2RQpZv1P5?=
 =?us-ascii?Q?T/+LhM97Fwvc5NyqHqSoO2aLX77ywuEP67DB+39fpxbBrSNgDptUfnkfBTuh?=
 =?us-ascii?Q?N+S3IQWzdS/yzgwBVXXC6TmNoYmtHYG73UVIyrDYdA4C8PcAbLgaynTs68EB?=
 =?us-ascii?Q?r+4mEfXtL7hxj+msEaCgLUWoK/Trj64vxTFvsa5xSwbFOjTgwa1UO60ql+87?=
 =?us-ascii?Q?zBQaq4lEw+mR98dJ5Obf2RpPPW+/57ZEQYV9KLK3OX0SpJ49njlQukhIiyz7?=
 =?us-ascii?Q?rKwN+Dl0+TGPXHggyNfEhl00Sj0/xMU0LDPFTkypJIWJas/le1reTTLY5NIn?=
 =?us-ascii?Q?xDhCxGZvHy/cBwITixjoRjNYiO3+mFqJRhi4wVGCaLdOA4zHavsXku9wD4MA?=
 =?us-ascii?Q?kaVPcCqKqWyRosC415lOfnJDP6m9QTY1ZNIV4CwsWmvSRYgz6Bb2mUpmJ8zZ?=
 =?us-ascii?Q?grL8xv5DSAaD5rPZIly6E9ZsX8dMPzkAc5fpQh+JEUD3AUF5zwRZcB0rXtTM?=
 =?us-ascii?Q?XHIrCpfmhfaY6vHm4/arU4RZGHmyXEhMuyJnMI5C8wB3gJ7y9HNj6KjpgOJ2?=
 =?us-ascii?Q?dfLQL6Anjz5biofNnbA+Tlk2HRQ1TKuGJnW9VCeEunZCP0tNLrz0GNlQjGae?=
 =?us-ascii?Q?N04UVpPmqyb+7C6nebZ5xq/qsZAN5pHSdTdbFCz3T1K6XRw/Y1PyISjS7DS1?=
 =?us-ascii?Q?zfpfVydA29i86Q/cDlOznruqTFBY/ib7KUqHAkPVpJgHd3nMjPkcr+SD9cP3?=
 =?us-ascii?Q?c+OeynnqIgUnJ6vGSjbwbZpF+b3m+vE1NRpby5acFSCMkNJsZKW+dHm1c+8A?=
 =?us-ascii?Q?cAtks/h3+u3no2rYrvGAoxzXLgNBTLdAbVVCaO1x5j9b6bJ0Lcrgl1TpS0K7?=
 =?us-ascii?Q?hXGNyWvGynMGXLjnEY2dnGu+9JWJK7ggL6U062YFwqRk9oM+xXdY8jBiiZ/J?=
 =?us-ascii?Q?VqJxOnT2bSvZ36q8TBInfyF3L1ppcDmXkLlOLMDHNJ+1kHFtzWgebJqv+r/2?=
 =?us-ascii?Q?+e4ag8V4ZBhRSQPxBHupzXHlQrZTDo2urVJKM+5VAC6DNvG5syI30kpEx+vY?=
 =?us-ascii?Q?NVjJwA5MXoiGeunJRDDR3sYhGJCCUhgYHF0QFSUf0Rv3V9qhuu5V3u3ykugc?=
 =?us-ascii?Q?xqCS6VBaZHIhLldfmUeMRYXC2lJDHVhqD7eDXi80lhIVOl6hmPQtKcDGIxXn?=
 =?us-ascii?Q?B6UZ5mPp/+H2TI4BZoMbnIZE/yspHUUdYZH2maJt2zNU8kGWG4keuIoNEVqM?=
 =?us-ascii?Q?/3ydSqAQ3zceXzLYtn3k1omWD410opLJK37WBNAxoeFxta4tyRcR1rlBNY1L?=
 =?us-ascii?Q?LHjbqtiIzukFFp0qwU6bpSbgPThiuv9vblWhirWeRRwVBDYNBYvnM386lNT9?=
 =?us-ascii?Q?Q+j0KJMEiEcG5g9Rk84tWSq0TpwTgR5ZCD2v6ayIum7eWyI0Jb2xCwc42ZcT?=
 =?us-ascii?Q?d0lJXk2FCoXkYLlZP/OuKoU5KLaOqOBPz8PonM37eSrjMl/tZBuzhkNP4aDE?=
 =?us-ascii?Q?nWbH0sLIbVBxzF1dQf0P9D3tblJEcumTzc71jZinijgAgm/TaJ9po41azRLW?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb61c063-93c7-4d5c-81cd-08dc79ac3bf3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 15:39:42.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXfL+csDvtbJ0AVwbSh9XhA8JcYPMd9b6OGwJWiEuIZVp5m6XrEJx593r31A1SlfJxtUAZWp/TmHj6t2hBqgCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
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

On Tue, May 21, 2024 at 02:52:01PM +0530, Riana Tauro wrote:
> Enable power gating for all units and sub-pipes that
> are disabled by default.
> 
> v2: change the init function name
>     use symmetric calls for enable/disable pg
>     re-pharase commit message (Rodrigo)
>     modify the sub-pipe power gating condition
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 12 +++++---
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 43 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++-
>  4 files changed, 52 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7c173db7d585..1cb0343ab581 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -317,6 +317,8 @@
>  #define FORCEWAKE_GT				XE_REG(0xa188)
>  
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
> +#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
> +#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index e69a03ddd255..1ed6309270cb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -362,10 +362,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>  	}
>  
> -	err = xe_gt_idle_sysfs_init(&gt->gtidle);
> -	if (err)
> -		goto err_force_wake;
> -
>  	/* Enable per hw engine IRQs */
>  	xe_irq_enable_hwe(gt);
>  
> @@ -550,6 +546,10 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_idle_init(&gt->gtidle);
> +	if (err)
> +		return err;
> +
>  	err = xe_gt_freq_init(gt);
>  	if (err)
>  		return err;
> @@ -733,6 +733,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	xe_gt_idle_disable_pg(gt);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_gt_dbg(gt, "suspended\n");
>  
> @@ -759,6 +761,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	xe_gt_idle_enable_pg(gt);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_gt_dbg(gt, "resumed\n");
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 4384f7e80258..a056e00b4ab9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
>  #include "regs/xe_gt_regs.h"
> +#include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  
> @@ -93,6 +94,36 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>  	return cur_residency;
>  }
>  
> +void xe_gt_idle_enable_pg(struct xe_gt *gt)
> +{
> +	int i, j;
> +	u32 pg_enable;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +
> +	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> +		if ((gt->info.engine_mask & BIT(i)))
> +			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +	}
> +
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
>  static ssize_t name_show(struct device *dev,
>  			 struct device_attribute *attr, char *buff)
>  {
> @@ -145,15 +176,18 @@ static const struct attribute *gt_idle_attrs[] = {
>  	NULL,
>  };
>  
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>  {
>  	struct kobject *kobj = arg;
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +
> +	xe_gt_idle_disable_pg(gt);
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
>  }
>  
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>  {
>  	struct xe_gt *gt = gtidle_to_gt(gtidle);
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -182,7 +216,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>  		return err;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	xe_gt_idle_enable_pg(gt);
> +
> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
>  }
>  
>  void xe_gt_idle_enable_c6(struct xe_gt *gt)
> @@ -202,7 +238,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 75bd99659b1b..554447b5d46d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -10,8 +10,10 @@
>  
>  struct xe_gt;
>  
> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>  void xe_gt_idle_enable_c6(struct xe_gt *gt);
>  void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +void xe_gt_idle_enable_pg(struct xe_gt *gt);
> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> -- 
> 2.40.0
> 
