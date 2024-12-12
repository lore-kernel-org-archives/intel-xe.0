Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CCDE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200A210ECA4;
	Thu, 12 Dec 2024 03:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfIwLRpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834C10ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733974546; x=1765510546;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tNe+P65alsOOuo6w2JTmwfB8qPS7CF5ytzClaTjsdPY=;
 b=JfIwLRpbUp/iYWTWhEXHftBFBq1mR2IvbDaeyNgcxcUshhq0eDSITh1R
 kPGZWBtQS1Th1A8tvYDRO9pHQYpuxcCUXO5CrAc1Ll736xmJop24ATPGr
 EkXf2FPYtQV6KC+lPeitNAb6a5FZeVMu6t87AM8Zc59C02sCcp5xE/fk/
 pV/4fEQHfL0eVgkC3y8rmdbw0YS5OmsE6It80tBT+ZXaks2Y7Al7X9zfo
 JgnpbbUFF/kVKSjEH3+dQr/O4fze4zPmrl6REOaSUEj8vcTbRWYpUXvXi
 9tIfJCfAzfZX2A5fyxCZNsU0f5ityLo1I9iUchQ6RpScS7sBpW40G+LuX A==;
X-CSE-ConnectionGUID: 5yFl5TxFQOS3LAXZkqTx2A==
X-CSE-MsgGUID: IyxD2MKhTsWqkDDgCklxDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34620536"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34620536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:35:45 -0800
X-CSE-ConnectionGUID: ta09I08iSNGgrTNLh32hGw==
X-CSE-MsgGUID: PaQGPWczQD6BGQ+3BB/QbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96597676"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:35:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:35:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:35:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:35:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcDjFZ0FF7cY6ecNjZvMIRM6Bs6O/mu0kvQZpmZ/losJliSYzGp5PQLBovXrrcCzJSVjJ/2axXN0IPw0YJxnaxdEL0IiKYuvUvzhiDQUkbXl+cKw/hHKZGsHn10WFAdD6P/JImdAEulS0vfHEqyTANwokkEMT22b7n4ZQBp8uROKwRlIBtrHVpwqstxx3DF1Di28Wd7vGjKVVRL+nB33fyJA0BqMKBd4SAlJDAWq29wFcvKd0HaEXMBkVFSxYTJJXVIiohnBQ2OEq/8O6bvsXmvWyQgQxVtDrYVQUG3srvnV6/oBK+CpTuXnpYv04DBfquHL7y3CLA/EF2aCfVo8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zH3icbkTLeXmk733bnoWP8u7K8RMod3zPl0EHXMjiM=;
 b=pLE88BIRRLRpOVG21kaUf42zSVyoQoxIFD1M1Y1UoGwrqdJ0mlOoGlmoZc7V704zgIKnI4GcARx5aWSLqVDWa0EqmVPrbK9H4cKOHaS9MaR6uXmmm/l/RO+RxFSFAVudmAvna93tv/wn1IBBZwRfUWDGalVOaXjmLAHn1FA4gd8NSoAvdndAktC8R2izp331SqsbTn3Xfg7B6xp1Suo1sXmFstOMLF6bNMWZ9tNiNmVs/VN688K4ObTuNO+C+O3kIxLBhd011Gk2G7olo6FQ0l87zMAwGfdftkXQ4l7dTxcpHxz/TyEi7e5xuoMBf9r1Wi70bOFr6GZIxHk3BLmBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 12 Dec
 2024 03:35:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:35:42 +0000
Date: Wed, 11 Dec 2024 19:36:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/13] drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
Message-ID: <Z1paN30DT2nu4glj@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212010141.389-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b90166c-08ef-48a3-16bc-08dd1a5e0de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OuxjNJ+sC0i4VnnY/ZTOhKSdBzBVqqG7IFhFZOTJdU5ewBFS86BpKzpQSt?=
 =?iso-8859-1?Q?FBJozqap0IFXz9buMpINeOxHCFp2+p9RaCCpbyrfB645eBBn9OBfrNOYkw?=
 =?iso-8859-1?Q?49pbDQVCDX1m/BTQ4GOR7VTdVeCZTdHnbFx34wucQTRlv0IzLNuRkAGdLA?=
 =?iso-8859-1?Q?0rxTF8dsBTcJrUteENnp8VW5+qCM4MG7BU5bAZjh7x1mpKEsKPz2bqtCPM?=
 =?iso-8859-1?Q?omBCoOiVzu4ITN147W0E6am8EEpYtTUOxO0FekV7ekN/MzMC6BDYCUJiEb?=
 =?iso-8859-1?Q?3g+azxolvKgNQS3V1D3mh0btF4VEjkr01fOaO4SW+HnH8x6u/Ww2bhVbt+?=
 =?iso-8859-1?Q?pLPNmBemBKc0ngpZZiDCZ3cgYGRZHLo8jw3vIXCyjy2IBwHlfF6mSIvNB3?=
 =?iso-8859-1?Q?CuQygwZKobYFhnBj823fjr2s+cGOKFHIG+yYbrbRzZJrOqSwPTHTZ/rCTC?=
 =?iso-8859-1?Q?Mz/wEZQnp/z7hmD/tMu4sgOcdLmC6sXhPJxqxwXeH/pe7rZDWUdJJXcLn+?=
 =?iso-8859-1?Q?Q4BCppGOuQUZgjhJ9UunK23uEIFeHDZo5imVxeD1g5LPviYDmTaBeh5VWm?=
 =?iso-8859-1?Q?bBX3caxiM6idLPG9v9CLI4M/tfQvJPptgxvrBn9qou3YkmGrOLGZH0+iPG?=
 =?iso-8859-1?Q?wXGAD9+jD5ny9A3QGSIfUSilupelivDVBvIjV889AjD8E/0ZKqRYMHBK/y?=
 =?iso-8859-1?Q?/9aA/chOl/FHbyCwdn46KdWUTLYJZGZO3ot3aw4vo60xC+QJLvdK1luyWJ?=
 =?iso-8859-1?Q?9wOUhFJ7wI6XVUCpwqt5FlW/HL6PqlWxVvJ8AZKVUOW64v92gwW2DiJ86U?=
 =?iso-8859-1?Q?f58LDAv+h5Pd+HsQTC9DUox1FhD9mJlZxx9VF0XXCJ/9rJsCWi8lonS42I?=
 =?iso-8859-1?Q?aTTvgSCz0GRu3xDmZAvUgCr+d3/wvHhIeNYHtac5N9RN0nLD7F35RfOTGA?=
 =?iso-8859-1?Q?9d2GlOfC1OuqzgPvKo3ihwrdWcA5NULgz3M/YR6TXFbUdaPwbzzx6XNRzB?=
 =?iso-8859-1?Q?btah1mdFnJnxzHyVG5B/h4n0QqwCDMXQ4iycfc/XjcT1nljZ5vjNENtjry?=
 =?iso-8859-1?Q?lwCQCu3X8Ogy2Fa/Au2mkAuxd6oVDY8fB1YuvoFeZv58KDiCNx8F+4Hai9?=
 =?iso-8859-1?Q?zuMN0qJD54hNYqACssrU1OdBjVgTpqWfLWJQsHv3ZMG5ISgq+Z7m9j5BjX?=
 =?iso-8859-1?Q?orbGZMcDaBv6HPift76jo/wQr51Ae+GHDoJcEtjFyi1hhK6hzFPm7P6yKa?=
 =?iso-8859-1?Q?sKWES3kq9lUrK4uOSEOYUUlq4yuDe9lv2ZmuAoyeoOqK4hT00CwMPIfRyF?=
 =?iso-8859-1?Q?3D2z4VGkIkz/oLhP6198aNQfvAugHTxUh6jIB50StbJ949b6OAGPm1K+ot?=
 =?iso-8859-1?Q?Yvb+vw43ZLIVCWHxICS0TZfXuFt3Exug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EP9+YOLKH8l7kUXtX1QXl6vZxyAT0KYzBDN2CaCm5Yj7ufJT+rtNvLebF8?=
 =?iso-8859-1?Q?FNaX7raT9ADbrGLeMaGWTUCNqHsmnuuZ+uBUpa3UFiJh/lmFYT3qs+Qtxd?=
 =?iso-8859-1?Q?Br7YKkN4n2ULEHWABLi4p18OzBtN1JSM7CmnMx55DF4vSzi+g/hYefaYWm?=
 =?iso-8859-1?Q?3JcK13uv0jAHmRk4tDmVJYIoRr5tIBUHKB4w718K8W8RyYly3cem5oLgqI?=
 =?iso-8859-1?Q?T2zDM1nd5fe3OMsmZl8hHkk7rSq41uMqdDrUM8WNoeXpucL9rE9eDa+SFO?=
 =?iso-8859-1?Q?ShYJGFIja0Ak9mJBqOj0VbDkFV1z0QIHrcEnzNEsTvkgBqLrIFLZ8pUcnD?=
 =?iso-8859-1?Q?akh+7upV5E+x9SAxTN+z7VNy3VR+bb5h/StxFrcm9GpBHNjFPzC1HfIaLV?=
 =?iso-8859-1?Q?0/sA7OxQKpMs65tvQpvOqJ0v9za2KzJMX7Rk+vtWq7OVL09/drDCLsDQ+l?=
 =?iso-8859-1?Q?pHw76JR91objhCaRgBuTRjHlFtnXHjCgUgdPmZa/xou06yZSE0V29Dk1vQ?=
 =?iso-8859-1?Q?coB2DZfLzlxq3iB5+TG1s3XtMZx0R79PQ7mwgAuZQjs92jPrNbhWU74Mu6?=
 =?iso-8859-1?Q?N+MfPdPcjy6B10S/DCuHyjsaJmEqoysAtd+gSl+m8bsPS2hyIRV8qRqG5u?=
 =?iso-8859-1?Q?J81i0wd7btt9t4OsSwrCdiWPldgVv2sMPpSRQEnQMpnSPj4/UJIkQmSNTJ?=
 =?iso-8859-1?Q?A9CRBLZRKJGyf136rGaEQ7m1efygccAVz6o8x0WXwmvId+vhLgYD6Np2me?=
 =?iso-8859-1?Q?YnygYs5+FixtXra7yvXM51GEkvE3I8kZScTAYce6xL8n1nWtpXe71zchbM?=
 =?iso-8859-1?Q?jbyzDwlTjDVH6bdy/9Z26f991nGx+e+W+I/zfo1YZI8OGLhCTYBz0GIGk+?=
 =?iso-8859-1?Q?H4ik4O05hPibeEtKxpDGJhGvPissVBHZxi+1ArNjjG/BnAanZ2LBZqAHQc?=
 =?iso-8859-1?Q?Px8KQSrqC6zOCIXMZjH/KuPig0k4AEYuY1jMfAWRaVw5F0o23qATghY9rc?=
 =?iso-8859-1?Q?Xmz9q+4rVpJ+t302gNzObzsxi6DURwPO7s0J6kvmoRMfrT6KfGE9NnfLNa?=
 =?iso-8859-1?Q?7tt09UAJ7+2Bu6DnAhuMumFJ76nGDch7zs5sf0AcrZQ3y6+8dkzihVlIc4?=
 =?iso-8859-1?Q?MxEXoQKo0LO62dgZYPGRdAb1nd/RJV1fspoC65Ungrbv5p3hinI1FP3hEm?=
 =?iso-8859-1?Q?jYuccSdEAmpxZXmD89SDg/GuVeYCYrJNeDBHuPKSUozek4X8K/1CbeUhUg?=
 =?iso-8859-1?Q?cQJPI++jTA1YMRE/GNcPOE9Ezqt5++1y7dgy+L3//E1HvsTXCpwyfaGo75?=
 =?iso-8859-1?Q?t/dPaca6ML+5B+pxk9p4M3iI5SKYKJN8zE7PPzuPPlgTJrHUZKUvw3FUuU?=
 =?iso-8859-1?Q?yCUgcmh1YrVlObL3Y6ZKSBykuQwwkOcOIfuN7f/CaiqUva2d2FpGiGd6La?=
 =?iso-8859-1?Q?3XdfWYYRKD/oXOIo3oDEVffA1Fb70DdHEyVSy4G8fSGcpCvWmLGGFempfG?=
 =?iso-8859-1?Q?c6sFvjrdoZLBzxpzPma2pqnaDnc9fBp8U/WbfQ1/uxk7NJ26XyEM+EprOO?=
 =?iso-8859-1?Q?YvmNye8ELV1lGefE8sMsqfwh4a+Ev5mDDoCGqbEmVwxNSjso44JO0TbDnd?=
 =?iso-8859-1?Q?j0P/HRcKPdnZS6EOSCd6Mw1sYtPkXtx1ktpvyScDVY2wQyXfwE5J7kiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b90166c-08ef-48a3-16bc-08dd1a5e0de4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:35:42.0477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayccqUpRAbIlPBN9C28H+pWiJ+QrMg+T/qwVvziA6qp9V8poqcTHbKvbz45z2QQlw9xuvRKyZzWS0SUYeKupVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

On Thu, Dec 12, 2024 at 02:01:41AM +0100, Michal Wajdeczko wrote:
> Add tests to make sure that recently added GuC Buffer Cache
> component is working as expected.
> 

My opinion is this selftest is a bit overkill, maybe other disagree, but
I'd drop this as it quite a bit of code to carry for little ROI (i.e. if
drm_suballoc is broken, the entire DRM subsystem is likely broken).

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: rebased (Michal)
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 335 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_buf.c             |   4 +
>  2 files changed, 339 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> new file mode 100644
> index 000000000000..8a90f832915b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "xe_device.h"
> +#include "xe_ggtt.h"
> +#include "xe_guc_ct.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define DUT_GGTT_START		SZ_1M
> +#define DUT_GGTT_SIZE		SZ_2M
> +#define DUT_DATA		1
> +
> +static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *xe,
> +							      struct xe_tile *tile,
> +							      size_t size, u32 flags)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_bo *bo;
> +	void *buf;
> +
> +	bo = drmm_kzalloc(&xe->drm, sizeof(*bo), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo);
> +
> +	buf = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +
> +	bo->tile = tile;
> +	bo->ttm.bdev = &xe->ttm;
> +	bo->size = size;
> +	iosys_map_set_vaddr(&bo->vmap, buf);
> +
> +	if (flags & XE_BO_FLAG_GGTT) {
> +		struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
> +
> +		KUNIT_ASSERT_EQ(test, 0,
> +				drm_mm_insert_node_in_range(&ggtt->mm,
> +							    &bo->ggtt_node[tile->id]->base,
> +							    bo->size, SZ_4K,
> +							    0, 0, U64_MAX, 0));
> +	}
> +
> +	return bo;
> +}
> +
> +static int guc_buf_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_ggtt *ggtt;
> +	struct xe_guc *guc;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
> +	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
> +
> +	drm_mm_init(&ggtt->mm, DUT_GGTT_START, DUT_GGTT_SIZE);
> +	mutex_init(&ggtt->lock);
> +
> +	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
> +				   replacement_xe_managed_bo_create_pin_map);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_guc_buf_cache_init(&guc->buf));
> +
> +	test->priv = &guc->buf;
> +	return 0;
> +}
> +
> +static void test_smallest(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, 1);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_largest(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +	KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_granular(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf *bufs;
> +	int n, dwords;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, bufs);
> +
> +	for (n = 0; n < dwords; n++)
> +		bufs[n] = xe_guc_buf_reserve(cache, 1);
> +
> +	for (n = 0; n < dwords; n++)
> +		KUNIT_EXPECT_TRUE_MSG(test, xe_guc_buf_is_valid(bufs[n]), "n=%d", n);
> +
> +	for (n = 0; n < dwords; n++)
> +		xe_guc_buf_release(bufs[n]);
> +}
> +
> +static void test_unique(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf *bufs;
> +	int n, m, dwords;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	bufs = kunit_kcalloc(test, dwords, sizeof(*bufs), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_NULL(test, bufs);
> +
> +	for (n = 0; n < dwords; n++)
> +		bufs[n] = xe_guc_buf_reserve(cache, 1);
> +
> +	for (n = 0; n < dwords; n++) {
> +		for (m = n + 1; m < dwords; m++) {
> +			KUNIT_EXPECT_PTR_NE_MSG(test, xe_guc_buf_cpu_ptr(bufs[n]),
> +						xe_guc_buf_cpu_ptr(bufs[m]), "n=%d, m=%d", n, m);
> +			KUNIT_ASSERT_NE_MSG(test, xe_guc_buf_gpu_addr(bufs[n]),
> +					    xe_guc_buf_gpu_addr(bufs[m]), "n=%d, m=%d", n, m);
> +		}
> +	}
> +
> +	for (n = 0; n < dwords; n++)
> +		xe_guc_buf_release(bufs[n]);
> +}
> +
> +static void test_overlap(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf b1, b2;
> +	u32 dwords = xe_guc_buf_cache_dwords(cache) / 2;
> +	u32 bytes = dwords * sizeof(u32);
> +	void *p1, *p2;
> +	u64 a1, a2;
> +
> +	b1 = xe_guc_buf_reserve(cache, dwords);
> +	b2 = xe_guc_buf_reserve(cache, dwords);
> +
> +	p1 = xe_guc_buf_cpu_ptr(b1);
> +	p2 = xe_guc_buf_cpu_ptr(b2);
> +
> +	a1 = xe_guc_buf_gpu_addr(b1);
> +	a2 = xe_guc_buf_gpu_addr(b2);
> +
> +	KUNIT_EXPECT_PTR_NE(test, p1, p2);
> +	if (p1 < p2)
> +		KUNIT_EXPECT_LT(test, (uintptr_t)(p1 + bytes - 1), (uintptr_t)p2);
> +	else
> +		KUNIT_EXPECT_LT(test, (uintptr_t)(p2 + bytes - 1), (uintptr_t)p1);
> +
> +	KUNIT_EXPECT_NE(test, a1, a2);
> +	if (a1 < a2)
> +		KUNIT_EXPECT_LT(test, a1 + bytes - 1, a2);
> +	else
> +		KUNIT_EXPECT_LT(test, a2 + bytes - 1, a1);
> +
> +	xe_guc_buf_release(b1);
> +	xe_guc_buf_release(b2);
> +}
> +
> +static void test_reusable(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf b1, b2;
> +	void *p1;
> +	u64 a1;
> +
> +	b1 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(b1));
> +	KUNIT_EXPECT_NOT_NULL(test, p1 = xe_guc_buf_cpu_ptr(b1));
> +	KUNIT_EXPECT_NE(test, 0, a1 = xe_guc_buf_gpu_addr(b1));
> +	xe_guc_buf_release(b1);
> +
> +	b2 = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache));
> +	KUNIT_EXPECT_PTR_EQ(test, p1, xe_guc_buf_cpu_ptr(b2));
> +	KUNIT_EXPECT_EQ(test, a1, xe_guc_buf_gpu_addr(b2));
> +	xe_guc_buf_release(b2);
> +}
> +
> +static void test_too_big(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +
> +	buf = xe_guc_buf_reserve(cache, xe_guc_buf_cache_dwords(cache) + 1);
> +	KUNIT_EXPECT_FALSE(test, xe_guc_buf_is_valid(buf));
> +	xe_guc_buf_release(buf); /* shouldn't crash */
> +}
> +
> +static void test_flush(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	const u32 dwords = xe_guc_buf_cache_dwords(cache);
> +	const u32 bytes = dwords * sizeof(u32);
> +	u32 *s, *p, *d;
> +	int n;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, s = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
> +	KUNIT_ASSERT_NOT_NULL(test, d = kunit_kcalloc(test, dwords, sizeof(u32), GFP_KERNEL));
> +
> +	for (n = 0; n < dwords; n++)
> +		s[n] = n;
> +
> +	buf = xe_guc_buf_reserve(cache, dwords);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_PTR_NE(test, p, s);
> +	KUNIT_EXPECT_PTR_NE(test, p, d);
> +
> +	memcpy(p, s, bytes);
> +	KUNIT_EXPECT_NE(test, 0, xe_guc_buf_flush(buf));
> +
> +	iosys_map_memcpy_from(d, &cache->sam->bo->vmap, 0, bytes);
> +	KUNIT_EXPECT_MEMEQ(test, s, d, bytes);
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_lookup(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	u32 dwords;
> +	u64 addr;
> +	u32 *p;
> +	int n;
> +
> +	dwords = xe_guc_buf_cache_dwords(cache);
> +	buf = xe_guc_buf_reserve(cache, dwords);
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_ASSERT_NE(test, 0, addr = xe_guc_buf_gpu_addr(buf));
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p - 1, sizeof(u32)));
> +	KUNIT_EXPECT_EQ(test, 0, xe_guc_cache_gpu_addr_from_ptr(cache, p + dwords, sizeof(u32)));
> +
> +	for (n = 0; n < dwords; n++)
> +		KUNIT_EXPECT_EQ_MSG(test, xe_guc_cache_gpu_addr_from_ptr(cache, p + n, sizeof(u32)),
> +				    addr + n * sizeof(u32), "n=%d", n);
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_data(struct kunit *test)
> +{
> +	static const u32 data[] = { 1, 2, 3, 4, 5, 6 };
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	struct xe_guc_buf buf;
> +	void *p;
> +
> +	buf = xe_guc_buf_from_data(cache, data, sizeof(data));
> +	KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +	KUNIT_ASSERT_NOT_NULL(test, p = xe_guc_buf_cpu_ptr(buf));
> +	KUNIT_EXPECT_MEMEQ(test, p, data, sizeof(data));
> +
> +	xe_guc_buf_release(buf);
> +}
> +
> +static void test_class(struct kunit *test)
> +{
> +	struct xe_guc_buf_cache *cache = test->priv;
> +	u32 dwords = xe_guc_buf_cache_dwords(cache);
> +
> +	{
> +		CLASS(xe_guc_buf, buf)(cache, dwords);
> +		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	}
> +
> +	{
> +		CLASS(xe_guc_buf, buf)(cache, dwords);
> +		KUNIT_ASSERT_TRUE(test, xe_guc_buf_is_valid(buf));
> +		KUNIT_EXPECT_NOT_NULL(test, xe_guc_buf_cpu_ptr(buf));
> +		KUNIT_EXPECT_NE(test, 0, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_LE(test, DUT_GGTT_START, xe_guc_buf_gpu_addr(buf));
> +		KUNIT_EXPECT_GT(test, DUT_GGTT_START + DUT_GGTT_SIZE, xe_guc_buf_gpu_addr(buf));
> +	}
> +}
> +
> +static struct kunit_case guc_buf_test_cases[] = {
> +	KUNIT_CASE(test_smallest),
> +	KUNIT_CASE(test_largest),
> +	KUNIT_CASE(test_granular),
> +	KUNIT_CASE(test_unique),
> +	KUNIT_CASE(test_overlap),
> +	KUNIT_CASE(test_reusable),
> +	KUNIT_CASE(test_too_big),
> +	KUNIT_CASE(test_flush),
> +	KUNIT_CASE(test_lookup),
> +	KUNIT_CASE(test_data),
> +	KUNIT_CASE(test_class),
> +	{}
> +};
> +
> +static struct kunit_suite guc_buf_suite = {
> +	.name = "guc_buf",
> +	.test_cases = guc_buf_test_cases,
> +	.init = guc_buf_test_init,
> +};
> +
> +kunit_test_suites(&guc_buf_suite);
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 261c7c74417f..ce6d9830e13b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -170,3 +170,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
>  
>  	return cache->sam->gpu_addr + offset;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_guc_buf_kunit.c"
> +#endif
> -- 
> 2.47.1
> 
