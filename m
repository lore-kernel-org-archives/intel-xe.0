Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097E1C3DA45
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 01:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540E10E02C;
	Fri, 12 Jul 2024 01:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yp9CqJtc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFD910E02C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 01:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720748709; x=1752284709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lkQw26zWfE0YGiSGyAD7teu+BVXs46AxVG1acGb/Nvk=;
 b=Yp9CqJtcvJJfF6KA13Pb0x5Bsesfi3iYDfz5moOe8L7+D+K0hw3zRvZT
 hrHsoBGe6eF9+Dv54C7gHa1nnqjF1ZcQkyrrTtQ+beO7Eu3eUSuPDD0DG
 qGyO66D+aNrgDboGpbjK9RINBb/nz1u83M0xgy/ZN5ILx5eALbrsfc3QZ
 Mb2cDB7fF3mRHjIG5NKVYaESTa1qAmwjYOIws392eJ936RKTsFaGy6KB7
 zGWUdk82CAWwT44PSn3RU8atDeLui/xzrRyWntgGrBGd2eNufWbkNKgUt
 TBmZV8y1/3K9aWKaCIhzP3Cj7M2I2mEgH3uT9qEbU6ql/FLFg807VJDd3 A==;
X-CSE-ConnectionGUID: GzNN7lrfThq6TdyMsSa5GA==
X-CSE-MsgGUID: 8wTcqi0sRCCdz0O7CWCF8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29323753"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="29323753"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 18:45:08 -0700
X-CSE-ConnectionGUID: GZCCkU52SgONFVven7GafA==
X-CSE-MsgGUID: n4kWuNqLRJmbLfsjzqgraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79873570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 18:45:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 18:45:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 18:45:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 18:45:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 18:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqvSHW/5tf1qN0SF9II3MXRYauMIGln2ufRuQ18CqqinK/6pSejzSHTdhZKHZw1NH/gH5pEiGcQuaR9fxnYH5jHGEnCjsz7plJDTx3jUF7tEulfV7Ml5/JtEM1k44EzYRZkFq3ejKyNnhN9HssWRArl2hg+7shKPYTE5AXN3c863saTseYJkT+h7mcZKbtjXB8LcEO9i8CL5xBm9xz5ibd4HmHc4m+Dc+54Fp2ZUhBJ++jqbixIDNiakjrcFX9+cN/b1+cdLvD1u4aJpRFqC3vW0Apia1w3IIwYgAdN6PTj1RP5WmGDRuCMCbAEfQBf1suCpY9Xq8Idr1Vvc3oWO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0/i9N9Qal/L6UCCYkgHQxgTq+NzwbtU9s1YYJvn4tM=;
 b=javHvi0q9xmPyH+7VnF1iMMFdBZF8RIOj4o8RjzFa4wlYty53Dj0e8UV/+BVMg/8ecEJM3fqEGEiXGW6qas8F52sqjKDC504f4Sb4HTCmNA9PcJKmDDx6UpedYRSW1jNphbqjGAQBdKA6Psre6uVnlwSr6cNGyQFLyDUeZ2eCxksY1LcCqsTGR3ielcM3hzNxFEPtP7gkWiJPKoZCMQWUP/xe4C9iobdAbVYMV07ka06IBb3b8QBr3z9jpd0jzgfj/j3+McMXvSm1wzbV0TQGt8PLZCZK7+iEOZo0D0rB3fF70Z14YNZwLdxYKatpAHtz+IVJRxkTbTj7RGKlq9Xqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 01:44:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 01:44:59 +0000
Date: Fri, 12 Jul 2024 01:44:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/exec: Fix minor bug related to
 xe_sync_entry_cleanup
Message-ID: <ZpCKbDySqjhZTqYl@DUT025-TGLU.fm.intel.com>
References: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 46794c57-d11e-4afb-1f03-08dca2143d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdJgGBE5QjKbAtZZkKGQyl/hNIWcSmdTzPLaPG7KumjJnCE3m4mvS84TAekt?=
 =?us-ascii?Q?yM4ixYmHvWXK7VZJ1Ct7u8ZYLY6n//jdPew55CqAGkK7QGTjg7Dfizs8DgNy?=
 =?us-ascii?Q?/sYzQMWwJPm4UjcmcUm4R2IvLqQ5JHoWkN7QO9vNBAhkw+Pc13bSZXPd+Jfa?=
 =?us-ascii?Q?7mgiSrxFvzc9avqHYj+hsi0lpNTRHCLDA8kCJINQKk8KP/o1NEcGgLtVB/kM?=
 =?us-ascii?Q?YfszEeE2RSdzfX+897Nh0OwI4luJCsTUWrAgtq2o4E/pbOa0dZKqIkt3pae1?=
 =?us-ascii?Q?kC1jsAYhIczwpq1xW44j9xTA06KKn7AH3tPqOOaIx7jdpDXkrLTXgfoa1eWS?=
 =?us-ascii?Q?7/xwYTylrmZLNPV3/42VmQzguUwNcxKhHbhHl7MUxWMEqqJoYhipf5wJrvYC?=
 =?us-ascii?Q?pKoogmMYFwry+YSuob7Ry9OsMK1S3h3XdTQUBBjLEE8npXN7MDdb6no+eo9H?=
 =?us-ascii?Q?wnPq3haRJE6SXvosfuP7VRZ8hNDP5+D/o5VuIRC3UUObBhbtpacK1qv/yy6r?=
 =?us-ascii?Q?ZNalAZxYcRNvj8YoCmNXVl5KZAjDlWnMXzCrRFGqt75N/schtndBI7zK6OLt?=
 =?us-ascii?Q?2AFDJtRKcMIsi5Kt0Ss3Vlqkz0aehMGSeJVStFVKibcCTHXJbdnH2Nen/NID?=
 =?us-ascii?Q?iEdiHakfiw6OwlZelHywUJr0jf5Dn1vn0AYbx8RYEYFW8rJPrsAd59lQnp4F?=
 =?us-ascii?Q?Cro3CUY+KO+mwOuXt6xQJVwLs0Gc2ivlUZPQeiz1vvk58SPRkCwxLmKEBiFF?=
 =?us-ascii?Q?xtlLwitWkJveZySHPgJIlaVuJ2yJnn11KCM8DID7l6pYCRPlADy1WPITmgjF?=
 =?us-ascii?Q?UtBMgS2TUqkCN3pehDzB6bRW8uesf2lCd6l6RjRp8WK4XH5DXrTmwY4LHcMA?=
 =?us-ascii?Q?bEihX8/m4k6+1TvuWDGff68R8YcmUzaloU5NLrCMkcUc09NWrvK6r+5yd6J6?=
 =?us-ascii?Q?uMkDPgL00OleMpzsYHu6oap97BhENaa0iQ2bAGZ62Gt0QDTvrWwxRsuG465I?=
 =?us-ascii?Q?SaTdtofbIAbLcq5/C+ZTcAI+R2oFUb7ZDbynqyKzNLSxUUe6tecwGKIftEeQ?=
 =?us-ascii?Q?sbKI96z452yvA8TU3GfdihBGD6fSpEtjnNG6Rg8fbs+e0leW9ngavYIO75su?=
 =?us-ascii?Q?Ewo0BQHtUb9AJ9dELrH49K1UUuKDnZLJ82At5+FpiJ+KjzJzHUUqGyxzOaWU?=
 =?us-ascii?Q?3LyCMEmNWOkc5nF7FwhTuw9EszfFwAHNYfTCPdGk+WQXlYtFb3BkhkaN3qv2?=
 =?us-ascii?Q?k19XttDI6PjG6HZRxBGHIjgvFyuRhgTo3ggdwUgxXEbUqfGczL2JiC6Br2WR?=
 =?us-ascii?Q?zBDK4htS0U4fqsGl8jXyjOFKRKoSj393Du3/DQIfFL6f0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoCnutZtpE4gU06sat2Rprau1W0Krw4C1ULwgH7Djiu9kC417OF8mwe374eL?=
 =?us-ascii?Q?N657rHe166gV+SBH6v6sxGFmetjozoQvIaUC91NmZJV7W66a7X3KWr5wK2rE?=
 =?us-ascii?Q?RVHTijkaqXv8hGn9gWJT4ErSEexPE4POSjhlWOl+OfkLJhuMdkuo23cERVdj?=
 =?us-ascii?Q?BrS4QkyjNTyCmgWGDeavHLxkFGky/OVt+8Vbz37lyLJdRVZmj7EOSxXs8Opk?=
 =?us-ascii?Q?wsNIX/CwQH0UIpU9enpvIMtAxTDbI7mOUvNlKeA6IB4U2fO9vFmNdAiOzYgr?=
 =?us-ascii?Q?HlPsQEXHPtd2pKST3uNb3qfVux1yalyME1u+1aQhN9WN19QoHOdtw2MEMVyl?=
 =?us-ascii?Q?sVkqguUeqOmJf27BG5fvc/mllovshy4UhWUoxZs5Wk2nSMnQHYiYhMInkpFs?=
 =?us-ascii?Q?5vgFICL/JRdzwqnbSGdeO0EvWMCISPGnWXtmisCeemjuMi5MYoaMJKyy1awU?=
 =?us-ascii?Q?QHKUxRtRzgN44S+RF6WuQRWYBTzkCuwk+XjqUFK8mAsoARwMZWiPZsCK0q9y?=
 =?us-ascii?Q?L2DiXUzWwRr8ibL4Hr8CvVhPaGxZrC1232UojqrekGE1qrgR4fFtHdSaOcZL?=
 =?us-ascii?Q?auS0aKR+JtdXQynFHQsSz4WDPVboNDfSY4rOqGTm8wx3hlzTBUYh2DwuVW93?=
 =?us-ascii?Q?WHBitrTxh4aCjiHkIfkBNBkktuqYYzOqyYBqC2t/Id/1GdKv4t3c127fdQlr?=
 =?us-ascii?Q?peDe8JcggHtBqr1nnnG152Qrvg9alMhIVIOBskmYrspDRGIR0d2v5Ogcu8Ex?=
 =?us-ascii?Q?25VJLugR0XiwoLQRkxDgigILwiuZRxczKOHH0donlYEHTzENkwObAp7pyxEI?=
 =?us-ascii?Q?w5xVHFHoFSqv5l/l2T3iTDjrd7Dgh9xUzuUy0qePTohbZjW6ZgGcQcLXmtG7?=
 =?us-ascii?Q?ke3KIRlT+WhVrC3ue2dMlmiHrJQrn5hdgXCpr+8TUJzhNFC6CcGNsCx//Upj?=
 =?us-ascii?Q?nxVK7Ho4n8sUIFJ+oHixsZy8ynJHMUA2EwpR5Xxkwa6rs8KD2r3X3dBotcMs?=
 =?us-ascii?Q?KlyLG6ZumGm8u4wxWsQzbJDpZHie4KzoTJZr9hbgRYztaCdUVvWUYWvVjiJd?=
 =?us-ascii?Q?zeiAarQ9S5NzCRtui/RHQNltro5vQwKZSefOOZT6Tl0h1nIygImNWowfqH5H?=
 =?us-ascii?Q?OvFxK/Mtk3ow3x5taZC/2A6Kx+l/zBCfDihyCXp9cV28sjNO9btdknvPSt62?=
 =?us-ascii?Q?gq8KH07aIznuZeEkY5SCGgKiWbFaWlOPw+ezzO+tCs154AhKxTTxFhDpbxGs?=
 =?us-ascii?Q?N0N+Uo13374tRpDBH7aPLNkeo+Nk2u2pMkeNwyIPJkSEkFXFs7vBm+7+xcpE?=
 =?us-ascii?Q?ZgOxDLXEzMVrtSB8jKKrDCrwfVZPI6tKbfPJngKX0v381CS3vqDRwh4Uclkq?=
 =?us-ascii?Q?SMCP4ViQ56NrFoPhm4y237K7HuJJl/8cTYFJPx3oDtrotBmQHick4pJrgGEI?=
 =?us-ascii?Q?QGZt7wO/RvNGMwqkqXYvLnvW0WpeQHA08hV4F/usmtHiFjXvagB2gq/RLpCU?=
 =?us-ascii?Q?jDwKyZgTfxauF/kokSG+rP4rO9UdJFq+MuqocGuD2pIAGQTYhLlCepROKwBn?=
 =?us-ascii?Q?tqMSRx1XMaZejeVKnzDhbZEOaLecWPqrNx1AA/k2/NoZ1j/5rYOQLACYzVd4?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46794c57-d11e-4afb-1f03-08dca2143d2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 01:44:59.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asbem9NI05HdpRgOh8I7dtFg8pHb+/hSXxo58fLRoQyF3nIvvBHaBC3+9CqVnPxN85RRU+jaIh0oxaoiKLSROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Thu, Jul 11, 2024 at 02:12:03PM -0700, Ashutosh Dixit wrote:
> Increment num_syncs after xe_sync_entry_parse() is successful to ensure
> the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.
> 
> v2: Use the same pattern as that in xe_vm.c (Matt Brost)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2d72cdec3a0b..f36980aa26e6 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -118,7 +118,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
>  	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
>  	struct drm_exec *exec = &vm_exec.exec;
> -	u32 i, num_syncs = 0, num_ufence = 0;
> +	u32 i, num_syncs, num_ufence = 0;
>  	struct xe_sched_job *job;
>  	struct xe_vm *vm;
>  	bool write_locked, skip_retry = false;
> @@ -156,15 +156,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	vm = q->vm;
>  
> -	for (i = 0; i < args->num_syncs; i++) {
> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> -					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> +	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> +		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> +					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
>  					  (xe_vm_in_lr_mode(vm) ?
>  					   SYNC_PARSE_FLAG_LR_MODE : 0));
>  		if (err)
>  			goto err_syncs;
>  
> -		if (xe_sync_is_ufence(&syncs[i]))
> +		if (xe_sync_is_ufence(&syncs[num_syncs]))
>  			num_ufence++;
>  	}
>  
> @@ -325,8 +325,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err == -EAGAIN && !skip_retry)
>  		goto retry;
>  err_syncs:
> -	for (i = 0; i < num_syncs; i++)
> -		xe_sync_entry_cleanup(&syncs[i]);
> +	while (num_syncs--)
> +		xe_sync_entry_cleanup(&syncs[num_syncs]);
>  	kfree(syncs);
>  err_exec_queue:
>  	xe_exec_queue_put(q);
> -- 
> 2.41.0
> 
