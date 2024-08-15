Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B8C531DD
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 20:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94CF10E53A;
	Thu, 15 Aug 2024 20:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNq/M65b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DB310E53A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723752050; x=1755288050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0JVU/7jdCCvkp3Od5r6/eCXGP0eP5CtiN3Xzj1ayCgo=;
 b=MNq/M65bCq4M6WXNRZQUmBMA4xkEBYqrDt7YYmbzcccILg3Ep/PrfAxk
 Yg2mrc+tb9t2EaTPytizEli2xPSEaKwhAdEy+DpoVDT5WDiCe8FVxY7pQ
 fO6G9R+aJLjYk/tqA30yamNgzFCLVJonbY7bst22D5JOt/gI/YVve7OIb
 UNTel1zLz0A7chyJ5oDahWeHIEXZ8kxvDitGzoiBMGYs4pbqPDX0gR0N3
 tuSyfXt6lKVTxwEkKoyVI6Oo/UqQC4UvfHADP3/GWWIipAZNdbJGpqz3M
 y8jxdXjQn1RoKZapvih+88AjnLsdnS5NY9CViFBT6nZmqz3ZpSdm/R3WH Q==;
X-CSE-ConnectionGUID: zLUZAzW+Qzi4Qo26S7w0FA==
X-CSE-MsgGUID: ZWYLgBQWR8m9DmsoxUmWpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22178044"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22178044"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 13:00:49 -0700
X-CSE-ConnectionGUID: cpK4mZQyQt+eNicn4HQGoA==
X-CSE-MsgGUID: nJz35QhETvCtPAeKfYjOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59477940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 13:00:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:00:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 13:00:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 13:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luO3N1xz6lVGDrPmpZBvntjH3V75dVwHnvOYgmQwSypB6JGFw2yQDdDmfmQLll5CufLjJ8i87gg60KigJtu7gyMfKK+IVG89Edx75iFCwFTt/oZMAABaO6kS/w7V08Rcc6I6mHZDV3ZtASxoz6FMPk9Lei+E5iVsFvlFVfZNhPs/xjLq6Os7uA8t6YCN9xeJSjr3/7D1dc+luzgWGBeGOP2JP/K5PZ6krnkuqYbqp6671jqOIXv0eYCq1bzFKW9E95m0xYjWu+6QKUyAT3/pfJfSFxyaPMYbJLniTVS7igg+tv12j9V0jjcaJRzAQieK0p5Tjqx5lbsXK8GC7uQA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSXcY33nP9qzENGky9X50Eq9ftl7qsinW+ixM/UBaZk=;
 b=OLUQ7YtzMNklJi7cTc0gIbzJbNYDn7oD24iskD963sS+MRkbHELVcgFe/li4oplSHeTuIRdTTbpZx/QCiydYMDLhmUblL9Shmb3lIBfVEKNDx5zltkVnHpdG9KsDUmIDD+Bi9tld7gY2MTFlpySow+zQJNJ2yWel+okwvph8kEt7ofU/Y9NBjBRJqsbmy68Ao7EvUHsPoVxO2usNRT3VovkCsU4yDOKm3SIBGY9y2R2vKR7G1NTB/Cwbb0oXZqHpKboqWNv060NwuuoUnj3sfqgi4hUf78yPKMx1sYu21z5vTtrDpiK0MoM5GCQsOnsH4MCalVJAD8R76I8nR9Xbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7041.namprd11.prod.outlook.com (2603:10b6:806:298::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 20:00:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 20:00:45 +0000
Date: Thu, 15 Aug 2024 15:00:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/uc: Use managed bo for HuC and GSC objects
Message-ID: <ari3brrrs5gfzoudcp6lsmf5kcl7cnzvrf7tsssqeg3s2e36sb@4bnlvwdkqry4>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809231237.1503796-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:303:16d::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d078b6-62f4-42ef-52c9-08dcbd64f2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CgShf5nZwiO3HcPJP1jW0y/JxERu0rv3EqoPorNkVxB6PUV/p9U1bqvDSKuJ?=
 =?us-ascii?Q?aGbM0kidh1QFqXdf7DZYcCZSmessiDYKaNIikXq4fqmsC0ts6zxL+mxOZeON?=
 =?us-ascii?Q?BVrMo8vlNxv0l7aER3SeDcE2pBEqRTzCUQamoJbOwDVXw12ZHaz9Q6BxoYDI?=
 =?us-ascii?Q?pB0xbf4H3p9gBxFXGitpTbHdJuXMl77VlnY7GMePMHsH82cUQOvkIeNQ0S0y?=
 =?us-ascii?Q?rFa3JeiD+3bmFtgx3DhI9V7QegtUHOwKM38qr7X5bck0fMZFaQWC3E8ba6n1?=
 =?us-ascii?Q?Fj/FGZJUbqFVMiwyy93K/RdvEHGdlOjAkqeyRxgSFvaNhzULYBrSvL7PmS28?=
 =?us-ascii?Q?h/Ewgv5Lry3H71AjPt4SXdg3u2+XXhhs1u6kHEBkqsTPPSwBNCFBhUbpWST7?=
 =?us-ascii?Q?l6XwmnatKhMJAFuaEdtT5SR1sEqJWtujDD2+rLv1D9qi8UL42+5GA082nj31?=
 =?us-ascii?Q?JU38BWDsHUhkEm9S/ebqc8uQJd61AwPcCdtsFy6EKtXodFt9EXoWNGEXvNXi?=
 =?us-ascii?Q?+Yita2D79tWAi3g0Kgz9zP4YBJQfoLLVdUJ3zpvemNpHzpf0/qluQ+uAk/BQ?=
 =?us-ascii?Q?STBTDUTMCVSAuCporE0pk/jJb387iby26M1rP9Oo5YrRRH7NjjX2nx80nTyj?=
 =?us-ascii?Q?KtUFKMRlPBQbHsMoMMV7WeMhegHKMkZKleqenozFgFF0xcjlIiAVltSkGiPb?=
 =?us-ascii?Q?h9zqt2X/GW730voBsexSxMrQEiHFYVIEkRTX7gHl1/m1zDqaRVIysUqx+jxM?=
 =?us-ascii?Q?O3PxObTAUOG9r77cCVGl9DC3735rV8lOwB4evX/PvcPfCFfTI1hAjZkZHQIp?=
 =?us-ascii?Q?XATi+yi52/6NhjeH9bEOJJtmFgBW6NbfyRur4gaKX+YW/kIuukvBLZMmgClB?=
 =?us-ascii?Q?yvSx4YXN624oyFbqFqNZE1tZYKwAvddDOOaCVfZgZTlR4FpmFMeNezFCUtKV?=
 =?us-ascii?Q?ZHuAkC3ThIJNqQgHL1DN7hm87z8Mr0BuBuu7Owkebb8Iou6QBOgr9q0NVb8d?=
 =?us-ascii?Q?0JYRL7zQP8kySwmnATtOKtzYl0v8JiFOp2V5YlMdHvKtP1C2eQr8tj2TibEQ?=
 =?us-ascii?Q?ANBS8pWH1PLvrEBo0uFZBX1pEF8zb7bwMohCqgx0Tm4wOVtIiS0VC/JLjyjO?=
 =?us-ascii?Q?CrEy4Jexc6eoQOuFS7thHcr4kgUKYK+84mevxpZ8uMhMnfGNiEqI5yCkcLj2?=
 =?us-ascii?Q?0fM9NkqAVyc/8AnbXoItYjgn9/qvX989tmNR8b8LYYMZSzl03k5LoWzyBNNW?=
 =?us-ascii?Q?R56DAcJsIMp7jF0r+8++tljI7EH0Bk3rqv9ZvBved7TaGQ9fVgHF2xJNjAjH?=
 =?us-ascii?Q?I5CLXyjoHqCKIBNvI+kWs5mt0KD/JeUVXsR216/heGzFjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iuyuqxlqUL3yURuNecAbq8UTgrFbGKc5mirPpvG5yNWY0N/nL/QPIwhVm52S?=
 =?us-ascii?Q?aE4aMTQlHUiwj+shrq2Sih3bGiuKUVLPX87NjISNlKdBREPEioym0NmR0NGA?=
 =?us-ascii?Q?HWnxQzm8cvNyrTn2zvugEV3vNCYnSanrhh/aez9z9zmeGfBiuFHiViisTG/V?=
 =?us-ascii?Q?3eECQ/BvPG+uUZOz5GuikiefNSL71KBDEMJICCrErHmkfTWjtPZnkrq+4RCV?=
 =?us-ascii?Q?8J0PJKjl++5E/5Nb1fBxMKa5Lw3gVSEPlWXFGhktoFJL/kgBVZhSBCgpb8pj?=
 =?us-ascii?Q?icM9n1wtz+TZXt+NjRgWlj1QCeik7tXs8LSzS8bBErqx7KtzkcxcvIAVdUmn?=
 =?us-ascii?Q?NJ8x2pBfNHMMZv8lGZ9XsVcMZH1jPkZlWx1zM+hE0Qye3cVNP1wTcIFGuRv/?=
 =?us-ascii?Q?sFi7+XDT7/IJABsWqYoMqXpuOVxVNsV2QWVWbi4UQySQDDLBaKK7f4PKxpqu?=
 =?us-ascii?Q?hlmGKwWSSDdJGuvQL6KxYlFtqzL3s0WDJWWpxIemeGrpAS2mdeHRzLERKgsL?=
 =?us-ascii?Q?eCYo+JSf+bE26yKjSVWJcQZXPjZXzKcEpfFiwrsHf0+MqpfOWOe4Ti3T+O5U?=
 =?us-ascii?Q?gHSz91Fmw59t21gTCPSO50HPoxaUThGsxPQYnI/h69oxzjZGb3uF4oz5w+A+?=
 =?us-ascii?Q?r6cn1eUrbFexD+r5ThK5tQAuW7+chV0puUiyzIUpEhvt0VIr/tlUt73nmBZh?=
 =?us-ascii?Q?ki2MGWHwmKfajPUkc8NAO8Lq8OOsVJ+08oOrImiXo1ZJy4sCGPSBhlFgqakN?=
 =?us-ascii?Q?GvsA5rRHVisjecitqVQlzA1Zxjm0A8eEZiD86gBjUBGziXiPk2sCGxT+xOQJ?=
 =?us-ascii?Q?4JWXWm9m8FePg3X6PwX/s2rhzA47R9qEmYd3sAF4kKOMWXGEKhorOVybLod1?=
 =?us-ascii?Q?j7rLeHT1t98/Ozu0jy7qB8tPZyGuxOGfOvh6a5Oqx/PiacL3WF6cgbPab1JY?=
 =?us-ascii?Q?W0sf0JU9mpqHkwhvOF9LFEaArMmM/iCsdcV1vwWwwQnb89+HK1L3rXeH5NHn?=
 =?us-ascii?Q?5FK+3IBROfWuNxDD8q7R0SRR+HJCgcSymHyLP3+U0SeWYkIe3yiduIQ6+3AH?=
 =?us-ascii?Q?y1PA7nxJ1OXTdMRL3227Lg1rGtsu2UF/MD+c80E2/QVl9Hm99Pqw/3Bkb4jw?=
 =?us-ascii?Q?BlA0wPNpv7qcxEYzPFs6Mk2FvE3NM0WK6z/1inMm98UfrYGRQe0AnJMStw95?=
 =?us-ascii?Q?yPA4D1r4Go4KitBEB9NDIncGdVDpAXIqcuIJPSD1EP6XN/m6fTbChZYg5P/l?=
 =?us-ascii?Q?wZwOrS4PtiZ2iYosGjBGTdrdBJ6e+At8sjtG+tP/VdWIuTRPaHLrlH1zjFa9?=
 =?us-ascii?Q?8S0WB7Q3/x+Xj1RO2OoahttRO7T47HyeergkQR4VyydcseMEztVpxaOlyRb2?=
 =?us-ascii?Q?m+eDzJExe+C0fn0Za7vgOoT8AjCKzgNR9diMGuiyF8S+5+9c2u8ZMj8Ar+EF?=
 =?us-ascii?Q?K/KZfgQle8hboTOipKQTdkCNpL2xAX4z0g7Nzt5o9ENrC7PrAuf0YIohW32W?=
 =?us-ascii?Q?ZaN2EZ2qLmH5mctBIyw6gzP/fDGqYRtf8+fXn+UxYYqt3Wquw/vcB5Rc+jw3?=
 =?us-ascii?Q?VgvaTALoDQ2OESluE8YMAPbTA3AXmhTKia5rasaBu/tePhxuckDPxHi4wWoh?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d078b6-62f4-42ef-52c9-08dcbd64f2ff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 20:00:45.3169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o49tu2OquE7vuqaF75mxB3vaDLp4jGSItYbxBr80F1GfKtiTFBU7VsWqo1r+/rXleALwstkmP+iyNMqxdfnwFrngI8J3iKcrI0dyxbbXQPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7041
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

On Fri, Aug 09, 2024 at 04:12:36PM GMT, Daniele Ceraolo Spurio wrote:
>Drmm actions are not the right ones to clean up BOs and we should use
>devm instead. However, we can also instead just allocate the objects
>using the managed_bo function, which will internally register the
>correct cleanup call and therefore allows us to simplify the code.
>
>While at it, switch to drmm_kzalloc for the GSC proxy allocation to
>further simplify the cleanup.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>---
> drivers/gpu/drm/xe/xe_gsc.c       | 12 +++--------
> drivers/gpu/drm/xe/xe_gsc_proxy.c | 36 ++++++-------------------------
> drivers/gpu/drm/xe/xe_huc.c       | 19 +++++-----------
> 3 files changed, 14 insertions(+), 53 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 66963e26c574..b84f2e020c8c 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -450,11 +450,6 @@ static void free_resources(struct drm_device *drm, void *arg)
> 		xe_exec_queue_put(gsc->q);
> 		gsc->q = NULL;
> 	}
>-
>-	if (gsc->private) {
>-		xe_bo_unpin_map_no_vm(gsc->private);
>-		gsc->private = NULL;
>-	}
> }
>
> int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>@@ -474,10 +469,9 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
> 	if (!hwe)
> 		return -ENODEV;
>
>-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4M,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_FLAG_STOLEN |
>-				  XE_BO_FLAG_GGTT);
>+	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
>+					  XE_BO_FLAG_STOLEN |
>+					  XE_BO_FLAG_GGTT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>index aa812a2bc3ed..8f880c44211d 100644
>--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>@@ -376,27 +376,6 @@ static const struct component_ops xe_gsc_proxy_component_ops = {
> 	.unbind = xe_gsc_proxy_component_unbind,
> };
>
>-static void proxy_channel_free(struct drm_device *drm, void *arg)
>-{
>-	struct xe_gsc *gsc = arg;
>-
>-	if (!gsc->proxy.bo)
>-		return;
>-
>-	if (gsc->proxy.to_csme) {
>-		kfree(gsc->proxy.to_csme);
>-		gsc->proxy.to_csme = NULL;
>-		gsc->proxy.from_csme = NULL;
>-	}
>-
>-	if (gsc->proxy.bo) {
>-		iosys_map_clear(&gsc->proxy.to_gsc);
>-		iosys_map_clear(&gsc->proxy.from_gsc);

clearing these was not important?

Lucas De Marchi

>-		xe_bo_unpin_map_no_vm(gsc->proxy.bo);
>-		gsc->proxy.bo = NULL;
>-	}
>-}
>-
> static int proxy_channel_alloc(struct xe_gsc *gsc)
> {
> 	struct xe_gt *gt = gsc_to_gt(gsc);
>@@ -405,18 +384,15 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
> 	struct xe_bo *bo;
> 	void *csme;
>
>-	csme = kzalloc(GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
>+	csme = drmm_kzalloc(&xe->drm, GSC_PROXY_CHANNEL_SIZE, GFP_KERNEL);
> 	if (!csme)
> 		return -ENOMEM;
>
>-	bo = xe_bo_create_pin_map(xe, tile, NULL, GSC_PROXY_CHANNEL_SIZE,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_FLAG_SYSTEM |
>-				  XE_BO_FLAG_GGTT);
>-	if (IS_ERR(bo)) {
>-		kfree(csme);
>+	bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
>+					  XE_BO_FLAG_SYSTEM |
>+					  XE_BO_FLAG_GGTT);
>+	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>-	}
>
> 	gsc->proxy.bo = bo;
> 	gsc->proxy.to_gsc = IOSYS_MAP_INIT_OFFSET(&bo->vmap, 0);
>@@ -424,7 +400,7 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
> 	gsc->proxy.to_csme = csme;
> 	gsc->proxy.from_csme = csme + GSC_PROXY_BUFFER_SIZE;
>
>-	return drmm_add_action_or_reset(&xe->drm, proxy_channel_free, gsc);
>+	return 0;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index bec4366e5513..f5459f97af23 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -43,14 +43,6 @@ huc_to_guc(struct xe_huc *huc)
> 	return &container_of(huc, struct xe_uc, huc)->guc;
> }
>
>-static void free_gsc_pkt(struct drm_device *drm, void *arg)
>-{
>-	struct xe_huc *huc = arg;
>-
>-	xe_bo_unpin_map_no_vm(huc->gsc_pkt);
>-	huc->gsc_pkt = NULL;
>-}
>-
> #define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
> static int huc_alloc_gsc_pkt(struct xe_huc *huc)
> {
>@@ -59,17 +51,16 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
> 	struct xe_bo *bo;
>
> 	/* we use a single object for both input and output */
>-	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
>-				  PXP43_HUC_AUTH_INOUT_SIZE * 2,
>-				  ttm_bo_type_kernel,
>-				  XE_BO_FLAG_SYSTEM |
>-				  XE_BO_FLAG_GGTT);
>+	bo = xe_managed_bo_create_pin_map(xe, gt_to_tile(gt),
>+					  PXP43_HUC_AUTH_INOUT_SIZE * 2,
>+					  XE_BO_FLAG_SYSTEM |
>+					  XE_BO_FLAG_GGTT);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
> 	huc->gsc_pkt = bo;
>
>-	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>+	return 0;
> }
>
> int xe_huc_init(struct xe_huc *huc)
>-- 
>2.43.0
>
