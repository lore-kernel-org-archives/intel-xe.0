Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0EBCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 03:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7F810E03A;
	Wed,  8 Oct 2025 03:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4umIUWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699410E03A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 03:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759892780; x=1791428780;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QikfjiwEqYTqcbI3YgFYMts+9lyboJmN33uqlK2iKWc=;
 b=V4umIUWPbQ13hpJZvM0zX1iNKBC3iPD9XzP7umnqgIe/Yoe+hmIKntjy
 d1vrAV0OP0DziBgUxB0sIvCt373WeeFgLRrLdCicyDfI93qnprlKgD+Vy
 9wS9mqJE+ezKbqHjcmL9xuIgdClF15CXHVd5m7RXnnS4glFVXz7evcLRb
 0jVDB+rP6Wnxj7vaVxH7o3TGImKGgbMAHNBpbN/B+5ITOR+vl+JnmTIqi
 8ySlOoSQVu/5677X6TPRVQnN8coAJ3MPM49eWF6vMdkY5N7JgMqZH9ZlE
 Nf8fZnxwr6+KUM8Z2QufJ5JtNZM8tijNzjoLvX6uq2IwRa4hFgZaBwyDT g==;
X-CSE-ConnectionGUID: UaxUifd4RluMkkKtMgsbrQ==
X-CSE-MsgGUID: +UiQX9krQ6mEColaPsrvyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73184268"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="73184268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:06:19 -0700
X-CSE-ConnectionGUID: SxswOjY5TISQR6fdDqRk7A==
X-CSE-MsgGUID: 3ZMW7ZpTRYKFUR7VtuRZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179459376"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:06:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:06:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 20:06:18 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wD5fMkiR8I1AR2UvIS8y7TOcwni0Z2u8ZGPLDvYPFudLIOFipucP7xgljdMAjabdnId8WiVw3yriVAVl0eUxvHriOWwuhu+xzG4d/iGfc1dlm7vXv+RAmKJauuQvGWlZQjDmnxNZz1ZcvmKLVbaIw4wmdWpp0NWzZ9WYrY7JoQttsiuCEenkjMfu2D9hojDZwQ9AZpPUyyVnw1xVQn3YhX/Y49uZ8j8B1KhQdOC9XT0/yuURre3mwWYQ91/RoBzgbEwIRoX4a8OWKm0TKxUhIxBkjM/FUzdRvboXy/po2edUUZqmQMIVp9uYp1QXx8xNXtHgiwDr7PAtRtUPNu1tVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEI3Hh8Q2XwGOCDZ1Y98qbfI4QN9hZMoU/aaCFvmhBE=;
 b=tWeKeZr2O+Zoq9QeJsROUJfZnVq7M91tVW54vPCFdjhFhMput1UunNBSrsyfoRdSpY/8EcSDS1Y3ItXRP9mBb7qR4ITmgYxpaycUTka8q/uYl6LeNMYB1NqbSdLu5akXExxY/VSMEHvI6b0CCPv3C/9TyY+C7Pe0NMGmBJ9DXsTgJTMAK+FeVjC5JP09EVbdTgfDOps8J6rXaENZG94aqWg/3h5Dk1rJIhMvUl53maJoSrrCMzjArk+K5OZsEAjYfGEX4pJcmMMdvnor4HkXCmq5msc/W3k4uwQKOHVaLpb6m8YHZ/xnRbOQM4u9n4hWKcjzHhacTggHsL0i6Ub9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 03:06:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:06:14 +0000
Date: Tue, 7 Oct 2025 22:06:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 07/23] drm/xe: Read VF GMD_ID with a
 specifically-allocated dummy GT
Message-ID: <372uwz6ma4m5uioxhyawtfmrdpvnuxeqdluyvyqaywwxlapdv7@snwr46gzmkib>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-32-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251007204829.1468209-32-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a2aa02-c0e8-4a98-4e93-08de0617a40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gdu4FWZusEne/ot5SOflFghur9vkHAF4o+3hUx/p7EjpADhEUtSk3Tc9ZIs+?=
 =?us-ascii?Q?201SC64GZgGiiysyI5J+2dSz5D9xt8CEfOGTy/P/Qso9NiQYAe7ZaqBD4cvQ?=
 =?us-ascii?Q?io6rT7D7/EOFhUHOKZoXP73SNPnODcktuOGoboQHKowi07PJhDIkWOaWWibk?=
 =?us-ascii?Q?TuuwAUTpltRJWaZA3tf0/K00v5YIBKjcVJVcB740668pDeOCXsgVQVcgIVU4?=
 =?us-ascii?Q?QpEMKI+keT0k7f3Ipz2SLv4B6NeyBkFqkVLUp9zCjefP3qhoWr4xZzDgyC5c?=
 =?us-ascii?Q?aIHlhYTjH88SMnjQXChonG46B5DzVmxY1wA26j3fg4nn4snJaSbAkSxR1+Gs?=
 =?us-ascii?Q?0JWwkLmHyfuIAtNTP0AxA+jq64okZ+F+gD3Xa/izcmzWyDjp3BjfC4+Da4Ha?=
 =?us-ascii?Q?v7AI/8XmfYryPnRnFi0guW2hMgg/JgXS1waH09jms4oR9geoRcnCa6zX25Lj?=
 =?us-ascii?Q?8ezZptxKKfWKUyPNpSdynXjKjDWdWA8Sr6Qp6waL3DyfZMW5CuEjK5lMFArp?=
 =?us-ascii?Q?pn/YFpqWTTPBfzevRLRWPyMRrZVhNsUw+HoP4dDkwgsoGrJfx4uoedH7EYzB?=
 =?us-ascii?Q?LlTISdpGdRqfoVQR3ReTJsc8cM9m6GaHB/5BXF4Ow9GunJt/CMfiVj8XsXtG?=
 =?us-ascii?Q?WRqo5CMSlgZ/tYuMwwvLRrtjfIWWzv/mmS76FOr55dIwYK9A4Y44kFK/AyTR?=
 =?us-ascii?Q?eoH+rk+cfabbM1Wab2dc68JDUd78LUOUatn0ntuOMBKJL1FmNomYP5B6W4kS?=
 =?us-ascii?Q?tYIgvpWpWwd3GX+5zhR/sezL16SJ/sSzzzm5qFdRijG3jM9FdFFv95zTvyP3?=
 =?us-ascii?Q?Uv5yxtRmLK009vjV/GAlqZHMOV3uRKKQjJcepUpUTVPPW6YvLqyQdr6mAiPy?=
 =?us-ascii?Q?8ThXG65raJixbgiBIoq8ozfWZ94aqy/qy4xAlEtH73cNOqwo2W4eE4gCFBud?=
 =?us-ascii?Q?8IlSQSEapw1sSDPD4a5X4S1cMg4uhKD69TPewxci6mJ5Q3CauVv2WZMl/Iaf?=
 =?us-ascii?Q?BLR1i1rh39rEt9DKTkJNJ0zk2VBxvZ+aNFbqLRPyAoAzjQnOcoLCU/eBRy/x?=
 =?us-ascii?Q?RZH+tRnMXkiEzucTiARVOxHeZL+ljC/jlhS79giiKNeGSJyLmJZJyNsFkR5j?=
 =?us-ascii?Q?EVyaomdMGUjT/FfNPKrxLVPRSfgUvU+Kci0Qr58yBd/vQ6514Yx41Qqeq0aA?=
 =?us-ascii?Q?jooKzIr2M3tggZlyN6WQurxJlXdk8gXnf2u3oR1TC/xuqlb/AOmHKm06V20+?=
 =?us-ascii?Q?TK2eJSIg5bk+p2VWvnIlara3iF/HpzGcFoJ4bvYAMCxwO6K0mItoQzygiBLT?=
 =?us-ascii?Q?cOpjwkord/UVgx0TcdmZLK7YugsBZKUdKGv3ORhq5Cm0LAYgszaAw3hQ/9Ty?=
 =?us-ascii?Q?Cuim8TQtF/ip4j8ywRbdFXLXYPUdkPtZHmHbCWPQ5SuCkhrHoKJ8CLB8apYh?=
 =?us-ascii?Q?HK/+dmW4z0e1dPPPJNrfQGY+ER/L65k6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJ7972T0OFJc/vUsFmQTFJTnm4cBw1bPEVzc/2mV+CrmNNHq1ZGYcZTyLVfq?=
 =?us-ascii?Q?rpXO2UfIwWR74i3G484Qgzj6/+ZvPj7FaLGfBVg2EAz5/f6L7JPPx8+hNNIj?=
 =?us-ascii?Q?sEfl8gY4FgPOqt3j77Nizc7cUGQSH6bEp4ilVHOwr68mpmO3DKAO3Mz0oq4a?=
 =?us-ascii?Q?zQWeRPXPGb8lRGf4uC7DYQDvGdGKtnatAv0eCyd1VXcWlm3OIu8XL0M89Tbt?=
 =?us-ascii?Q?IqXTMfiAl4rkdekZsxBAlXK9pa8jt6oQwgVlls4AAJSU9ThtnFH5333BjLB/?=
 =?us-ascii?Q?DMksQT9CN8XkHwET8BfHmcX6D3X7k7EcAsIZ1eVnlP4jzLcB2ckICXNwh+F9?=
 =?us-ascii?Q?RvmFEpiCSowjkWrkoU8TKaP/hZsDWZBlA4+l80vtY8/6hJ6qjcfkqjkmp+Jz?=
 =?us-ascii?Q?ybRRyAaJ3/zR+eXIkfLaMf/9S63AlmlsB0Uvv6KWBtt/+lWbG9yVZUeRsqhz?=
 =?us-ascii?Q?3qC2A95apHHyunJ/v7tzM2xazUMVfkiuZwfSj0gdH/UYrCS3ey/Ks7xkTlc6?=
 =?us-ascii?Q?PLN2LWQchVl0UNMtJ8Olm2lXJoKL722Wh00udfCnyeZ5UVswocl0w7vIrWRA?=
 =?us-ascii?Q?bJCcOtkXPmPEmE/vX10jU/rfb6i1rf9Lp4swNkpSzT3G/SgBq+7bnDEAI7rP?=
 =?us-ascii?Q?LZB0RY53hAEJDXuPNEgxoXctlVwDKEbWxOMPKuOptHkOFok2XEfP5QaXeUYv?=
 =?us-ascii?Q?mu0zyPSOrmcq7VeNpXoF92dVZxCjUYuHjzSlQqg2Fx4Oy2MGPVl124bSfLQP?=
 =?us-ascii?Q?q33t5ndxAck7d/ttLRD6Ii8ObS/o7bzO6mvJ7K6PsisTJosCgxVGvHu3Z7vQ?=
 =?us-ascii?Q?avPLJq1EpDkwRdR0Ypylnn2zAT4q71Fuonw4cd6dbaM2FCmseNjTgacxYNoo?=
 =?us-ascii?Q?rcX2vQXk/GToWiJS9zeqw0EkhzPPmd3sGw6oPJNhFQkdtA9NvFM0Lv7q6bTM?=
 =?us-ascii?Q?jC+qfRF7NTrqUNd5xLYsbCBoinWgeBYfUJoch1Fky9x9kej9lGwuBRul1+f0?=
 =?us-ascii?Q?HRvlG7rMEo62hppbXtzDzWRih8EP2DHjjL/RQJj+UqlfAPuPUwJcgFrrAvua?=
 =?us-ascii?Q?0A3acOoaWxntIK7I7Vw+5Bz082LBH/pBHnUKuIfbjzjcdVhBzngaNjZqrnWC?=
 =?us-ascii?Q?DkQVwDvJZjlOLOeb7iMnS7h4ncG9L5D/1Tt9HHq4g6ukgIosyP+PTiyv/06D?=
 =?us-ascii?Q?mkIH2qIHhAjl2aYpDhrwl4hacebjnqQIfhk63Lyi23hpOnJMfIZs2PJ6SOer?=
 =?us-ascii?Q?x5Bu/mF1L5z2yDROJ5o39aMbiu+mY85d9XqVx1DOinhvktKfFaM7i+RB7JOM?=
 =?us-ascii?Q?gB8rnzNo3o13j4vkyFHIZuOKPr4mbwMXVbzKsFH2L5Xj4O9mP52uuxQGj0tM?=
 =?us-ascii?Q?g0x8iB12p0eCWg1FGWsbFVOcElE5xiWsRHBXtNY6woC55qDKG9n9tuOZWm3a?=
 =?us-ascii?Q?Day7tNG8aihkUicZVpLpk118WSnSO99W8o1UC3L6eCtU/neYPsy+TEPpuVVr?=
 =?us-ascii?Q?ud9wlikxIDZE3K4rb1q/HSlSaNmgZlPtrPlZwcPlrdEyt0BMzL+aTthRC74N?=
 =?us-ascii?Q?YAh7G+w/DxYCoOxV6/sr5CWSR/RxqIuGMETrGkm/EpB7+GlAPFBKOKf/Osiu?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a2aa02-c0e8-4a98-4e93-08de0617a40b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 03:06:14.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxN+lrIpK74kV/6DCtCuSz4NAf17JcCLTt+cL0JaBNakzYP9YXdfIpS2R3S50ZeKWIxZ6B/K/Udi4I0yhnZnALdyPUv2ITvcYSCh/cURbeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
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

On Tue, Oct 07, 2025 at 01:48:37PM -0700, Matt Roper wrote:
>SRIOV VF initialization has a bit of a chicken and egg design problem.
>Determining the IP version of the graphics and media IPs can't be done
>via direct register reads as it is on PF or native and instead requires
>querying the GuC.  However initialization of the GT, including its GuC,
>needs to wait until after we know the IP versions so that the proper
>initialization steps for the platform/IP are followed.
>
>Currently the (somewhat hacky) solution is to manually fill out just
>enough fields in tile 0's primary GT structure to make it look as if the
>GT has been initialized so that the GuC can be partially initialized and
>queried to obtain the GMD_ID values.  When the GT gets properly
>initialized during the regular flows, the hacked-up values will get
>overwritten as part of the general initialization flows.
>
>Rather than using tile 0's primary GT structure to hold the hacked up
>values for querying every GT on every tile, instead allocate a dedicated
>dummy structure.  This will allow us to move the tile->primary_gt's
>allocation to a more consistent place later in the initialization flow
>in future patches (i.e., we shouldn't even allocate this GT structure if
>the GT is disabled/unavailable).  It also helps ensure there can't be
>any accidental leakage of initialization or state between the dummy
>initialization for GMD_ID and the real driver initialization of the GT.
>
>v2:
> - Initialize gt->tile for temporary GT.  (CI, Michal)
> - Use scope-based cleanup handler to free temp GT.  (Michal)
> - Propagate actual error code from xe_gt_sriov_vf_bootstrap() rather
>   than just setting IP version to 0.0 now that read_gmdid() can return
>   an error.  (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
> drivers/gpu/drm/xe/xe_pci.c       | 70 ++++++++++++++++++-------------
> 2 files changed, 45 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 0f136bc85b76..969f1dacade8 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev, char *desc)
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>
>-static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>-			    u32 *ver, u32 *revid)
>+static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>+			   u32 *ver, u32 *revid)
> {
> 	struct kunit *test = kunit_get_current_test();
> 	struct xe_pci_fake_data *data = test->priv;
>@@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> 		*ver = data->graphics_verx100;
> 		*revid = xe_step_to_gmdid(data->step.graphics);
> 	}
>+
>+	return 0;
> }
>
> static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 37ae49f4b648..02655cf9244d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -464,7 +464,7 @@ enum xe_gmdid_type {
> 	GMDID_MEDIA
> };
>
>-static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
>+static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
> {
> 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> 	struct xe_reg gmdid_reg = GMD_ID;
>@@ -473,22 +473,24 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> 	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>
> 	if (IS_SRIOV_VF(xe)) {
>-		struct xe_gt *gt = xe_root_mmio_gt(xe);
>-
> 		/*
> 		 * To get the value of the GMDID register, VFs must obtain it
> 		 * from the GuC using MMIO communication.
> 		 *
>-		 * Note that at this point the xe_gt is not fully uninitialized
>-		 * and only basic access to MMIO registers is possible. To use
>-		 * our existing GuC communication functions we must perform at
>-		 * least basic xe_gt and xe_guc initialization.
>-		 *
>-		 * Since to obtain the value of GMDID_MEDIA we need to use the
>-		 * media GuC, temporarily tweak the gt type.
>+		 * Note that at this point the GTs are not initialized and only
>+		 * tile-level access to MMIO registers is possible. To use our
>+		 * existing GuC communication functions we must create a dummy
>+		 * GT structure and perform at least basic xe_gt and xe_guc
>+		 * initialization.
> 		 */
>-		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
>+		struct xe_gt *gt __free(kfree);

I think it's bad practice to leave it unassigned. Either assign it to
NULL or do the kzalloc() call here to avoid it having garbage if in
future the gt assignment is not the first thing in this scope.

other than that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		int err;
>
>+		gt = kzalloc(sizeof(*gt), GFP_KERNEL);
>+		if (!gt)
>+			return -ENOMEM;
>+
>+		gt->tile = &xe->tiles[0];
> 		if (type == GMDID_MEDIA) {
> 			gt->info.id = 1;
> 			gt->info.type = XE_GT_TYPE_MEDIA;
>@@ -500,15 +502,11 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> 		xe_gt_mmio_init(gt);
> 		xe_guc_comm_init_early(&gt->uc.guc);
>
>-		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
>-		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
>+		err = xe_gt_sriov_vf_bootstrap(gt);
>+		if (err)
>+			return err;
>
>-		/*
>-		 * Only undo xe_gt.info here, the remaining changes made above
>-		 * will be overwritten as part of the regular initialization.
>-		 */
>-		gt->info.id = 0;
>-		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
>+		val = xe_gt_sriov_vf_gmdid(gt);
> 	} else {
> 		/*
> 		 * GMD_ID is a GT register, but at this point in the driver
>@@ -526,6 +524,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>
> 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
>+
>+	return 0;
> }
>
> static const struct xe_ip *find_graphics_ip(unsigned int verx100)
>@@ -552,18 +552,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
>  * Read IP version from hardware and select graphics/media IP descriptors
>  * based on the result.
>  */
>-static void handle_gmdid(struct xe_device *xe,
>-			 const struct xe_ip **graphics_ip,
>-			 const struct xe_ip **media_ip,
>-			 u32 *graphics_revid,
>-			 u32 *media_revid)
>+static int handle_gmdid(struct xe_device *xe,
>+			const struct xe_ip **graphics_ip,
>+			const struct xe_ip **media_ip,
>+			u32 *graphics_revid,
>+			u32 *media_revid)
> {
> 	u32 ver;
>+	int ret;
>
> 	*graphics_ip = NULL;
> 	*media_ip = NULL;
>
>-	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>+	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>+	if (ret)
>+		return ret;
>
> 	*graphics_ip = find_graphics_ip(ver);
> 	if (!*graphics_ip) {
>@@ -571,16 +574,21 @@ static void handle_gmdid(struct xe_device *xe,
> 			ver / 100, ver % 100);
> 	}
>
>-	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>+	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>+	if (ret)
>+		return ret;
>+
> 	/* Media may legitimately be fused off / not present */
> 	if (ver == 0)
>-		return;
>+		return 0;
>
> 	*media_ip = find_media_ip(ver);
> 	if (!*media_ip) {
> 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> 			ver / 100, ver % 100);
> 	}
>+
>+	return 0;
> }
>
> /*
>@@ -690,6 +698,7 @@ static int xe_info_init(struct xe_device *xe,
> 	const struct xe_media_desc *media_desc;
> 	struct xe_tile *tile;
> 	struct xe_gt *gt;
>+	int ret;
> 	u8 id;
>
> 	/*
>@@ -705,8 +714,11 @@ static int xe_info_init(struct xe_device *xe,
> 		xe->info.step = xe_step_pre_gmdid_get(xe);
> 	} else {
> 		xe_assert(xe, !desc->pre_gmdid_media_ip);
>-		handle_gmdid(xe, &graphics_ip, &media_ip,
>-			     &graphics_gmdid_revid, &media_gmdid_revid);
>+		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
>+				   &graphics_gmdid_revid, &media_gmdid_revid);
>+		if (ret)
>+			return ret;
>+
> 		xe->info.step = xe_step_gmdid_get(xe,
> 						  graphics_gmdid_revid,
> 						  media_gmdid_revid);
>-- 
>2.51.0
>
