Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A534FC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D410EDF8;
	Tue,  7 May 2024 22:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMApAqpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921EB10EDF8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715120417; x=1746656417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B0pBzo1/6l8QVb4vnRDB6/dX+g8s/B972wrmaaRz09s=;
 b=XMApAqpjMphXM9+VMlMSmo2T3asfFr734Tkl++jdGVsv6YOjtZwPjrFo
 HLlHujbKdMz9y13tk/WTP4DlD+Kuu36mgpYLNBxsSpqA5wLqCYTXnnl0I
 VzDd7gWT8UGhhaXa+9LOV+fLl+kZcJaUMGXl52/cHDgJhbkezshJYFz5K
 c4tlBUysjXjpCEqR85bupftSqeOy47ZfKbLW4zZTGBHcxlaGuM3p4bxlA
 oWAlVVL+Ro8s2S+LilTrrqydTQ42iMjq/mMfzJ1AwikslJdBw731rf0aS
 MTm47GJXOYZoFoY40eo4zbdtbUUygcCl2qHz8P6h51go5EDw1SI78Uoze w==;
X-CSE-ConnectionGUID: iq/2EBldTtC85F/OSqhieg==
X-CSE-MsgGUID: v3GqjWuZRDKoaPiyXDuh+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11416553"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11416553"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:20:17 -0700
X-CSE-ConnectionGUID: 7yy73xlnRCyM/8nNabf7HA==
X-CSE-MsgGUID: LmEhwFJkQPCuKmnCONO4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="59832548"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 15:20:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 15:20:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 15:20:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 15:20:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb1ORR7sjICXcdh4QsEKqsaw8LZyROrUp+u8vX+z6wNCPMBE1kU3EHw3zkF9Z9HiYShc94KyB5gGnzPgUJjvQVXAAf4H7iRalqL6LYNGsOXcZUo6csQm/rmxkWno/7p4ebzLAxmzGBzfGDRM7jeF0n4JfPGIwxoRihzZxSq/eL6h+fKDVn5+8h7AoDNemH5mJeIa6pLSV5HTscBdVU4dDXAy/ih+K6d98yK69DKlRS8Q8nLNFZjmim+t77eaRAUv9sYnXtBXr4iHl5nfKSXREIoI2A4bvugQUD6EYUpKLfOnMhoLZciNeEEFfEmuMmbwNSs0uLOtR1SqudQZ/n4ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8p7jKTtvS39vR7TMH/tB7CJ+p6rteVMOm2DENtL/FQ=;
 b=f1AKuV8Ihk/euwVXe86c5mvQ8PUk2jhM/72n2C0SKDkWbJsUO3K2NsS4spyA8xo2H7SQstPzGMrjtH8m+MHaAjEnkapXaYDX4nepLQ89K9OA3klHKwqrcGVU+b8BBXXbp5li/rusI7P5zaD4v5744rPxra+M+fp2kM9fUGDy8SbrzeB6d7FT/k0UxTTnrJ6hNhSPC105gupQ2LSt16kWytU+ZKPp9pvEuruG27F0K0lboSANG6BYIC5Qz5Pwq1XQcU/3Pmh1STe21E5zcmKbBqdk8e+Ox7mao7eEW++E3OHFQiKW57HdJ70Paz6y2K/YS5VBntH4pCt2k/iJgpkjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 22:20:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.036; Tue, 7 May 2024
 22:20:08 +0000
Date: Tue, 7 May 2024 15:20:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/xe2: Enable Indirect Ring State support
 for Xe2
Message-ID: <20240507222006.GG5615@mdroper-desk1.amr.corp.intel.com>
References: <20240506171111.16280-1-niranjana.vishwanathapura@intel.com>
 <20240506171111.16280-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240506171111.16280-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR08CA0066.namprd08.prod.outlook.com
 (2603:10b6:a03:117::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d1ee45-0927-480e-3b1c-08dc6ee3dad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UgY0B4FywiiRYjhN3BOkoIpnczygC8Sf/Ly4pGouUf+Rzx98OXTU4u7AlXTM?=
 =?us-ascii?Q?e5YuhxTB9SFUdWRr0Ul7l6Pi3W2pBf2P/nSd7VGVfv6JqLoSOtc2R8YNykq2?=
 =?us-ascii?Q?PRfRcMQSsgRp0bxR/HPIrlZ7XGedqGgeNWTUO6NMiinCY/OjxwYbJi+WeI9b?=
 =?us-ascii?Q?ZbOX9M/Bkdb/lmarbTENrjYVmeew2NDi707T9P7kVLfmuXuCQBvyWU2CoIpv?=
 =?us-ascii?Q?N09u1migBUklDLF2qdssuIZSlfrrVYJ85A2F6LALlF7la9e177oqo/sMn0Ql?=
 =?us-ascii?Q?B4Od9m4kIMEknoZ9TBk2th4NjxmnuaymG28E4HlMOSqR/Bxo9vOAD/Pefz6T?=
 =?us-ascii?Q?K+JCH94vKrWCI2hKBqtigR+dcheDtEB2de5IR1OL/olWj5wnKFgJaB5Uyp6u?=
 =?us-ascii?Q?I5HELX0n1SUyaZE3oeJT7VFAr3rA/HTSa4aRM9MrSTCvZxyfZlrLVxoIeUPm?=
 =?us-ascii?Q?lzOJCnCxjROYpL8U6YCki5G1gCamj7/0KSAfYevszLvbrdT9gzv+Ql00jcwg?=
 =?us-ascii?Q?zS2CuT1XNZs3KQAIv9KuNEJ6sg5Sn7T0txmgsDs60Ebhdqmb0Dug03yOKMzM?=
 =?us-ascii?Q?+0lufJGVIDzQ4JJK03H7j70KDyPsA68MhlSUnWPqPnlrdRJBN+Js3xcgd08E?=
 =?us-ascii?Q?ApL/DFJrh6/G6SuVYXHDaD29V63leva5hf1hoN+zosTacWLJxSqVEQjNGhcQ?=
 =?us-ascii?Q?ANjsLxcan/O+OHKBtoJzc2D93ZMxcgG3ClN2HUKMJusu/YE3pHH8sQ5Zbs/D?=
 =?us-ascii?Q?aQW6S2R7tz/RBILrv5SAE175/xcCJ7EhthAlepp5rlnsiZB2c/a8WnptSSiC?=
 =?us-ascii?Q?huUdjKwOXelvdxEGN5jD2Yxv0bTAKgQR/h5jDpmnFzMqV6mkOEDHMvfmIsmI?=
 =?us-ascii?Q?ZluYnkYpb6eUTH6uGcXeuK9BNk7Yl3cnapWN8s4Mjyhvx5MESWWXBEo5wku8?=
 =?us-ascii?Q?0+CAkhdEnd7Tl3LOz1pndM7cJ08mq4YLekYm82mNN0vvuNT/JmKVekgygF1S?=
 =?us-ascii?Q?2v2aBRrOhJ2xh1ioYZqnX7V0GS/IzgHXC2vdJMr5j42M8wgqcyLIfP8Oru4Y?=
 =?us-ascii?Q?vJfAJTFwcaSL1EXq2WEdnZWpsrqNEbqJCWPpjD13QSKkePNR+4RORbYQPfg5?=
 =?us-ascii?Q?g3xS/ksxI88pUiAqXCP94CZ5t2Aby2xjvDbq04PmmoAQ04i/rt9uCbaZu7+V?=
 =?us-ascii?Q?6puuqPe3W6LCa+WZ+2C1rxpAyjie0/S65fG7xYnOpjNf+5qWgV7C1V9D/DkZ?=
 =?us-ascii?Q?GbFXDQ5+KShDbEe2JuWcpc38u0goMYt5DbWNITFoKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6IyEYj/PCwo2kT5mUYYV/bsEomr9nPUehu2/k39/iy/pVdTK2pf0R4OFr6R2?=
 =?us-ascii?Q?oN6WDIF4VQAFXh2QAZBKkD8XgffppcoyG6zKi3tEjnz1pp6ZybNHkBonR9X5?=
 =?us-ascii?Q?AsRiIREBfPAXtYMPvmlkO4FMY7h2PuznRwQkKSJVGbRsZKjva3R5S1/lPKyb?=
 =?us-ascii?Q?5mfPD3xprc9aGPulDDhJv2IvghK1glF4Ag3wO33rERM8+4Pg0+YbR2gpyhrf?=
 =?us-ascii?Q?18RFSiD/5qAOrx6i/9aRHrvC6/FOCx8bVwfKXRB9lYZrR3klNVN9x0JdZ6O6?=
 =?us-ascii?Q?0AWt5tlLYHtRu3vG6P7gEEalEUjit592sMUP+4ZNlnft3UMypOceTVBz2FbE?=
 =?us-ascii?Q?XM0HB3AM75DdAwAN0voPXywAz5/iI/4JkGOuGZPWhtivCypRk5cJ+Mx0Uf/c?=
 =?us-ascii?Q?pDrOTmb+W3bkbtO8jpgpD4ah7hdIJASELgzg9zaUgj30jdqOLfnvG8qh9RjV?=
 =?us-ascii?Q?38HQgpiUqgpx6ScmssvdHP/k3JhhMh+l5TPRJ2iuFX8JN1sDIG8VUqHd9grR?=
 =?us-ascii?Q?zDF4fZkTb3WxOUCsPTC3T8zXHJ1C6tuI8lxXF8w6cH21fnQow/mfIPBBxWuJ?=
 =?us-ascii?Q?YiOf4AIhgxDlJTljAWDdbaGmJXHsDZpq8EicffZ+8MXS5V4xa1wFRZyQpkUU?=
 =?us-ascii?Q?ftz0hrGPHpymV6iVbeJnrCcyJSJu9Bg9Tx9L8gHw5DTxzpOdiwvjy52pxfU1?=
 =?us-ascii?Q?ay5XAf3yhcLc7Ks4ZgnmAw54Z91kxm39HGMmddj/lXhjKuGs43BxAeIGjSS7?=
 =?us-ascii?Q?c9umhRN69og1lHpab7o04Qn+nhJMUEFQk5hn4BqVmCQ7Yn4feXufLIGHA7ph?=
 =?us-ascii?Q?4VMyMp5Brpa6Er//QfsKZBvaTgjV/OtGmpbNY9YW5yvyxDE1GEvFsBISqYAO?=
 =?us-ascii?Q?wwW7Xs1Co6lyKI76S4iFDZaMWldjlvkm8IWvBwE0MyFcw41VRRa6nCEYtczd?=
 =?us-ascii?Q?BenqYmA+rtTq/8SLyDPSuJ5VEv1yfZvbQa1qnqRD2v85QNHlXT+50f865mp+?=
 =?us-ascii?Q?bbktb9za2OTW8TiGplxlNdLHKGA/kGbAeFMmDdeFN1mjDOTS/LU1pzJYeBqr?=
 =?us-ascii?Q?4pOIdxetheGHWWn7ZSfgr371eUOgp7FnH9BkZ/hIImzc+8WuyhS6+KYp920W?=
 =?us-ascii?Q?jOUncJ3dkw/Zhd8T9b8eMdq3ZVaF+q4o1ooAswsfk6ZHCkasjxdbVsPM1c8l?=
 =?us-ascii?Q?Hsc3lkqNQ+Q0oBvPVvLdhIWrWd5Yd1kP+2vFwYvlLKpYKaDri6uQexo3dpeN?=
 =?us-ascii?Q?ExqmrLfMkgHFFbPJc4sC546GNBT2OxKSuC4XQyLk7K19CouRpScGrhmPAu6b?=
 =?us-ascii?Q?1LqlziGEE009OGymLE01nZ5IQVlKHFPg9MXELftcRcZl/ovEKAMtbP/3BHq3?=
 =?us-ascii?Q?y2ghhGjKnag9P1nmVuJZ4o1KgK2lohy7jWlJ+Uy0OxWb+DBVYeevE4FFV+/T?=
 =?us-ascii?Q?UsUhMJX493TmWygTuSPsw3fSQzkgDbEBR1MCB3ogZz7AJqsuKUupHEwJ1gvj?=
 =?us-ascii?Q?s4CgTSTLlPduORDnT2ihCcbKnAnzFx7o3ks0w6dPgclry6lkEAS6eaKddGwJ?=
 =?us-ascii?Q?1CTQQWkeAlECk4UPldPrZFaV7S7rq06AlVPhkzOJPEK6tpsBs/fHKH/HTU6a?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d1ee45-0927-480e-3b1c-08dc6ee3dad5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 22:20:08.9128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkMUB6LIjMGXo23F9HAOnCR9mdRsrnUHjwupw3YSsTOglHi1p/vvBqX5W+51jqm0RlecPW2tNTbKQ/isWfpY4VGXGalPehDBR90morpAmn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Mon, May 06, 2024 at 10:11:05AM -0700, Niranjana Vishwanathapura wrote:
> Indirect Ring State is the recommended mode for Xe2 platforms,
> enable it by default.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8f3e4c563105..c8512571fca8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -166,6 +166,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_asid = 1, \
>  	.has_atomic_enable_pte_bit = 1, \
>  	.has_flat_ccs = 1, \
> +	.has_indirect_ring_state = true, \

Nitpick, but I'd use "= 1" instead of "= true" here for consistency with
the other fields and since this is a 1-bit bitfield entry rather than a
standalone bool.  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	.has_range_tlb_invalidation = 1, \
>  	.has_usm = 1, \
>  	.va_bits = 48, \
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
