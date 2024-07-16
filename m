Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85EEC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 23:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFCF10E901;
	Tue, 16 Jul 2024 23:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RK7BB2YK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC31D10E909
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 23:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721171052; x=1752707052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bgOmLrVrsgATP5Rd6H1a31b3sa/uvGYgRPim4zYNo5E=;
 b=RK7BB2YKvzRQv31R+MtRANUXp3Jxtmg5OsPZIPuXp/QQmE+WLenSjDn8
 l0Ius/nVXKrhUntisxjFDbVapRd9AcIO026eiO9EMH/wnxB0InwtkHKbp
 M6BBUu7JREY0dK0NeKaDEesI5sddAJCCOIyh88U0Rkrvx1wCyE/qVcYBw
 LjCjA2teEfmqahiDFjCDiLyw+k5QDF4MUFF9VzyT4eUrBu9x4pcGhHaMK
 RP6GmyUzqKWotnfAcMcvFXwwCaugbLHinIz93zl4e3kQOpSoBb8qWBHZl
 8pknsvPaFMg2Pk3+fJBLUROTZrIGG8VtsinqtGYuAD6nbIJa7EadStq7X Q==;
X-CSE-ConnectionGUID: fHTzwrymQE2skkzlJ+OSSA==
X-CSE-MsgGUID: nCiQ5uhWTVCKqqlP2Qje6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18778319"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18778319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 16:04:12 -0700
X-CSE-ConnectionGUID: B4tkb04ZRBCa6YLfiCVeRw==
X-CSE-MsgGUID: FWc/A/G6QImNqAlDEeAZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="55029842"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 16:04:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 16:04:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 16:04:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 16:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMgW6cVJ5zFfE93GGXZZB2v1tPM0FBorFF2CsDuCF2AYeOUThPgKkm4kliUTqy6OA3R1p6079cLvLebm9RI56FMOJDankuuS6Itj6xLhYaN6Ob7SBm7YJZBV3AMmT15P9PRfp863hXj1Xf9JBKtA7PuqHh9+/0aeLY6N4Z0pu8N7tf8JV0yxZGkkPWB3WdwiJDYG5JtQK1gZ9Ib0SbsKtpE0sM6SSJGA9GvrwaAVNcOeTz455a0MEkFW3ak7ZOqKLcOyAw8UYFk6NCViWjXM7CI10JwGaNFin5FPbzXo+yyfRLyU+DIMKljoIVn4zzIQZtooelhNfISJQHIE6obM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC4htIVH/sjcL5MRsRIg4w4AxGWJ9mzhgd45FC1u7aA=;
 b=Jw60wVjkMzJ7Sxd5g3hdxZsHrGsYu1ZdCqBU+WKY5a25oUTfgTvuzl1o00WtVEZYNFfY6n+3SNto2fXu1lh/5TRN0xe0i3Bi/fMAPG7s6saHchiKqFoRwlQDpdqiiO7SJ/+/uMyTSRC9AymdO6nBCErHAjUZ2LYR5S1kzdZt9aaRdwsPanoZXz7DTtt3BGiQlZXqNSFj0NLciy95nU076zUXJcJ5XZcnW5T36aMYq7t5V9TCZjHQWrM8c16x1amWFl3+/NlJ9D6JtMwxkqlGbWzTF5FdTmK/xvmqtl5NBJqR4lOXx8n1j4JpTlIBRtTrC4stbx8bpIeAyRF65fF/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 23:04:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 23:04:02 +0000
Date: Tue, 16 Jul 2024 23:03:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <akshatajahagirdar6@gmail.com>
Subject: Re: [PATCH v5 3/8] drm/xe/migrate: Add helper function to program
 identity map
Message-ID: <Zpb8MzhcjAC9iXbB@DUT025-TGLU.fm.intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
 <810bcf155874734488222a4be7414054d6445b8d.1721170212.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <810bcf155874734488222a4be7414054d6445b8d.1721170212.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1d84da-1659-4915-a393-08dca5eb9542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H4j1OfOS/nQ5bdxpEuNfC739/Hi5s4uOAXerHfi9go/bxy5SM6GW6a+Mk/ko?=
 =?us-ascii?Q?Lz75NwN2o/GhgJTpgViIDcTOfkyUgmnD4FiSkFDlAlAHAgStZgK8ildz0/G5?=
 =?us-ascii?Q?wTHEQBoZJ6QNj6hm0DUKlqufn/h0xnp47C7i3SXWYHJibCkQEcWw61Pbzppz?=
 =?us-ascii?Q?504NtgsU480dRrxbFahRXyIpEyF3ik7J8Sl7q1iwXx2TGGf1+K3E72lUux8k?=
 =?us-ascii?Q?Ila3nYDPv4iv6o6ZvlFqfgjYOvHKjbsmyN6v5vZPrixG5P83Fx508k+kz6OQ?=
 =?us-ascii?Q?4bCkjFpSW6cgrsduwushAbgm+lNleaNZ9kF199HtoWJDmchbJRE1Rb/YDmns?=
 =?us-ascii?Q?HKq2p9HQgkkvQm0+8YEzL/8bUz0yN+puW3i9QpB0Qe/aKqCpqdRQK3Ucv+DY?=
 =?us-ascii?Q?gWQU6jHgWDtNaaXaIvOAwI4qSDlh7GkbQ47+q1QBHAoNeYcmPUFqA0i22oZz?=
 =?us-ascii?Q?AFjTB1T83AfWtQj6zv+ize4ZOvADRQqNJzrC28EvrGvBBZXFrXuUiN5HZqJc?=
 =?us-ascii?Q?tdTEolxDPdDpYTLmK8uI8LB2ztUHxIn6sCOFItTbg1xYcBHp7Mm+ABVEDlk5?=
 =?us-ascii?Q?8X8Jhsl3ZiT+5csFAwhs/p6k4Ozha78AK9YG2raao2U52lCHbN7zDvVNo9XI?=
 =?us-ascii?Q?1pkOczY1H8M0HlUqZjB+A1/e4l0h0kjc0yWErd0vbVeG2WMxkwlqjHhDqW9n?=
 =?us-ascii?Q?DqjjhVl5VvcMHnrFASkI0paClsQ/wHOITdddQEIKYuHojD5hkV2AuyIktEG0?=
 =?us-ascii?Q?bZUQMa5FadrOAjZ5IAFEDf7PHtZtwtQFz8E7AwgWU/hJ9JR33Dj4CTNpIlrW?=
 =?us-ascii?Q?SpaBvFZoNALRRqDbY3+xHPNI3cW94Je+PO52Q4muzclxWDcmWS6G+xJ+vTF/?=
 =?us-ascii?Q?/b0VOeirulgRNgNLFR32u0XHmSP30Vi+ij1MWHRkxvnrSGXa29qTGFe67nBz?=
 =?us-ascii?Q?qrn80Chsg3prh4loubmJl5WOOrp0WV7+a8r61pcT+2ORpJeRK2a9lRHCzwzJ?=
 =?us-ascii?Q?w+dAY6AizvotoEyL+UF9JfJclRxkPJoHeSQswKhKkbTF9ggLxKeIV+n74c7d?=
 =?us-ascii?Q?MmMzc5V7niFeaFW2rWykwlrH3cAobNdkQovBbdMl16owX5qDnhY09Tagb3t/?=
 =?us-ascii?Q?w3FwDi97i5QMd+siJ4ONUpc+uuLHL4xBW+NLmDG/pqE0/MNhbIaAtliSd+Fe?=
 =?us-ascii?Q?rba/RbsOs0IeSpi7hNwlpci08+aq7D+dH46gt+2G/keTcPVkuR4MC8t/+5vd?=
 =?us-ascii?Q?7PJ/Ln/ylfIOKEtSTnWZb6OS/Ne1ldkvVibV8fT9KbRnbEt6J1EfN/KMS7aA?=
 =?us-ascii?Q?0ta23eXmbIhAbaJ02TSenojSlwR6UShRVRL68LSnsZS6Tg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rbpp9CxTg2dMo/Mt0VcmPwzGO4KZSnTGzaOCtr1AT8QpGm75AseB7yVf0bgP?=
 =?us-ascii?Q?6sp/HnVpk3oLlbVEk6alZpFiJk85t6wptjkWSbii/wpTqeS42Z6rld8mHaZX?=
 =?us-ascii?Q?8BXXYyh7LEbDEp3edhPK7hhC1X69Fqz9LXHHf4IFXzX/hq7AlxbXOrY42K83?=
 =?us-ascii?Q?xUBH8XHPvqFaPIsQ04krlZ1owIoBJgqX4tFH4MS6/VDMKAHxcSYEn02pUdOe?=
 =?us-ascii?Q?AS1a1rv8gqWjDRgAp9XiDm9taXifYiSaz8A+48d12ON8Kq6bRaXjtvmqggLy?=
 =?us-ascii?Q?hb9LCvHrmunk9MeLNR6Z9WO+ULlPooVHvNzSSHHllMYyrEMU9mjn8p1ysQpV?=
 =?us-ascii?Q?Uo5pg3CfkIk6hw7HLufY+Ko8And3X4/IXhPP+kQGaf+e82GqbajXpLI0p7YI?=
 =?us-ascii?Q?+AQXcdXOd3H0pTCAwmmnHvGoKgPTgPD5WItBSwfOP0J2X6CRfUqKCRNATrJi?=
 =?us-ascii?Q?+W53ktuNDj5NQXnpjezK89/eNU4yel0V+7t7spUk5Mr4DZOaI1LpjoQCfXSj?=
 =?us-ascii?Q?gKTUphcB4WxPwEWtpHG9iVXb6Npe9gjYC3qpxe0dt+j+WXgjNtbHoQNNVKC8?=
 =?us-ascii?Q?EVYg4XHaETYxraMhDtYvLs7sH4Qnwv3UXRQeR4oLmSuV3d+yRHM6H5k3U1BM?=
 =?us-ascii?Q?LnZmxXF+6/6q468LhpOHKUCrwHCfprkj5ctY9ZSumVzZrHx/Xv4lBDmNrICK?=
 =?us-ascii?Q?gWpofMos7x3M2AU7Bi+e2ONbwMu2qVQ643G3aDV3ATpafSwOYiPW9BvyEV4e?=
 =?us-ascii?Q?gBSmgEsHB8rWnwUKTvqUptTWExcXPeqA12//2/d4sCN4ZYMRfI9M/nbRK1QD?=
 =?us-ascii?Q?R16+ZHA0aOlxDFFCLTOkBuo6ZAsECIXFVyPm3bjhnB9e90QeI67ZQPEVVfWC?=
 =?us-ascii?Q?Qm5ybrr/nApSmdHTVEgFzsAfJs+IZExbL9nt6eVN7SgsZ7mkFTvZJSpND471?=
 =?us-ascii?Q?x8agKX64b6O7V7OTvIwigMCs05pd74lTY4lpFYCcixwDzqmVtIE5iutamEiI?=
 =?us-ascii?Q?yFFaXKf9/EyD9A2pVdkfSbjVse8Wiq7Wv26W0hHEnsslyrNJENzeF8uZZXQy?=
 =?us-ascii?Q?jDYnZE9PEnrZA0/Jfj8VAtOgrZsACmgmTiAVRgR4SPEt8IBDZ08VQ1FrkXjj?=
 =?us-ascii?Q?go1oYm/I5HGDnRb52CEqsWlVbuSn0hfRs9DnEMpMAKxkVWxkyNbKGqRqAIQV?=
 =?us-ascii?Q?Dx4QrDquMvIRGiFCIDh86goNTPSRcNJrdQ1UY3WZXYrxNyVDkUNe4Ks1p/vd?=
 =?us-ascii?Q?51men9ZMTbLV2AHNoVRfS+ix7000zAoLgpvppwzQBl0VP1O8OqV00RVP0Afc?=
 =?us-ascii?Q?agpnn4e8EbfHs0loQ1r7pdGikLoZ3u+pZWsOOF8xDOXxyg49sztiFcCBcgji?=
 =?us-ascii?Q?1wvOhF/Z5cGCWHS0ZN/5etvxpJwkKRjxEp7b7sczxL5HOqGucE8UiK2SChbq?=
 =?us-ascii?Q?yqwsCxn2Cz4uiHWIqnERp0l5wYBBoplOAhGO85cRcnjD+XMR+i8kgNqnIYAN?=
 =?us-ascii?Q?VwZ5Qnd69Ag8wHVH2uaHvbYyHiSCOfC28bHWSOamVfH+x5VdtVDmlVK3t21j?=
 =?us-ascii?Q?bl/wFAuPjxGRTTp1jFhuvKaHzKUzW97Pv+x/g+uKInRo0WV/DW8kJ3E4sKIS?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1d84da-1659-4915-a393-08dca5eb9542
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 23:04:02.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBkKM8hodUac7eP8aNusqko7QLH189y+WSsOf+T3TnvlLKTq2jYY/SiW/g6uCto2jnoBmJG1elxhiFw4yqh2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
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

On Tue, Jul 16, 2024 at 10:54:04PM +0000, Akshata Jahagirdar wrote:
> Add an helper function to program identity map.
> 
> v2: Formatting nits
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

One nit below, but can fixed at merge or in next rev.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 88 ++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 85eec95c9bc2..6b952ed98a51 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -130,6 +130,51 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
>  	return addr + (256ULL << xe_pt_shift(2));
>  }
>  
> +static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
> +					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_ofs)

Maybe a better name for pt_ofs indicating it used to program the 2M PTEs? 

s/pt_ofs/pt_2m_ofs?

Matt

> +{
> +	u64 pos, ofs, flags;
> +	u64 entry;
> +	/* XXX: Unclear if this should be usable_size? */
> +	u64 vram_limit =  xe->mem.vram.actual_physical_size +
> +		xe->mem.vram.dpa_base;
> +	u32 level = 2;
> +
> +	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
> +	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> +					    true, 0);
> +
> +	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> +
> +	/*
> +	 * Use 1GB pages when possible, last chunk always use 2M
> +	 * pages as mixing reserved memory (stolen, WOCPM) with a single
> +	 * mapping is not allowed on certain platforms.
> +	 */
> +	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> +	     pos += SZ_1G, ofs += 8) {
> +		if (pos + SZ_1G >= vram_limit) {
> +			entry = vm->pt_ops->pde_encode_bo(bo, pt_ofs,
> +							  pat_index);
> +			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> +
> +			flags = vm->pt_ops->pte_encode_addr(xe, 0,
> +							    pat_index,
> +							    level - 1,
> +							    true, 0);
> +
> +			for (ofs = pt_ofs; pos < vram_limit;
> +			     pos += SZ_2M, ofs += 8)
> +				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +			break;	/* Ensure pos == vram_limit assert correct */
> +		}
> +
> +		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> +	}
> +
> +	xe_assert(xe, pos == vram_limit);
> +}
> +
>  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  				 struct xe_vm *vm)
>  {
> @@ -253,47 +298,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  	/* Identity map the entire vram at 256GiB offset */
>  	if (IS_DGFX(xe)) {
> -		u64 pos, ofs, flags;
> -		/* XXX: Unclear if this should be usable_size? */
> -		u64 vram_limit =  xe->mem.vram.actual_physical_size +
> -			xe->mem.vram.dpa_base;
> -
> -		level = 2;
> -		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> -		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> -						    true, 0);
> -
> -		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
> -
> -		/*
> -		 * Use 1GB pages when possible, last chunk always use 2M
> -		 * pages as mixing reserved memory (stolen, WOCPM) with a single
> -		 * mapping is not allowed on certain platforms.
> -		 */
> -		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> -		     pos += SZ_1G, ofs += 8) {
> -			if (pos + SZ_1G >= vram_limit) {
> -				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> -
> -				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> -								  pat_index);
> -				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> -
> -				flags = vm->pt_ops->pte_encode_addr(xe, 0,
> -								    pat_index,
> -								    level - 1,
> -								    true, 0);
> -
> -				for (ofs = pt31_ofs; pos < vram_limit;
> -				     pos += SZ_2M, ofs += 8)
> -					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> -				break;	/* Ensure pos == vram_limit assert correct */
> -			}
> -
> -			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> -		}
> +		u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
>  
> -		xe_assert(xe, pos == vram_limit);
> +		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index, pt31_ofs);
> +		xe_assert(xe, (xe->mem.vram.actual_physical_size <= SZ_256G));
>  	}
>  
>  	/*
> -- 
> 2.34.1
> 
