Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB4DCA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B43710E155;
	Fri, 22 Aug 2025 19:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVTm14b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52FF10E155
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755890016; x=1787426016;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mZAoTqyMGhvYorfPU610FN4J3QKcx0vroQ6l4pmXOeg=;
 b=KVTm14b5CbNOznYQQ29kZ12SFaBkXXQ3QTwgTDKyJ3Vz1nRx1SNwccTh
 1XsMXXNcdEFPMoyLMiRsnWAGJtPB8FCBNhF2eUsu6bm/i3drVS4KwooKf
 gdEJQVk2UqmQ0kSFev1KwdEdst5byGWVbFOThFuyFBXcIMMSR9P6Aj1UW
 Ehmpj0AM7kdV9dQkFPw3nyDCiLZUxHmFpNbcfp1hTcOyAhYhtm0biuSsL
 x2ZxjB2GtwxJjEjZ/qdqhwrIbz/u12GTBabddvcrnwatclH/V/hVZZSdh
 acNU0PiY311Cq6foi0VZM4S/rVYUFT/XEC1JklCPzMh/cRDPLzHhc7Dqj Q==;
X-CSE-ConnectionGUID: BMv6vpGfS0W5SuBERSnwAg==
X-CSE-MsgGUID: yd3aHdfKQ2Ct2QOXiS7HGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58126521"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58126521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:13:35 -0700
X-CSE-ConnectionGUID: 1idXPgVnSpmn/xlrOdyxSg==
X-CSE-MsgGUID: NSaR53r7TTmtdytH8iCj6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169139790"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:13:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:13:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 12:13:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw0CE57/s2L43lo4eyIzA/1Md4n9lDDW4q0Ah7K1Fbd3xDCaUwgDJUD5Ay1RpgfV4DRJuh5MAJbDXzj1VkuTW5K+A8AWteWp2jJIuPGgm5iS0VB7WLFzhE9VVR5sdk2auXmS7r2JqJ0rSGwM42BBwyJ1ggmgjbciKdgr8fN66/iAF9rGbntfQKUGGAV4MR8A/irpDvI+AU/CKAlmFmSYdDUuwSIw7wYnX6zR5ToD/9qf8XZhAmBe/R6aA5n7m6FoXDpzzgs0R4RaJVJEvP4yNQFHlq6jmkF1JOpRiMDjrVASZ9W2L+urdIUyZ29rumTYndwSX4e3J1RKOCnCHSEZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyak0tTWyBe+NB/3enn0FIEQBUhG4lC878fog0KXx6Y=;
 b=sQ/UkEDRccqpFDUd8pZyZxX1FjK1xphE+nZhCJFkDQ60VHM9nDes0gRVCPjleIBq685il5Xf0TGyKqfZSFVZ15ophjBLGzGSjzzz+AYP2xYbxB2Hby5smYVUtVctUAGaWuofhD++ZwujrMbX7saKpScoRBz1VwMoGXdU3G4+ih4VN03G0Gn1bOHQUdbolVE9dPj7rygMHZMDeuwa/eLvuvvB5fQ9TgmzbM5EgyqvkDgck8jCvEQeSsMJE4cSTImGjeJrQl2lZ7CV8jj+OhY3q3tG6oCAG+sm9j94s9CiTMR5D66SpgI0ZyLSkE6bMXWAT6j8QJ8liTRZPoKe1X4m7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8939.namprd11.prod.outlook.com (2603:10b6:208:580::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 19:13:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 19:13:30 +0000
Date: Fri, 22 Aug 2025 12:13:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 07/16] drm/xe: Convert SVM validation for exhaustive
 eviction
Message-ID: <aKjBV6wh98/d6O+T@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0b823f-e251-4905-a079-08dde1affab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T7WVhNalhUiUfh6Jx4P1P8M5hHi4PjQXxdEM4XYqybQBL4Ro08RLYD0MzZ?=
 =?iso-8859-1?Q?2rpoAikuOU14yUhY9QhvkmpFAH3Dv1b+Jcoiv3/nkXdKmLBIlV5uZ24JyZ?=
 =?iso-8859-1?Q?4DPbu82UyiZsKLNvGTCQAlY/85ntbRWK9wWjgRbFSfGnaF8Bz3sRgXlgfT?=
 =?iso-8859-1?Q?kL/EJaMgTDLBrN8UaUfE9CZhNMH+XTFbIYBjzvd1eyFMKZaAGNOtz3oFH9?=
 =?iso-8859-1?Q?dsRe/r8MK01L2tMskAgWDrkQleSPcFz2G4n6u4WKqtE5SpOz6UiVJ+0bw6?=
 =?iso-8859-1?Q?lwk2Idv0m0xG6FkFuEC0tn1uWyjb5Ha+MC1jWuUrWe/YCENp3RHdqqd2t8?=
 =?iso-8859-1?Q?0B9pRNZAuUNh4oipH9y2yLhGBhqKySAhDTVV1FxvdOAe9IMdUP5zqdeyd1?=
 =?iso-8859-1?Q?Vxp2Ctyk/5eZ42HJnBtc04NJshAdfRgutC1hDSKUNIZCMSySiunDnp0wVr?=
 =?iso-8859-1?Q?p0GwQ82XLS0anxNcsKPRywZGfeayi+RwXKuMSyNZ76TYXA+l9yagNnzSsi?=
 =?iso-8859-1?Q?YSxVT1GWtg979dkeTfB/6WmJ+vdkvz+eOWcPJT+oXolQ9FC5h5ulpTdjj2?=
 =?iso-8859-1?Q?M1t21jZoal0GjfrIjxFVrNRXsRma9j+3qgmdw44tAzUjGuUWmJ32nVZSS6?=
 =?iso-8859-1?Q?NGBXUiO68IZxp7mkSWTZa4U3PgC41YlBr4MOWmZzLo8fnxczSQ0ODT6J4P?=
 =?iso-8859-1?Q?RR+R+auRdxFyaWQL3ACPjZZCziHrLNTcU8rFKJg6dO1yiYiu+jH6oQT+rR?=
 =?iso-8859-1?Q?8cCASSRs0nHeBbwletaTjVEYZWDHEwy4q6E1rFAOAj/T0jOMsqdhgAg5ZT?=
 =?iso-8859-1?Q?taF7+tiFU9ZYSR8bhV8WBPMaGpSQw8Gsc+cdJYip2hzYIqzs8sorKlLbRY?=
 =?iso-8859-1?Q?6QW9QlyCFIHHYLTtZWrJXpzm857gC4y0Wysp4JC0xwe3hgg0GwA3kSdlw3?=
 =?iso-8859-1?Q?rfBaeq8GFcjXprPX/nDQ8bD5A7xZ1atup9gTt0sGb5MxwKdU9N5ECATFPR?=
 =?iso-8859-1?Q?T05nOBpDXcFQCZ9sL5/4uXXLcCWvUJt8cyMe7e5hgcw1euyNIaLJ5WMD6E?=
 =?iso-8859-1?Q?aPGP644mT1v5EGSJepBFb+RUYx9IQg5OIE5/V3JTgqOAXrhEDdY3EUJEIu?=
 =?iso-8859-1?Q?0R2vN0EHpiY/HM3UvL3VZJPJjiHqMFmTR1ul44DewksYF5V0vuws71Z9fn?=
 =?iso-8859-1?Q?tLjXNN3+iE9Nxfe/Onj9S255trxh5Gyfv13oqcYyQzQsbfgxzeDU2KIF02?=
 =?iso-8859-1?Q?Q183z41zXNbBgQujDzzVSdWtmxuSWMtAL9ANMU5HGuR6YONxe9VsLPPtSx?=
 =?iso-8859-1?Q?7hJvu4EJ9nbdLWpdlxF12YSbMwS7rF/P/GTkeimob6X5HlYsbW+nLK8tAe?=
 =?iso-8859-1?Q?qSnhV9dPnGQ+6Y+Ev8SDfKd90TlBm1xOS9Skup25gAf2CqcMEU11ay3ZDJ?=
 =?iso-8859-1?Q?37k4tGZTXiBB0zVFolzJRu2WJM0Wn24Ed1XwB+o0GFXUoGL0gi4WHWwoyM?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cF1SMSHZ10GiOf2xdjefKBF4ZsswwNaSaPWlC2j7XRl3L8/xi9ZwO6XauW?=
 =?iso-8859-1?Q?FYCgop6weFjfAy5dpuT5D0H6izKtTmWxpFrSMo+CZOaB3MWjpYAPFrAsva?=
 =?iso-8859-1?Q?4jM/MlFIe9bqQecGBunydAGvihBlWaRO8Uq3GhMePqJwvVxmleb2qxOGxW?=
 =?iso-8859-1?Q?D0qhSc3DDRtajBKEzPvjBPXUTVyYvsBvdC0sCunOcH0lkC3lkgVi+g2f/l?=
 =?iso-8859-1?Q?JDvYVre+QQGZsk718bVEsUjG7eAAN4mcuBpsjdE1eELz5t1UItLeGiQvcG?=
 =?iso-8859-1?Q?JnoyRhH/ETYU1+WhiciuQ+hgf5NDtRGZAa2H1/Ku4hPJeDNpvfhrU4qXcP?=
 =?iso-8859-1?Q?okVEGRVTf2Gdr3dg+sT9A1JS9Crp7X0XjVRonmn5JK9yi1cHzCW3/UHVIX?=
 =?iso-8859-1?Q?i8sTbVpBJVsTmwFhOUJFPMgqFwHdfPFbW8qANLUBnPG9SUyGUSodC4+g8C?=
 =?iso-8859-1?Q?mJDdvTQxhxLwEsbujo82oTH4HKwUo0w6Yc7isny2qdM7001yi3hEP75eJp?=
 =?iso-8859-1?Q?0YS/dOI2XOCrnKyEb/L2J10MsO0LzsnRYkemB9XVZmFxAojp6ztWUjQ4+Y?=
 =?iso-8859-1?Q?vfcd+vimnK5G7wPgAwSqHPyznOzNK0dRBpsjaSWHkAdT++fey9aM9Lcwab?=
 =?iso-8859-1?Q?H4CGtRPtFPov56xVcTcUDzFYTTs1Oq7SPmEFy5Dc/PFk3HGHF2qHpsYV1g?=
 =?iso-8859-1?Q?CGO2RRAln4nUZtWz2MAGZ0WZrNVf4mnLy0Y61428RULZVeEJThTgAn4AJV?=
 =?iso-8859-1?Q?5++pT28fCOmpIitxQU+VbCOMuWXF8IT84s77WCdq2XBNkPwBNsq/bFrpoV?=
 =?iso-8859-1?Q?6K6GN/QrcD6W9w6wDJZfIGwOL1huI4uP5HIdymKaQslr1ckyT+67ScxZip?=
 =?iso-8859-1?Q?nUgsYTqwKdYKxVyzP963K8/SHWT0QRZJ0TnVdjgnEE7fDsziE+byDNG9RT?=
 =?iso-8859-1?Q?Cdbw73VeAf1lYLT0u+urbI0q9ApDT0OuwJU24jg1EzFHFP5iGYgl27PfB3?=
 =?iso-8859-1?Q?0ut5ftT7P16P0Klprx3zS9qThAzzpvdb1qcOJZNUzRM1sjy8+dUKSELcA5?=
 =?iso-8859-1?Q?ztkmDQSyIyDeijv2oMSkns6ZkC5Sel7QsvHeD0L12/nRD1HPNRPotmHLL5?=
 =?iso-8859-1?Q?ojXAy47nTXkLNcOgIzOC1s+hwTcDbXpgEiyp4L1QDZc/ak8KjBQMH4agUH?=
 =?iso-8859-1?Q?3xSyoLH57Wm9LlnKinINuxwuUe+UBySlhpcVjFe2pEyWwH0CERHg7j8Pf/?=
 =?iso-8859-1?Q?IETq5QbT46m1jUISlU6K0Y1E1V2oEtBCyqcRILmDFP/J4tESitq7pKWnZW?=
 =?iso-8859-1?Q?dsgedBexfRw+gtoZUMWSDzNLJkasZ0Orp5HDWBUegxOfAKVExW3bzZplh5?=
 =?iso-8859-1?Q?D0qfzgGWGAQS1M4P6h/tlk/GdP/DQPXheLP1vFwJMgdcOg1/UgNSFnYHva?=
 =?iso-8859-1?Q?JJxP/B6e/Ne32OAAuvPHyc9x5Q4mJxjfaMhAV7SNQrwIDHtbRnZjobiZ3Q?=
 =?iso-8859-1?Q?oEqAqbd9WBmVtwGf54qWFS7ArXhrFSxUHvrACJZognsDHnGPv6fYX3S0pe?=
 =?iso-8859-1?Q?RZ6ZDg/pXdRCTaf9yIFzGFJ4lwKwCc2Y2onw4+jrK6/ct2WjFODcWT7Sd7?=
 =?iso-8859-1?Q?E5bEb5H3YNB/ZMprlQmgSM7t4Ozp3eZxbwLqW3+a2/mu2KkwdhX0ujhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0b823f-e251-4905-a079-08dde1affab8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:13:30.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/t62cNLWktiDdjdTYC3udy3zFGHJie3IGGcTX9k+Yv01hZ8HMmT5mNizeMmcmM5p1bRaLfd+AuZuTmpNbuPPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8939
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

On Fri, Aug 22, 2025 at 11:40:21AM +0200, Thomas Hellström wrote:
> Convert SVM validation to support exhaustive eviction,
> using xe_validation_guard().
> 
> v2:
> - Wrap also xe_vm_range_rebind (Matt Brost)
> - Adapt to argument changes of xe_validation_guard().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 99 +++++++++++++++++++------------------
>  1 file changed, 51 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 39e3aa6df25a..667ca1f7cc29 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -699,51 +699,48 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> +	struct xe_validation_ctx vctx;
>  	struct list_head *blocks;
> -	struct drm_exec *exec;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	ktime_t time_end = 0;
> -	int err, idx;
> +	int err = 0, idx;
>  
>  	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;
>  
>  	xe_pm_runtime_get(xe);
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> -
> - retry:
> -	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
> -				 ttm_bo_type_device,
> -				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> -				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &time_end))
> -			goto retry;
> -		goto out_pm_put;
> -	}
>  
> -	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> -				&dpagemap_devmem_ops, dpagemap, end - start);
> -
> -	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> -	list_for_each_entry(block, blocks, link)
> -		block->private = vr;
> +	xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
> +		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
> +					 ttm_bo_type_device,
> +					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> +					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&vctx, &err);
> +			break;
> +		}
>  
> -	xe_bo_get(bo);
> +		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> +					&dpagemap_devmem_ops, dpagemap, end - start);
>  
> -	/* Ensure the device has a pm ref while there are device pages active. */
> -	xe_pm_runtime_get_noresume(xe);
> -	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> -					    start, end, timeslice_ms,
> -					    xe_svm_devm_owner(xe));
> -	if (err)
> -		xe_svm_devmem_release(&bo->devmem_allocation);
> +		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +		list_for_each_entry(block, blocks, link)
> +			block->private = vr;
>  
> -	xe_bo_unlock(bo);
> -	xe_bo_put(bo);
> +		xe_bo_get(bo);
>  
> -out_pm_put:
> +		/* Ensure the device has a pm ref while there are device pages active. */
> +		xe_pm_runtime_get_noresume(xe);
> +		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> +						    start, end, timeslice_ms,
> +						    xe_svm_devm_owner(xe));
> +		if (err)
> +			xe_svm_devmem_release(&bo->devmem_allocation);
> +		xe_bo_unlock(bo);
> +		xe_bo_put(bo);
> +	}
>  	xe_pm_runtime_put(xe);
>  	drm_dev_exit(idx);
>  
> @@ -820,11 +817,12 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
> +	struct xe_validation_ctx vctx;
> +	struct drm_exec exec;
>  	struct xe_svm_range *range;
>  	struct dma_fence *fence;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> -	ktime_t end = 0;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -894,27 +892,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT - BIND");
>  
> -retry_bind:
> -	xe_vm_lock(vm, false);
> -	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> -	if (IS_ERR(fence)) {
> -		xe_vm_unlock(vm);
> -		err = PTR_ERR(fence);
> -		if (err == -EAGAIN) {
> -			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> -			range_debug(range, "PAGE FAULT - RETRY BIND");
> -			goto retry;
> +	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {}, err) {
> +		err = xe_vm_drm_exec_lock(vm, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +
> +		xe_vm_set_validation_exec(vm, &exec);
> +		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> +		xe_vm_set_validation_exec(vm, NULL);
> +		if (IS_ERR(fence)) {
> +			drm_exec_retry_on_contention(&exec);
> +			err = PTR_ERR(fence);
> +			xe_validation_retry_on_oom(&vctx, &err);
>  		}
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> -			goto retry_bind;
> -		goto err_out;
>  	}
> -	xe_vm_unlock(vm);
> +	if (err)
> +		goto err_out;
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> +	return 0;
>  
>  err_out:
> +	if (err == -EAGAIN) {
> +		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> +		range_debug(range, "PAGE FAULT - RETRY BIND");
> +		goto retry;
> +	}
>  
>  	return err;
>  }
> -- 
> 2.50.1
> 
