Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B1CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C23D10E108;
	Thu, 16 Oct 2025 00:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h58wwOLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FF310E108
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760573268; x=1792109268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4+spR9ZXy4rdgJA6j92qtS5NMTI7saI/+CuEyg+syDs=;
 b=h58wwOLhwIkW3teglc6L4K+WFkMNtYy6Z/ZnsIv9gS1WRBbRPffst57x
 hOOnhnCZaHSbR5A6AWPTxu0Wdzbkh6+CVQN+XnHptNPgQC1ZKlRC+v9NH
 +mOW5fAzbqLL1zY0JyOjcJIzAULpJqUgSgH0lXYt/X1c9wd6VtTCOgRWR
 5JE5lKdCPTzehb1ub+MbnzIBdfOS6CfmBlhomOtCo0B5cLIna0dngzxiK
 k+gWViXyn7kORREUxDOBiFSsbaJp4qtFUk10ypY0HaOKCPdpVQ0uj/Yzq
 hi0S7dzMt2mxa7LB08XkGJVG8iA7RBsJlYdI586cfzlUc5PoVZf669moW g==;
X-CSE-ConnectionGUID: ktAVhQyGSnODeFNI7cB8qw==
X-CSE-MsgGUID: VHe76tdDSU2L5QoFfUdw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88227379"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="88227379"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:07:48 -0700
X-CSE-ConnectionGUID: uwhKC95hSqSdpFb8E/cE2w==
X-CSE-MsgGUID: 1kr+ELgbSeuCdnGwZo+rrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="183099806"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:07:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:07:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:07:47 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:07:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWVj+n0Mhj7KcFtwTsT0tJo/T5TLEUpmJgqR2OWOeUE5uMYmUEImzqm544eG37wdQUrLcF16rpJ3K5iXb/S0fcPWp/tuuSAMXfRMzjS3EGANoo3T2sO6oMEO2E5skTrDYIEYkuBe8vWnPHaUdDHMEoQWo2IAqOs8PEL5+lSiXhqmG6V/mREOXGHya4LrkTaZBju7DYMq6feu6r95NWj1GAi2DYl6AfAArtIX37gsrtGY3AVtMqFdguk3aU1N6embjlEZScLcw2h1jr5z5TzgyhfPIjlsehtO449pJ5TVEmYnyntjTMfeZusPDSfZ9lCgz6LsR7QVgxhTnYH+sTCO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vdwszNrRRahdn02nuukqVGlfmipywAdd2Rbi5nYssY=;
 b=kzCbsMPQDvztPAVNRtbrijK3lzCdXt13qO1tlz7ScepqIYSskTI7PRFx8SdoCi3qWdvGFRY6VA7Dx1dOVKtHKNHKnei/lZeaEKXt2LTiZASAETOg1Ntjy/HMXTZw2EcZAzRMqF5ouGw2cjFllUcWlO52r7daX+hL1G4K6+gewp++HmJg77/0BHBj40sAdE7tkc17dTcjMgykpCPsC6th+VJi7cKd7FORCdggfdcjGouNBOcyKJqWQprIB3l7ALgtY8I0upvoLE4x/+BwXJN58I9pV6aRSMYtJmrZqt0H2RalFw0QWCxoRNzyGDZOASOsr03UP6lxEaxh7tNvo8H74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 00:07:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:07:44 +0000
Date: Wed, 15 Oct 2025 17:07:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>
Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:a03:333::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fcfa83-fc56-49cc-6b14-08de0c4807fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d6rAihD1lIWurLuokRW/gEIP3VLCXQXzOdNSJ4buaS+ozFgwAE8a/0/3U8JA?=
 =?us-ascii?Q?eFDSMEbsuu+fu6dZufu7oLm4YsOxBY8WrjgBcPRaQ6X8vjKqvd+OvaV8RaQ6?=
 =?us-ascii?Q?Ecl6IV0uUgjjnEzbaFAhzWEWo9bilX7iDf0CS8T9jsFFfafK9iXYrtSrWR+m?=
 =?us-ascii?Q?4jEItPyKX7dt0jkUIbDpgAQX9RUFApHvdxg6zEEAFQTdBipuTXOE6CyXSZS1?=
 =?us-ascii?Q?vDxFJFuOwR+7e7QXwnmczlrliqUGgCfNZHxjesScHEQCLUaKQ9Lts+htYU8I?=
 =?us-ascii?Q?FHETXiogerSJ4d9VVOYRtRgtICdfGC3vY3S6HU6+7tmnG+QN5thVHSHsIL/2?=
 =?us-ascii?Q?Xmt0KjnAGuDD1dfqmBuY8CmYp2f9UqegPy78zXRKpOtWyUYA36lZwAWjJiZd?=
 =?us-ascii?Q?3XVXZ3KXco9t9iOOu+yoY8EjOPlG3zwe5AhtOV2bDqRjrHy5e6H8KOSX3OgS?=
 =?us-ascii?Q?66l4I68cdKIyZ4QJpY04YVaYryJ941/jfr+oC5N0nPeuxOKhrQToNLDVmJse?=
 =?us-ascii?Q?pIcRlezay5TsL/luIKmnZyPfX8hRcM2o6hmMhwumaLjwdlshuYtwCYnBTzhU?=
 =?us-ascii?Q?cqJYSelkqGNmJM7LoCRAlk/jx6SHfCPqqi7opmhTiHUSgJTyMu4jjOOWFgEa?=
 =?us-ascii?Q?Kyjv98DTnDHbp1km14qD9kb4C2T7nl64tDLNRelNqdR84GPeq4L6MtS4GpmH?=
 =?us-ascii?Q?hr7c4pMO9exqnqKNQU1VVDQbR3DqvuvLQZSkaPgf7aeQYT2XeO6n8tb+b/te?=
 =?us-ascii?Q?bmxKf+/umOuZ43ZlBmuKwMvfJRd7fTH3bbTyYsX0FCihdfeUZ48hUM79VDLA?=
 =?us-ascii?Q?FaL4j4TtZ08vr1et4bZw5c6NXJJccmMIP3C3XpDwL1Jz0oIqvCKL7ukcHWyQ?=
 =?us-ascii?Q?3HiyWayQWczYfyymbhPyJ4+PKR2KmuJzCAhyQ+L9w5/uY1Wi7LCUoCO0gQWO?=
 =?us-ascii?Q?SO+aAjzg0iVkbedEvBxGCSlgqxesAaiype8kzJ/DnX7ULqkvavJiZXsaxScZ?=
 =?us-ascii?Q?EXuVeFHjZwIrBQkXsbgRqq89GMBNTgaYDBwzbbEaocVkF0mpveRmUBENRfRj?=
 =?us-ascii?Q?xMTsqTRIu4Fjmo1uVfkejNlYGCasRvXrOEjJG8bQXFEfpxdIqwE259bCI65y?=
 =?us-ascii?Q?qwVoU/nQVRGZu0uchI3yjU9Rm/bO1RoZB1XvkVIaQ+sbNiHLxSZCEzEPaIHA?=
 =?us-ascii?Q?RQA4g9XP0ygfHSKT5V7jYhwgg6GIA3DJLAHK6fjeI7fK5HP72FOYvl0IX9tt?=
 =?us-ascii?Q?PivfOYH//c+6R1ApJr8hHeCcQ3Nm0puRV28NDSHcX1bTH7ux8sBI0JlCcC6C?=
 =?us-ascii?Q?1hiU38c/PYIVvMnkaFOjUQNXlJ9+83hwoxSDNd/ORrr0PvV1Od960EYsnwrg?=
 =?us-ascii?Q?7zcUxTKwm0VQl2XB+sB5EnSmUxbDURUjSQxXw5VoD74cPofc4i4v6floCpek?=
 =?us-ascii?Q?ZQ8Hn9rGFqJe5Y5k0CT8hRwZ6G7MRguX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SaeSDm90tKSY1FZCjhXcRdRDGno4Bfa1M3wvcOQFNQljLYtD3MZ1BaZ0QS9H?=
 =?us-ascii?Q?+7BcAWlDRbKy8PqwkdHmFPEiWQqU1Mcl59xU+nwfV+9Ptj8bDjUPxUf7bNmZ?=
 =?us-ascii?Q?6lmKkRMUZmZPXn7ZjsTNNejQwVyj73ka0cbqEue3/69WsQiAkQw2uxBoF/YY?=
 =?us-ascii?Q?RrtXaV9egc8NSk33pJ0cBxO9IJBOaVXutlJRJ9IuVG0T0RTF7lUCkUdOqR9g?=
 =?us-ascii?Q?xeBLdCczRntpvmU3ZoYT59iGwh4sCRWp0lhNvWbSqb7Dt4azQiXkqGv1sAGe?=
 =?us-ascii?Q?df359PCv0ih/YRUm5jnUUqo6/ftDU731zVBNvJsrbc697TqQ5ofuuV+TLIlW?=
 =?us-ascii?Q?zyZBt2RujX6Nsu7Jcn/TbhouMriqfv2J+i6lIS4BVgUSAHLEtkm1BV3BdWj3?=
 =?us-ascii?Q?I3d8LJ4uXANy0vM6io3xmbpk+qG6D8h3dYXsSIsadvcej7y1NabX0c+hc0P9?=
 =?us-ascii?Q?qxcDw6+5Z8dcaSqUnh0Co06vK+K+0SSsXaEAAq/k82YTPxFJDM0PX85B1bwD?=
 =?us-ascii?Q?1QLmzDzZRjN5BT1hmYydut1levxt1TnLdCOrxGN45LM+72ykDEUKRRgXygnf?=
 =?us-ascii?Q?zBnmGAb3uPrx4rF+yCZIiWsBgjPYcG16W330dUMxZ8kKZtTSkHuMCjL3jAV/?=
 =?us-ascii?Q?ZzyUCdps3vqWnGz01ycChXbB+LAQ+lPTc4BJYY1PZtzvQeQdr9pn8+cCDEUU?=
 =?us-ascii?Q?ixz96tTswr2OroA+Zt0zj/3UADEnUCyosmwK5XAMWvJQ3DqO2h3U9/V5IkhH?=
 =?us-ascii?Q?1fk4lch/D7it8/SYSaJBWiiWAM7AN4vUO4FIiYTc2ZSJTayrDLoWaFYSrZhd?=
 =?us-ascii?Q?zvniZ1hbTByFGqGwRDzqXD2Mah1Sj3Aozx6TIgO1B1yFKq3Fq9IKltw4ImdY?=
 =?us-ascii?Q?kFw+7CXbRdh+Nnc1uPYoFR9RUoJIeih1AAtmXoLyFwy2hGSSqV4Zfq89WYzh?=
 =?us-ascii?Q?tI0h2kdfCSpd2j+lWa23Jcq9l+SuQliC29aa6pes9San/OKMSga4UffV/SgH?=
 =?us-ascii?Q?d3k1BWW6ziGpK3S4fpTDc6BuvBgmCOSLADnYKlA7o2Tdxd0WplwEjf43hMwk?=
 =?us-ascii?Q?MQVHXPtkYgQe6NQTPcA5rDrKd1WxTcBkq02pKZYCHagfmjgnv241W05yqXqk?=
 =?us-ascii?Q?rA+QbRLFCmhmcDB5hm39UFbm5cb0laveEScZ61x4FE3QxBPWokqMzeH7N/2v?=
 =?us-ascii?Q?Dn2cqARtBqFxtcBJSG4YGBEBPChDdmdP0mGzrtSTsIT0x0qMKFCw4xtE1hMw?=
 =?us-ascii?Q?I2xTZ69+JlnEck05YlsMZkzTYjKPUi63AThUqeFAlofHU+BG3MDOXGWlc3Kk?=
 =?us-ascii?Q?QaUIunE+VWH6ZASU/xwFZ7BDO+iUyBn5LwzTdfg/EHDZWgr+xoP0rRMOlMH7?=
 =?us-ascii?Q?b2RPDjoWJVclJiMXr4oaysAFUvfqbmSsz54rL3e/3bgtyBeXvaDrJiOgE/Ht?=
 =?us-ascii?Q?c70oZO2ZZNWUK2G1zHyeA1IcHqDWIVAB49q65aEuUtrGZyEcMYVZwpvdi9EP?=
 =?us-ascii?Q?XOuBWOe0Jer1ngXN14bolnYUKpX/nNUs0PrXspatqIL5COIDWL0erHkCvn8r?=
 =?us-ascii?Q?1d3UMwfaKS/fTSOLFHA8HknEmMWXTCSTu1waum3IXEyvLVLQxhyajtJJZl1Y?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fcfa83-fc56-49cc-6b14-08de0c4807fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:07:44.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wsj+wb09Iaaix8OzLnacCtBBaUBuQl2ehhfIcT8WPMQp4PhAKHfY/NHdya6ryIkM2UsjmHCAJW2Nnzjno5oCys6tSMkCjJcTzL5Gy10++gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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

On Wed, Oct 15, 2025 at 03:06:34PM -0700, Lucas De Marchi wrote:
> Current implementation of compute walker has dependency on GPU/SW Stack
> which requires SW/UMD to wait for event from KMD to indicate
> PIPE_CONTROL interrupt was done. This created latency on SW stack.
> 
> This feature adds support to generate completion interrupt from GPGPU
> walker which does not support MSIx and avoid software using Pipe control
> drain/idle latency.
> 
> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Rebase on split mask per engine class
> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 7c2a3a1401424..9c46b5fb81412 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -82,6 +82,7 @@
>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
>  /* irqs for OTHER_KCR_INSTANCE */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 103804546b280..ac5524cbe4b9a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	if (xe_device_uc_enabled(xe)) {
>  		common_mask = GT_RENDER_USER_INTERRUPT |
>  			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> +
> +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
> +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe)) {
> +			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
> +			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
> +		}

It probably doesn't matter since our execlist support isn't functional
and we only really support GuC-based submission, but technically
shouldn't this be outside the 'uc_enabled' check so that we'd also get
these interrupts if we tried to use execlist submission?

BTW, is there more support for this coming in future patches?  Without
MSI-X, what's the mechanism by which userspace finds out this interrupt
has fired?  We're unmasking/enabling the interrupt here, but I don't see
how anything happens once the interrupts start showing up.


Matt

>  	} else {
>  		common_mask = GT_RENDER_USER_INTERRUPT |
>  			      GT_CS_MASTER_ERROR_INTERRUPT |
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
