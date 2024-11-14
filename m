Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14178D637DA
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 03:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16C310E012;
	Thu, 14 Nov 2024 03:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lY2mOkZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3261F10E012
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731554456; x=1763090456;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=71YGakMn8kJ46xpbHsTzf4sbS1fNEyMJWMDDGtblqy0=;
 b=lY2mOkZM0jCHgZV3D3KWKtG8WEuCALgyRk8pq6gbflTsune2qdmR299V
 Y2Xt33//2Fm3k5l3bq1NAgZsPUkC1DMRjrI7Z3ZkkDAbShP/cCOyRMYbv
 siT3c/KA8JKrPquPOtnh+AHETIFMsl5YuDB7hGFtC4mGlYetUsDjqdQH1
 f0HQDYj9h+14OFkfcoD4LtMld5s98lXRhP1ZKi2UWSH9kzHmTvd407UEO
 NRDeRUkt2fooVOIX9vE9DMgCVXwdBJF3/tt2RMIn878GYMfvkmOn75D+z
 TRFVSdblDHODDlcs6O9snJAk2OaI0Ieh77bc93TeIbT1MIRx9LziTKTVY g==;
X-CSE-ConnectionGUID: Nmi/WTNlTjOQulQUFy/31Q==
X-CSE-MsgGUID: SrZQU37JQk66MCCUAEajBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42088898"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="42088898"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 19:20:54 -0800
X-CSE-ConnectionGUID: C9o1/mDHSM+hkGXVEfbwNw==
X-CSE-MsgGUID: oRwV+QJLSaGZmF7GLXVJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="119001920"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 19:17:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 19:17:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 19:17:05 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 19:17:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmzLJXkt1QdRDvGuN1RtCvqxx1H807ny5DrmYHj1zbZroilP048wBNa6dYNuRZ5NPj7vTAomUbuXnC4r08qna3QVM9SsYSzNzgZNl235wClL6FvIG/aBAohxk7ZgSy0WGsYrSKDuEXkbw0Y11Evp9v3C79FE40WsylyuGllzKIrhqdQ9yrQgf4eHi9Vie0DCImg/OM8ZIvPLH8503auYIm3/z69Mdv1mvrXwniAtFZlOW/J5p1H/PTHOSbGPuBthzNQk8HqtG5BM3sIAKFjM9rOFbEcKURIZux/aBfK4p3OffDos6ZbMFlhsIbtSNHaGva0IftXTQzniAMX1ETLgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZq52ea7ggqKxKhdxD8zK3utxt7GDm30jJJTn6fbHww=;
 b=kYxBFm4gyDvdvbnCFRHLhjyf0ltD+SlTH49gnXd+RcN73xsnmFM78w6nKmYquA7VdRo/b+CQ7D6y/RRUKeIhdz3zplO85vJswjKFu9DMA1oKFW4P8jEiDEen9PIL94JyiW/P5SaWvnN2db5xnsVbh5wDexr9rrdMzYDKm5m/OlgQVuLqRWwg1nu1AFR2Om2WKCQiw+vDNYcgZrupCYwjiwGMflJiTLl9rlcKzYZ8pxreppShzMZ1WGsrDGjU1enzHGmZSdL/Ri+VWolyUOnPNrtPF27mJAvsNF1nJxjvLyPH0eVfXBm46wdanzCMCS4RPzK6A2miY/LYref3haOWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 03:17:01 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 03:17:01 +0000
Date: Wed, 13 Nov 2024 21:16:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
 <20241113174242.24787-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241113174242.24787-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 0517b515-dae3-4877-6de6-08dd045ace10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eeW7BokrMGJHTxbhBSNBKYEhrtuzRWRhQ3iuH+Ic6fV/SPM1tyocMsgQiz?=
 =?iso-8859-1?Q?ALVXRJaTA0CmqNVNtgFr1QyLjyWRYmLxCbmKCe1DRcbObsNGh6ozG9xneK?=
 =?iso-8859-1?Q?Zpb+P/zt7zoUXYZFFJAZK4QKVv1P9wjOTufTGcRk9jb/HywV8kBC2dXQkd?=
 =?iso-8859-1?Q?hAsSZFS2z5aYkFlOQK6wygrbNT+BTH1urTC4QHva34lDP5UCbpf1fZpes8?=
 =?iso-8859-1?Q?UXDb3k7VtoWuCniquZIvNEOTvdSpX9ShvlLjHCH9sokCHCxQwVavpjGLmR?=
 =?iso-8859-1?Q?Y9SUyTC2UvmTaMxsqmCeklPPmkSZ3tvYyw4DO455M575L4HbeKHugVVM8+?=
 =?iso-8859-1?Q?VcEl19aYpH3TAezbs0hAknk7tlihzxtgZMZf8sgtPZ7zdK0N6KJr5H9A1k?=
 =?iso-8859-1?Q?y9Sq2O2WnX/HQVWGPpuc3F2NbmGxeepG4O8UlWgyjM2QeuIlUVeOyVO+Me?=
 =?iso-8859-1?Q?Ia3YiWk2yF4F0YruqKuTQgjzWY8SInBBgM9jPPQaf/if2eOhc8fGfRxAYF?=
 =?iso-8859-1?Q?JauGomoAaqAj3qeQ9z9B/jABxSnx9Q6pBdS6/RVM8p/7KJ+VJMJzK58mM7?=
 =?iso-8859-1?Q?KlRGbBHFbWLP5ek9OyA3TTFhqdatroMy5U9VQVo2G3WOvj92RusYiD6oSW?=
 =?iso-8859-1?Q?NZtV6J0iUsxUwETNGa5uwc0N8B4VOEdR2XuErlwO0nZFWHYEMBzAM706c5?=
 =?iso-8859-1?Q?jbwQUvlzfp+SStc6bJVFRH01ePOwaFkCkvWVtYOypkI4cPHDr+ZjIbuDKg?=
 =?iso-8859-1?Q?M4eBr/YQXdtc7g6BRdXQHR3SnBj8vq1PYaHKXTmE2Qn5oSo7G/dlZkOa9R?=
 =?iso-8859-1?Q?PDKh4La0gLie4UL8vFASUlx0M9rWvI1ltQLn6iQPlRn9UGJxyCCGQ9S2L4?=
 =?iso-8859-1?Q?mAIMiT9c25YKGeMjFVA8BO7uWiBSFb5ng0xzBRIrs9Sd0T9V3tEla9lTD2?=
 =?iso-8859-1?Q?LDht0V227Wb2kzBc8optLZT/ayDpPYC+teECGU14RUkJCAtnOsvVJagkB7?=
 =?iso-8859-1?Q?+L472P4EFp2s8gqhTgB01DdKDIAvnozShsFOCaPXBhsww5zkJwB1wUaa5B?=
 =?iso-8859-1?Q?GmjtFkYl3wj+U+21aPQ26t1C948v8Sa13kFJxAhT/jAo/rA1bwZIxVfVRq?=
 =?iso-8859-1?Q?QC/gARJ5xMgfyvTWiBX+bw8Rz2xUohiYTI9d1JoDrsCTszOKmIqQxS1vlV?=
 =?iso-8859-1?Q?X//5DXtXv/iwBj5mQMe9cff2f+womrohNBAyHAJo3YFAJoBWBYpeRD7NlA?=
 =?iso-8859-1?Q?svhv1keqG8r90fB8F0nP/zQAhtRN5CNc0htdhVv2fxOkytwzhfBBl4EjLq?=
 =?iso-8859-1?Q?vha0wdplgY0TXpQrNPObuw5QnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XIIjdwGbNjkX9zzgQEcOnPL1CXnUsAFZnHtcjgH/bOqIA0kH0If+ldaAnK?=
 =?iso-8859-1?Q?QphSwKfmn8WJMEZpXIXeO6YlsNXsJLeqk1UlDA1jsvTaRf8uFaDyEkx5fc?=
 =?iso-8859-1?Q?GAAyeYd5ufhP+oGtv1mfbaAXNJILX/27sPUVCBNNFNpqjbJsfhE+lN03i0?=
 =?iso-8859-1?Q?nRyuDt3z+7LS0uwKCwicpk84Ahe6owkiO5oqTA5lWcQDYROxSb1LhF9lND?=
 =?iso-8859-1?Q?zMj3DmCIN1PdHPGiivhoWKl0qVeGojAdSQbQJUWUNCTVJdmrZp/58eP6Mb?=
 =?iso-8859-1?Q?V+ByZLucr576Sytc0hjZF0ei2zjCSZqJdyk504hEy8Jy7+Vuvg0ZI3TNiy?=
 =?iso-8859-1?Q?v8aoFXw/EFGBmkDukAzRNVxdpnv65Rt8Ynt2uqByhcPbJLkXX0COnA1f/L?=
 =?iso-8859-1?Q?TSwhFKtwkMqFC7FbiGVPGfSuT9qc9e3VJ9dS738uBPThy6/k262dNUKdhj?=
 =?iso-8859-1?Q?BM8FnAorCpvV48wDVl7ucsJHzQ6svN1B+Fk5FnYBNW49yAtC04/HA9FziS?=
 =?iso-8859-1?Q?+e8BezOQZMXDmgc1Q08TIN2hAAEo3V9iTpElv9pPQSLkOkVRq6eejDx1Od?=
 =?iso-8859-1?Q?jwFJl3zJsoFEXRf2vy+5KKa/u1spjgYZHovuxEgWgV1I2nZAPPi0eNJRb7?=
 =?iso-8859-1?Q?q0UtG+D24JUpc+gTA6f+c3DEtWxz0gRu5YPGg+43qyZT4ieGltKZfUtzoj?=
 =?iso-8859-1?Q?/2JxKhLNHlFR1tk2DxLWwpwh6cLlYuwRQfLpjWKH17EHcIPwTwi60hGL+j?=
 =?iso-8859-1?Q?w5McrF9fVsTk/FXye0qskyRs2eHpaHdpE6EcMKnFYOC6z7tAOZBNnij04o?=
 =?iso-8859-1?Q?c/1uALFqNAgix8wV9Ko7qEIVup2FIzf8wyqy0SBIjIVYqb+t/YcEuX7xp3?=
 =?iso-8859-1?Q?VN9Zwyl+W8rQVX3lsOCEulivhEnVmIeN6V+HFs0Os+pV+ix8LxxsdaygBf?=
 =?iso-8859-1?Q?pV7VBE3wnNpH/QYyoW75xXNBYYm/qaPgwA4/eXjEbAFHu5bjUZK0cdTb7b?=
 =?iso-8859-1?Q?Eq4AXTkK+ZEr9zhv8PQQERUqREIlnICzwRH2ei2aq/fy/WZCARdgaVT0Gf?=
 =?iso-8859-1?Q?OGj/xsuDNVFRwpprQZqIxsR65ovJyfCaHtyJkv40gRycwdy1gZp6Lmdk19?=
 =?iso-8859-1?Q?CnNhDqvQJHFRKa2TnYWOYzpNXrJeEcMXt7PWROwoJwLkI4OpCK5c6TkAWA?=
 =?iso-8859-1?Q?lG9ib3ifQIHiG6o5Z6AFAWMZMDg8MYlWlmcV9JCx0p65UxeKBf+545r+QY?=
 =?iso-8859-1?Q?kIm7HfggaiPRoYZqEyt8mnJZRmke/Bo94PVnd6gl4DIUV1Dw21Gdq7bGpH?=
 =?iso-8859-1?Q?oam7YmG9kDahSY0ViJ2dBo05vBM+tVNsYDB69PQ21hmsVkseHtlt2ek3Oz?=
 =?iso-8859-1?Q?gXevXXSb/qxZOKdWOKY48RpMFHVq9QhiimUAMEEYXrHn3Gk1VVYn9S2/Cg?=
 =?iso-8859-1?Q?HhFaa1f9prkEjVRFLzAcp72+V9Ao3iDbbrIGppaKVGlfHKK5py3HfKgyqM?=
 =?iso-8859-1?Q?ycwvO3sqXfkK0J/cHxde2dBagzNt9cP9hSl/dgxXyTldKFI6ikUOYM1WXN?=
 =?iso-8859-1?Q?rHuPf3zpc48m8F693PUYz1epH0FCD5YX54xsFMiTOWdROSCB0e2CtFioI1?=
 =?iso-8859-1?Q?BdhACZEOKjcssPIeO7LrAL0zLrlBD3o/U4lm97qyDbaxOK8zE8JaZpgQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0517b515-dae3-4877-6de6-08dd045ace10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 03:17:01.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iH3OIH3C9jfWC8/2qJfLHkikYtrnJOjlblSWYDNlHbJO+pGSq8bNMA2gbEZhGShHeDI0ks602Ect7qrmqF5TFgpQMkA+8KLN2kxRj6CJ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Wed, Nov 13, 2024 at 09:42:40AM -0800, Vinay Belgaumkar wrote:
>From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>
>Basic PMU enabling patch. Setup the basic framework
>for adding events/timers. This patch was previously
>reviewed here -
>https://patchwork.freedesktop.org/series/119504/
>
>The pmu base implementation is still from the
>i915 driver.
>
>v2: Review comments(Rodrigo) and do not init pmu for VFs
>as they don't have access to freq and c6 residency anyways.
>
>v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
>move drm uapi definitions (Lucas)
>
>v4: Adapt Lucas's recent PMU fixes for i915
>v5: Fix some kernel doc issues
>
>Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

are all these s-o-b and r-b still valid after several changes and back
and forth?


>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   2 +
> drivers/gpu/drm/xe/xe_device.c       |   6 +
> drivers/gpu/drm/xe/xe_device_types.h |   4 +
> drivers/gpu/drm/xe/xe_module.c       |   5 +
> drivers/gpu/drm/xe/xe_pmu.c          | 579 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
> drivers/gpu/drm/xe/xe_pmu_types.h    |  70 ++++
> 7 files changed, 692 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index a93e6fcc0ad9..c231ecaf86b8 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -299,6 +299,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
> 		i915-display/intel_pipe_crc.o
> endif
>
>+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>+
> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 0e2dd691bdae..89463cf7cc2c 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -759,6 +759,9 @@ int xe_device_probe(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>+	if (!IS_SRIOV_VF(xe))
>+		xe_pmu_register(&xe->pmu);

this IS_SRIOV_VF be inside xe_pmu_register()

Also, differently than i915, the direction is to fail probe if any
component fails. So this call should return something and we should deal
with the fallout if it happens.

not all parts of the probe got the memo though and requiring this to be
done here would be outside of scope.

Anyway, this should definitely not be be between xe_gt_sanitize_freq()
and the return!

>+
> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>
> err_fini_display:
>@@ -803,6 +806,9 @@ void xe_device_remove(struct xe_device *xe)
>
> 	xe_heci_gsc_fini(xe);
>
>+	if (!IS_SRIOV_VF(xe))
>+		xe_pmu_unregister(&xe->pmu);

same thing, no check for SRIOV in here. It's not even needed inside
xe_pmu_unregister() as it only unregisters if it got registered at some
point.

This should follow the inverse order of registration.

[ It's sad we got mixed style in the probe and it's now
   a complete mess. The idea behind the calls devm_add_action_or_reset() is
   that you wouldn't need the call on the remove side since it'd be
   automatically called. In the right order. ]

For now, let's just move this above xe_oa_unregister(), since it got
registered after it.

>+
> 	for_each_gt(gt, xe, id)
> 		xe_gt_remove(gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index bccca63c8a48..0cb8d650135a 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -18,6 +18,7 @@
> #include "xe_memirq_types.h"
> #include "xe_oa.h"
> #include "xe_platform_types.h"
>+#include "xe_pmu.h"

you will need a xe_pmu_types.h where you only define the types.
See the other lines that serve as good citizens, don't look at xe_oa.h


> #include "xe_pt_types.h"
> #include "xe_sriov_types.h"
> #include "xe_step_types.h"
>@@ -509,6 +510,9 @@ struct xe_device {
> 		int mode;
> 	} wedged;
>
>+	/** @pmu: performance monitoring unit */
>+	struct xe_pmu pmu;
>+
> #ifdef TEST_VM_OPS_ERROR
> 	/**
> 	 * @vm_inject_error_position: inject errors at different places in VM
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 77ce9f9ca7a5..1bf2bf8447c0 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -14,6 +14,7 @@
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
> #include "xe_pm.h"
>+#include "xe_pmu.h"
> #include "xe_observation.h"
> #include "xe_sched_job.h"
>
>@@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
> 		.init = xe_sched_job_module_init,
> 		.exit = xe_sched_job_module_exit,
> 	},
>+	{
>+		.init = xe_pmu_init,
>+		.exit = xe_pmu_exit,
>+	},
> 	{
> 		.init = xe_register_pci_driver,
> 		.exit = xe_unregister_pci_driver,
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>new file mode 100644
>index 000000000000..2bd98c91ab0f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -0,0 +1,579 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_managed.h>
>+#include <drm/xe_drm.h>
>+
>+#include "regs/xe_gt_regs.h"
>+#include "xe_device.h"
>+#include "xe_force_wake.h"
>+#include "xe_gt_clock.h"
>+#include "xe_mmio.h"
>+#include "xe_macros.h"
>+#include "xe_pm.h"
>+
>+/*
>+ * CPU mask is defined/initialized at a module level. All devices
>+ * inside this module share this mask.
>+ */
>+static cpumask_t xe_pmu_cpumask;
>+static unsigned int xe_pmu_target_cpu = -1;

I still have no idea why we need this, even worse that it is at the
module level rather than the driver/device level.

since we are working with the gpu it seems we are limiting perf to
create the event in just 1 cpu, and because of this we then need to let
it migrate to another cpu if that cpu go offline. Wouldn't it suffice
to set cpumask syfs to 0 like we have in e.g. cstate_pkg?

$ cat  /sys/bus/event_source/devices/cstate_pkg/cpumask 
0

>+
>+/**
>+ * DOC: Xe PMU (Performance Monitoring Unit)
>+ *
>+ * Expose events/counters like C6 residency and GT frequency to user land.
>+ * Perf tool can be used to list these counters from the command line.
>+ *
>+ * Example commands to list/record supported perf events-
>+ *
>+ * $ ls -ld /sys/bus/event_source/devices/xe_*
>+ * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>+ *
>+ * You can also use the perf tool to grep for a certain event-
>+ * $ perf list | grep rc6
>+ *
>+ * To list a specific event at regular intervals-
>+ * $ perf stat -e <event_name> -I <interval>
>+ *
>+ */
>+
>+static unsigned int config_gt_id(const u64 config)
>+{
>+	return config >> __XE_PMU_GT_SHIFT;
>+}
>+
>+static u64 config_counter(const u64 config)
>+{
>+	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>+}
>+
>+static void xe_pmu_event_destroy(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+
>+	drm_WARN_ON(&xe->drm, event->parent);
>+
>+	drm_dev_put(&xe->drm);
>+}
>+
>+static int
>+config_status(struct xe_device *xe, u64 config)
>+{
>+	unsigned int gt_id = config_gt_id(config);
>+
>+	if (gt_id >= XE_MAX_GT_PER_TILE)
>+		return -ENOENT;
>+
>+	switch (config_counter(config)) {
>+	default:
>+		return -ENOENT;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_pmu_event_init(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	int ret;
>+
>+	if (!pmu->registered)
>+		return -ENODEV;
>+
>+	if (event->attr.type != event->pmu->type)
>+		return -ENOENT;
>+
>+	/* unsupported modes and filters */
>+	if (event->attr.sample_period) /* no sampling */
>+		return -EINVAL;
>+
>+	if (has_branch_stack(event))
>+		return -EOPNOTSUPP;
>+
>+	if (event->cpu < 0)
>+		return -EINVAL;
>+
>+	/* only allow running on one cpu at a time */
>+	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>+		return -EINVAL;
>+
>+	ret = config_status(xe, event->attr.config);
>+	if (ret)
>+		return ret;
>+
>+	if (!event->parent) {
>+		drm_dev_get(&xe->drm);
>+		event->destroy = xe_pmu_event_destroy;

We won't need this anymore after the pending pmu patches.
We can keep it if we end up applying this before.

>+	}
>+
>+	return 0;
>+}
>+
>+static u64 __xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	const unsigned int gt_id = config_gt_id(event->attr.config);
>+	const u64 config = event->attr.config;
>+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>+	u64 val = 0;
>+
>+	switch (config_counter(config)) {
>+	default:
>+		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+	}
>+
>+	return val;
>+}
>+
>+static void xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct hw_perf_event *hwc = &event->hw;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	u64 prev, new;
>+
>+	if (!pmu->registered) {
>+		event->hw.state = PERF_HES_STOPPED;
>+		return;
>+	}
>+again:
>+	prev = local64_read(&hwc->prev_count);
>+	new = __xe_pmu_event_read(event);
>+
>+	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>+		goto again;

should have been a do { } while() and need to use the try_cmpxchg variant.
we shouldn't need the local64_read(&hwc->prev_count) when repeating.

I think arch/x86/events/rapl.c:rapl_event_update() is a good reference.

>+
>+	local64_add(new - prev, &event->count);
>+}
>+
>+static void xe_pmu_enable(struct perf_event *event)
>+{
>+	/*
>+	 * Store the current counter value so we can report the correct delta
>+	 * for all listeners. Even when the event was already enabled and has
>+	 * an existing non-zero value.
>+	 */
>+	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>+}
>+
>+static void xe_pmu_event_start(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->registered)
>+		return;
>+
>+	xe_pmu_enable(event);
>+	event->hw.state = 0;
>+}
>+
>+static void xe_pmu_event_stop(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->registered)
>+		goto out;
>+
>+	if (flags & PERF_EF_UPDATE)
>+		xe_pmu_event_read(event);
>+
>+out:
>+	event->hw.state = PERF_HES_STOPPED;
>+}
>+
>+static int xe_pmu_event_add(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->registered)
>+		return -ENODEV;
>+
>+	if (flags & PERF_EF_START)
>+		xe_pmu_event_start(event, flags);
>+
>+	return 0;
>+}
>+
>+static void xe_pmu_event_del(struct perf_event *event, int flags)
>+{
>+	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>+}
>+
>+static int xe_pmu_event_event_idx(struct perf_event *event)
>+{
>+	return 0;
>+}
>+
>+struct xe_ext_attribute {
>+	struct device_attribute attr;
>+	unsigned long val;
>+};
>+
>+static ssize_t xe_pmu_event_show(struct device *dev,
>+				 struct device_attribute *attr, char *buf)
>+{
>+	struct xe_ext_attribute *eattr;
>+
>+	eattr = container_of(attr, struct xe_ext_attribute, attr);
>+	return sprintf(buf, "config=0x%lx\n", eattr->val);
>+}
>+
>+static ssize_t cpumask_show(struct device *dev,
>+			    struct device_attribute *attr, char *buf)
>+{
>+	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>+}
>+
>+static DEVICE_ATTR_RO(cpumask);
>+
>+static struct attribute *xe_cpumask_attrs[] = {
>+	&dev_attr_cpumask.attr,
>+	NULL,
>+};
>+
>+static const struct attribute_group xe_pmu_cpumask_attr_group = {
>+	.attrs = xe_cpumask_attrs,
>+};
>+
>+#define __event(__counter, __name, __unit) \
>+{ \
>+	.counter = (__counter), \
>+	.name = (__name), \
>+	.unit = (__unit), \
>+}
>+
>+static struct xe_ext_attribute *
>+add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>+{
>+	sysfs_attr_init(&attr->attr.attr);
>+	attr->attr.attr.name = name;
>+	attr->attr.attr.mode = 0444;
>+	attr->attr.show = xe_pmu_event_show;
>+	attr->val = config;
>+
>+	return ++attr;
>+}
>+
>+static struct perf_pmu_events_attr *
>+add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>+	     const char *str)
>+{
>+	sysfs_attr_init(&attr->attr.attr);
>+	attr->attr.attr.name = name;
>+	attr->attr.attr.mode = 0444;
>+	attr->attr.show = perf_event_sysfs_show;
>+	attr->event_str = str;
>+
>+	return ++attr;
>+}
>+
>+static struct attribute **
>+create_event_attributes(struct xe_pmu *pmu)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	static const struct {
>+		unsigned int counter;
>+		const char *name;
>+		const char *unit;
>+	} events[] = {
>+	};
>+
>+	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>+	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>+	struct attribute **attr = NULL, **attr_iter;
>+	unsigned int count = 0;
>+	unsigned int i, j;
>+	struct xe_gt *gt;
>+
>+	/* Count how many counters we will be exposing. */
>+	for_each_gt(gt, xe, j) {
>+		for (i = 0; i < ARRAY_SIZE(events); i++) {
>+			u64 config = ___XE_PMU_OTHER(j, events[i].counter);

what's "OTHER"?

>+
>+			if (!config_status(xe, config))
>+				count++;
>+		}
>+	}
>+
>+	/* Allocate attribute objects and table. */
>+	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);

afair from doing the dummy_pmu
(https://lore.kernel.org/all/20241008183501.1354695-1-lucas.demarchi@intel.com/)
we don't need to allocate the attributes. What we need is a function
like dummy_pmu_events_sysfs_show() that returns the right config using
the id.


>+	if (!xe_attr)
>+		goto err_alloc;
>+
>+	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>+	if (!pmu_attr)
>+		goto err_alloc;
>+
>+	/* Max one pointer of each attribute type plus a termination entry. */
>+	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>+	if (!attr)
>+		goto err_alloc;
>+
>+	xe_iter = xe_attr;
>+	pmu_iter = pmu_attr;
>+	attr_iter = attr;
>+
>+	for_each_gt(gt, xe, j) {
>+		for (i = 0; i < ARRAY_SIZE(events); i++) {
>+			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>+			char *str;
>+
>+			if (config_status(xe, config))
>+				continue;
>+
>+			str = kasprintf(GFP_KERNEL, "%s-gt%u",
>+					events[i].name, j);
>+			if (!str)
>+				goto err;
>+
>+			*attr_iter++ = &xe_iter->attr.attr;
>+			xe_iter = add_xe_attr(xe_iter, str, config);
>+
>+			if (events[i].unit) {
>+				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>+						events[i].name, j);
>+				if (!str)
>+					goto err;
>+
>+				*attr_iter++ = &pmu_iter->attr.attr;
>+				pmu_iter = add_pmu_attr(pmu_iter, str,
>+							events[i].unit);
>+			}
>+		}
>+	}
>+
>+	pmu->xe_attr = xe_attr;
>+	pmu->pmu_attr = pmu_attr;
>+
>+	return attr;
>+
>+err:
>+	for (attr_iter = attr; *attr_iter; attr_iter++)
>+		kfree((*attr_iter)->name);
>+
>+err_alloc:
>+	kfree(attr);
>+	kfree(xe_attr);
>+	kfree(pmu_attr);
>+
>+	return NULL;
>+}
>+
>+static void free_event_attributes(struct xe_pmu *pmu)
>+{
>+	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>+
>+	for (; *attr_iter; attr_iter++)
>+		kfree((*attr_iter)->name);
>+
>+	kfree(pmu->events_attr_group.attrs);
>+	kfree(pmu->xe_attr);
>+	kfree(pmu->pmu_attr);
>+
>+	pmu->events_attr_group.attrs = NULL;
>+	pmu->xe_attr = NULL;
>+	pmu->pmu_attr = NULL;
>+}
>+
>+static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>+{
>+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>+
>+	/* Select the first online CPU as a designated reader. */
>+	if (cpumask_empty(&xe_pmu_cpumask))
>+		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>+
>+	return 0;
>+}
>+
>+static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>+{
>+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>+	unsigned int target = xe_pmu_target_cpu;
>+
>+	/*
>+	 * Unregistering an instance generates a CPU offline event which we must
>+	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>+	 */
>+	if (!pmu->registered)
>+		return 0;
>+
>+	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>+		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>+
>+		/* Migrate events if there is a valid target */
>+		if (target < nr_cpu_ids) {
>+			cpumask_set_cpu(target, &xe_pmu_cpumask);
>+			xe_pmu_target_cpu = target;
>+		}
>+	}
>+
>+	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>+		perf_pmu_migrate_context(&pmu->base, cpu, target);
>+		pmu->cpuhp.cpu = target;
>+	}
>+
>+	return 0;
>+}
>+
>+static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
>+
>+/**
>+ * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>+ *
>+ * Returns: 0 if successful, else error code
>+ */
>+int xe_pmu_init(void)
>+{
>+	int ret;
>+
>+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>+				      "perf/x86/intel/xe:online",
>+				      xe_pmu_cpu_online,
>+				      xe_pmu_cpu_offline);
>+	if (ret < 0)
>+		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>+			  ret);
>+	else
>+		cpuhp_state = ret;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>+ */
>+void xe_pmu_exit(void)
>+{
>+	if (cpuhp_state != CPUHP_INVALID)
>+		cpuhp_remove_multi_state(cpuhp_state);
>+}
>+
>+static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>+{
>+	if (cpuhp_state == CPUHP_INVALID)
>+		return -EINVAL;
>+
>+	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
>+}
>+
>+static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>+{
>+	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>+}
>+
>+/**
>+ * xe_pmu_unregister() - Remove/cleanup PMU registration
>+ * @arg: Ptr to pmu
>+ */
>+void xe_pmu_unregister(void *arg)
>+{
>+	struct xe_pmu *pmu = arg;
>+
>+	if (!pmu->registered)
>+		return;
>+
>+	pmu->registered = false;
>+
>+	xe_pmu_unregister_cpuhp_state(pmu);
>+
>+	perf_pmu_unregister(&pmu->base);
>+	kfree(pmu->base.attr_groups);
>+	kfree(pmu->name);
>+	free_event_attributes(pmu);
>+}
>+
>+/**
>+ * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>+ * @pmu: the PMU object
>+ *
>+ */
>+void xe_pmu_register(struct xe_pmu *pmu)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	const struct attribute_group *attr_groups[] = {
>+		&pmu->events_attr_group,
>+		&xe_pmu_cpumask_attr_group,
>+		NULL
>+	};
>+
>+	int ret = -ENOMEM;
>+
>+	spin_lock_init(&pmu->lock);
>+	pmu->cpuhp.cpu = -1;
>+
>+	pmu->name = kasprintf(GFP_KERNEL,
>+			      "xe_%s",
>+			      dev_name(xe->drm.dev));
>+	if (pmu->name) {
>+		/* tools/perf reserves colons as special. */
>+		strreplace((char *)pmu->name, ':', '_');
>+	}
>+
>+	if (!pmu->name)
>+		goto err;
>+
>+	pmu->events_attr_group.name = "events";
>+	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>+	if (!pmu->events_attr_group.attrs)
>+		goto err_name;
>+
>+	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>+					GFP_KERNEL);
>+	if (!pmu->base.attr_groups)
>+		goto err_attr;
>+
>+	pmu->base.module	= THIS_MODULE;
>+	pmu->base.task_ctx_nr	= perf_invalid_context;
>+	pmu->base.event_init	= xe_pmu_event_init;
>+	pmu->base.add		= xe_pmu_event_add;
>+	pmu->base.del		= xe_pmu_event_del;
>+	pmu->base.start		= xe_pmu_event_start;
>+	pmu->base.stop		= xe_pmu_event_stop;
>+	pmu->base.read		= xe_pmu_event_read;
>+	pmu->base.event_idx	= xe_pmu_event_event_idx;
>+
>+	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>+	if (ret)
>+		goto err_groups;
>+
>+	ret = xe_pmu_register_cpuhp_state(pmu);
>+	if (ret)
>+		goto err_unreg;
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>+	if (ret)
>+		goto err_cpuhp;

now I'm confused... if you added it here as an action to be called on
remove, why are you manually calling xe_pmu_unregister() on xe_device.c?


So.... I have some stashed changes here with the suggestions I mentioned
above and will probably have some more once I get to play with it. Are
you ok if I just do the changes locally and submit the result?

thanks
Lucas De Marchi

>+
>+	pmu->registered = true;
>+
>+	return;
>+
>+err_cpuhp:
>+	xe_pmu_unregister_cpuhp_state(pmu);
>+err_unreg:
>+	perf_pmu_unregister(&pmu->base);
>+err_groups:
>+	kfree(pmu->base.attr_groups);
>+err_attr:
>+	free_event_attributes(pmu);
>+err_name:
>+	kfree(pmu->name);
>+err:
>+	drm_notice(&xe->drm, "Failed to register PMU!\n");
>+}
>diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>new file mode 100644
>index 000000000000..d07e5dfdfec0
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu.h
>@@ -0,0 +1,26 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_PMU_H_
>+#define _XE_PMU_H_
>+
>+#include "xe_pmu_types.h"
>+
>+struct xe_gt;
>+
>+#if IS_ENABLED(CONFIG_PERF_EVENTS)
>+int xe_pmu_init(void);
>+void xe_pmu_exit(void);
>+void xe_pmu_register(struct xe_pmu *pmu);
>+void xe_pmu_unregister(void *arg);
>+#else
>+static inline int xe_pmu_init(void) { return 0; }
>+static inline void xe_pmu_exit(void) {}
>+static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>+static inline void xe_pmu_unregister(void *arg) {}
>+#endif
>+
>+#endif
>+
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>new file mode 100644
>index 000000000000..4da96b8fadd1
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -0,0 +1,70 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_PMU_TYPES_H_
>+#define _XE_PMU_TYPES_H_
>+
>+#include <linux/perf_event.h>
>+#include <linux/spinlock_types.h>
>+
>+enum {
>+	__XE_NUM_PMU_SAMPLERS
>+};
>+
>+#define XE_PMU_MAX_GT 2
>+
>+/*
>+ * Top bits of every counter are GT id.
>+ */
>+#define __XE_PMU_GT_SHIFT (56)
>+
>+#define ___XE_PMU_OTHER(gt, x) \
>+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>+
>+struct xe_pmu {
>+	/**
>+	 * @cpuhp: Struct used for CPU hotplug handling.
>+	 */
>+	struct {
>+		struct hlist_node node;
>+		unsigned int cpu;
>+	} cpuhp;
>+	/**
>+	 * @base: PMU base.
>+	 */
>+	struct pmu base;
>+	/**
>+	 * @registered: PMU is registered and not in the unregistering process.
>+	 */
>+	bool registered;
>+	/**
>+	 * @name: Name as registered with perf core.
>+	 */
>+	const char *name;
>+	/**
>+	 * @lock: Lock protecting enable mask and ref count handling.
>+	 */
>+	spinlock_t lock;
>+	/**
>+	 * @sample: Current and previous (raw) counters.
>+	 *
>+	 * These counters are updated when the device is awake.
>+	 */
>+	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>+	/**
>+	 * @events_attr_group: Device events attribute group.
>+	 */
>+	struct attribute_group events_attr_group;
>+	/**
>+	 * @xe_attr: Memory block holding device attributes.
>+	 */
>+	void *xe_attr;
>+	/**
>+	 * @pmu_attr: Memory block holding device attributes.
>+	 */
>+	void *pmu_attr;
>+};
>+
>+#endif
>-- 
>2.38.1
>
