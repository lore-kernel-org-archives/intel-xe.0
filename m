Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF1CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2168410E169;
	Wed, 27 Aug 2025 16:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McsWInQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D970310E169
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756312240; x=1787848240;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oFMaoBbOp/uNAAFAz2DxyuQzn3g1V6C/NxajrpbS/rM=;
 b=McsWInQaiX15vA+dlkjye7XEcZ1LrRcV5WfrY4r30foU4wf3DTOSfrs8
 3qo5ILd3LNUFtKciZi3AmuB57E6WknPZ84iw8DqPtzLWfefchjj4JBLGm
 +IZOIsARHt8pz934hzsilTQ52DVjWbGgIKJr+e3GiBZ8PZXBCvc1nJszF
 XIpOY2s4y6EPTv6SEdXPIs6wGSK8AlMr1lFBDisUCt1oSaU9a4pu1FC2T
 WB5vN+7MmHMZXtdZ9XOxJitP4OolyCmX3kzQ5ShhjGbSN/LhyJW35pnXw
 N2ZXyAjEJ/qcWXSuL8bKQxLfrJnFs/MggV+aWmbJFgztN7sktQHlyFgYy g==;
X-CSE-ConnectionGUID: yxorKym2SieZcxs+KUlMEQ==
X-CSE-MsgGUID: zKmom0l9RG2UZubZROj8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69939766"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69939766"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:30:39 -0700
X-CSE-ConnectionGUID: I/ij62KpSPqvv0uOUAMwSQ==
X-CSE-MsgGUID: OLzAE5MhQ6i0LrWAfS1omA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170708408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:30:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:30:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:30:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krneHfGlIldxLJ1qalJ4AxkRcmZikD289K20RpwQ1Ud67ZGOg6wI4oRphBlbbTEe2FtqbUeltIyb1OWaBrB+uUoDLBR5SmcGLX8DSmfnQgJWaUVjbGRaYDUyS5j1CtyOzXo01EnFV2LYhD0BOdowkOBsBD0Ot2/w/a3jfpUl2ljrt2IqLRd9DoOsLQl6s8ftW9pJ0qs956zEHQd+uxAIMiraWQCMf/fd38khGue3xUiZuk12icjVazIxmRKrVApZd9PwkT2VUv7ZHBZZI3DeilD6nNuEzJsmZYxEojplQe6wFincOrbu9pmoKkfgSNYI4PeonHXW5kuLBpE9bs36ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14rVp8QinnjVFA97UCjUpvfObIyR46HZqnxh+fZkkwA=;
 b=TQJuwXZUUeiZeh6oxNxs/gnIV0L4VwBmc1+hgHUVNUtpGgIPvKjXkwkAlWaElRceaODAKC38f9Ng/esnAlfdBie4UbbdsXr8/xlTaV1sa5qn647ygHO0HJKzolK+49lyiIgSvToyqtuttGMifKfJZxNPJndXwJ/2QHOjWR8lD5YYOBuEuKZWrxRv48wTjK23dl9DkjO32bc5D4arK7zx6j0pGP+NUlpfABCR6a517PcQjlPmb1ml2pdfwKPc1Q9afotnVfRr9sN6UVrayIUVMRdBu9EkF+KRx6g+GbrxunRL5Y084JMdQfC12bWL+oYtSQnanwEesPlSzu/srRJo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Wed, 27 Aug
 2025 16:30:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:30:35 +0000
Date: Wed, 27 Aug 2025 18:30:30 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Message-ID: <aK8ypvkgu0lNWha7@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806062242.1090416-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY5PR11MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: e2edf2e9-35ab-4352-d6cb-08dde5870cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?K2jHWvIzf2A90IxZVyz/ToCX9MWiMKFiFVDyW4AnBPEdGE+pJpk1BPREaU?=
 =?iso-8859-1?Q?v8BR5GUTlBQjad+J6DB0V53XiqHIZOVR/xA+v1xTalhWcejfL1DCYW11xZ?=
 =?iso-8859-1?Q?EnaP/tjPWQGEIah5kHytoO9b/eTFgTHJi2kN7A7c8zwbavir27aTX70CiP?=
 =?iso-8859-1?Q?3Rmq3xHGEvcuxQy82gFds1Dz/4RKpPgL8KsKeRNMG1lS2cX9IAbjWW1+YY?=
 =?iso-8859-1?Q?5uFx+s2xFBvfntCNdzArZrN4jHiM8jzh+/JFju5b2zcbrduwrFIB8PLrgc?=
 =?iso-8859-1?Q?2J/CywsohAoMs/lQ2BExci6sBj8iMirrCZe4zWqNpE9weNudkXlcu80oEu?=
 =?iso-8859-1?Q?6QU29LQav+yVTN/Yu6P19Y1uTJqKx8tMMRXbaz5jSAgeZ83khSyTM4vbJ6?=
 =?iso-8859-1?Q?V2ZYIyjkTM/Q1anxr8xnd9Od6/HHEw4XFYBARSkfSsdpnPibNHGULn5yFz?=
 =?iso-8859-1?Q?ghzEq2soBVDf6A8CbLESK9uvyV4SDHa8QkWjiBGHyPhWzjGnoxA4K+0c95?=
 =?iso-8859-1?Q?P+uyw/PjCvgEPPmwjF6GOkNnjDmdrzNPdQ03fv0OdPp5wCAizWOWnefeId?=
 =?iso-8859-1?Q?Z1VyavE8ML0vsTDCTwWM/rRdPy9oQPKHkv/TTSwajrY7ZZkMHMamIOxOR1?=
 =?iso-8859-1?Q?Y/H0wmU4YPVIjE7LRz/nUBGvgxMqY5jRtDD59whVwfEp2xNn9ZbgZK7SZi?=
 =?iso-8859-1?Q?jJKZVHoav1I8kCGLzKpTvFxsB8u7gLyy293+t2zr3DpQFC377VTKUfJZNV?=
 =?iso-8859-1?Q?j3F1DnKwTzg93ixdVViP2L/iN/JEn+siAh2+GTGouWSrOnZ0r/XIzumOCb?=
 =?iso-8859-1?Q?XOheY/VWGUNVfkZ0EzNaQlN0hQu72l7XWgDxaWEVqMf/+6j5LGk5VDK5J7?=
 =?iso-8859-1?Q?ukokCktguvDKTmHfkyON5CIKf/4WQr/Ywv1is99fv6101SVGEHJPp+hohh?=
 =?iso-8859-1?Q?9lYPx+M8OPmJf2y9ekpu+g3wZFwBoJir1hDXXPOR3bWe7acTl0vafNwPQl?=
 =?iso-8859-1?Q?pqcnLApB/2dVc2dy0vE3yoCAlNl2h3I8OOjJWOLX+r9TGvulTaDar47kLA?=
 =?iso-8859-1?Q?9iSE9vftkMQopc3uOrQdThI5ZH5ztrqrVGuF8gv4prenueESiGNV4hIkmW?=
 =?iso-8859-1?Q?T8XtBtYp0ZdrXl0jFD44P9+O1BEZ9X3L/QVqt9cGpwnqznt6Y/AWyGoBZ2?=
 =?iso-8859-1?Q?GTHlnnGtIOyxPczcw3ObJwrM1KX6pxAqVjdO7J+VDSgpJqkudxsmg6VmSm?=
 =?iso-8859-1?Q?o4h8Ae2BHNJhLoBkaslrcDc26cC685YwaDg6DbtM8gs5rTW7DR3IqWWnNb?=
 =?iso-8859-1?Q?mH2t8sJSkP+DCK8RQAZtHWuRvVZwHnEGABUYBJ/PFgbgFgnvPwB2S0d0vQ?=
 =?iso-8859-1?Q?j+lZKTCcHgAKxyp34DThiU7gTxctpOCs1TKpgPILZOIFB++eKDDOITN1eQ?=
 =?iso-8859-1?Q?GK56ezYTwYTtcKvX/d2PeMVuv6o6tKxBCQDvpZmJvmUqbV7TrrI7SL7zOv?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OWNW1OB/zc5I4pvqLpZoHJ+BKKdnyGTVXqpqjTUmdzsi3zb5MKQpIuq+ur?=
 =?iso-8859-1?Q?kJfo9fI2aj6eUHPzXNTpIIw4oeIzYDL57Sd8vu8dh6wsy70Wc8P/dCdB03?=
 =?iso-8859-1?Q?c2cw8N6XYesLHdgDq6xWa9i8EE/uhZ7HJnR7cEat2LgiAtYAQvqq8uPe6H?=
 =?iso-8859-1?Q?1IUUIkvUUKj6tSzoGE3PZ3JEeHclTF/vak5R9UShJVnrcrrrswucx1/OlT?=
 =?iso-8859-1?Q?aTnW5AVUhQvZZxug9qIMwxhA7VdXfqVmCh/7ukGI5JLy350wwuEP2//ekQ?=
 =?iso-8859-1?Q?h6gFNrLKF7U+iG+SO3Ml3wUWVugaYzkQwd6RqtwFX7njcix93A9kJqzSUp?=
 =?iso-8859-1?Q?AguX5L0aKydd/C555sk9htkqWXVGiQ7n+Xmz5KcNagQIqvIQ6KIZZQdOon?=
 =?iso-8859-1?Q?SuLyDnneV5HnhFCsAdqkqHGJSq7426WZi5BW1d67l8fTfUW3vWwA/GBGXI?=
 =?iso-8859-1?Q?R0JBfJo+xPZTF6OsqnPR+YwftH3AicQyoB3461hcpLUhGEG362h4TYm2QF?=
 =?iso-8859-1?Q?atdIGN8AC2TNrlEA1Lmlpf0R1H0WhpCvOV3P+M4CIzzE0VLsajR7kKqmsO?=
 =?iso-8859-1?Q?BGdmMi7Tf/doEks6iU4k/biJyI0gw//h35QfQ7t9AhSrCrauZvqP7ZfMS1?=
 =?iso-8859-1?Q?NsWgqyv/hH7cAf8Xg8Zo4QogZG4hCiEFkcRjMDTrzp+OXk8d/UGimQvXIt?=
 =?iso-8859-1?Q?7tlqISjQ0/QoLuAxMdGLY7Qdpi8LNagf/7rTslLbGIYHIt7Ft02Lustj1M?=
 =?iso-8859-1?Q?5ArMnsRjGRjqV1wPorccCKIL+pPaV95GTOMPaVo9tO6kGr9xKz5fxTIUrQ?=
 =?iso-8859-1?Q?HJls2Ozvjn+MZEKb/SWi6Ysd0yrxPWsfOh8BNDlgmYAaiMRVgMupWNin9i?=
 =?iso-8859-1?Q?7zS4uMq1TemzGpBXZILD6535n9W5ian1xjD77SfQEpbwErA+ahwFOORj5Z?=
 =?iso-8859-1?Q?jsgpISyHHs5v3jtufEgMe0+U31cR4BPGJxXtZGAjJgj3qT+7gH6HEPRuk7?=
 =?iso-8859-1?Q?0S1EjrSEP+LNpS7qe0iR9zMsICkuiZ8gGccQCThCxVOQHZkQ4kjeqM422n?=
 =?iso-8859-1?Q?prINArpwEg4sfo6hkiN94+zSmEbVzbQNcLznLWJi/fCbU1qoILZEHOkfYz?=
 =?iso-8859-1?Q?fXar8s6edwwgf2HtLEN//DLvKG8vCKczt5dNSOu+9O0aQKDGSy4dOJeHAP?=
 =?iso-8859-1?Q?udsnzqMpS/Yg5hkxQNyEhAQeKTNs+3biiWgcSFqfoumM+LR/Th3VZZiJMm?=
 =?iso-8859-1?Q?/Fzyldm83WMznY/Bvjwt2fUNxjk7GVKMhp2xDz1PNoRdLo9gh0OGrY7SaW?=
 =?iso-8859-1?Q?JmYO9rOdMnqgvLOx2OuNnp5W8DFcl/mkHFvocKY/qO9kk4xgpQeSnrw/9X?=
 =?iso-8859-1?Q?ahvo6Hpf+4TWmQ2mQokPP7w96gdVxpOvgEZDildW9lUba1A/+pvlhRG4HR?=
 =?iso-8859-1?Q?FxTq6xU4UcR48iqLYfhCLzN35tNdjcrUKf9ihhsHQD25t7rgHppzvVnhfR?=
 =?iso-8859-1?Q?ba4zmsE9Jch7DlRhJuKdRcGOUQkmPIBvmGErHGYPcIfaI1suQvf3ktSU/T?=
 =?iso-8859-1?Q?PBC8yXH0F3pG4GRlXhJeQc06jXlP7FNvkkM3JsWxtVK3005SMTbOXM2qSx?=
 =?iso-8859-1?Q?mrHeGpIqww58VBI3/xQJhCfTtwwsy+vyh07ZLL6wi10e6Nxx6crxzrqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2edf2e9-35ab-4352-d6cb-08dde5870cd1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:30:35.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzclBLryAkLBfhGQJmHd3PsQ2I7/JHZEuBCt34T4+lVt6Z6D8GS4C2JHFYv+4hdMZyptM8GpBWrN7WztGJtftfWgRi5in/+C3SI8Rs9gMa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
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

On Tue, Aug 05, 2025 at 11:22:33PM -0700, Matthew Brost wrote:
> Create pagefault queues and initialize them.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 ++
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
>  drivers/gpu/drm/xe/xe_pagefault.c    | 93 +++++++++++++++++++++++++++-
>  3 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..c7c8aee03841 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -50,6 +50,7 @@
>  #include "xe_nvm.h"
>  #include "xe_oa.h"
>  #include "xe_observation.h"
> +#include "xe_pagefault.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> @@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_pagefault_init(xe);
> +	if (err)
> +		return err;
> +
>  	xe_nvm_init(xe);
>  
>  	err = xe_heci_gsc_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..6aa119026ce9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -17,6 +17,7 @@
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
> +#include "xe_pagefault_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
> @@ -394,6 +395,11 @@ struct xe_device {
>  		u32 next_asid;
>  		/** @usm.lock: protects UM state */
>  		struct rw_semaphore lock;
> +		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> +		struct workqueue_struct *pf_wq;
> +#define XE_PAGEFAULT_QUEUE_COUNT	4

Could we add a comment why value is 4?

> +		/** @pf_queue: Page fault queues */

s/@pf_queue/@usm.pf_queue/

Rest LGTM.

Francois

> +		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
>  	} usm;
>  
>  	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 3ce0e8d74b9d..14304c41eb23 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -3,6 +3,10 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_types.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  
> @@ -19,6 +23,71 @@
>   * with a single shared consumer.
>   */
>  
> +static int xe_pagefault_entry_size(void)
> +{
> +	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> +}
> +
> +static void xe_pagefault_queue_work(struct work_struct *w)
> +{
> +	/* TODO: Implement */
> +}
> +
> +static int xe_pagefault_queue_init(struct xe_device *xe,
> +				   struct xe_pagefault_queue *pf_queue)
> +{
> +	struct xe_gt *gt;
> +	int total_num_eus = 0;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id) {
> +		xe_dss_mask_t all_dss;
> +		int num_dss, num_eus;
> +
> +		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> +			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
> +
> +		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +					XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +		total_num_eus += num_eus;
> +	}
> +
> +	xe_assert(xe, total_num_eus);
> +
> +	/*
> +	 * user can issue separate page faults per EU and per CS
> +	 *
> +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> +	 * without it. Follow on why this multiplier is required.
> +	 */
> +#define PF_MULTIPLIER	8
> +	pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> +		xe_pagefault_entry_size() * PF_MULTIPLIER;
> +	pf_queue->size = roundup_pow_of_two(pf_queue->size);
> +#undef PF_MULTIPLIER
> +
> +	drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d, total_num_eus=%d, pf_queue->size=%u",
> +		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
> +
> +	pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size, GFP_KERNEL);
> +	if (!pf_queue->data)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> +
> +	return 0;
> +}
> +
> +static void xe_pagefault_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	destroy_workqueue(xe->usm.pf_wq);
> +}
> +
>  /**
>   * xe_pagefault_init() - Page fault init
>   * @xe: xe device instance
> @@ -29,8 +98,28 @@
>   */
>  int xe_pagefault_init(struct xe_device *xe)
>  {
> -	/* TODO - implement */
> -	return 0;
> +	int err, i;
> +
> +	if (!xe->info.has_usm)
> +		return 0;
> +
> +	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> +					WQ_UNBOUND | WQ_HIGHPRI,
> +					XE_PAGEFAULT_QUEUE_COUNT);
> +	if (!xe->usm.pf_wq)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> +		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> +		if (err)
> +			goto err_out;
> +	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> +
> +err_out:
> +	destroy_workqueue(xe->usm.pf_wq);
> +	return err;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
