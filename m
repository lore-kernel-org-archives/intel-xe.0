Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC0C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 16:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6D410E59D;
	Mon, 27 Jan 2025 16:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWdNCiOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6210E590
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737996788; x=1769532788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xXrhg/0t1EH+WRpA+nMTzbfdcqyBYTYR5W6wC9688us=;
 b=UWdNCiOBJKAFoxOmLj8/Rt+a4LCt3lwg6vlqSLO9ZPbBZT8tKMTZFhmB
 k18tNVJ4S8rOT4R/EpfOkUeZxMR3+0FqwqQ8ErKX8OuPKPwsTR6zq5jq1
 CCvz9ZvqGmDDIl8lfwmtCSZNcQhoIqojl/O0ycuJRc9TjEqMpRYnyRAh+
 SHUvmLDVMB5XySP8bvPtVhJYzIRb9BgG8GM56laLDwpKmZMMd/qQwMNai
 D3yKB2aRTqaPXqdUVSI3l4syGb2lwQaed0D8M/oJoj0SocqRbnugv4fk2
 r/MgGUIO/tCEFV1Fop+pZqmodBnTgq7fxD8Hk6MbF8WZhm7oW+tj6OYac Q==;
X-CSE-ConnectionGUID: OKXHRhJKQlK0T+O0T+DPWA==
X-CSE-MsgGUID: Z93UZYX+StCqG4CyFhopIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37719219"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="37719219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:53:07 -0800
X-CSE-ConnectionGUID: oS5Qb3wMRWqsgqQni65lGA==
X-CSE-MsgGUID: Vfnjl+0CSKWioUhG5vmOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108274750"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 08:53:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 08:53:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 08:53:02 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 08:53:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZA8MHw9QAtgQhKIkQlhBw+WGw/unUAFBMY2+MP1wOMJWPTyTs8ciDGThp7/U+ZwNEfqSf/QWwoShVk4ALiDCZ6aCsmo2nDW0/gOe/L21cDNSxl4FyzbpIf1Jriz0MJX6rUfgOs3CLGfxDbMWSnJJV+NNbubMxaU2TVJr/nSrOZQuUanHlRL9ZqYxxny2A+Cpt2udEJamJ7u2cQzG32noP6RjHYxKolQFNA+ySK7phJnDAlHfbrNnvXWGu7Ga5BdiX52AgSVOes456EREaJ6RiO4i3N4Xy4iKhapPiOZh8Kmx7NzClucS/cdIwzQi6gdTqpi83vnUq56bZqEoOgCnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpYA3B5A6micHlVMKOcgevbIxPehFPx7w7qhgBbMrPc=;
 b=GPiKCcNdYWpgYqmr0A8pQnLZ6UyQhu+752QdigPmLhbbhdD3mcvrn4/XM0Kdss7AfH5oguGuzQq+fovWD0F8LcLS8MNC+jG7bDwpkvIbkHFATQ1OIMc2aRxOWLj1XtsmBPOWEOZQ6eyHZSmKGqRmr1+jOqSjupONbj8UPd+h6BOYBvqIUU/+dq0/fDf9CGy9gPcllVCroc3324rJexOrTAXmCWIaScVl4P0FkvJoUmRB22wHdn9R7Z3B8pNQJ6qoXtA4ls5H+4J2OTiG9rST1YQ4QXx0XV1U0DU1gDvrECS2JzuSA43l/170TV3OsJ4T9eUZ3HDMQmP8oGY5bA9n9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 16:53:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:53:00 +0000
Date: Mon, 27 Jan 2025 10:52:57 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [CI 1/6] drm/xe/pmu: Enable PMU interface
Message-ID: <cckbougtjzlu7wa5iy4n6o4oihosker4qxf2yiejvmrt6p6o43@6avp5epggiab>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:303:b6::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cb5568-aff1-4c04-e0b7-08dd3ef30ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Wj94b3KkM5Q8MWLBrnK6HMywDN/QRwsM6rKngR4QYY4kMay1q7PqC56UeZ?=
 =?iso-8859-1?Q?QcjbMtYZ+4ySu/MDOsqRAd3CN0O73dfDto+hPc+GWF/WJQAnvq7dOfv1Vn?=
 =?iso-8859-1?Q?n8DkGbeLNnn5oVsnpBzxAV2GpdkzZElM3NNR8954oATpSX0Y7K7L1Hstv/?=
 =?iso-8859-1?Q?G3hA6hv9CFVnwoQaHHHDRbOADPYyM2McIZrC9bYJMZuFBHj5gb3ZY9veP6?=
 =?iso-8859-1?Q?5qYa/uxl6i1vqN74rDkC6elRNAERZMzNR+64ot3nkswwoOxcBmg2XBFgQD?=
 =?iso-8859-1?Q?ZLGe9oVL+lwzLBb8wIPelf/RLOlgvabF12hZeoZv29SWvt6U0tNLC8WG+g?=
 =?iso-8859-1?Q?+tve8T8zXiHtmAZibgSkB4MNt+qwVcvnb0Y86jYZLM0nMjS/OGDJj/L5O5?=
 =?iso-8859-1?Q?ANrzfUp8JaLjN8A+qze6ZNKoqmcS4YVvfUukyeX0T/hpeFyaK4m/5c9dRP?=
 =?iso-8859-1?Q?IZeM78h0Cq+RrMFSZqYY2NvPRLIyykwzmP4+9tcbyejXuoLU/UGqaT1D7r?=
 =?iso-8859-1?Q?b4sQYi8V+XE9G5MaEqTo9PwjKqjIcmTMuTgkM/aifSSZwftfYkcBZtDU51?=
 =?iso-8859-1?Q?1w/BUSk1g7l5FJ8tVY2mRA5vq3lcO4+RERJdCmoVFna1mKwwgx2v1UrwjT?=
 =?iso-8859-1?Q?TRPAIfSambdZ6l92AgEFvxffAF7P6A76hayb1aPyg2Zzs7NgoO+eIb8Dtn?=
 =?iso-8859-1?Q?QLpJhSUSwytJfb66pTd6KBghaBy5w1ryk6YspEBtm8b6y0DE6+UC/wXGfC?=
 =?iso-8859-1?Q?yHvLLSltXpuYdcMpiFOH+EgGFV5OGX9HoFm6u799lP6rbZFeHwDnl1vAtU?=
 =?iso-8859-1?Q?Z/6E4UiGSsJD1nJxagF3NaWcWUrwQlazSgn3Kq3bhl51JwbnpF81rNJtFQ?=
 =?iso-8859-1?Q?UCnbK8tncV3zrAztnxki+TmxsucUpi6vxe/WZWOyFZ4N4pmuAFRB8EF746?=
 =?iso-8859-1?Q?TsnpkE0lZgkkkNnvxj6zAcfa8mixCsxwrh3S+x5M6rGavicaUjZN05MvDw?=
 =?iso-8859-1?Q?qSt8O5X93oILd3dB5Cla+Tolrmb4mud1NsX40zIQydI/gGYb4e44sSyMsT?=
 =?iso-8859-1?Q?jJ2qSpRQKm6RtuRpQdx+rt7ILv6Niy86HOu2x8H24WUNl6SHxn195i9tNu?=
 =?iso-8859-1?Q?vAz9OIZqE1JBPQg2Xt4Xdjvn99apbSKVumQa2y9l3PyYEyiEHVDyH00vJm?=
 =?iso-8859-1?Q?yJoLHEML6PfhcmwSbx0NOr28QRfyNzT+S6VXtOv5ipPNkjK9/57oZX0gcN?=
 =?iso-8859-1?Q?TBf1Pfv7ucHIOU+TR/qGpyXAWZco8TtgP1P3lK8/fBDoC0gWmGwH0KSn7M?=
 =?iso-8859-1?Q?AUKkOFVQeX2afIheMYQoVgAWz40WRXZWh4Y4S2QFeqlLlSENgygO9DGvGy?=
 =?iso-8859-1?Q?XaYDlgl6zcphejRAttD7RMZnwXMTUWOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EtdxbAp2igWp1CzuINgvAu7FIw6eFIix1mWPB7OyvHbpqtr16EEMpMO17d?=
 =?iso-8859-1?Q?6YxX/dGIwVsvwEaPvH97qn9m0PdcWPE/K2CEM4Lv73uMyzTpy56+oMAXgo?=
 =?iso-8859-1?Q?aSqpMfkothdMvxaVftl8V8UqyqwXYhz4sHNYmR5ckUpgLGamANuNGbVien?=
 =?iso-8859-1?Q?yh+uO+SWpzaXO9usfPt1K5o1l7Ao7S2H9HJ/n1tv8+VC5mvZB5e+jAEkua?=
 =?iso-8859-1?Q?9sISO9WyWeY5iBHchoRlSg9X1Oku7o2rcPT4Tkg9W+ToKRhg+dLfjGL9Tq?=
 =?iso-8859-1?Q?j7lqoqwjrJgZm6J1Ka2Ztq1g5t3jMycclOtFUSNETqlqDuuQYNV/WIDr5b?=
 =?iso-8859-1?Q?Kk1HXhkGsjQ5HvBx4cdgM4i2QBOq4RTi6sZ10VX7neVLbN8gfmTbla3PxW?=
 =?iso-8859-1?Q?vzQpxBNTkXn+6k+onMTsW9JseFKPYgh7k4YKl+0h3X1jACSRtOC7Fr1Nu3?=
 =?iso-8859-1?Q?v9imGLX8XXPX/g4T1/zuiXZRIUHdL4zxfiIUCb0qNMjNUYDowagdvoZ9Yg?=
 =?iso-8859-1?Q?fZW+4dhmsA6ObdhtScVayT1bIP9Wp5yftjNs6Kt4yrOxCpHUslJlMOQM6H?=
 =?iso-8859-1?Q?7ENX3E6sbRT5iES1SzT9tTEOGkYk2rJJfgJjOxNWu1lR47E2gkDGyuqc1m?=
 =?iso-8859-1?Q?rqMSZHMeN5121CFZahj9EHZf4tUgmScKYvphYXYmqjHVqN/CFfx0WskGoP?=
 =?iso-8859-1?Q?bYa7wiicwXX9c12IbQ7jOVYnMcanIhvcFev+g0YY0WxPen4PJARLsiGeAA?=
 =?iso-8859-1?Q?NtjcdM54qvDFQOwsmMCKgDMhRkOIyI2LCfCNfVjpDIGhN0AIUws7mfvjzQ?=
 =?iso-8859-1?Q?jG+TTLx1bU/UyKXu2pxwhcAenTaZ4EuSwfjSExdR5NCRQqrdV/7ZV/wmXx?=
 =?iso-8859-1?Q?lToGhtjkHQG/kBPpRCzOpSlsLeP4Q9tgKCw/HJQQFtWDG25trYhOYrha3i?=
 =?iso-8859-1?Q?BU2eWp1qRiQUSJ0BSMQoiwII6nYm1Kkv+32quHaohs8JDVc6Xk8qIjvwog?=
 =?iso-8859-1?Q?G2eiFnwxvwTlHsuyVwqXPB4XacPmCHQEo7x1Of8T94VqrwpbplwOVb4NHM?=
 =?iso-8859-1?Q?2eOp/J5SJHX0fDnJulSbRqoAIJ3Ac2fO/NmycJhNYi8KSfjlJ6zNmoFxSf?=
 =?iso-8859-1?Q?y5MHrMxmOZmmbnElIPQDxRpewC1f5PK2fKJs+9D9c7zGpySHDTq/zC33DZ?=
 =?iso-8859-1?Q?BRqbuQuVLvD7f0NnFSTJ+/ZagmG2t0hqJSri4HhsewH+bZKFMhQGQMuXcQ?=
 =?iso-8859-1?Q?Uj73zC433nA0oeNvQv/r5FY+Fn86l0GI8GzBPuqzqU+H16wD4KD/O/UbLR?=
 =?iso-8859-1?Q?bs3zzIm45AnvQ+ZLD9O27upGLvhMnPPHmxEOMsRP7bpmWMR7b4nbYWbKFs?=
 =?iso-8859-1?Q?ad6pS8uXZKQRAk7eVvo2/tVCCGZS19g0ymblo0PGyoN0fe2f+b8WG92+19?=
 =?iso-8859-1?Q?OFTBWzYu0pD/Kc2FcYwG6Yr01msnXKVxtcvruIl8K6XtIxtrrVYFXD9TI7?=
 =?iso-8859-1?Q?bXb1bumnQkpBqdLY9E7oBPOWqRwI7N3S+4NEeMJFGTOeLXtTzwDF0RZKuf?=
 =?iso-8859-1?Q?59SoFpSnBbiXDheNkogxKLor8RLx6RgyHl9/aszHvKo4z9Tu1z2h194PYF?=
 =?iso-8859-1?Q?6vIlcOxmYYr9+lqglNqX6k53+jorPeOego4Or9Kfy13tQAjg8JTPVQng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cb5568-aff1-4c04-e0b7-08dd3ef30ed0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 16:53:00.5121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80b6HqhNXwavSu2qPR6JtsGsvmr7ceWqOOByJ9RpqpGWSWnUAG52z7zdxZWAkTwi2D1rvkD7KiaTnJsEtNsMgyl1ZcoRPRLdV5tAsbE1Qz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
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

On Thu, Jan 23, 2025 at 09:04:06PM -0800, Lucas De Marchi wrote:
>From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>Basic PMU enabling patch. Setup the basic framework
>for adding events/timers. This patch was previously
>reviewed here -
>https://patchwork.freedesktop.org/series/119504/
>
>Based on previous versions by Bommu Krishnaiah, Aravind Iddamsetty and
>Riana Tauro, using i915 and rapl as reference implementation.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   2 +
> drivers/gpu/drm/xe/xe_device.c       |   3 +
> drivers/gpu/drm/xe/xe_device_types.h |   4 +
> drivers/gpu/drm/xe/xe_pmu.c          | 289 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pmu.h          |  18 ++
> drivers/gpu/drm/xe/xe_pmu_types.h    |  35 ++++
> 6 files changed, 351 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 80ab87cfeecbc..31c52c6e212df 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -306,6 +306,8 @@ endif
> xe-$(CONFIG_DRM_XE_DP_TUNNEL) += \
> 	i915-display/intel_dp_tunnel.o
>
>+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>+

while applying it locally I noticed this will needlessly create
conflicts when this file is update with display stuff. A more reasonable
place for xe_pmu.o is just after xe_hwmon.o, before all the display
stuff. I'm moving it there.

Lucas De Marchi


> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index bd6191e1ed3e7..f3f754beb812b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -49,6 +49,7 @@
> #include "xe_pat.h"
> #include "xe_pcode.h"
> #include "xe_pm.h"
>+#include "xe_pmu.h"
> #include "xe_query.h"
> #include "xe_sriov.h"
> #include "xe_tile.h"
>@@ -871,6 +872,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_oa_register(xe);
>
>+	xe_pmu_register(&xe->pmu);
>+
> 	xe_debugfs_register(xe);
>
> 	xe_hwmon_register(xe);
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 16ebb2859877f..58e79e19deaad 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -18,6 +18,7 @@
> #include "xe_memirq_types.h"
> #include "xe_oa_types.h"
> #include "xe_platform_types.h"
>+#include "xe_pmu_types.h"
> #include "xe_pt_types.h"
> #include "xe_sriov_types.h"
> #include "xe_step_types.h"
>@@ -514,6 +515,9 @@ struct xe_device {
> 		int mode;
> 	} wedged;
>
>+	/** @pmu: performance monitoring unit */
>+	struct xe_pmu pmu;
>+
> #ifdef TEST_VM_OPS_ERROR
> 	/**
> 	 * @vm_inject_error_position: inject errors at different places in VM
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>new file mode 100644
>index 0000000000000..b3da3863928af
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -0,0 +1,289 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <drm/drm_drv.h>
>+#include <linux/device.h>
>+
>+#include "xe_device.h"
>+#include "xe_pmu.h"
>+
>+/**
>+ * DOC: Xe PMU (Performance Monitoring Unit)
>+ *
>+ * Expose events/counters like GT-C6 residency and GT frequency to user land via
>+ * the perf interface. Events are per device. The GT can be selected with an
>+ * extra config sub-field (bits 60-63).
>+ *
>+ * All events are listed in sysfs:
>+ *
>+ *     $ ls -ld /sys/bus/event_source/devices/xe_*
>+ *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>+ *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>+ *
>+ * The format directory has info regarding the configs that can be used.
>+ * The standard perf tool can be used to grep for a certain event as well.
>+ * Example:
>+ *
>+ *     $ perf list | grep gt-c6
>+ *
>+ * To sample a specific event for a GT at regular intervals:
>+ *
>+ *     $ perf stat -e <event_name,gt=> -I <interval>
>+ */
>+
>+#define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
>+
>+static unsigned int config_to_event_id(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>+}
>+
>+static unsigned int config_to_gt_id(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
>+}
>+
>+static struct xe_gt *event_to_gt(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	u64 gt = config_to_gt_id(event->attr.config);
>+
>+	return xe_device_get_gt(xe, gt);
>+}
>+
>+static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>+			    unsigned int id)
>+{
>+	if (gt >= XE_MAX_GT_PER_TILE)
>+		return false;
>+
>+	return false;
>+}
>+
>+static void xe_pmu_event_destroy(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+
>+	drm_WARN_ON(&xe->drm, event->parent);
>+	drm_dev_put(&xe->drm);
>+}
>+
>+static int xe_pmu_event_init(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned int id, gt;
>+
>+	if (!pmu->registered)
>+		return -ENODEV;
>+
>+	if (event->attr.type != event->pmu->type)
>+		return -ENOENT;
>+
>+	/* unsupported modes and filters */
>+	if (event->attr.sample_period) /* no sampling */
>+		return -EINVAL;
>+
>+	if (event->cpu < 0)
>+		return -EINVAL;
>+
>+	gt = config_to_gt_id(event->attr.config);
>+	id = config_to_event_id(event->attr.config);
>+	if (!event_supported(pmu, gt, id))
>+		return -ENOENT;
>+
>+	if (has_branch_stack(event))
>+		return -EOPNOTSUPP;
>+
>+	if (!event->parent) {
>+		drm_dev_get(&xe->drm);
>+		event->destroy = xe_pmu_event_destroy;
>+	}
>+
>+	return 0;
>+}
>+
>+static u64 __xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_gt *gt = event_to_gt(event);
>+	u64 val = 0;
>+
>+	if (!gt)
>+		return 0;
>+
>+	return val;
>+}
>+
>+static void xe_pmu_event_read(struct perf_event *event)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct hw_perf_event *hwc = &event->hw;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	u64 prev, new;
>+
>+	if (!pmu->registered) {
>+		event->hw.state = PERF_HES_STOPPED;
>+		return;
>+	}
>+
>+	prev = local64_read(&hwc->prev_count);
>+	do {
>+		new = __xe_pmu_event_read(event);
>+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>+
>+	local64_add(new - prev, &event->count);
>+}
>+
>+static void xe_pmu_enable(struct perf_event *event)
>+{
>+	/*
>+	 * Store the current counter value so we can report the correct delta
>+	 * for all listeners. Even when the event was already enabled and has
>+	 * an existing non-zero value.
>+	 */
>+	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>+}
>+
>+static void xe_pmu_event_start(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->registered)
>+		return;
>+
>+	xe_pmu_enable(event);
>+	event->hw.state = 0;
>+}
>+
>+static void xe_pmu_event_stop(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (pmu->registered)
>+		if (flags & PERF_EF_UPDATE)
>+			xe_pmu_event_read(event);
>+
>+	event->hw.state = PERF_HES_STOPPED;
>+}
>+
>+static int xe_pmu_event_add(struct perf_event *event, int flags)
>+{
>+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->registered)
>+		return -ENODEV;
>+
>+	if (flags & PERF_EF_START)
>+		xe_pmu_event_start(event, flags);
>+
>+	return 0;
>+}
>+
>+static void xe_pmu_event_del(struct perf_event *event, int flags)
>+{
>+	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>+}
>+
>+PMU_FORMAT_ATTR(gt,	"config:60-63");
>+PMU_FORMAT_ATTR(event,	"config:0-11");
>+
>+static struct attribute *pmu_format_attrs[] = {
>+	&format_attr_event.attr,
>+	&format_attr_gt.attr,
>+	NULL,
>+};
>+
>+static const struct attribute_group pmu_format_attr_group = {
>+	.name = "format",
>+	.attrs = pmu_format_attrs,
>+};
>+
>+static struct attribute *pmu_event_attrs[] = {
>+	/* No events yet */
>+	NULL,
>+};
>+
>+static const struct attribute_group pmu_events_attr_group = {
>+	.name = "events",
>+	.attrs = pmu_event_attrs,
>+};
>+
>+/**
>+ * xe_pmu_unregister() - Remove/cleanup PMU registration
>+ * @arg: Ptr to pmu
>+ */
>+static void xe_pmu_unregister(void *arg)
>+{
>+	struct xe_pmu *pmu = arg;
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+
>+	if (!pmu->registered)
>+		return;
>+
>+	pmu->registered = false;
>+
>+	perf_pmu_unregister(&pmu->base);
>+	kfree(pmu->name);
>+}
>+
>+/**
>+ * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>+ * @pmu: the PMU object
>+ *
>+ * Returns 0 on success and an appropriate error code otherwise
>+ */
>+int xe_pmu_register(struct xe_pmu *pmu)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	static const struct attribute_group *attr_groups[] = {
>+		&pmu_format_attr_group,
>+		&pmu_events_attr_group,
>+		NULL
>+	};
>+	int ret = -ENOMEM;
>+	char *name;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return 0;
>+
>+	name = kasprintf(GFP_KERNEL, "xe_%s",
>+			 dev_name(xe->drm.dev));
>+	if (!name)
>+		goto err;
>+
>+	/* tools/perf reserves colons as special. */
>+	strreplace(name, ':', '_');
>+
>+	pmu->name		= name;
>+	pmu->base.attr_groups	= attr_groups;
>+	pmu->base.scope		= PERF_PMU_SCOPE_SYS_WIDE;
>+	pmu->base.module	= THIS_MODULE;
>+	pmu->base.task_ctx_nr	= perf_invalid_context;
>+	pmu->base.event_init	= xe_pmu_event_init;
>+	pmu->base.add		= xe_pmu_event_add;
>+	pmu->base.del		= xe_pmu_event_del;
>+	pmu->base.start		= xe_pmu_event_start;
>+	pmu->base.stop		= xe_pmu_event_stop;
>+	pmu->base.read		= xe_pmu_event_read;
>+
>+	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>+	if (ret)
>+		goto err_name;
>+
>+	pmu->registered = true;
>+
>+	return devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>+
>+err_name:
>+	kfree(name);
>+err:
>+	drm_err(&xe->drm, "Failed to register PMU (ret=%d)!\n", ret);
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>new file mode 100644
>index 0000000000000..60c37126f87ec
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_PMU_H_
>+#define _XE_PMU_H_
>+
>+#include "xe_pmu_types.h"
>+
>+#if IS_ENABLED(CONFIG_PERF_EVENTS)
>+int xe_pmu_register(struct xe_pmu *pmu);
>+#else
>+static inline int xe_pmu_register(struct xe_pmu *pmu) { return 0; }
>+#endif
>+
>+#endif
>+
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>new file mode 100644
>index 0000000000000..0e8faae6bc1b3
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_PMU_TYPES_H_
>+#define _XE_PMU_TYPES_H_
>+
>+#include <linux/perf_event.h>
>+#include <linux/spinlock_types.h>
>+
>+#define XE_PMU_MAX_GT 2
>+
>+/**
>+ * struct xe_pmu - PMU related data per Xe device
>+ *
>+ * Stores per device PMU info that includes event/perf attributes and sampling
>+ * counters across all GTs for this device.
>+ */
>+struct xe_pmu {
>+	/**
>+	 * @base: PMU base.
>+	 */
>+	struct pmu base;
>+	/**
>+	 * @registered: PMU is registered and not in the unregistering process.
>+	 */
>+	bool registered;
>+	/**
>+	 * @name: Name as registered with perf core.
>+	 */
>+	const char *name;
>+};
>+
>+#endif
>-- 
>2.48.0
>
