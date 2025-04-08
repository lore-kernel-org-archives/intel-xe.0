Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8C2C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 14:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80C810E147;
	Tue,  8 Apr 2025 14:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5hAfIkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E7210E147
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744124129; x=1775660129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fnXRNRv4ULcr/Uk03c+abzfEv6g6sEq7IbtOfaSOj4c=;
 b=k5hAfIklSK54S23487pkmW/dBiqedSGd4jkgJW6KzJdiI9kV3vptOrka
 Dr+VXF/eFLwt1GApnhn5gKnbdUQGBzuclb5xQ4ec4tJvANwjZ5QJdH6bP
 o1bgr6rDQwVoTyL45ViVFlk/kw7BFY6kGT+YH0l4lPnENP6KSFshc53I0
 hYtwi3bN/VrB+042ePcEoOlZooOAnLOmkClv2BSI0UkHqHESU5TGg9BAx
 A+PMGcuZ2PBDZ1TzzAld/62HfNmRNfV4tMpKcw8QHwQjnEtCjI/ITKMqr
 uAzH6oe4szIzwfPkvUR9SozomqhpNN1Gsnt2+T5a8D2m76o0pdBAVFs2X w==;
X-CSE-ConnectionGUID: T3VrB/c1TDu9Cb4V2DkPKA==
X-CSE-MsgGUID: exPzqsrDQnKz2qooJ4dqTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55744828"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="55744828"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:55:29 -0700
X-CSE-ConnectionGUID: 2ROP8o+oTj+nbSelbEDdMQ==
X-CSE-MsgGUID: 4DacXun1Q1SZja7dzS7tJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="165514734"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:55:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 8 Apr 2025 07:55:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 07:55:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+fNRr+7Yk9PXqFGls9ni4LK7yzMaTsQKm4HWaiGovvcJL/h4n6JCRdJ+/mtumWsiWZ+W9wDPZDBlNORKmUVPKmPCTTx1L0JANAlCySatr12Blg8gdhPjTMJ+jiYCpVflcQOo81wRqlKNj2vJxHNjdzso2ehBOPDXn6aa379mijzrtToBzxlwdec85RQ29KtfSPr61SkeLQmUMWhbp/WHoCDfnshio22eKUsy4HmFWlwtifuQqixQ51SmRFIPLJfcA46eI81n5a67K3a8I828NxJONbN6kjHkkV7tAP6u+WaKWxySci6FaLIXRE8AtH3/IpMGQ02b9NDFBl+/mb87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHScnwF0VW+GxrGnBSvHzPJR7RN3xAYrtLTj4V76fOU=;
 b=CSeKwADuMcb60OGgOFN/GfXS3ajLI9ol1rs7TpOtKbPJ2FeCymc+z+TMoxQp8OolfwsZujAZFjTQxrA9bCJpQPi9/77sOlFjpRdLp8NxnWRPbQqg+B+z4Gd5Qyb+UEaHHRrJePJyd6XN706Qv5tq9ROr/5bsoP7TlE+78ioi0qLsVoT3G+qYylHc6gW/AI3ZY6mnWVtS4MUuOPtqjH1LifuwYLuirCchP13CipotMjqPIE6qc9YKKY4UFjNAJwavu1fP4xdIAPTe753vAL0ShChlud8Z6/lmnIi8hIbdSmP9ZlPPw7YZjto2Wtz5AU8ZZhzNK2qDV+jhIiW1fGhkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 14:54:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:54:39 +0000
Date: Tue, 8 Apr 2025 07:54:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Extend WA 14018094691 to BMG
Message-ID: <20250408145436.GP1439735@mdroper-desk1.amr.corp.intel.com>
References: <20250408130702.679403-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408130702.679403-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b3d86d-fb8a-4a10-f0f1-08dd76ad4959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JPBB+Ruze9cIzWD1yf0NRUzt/KNbr4jslmmJ4mP5LDUcGnN2QUbqfC+rgqxz?=
 =?us-ascii?Q?ENzB1Sbcq3V40RPCV6+9avh4dBsThQEPDMCH4NqJcpjO8LhEJyNtfrT3dEo2?=
 =?us-ascii?Q?+W8UO0FfceW4CB3f+xL2nu3QBi/d6qyowENKTaaf0fYt2xlcmAcW4AlEkL7j?=
 =?us-ascii?Q?dU/ZYWueNuNpvwzniqYJ34rnhmN6lzxlJcrNKwhsU0GcMmiYZ1z34tjjYaz+?=
 =?us-ascii?Q?eB250hz5YpdZC1d298AAN8ZV78ABZ0JZ+T4BBOH1/JQwjmbvF/QPYxHh2tL/?=
 =?us-ascii?Q?zCBpkAg+qc9uDfET2DDCa/vu/8h1jZcdIUPCO1Lpne65uXQs+KnVgVhbtwVJ?=
 =?us-ascii?Q?MNHqB14j9i0117itWI3lvSJ9Udli0KmHrl9bcaBFmeMyEi55v/DT2ffQlv1z?=
 =?us-ascii?Q?KNfYObN5Txy7BNr4vg7KaSklZbsq8Jh6uMfC1z7NKDJwOyhkbc7E9vXL9oG4?=
 =?us-ascii?Q?ocrOwqurBAuMXGh2GdA7nnrkwaSJYLFOnISUeN2yVQbPeXw/yVuKOneiqfzF?=
 =?us-ascii?Q?j4bwUtaUCmHTWXB5WXpof96UlnaStwWFs47sz3kJbK/B1k6f+HnFdR8qleOh?=
 =?us-ascii?Q?wGgMi8Spxw5O+ykAmfTYFlyWm0RdP8p2ReBGN7rCuZ1k5q6bMJExesvKaWdH?=
 =?us-ascii?Q?Z+UODjc9zmXJmN6wMkqkyEO+g2kqF/UyzxA7wHFYXJqLtoIflTRhksfNDmeG?=
 =?us-ascii?Q?VYgDcyCfx1wbVWK95g/mPaqJ1FfPuql+A1W/cNyf8E1apuGb334ojlBh6QIG?=
 =?us-ascii?Q?l69CEDfFILtR2BlpwYrFS0ToBSz0Nn8+UuXgmoZ7FKrQQuqMGdy6j/PBQMJu?=
 =?us-ascii?Q?UNtTKsmC8anbvlCBBdYBZiHhCEgoDTR2nAjOnGdsGe3TXrBfUn0HYUObiAfX?=
 =?us-ascii?Q?8irI0DfqUcTQsVnuf+KPtKbuG7YhccNVJaZFPzxkIOBARHlrwWzDR114cXCl?=
 =?us-ascii?Q?73dsniOdJzBrabq7HDkK5uuz1l+NLFtIZT2AtGsouu+xWuy1T+bO4ciV9cWm?=
 =?us-ascii?Q?vMMS5N5sUcrTqdEPQj45iMxXB9GcW7A7YNrAld6nlYT8+O0m5sGdUgkeB5Iv?=
 =?us-ascii?Q?njGaYuqFYzDapKFWalmtvKTy5sA6glXtLVzA6ucYrTLPNGL5Uzav6aYyGKRy?=
 =?us-ascii?Q?617pbvIAtrQtzvC6uRuURK7AEGjBDraf11N0dcsoBLVs+OWojsT+v9fI5lK9?=
 =?us-ascii?Q?EOGs+rvLF9a9MsN4ZApQcA1SsRgTzGJ93m3g7rYOQ8UXeBxqIRozQFfpJy/G?=
 =?us-ascii?Q?3zcou1HpQ3h8fnNdl74QwyytddjioxAHIbuX3FaYE3D+kYWVurnI1ISFLHmC?=
 =?us-ascii?Q?j/dtr5hlFMxruahZ8H6EOHm0tcuwMLee4YOx0n3jLDE5TTSJt3KnvnvmxjzO?=
 =?us-ascii?Q?w7BxhH3CvSyHrBq5h/rZbQfmLVbm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4NGVQIGUWya/YjdDUijawnZ7ku9MjY1ZOPnEn38H1UlXGm6zSWD0VR4y/XL?=
 =?us-ascii?Q?BnOLl9YcHSSw/GzIr2mIMbaHXhjxbuNmBNttRRwWnvIWfazzxTMl+tXKeH93?=
 =?us-ascii?Q?58hM4gbRD8LF/lSdibHHQ9m/E9tvcjB8c11Vxl2jdzZmrQerSF9ccF8o6yHt?=
 =?us-ascii?Q?E2WqAAqn1t06ZhNUDI+c6JTkhuxrHD+PL/fhmHC2lb/Ty4vTbGikaIKcJF+w?=
 =?us-ascii?Q?UV/OtOdtGF6cBBjHB2nEDx5D7C4tCLWJY7+jIXKqeYjh0WCCMGQcLaJUp/e9?=
 =?us-ascii?Q?WMFokakkr6ZlDBVKKxmHU0n1wMHrJuS1SBrJD+8cdxKpm1u9PgwprgtkygXK?=
 =?us-ascii?Q?5lC9xM5dMSGQiw0vZwKcLvRR10yd+zWCDwrUWbjbSbzH+BiKr7LcqlmPV4sH?=
 =?us-ascii?Q?RQXHPaqugi2Bdfj1kbVOjd52mEB7WciDf+EVCBkmdKVn8xvl5L4b6HtEqKOL?=
 =?us-ascii?Q?SPtCOcVrudLlGhvztKgiwVVQw1y1CZ3xdIUxzfzP31iSIcJat0GMOOr3oVZp?=
 =?us-ascii?Q?GtX6qG1XUvhv+VN8fLBOOWuiBO7uqkCiHVTxNQDugc0GE1WEwLOCCmnoOVze?=
 =?us-ascii?Q?mWgublEnE/QLHnmpYKJK0svsb7yr/qavgAChTUzRz2H8EYkdplOCqvVVZz/s?=
 =?us-ascii?Q?WSyHGerpuuwYZfK/e8qGTrlWDT7+nP82IX/CiIb5KBs0ZcqpAUvFaJuK63/e?=
 =?us-ascii?Q?oSPTLt+cxkplxCFoZf3PIEoKZBGgYoaLWUnolHwdxAGaH4j3onQbXIP2Xh0+?=
 =?us-ascii?Q?f+bDchGXD0Y/LyGfNnccq4a952sEUoXG7WMYaWWYPGh/fwUJTQjMzHPUJu0B?=
 =?us-ascii?Q?q1pBGz4F/wrcgROCfdU832UG6JJaIQpo/OMjkEt5JY0XDiHFv9EBMD88vWsN?=
 =?us-ascii?Q?y915bmbJpxRjSfAmUxBMc5/ej4lbuKyPNKQMNaFL0I6S5Ga4KSgZJscKAkJ6?=
 =?us-ascii?Q?GbKcgfTTNDOfl1Ev84egccnzRe2xR2g7H+qGVOM4SDiVKC3slI5spdr2p+NB?=
 =?us-ascii?Q?8hNRZp3pk2hqHB0D5DNhf25Jafe7NEG4+l1J5VFH2EaIu+HxIth1/XKfzh4Q?=
 =?us-ascii?Q?6RB7HzpYWgw4rlN3QrxYiMdtEjoOWTivUzcmvwBqPFFFj+o+ax24KLI0ACsD?=
 =?us-ascii?Q?viy6WKMESRNXJMMO7mjzPfh/uAp8heRGLF9TpGfD9/6BqH8bemC3MQMnSsdl?=
 =?us-ascii?Q?QoPYXJ/kPScK1YeGGlmtNW7yOGMLOdLUFPrxYmNgN9UbCD6H92tJiir1VZHF?=
 =?us-ascii?Q?jqPlMXEH63g4qEqTN5qJRo07jmLEKDkZmigv9TjaAaOMhlnbTwSEnlqLIVg5?=
 =?us-ascii?Q?Z0NvLOOieOxldFnkh7Ch83RQVYLbOtoh8mQHaK3ImSBQqNunIVXHmDxUbvfw?=
 =?us-ascii?Q?DfyAJOCUZ6EZVzDeePELAa1bibLHbtbCL8UmEsrZApBbxkP65GX+BAzMY5bV?=
 =?us-ascii?Q?Bx5aMEOUOZkwmDiINppG70CVTSytQBnX15A0AuTufBNnj23tXGcDPGIDsfHi?=
 =?us-ascii?Q?8lS4SStOCJQmPyzPP69AVU6oaL4hRyioTGT/ZuUUamQ36UcLJpXxqyqmYrTe?=
 =?us-ascii?Q?A/1gEwUEbFlEcLjCYo4d4bKSwfVhcC83SGgIYkjNS/o0dLwwq/g59BAmiZOj?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b3d86d-fb8a-4a10-f0f1-08dd76ad4959
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:54:39.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Id7i6danCb65IlArQkULqXPCCwn1TFT2Gej3Da1MONfYzs/HVxeCDUXurD1oFdA6VS0tf+Kci0NJV5SkNkv1xx1qD8ptj/c+51OHGfLXdl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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

On Tue, Apr 08, 2025 at 06:07:02AM -0700, Daniele Ceraolo Spurio wrote:
> This WA is applicable to BMG as well.
> 
> Note that this is a GSC WA and we don't load the GSC on BMG, so
> extending the WA to BMG won't do anything right now. However, it helps
> future-proof the driver so that if we ever turn the GSC on we won't have
> to remember to extend this WA.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9b9e176992a8..956beafe6c86 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -21,7 +21,7 @@
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  		MEDIA_VERSION(1300)
>  		PLATFORM(DG2)
> -14018094691	GRAPHICS_VERSION(2004)
> +14018094691	GRAPHICS_VERSION_RANGE(2001, 2004)

For now we prefer to add separate lines for 20.01 and 20.04 (as
Wa_18024947630 does a couple lines below).  New platforms / SKUs can
still show up that use versions 20.02 or 20.03, so we don't want to
start using a range until we're far enough down the line that we're
pretty sure that won't happen.


Matt

>  14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>  18024947630	GRAPHICS_VERSION(2001)
>  		GRAPHICS_VERSION(2004)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
