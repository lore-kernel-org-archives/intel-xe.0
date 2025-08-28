Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7C2C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF59210EA9D;
	Thu, 28 Aug 2025 18:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqrEZWEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3593C10EA9D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756406361; x=1787942361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CXIHmB9mdoRxqckLl0P8DRZviTA7vd5sSEqJZr73NEQ=;
 b=aqrEZWEntVt55JHekeepulxQ1VNV2TH8mBEsQCXGzyh3KrnFFp8d/mWd
 wMgeaSo2ltM5eJGz/Z9FwxmDPcAzqU3JO0WcuL+POYBbj2eCo+sZNRLMb
 +t1UJD4GZNLWQ/k1vePzI625cIu0jX4SGWxLeg8S0v9/taqGEE3WP2rhT
 pqRdkjh01JwMgYacUxd7/TsN6sM58QM7VfbxIjDDkrn4qCXJI2DGOynDb
 j339JUWy4/Ggl5e29DYsaZBxYIqYM5QH1bd+W/pUHRm2xoBbVLksFlj5J
 3LwilnbP+1SP/v1QwyTBh5HMQLYlxAhpJfoTXEPQLV1DV3V/PNht3twJ6 A==;
X-CSE-ConnectionGUID: dimGHk6xQFqG0SU/rVNe6A==
X-CSE-MsgGUID: DuYi47/yT2mT4DRr7NVbeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58615907"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58615907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:39:18 -0700
X-CSE-ConnectionGUID: v7WXTsdEReCR31oz9Yrdxg==
X-CSE-MsgGUID: +dCA2SjmSeKr98rlN42PRA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:39:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:39:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 11:39:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBq1xkpczyxhBdEsbBWMiDm+ArV8NqYyk4dK+cpbb11RK0UV+Eiri11ETdaXkJpXVUQH6dgX3aPtEkBSXSpK+qJnnlwWv1GET/bh2u6hVMsocRXeAMj9/gQh9b4Joh/MfmSlxjOYhGJ6D4T5o+sqkRi3h6BYDy63Pnl3gb2SjF8RABDuEWnGvH0lZ2MwhaSQXhG1/LG98ZHUSSRvZ/CBRXj/aiL1+m0VQS5/IFUwR44S1ampMvnOiCm5Vwp47HEU+IPjJ4H2yNOm8cHOGnXgQZ5e3QjGa7H+pK4UJNXi8do/W5u1XS9PxorU9Se+uxGKPHBx/gQJVZ4Vdv2OeeJ3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djaMp1qFtIxQ1AGR0sLb6IchFPBSpr6gumcHnvAiBAw=;
 b=gbmnVQBGG/hOWlixi6Zab/f8xL+cHrVOUASIDpdq1AUoAhFO5i9esJZasQdVasbV/FigmU6xkBwxeWqkM7IxmD08x6jZn0y2a5zsUa6Lpecw0Ins44ZJRoBP2lwSiDcj6P0idCGeqL2+Jf2VBgfmJRW1G/jBz3Dk68Uwk0ncSgG9WjjWzyJvMNKDngBw+uKCNKCPIoItm5QlTWBlcrVe4WA8xNgJMguxBsqJurB18PQKdqPqyTug0IUB4nixBDwwznNabPdRlnbHRdEO+0ui79sHyDGJNLsHdaQFdN7QYWYpRGPRF9y4bErTZEQls9diE1kje0mWau/NdbB2cRp1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 18:39:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 18:39:10 +0000
Date: Thu, 28 Aug 2025 11:39:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 05/11] drm/xe: Implement xe_pagefault_queue_work
Message-ID: <aLCiS8WFi3Ss6KYq@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-6-matthew.brost@intel.com>
 <aLBLkTH1wixn9e1Y@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aLBLkTH1wixn9e1Y@fdugast-desk>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5f84ad-e2a4-4570-30fb-08dde6622de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L6IClBe1LT9WFIfAsZZUH81mIP7EVHFEWPx90aP99cUeAKwoCU6pXGSWrVIM?=
 =?us-ascii?Q?i4jPbph94e6F2bVsg5uELZ/y5sUSY42RQnUP9cyJY0D4vQcw4ziZRHYIZXow?=
 =?us-ascii?Q?7bNkb/RVWrzUFMlgkb2op3ubCXSV///ePO2sXuR4ldoMU+TI0wxZnL4acKVQ?=
 =?us-ascii?Q?nheLEYZ6lu8rcRlXBA/jYIRG3JU4Vf9eGZAwYl0LcCsKk42y0vYLPgDaDwgL?=
 =?us-ascii?Q?zJrcn0wF7y7m51S+ICd8j6KaWknZS+22IbIiFXDeTzSL++0zHmUnbdci+dzw?=
 =?us-ascii?Q?eUfxoxhxSsrkE3A5BfT7NuCydJPm5rE9FtxtDIlAmCrHI+H/zWTCTFm3D6My?=
 =?us-ascii?Q?hZOaTw6YNAeHTgq//Yp7QDoqRC+iK9yZxMHPWmfwaqDkNKkTkoQuaFZfryAD?=
 =?us-ascii?Q?/aRFUnP2BbpP8HXINlYxYPlgYgB8tCADxU4Bc+hk2Wj5LqgjusMhjQCv33ZV?=
 =?us-ascii?Q?BItBSdRojnA/1pZccBqLaXRrig4WwDt/UGITpQKZE5x8foRFUeJCkA7rzQPi?=
 =?us-ascii?Q?oyLJfBGIYAbt+MEqkHd5a1IsNsr2WAXGirlOMikA+6gVzfZ9IVXFztDbxiGw?=
 =?us-ascii?Q?FgHfGRTaLwVTuWZ51kO8wVO0ziviRng0oAEu8RMu6BPWPihykAq4ApWjLx2m?=
 =?us-ascii?Q?M20ss9fGbVprO66ewkeGhr+yyV+k2LRvcxBpkjDsXYUBtpBgunCnezxUGO/E?=
 =?us-ascii?Q?BqisgHeXOe4rFGtX3eRPZYNRTOVNuqVB9Jdm03KJ/eXrFpTrJRScmOukUSXp?=
 =?us-ascii?Q?FCeP/Ivnhlxqgbnjue77liPf6Co3ek4x4khJXDjU6fDWeXB37bf3djo2JGE7?=
 =?us-ascii?Q?TxP2xVAzQ5wOKWEi/rFTxfSVZpqa5QNTzd9s7+XhkPyuTx236CVRCEQlr7/V?=
 =?us-ascii?Q?J28mjYIrcG1ljpoqnxg1caTrBuq2fSp2KNBFaoAapGdws3NiNUB2WHIyPvce?=
 =?us-ascii?Q?Hg8stcPAsz4/ejB1ZsORNGNoXIQdjnqtV9Y9EbdVWinnmTVsdG9f0cnxi1kW?=
 =?us-ascii?Q?1HDoQrwTS8pv1a0cp6A3pqnjaHNIKjSNseaCLRpGGQ3pTI3WTbj5xwZZMoLy?=
 =?us-ascii?Q?XTYgP9Kt52T+pu1t8OJfeVy/bperDFtuCxSzZ8xxxV9CL7fIWwbaEq5T0VKx?=
 =?us-ascii?Q?usOvrlBEyRzuBtBWhhkO5WrAsYdkwmmvUpVuv0RSxuZmmVuAP08R7lxPWG82?=
 =?us-ascii?Q?20b6ajcX6Qfcvdd8KbhFT2NhAzF4JZbklI+mMJIbT9I6MbR8j9Pm0oSfjJ8L?=
 =?us-ascii?Q?FImBPjqGYtkkHyZnN16jxgCSCc93gB+NgEN21SIBK5Y8jwRv+y1w7mDZ+q8R?=
 =?us-ascii?Q?ArWngA9wNpPp841BLLzNGUH+2JlzvrIZDjSLCYs6h+Zd0dlxBwt633CGI3zd?=
 =?us-ascii?Q?LXoAGnyUwJMtSPEFLvOb5jy3tzasQhxjAwRTedvEBMrMgk4lLn7Jb+fNpl+l?=
 =?us-ascii?Q?dVTu0E6GjQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7VyvOv+P6LVjVo9UXuXhG+srnOWd3s+yFd5TELlvTRNhXU+erXvKlH3aiSA?=
 =?us-ascii?Q?79xtLOHMFjyg7yoLEoNYVr0crlgXdUad9n6Q9MxalNJHPQuPpilAxiVhsqD7?=
 =?us-ascii?Q?SPK5R50bM+YZUGLVX6vJSXqDIR4lcaplCKjYX79VJHCcUP6BVesSaVlZM3jS?=
 =?us-ascii?Q?ZYn3c+4dHDp0XXG8oikYxsn3iaPIlP0cdSv8LyT1r5VEi/NibVFOzmJd3Jy4?=
 =?us-ascii?Q?V6T+eY79ABsk0dlzoAJKiPzLEZ4MtctFWy7fKp+M9H3JhbQsBI6dLVbbtsWe?=
 =?us-ascii?Q?IVMLoHghw7F8Am83xFEW5ydWbZu6Nqx0X2qjM+8T2m5FycuRzhsJCuqwzWpJ?=
 =?us-ascii?Q?Z3QM+YpZzfBQdvh0C+RRBywVd8OX/kzwZL2+AU+6KCoyMYp6XIWq3qZgd5+W?=
 =?us-ascii?Q?HsnPXNk3+hDjzZPlbexQTmujd0gIBHUGRyQdX13JGL3D1OWrYI72txlyQReb?=
 =?us-ascii?Q?8+h0kurngfomsuj+EpEwRKAuB+sp3SPbKSIpnvHVdt22CK4BaXyjr2qF12Ba?=
 =?us-ascii?Q?/JXJZJxJ581miVIIHRx5uwBxc0Ypu9YfQ9afggcxMwo+qly/Hi4ugmtaTfFB?=
 =?us-ascii?Q?cJqhZF3uGB/tRpsrXIdWuh2UWxpb2fQ+9g+p62Q83ZtK3H83pYypGRGLkj++?=
 =?us-ascii?Q?Dvv159H22AYug6HMSNDkpxTLA+lwyXtgro/7gFleGeNYCz8I0DDLDcaY3wG3?=
 =?us-ascii?Q?EcvHCgSpS9azkltJEMr3dciQoSLlsomFl1xi8JF+mK4+AyaVUWGkUctnyjoN?=
 =?us-ascii?Q?6JmEioYPfQDnuqCMYQZF/SkUxTTMoJO1kNizT23po+6/ulvifzPFgL0cGLsx?=
 =?us-ascii?Q?wmrvIN+9wGr+HA488vLedFv2E38hwUNf99iII6BYKxXvK11YcDDX8gz7L51L?=
 =?us-ascii?Q?T2gQAZDXPDeMEs/bg6gH7PuIJSIJF1WNBDFnW8cGjqLYu/nhn92R+dUzXRtZ?=
 =?us-ascii?Q?6AwFHISfoN5ws5ZpquXBT6iocqT8q6XKFoi0Qw8RRXopWhjqADiXHexDgtFf?=
 =?us-ascii?Q?uH9bUA+pe4NwsxbRT2X89Kh7o2dAmXt/TJgvknwSaIelJBz40wrayLfpPl50?=
 =?us-ascii?Q?UXcOARWPtGfYqTWS1I4+N0d9phQff92MhDGPN+eC99cQ7Ne5xvefNOT0flM3?=
 =?us-ascii?Q?pV+rzxLR86k6EIUbCB2I51ywsJqPJ35qpncKpEooKkbZXDinxblBC35vSRXz?=
 =?us-ascii?Q?9/4c6gyBd9e+/HaqmtMd57d7SI9c9aY83MJCGRq3RZ00AxHEnGOUwyJwMMgA?=
 =?us-ascii?Q?ewmf1YxTDdp4kuYK1XvLpQD/h7CSM8glWpWJ9rGu8f18/XLrJsSnCquiL29H?=
 =?us-ascii?Q?7pC/JUNRhXk96IQ6AgAokJDsYu7tABXc9dH2e0XnXLpnA3HDOs5T6VsgAQdl?=
 =?us-ascii?Q?KOuYuPYXG49oWRrt7H9b+ahSepCybny5gXiNn/YnZyGOpkZ5+LfAUR4ktxfS?=
 =?us-ascii?Q?ZYayhvKJXPfO7M6mOREPOqNyu8qfFK3eS+wy2/rzu2cibIx5WpJsK/8+evzI?=
 =?us-ascii?Q?guSJd7k2Xmx9VkYJQ0b1IZ7Ho539uGz3yLHwmIN8WQS394Z3ryzTppCS0ZuZ?=
 =?us-ascii?Q?MnfXdnNB/H/W5+bCHg6XnB+HhtKkp2t8Eloa/tah8CP6nWb9lmiXy15yiA76?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5f84ad-e2a4-4570-30fb-08dde6622de0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:39:10.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkfghfgxPHSBjzGAJdlFjmjObVgcWduK9WgxLpDBRxuwbq6MLY7W+Fpo6lVGvtyS+m4fCwNVxF2m8xxVihkZKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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

On Thu, Aug 28, 2025 at 02:29:05PM +0200, Francois Dugast wrote:
> On Tue, Aug 05, 2025 at 11:22:36PM -0700, Matthew Brost wrote:
> > Implement a worker that services page faults, using the same
> > implementation as in xe_gt_pagefault.c.
> 
> Also the minor refactoring and cleanup along the way helps readability.
> 
> A few nits below.
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 240 +++++++++++++++++++++++++++++-
> >  1 file changed, 239 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 98be3203a9df..474412c21ec3 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -5,12 +5,20 @@
> >  
> >  #include <linux/circ_buf.h>
> >  
> > +#include <drm/drm_exec.h>
> >  #include <drm/drm_managed.h>
> >  
> > +#include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_gt_printk.h"
> >  #include "xe_gt_types.h"
> > +#include "xe_gt_stats.h"
> 
> Move up to maintain alphabetically ordered.
> 

Yes, will do.

> > +#include "xe_hw_engine.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> > +#include "xe_svm.h"
> > +#include "xe_trace_bo.h"
> > +#include "xe_vm.h"
> >  
> >  /**
> >   * DOC: Xe page faults
> > @@ -30,9 +38,239 @@ static int xe_pagefault_entry_size(void)
> >  	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> >  }
> >  
> > +static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> > +			      bool atomic, unsigned int id)
> 
> Please rename id to tile_id for clarity.
> 

Yep. Will change.

Matt

> Francois
> 
> > +{
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	int err;
> > +
> > +	err = xe_vm_lock_vma(exec, vma);
> > +	if (err)
> > +		return err;
> > +
> > +	if (atomic && IS_DGFX(vm->xe)) {
> > +		if (xe_vma_is_userptr(vma)) {
> > +			err = -EACCES;
> > +			return err;
> > +		}
> > +
> > +		/* Migrate to VRAM, move should invalidate the VMA first */
> > +		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
> > +		if (err)
> > +			return err;
> > +	} else if (bo) {
> > +		/* Create backing store if needed */
> > +		err = xe_bo_validate(bo, vm, true);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> > +				   bool atomic)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct drm_exec exec;
> > +	struct dma_fence *fence;
> > +	ktime_t end = 0;
> > +	int err;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > +			 xe_vma_size(vma) / SZ_1K);
> > +
> > +	trace_xe_vma_pagefault(vma);
> > +
> > +	/* Check if VMA is valid, opportunistic check only */
> > +	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> > +					vma->tile_invalidated) && !atomic)
> > +		return 0;
> > +
> > +retry_userptr:
> > +	if (xe_vma_is_userptr(vma) &&
> > +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> > +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > +
> > +		err = xe_vma_userptr_pin_pages(uvma);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	/* Lock VM and BOs dma-resv */
> > +	drm_exec_init(&exec, 0, 0);
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = xe_pagefault_begin(&exec, vma, atomic, tile->id);
> > +		drm_exec_retry_on_contention(&exec);
> > +		if (xe_vm_validate_should_retry(&exec, err, &end))
> > +			err = -EAGAIN;
> > +		if (err)
> > +			goto unlock_dma_resv;
> > +
> > +		/* Bind VMA only to the GT that has faulted */
> > +		trace_xe_vma_pf_bind(vma);
> > +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> > +		if (IS_ERR(fence)) {
> > +			err = PTR_ERR(fence);
> > +			if (xe_vm_validate_should_retry(&exec, err, &end))
> > +				err = -EAGAIN;
> > +			goto unlock_dma_resv;
> > +		}
> > +	}
> > +
> > +	dma_fence_wait(fence, false);
> > +	dma_fence_put(fence);
> > +
> > +unlock_dma_resv:
> > +	drm_exec_fini(&exec);
> > +	if (err == -EAGAIN)
> > +		goto retry_userptr;
> > +
> > +	return err;
> > +}
> > +
> > +static bool
> > +xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
> > +{
> > +	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> > +}
> > +
> > +static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> > +{
> > +	struct xe_vm *vm;
> > +
> > +	down_read(&xe->usm.lock);
> > +	vm = xa_load(&xe->usm.asid_to_vm, asid);
> > +	if (vm && xe_vm_in_fault_mode(vm))
> > +		xe_vm_get(vm);
> > +	else
> > +		vm = ERR_PTR(-EINVAL);
> > +	up_read(&xe->usm.lock);
> > +
> > +	return vm;
> > +}
> > +
> > +static int xe_pagefault_service(struct xe_pagefault *pf)
> > +{
> > +	struct xe_gt *gt = pf->gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_vm *vm;
> > +	struct xe_vma *vma = NULL;
> > +	int err;
> > +	bool atomic;
> > +
> > +	/* Producer flagged this fault to be nacked */
> > +	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
> > +		return -EFAULT;
> > +
> > +	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
> > +	if (IS_ERR(vm))
> > +		return PTR_ERR(vm);
> > +
> > +	/*
> > +	 * TODO: Change to read lock? Using write lock for simplicity.
> > +	 */
> > +	down_write(&vm->lock);
> > +
> > +	if (xe_vm_is_closed(vm)) {
> > +		err = -ENOENT;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> > +	if (!vma) {
> > +		err = -EINVAL;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
> > +
> > +	if (xe_vma_is_cpu_addr_mirror(vma))
> > +		err = xe_svm_handle_pagefault(vm, vma, gt,
> > +					      pf->consumer.page_addr, atomic);
> > +	else
> > +		err = xe_pagefault_handle_vma(gt, vma, atomic);
> > +
> > +unlock_vm:
> > +	if (!err)
> > +		vm->usm.last_fault_vma = vma;
> > +	up_write(&vm->lock);
> > +	xe_vm_put(vm);
> > +
> > +	return err;
> > +}
> > +
> > +static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
> > +				   struct xe_pagefault *pf)
> > +{
> > +	bool found_fault = false;
> > +
> > +	spin_lock_irq(&pf_queue->lock);
> > +	if (pf_queue->tail != pf_queue->head) {
> > +		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
> > +		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
> > +			pf_queue->size;
> > +		found_fault = true;
> > +	}
> > +	spin_unlock_irq(&pf_queue->lock);
> > +
> > +	return found_fault;
> > +}
> > +
> > +static void xe_pagefault_print(struct xe_pagefault *pf)
> > +{
> > +	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
> > +		  "\tFaulted Address: 0x%08x%08x\n"
> > +		  "\tFaultType: %d\n"
> > +		  "\tAccessType: %d\n"
> > +		  "\tFaultLevel: %d\n"
> > +		  "\tEngineClass: %d %s\n",
> > +		  pf->consumer.asid,
> > +		  upper_32_bits(pf->consumer.page_addr),
> > +		  lower_32_bits(pf->consumer.page_addr),
> > +		  pf->consumer.fault_type,
> > +		  pf->consumer.access_type,
> > +		  pf->consumer.fault_level,
> > +		  pf->consumer.engine_class,
> > +		  xe_hw_engine_class_to_str(pf->consumer.engine_class));
> > +}
> > +
> >  static void xe_pagefault_queue_work(struct work_struct *w)
> >  {
> > -	/* TODO: Implement */
> > +	struct xe_pagefault_queue *pf_queue =
> > +		container_of(w, typeof(*pf_queue), worker);
> > +	struct xe_pagefault pf;
> > +	unsigned long threshold;
> > +
> > +#define USM_QUEUE_MAX_RUNTIME_MS      20
> > +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > +
> > +	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> > +		int err;
> > +
> > +		if (!pf.gt)	/* Fault squashed during reset */
> > +			continue;
> > +
> > +		err = xe_pagefault_service(&pf);
> > +		if (err) {
> > +			xe_pagefault_print(&pf);
> > +			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
> > +				  ERR_PTR(err));
> > +		}
> > +
> > +		pf.producer.ops->ack_fault(&pf, err);
> > +
> > +		if (time_after(jiffies, threshold)) {
> > +			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +			break;
> > +		}
> > +	}
> > +#undef USM_QUEUE_MAX_RUNTIME_MS
> >  }
> >  
> >  static int xe_pagefault_queue_init(struct xe_device *xe,
> > -- 
> > 2.34.1
> > 
