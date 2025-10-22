Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB36CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 22:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357610E1B9;
	Wed, 22 Oct 2025 22:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rbd8tV8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C910E1B9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761173922; x=1792709922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hUsevJJ0/0p3bhcToS5ziOidzbQQCJnZeqEIqDNnUmw=;
 b=Rbd8tV8BEgVQyC3AdUX2klLY/Fqg/rQ8545l9tNb3dd9rL1lBqaKkRrh
 t5NYdl0XeJWbVhZ9HVZyMs/XRmhTkH+rw7XGNMCMhYZ517m48i3U2FPkr
 8Od6X1RVUDAhet9H7XfKc30Z7dD0QpJBvMJTxs5p5v3E4RIV7yS9sraAa
 G+eBh+8/dBbfTusfh7IoG21BHLCO5aohgfGskPSotvq9KP1rzVxtcAvay
 hujIKFwQW8Pnhtfl52VxXtx9iVH19FdKQrtbWFLN+Ms0pI58aXAy0nHi5
 6P6tutrIvPr2kNUjimYO4dcdx/8kd1wTBNVCW7tnZFC8Yb2OAXBi4ra91 g==;
X-CSE-ConnectionGUID: jEb1aFzuSb6iJVg9LMq3mg==
X-CSE-MsgGUID: r85rvq4nTQyV3IYr2W9nmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74773496"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="74773496"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:58:42 -0700
X-CSE-ConnectionGUID: i5/NGEqcRN6vPA0NryXi6Q==
X-CSE-MsgGUID: 9KC1qVhCQtWZEJkrMN5Z3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="188037797"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:58:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:58:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:58:40 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r76Wb4ezjhD5K6XObHbWZrw/nQQP41Sth9K5edrYDmIJR8SQOfVj9JYZDMkaCMTAZeofBHQFrfvMU9jjIBjnrsWTsWAD0MtWpUlaTO90lAGIiDCszS3jGhIYZwK0t80hmMltz8V25BaGUGtFvx54R960VXfRVDk5tMV1cZOi694cQRQZE7XRACNC35OUO6ig5OOysRcQaQ8Aio+ZxhCv4fH57ur6F4Dr8JmjUExZk9sW4wdDuQtIcu5UsOSc41NOWiLpb9TkC67ZVN3cBMUaJUQ2g6/9io3KxAy/mNaRf3mG6X/w2pTGs67FI9TCWOkx55dnogdyP75UkcJ7fFQ+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoJn0kNOnlRO6vrNUJd8iB3j7aUA9AcDThwGEcXOQZk=;
 b=lOU0AC3OY5R4rJGKslpzUjP5JFPtQ3vAMUaszM8u7YSbK4liv1QKGVi9omm3U+Q54lqvUWNclUL/a/sc0T0oxj1as1mBrw8yXNymAc476PD/SVT2gxqZOZLfavRLRjkLPRQzJul23rC5ULG/5ThZKVTPE8NQ6Vp2pGjJIWQleGN1nCrpbp91a9UOXLSorOiVfNGLFvdUdDeMOQF5XPvtsYW66WISnUNpUOOaF1+SJ2XylsZpn2lAZ2d7kW6n7p1qn/4G0h5pZMrWdoUJz7dUurq4H80m9xtVpxB8olyqcMHp6krfFkFtZGYrid67Vzcqi921aMuskCGagL4xC+GpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF4422C5374.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::824) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:58:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:58:31 +0000
Date: Wed, 22 Oct 2025 15:58:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v13 04/12] drm/xe/xelp: Support auxccs invalidation on
 blitter
Message-ID: <20251022225828.GX5409@mdroper-desk1.amr.corp.intel.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
 <20251020075831.32818-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020075831.32818-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF4422C5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b437eb9-667d-47ef-222b-08de11be84f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dC3JA6ul7JuHm3oQ5ilYvrNW3PJlJMZ2+nAhYMDaFBxv/qcpASgkGypoYhI5?=
 =?us-ascii?Q?bf9Db0+c3Q1R/lj9ScMosxDfhKdambWEk4b+Co17dratgZ3Id8ngShfwm33O?=
 =?us-ascii?Q?bBgopb+9kZskdGhc6CLFt0iZ+2FW3mfbpkPRvySEpf/g4wGa63DSIWgRyb5C?=
 =?us-ascii?Q?oJfp9aNbQQFzPLwHDW9aCCd6FBBWmWflmQH3wO6L4KIclhTvQ7zk1HF7yKxi?=
 =?us-ascii?Q?17zMmTjrwCiprZt8DfpkCEFpA2/oBOg3j2FiHgJpu8+GArkeWpkW/dlFS+7E?=
 =?us-ascii?Q?bjdkTLnOcH9xmg8z8PazaSAM9XKAeIHWWEb4GyB0chMViUCy9ZHE6V+SnBKG?=
 =?us-ascii?Q?N3UWroqm4Pd5uo0iYZm6/233/FfHlTdMsjshUFlsRIw5kJVT6KtWMpfWBpvJ?=
 =?us-ascii?Q?mDa90ZJbVSX4YtAMbYDZWplyF5egsh/l+OwIBMbA9mwl9BWqAHjqLfr3W0Cf?=
 =?us-ascii?Q?pCypJ7vx9Ah48GqrE6J+LgMZHmP1oJLZ/OrG+Ax52xRPZH66SqVKqlDsnm02?=
 =?us-ascii?Q?JLz+L5lxi0NDSTDT9xcrJfj2BfpWsB4yEFb7PQ92gV0GoVP2o9tdsdQL/DpM?=
 =?us-ascii?Q?N0CSAkCz+XtssHJfXxbLF6T4QswCSPnfmbq5AQFAwAgOUhjAyohU7+/FBUn8?=
 =?us-ascii?Q?EuxVD38eE7VrGu12F2i8+G6s/Bd0tlJzMxbnrOSl8y1Fltdt5Dq+joOJDi1R?=
 =?us-ascii?Q?jeE/redjWSJ6oc2arXwH3M+N7x0Taoh6VMFJccIJ88touRMLOS2pX+cV8HdR?=
 =?us-ascii?Q?7U6jEmO88YFGh7hLPaugEsYTeidUAPbLL7K5F7Km4PPie5v56WgSjcA4R2xj?=
 =?us-ascii?Q?SSj4udzsI0KiTjZNGkb3RHPadTaz/LP4/YuhEc2j7hwVSH2pp73w53pMZ0BN?=
 =?us-ascii?Q?lbpg++XCZ0edwojK4M/XPVdYPuqbGqDC5L+aNczskiIX2x1lkmJpDfVcTn1h?=
 =?us-ascii?Q?xnuNCV9Vbl7pFrd2HP81puz5JKNrrHHqnaO8Fa0ZJ826ONPwPuaXvbefZDnZ?=
 =?us-ascii?Q?iczDLKtK6CAUB1GKD6skLrlU+l+2XCH5CatlcfV8nKPZBsPCrgS+vCxalEPx?=
 =?us-ascii?Q?HK9yUM3thF3TO06RClVWxb9G/9F8GMTdLwI4GV3myuBXWQiVP6EtAUYwT2Rq?=
 =?us-ascii?Q?EcjQsXohignDS3wUKM/ZmOkL909hT6Neis9pmK+3MnE8hnaY1xeyr9hpMoBs?=
 =?us-ascii?Q?wm+QVom5xYe8fJEgsdpgmn5eA1uXNzygEefvjsW8hLt8HiKhpWnzT7egsRH6?=
 =?us-ascii?Q?eq9pHUKu3qJ/YrUpifNk99/W9aAHCeyvd7+fUF9G9FigD6JIU3BunItE1Ts6?=
 =?us-ascii?Q?47tXg2H8WdHPfpBO3MpA13Sh8fAvO58mOiwIcuLhNCNbqM2rq6BHt7nJNNNl?=
 =?us-ascii?Q?6WNxqqFCmfoLb6MrEKW79pdOWq1yoqUwWpdDmnPcqNrp8nxV6tAYxy2N6J64?=
 =?us-ascii?Q?EJPf59cYtxAUBNoKfi0xAYDxcxQT/VZQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIAVTOC9BD1sFcYnCVQ3rt7NTFeS84XTaMCeiI9HINLD1JV4wg8tfkLzds+4?=
 =?us-ascii?Q?4MVcgCmiId7YwM6037UZ3VRHsJFQ9jLvWdiSTHqzOWJYaacIUYx6FPoCcI8n?=
 =?us-ascii?Q?AN4SfJKGRoNUC4lAlfudk5YaRYQplM8l3mNcmpgD7gamCMKiyyIay5RJ/QGH?=
 =?us-ascii?Q?m3wCGqJ6l097282xKM//LzT0GrNs3/+ZVu9fN9qUAVdMxbdS1Vq9CZ+nc1Rp?=
 =?us-ascii?Q?Yiv8sAKSrZRiyt0mvjdhInk1okh7KdUMiRhbSWu++qQcFPhDLmEVkTV7iRYE?=
 =?us-ascii?Q?U9f7mHgMbypEwNDIt6fxpYht+BD8SwjP8LK1nNq324Ji49PUSQczB5pg5d6O?=
 =?us-ascii?Q?Fn1SOLpUEVjW4jd12qOV8lNuxgghYPqmtxmawtHo6wxm1t/EUUwVM9s1DNjW?=
 =?us-ascii?Q?YWclQ+giBLeJ1oiI3swFyxzYn2pJ334niivtgs4J0s3Q+m6sJ/uhOpG7iBxT?=
 =?us-ascii?Q?zEdrOcRicYvsxaZmvPYCCZVLrEOYh1yoIYrNcChPUkEBSH6EYBBViltrYxAW?=
 =?us-ascii?Q?D8Bs+/zrwcbBRYpriptE39hWVi+izW4DX+SJnTMDknmbbzmGNZc4nzxQ5x4H?=
 =?us-ascii?Q?kod3iMuCzeoMUEbChaFx0sGICfcZBCFh2aKTYtU0K3x+MPXl+UTGOFTmMW/m?=
 =?us-ascii?Q?UQrUCJcOOKkW6rYPOpscE/irGiZ3cIgNoozwvclnsupVJJjxi0HwlT+bXwHK?=
 =?us-ascii?Q?OUpH7p9pAI/DEh33ZXrn0XAkwbAM0lL505Zbfk/B6DL92ADSJv3Stjz4yU6Y?=
 =?us-ascii?Q?QNDyEWs6NAsCNFLCGzxCyH1Ma2+u+yrmxHRL6hSO9mWrEMyb45LplKq83nrh?=
 =?us-ascii?Q?yhR65Pp1QK12CRm9rBnaPwKobZZQd3VwOLjtBiVE4xQIhHQj3QQWyWBe22Kt?=
 =?us-ascii?Q?5SrBx3XFIYmQctp+IJu8d1ONIcdjY1zM6tlKSdz7LU9hUZtikQpF70ZPbE+i?=
 =?us-ascii?Q?s6FfkakrzNGEJgu/tbkDj7qWO2sh9JCNw6lRjDkdFmBFbHDoD6oINmSS0187?=
 =?us-ascii?Q?VB8KYdNADUkkA5363agscUdrtYpmHXKIgBtsVPPFDPdod63FTQBWSV2QOE0J?=
 =?us-ascii?Q?qw66nzBu48sdBwF594JmO/bh8ATqctv7LM8DSeVrP7Rn49kS+XgSOnqZUAk2?=
 =?us-ascii?Q?2SbOIztL60zMHlUNKwdAZ+xESOMLgzVo4NUI/Lp+mCFaP/TaEMfSsQzhdGbm?=
 =?us-ascii?Q?xkyP+6LZYPdBQkj/Gr/p/rZxGVfKsEcro4tHcpkODAmU0lXINk1mBQEQu7va?=
 =?us-ascii?Q?Kq9TrvCzf1xYe9Go0gsUhl5IC0XTx+/OHWQ0kofD8NhmileaK+Z3ip2s8QC1?=
 =?us-ascii?Q?HBUIR6Eke34anZ33m/kD1+Z9JEXsQZMDHdiEX28lYBvwq/e9vlkj135dSvbo?=
 =?us-ascii?Q?7GqtbuB9NW8HEW+gKt35K8Z0kTnKKsXaOy7Y0A5zmdOM7SEYqZMOxKTywQb1?=
 =?us-ascii?Q?4z0pgpeFIsvxCBVRx4E3vFaVQmvDf9Oq53zcp7ZQp3oe2FWeNm61DA84KkaX?=
 =?us-ascii?Q?9zx2E6aCHpfnSFbQNxABxGr0TdDXV7FyNC0f+m1ifzGZRlf/338XA81v6kg5?=
 =?us-ascii?Q?wA82mP93zn/qMCKaab38cRDe6mTZdxnwbyNxQvYVP2lQ4yKngKze6t9onfN6?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b437eb9-667d-47ef-222b-08de11be84f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:58:31.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8GxVNOZYFZLiEUL2c0ZZvGPAVrGBkj4MGUeBR5lbvLY9Nr7JgNCjdj45hByIB/B7ulPDWBIj+fhDkDPxDydpZPspTmAErBRVHSzViko04c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4422C5374
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

On Mon, Oct 20, 2025 at 08:58:22AM +0100, Tvrtko Ursulin wrote:
> Auxccs platforms need to be able to invalidate auxccs on the blitter
> engine.

Drive-by comment:  there's no auxccs invalidation on any platforms
except for MTL/ARL (and register 0x4248 does not exist outside those
platforms).  The blitter engine was not compression-aware on earlier
platforms, and after mtl/arl all platforms transitioned to flatccs.


Matt

> 
> Add the relevant mmio register and enable this by refactoring the ring
> emission a bit to consolidate all non-render engines.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c     | 118 ++++++++++-----------------
>  2 files changed, 46 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 228de47c0f3f..12a7d7c73158 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -88,6 +88,7 @@
>  #define CCS_AUX_INV				XE_REG(0x4208)
>  
>  #define VD0_AUX_INV				XE_REG(0x4218)
> +#define BCS_AUX_INV				XE_REG(0x4248)
>  #define VE0_AUX_INV				XE_REG(0x4238)
>  
>  #define VE1_AUX_INV				XE_REG(0x42b8)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index f384c9968859..87e467972070 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -248,46 +248,6 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>  	return i;
>  }
>  
> -/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> -static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				    u64 batch_addr, u32 *head, u32 seqno)
> -{
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -	u32 ppgtt_flag = get_ppgtt_flag(job);
> -	struct xe_gt *gt = job->q->gt;
> -
> -	*head = lrc->ring.tail;
> -
> -	i = emit_copy_timestamp(lrc, dw, i);
> -
> -	if (job->ring_ops_flush_tlb) {
> -		dw[i++] = preparser_disable(true);
> -		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, MI_INVALIDATE_TLB, dw, i);
> -		dw[i++] = preparser_disable(false);
> -	} else {
> -		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, dw, i);
> -	}
> -
> -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> -
> -	if (job->user_fence.used) {
> -		i = emit_flush_dw(dw, i);
> -		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> -						job->user_fence.value,
> -						dw, i);
> -	}
> -
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
> -
> -	i = emit_user_interrupt(dw, i);
> -
> -	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> -
> -	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> -}
> -
>  static bool has_aux_ccs(struct xe_device *xe)
>  {
>  	/*
> @@ -302,40 +262,52 @@ static bool has_aux_ccs(struct xe_device *xe)
>  	return !xe->info.has_flat_ccs;
>  }
>  
> -static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> -				   u64 batch_addr, u32 *head, u32 seqno)
> +static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
> +				 u64 batch_addr, u32 *head, u32 seqno)
>  {
> -	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> -	u32 ppgtt_flag = get_ppgtt_flag(job);
> +	const unsigned int class = job->q->class;
>  	struct xe_gt *gt = job->q->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> +	const bool aux_ccs = has_aux_ccs(gt_to_xe(gt)) &&
> +			     (class == XE_ENGINE_CLASS_COPY ||
> +			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
> +	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  
>  	*head = lrc->ring.tail;
>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
> -	dw[i++] = preparser_disable(true);
> -
> -	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe)) {
> -		if (decode)
> -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
> -		else
> -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
> -	}
> -
> -	if (job->ring_ops_flush_tlb)
> +	if (invalidate_tlb) {
> +		dw[i++] = preparser_disable(true);
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -					seqno, MI_INVALIDATE_TLB, dw, i);
> +					seqno,
> +					MI_INVALIDATE_TLB,
> +					dw, i);
> +		/* hsdes: 1809175790 */
> +		if (aux_ccs) {
> +			struct xe_reg reg;
>  
> -	dw[i++] = preparser_disable(false);
> +			switch (job->q->class) {
> +			case XE_ENGINE_CLASS_COPY:
> +				reg = BCS_AUX_INV;
> +				break;
> +			case XE_ENGINE_CLASS_VIDEO_DECODE:
> +				reg = VD0_AUX_INV;
> +				break;
> +			default:
> +				reg = VE0_AUX_INV;
> +			};
>  
> -	if (!job->ring_ops_flush_tlb)
> +			i = emit_aux_table_inv(gt, reg, dw, i);
> +		}
> +		dw[i++] = preparser_disable(false);
> +	} else {
>  		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  					seqno, dw, i);
> +	}
>  
> -	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> +	i = emit_bb_start(batch_addr, get_ppgtt_flag(job), dw, i);
>  
>  	if (job->user_fence.used) {
>  		i = emit_flush_dw(dw, i);
> @@ -455,10 +427,10 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>  
>  	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
>  
> -	__emit_job_gen12_simple(job, job->q->lrc[0],
> -				job->ptrs[0].batch_addr,
> -				&job->ptrs[0].head,
> -				xe_sched_job_lrc_seqno(job));
> +	__emit_job_gen12_xcs(job, job->q->lrc[0],
> +			     job->ptrs[0].batch_addr,
> +			     &job->ptrs[0].head,
> +			     xe_sched_job_lrc_seqno(job));
>  }
>  
>  static void emit_job_gen12_copy(struct xe_sched_job *job)
> @@ -473,10 +445,10 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>  	}
>  
>  	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_simple(job, job->q->lrc[i],
> -					job->ptrs[i].batch_addr,
> -					&job->ptrs[i].head,
> -					xe_sched_job_lrc_seqno(job));
> +		__emit_job_gen12_xcs(job, job->q->lrc[i],
> +				     job->ptrs[i].batch_addr,
> +				     &job->ptrs[0].head,
> +				     xe_sched_job_lrc_seqno(job));
>  }
>  
>  static void emit_job_gen12_video(struct xe_sched_job *job)
> @@ -485,10 +457,10 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>  
>  	/* FIXME: Not doing parallel handshake for now */
>  	for (i = 0; i < job->q->width; ++i)
> -		__emit_job_gen12_video(job, job->q->lrc[i],
> -				       job->ptrs[i].batch_addr,
> -				       &job->ptrs[i].head,
> -				       xe_sched_job_lrc_seqno(job));
> +		__emit_job_gen12_xcs(job, job->q->lrc[i],
> +				     job->ptrs[i].batch_addr,
> +				     &job->ptrs[0].head,
> +				     xe_sched_job_lrc_seqno(job));
>  }
>  
>  static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
