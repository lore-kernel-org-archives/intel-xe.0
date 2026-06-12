Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37F9CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C44210F5F0;
	Fri, 12 Jun 2026 17:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr7mQlv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9542E10F5F0
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285642; x=1812821642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WJnl4XjbwRM2OYQ7vH+wHm/xhpNngGayIOBSnIw4hmU=;
 b=Qr7mQlv5ZICHG3umlx8Jjf/o7EpijAag7cq6U83mXOzf40EwbtfTdDxF
 Vg3s3wkXGyJxyis/tF+sczdAmIvq7LlftRXF7AgOIVUdSlD3GOFHNjSZ4
 dNFaIa8x3MOAJIprzgV92mG1ZKzSuBAYPm66KIGuSy2jgM3m86KJ8XgiO
 B/WCRBF4adiFC1L2fSI4GrdGFN/BjyFpNKvMcgWxxtOquNM+7bduzgaB6
 QgIW1ppbNvBOp6BecTd3jPW/GRpAYVXW7+PgcAKJpk6qbDp2bgxf9fQ/A
 I7zz3EmdqW7cD0sCgNjOSW5OBNJKy3HMvU109JFo6r09mTTaHm+ZUe1+e A==;
X-CSE-ConnectionGUID: OL8HEpbgTz2/lOR2LWgkmw==
X-CSE-MsgGUID: OXMTM+qAQamyDrM5n0xiSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92442870"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="92442870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:34:01 -0700
X-CSE-ConnectionGUID: DGgs5aIgT+eDm/TZfiJAbg==
X-CSE-MsgGUID: /K/c+TJsTEuYqq4mG5WdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="243944980"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:34:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:34:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 10:34:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMvuJDX87rm1KIanWuDOtEUp6UyTEM529wztBQ1nMZvXcx6LTPGuxjMfRP4Cse4guiloNfsE10NsleyIdSmr9XG7rB6dAVArG/Dt6iaOCt4yrJMyNY9WD9Fc5R+Lf6cutGxrr/aC/o5zSOIb3tgITyJrEEz5+q8ex0y1oMF3z/3fmiErc1r5lsGVyUg6qe0LsVpG/LSIUfiwqKEPnKdrKooBtI9DWEEDQpajsc4YMZhUgDbBHl99918QBaDeFyq4jj/ld3GFh8OZcrWyvH8SVSuh/D84EmNVsNRm5ORI9bWxIGirnnXvHgemsTFKBj/+EPywRqcXXbDA/6GVcczG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL5Ow7Ux77NN8+A207wOJNUlF1ZbZuJcXoBkgRsbPSQ=;
 b=hTpNvJHSzpuVITFRLb1hCVIP+rPWxnXWvyGgRzPvlc1h8szig1Abry9N1hVCrKKpXc6B+ie0cLKWRUgCvH3DzzaldwTUDMeuOCNQKEgmg7m0yV0f5xyuXreWoCwbzh5bF4P7+tBcW0GJTuh5e4Vit8Jla3Mu7eh6jKxbn35jKEzzTBMsMrlLiKO/agOAUHjq0DR8ccWz9SdEbxpQJGngsBOjUaMmze7/BkscDd90rszQodzlz3Sv1PYVkYQNvmNs6xOpXxvEEwfV2pA0KVJMR3YygKIakhbRjsrPeLYYzkt6Mmo6oSVSwYS29xKhvn+u37vFLzAIVvS4S/TmawRJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 17:33:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:33:56 +0000
Date: Fri, 12 Jun 2026 10:33:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Gajendra Uttamchand <gajendra.uttamchand@intel.com>,
 <intel-xe@lists.freedesktop.org>,
 <Uttamchand@soc-5cg1426vcc.clients.intel.com>
Subject: Re: [PATCH 1/2] [PATCH] drm/xe/lrc: document sentinel and make
 CTX_TIMESTAMP read TOCTOU-safe
Message-ID: <aixDAgen0XZCImj0@gsse-cloud1.jf.intel.com>
References: <20260612032745.179673-4-gajendra.uttamchand@intel.com>
 <20260612032745.179673-5-gajendra.uttamchand@intel.com>
 <aixBttaQIeDTFyaR@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aixBttaQIeDTFyaR@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:303:6a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: f90147e2-2227-45ac-de11-08dec8a8c7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: V3yXgRU3j09OTeQ+ykl29lK05FcIjlTl6/AoO8Uz33tc7FALzqYIbXqSrDw+yjcvjH5ep86DSxdMY/x7EgO6HynG7KT2KwIoq1jUQEdZqnHIEqRxQGDSRXUEVA4rYoZGmA1FgVaeXOXYPvcxP+98KyYjaA6WJLvbB+0aD+CpAJt2S/QwBvjuOO2OIfFuWMROtiyAHbag/vfohehptfO5Nd2rTDd9X2xOeYOvD3rKH9DuepYjF6LTf/gIIwtUA/SIIgdX+jedY73WG4A8qnJfaRHcP17l8Li2WrX9nfwq9S8DLm2yRXIZUFpn5pRFDN/fnoRyA0EYz/qy7qMtT6RQctMuZsEKkQijM63ebEYEAUCr0RN7S9Hl5TX32PspdPqp+l9VFXviKbgPju4k+fOT8aR42eVOgZ1yKebZjs1iwxMXm4GKH6j+qbEFHGtHp1SJ/0rGZZHtoEYyJF6Ky3MyyiheRQjM3QdV0qqFAodw6N8pul22HxMFb9oGuX5FY+uv+HnhzBLpHJ0rtzPonR7OfrT8xJdfh0g9omYOCkQQCx0bCaf/LzCgcRFx82A0C8McVjcNQonO07/UEyVDs2Tn8nnRZbQj+/atOscw90zn05E69F1MdWxMZFNPXv0sKdOnvEad1BXI5TA8REP7WgH91w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PrXFj6jlVQRpqM4UwikX2Tybb/AdiV1V7hbin0Lndc4AkbHrvtZ6J4CeIL8/?=
 =?us-ascii?Q?meEslC7+5NnWezydnhGt4sLuIsj8anFO8nLcclUJ1huG5XvrRYOFOcesCVTy?=
 =?us-ascii?Q?x4VkAhux9QEkGgU3/4kTr3tQ3u6/UcGifJX+NtYZR0WSl8+s/WKn0uproaSF?=
 =?us-ascii?Q?BDnABjLbWc5M4aS7W7LKupzbQ5hVtuaojNn9yrDH0iDhos8nor8JpMFQ946U?=
 =?us-ascii?Q?NAY/TTLpQRGXXx8CW2cqRjU6Tgi61y2pqPZ3zJ+iRYLFo4gPrjfEmEhRuQqg?=
 =?us-ascii?Q?L7rCdoS8tqwir3yEWju4keGUoInUeChRiBLi1sxBpUIRDXibYNiffrqVo4Q5?=
 =?us-ascii?Q?Ux+/GNyAo5+/yn7CIcLweUaL7TYgSSRoFyggJaoJsrAT+/u11beWANZRO1m7?=
 =?us-ascii?Q?h9LuqrAz7e/t81Li+n0FGE/8noJZMtswFMxkbgfNQQ/TS6kTOXzWpc1mIpuo?=
 =?us-ascii?Q?9f36/VETGlZ8qGhwrt5Syv4wOUJJINamzn76wRKy2GWSQe2YkuWLpRLjNNvH?=
 =?us-ascii?Q?qFThhp+np4ABVUOgQwNUNdQckyNIe3z36nmttlb7Pp09OdAUoJWmltiqIXr1?=
 =?us-ascii?Q?6/lA+2fXmbMdUx8iKSAGSvvbNzemCvM0yVvn5JEOJl0FIGAVALcvk+Zo8wIe?=
 =?us-ascii?Q?BmsQTb+wtqnB8oEcA4UxJdS+P9IPZG/truJmcC/YUzywFkfeApdc9tvRLPHA?=
 =?us-ascii?Q?8jrA7DLQ58c+VyLKcZ9OtgpKyirr+LQ+0b9uDWaqmQ2odErFNb7XGC3QH0gF?=
 =?us-ascii?Q?DRfMFYH5Te5ImdvWlSD1zZ06r8OTRcASEalu6VLEeftKtrWvW3h7jTW6Ca6N?=
 =?us-ascii?Q?K9+lnrI2wCnyfS/rBUS/02bFqaWPYfVStEecar1qCN9oRKjugONbiNJcdu+d?=
 =?us-ascii?Q?ROtrMBTzdbmfYcz2A5Q9rY9aYkyw0oW/OoS6ak9uKFpycXZIItLb6esyCIOE?=
 =?us-ascii?Q?lk6D3PV1nG9AOZWE91vK3k05jrvEEC0ay5B1VcrRf9fQB9eDGofhPS2CbGsB?=
 =?us-ascii?Q?bKM4xi86zVaAehJZOFPWtFF4/t8r1Q7MCvn0xMTM5iVdb2x0ywxQtKNjjU5w?=
 =?us-ascii?Q?aJF909hDyYee8R/cHs6k1m7gRhpdxxgDId+xskBTUGV4AwMypjtQonil3I3l?=
 =?us-ascii?Q?P4nYdQ/fwdkT2HQM686yg0MHt8G15pdne1OEajffqXEItXZ2zKmU3jNm78aN?=
 =?us-ascii?Q?qrQFgiuU91RD1bcBjCKpp+Ij102rGbdfzUiQHe/bB6UVCxdzatHtCE5SRSg6?=
 =?us-ascii?Q?8Mg4sbU5FX49i+h98YI/QQOLnd+Lvh7pQFrxwuqNjALIWFaU5tnYSBUQ/zrD?=
 =?us-ascii?Q?GkUIj5omxlSwGOseEvgCNTzkJukAO2c4tN+ffuj1OshbY7w1Q2gvNhsNlJ60?=
 =?us-ascii?Q?FlFkxgLXZjM6Qf92E1/FQ8H+0RNdT8SaS7KNHsRPv646XQTDJpwkj64T2iZq?=
 =?us-ascii?Q?2WWS9py7Lo3WUQOgQehQmd9DHgqbQ1NHTLcXOmsREks89+AqLdbSCsOfGIgH?=
 =?us-ascii?Q?W+6/t8wWAlQXaV4GGZnXOlYkavuWU25LD/UitYkvTr0DBctYkJ1/TSvb3XWx?=
 =?us-ascii?Q?IWckkHPqAeQB1TZnknfD9TsDy8d9/Xjl3066GRzHfJ28J/xj9AJ2mIxOFzpY?=
 =?us-ascii?Q?lw7RdUX+jEadJdKFqk8jXp02MRgmG5rsu9ya4OQkHJjJHvhuVapk7gJs/HT+?=
 =?us-ascii?Q?PsZ5/Iun6eC60rg4+FtXFObKHzVm7HpCjJ/uniRr7syGtU3plaDk51760RXc?=
 =?us-ascii?Q?J5Jpvtf6Sg=3D=3D?=
X-Exchange-RoutingPolicyChecked: UHfzs7wR6sFqrKXUYb0kjhbTUOvTM01rr0vv+eqLJxayzdisciWOgoGa5z1ejQ9IUJ76SKpIhoS1H6rxV+VZlmrUxICtkGoJGfBq0lP34hM52t9+viRsLf5LfDYVURfJGYvbTHt99mDfZUIsjD6pcC/fKH5qBy4aYiZgJICDfmPNs04hWPp6aMjPHQV7umMFVpxrIU7o4Q86Yjpvwa1qyY1tuZcvOYEZQGKPc3DigZykwl+/hlR/8fVnZOOSn0pz6ffum0MiomROgdWTzquVLrqXJ0GaktYYYMlArG/PKVnus/YktYy1ukvhCNXL5dHC+1pkv4Rr9EF99IGr/kfhOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f90147e2-2227-45ac-de11-08dec8a8c7cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:33:56.6523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E09IVhtO7DiLGLhTHQtomXKMh4bR5ACnBPkq03u/N/eSIFpjXvaL9LOJFNuq3MBDMe649CLFZgyw9wdzZ+Se+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8496
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

On Fri, Jun 12, 2026 at 10:28:22AM -0700, Umesh Nerlige Ramappa wrote:
> On Fri, Jun 12, 2026 at 03:27:47AM +0000, Gajendra Uttamchand wrote:
> > From: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>
> > 
> > Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
> > switched out between check and read; LRC stores a sentinel while
> > a context starts that must not be treated as a real timestamp.
> > 
> > Fix: Check the LRC-stored sentinel before and after the MMIO read;
> > return the LRC value if the context switched out to avoid TOCTOU.
> > 
> > Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
> > canonical sentinel.
> > 
> > Signed-off-by: Uttamchand, Gajendra <gajendra.uttamchand@intel.com>
> 
> Hi Gajendra,
> 
> Thanks for addressing this.
> 
> The patch looks correct. I think this regression was introduced when refactoring for multi-queue, so please add a Fixes tag to this.
> 
> Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")
> 
> With that, this is
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 

Sashiko [1] also flagged some other valid existing issue. There are very
hard to hit race, but look valid. I don't think it worth blocking this
patch and this fix itself LGTM but I think we should open a Jira to
track the issues raised by Sashiko and get those fixed sooner or later.

With the fixes tag Umesh suggests:
Acked-by: Matthew Brost <matthew.brost@intel.com>

[1] https://sashiko.dev/#/patchset/20260612032745.179673-4-gajendra.uttamchand%40intel.com

> Umesh
> 
> > ---
> > drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
> > drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
> > 2 files changed, 28 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index a4292a11391d..e284c008c126 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1096,7 +1096,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> >  * on until it is scheduled, we also read the ENGINE_ID MMIO in the WA BB and
> >  * store it in the PPHSWP.
> >  */
> > -#define CONTEXT_ACTIVE 1ULL
> > +#define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
> > static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
> > 				    struct xe_hw_engine *hwe,
> > 				    u32 *batch,
> > @@ -2720,21 +2720,34 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> > static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> > {
> > 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
> > +	u64 stored;
> > 
> > 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> > 	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
> > 		return xe_lrc_ctx_timestamp(lrc);
> > 
> > -	if (context_active(lrc) &&
> > -	    !get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> > +	/*
> > +	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
> > +	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
> > +	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
> > +	 * otherwise accept the MMIO value only if the context remained active.
> > +	 */
> > +
> > +	stored = xe_lrc_ctx_timestamp(lrc);
> > +	if (stored != CONTEXT_ACTIVE)
> > +		return stored;
> > +
> > +	/* Context is active: read the live timestamp from the engine's MMIO register. */
> > +	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> > 		new_ts = reg_ts;
> > 
> > -	/*
> > -	 * If context swicthed out while we were here, just return the latest
> > -	 * LRC CTX TIMESTAMP value.
> > +	/* Re-check the LRC-stored timestamp: if the context switched out while
> > +	 * reading MMIO the hardware saved the canonical timestamp into the LRC
> > +	 * during context-save, so return that value instead of the MMIO read.
> > 	 */
> > -	if (!context_active(lrc))
> > -		return xe_lrc_ctx_timestamp(lrc);
> > +	stored = xe_lrc_ctx_timestamp(lrc);
> > +	if (stored != CONTEXT_ACTIVE)
> > +		return stored;
> > 
> > 	return new_ts;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 0a3a611391ee..7be5e3da8bc8 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -9,6 +9,13 @@
> > 
> > #include "xe_lrc_types.h"
> > 
> > +/*
> > + * Sentinel value stored in lrc->ctx_timestamp while a context is starting.
> > + * The hardware hasn't yet written the real CTX_TIMESTAMP, so this is not a
> > + * valid elapsed-time sample and must not be used as one.
> > + */
> > +#define XE_LRC_CTX_TIMESTAMP_ACTIVE 1ULL
> > +
> > struct drm_printer;
> > struct xe_bb;
> > struct xe_device;
> > --
> > 2.43.0
> > 
