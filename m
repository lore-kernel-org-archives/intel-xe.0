Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A71CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787710E18A;
	Thu, 16 Oct 2025 00:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDhgGLyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6CB10E18A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760576352; x=1792112352;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d/smuR3xSkYNe08s8JzmfrRxyE0MHV9jaNW2+mafHBQ=;
 b=KDhgGLyb7uSw7xETg8kNJG4y7msvhY9oLb00rCkjkd6eIwbvJPXb3xbH
 UMj9onySyvXD9rGUcaCRa0pkWneWxeaAfjnzHp+TeHDM1okGtsHfLZrME
 7QNUDmC01MdiPAdjJEPlRHc96FQpjbNzypAffgIuMCgnEXbim99gMxnBT
 KxlySlUaPMOJT7vKza8BcNHaIVO67Q5kpugp5Zb8LJfDiYDEr3+GpKsW3
 kKwOMl7ltM6LM2eXJFlFFvq3FbV+zr9OJ8yiyugNXMNOTE2oR3o1NfxbB
 /vitKQeSDxbxT1BSJAuwZtFK0qGXHerqEAFh3sDwyOnSld1GkS3P0uoOH g==;
X-CSE-ConnectionGUID: DBsJDt9mR+mqD8Sd1HJDZg==
X-CSE-MsgGUID: JgbMvSbbQYKWWjc9ZqRgGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66592102"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66592102"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:59:03 -0700
X-CSE-ConnectionGUID: Q4lCkPNiS/+A41QddEMYRw==
X-CSE-MsgGUID: XJow6aHvRX+4DPtXghZeYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="187602606"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:59:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:59:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:59:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx7eDk2m//nwcz8NTBHWHxXBbxEwcPWHDBCo3bVdP3sg3ghEts8giPniEG8wdyMInHLhnzz/Ll+7Tzekfu3RjpuKpi18P9YpMh19BowkwF1ffgqA8OkfxM+FGGDA2xEOsTMEubt8Et9rpALZYodThnwRiZt0G8spDxcWFfPMWuYfUwJy9QhgGrwv/6NoWsq5ZSVc7hFUZGPaVQ6r02xqZujD2B0ESQR8JVJ+J6z+W9jESK6BsyuBgE+zbIHb6Ma2RMndenICA/q4/aadekU9A3vc+fi3QsCPbFToS7LaTD2zuwZ5XrWpiOTj8K3pdzHIFJvHo5OO2hQK3T/qcIv3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AlxV6AEE/l2lxN4E89TgVRrk0krAU4BNrR7ldmNZSE=;
 b=dcScTJNoKueXpyQLu0BQYbWlvMZ5+k68Av+Kf6OTvVeh0TPNBOArzwY+JseDQbQR7135FhfxvUHHIPS+xRt3tbmKz7WcP/PyyB9DjwcFIryPCwriJ1FbgTJi5ZhMaVFNpd3D/54qM5A3u3H0z1zCQDhUE8sqRUT1XznPWVvKpXuQalZRMPUQQRCZOI0FAPL67hfuYOtb/HBGEyBnEnYM8OtH6sBHA1sYNp/txUKhe5nt2wJEj06OTeRD3Bng3IVhAa7O11SU2gpTLZzrW4I2ZzHeNOxfc501XzyyHp1ui7+erWftkp0MZD7BClogKpWlEGmZFSdUTEv0aTg4271SoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 00:58:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:58:56 +0000
Date: Wed, 15 Oct 2025 17:58:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/migrate: support MEM_COPY instruction
Message-ID: <aPBDTh2RA33TPaM8@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-13-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:303:dc::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: eada9702-0bf2-45dd-d600-08de0c4f2f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BBZfyK1Qne78G+lU9+6NIZO3dDPxPOiMbPqOiUFGpTdp7R2c5GDBSPM5SCYA?=
 =?us-ascii?Q?/eSgBvjbl8ndk60HJtSCAAqR6avcZnBYbx8Vm6m5KhNdZZOntBrVTYmBfFXj?=
 =?us-ascii?Q?vlyrxnSh/GR83Oub1WS4G6DsUud81VI+2Shl0rY8To9EN2UVzl1Vy96hh5wv?=
 =?us-ascii?Q?INVSKQ8t1ovjVVAYctBoDBHabfR4q1d/TM+P2TEi8yKsKZviM8wlC3oGQt8t?=
 =?us-ascii?Q?MYwsBzcMdx3JdSdlkl5G8ceJZX9UcO+CE/SRurJwLJ8/0HOnwRhPI76Jdsir?=
 =?us-ascii?Q?LoD0HzoxTWxV8TaMLN9LDlfbi8WLTrlpOm6jLRLpKc64PWyIkLtl7C9DwIxN?=
 =?us-ascii?Q?Z/a+I8uTsKb2kE8LBpPUefxW5pHqduzG4KeUH7W9VbAGMEyn6uBDvNoH50I3?=
 =?us-ascii?Q?Lg+0WAYSzXBdRjewROd3edyMfrrcvXeKV5fUoJ06OkvEKzFHiTXEoWzgi+GZ?=
 =?us-ascii?Q?/vDR2lyQ84XX/sLa60sALlCwjxeBykTZI6XEmo0bLvdC6tWLhBbhe+lb0l0c?=
 =?us-ascii?Q?qSy4PLnGKEqyQOSP3t+Qqn3s+ShunygORthhoLrE+vt3AmJNWsZR1h3XQFyJ?=
 =?us-ascii?Q?muQaOm5PkbCw3m5eNkccGbqONUdd4dS5gdQoZeit2VkumHBQtm3ECWPMLDXk?=
 =?us-ascii?Q?SzJ1kvwyBWXgFVxGNKlqhj70aKQplVpKtdRC+3mPS54uBZXURtRCIkdm7QUn?=
 =?us-ascii?Q?tSWxu9Ozyd6l2FumddKDHZp19tv50LWjtddihQDSaqU8S4vDlrXb2tLiOgA8?=
 =?us-ascii?Q?hVvX42GjvitKzCeleh/9WbLZ+e3xqUxsx7tB4GCfdWzUS2VX6osmrl+pi3CP?=
 =?us-ascii?Q?NoKwKTgekiCbh5s1KdkDVpbcQOyOs8t+ga8M518bgvvBpJ8HEJ6fN+WdgpuI?=
 =?us-ascii?Q?EQRyK91VjHbYuRPrvpNrcUu1LmYF05x9Yyxrhd8skeCMgyUrv6hSm7JztAQ0?=
 =?us-ascii?Q?b1JxQrL3PK56s505mMladcTEg5qKk9gm8m3ipsEUWeHZTeWIXux8MvvcDMqr?=
 =?us-ascii?Q?vUkWyQm7df4vao+obyrWcbN4xqmxs+FW5+htIgfQkepm/6o/Cz6T9WlEWBna?=
 =?us-ascii?Q?VLbVYXBapdT16LRl0QtB68Tff1Ev5aq5fNOmdScQeGFPqakouNE/uwNpw6ay?=
 =?us-ascii?Q?KqNpRs4VBFPyTBUFOZ00nMRL67rY0wIIFR+E2cK9Zyt4bLpCGc4a3m4vc6r4?=
 =?us-ascii?Q?vnPZkZg6bjfBezvT/IY0vqueZBuXJXOiTbeVPW+a0k0Fua8yPkkMvrLm1+6K?=
 =?us-ascii?Q?kOmb6BUzD0mgJI2MlU1+oAv3CrLWdX5dlimel/Jo3fAwq4/0NVF4xzcXqRPE?=
 =?us-ascii?Q?deeHiHCNKnWrcuTGMowouZIk3iC74q9H1u1QDT0rtYY3m3oGWTuR1QZSMv2N?=
 =?us-ascii?Q?t5wix162FL2CnvSePtToKaOz9MeYxvH4IxtanNURG2FHmyYR1Upr4vXBCneZ?=
 =?us-ascii?Q?byKq4DA5OhfBmpfncmvvX3DC3C3cstL9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19f0Q5vePcN0vHFvrOYnz1fA1V0z1K1vVUT5V+rs9KeYg8xSIaZryuBFj+Yq?=
 =?us-ascii?Q?nwY1ttDFOu3jf6GFMMjTFsPg4ZJkVuGRgK30uhj2obQE+bFQBTkTy2iEm2WD?=
 =?us-ascii?Q?F/93W91PIQwuHpsW0bS3yAyC+5/JA280nYQHdzu/w6h++InOl/dIL/8YlXAe?=
 =?us-ascii?Q?i/vTVyOR7dCWDg9nf/9TD1vLmU7OpFTInNDZVQjVzR2pvHVd8ZiWsXhsR+lV?=
 =?us-ascii?Q?9bLYWMQ8oC4+EhB4t8EEwoXwgmYkaoQP6Yb0xiM5/6JHWhp1uDjt1pMjCmm9?=
 =?us-ascii?Q?+d8GGLJgk9a88enrl3fItKg/ezYYPJG2vFzv6Bcr9pYoTGSPdHDz2dEN97An?=
 =?us-ascii?Q?TQca/WnrWy0FASVC3Xx7SCzKOtaz9Z93qUtfOKnjPLsOnv+13zLZSMgQMeab?=
 =?us-ascii?Q?SNYsaty1fcAqglCbuO//Pj/KIRH19HnOL67X+MSU0LW0lcrhkeivf7PETRlP?=
 =?us-ascii?Q?vjqBaiOhvNpWpbhY4GZthLkB3UNUOVApAV6yzAK8aEBBWz9CXwhY/0KmW6WH?=
 =?us-ascii?Q?TzQ/HStJkta07tpcWk5q/WVIudqYYBqf2FN18ML9B7CRWZZRU6ElfKiIQweb?=
 =?us-ascii?Q?TkrNjKlUIwIqFTj9Q3BLS84miM4NiPXgueaLL3JqSO8Nz7tZ7rn/N2HEcJR9?=
 =?us-ascii?Q?pwq7jwcUY9YGY88fdNBJe0MRT8cNGFksZzz2TnxBsc3oStJsgiY3OqL6hHx5?=
 =?us-ascii?Q?Akt2X2a+ZHIMAS7nvu7PrmJQBM/0eTXVEuLDj+6wXh0H05q+ZK5g7sPNgjZN?=
 =?us-ascii?Q?TcNYOwplFOPFSGiPkDahVaMcV4RJBHoODo0LtSDwkMlNkI+uoPbzHImiFrrh?=
 =?us-ascii?Q?o7wTKyn6OYnBlnDKlroXm8BDJaCZMGfGTnQc0y1Xd78MF5oVYF8Umma3MWFY?=
 =?us-ascii?Q?DRbAbuc1TRH8SfwqGXTMcsPkWBFOscOFqRwjF1uM8LLzK8m4RWFqNURsW/Sn?=
 =?us-ascii?Q?qQgsr3YsrAyjKA6d8zci8A8e83VoNIKt9Ye0yES1u5x3KAfDbpwb2i0adF0/?=
 =?us-ascii?Q?orheqpO9KjGDJ/Bae3Hoh5QNN5tGs7Vc+xCd5SpQcTRkbh7WSxHFfoawtrB0?=
 =?us-ascii?Q?gGRe8ZcoVMUyJHqOIU43/z4DGthRAFxdL8D6dYpGabegCG+V3pNhu8AN+R9C?=
 =?us-ascii?Q?V+130aH5xZZZALlpWc6xLsD0K52SB0Z3Dr3scWVcsfAp79i6pbJtp49pno3r?=
 =?us-ascii?Q?KGD4hjHy50MAb5ugdrSZ9NYl/tF/f9/zr6zBJrOk7Ptmq6f6pT4qN3HZsR0B?=
 =?us-ascii?Q?35AEv00A+MqIJnDoAaRxZRQHbjtd75m/x5oN/f8Iw4rmfzzVj7BmUXjQ4g4p?=
 =?us-ascii?Q?o6o2fAve1z09TDu8urHcGwxnGE22YkA3r7NMGObn9uRrQ3oK4fMwxodthuyI?=
 =?us-ascii?Q?ANH+gohYRAZRt0q3tPWawZ5eg7HU8C4OZZB404Fz3RLBLm3wAAlp3S2xF3t4?=
 =?us-ascii?Q?pkgX7a7yNm0OJ3jAd6j7sEfgpmEMh3DQsml9j2L5lh3XgPODuaVf1sl2wDJ2?=
 =?us-ascii?Q?2hJTha6mMUKGWoGjFDoCdnYcA00pShopZUalGnAiaPuQQgMWrg14k+WuG9ty?=
 =?us-ascii?Q?02FowxZ7+2YQ5kZzQ+RfObLyppmvtQGJl1DVzuwZbQlPeJhkANRNOpwcZ7Ee?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eada9702-0bf2-45dd-d600-08de0c4f2f34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:58:56.8533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpGgIu2Ca/+bKDnLKO0+bbSs/3i9aMH1oPXGWd1A5uQ1+Ty7u2gJV6awZIxvC1/6ETNCnO3/lrx7vg7dOsiT5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Wed, Oct 15, 2025 at 03:19:35PM +0100, Matthew Auld wrote:
> Make this the default on xe2+ when doing a copy. This has a few
> advantages over the exiting copy instruction:
> 
> 1) It has a special PAGE_COPY mode that claims to be optimised for
>    page-in/page-out, which is the vast majority of current users.
> 
> 2) It also has a simple BYTE_COPY mode that supports byte granularity
>    copying without any restrictions.
> 
> With 2) we can now easily skip the bounce buffer flow when copying
> buffers with strange sizing/alignment, like for memory_access. But that
> is left for the next patch.
> 

How you tested if this series has an affect on bandwidth of copies?

We have some SVM tests which can measure this bandwidth rather
effectively. I can give these tests a try a but it may take a few days.

With that, feel free to breakout the first 4 patches into an individual
series while we explore the affects on bandwidth for th last two
patches.

Matt 

> BSpec: 57561
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  6 ++
>  drivers/gpu/drm/xe/xe_migrate.c               | 64 ++++++++++++++++---
>  2 files changed, 61 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..5d41ca297447 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -31,6 +31,12 @@
>  #define   XY_FAST_COPY_BLT_D1_DST_TILE4	REG_BIT(30)
>  #define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK	GENMASK(23, 20)
>  
> +#define MEM_COPY_CMD (2 << 29 | 0x5a << 22 | 0x8)
> +#define   MEM_COPY_PAGE_COPY_MODE REG_BIT(19)
> +#define   MEM_COPY_MATRIX_COPY REG_BIT(17)
> +#define   MEM_COPY_SRC_MOCS_INDEX_MASK	GENMASK(31, 28)
> +#define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
> +
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
>  #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3801152b7f8f..da1fefb96070 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -699,37 +699,83 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  }
>  
>  #define EMIT_COPY_DW 10
> -static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> -		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> -		      unsigned int pitch)
> +static void emit_xy_fast_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			      u64 dst_ofs, unsigned int size,
> +			      unsigned int pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 mocs = 0;
>  	u32 tile_y = 0;
>  
> +	xe_gt_assert(gt, GRAPHICS_VER(xe) < 20);
>  	xe_gt_assert(gt, !(pitch & 3));
>  	xe_gt_assert(gt, size / pitch <= S16_MAX);
>  	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
>  	xe_gt_assert(gt, pitch <= U16_MAX);
>  
> -	if (GRAPHICS_VER(xe) >= 20)
> -		mocs = FIELD_PREP(XE2_XY_FAST_COPY_BLT_MOCS_INDEX_MASK, gt->mocs.uc_index);
> -
>  	if (GRAPHICS_VERx100(xe) >= 1250)
>  		tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 | XY_FAST_COPY_BLT_D1_DST_TILE4;
>  
>  	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
> -	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
> +	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y;
>  	bb->cs[bb->len++] = 0;
>  	bb->cs[bb->len++] = (size / pitch) << 16 | pitch / 4;
>  	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
>  	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
>  	bb->cs[bb->len++] = 0;
> -	bb->cs[bb->len++] = pitch | mocs;
> +	bb->cs[bb->len++] = pitch;
>  	bb->cs[bb->len++] = lower_32_bits(src_ofs);
>  	bb->cs[bb->len++] = upper_32_bits(src_ofs);
>  }
>  
> +static void emit_mem_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> +			  u64 dst_ofs, unsigned int size, unsigned int pitch)
> +{
> +	u32 mode, copy_type, width;
> +
> +	xe_gt_assert(gt, IS_ALIGNED(size, pitch));
> +	xe_gt_assert(gt, pitch <= U16_MAX);
> +	xe_gt_assert(gt, size);
> +
> +	if (IS_ALIGNED(size, 256) &&
> +	    IS_ALIGNED(lower_32_bits(src_ofs), 256) &&
> +	    IS_ALIGNED(lower_32_bits(dst_ofs), 256)) {
> +		mode = MEM_COPY_PAGE_COPY_MODE;
> +		copy_type = 0; /* linear copy */
> +		width = size / 256;
> +	} else {
> +		xe_gt_assert(gt, size / pitch <= U16_MAX);
> +		mode = 0; /* BYTE_COPY */
> +		copy_type = MEM_COPY_MATRIX_COPY;
> +		width = pitch;
> +	}
> +
> +	xe_gt_assert(gt, width <= U16_MAX);
> +
> +	bb->cs[bb->len++] = MEM_COPY_CMD | mode | copy_type;
> +	bb->cs[bb->len++] = width - 1;
> +	bb->cs[bb->len++] = size / pitch - 1; /* ignored by hw for page copy above */
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = pitch - 1;
> +	bb->cs[bb->len++] = lower_32_bits(src_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(src_ofs);
> +	bb->cs[bb->len++] = lower_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = upper_32_bits(dst_ofs);
> +	bb->cs[bb->len++] = FIELD_PREP(MEM_COPY_SRC_MOCS_INDEX_MASK, gt->mocs.uc_index) |
> +			    FIELD_PREP(MEM_COPY_DST_MOCS_INDEX_MASK, gt->mocs.uc_index);
> +}
> +
> +static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> +		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> +		      unsigned int pitch)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (GRAPHICS_VER(xe) >= 20)
> +		emit_mem_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +	else
> +		emit_xy_fast_copy(gt, bb, src_ofs, dst_ofs, size, pitch);
> +}
> +
>  static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>  {
>  	return usm ? m->usm_batch_base_ofs : m->batch_base_ofs;
> -- 
> 2.51.0
> 
