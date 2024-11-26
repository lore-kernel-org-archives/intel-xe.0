Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B30D66B8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 23:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D10D10E0CC;
	Tue, 26 Nov 2024 23:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOeITaWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6E410E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 23:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732664589; x=1764200589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XkM+qmUEPt/S96Z+BPPxEwf+zSmuE/GKEOoRRUqpJNY=;
 b=KOeITaWsSltmF9+faI3LDzOSOVZIBMlsgYQIgZBhJdldDT+XfJanjTKe
 pRnzI5uwOcONSMM/LmbldmkOraqOyGmgJub8yqPrLKWXgnmq/5SC23Ri7
 fxAY3+RauoEXLDQTT+WSgyYw/T0nKo4KCfhVDmfMyTZq9EneRVWADVVsm
 1FoMrMSDBMIdMeLXv9iDOAaSPPoyUyzjEtyqmDOF0xvBsHeZMUpmmTqVy
 jP5xIV4PbGQEnMOKTgxo9jUqN1/Mxe8u8XfT7MjenQO/P8hAVk/zSnxI1
 vYeieAvUghjJZ4xemCLJQz0vG7LWZph1p/NXYOKP5VoRI6EZTPE6KP05n Q==;
X-CSE-ConnectionGUID: UTLaViGCTnun+lTMIQ4VBg==
X-CSE-MsgGUID: wpCiUpseR6KxEhOL9RFKcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43344115"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="43344115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:43:07 -0800
X-CSE-ConnectionGUID: asBR3+oTQKamrZR3xUAkbw==
X-CSE-MsgGUID: My8ZWOYYSRqVaKZljWCi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96818456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 15:43:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 15:43:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 15:43:07 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 15:43:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT+0gVSWtlhLHwA0+76cJ2RaEZ9zO8i9j0IoYZaUa7btu/gWTin4CPXmLl5SqRV4m4jJm7is7W9pOnRQUVjyqFL+gCYKoD0hZtlIB6Bmu8dI28EoRkZ+p32bYhBYhOSneTdy9MWUmE6+K2La+oDhj5xnorpRowPq/aePbc4pavco0td4U5ZLAVCchToDTM7VcWPJ1rBsabWBLQtAAB14SaoORwXD8hTKT5h8gRVubeacvAYlbbGZOCc36JBPzDU2IBxSqd0OyhwS2sha2FfKBlAEYvVTZTpgdy91poMrtnCanahvkPM5KOl5XGitLURT6qKNP1932Y+BytYzYkMJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtv1KULS+cz85AcXlP/FY7Q+MuzAp19OUo45k0iPJQ4=;
 b=jpGJ5yvqQiFMJCKUxFiejZr7+2yaDRHVHVPsamL1e21ZUUK91jdKhs3mJrKCm+bAQm678CEF6p1VSKoNCOcX680wbkWqzRpaQaSzE8lcYY+IdkLsQwjNr1UJJyPVIj9Hp8So9TUi3JrtpPNlrJ6wA9EfruCmUc92Hy+0mmwdWkizAlh3Geihj9Y1RMrVQo8yKXENVXhyuqXunOHTBkMuQUTxGh0TUJlU7hK9cLGdRy9GQxVMJ+7Zj54wfipFXTYK/DTl6JGLb6Ar4IkhbxBglDzLvfAS2sfWRVUPT/Mx2+hMs0k+i/GSFusnySgE7HKozGWwjakUTJGgaWqPcW1biw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 23:43:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 23:43:04 +0000
Date: Tue, 26 Nov 2024 15:43:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Update xe2_graphics name string
Message-ID: <Z0ZdLisfDAO76P72@lstrano-desk.jf.intel.com>
References: <20241125194838.1190599-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241125194838.1190599-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dca9c09-9055-42ee-f026-08dd0e741297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LoetrnpNNJYg0P3QAq8PaBCboptUmCyhsU6CGVoDDcleR4k56d87sq2KzJvM?=
 =?us-ascii?Q?TFpKDE+0Na5jJPBZ1FzQT0qRtKt/pNDdx/f9I5xPLNJiEwy+X81vGlk7VhOe?=
 =?us-ascii?Q?VQygePycfr/f8GqLbdntFKsvAN4CVeW1MhumSBltzh9MIUpf0LIoEwGj/MDp?=
 =?us-ascii?Q?nfWGqIuIU5Sqrq1fmP29qKz292/xorYoWHaWt4h57UEVGikOQpaL/xxYD510?=
 =?us-ascii?Q?QcQT7mXWQNYT1EAd5pvN2widtMbTcmytGiL2HEJKnDSCgsa6SDwxLkZgKgNf?=
 =?us-ascii?Q?UB/56/3Ixzoa9vDLBCSosVU3W31l7jVtxveuyMwaCbNudDaWQ7/nv1eXfqNe?=
 =?us-ascii?Q?AZAu/ZV0olz73X62o2rSgmS+CM8PzlUT0arLU5YiiKI2P59GlIpZZnKN4NPt?=
 =?us-ascii?Q?kkFYPazO1eGU4qRTD4qaedYi6c1eJtRHo92hAu/p2mr8Ss1n5aaoF9UMcNMm?=
 =?us-ascii?Q?NCB6Mg7cRh50b4dYgLfZ+NnkXYLZcAgSAnK86q/qCPRju56+D6E/fSYMyEAv?=
 =?us-ascii?Q?g64jNGGrIZk1LT+3JuIs3YTAQR9Y+O/Su7t6GKZ7+GbyRyivB1JwhS6uduj7?=
 =?us-ascii?Q?5KSPETSvs6XtrRh4EdCQJkIoYaOkDv3krILW/2/kGUGzMm3/N9SNCZTWgf7U?=
 =?us-ascii?Q?TC9HslOHG40sj6Jdfme9iFM8Ok6NJ/meu4ddziwZ5DRuYHuEL0nWJgDfxYfc?=
 =?us-ascii?Q?OTasSHibGpVaN2hlgcGQi3gB/hbwG6DEDuL7pYlkgYJbbwVzkO4gsX+0dmE8?=
 =?us-ascii?Q?0dzrjaIUb5KLGj1YJux7Fc6it5YkKrZNrfni6iFC7pVxAXlA0H+hVwgkd9n9?=
 =?us-ascii?Q?aR1nsn5IRB+R0amV/Fu0/Fkpu4aIF7MFX7fWPb5dr1p7A1ZsxHfE6wKUjKxy?=
 =?us-ascii?Q?oJENHiUk4tJx1dKWxqhLa3U4Z8LltLEBFJ7xyqTJ6KrBgi76TIXEntVUSMqj?=
 =?us-ascii?Q?u2fQglo8exrexIPu5oeiSZ7lxC1MP71ei48K3HhZHmMr1lW77/OFtcWMRP6X?=
 =?us-ascii?Q?ZnwqRWVYrFZn248FtyEUzvRl9Qb2ghdGEDqEU6MQwmuSzY8cdKmmaeM6AeVF?=
 =?us-ascii?Q?TybzxiVnhwv8aDB9WPene1THuAPjwYzEUQxmcydXaaBf/TCekDHEEMVm5usd?=
 =?us-ascii?Q?pQ0iBGd3tXk+o1G9TyjgVry8q9UbfXI/d/e8A1Yrc3Hvcj/MkdT7Pa//4JcJ?=
 =?us-ascii?Q?ShDs0/SHyKujE6HKrtdsVFNX18RUXyPOyY8JvW0xfdKGEI9JHJIl/maJMhz+?=
 =?us-ascii?Q?Mnw+9GseA1HTsU8GT8diqcWJUe9CztNlzsKDnoUGAwzKSLTzQT9c5vMc6XOk?=
 =?us-ascii?Q?NjIxJZFbbGFmHIXgooh2tjVbknynQGMcvdFr/jqvJ4RqoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZEfxhyLncZiAqqFzbRErS6yVE/qvQsmyT2PHhMETPZgO3i5jo4Vwhd+5tZkx?=
 =?us-ascii?Q?G7jXqQ2bTxlc2rhpaIMMut+uLItoYxSmln53rutgQPkuDt+7osuE7wY4qUPK?=
 =?us-ascii?Q?5eY+iKrJKuR/jctk/QDIISyXAcx3Ir0MQ+R+6F7NwSskangHgNmlH29WEvfy?=
 =?us-ascii?Q?/xSzZqqZVcJj+Tljwy18FpaWApvw5rchqUxdwm8ewfDA4/OaMe/SGa9tg7DN?=
 =?us-ascii?Q?c+1GNiYwsqQ8Mxxetx3uoe0Dt7gma3ytStVC+Y7y/GYzQIuUgbTHzIhZig7/?=
 =?us-ascii?Q?JnpIEFxwXoE5JIOBNLSY7DKS+K6HcPwHwWhZsJfSEh2bHlcWW6/Fmg22wnjZ?=
 =?us-ascii?Q?EHR1HJsVmtUGH76LdNmcE10nFePXH5lNvI3Vwr91X66mrWkBlowBInf0la6Q?=
 =?us-ascii?Q?7ChSK0ved9oMNb0aCcKgV5CCeB8zVRIJMx07rwGplTd7BlZHM017DiORV/AG?=
 =?us-ascii?Q?ioW+bTnWwEorw1aPvRShkhs3u0SANqI6gS+VjursZ3jxF6Ok6ISjCgkPJxE9?=
 =?us-ascii?Q?WnUs1ZrLM6/umftsJVYapOKVbfPczToTskvLsGwVoE9ppS9mtEaQ0dwdBsfs?=
 =?us-ascii?Q?c5/3hJV1M8oK0M12ZOetr4OI/U9bjWg6eTnMLrR7z96cC/jEuIBZICDABIJa?=
 =?us-ascii?Q?/dwXnpVXpxhp1eO+3ns+CcAfxo7Sk15Y/796opybdW80tP6j4kn8+h+ZZ/c0?=
 =?us-ascii?Q?8L3U7k5o+SMzP7/28Cf8Jn3mMPLm3/K1YgfwNS+nC9yQNR+xiO0B1hWoKEig?=
 =?us-ascii?Q?hHZ5ouewF0xd1hSIhEPIRs3q1oXNb+mXz3IaEwqoQ1TvX4uE6pPWJEDhXqtz?=
 =?us-ascii?Q?mWCXV/U+Ul4MqzvKiCoyiTe8Y3WhbUOCOnGR6c0VKj7OhKgvibgWHTYozEB/?=
 =?us-ascii?Q?pKlaTwtR+xjaZdBEAuixfAdrNh0dky4228NBRVQ00s5lHWMn8lS/wCww+HZc?=
 =?us-ascii?Q?gwY7BfcVk6gC4ZCGnSXzExGcDj4w7XaAxRAIDqgiSGzLkPWgESvRgk+Fonkl?=
 =?us-ascii?Q?9Am8i3df2tR8rmp5BjnVJ4otTYhyriIbC6bWCgmHswPQ45E3k6m4WiL7/Sp3?=
 =?us-ascii?Q?innYa4zsgtUybBa26CVOguiyV8I26kxF099bdBkH1hW8wYH6orXtoxgFXppr?=
 =?us-ascii?Q?DnAz060k9HYSgY0s2vfl6TzjnEEN8adz4lrlRpWBoQcslI586uGZmO5drNxe?=
 =?us-ascii?Q?WVgDC9jW3j459Nw2PVvtxPIH6FB2RM72R9cbWBh34tjBLlzgVJR0tsXjDUxK?=
 =?us-ascii?Q?M1hG/pKFjKM97wZGgRxoThQG+ybbyVjdC7/qSfmEH5fw5DgZB95iu3v1cUUx?=
 =?us-ascii?Q?LaU5lb4vZszpMPZ0BMdM5j+7Ds7VInoTJ6IhFWOj/jP45crYpbwmBk13D5Lq?=
 =?us-ascii?Q?H/s1i7kq9lArg/XNCXQoAlLWTGILZuRknwBVmNnclSLe37H0FQyCG1olzFa1?=
 =?us-ascii?Q?0z+Y+x3vhkM5UI/S0Hvfn8bx4nxT66UwPDdhdYWSQyGDm4ZowgucruA4LrKD?=
 =?us-ascii?Q?VLmcA4I5mNMPEGvMDyebCmRe81uoUW6TXu8Yyd37NKwe2DgKbZFXKtZfV3OV?=
 =?us-ascii?Q?+IFUA0s785Rsaz7r6BqsPSr8t4Nqu7WuYoy00Hdw1xflaO1IHSHzExcMXX7M?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dca9c09-9055-42ee-f026-08dd0e741297
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:43:04.8560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +08dsMEKr8or3Oy7iz7Ck85xugFHpGYF9+vKO9K3+ZEE8WQDNlVLe4ktUdLBI8cj1FMglvcu4mKeotQb9cI8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
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

On Mon, Nov 25, 2024 at 11:48:39AM -0800, Matt Roper wrote:
> Since both Xe2 and Xe3 platforms currently use the same set of graphics
> IP feature flags, we associate the "graphics_xe2" structure with both IPs.
> Update the name string on that IP structure to clarify this and avoid
> confusion as Xe3 platforms start going into public CI.
> 
> Fixes: 800d75bf20ae ("drm/xe/xe3: Define Xe3 feature flags")

Nit - fixes is likely not strickly required here.

Matt

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9b81e7d00a86..7d146e3e8e21 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -174,7 +174,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>  
>  static const struct xe_graphics_desc graphics_xe2 = {
> -	.name = "Xe2_LPG / Xe2_HPG",
> +	.name = "Xe2_LPG / Xe2_HPG / Xe3_LPG",
>  
>  	XE2_GFX_FEATURES,
>  };
> -- 
> 2.47.0
> 
