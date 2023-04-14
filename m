Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3C2C77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 21:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9BA10E204;
	Fri, 14 Apr 2023 21:22:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428D10E204
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681507339; x=1713043339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YFvXEtgUyTOWuHNB2W3muCmIemnEyEUk7c63FqSdJYM=;
 b=mW123HbbGQcAFbjXNQd6XpRC0Jk966Jgfmfp0IQPawjJIEkT1B0d5WMk
 2NYxrxFJ3P/PllB/ekV844eS3ZWF1goCUfqv1Ru+hxRyUKVvC6Il/gkYd
 Y71LB7mfPntMLDS38kJC71BD3UUmIfD3/ea66OlXABAJEqVfo+fJ4yW4e
 ZCmmNGytYPuK3yD2kkIre/m4lAFSjw78oLAw0NV1AeADDgvB+S5UnEU/v
 3i1fStLHLWRsTol3pC04ziW1VtwqbnHamVvNcTjnQAmPHbm3RAu96rsF9
 nds9QrVjVxSXDhWbxOFQcY58LbnAWiGLTFdQZtvH2FnJPPtDAWfbyS6yN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346416137"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="346416137"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 14:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="689963289"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="689963289"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 14 Apr 2023 14:22:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:22:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 14:22:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 14:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHVKUBM6JglYKGU/sAkWPIwDPIBLJsC29+iZCcL8wfjwuC7JvUW6r9WjdkBxMD7E5sdl5mBhNwiPB8sWyD3Pmv9HvV1Y1CjwrrBYTOiCmSXGNlCYIaMdoktv/YRb5ct3Er2QkMPO0oZBLQ5qR4xnIbNOiYfGk4yAXhLIhfgL+WMs0QoAYUj5T+IUaJVUKnrXMcBWJROs0nDvWZr7N5NuZS37cpgy8EomzSfdbOwFfu7XARxnJT2wa/oSGTwdvA1clb9ktLJkRodYLoJ+3ywaBltu/8uf/5QUAalYXw3GRE6oJGUUfL8U9GxV3WBThLiZWIuEHVBCtEEv2zSCqTx5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2vPnIYiDkqc5OBJUBQreteAlJmnzasuypjYpdN+iIg=;
 b=g6tdax4kLYV3SSCBi5w2cYplqbx04St7bJnJQUu3f/37J+7FbAiRy3nv/Q+fo+Tz+OIpow+6vyqwhqPYeEKGTHDrkxSLU8cSB5/mLmRCdj1p6kzyd4KQfTo7LyXNo7OUwBCitVdWWU/D2sqUD/aC0mEtHyOFxaaA55BOeRiFsPbiuDxJsWd97DEiLAReJSVEHiV9RJ7REUNebFBRjz/MC8rnnnrIQ0MtN/A45iid2QesHLAd6lEgxfkyvVbBs8E4eHeBLPPUJIP4wSn90tWnS833zVbA4gromlSZlmqeLl7M3QNsj1CAfLXKNi2Jtz+3/yAbc+aEScN0XVfKq6JP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 21:22:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:22:16 +0000
Date: Fri, 14 Apr 2023 14:22:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <5567zi2jrx2nyrdbhrq7plyd3upo63omdlusf3sd3vi3eprw6y@2wql6n3cuped>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-8-matthew.d.roper@intel.com>
 <v2msdn4xhqzg45j4hts3mg235gmo4dfn6sdh6557ponc5mm5yv@4vgq4reqszsj>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <v2msdn4xhqzg45j4hts3mg235gmo4dfn6sdh6557ponc5mm5yv@4vgq4reqszsj>
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a05d29-1e42-4474-094e-08db3d2e526c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13EVaD3DEX99WpoIJ7wZqGqmjLFz03PCT7ldLkAioJubmsqGYnEwiSeHKW05jUayiCpJeYtRS6ugQOEVqrK7u1hrKd0OKE92wiUNWII98MyrY+I8UqEZdjie7CN9xG7JBmXT90ZFMqHKEpBqIyeycpP98IgO2i/rK34sn/y2ORU7GdKU4JjDMcNADtdwtGQMA/7stncNUhCZS+itzpCVcc/HfQXz9MaLmQNC9pOqF6EjIPDI+7Ez+hQ+lbSeaDSkfatNSU8R96mtLsyrQpU15PwW3TYIYY/KsYWnw0rJXLlruJO+8WMU0gDL6PDL3/7ay8MXcIjaWtOc3QoBoBvJQbko0ytGcOnP/gluHSOJ6XSw52mpVYxqbCyFOAU5CMmsMfgm1KHWUXCSPebeKueCatW1lcGZsFapGu3CKzA+aYrRRXIez1E1uU7o9st9R6J9jy7mdn+sL4TWKKSMotDPMS4sB+yun1Hwl67ifkFJt9mJ3BlKuFTFoA3NjZJ0iaHJrG9/iuiYJadTtLXlKfw74taUk79swe9INvhOjoP0WFu0YkVRNjYmGgLWeLqmfWtD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(66556008)(41300700001)(33716001)(186003)(4326008)(38100700002)(82960400001)(83380400001)(86362001)(6636002)(6512007)(66946007)(316002)(8676002)(2906002)(9686003)(26005)(6506007)(66476007)(478600001)(6486002)(5660300002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BdARqiuYq6L2dmY5bKTBrYcZMUcAlZ9RSSbFgOpCQCr778PZR2MdD3S1BDRz?=
 =?us-ascii?Q?vC1E1gK+tskfycOREYy79gpJhcWI76/Oe2zsMCi063ZmveoUJYs8dr+rxXxH?=
 =?us-ascii?Q?L0ECSDY2bByVNIa2Mf1ua1WiTYanFa2gBRw7iS5ywBLOqaBuE5lyHqEuHdzR?=
 =?us-ascii?Q?ZFeY5uZqukBVQiw/2vRAZoRgnAcgRDfgdWbCO1Yo4huHhfta6Mv0vnCIP/Rs?=
 =?us-ascii?Q?kTVTQEj/ujtP5Zpyan96sCaruVVUhh/x+QOAJVU9e5PJFXWeoMaAx1K+S96m?=
 =?us-ascii?Q?WEVbVQ3NEr0N409LQkBhUWdGWSKjSWvwpR+bUL4u8BdVoLq1/YdslWVyGcYn?=
 =?us-ascii?Q?q2Ctboxvgjni3cbTvgnxnVEt6xeYbL8Alv9H+ClB7FA22gREn4wPdJF3B9We?=
 =?us-ascii?Q?KNTCApDKCTeT9WbI09VVmk0e/exYXA3L49zDC18jrAae+7StMRLUKoIO2x1K?=
 =?us-ascii?Q?0JS1nW73zl6tcnpOMJlpeOwcvCM9EidUGf5J4Z4UM6qA7SvPMnaTO38F7YdE?=
 =?us-ascii?Q?xVIbGaxIDaf4tNW/NMIXpCafb+fRJiLcJJVeN+heNottUgT20lbhXVpe1E0f?=
 =?us-ascii?Q?u+xLffphFgLGWpRO7hgFiOCLqOMnAdovyi1lqBlYSbCN0GxEzhXcBeb1RNJg?=
 =?us-ascii?Q?Tb/kQulmeMw9hmTCF76/NWDjknf58WCv9I0KNRlTlQUEfC1pkilLhrGQtwij?=
 =?us-ascii?Q?yN6ZhgLO95FlnRx5H5ZKRDhjo/ZP9CmNQDdakLjJ4L1OmDyEuNCumisz3wgh?=
 =?us-ascii?Q?nTtChYTKe3ZFNJ36tetIAyxAg3YpAj6sNEGfr17uvybQJzXEIq+vmGDCHItT?=
 =?us-ascii?Q?Z/rPCQHMgRioTiRFuPFwDOddHDZtP49zLOoVCsTAE1hrla++RK7+mt0x7g4o?=
 =?us-ascii?Q?ohW8gCAWcTpEM9d+ZcaX49cy4QcJ6A3KzhkV0FEwN66Niw6aiwH9iypz63Ob?=
 =?us-ascii?Q?r88NZ5D3ZZHbkulueJ/RD4BccHTYlLFzZhPt0iGn3WaepXILrvOJKUaf/pNV?=
 =?us-ascii?Q?w+emW3RjsXFsmnA9f96yHD3w5K0LY9gNev5eiUo9yHQ3UNDaaG8RGl2lw5jY?=
 =?us-ascii?Q?060gDHh5R0Ai73qvYkFSZBLC/uXsIDIAX3UdGmIjuNT+3VctD/xqFh7XMIgO?=
 =?us-ascii?Q?+wOqv7JWMVNHu8uw0OzFz4ZC8rA6nkXzFqURLd/jfbU1nxiwVJcxZgiP0Umu?=
 =?us-ascii?Q?us8IJ++YkIClyVObjeBz5mZiW4IhkJldtxq7ngSW6mvdfz+g3J2ZD/My8KVx?=
 =?us-ascii?Q?9KR+iapWsDJS6vzX5YZpNcHl+s1mD4vE2elUgZNUX7qYSO7rQXZjlR5w8fmw?=
 =?us-ascii?Q?Lzg3+rxjJqIRVtPBIV8bmGOTpYd37Z62kCJP8mCY2AyxXMS8hKJMDUvlXT1T?=
 =?us-ascii?Q?6zKNM6JAt0Pi4xR3oOCMETNPpRtEPCHmLqlNYTPtoNf2IylUHnZtdTcXTbJl?=
 =?us-ascii?Q?PLT/ydS3xWIc6hY8I4gnw3bqDR0FAB1TAyTcy7N6SN+nKiJA7pEEVXy//uMo?=
 =?us-ascii?Q?7rM7ehBGOablfNetbOkEVW/tp5pahIIioTQfYnJuBbmKMqHaUw5rIxuqVdSF?=
 =?us-ascii?Q?M1N1Vg1n1w6RY4ZN2T4fHvXNLJcjwBrPEt/A+kdir1QCWsSGBDhFfDrRPRPM?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a05d29-1e42-4474-094e-08db3d2e526c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 21:22:16.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mTyDfXqr82HSIDh6j3Pa5PiXBx9Iadovn2/acPTM9d4zTnHMMLTzKOruAqf+AqeRkx0uFW1fXXyaTA46I6eCAiJvy4z2DndB2bdBhbBDc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8264
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/8] drm/xe: Invalidate TLB on all
 affected GTs during GGTT updates
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

On Fri, Apr 14, 2023 at 02:09:04PM -0700, Lucas De Marchi wrote:
>On Wed, Apr 12, 2023 at 03:52:47PM -0700, Matt Roper wrote:
>>Platforms with a standalone media GT share a single GGTT between the
>>primary and media GTs.  However each of these GTs has its own TLBs
>>caching the page table, and each needs to be invalidated separately.
>>Convert ggtt->gt into a list of GTs so that we can iterate and
>>invalidate them all.
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
>it's not clear to me if the call to xe_ggtt_invalidate() in
>drivers/gpu/drm/xe/display/xe_fb_pin.c needs to consider all GTs or if
>it's ok to keep that one on the first GT only.  +Maarten

which leads me to wonder if xe_ggtt_invalidate() shouldn't actually
receive struct xe_ggtt as argument and let the loop happen inside it.
AFAICS this is also the behavior in i915: guc_ggtt_invalidate().

Lucas De Marchi

>
>Anyway, it should be done with one additional fixup commit due to the
>way we are moving display up on rebases.
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
>Lucas De Marchi
>
>>---
>>drivers/gpu/drm/xe/xe_ggtt.c       | 15 +++++++++++----
>>drivers/gpu/drm/xe/xe_ggtt_types.h |  2 +-
>>drivers/gpu/drm/xe/xe_gt.c         |  4 ++++
>>drivers/gpu/drm/xe/xe_gt_types.h   |  2 ++
>>4 files changed, 18 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>index 0ae373b604f6..374830a7a0cf 100644
>>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>@@ -98,7 +98,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>
>>	XE_BUG_ON(xe_gt_is_media_type(gt));
>>
>>-	ggtt->gt = gt;
>>+	list_add_tail(&gt->mem.ggtt_link, &ggtt->gt_list);
>>
>>	gsm_size = probe_gsm_size(pdev);
>>	if (gsm_size == 0) {
>>@@ -139,6 +139,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>>{
>>	struct drm_mm_node *hole;
>>+	struct xe_gt *gt;
>>	u64 start, end;
>>
>>	/* Display may have allocated inside ggtt, so be careful with clearing here */
>>@@ -146,7 +147,8 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>>	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>>		xe_ggtt_clear(ggtt, start, end - start);
>>
>>-	xe_ggtt_invalidate(ggtt->gt);
>>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>>+		xe_ggtt_invalidate(gt);
>>	mutex_unlock(&ggtt->lock);
>>}
>>
>>@@ -263,6 +265,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>>
>>void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>{
>>+	struct xe_gt *gt;
>>	u64 start = bo->ggtt_node.start;
>>	u64 offset, pte;
>>
>>@@ -271,7 +274,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>		xe_ggtt_set_pte(ggtt, start + offset, pte);
>>	}
>>
>>-	xe_ggtt_invalidate(ggtt->gt);
>>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>>+		xe_ggtt_invalidate(gt);
>>}
>>
>>static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>>@@ -316,13 +320,16 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>>
>>void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>>{
>>+	struct xe_gt *gt;
>>+
>>	mutex_lock(&ggtt->lock);
>>
>>	xe_ggtt_clear(ggtt, node->start, node->size);
>>	drm_mm_remove_node(node);
>>	node->size = 0;
>>
>>-	xe_ggtt_invalidate(ggtt->gt);
>>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>>+		xe_ggtt_invalidate(gt);
>>
>>	mutex_unlock(&ggtt->lock);
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>index ea70aaef4b31..fd527179f81b 100644
>>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>@@ -12,7 +12,7 @@ struct xe_bo;
>>struct xe_gt;
>>
>>struct xe_ggtt {
>>-	struct xe_gt *gt;
>>+	struct list_head gt_list;
>>
>>	u64 size;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 4186f7f0d42f..a07d17af3db0 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -71,6 +71,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>>		if (!gt->mem.ggtt)
>>			return -ENOMEM;
>>
>>+		INIT_LIST_HEAD(&gt->mem.ggtt->gt_list);
>>+
>>		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
>>						GFP_KERNEL);
>>		if (!gt->mem.vram_mgr)
>>@@ -81,6 +83,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>>
>>		gt->mem.ggtt = full_gt->mem.ggtt;
>>		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
>>+
>>+		list_add_tail(&gt->mem.ggtt_link, &full_gt->mem.ggtt->gt_list);
>>	}
>>
>>	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index 7c47d67aa8be..1eff57f43731 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -164,6 +164,8 @@ struct xe_gt {
>>		struct xe_ttm_vram_mgr *vram_mgr;
>>		/** @ggtt: Global graphics translation table */
>>		struct xe_ggtt *ggtt;
>>+		/** @ggtt_link: node in GGTT's GT list */
>>+		struct list_head ggtt_link;
>>	} mem;
>>
>>	/** @reset: state for GT resets */
>>-- 
>>2.39.2
>>
