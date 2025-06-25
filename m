Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E726C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FA310E7DF;
	Wed, 25 Jun 2025 19:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4s7USGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF3B10E7F8
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750879189; x=1782415189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kZjxGgDG0gOpCm/1vskgUV9N6zU9GqXZfVk+r5WIiOo=;
 b=W4s7USGRWk+0GbU1yDYBIjQBiX01rKY7PTsZSyJ4gVAXTWomoXYItoIX
 OrsLjB1dE/CdGEBrNRuZ/UFIgiGwWzMJ08iJivrEO9gGQoBW3Txd5O7Bl
 Q6h0rS9xdWKv6B8cy6Fl5jGGG2wLfzBUyCEPmfIcCt/n2YD8x7SbLQtF4
 7giWo5f+F8w3rTyoKZ2nxzanJuC89RElHcb3EUnmF35w+rAj3VK7DEXM5
 4LjCn8k5wSIhiIONuN94IDyp9Lzbh6Nv3crAX0z7eQ3fyKIUJ5NVti+R/
 FJKSD9T4D6tAw+MVTWtFdAeUCM0LFX84EYqwLPYpPth1wBa+6Q09041SC w==;
X-CSE-ConnectionGUID: DF2mUvVtQCmX/PrRX8R2MA==
X-CSE-MsgGUID: 49mt29wWRp2J7kqoxF6ktw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52389639"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52389639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:19:49 -0700
X-CSE-ConnectionGUID: ARTN50zeTomxjbxPuvVHKw==
X-CSE-MsgGUID: C0LP8dkYSoibWZo9QnVMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156329358"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:19:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:19:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:19:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alom46WU/Qs5R1ZW2KQ/OLoUxsIyYVaYI6IbdAQua0R7CdKwC1nqukoRkn93X308h7Wa5p53IMpOzZl3VeFcxuBUbyAOFgh26pFIF7sbsmR9Uy/zXr/Km2VyXMf/T0VSNOGy+brg1ndmI+c2KHYyaoWH2GaHjOAlXuMu2yc76dWbCH/9Nm4C1L66+sFfC+kc5bdesiQ4bo35/TAI4h+FeqEQK731lJclvRi0cbVaRXcWuwK+llt4TYsTqarn+NO9izxpdInz2kn7NW+ssw8LjOWvGO+8n1imp+4L1yKbKSmLuBtheWXhHcqkoX2JNhtn0+tHHuM3tkhAsce3KrI8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRUSO2eQCf8ih5eKQ/+e92nmUzCuVMcQSAjcWjZFGWY=;
 b=bYDUf9PrjO3ka8gBwZkzbHe3R1Gf7PZ+oztJrHbwKhcMzavSpurppHOiC2QPmmC2JbDoZQ+1Yl6IMr/OrqHqsLnAgKDjS+8Z+3Qt43yrH7QuqYvtUNJJaYw1IB5Myp9UJp8qXF/sVhGEIwD30Tl2zziT10aCf21CMcGH7cBsCZF6ECYRDshmk8EvGu0B2TBinz3qlUxECIbpXJ5poWwRiBoVY5W5UdxWWvJcjjfTitufkK0UyhMQX73helFyuDFzTRXEUyZAXKrNizKG18h3+MzxZstB+XkuRZYWwLHkUCOFlnBwXoRjAsaVWrXi02ADRGO8zC6Y8c+FufsLksLO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 19:19:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 19:19:32 +0000
Date: Wed, 25 Jun 2025 14:19:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 10/11] drm/xe: Remove xe_uc_fini_hw
Message-ID: <xcx3f5fnoeuedli6bkzscijjjgcevukldxg4mewukaut5l64xh@jctwu6r36fof>
References: <20250619104858.418440-13-dev@lankhorst.se>
 <20250619104858.418440-23-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250619104858.418440-23-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:a03:60::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a3d05c-89f5-47bc-00a6-08ddb41d36e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gBOcCYChdxULbcnAERMIBMXXvOgM8vz31UDP87HDkNeo8Bru5WWxhMpWPbbA?=
 =?us-ascii?Q?/QCK7bDtd9MaiuQcPs88BVZkKn7/j/IQ+NvLWSPz+S0hrW1YL1YrOLl3fndt?=
 =?us-ascii?Q?vcDSAMe4ORFD/Cy9frZ63BHRWjZh0nMdZdxxh3o1+vFMsqfBAn7/uLnRwNCH?=
 =?us-ascii?Q?PsXsiwO0d3X7awY2lOkAZWlJXAFZsDivHVW73GxMcembmAKIMxbZw0790IMu?=
 =?us-ascii?Q?xZaDoPgSbY1gczloPXyXle0cyJBSas2HTNSQlLi4l6plXEBhkKU1Q/r7YfBV?=
 =?us-ascii?Q?KRW8Lyj5UJGrUt8Lg8Dul5G8eQz/8ej5wgSoQszVclQkoduob8z4W+ZAv+vV?=
 =?us-ascii?Q?DmdED1k3wgSzorn2W78YfNmKn9uuLbhIFjgwlnY0nyOcY1npUYmJtCfk9Nly?=
 =?us-ascii?Q?caNV9HA2oGFt2tUQJvPUP8jsSDuFKNekvCo04qkrqqZoV0/YNOeYWwKcRUgm?=
 =?us-ascii?Q?p9T3YQ9p/Lh9jvX3g93iA3SpSmymQvGvBRgcN//bU9Dph8vUqUqgdjWFNd0K?=
 =?us-ascii?Q?deP/hfC35fVzSkRZIHn+Xkh43w5RSIcQsQPZWwWRytZoljkkv8WaSH7wgVv2?=
 =?us-ascii?Q?TcbEIJ2iYsc3GiYgVeMKy23M934NDICo0+HYPLRUGdJU2LhW3YzcJBabKvmx?=
 =?us-ascii?Q?yI1O3THHiuwZQGRhUB20Zm+EZFlvypoR/BJb70pBWGNIrWzsHDogMUUFba7A?=
 =?us-ascii?Q?42V84r7aaFImPyvu5Cb0kMb1GKvNplvn0T496ztmCUOg5VZ2P3JjbVbRMepi?=
 =?us-ascii?Q?kBZmgKwCGyhaCLgiCE4jIICQPyRkFTYGOm9VJ6Fe1H+hi1/QqUXDvg7Fno8P?=
 =?us-ascii?Q?fwya4RQcxRRl1KvDKEIMKdqlmbrDGxY7rQYwaM4qUiuEXe638nkyC1kGAwDM?=
 =?us-ascii?Q?QyL2zCbFMWXTcXJk0erhoI0fAltCNSlBRNkKr1vrNIq9vHXOJK4ehhK6WS40?=
 =?us-ascii?Q?eOZdaDAgh5fT6ziTKzE84ROnK7uDztFJKS+3NR/oxBIue+xqw03JKRfxO6r8?=
 =?us-ascii?Q?vernR0rBrmYyoWuZcmyNa19L2dV4xy73EabSMZhRtudZPfbH9LwI449X4a7/?=
 =?us-ascii?Q?uY61wWSAxRXDGWK1kPImaND1CeIQ8qhCNU7BR1un1iFzqJrXJ6MrQqp8+sCB?=
 =?us-ascii?Q?iEbhQJqGlnFY2UT1mZvgZ1I6Oi/+5PtVt6e8a7iP7gFgbdDNX/pLP+wOpmUN?=
 =?us-ascii?Q?C3WsPLwQl/YZfDpmmD7JrwTvL2xJGsjctgY4Esp8edZQJowxsYzc2LWDN6xV?=
 =?us-ascii?Q?Sm++9+jMGuM9K40IagJHWpnV+ne9PUV5lX7ZzX1Lp+J0/Ad65Yk+QV+o6+z0?=
 =?us-ascii?Q?W6zlPVtlv8SpsmlgaqQOugot0f+JweACrGx3amZTh1S/IbRPCxK+IpKRp3BL?=
 =?us-ascii?Q?Yjl1qukmInosS1y86bItsw15WRIf1B8G9IGjhAzSfKHczryI2vtICLMS0MJC?=
 =?us-ascii?Q?asMoG+YbeP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4NC8bMiP4urJ9QbWkg4b+0VZ0usS+egW2CtjS8JMQhCmdskKXaZZsB2eV6o?=
 =?us-ascii?Q?aC3MRZ3BH6JnDcWHVLSbGsZ+1v3PORyNuqVk0EorYjilF/C2QxENQqVcmMQ7?=
 =?us-ascii?Q?iMC1xVLDEPvyV6BkjnNulAQ6/uMmyKbmNXXgHGEoiS2q9PhnXVDFwHa9J7Dy?=
 =?us-ascii?Q?IYdsIo/qlRWrN1BbQ75rQaGMe1xWhoyKBJ/sJTB3GZFrXwXSOImsVjr5vsf9?=
 =?us-ascii?Q?iM4fP/YYDAoS9xmRG7R2FDq15LIBQcmdqn0pzycyBye7ueo67cgWYsuenI/s?=
 =?us-ascii?Q?QwZ6vhZoY3jqyQNAm+RaA63iMspS5NenU+g1EVeXN/lFbrIn3ifAQIzo6UjD?=
 =?us-ascii?Q?Ev1SHU5DxMYG6TMAENKF1Px09gGpK+B2sO2DdNGSzwbgVKo12QUjpMbmzd2s?=
 =?us-ascii?Q?sKjTZHbByiH4zU9NYvHa1/lXzw0WUI19NqS73ELLFYYaC4ka+6JABas8edI3?=
 =?us-ascii?Q?tkuz0OmXj26RbYkPn0l1LGhb0Hxv7xn7JDYyictO55OlnckSqH50iELYAXAM?=
 =?us-ascii?Q?/oX2GHkQpG7SQQH1iePxE/mJxjuZLeFBghv0W9P6IcaRbUCWeUWLToIs5zgb?=
 =?us-ascii?Q?BMiH9SG7nhl2kQ1FPPx1ZIwqJEmuDRurC4yRi6WArKZOGF9/up7FRFt+yuHT?=
 =?us-ascii?Q?TP+F+0EEJNflUGkc2otzxSG8C4iNytm3DJMpjsuflDFDIruKhZCZA3GFBqkW?=
 =?us-ascii?Q?cxRDh1nRd6whi2xXKUdFi625BkhRbJn1h7uYVrWZuoYbLOznfrj+UC2uKEdx?=
 =?us-ascii?Q?XK2uNSomIiCtclO2mKEfEJOG2GoQ1QwjAyy9X9JRv5Z/azUN9oIvwbWV9vA5?=
 =?us-ascii?Q?kBQmfoLt0RB1nQvIbiHux8muMhZNyZ2zYCskO1ijwN2NRvSKJr/yaCw+q/Ny?=
 =?us-ascii?Q?qZHyPKNHO01xucVZ50NtxpVmi3EOwd4Nn5iivO6QWJb9tU6To/sBSW+Z9V8H?=
 =?us-ascii?Q?I3ANzWuHdFs5iNLsfns81lW7vw3fB6iyAYgEld9+/0IbSQwT6FpQ9DYMfCGt?=
 =?us-ascii?Q?xocjOBfJEOIREqmvjngZtimk8kRT7lJDTDA9QZEmu2iZQ9AfdFoAtFj3WwSX?=
 =?us-ascii?Q?kyfcohV8c82fJrp4gqFk8rzk4CNTBaO1k3oOgMnEfM/LdkwZf2yRscShtO8X?=
 =?us-ascii?Q?+SF/dNv9OzK2fWLOBGsLbfhsvETDwfwcd7HfqxljZGkfXmNOdNVuj3Z0kqZM?=
 =?us-ascii?Q?OVz7SElSaH+5MN73kfIOFSLqwWBom+XtDATnvPfIblRgfmpoMqYjXBJDzYpp?=
 =?us-ascii?Q?We9LmAjvACj3KBgfDPNY9HR4y3Nb7dzY2PgRqSEVscOT7DMF04j0QMu2zbAp?=
 =?us-ascii?Q?L9o1kJjQ6FLz9R2hPE6fK7nocVjA8TvgjGC6FRmwnLdvn8+kj21034MwQCDH?=
 =?us-ascii?Q?vmoMMlE5axtlQsVmKKqIkOQhb42m4XpuL8wIKOfsnYzq35TyLlJNSlcDZpSY?=
 =?us-ascii?Q?E6iUs9kyquCb+Ns0C+lGJ/DPeCtr0lJiRquT0hO/LuPihttGGeoQ8NeqYEkm?=
 =?us-ascii?Q?Tng83gMRipnpeuEhARvycfV5fc2Hc2/+bPfqD6la+ADEWCQ/eIanwFrvrd68?=
 =?us-ascii?Q?DdtTfeKytZqrIXVhunZiA8ffsRa6lbR+gD7KoFrtUTh0RmiV1kV7omF8g34N?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a3d05c-89f5-47bc-00a6-08ddb41d36e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:19:32.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrIpbs5KMV/cLlymt4SuIKrCXXru7JXcEFu6tTDsrwsBabui6bJXVYkbIqPJLZYMh/KQoLWdkuk7I4RKT62IEuHgbCKuH1Oysqr2pLIaZfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
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

On Thu, Jun 19, 2025 at 12:49:09PM +0200, Maarten Lankhorst wrote:
>xe_uc_init_hw() is called multiple times from xe_gt.c,
>and that makes the name xe_uc_fini_hw(), called for a different
>reason in xe_guc.c confusing.
>
>Remove it and inline the xe_uc_sanitize_reset into xe_guc.c directly.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 2 +-
> drivers/gpu/drm/xe/xe_uc.c  | 5 -----
> drivers/gpu/drm/xe/xe_uc.h  | 1 -
> 3 files changed, 1 insertion(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index eeb23f8aa9de8..7a4207a2c1e0c 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -577,7 +577,7 @@ static void guc_fini_hw(void *arg)
> 	unsigned int fw_ref;
>
> 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>+	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>
> 	guc_g2g_fini(guc);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 8f56a5ef41e24..1b1441b234c92 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -220,11 +220,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
> 	return 0;
> }
>
>-int xe_uc_fini_hw(struct xe_uc *uc)
>-{
>-	return xe_uc_sanitize_reset(uc);
>-}
>-
> int xe_uc_reset_prepare(struct xe_uc *uc)
> {
> 	/* GuC submission not enabled, nothing to do */
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index c13d705fe02c4..58ff3946a80ec 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> int xe_uc_init_hw(struct xe_uc *uc);
>-int xe_uc_fini_hw(struct xe_uc *uc);
> void xe_uc_gucrc_disable(struct xe_uc *uc);
> int xe_uc_reset_prepare(struct xe_uc *uc);
> void xe_uc_stop_prepare(struct xe_uc *uc);
>-- 
>2.45.2
>
