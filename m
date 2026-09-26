Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D4AC9830E
	for <intel-xe@archiver.kernel.org>; Sat, 26 Sep 2026 01:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BB310E0CC;
	Sat, 26 Sep 2026 01:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ew/wD1OJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EEB10E0CC
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790387968; x=1821923968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mix5/bxChJv9eeh4ExF6QWAVDyQrEkfFdFneXAm1Pvg=;
 b=Ew/wD1OJz2NNrNVjrNtHMcedBANy8FTnyrm3ebr9XgM8er3w1Jm1a3Jo
 8ErV0BFAu/k4BO9npziHxfioIHsVhvN5RUsnnEiFS5+y+tl62kWlk4L65
 HpnAgIR7Bk/TSMA7HEALd35UAuP6Je8W4EFAagkbnQ3jTTWAgx7VsSIaa
 SMEOZyzPivE7czew4lMwszuvJsGHfC9V3CSKuajewmYk+a2g4ApmN/P7i
 NU9WTaLSpRrP4I9HQ4IZpvXPSeEcuvAtuIy6A2wxltvqDHsxDWjsbxegL
 PXmz9R5GQAzg2pOFrQSe2AihP+ku0FU2rQHSr+pQuLx8jQxrwvsuu/D65 A==;
X-CSE-ConnectionGUID: wc0MypDGRYqciZf6z+MOaw==
X-CSE-MsgGUID: 641zmVu/QNagmqEzGVuY7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116707055"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="116707055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:59:28 -0700
X-CSE-ConnectionGUID: +x8ed7EcSq2obXvamTJoYw==
X-CSE-MsgGUID: Ak9ILoQQRYCgjq3G0VhNNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="272272086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 18:59:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:59:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 18:59:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 18:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdqEkXrPFJc9f90X14yvqoTSMiszfIP9XIy1u7OYt77tAN1JdeBrY0OuF2Oqc3U2e78k9jGs6RGh2S+fKBM+GNhMNp2ymTJaOLAUih8Xl+UHP3X3UXc+XVm3Sd/xq7lhaRm8LdC0Jit7sYclnqTPZBzhNiOa/CeoiXe4nHAuuZu1ceq1bN7M2Z1g1+0b2AgLNVyDJmy0YKaL+rCjqb+FfmCFY7tmPXWF0RbGSEmW6H+QOELO+N4I2uRstwwSFTsraukwRZff7uZUkLxKwlyQnK8dRAqYExQacJ4gtuTXxiJPRO433bt9b2K8hez4gdzLmw2Lgdkvd2hO4777skGLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0eFpsoTqB47h0jxtniMhR2HI8gGCs6qJ3NuTSP6FD0=;
 b=Im0Mlki87J1b0SdfeNBz1+1/RX5LPeAyhqKYAWGuRbBXGCcLRkA3nQep0d0a2I/bSydfGTNHep5gWoJ+3QXeq0MVibUn812GVMwRgpSEHjzkInvc1MLg6OmU1AHJTZtOktch6ngECAFdAo5AsW3RK1J5v20jzsKhAggJwDWQGchl4mqchJKjMUQiJRAi7YrunYv3shxGquKaWkgjrrzrzjqkOQcbFg0s/BWnSCMkV/30/E7WKnChfu2FVjASFZ9dhkzWhhcIDoc3mtCLYQ4JUttn2YKOIb7tImntrWykQl4n47+1tDOfdKfV2CZhl3H28ighuZCWwp2+GQssdS2/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PPF5812CE227.namprd11.prod.outlook.com (2603:10b6:f:fc02::509)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 01:59:24 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 01:59:24 +0000
Date: Fri, 25 Sep 2026 18:59:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
Message-ID: <arcm+iAe5Ac7Yhab@gsse-cloud1.jf.intel.com>
References: <20260922043759.3057442-6-himal.prasad.ghimiray@intel.com>
 <20260922043759.3057442-9-himal.prasad.ghimiray@intel.com>
 <arcmWgk9TsnR6Nbf@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arcmWgk9TsnR6Nbf@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PPF5812CE227:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d96a9a-6771-4650-ba8f-08df1b71ca14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HUP9deXBqPo8UhqVsZ6fu8ieBVwRp87Vq82IurHDc9hyNJZPrhT+vF4LOCTCeqeZGjQrSpJPFjcZmmanefFgXcRXKDQfKDaiC1I6L461+RBYyYAeXvPlh2A3NDPsXe8vEvItET2b1EvBG1NFZXYCirgSLmX5KBHOSDLnhmlxKeH/CnYkQ0EKDG4E8GCswmJj9HadZafC3WtefKEfGA0WHFuhmoMw0/ISyOLIaAbH1vEMt0ZYpV4mseTQsMmrLD2Y1ttnqdDA8c3RE+sncVgR3XcUFi53VhHMxujpohslslmDXMtXPM3xW0kstgsnHl74y/oHNkJhKsRAd8lcI5Jgnr1Eyt/JzjgyY8GjDtlmsA7Hu+EGqXdVDvy8oZGPBRAgGAsQ1S3auBiG7ohoazuSA4o5YDqzry20txC/oJ8ZC9zOi0l0iG+TcUUiH3hbWWnoQyR1h478TJ/mYcBGxXMufSXhIVieBR3awF/6LAtoyQParxJ0XFQ6cC1E0NeCisFHCH9FucapH5K1k9qYBTGRFVjNP8hDqNt/1ggsNw1GcMY8bjsBHXpxmfMWj4b83ZE9veeT6X9h+IRDxGR13ZSvwwslGpr1OhszYsnk4xFL9vgqCwxe0AR286a5YFiXlYWPTbvsTnp+yq8NnpLm+Igm8JXBp4NQPHHThcIema+/nTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lRk9xU6H+jj9hXzJnasmB59I7Dv7zd6eSyV3qPp7WSa1blUwilNJn1eC2gcY?=
 =?us-ascii?Q?XKFtNl+6aWtnimou15uRrkbXjzZy6O5MluLEyoM72ofyogHgqm2rcJpjDqRR?=
 =?us-ascii?Q?qhTZDIT91qry9lpKcyKS9QA39F2Bbx3jiea+7i6WzwFgWC/vUCkXptpxKf2y?=
 =?us-ascii?Q?a4JqQjduVleTmnL+Y35zaJlugJ70HhoG66F+tKy4Q5hHM4YrS1SqqHDG7ozD?=
 =?us-ascii?Q?s5qgXjrv94uN3k41eAtyBzlC4ZNjieuLLr6BnDPocLDb3oWPYlqfysJuhCas?=
 =?us-ascii?Q?dY6jeo/5mTt8FOehN/C/p9S8FNyCDsniOdP5yqsIOCPwWqXPYt9SaLKJlA+S?=
 =?us-ascii?Q?pGtIAUO1mGzNc/FKI+m6W0vgfTMcKpLhGv0KQ12zVnqyRXXmmCH+AI3apNnd?=
 =?us-ascii?Q?dCvqjTYwcViLghlaqdh2Gw2+ham6Lvjd6kqQd1OZoDo/k+i8NqOx+yXM8tvI?=
 =?us-ascii?Q?6Q+oRDqrbDrZ668qBs13TPxB3g+3jM69yYTbzf+YIpvETonBRv0fw5JH9xYM?=
 =?us-ascii?Q?PnbsO0UfMhp2PZZTHSII7Fr/5BE1NEuj8HApIO0oDeN+tlUMjpNGgxmBpTEh?=
 =?us-ascii?Q?jadNbQwGJfQKiYLMLE5u7+VKk3tHwTun28jU97R7072LRWqBgPa1ZRg/bLZY?=
 =?us-ascii?Q?HDAI8D7QKUnr34COwhmoDbNsOumIdJjdGZ807NUaENomIbf2jtbuZem7dDgP?=
 =?us-ascii?Q?mRBlOksWU2BSIeC10BcXIOwYv+lrfUife8vC6DI4eK7DMDAjaqkgnvcoup6i?=
 =?us-ascii?Q?7qoG052LTwEBz7He3thpmr+by2OASHMcHWoqenMgwENFVKK7/D4NdZXxC9Zd?=
 =?us-ascii?Q?fQD8UbtNP5BS00fIKW8xVlVPh4jL1F069e3MsuYTHVnKO/HrynfKZpe1e6Gq?=
 =?us-ascii?Q?Z7TXWvs46dqzz8DSFXh5oTzVrRrI5B5KedH5JS0IjzM52waiQlw8FowvJ//S?=
 =?us-ascii?Q?xhoiIY4yLTeEIElmIeTT58VA4+64h02WxGpsmNgGMGqFN3TE2exHAYQkzjE5?=
 =?us-ascii?Q?EQd/jg/msFLS6xCNEU+sERyA6C/S90ciXgl9QYNpygWrxenxdmkLfVxTugoX?=
 =?us-ascii?Q?RzZBc4NTKsTDH5bVmFTQUN6ZKIzLkbgIWdisCekI7AXBoG13olJ3GUrbLaL8?=
 =?us-ascii?Q?YNsZC9CJ2RhbPmR6X2h5dqTQFjZ0tDTalvfjkBvhCN9BVWi83M7VCxTYrg2P?=
 =?us-ascii?Q?iFbSycPUxkHLDqzC/ts8kPy0B5VT1QdtsjIHv6URQfolRxrhCYry/6VATnNe?=
 =?us-ascii?Q?CSqtHk3vpLlTV3kPBW580b/JLahHPVNcYWA69HfSvXnp3W/JrkSQWCLxJ176?=
 =?us-ascii?Q?h1nz9nqvpi1spxoSgfJh5fHWY91SMgXUupwzes5prg65r3tLSBh0IKBKFwXc?=
 =?us-ascii?Q?UraxY5o4BxnhlCVu4RLenVXwajNvbl+VHIUNutSvEIRUpKdGw7qPn0V96eup?=
 =?us-ascii?Q?NtLT8MeRkHdFAdokG4eYZtzoALZo8LKT3KQqkvknVbVGrIzyAu9REhPldyYa?=
 =?us-ascii?Q?VrPyHiJhohdWKBIh2AWTI4v6lbUDoWkWratVRzjqbqGNQAiBN0zqrjOL4WIX?=
 =?us-ascii?Q?0XbfhwAno1gOsLkapTyiRSrifRG2g7uosGXGoWDHdWsaIG+HchJHk0oBl9q7?=
 =?us-ascii?Q?sGSYf4vY7plh7OM+inxdb245qmsTxwORJiFbgqEue9ZCewOpomrpjdKf0vgp?=
 =?us-ascii?Q?1b9sp4TCY3ixTTXndrl9KNqyG/r/3f0YKAqqhJIOy9k6R+BkSI5XAtIKRBCk?=
 =?us-ascii?Q?+nwqHLKCQWrShP09KOZEhMDMTFJFNf4=3D?=
X-Exchange-RoutingPolicyChecked: S7pbWzWR6pv7upXzqUrVp/uHdyKANoyIFqsKUUxn6HnoY/TDO13/em1ZVriETfQHRwqHFwPyzKDp9t1u5pHFW0/5/qLaQHsoIIjhYxJIzdFACbvnsHDCd+Fu90kx7+yFSBBUa7ydTIdc+n0764qbMOTUYCEaZs8Pqd50/xteGFLnUWqM6UJaAJjIVjbzk/mb28K1cqMcmvGdIA2dQ/ess7MTHjnfx9/fa4RJ11cvgGNfWi6NleyCvvsx/o04zTODvPZ3MjcdwJdaCPqDRzjOU35APBmK80Bh8Z087CMFqdArFH/oBQBdzMAyr51/8GNC5SE4piOBI6a6WgJFJuJEXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d96a9a-6771-4650-ba8f-08df1b71ca14
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:59:24.6924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXJ2JLgFEOS0xJN7qH9KYN2wQM1vI/lM2JNRHG7IB5q2uw30dAW1HqvQGjVaGkV05qtpkaHgx9kcIG3S9yaErw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF5812CE227
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

On Fri, Sep 25, 2026 at 06:56:42PM -0700, Matthew Brost wrote:
> On Tue, Sep 22, 2026 at 10:08:03AM +0530, Himal Prasad Ghimiray wrote:
> > Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
> > the prefetch worker so each backing BO is moved to the LRU tail during
> > get_pages.
> > 
> > v2:
> > - Guard xe_svm_devmem_lru_bump() against foreign device-memory
> >   allocations before casting to xe_bo: return early when
> >   devmem_allocation->ops != &dpagemap_devmem_ops. A shared
> >   device_private_page_owner can hand us another driver's allocation.
> >   (Matthew Brost / Sashiko AI review)
> > - Add stub for function (CI)
> > 
> > v3:
> > - Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
> >   references dpagemap_devmem_ops and to_xe_bo(), which only exist when
> >   PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
> >   (Sashiko AI review)
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
> >  drivers/gpu/drm/xe/xe_vm.c  |  1 +
> >  3 files changed, 38 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index f39e647512ad..018836ecbb06 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -9,6 +9,7 @@
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_pagemap.h>
> >  #include <drm/drm_pagemap_util.h>
> > +#include <drm/ttm/ttm_bo.h>
> >  
> >  #include "xe_bo.h"
> >  #include "xe_exec_queue_types.h"
> > @@ -1625,6 +1626,35 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
> > + * @devmem_allocation: The device-memory allocation backing the range's pages
> > + *
> > + * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
> > + * the dma-resv trylock avoids inverting against eviction/shrinker, which take
> > + * dma-resv before the notifier lock. A contended BO is simply skipped.
> 
> This kernel doc isn't right.
> 
> - get_pages() calls ctx.devmem_fn under the notifier
> - the notifier lock is path of reclaim so dma-resv can't be taken under
>   the notifier lock

s/can't be taken under/can't be taken with blocking under/

Matt

> - dma-resv also is an outer lock of the notifier when memory is
>   allocated + migrated
> - in practice because BO is private (dedicated dma-resv) a trylock
>   should always work unless it moving elsewhere, e.g., eviction
> 
> Somehow tie this all together into a coherent kernel doc.
> 
> > + *
> > + * A shared device_private_page_owner can hand us allocations backed by a
> > + * foreign driver; skip anything that is not an xe BO before casting.
> 
> s/xe/Xe
> 
> Otherwise LGTM.
> 
> Matt
> 
> > + */
> > +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> > +{
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > +	struct xe_bo *bo;
> > +
> > +	if (devmem_allocation->ops != &dpagemap_devmem_ops)
> > +		return;
> > +
> > +	bo = to_xe_bo(devmem_allocation);
> > +
> > +	if (!dma_resv_trylock(bo->ttm.base.resv))
> > +		return;
> > +
> > +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +	dma_resv_unlock(bo->ttm.base.resv);
> > +#endif
> > +}
> > +
> >  /**
> >   * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> >   * @vm: Pointer to the xe_vm structure
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 2ef4ef026ccd..585ad64b672b 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> >  int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> >  			   struct drm_gpusvm_ctx *ctx);
> >  
> > +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
> > +
> >  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> >  					const struct drm_pagemap *dpagemap);
> >  
> > @@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> >  	return -EINVAL;
> >  }
> >  
> > +static inline
> > +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> > +{
> > +}
> > +
> >  static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> >  {
> >  	return NULL;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6b793ef31537..0fdc740f1a41 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3260,6 +3260,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  	ctx.devmem_possible = devmem_possible;
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> > +	ctx.devmem_fn = xe_svm_devmem_lru_bump;
> >  
> >  	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> >  		(!dpagemap && !(vops->flags &
> > -- 
> > 2.43.0
> > 
