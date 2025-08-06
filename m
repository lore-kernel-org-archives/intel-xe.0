Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDDAC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 23:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1610E1A3;
	Wed,  6 Aug 2025 23:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlykqreS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90C410E31F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 23:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754524766; x=1786060766;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eISTNaa9W9sjyIOz97qSP/0JHil3vbdNJL1FwpBQ64s=;
 b=KlykqreSyunWZ/YCt9BTI9OL/OTQIxeKQO/2tzcwW5oq8sNzAMw8lO6y
 m3ih3FJIqmSClAiCVoyWNFWphOEjz62gRXVyNQECTylZwKAeSTrTuJUQL
 MAyoQq2WMfcJYhKBlyWiS9ATDv7n0ZrRlhu+YfNBRLV1bLi+mhBRe1/r7
 MVx01WwETLyNwR4f/i/iA6Oxpq4ESmj5XlWKWebCbpeVl7WXskjLfQhS1
 kRiADEzWJHKaEcFv6GuWsb8AcDsbeZMluhMgEdTSXWCaXLByAn40ND+Fe
 ZB2yokyxAj7gww74RyCdl9F0UWbCAfxBhcCOZMeHZninuCZMHCMFNpP/6 A==;
X-CSE-ConnectionGUID: FWcf8IowRTOH5aoMuSugdQ==
X-CSE-MsgGUID: 50rgmCE8R/m/b029Wg1BNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74314071"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="74314071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:59:26 -0700
X-CSE-ConnectionGUID: x3LpKxFhQV+TF8Zm38ieVw==
X-CSE-MsgGUID: GXj4oHWoSTqfY0becxAr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165268805"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:59:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:59:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 16:59:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guxFJqBDl0OLDtE9X3bh3bcpgmuYMu3FrrZ6maXs1BPbuyqNLSxg3u4tIG31oDgQFuGvOoslgQHbfF2HPWnGI+fN9EEz87P8i0Th5hY5UBBW6ybIl6QKlAnp3kMZrpvPzP7i1zNtU8N1eJFVsHTLHNAIK7jpd7QXGeNJ70LHSahpRJZ7Ic9muBm7rlip0ClHHFV/V4tqOmnQXiTPdkrG0RfPK6LFaXNEwGkuvl29e4fABMKwxcZCK60wVg6FH9TJaA7abMmcrwguuXXWGJDKc8QpdKtKcBoVC7lwuiin352G+GsLFIQysDL5ZHSSjrNUgiu1AgQhOzJalIqtDHZm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHi8T08+Cx2mvXEVo1xSG2RLWekXoOecPt00JfqZ/7c=;
 b=WTEojB+J7rRedo5bvq5X0b+fhehx4FlU+BinS2yzkvCBhdXC4gXowOcg46hCJG/sqmITlAmYFqP1PbThQjPQGU87YlXUsIsInIpWdZSBAnOaeCpRSXuGgRT2ky602/cxLr3qgMKEk0GmuW6WDGqPR8fSgsXlFWCyEidXLCvlh2LclDNwXlaWV4qP0pXDsTl+l3Gmrc2XPLNZQ1hky56wonnzSyTOfdI+2lb3ewl1kZwJXDZIkq+ChQQ+Kpf7AQjcRzIgofWtXGfaACFyKuC7o6Xe9yCwUZUUKPgWm1dfAPoJUuL6Yuj6LD1MtTJGQy2938C6N/z3i4LmSlfkvwWeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 23:59:21 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:59:21 +0000
Date: Wed, 6 Aug 2025 16:59:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Message-ID: <aJPsVhVJUIrfUNtB@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
 <489d415972b3d9118e8d59911413802130827162.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <489d415972b3d9118e8d59911413802130827162.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|IA1PR11MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 90029346-d695-4d98-2197-08ddd5454328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZcJs90GHXZ612Fw+HweA86nZ4sACSp5zIkaf86INqHyJrYZn5R13AOoVqT?=
 =?iso-8859-1?Q?GLlZb7PJ4kjHdPXAb9U0+RtFdhoYt3sNg/03akWPhFmRhV21sa3N0XiAU1?=
 =?iso-8859-1?Q?NfDVs67yghgB7Gah3uiecESKFB5TQNlihT91qT/5XwdEAtLEch3yyMHOl5?=
 =?iso-8859-1?Q?fzoKhjVsJhciUqZ4mvR8IkPvlJbp0VbUdtSHDVME/4vj0F8UD1QdTzOnaX?=
 =?iso-8859-1?Q?qgUWoFuCVzQuqR9IypaLS/hcEmlru748gaLUH9kcgoFNb2EBdTgVjthzg1?=
 =?iso-8859-1?Q?dk+dXUBATgbpoTKqDDKhC1ICBT/bFFXXP857HC7HBXY/RjNMw/C2x9+PwT?=
 =?iso-8859-1?Q?uWh4agSi9RjAl/xTv1QyIy6+44PM4bGLkIP4OZuuDuEXlpiaUFQ7DwMSzv?=
 =?iso-8859-1?Q?wl9e/aIaCiyBeDqntYwuyacWVHNpm1mBaAXTx3vT2XpgLU5MUJfX/eQ4ch?=
 =?iso-8859-1?Q?M4oIOkwPyRdPbFocKArrEFlJIkLuA7QTTWE7WuscBQ8qqFIZJAjltg0VUx?=
 =?iso-8859-1?Q?/7eeL5Bmd0PWeym4vR7bD3WuUBCE3WD+nPBo12y36P+MEpzED4Q7V5HSfV?=
 =?iso-8859-1?Q?PFcv+b9DLnrgYC4Z0L62NmaaIERAFddi573bDSmUR8DmKEuU5nsdK4mUVA?=
 =?iso-8859-1?Q?iI+Evv5j02sfWio8rsfFBuNzRBjqCh/PZBWd1oaSN23IS39awVixVR10Xb?=
 =?iso-8859-1?Q?6r3vHxzh798wZeOy8gl+DIsM5I13h2wCvlrGox2A6Z43BhzVpT6lLKn6XE?=
 =?iso-8859-1?Q?RW458JHERd2IxDQpul3UIvX457JZ73xOD7Pze3RO/qpiySohB5/OmTwJVa?=
 =?iso-8859-1?Q?HH2TSOhtDG4klaVbW3jfsGwf9skuVdl95cIBPHx+7V1RqDxlYdn02elvdF?=
 =?iso-8859-1?Q?fkh5BKyKfDn+J91qrDJI1i3w1y8LXtC3VUS5jISTY4odY2ukqxfe0M06j+?=
 =?iso-8859-1?Q?inrKUjhgMXK3Tmd7qu8xZfE1lS7gCbgLK+FcfRW9P/MQBHe3df4eZVHtJi?=
 =?iso-8859-1?Q?YnbtXlKj0npx/eFMjmAmINGo6co371KHLuW6Cxuxb/pMG1shY0ubu89Ais?=
 =?iso-8859-1?Q?c0hjJaM7RVOUsAswYb8jKswjEqYfxETzrYA2gNuCBp3VIf9HFDL2Mzl7HY?=
 =?iso-8859-1?Q?NQgtfVEk4QdG4jegKJr+53M/b2PJJr/mqSWRizxhWKI1MDPrUDoI8vUa0P?=
 =?iso-8859-1?Q?kDCXbT09WF39jCjvjF/or0l/GFuVNR8D3+sNbsuncuulMl82E5puM37u5Q?=
 =?iso-8859-1?Q?b/Ff83cCEo2o8HTXV9NS5j66oi5Nh4fQo1LVaysbGZoAjMhgsucsZaz09e?=
 =?iso-8859-1?Q?Rcsv8iXsgOTp/te+vV09I+FkgymkPKfQxOHOjGAZiIbPLGfCU/NLzOfyn2?=
 =?iso-8859-1?Q?cx7aHT69KGbc5NT3rwgNl/zyhpDaNeMuH331SDOWl/7I8nRiUYBxg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rGdDa56KksAUOKar887GrfYmOBj80WWyclqEcjICNnAPhZWjIWaKE+UWXp?=
 =?iso-8859-1?Q?yE/hVx7GKObhKMs81Vyy+Bw6S+9uN+GCyJZ5Pg3SP/sAPlYParUotqxAA6?=
 =?iso-8859-1?Q?j17q3IQfLZvxPD2hLlEwyaLqCa1Mznpzvb2j7JE3XmPDDbW2jLK9EyPVtX?=
 =?iso-8859-1?Q?H8DO2KNQi0Ga9hWtmUwZ7qxS3UjV6jprZC6r6ZPdNYAtQGHjEwHtGAuZYJ?=
 =?iso-8859-1?Q?EMDQXe+HdKL5RntyxbaS4NNfetGI6NPvjRqsT8as56c9gjmsth8dOlirS5?=
 =?iso-8859-1?Q?59sSbrh10+tqMoaDIUlub2CPqoVSb9SfoVxxotcKuLGBRINJiGT8L8kOpY?=
 =?iso-8859-1?Q?vrmpWu6WPpvy9A2TC2gA6bKcirc90RGucHqn7oZe3joDnabXeFmmrpVkzM?=
 =?iso-8859-1?Q?tblag34dKg/24LkW6KPIm7fSVH5VvbRP8OuO62zQPwCxgvh5e0q6yWdPMy?=
 =?iso-8859-1?Q?rQN1mGR1D8Z2upCck0MmlGkCGCHx+spzsAqEZG5fscgs7jFFBGVjNefRBf?=
 =?iso-8859-1?Q?rpuqYMa+Z68gMdkTUISc488lyv/jJga7tiNwtXAosvKdlHZxUkaO6SzMcD?=
 =?iso-8859-1?Q?6XGnIp+SHjdXLjyoR8N6I8/Ud2TDqjESgiNtwXG5/Y3w2NI1fvmYgHpak+?=
 =?iso-8859-1?Q?Gfd3ksqfZI/7uh4EJRD5e89BWj5lpbDPJWe+w6mfNrZ7KDN6mR0xfvToIi?=
 =?iso-8859-1?Q?LClssnMenMlvk90KC9i0Qxs/op4xUNf/bWAaLhicwXnMiH7nqhnE7enzdP?=
 =?iso-8859-1?Q?zRVih7TEIboZh+Fx5nFqGKTHonA+ygbyizuq9mzNvm1Y9IuStKl/alwgx1?=
 =?iso-8859-1?Q?2xbMnJGeLwL7jFX1PiaynfNGxuqW5Yv4rYGJgMAhltVcqKqKUtkuaY3WnH?=
 =?iso-8859-1?Q?orncZQCuvR+E7OVk8A15EG9Z4OtnD6KZVZnPTII+detAUEgdIQ4JaQBf+x?=
 =?iso-8859-1?Q?nOwJ4rqXkmaNFWf6GUx2M1D379e2+KKgzFzmfFn0rezLqcg1O2+Acawu+t?=
 =?iso-8859-1?Q?xn+U0r60gRjL6JZmxnVxkqKk7LmjNfhxJ+JEMlxnm9gTll9tWEs0nfavUU?=
 =?iso-8859-1?Q?ljzqDyDQWguqQSSwGuYjhLvehzRCXoL6SsXaEb/CWlBbPcy8I3HAm43JsB?=
 =?iso-8859-1?Q?5p/A3DL7V+mvtzNxYUxVb5CvVWfjArhD8tqa3XF1g20LqkrjLW9ToMz81X?=
 =?iso-8859-1?Q?vGdzdfOQwXOqa1A9zocQV5O/gkmn8ULfGn951JyZF3ftyXcmVnnDV4zGGC?=
 =?iso-8859-1?Q?b/5eacyfQhYB8gCIbxVxUVZHlfSPGFj4ApoOaS6vCRxf2kqWjhtWEhMQxS?=
 =?iso-8859-1?Q?I6bhbNT6qvbH9c3uDjro89nDMDgOne4bG4Q3fEu8iRNhOuPBKdcsN7E+yC?=
 =?iso-8859-1?Q?uNkmWY3t8SiN+GlbR2+AkGaaY/3woP764jNeHg+KqRnjWMQi5jEc+8hNL4?=
 =?iso-8859-1?Q?o/aQtVYZ/MdIf7cXwEQtDjpB0nnj7OWzHi7g9xaTNoMja8zB+sSGSiWF4C?=
 =?iso-8859-1?Q?gTwIwuE9XsRisY/XqgVp5uJm2zooq+tZln4o9qY18Rw24rgHzttJuU0YMM?=
 =?iso-8859-1?Q?3NDwt7TXCwdn2nIHAQxlsIMK7sZMDclJxvVxjbs1N2oryWDFXb9k7YCylb?=
 =?iso-8859-1?Q?ti0ZUgaqL3H4cQBEzZsgeErBpN0Bqud2n7NJqb1yZOcSs9uBRZMtWkyw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90029346-d695-4d98-2197-08ddd5454328
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:59:21.6582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5a8fTg99G2bl7uVbx0Dw9UwwC2lqniPRehbfiwbZ3NMDoZtEmPpMeP//0QFxJH3JJz2M60auKE8mwwSfS8MoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
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

On Wed, Aug 06, 2025 at 05:08:18PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Create pagefault queues and initialize them.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h |  6 ++
> >  drivers/gpu/drm/xe/xe_pagefault.c    | 93
> > +++++++++++++++++++++++++++-
> >  3 files changed, 102 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 57edbc63da6f..c7c8aee03841 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -50,6 +50,7 @@
> >  #include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> > +#include "xe_pagefault.h"
> >  #include "xe_pat.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > @@ -890,6 +891,10 @@ int xe_device_probe(struct xe_device *xe)
> >         if (err)
> >                 return err;
> >  
> > +       err = xe_pagefault_init(xe);
> > +       if (err)
> > +               return err;
> > +
> >         xe_nvm_init(xe);
> >  
> >         err = xe_heci_gsc_init(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 01e8fa0d2f9f..6aa119026ce9 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -17,6 +17,7 @@
> >  #include "xe_lmtt_types.h"
> >  #include "xe_memirq_types.h"
> >  #include "xe_oa_types.h"
> > +#include "xe_pagefault_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> > @@ -394,6 +395,11 @@ struct xe_device {
> >                 u32 next_asid;
> >                 /** @usm.lock: protects UM state */
> >                 struct rw_semaphore lock;
> > +               /** @usm.pf_wq: page fault work queue, unbound, high
> > priority */
> > +               struct workqueue_struct *pf_wq;
> > +#define XE_PAGEFAULT_QUEUE_COUNT       4
> > +               /** @pf_queue: Page fault queues */
> > +               struct xe_pagefault_queue
> > pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> >         } usm;
> >  
> >         /** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 3ce0e8d74b9d..14304c41eb23 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -3,6 +3,10 @@
> >   * Copyright © 2025 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt_types.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> >  
> > @@ -19,6 +23,71 @@
> >   * with a single shared consumer.
> >   */
> >  
> > +static int xe_pagefault_entry_size(void)
> > +{
> > +       return roundup_pow_of_two(sizeof(struct xe_pagefault));
> 
> Nice thanks!
> 
> > +}
> > +
> > +static void xe_pagefault_queue_work(struct work_struct *w)
> > +{
> > +       /* TODO: Implement */
> > +}
> > +
> > +static int xe_pagefault_queue_init(struct xe_device *xe,
> > +                                  struct xe_pagefault_queue
> > *pf_queue)
> > +{
> > +       struct xe_gt *gt;
> > +       int total_num_eus = 0;
> > +       u8 id;
> > +
> > +       for_each_gt(gt, xe, id) {
> > +               xe_dss_mask_t all_dss;
> > +               int num_dss, num_eus;
> > +
> > +               bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
> > +                         gt->fuse_topo.c_dss_mask,
> > XE_MAX_DSS_FUSE_BITS);
> > +
> > +               num_dss = bitmap_weight(all_dss,
> > XE_MAX_DSS_FUSE_BITS);
> > +               num_eus = bitmap_weight(gt-
> > >fuse_topo.eu_mask_per_dss,
> > +                                       XE_MAX_EU_FUSE_BITS) *
> > num_dss;
> > +
> > +               total_num_eus += num_eus;
> 
> I'm behind on that patch I had posted a while back to update this
> algorithm :(. Want to pull that calculation in here directly so we can
> remove the PF_MULTIPLIER you have below?
> 
> See https://patchwork.freedesktop.org/patch/651415/?series=148523&rev=1
> 
> I can also rework that on top of this if you'd prefer, either way is
> fine with me.
> 

Either way works for me. If you get this one in ahead of me, no issuing
picking it up in a rebase or ofc if lands first you can post on top of
this. If you are concerned about history, then the later might be
better.

Matt

> Thanks,
> Stuart
> 
> > +       }
> > +
> > +       xe_assert(xe, total_num_eus);
> > +
> > +       /*
> > +        * user can issue separate page faults per EU and per CS
> > +        *
> > +        * XXX: Multiplier required as compute UMD are getting PF
> > queue errors
> > +        * without it. Follow on why this multiplier is required.
> > +        */
> > +#define PF_MULTIPLIER  8
> > +       pf_queue->size = (total_num_eus + XE_NUM_HW_ENGINES) *
> > +               xe_pagefault_entry_size() * PF_MULTIPLIER;
> > +       pf_queue->size = roundup_pow_of_two(pf_queue->size);
> > +#undef PF_MULTIPLIER
> > +
> > +       drm_dbg(&xe->drm, "xe_pagefault_entry_size=%d,
> > total_num_eus=%d, pf_queue->size=%u",
> > +               xe_pagefault_entry_size(), total_num_eus, pf_queue-
> > >size);
> > +
> > +       pf_queue->data = devm_kzalloc(xe->drm.dev, pf_queue->size,
> > GFP_KERNEL);
> > +       if (!pf_queue->data)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&pf_queue->lock);
> > +       INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
> > +
> > +       return 0;
> > +}
> > +
> > +static void xe_pagefault_fini(void *arg)
> > +{
> > +       struct xe_device *xe = arg;
> > +
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +}
> > +
> >  /**
> >   * xe_pagefault_init() - Page fault init
> >   * @xe: xe device instance
> > @@ -29,8 +98,28 @@
> >   */
> >  int xe_pagefault_init(struct xe_device *xe)
> >  {
> > -       /* TODO - implement */
> > -       return 0;
> > +       int err, i;
> > +
> > +       if (!xe->info.has_usm)
> > +               return 0;
> > +
> > +       xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +                                       WQ_UNBOUND | WQ_HIGHPRI,
> > +                                       XE_PAGEFAULT_QUEUE_COUNT);
> > +       if (!xe->usm.pf_wq)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> > +               err = xe_pagefault_queue_init(xe, xe->usm.pf_queue +
> > i);
> > +               if (err)
> > +                       goto err_out;
> > +       }
> > +
> > +       return devm_add_action_or_reset(xe->drm.dev,
> > xe_pagefault_fini, xe);
> > +
> > +err_out:
> > +       destroy_workqueue(xe->usm.pf_wq);
> > +       return err;
> >  }
> >  
> >  /**
> 
