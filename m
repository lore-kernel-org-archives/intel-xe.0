Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26425CCFA07
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 15:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59FA10E63A;
	Tue,  4 Nov 2025 15:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H51ODOZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DC610E63A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762271463; x=1793807463;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IabxwNFpD4dYa5j7COXMkbvPmV+xLf8scbWhD0QpDV8=;
 b=H51ODOZ0KxbFU63ns3jV9R29G9Mn6ybrQYfblxvG4zuGIrEmPpgfYOf+
 u9AZxn5g7W52EXbWJzs50HX4XcLLNzAVTGK4wQvRf80bvEf9rhTR0aZ22
 VE3hPNfb9ZUJIaA1lS8jrXcN1XpSVP+BOzupIQpLs+l1u710zt18iKR8G
 R6/oZ97LPjbA5Q9uCSMWnM2t+w1OFBhA02on74attH5zUlOI2wn3w8fmJ
 lF4x7iqSdfudSAi/NphuxHYriZEnQhJb8h5Tq2M8pTS0Zf/uus7jpPSoa
 qWqtUeOgDLzMfYanYQYKYhvG/ltQ08FmtAtghqC5KGOVfKaac55ljtg4t A==;
X-CSE-ConnectionGUID: dw96kiKtRKyfxwKQ5au7EA==
X-CSE-MsgGUID: LF6WTmF8RaW3kTTtDYPIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75479512"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75479512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:51:02 -0800
X-CSE-ConnectionGUID: emmsSxpuT+Gi81MfByjNuQ==
X-CSE-MsgGUID: QhvKgTZaR/ixxowER5iNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191282029"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:51:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:51:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 07:51:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 07:51:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO30giWXkO5kjy0RZXKLMkto+HO6dI9ItPxRD5rE4c1g9ercYhLUQYtXWvL9gce8suKyWpTvPdX0VceOyny1HS7E8NEDD7/uzSTBqDOVdHU5H5T9Vl71238cWEifreT7lSwmat4BJbCRTFBYWwPng2U4uE9toWOl146GeKW3CbHF2kdKfPyY0eowB4eCx1zTc0QinbzjCeooQAwEX0YyRPFXRtbnhCRwtVODl+TsQorETBHfI2YctTBMlsB2rEg76PBAFcBcvuyEeEUKfff0CM5pPmEoVt4hWNaAXCfT7pM81Eo4YPr8+d/Zg/NfzLlh0vuNfE5zKoISF462qveTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKBAZE93aNrfS0Rf2Diln7sLJCdxoaKPK//9BtDMGE0=;
 b=yH2K384hAdvgaocOCerMbUb4z6qfoUJWzkbe1hAQ8E2BoAdbXjoiseB4oNEFldPxFOOS9BzEcNNiRxVbxmO0yQX+9/2hJK93LMne9YTLyJ9JHFFLBi29tp3+6D65SK8E/ad38W46c7WZMuViyf1P5wp2tagDSnn5ERrMIggxk2emh272nqQDaxQ/fEgmTRaE+5fAErtNhMQ1Bx1XU0r7dgWFMOosUF00Vv3iZODwkZ/pfGw4P1NS+N4t0Nsdd4AFfrfN8+51aH+sHQnli7fHasqnUABCUMj/2t+tkXvydr7+q+zfQ4uH4VxmBC//eQxlGOfCc3cj4bERpnIvMLGptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 15:50:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 15:50:53 +0000
Date: Tue, 4 Nov 2025 07:50:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <francois.dugast@intel.com>
Subject: Re: [PATCH v4 5/7] drm/xe: Implement xe_pagefault_queue_work
Message-ID: <aQog2h+NLPSeK5Kg@lstrano-desk.jf.intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
 <20251031165416.2871503-6-matthew.brost@intel.com>
 <3tzdsapjzs7luwkv5pgmrdc6tuj2v2aphudijkib4jsf5uduz4@tbqopp765dft>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3tzdsapjzs7luwkv5pgmrdc6tuj2v2aphudijkib4jsf5uduz4@tbqopp765dft>
X-ClientProxiedBy: MW4PR04CA0191.namprd04.prod.outlook.com
 (2603:10b6:303:86::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2c9806-f088-40bb-a958-08de1bb9ef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?grOhOU6oBviTbKzyOsQ2NRx6SgRFjAOtd/WWZJBbe/xiAIe7LZ1Vjn6aqOkm?=
 =?us-ascii?Q?y964u/2BmzIjQKZq3UKKJFdwcJeumXPpdcWjSotGCCSC9H0TpFei79FvBRrW?=
 =?us-ascii?Q?ctSZhFt4JKtlbNPbd4dTbaeRjGUvbNKL1W+ydihb3l7WhS/rMlCJ58QVsrXl?=
 =?us-ascii?Q?/kTFQ++qUKZ7ZTFurE91WQgbX01cIiCde1FyqsdKDoAPpR6ZjPeCc4bZtbg1?=
 =?us-ascii?Q?GjlFxBbuNLvZeSPXj4hHv54te5qlCVU0TvURL7lE6QWPW9GLCiccfV4yxOVS?=
 =?us-ascii?Q?B1tCxwhp6p8/jOG1MYKPTtCVvT2Ln2XPXWLKiv/MW/IWP9wRnIR4kpXFj61Y?=
 =?us-ascii?Q?VY30DBS44hIE5I8daaSh56m7hzM7nabs8xF0Md5bFZ2Ep+bIjPwY9dKn8osR?=
 =?us-ascii?Q?Fv+xoQYdOcWLzG/YxKMCbrxIkjCtb0YrlLJnQZWmBW39gvqkRba+emx22vri?=
 =?us-ascii?Q?baaIUEFJp0vScylriYldPzQFN1Bx3wP7z+qfn2H8ur651F3DMSW0lcZshlC7?=
 =?us-ascii?Q?4V1cHAgAjSpUC0NhjB7W71V5Tdo2GwA47sEkEVi19uffEflKGa4Y8UrOeQZE?=
 =?us-ascii?Q?Ii6xtWzVk4VLeBsS2ocy6U3eecsVhEBdTRznh517OQMArrA8lobw0xQnWMxk?=
 =?us-ascii?Q?jSVtCmWBG+FqnDKPwVmfGdwDvLTrrDFTRYRwqMoWD8Kj2y7qE41meBefljEC?=
 =?us-ascii?Q?AzT9nPwupMr6Py67j6Jq29lk/6O3w5E8/1LCgs13W1DWR1wJAbHD6kZ5Lpfn?=
 =?us-ascii?Q?BqvSfbw5LYGBIAwhq/WpYAApWhWjsIJJXlBRVoG0KlD+nitJVHLVTZ8muFK0?=
 =?us-ascii?Q?WOr5vIlhMUMzNnhRQtTPONVQ05zSV334RjCtBMi64YEh2FT1PvM+JnB6jdiO?=
 =?us-ascii?Q?ofPg3gtElxJxQlJBbvwexq0E9RS30iL88/CaOkvxPD0gEWzCV4zltfEisqiu?=
 =?us-ascii?Q?1I6mZtuD4mVDqmve/VFx3F8kuC29uc8HGotUBh+tBCgH2/fCIzefpkdleFzT?=
 =?us-ascii?Q?8ViRsR3XurMzf99EprGV5W2E/LXAjMGcK81UqwgyTG5vKyfLh4fizCZpi6+5?=
 =?us-ascii?Q?yhaguS2JsbI8T2oqz2p/SQBqCIyMSPslkcrN6kMUxeLl8QADWJAd2jPqpIoA?=
 =?us-ascii?Q?kOeWdDaBGQIcPAhF7/1U2XfIyJMOjyQr9r/mXHTrGnGb7nAEgcTS8wTWFyJJ?=
 =?us-ascii?Q?o/nbFrR4j2hDHQqTD0Sl4bRYZjAI6NPoxqnwBl6uztIeH+1X061y4eF8Bc9h?=
 =?us-ascii?Q?Cju8YQJgO2mw095PhY53a7rlNlD+cM6NDfYmhHETO7NT+57lmhoJEo+70cNA?=
 =?us-ascii?Q?+np8oOA2RGYf3v+Z49odq88PS1/uL+FLmR5UD8sBIT5uXSbdR1QFnPWPEBo8?=
 =?us-ascii?Q?PEhw0Lv2AABF9Lcroi8CQkN1MJkQtcV1GWqpl8f2mr24LY67aZqL32svvKSI?=
 =?us-ascii?Q?bJcNN2jkmkIZTxjs7Jl9sZ850SPEUZPE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yA6LaeP2amRYAvxkFlIVevAbq5VFWJDLMTRBv0XazjdUEotSCCBwZaaY1/z0?=
 =?us-ascii?Q?WMOefgMrHFhRXx38PJdvRKxQ5qEn/CwrKpT2uGy+kNB7lFjH/1Br6bE+Ub3C?=
 =?us-ascii?Q?NJ4nw1+mOJyGdsinmcj2K+0ENy4QbPrWN5a5tPzvLUIFms2C40zSA/1TuVc0?=
 =?us-ascii?Q?wfSLpPbFYIgIA5FlS4ypZGzseRhyX3hKGFBPl+31nEMtkK7tftFlFMHka+8Y?=
 =?us-ascii?Q?jpx4plOHdHdKoNqrJ5XRxP3nXNXPsqNEoIetBY2zwxZRngervjmdVNpnp5Gt?=
 =?us-ascii?Q?SiZZY7d/PX8PFDn08wgLt0wtWDcC8ZvZyZ0ZXtc1SdsH2We04mB1F0pn7xyC?=
 =?us-ascii?Q?SZdNzLkttBOsCd6KoY112wXjOjk2xnhC4bIz1q43G6P3rhXVkqurrob/uicm?=
 =?us-ascii?Q?15a19UTEa2AhverCbkBhr4ZL+wQJv4dGPpAEVmLXnbxTmb1kHlu4qoiMPx7G?=
 =?us-ascii?Q?/cd3T9jQLHHnUxnNREbSkm/jiqmAFsvHIk/9IzI9vUjtpb/96U8B8NINg3hX?=
 =?us-ascii?Q?OY1qbmNK9MDsDc6wkx6fLC0fxzE175dPS/1FiRAVX3pVXlWY2U5z2HZFnYaV?=
 =?us-ascii?Q?IkYwUWhJ7oZ/bzdf8oOrk2+OBbpylQ0Pbt/8F3X2jPffTgiIfRWxsVOyPeGr?=
 =?us-ascii?Q?Dfd1AX/F1AqlPJ6wQ0obtLwgHs5QhijO5D6L1Idx0SgOwrGhhrF9XHU6TICu?=
 =?us-ascii?Q?n5IPJb58jNWMYyT/nsfASHdiPzws6xLNEeb5NKxvMYdHBUydio4Pxp/AmP02?=
 =?us-ascii?Q?HjNYb+Z5BKYrVD3KoouKJYA+7bk73kpdc0xpjb3teTv0Li8Qa47ac5SfY/Rm?=
 =?us-ascii?Q?azhNUEHEqBi9CjslanrlCv3Gu/3n+XMVYApEEawTh5MP21ghgM8Po45RsQ56?=
 =?us-ascii?Q?3H5G9VJTBGwlk/611AWhGYVyFVD/HocrDu6yHWQjkx7L3jMhz//zmyymwEI8?=
 =?us-ascii?Q?Mrm7q9xikPVic3aX1f3z6NiZEn7SAW3Al1HCpEq0r08gHckd5D1daozxM8r2?=
 =?us-ascii?Q?xFHEybSD4Ckyc2bDzFw1MqZT8ecH6Rr+IJ7RAuQL2JgwV4GBjeGCjCz046wd?=
 =?us-ascii?Q?R4jDyIBbZ1ArcgpfV+Zg8idj6U5Z2V9qExz37YlWKQHnnsdx8vJmwx1yAK6s?=
 =?us-ascii?Q?tG5mdCS0r4RH+FTT32QbSrvFZ2Y0wlaAbn5/fV2fQwlR4+OIkboiMzCQXjaT?=
 =?us-ascii?Q?liZ+l31bDC7adRjeWoS8f9+EVkmqvGjMmhrUv8rxunJuQjTHOGq+jTHv62kU?=
 =?us-ascii?Q?frHLLGR380MWFlG9ZGP0IilIQBQKtwEFBwOtisrKufcGkLnVmz9s2JsE/84u?=
 =?us-ascii?Q?XCOUSKf52ieTIcEsCqskr1fhRDNl/nB6HG9lMzVflTHNEyJWfQEiEmTCqWcu?=
 =?us-ascii?Q?81k0yWICyh9VfSDr+e3Tw+Hh/ne8qrN8PRYQ2popVKhEY9HJSdXEGFF8AJLg?=
 =?us-ascii?Q?ABWyryIzmrkMeVDSDP9ABVbKhk+mjKm1lnCdqO/mlEoFzKdvwRhTi+8DhpzV?=
 =?us-ascii?Q?dqM5VTLbdm8K6eoW0hp6DfBOJidwbAGCgWs3O8fQ4lkyVOq/eTQ6K0pKwBCn?=
 =?us-ascii?Q?1WqJdHFc5tGrqbOy6mZOPOz+RoFL9K0onIXokwh1Pr9x4ElJKYMpWauaDJTT?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2c9806-f088-40bb-a958-08de1bb9ef63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:50:53.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm2c/FhaJGD3oO1HYEwy+U/rx3egaAQEGFWr9uX3HSqpAO4djxpjmgSw3wMvOk61UB5ntfW/BhJqAeR1UImWwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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

On Tue, Nov 04, 2025 at 09:01:35AM -0600, Lucas De Marchi wrote:
> On Fri, Oct 31, 2025 at 09:54:14AM -0700, Matthew Brost wrote:
> > Implement a worker that services page faults, using the same
> > implementation as in xe_gt_pagefault.c.
> > 
> > v2:
> > - Rebase on exhaustive eviction changes
> > - Include engine instance in debug prints (Stuart)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pagefault.c | 235 +++++++++++++++++++++++++++++-
> > 1 file changed, 234 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 194e647a8af6..3ac042c54e8f 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -5,12 +5,20 @@
> > 
> > #include <linux/circ_buf.h>
> > 
> > +#include <drm/drm_exec.h>
> > #include <drm/drm_managed.h>
> > 
> > +#include "xe_bo.h"
> > #include "xe_device.h"
> > +#include "xe_gt_printk.h"
> > #include "xe_gt_types.h"
> > +#include "xe_gt_stats.h"
> > +#include "xe_hw_engine.h"
> > #include "xe_pagefault.h"
> > #include "xe_pagefault_types.h"
> > +#include "xe_svm.h"
> > +#include "xe_trace_bo.h"
> > +#include "xe_vm.h"
> > 
> > /**
> >  * DOC: Xe page faults
> > @@ -32,9 +40,234 @@ static int xe_pagefault_entry_size(void)
> > 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
> > }
> > 
> > +static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> > +			      struct xe_vram_region *vram, bool need_vram_move)
> > +{
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	int err;
> > +
> > +	err = xe_vm_lock_vma(exec, vma);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!bo)
> > +		return 0;
> > +
> > +	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
> > +		xe_bo_validate(bo, vm, true, exec);
> > +}
> > +
> > +static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
> > +				   bool atomic)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > +	struct dma_fence *fence;
> > +	int err, needs_vram;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> > +	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
> > +		return needs_vram < 0 ? needs_vram : -EACCES;
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
> 
> I realize this is a copy-paste-diverge from xe_gt_pagefault
> but this goto backwards is ugly for no reason.
> 
> it could be either
> 
> 	do {
> 		...
> 	} while (err == -EAGAIN)
> 
> or a separate function
> 
> 	while (err == -EAGAIN)
> 		err = try_pagefault_handle_userptr(...)
> 
> this can be done on top though.
> 

Let's get this in, then rework the logic a bit for clarity.

Matt

> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
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
> > +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> > +	drm_exec_init(&exec, 0, 0);
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
> > +					 needs_vram == 1);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &err);
> > +		if (err)
> > +			goto unlock_dma_resv;
> > +
> > +		/* Bind VMA only to the GT that has faulted */
> > +		trace_xe_vma_pf_bind(vma);
> > +		xe_vm_set_validation_exec(vm, &exec);
> > +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> > +		xe_vm_set_validation_exec(vm, NULL);
> > +		if (IS_ERR(fence)) {
> > +			err = PTR_ERR(fence);
> > +			xe_validation_retry_on_oom(&ctx, &err);
> > +			goto unlock_dma_resv;
> > +		}
> > +	}
> > +
> > +	dma_fence_wait(fence, false);
> > +	dma_fence_put(fence);
> > +
> > +unlock_dma_resv:
> > +	xe_validation_ctx_fini(&ctx);
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
> > +		  "\tEngineClass: %d %s\n"
> > +		  "\tEngineInstance: %d\n",
> > +		  pf->consumer.asid,
> > +		  upper_32_bits(pf->consumer.page_addr),
> > +		  lower_32_bits(pf->consumer.page_addr),
> > +		  pf->consumer.fault_type,
> > +		  pf->consumer.access_type,
> > +		  pf->consumer.fault_level,
> > +		  pf->consumer.engine_class,
> > +		  xe_hw_engine_class_to_str(pf->consumer.engine_class),
> > +		  pf->consumer.engine_instance);
> > +}
> > +
> > static void xe_pagefault_queue_work(struct work_struct *w)
> > {
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
> > }
> > 
> > static int xe_pagefault_queue_init(struct xe_device *xe,
> > -- 
> > 2.34.1
> > 
