Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE7C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 21:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2010EB81;
	Thu,  3 Apr 2025 21:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqf988zL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1543610EB81
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 21:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743715775; x=1775251775;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ALGFA3huXWe/5FJmcFccuu8w3wYpNR1owUZAGb16epU=;
 b=mqf988zLU1sI7DncTxycFsU6uwxN9oEWlKVw6g7xGtoEWYx5lhfckIqB
 CkSRiaxApXEEi/BnUCH7hhttVg0S+95ERPVnVDORHvsL1WBR+XgY+OUOW
 9KeczbuPo/RUHenVa/5HcUqsfHGDBokIv9GIJulTsXLCXGaFGhbwG8iwc
 MkD8MycSuH2WzTCMoaKTMh80SOBCgkQgZPDCAUrrUs8f2cUvhxhQWxRlK
 KlMhUG5PvPomfHcKyfEpCNuynaPgcUgP+6EOyx6kuIRI+CMavcwOjPaxa
 /6LZNLKkqnZWID1YMw/+55qomwRaTidv4Fb8u0/pxqN3DPDvFuFsfKQsI w==;
X-CSE-ConnectionGUID: L5tM45EgRZK1c7gdrpXGFA==
X-CSE-MsgGUID: ssV/t1oITjuoY4j3vOY+uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45165355"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45165355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:29:35 -0700
X-CSE-ConnectionGUID: WVWMmthmSD+CWpX1jsfjcg==
X-CSE-MsgGUID: uLopBfvoRzeJdZNlvlbMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132255955"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:29:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:29:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:29:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:29:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRgn+qtGdGPrk6NwU8m3AY0okl1EzG+7ToAG3mN9sc0GeSBNZW5Coovgd0lFzoo/2vRWepbimwOnv8vht2idE7Sz4rGCvuPvMsjcnHiYyNdabUZ1YQq9iYm+GuuITkd/5HeQEGMJQE2kjKXytuk64MNlW7r4XRu5wGdFERftEoecUt+p4pDCRuoHbMUUjfDrrz7ry7wa+qex6+k/4HlT387mIduuQY38WikEHjSCz34Z2sqVM1Hgwix/X3dWW14U9lQCiKE4suXWivW9Q82ZBH4pZPvmXQePf5oQuiBFsSroq5X4+F4HUa5p1Vpp7qQLKE8qh9HGwEAjV9NAEduOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke2XW72wUKLcYUlKZ/20LQ38kZA6ssTy+A9PlYR1C7s=;
 b=sHD9i1HqXYbcieIa/kY0PLKu/6axFalaNxy6f2Z0t8CwGepisnP3WA8riuPOFck36eXPpRPDPqmlecuV6qh1EYUQqRdDjbwbplizS0P8U5LOjUz0VEu08RnE4VrivB2+65wtWuVg/vTQCIxCL4IziXzboAXP4lGbGcyr9SjYMUZcIaKbTt6I/cTiv9sZt2vQB7tr06aT50AiBpSQyxe3feYBQAtFPLm1ryqhp7ReMms/s49JyLUp+gPLf6G+mrdBJmguHaGoyxLiaqJdp9a/YA8KxK5hiVw2HzFbmmEu3pDDe4QEzfsZvxBeyWkguG/qC1ayKrp0kYW7TnvPs28mDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 21:29:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 21:29:30 +0000
Date: Thu, 3 Apr 2025 14:30:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs
 files if VF
Message-ID: <Z+7+BWPhD72Gulua@lstrano-desk.jf.intel.com>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-4-michal.wajdeczko@intel.com>
 <Z+7vf3ejc0/r6yRf@lstrano-desk.jf.intel.com>
 <83f0a79d-3eba-4e87-8e53-6b5767dd92fd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <83f0a79d-3eba-4e87-8e53-6b5767dd92fd@intel.com>
X-ClientProxiedBy: MW4P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: a222d105-135e-4b16-8bb0-08dd72f69ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlsTgjHn0kpHUMCYw3H4ixwMUsYzJkTg6BiP/ablakV9z7PbG+7ouBiNBhDR?=
 =?us-ascii?Q?JqTMtbZZJLuCJOJpLz5ENM7NvAuyEYFi8JasduMEKxSk7EQVgPrTEQL4i4LA?=
 =?us-ascii?Q?5OcppAgR9TWvuG/AIRqGJOVWnb+3QNPCrqi2gfvxtj2F06BsWdeR1OCOGAVA?=
 =?us-ascii?Q?y/ZhKdfbg7onhsP263H63D+QYw55r/pdXCCrK5vITXf0tDlCnmaaMGJMskis?=
 =?us-ascii?Q?b52fwQs2Rkxn9+H//gMy5AsafV9H6UpQ0yGmSydYJIOgsJZ3KGFIj04dL5+A?=
 =?us-ascii?Q?w0LX85QuA1z7U6wXdbsC+wCXJgp4x9U6DOgH3+uGFKrIryjrLQMvRucfp/zi?=
 =?us-ascii?Q?nbmuwLcJxrz7AAsM5g4h/0KezK9k3RmJND7I7lmfiUotkaDxQqCG7oc9rk1s?=
 =?us-ascii?Q?zCN2f5Qa/iVx4dnDU6/pcNh6OspBaAsGLzsPl+kgpTDhGZ0CaL89VKkZ9vB+?=
 =?us-ascii?Q?ZF+x0EC0sndXjA4S9bxC3uFyo++sx50z8d4DxO42dBA4a1fEgrYELx2lA619?=
 =?us-ascii?Q?cD6bYb5+1FqCI+02bMRMWfozwIAK2FVj5yHC5o9cvb1qB639FkvA7k1Afn9g?=
 =?us-ascii?Q?zMn48JB8czyQpjJ/vcOjytIpNWJnWcSXk0aZ+GfRaOCjtxCPVcbTyHwvb6Xz?=
 =?us-ascii?Q?728RhsVHmcvXluXBOeflMTscelbokZVKbHUfbuonnk5Z7vTU8PKhRajql6pv?=
 =?us-ascii?Q?UpNW7sPQ/ZUGg9DQ2CiGS3lKoZGUlCGssybDWr6LTT8bd9/c939x7b8g4QFm?=
 =?us-ascii?Q?lHpiOE6DxH4e1cgJo9vKzwqzHb3xVzZ9RH3xid77b5JLlDmiSZvbNim38usU?=
 =?us-ascii?Q?LISgmYGfBSWiPRg4J/RzwXce9KIaYPOJgE+lXU9Oi0TgOBLPRL1Y7gyvTdNQ?=
 =?us-ascii?Q?/IwXFRjssnIhaG+fwfMCi8+nkE/Tvkrx3TE79F7euCgq79x8nGg3+M9Tz21L?=
 =?us-ascii?Q?A6eC9N3dV8Z7nTVrsg/zHuAnlTlCcsNqUHuLhzxTIP6zKk0t7s7NWAiPle96?=
 =?us-ascii?Q?lqejenTbQA9mxSxwMff36kTvKT7DIMLh6wZbuTaChi1By+hK1F39TYy/cHNR?=
 =?us-ascii?Q?m5EpgwqtJBLzBTveK2HjgeecCoH5o3C/xK28IELIMwm5bS0Agos9m/CyNs75?=
 =?us-ascii?Q?HwgD5Ga1Mc6x0hHHvcxSrBGrQF5502LiBGl3NyS4HarQ7WeuS2UloRzIfxHh?=
 =?us-ascii?Q?dKHL9zKmealizqhIGyPdWqxcLigAOnLrhrEL1nOBM2jxSdkPopO/tI0nrvh3?=
 =?us-ascii?Q?/BLwfIuu38vKTHCKZs+8M72/dP68s7ylI9gNXrQpelL+dQHTpcAIGANL+bsj?=
 =?us-ascii?Q?mLK1dK5n6itD2MseZIb0cr+Z0VG4N118YGW+ZHNslZx0A2mE6RamvJUCWxB+?=
 =?us-ascii?Q?CRiJwxcbsNJAQr/aGuXrQNn8ZKBz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cur22mS6INuevmpKXFfMXZd11Yl04hVlT8Wxz/xim0Kx3cNa7VW05aXFR0Xz?=
 =?us-ascii?Q?KL8lb177VGWDRx2UxQ7rn3annqByialZxx95RYtNk+yWlL7LlmTRAwY5sTuP?=
 =?us-ascii?Q?JUT/6XvVVItJPzSwJ5Zfryw08Iplo4XmPr28ByDnTNzGVwlTQ2O3kGVZQ5ww?=
 =?us-ascii?Q?CP2RXV07RZoBpfIGDQzU8hbJFTsUO00fSfh0BZ2dNReXEf3E8FTYbSgU80QR?=
 =?us-ascii?Q?pJOEhtsNIeoEl5tBjdUu0rNHbUhiwFjsuxyBcgb1fEpTe54G9RgypQJodfXi?=
 =?us-ascii?Q?GSwRU3rw2mShH1sVe4VJXH6wXbCQaVX18zdvrQjcLtmpK5Un/wpauyLqQuD3?=
 =?us-ascii?Q?gEcV5G6po09826KkNJuEUV8Ca1rquic30rKpzZoU2GT3QQp8yQgO0UOkljDY?=
 =?us-ascii?Q?hSCSZ7QFeL7Pvq/P+j5dvk6i0zs1wwNHoypTRuiLrn4XadjBbx/O9CpFiCUl?=
 =?us-ascii?Q?7TCa/tOhivj+p6E5/Ri/N6XTfio8nBguW1aoLG9TrwgYhp4gM6129DzSjWun?=
 =?us-ascii?Q?kxkr8FGcV2BPWvfbYTox8tS4qVfqtgb3mRRrFFg1+qg8uwFPf/IfOzBZeyRb?=
 =?us-ascii?Q?DvWCqLO3ErUli7Em1gJtv3xEth/+ndj3qXdanuO8EKlF857RF+6+xMAnANIj?=
 =?us-ascii?Q?S2NLdqYoq0KYwTkOMDQVU+vBhqJsbIXWQh7642/O6VNv5fWTxBfrVwWAEALH?=
 =?us-ascii?Q?G7fIQUggLEutOIM0jQdZ25E7KoX0optJg1BUv3dVUSw415dm82TOeqdT+lNZ?=
 =?us-ascii?Q?gWOreHAxcBTd+r0tkfud99UJSqXNaIJaXli8wNhjAWZjHSN9jwUIVpsy9JtG?=
 =?us-ascii?Q?+WtWHY2GzCEjrlYcYz81AEvsiE0qOMhhrig0prq4A7VWRZHVF3VLIGuqU5RR?=
 =?us-ascii?Q?eIbStEN8ik+XzAADvsQxKJROlWK1nSYHuQaxuJ2dJ5S6FQjhgtpm6+BFLLtg?=
 =?us-ascii?Q?sOXs1rRsmWeirG8oxl0Fq2psxYSaG3Uf5XeTH6x+YIeWTzLQLbLX2ASrlaBq?=
 =?us-ascii?Q?sccsRPyEpqFamR6UVobqPtk9UHIrlabniBQvA5/eYjvbiEZtdETANdZ1keSI?=
 =?us-ascii?Q?vm+MJMqBrNj0fFwMaKfB21Zweb+cgHXULPe741Jnck2RIpam5QaaGUjEeotY?=
 =?us-ascii?Q?HwiIRurGwq8ZUk810aathoWnded1Qggxsu16tFc/zCsoGp+9St1GZ1winOtm?=
 =?us-ascii?Q?UNkyIORy0Ea+UwF9obGDbegSIm18aO4VW6o1hjCmESFitCK8h5kxkEzxL0aW?=
 =?us-ascii?Q?C9iPXxRz44cECBMBNnOjMPg+qyjBqqiKnhR9uFyF97IV3Ggedqn87LeHsAQB?=
 =?us-ascii?Q?WmGFCiXg58klGn4tEwWXHjT4OF3FJV245nj12CL9cVJAyXLhHf36Xoa3pdeU?=
 =?us-ascii?Q?glv+YHIuqzMKjqOjRhNE7CkQ2iypjVh9vVJgFbXeXo6OdLTg34dr+STsj+xI?=
 =?us-ascii?Q?OlVQrLj01gTxs25wZg1FcYPrU6z5HMVDpEd3lw+P2c2ibehN2oz41ko8pWD+?=
 =?us-ascii?Q?tYwT0PoxnaLkZgS56fvwjEXfh5rdvilUO6gAx25GoWCYSf7OrV2aEy8IoFtY?=
 =?us-ascii?Q?E3grjKwy7Y1qC7Y0MkjC7QoTslAJwgU1D0hSM97wLvfKIg4Jlsb58DaBHx67?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a222d105-135e-4b16-8bb0-08dd72f69ebf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:29:30.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzEfAEOXOp1xbKY6ZHyZXnAgcEcoC7W0EQuvYagx+qeAS5HWdwq97+9HDuRSuLx3BxNNlGJvAZpN+7htAiLzAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
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

On Thu, Apr 03, 2025 at 10:56:10PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 03.04.2025 22:28, Matthew Brost wrote:
> > On Thu, Apr 03, 2025 at 04:26:35PM +0200, Michal Wajdeczko wrote:
> >> Some of the debugfs files require access to the registers that are
> >> not accessible to the VFs. Don't expose those files on VF drivers.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >> v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
> >>     add hint for developers where to add new files (Lucas)
> >> ---
> >>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
> >>  1 file changed, 22 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >> index 2d63a69cbfa3..a88076e9cc7d 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >> @@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> >>  	return 0;
> >>  }
> >>  
> >> -static const struct drm_info_list debugfs_list[] = {
> >> -	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> >> +/*
> >> + * only for GT debugfs files which can be safely used on the VF as well:
> >> + * - without access to the GT privileged registers
> >> + * - without access to the PF specific data
> >> + */
> >> +static const struct drm_info_list vf_safe_debugfs_list[] = {
> >>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> >>  	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> > 
> > Probably don't expose the reset ones to VF either.
> 
> why not? from commit 459777724d30 ("drm/xe/vf: Don't try to trigger a
> full GT reset if VF") we just use H2G action VF_RESET(0x5507) to
> exercise the reset flow as applicable method for the VF
>

Ah, yes. The above commit will ensure a VF can't clobber other VFs.
Sorry the noise.

Matt 
