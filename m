Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FCBC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 18:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3960710EA7E;
	Mon, 25 Mar 2024 18:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKHczxzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA1F10EA5C
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711390241; x=1742926241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L+9r4upilUDYGENDcuzNE+XUXofsLtt08DNzaCzE8J4=;
 b=SKHczxzfbGG+ENhUbpzMTRPMPAzuDGTLR+WIxe+nBZQfsVKdOBPU2QVK
 0rohScD0evXQOOsJjRXYdYOxja2k6Tzth4DeXr9fncmGAf+eehb83ELHi
 8mhA8KmN83H7QUZuM3omuBKSrrXhPxSvysl1iQRLCRZP/kTpYFFVlDcOc
 fyvz0nWB8nX2LGnPJ9jc2WELUc91zMdo8BbR2qH2qRczY8epni1DRcU7f
 IZHPYBdWuAe1swfVZ58zkb9b4otHz2X+yUSM49GcYKMwN/uKvlAo5JJK1
 tTMlHZ66M1BL5IwrmhxXjB8cXyIbQSWfFKLYcO/u/PMVWldwWMKGrI3u+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17042850"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17042850"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 11:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16371258"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 11:10:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 11:10:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 11:10:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 11:10:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz39nlycx/RQtyWgNU+CH5oqbE6RKkxsegiOvy9hSdX9j7yr+FCOpbUMuOPqZ8hiw5EPqnH/Br7R4HFlztwv9GDoEiqw8LHzmQ3yz+6MCsArxYM1bKcAFw7Geuu8pejOUrxdV3Bz1eWxzbqKrDdncrm4z2QPFKNDSJXL3pnhqwfEAQzpQRwyVV9uEJ+nY5p0L2wmr9cBTuetrUC4b8szLhsy9ktgdl8AfYUO7GgBiUeGCvWVQ1yX/uJ+vVOgOrTYmAh+HMR8eU0wSxEZ39i+tjObuX4GWw7HS+JhEda+gPk+GXZkdsVqSV6b5+iXpMbe/V3G+2Xg3imbFcDdDEmqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtUewu+XqWPsKxDVUIHpdC48B5jlEvNg2x0SSpoSZLg=;
 b=HNOJuurXLnfHaFPj4UGhi/KOKJVZo2P7M5IuaTKhWfxBgW0vmMw8VedN76LyIS54+1fvFcUPMrbPKmapIuGD3tanXbQjGaYc8OZLq/zzhgof4O6wiEpl9UQ2Skd0HvTlnnk0aRdWMlCT3QIDtUvztRt2mztBrssTi67Ye9npQWx0wXwcEQcwhGreGG9DRJOtQWSBPph90haroYC8FAbNUqUib+gQ8C7+m6XpWQBwmJdq9fLmiYybPdqmbJmtrTvtJaIPvgXEc3xzUOWaCfsGnvg40LsuY3GTVwsqWGI6FGUvf/mxDU8SEmRYQrsBNVRVryKdSqqZOQeyzRRSUXTDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 18:10:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 18:10:37 +0000
Date: Mon, 25 Mar 2024 11:10:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Promote GUC_GGTT_TOP definition to
 regs/xe_guc_regs.h
Message-ID: <20240325181035.GA718896@mdroper-desk1.amr.corp.intel.com>
References: <20240213213634.1437-1-michal.wajdeczko@intel.com>
 <ZcvsAxWzSAy_TEFs@intel.com>
 <a942292f-33cc-4d63-9733-217c614d7505@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a942292f-33cc-4d63-9733-217c614d7505@intel.com>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 1475fa58-e11f-4799-3992-08dc4cf6dfa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zns78/ZI+5wSLpJPOjp2IZPfpDKRvkc22+3eLqdeaaXhYH9Sr3BYLWG/SjkSI7JBPJ5N7rqfadTNyTWK6rn1NC8muEHkVPkyeOJyc2tXMsQzWBefNcTzYlmACDcxnaXeSmHGIhMKA0MVqLNhFK/EGNbvk1XQFvY16tnIVArhWFUUlJVMg5GLW3S/XiCvTUbIyGLGBGrKnWomn68iMF5nqggulMW8iWYCrou3saLlwNfgSZw2F43Jb9VjyeSC0pMHar22XVXbSFypxiYc6sNwKmD4F/UA/Z3wkoPqwkceBiscItOGJjjs3Fae5M3ByvVFl6OzcC3HnZT48HJK5NbH47EDUoWgb5o2TqtEvluyx5JlwRc4QHg1gF0yVCwdhpvSAQ7b0dNumWciIn8E4BJkCprcTx5O1jTumB9HrVSuYHnSq3YSeKgg0iTPNIAg2Ohki01bgFiDDtdI7uelt2v0gKYG33KH0lpOP863MJ+frak8HTGwssWkNc/t9pXz1urQ7WNIuFwY1RWCXl/JDBKqQBkaeHPwUdEVjAVtYfOUzIior4dL+s1n3otRR8sopZNiolM+2out2eArpBtzo0F/7Xx7XEz/9xs5TGlWkU8//8Zx9c4or7Up5YnXXrsN1nCLhNcfFK/8Gzzag4Ih5avBd6SfH+6bLEsM1qrnkFbCM00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KSM2uhHlFRbRLMa4pL6W+DkdpODztlSuOWDLYrQ+zPHPRv7utOpLGxgiOwwW?=
 =?us-ascii?Q?ui+5+tAJ69RokVm1gXYkigxv4LtB/NXEQsb9pCGJC9ED/fPol47yOP040YMk?=
 =?us-ascii?Q?f3JrWaONWdj5mClAHudh1XHPg0J27JexVJUc3wfF56nmX8eoPCWdERQHD3DE?=
 =?us-ascii?Q?LyL4DMg7va4/MxoX9EIzBP1EoHMLDDW2XkKjJApSSZunMjYJYsGcOYYul+RO?=
 =?us-ascii?Q?CReqWq0TDZLtpFaA4iR3BA2KcxStkbOOyzkMmelo4ljUpBlaMhtV9IXucqXS?=
 =?us-ascii?Q?SzvG3QL2MCTd59cqCZFEdqmGXdnRw1iEp6yGUANzrGkD+5unl76BAxB5qIuT?=
 =?us-ascii?Q?xWHqNHyZXthXjiBwFgI32Y0iYi642Bw0SKkRmVyMocuCmry0N2KNYKhP96vM?=
 =?us-ascii?Q?TJethX5aArp1ssjhqbpiJApWD33c2/D2N/VfEdqg1pOIK9+CqP8cfR0EYmNr?=
 =?us-ascii?Q?hnKWNluTDIz74eLJd/NM2w/+FriqyqD08krcc+a36xDTm+r9YdeJwbm8nrcq?=
 =?us-ascii?Q?61T8j+ZFOZ63Zl8MK2PODm/mr1KVOp+DTmaGznkC6wuJUpru/Y1RaUv1FLRT?=
 =?us-ascii?Q?Emb9zVFY3Pykf++WrUT9TYMVDI/RvDUkTZZwUSjnCJR9yeSVeUBDeKkxJ5sJ?=
 =?us-ascii?Q?yTP8jX3g56hpfBuUlLbCNc7na15w9c6FyL0D4Heds2EG8uQ6NTS06OjlgeMP?=
 =?us-ascii?Q?SaCXwnIkkVBxUjtM1CWqv1Fkc5EJ7PQkE8hXhrFmYXbaVqL8nsxDQ6N7hWyP?=
 =?us-ascii?Q?kdnll3Y6sfQUjg7DkrysgwZv7oHLQsv0/lZW64YjrSQGU0Qo/Ac7XMrHG8ON?=
 =?us-ascii?Q?71WRDgDC3yXW/VM/zE7XCVwp5EsskNfKJS6CbwtClju8L6stiI6yP1Jw9wWH?=
 =?us-ascii?Q?kiN8AT/ck67FkwFG4hHvow7ZOK28CA9c81/rDO5E9A7BfhhDTRyDNjGjfzDh?=
 =?us-ascii?Q?IR655VKZpz5/mwpX2+piEKd3nXPcGHsJg9SOrRTgQwVyvxHpLABQV2eL9kjO?=
 =?us-ascii?Q?4Zam5LeIOoxh7pxgCAmoeOSAUc69xBxYQE0QONPYVIUkLiAADFDLUSxONY92?=
 =?us-ascii?Q?2llND+iIey3pQFAELwxAbSFzLxrdq6VaOqUnfahEASXXF3+ZJkkXSj5l7bux?=
 =?us-ascii?Q?ieyWmXVgxMS2c9ciQUlob8AWvPF7X8BnzN43fZ09BP3UKd1tSqJ7zzu7bcDf?=
 =?us-ascii?Q?3QwejkVA+5/xxfsBKCwQFsgR8ZZrTZUXYgcj8zk1KcC/1PxXewaC/DNJ58QY?=
 =?us-ascii?Q?RmexLCd8paouoIOSWKEOId+kL/xi5z4p6K/j2xq78kll96Fa4SXFkWS0bV8C?=
 =?us-ascii?Q?3Z3TZl14KC3Y7tKttf+7jk903fBK0E+3N7DMcG2I8n7ni8Rog7C/Z23VleL5?=
 =?us-ascii?Q?hO8Dyy0rHEg9SkUufTogTCfJpBA9fVC+ZhUHBSe8bDdwEnxbQ5h3CoJwA3i+?=
 =?us-ascii?Q?MFnYUfYT34uExUrPQETU5aU6tdRwqqh699EpUBB2fbtA4csVUCq5La+4CJSc?=
 =?us-ascii?Q?iXPOFOK6DJWBmIdODFTJUyKczEE/yvRANMvVdXKeToAkT5p9xshpqZosCUYe?=
 =?us-ascii?Q?0PQSnf1q8SRSsx8/gHheBpwzORilCk2YKrpBE57ye6ePv65htRiJkpo6KfUc?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1475fa58-e11f-4799-3992-08dc4cf6dfa1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 18:10:37.8750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUOFBwTBgHFQ9Ea4qY+adOqcdUyLjMr7bnH+FGTinrrZQydaTnGlI0Oen+LxqbJ7gDgKfQ2Cs4W3JqTkuMYG3pLPj+xkklrc9SeStC1/4Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
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

On Wed, Feb 14, 2024 at 06:47:45PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 13.02.2024 23:24, Rodrigo Vivi wrote:
> > On Tue, Feb 13, 2024 at 10:36:34PM +0100, Michal Wajdeczko wrote:
> >> This is a hardware based definition and instead of multiple local
> >> definitions it would be better to have just one common definition.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
> >>  drivers/gpu/drm/xe/xe_ggtt.c          | 4 +---
> >>  drivers/gpu/drm/xe/xe_guc.c           | 2 --
> >>  3 files changed, 4 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> >> index 92320bbc9d3d..087eaa3b4d63 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> >> @@ -140,4 +140,7 @@ struct guc_doorbell_info {
> >>  	u32 reserved[14];
> >>  } __packed;
> >>  
> >> +/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> >> +#define GUC_GGTT_TOP				0xFEE00000
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> >> index ab96edb058d6..df5c58c63b74 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> >> @@ -11,6 +11,7 @@
> >>  #include <drm/i915_drm.h>
> >>  
> >>  #include "regs/xe_gt_regs.h"
> >> +#include "regs/xe_guc_regs.h"
> > 
> > xe_ggtt component having to access xe_guc_regs doesn't the right movement to me.
> 
> but OTOH it is using xe_wopcm_size() which is also ~ GuC related stuff.
> 
> > 
> > what about moving that to xe_gt_regs?
> 
> maybe new file "regs/xe_ggtt_layout.h" ?
> like we have "regs/xe_lrc_layout.h"
> 
> + Matt

Yeah, if something isn't a regular register offset, but is rather a
constant describing limits or layout, then putting it in a different
header sounds best to me.  If we have (or expect to have) other
constants describing fixed layouts of address spaces, a new dedicated
header for those sounds reasonable.


Matt

> 
> > 
> >>  #include "regs/xe_regs.h"
> >>  #include "xe_assert.h"
> >>  #include "xe_bo.h"
> >> @@ -26,9 +27,6 @@
> >>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> >>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> >>  
> >> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> >> -#define GUC_GGTT_TOP	0xFEE00000
> >> -
> >>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >>  				   u16 pat_index)
> >>  {
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index 868208a39829..53a72769d3b4 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -32,8 +32,6 @@
> >>  #include "xe_wa.h"
> >>  #include "xe_wopcm.h"
> >>  
> >> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> >> -#define GUC_GGTT_TOP    0xFEE00000
> >>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> >>  			    struct xe_bo *bo)
> >>  {
> >> -- 
> >> 2.43.0
> >>

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
