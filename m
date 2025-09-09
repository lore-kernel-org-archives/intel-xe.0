Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24FECAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9CB10E73B;
	Tue,  9 Sep 2025 13:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZwejZbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5661410E73B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426120; x=1788962120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g2t7FFTOU9cG7tup8H7vVZ/EHcaz5I/CytRMHsKy4Go=;
 b=BZwejZbWWxj2rZ6SHFwsTebgBwJhuAEFBS6Jp06C2ueSHtPfiLrEGwcv
 CD9sI9DzIRPgLeU8Nvlm6t/vUVii0cK1vQpmU30P2teCFqhA2UD5A7VDo
 TeVZZcR7HE7SXOXTXMrBXVXV/02cbK4Sgld+cd5s513TYkAAjdi8BgywE
 jMezJAgqPEIbM1LW7tu+Jo+gcbehoXNF+5/JuVzYeGxST9HeNXoVUhDqC
 +dANtM3HW7hD/DbDIDST4w5qGoYNUU/8xsDgy7VzH3woeiA0XoHrV9amD
 MlTltIVf8QWMVgctJo9ZMcDfWgSWnt2zv8IHWW3n6MgTHwWoDwastFE/u g==;
X-CSE-ConnectionGUID: INk6Y86YTt+3dDzyJUf1IQ==
X-CSE-MsgGUID: SiYbyDHsRSGyHwvVHqqhTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59567920"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59567920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:55:19 -0700
X-CSE-ConnectionGUID: 2SOGlOt/Rw6M3c/oa7POGQ==
X-CSE-MsgGUID: V4tb9xVLQWSIAV/OcYHgxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173479111"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:55:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:55:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:55:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj2ZDPUHMky5hkbaZpR4wZFD/et0zynm5s1pNzNCeaDq1T+dJi2SNXbteayWHK6ZeJ61jYyQWxLK9JrU6rdlUI6hcP1b8EZ4Pp9Dj2mDlxTKY6YHVhSRhBWc4ErRjWX6FD+BS5sbMn0kwk9NEB8efvTHbyauCyvqRClSrAqPC3Y09UNRjNjByX92B4xaUnGhf06xp0x7eqIjvg/JVh5BqDatgTIPploXhEzUxqHZvkZrD/CJS1ep+c+CrclPqvh209g+qlrnXasSgyuZvs/qejgfwcHi6v4z6ucOSZEXdLv/Dmk5O9wou23LQZ4zlcZEsMpPAbRn1muJhusyPhzwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bWEunw62vX4y05U3WD+j6fqRKVjYQafsbfW4GSd+OI=;
 b=a6zfDivbf5KRVigcXWFeMYtfrSrWeLQDHsEFQUtxiSIVZDCaJxQu8U5Q8qojEg1c55olUVMxyVxGZSrmMNLjWB7AgvaVGXkBXJwuCWwNsbhoe2eBXuenpHHr+m+RjhEWkEVlXXlJTM1teJKluGiHEVhUQk/Ks0ZmkdAI+D5h82madyk57+jm05NpuWteFewXMUEpfD4nN7s1UyTVlIcPZARdoGpa31NX7c33mzt3W1Ei9hHkkmRpN7yIp7GtrnC4UADxg9NVWHvf+FoBjkI8PLRTGnJhL4ZpB83BXE6rMIInqwOUzbokYIFjDGxr2I4KRV0B2BXmU4b6pptlTAWlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:55:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:55:16 +0000
Date: Tue, 9 Sep 2025 09:55:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/xe: Prepare format for GT-oriented messages in
 one place
Message-ID: <aMAxwcgCOHcNtCGg@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: ee261995-1cbc-41fa-bed2-08ddefa88188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gb6UTWODFNnxyujs5JIKmSVhdUTQRAvstFJi9XMLVdplIqxh35zShIiy9jvL?=
 =?us-ascii?Q?XNOCJ3W4wsI6rpznRgDTPHYEQGey7xaE3XtWH2S4AMKbPDXtMoUzt76dqH4F?=
 =?us-ascii?Q?PB88K1dOnDYHC633d4qvjPASy7VM2e1pTSLPxGCf4KJILW7YivEuMZHyleF7?=
 =?us-ascii?Q?+Vk00pBE3MK6bGU6LkMGysVScbQYMg1ZJsl7Xj1lGB4z+FLvpwrE//1wu3Fx?=
 =?us-ascii?Q?NweDDmek/F0TPHL5X9Apet3jiMc/Ky+E6GakhS3CTOLdUzxPssmtcNY3n2wy?=
 =?us-ascii?Q?TNPJSTcbMp6O4b9D3HqA25bJ610RBW8Fh2LkyT06/YH91YFwypc2xPIYMYgB?=
 =?us-ascii?Q?y4rsjOawbdnoa52Qh16d6tJZfKQdD8AxDfJhRVQ0JHBqsfCZjnSDyKpxBF31?=
 =?us-ascii?Q?jp1Bim5dJap1QypjaP+iCaaPgCH7wmG93F7369vgoCO/xkBJrPnyALj0KX45?=
 =?us-ascii?Q?1Nm0FzLzl69MdTYvb3PKohfX2IQ29dkhkKPL5tM0ovbZnmH8kZkoPaJOURnU?=
 =?us-ascii?Q?uhMhnLESvmJXzRrev5tblDR/lhxuwCcjH7Gy17Ncp5OGo713zYRS21zr79P3?=
 =?us-ascii?Q?jb1BC15ksBNBa/FSwQzYzjL2uRg4YqfyIaUBiJhpSTniFcAq/aCtHZWehMLN?=
 =?us-ascii?Q?qhBW0aE+qPNJuIaVvDMxA3Cw9YZVB7rs4/HDPNUL+oXTGAQ47nXynq5JgyH+?=
 =?us-ascii?Q?KIZdY2tCw1jtnTHPP8IFc+pBofI/9oJj5N8Thu2aGkKvdS94WvkBIbmiuFLC?=
 =?us-ascii?Q?peBS3BUZxLJxd8r9bbdiVPbdRM24RFC7z7/PbMjisCm/h0t5OgHKvn7dnrek?=
 =?us-ascii?Q?VX/bf0pgJtPkm546vRSfVDhZSNBQU4+V8guoZbOC5dDx2jJ+mbVEWyBdNYzr?=
 =?us-ascii?Q?GqCpQ6rlN8oZVzz9nwFt54+U+NXc4hMxk1d3M90nBbPLUqInZK1lkPQQBQCx?=
 =?us-ascii?Q?PRWHB7V+mac0SZ2fMQe/8p7Z0ziFqpupPdS99kmz0vqfN207qOIv3e3EXjAZ?=
 =?us-ascii?Q?uNlvch7ixNSvJbLbaMCptUiPQC+7DFHweH84LMvVorXURNAFWveCLjnzf02x?=
 =?us-ascii?Q?01M9B1ajzwt3z2e6FMx8pxFv+CqWj1rMPSlMwGWcLSngPQohb5K1plEuogDH?=
 =?us-ascii?Q?018CgBX6zUwBRovDY2fK2R4cHHIo5BKTOlFuSGiIib4Iud67P8egqmksIw4i?=
 =?us-ascii?Q?EEsK5OQi+hA9RUhO5GMaR2yRpZzBU+xI6zEJhyQrODG2xeoYTBL61BD2GbTe?=
 =?us-ascii?Q?/ajJchOgXXE2G/FurmhY5JG95U1mf5F8yWUpLYqIlTCGgJrgUE/ruRZlHEFI?=
 =?us-ascii?Q?0A/eerLgKMkynCTPPJhoXxGeVOyJVUrMhcZQd17d41iCzV0jWxGkm4c6HqSQ?=
 =?us-ascii?Q?nWWNyW16102z0unNE+iHSjSLVKefPHrYmuqGwDpicB7JRp7QRLWrTnq93hCZ?=
 =?us-ascii?Q?4O0pJWomoSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8k7jTWmGnIFiyFNJuzLPTgCnRHfST4qrYTI3xxJvDamKoqt/hr5O5aC88GB2?=
 =?us-ascii?Q?9XyOMxu3h3sqhwpr/8Tr24BKHwmkLt8bwFOXBgq3W6VfRxMcbtN4NkWGT3F6?=
 =?us-ascii?Q?zdYvnD/dshV1FJnI3K/z315pFQqMJo1qjH5DCEgrDTi4vk/wjn2HcTwF9POl?=
 =?us-ascii?Q?GdxMU+qloY3T03wlky+vB5+4w+E4Sci/1VHPdCbdve6JnNHJYOUVWNLJl1yB?=
 =?us-ascii?Q?8bDznlXzaBg7O9pJSduqHfTn/YJ0vFobm25YN/mE9yZY2Hh6L5tlhhD6El9Q?=
 =?us-ascii?Q?ZkK5Yc7tv1azvti7WAYELJHUwy2QV4LfhYJaw92U4LMg3EQ8J0B1dHarMJIb?=
 =?us-ascii?Q?KeNKLW+gGcRp8DuZOM6y+Xsk8v4B/Z/9bdQmbnU2Hu90qpXBitR34Mk5yWca?=
 =?us-ascii?Q?4uf+07qp2IDArT4r05t3rh+9/K8niTYUwjAgYsk5jgp5Su0lytojtln9hI/K?=
 =?us-ascii?Q?+etDZsS/tuuJuWw6tVnF/n+hxrpKXoo5+zPO/B+9oRKY14GcIKLkqNcCBJ+k?=
 =?us-ascii?Q?g6ldjQmlDpRQY5R6ce4ubbv//+Tj03Wp0Kmx/YdtaNBEMsJ3bY0Md8eXJaQr?=
 =?us-ascii?Q?LcBxQXUmD9G9BV5AHNlbfU1h/RDE2QVRCaaKwGKOAZfMLmPEnDKhglJ60JQX?=
 =?us-ascii?Q?ALksBJZH4SLsx5Io2McyyrWMOTpWeItdg6czw5dNjjoDHQHGFw+m0ifH9Bs7?=
 =?us-ascii?Q?A90ICx3y+Ofgy1RtJugIbU4171l+bP9Fem2xNiwqkan7Ueo0nuvf+TL6R/ZW?=
 =?us-ascii?Q?9PHeqPfTHzIhs7fMH7sB9gAtOTy0eIQw/Uahgy2nsfowzDhLKVclRtiZR2fR?=
 =?us-ascii?Q?hoEu26BjfQ0k0PianjUKJ4nn7qO3U7mjCIa6hADdn4cmypRLcodV0iQByMBH?=
 =?us-ascii?Q?D6GysYpTJoHO10D3q9yQRpudsX1GKFUzR//oOgybu4vSlUY6Ez3dgpiYWfJg?=
 =?us-ascii?Q?3n5iJ0v5YIMFXLJW/tY3KPybAGrFNjpHC/cpwyKK8+Og4RK0i8yVbZKa9p8c?=
 =?us-ascii?Q?CaNiAHP5mzwG0uZZp/immhI1Sj1MKYB04g7Ote+aw8we2HGbgorZzVA2uL0G?=
 =?us-ascii?Q?uYZzG4gWeLCSMxtPFNtqGp/Iriks/gRMoJ6jY/t7xKjp5q+4ZhMuasK6YjRm?=
 =?us-ascii?Q?ZUFMVh62fPsRa22cg7pVixMvYcQKeb4MqVyhv0veb/eFzU9dv3q6dpoIWR2y?=
 =?us-ascii?Q?xPo/w776e3IxQ+DwCI70CvCgCCXVN3Do1XmfJitjvaldE9mFXLqFbzmmtgyO?=
 =?us-ascii?Q?I4AVak0IsG/4gmCZsXQQGjMp0EqOX8uPnXKjQ7j+KfuniWOxp+oDjcL00vad?=
 =?us-ascii?Q?mjbat78ibPHwjvqHnV7JA5ZPqe8cr1JNkhReC03mBUU7GKrXEyMQCBnBM1hd?=
 =?us-ascii?Q?F/Bfaa2VhFLYP/wX6b6JYxWExoODMF5WqrWS/hICJr+X1nj0BmOYhDW3L5A4?=
 =?us-ascii?Q?2X0p3E2ezKYeJZqTBXOW0CeQ1O46dtYInDVErOXfa5DU3tp/ufQXECXjRppA?=
 =?us-ascii?Q?M8iUcFLqQymJoxKGWJ7rlyDh61fwCZo3t+OVpWDrTutO8rFE6z09P52CFKcF?=
 =?us-ascii?Q?c3RHApN6bL3QVtUnzeT9sseDVtXCqQ9dTuRGOEEYOf0h4D0Goc/nU3QIl+cR?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee261995-1cbc-41fa-bed2-08ddefa88188
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:55:16.5490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xit56KZ2dP5G+1ECtSvC3z7C05aH+GRAoFGLebpw/qEqEaIvBHvNlvgq+kzFi57ySNCKuu7b0al2wp06XL9lfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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

On Wed, Sep 03, 2025 at 11:36:08PM +0200, Michal Wajdeczko wrote:
> To avoid code duplication (and thus potential mistakes) and to
> allow easier changes (if needed) of the prefix format of the
> GT-oriented messages, prepare that prefix in dedicated macro.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index f2091c734aba..5aaacaa6780c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -10,8 +10,10 @@
>  
>  #include "xe_gt_types.h"
>  
> +#define __xe_gt_printk_fmt(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
> +
>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
> -	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	drm_##_level(&gt_to_xe(_gt)->drm, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))

I honestly hate macros, and macros over macros makes things worse imho.
Specially with this format that looks like a function call inside an argument area.

But I do understand the motivations of the macro and the reasoning exposed above.
So, no hard blocker from my side...

Perhaps if we at least use all CAPS XE_GT_PRINTK_FMT?!

>  
>  #define xe_gt_err(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> @@ -34,11 +36,14 @@
>  #define xe_gt_dbg(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>  
> +#define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> +	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
> +
>  #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
> -	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	xe_gt_WARN_type((_gt),, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> -	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	xe_gt_WARN_type((_gt), _ONCE, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_WARN_ON(_gt, _condition) \
>  	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> @@ -72,7 +77,7 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
>  	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
>  	dbg.origin = p->origin;
>  
> -	drm_printf(&dbg, "GT%u: %pV", gt->info.id, vaf);
> +	drm_printf(&dbg, __xe_gt_printk_fmt(gt, "%pV", vaf));
>  }
>  
>  /**
> -- 
> 2.47.1
> 
