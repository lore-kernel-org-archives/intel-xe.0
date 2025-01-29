Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1E3C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 18:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F37410E135;
	Wed, 29 Jan 2025 18:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgR1MLZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D28910E135
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 18:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738176683; x=1769712683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y7wLBlVcl0LI1TpRL4Qq1rIjt0gwG6OnwC2vZV4zsdA=;
 b=lgR1MLZHbt7aHA8kiAqa/9tj9pe9Tj06TsBMK/MyBhAnN5vMwZiuiA2f
 Gk/EutzxqoGDbFOuU9g3RwEqR/TWO64tlNmtCCrEQ1fF9NNY8mfp5BYfw
 562TiNCuqf9cMYQz+Xdvkf0nzagKssIHPbQKHu23/JxdO2HO9PGYvQQNK
 sbEKcWBsQ3b62zYfkCL1r1XdfztusH4ea2fazoIYqPv+5o5300g8Pa+Xr
 fm1f+1Gwdg9eJuKb1EcgDk4ptokef6Q4UsUVjqcE3dI9mOV5OO7nOragF
 e/+e3IXjQoYJ55I8wXWuMll4cFq/cwQ6a7TVbOXkFM1XllcSRIge/pHga w==;
X-CSE-ConnectionGUID: 5oiv9/jxTOasfKgMVOL2kQ==
X-CSE-MsgGUID: 9AjRCLh0RsK+Qmh5AC7J+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="26310165"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="26310165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:51:23 -0800
X-CSE-ConnectionGUID: D2Oo3vSBRkSKbo0ipyseuQ==
X-CSE-MsgGUID: DKkkgH15QGKMmQ7vyQYp2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114092635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 10:51:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 10:51:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 10:51:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 10:51:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWkpZD4o6AEhNyBNqlQVvdSiFXDt0Rjm0hJUva7xAiWIuJo+lZIxNtQXZh/i/OB2v3n42n3zX4YUde+AuIAf9jmx8kYCcVwAvHXfWQKFrw0PzOjjESCgLEV55FTMYhYcnVUvDAuydauDZF1rEIIi/KEy6JM8XDTDxQLdH4rMmHAH6nkLucMlVhODyM10lDu0zdX9VnJ5x6BcMbGUM8x33e/wADkPwTXvIKoAKyMgPbPxAAyCL15kqfqsL3TbyHwdfhMiC4aHU/YoMcqf38imu1nymGUxZlcPkjvOf0E8AgTeRoO0FAO7kwlKi7uYJyslazTb7xPRrMiJIhOSkT7zLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gINmK1IR/r2OpBt9yvqvPyrrmgRj7FYMTvJAHyrMRSY=;
 b=yT9h13FVrqYT+VF+g392artc5PSEbMRv4fHwP8NhTpaxy8Jy1LzYWoLu+IhXBhOQJrUDOv7oial4TlKFsTJrOLQH9KnkY9Zys1IaLLT8lT6aEXddnw2pAD4nv6p8uoNwKtNrFExQ+arGYuyLG9OiAh9Lfc//fXMzjTomhCycxthVbHq05Cy3bwcvgOYEpk/wNZnBeHCTMJOxsfhAHItks120tCIuBe2wOVXFL2GH5slVlcWhxEyGlN4RxBN71nFOYaB9YcD0KZSgGLvDTzRt4BHmUmpytXEwMKTTL32d24BZvMMXgCToSGiEqHCKnxwEu0iWZpX8/Uv9zJNuEfnRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 18:51:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:51:20 +0000
Date: Wed, 29 Jan 2025 12:51:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Move a couple static workarounds/tunings to
 the static list
Message-ID: <rbkdanimsdvosq3ew3x5c6kutwlhpdduxx54uqeisbgnhi3kad@gok7pmvgfs2x>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129155627.93827-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cebb5d-6596-4f8d-7144-08dd4095eb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GlIbgnzEjmTHTLUDUfnWS2zelqt0qOBCosR9/A718CL5I93EuAllWMeIw3eS?=
 =?us-ascii?Q?WPFqtJvragvxPAJSQSaw3HjfRr+Wc38AXndggup4Ez+f/2V9IvMpDJK2wgGh?=
 =?us-ascii?Q?0xEYre1xEs7XDUWtH1RnDPr09uL1AtD4fTS5c6o4yxnrNHtrSiS1q/zOy1GM?=
 =?us-ascii?Q?M1IGQDfJogE9GVw2Zqhgw9mK+DIH5LsqcxIZ/hoi7QI5VmEwPNgGq5lkSm+p?=
 =?us-ascii?Q?SfxacRnf/ZZqEom1vagE9GXhTL+//+iRy72W9ir7+cpvp+lMVNryOBGPlVEl?=
 =?us-ascii?Q?JFz2bgibs5XG68e1LF0JTki8za9uBXF4qVanoVbPO03XJ4WmJeirNiK62Mj2?=
 =?us-ascii?Q?UiDBHGkMfJ8l698572xOIjshRoq4yz4+0YETdxap9eopEmkVcBEum2L9tBan?=
 =?us-ascii?Q?Jc5M/1MFamRAKjXTviyHIhHEiAbwqEfY52RG4lrCideJcNiQnKmW8mancJA+?=
 =?us-ascii?Q?rw4CT4cdBXLrFtXb7GeMk/m/wnWWD0M4vE5CiidB+36tU3MXwv6L91TrB9aa?=
 =?us-ascii?Q?cyWelDJS52evEfLVZqBSH51Vp82sFcsc7a/tcz0+nN9qCCO1Td3Tdtb92xHg?=
 =?us-ascii?Q?oAX4h76fAKxKneFh9SfANYiNNw5RSl9OJU35nyf++s9EFZ2G+RDXlD2gm18y?=
 =?us-ascii?Q?VGp9FqaXNANoFafF9A2KPFiA+rPV+js/jlRSOj6IKV58hu/h4140AqbT6g4P?=
 =?us-ascii?Q?X+rn1eYUvJTEUkOdkfXpenvx9PRL8svVy0ZxmpsQpBoCOBBj8J13qeU1snYE?=
 =?us-ascii?Q?DWIZCO1jGuVCzFVpW25Y8eQ03k1gKj9V+i3UAXY6rfKbsSKd6dWZMScK9aBV?=
 =?us-ascii?Q?Qt0fQSzaNmHZZxnKz5lSKXJjWqk611DlLa3REhB6gliMhnnZlxhxI4eXygjv?=
 =?us-ascii?Q?3NUzEI3mMNHCESR+hgJSyuXFIK7hXXPIFAPxgHPwmj3hig393knIor82vSLa?=
 =?us-ascii?Q?/NuvPZwNisW0fneq9mFpBfEFEFP5c72uZJ0CKSwcp6v7PZt3w1c9Wfi8Z5V5?=
 =?us-ascii?Q?vAD0zqsEgFCaHkXRQdX8r4CJPowgC/KgVGtNVAx7L11hs9NRhWADS19jIwRJ?=
 =?us-ascii?Q?3/Nle0Z47kck3XSjW8u9nFPaVKRpqD1O6yR6raFvSSmgfehSz3OyLDtfo0zf?=
 =?us-ascii?Q?7EL1GRWdkhKNBInjVGvMPlSaN8XuJLkRB6ilP20COPGctLSEpqaio+zB+4no?=
 =?us-ascii?Q?UgAmGAlQbN+kpyjx3Q9Dvud20yucXwtMNbwZ/7lCFRL9VII8Z5c6x1ZCaPj+?=
 =?us-ascii?Q?x+xmO8Gxw88SzpLt/6XNyE2UX8NURKyKT/6iV42X9zzoLlkTPepWxyehvpIx?=
 =?us-ascii?Q?6bqqA0KDYCxiy8AMD9R1lZ3oQL6uLpR8wFzscNT2/XVlY4+MFfiWrfqyrkq4?=
 =?us-ascii?Q?j831zzLLe0wrECwOT0Oo/XwmaMmI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NcYpdTud11VXzeVd1Y2Q5qMXYhhxqpK/e+0+Nq9LQ27s/OL+hzEzNh1P0zjt?=
 =?us-ascii?Q?nFaEeXXgnBEjyEYMQ7zBdp9lNIscKzW5z/UvqI96NgpZ8b265EjfRo1WaAYm?=
 =?us-ascii?Q?WI1r380K8sauG0zOOD2f2g/+icLbrwk4DakFIlJAB0WwL+JQ0usS+KlGk442?=
 =?us-ascii?Q?JAwKNaLzMr5Y8Oo98w2KgAz55SeVh3D1XNYqll+ZH5Bj2IpP9ZIUgpzP8jTP?=
 =?us-ascii?Q?DCv0Hx74GezGCrbJ3TZ0qIgfC4M1sjWp+0AwbEBeAv9pmDBw6TfOfAOjLmI3?=
 =?us-ascii?Q?2BWYQcSzP/RVdMLeczy1G2WkZFoYw9HDAqUQOasJNkloyPKVt9Mc2vEAsVkK?=
 =?us-ascii?Q?b1g/9bNqsnDP+41Ijn/NVz4FY4giXoBsQ4ayqp3WHasHtNYb9ChV5OQVxhvw?=
 =?us-ascii?Q?rQVrHlzn3IjxMDVNPNgflu/8ZQLxGpulDd6/mUJvcK6HK2pe+C9zzOFn0y7w?=
 =?us-ascii?Q?fQhq6tY4oQaHgLTyQPDFJXqKWcp4Yx/HYAwA1Lq0a3k0G6FAIIp9de61KY4I?=
 =?us-ascii?Q?bkNJp8BFTcvP2pi5Kmt738garMq/h0J6qV/DWWgPxMa5AunMz01vCMNNNOU0?=
 =?us-ascii?Q?uPaY6mVuNBmrcMaA8i7fzIwf16RaXhHVNK6pUIm4CAPg8ju66ztafGjuhbgJ?=
 =?us-ascii?Q?b1KDpdVBpNMHkxwbBA4CIs+mpKPxxBaMCI0TP90MQ9rR1rvJ0kMdxJFAI9C4?=
 =?us-ascii?Q?qz0Wf2PkEFS0kDd3Zo4Hwx5OBXWvOBX2r0hPg3eH3GEmXE0nY8ByS+jfcupQ?=
 =?us-ascii?Q?pqN6zVvNcqXVfbn1E9WTR5Zq2b0lRrhVMvcXb+/YTv1is7y8ln2LkEIwr8EP?=
 =?us-ascii?Q?0WsSzkk8vXjrhk4QzXEGnivzpcm0ky2VkjRlrt54O5C/iaN5dW/l++tKISfO?=
 =?us-ascii?Q?859IFVCqeG7HOEDHXnjqdyLgiZXsNVwcnL5wTwWX/n6nsSXWCF3U+gzy9yT8?=
 =?us-ascii?Q?D7h2RIppKrWPQGkospq2CDdlLS1TMpATRlClT2VksiEdT09ofPO37Rx0z+Nf?=
 =?us-ascii?Q?5BAUvBSFGnATVAOLH2PLIZ94DQ7gDVd3LGQp60KivTbBy/fJ3x941Tor4hLj?=
 =?us-ascii?Q?z+zsNrwfRqM/aMf00Dgv8vjXPlDpXR8VcTimsB2QFHHo94+N6Y4jLQc9hgVq?=
 =?us-ascii?Q?p+Yu1VJV3O8x5jo63S86Ou+uyFA/43taWX2J2+AvO8jPjJV10ECYrqTFV41E?=
 =?us-ascii?Q?GZo5uZD69MA9bRSgDzlvBa0hsd6uDx9bFgjJ6S5D14AAHJwg9nyfg5qZJx0B?=
 =?us-ascii?Q?QAP/rMnzkvoGCeCWM979qtujUjNEqNsP1ASjcrd4HPDdxTk0EH7qqELxjkz5?=
 =?us-ascii?Q?dbbviCRc6aPKzNNiaZnWjJ+UsLR4al0CjSxn6e4FDq2dhy/AFuLxM2ztOqpW?=
 =?us-ascii?Q?79K3v9zqdsL4ErhGVJ2QTAuCvl8SNcvGpUbth2dmgvOPtAZf/2b/rQVDpIJd?=
 =?us-ascii?Q?0XqpyDxSRQ3n1cT6u3q19sHa+x2y5/5gZ2fiot+ocnIDjDFunczdj33ce95n?=
 =?us-ascii?Q?eHL5AopoPG+eLOnpWyNcK6CxQSe9PjTYJ+lrm2D73ZB1wMy44VjCZU/cnWFD?=
 =?us-ascii?Q?1ySBL9FL1bWMaQwHM6EwPemFuKfGtIdYuwFqJiWTEtGQY0XEjrh8r6QS0z3t?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cebb5d-6596-4f8d-7144-08dd4095eb53
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:51:20.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5zFuvNaJNa2Z7xcZYS+D9o1k+bVrwkQ2pNUV+9oo0rSxz7GigGbDhg4X86DhjLqOoHb4rAF9u4kUd44u6a3YSV3HAXJ7tS4tY0hsBRzLHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
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

On Wed, Jan 29, 2025 at 03:56:27PM +0000, Tvrtko Ursulin wrote:
>One workaround and one tuning are completely static so can be moved to the
>respective static lists in xe_wa.c and xa_tunings.c respectively.

We can enable the tracker to make them show up in debugfs if needed, but
that wouldn't be in the WA file. See more details below.

>Advantage being that they will be shown in debugfs as active, when active.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 22 ----------------------
> drivers/gpu/drm/xe/xe_tuning.c    |  8 ++++++++
> drivers/gpu/drm/xe/xe_wa.c        | 16 ++++++++++++++++
> 3 files changed, 24 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index fc447751fe78..423fb43a1a4a 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -437,28 +437,6 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
> 					   ring_cmd_cctl_val,
> 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> 		},
>-		/*
>-		 * To allow the GSC engine to go idle on MTL we need to enable
>-		 * idle messaging and set the hysteresis value (we use 0xA=5us
>-		 * as recommended in spec). On platforms after MTL this is
>-		 * enabled by default.
>-		 */
>-		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
>-		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
>-		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
>-				     IDLE_MSG_DISABLE,
>-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
>-				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
>-					   IDLE_WAIT_TIME,
>-					   0xA,
>-					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>-		},
>-		/* Enable Priority Mem Read */
>-		{ XE_RTP_NAME("Priority_Mem_Read"),
>-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>-		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>-				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>-		},
> 		{}
> 	};
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index c5c5a6fba406..f9d178ae0a73 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -10,6 +10,7 @@
> #include <drm/drm_managed.h>
>
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_engine_regs.h"
> #include "xe_gt_types.h"
> #include "xe_platform_types.h"
> #include "xe_rtp.h"
>@@ -95,6 +96,13 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {

these will end up as a register for guc to save restore, not the same
thing as setting up the default engine context, so there maybe side
effects of this change.

> 		       ENGINE_CLASS(RENDER)),
> 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> 	},
>+
>+	{ XE_RTP_NAME("Priority_Mem_Read"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
>+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>+	},
>+
> 	{}
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 744dba4fdb58..1380bcf17fac 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -458,6 +458,22 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 		       FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
> 	},
>+	/*
>+	 * To allow the GSC engine to go idle on MTL we need to enable
>+	 * idle messaging and set the hysteresis value (we use 0xA=5us
>+	 * as recommended in spec). On platforms after MTL this is
>+	 * enabled by default.
>+	 */
>+	{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),

tunning != WA... this table should only contains entries that are actual
documented hw WAs.

there's a debugfs file to dump the default context, however it seems we
are missing it for gsc.


Lucas De Marchi

>+	  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
>+	  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
>+			     IDLE_MSG_DISABLE,
>+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
>+			 FIELD_SET(RING_PWRCTX_MAXCNT(0),
>+				   IDLE_WAIT_TIME,
>+				   0xA,
>+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>+	},
>
> 	/* Xe2_LPG */
>
>-- 
>2.48.0
>
