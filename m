Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D3FC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 22:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A617110E2D1;
	Tue, 25 Jun 2024 22:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5o/bJqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5110E250
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719353575; x=1750889575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vVSYSvgcq05tBXuX5QuZFwIzPA0YuEiJERbWyxUfY/4=;
 b=Q5o/bJqBSTMlOSifn2gY1y/ZwBqL5bETJnww5RC5DlG4YZiwSQ48H3BR
 NqP/4RIf/GFKnBRao2rov2WMldl9iLfA7JtVX3UIMZ+eRH+EGXo0M571c
 cAipLfYdKS4Wmnc3lEJqkkPjExHP66qq9P7+vSAkbHBI1Zmopp8fIu8bD
 yUwdy/Xp5b7Sr/gaejkf5Pai37SH8TJiGAnFWGq6EIJQ726wA/xwGao4S
 Cm7DLhCva9BP2iegvwpRCxrrV2Tyu+E5QuD4CopwM8NLiJynSwFsEw1U4
 S5/NqRqPfQsfe2G+AVkKh22T8EYeyeIdnYxEWlT2jlmOsjoWYXwYHCeVh Q==;
X-CSE-ConnectionGUID: kK3T1YIqQl2ji3WpW0RlZw==
X-CSE-MsgGUID: 1CCL88+0RzOnRmFg5OZY/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="38913093"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="38913093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 15:12:55 -0700
X-CSE-ConnectionGUID: LBOUEKFsQMqY0mCEeXkNrg==
X-CSE-MsgGUID: rmAEbN8ySXyvLDUyIATA0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48237598"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 15:12:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 15:12:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 15:12:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 15:12:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbURuSoF0SoSCB7ou+O5nQxl6hIGWyW4srciVqeXnK/eq+6+WmUr65AcapC42slQcll+OO+cASl002BZQGCgd7/Re3qFsjU4/QXVR/kSvemLIV1vJXvzbcMXsJjEdkJZG628lvgw5de41NpK0Fdcbf83k82bPbgo40NMt6n8aq0igTTV1o6UZcXeAIP1nXUAXJZtk6vaqCYQVSdvTUBuL34ghXF4/OVDhletQziDTIV8OBr4ev5g0AymYT7PuWM7a+/JyOUNEyQnzEjzbIJ6CWRDsgUWEKsUYXnqCQPIBapV9xj2bGx/kg8zT22lbqLTy5E60hLYWexvq3RIV6hRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKGVkBlTzZln5djkC4gOy1T94u+KZ1uDD6vw39h2bZ0=;
 b=TNs+IMHcdVY8bR8SPVPdWwTkIpb3ekmEmhzMrOsbfEbfrnxHGBqsi0po0owXvmReJibxUr7fJavKfuRX6lZRSuuMamdmJnmYsyhdszhmKl7v+qvcg/lKTlEkvl776c7BWramwDKJ9NAVOGtw+1azhcBEBcTFrLk+1E8H0CwUhgnM3WoKWcaD5JmecbXeo++gSER24WAwqdJBhTrFLHTJvZtDIVaj7a4370D+1sL4KRyTmNMglBZDBXqE++FeMZjxePArtlOhVr98xpR+9fLDVu4PDIbrbYp2pdKzrmz6osOlCKNvPKP8h6uXT0srBdGkop0l0DY2qs5oPMxXc8uByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 22:12:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 22:12:50 +0000
Date: Tue, 25 Jun 2024 22:12:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
Message-ID: <ZntAuUNTiHbYENzS@DUT025-TGLU.fm.intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625084947.30869-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: cd91d4a5-6424-427b-b868-08dc9563f297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cIJtN/n/v3LnEo1dlrSpkXRZg/g9QHuFOtMyABSG3iMJAntXpJi0+mGCImPs?=
 =?us-ascii?Q?e1tHNhFiFKw7qAWoVTwL9U00eDqM2upcBtWOPTc2FihqgYlOXXqniRFi4rie?=
 =?us-ascii?Q?9g7EM9AF0sWCf7yy1rYA/5rPY/MQzgGvRusyGvXQ0pbq3gIfA+05lShrS2O6?=
 =?us-ascii?Q?KS8CEFzKc20A+oN3JzA2/4uYpF/zM1VoKWm2yuCCVetekI7d+naXcAr4zskl?=
 =?us-ascii?Q?fhOoYIrWzxeqOlOZXrXp1sSFp+UHvMsKvLAunbBA9SmfIjysPHVMOPV7nkdD?=
 =?us-ascii?Q?KsQK28m9B8UoU4ePTeCi4YPRoscp/fiGF2r+yQ9VsHpt8r3ZWseY/XB22mD4?=
 =?us-ascii?Q?mLP8TFmWXfE4Jus4md8/5M61GvMkaNx2TwXEqbzUrmZ1MS7BznO4sGzNiasy?=
 =?us-ascii?Q?ElsAfQ1K6+B0os2ztGPJaibehoyz9nw4eirDFcDXz19lKZx5DgCRk34DJBuh?=
 =?us-ascii?Q?jzr9ynUrDM0KvK9M+xp6is7nLDcMGre6qyS7rse5p4HGs1jcagxhWb1KYAfE?=
 =?us-ascii?Q?qvcrx5SG46wh5kX7bx5qQmgVIe3VamJSvjE2fNMexMhVOjEDsHdjo3YR0hak?=
 =?us-ascii?Q?miKc/RW8qJ985o1APPPl32wPn3kfN3bdg8v2+tWq2gf8nGdIkU73s0a5Y5Wg?=
 =?us-ascii?Q?ClBPV+dqA0eaKlPMp41PqTX+KNTl7zua86TIDWQi4qOrSyRyo8YGV5aGYsdN?=
 =?us-ascii?Q?rs0zU9EMuESmxIGvid+z3Gv9Db1shw31Oip6oi/bBUqeuqclwpxcJKrLdQDQ?=
 =?us-ascii?Q?XkR0+WOuf47XSeKAthw7pD9eKvCm1tGgyHtl8Xwl+Xb18/1dLVEbYHrIZMr8?=
 =?us-ascii?Q?Mn33PCxfe8dyAmZwMfOZWegaE7jpToIwTpX5yTf+sIA1uN+kneTIUgL4XsvW?=
 =?us-ascii?Q?o2yXfkRtbMDNv5Q5QbWJgbIC2pT7A0kgDc1AKYT7YjcklRnx3BuwdZ+OsD7j?=
 =?us-ascii?Q?FM92xdjaSg+w+r0PSpkKHp9950+9OBdgO1tNVCGNVaDh13IhJL2Dn7QDJLHS?=
 =?us-ascii?Q?kcpNEXS6peBGQEtHaNEdpEebVDiPt4kHV1eFopfaWo9xN6tY+7hCTo8kvI7i?=
 =?us-ascii?Q?FL0r+EwK0YsVF3ex1xWMv7MxwKDAzGvGB6ntiPcnKsBRJw2V282m9GQq1WXR?=
 =?us-ascii?Q?MBk8n8etNJ2ua3k64b1X1RFADEwYex/PYue33tqYdA0j30Vbcf0VLP5pjjR/?=
 =?us-ascii?Q?ZfwlfQycSdSvSWSkUibbMPrwWwbzMx35b0a+B9E3tf7F88N4RGFE6q2EArmL?=
 =?us-ascii?Q?2uUe8dqmkPMU9RwGh/oE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GA0rzODDwshBlvY1Ajo8ALCgPwl4fOPYM35KYFkY9vDrpFqv+Zfa39+TOa9a?=
 =?us-ascii?Q?7gKxlPuC+dk+e2GsuY8cBhPgJ03z1UZRZTcDpcaE6GeDU5sPQ06ZbHNp8PVN?=
 =?us-ascii?Q?9O2dY+5guHr0S9BBo8B6xwxHWRWtd5co9+ulIrwsJ3IuDlAk+fyPBn2RxlMj?=
 =?us-ascii?Q?5ERkSEbtIWDfYOMq2VQRUjGqiN16Nnz3hN1DYEGFA/N3wQEjeS7GZoNMFbMS?=
 =?us-ascii?Q?OUjBs5dSb1CoHNzEi9rEqJwYjbbmyMyHtAh/VHQcLnnLGPecWTzYIvcxUmvJ?=
 =?us-ascii?Q?c/EwY7S+OuTSJhjvGxfwnTfNAhHj99Gt3tNTWgIDLIpiIgt79Qvf3Agl4pg+?=
 =?us-ascii?Q?r0ID73EXp0TNSji3LLV1rggFxgVMobnbKQPgFmcLbqjkt1XTokvcRmOVIMd6?=
 =?us-ascii?Q?oJZZ5hxov3iUGfFGOkVJ3PlcMxW7X2cmgtC0M2OYTjn6vOP0c9XpfCZl4DNW?=
 =?us-ascii?Q?oLGre2OwOk2PxSxTZCvoDFapvYBEOn4v2x61xkcLTS54vTODphRKoYjlaaMk?=
 =?us-ascii?Q?HWfguAYKKPy/fnLvIsCXR80TwA7M/vcJ7higvOYoexHVOpQaiG3Wl4T1BmTL?=
 =?us-ascii?Q?ME5GqklRj0ftcte/B+ad9car9RVZcaqRmJOKAI8fzo+DRtHeYGNHpmVxD/z5?=
 =?us-ascii?Q?xyM3AXjg2ApyMHOtDlxgqKDBaVxVaWVP2k0N0nz7UuwhycMnop7eS/jMLWp0?=
 =?us-ascii?Q?SpoIX5ix9U+M/BjVJsFx3GrC/OOmW3g8DllkFYo8/1C2ez1CqBIvQwii8APf?=
 =?us-ascii?Q?aR72cZKWgGXc+bRQsVqOYTWOKlwl85l7Cc3Lm6fAw5xkX81W/rXDdv7NWNIj?=
 =?us-ascii?Q?D3380c5bDA3Ei5e2ZYfBf8neLtY7t+m1nvBQHXZ9xQlntCczjN8LJwSCuENY?=
 =?us-ascii?Q?UO86urye0PN6c7v5d86/YBd36pRBbS667R+7vAS05yVu07uxddDk+vl9JViq?=
 =?us-ascii?Q?3I2rzuf3TgJQ3F1bJQHBH1Ji1H7cVJ9l+Pn67xFvvyaa42clRqCpjSyWO7vT?=
 =?us-ascii?Q?Zn7ZVq5/82gdl1A4wH2HeOXwgNijnwvdGeSZpoNv0tjQnQ4huFDWQb+eSXtG?=
 =?us-ascii?Q?MCsl5usbt2Y60FZ29eyuIJerR48PG8mqt2wiQO/ARDpJIYUyN5/MdRinFTBR?=
 =?us-ascii?Q?5c0p3eD7UwZZlrpLg9uihRzcz1fCddLvxJsCjHRrqPggNfCyr6dQOkrbe3dB?=
 =?us-ascii?Q?46Axx8I6Hme4akEYh/j3T7d8zSoxtIt9AovjSw2Ly5j16UlRnICPrVPIZ/rh?=
 =?us-ascii?Q?caI/1HopMCOsXs2rMkpRl2YDvBHMxvukhqscnHPEWl02fsSPy3xm6EaCwYni?=
 =?us-ascii?Q?3JzN1QNL23zGp44O0YHS1Y5la+dGmXR5kGNoITVTFYJvWvZ9N/e3lLDS/LQ1?=
 =?us-ascii?Q?wiTUpjstjldyae5f2/JxD2PFeMFKne4l7+Uny/BNIN62aCRFooaX5Bfi75h2?=
 =?us-ascii?Q?GMmOkCQQ95MrKtMAYzEuPHnRTYYp/OevOtPNYHJkVDmIK5Vi8kbXVMUEZ4N0?=
 =?us-ascii?Q?11vpgQ9mJ2wZW/NQW+bGUBaPXxqNESKKGNjQV3/BNztAXkYOxw9BHhlAxNJv?=
 =?us-ascii?Q?ZHYuxAJTcgOmePvtfyz0hhuqiUsAUvQeJWTbHpdC2cn6cyzztLRqBOiOKBxV?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd91d4a5-6424-427b-b868-08dc9563f297
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 22:12:49.7921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Unv6YpnSdRf6YqFq9mZsCqMK4MBCTJzvTI7dco1yLShu8E/ikCAcPLR5/up/p53t9CCaLnzGUdTYIvnqrE8d4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
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

On Tue, Jun 25, 2024 at 10:49:47AM +0200, Nirmoy Das wrote:
> GuC TLB invalidation depends on GuC to process the request from the CT
> queue and then the real time to invalidate TLB. Add a function to return
> overestimated possible time a TLB inval H2G might take which can be used
> as timeout value for TLB invalidation wait time.
> 

Not reviewing this patch as some reviews seem to be inflight, just
adding some thoughts. I will say that this patch looks correct as a
short term fix.

Longterm I think we need explore coalescing TLB invalidations targeting
the same VM when pressure exists (VM bind case, [1] should help here
a bit) or optimize out invalidations (GGTT case, at one point I had
logic in for this but pulled it out as it was buggy).

I say this because when debugging [2] I found that lots of TLB
invalidations can overwhelm the GuC to the point where it can barely
make forward progess on submissions.

The former is likely a fairly large refactor, while the latter shouldn't
be too difficult.

Something for us to keep in mind as a group.

Matt

[1] https://patchwork.freedesktop.org/series/133034/
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e1f1ccb01143..fa61070d6201 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -17,7 +17,7 @@
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> -#define TLB_TIMEOUT	(HZ / 4)
> +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
>  
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b4137fe195a4..e30c0da86acc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
>  #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>  #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>  
> +/**
> + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
> + *
> + * This function computes the maximum time to process a tlb inval H2G commands
> + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
> + * so this time is set to 2 seconds to be safe.
> + */
> +long xe_guc_tlb_timeout_jiffies(void)
> +{
> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
> +}
> +
>  static size_t guc_ct_size(void)
>  {
>  	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 105bb8e99a8d..a9755574d6c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>  }
>  
> +long xe_guc_tlb_timeout_jiffies(void);
> +
>  #endif
> -- 
> 2.42.0
> 
