Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94113CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EEC1122D5;
	Wed,  3 Jun 2026 19:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Enem8OGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE931122D5
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780514752; x=1812050752;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aWnVOb9eq32TsNobW8B9/1mYjNh9B1HVhSdqSUMF110=;
 b=Enem8OGuw3+sb5wr+Yf6IXg4s+tUND9di2YWE6TI2iQoH8cu/WtVjQWn
 uP147b6O6/4xGrjNMr5uUILqI8UpUD2anIkQ+KSFlfPDboijKC+VT5P/S
 Kvd8b2YNxVi1IMz0BrUxey7YraaX21JpX6UaFtssRRDLMURfAmL24LyNB
 L8ISajKN+TrVYzhxiL0CkaJ7Dd0rNXX9YjoQ1P3wnOQdDCUoeLgDLBeLd
 xL4d5zGNJhhVfdsPhA6p760Fv77M+9isoHoU7JH9c09ZPIHirua88sXXS
 nTTbMZrAnJ/0GebVRHCM71MjlO1/l+HA2C8VwTKeSrkNnqOWWXOAWuMtu w==;
X-CSE-ConnectionGUID: bs3MR6ZlRSK259ko2NbhNw==
X-CSE-MsgGUID: IdEMLTKLQKWMVB9l3PrHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81463710"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81463710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:25:52 -0700
X-CSE-ConnectionGUID: mvxHSna+R+CggFjNRjhHSw==
X-CSE-MsgGUID: mDoTek7gT0yTPEclbf1A/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239848307"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 12:25:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:25:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 12:25:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 12:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6hVB9XAoqovZxkwHOvS4c4hFLg0YJ3InjCS3X8KybKUa2gX0DnV73TtQkO7m3GCdmYCUlK+9KN5KMjEAnS6Fbd5DCgeKB1ymh4YaPm8+ii87NE1gjZh/9/jj7ykEKIylh3pf2K+qGNc6eF/ylACQMLvY/p2LLu+w04ixNx0T3OcFHyLKTKE5uFM9dIL/A3rvi5WvfJIKQ3JqPfK5SKwaYse+ej5tEllF8SofYaefL7HaXogCxeBd5xS0Ws6opQ8m3gDL8LMzPONHg7rMDWkNf392pZGFvEkltW5UP4EN6lWx0ug9vyBNViwQXYDiDCLD3hAjbneIkQ854m793qgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lSUBkiiEgUfY6oaSsb3dTHpGuMxxp3TsY5ahiFuBWY=;
 b=TxTxci8d4BmjilJxWuPQbuXkxRSZgQELAcNuVaJqsCqegXaEzX3hZnO9A61EW2gydVYX+DiHXrsZRYKcDIKLxeWvH7D7mmnE15Lb5PUqL0nqNnEk+OpxoRtxLq5wqkzRUEs/kgGmgKCtJBbEMWCdxNupWNenECU4FtISB2Jevw2CfphPfDS1Ar7wtKPYDc9gij00KBMKgL+xMdckuVweiaVQFzFiRJaTBMWfVgpomkgxEkQMtsUCNdWfvJoD6g/eOsNrd0WIOvft9Bs5vOlmy1JY1Tx7zR2TOY/TXqMXBnLeE1jXIBO94IJaze2fwhPMsgaIUrCmJNJkd+PpahtLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPFD24E991EC.namprd11.prod.outlook.com (2603:10b6:f:fc02::52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:25:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:25:49 +0000
Date: Wed, 3 Jun 2026 12:25:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Stuart Summers <stuart.summers@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
Message-ID: <20260603192547.GD6262@mdroper-desk1.amr.corp.intel.com>
References: <20260603162619.1550794-1-shuicheng.lin@intel.com>
 <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPFD24E991EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 84272090-b808-4782-24e1-08dec1a5eb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: x27tC0mNtI18PEFDWZc4Oq78K73sOu4Tn5yY8ADaysB32P5BnN/ukYUdqtqZeOUOTd5ZZsJgwzMo7JCnhnMQG5cnh11pbfQejO4OZKlTg5I9Yo4kjok4pi7xmRI7XDTtzMQKL7Hhl5t7SETVVkEygdLsdT8XMNfyU/mvK8acoL63pbRfMUbRlvat8tV5LNNFNdO/y0mYMF/7n/lsPukgaW1HK4YSCFR1RWVjxOxB1EwzxT8IwQM5hoW1uOW8tQu5Qed9D9Iu5dDPFXAybNSK1QoMpCRtQXfE+3B3JlPcOcaLMMlPMa+i+cQg3+yrydGEJSsj1L2F/baJLO6qq2DUfLJAlcfVxVTMxefTPWsNb7c2XLFwIcddN0zAahKgHCFlRkS93LAxcoWfVrt6jsTsjVBNO/AzE2LmYF/aACfHjVTmgLbNupDamyuYHiAEFktBDyFcIPzINAiFzaO/XANWCWLbhTVZTddCCU28U0Olymp4sJ7Wnm1KLD5WCXrToV3jgkLON9jeG0Og2AjcsI/N1bIL7AgNql7yret1935P61BC/odKe14bkeFRIhY5WTXyxrfTDTKysV/uYx5+iz6uGZGiUrGLy+F7b3VQ1gNoknVFHNmsU00LLHJeKcVMdueNgB+u+Y/zE9iwyLZWUVdqtGv7bZAftJEVIR1/eHrD08qkJUpL48d/X8W/7a+W9yk4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBbtt+GC+ys+dNN9U6421XzCJA3Jv5SaDaX07qW7WSVopJELf+ZuJFCRYstR?=
 =?us-ascii?Q?oqzBwK9KQlZb2F05Ur5QyYXYOojDt2G+t7upvsN8dF29qOI86oR5dSygKX4a?=
 =?us-ascii?Q?eQCYIGaKNJrixJRCso72y6MpBXPMBrEi1AH01VvNPhGK1Q1CMV7LlhO9AjIE?=
 =?us-ascii?Q?sNm9u6f4SaqZNX5v04ekJAvkWT8JK8iurCyLl5PKdJHpxZVi/fm9j9UugQ5p?=
 =?us-ascii?Q?BDsiiok0u5zbSAUr94g1JOKnBZZlzIg1U89JgQRQveaQLZhYwu1NoV2nyQP2?=
 =?us-ascii?Q?0MGdqpxIxgLSK6yNAEhDKxp3oRtycCvvS0ewr+e4YZUZTxqYhttjB4wnF3i4?=
 =?us-ascii?Q?chaxND+fZqm3uin8+pF7lOPrSaEuDbJrf3Rag3MsMB2BBqHAsv1MEOxU2Zcw?=
 =?us-ascii?Q?RAugULXcYkF8g544rRD9LH0/eIDJy2nLBVr7R69RYOVrO0jpRMeN0yp6v2YK?=
 =?us-ascii?Q?AanndNqWyb3WQEcuWS5iqKkFYHg3MRBWnWts/cp16WoQ22/tWn/ZCA5oqtuN?=
 =?us-ascii?Q?XyoYM/5JMRtdBMI7VXSvv1HbeLC0Rpf6Bu+77zoLr1zVBI4hx0InflS1Z1QQ?=
 =?us-ascii?Q?kgEveOTDco7veltcZeGeyAwMZ8ZczbXvz9LUoM90f+7KSmfxGSVUh/vcJHZm?=
 =?us-ascii?Q?Y8erQxdKMP0CPugIY86bHf/lHUD/kS17JTlCdvzB25Rxn/5Y+EotK1boWtvB?=
 =?us-ascii?Q?/dRtQX66oHm756/rdd8SOIoD3RFmYKiq4qsqZab4VzcGmvV6QZLQc7CVz5uW?=
 =?us-ascii?Q?0ErZPE19UFmBRqGVZl2KrG7Bqq6LoY4TUTb8OmQrDkSAhP01L/iKJ52Ud0Oa?=
 =?us-ascii?Q?SScaC2gunF4gUNR+M7i+XsxqzuMqV7RRpd464Yep2RRg3z7AXHJ7eUt5KP+c?=
 =?us-ascii?Q?MiS06FrBB6thj7sVr5ul7mK5+kbIlQnDbKOpEE5RLPjY9hc/s+rg2obQ1Vvz?=
 =?us-ascii?Q?sUzb9pzVQxvR7xUo00LWpLZFT4b7EeLt9i8jUJz3/wFps1TpWjuJbYLfZyeO?=
 =?us-ascii?Q?y8jhYH2nlNBsv+N72NMfAgY62pLd91XJiKLFts8BRaJAlBB2gLGWmhWTVHnO?=
 =?us-ascii?Q?rumUNR/5TT0LE/z7+YTwicJz55X36CXNWt6YPUcEzKebsDhcqKcfXV3boz1d?=
 =?us-ascii?Q?k4SPmV2QxSJVyNrxBdg95uxlw1OIQ+h2Q6KHRpUDvKzWkeQRwnH/rIa4ySVi?=
 =?us-ascii?Q?cpsiPuNNKKVtguAxIsuUwwr92Q1xJIAfoThH6M1cswOkoenagTccgWwoJxVE?=
 =?us-ascii?Q?WzB9SPQ0e+AnIamMzMRcEcRHGM2AhOY/dlj5/mZJZ7WjgcJw+KP6re3h/fPb?=
 =?us-ascii?Q?xbk2VULr1aIq2dChd2HgYAoHPwYGEuwHZZ9TlRI7mnyDfhEQG76C+j2Vw2Y7?=
 =?us-ascii?Q?Wh0MsjMqF3gQnv6HK8KQPGma/xLHBwIAx32X0zfiHn8AMKgG6AwnvA5t3mhS?=
 =?us-ascii?Q?U9uqUO1q6UVnHIaWOahTryP2x94aKlr+9OIBZG5zBsw0U5pRxgzZHyVUq8Jv?=
 =?us-ascii?Q?K9gbND9IDbtZhzFcy7g1qc3xTVmy7qLaef57Qf6l1FwNconwsHWgQYRlGPoS?=
 =?us-ascii?Q?N3T9CKlN8/Zv5uxv6jkhfi765urSbnwlMBWlCYv4XlTgMqhd7KxG5FDg5C1l?=
 =?us-ascii?Q?k0PCrQqhMPgIKKzxANRLhhnb4BpFNG1X1ngJNFuSugvrfzXljPGZsYgTqIqN?=
 =?us-ascii?Q?kyzGc/SeeRpWjZpt91aZRl7aP9SCnZpPcb5H+J0vowvJMHLLgnTgxsGDD7p4?=
 =?us-ascii?Q?1p4QIXJUycN+CnQ4OQ/dTIpcLZER6OM=3D?=
X-Exchange-RoutingPolicyChecked: Kq0lBTHFvA18X/HaAJ0e0qyrlaqp0DiTVaJQlNlbOUO4kZ+J5fVi/uRL0NLZcNgk9WCPeW7V0V4YpaC7+GNYNb7Vso4QMhay0QWigAGkjjGirNXMHPYGlTlruNcPh/wXSq9yoV3muMaprt7cIIM/VWh3OojFK4ttOUbEL4LzqS0ftixhLwpa3xS5G3Gm03Jt/RrtPuLo9UMa1WxqzXGOoXe13yd9oExNGndFJiAWtjQ4JXGQnMG+In8PdrApicmUuVb53cxCFj4SV8+b5J2EWhfBvc8rNnIlR9lISVi8AV/YeL7nQC8KrBczSzK7FeRDJQ/jhhKUu1TPOUlfiioL0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84272090-b808-4782-24e1-08dec1a5eb67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:25:49.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rE+25itQ+dEYQMm7+FtLr3akFJHjosvB6jA2Y3VogbeEq2c79EO7OgWl16BJ5DM4VTA96gaZ/0Zi9vlRFxO+Q5QNW0czNqrmpjFjzGoBAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD24E991EC
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

On Wed, Jun 03, 2026 at 07:18:06PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 6/3/2026 6:26 PM, Shuicheng Lin wrote:
> > Replace the per-platform ternary chain in xe_wopcm_size() with a
> > field read from xe->info.wopcm_size, populated from the platform
> > descriptor.
> 
> we might want to update check_platform_desc test to catch any missing
> definitions of wopcm_size field in new device descriptors
> 
> > 
> > Per-platform values are unchanged: SZ_4M for DGFX and MTL, SZ_2M
> > for all other platforms.

Assuming the values here are the total WOPCM size (for the entire PCI
device, not the per-GT subregion), then are these values even correct
and being used for any of the platforms officially supported by Xe? From
what I see on bspec 67090 it sounds like the total size should always
either be 8MB or 16MB for all of our POR platforms?

I think in practice we always find on modern platforms that the BIOS has
already programmed the registers that control the GuC-managed WOPCM
subregion and locked them before the driver even starts up; in that case
we don't use the value from xe_wopcm_size() at all and instead just
verify that the pre-programmed regions fit into the larger sizes
returned by max_wopcm_size().

So I guess that raises the questions:

 - Do we need both xe_wopcm_size() and max_wopcm_size(), and if so what
   is supposed to be the difference in what they represent?  I think
   maybe xe_wopcm_size() was trying to represent some subregion that is
   assumed to be "safe" from collisions with other sub-areas of the
   WOPCM in cases where we needed to explicitly prorgam the GuC
   subregion.  But if that's the case, is there a way for us to probe
   those other subregions' sizes/locations directly to avoid collisions
   rather than just using an arbitrary small size that doesn't match the
   total WOPCM size?

 - Do we even need to worry about programming the GuC-managed area of
   the WOPCM anymore on modern platforms or is that a cargo-cult from
   i915 that just isn't relevant anymore?  If it is still relevant, is
   the GuC subregion the only one that we'd need to program in the KMD?

If we're moving the size(s) into the xe_device structure, then I think
we'd expect the field to either contain the total size (which would be
the values from max_wopcm_size rather than xe_wopcm_size) or we'd expect
the field name + kerneldoc to very clearly explain what subset of the
WOPCM it's actually trying to represent and what it can/should be used
for.

+Cc Daniele since I think he understands the WOPCM stuff a lot better
than I do.


Matt

> > 
> > This prepares for newer platforms that may need a different size.
> > No functional change.
> > 
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> >  drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
> >  4 files changed, 18 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 32dd2ffbc796..f44c031e3553 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -139,6 +139,8 @@ struct xe_device {
> >  		u8 vm_max_level;
> >  		/** @info.va_bits: Maximum bits of a virtual address */
> >  		u8 va_bits;
> > +		/** @info.wopcm_size: Size of WOPCM region for this platform */
> > +		u32 wopcm_size;
> >  
> >  		/*
> >  		 * Keep all flags below alphabetically sorted
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 3165686e3e04..6b7dd8661f64 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/sizes.h>
> >  
> >  #include <drm/drm_color_mgmt.h>
> >  #include <drm/drm_drv.h>
> > @@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const struct xe_device_desc rkl_desc = {
> > @@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
> > @@ -243,6 +246,7 @@ static const struct xe_device_desc adl_s_desc = {
> >  	},
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
> > @@ -265,6 +269,7 @@ static const struct xe_device_desc adl_p_desc = {
> >  	},
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const struct xe_device_desc adl_n_desc = {
> > @@ -281,10 +286,12 @@ static const struct xe_device_desc adl_n_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  #define DGFX_FEATURES \
> > -	.is_dgfx = 1
> > +	.is_dgfx = 1, \
> > +	.wopcm_size = SZ_4M
> >  
> >  static const struct xe_device_desc dg1_desc = {
> >  	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
> > @@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc = {
> >  	MULTI_LRC_MASK,
> >  	.va_bits = 48,
> >  	.vm_max_level = 3,
> > +	.wopcm_size = SZ_4M,
> >  };
> >  
> >  static const struct xe_device_desc lnl_desc = {
> > @@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc = {
> >  	.needs_scratch = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 4,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
> > @@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc = {
> >  	.needs_shared_vf_gt_wq = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 4,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const struct xe_device_desc nvls_desc = {
> > @@ -450,6 +460,7 @@ static const struct xe_device_desc nvls_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 4,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  static const struct xe_device_desc cri_desc = {
> > @@ -489,6 +500,7 @@ static const struct xe_device_desc nvlp_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 48,
> >  	.vm_max_level = 4,
> > +	.wopcm_size = SZ_2M,
> >  };
> >  
> >  #undef PLATFORM
> > @@ -757,6 +769,7 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	xe->info.va_bits = desc->va_bits;
> >  	xe->info.vm_max_level = desc->vm_max_level;
> >  	xe->info.vram_flags = desc->vram_flags;
> > +	xe->info.wopcm_size = desc->wopcm_size;
> >  
> >  	xe->info.is_dgfx = desc->is_dgfx;
> >  	xe->info.has_cached_pt = desc->has_cached_pt;
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 5b85e2c24b7b..35acb878c111 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -34,6 +34,7 @@ struct xe_device_desc {
> >  	u8 va_bits;
> >  	u8 vm_max_level;
> >  	u8 vram_flags;
> > +	u32 wopcm_size;
> >  
> >  	u8 require_force_probe:1;
> >  	u8 is_dgfx:1;
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 900daf1d1b1b..783bf37c87ef 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -48,13 +48,6 @@
> >   * context).
> >   */
> >  
> > -/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> > -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> > -#define DGFX_WOPCM_SIZE			SZ_4M
> > -/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> > -#define MTL_WOPCM_SIZE			SZ_4M
> > -#define WOPCM_SIZE			SZ_2M
> > -
> >  /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> >  #define WOPCM_RESERVED_SIZE		SZ_16K
> >  
> > @@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
> >  
> 
> while around, can you add kernel-doc here?
> 
> >  u32 xe_wopcm_size(struct xe_device *xe)
> >  {
> > -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> > -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> > -		WOPCM_SIZE;
> > +	return xe->info.wopcm_size;
> >  }
> >  
> >  static u32 max_wopcm_size(struct xe_device *xe)
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
