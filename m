Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A02CA0FED
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 21:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896D710E2F8;
	Tue, 26 Aug 2025 21:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFfth4Rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9209D10E2F8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756242999; x=1787778999;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OtvVKKf71cuxRwZISkR/CBsicwgONrqIhlLvE2dhuAs=;
 b=OFfth4RqRWHrb58xFl2AZYGEwD5Bob3Kugei2XN6NjPQ7rPNmYJSZRfN
 O/OQokV7xOuRLBN3q6+MVfg43rURRCfYY7glqSSaPzTXGzfL0mPGfZTDW
 9iBwn2QZRvz11ElyJdfUulzGDEqMBTvBXj4AGohag72A8RP2lCBtKjaMI
 rXmBKSGj8sD9Wd8RK40BvcvhQgFDb5KxEC/zEV2E9PF6zKp/FEBtq683q
 94T+d/yHWe0q4p9vQpqmLEdoo5IefPQHec7hJcPZcoMAVstX81F46C+F8
 1bnDRb3EMKHi/7kR9+0YHmxFpdsVCsChjPFcCoSgHsjxdx9sDD6B6viP6 Q==;
X-CSE-ConnectionGUID: UHal8YS1TtKYWrJUGS8egw==
X-CSE-MsgGUID: I4hzC/X9R4GAUnDwbefLBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69085121"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69085121"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:16:38 -0700
X-CSE-ConnectionGUID: Yl/fHMDeSGie+RMstMIlQw==
X-CSE-MsgGUID: Uk2Z1nKhSyKTyi0HEByEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174079073"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:16:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:16:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 14:16:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVoU0yn11lTdkbEbdjsgtHEjqHmFjmhk3v59cnemrLUPp4KtmrX+WeXvHLyDENYc6FmMakegsxq/N5zGGc0ySKiOzYTqx9wWO2YFD2Wv97aJEZqtZIeBqhyWkniLEbexve0GMjH15SQYVTmyvCKw+yy7NJSi7BFq/bCDo2r4C74uAe8d4x7b/qkW7Wnm7uZ3rsw5OBHtQ9T18INE7z1XnDNAesN7eaNrQo1Cp7opSVsFvYMLtyWepHkaw8eTgD5dtyZP00n2Tb5hKKE89vyBo/2hmI5pxsenuEwBJSqEBkhrBFZFpL8zjl/9JAvLIbU8DGMQO7DZFvHWsVTP8ykS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lbg5MtysZRZh2RWEfiKPdKpaTl7K5FCxz4rnHF4GHjY=;
 b=I3pdX8IYXOUhjI7yDwGLHS5fg/ZvLX8c1DjBDw56qY4cQVcSIvgOyrTeO9lNmxr4yHb21EZI2QVG6Gnh0BHkdGAz7sEkQYEosF4LfOe5wo8x1nQCbKUwvow2I31rd7u2ZIg+2YoXmQ+mj9ycI++Mpp5jVVViX3on8dyKA0q6ajJzhNTaxKG06/52XpRo5+llEAQXBOmFLU1fMEqCsam833DPZRUAjElcvQaHZerYb0LemF0DE3fBTpIKKddRcOBVXWhsmdjMAehoZlINmqPxvTNVqcvPhH5P7WJ1Hd7o4QooMIso2SFpCsI9cO5PcTMwcMlQYtYt6ty0dKvYpmi7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BY1PR11MB8030.namprd11.prod.outlook.com (2603:10b6:a03:522::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 21:16:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 21:16:34 +0000
Date: Tue, 26 Aug 2025 14:16:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 11/16] drm/xe: Convert xe_dma_buf.c for exhaustive
 eviction
Message-ID: <aK4kLi2XdIeoOFJf@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-12-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BY1PR11MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2feb221b-3af9-46c7-f783-08dde4e5d5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cu0Csn+ZsN2CnxO21xHFWfSJZAF96fmoBni1wvwwesQg8xE2lkODRsY9Np?=
 =?iso-8859-1?Q?62m05YMTea6uEYbCEj9sZdc0zCL0QY8bzweHV38ZxEGgqGRhtv5KO0rg4W?=
 =?iso-8859-1?Q?rsjpB/dsexCz453Vn6jGrikXFZMHlHQmvvf7hTHZrBrsNy7WbAPDuu/J0c?=
 =?iso-8859-1?Q?LBykyte+IAH5e4l04/DPw50QI5wbTB8hJ+CA/Umi3sc4CpI83/3d3ZNy/d?=
 =?iso-8859-1?Q?D0Kqek+uubbd5fY8sD5BxDNtpcsIkIW2yx4W/J4/Y6BMGBb+DS/39FIVnl?=
 =?iso-8859-1?Q?KnazoGgh4P+tE9jo5U/xkLahervdiYQ4NknyFzyZAXe2DawMpOUqQgMxNn?=
 =?iso-8859-1?Q?eXBsarBY+hs1vJgyMCP+qfKmefimaBc1RbV1+JR8O5/TAyO6V3hldklrCe?=
 =?iso-8859-1?Q?QdIowOvyTTWudY8/9vHtS3Z02li8ojTvqzSPY7A1KCCwVGvF4JGGVoobd3?=
 =?iso-8859-1?Q?7bNNst7m9ZEnXUkTwc/tZk1qE6ep4je0IytTS3K+/Y9yfvWtBnt3CJ9hL5?=
 =?iso-8859-1?Q?CK44DiU1XlewyLl6aUapQFY+/0fQrUzQxRJvVb3y2xgcJjftlrD1fa2jpR?=
 =?iso-8859-1?Q?MaxFXAnvvauQBJ+TV4+xWRg/RK7rsCzzf1PPqbXfDd3mx5AnEHQnwEQDfo?=
 =?iso-8859-1?Q?ZUdeRDA8V2VUAyRd8MG/7IhFNfzOO3bD4pVkeME3TsRslEkk7ZjiVqs0n+?=
 =?iso-8859-1?Q?GYgFjvRiE4bHEngiydpROW6ZDLk0AwWf5fgf5rHj3wY1HeOX8xOEaoZa7Z?=
 =?iso-8859-1?Q?Chqy7q4Jffqf7J3+KwEegGp29/93qv+CLveCQPgAkkudFuqsTTqjKg1+yS?=
 =?iso-8859-1?Q?l5EfVRFabgi+wWpGx85XgG8Y5pXE0kW7U9arwvdQSGaGRx4cne4Ogf7pt+?=
 =?iso-8859-1?Q?oRRDjtSNts5lM3FyfuSMAttSMOD0ttaoA5C+NysrvX03G8wXe8xOwNpeWg?=
 =?iso-8859-1?Q?4dTt4S30yzZuKMYmleNKcmXy7yB1BfnhAoiTCDOLPW1/37FYXd4U/142qz?=
 =?iso-8859-1?Q?uSS1KzVImgUczLHziFbgfYB36owTCvEs4n22X08n6CTpskuKbI05U4t1g0?=
 =?iso-8859-1?Q?WBP8rU/VdGTzrHm2MJciDgR6Cn0hUip0XkJBJ4aVXtn/qCuIAg42F5nUN8?=
 =?iso-8859-1?Q?OnUYj3Ks3vRU1op2TPByBsZnudybNJnQrpadekwbEVzbld1wFkzIJwfAG3?=
 =?iso-8859-1?Q?IIc/g+DSTmz19Zjrr2DIhVeTMCZWKcR01jFmqMtHzDReImwjBs+QJe+tUx?=
 =?iso-8859-1?Q?qklnk7ODVYXe2aKFCO0+QVePV+2t7+XWAlgbqAGCxnsE75sYeWExzrftJD?=
 =?iso-8859-1?Q?EaE4318akB3rXvA+nk8YPrXn+JTpxyKZ0UWwTOxitZEe9qhXvRw1gkyGce?=
 =?iso-8859-1?Q?K6GvWQao8ugbCy1eliq9QuTmVGkxj1njquHPeP1hJYQpXFaxybNjzV4T57?=
 =?iso-8859-1?Q?EEUxlMhVbfQnVHURIMy43yMA2Or05eCYRCAoK1mmDMdMJMU9RGVNhiRdPl?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LXAbmwXgrViZ+L99H7mXwkfb1gysGYEXxJwVDyTUhsNDPOtaUE/NROfDL0?=
 =?iso-8859-1?Q?yx0lsaEa42EzNTmA/DhCTh+eZXAEd9cohuIhusJkaFTumeRVtMokeJV0XD?=
 =?iso-8859-1?Q?He5y6BJkdr2RbnsKaGiJlU7GIPZcPrCKQSl5j81D3VrpxOf0KD4Ea72bvG?=
 =?iso-8859-1?Q?UprX8nBjUFflv9fvFdJyh6zuwX6uGDtzMjHhbEbYAxLyaq7JVKF7FNGJ2i?=
 =?iso-8859-1?Q?YYfd5/0liAfWyg0zKyqH1ZdQu4877XSAvvzpMjtc46WuoA47TPe50vQqMh?=
 =?iso-8859-1?Q?2TWKVS+Nr7i3UlbUhr5L+IDBY3BRUNF/6KgkzjsuvI/E2y2d4NhTn0XlB0?=
 =?iso-8859-1?Q?f7keEqNS0N5nOyy4RR9swil+vEQ7g4rU9fYf5EFPuZP+Hf/snP1iDkixag?=
 =?iso-8859-1?Q?RbkJ9d+CDI601ezj9pboDotJ28ruKTn0n2VGuW6b/L3FMxuxTNKHf907e3?=
 =?iso-8859-1?Q?F1oSgCIq+Y1A3IFfz7NW8pX5ibTub5g06/QVwHbD9GcNAcEto23VCx5xtw?=
 =?iso-8859-1?Q?lLXoq6R/KR10wpzCmFpUiDhos01YOHJSxvHvZcOy4e9HZnhJ3uZk7M8lsU?=
 =?iso-8859-1?Q?oYRa/tELlTLaQ8FtCUJ/8fCADzx8HU4O/IvSOfHfJwGIX3pH88FLqBenyP?=
 =?iso-8859-1?Q?CQXsSDyXB/5CsOAZHYJgahwflj8dY+cJ/PGkJGs7smonVwg4MutjXcsqvv?=
 =?iso-8859-1?Q?T8tkgzcT4LLGH1vhtfyJdegdeLG0PO0YSqvlTgKQWSoWOu3yspMAi0XUFP?=
 =?iso-8859-1?Q?t6HrvxTukvA85Sau3ZY8nNBbe9gpFlOIT/9jSz79/1WM2eoADq84Sw545I?=
 =?iso-8859-1?Q?1ilTsi2SPC0+Glz4hrC9dOULbltyjxeGlL27keVmM0bWV/aXck7Ya6hWFA?=
 =?iso-8859-1?Q?J19ghI+V0mCkWag4VLJGIP+molmzicvIdXlD32G4uGBHcAPJSBnii93teC?=
 =?iso-8859-1?Q?kIelr9eiD7/Kmrzp5/2m3FoGtRcqqs6uXoRorSjRX5YLOEqR7FLUXWhhxb?=
 =?iso-8859-1?Q?c2FMIlFtw7Lw0hKhsJYbikThrpqSoas1aTmajdF19L7gzzaKKhrSMow1T6?=
 =?iso-8859-1?Q?stf4Ay0b+a2SSDo/PyfDOijB/gLnYZ/2O/fjZMv5UopV++f3+LxGYxpLJi?=
 =?iso-8859-1?Q?CXzL3IPt9QfRlKdko1iydc0izZebmHdPQk9TcCffdWPsQE/9EB+mm0vvCK?=
 =?iso-8859-1?Q?hMkbN/Hx1t25FpN2oM5ogp/HqBpi3GUVqf+xnHDBu15tc3j9TqrwoftUuJ?=
 =?iso-8859-1?Q?wY1lQtE8xicrugHBfsSLxa9Rk00WkX1kA1mTX3vFB6l/MO82Bo4c5yKG6i?=
 =?iso-8859-1?Q?zApuf2vSs73lkRGUDvuuyyBXoQfAgGhzTtCcR1hfHjGcwfRdEvKR5VywPl?=
 =?iso-8859-1?Q?p3Z9HuPuxeW52EcdsJF447G+qvJLzeh+IGZLJp2N3Imjznb2eTQO1rcCOj?=
 =?iso-8859-1?Q?2LrHHyEN/U5R/hdarY+Uz6Q2xNfVtnwvV5Eu1ek72v6JtzQgG++edMs9hy?=
 =?iso-8859-1?Q?xV9pB4AH/9mLpsvQeEaei1KSfUGiP/mhkZ2XENMK5z52AN4jr1jRnYyp1x?=
 =?iso-8859-1?Q?mhUeTyTLicvxZiwOM+KCEWpg7AP5sALfanUYA131V21wPu3mfK4h5T/JUL?=
 =?iso-8859-1?Q?E1//obA+fM1V4MCe+ZN/0zGy/gsOOuv6RLXDKuTzpo7oyvdWsLbTy0QQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feb221b-3af9-46c7-f783-08dde4e5d5ab
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:16:34.2497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVO/cF9+E82/cwLNqyVgsCyxMquVywS7u8fmm0xI4Tt8tXMT/SQyUs3eTqGQPLsfKb8ldjoEs2KX32TaHZyURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8030
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

On Fri, Aug 22, 2025 at 11:40:25AM +0200, Thomas Hellström wrote:
> Convert dma-buf migration to XE_PL_TT and dma-buf import to
> support exhaustive eviction, using xe_validation_guard().
> It seems unlikely that the import would result in an -ENOMEM,
> but convert import anyway for completeness.
> 
> The dma-buf map_attachment() functionality unfortunately doesn't
> support passing a drm_exec, which means that foreign devices
> validating a dma-buf that we exported will not, unless they are
> xeKMD devices, participate in the exhaustive eviction scheme.
> 
> v2:
> - Avoid gotos from within xe_validation_guard(). (Matt Brost)
> - Adapt to signature change of xe_validation_guard(). (Matt Brost)
> - Remove an unneded (void)ret. (Matt Brost)
> - Fix up an error path.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 61 ++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 78a827d4e726..3f96101a06f3 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -163,16 +163,26 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	bool reads =  (direction == DMA_BIDIRECTIONAL ||
>  		       direction == DMA_FROM_DEVICE);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	int ret = 0;
>  
>  	if (!reads)
>  		return 0;
>  
>  	/* Can we do interruptible lock here? */
> -	xe_bo_lock(bo, false);
> -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> -	xe_bo_unlock(bo);
> +	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, (struct xe_val_flags) {}, ret) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			break;
> +
> +		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &ret);
> +	}
>  
> +	/* If we failed, cpu-access takes place in current placement. */
>  	return 0;
>  }
>  
> @@ -211,25 +221,36 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  {
>  	struct dma_resv *resv = dma_buf->resv;
>  	struct xe_device *xe = to_xe_device(dev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_gem_object *dummy_obj;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	int ret;
> -
> -	dma_resv_lock(resv, NULL);
> -	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -				    0, /* Will require 1way or 2way for vm_bind */
> -				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
> -	if (IS_ERR(bo)) {
> -		ret = PTR_ERR(bo);
> -		goto error;
> +	int ret = 0;
> +
> +	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> +	if (!dummy_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dummy_obj->resv = resv;
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
> +		ret = drm_exec_lock_obj(&exec, dummy_obj);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			break;
> +
> +		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +					    0, /* Will require 1way or 2way for vm_bind */
> +					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			break;
> +		}
>  	}
> -	dma_resv_unlock(resv);
> -
> -	return &bo->ttm.base;
> +	drm_gem_object_put(dummy_obj);
>  
> -error:
> -	dma_resv_unlock(resv);
> -	return ERR_PTR(ret);
> +	return ret ? ERR_PTR(ret) : &bo->ttm.base;
>  }
>  
>  static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
> -- 
> 2.50.1
> 
