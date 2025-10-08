Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AECCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 17:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A4610E879;
	Wed,  8 Oct 2025 17:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S94tv904";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1510E879
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759944887; x=1791480887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LDF7BSe4Z3EqDzQp7ArgBHqcORU1vF8xnrbL0/ksFEc=;
 b=S94tv9043e9qnuuL2J6Np7CRjtTDWWlLOTqXQA3KPxlYsCH3WSkcG9Pi
 IQzILGSW+fRk+RORcus6zr/oTh85tbB4+o8yXgaxtcJS5AdP7qSbVI12V
 3O1+/bfJGTeyeU7PhVCPlXisx0nYkideeseFeayDil6MukmuidDLJ/lF9
 9L3qWvavQd/KSQyXqYScMX9XM5saAXwwy6m/wsmuGCatm2QDW0PBm/Czz
 /A/zMyPW0QPPtjuFh3LCvcSzDkjxQtgGb28u8l9G2IyTuR07wLZZr1KGy
 1TnH8OOEHVl2G5PGXbwBxcoLEYzHdaWh4wVW/YvkedBlwFRieRrbDX5oc w==;
X-CSE-ConnectionGUID: ZSUPwhCASKqGh3j0L5nEgQ==
X-CSE-MsgGUID: vibWj1NATe+q5+VMKFeA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62310640"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62310640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:34:46 -0700
X-CSE-ConnectionGUID: xcVRtmv7RmaNAmmsJ5GvwA==
X-CSE-MsgGUID: jP5W+uOLR+y6tEZZUeKg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179757479"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:34:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:34:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 10:34:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4/npe1CJTNo0warBEVw+uZQ9jioDI2z+raCBNqUYySTvlRxwWwR+ij2WxpelO0dLmOFQLfmoLUNLMd8bU4zeL6/J176dABu1cJ9cGAHWNloK65eqSGWW9FThLNezn3aVN0MixUbyRlBVhsXb4TAFWT1RJ2cZ36etUqkSBbRGjuAxXgiQGGmelK/t/U+CNAhvWKQ/fLv6jusrbCKYMSbVuPls1ElwV6+9S0Jr8tp314z5wJPM30ZqxP22JJ6bl2TuMd6Idh984mvdUillEXJAEcqk2qC+eBaygETCwFT1tsi7L9mp3O2x66iHwGyyBy6CM0MdfsLCxd4zBjp1QvDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlvV/vwVcEN/MWQCv5odgtpnmUsn5Sakp1EK7/ZwwAY=;
 b=OIbr31wdscJ00ZKom600WpuUKzmw/1ZX899uCQt6YHr4K2NG1LFPgAn1e3Jh24gltadKgQ0ntGxZnjDmEcaVM38Kygj19Gq7R0sB9QtQsWyieTJKJ0kPi6xZqzVBDGIJwlOOWSMc9AT6mxo7KpZuWJsKQFSN6jLylSWGrpJYTr2PyeB9I/QKTH98YPqRgPrOK+wVAULfOkLz65DyD7kfrodEVXS33CxzKQiH2Lz1G8E5X1vLmogK5tPeRv+vRw+qO4iWoEuCEK3fmbv9/BMa8v3bCs+UpNUHr5eX1hRvOo/dRSnuEDbw8QsA50s1BDwfA2ukiWgusSNkBO6vVDDWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 17:34:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 17:34:43 +0000
Date: Wed, 8 Oct 2025 12:34:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 30/33] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <hkcpnzxiaqfhg2lmybxic7yu64xlxbbkmlnfhuskwz3j6u5c2b@inra7uazkxiq>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-31-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251007130505.2694829-31-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: abcc0369-9a33-41e0-5023-08de0690f75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BDQ2mk4+tODkrXHhKADkmvkSeWC8q0TasiNREqH/AAuCJUbMF9A/4P4qYZup?=
 =?us-ascii?Q?JPagDv4DA7gHozR9sHT8MmJplPv8TGmlwdysGG/TeErS4X1txeYRSPR39IR2?=
 =?us-ascii?Q?Hpz6WxDaJt6duyfoU/R5x5YCrUUdbE6yYQbUMo1Fk18fsF97B8WD9d65wRA+?=
 =?us-ascii?Q?aNrrgkHC7oNMGyMuSNSOmb+wjwcgskAVhuhjAoGi2In6u5A8i02bvhk1+M5+?=
 =?us-ascii?Q?otDuWPb3wsg6IO5LwaKl3kljM/QlW9CxOk+E6uF7+hOkG8GVu74sTRZsNBhD?=
 =?us-ascii?Q?1fpoivWqw9Qk9i5ALCmvXSRf6WZoauFQ3KFn5GEkQlTx+oEtOjLiothfLOoj?=
 =?us-ascii?Q?5/Amo3fg/nzXJGB+G6m5dEN1BSbfZAwfq+wpUbpyqjoVM+AUM9rgwegI8dO2?=
 =?us-ascii?Q?N50qfPtu2Wvk2Rve3hu2MSd4EZC/HSEfeTt+58niHP0Egp6LDaJlFMUHItyX?=
 =?us-ascii?Q?D1d07LXzpi/h8BWwRCZtMxZDyQBuHDDpsNlZxXpWw1TdX2lgCEf2VlUtagYR?=
 =?us-ascii?Q?34O4l5buKfN2UzsNM7iEmQuXscvI0AQWbWeko27Afn+2yz7outOumNbsuiq3?=
 =?us-ascii?Q?w6w180B1qifjAEZ8pc5NNa1FR+/BwRTpkjZeI1WrS99NGJCpnCOFNruiQ/r7?=
 =?us-ascii?Q?I1rg6ZbP9rJXfa8FCck2WN/0LM+BusquoblfIaItrJHP0edqXZGx1jWPgKOu?=
 =?us-ascii?Q?oQ4C7+boaqoFXT3AYknm/cteZr/Cq07XrSInVdugMf9NGJrxTte2b0+FlIvk?=
 =?us-ascii?Q?OH6Hrve6QQORb8/U2NIZlVJoJ9hhgZ6BI8G2O++sdHlrf8hNeZmNIwtwcUft?=
 =?us-ascii?Q?FrjmJsFuYt9WP0fy8tXqrEE3oeqaDrEG1Vb7oQcCZf4nblyviaDxsBmhn7ld?=
 =?us-ascii?Q?jY4OzY8cC/uX8mRKDMH9nZZ5dPmaY2r4OvW+A9T1GBc7fMT0QWvAfzFYvDLw?=
 =?us-ascii?Q?QMeWJ9eBOdvJXvZXJUVKJUanH0bHw0axOQKMr1YIFz9h7N1VcAjdq72C1aLO?=
 =?us-ascii?Q?56h6y+DwIOLFwtSeyY42N7t7SDYvwgd/djUJa7kzpEMFVM/WuXgRpmMKUIIB?=
 =?us-ascii?Q?XPCV/YQLHfQ/EyrmlrIIbttJKBfgtmbHU769yrkIqwzl0/2rMTIC5P+K7uME?=
 =?us-ascii?Q?/vPsyTf+CgShXXuNJptjHuuckwu18UQ8FmOcFrIPpbZ3ThoSlUyCwCXenr37?=
 =?us-ascii?Q?FBX2UtIo41yvlA84yoQ7FOYdHunV29zVAZhhG9jX4+osntjSEDjCdWrbDiBT?=
 =?us-ascii?Q?+rLkdxXb+KRxSpDMEF7BLFCLounaaPKOe6qqKFh/ReUjzocobLaYSyhJLgBj?=
 =?us-ascii?Q?b9A6T7ZV+nbnMxcOzif4WVBp4j6+0XkZ1dF2FXf8y4PX8eQ5ec6C93Xfx/Y+?=
 =?us-ascii?Q?Gn5ePLhcbKe5+3vXgqP3A2x9moNAXjy0STB81e6ppbKGSvFQWtdyDhw6+G9e?=
 =?us-ascii?Q?c6CLPS5Io6D6cCy4qEyGeLjIbMCBbOtG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6xhIIwP1krTuNcLPwekfDN95uoBtlNpEn7FyNZ6pnWfLqDktHtL/QWP/bdn?=
 =?us-ascii?Q?NfLYGH5jQdVmTKNI1EIwerNhfxbgTOnUQ62zn+tWH+NgH6oKiK47e4n9yAyH?=
 =?us-ascii?Q?1YLd6TddewpkQHG3GVy/zI6w+ka/fNrVlaR5oCMTkzoaCL4lKdMZqh/9j7jr?=
 =?us-ascii?Q?H8buh3Ur8rDPFKyuBdvX/b9H081BPgjqUcKmCplWDZbTdOhCHklADsirYSiZ?=
 =?us-ascii?Q?bIm0QLuEa79i58zZ4ooh1swDoj97TB61M+tvAGEoafodYC8tdPzFALO1vo4U?=
 =?us-ascii?Q?bpd4Xp1iQzaUglWhWNUgRuE81UZI1tG9iwefQ/JUsMhTTe+qAnnt+5jIJhRh?=
 =?us-ascii?Q?5wNAO7l8G8lCJRCoS68O1IFaw9pToOfddP1IDMWDPiKdiWAaA7ubbLhdIt/S?=
 =?us-ascii?Q?/q0b9ZmZvDFw2dX+YTq9s8mPbORVBO6bHFbhF/no13tK5sEkpiksdh01Dg6m?=
 =?us-ascii?Q?JHtSs64MPDNuhgzgLPORajLLGNE/yEfzB4XSB7VKCjGcwV8rMu0lMuaeJ/hZ?=
 =?us-ascii?Q?/VnvLJYFf+2wRmufTTaB8pVJEQgjCOqHs7Qd/TEtsxdA13L6Qf57I+IcmG6A?=
 =?us-ascii?Q?0vcwRSw4eB5hNhg2NOhLo6JfUaOJAcTLHdGOeLabGY3uEXlbt+Hu4W8uQfhy?=
 =?us-ascii?Q?H64LGiajy1nWtBjgofw59sDe9a9Yaq0yGLCt0+RMFqhaFx5FOTrEO+7cElWN?=
 =?us-ascii?Q?Vis5yXijEbjzdBNMKEYMO/Mxs9QHDHLv0RE6lKjeqf59Z0MBgKTTae/gIEZa?=
 =?us-ascii?Q?fNr+GEUXAiOiQth9aFTZyzegu1FOnC6x9YvvXjDOz0WTpXD++fYv4KldB0tR?=
 =?us-ascii?Q?g9gKuMRcwQghfN0Aj7AKODJYkr1ge+m+CARpfgp5sr4/+CqiiZPj12qLJjDy?=
 =?us-ascii?Q?inwiPx0rnloA6v91+NuhnvTlcs2O/cnAIytqlVq8nDfeRlBbKje7FX3qVgZ6?=
 =?us-ascii?Q?YiQR9WpXJm6S11T0aoJvEGegPBdeNwlxcoe574InIfdSeLJtBqRthyjollZ6?=
 =?us-ascii?Q?hnlAt8GFCHNYS7G6OzTZnpmJEq4xxI7WOF+W9PoESkjXu771QhXG7uGLgzj3?=
 =?us-ascii?Q?VvqRJDqnZmdgVMu4DKeQQMVqPm+DN867jq6lsZpiwYKqoZ8yNWEyFOP1LDfW?=
 =?us-ascii?Q?S5/ZHEupiNs9JzPqf1MsfDI4W+jsWt2PeE+atu5KqTWNiLolUQBGnmeQajU4?=
 =?us-ascii?Q?FooDUHdMZDM29Otd0jhZIx3Njbpq8SwICZ2V3n6TBkL7XHIhtbDM+pnwQcDP?=
 =?us-ascii?Q?Lw7wUEbjjppS7hpAJ5dZbUs/+lfZbPisFnwNx1S9UJUs4PYfPVQmY1BK0Gu5?=
 =?us-ascii?Q?R3T9rr7gCDcooQM3H2beVUk5N9PWxdlrHSYOBuchB3n76Rn39rQDS0RlkfoX?=
 =?us-ascii?Q?vKgAqQ9rn7E/DOvyVEnPjR7un8c5mSPmNJPtre3ZHiZ7JOwN9kYv7ZNTDIbW?=
 =?us-ascii?Q?nGgfFj+UzKqxBvxrQgQKyfzlZZKVvN1GTVpSpDl8YxLJ/NHoJYoeN1CO0rqj?=
 =?us-ascii?Q?2KXVXNl1OEGFNHJYggI4h3+TaXOmuFKyjh9SeIzQT3SF32izb1ShFiDxltpB?=
 =?us-ascii?Q?oVliiohSD4vQkyCz+6wANXoEv/jegoPbyK1sH/vHKVcaIrxNRI2NS91hSZ68?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abcc0369-9a33-41e0-5023-08de0690f75a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 17:34:43.0769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaGECafpBqzAGXpKZM+cqehcz5L7mja1fBdxqbQ+k1ceeExwvK7oBydTYSsxJI8a9H5J/q32phU1+2CqYH0KyyYKiP8l7NW1suhyIHvWPm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Tue, Oct 07, 2025 at 06:05:02AM -0700, Matthew Brost wrote:
>VF CCS restore is a primary GT operation on which the media GT depends.
>Therefore, it doesn't make much sense to run these operations in
>parallel. To address this, point the media GT's ordered work queue to
>the primary GT's ordered work queue on platforms that require (PTL VFs)
>CCS restore as part of VF post-migration recovery.
>
>v7:
> - Remove bool from xe_gt_alloc (Lucas)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++----
> drivers/gpu/drm/xe/xe_pci.c          |  2 ++
> drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> 4 files changed, 19 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index c66523bf4bf0..02c04ad7296e 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -334,6 +334,8 @@ struct xe_device {
> 		u8 skip_mtcfg:1;
> 		/** @info.skip_pcode: skip access to PCODE uC */
> 		u8 skip_pcode:1;
>+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
>+		u8 needs_shared_vf_gt_wq:1;
> 	} info;
>
> 	/** @wa_active: keep track of active workarounds */
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index cf484a2da35e..f2a4dc58e26c 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -67,7 +67,11 @@
>
> struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> {
>-	struct drm_device *drm = &tile_to_xe(tile)->drm;
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct drm_device *drm = &xe->drm;
>+	bool sharded_wq = xe->info.needs_shared_vf_gt_wq && tile->primary_gt &&
>+		IS_SRIOV_VF(xe);

good, I like this extra check for tile->primary_gt here.
There's a typo though... should be shared_wq, not sharded_wq, since that
would mean something else. Also making IS_SRIOV_VF() would be good since
you will going to change this line. Feel free to keep my r-b if
re-sending or tweakin on merge:

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>+	struct workqueue_struct *ordered_wq;
> 	struct xe_gt *gt;
>
> 	gt = drmm_kzalloc(drm, sizeof(*gt), GFP_KERNEL);
>@@ -75,9 +79,15 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> 		return ERR_PTR(-ENOMEM);
>
> 	gt->tile = tile;
>-	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>-	if (IS_ERR(gt->ordered_wq))
>-		return ERR_CAST(gt->ordered_wq);
>+	if (sharded_wq && tile->primary_gt->ordered_wq)
>+		ordered_wq = tile->primary_gt->ordered_wq;
>+	else
>+		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq",
>+							  WQ_MEM_RECLAIM);
>+	if (IS_ERR(ordered_wq))
>+		return ERR_CAST(ordered_wq);
>+
>+	gt->ordered_wq = ordered_wq;
>
> 	return gt;
> }
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3f42b91efa28..f8243622429d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> 	.has_sriov = true,
> 	.max_gt_per_tile = 2,
> 	.needs_scratch = true,
>+	.needs_shared_vf_gt_wq = true,
> };
>
> #undef PLATFORM
>@@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> 	xe->info.skip_pcode = desc->skip_pcode;
> 	xe->info.needs_scratch = desc->needs_scratch;
>+	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>
> 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> 				 xe_modparam.probe_display &&
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 9b9766a3baa3..b11bf6abda5b 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -48,6 +48,7 @@ struct xe_device_desc {
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
> 	u8 skip_pcode:1;
>+	u8 needs_shared_vf_gt_wq:1;
> };
>
> struct xe_graphics_desc {
>-- 
>2.34.1
>
