Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A17CC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616DC10E88A;
	Wed,  7 May 2025 19:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbtUrftR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D710E889
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 19:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746647189; x=1778183189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hYA0L+MTuyLFXcFde+9WSjMueM2Er9ETTAEDpwM87DQ=;
 b=gbtUrftR6R7iNB5nTIUrYeyvCVFpo2/AJVAT0czw6Jv1Ko4Z4GDLwDgM
 4DhUBFDPLgDcPqDouK0hj9FYYBuEN4iWb8x3FhBR43smTP2o0QsofX0sZ
 2YYu24axL083FdFgojYCRmwUUmzYa2E0KxJ2CfrRKTwqvx8P1t486Pdpb
 /gwr/aSkEvJHS8LfPRB7rehelu/KDzhrC5/9NfIex/fd3E38dSCFLFepT
 kA/xRzN/75XFM1QDYeCwnpXoVoqFniK9KIRvVHzxC1/MSlJ4bCbYQRXl/
 GF/ypVaqRtEDyvPNKdJBH/pKhWTYam3jVaaGb7onPWl9kIy8Uunsxawet w==;
X-CSE-ConnectionGUID: 8xyGgCaNTzys8daXirgOlw==
X-CSE-MsgGUID: 8wHlv/8+RbahXohWRbMJxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48546751"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48546751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:46:29 -0700
X-CSE-ConnectionGUID: gkSjJnEOSpWW5OwUmpmMZg==
X-CSE-MsgGUID: Uv8B2lnrTv+fqwX+xkwHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136572965"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:46:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:46:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:46:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX23XM7EXO0xA3fiQ4+KTLI30+Bm18coGh2pWWad8iWIifUEBjkWsCsBEEDGynMbEaUtDo9DqOkSFs3DVXHgqJdAJ6rvTHrLKoWYL97KypMBOm75xE77nuJZQPxdM+cackl5bkYGlNo/bWy5cMuc9y6NBgw+ytDP0hd1NG/cfCCqeHOQE4kwZ/gDMoElQuqHELPL77Ar/q6rIbt5OKVL3FaMiom/E+uAUNa/+A/gJBrx26gVxO2ihiCavsr7viV6HXJRKkumcTJzx/blybLVArQJohehp7PwUIY0RRXWSursmWkG15EJ66pHFuXqrgDJSCJS9XMDC5H2c8w+0lokVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MH+bTzWCFfb8muWKZUCQixC+GPLNgGpFVRXipcS+rM=;
 b=bbhUtCGafvX3DU/PXYLyvFTKzJG+FGRChGkvq8kvwDamPPQa+JSoTmQ6oQ5MF3eoWnlCHY6DJnD7DOM802/53lnrg4T3xcsqeHji9FbO6OtpRqMj0XQV+LmGYnKikYAIAcFYG3ehkaCZ6btS6+tBXE+kUP54iYifMqkcJP4JvMELw4tKhc3S8+25DCgz30ob423eGwiO1uyYWOqM1oZRnckU5m8q4dF0fszvtrc6pxZndZUAeST8qLSM8T63lFaA7IKvZGLvrZ1sZv73agl1pvKHmLettWvdkPLXyKFNeH5IEfOV+40JhqOoCg5zyMwG6ioDfpRnOqF19gHrY1UepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 19:46:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Wed, 7 May 2025
 19:46:11 +0000
Date: Wed, 7 May 2025 14:46:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <nicholas.johnstone@intel.com>,
 <david.e.box@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/vsec: Allow for kernel context access
Message-ID: <gbcppvon5jrqdbplqzlg3lyqjd3p7s4uv36calvetvnnn3ghxj@elaaiqz2j37e>
References: <20250507193811.268719-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507193811.268719-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d49725f-f015-45d1-44bd-08dd8d9fd1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbNUoT3HS1viVxBG26+/KzdDt6vcURltygF0Li6TjPhrpN2Q6IKF5wZ7rHR8?=
 =?us-ascii?Q?SraWRS6F5YhvzqFof6w7J9V6oCmUg9Oz8j7lB38APyPoZ9zx7cH0EMRDwjZ5?=
 =?us-ascii?Q?dFHmXshqOc42WV1Nomp5JrksVWQKxoF22BtsGWSgBCx/7pWpdVbm8ndexwvE?=
 =?us-ascii?Q?maomjuzyHeWRX+mSCJ7y/XvxbtGVN9jYZoijE/5SzNG93jppiwxOx7AxIUy0?=
 =?us-ascii?Q?lL4Aa0NG83s4QNyemwEygtaHOuBU55uyREcCTIeBvGo9IVmCsJr+X4xR5DFM?=
 =?us-ascii?Q?dOz1mR8ZSWDL2cfG+bUOkUCQn0mjJqDS2NNo8TablY9bCqm7uNQq+cM5IdKT?=
 =?us-ascii?Q?+yGu1MrIYAYuEwjnn27STRwLPqf6IU43GpwFCPgcXvonB+6iz7DaRU1E9L06?=
 =?us-ascii?Q?VzK59MQ1O7VvNNTVlWHv3l1Uf3habbI7TiHvxg8Xcpaah8zlHpeWn0Afk0O0?=
 =?us-ascii?Q?ZRMrkH4ZVDd/aeJc2iMZTUsY5cKJL4yh5d4w6X6Z4fMlrsLH+V/44gQDsNJA?=
 =?us-ascii?Q?sDLW2H2yA/mG0PYqvCdXniY8ZVYq74yRQoQPXKuEaNDqSTujYu6S61WWX6Q0?=
 =?us-ascii?Q?YovfKBKylDVaBjcUzwH7vbRpnXK2rve6BGYtcOf1M+nf0+ONG41zsuK5SZJ2?=
 =?us-ascii?Q?LuzVcLyGc65HzW7SXzhH0BvTBTMczvfT2FwuD+tPTt+1LHc7tHsk3P9Be6Xy?=
 =?us-ascii?Q?jchfr7JkKQ46SL8ag074KST/JLdZEIPuqVgX1pNV+qjSjdNfQoRpW5G47I9W?=
 =?us-ascii?Q?I5qwPvCRv3aNQsq+4yNXRw1r8O5C/3BAlUShE1s04t0J4d4YfXn/XwtugSrt?=
 =?us-ascii?Q?NAu6ScaIuQGdhQYhJLfW07U3wSCNhKk7y4Omt6Ml0EA81rMiYbc9XVP0Nz/S?=
 =?us-ascii?Q?BOjpGtq2JOosQZgE1vBOuINzbln36glIiArAcMwv5724eQQKXqH3jcGthOoK?=
 =?us-ascii?Q?/VEi0YhDHp/35YyHZB9VBb1OlRDflHZTrnkyf89qmVt3lXeyxnNddyZR7glI?=
 =?us-ascii?Q?3luew5t+2xa/myHMcpp3e1dpz6kxZE7QTWoIEdzJOuLXWzIXvhGWeO1L/CEu?=
 =?us-ascii?Q?VQF6H9g7G2i9ifBXOTP2yocg0C7281tzRzkcSVaNEJjfRasaOUKXtYGOJsLS?=
 =?us-ascii?Q?cwlz8kARkJ2Tsp95gMyAajScpwnwcK+OfM42Lp6sWzG4xOvId0TuySVpDcNv?=
 =?us-ascii?Q?L/wofEe/5BWYwGf328Xt/kjSODFuXtgyfSvoQ4/BjT/kMTpywvoGS+IVyq/C?=
 =?us-ascii?Q?HvMcFc8V/ti+cphEbdw4SwPcdBtHlUOpi+iON5FA0I6WsJk6vnUw4wkXcZPS?=
 =?us-ascii?Q?ycKxcPttt4YdtjWuZN6yR3X7BQZqXyg3aArUrHDts+2LNZl8P5qV1y2nMm6J?=
 =?us-ascii?Q?AuyoAj2+bTGeQxK9gi+dkoLY3otkTIH2t8UVuC9RsfEFDJN84mG0TiNRr8/X?=
 =?us-ascii?Q?U3YLti9nO1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?32TOkmL3ZeyIzaEroMZY0gUjJnC5bzwpzRr5KiRKdYfVWQWTNwLorGkZIpMp?=
 =?us-ascii?Q?L5GMcL0mfsuse6vHgbSz2XzkBCJZGym56fUqNZF4hpAdJQ8E6PI+7Sw1BTiz?=
 =?us-ascii?Q?8hh6Q9TcuyJkCSP9cUbZu8JmZINRjNLw8KgivM0MMq2lZHuXu7DaSLYT4dwx?=
 =?us-ascii?Q?5YYCxUfr/dHO/im/N3GacAUf64fGGY2918eZ3m3XUh5vmbF+espNjsxHcEHh?=
 =?us-ascii?Q?wX+Q3d6t4/uaZTuOhiFuA3YsLJGxjbhhsAdLEz6Vy7s0EIEJuI/12jBmEjUg?=
 =?us-ascii?Q?wlV19fPibp1c9s8rndq/sspjvk7FQY76FMRT+t8kRFG4+r5Vab0QpmD51NmR?=
 =?us-ascii?Q?coZlwaRqKFbeyGENPWa04vgyVy8dLtpQFHXOvKOKNGFd6VgTWBKSFzKfJXaH?=
 =?us-ascii?Q?Amh6e75wlPup9G/3/L7rtR5HX+1krMXL5Wysh2xS5afeS306t8T2cDJKMYaI?=
 =?us-ascii?Q?avc3rC1b8vIfBavdCoJGWzU9UvsWJxu0Nl+FRYik2QfLi+w/4M3fTEv6xQWh?=
 =?us-ascii?Q?wMuHv6Za3bjlznZixkgoEpM8WsG6owlkzNWMgZ88Lthao8hS+V7oJZbQQNkp?=
 =?us-ascii?Q?s8FDvbFrLR57sFfL+um066xbwbIlNH0/FSoPeYZrPhmKpza5MT8HlAVfviN9?=
 =?us-ascii?Q?4uo9KaoGMoSRT5diu8vUUxi3ECK/Jh1Wc38pf9Rw486cpuhHt0NlmnSjkM53?=
 =?us-ascii?Q?U8mt2zUCA+ybaFRoIKPg47O6R5A99SnNZ6DUkLNW29BryGmtY5hzNL+6+0DE?=
 =?us-ascii?Q?5WFjzibF96s0YwpEHvE0mWpBNsRfyBKHFjGQr0cdtRX0x3JMRkITZdEU7cMs?=
 =?us-ascii?Q?vF7pUN845Ju8iNDJAMaXVyLWU21G9VlA8LLLTxXNKiYeA4ylV7dxEWuG1wxZ?=
 =?us-ascii?Q?Cowp/0INJkEjppnf4uR9J1srMJSn15H49diPEwH+ljMjySZ6FQIWXrNz9IFB?=
 =?us-ascii?Q?BWgzxbLrHu1WB0LbiQPRd+XOL9U+l8O8ldpTIbSf0/Z8Ggg4il9D+4unupg2?=
 =?us-ascii?Q?77OZYJki1JxB7Du5ULtzqP8wM2WP/seEXH/gVuOiLi7CgHdSCuXcE8MQLKMV?=
 =?us-ascii?Q?b8BkpT6gb0tTBe5omFK+Xzz2CA/7rsIPrKWEvA/lgnK1upT7uyzKaFrzOnlY?=
 =?us-ascii?Q?7Db7nOnv5QE7Zu4CzegKqZaEfUq7WD0ODYAKAbavNA7/nFMhHyBzjxgOTxlG?=
 =?us-ascii?Q?fXYuLQEEWKKXqc+Zt8p87CGMvgCV4D1e8qgGY1MVcF1hlhwceKQSXfdd/GKi?=
 =?us-ascii?Q?XXNJuE1drGRitOJ+C1c+O3B2wbOopIjAxZ2Sk1D1/lgpp4OeGBs+hyVXD7R2?=
 =?us-ascii?Q?KUaFlsTk8i8XjHeJTaunR25kAifon86m9OjH+949azMA8KD7CeZzQu01bYAK?=
 =?us-ascii?Q?ft5+AFBqwrYk+scPIoJTs3yu09AFhP5Bstr4INUJBXkrLg0KtuDJ1oMoTMzn?=
 =?us-ascii?Q?pzbelGgGEgu4VKjAdkLeflVC1Yrtai1YbugK5UEt+ylYreMIwGxckdBu5MTp?=
 =?us-ascii?Q?ksqVLRO2JFDeq8AA9rOKZ9WlSJDy5JESRW4s+gMT0MLPB0fovhrNTXTz7/sz?=
 =?us-ascii?Q?b4wnWHTmfO01HQcUh0ltiT7s6Q5YRzatByDvaGtspPv/YKUAzrRbs+bCpvll?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d49725f-f015-45d1-44bd-08dd8d9fd1d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:46:11.8618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjZdS3SatRvAx+VjdHST2ac8jxohfK2toedIl/hdOMY/ZbTWftVgqasp78UGdizno8DV9hSblM0rMC2oOm/OFIFHPqZyB7+FegRABQ3A5iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

On Wed, May 07, 2025 at 03:37:40PM -0400, Michael J. Ruhl wrote:
>The PMT driver API allows kernel level access to device

ahn? What's that supposed to mean? what's the context that is calling
this ?

>data.  Because of this, the mutex lock use by the Xe copy
>callback function turns out to be a poor choice.
>
>Change the mutex to a spinlock to avoid sleeping when it
>isn't allowed.
>
>Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")

need to be explicit what this is fixing.

Lucas De Marchi


>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
>v2: checkpatch fix, update email address
>
> drivers/gpu/drm/xe/xe_device.c       | 5 ++---
> drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> drivers/gpu/drm/xe/xe_vsec.c         | 4 ++--
> 3 files changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 75e753e0a682..72c81b8203a5 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -8,6 +8,7 @@
> #include <linux/aperture.h>
> #include <linux/delay.h>
> #include <linux/fault-inject.h>
>+#include <linux/spinlock.h>
> #include <linux/units.h>
>
> #include <drm/drm_atomic_helper.h>
>@@ -488,9 +489,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 		goto err;
> 	}
>
>-	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>-	if (err)
>-		goto err;
>+	spin_lock_init(&xe->pmt.lock);
>
> 	err = xe_display_create(xe);
> 	if (WARN_ON(err))
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 06c65dace026..b57e1ba7cbdf 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -527,7 +527,7 @@ struct xe_device {
> 	/** @pmt: Support the PMT driver callback interface */
> 	struct {
> 		/** @pmt.lock: protect access for telemetry data */
>-		struct mutex lock;
>+		spinlock_t lock;
> 	} pmt;
>
> 	/**
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>index b378848d3b7b..df44e28abbdf 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.c
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -6,7 +6,7 @@
> #include <linux/errno.h>
> #include <linux/intel_vsec.h>
> #include <linux/module.h>
>-#include <linux/mutex.h>
>+#include <linux/spinlock.h>
> #include <linux/pci.h>
> #include <linux/types.h>
>
>@@ -164,7 +164,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t u
>
> 	telem_addr += offset + user_offset;
>
>-	guard(mutex)(&xe->pmt.lock);
>+	guard(spinlock)(&xe->pmt.lock);
>
> 	/* indicate that we are not at an appropriate power level */
> 	if (!xe_pm_runtime_get_if_active(xe))
>-- 
>2.49.0
>
