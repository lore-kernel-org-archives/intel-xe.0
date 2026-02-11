Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C457ECD6D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 17:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234010E63A;
	Wed, 11 Feb 2026 17:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vq+l7guI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B324A10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770831980; x=1802367980;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y3/z6865kG9ttXFiyiXKpwadoUshpoisema3xyQf25I=;
 b=Vq+l7guIkkd87X6L+Oo0uoTi7uDYcwkJ/I0WA/5ZoO8ksuBV2Y6al8io
 wGfSls07XhYBY1isS9N22M1VIJxNObrUCWadQe3dI9C8QdmZksSDnpI+6
 edjOErzV/3LjTSdvGSx2Q3Z9MDo7CUuXMFeA6TzlE+rG+N8VKxlOrFVLi
 LHt7MspWalxX6mkTMVfPBEnpQhXLFUHYe1wicoADaaDC0iZb36VSnFpGf
 9/vBZG9zPzUje0q8UXdTlewTT77t+1SOTB62f8QD4BFgiaMu2a1OZpzUP
 IGdcLRqwmpBflnkCjOeUtlLGyih0RvZx641wvykzWe5xDrXQCi9Cbjicq w==;
X-CSE-ConnectionGUID: ViG4SKLLTcarQfH5YeuP4w==
X-CSE-MsgGUID: rEHRRJLuSyOvrH4kCqwCOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71703036"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71703036"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:46:19 -0800
X-CSE-ConnectionGUID: bNg8gM+KRZOHh+uNs9fylA==
X-CSE-MsgGUID: wYHR35RFRN+ZWG7u6QmFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212414894"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:46:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:46:18 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 09:46:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:46:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJgS21pn4Jg5jaU5uJcYh1Ib0XATwMbwmYa2/lTjyMYuHXdFBICcS0rjZAuiZ156tNxyzo7CS93RHFOnkyNaIMMWTaIuLBc0gHKDxfqJEZqpyyfs0xRH6dfnN49i8GLzhhE2FB27jdN5V0+N+93h/sErzzehFKDYI5/J5YFw8e3IxzvVsyp0Kw6l4ivmxplBBveEWeF4H48FuzHbw64PbSaIShM4eiZy+KagyRT7/BLEVHF83ZzD92ACfHnHQnPbL1bxy8bObLOyDxWKgvh7DQN3VBzMRMu1sMRnW89kutFyIAq0VewA93NxtTXDgJ8/GlwUxD2yxtL9lPDC1OL6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGcLIzZ1mtjCQIqknmx1f90Iv24v4kVPsZJ4jkzxGtk=;
 b=ysHNsoT8JvsNUN8ggSDkeiyeOMOcU9H+dvGXA1HU2Y7onOIk9S0mf662IQWfAQOkBxntJXqo9+FHwE/z/p3GaoHT242cyn63NmtptdJXS6nwQzrg/5TmibS4uMvdBL23ravgsbrLZ8M+PXysA2WnneY8qXtSdASmht2oGkLVaX0nWb2u66/r6EnVPfuSduSghJA+K2rGplEYj7uyjNDZEzzq008FwNSuwUL790EGPYGVHeVLvwaw0oSlFHmiyOExxFcIqB/UBmAXhFV+5zg0KQzjwnETFR7fMl2LarN7je9xWD1hOwX5n6GezdxhKeR3KJL98bWlC2WcHKBDAT92Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPFD47FEA206.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::857) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:46:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:46:14 +0000
Date: Wed, 11 Feb 2026 12:46:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aYzAYqWrDkuS1Ro2@intel.com>
References: <20260205111836.1628965-1-raag.jadav@intel.com>
 <aYUfpZOEIHl3i_kf@intel.com> <aYWK6DK4F7qIhsok@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aYWK6DK4F7qIhsok@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPFD47FEA206:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b77554-3bdd-4ad9-555f-08de69957394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WFDyhDEfkKroXRBs9E1YKFJVNkXCGEXwciSBIWHvig1mG4aBU8oK60A9XYrl?=
 =?us-ascii?Q?d9UJRdCzcRjWNbQInSJLfq/SpU17DGzVLAp+T1NrHjtV0F3shi7Fbp/zVyzq?=
 =?us-ascii?Q?RBiRZnPiwsNwkhUOw3WarlvjAqCgW8CdzmdxYdxl/6gSc+11O3NhAwmRiipb?=
 =?us-ascii?Q?v0k/qacTdViW3dGQtcetBRpwS/yGTZKb+2Pt4XeKl42b+4IQK2ZftQahE6s5?=
 =?us-ascii?Q?7kDHJKGp2Agw+LEu6Xv08r9zY81S/+tFQA34lZ+HhZ9BfevaLPRBvvfMh8ZK?=
 =?us-ascii?Q?EvEHCz9XHxWAfcMF2u7yC5AAexl+gGeStS5GL1xsWFIzxeIsWrfOvEA+x47o?=
 =?us-ascii?Q?E2bNvAbc54T5mxaQsGaT8G5QPQomZjW43TFYg09AvyqQaH4Mz8yYGcs8neqq?=
 =?us-ascii?Q?6Y1JuL33yKmR/61Oyb/cBQKVn+h3zQ4avFuA9E61i4Jorb1qFfgNBw8XbGvD?=
 =?us-ascii?Q?IYLo1F+6GxvbG9TUKw6jNDU9M3nEImJze2wOJODLLa5OSngfVhLR7CXOPTDq?=
 =?us-ascii?Q?KZ74EysY1WSJ2z3uYsBWtuOndy7t8C4AupmP4LwG/N83mhK5FKJ5UZsP1u5j?=
 =?us-ascii?Q?ys5P/ZaUV8fDckO8E1kmvu/ax7GjutwNz/psTwE5WOROl5frJOX1qVdagdho?=
 =?us-ascii?Q?NHDzjGUP8EhmKlqqMWSA9LxCWH/F/hKDYtA63Pvst1Dy5jUNPcHKnLSjhmpo?=
 =?us-ascii?Q?irNFG2aRotZ0Kco6dDXFVB77C/SJWUIsvkZMcjCoiaJR1Q4xnaMeTGh1bIJr?=
 =?us-ascii?Q?BgetDVmFk4tl7bvbHw1/pHc2d87bQWfNzsc+VrzRtxnlpf+tJTw9qSitw/dw?=
 =?us-ascii?Q?X2vKJpFtLRi56B36JzWpaYQ/4B0MW7h/GEKrmcp4ojnLoZk3nW4oclXnebGO?=
 =?us-ascii?Q?m8AMU6+Ii2z48gR6xznKEpCCu6njkheojhSWvHHw5DLaeGgqaQNvrZDoVpTH?=
 =?us-ascii?Q?stlbI7x2mdCotNIIu1QD87Fglsu/1lHoE444+35mNV0gqmyiYfHT76d3OxM3?=
 =?us-ascii?Q?K76WWk0s8agp8MrGHNwbXDKkl0rR8MqMfjvR7fMy0AY8r0W/fElsx2LLiNKo?=
 =?us-ascii?Q?vm5aAymGCDkE5E+IF1huy4ZXjzVtrdfzhO7QqQEM2a5+u8+248LojOO2tywE?=
 =?us-ascii?Q?s0EZfs+6SBgwZMEUOWUJsDCkLVVypU3ad5fES4AeGIVZY3brJpx0YFciiXFM?=
 =?us-ascii?Q?DuvuvYklOzR1ECaNWKQxeBzLF2qBvQWpeH+p/BJCH0GmMwfmVY6IXm7RkFNU?=
 =?us-ascii?Q?JQyD08jiWQ6NKYP/LqIY7SWzTzcrkHTONAruCm9bR47Ju1P6n7AcY8FNfVAB?=
 =?us-ascii?Q?RoPXcYrOh5uta8tDbUyyOWHDp7DgZWFzSXwJ6ppmf6I6Zs8OxTLXWeSU0tdq?=
 =?us-ascii?Q?LXtY6r2Sfatl5xkmy7mpsb/0+5+rcVPqzamPlbKRpomvvh3ZtajLZkjuN0O8?=
 =?us-ascii?Q?BvenByBnMIQe4O9fWF/oxGAcaafpX4bElrIb4PfzdoQlI2gh9GnlAMCb/TeS?=
 =?us-ascii?Q?8J4qCqAaHaxusqUe0oD4AG/PXN9lZ+viaPEL1gofJBmero4Aiq2usqotVO1p?=
 =?us-ascii?Q?OFTu5lGIkekVqFvIEPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oNuXOkdA4UWKLm2uV7cxPByySS2fPspeecIN4Dle8UeifoQJCiEimFc9GBW+?=
 =?us-ascii?Q?Gvl/agto9Fag5BOQHq1JtS55HFV5WiqoeZUBO+J48NXTS4hXo1HOUyrtCEKk?=
 =?us-ascii?Q?3BHHf0RbpZkzf09DrWaKg3DIQO+1toOaawFL9vC4trvyRZuLGbBt9i2ulP4L?=
 =?us-ascii?Q?QZWS+6YIf351tGGw3lew3cPwUOKR7SKiimOAcOUa4VtluhSHQ+2nc3y7kznf?=
 =?us-ascii?Q?B0E7hHsG7+GSLRJzed2QGp+rsYO2amT43iYdw1YPsoeDp+jW7IB5lR/vLXcv?=
 =?us-ascii?Q?yVrpXCTQHVUZN5qbOZ9bBSC+VJib6quvGAD+4KdfVylfgY9D6jwyJZ7OGyIN?=
 =?us-ascii?Q?AI7fxPM1WE3+pBuaD1ge6NWaCHsErKTFzTSYTpAYiJbW1hTsXIVq+IKhoK20?=
 =?us-ascii?Q?3qlFWePx0zI59jE7nY4QSy+OszMCodelNpViYi24zLcuprR2/S4TYxy06Eck?=
 =?us-ascii?Q?qByXw6XZjCBf17T5MfBgyukFxcL0WxeTKOz1TCaYNxO7ATUq3KuObEhMrZ5/?=
 =?us-ascii?Q?zycA+Aesn3Qrd4GXW49mC9eIXB7qPfpyknDSZcEipwq546859gkLZBcdsd1W?=
 =?us-ascii?Q?ttMr045icR7PGmzjdAwQm6Cy988945bg8FFWpU+MGOeabJAzP4Nd9NUxDzan?=
 =?us-ascii?Q?WTdT2KzXb/RMQC0zDA5W/z5qkbIhOO+KUTrVgSONhW9ukdLVSFigo1b4Wc4r?=
 =?us-ascii?Q?l3UGPvZLBFsD35JYiCS6gqlwp2Yhifz6y88s01df8rkdviKe1mMWPCdIAwmw?=
 =?us-ascii?Q?uCbuwbP3vfH+1unZMOTPdxRSZzMCTRkiVQWLAoznMrKuS8pqwfkUdWCpPiTi?=
 =?us-ascii?Q?diyUEqbTeH2Yc7eXR77MLTEfeSXT3hfgnTUMm1HTYyE/ECS/LERRKR2EHx+R?=
 =?us-ascii?Q?tJa8stVVbXZcUb+rgTMq5EDxyKlyeH4elK3R7sJOvdAHnbESuLD7CbZrb9qH?=
 =?us-ascii?Q?SgR5E2W33eUcdFaWHoglJS2PXJLK9XQq0jJj5A5szP1DLPIDzRer39Dd/u4T?=
 =?us-ascii?Q?RBWC+Idoq+8OhlrsgvRKNOYFvrEHgOdbyFY+DxhuxC567nEhiMzsFICwzZqb?=
 =?us-ascii?Q?qDSvSD3tEd6XWIbtq0FivfLkqRagXKqrUCbXmBIQ4Z8t6RH+/6/jhoFOs+CX?=
 =?us-ascii?Q?Cqd0g9m+cQnIu4ZE1Zzv4KL7l6nGjGZKazuFEAzPB/A/DkVkxuTjTOyHJIrg?=
 =?us-ascii?Q?Yh1UgAgXmGoZ6sVXHPoLZLBh5wPxAM7YdrJJIrIzaeTQONROMTaxbNh3DNRj?=
 =?us-ascii?Q?PgNb0+8iCVaXIuYPuGm9yUXuZtKWbsJAw884xrYh9kfSU1Vrna7+tRo8VL8+?=
 =?us-ascii?Q?XNW5CoubdhuHBNIj5eIyANhnwbG7Gqo96jf4q8ywzqAanr4RcrXyzNKTgVpf?=
 =?us-ascii?Q?Bxn5XUI7wumKmO3OxXubPuk8D2ZRBAAErijOrZB3qHyzQgINsEyJv9PSafiW?=
 =?us-ascii?Q?VykKL4bPheqg3ehkpc0JdVmIdlIznY6BKxA9xwx5Wx7yVCAjyxPrM1qwAzA/?=
 =?us-ascii?Q?XvUxWklXn0tFV82vbeLpWBeVeTXGKfQxa6Q3RdkDuMvn20YZqiZCkGWt1gGf?=
 =?us-ascii?Q?bbsIe9ScDCRj59GL8bkOBNgDeF9OdjvPqOm4TBraiMelujmnjiK4+1tjsnv3?=
 =?us-ascii?Q?Mny2Yj3fePMixPCEA08anQJI3ovyDSa1VhePVFNhNPTq3mlhhICdhOeeW/f0?=
 =?us-ascii?Q?Mlsj+vNGMYFCp2OWoZ5TWqcDiUpmpmjoi236Ss5YoEg1T1Yx23tYOrot229d?=
 =?us-ascii?Q?f9l/lYS+yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b77554-3bdd-4ad9-555f-08de69957394
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:46:14.7140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5YjAphrYnoHE5gmpwonYsdLtC6tAH8OckkOoyE/JKz+crUgqp9J7u92sbIWh3yf0S6tg6M9p3EZUvEq8zC6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD47FEA206
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

On Fri, Feb 06, 2026 at 07:32:08AM +0100, Raag Jadav wrote:
> On Thu, Feb 05, 2026 at 05:54:29PM -0500, Rodrigo Vivi wrote:
> > On Thu, Feb 05, 2026 at 04:48:35PM +0530, Raag Jadav wrote:
> > > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > so wedge the device without any recovery method (unknown) and have it
> > > available to the user for debugging.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index b1241fa4c3d6..815f0b0c9dfd 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >  		xe_gt_declare_wedged(gt);
> > >  
> > >  	if (xe_device_wedged(xe)) {
> > > +		/*
> > > +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> > > +		 * so wedge the device without any recovery method and have it available
> > > +		 * to the user for debugging.
> > 
> > agree....
> > 
> > > +		 */
> > > +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> > > +			xe_device_set_wedged_method(xe, 0);
> > 
> > but why not using the already defined:
> > 
> > #define DRM_WEDGE_RECOVERY_NONE    BIT(0)  /* optional telemetry collection */
> 
> We originally added this for AMD usecase, and it doesn't strictly speaking
> means 'wedged'.
> 
> Documentation/gpu/drm-uapi.rst +441
> 
> "The only exception to this is ``WEDGED=none``, which signifies that the device
> was temporarily 'wedged' at some point but was recovered from driver context
> using device specific methods like reset."

Well, so, why not to change that to a more generic meaning then?!

'none' should mean, no recovery help is needed. go away user space.
regardless if it is temporary or permanent...

> 
> Raag
> 
> > >  		/* If no wedge recovery method is set, use default */
> > > -		if (!xe->wedged.method)
> > > +		else if (!xe->wedged.method)
> > >  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> > >  						    DRM_WEDGE_RECOVERY_BUS_RESET);
> > >  
> > > -- 
> > > 2.43.0
> > > 
