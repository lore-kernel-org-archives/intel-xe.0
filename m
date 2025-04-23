Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ECCC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFD010E6E3;
	Wed, 23 Apr 2025 17:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6HHl+b/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61EE10E702
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745427850; x=1776963850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UkokO5jPyF1MPi28Of34YA0LtLZA6AMJLSFwlWeiCPc=;
 b=V6HHl+b/WFRpPuXXMq7/pomhR0LY2Occn91R1AohZgf3989Os5ibuK1L
 N5dDXMOp9tlYceR8AjGbSoqBHhUanV0LP5rA9Xq9LuSOraCANxia2YQHL
 CVYJWvrYCpk/+iXUu6jb8PReCGcBGIPB4iJ5/QH2zM4viYJgUsmC5vs7D
 8qhhai38rz9yhkGZAsNCWLJRrRpynhKsozQ3Nq/iY8102cXayf3Ev+5b7
 +OgAzeXSOi4dmzLTBfq2kaVyLiv9BOhlI4hUCxRevnl2TC8uFStw+Lyzn
 plOVuw9594WtMtCLe9MQae4d+lVs0xAoppdUu+MCbYiesqsG/Gt9vUdiw g==;
X-CSE-ConnectionGUID: bB2yT1FAQ3uKABmNI74/Dw==
X-CSE-MsgGUID: XNVv58EMR2W3NtwdTt31nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64559295"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64559295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:04:09 -0700
X-CSE-ConnectionGUID: zVM/FT7wTqyHfLy7/H/O3Q==
X-CSE-MsgGUID: clTrkaqESW2BPAWCKJ488Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137454553"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 10:04:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 10:04:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 10:04:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 10:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDWbOR8oK2RRo/Ai/EyYiRuTGu7CXcT/S+PhWEeAiKTBUDeOFqUitGsz7o44y1tD05SB6PrRz+Gfb4hZkJFE7FKy0YE1Q/mRiG74Pv0jPjULA5fmF3Xe4VUUTPz2tNdBWv3UpTgZaEP8zH4wOFFoTVs+nf+Ms0Jwu/N/w4TY1e3jheappkUIGRDSiNTX7Xn7EPKsx2CCMNYhY6sS6I+GIDW92inoFzGgk0FNjaFuaYqhZg69cN7i/UtNws0ekLVL9mhYHs0CsMNnX2wTP6sjojsKkW2WnNnyJTGHOTsyl1skuXSL9Jf/9WZLtj5fRnRntpc6OYNaYGwUbj5hv5Fe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrZajO8wRinROsW/GZGi8dN/rj8dmL9cRht3IdDpACE=;
 b=tW0+wODhNw8aUCTe8d0spXK9j0Trzf3OY0UCv8YCQOGZZowNRJZW0k/X8SYkRVfdQSDbTGg3R3aI9e1njHwY/+aUFnke4kqT3vquYamQgN4NFH/hcMnvLNiuVKj4cqZeVooqA4qGrIh0XLPvKvq1Dlhpmw7sGPw0CGsk14B1UBS6h/qk6hAI2dCvS3iQcVjxkjXJOBu1h0TwTUDF8qaTrta8d1kPQGLu4tkfOlGNCVVumpYFYY4/CabbtpNmXOlsJ7LrnuEN6SY0vCGAZ53hH8/+ThhLKgLZFEelbkeQ8ylsTirDyoGBxub4I21ONxqe+KV06PgWJRHtDoK4EXdlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 17:04:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Wed, 23 Apr 2025
 17:04:05 +0000
Date: Wed, 23 Apr 2025 10:05:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jagmeet Randhawa
 <jagmeet.randhawa@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Add page queue multiplier
Message-ID: <aAkd1Xj9agANM7ZW@lstrano-desk.jf.intel.com>
References: <20250408155915.78770-1-matthew.brost@intel.com>
 <d5luza26lh3incrhbi5idyautyt5c6in2h66fvnpwvliuzf6tt@fm644orm6pv7>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5luza26lh3incrhbi5idyautyt5c6in2h66fvnpwvliuzf6tt@fm644orm6pv7>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd5853d-3447-4003-a256-08dd8288da89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cu4qaOcTPMlwIYdiwtP4eD8e3VOR0Dz5Eu+7W/UqMfGMsBeGRMsIC2PbtrL3?=
 =?us-ascii?Q?5J4xYMkNARAn5h/z4TIHU84GvY8aKc9FAHdrbZFu0PLA6i4jEVDbM2TGTxzj?=
 =?us-ascii?Q?ZOS7buynvGKdysomvYa7DNDtpy1/32pFsMy/8Ej8qSO77Z1Za210xrnJNckD?=
 =?us-ascii?Q?yrHYx5aePcANITkPuvZ+TMCVgIXg0FSAW9b/Oeb2TxNPui+Tuff8WCOCICpK?=
 =?us-ascii?Q?g7fsTDSO6nNayEPy6SmQl9SUw1oU2jhXumg5xZJqTxdOKNg96upQZ0UpJT1k?=
 =?us-ascii?Q?eUR6h7ZOv39/ME40z1EXR19E7DErTh6RlEeTOQIW0RceZK/EBgJG7WkWvt2N?=
 =?us-ascii?Q?fCBuJBl+uTq/n9QCn5ip7xmIVVjdT/hBHCsEmGdnFNieV3IlXll1v7sQknRP?=
 =?us-ascii?Q?2oTaKyRFHL4WY6EQb4z8IieYQqLD40QwoxW49/Nx8OALXL/+381MOx5cEad9?=
 =?us-ascii?Q?b9SUZCLnDlJNlG+GMzi2YNHvXMtQZe9Y1U+tKSCBN9WxqW8zDiZysCTMFGB2?=
 =?us-ascii?Q?R+OdXXuvctf4LK9epLt56cPvBwbjJQGEO2Gm+V2UJnMYPaJam4953mcAhZ7U?=
 =?us-ascii?Q?NDDJwDk4m/v0mrPCL/CqFgJswwytmEO1JkOQehFwdVIwdQh1EbjA/giTIxt6?=
 =?us-ascii?Q?+eAOX35J8WUttsEJcvl6z43QpJmnno5yT1UGzjqVaJG1y5G6Fn27PBezyoJb?=
 =?us-ascii?Q?JRDiwF+6KY0aFlIdx1gZDZ2Hd6tFMNxKSwGDQd8SiRqwxb2GY2AzQRzLHg99?=
 =?us-ascii?Q?TZrWw48dcIDeEcgwEl5V0boFJZ4/5LtrwbYhTtKL4bCrHTFaFHaL0WRfGshh?=
 =?us-ascii?Q?nbYlHEzP8ZuOrT2hHtiR5gjSbfLegn7o1o/9qBm/2IeIdZylFP0xgL7Fn4rC?=
 =?us-ascii?Q?51iNbFZMNmYq89bpjBL52a0uvXRP1vAnyhEs9oZRQNCiRJczwWLBdvM6cndR?=
 =?us-ascii?Q?IEBNnMZ91do3XYB+egNzHSguynbFL0NVDOGSFrneiB+Y6HK/50N/0aaPc5eA?=
 =?us-ascii?Q?itTcGWYwpbNwBVu8acOqwMOdYP/ifP1FFP0gLeUFsAmJ/MyXCq88rSjJoydS?=
 =?us-ascii?Q?Rr6lZaRmFZhcCjcqLfHauy+xPfCz3TYVRm6fSrsiH6eIHDbisDDJzXOV8CUG?=
 =?us-ascii?Q?scUV4e+69h6PO6X9uo5Vd6llkNPfpt1YpbTAQiQVHS/vev48m4m4sYvG8uPD?=
 =?us-ascii?Q?RzjlhC+eiiaz0Wc618S0XHDTYdpzD3iiDTz43TgOgQq6ZGgMyrqsVndx2o/I?=
 =?us-ascii?Q?q1Uo8CMfgliTwNBwH9Q1vLfvZoHbAyKP30qbDJ8J24AfB2cfA2IC+cqFU23i?=
 =?us-ascii?Q?xpG3LL+Nd/6YaPxW0MJ3JBp1Z7IRMv6bQe4CkuUgcSJ76VLi3gNNM+n1+5tF?=
 =?us-ascii?Q?68FUecitP+WaXonJ9WMZ5nmu/S2uP8DMNL+peFyGyXL+k/gVuLOMJL4H0LSd?=
 =?us-ascii?Q?HTaJe7hEd4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y69wl/YW5Fvz+WUdOcAqBa2jq6pAnJ3GB/g6hlJD+d3um9fBYEl23zFDZk+u?=
 =?us-ascii?Q?7gq5LYmdtwgYaXFhdVXWFt/ILI6KCJ7j18PhLB77oQPoBiPKSDkLV9+c79sC?=
 =?us-ascii?Q?92g/Oni/NCnA0xL432RVGnrfxV8lRc1KeaqMnP2cEXWOz3WoMEW0oqb8oMo8?=
 =?us-ascii?Q?I3fVOTC3cEAQtvvhiRVmMi/LgMjBwPE0YfI6KyDElSyp4QYuVYSTIJo6LouL?=
 =?us-ascii?Q?K4LwBudgFEnZzwNJjfZiByOvL0Az93Zn1kAvdm1EvFsnn8jPzBxElO19p6wf?=
 =?us-ascii?Q?quOGl+GQRHN0lXJld6dEt66TeYRWxK9Dhdxt+bkKEoF8VTZJYH6oB4o2E9dq?=
 =?us-ascii?Q?vywWo3JNDQhH16lDgNEuFG5X57jcQyIvfKN4kWBips8MXoV1LC9EA7IbkqwF?=
 =?us-ascii?Q?WGJIqw/B07lI1y8mjDgq25NUst4aeXNywRgTCFbLj/Bqowy4itpYxl+ib5DD?=
 =?us-ascii?Q?Tw9KUdadE+ZKazHoPkXtHy42cyI3YiIcrReKfowMyRq2c0Hsc/mZzROaaV4I?=
 =?us-ascii?Q?a17/u07HdyBy9vBkUDPIPp1KPUHdlB/rTO2MNfi7ItmFSXlx4pV7qF9ViSd7?=
 =?us-ascii?Q?7fZjA1JYcc6LtQcKwO0qIvf1HmR+35eQE4vd7SuioBw0bhGwXlb3tCUFzuVE?=
 =?us-ascii?Q?bBA8ZimL/vfNx+XzJigU/VuB95vc0ge11gzhm8eSkVfrdNxcFe6fsTQF+8L1?=
 =?us-ascii?Q?GtZZR6WG8RfmvomAc1HW7bjAFtbH3mrEMn1IwB83kx6VKO6w8Lg/Y8epJgjN?=
 =?us-ascii?Q?Fm502A7i7EIASk/HYyFB7oI3bv/xMMIE8FuW1ZB7jM6sccZ3e5QUdzGQ3Cj8?=
 =?us-ascii?Q?vJqYQks+ajMUcDlvo7b20rcYywwForKlgfgdc3xn2zhk6DKH/pWZoO27t+OR?=
 =?us-ascii?Q?gDnISNgRuGtDHSCV7C8s0qpart8WhrNfmhut6TtNerjEbtfX7KqWwMsGgAvt?=
 =?us-ascii?Q?NZP7BAoHDvqlEEwWHsmaVex3Rn36Z+qtLUhMtZa1sfOGboVc1koF2B3c8oe6?=
 =?us-ascii?Q?JprH5w3M5vnQ0uHBMKb0p+ZIuj3DWs4AfBLFG2+Kme/znJHHopImQGl21W4J?=
 =?us-ascii?Q?I/h5HdzHogE0bt5sb3snORAZqLMrY+PUkeGY2CFhZIvE50biyTNVBUHQ0+MU?=
 =?us-ascii?Q?cmMM2LwADopPB3N1/AZ7D5fVBCG1sGbzJfhshbIjVQVMYj4PyU1ql/FQ81CT?=
 =?us-ascii?Q?cgZ+dyZXYG5NIpZ3j9zOAD8jAJ3wCXlL8aBYREqs8ShzJ3s+T3fG5QWpkSuw?=
 =?us-ascii?Q?CGrrs102lrtWALGGGqXr80fq8KSWOJEkHOpi3gsT088SFWTV7HgdWSHqBewY?=
 =?us-ascii?Q?DU4yaoFJid8sJS0wFdHWtl42TpNOvvIBFyrxSTBdr6+xahftic/bgJgEjPiS?=
 =?us-ascii?Q?ZzeYBeJrS3tqWIe1bR3aVk8L0+qiiHSgdIZ5/RH5MavBY2cRCRLVFkEe2xyk?=
 =?us-ascii?Q?vus/iabKDfTYmW/BjgkmE0YeadrN/e6CIN6gpp8XbMQBdeX0hfCAHbefahOQ?=
 =?us-ascii?Q?xG5ZpjtX7sbtK0Ny5SCtA2N6Fu2caqJ4bKFbUKptaJmSi3BhoHZEuPfrAsrw?=
 =?us-ascii?Q?f5Q6yRcNvABSgaF29uPQ2mjqkqzn08gzjof2pGAvAXN2o6InIzDOuDZv5uIz?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd5853d-3447-4003-a256-08dd8288da89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 17:04:05.2079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ev6fbP43/RCEzv6GCoJK5QRgBDK+pWvOzFP6k63jhvhElaefw3HKMuvXE6pmkVRNbbXOeaWelzU0yL+79lBtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

On Thu, Apr 17, 2025 at 09:00:50PM -0500, Lucas De Marchi wrote:
> On Tue, Apr 08, 2025 at 08:59:15AM -0700, Matthew Brost wrote:
> > For an unknown reason the math to determine the PF queue size does is
> > not correct - compute UMD applications are overflowing the PF queue
> > which is fatal. A multipplier of 8 fixes the problem.
> 
> Sorry, but that seems a terrible justification and I'm sure having it
> "fixed" here is just a recipe to let it forever like that. Could we
> spend a bit more time understanding the root-cause?  This showed up
> on my queue for drm-xe-fixes, but I'm dropping it. At least until next
> week in the hope we have more clarity.
>

I agree this is less than ideal. If I had to guess, each EU thread can
fault in parallel (i.e. upon EU thread fault, it context switches to
another EU which also faults...).
 
> > 
> > Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++++--
> > 1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 9fa11e837dd1..10622ca471a2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -435,9 +435,16 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> > 	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> > 				XE_MAX_EU_FUSE_BITS) * num_dss;
> 
> So... for Xe2 we have eu_type == XE_GT_EU_TYPE_SIMD16. Would that be
> something into play here? You said 8 fixes the problem, but I don't see

I tried that but original authors of this code suggested this was
incorrect.

> anything about "does 2 fixes it? what about 4?"
> 

4 is reported number from the UMD which fixes this. I went with 8 to be
safe.

> Another thing is about 	"threads per-EU" as documented in
> e.g. bspec 67165.
> 

I'm not seeing anything about threads per-EU in this link.

> > 
> > -	/* user can issue separate page faults per EU and per CS */
> > +	/*
> > +	 * user can issue separate page faults per EU and per CS
> > +	 *
> > +	 * XXX: Multiplier required as compute UMD are getting PF queue errors
> > +	 * without it. Follow on why this multiplier is required.
> > +	 */
> > +#define PF_MULTIPLIER	8
> > 	pf_queue->num_dw =
> > -		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
> > +		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
> > +#undef PF_MULTIPLIER
> 
> First of all, that XE_NUM_HW_ENGINES seems weird as we are talking about
> engines that are not necessarily enabled. As that OR between
> fuse_topo.c_dss_mask and fuse_topo.g_dss_mask also look odd when the error
> you mentioned is in the compute umd and we document num_dw as
> "Dynamically calculated based on the number of **compute** resources".
> 

I did not originally author this code. I pinged the original authors on
teams and they suggested it was correct even though the number of EUs
mismatched RIL info... So I landed on quick fix that unblocks the UMDs.

Matt

> 
> Lucas De Marchi
> 
> > 
> > 	pf_queue->gt = gt;
> > 	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
> > -- 
> > 2.34.1
> > 
