Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97CE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491F710EF68;
	Thu,  5 Dec 2024 18:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajfT3muA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103E510EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733423878; x=1764959878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iNzYRqj1+iFSKJjSZ/L9QyNnVbQiOgqXW2tsb3IoDNk=;
 b=ajfT3muAKNLBzGMmmMDVdxc2xeexQtuK7CYKS5HqW+6dTyxnkmV74vOz
 VmlyG9g+Gk5hA1Cz3b/oXjaSb2COAmsgaM2C9/QM/ZXSO/o77Uq+XNUeY
 Edqt53HmAh/9ZqsAZEwt1vgAUtwSLx6r2PSeUH48HwRGxQ1SKSy7RdjND
 ySbhzBjhbJL/i1IR/4MhQa9u10lD87KZPR8uq3E1yYfWkcAV0OVPs4b28
 BtCM6DRsbgtv2LLsv4TBnSB6Xr0oZ9wFA07wuSAGYEjPFffhfc6jQ497y
 mE94pb8UNFaDs5IHVXhrUqTQUPHPfBmlPqiWbSOAMVJOwfnTYinb56cOT g==;
X-CSE-ConnectionGUID: fmcZbh5YSYCMMsZLHU7duQ==
X-CSE-MsgGUID: af4X7rZiSIeorQxtlHSKKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33892584"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33892584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:37:58 -0800
X-CSE-ConnectionGUID: m4wf/tt+SzqzHD+TsFacBw==
X-CSE-MsgGUID: CeB2S/iGS4+IoUx81G+kQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94038980"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 10:37:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 10:37:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 10:37:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 10:37:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7YuNZNXCcfDQttqFMNiJYW/nAcwXGT9JzNNpoTjIp+luf11fG5vljCtGXYQen17zPvy/iGCLbVxZIF9Ug7Dc9ZScMZCaPg7Jr2E8J6fVXcBz5gKGa3s3OSP3DYoSoSlhgqo8H6O1UcTxkfnVCd/cM7No4HE6CEubNn7ewoL3bgcvJ+eUGfSwwVSsQfqQDQTUxgpuTn5pvlI9LLwJ2Y3kQhNJQx9P/UQDSTpjcfEjJ5YRztQFBizGxs2JyflGtxSDzrjXOoI3e5v9LgqaVIYDeSNtGcBQ9oqw9Fr2gQw/gKwIblrRbs9d3g3L/0TOoDdlU+TwU4xii8aXA5kRvfwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dfIqA1+gxGVgEQuzn5vGsyYpQ6SJTyNRbZ7pVhD/VY=;
 b=oMBsJHUiXoqRzs2t/VtVIvEjJpxwWlKX0c4DGAoIgyQE80EqYiESycPRVRSEX5lo0x9gTy/VgfG54VAKny9uiLf/IfeTWpcIjiygTw1Lo27y8500NCruxQlD1c50CUSCh0R5fgwF+R4wW4aDlnZzyb/+7HRykb7KPqqdbMHizowyAQsrM4lYvp2jnXW8sgsXEDYdhtEuRkC3XzGbn5U6YN6xxQYY5dTRhFaXkVUczpO5AwjvxN3FKXQRQUOZ1duBkVG+56YokuTd1tgPE+Z+Nz1S7KJTkBcIBOo3PQUCxq/r2UGz9FK99a+eWpCUq4Y7v/gW8mZCu/PzZ1kjcUQkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6474.namprd11.prod.outlook.com (2603:10b6:510:1f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 18:37:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 18:37:53 +0000
Date: Thu, 5 Dec 2024 10:37:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/reg_sr: Remove register pool
Message-ID: <20241205183751.GB3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205182240.3463027-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce6911e-c801-4ddf-1b89-08dd155bedf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TadyPDaYRKJ2Gs4ioBp3+zdoFzh0xta5b0ajQGoXgIJeqlbQOLnhAWEFKIpa?=
 =?us-ascii?Q?cwsoRzPIeoSZ8S7dd6PY1PIqvAuhACsuk9hmGu3GxvgD6fiN2NcTokZr0vKI?=
 =?us-ascii?Q?yb4yLsB9rCHwU3j6/JmsQb6TohQarEI370pFzDiT0I0frAKeYi08GkVh60e7?=
 =?us-ascii?Q?G5ACzTetw6b+IhsMWC2h6bgdgBiABWUDynmaAyi0Xjm4yXGcSxVlbQE5axMT?=
 =?us-ascii?Q?k/kUZ/LrUfqm4Fx/J65SEoK3XDbwD/FqHZ2AkzGJCv9r5QIvGcZ5Dd8eO8gf?=
 =?us-ascii?Q?xtJ2HnD4o+rJ5rj65IYCNg/5Xq0yG1iIZlgoC29LqU/Q2wwLLzqUAKqMCnk5?=
 =?us-ascii?Q?EM9L5eAI2H0Ymks/wJ6rWSFzk76TeZKANxUZaYtrWUOidOeQg9pjz3ogSqbg?=
 =?us-ascii?Q?n2SlgNY3XNhRyDS9DsHyPsWuJu2MaLss8U0NXyIqU6JdLmb8/Ay+t1n/tftd?=
 =?us-ascii?Q?wT3iD1hgVIKscz8xkdUHocSCL7G0eg7eVYbifmUGqLLlCwlWGCLuRMgqdinB?=
 =?us-ascii?Q?xrWBp1YP+GF3//Wto3hhvjDYuv2HBadyQ/Ud3GTlwn2084FTb0Rhw6iNSHIE?=
 =?us-ascii?Q?d12TuMTrEx3buxI1qe8AQN9TK05oti/G6huDyQkv8uEraLQmEeQGxXsRlJb+?=
 =?us-ascii?Q?eMIMOugnw2ZdsWszfuc7CiIZHgwaotEIK07ulCazNU13rgnFV8hXnaJUGlsp?=
 =?us-ascii?Q?o2nNZchkeqj+tOb0In/4stGdUCVexDZ4cOQmoiVJM2B2rpd29XNp1hUhhgLt?=
 =?us-ascii?Q?YSAClWxJzUXl9OZP3BLQgJnxhM26+LySw6TfLJW7FPUWGL0XBmOxhANGUlFU?=
 =?us-ascii?Q?qXfegc3jR7rtdml8Fuy4jZcd1mfoj05oPEf0ULuU7W4HhvJVi2odd+M2pvX4?=
 =?us-ascii?Q?WTnKdoZLXtHmBW8kz/FWJlqTUNurUqkTpZDWMNVuzkCGxU+ktZYVXQKENVLF?=
 =?us-ascii?Q?6jc5Q90oZHFJMCAgHwuyON2MfsSmyyo3d0CfAstshiQYDwxT2pakvvevYfcA?=
 =?us-ascii?Q?yJSg5efKYz4apt0Pk6MdoDMzQIoIjcZz4EU6kyK3jKd3oxMyjDUl/+Pz3mEH?=
 =?us-ascii?Q?s3p0MHfnsvjfRxuGpXCQOJLREDVDQEA66ZeHMXvQY3sSQKJNC/Kiy6hiXsV0?=
 =?us-ascii?Q?B+57eUfV+/vxwL0OgOoVIWpPQp9qDkWKiZwzAOQmq2Z9HArOoeHo5q0gPekw?=
 =?us-ascii?Q?IhT3FIemRbAIvdYiXbXIwyCvqS1dgJSavBk1YY5uSHjZvfaS51CKaZEAgTKt?=
 =?us-ascii?Q?FW69rQ0Oe0J78osWkr7bh+helhFYZsjM+TqDUrJZm21qedaWOT8zk/LV7LFy?=
 =?us-ascii?Q?d8xWzsw0f0En+QlU39QtfAoxtubvsUU2lPtalxjbJ4Ui7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfbvuiQO7EWk07QN13MBCfwJ6DqzRgs80v7FvIk7piyFj1gGw/1xgbAgToeg?=
 =?us-ascii?Q?MrYeQ7vHp4et5M4blEfjsaaDe7gy7yJYKm4wARP9J62E04jdb2xbAfKvv0rY?=
 =?us-ascii?Q?DolnBIreCn+SsF4D0fnb0dKn5CgKt65KiPvYFES4p3iBYdMAKjhBdhdMMpx5?=
 =?us-ascii?Q?iarOhtZ9YDolAqaQVPManVenTFdH86igtqhiYGwa7Zkq1PCv56ya0KhNxitm?=
 =?us-ascii?Q?fVKE5ppxfpMZmtRg+vXLmQ3VbmadgskS4u/yu1UpZyn5NZs456Xr9InF0OmV?=
 =?us-ascii?Q?5QRpVTSUn/NF999JghyZxwphOy+r2vYv0l7HC84nJ1Gb8bCoOwpVUbTmFB/C?=
 =?us-ascii?Q?XT0I8xRsA2J41iGCdHGDh4FDdVSx2SE9hdbNm64uFdtbQo9u5DN8WEHhfjW7?=
 =?us-ascii?Q?gF0VBq2zzcwQ+oMmNAWZc8Esz72H2kKhDoTqp0VYONwDEW8oT7Qa5tgjx9Pi?=
 =?us-ascii?Q?1U9Yp6tzMhLx2QL2D4pJNOeulGAlQ0ppjpFvIbVPoftxpN6kOnDq+rSNN80O?=
 =?us-ascii?Q?RWCE8dfcNvBZTlHfD43ijfzHa/A2ogBxkcanXWPtLoBxcMfCl29vPxZwoy6Y?=
 =?us-ascii?Q?2pYkMoPFPyur/aMUCkv+G8yJID4n6bzU813z7xT86dnSXkS26qzvMZPuPTkf?=
 =?us-ascii?Q?vAF7Qtvq7ecadHQkojVxWrzSOvCgK2CVBv8jfp5kUHySJg8hXIG5XndFEUGf?=
 =?us-ascii?Q?DseAo3NuE4wwtcYDLupmiDBxRqZEJkE05+c0He0wHlK7eeprGXQG7i2zdBqK?=
 =?us-ascii?Q?u8RYTbxy/Xylu/w/uPFoGFS0W4yReM/6au3pgmE+eLX4u+5H0NMedjtTQdP0?=
 =?us-ascii?Q?hNI59rb8YW6r8uAqzEFRe+ZyQlOEnvlrmauFBQS/JuV/e6RuD2uwYPP5GYBj?=
 =?us-ascii?Q?yH9Jmq7R6k1IpaSCJZAgbP3Z/NwDQqmOKNhOyjkUYALLW8Iw0llXD0BMP6TT?=
 =?us-ascii?Q?gdqeyDBq4jJbJW5lvdZpdi84AkLPV4jNJWLY4oGBlJvh8ypQrGMmZy+07l2t?=
 =?us-ascii?Q?42JScym0k9D14lJrfEIsD+rsrKF4U3E7UUxrqPBf1PBID+jSpDLLkilaMIAd?=
 =?us-ascii?Q?UzvRl3FgMG/6r94t9HmoLb0smgNlXg8l0LQ+M4OkVQCs6RWe60AUDV81A3M/?=
 =?us-ascii?Q?F6LohLmjixsVBZt/3zRRlzleOnoIw6kHxSQVbPPlAtmfQDtM/yFQO9VHVB7r?=
 =?us-ascii?Q?KqCxiqnQ4HPCTbl8KkgqkIebsto2eZYKG0VJkp9FTTdGUCzr6tbePr6fxtwB?=
 =?us-ascii?Q?/wZ0q5vVF8lFL/t7ya9ZA7O3XBlCLLoP+XpjVgVhBvajTejDwXgPttRpFkO5?=
 =?us-ascii?Q?El16GnzEmlKLi4ODalVsch/L1QMZjl9XKsKkY+4Za7F8JNHbREFWtD2XDrvB?=
 =?us-ascii?Q?9W9fc3oIbzzXaIkO6jDyi3q3UIBMBm42atFlcH3WtLXZGINgQbJR5G6ycNyd?=
 =?us-ascii?Q?wMjWE/EHqh/USsGPM81fd6IOH9lPa6FfY4TnplUpdTwLjtx/P8WI198xFjQQ?=
 =?us-ascii?Q?iq3f3n3cwSNO4Yz5FdF9Bb5KiuJ/5EoNkLsyRgrVHNvE8ssiy5pG78dQSPjn?=
 =?us-ascii?Q?uaAED3nzk7ACb1u2UKTAMUMMvdcadb09D69iRDj4b1xm44Vlgm7r78+bAaf+?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce6911e-c801-4ddf-1b89-08dd155bedf7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:37:53.6898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7G6XXDgCaL87wYbsMWcv+fCNsOF5WdMuE4Um/+237KYgRQQ3aEw074oqfjW7xa+R2ZlewCeVQmxqkjI4xthEmb26OS6PoS6c64Jia/mpdjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6474
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

On Thu, Dec 05, 2024 at 10:22:36AM -0800, Lucas De Marchi wrote:
> That pool implementation doesn't really work: if the krealloc happens to
> move the memory and return another address, the entries in the xarray
> become invalid, leading to use-after-free later:
> 
> 	BUG: KASAN: slab-use-after-free in xe_reg_sr_apply_mmio+0x570/0x760 [xe]
> 	Read of size 4 at addr ffff8881244b2590 by task modprobe/2753
> 
> 	Allocated by task 2753:
> 	 kasan_save_stack+0x39/0x70
> 	 kasan_save_track+0x14/0x40
> 	 kasan_save_alloc_info+0x37/0x60
> 	 __kasan_kmalloc+0xc3/0xd0
> 	 __kmalloc_node_track_caller_noprof+0x200/0x6d0
> 	 krealloc_noprof+0x229/0x380
> 
> Simplify the code to fix the bug. A better pooling strategy may be added
> back later if needed.
> 
> Fixes: 6f9f4763bc94 ("drm/xe/reg_sr: Remove register pool")

Is this line right?  It seems to be referring to a non-existent patch
(or itself based on the title?).

Aside from the Fixes:,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c       | 31 ++++++----------------------
>  drivers/gpu/drm/xe/xe_reg_sr_types.h |  6 ------
>  2 files changed, 6 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index e1a0e27cda14c..c13123008e903 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -27,46 +27,27 @@
>  #include "xe_reg_whitelist.h"
>  #include "xe_rtp_types.h"
>  
> -#define XE_REG_SR_GROW_STEP_DEFAULT	16
> -
>  static void reg_sr_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_reg_sr *sr = arg;
> +	struct xe_reg_sr_entry *entry;
> +	unsigned long reg;
> +
> +	xa_for_each(&sr->xa, reg, entry)
> +		kfree(entry);
>  
>  	xa_destroy(&sr->xa);
> -	kfree(sr->pool.arr);
> -	memset(&sr->pool, 0, sizeof(sr->pool));
>  }
>  
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
>  {
>  	xa_init(&sr->xa);
> -	memset(&sr->pool, 0, sizeof(sr->pool));
> -	sr->pool.grow_step = XE_REG_SR_GROW_STEP_DEFAULT;
>  	sr->name = name;
>  
>  	return drmm_add_action_or_reset(&xe->drm, reg_sr_fini, sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_reg_sr_init);
>  
> -static struct xe_reg_sr_entry *alloc_entry(struct xe_reg_sr *sr)
> -{
> -	if (sr->pool.used == sr->pool.allocated) {
> -		struct xe_reg_sr_entry *arr;
> -
> -		arr = krealloc_array(sr->pool.arr,
> -				     ALIGN(sr->pool.allocated + 1, sr->pool.grow_step),
> -				     sizeof(*arr), GFP_KERNEL);
> -		if (!arr)
> -			return NULL;
> -
> -		sr->pool.arr = arr;
> -		sr->pool.allocated += sr->pool.grow_step;
> -	}
> -
> -	return &sr->pool.arr[sr->pool.used++];
> -}
> -
>  static bool compatible_entries(const struct xe_reg_sr_entry *e1,
>  			       const struct xe_reg_sr_entry *e2)
>  {
> @@ -112,7 +93,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		return 0;
>  	}
>  
> -	pentry = alloc_entry(sr);
> +	pentry = kmalloc(sizeof(*pentry), GFP_KERNEL);
>  	if (!pentry) {
>  		ret = -ENOMEM;
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index ad48a52b824a1..ebe11f237fa26 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -20,12 +20,6 @@ struct xe_reg_sr_entry {
>  };
>  
>  struct xe_reg_sr {
> -	struct {
> -		struct xe_reg_sr_entry *arr;
> -		unsigned int used;
> -		unsigned int allocated;
> -		unsigned int grow_step;
> -	} pool;
>  	struct xarray xa;
>  	const char *name;
>  
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
