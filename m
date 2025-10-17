Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34A5CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 16:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9636310EC76;
	Fri, 17 Oct 2025 16:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRmAmKVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DF10EC77
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760717127; x=1792253127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Rt+HsxSjh3QB/Ygr9S/76kI9fD2RAYnsfTPO7YsC58=;
 b=GRmAmKVFCiAoNRA4TRCysZgDxlPpdpqzO09S5jsCOc6Kj1ycBX2STPUD
 Evg75rVcPXrGiuXzf/nKmfvhSi42oR77r1yMoONf3jc97WrXGP5LPxoJV
 3COwAL63w7e8iMRTGKetagGyaHej3aoE5+GzzIhviSmjGPzC/FCdtdSyA
 J50F+PShN51KFmrdQqlRzuhmjTyUUD4tG1otPnzz/HVdPMM4dbSVoJlNE
 xmzQh453RN9ICOIlZY0Re1Kp9FFyRjXOQ7sBFz+6+heMCfY+yvJX1L0AN
 6LtWPAH4FlI7i/6atd8myVIMh1NKjM5hXu0lnyRPQENcLn6tkkBr5Ob1f Q==;
X-CSE-ConnectionGUID: 9pSjtvXLTpWrRwkixzlxIg==
X-CSE-MsgGUID: 1oG0nzO9QNmqeNUIgTupUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62141163"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62141163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:05:26 -0700
X-CSE-ConnectionGUID: rto8TWZEShmS/WjQPA5b1A==
X-CSE-MsgGUID: quQc8kEKTbi/OcPEwPeVXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="181952302"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:05:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:05:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 09:05:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 09:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo0i5qXwwRY0IYAHL/xJQMZHziqluiOBbyBxyfZIFX6BbXYHP5tsCGnnfknyY5Gbzq3XuXuzprTzRCpB5UQ7mvlp7sb78JJc+Dr2JXIM9lz+51YY5JT7buDrGj4uAVh/axalOuc2gWz5oqT/D/ppsU9gp28JkTIHRNtqJhnyVbV8z1kJ2+PoEcIPvS2e5AEpp9YEn5bXV8yA6XhgWquJfZrEfjLgQJ7eVJNm0wHikCBxp/TURAuXGyy+UV0u8W2dmHSMb5Uu/YQ0EJcGGDQkMBo+vBjZ71tVbYL/LERUO7z60GSkigiZH4yezfKcx+Y5azSutPURpcImI9sRhWmOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFgwmK5/DOg2M95XawHi8wXCdP+ZROWnjVW3K15ivQE=;
 b=g7iWvgxQNNCyyddbKXdnFp6SzT9Sm0Jb5X09+dfUaNCK8vD6xDpm9m9Ul4ftHomgtF6p1bkDNW0rgL49zpxn0A6bj33bGsCxI3cmHjjVzKiNZw423AoTjh3a/TCSI3vE36KbRhxnJgbwgLltXsnawjfIo8HFlngYfYaf7xBRL3HJ0WNiWO1pNG0/fa81RgrSUPibCFSRmVQ6mbkV3QQ6lNkmMlnrjfUQkeHyJvoSzxPaQHTbR32eVClvXQyD6TEs1q9NICIz3Ity/2cGvdEW+syCb2bE8W0XtyKWjZmvgUyM6UR5AK/P1Hb9Md+PCWZBpd2Yq4OqaKM9dTKx/FhLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 16:05:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 16:05:18 +0000
Date: Fri, 17 Oct 2025 09:05:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 19/24] drm/xe/irq: Rename bits used with all engines
Message-ID: <20251017160515.GS5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-19-3dd173a3097a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251016-xe3p-v3-19-3dd173a3097a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: d890fb43-3210-400a-d7db-08de0d96f764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YSRwUokYcrJgG07i9XgvHuTJ76LIFrtkLIgj7iiTAS97hPHygiW3ij8ZnTUC?=
 =?us-ascii?Q?gDj3iOwJHaVAndZwEwxmPClShAKaKE2e+ShYXj64ap9wJ7pmbsFEKGmGxrUG?=
 =?us-ascii?Q?7v+zTyfrwJ0ek06LQmfcxFCyabQPemCS2zddc7RyJV1Ctew7VkrOhCu+lDSe?=
 =?us-ascii?Q?SpPWBGT2bVak49sTJYhsQ25tZZt4931xG6yTuUZVrgxPDmwQnvcILgLi7b9c?=
 =?us-ascii?Q?/JcegymKr99cPE80PNZgfmalhS33XQ/qPFVdkR+Xn5/13YvFv/IHYWEO839z?=
 =?us-ascii?Q?aRlWB9vgHC7rJORfgScvx+RlfqsB8yZNMmTA2/J7ExGJxsCYv0ebb4fBay24?=
 =?us-ascii?Q?RGsLRayV5ZeFs7aXvCOg9OegSPM9Mvf8tNPuIwTGe8ne8Jru6MBiT39XZZc0?=
 =?us-ascii?Q?6afbnlvyXW6gSSYgk3gqa89GRUW/6T8wLEbz/9TDqRTcLvTl8nwx8FqVwnDQ?=
 =?us-ascii?Q?9lfHcE3kypV8z/kC157TyHRnotXsMroz8veev01f1Rfox8MUHR7OC03Jf+y7?=
 =?us-ascii?Q?JSIAOfuQQcuCEi4+fmnALxDNU85bg5QuSREDuRF8k2Ava4yOuGcbES+yIz9W?=
 =?us-ascii?Q?chCQ74xbfhZi6bsfnrI2MY8e9nPcKA6/370tgD0rnPZWmJ/acq/zAihizjlM?=
 =?us-ascii?Q?+LEeGZtVjvRx5is5ecdxSLYFzGzHNWkwIP5+gfQLdXpnvkz3MLkTP6DutUpV?=
 =?us-ascii?Q?RBlk10RH0ln2vfv/YkK1Ol1a5iSTKRtcf+lEQn9ZwXaqWgF9cH4p8UBLjh5u?=
 =?us-ascii?Q?9yky/a5L3mgAyKNDdr6OvVEvA4CVYretwJZDhyfu4sxcA7/9sYnAw1gXeV/5?=
 =?us-ascii?Q?qfD2DtsNjNq8iQFP37dL7JsfQpddOoNGa67MikB5VcSv+SrxCz4puXj0gLUo?=
 =?us-ascii?Q?zNdL4IrrjYe5LZS9ijpIr5APUjF/1pn2+eEaLOUXf9q6s0FesSCquAJbiedY?=
 =?us-ascii?Q?Ux89qi5N4OOWt79dOeMOc1r0H0aSGTKd3G5RUUwmIdUBUaf5nNNlD0ZLcP13?=
 =?us-ascii?Q?M6E8SWP62SyOyLlOy19qVBhxmp7jRpdVNaH/Dd5XIIlrcLGo+wALiXTyaCrk?=
 =?us-ascii?Q?XA7xMziXesKr8Rhn04ksR/Em/5QwFxhr4Ujl23B0BueD+ek4BJecsSSwoC4T?=
 =?us-ascii?Q?YwPD+QYbA01vJ1ecvyaifrVX17L9/uPqy0g8DsgNW23QwXSHRmE5jg+ED2hQ?=
 =?us-ascii?Q?Sa7Qq60bGWx99PuoAZ5HvuljBGx50Ekju0o2v/13rV1VvPt5wfY/SQBWcMt6?=
 =?us-ascii?Q?NUO4b2RcKM2N3fi44Z6GDVLvPL3hPvN0tTQziC9pOi90pPMjl3TJnrS+KUSD?=
 =?us-ascii?Q?fYWz5V246ZVQ1XMqcA4q2m05NreBFIvABpeR4JXtPD/VDKZLV7WVCjQn2END?=
 =?us-ascii?Q?8vI0pp06fUUUomIflF77nJjWgatPzlV1mA1w6K5cmH84sUwHp4Qf6TGgY/Gf?=
 =?us-ascii?Q?YOfGjH/8knmz/g1C5mFfqkXPlgFn4gUP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5kNyutqgf7ykXhgXVl/Eh8sYdX0+zBuHVLivkso5/efK8+EI9ef1XZbDVjbf?=
 =?us-ascii?Q?IjzkyN5QMKvxZNVux+FwS4IcewDr48uuTGfO5hLdKfq2kVUttS2Y8IF0A6cv?=
 =?us-ascii?Q?xO6yEvsGL9XBO4ueSNcRPym5phQC2Vb+LltXUoZN0z2TSwBcm28kU9aH1pCd?=
 =?us-ascii?Q?k3jxflrExhjl0lgPytsjKYYCegl3hItfIWlF6zUh2tq9Yk1mMtigExkw9BKI?=
 =?us-ascii?Q?dfPnR+AT5uWOLrbg1TZs5XpmALezz5Qd4Gg7umBp1Hj8uSmRb2Dp5eoVAIPZ?=
 =?us-ascii?Q?yzmJ0BTxM5GLwCRPUm0N0qR1QcLE/rsazSuZZjiwMYUNaCO5xi6Xe7RXWvoz?=
 =?us-ascii?Q?GTGmdanq//sZC40j1EyPbMNy6fbD94iTIg41uu3Yuzf34W8L14AeNtARkato?=
 =?us-ascii?Q?iei9Cb1RYSMVhRNQRGcrymoqO1j6DJnDd4+MOA1uClODOE+HRQCDtEiXrZfe?=
 =?us-ascii?Q?c/cSZt1lgirHwVIaYUFz9eH3WYco1NaEsGIdPDriBYrBOJkwHDTTFYVrjB/w?=
 =?us-ascii?Q?Q6rrfoTZA3QfBs7qUcpXD/04xmMeXF2oidyVeZr549WmlF+1fIHvMZ3yDcB3?=
 =?us-ascii?Q?rUsCJ9NbdUgMTJn2m8iSOIjIjnE803M0xkzyzhPyYDodfEwlu2vNoztAk3Wr?=
 =?us-ascii?Q?j4vGkNvZ96Qigc1FKFHtcmRqfak85NKb2UVH71mtswhXYjDUsZ6MjYpR8F5B?=
 =?us-ascii?Q?MrOf5aTuCbu4z0HITosx+ueNeS7vvf9f+dIGRZA/IZVvn5SbSLinSWDROf62?=
 =?us-ascii?Q?ldxDO0LGAvv2v9gIcI9oy5oy4cO3rB5nF6X6T8TYYFGXQSgYQuDqBGl/LDsJ?=
 =?us-ascii?Q?N3e+lGhl5gSlk+28uIuzgXPy6587+1d56Oms0WbXuV/kf1y0GQqKlrTPNOar?=
 =?us-ascii?Q?pGSg/i06iM/4Z1ddMLjF9Os9gO96Kt82XQn17rFB8fkXdKEYmLXkuGYNitJ2?=
 =?us-ascii?Q?bhTXRmCNkW0ccQKjQ2s+Lu6uuA2GP3xoxYKMwi4Q1QfpsICVRGt6czygFyC1?=
 =?us-ascii?Q?jQ79QxlVcw85ScREe7fWHXVvrO6xAAN4es5CgFtF60m/9F1lvZ9/w2Fq/GYq?=
 =?us-ascii?Q?6+PuGZJFZYN/pfUdSOXrz/vmQrd/W69nl5WwK/Hy5x+y9TJW00IqBCp9s4i2?=
 =?us-ascii?Q?VT0X8CvQWnITxKrLYNir8jA99z7eWBjf3ec4zL0DnThqixNRRKo1834hmA6L?=
 =?us-ascii?Q?+Dhh/DHqYTK4qTn1zj3LdcBe6pCLkCMk75UZ8MZ5aB4tDyUeE6cy9+CpGP43?=
 =?us-ascii?Q?sEYU7FMRRghKVQGKXPK8AMIax+HUh/ir0Z4JNRYG4TNBWymS1WsABYN58mOd?=
 =?us-ascii?Q?h1Jv5xvqCfu7pnPlPflEgpFVvbkxHg1J1gaoeXuzcJD194GEwGzb/dn3U3k1?=
 =?us-ascii?Q?sBNMAff+K3XJNwY60JrMqDfqKHMP3f2VevdjWPbFlFFop529GTAmYW5I9lNj?=
 =?us-ascii?Q?QKfw10WA+EE2GrjjiKTAAsCVPsHGOqm34hjfJgsR8kuIg5XYOktN2P/2bJVv?=
 =?us-ascii?Q?PMgOAUu+7jZ85EZTctNnB3cCpe+4owtVWB+XCiPWy4mbw7nBz5iZ7igspXMI?=
 =?us-ascii?Q?kwUtGnRp2U8Ku2PlaamdYSskOTrbwlkSKQrKFiJnXODm+2uTRDImjn8JdM0v?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d890fb43-3210-400a-d7db-08de0d96f764
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:05:18.2179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUIgFKNn4cTy+7uDecg7/XVZRACSJ1GWcAQaz5wrtEmWNYCGotMKeOy08/FqK2VPHQhC70h8lVjSvV/Ja9pSe9zoD1d5/Y7RSreEUo5vRTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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

On Thu, Oct 16, 2025 at 07:26:38PM -0700, Lucas De Marchi wrote:
> Two bit fields have similar functionality across the interrupt vectors
> but are named "RENDER". Rename them to follow the bspec more closely and
> clear any confusion when using them for other engines.
> 
> Bspec: 62353, 62354, 62355, 62346, 62345, 63341
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine.c     | 2 +-
>  drivers/gpu/drm/xe/xe_irq.c           | 6 +++---
>  drivers/gpu/drm/xe/xe_memirq.c        | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 7c2a3a1401424..f6117720963b6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -80,9 +80,9 @@
>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>  #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>  #define   GSC_ER_COMPLETE			REG_BIT(5)
> -#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> +#define   GT_FLUSH_COMPLETE_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> -#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> +#define   GT_MI_USER_INTERRUPT			REG_BIT(0)
>  
>  /* irqs for OTHER_KCR_INSTANCE */
>  #define   KCR_PXP_STATE_TERMINATED_INTERRUPT		REG_BIT(1)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 073ecd263e543..6a9e2a4272dde 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -904,7 +904,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  	if (hwe->irq_handler)
>  		hwe->irq_handler(hwe, intr_vec);
>  
> -	if (intr_vec & GT_RENDER_USER_INTERRUPT)
> +	if (intr_vec & GT_MI_USER_INTERRUPT)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 142f422a5d97e..2108c86ed478d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -147,10 +147,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		return;
>  
>  	if (xe_device_uc_enabled(xe)) {
> -		common_mask = GT_RENDER_USER_INTERRUPT |
> -			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> +		common_mask = GT_MI_USER_INTERRUPT |
> +			      GT_FLUSH_COMPLETE_INTERRUPT;
>  	} else {
> -		common_mask = GT_RENDER_USER_INTERRUPT |
> +		common_mask = GT_MI_USER_INTERRUPT |
>  			      GT_CS_MASTER_ERROR_INTERRUPT |
>  			      GT_CONTEXT_SWITCH_INTERRUPT |
>  			      GT_WAIT_SEMAPHORE_INTERRUPT;
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 2ef9d9aab2649..b0c7ce0a5d1eb 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -434,8 +434,8 @@ static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *s
>  {
>  	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
>  
> -	if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hwe->name))
> -		xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
> +	if (memirq_received(memirq, status, ilog2(GT_MI_USER_INTERRUPT), hwe->name))
> +		xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
>  }
>  
>  static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
