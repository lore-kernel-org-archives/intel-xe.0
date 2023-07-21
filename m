Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44EEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 16:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6B10E6BD;
	Fri, 21 Jul 2023 16:14:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869310E6BD
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689956055; x=1721492055;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FzWDY2QFvN2caEkMTtg7JDd8UebpbCBKBseTB/jWhmU=;
 b=fRbGfUDNbhrFCWBxweatjaDKHCIGwm+dDRPx5h5ah/9kz/VH3dUhXdYV
 JzmHWSyp9lsmMYfYj09W7iX/cSJ4n3F+Hyaj5P9YE9jiHdy9jnaQNmrMH
 fVeTxsj8O/tuREr3WLwXCSYTYBf/O4hIiURhIu4Xce3sNDjdw9Zmy20to
 Wv9PglqdC7q3tDJh8bHHXktrPz1MPBftdZJISTKJtxFKyctBf6k/hS93e
 toHJ64k10xDBQO7Dr8MKTB4BYcnBwjoNd2Z9ppztkfhvY56sFOe5V8XVW
 RMRrMyFLYeMCqJh0o18s+WpvKqyClLzix3uOzRdL+0+smTUiLyIWq3lJf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351938294"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351938294"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795013946"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795013946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 09:14:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:14:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:14:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvnQ59uXXVtdzILqI0p5jJSSI3xyYODGSnbedGchu6Q4NTBnJAp8RWstuqGCv6pQSWxI811SVkbFdZpcInxWY0dxTO1PwiYKuN4Y4A3rEGqVO7of0kT7im5Jl86oGFnJ9fcOJ8xxPbnqv/yWj6iy0a6L7t3vtX6GPHdtzraB9sXDBPumOSqOsgJQLyd/AkBt3Lud8MkhQdZGrCLLvdugshmwDRNmRba3krtVMhggbQXds+ur1DXllkympeNRM77Ti7rJnPoNieqRM+ercXuh394QcWHc4PYnm1kFwqKzsPKbGwn4sVUtlqFNXyjuNISlUa4FYTdwfmdg4n4eXtO4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT2bZw2D2Kzj3W/JSy4cPVp6EOWl5POrPMLyUh1/MWM=;
 b=Fs7XWJfrs0oCoKPoXiGWqb65pjuMgD5V0DCjfTMfdPG8mig6X6ejskDRyGlGKZgQ66vtsGe7y3R7ZRmpYCybZewImiPSdo8rrLxir9OmyFGd+6z/ErIzuUjBHIGZimhpKYLmgL28qQtS8fBu6oeIAzPifPcKVZVFyVNXNdRtCaunLb66lmIN1k8kZtr9KnNb4fPMi3NNZgkwvzsyjiS0PGhM+jUcQYnAGscivHkIjV3dMjo6YSGCdd/uL8JbP7EouUwFknk/jX2f1M6mJqb+QbxGKZ3y+rSzd23/62pqx6UUuipFl/C6rskQJoZrXA5WjWaCT/wr6ALqWqL4AvYz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 16:14:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:14:11 +0000
Date: Fri, 21 Jul 2023 09:13:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
Message-ID: <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
 <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 54356624-5ced-4002-d696-08db8a0584f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBtcmXyupc1ve3OXi8My+vn0mex5uAtoj/hdSWb9jEOOT31mci8YN5pF0Vl4wKepwjcvclNBYR0DYS7FwqG5JQGJukjX0YOhxtsGAVbDX97Lg2YWU2goTOn0WUlQ0r14E+MBZuIa1eDtky6h8nHm8FgQFUYYyRIehTfh/raAitmBJWb5vJ2QyERqwEWb4o4RWkAs0sOujHQ1mk1ZhXbWC2u/X2VasS+87dhO1TMtaVcF3BXwMSVbMT7PKcKDeY8beh0vVJMWdhNudUXnD6idHadZ88eUNWDpNbiXbc909y2Lj4BL49l4ozzF/+safE78v86cmfxETElBavTWmPDrupILBNk5TBLdmUbCwObJhvP5+jhAoQzdw9PBiglhTgv/AWXLQX6Xa7wtqJH46wXzUf9A/yWb8L3m4M0bCEOLOKWaMe1+uK+W0ATs+5yjg1R1TkaEFtKWKTRGB7hUlEfGmpHMpl2ApiAaB3wAMcW4bZve1oplBo6OBHMEZnWM7su9joPhVUtw0Xz8M4h5u4RM21Yb+MRUFiF6LXzw/2ZIzJDWdGumV5lf1d4K8EjRCnFy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(478600001)(6666004)(6486002)(38100700002)(82960400001)(33716001)(83380400001)(6512007)(26005)(186003)(6506007)(9686003)(5660300002)(4326008)(6636002)(8936002)(6862004)(8676002)(41300700001)(316002)(66476007)(2906002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B2wIIdJ81jR6LXnjAxr/ZfZcwKMB5geN4kdHANjaCR3chcjuXwToyvYYRq?=
 =?iso-8859-1?Q?T/5jxsuInka9O06frf72pySCMl9arTGKWSHNGiiCL08EoKDLrr9uzqDCJd?=
 =?iso-8859-1?Q?+YOklPqWMtweiEIbWoHumwH3ZHmodKM5vhOcjn8B1Bl5qa8rRFnKJqr5nB?=
 =?iso-8859-1?Q?5RAjN2RMYmP3Q7f1dSV557a2C29AaR0vo1bwyttB7vbq+a4gExboh7O8mj?=
 =?iso-8859-1?Q?r/N8FjsX+qqqltwQLIWciKfL+Hw6Y8wCaQp++tMQDWHLEeYD7scxgrjJcI?=
 =?iso-8859-1?Q?6Ji2NLrNpBW2w8TNi+mUkl5f6vEz9sRr44q4PjIDSpZOiFTJN1ibEC0jMA?=
 =?iso-8859-1?Q?hxug4a/C5WfrmEivKngrKwTHlgaqbGTQs75n5pdBpd+fJlpSoPh0Rjt03n?=
 =?iso-8859-1?Q?Fb2nWv3b9SdwusaS+zJAdh2sTzmUUTXnDzq92fxK3w8d6pTjfGHdcHkgsp?=
 =?iso-8859-1?Q?Tbu/DGOFmyKRE/UrYxySGFcw4YlyB50TairDAGVe4LZEDKgSKnDjAXRPYy?=
 =?iso-8859-1?Q?aKGKHN8wranUXqdGoul6xqoeMe7E2lrXoWyS/iPdk5i/m0i6OZBbfPjatE?=
 =?iso-8859-1?Q?LrIO7VC0bJL67+KXJLkL7iBgtm/GdfaKOHpHOV6tK9mrKWW0nQKsS0L/Ik?=
 =?iso-8859-1?Q?3kgn4zN77LharRi14QArqeWBMlIw2hYkTZ7m3WUezq/qVURyFjAPHsfjYf?=
 =?iso-8859-1?Q?JqAG2GO2GRpfsT9PoYpXowAy9ngro8CQ7b3WVxHNnpf8bE5bO4QAYFdXdV?=
 =?iso-8859-1?Q?Dhqqny1yfKF3UEwLTObhnq31e6b6I5rdP5txcr6LeNTtrRNVu5VvMKZcqL?=
 =?iso-8859-1?Q?oIhjL2ksRq73kFmQA96oZgjFyLQvY0awsa++tCfoKWO9ry6WgwNwKHcAaU?=
 =?iso-8859-1?Q?hwhltMHtDtSu2eoBNNlHVEyE2EnVpoQvoAxsiMT59fR3gXd8kJNMBfrglA?=
 =?iso-8859-1?Q?g+9ZYRMHhx0rXJxyKEMsZ+BFCzjXaLcO1RS0rPdPsmfC0f0kSFhUT52LDU?=
 =?iso-8859-1?Q?JjpaOhNlrhR5FIIYtJIsIXPAzfim9n/bT9xbHd/v39SOVslz/U/DfY+SiO?=
 =?iso-8859-1?Q?VLc5uFSPE2Tgz3IO6ZHSZhv96F2E9v+WFw8+PMk3cclvY/spDbzHgEJ8JC?=
 =?iso-8859-1?Q?KAgVFaEFbluFcH9tafH4Mg2/auO6ZyW+DBBWLAHnC9wyXEs8wLlizF5KJy?=
 =?iso-8859-1?Q?6Tw7oe7kRlP2lC/PJ9GiUmhNUVT0pOjsGHOcDEkhHSJfX41cOV0igUcWrY?=
 =?iso-8859-1?Q?0ZPFVRwNE6wcj+UZRGCqFfTFkspFFRvPfBJ19FhSOhm0VXRKWTO02N7cre?=
 =?iso-8859-1?Q?QqxhJgAZhIrCR7Hbg9Y63WqBHswW8fLzs7zyewFsuOV9QU+WAymJyXWgm8?=
 =?iso-8859-1?Q?SQJei67LDD3Ak8YpFrVLsaoxLNsYNBtDi9889pZJaFs4AM6evK3Sl6j97B?=
 =?iso-8859-1?Q?MAO4q/KkBnMdbTXZ7KCAr+tdmh6BtnFo533EaToHJUz7nNGH1q8y/Lz3nu?=
 =?iso-8859-1?Q?n8hMiK5Vh2GEBJvZY8rLNXw/kC/jovv5CzCLjLfp5QGePQCAKFe/TJXVhE?=
 =?iso-8859-1?Q?jHgQQUEBvvIByt+cDnjHlqTRRkeK772OY1bQ34b6Vuy1oPttSmTCYU0RMJ?=
 =?iso-8859-1?Q?VP31aKGN1yqToIXMBWtXAhUR8JUidDcTwonnVmnD699NW52zmbUYVzug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54356624-5ced-4002-d696-08db8a0584f1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:14:11.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3roZ88eimA0fLYrVG0Pd4hPJhVoKKloUEu/LIaZ5rTp/FFTIV214pb5rLOKQ8a6RXtYIrUjCVDzHKmOhaCje9Gqmj5diYHrGuLZKZk6r2Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7453
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 20, 2023 at 07:48:33PM +0530, Vodapalli, Ravi Kumar wrote:
>
>
>On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
>>On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>>>On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>>>>Different platforms has different PAT encoding in PTE format, add
>>>>correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>>
>>>>Bspec: 45101, 71582
>>>>Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>>>---
>>>> drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++++++++++++++----
>>>> drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>> drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>> 3 files changed, 129 insertions(+), 13 deletions(-)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>>index 00855681c0d5..e7f8bd4dd518 100644
>>>>--- a/drivers/gpu/drm/xe/xe_pt.c
>>>>+++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>@@ -16,6 +16,7 @@
>>>> #include "xe_trace.h"
>>>> #include "xe_ttm_stolen_mgr.h"
>>>> #include "xe_vm.h"
>>>>+#include "xe_pte.h"
>>>>
>>>> struct xe_pt_dir {
>>>>     struct xe_pt pt;
>>>>@@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>>>xe_cache_level cache,
>>>>     if (unlikely(vma && xe_vma_is_null(vma)))
>>>>         pte |= XE_PTE_NULL;
>>>>
>>>>-    /* FIXME: I don't think the PPAT handling is correct for MTL */
>>>>-
>>>>-    switch (cache) {
>>>>-    case XE_CACHE_NONE:
>>>>-        pte |= PPAT_UNCACHED;
>>>>-        break;
>>>>-    case XE_CACHE_WT:
>>>>-        pte |= PPAT_DISPLAY_ELLC;
>>>>-        break;
>>>>-    default:
>>>>-        pte |= PPAT_CACHED;
>>>>-        break;
>>>>-    }
>>>>+    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>>
>>>>     if (pt_level == 1)
>>>>         pte |= XE_PDE_PS_2M;
>>>>@@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile 
>>>>*tile, struct xe_vm *vm,
>>>>     }
>>>> }
>>>>
>>>>+static u64 xelp_pte_encode_pat(u8 pat_index)
>>>>+{
>>>>+    u64 pte_pat = 0;
>>>>+
>>>>+    if (pat_index & BIT(0))
>>>>+        pte_pat |= BIT(3);
>>>>+
>>>>+    if (pat_index & BIT(1))
>>>>+        pte_pat |= BIT(4);
>>>>+
>>>>+    if (pat_index & BIT(2))
>>>>+        pte_pat |= BIT(7);
>>>>+
>>>>+    return pte_pat;
>>>>+}
>>>>+
>>>>+static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>+{
>>>>+    pte &= ~XELP_PAT_MASK;
>>>>+
>>>>+    switch (cache) {
>>>>+    case XE_CACHE_NONE:
>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WT:
>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WB:
>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>>>+        break;
>>>>+    default:
>>>>+        /* pte |= PPAT_CACHED; */
>>>>+        break;
>>>>+    }
>>>>+
>>>>+    return pte;
>>>>+}
>>>>+
>>>>+static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>+{
>>>>+    pte &= ~XELP_PAT_MASK;
>>>>+
>>>>+    /* Initially assumed as CLOS0.
>>>>+     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>>>+     */
>>>>+    switch (cache) {
>>>>+    case XE_CACHE_NONE:
>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WT:
>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WB:
>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>>>+        break;
>>>>+    default:
>>>>+        /* pte |= PPAT_CACHED; */
>>>>+        break;
>>>>+    }
>>>>+
>>>>+    return pte;
>>>>+}
>>>>+
>>>>+static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>+{
>>>>+    pte &= ~XELP_PAT_MASK;
>>>>+
>>>>+    /* Initially assumed as Non cohorent mode, correct values
>>>>+     * has to be set depending on requirement.
>>>>+     */
>>>>+    switch (cache) {
>>>>+    case XE_CACHE_NONE:
>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WT:
>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>>>+        break;
>>>>+    case XE_CACHE_WB:
>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>>>+        break;
>>>>+    default:
>>>>+        /* pte |= PPAT_CACHED; */
>>>>+        break;
>>>>+    }
>>>>+
>>>>+    return pte;
>>>>+}
>>>>+
>>>> /**
>>>>  * xe_pt_create() - Create a page-table.
>>>>  * @vm: The vm to create for.
>>>>@@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm 
>>>>*vm, struct xe_tile *tile,
>>>>     if (!pt)
>>>>         return ERR_PTR(-ENOMEM);
>>>>
>>>>+    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>>>+        vm->pte_encode = __xelpg_pte_encode;
>>>>+    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>>>+        vm->pte_encode = __xehpc_pte_encode;
>>>>+    else
>>>>+        vm->pte_encode = __xelp_pte_encode;
>>>>+
>>>>     bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>>                   ttm_bo_type_kernel,
>>>>                   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>>diff --git a/drivers/gpu/drm/xe/xe_pte.h b/drivers/gpu/drm/xe/xe_pte.h
>>>>new file mode 100644
>>>>index 000000000000..8b3b5b471a99
>>>>--- /dev/null
>>>>+++ b/drivers/gpu/drm/xe/xe_pte.h
>>>
>>>s/xe_pte.h/xe_pte_pat.h
>>>
>>>Just my option prefer this.
>>
>>dunno, but since we have different pte formats for ggtt and ppgtt, IMO
>>it would add to the confusion.
>>
>>Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
>>tables giving the meaning spelled out in the macros here for each index.
>>The rest of the code then need to set the bits in the PTE to reference
>>those indexes, according to the PTE format.
>>
>>>
>>>>@@ -0,0 +1,31 @@
>>>>+/* SPDX-License-Identifier: MIT */
>>>>+/*
>>>>+ * Copyright © 2021 Intel Corporation
>>>>+ */
>>>>+
>>>>+#ifndef _XE_PTE_H_
>>>>+#define _XE_PTE_H_
>>>>+
>>>>+#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) 
>>>>| BIT_ULL(3)
>>>>+#define XELP_PAT_WB_CACHE              0
>>>>+#define XELP_PAT_WC_CACHE              1
>>>>+#define XELP_PAT_WT_CACHE              2
>>>>+#define XELP_PAT_UNCACHE               3
>>
>>example... this duplicates what we have in xe_pat.c (comment added here
>>for clarity)
>>
>>static const u32 tgl_pat_table[] = {
>>        [0] = TGL_PAT_WB,
>>        [1] = TGL_PAT_WC,
>>        [2] = TGL_PAT_WT,
>>        [3] = TGL_PAT_UC,
>>    // .... those are programmed, but not expected to be used
>>        [4] = TGL_PAT_WB,
>>        [5] = TGL_PAT_WB,
>>        [6] = TGL_PAT_WB,
>>        [7] = TGL_PAT_WB,
>>};
>>
>
>TGL_PAT_WB maps to PAT table register bit mapping, we cannot directly 
>use tgl_pat_table to get PAT index rather we
>need to implement code to retrieve the index like below instead we can 
>use macro directly.
>
>xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
>{
>    u8 index;
>    for (i=0, i < 32, i++)
>        if (tgl_pat_table[i] == cache_type)

no, we don't want the caller to pass the platform-specific value.
It should pass a platfrom-agnostic value and xe_pat_get_index()
translates that to the platform-specific index. There are just 2 entries
really used by the kernel: uc and wb. Then the xe_pat.c returns what is
the entry to be used in those cases.

Lucas De Marchi

>            index = i;
>}
>
>
>>
>>IMO the abstration could be something like
>>
>>    // this is valid for both ppgtt and ggtt
>>    pat = xe_pat_get_index(xe, cache);
>>
>>    // this changes between ggtt / ppgtt
>>    pte |= vm->pte_encode_pat(xe, pat);
>>
>
>I have one approach like below example where we can use same function 
>for both ggtt and ppgtt
>
>static u64 pte_encode_pat(enum gtt_type, u8 pat_index)
>{
>    u64 pte_pat = 0;
>
>    if (gtt_type == PPGTT)
>    {
>        if (pat_index & BIT(0))
>            pte_pat |= BIT(3);
>
>        if (pat_index & BIT(1))
>            pte_pat |= BIT(4);
>
>        if (pat_index & BIT(2))
>            pte_pat |= BIT(7);
>     }
>    else if(gtt_type = GGTT)
>    {
>        GGTT type PAT PTE encoding code here.
>    }
>        return pte_pat;
>}
>
>
>vm->pte_encode_pat(u64 pte, enum gtt_type, xe_cache_level cache)
>{
>    switch (cache) {
>           case XE_CACHE_NONE:
>            pte |= pte_encode_pat(gtt_type, XELP_PAT_UNCACHE);
>            break;
>}
>
>what's your opinion.
>
>Thanks,
>Ravi Kumar V
>>
>>so the PAT indexes are handled by xe_pat.[ch]. The pte *encoding*
>>is then handled differently by ggtt and ppgtt. Thoughts?
>>
>>Lucas De Marchi
>>
>>
>>>>+
>>>>+#define XEHPC_PAT_CLOS0_UNCACHE        0
>>>>+#define XEHPC_PAT_CLOS0_WC_CACHE       1
>>>>+#define XEHPC_PAT_CLOS0_WT_CACHE       2
>>>>+#define XEHPC_PAT_CLOS0_WB_CACHE       3
>>>>+#define XEHPC_PAT_CLOS1_WT_CACHE       4
>>>>+#define XEHPC_PAT_CLOS1_WB_CACHE       5
>>>>+#define XEHPC_PAT_CLOS2_WT_CACHE       6
>>>>+#define XEHPC_PAT_CLOS2_WB_CACHE       7
>>>>+
>>>>+#define XELPG_PAT_WB_CACHE             0
>>>>+#define XELPG_PAT_WT_CACHE             1
>>>>+#define XELPG_PAT_UNCACHE              2
>>>>+#define XELPG_PAT_1_WAY_WB_CACHE       3
>>>>+#define XELPG_PAT_2_WAY_WB_CACHE       4
>>>>+
>>>>+#endif
>>>>+
>>>>diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>>>b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>index edb3c99a9c81..9e1b33c17d05 100644
>>>>--- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>@@ -312,6 +312,7 @@ struct xe_vm {
>>>>
>>>>     /** @batch_invalidate_tlb: Always invalidate TLB before 
>>>>batch start */
>>>>     bool batch_invalidate_tlb;
>>>>+    u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
>>>
>>>Add kernel doc.
>>>
>>>s/pte_encode/pte_pat_encode
>>>
>>>Again just my opinion. Let see if anyone else has an opinion on 
>>>the naming.
>>>
>>>Other than these NITs it LGTM. Didn't read to the bspec to check the
>>>actually bit setting, but can do that ahead of the next rev. Speaking of
>>>that, do you have a bspec link so I don't have to search through it?
>>>
>>>Matt
>>>
>>>> };
>>>>
>>>> /** struct xe_vma_op_map - VMA map operation */
>>>>-- 
>>>>2.25.1
>>>>
>
