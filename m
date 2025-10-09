Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB3BCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 22:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ED010EB31;
	Thu,  9 Oct 2025 22:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXUcXiiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D377E10EB31
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760049900; x=1791585900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yKMeGB4kWCo2Ou8bgYUroR+oVXMWPPx0sq3NQnD1V8M=;
 b=cXUcXiiZRFWZbbYCzY3iHxgeLSAF6i+5pno9inafXhg1M8Yx3kPsyGMc
 sfp9J6NOI4k2e3KwmAVN1HxcEdS7qoLlQt8O/pyrszk3t5J4gH018GHhA
 gz7DIaU3/p8KyzBl4ma+Y1eyBf3p17nZK5geF/YuXZWJmoe13heKod6Jf
 ztIuqRPCeKfgXkiS3gtVtYg9ldNgxBtxv+2BNgBmdftRiJ95bUEXiUE1t
 X9Jal2YtldfrpSM7iBQdqKUikZVPbW3CZKeay0NxK6FwrMFA//9tiB+YI
 kXje3aZjsLRnIgBGmuzn6iiTqq9YyxjHJPOzEXw7g9M6WMq6Er7vbRiav w==;
X-CSE-ConnectionGUID: mThH+G73RDWJXG+yI8MwAg==
X-CSE-MsgGUID: K1DPRD8lSKCVvzoicV1YxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79712782"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="79712782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:45:00 -0700
X-CSE-ConnectionGUID: wQYXaWxVR0ODa5stUJJkBw==
X-CSE-MsgGUID: aZNhqC8FR8OIBP0kH6aRYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180075903"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 15:45:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:44:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 15:44:59 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 15:44:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+HXYWVsCc6CBW8o/3jXpV/UC7UkciPrGQch9BBp0FhZY0TFxr+wGLfPgjN7EW1+DlDYNg+jcdlww3HEYb8YlthcvbxgBgbxoweBZZRzqZAl3tnmpZ3vN90d70X9wqbaXRkGUkrp1Tzz6WS9WRkqzPbGJhOfF2BvwiQW4TvqYu8qNEyxcTbs5UZY0WSoinoy7fxhOuopuEsqE/dZ51oS9pkqmcDXcEd4LbDDNkcgFJRV+lICcFvH6QsSVYcwIMs4fTo3tqr7+5y4vVv9fa7ovFEFCl5quKfIUYwBVagIvtD4hjn4ToruQDAQhxVpRna0vcsORFveIcFEtwH0iPjd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg/43KSxtf9mL1TFhdRHjLZQm8saGRRPIte+GsT7Ing=;
 b=bMYUMEqgzczAVUMGXmMQ2+Mh3QAwqj0U4I7hSf6aAlLQzy7TwvUk9noruU1xjCmI22UhismJWpTNJCbe6Akf+T+WH8fFHWbK5o3twLINsA9qONjH8IW0b8C1aiz09//lATg3lZ/ZDbJWfNZDjvmZzpqhUJ0KdcdH+JrVSiYCt4HuXPdjehgf2QR6Sk8msS0+0rUFt4FmaqvTd4vakjA4Yh8WTyUeaacSItaUYojOlG3pLiaZEWO6a4zSqxsFYPA4nnXP6EerY1qTbgzIwON9lApXRwVIcPzoukFsxCNq6ucJclSS/fGycnlssF7aKr8F4FgqG/fXphPqTBOyPZUvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF263E38237.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 22:44:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:44:57 +0000
Date: Thu, 9 Oct 2025 15:44:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe: Enable media sampler power gating
Message-ID: <20251009224455.GE1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251009204749.1950689-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009204749.1950689-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d35742c-14de-4512-3062-08de078578e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?teE+y+nvpX7hETDQE7aBPL0ucMdAOAQrkA1KffG04EEMwoMOAx2GY+NIFrQK?=
 =?us-ascii?Q?wO5RPuNyGZ8oELAxfxNCO5upYtD/fl6+2yZALYj8SVFYwrNFFOGbUqdYFqri?=
 =?us-ascii?Q?dBBHilH+z/7rYkzOWuTcTLkNDo8W+94/uYtuD/cOJ/0nYpJLt3wjUH2PM0sJ?=
 =?us-ascii?Q?yLU2NA9yM+TDP1HDfjJn37OxjardSKBPRh7u6vew/AvlbGP4JCZeE48nz/Zt?=
 =?us-ascii?Q?usOV0OAkwUVMoeRrZQJIOH8k5oG2ooPST1XW6v+t4Ukaj1JL9N/XAYICy+fi?=
 =?us-ascii?Q?1dEgLFO/u9LRLJgazvA+WFHovcEJMSzm1Fw8fSJehSx45yFv2Hlsyp6T1xVe?=
 =?us-ascii?Q?Lq6PDJCptJiF5Oo4tSeSSFN8ANsPfG3HHUzuqmnrKLswVuYdXxUgQoCSTu7F?=
 =?us-ascii?Q?tNtPeGLURTuC2H2x/M7dL5aTQEnCbK39EXy2leRLomZwZK51q6BL0MCzM5wv?=
 =?us-ascii?Q?R5aJxZpf7y4b2oZceoRf1vd8/ym5L/0X01EinEqfZItOOTvXdd/ywRjuwKDJ?=
 =?us-ascii?Q?nazaop+nucEuN7Fv9vVU9wml8doa/hTGPW9kft1EEApSYVX6uoWkWwTfVJ7K?=
 =?us-ascii?Q?YefgYtfGgDIR0JyKRHq7nvs0UNDQCNurEl6C/4T0xOypDQ9z0ucWjgU+EDMf?=
 =?us-ascii?Q?FvETMf209R+4PBmEkf0tSKbkFNTjnbaa6hCfpb6p0TidTOfV0hU4C7DViiQG?=
 =?us-ascii?Q?Z4p0V74ZNcH0z8UEwuwPpfr7ryONOzmsHstJSlv2/mSkllw0KiHtSyMsleeT?=
 =?us-ascii?Q?M9vRe93KnJiGGQ/oWx+IiITmVUps/AUYY4lm/6BxulNpJSFHdwfMhj3PbkKE?=
 =?us-ascii?Q?KLLvWE6RURfdtppunCTy5zZRoFq010td8qsaWcpRxoXkwizpE9oO6e2GfaA5?=
 =?us-ascii?Q?CFD+FmO0Hp+AMQRagY+kmU7gRLyHpIOJGv4/AG3OMizvmcf1tS6SU/1YexIN?=
 =?us-ascii?Q?QFtfVwwcE7vTb5GIq+m4QhpInCfAK+t/g2BJb1IAkBjBbewbWsm4z9Le1gYt?=
 =?us-ascii?Q?WxWBdUx07u64v8rlfLkk5VFliFLG5Dza4BZRAAq3PGDbKqd620AVY/W2TLyY?=
 =?us-ascii?Q?GPBBP5Iuo1rbIBP4RSMQHIlVdEW/f1vcLzEhNm64RpSpYngEi0Fi5Q32iBdw?=
 =?us-ascii?Q?Y4h4H244mGZyJNUGgsV1zxtTZEk/AfbgE43gVfmYezMBAEAVjA/2UX3EGWgD?=
 =?us-ascii?Q?L0UvMJ6GRm/6ypqEdqHgzmKE6NOGTkYklVuV8xxfyLfDlloBuuzCNIxFD2Sw?=
 =?us-ascii?Q?vA/940t2ggbfR6TH6kWNP7NAsVsyzJFMGcW4Q1yH4kAueWCDppG2cLDq6d6T?=
 =?us-ascii?Q?SFpjBbe5bpePnVIyvKK7HCQNkzKFgvXsDxnb4QxdHWtOavLxBgT6o81MOnbX?=
 =?us-ascii?Q?cuoagkOo9FBIZhaWF8H9o6G9bETpLbKdxY3jris8e8nV0I/qyV9d7xGgqico?=
 =?us-ascii?Q?inQjd4ieSIf3nE3BtDpRjZIzgD/HwIpx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NcEC+gg3pjhUn/GivZovIyiWB922hkzGkA8E7yv51U77m9OsDQlNVjT9udog?=
 =?us-ascii?Q?hGn/kzVcd9TsD+6r6aMlsyBxedXgaistIF9jQVsLrtz1PY6fxIJU+JN9+Dmh?=
 =?us-ascii?Q?B7NoLJzRinstskEk458g1boYZi9mkaumoSev9Kt5MwS++MY+UYovXVMSfpIZ?=
 =?us-ascii?Q?c5OahzKGUEdeSfVXqXgm+z06U6PHW0YPurhYpxUeLBEupJiu3MgVNHzUa8Hi?=
 =?us-ascii?Q?cVLZI2D5QQ54GFNRHYv1dX+q5mDykiUn30pdHHow+v5i4N1rrABW2ypn4eKs?=
 =?us-ascii?Q?FuXSAJlW3x9JUJsL9Q1EXp+dD9yQ1sa09irCc8eSRe0UwYPrbgtBNIpTOvVG?=
 =?us-ascii?Q?MRzKT4j4+tjOHI6gQjVAG5LZlghh6QETDKOVcRZ+52kq8Bd9N/ez54G6oSVG?=
 =?us-ascii?Q?wTM9O8M/uOh7vp/GsdHInagSP2/mV+nBI/OL3sgOC0ZrKdPjTcJXpPqiBnrT?=
 =?us-ascii?Q?L329DziUfG7r+QxIq+0mORdF8SIF4R5xYQv8nYYt5kcWhdTz++rtdaKMQzbe?=
 =?us-ascii?Q?yeagP8t6lap/Ry/n2xgT0FWwY3uamBc+O0ZUkeRdlxd5VK1ygV8erlz2smB4?=
 =?us-ascii?Q?TEw0wKn07blZf8IGYxH/E41KRvetldWbYVKzOoRFD1+w5NYMUSJNoMSUZmcv?=
 =?us-ascii?Q?ynVb0QU7KhgYdLKKE3lUHh9F7q4TQXJeOl5OO9Y5t7dDXz/sjcjga5b2PJTq?=
 =?us-ascii?Q?HlqZoa+Yeiok/DhwL8HsDhFnb7ZH6PaOHFAnPfYQKImUyAMMubUGDD599hyW?=
 =?us-ascii?Q?V37FBruaCdeftKfg4cvMGML0F98EW7uZii5W+AD6c5EXP6qamWYcO71ZghOs?=
 =?us-ascii?Q?fHI7bHFThJ5g+4Y3gONroWXqQIMA218onTM0z6kp+MqjvcqzNUICL7k4flb2?=
 =?us-ascii?Q?B0aqLJ8dLbl78XFRsOfyWniSzpTRMvPV9JhGb6X/RLK5U21GzXva95XK9jG8?=
 =?us-ascii?Q?FnF8fzWmn6XghpkG/9ZgNTWcYs+JILMbVqXWF8GrkRKjLsAx9AuyJeiM3ve/?=
 =?us-ascii?Q?bocI/r9VkUbmrusHCUKBb7AwLaekK36aAzKvgM9Wdx1VJx7vt6bv3p65tIhz?=
 =?us-ascii?Q?+vq8PGghe1R9MmudXOaHRkPNVQxjRRklmqYJjEqU8y6JlQ05BUM25njKNInY?=
 =?us-ascii?Q?RMV08Nw68vQOP1dOiu4CUzM4p4JUPF9oPxET8dO1OqOtbX0uIqJK3Ct9PeM3?=
 =?us-ascii?Q?I23fDxKP2AMv/jm1x3dES0cbR3fW+jkwBPI7GwNWaRffjEI5D2C7A+3ZAigw?=
 =?us-ascii?Q?r27fHn9CQL5Niqnh61kFtZPcK59PqelgBxBVa2ng0Z2iWTOudikSWR8lQ4Ew?=
 =?us-ascii?Q?/Jde1MP10n6N7HKKuRMcUbFWZgRgEbE72/tb6+Y46akMks+rlUWu9Z1pCFI0?=
 =?us-ascii?Q?ExnX0Zh8ZgNGlStvUv4Ey9wZBIR+SJlt7ScynabVzk4ti8QbGRf13BVrKo1v?=
 =?us-ascii?Q?LPbIzdhuAlwwfJfbfL7oq0imUZa2t3E08tmVJ793ClHNJ4I5ENAea7nSU3EZ?=
 =?us-ascii?Q?6EasLOj9wYxpj2bhhWnE52OQ1PcSBQth6mDiAQiaPM8pjgI9tYbCGg/jSX8n?=
 =?us-ascii?Q?eeNdmdi/euciYD4pNUv2QtnnF28UHVo5u1x4HRoCUJEKsGSfpKCm/fAdoMpf?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d35742c-14de-4512-3062-08de078578e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:44:57.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldR1TEUdaBMjNs0ioXVphq2dqpoRA6WdWnUs7NwJcOBHh6DPFl5aneDLPnK4yBz3muYlDv3mEfcUs+0UTesZZEdl0c1G+N2T2nWklr6p43A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
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

On Thu, Oct 09, 2025 at 01:47:49PM -0700, Vinay Belgaumkar wrote:
> Where applicable, enable media sampler power gating. Also, add
> it to the powergate_info debugfs.
> 
> v2: Remove the sampler powergate status since it is cleared quickly anyway.
> v3: Use vcs mask (Rodrigo) and fix the version check for media
> v4: Remove extra spaces
> 
> Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 06cb6b02ec64..51f2a03847f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -342,6 +342,7 @@
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
>  #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
>  #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
> +#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index f8950a52d0a4..f5bc0d48462c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -118,8 +118,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>  	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>  
> -	if (vcs_mask || vecs_mask)
> +	if (vcs_mask || vecs_mask) {
>  		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> +		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)

This looks suspicious; there's never been a platform with media version
12.70; that's a number that was used for the graphics IP only.

Media versions jumped from 12.55 on DG2 (an aritifical driver-created
number since hardware didn't self-report at that point) to 13.00 on
MTL/ARL (the first platforms where the hardware itself provided the
version number via GMD_ID).

According to bspec 52698, 0xA210[2] was removed from hardware starting
in DG2.  So maybe the proper bounds here are "< 1255?"


Matt

> +			gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
> +	}
>  
>  	if (xe_gt_is_main_type(gt))
>  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
> @@ -245,6 +248,10 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  			if (gt->info.engine_mask & media_slices[n].engines)
>  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>  					   str_up_down(pg_status & media_slices[n].status_bit));
> +
> +		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
> +			drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
> +				   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
>  	}
>  	return 0;
>  }
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
