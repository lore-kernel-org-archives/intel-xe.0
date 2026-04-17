Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76072F8DFF9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 17:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F6110E08E;
	Fri, 17 Apr 2026 17:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRXWw4Zd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633E10E08E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776447541; x=1807983541;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tauIoAO/BOaZ3GRHjLQ8AaNS/fJNKIxwiUL/EbrxpUo=;
 b=SRXWw4ZdbTJDb5LAGvCLFrDYkwnfoHwg+rG4r2Wp01erJnh3mEnKk5pH
 QcBpKZbkP69DA0Pq7N0vP66gEeQPm+9LQQHIcbQEW/rZxEKyvlaEVuznL
 rYQRVvSzHnM798diMUlFF0uFKHwyUpmOOiLeXqVZIlC5un+hZ0iXqRzI2
 7RPs+FbBetfYALkS/vlsEmW/6G3YZ2h7e5exb6iBgnp3piqzA/y1JXu9b
 qFPIL8T1/e5AipIkXM3DGwO1fEJFpPOF9kyQbWMkLevUAnQN1ycIg3EML
 cg0h7rGMGifV4Be/Gy2c3Q5GUzmVaZJkdsUyqQjZ8sbvm5VsYSpVtB/7U Q==;
X-CSE-ConnectionGUID: dMo5SuizRAGhLPYBIA7/+g==
X-CSE-MsgGUID: j1iqpK+VQSerzOYr/rj8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77334829"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77334829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 10:39:01 -0700
X-CSE-ConnectionGUID: hE6MfLnDTyyraUcOj0+JaQ==
X-CSE-MsgGUID: 25hEg6NDSYK4CtmjWfNs5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="254572444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 10:39:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:39:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 10:39:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 10:38:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jkr1WqvIYuDK/t5qgvZ42SZb/kEXMHFIwd0iUTxQPg1Hy6/j2a2DzUIzd7vu5TJWWlI/Hu6ni/l2n6Dh97477XVE8L6NDBphvESwnOoiV44Tp2NLRqnzzDKdGgkhS/eoCQN5Z1vhew6ZVuB0irFsUeJ059x+4cyZFr1luQuCF9eAaywd929rpU2uVi/NyQ042ng5TigwxH1qOmF23s4e82fU2zkJbf7HZwF1YABWSiyFRjqq/V5kVkitP5Yb59CE571qXYc3xkvWq/3wbezka9GfGgSft0m5IDIzrqDX+qNmFqwJkNFT5KITsbv0lD+5PZuTg2BWYXTXWXYwjr7Lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxaIVJKJPB337gbTkRVV2vmepeYN8cGYGeMVDVgNINw=;
 b=VZ4SpubIBxtAj8YFXNKZQm//jvyieJlnpbtt8UfoZjhDPpoYvP6Fs21diqQU00pQH/IChBnUa9PIdHpWyWGy2VVXlaYvxMFQuGAEXs7k0tDTZXQ+zZonq6OGDh4GkQ3mG608eldl73qeJVxmvVFLIZaQz7mleQVzF//jmOVrmKyOkJHswFMilh5q+j54CKtsbfvTcub8ZtRzItcSOzJvD72b1m3kW3Ua5WEL7sx7/r6rnpvCbeNjAZyOmjALJcDVE698FwCsqe+NTMUvuq9Ytyz7J2v496PEF6KgIzJVNrbUSNpnsssdBoSkDEy7yqNqvcKoddf1HOxM4k6z4+1vTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 17:38:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 17:38:57 +0000
Date: Fri, 17 Apr 2026 10:38:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 06/13] drm/xe/xe_ras: Add basic structures and
 commands for uncorrectable errors
Message-ID: <20260417173854.GE7476@mdroper-desk1.amr.corp.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-21-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417085812.4013309-21-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 846c3ccc-b1bc-452b-3f82-08de9ca83384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info: zUle6PwWXyuF4wgdYzR+6wW2v+CYd+EcXJB3Ey8E7pKL7J7DrDdRUeasT0WwK4ruu6VWxLLYcCdW2a4w214s0H8guoCe7iDJZR80DRlfJOxxLqKyMVIpQp++X9nIKBKKJHLgoThok4V0NZGNpwX6CqDnOucW35j47jVcm66hc+9ZFGNMQ6U6CgreFEKyP4cYhpYv8EFqhNDZJmOICW3jXAxmLoGReQ9LQMEHaf7gv6ropagZOobh2DrljwCMxWW/8IzQVVY4trAc7vDron5kx3O/HFHD7ih/MEq8tEnZ6OhIqdt+V71nnVeGid7BC8qHeHM8hqQ/tMS5rq3y75u5z0CC+GjBAMNxyvqqfn1YIrQzQyagG+K487fPyhCwzQQUFh29GwmGbsE3abVUKztCF1XiqkEK/l93mhAA7d9dl2Aqbmp+WT7Bsa/pMLejlUe8wbEkhpkH7EL6CDIcr0P16fL/vkSyKsl6FQPkyd5XX/8VkSYSn2Q/kUB1VdozKLGZVDU1P6fTFqbgyxnJe1RcOtfJhxScExf0HdbBd3ETT4quMKuBoah4mkgGdFsVR+EbvX/sQTW6z9aY3MaZ+V8krKqeqVJQQCfODGpb6EzwuW/IhT6PAnAH0cVbV5JQPPyhOnTL80wOtXBCrnO3XL1nOxXltwZE82VmLuk1y33KxB3Q5CIhQByFmKCOCyvCcE3Bu/lmI08Qdf3edCzLQJHw1unt3G5ELUolTUphPGVczW4krCDnehUvXUMcLX3ijeH+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(18096099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xCBCcUKD+IsjpcM57Hp+caS38zBubjlzm+PLCkl73EBgeK0VD0OFgNkjZL?=
 =?iso-8859-1?Q?flRYtZ+FYRzbDkTuvaEM27wHQVsdTIfM8+3nsA9kZhROjGH6I+l9MaYY1e?=
 =?iso-8859-1?Q?KkZ71/VQ+CXZ6UqkHrBL0W2IARmB0hR+1d6QcA2gOYqnJDXwfj+paDmqJE?=
 =?iso-8859-1?Q?1ak+IBi+Lt0+X/vYBAEFDB3hzxITUH1bFGCJg2J80I4YRhTYNIte7Qz7Kz?=
 =?iso-8859-1?Q?fUyM6vGzhI7ZTayWMRp4d9PP8OOzj33Iupu8+swXwMwQYFd8fa6E9sPt28?=
 =?iso-8859-1?Q?Rj9Ye2ZImswcgUmgXrrMdArFK1vUuR6NIpECREHKx2GWDzKpn0hr4NONEu?=
 =?iso-8859-1?Q?HNiDzvic7cWpjTgyvoXrb4uC9UGBfZOHRbWxtl8oWshVn3tBc66YbnnNzj?=
 =?iso-8859-1?Q?4d0w8VXxeSJRjnDl5SlQ5XcEvaKeD8ZZq357jcEVSOd2DPlYKKWKRZqUFg?=
 =?iso-8859-1?Q?B9wypmvepkSlzq5DI4GsERVZZlZvYR80nz5zAfF0rJF+CQke53MvU/bKUq?=
 =?iso-8859-1?Q?h4CJT1XBUJ/cMQyOGUDp2QMAQ1u6HOBK6VfHIEEnFLKBpcfl7Ux9knTI/r?=
 =?iso-8859-1?Q?4Wlrni+2HL6t9foN6HZozyXj9bFAc7uojsaV5GOxiJEs5HXCUV1ZcMfcCx?=
 =?iso-8859-1?Q?dz2iXtms1czKpYAvcdM/ReQRK4dFr50T7CM8n+pQA5YRtQOZjqIMbfFl2Z?=
 =?iso-8859-1?Q?Q+u9KIwlubCkBqwC+I851J1KBYd0wQorM7mdwCftLVqesKiehO4Z+nu0Ua?=
 =?iso-8859-1?Q?10XM30fmCy0ygxo6BIMEarkp6zNeetG2SQ5Z79/9gaRcNMDxbtQTtEUWLd?=
 =?iso-8859-1?Q?7+r+FkcUg5+mFgHw/MkvgJpV50nFZnlKIiFKrNDj43TWbTffE0M5xeQw1u?=
 =?iso-8859-1?Q?lMO99Ing0StrpMvHfAiL6JGo1GZKWQx86BBP20dMsQ/+O8wq+CnJSzos+e?=
 =?iso-8859-1?Q?kjuyjunTk4g8+000Migllfe6JgzkHZzhHr0+sVOJ68epEjiApDS64Q9M3E?=
 =?iso-8859-1?Q?c/eK8KndEm0LsCa0b3hQ34DAoVYjOECgnPUu2qRx+lAZQB3x/L0nfhCXAo?=
 =?iso-8859-1?Q?ObGWzdsL1R+i5ELtgIN3bgpd4iZ5X25KdDG/5ZiH1Zl9dMPGsrWfz7YIHG?=
 =?iso-8859-1?Q?ty9f1nyyDWBmvz2AgNnhf1zGCNAHuEdb4IoECwjFGxMp9Qcyjl4xLmQvNK?=
 =?iso-8859-1?Q?4bhH4U39ad6k8bumrdAc4zSVGC2d2Vz5igVmCKMnwI5AUN4qAKuoks35lG?=
 =?iso-8859-1?Q?zP6zGtf/1jpgzGbDj0uf/8TWotLSaqxRMsAHLERv/nJBp3OrtwqwG7eRRD?=
 =?iso-8859-1?Q?uhrMDaYFDEanVS8VqOksv6BBw70uMnGtaqC/lfDY6q3r5eyOUz2QUICtf1?=
 =?iso-8859-1?Q?HYgNdPM+XIkQ3Pwx2h91MLiGOvAZtK7n5+1otUx6qRTPr/hiLIkUg9nia0?=
 =?iso-8859-1?Q?yq0K+i225Nb8JRl7tBgYasbtW56OHymbgW2PDTPUQxIGdF/F//mJs0srwh?=
 =?iso-8859-1?Q?oHo49VuAGx7OtuQYyTcHpUhl2y02qm6+/PZZmm2p5mZnCxab+hArKKBvUI?=
 =?iso-8859-1?Q?8rCebE/QNLkzT4kgY7qXn3AUt42M7ayQhAfmT9we/UDR14HBzLhJSayUPL?=
 =?iso-8859-1?Q?qAyGMV/dPxal/ksEKgfecGD2PCM6wbkDAZZkjSbV1XISdnJMK6YAJoYHyu?=
 =?iso-8859-1?Q?D3wUFAKEy/txHt59vL9WsNIAEQxvuS31qBdcvmN7PY+eDdumuerRRTBhPC?=
 =?iso-8859-1?Q?9TJ2T96aNZB02ALqsTvoRoOS71hYiy0vfLDWIK/cwQIOKeeiWnyPicetkR?=
 =?iso-8859-1?Q?e8CNGtph0D/01aebeqac/lzip1ZMIjk=3D?=
X-Exchange-RoutingPolicyChecked: kr90MIArUQhQRHqr/oMq5j894tzgCB8cn/mhSRA0lnH+LRwIjxEYyL5NBLo82+JaaX4ESqvbFKP1MZGVAoeY2AAvBlqpSEnVdZIdZfXOiZHPrIMDYD4zfJDgekPJC64DNQeiacSOK/e2/8TvoVIY/LSei4gp3iTOt/So4s+52MLHyugjDLE0OZua7fkCsF2Agr0pzbTYNDN0bvt958cfBmf3fR9+e51R4hL/SRcGrQUZH70bpEZx4lL5VZ6JLJgOjGtLhT5v7y0XxtlgtARoQtzvmhxPxruwAAhmjHZ5tFeHXdz47WvbfVaV3rD4ftYLzGiorxdGtFeOZWUUeQwr1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 846c3ccc-b1bc-452b-3f82-08de9ca83384
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:38:56.8434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMBHuYr/BiZcxLpKDe45liUi8vsmws+xxlVl1TeCnEJ2MBvP2Io+dWUZ0NE1doQCcktic19GaY1bjiwngzkvbk+BeakcrTxMYtLWZ/s39dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
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

On Fri, Apr 17, 2026 at 02:28:18PM +0530, Riana Tauro wrote:
> Add the commands and common structures for the get_soc_error
> sysctrl command.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use macro max error details (Mallesh)
>     use static_assert
>     fix kernel-doc
> 
> v3: simplify check (Raag)
>     add counter value
> 
> v4: use not_supported instead of unknown (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 57 +++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 96 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 13 +++
>  3 files changed, 166 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4f705deaeefa..bf780e953925 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,9 +3,66 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include "xe_assert.h"
>  #include "xe_device_types.h"
>  #include "xe_ras.h"
>  
> +/* Severity classification of detected errors */
> +enum xe_ras_severity {
> +	XE_RAS_SEVERITY_NOT_SUPPORTED = 0,
> +	XE_RAS_SEVERITY_CORRECTABLE,
> +	XE_RAS_SEVERITY_UNCORRECTABLE,
> +	XE_RAS_SEVERITY_INFORMATIONAL,
> +	XE_RAS_SEVERITY_MAX
> +};

Drive-by comment:  I notice that there's a fair amount of common changes
between this uncorrectable series and Raag's correctable series, e.g.,
https://lore.kernel.org/all/20260410102744.427150-4-raag.jadav@intel.com/
However it seems that there have been some minor style differences
between the two that would be good to reconcile (e.g., this series
writes out the full XE_RAS_SEVERITY_*, XE_RAS_COMPONENT_*, etc. whereas
Raag's series uses slightly shorter XE_RAS_SEV_*, XE_RAS_COMP_*, etc.
names).  Similar differences exist on some of the functions like
severity_to_string (taking both the device and the severity) here vs
sev_to_string (taking only the serverity) in the other series.

We should probably figure out which form we actually want to go with so
that we don't have last-minute conflicts as we start applying these
series.



Matt

> +
> +/* major IP blocks where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMPONENT_NOT_SUPPORTED = 0,
> +	XE_RAS_COMPONENT_DEVICE_MEMORY,
> +	XE_RAS_COMPONENT_CORE_COMPUTE,
> +	XE_RAS_COMPONENT_RESERVED,
> +	XE_RAS_COMPONENT_PCIE,
> +	XE_RAS_COMPONENT_FABRIC,
> +	XE_RAS_COMPONENT_SOC_INTERNAL,
> +	XE_RAS_COMPONENT_MAX
> +};
> +
> +static const char * const xe_ras_severities[] = {
> +	[XE_RAS_SEVERITY_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEVERITY_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEVERITY_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEVERITY_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEVERITY_MAX);
> +
> +static const char * const xe_ras_components[] = {
> +	[XE_RAS_COMPONENT_NOT_SUPPORTED]	= "Not Supported",
> +	[XE_RAS_COMPONENT_DEVICE_MEMORY]	= "Device Memory",
> +	[XE_RAS_COMPONENT_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMPONENT_RESERVED]		= "Reserved",
> +	[XE_RAS_COMPONENT_PCIE]			= "PCIe",
> +	[XE_RAS_COMPONENT_FABRIC]		= "Fabric",
> +	[XE_RAS_COMPONENT_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMPONENT_MAX);
> +
> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
> +{
> +	if (severity >= XE_RAS_SEVERITY_MAX)
> +		severity = XE_RAS_SEVERITY_NOT_SUPPORTED;
> +
> +	return xe_ras_severities[severity];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	if (comp >= XE_RAS_COMPONENT_MAX)
> +		comp = XE_RAS_COMPONENT_NOT_SUPPORTED;
> +
> +	return xe_ras_components[comp];
> +}
> +
>  #ifdef CONFIG_PCIEAER
>  static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..3d0f9e94a404
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_ERROR_ARR		3
> +#define XE_RAS_MAX_ERROR_DETAILS	16
> +
> +/**
> + * struct xe_ras_error_common - Common RAS error class
> + *
> + * This structure contains error severity and component information
> + * across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error Severity */
> +	u8 severity;
> +	/** @component: IP where the error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier within a component */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @error_cause: Cause/checker */
> +	struct xe_ras_error_cause error_cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Complete RAS Error Class
> + *
> + * This structure provides the complete error classification by combining
> + * the common error class with the product-specific error class.
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error severity and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_array - Details of the error types
> + */
> +struct xe_ras_error_array {
> +	/** @counter_value: Counter value of the returned error */
> +	u32 counter_value;
> +	/** @error_class: Error class */
> +	struct xe_ras_error_class error_class;
> +	/** @timestamp: Timestamp */
> +	u64 timestamp;
> +	/** @error_details: Error details specific to the class */
> +	u32 error_details[XE_RAS_MAX_ERROR_DETAILS];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_error_response - Response from get soc error command
> + */
> +struct xe_ras_get_error_response {
> +	/** @num_errors: Number of errors reported in this response */
> +	u8 num_errors;
> +	/** @additional_errors: Indicates if the errors are pending */
> +	u8 additional_errors;
> +	/** @error_arr: Array of up to 3 errors */
> +	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 89456aec6097..00a0f05aab32 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -10,6 +10,19 @@
>  
>  #include "abi/xe_sysctrl_abi.h"
>  
> +/**
> + * enum xe_sysctrl_mailbox_command_id - Command ID's for GFSP group
> + *
> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
> + */
> +enum xe_sysctrl_mailbox_command_id {
> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01
> +};
> +
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 1
> +};
> +
>  /**
>   * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>   */
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
