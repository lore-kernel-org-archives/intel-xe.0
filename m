Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC90E77188
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jan 2025 15:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372D210F112;
	Fri, 10 Jan 2025 15:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hR3pggTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189B10F112
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jan 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736522796; x=1768058796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r5O6YSY+BSQ0C/YGsPXRxBDKbdbyHnn9PVPTWnlTh5Q=;
 b=hR3pggTd/9XcoR7Fc+HbI8EMcM1N2d001ocAaRHEfWKt3QDuNBsFl/WK
 KpLgAo2EO1Dzt7WFD4A05jCVi1uy+YcB5friCaQzcKpWXpd2Sa6DpbpTt
 Az9JUu6uwo6i2e9SiZ1zUexWOpnAt4AatzO+y0delk2EKdYyh7CLutaJP
 HR4SBS5ScDPpl7bhVV4rFiduLVWISWBfmrDWL5xdTFXDydi+aXQf/tFda
 lj8rFzQ+BasOLBSYiAQn6BVveesmaCmlQBxqc4rVkIYBjdQq89vc1kXM1
 YCfh+8vCz3MwdFqUKmoDPk6heIbJLLZhOdplg0wjtwRtXJfFoHjuexQCw w==;
X-CSE-ConnectionGUID: ndjKeQpSQairKtG5prdOqQ==
X-CSE-MsgGUID: 1kfc7ZO1SkC6FRHo4NQkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40585388"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="40585388"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:26:34 -0800
X-CSE-ConnectionGUID: LUrKwxSVTryxSWuDKAfmyw==
X-CSE-MsgGUID: kcM4yY6+RcWzZADRfvyFzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103816426"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 07:26:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 07:26:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 07:26:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 07:26:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=robDMOW7eJCOHDH0Nopoprhj7AWXSniq8SAi0ByPCzolSJJwmiy6Mgd6yLk4wPUdTpsq/Gp3GPQ8EGeDMSFRBNpa/v6sdh426oLyDv1B4G/wCl0V1iFv+z8E3aHN/roorHu80vOqQsSn9Ewcc7WT3yg3Qh3bOxZuly9a9gFxggdBBdEZgofx7bimjd8WMzhpYDiq51nX/4jwge44PWl3u+5Q120IxJOHEby7UXJBpFeLGMtriUnIOxcEm3UA/SSjCw7/d4Y7hTFiQXHJ/+1cjAOoodfQa3xUzbRjjozBM5KlSlblKaI7gKHNwquAW8bviKZ0s09e4f9J+GzH1VPBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkfyr9w94yRq6UvuFRAScwSMCQwrr/vBH8mkz9sInZg=;
 b=N3ksaHcwNInbeEcOjqzflD+YvOHP6lKn5h0YBf3yWeES0HhCeEj93EUoxgF+4cmeuqt0ff5LnkPKHcN0FN2nfjNGaFCb/7n4ajOByvsH8VdJa05/igF8qgXTKAV+Tus2KWsQVFkU0TYx1hNJYRMKo1f3+su+cPYbjMeVG4DXotiHFttZLd/L5h17YveXyruFE2OLhMMQ6GupL72bVefZqf2J+Skk7gQMk26VMV7VlQDhuv2sEZ66ljftKve9jrikIQMLmibpPAODXaJyu/kqNcZNBfF8IZnLgOk3HmZnlWrxnjHZuuDTmvOlrEQj8A46r19XEj+zyaT4Td4uOtbcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 15:26:30 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 15:26:30 +0000
Date: Fri, 10 Jan 2025 10:26:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Initialize mei-gsc and vsec in
 survivability mode
Message-ID: <Z4E8IuZy64CN2j3m@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108103959.1219312-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: fc979e7c-be23-4489-6f37-08dd318b286d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WSvpbjimKOJtp7iWYTkxUeDsSAPKyP4T0iyBfPbaYKy8ThOiZYvnhH0EWJN2?=
 =?us-ascii?Q?rVisTg99Z4vc8c9zzofEaC7ReWtFUfWszfVly1rCqIxC27LbdSkLfphw/QBv?=
 =?us-ascii?Q?8EPjt6yP6XY7siTWl7ib/ifV4OjdW9Dnf2p9+EfDjUkKNnBSWTJcLOQ4f+On?=
 =?us-ascii?Q?g+aSvNlK0fWlv2GWb5J3R6Zluc77J4fm0siZ4hOsX15RkH3uNQA/sazWXnTn?=
 =?us-ascii?Q?1I3sVUMs9vO1GxrFkrMrD2UZ+vEAO/V7UNE7W7nIZRHNRviOygafZ7GymB52?=
 =?us-ascii?Q?CdwS+VXDdn9cQIk4tPDMczDLUs53QAxDJdZf7m2S+Jbd/Kg913uMu4agK512?=
 =?us-ascii?Q?1kN5OsGRCAi94g/7A9UznMvtEkygbKZhfS40GFHkOClpL8mblnXfhdtG20+E?=
 =?us-ascii?Q?MHydqIAu0sgV9SeCECqy1r3H5l77t4eBUs6LeIa62hJx0OP4tE89XV6InU2J?=
 =?us-ascii?Q?C5TxMBfH9aiOdPjLFGfsAjvRAKzAx0cknWqkXytY6AsKn+E6+m1/B/n1TZ5n?=
 =?us-ascii?Q?qekzN7669c9QPJIdqs5RuL0erEZWPkrTlzKo36pqdGvoIUk4FBjZrLzZjkZj?=
 =?us-ascii?Q?ZkyoEruqrfie5jnnpSQbt18XB3VlMo/8FjRDCP3zf2unF5cT6GswiUJXYjnY?=
 =?us-ascii?Q?2NuXWzbGPODx+SaGcKxmWAGUm/XpnAx8NMSY/nG3rOjGMuy+edf7ZMrlSU31?=
 =?us-ascii?Q?KcE5giZ/xcM5JZPICWDXQ6B5Dj5SGt6HIP2qwD22yNsHZBJVae2SscOE1rs5?=
 =?us-ascii?Q?w0XUAXULfZ6qfSirbhvdl85wfwIQi3CqFMOV+eZyf48m79xC+iURuoOm9zQy?=
 =?us-ascii?Q?TKOL5cm2p1wlrN0zQKYWI5UAcOSkl3Hl4x1DzK8X0wEcdvHqn1TVSYe3WgvB?=
 =?us-ascii?Q?Q4NdPtQe7OOd5lTC7fMN3SgcjICgu7eZJ6PrkcksMlcYd6IDhLku5r3Irnah?=
 =?us-ascii?Q?+8qp1L1AD0F3Gki9v78DkaixKmkDAHKuUCeEP6ZnhB9zo+VykQGuEPzbSumK?=
 =?us-ascii?Q?R0u5WO6CylkzZNqX4+MGdDmBsonsQfLiZ4d86BeuNU8Eo1HWacOmh4coOjf0?=
 =?us-ascii?Q?heWsFJIV1osu5kVnTlqF00Srm0/oztmmD1q0Vcp9bO/lwy4/sw54l8dwFHdo?=
 =?us-ascii?Q?K0hNgR5tcSp+fPzBapFHaMjMjdM1DoyXd9qkIErSEs3EN7BlM1fAUDBf+T63?=
 =?us-ascii?Q?i01Hsam06RnZPFaBPScMTD0qiPE2Jfg8agCaAtfIvaLM6IQEiP7cvyJ5QdOl?=
 =?us-ascii?Q?9V5Z2gA5Dxzpp1UZ7UDppV/r1tjeBttB+4efR0iCsQzTcLMRjV4ybPaQEMuI?=
 =?us-ascii?Q?gTp4rwAB5cfRbYiDw7h0clekku2AZ+/SgLlcyy1WpGBWH9DQBjouZBxJq+v4?=
 =?us-ascii?Q?2oWRkruTa7s2QaUyBO49Pf4S49+6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YdlIKOUqaxS6OFknEnVe9MQ8v5PmcqhSEzn2wfVnMLXT+vs7ve8PhSOOyS+e?=
 =?us-ascii?Q?pchBjjFuLA7ueOfoIwszwpJMzh5WoQK+qV1R1o5O7t5vDzc/SYQ/Bsy8l3W/?=
 =?us-ascii?Q?QpZ+8jiezGC8Sbq6yv2dYw+bSl0JAvlmVqNNbtnZtL+ldQNMHHWPv6IshpTq?=
 =?us-ascii?Q?Ish2+miIa2TLNs07HN38fK5qJoYdi5WijOXg65rE79X+fTg3ZdewcYslD0D8?=
 =?us-ascii?Q?cwj/jxqiuVXu9iJWOSYQp3fKQI8hfnoSmwnEpy2WvT2oIoHZrbhY4DFG9D6X?=
 =?us-ascii?Q?/JdQSvHTzpP/raNxfuYnVQZiXUz8fbpIsrP+NvrbB51mt95S3SvH6EFvWTOS?=
 =?us-ascii?Q?CPVPgC/0Abi/1Vqweodpog0sKdeijkdSOMbLew/TuLwFyKr2R3tUc3qK4ViX?=
 =?us-ascii?Q?UEYF0kX9i39NNVFMtl0HM7Hxi2aL/n+x2whfernwxXF2Blv7FSppyINSob54?=
 =?us-ascii?Q?ejKY2xlQJLcPXE5pHuB8DurZiLs0U4EShnmTjMynZGnL6cGn1YKucdf9hdaz?=
 =?us-ascii?Q?pn3w22UKVDtq5t/jHnmu5zQ67aHGCbLpeG9PW2p87rn9I+gEPXsB8plMRrMJ?=
 =?us-ascii?Q?P3+jyzBZiimMzD76ntrBbz4hazl9W9vNw4NzR2oEXuciKJECFyIcmkUFk0CP?=
 =?us-ascii?Q?viGeVFIftBxQd+u2w5xJ9/ydTINhiQIdsCZBZlSIQ21a0rnYZGXdhDaZyVtP?=
 =?us-ascii?Q?kHdJxP2BWe65S25ig35KDq8KImv+7JnrLvmLWllfgH24mk2VUXlHm1Kuv5X4?=
 =?us-ascii?Q?TKowJGD9ljl1uYqcm8FSAOk8UY5XdrqIMVzPsOCPCpjG67uLVFVLq62WfM1Y?=
 =?us-ascii?Q?owZbDmquWT1ir+Msjplwj1hecP9N+mn5yyZgNzZSbRjhKqgkvuvUsEBqkG1l?=
 =?us-ascii?Q?htKjJwa/QOEkRHWtwyi8AXsyFsoWvTkfEgL3j2A6CjYzn0mataeNFqNn7b9J?=
 =?us-ascii?Q?+D1pGmrzh4cu8xAe15u0+YsPCR+054vXCctb9rw/kKy6Q6h+lxPZkpRh40Rn?=
 =?us-ascii?Q?xSoA7zp1uQsbdGQtkC2GwYAVWLAaqO3IeSTbANL7PdYW2q2eE8HSlY7Wqff8?=
 =?us-ascii?Q?P936qzT0XJnJxwAfegj84eE9ZXpQ7mgbkNwExVfed5CnAqQkJ8fdSqb1CrdZ?=
 =?us-ascii?Q?U/erUIFms1dffxKV9O/wJn7T+OaCFsgYuX8NVhJbVm/OcoqPhJwCgDfn6OQC?=
 =?us-ascii?Q?gTcvnA/dfoDIBej4VI0PvjxEAmqRuf6PaYmo+0VgcClUlVpXzL7H79Nlnm5j?=
 =?us-ascii?Q?LX/nv2j/4GLEsTvPLX5zz4xqXC+bYlM4P53GxPq1aLcxBu3APBNaRRSPcPQM?=
 =?us-ascii?Q?IiuDrl9pKk/dpLdb8Fa1Bp19QaERpFXOfcAIKg4uXES9TxPUYgNIzjNy3PnP?=
 =?us-ascii?Q?6T49o5tNg8XGSpzMyU8E8JpdupqqoX6r41VSN2XYE0+XQ8+oqouw22ncHTaH?=
 =?us-ascii?Q?HQdBAuyyAcGLFW9JuNFjmcrpdDEDF9a9/QD9K8N48TKlkl/hYbw9MuUYaOFm?=
 =?us-ascii?Q?7nt/HGCSH82j9hSSC67tI8hag1yUMVQ58PmPE2dHyif8UidJBzIWPBBwuSds?=
 =?us-ascii?Q?kuhuqQki1CBIK/oZ1++Nrm1TaF8UQLSfl7At+2edTy4nipP3i6x0KURMv9uB?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc979e7c-be23-4489-6f37-08dd318b286d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:26:30.7938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azpHmw6c3c3Upku9ilBWIUmIGya9cxiyRrzRIxI54XYsKFbic6aQDb5q3kPRitFLhfAeMAaMr0yL07WU1Tho8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

On Wed, Jan 08, 2025 at 04:09:59PM +0530, Riana Tauro wrote:
> Initialize mei-gsc in survivability mode and disable HECI
> interrupts. Also initialize vsec in survivability mode
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_heci_gsc.c           | 3 ++-
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index d765bfd3636b..06dc78d3a812 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -12,6 +12,7 @@
>  #include "xe_drv.h"
>  #include "xe_heci_gsc.h"
>  #include "xe_platform_types.h"
> +#include "xe_survivability_mode.h"
>  
>  #define GSC_BAR_LENGTH  0x00000FFC
>  
> @@ -200,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>  		return;
>  	}
>  
> -	if (!def->use_polling) {
> +	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {

perhaps this could be avoided by adding a new argument to the
function? It gets strange that in this path we came from that component
and we need to peek back there...

otoh I know that sometimes these calls with true/false in arguments
can lead to confusion... and this is done really only once or twice
during probe, so not so hard feelings here...

up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		ret = heci_gsc_irq_setup(xe);
>  		if (ret)
>  			goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 4a978c7018c9..39ab898193a1 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -13,8 +13,10 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_heci_gsc.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
> +#include "xe_vsec.h"
>  
>  #define MAX_SCRATCH_MMIO 8
>  
> @@ -152,6 +154,10 @@ static void enable_survivability_mode(struct xe_device *xe)
>  		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>  		return;
>  	}
> +
> +	xe_heci_gsc_init(xe);
> +
> +	xe_vsec_init(xe);
>  }
>  
>  /**
> @@ -203,6 +209,7 @@ void xe_survivability_mode_remove(struct xe_device *xe)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
>  	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
> +	xe_heci_gsc_fini(xe);
>  	kfree(survivability->info);
>  	pci_set_drvdata(pdev, NULL);
>  }
> -- 
> 2.47.1
> 
