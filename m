Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C8DC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42E910E2D7;
	Thu,  5 Jun 2025 18:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXfC56K7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4515110E2D7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749148131; x=1780684131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XaYNgcY7IwFhLEOKPdewOrNsbi5i2FizeCdw8oai/uo=;
 b=BXfC56K7QpfulMlJzkSGdzXeqXsyDh9yyuUkWKXNw/YimxRxCCTXlGMz
 eK4YfNZoHO9aWx2sRkN7NKONN7ga/8iZoNwCieHdbE/lPcMDDBYNo7dWV
 rVD4XnHuHQnocnJoBVkMep6LjHUsDz/wBzvXUjfjSkV1c/9T+gydc6A5i
 60leXTiziU/8xA3tdjblKp8YIxZHkAf43cnNSZ9EuW9+/jH7O7uHm7UE9
 +gLXBdo68MgM8IhrzNW48sCz9k2LGj02Kwc6NMLyky8NjfR4+Sd649XJa
 SmSnoi217QK2l0b59XTJRHrxV25cnZaQax378HvEwrSYIazqa/Gcpe/ew Q==;
X-CSE-ConnectionGUID: Dp34TJucQduNo0hNJL0JPw==
X-CSE-MsgGUID: yDQPfaHmRLyHN4pJOHtEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62682232"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="62682232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:28:48 -0700
X-CSE-ConnectionGUID: M3c1DVI2SH6BOQVYdYb0JA==
X-CSE-MsgGUID: bdrRX485RrutSg7YqaVkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182779411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:28:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:28:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 11:28:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUU9xcfgzJrUScTbrPzUPnUCeDljUGp8NESbwawdT2b0WnF5inc5KDY6DfjwHfBs/Zf2QlJRQIO4DbQm1PQzjB6CYuvg84YJHaev2zcspgr7seCau6boEe7Dh8PkBAkOKM589RhEF+PV31tPQ0dXBNU8S3dWgovHQvygZo/Rax0eKIb/mJtnzmkCo+BxCXQroCo7nLCyx0cZYKpnc3TrhPxh5P2XcZ3W5zc+rGLpT8JM6b7nHP2877nyexmMLKeWrqSff7MCXKVN0LFaqEZoWDwE/k8BWtYozInM/W/EeOl1DAJuIB5q/XvAYU4q4w02pA6owalH8WdKeXOPVcIaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpFgH5oZ71FiB3OoBbmn02lm5PAO+OS5VP6OFbxfuT0=;
 b=k1CSjDu7qGR3xMirBqZgvMUmAi97ANE+QEMH6lmqKy/+2+iJrbbDG4YT3cxw1kTA/2lb7bO5wxBg9YxcPfNEiE+e/h3IX+FuEec2fPSeWuudnP1F61XKrYEsq5i1YSei4QBKAxnZoGyAMqZ+0HiM9D455d0jPL1K8hgmXty+jtIRnCoHI66044xE1WqdnDQgnrNpHj7BOPPC8Sq/ToPDvJSf4Jw715vMjZPKQ8Lihm+Vz/LKAhesLnLfzlMO7nq2O5NdcXnI4T3wmCuGyGMSsWRkk6dlv+lGFIVkUxx2VCL3ZD5EXKBbBAs9rhdYKPlvgWfs7fxD6cS5NV6v5/o7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 18:28:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 18:28:29 +0000
Date: Thu, 5 Jun 2025 11:30:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] drm/xe/ggtt: Seperate flags and address in PTE
 encoding
Message-ID: <aEHiK066PoXoZ31Z@lstrano-desk.jf.intel.com>
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-6-dev@lankhorst.se>
 <aEGzfGJlIM3W43YW@lstrano-desk.jf.intel.com>
 <6a477105-eafd-42e1-a465-4a5916c2af33@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6a477105-eafd-42e1-a465-4a5916c2af33@lankhorst.se>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de3f760-f6e7-4780-cfe8-08dda45ec51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q4yY8VW3oj06Z/jNh6pe01uAEIoQPKCUrUMtE8zQy7yackcS4Gxq7gtX3Lfv?=
 =?us-ascii?Q?Yc19Hs4od4EOuYCczOdJh7MH2Ah/nZ7XEgSLC9R4P9NraPAZ+SZ35iC7FUR7?=
 =?us-ascii?Q?1N7nPlHVSf5V7fOLR1gkahU6fHswf0jlVI/z4BosHcOE5wsCFcFPUUmAxW/Q?=
 =?us-ascii?Q?xn03t5WYUbRXkTGwbsP3wIlMDQRgiTTgAp1RuHqU8CiJ0kaITZotYnsvAwIS?=
 =?us-ascii?Q?Yf8DJ8jEHVchgUWCxox3hvrNo4U17cwQ/unyn1e+Gv71r63+G/9JjT1cfzMe?=
 =?us-ascii?Q?GC2x/rc7lswpz7BoiidUU1vJXo700VrBkj+1xS2b7vlkqTfGT6A3kw5o0oaI?=
 =?us-ascii?Q?xqMZnTsft+llzxDODm058F+bdi92pYQcjN7vtCNnP9chgTDnwTdfhtxoyxK2?=
 =?us-ascii?Q?TblEBkzkxs/bhVEi8arNuKeWPc71n2ltcSb2/Q5kX41mIB5GSkkJYPBg4fuU?=
 =?us-ascii?Q?j6Z9yGItdi3AsYO2ANyX65MsaNjg3PkfpXfqbIDf/w5Z3F4vi94SioermHp3?=
 =?us-ascii?Q?d5pi7HWeYaFWwuJPaQ/8u1hDL7h8/njmKqXy5Cvpj3DVxpT+1ggQ4tf6AJqM?=
 =?us-ascii?Q?twIcEgfO3bprneGGAQIxFDdX4rmy4PMqrGUtJvZHpTrzb1xFiFtmwDORbb+G?=
 =?us-ascii?Q?7hYN22MxKS93Lf/dQ76YEjM2Z1lQm+GjYGoxsnb2OuKzvTXlNWq62SDuNdVL?=
 =?us-ascii?Q?TiB3gfYnz5J30CGQgnNW3YMlpMsNYWAkLODBRPbd+rQT/eMA4nXbkWm7M+16?=
 =?us-ascii?Q?uZjomgnuMgs2n9ry+UbADdiDwUvtr4e7/AhEcrUvso2eUrzGLhAxivkYMEmb?=
 =?us-ascii?Q?gBr/G4TazFs7ozV2b9q2SWTF504xHdzyBbxxlahTnBeZXmQivLUw3c1j+xnw?=
 =?us-ascii?Q?0hxGF+q7QsqkVUkimY3StHeBAOd8/B4C38aTLAiCKleZej+WPacBbdKl0QW7?=
 =?us-ascii?Q?gbG1G5vQysCUmOzSxq4cGK1k67Ooahe5nX7mVFY3v7vA09bEKX3Ju9a+IrM8?=
 =?us-ascii?Q?uQuhOVRCyNxJ+rARohHS7oA5KFoaGvP2Ylvgvn6VH4eQVuRSTXsCLEc5mMFk?=
 =?us-ascii?Q?+tctSIfi7ua3ENIK7T+lJ6LE//jMcOU5tL9R3ov77Wt+9uI5ebNxNhPHdpWT?=
 =?us-ascii?Q?QBWOcyAkZHei99OZR0GvOoH6u4bcelItRijQFhmoy7KgP+4TRGd5sWtkHwNz?=
 =?us-ascii?Q?49hnu25yq9d5jW+O5S2gXSIQjWJY83tw9bLVD6KGiLjlhVTfHdneShfliXSM?=
 =?us-ascii?Q?aTvMsOs8r7dxt2noSFNRVz3PaKZlWxrP7ttlC8AgOq+QmEehgnE1B4eGaI8y?=
 =?us-ascii?Q?0TXX0WNGFb5waDXtkj54G+5Y9KsUM8OPfYYUgX5ijT0V20/slK+Gt4EyMBel?=
 =?us-ascii?Q?UktTYHawX7Cqe0k+OnbOV/ZzNcbu1b8OsVlo5+cwIiU9a6TihaWxZ3bpNRVd?=
 =?us-ascii?Q?5+8ESjV9Njc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XtzzJJcx0kwlaQX5mNkVW0s86ep6DNZTem01bVCcUZJnJWaVX2Fczup41vws?=
 =?us-ascii?Q?zyONUDYf2P0wHznJSa1v+7h0qxQAFNnTfpOYdq8jYpYDocadALhK3JvSQhBl?=
 =?us-ascii?Q?rg5JHBZRIbLEkMwLnMcIXuWQyUi/BGF/cS+rS9dYwf6A/sJo98Vh0jShR+Zw?=
 =?us-ascii?Q?DvwNawZffpWxz0FdC+Ow7o4uqUciaYGK/fJK91ROojGe72Z+PToPQ7cs6TIA?=
 =?us-ascii?Q?J6gjdhyNPcyTbP1CsEUfoFaHhcg+qxgZUMA2zNm4dr1dVEA5UvH6OaFPR+uk?=
 =?us-ascii?Q?0a8waxhK9JGo96rFAF5YZWKIJqDh8ubdE+cB3cdLg40NBawWO9GA80Kh/86Z?=
 =?us-ascii?Q?qnZt/qsLQKfN5bMOTjJKOFJGu10jqI3VdJ29xZo9Ie4zIA3QVxClD0AWLWY1?=
 =?us-ascii?Q?/+PAA4f2UEv5Izbw2fvqw8I0asnQJoBa9HbJ3qCMoyhiyr/k4W8S+AlAU4go?=
 =?us-ascii?Q?Q3pUkBvNgnEKHdcC7YP4jmxkCb5C5OfXubCwJXlsFOOx08ByFPknwGuzV3ix?=
 =?us-ascii?Q?3dg/vsxXwgj0Ywrm2BKI4ozUa+GBTBg5fUV/CbExNxTBLUn5qGDXLEAjKjQs?=
 =?us-ascii?Q?HMIN9F3BfdGl/CFNxsdF0w3zY7H9dyG52cg2lwRpfPUsIEjbdxgtzIEOSANp?=
 =?us-ascii?Q?nEqAwkupSN62DhgrCZ7gErKBGcL33F0BjDelc9EwgGVk2u2UQFF93Y8hjHbx?=
 =?us-ascii?Q?55x8NTm8k6qcYaguHlnVc1N9C0ZJaK3qiFLcLQAoLQTBEJiDbaai9lXT2uYg?=
 =?us-ascii?Q?Z4Z4VOghaLrXYlPIN9sCTJfEWiyAKLgt+16fRbTZkLFFqf7YF0oMI7n+gWIf?=
 =?us-ascii?Q?mB4gtcZ6b1JU55okq2pQsNZ0QSsBc+lXZ04zeJOQpHAnEYEmZLyPyZC/C+OU?=
 =?us-ascii?Q?pLHgqQBFBOr+VyI/pwNS7rnLb4U62jdCyvPZkvywhG5MDVtzYX+PpPXiVp8E?=
 =?us-ascii?Q?r3W+NDAYkA39RbNX/pz2K1/0M+SaBIEcGBkve7JZ9jG7XQZee/eppq82B56R?=
 =?us-ascii?Q?FlQ3L5a4jRo9bVQnvalBYm93GLhaRxkv7HvKcD0xI3escoIZGZo/mof+fGWy?=
 =?us-ascii?Q?aPtkUBlE7WCbx0Z2/K5hLoPvFGQylO9Tp5gP6yc4UQuiWEaSE0IYiQolulte?=
 =?us-ascii?Q?u+o6h6HdYjcEXrbTaWDftK+w3f5xJ3pokgSK342Ocg10DQYnADnrDwLJWcL9?=
 =?us-ascii?Q?QQeXDnu560BJUwPvCS618EMOSQssol9SJxtMMU1AqF7TU/C0P7VhUuTBsiDO?=
 =?us-ascii?Q?Bdesl+X5T+cvTMbCw5/mqSUArl7x/ESWyJughhJbQ/pGJskOPf/SiCH6RXLU?=
 =?us-ascii?Q?nfL9Tb9xdbPY7mGIrTKrnuAujlogJ+7/6t1LGNY/VEeauEBi667IsA7OIAUJ?=
 =?us-ascii?Q?OaTo6xG/G2f0vc3bBnXtlrUmIzaOxPGXy0fxnc93++P7yFfg8W/vjc8ERob9?=
 =?us-ascii?Q?tuC5LuQQJLLLoMDbWzNERkAELtKi0x/7Zk6mPUKdypDVjjBgoB23jSoDCUYW?=
 =?us-ascii?Q?2IZUnNVjeVnPw+Kj8h3qxg1nbNvhl1XWHyyjX4bBdM9CbDET+sXW1it+o8W9?=
 =?us-ascii?Q?bYUb4jdKLxafxorgQ+y0eEmCD6QM8TIzvVIuwauL2q1lutXoyy3lQm9nOetk?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de3f760-f6e7-4780-cfe8-08dda45ec51d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:28:29.9514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH6fWKvp295FJ0dlVtw6DTWTu4vSFSQyqke+yQijDaipanM+Db+lYVpA3tC1YjRFtl5im6Dzu38zIhUaZtPBYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

On Thu, Jun 05, 2025 at 06:57:30PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> On 2025-06-05 17:10, Matthew Brost wrote:
> > On Mon, May 05, 2025 at 02:19:18PM +0200, Maarten Lankhorst wrote:
> >> Pinning large linear display framebuffers is becoming a bottleneck.
> >> My plan of attack is doing a custom walk over the BO, this allows for
> >> easier optimization of consecutive entries.
> >>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/xe/xe_ggtt.c       | 85 +++++++++++++++++++++---------
> >>  drivers/gpu/drm/xe/xe_ggtt.h       |  2 +
> >>  drivers/gpu/drm/xe/xe_ggtt_types.h |  5 +-
> >>  3 files changed, 65 insertions(+), 27 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> >> index bdda9302ae294..7526739034ea0 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> >> @@ -27,6 +27,7 @@
> >>  #include "xe_map.h"
> >>  #include "xe_mmio.h"
> >>  #include "xe_pm.h"
> >> +#include "xe_res_cursor.h"
> >>  #include "xe_sriov.h"
> >>  #include "xe_wa.h"
> >>  #include "xe_wopcm.h"
> >> @@ -64,13 +65,9 @@
> >>   * give us the correct placement for free.
> >>   */
> >>  
> >> -static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >> -				   u16 pat_index)
> >> +static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
> >>  {
> >> -	u64 pte;
> >> -
> >> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> >> -	pte |= XE_PAGE_PRESENT;
> >> +	u64 pte = XE_PAGE_PRESENT;
> >>  
> >>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> >>  		pte |= XE_GGTT_PTE_DM;
> >> @@ -78,13 +75,17 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >>  	return pte;
> >>  }
> >>  
> >> -static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >> -				    u16 pat_index)
> >> +static u64 xelp_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
> >> +{
> >> +	return xelp_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> >> +}
> >> +
> >> +static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
> >>  {
> >>  	struct xe_device *xe = xe_bo_device(bo);
> >>  	u64 pte;
> >>  
> >> -	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
> >> +	pte = xelp_ggtt_pte_flags(bo, pat_index);
> >>  
> >>  	xe_assert(xe, pat_index <= 3);
> >>  
> >> @@ -97,6 +98,12 @@ static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >>  	return pte;
> >>  }
> >>  
> >> +static u64 xelpg_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >> +				u16 pat_index)
> >> +{
> >> +	return xelpg_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> >> +}
> >> +
> >>  static unsigned int probe_gsm_size(struct pci_dev *pdev)
> >>  {
> >>  	u16 gmch_ctl, ggms;
> >> @@ -149,8 +156,9 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> >>  	xe_tile_assert(ggtt->tile, start < end);
> >>  
> >>  	if (ggtt->scratch)
> >> -		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
> >> -							  pat_index);
> >> +		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
> >> +			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
> >> +							     pat_index);
> > 
> > Why this change? Does the vfunc not return bo_addr | flags?
> > 
> >>  	else
> >>  		scratch_pte = 0;
> >>  
> >> @@ -210,17 +218,20 @@ static void primelockdep(struct xe_ggtt *ggtt)
> >>  }
> >>  
> >>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
> >> -	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
> >> +	.pte_encode_bo = xelp_ggtt_encode_bo,
> >> +	.pte_encode_flags = xelp_ggtt_pte_flags,
> >>  	.ggtt_set_pte = xe_ggtt_set_pte,
> >>  };
> >>  
> >>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
> >> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> >> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
> >> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
> >>  	.ggtt_set_pte = xe_ggtt_set_pte,
> >>  };
> >>  
> >>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> >> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
> >> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
> >>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
> >>  };
> >>  
> >> @@ -612,23 +623,39 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
> >>  /**
> >>   * xe_ggtt_map_bo - Map the BO into GGTT
> >>   * @ggtt: the &xe_ggtt where node will be mapped
> >> + * @node: the &xe_ggtt_node where this BO is mapped
> >>   * @bo: the &xe_bo to be mapped
> >> + * @pat_index: Which pat_index to use.
> >>   */
> >> -static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> >> +		    struct xe_bo *bo, u16 pat_index)
> >>  {
> >> -	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> >> -	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> >> -	u64 start;
> >> -	u64 offset, pte;
> >>  
> >> -	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
> >> +	u64 start, pte, end;
> >> +	struct xe_res_cursor cur;
> >> +
> >> +	if (XE_WARN_ON(!node))
> >>  		return;
> >>  
> >> -	start = bo->ggtt_node[ggtt->tile->id]->base.start;
> >> +	start = node->base.start;
> >> +	end = start + bo->size;
> >> +
> >> +	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> >> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> >> +		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
> >> +
> >> +		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
> >> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
> >> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
> >> +						   pte | xe_res_dma(&cur));
> >> +	} else {
> >> +		/* Prepend GPU offset */
> >> +		pte |= vram_region_gpu_offset(bo->ttm.resource);
> > 
> > Does this actually help vs pte_encode_bo? I not entirely convinced it
> > would. Any data on the speedup? I can't say I love open coded nature of
> > this vs just calling a vfunc.
> 
> This is similar to what we already do for VM_BIND.
> We construct default_vram_pte and default_system_pte there, append some VMA specific flags and then append the BO address later.
> 
> I felt doing the same for display FB pinning makes a lot of sense, especially since DPT is essentially a flat LUT that uses the same encoding as GGTT, but doesn't need to use any other GGTT function, other than the DPT itself being mapped into GGTT.
> 

Ah, yes - thanks the reminder. I fixed this in VM bind a long time ago -
each xe_bo_addr restarts the iterator to get the address resulting in
O(N*N) algorithm vs. O(N) algorthim in the worst case of fragmented
memory. So this change looks good to me.

Still have one nit above wrt to scratch PTE but not a blocker or can be
changed at merge time.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Kind regards,
> ~Maarten
> 
> > Matt
> > 
> >>  
> >> -	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> >> -		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
> >> -		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
> >> +		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
> >> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
> >> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
> >> +						   pte + cur.start);
> >>  	}
> >>  }
> >>  
> >> @@ -641,8 +668,11 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >>   */
> >>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >>  {
> >> +	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> >> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> >> +
> >>  	mutex_lock(&ggtt->lock);
> >> -	xe_ggtt_map_bo(ggtt, bo);
> >> +	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
> >>  	mutex_unlock(&ggtt->lock);
> >>  }
> >>  
> >> @@ -682,7 +712,10 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >>  		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
> >>  		bo->ggtt_node[tile_id] = NULL;
> >>  	} else {
> >> -		xe_ggtt_map_bo(ggtt, bo);
> >> +		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> >> +		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> >> +
> >> +		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
> >>  	}
> >>  	mutex_unlock(&ggtt->lock);
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> >> index 0bab1fd7cc817..c48da99908848 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> >> @@ -26,6 +26,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> >>  			       u32 size, u32 align, u32 mm_flags);
> >>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
> >>  bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
> >> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> >> +		    struct xe_bo *bo, u16 pat_index);
> >>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> >> index cb02b7994a9ac..06b1a602dd8d1 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> >> @@ -74,8 +74,11 @@ struct xe_ggtt_node {
> >>   * Which can vary from platform to platform.
> >>   */
> >>  struct xe_ggtt_pt_ops {
> >> -	/** @pte_encode_bo: Encode PTE address for a given BO */
> >> +	/** @pte_encode_bo: Encode PTE flags for a given BO */
> >>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> >> +
> >> +	/** @pte_encode_flags: Encode PTE flags for a given BO */
> >> +	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
> >>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
> >>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
> >>  };
> >> -- 
> >> 2.45.2
> >>
> 
