Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EAFC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A4010E352;
	Fri, 17 Mar 2023 16:06:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFED810E352
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679069189; x=1710605189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KE7jLna34GX5tgtgUTvNDX4DhGgqDs5NuB2vpj2oJBU=;
 b=lFSulk2FhDBO+2BUFK17X7FpNv3km1gFHYMqg0Bwv6L8QN43Y1rTqMWd
 ynaT2JO7GL/Vc+eisDCv+VNd/3p6wUz9ZZwpAKXUyGds17JtYH0VNK/dG
 4dDbZRTMAQI4qFrccjKLhNzh8IkHFb8zVFCckjTljvpHKTJQEcA9RLvSV
 5gXlrFAN79QwbLjpChB7zR3f6m4rGSANbRreUr5Mmp/JvO9/up0HWbCrT
 gYfUFRctBzNyr/S6pgfyaRbQc1AVUjyR8rcqarYsMElTYtFZkKSs6EUTz
 aMaIKF+TaevY1PsSFww3/82rpq0AiqR3qPp7hOCHA/oHILY4cpNletHJE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="365993217"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="365993217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 09:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="682734637"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="682734637"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2023 09:04:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 09:04:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 09:04:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 09:04:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSXG4ROd6pc0n9EadtsfpomrBXsbJrkj2IPeA0LOPQTcoRBW11MW2NW27qcwH6u0nzLpLs2P+bXsH/PQaQthR8H87fZ4kpvt94KTYtrDUtPmci0LAIbn3uJrGOH0qcDMWMVLmP6cs4L/OBdnVnjsdPRMqxzt1O7GvAGkgwgAe21GxwkolDkzwL5BWGzQgdRLi7VnCZMIyWXkptw+lQX08i6DAtSRI3u//Xtk+AD0qBn5Lwlw8R1tx9wlA3B50wh6HXWAh9JK6l3CIdJT+js2SkonBE7qKWWokxa2csWHOsIknRQPWUhuJ/6xGNrJiE8+0F5sDb2NXH8bzb+Pf8eQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dsqZZI5idbiLdiKexD+g5hDKKICUKHUlwzL4zJzbUM=;
 b=Vy1Kg+B8IqNYhH7U35RnwEz6jpdFnIe7fgcTK1X7W7jOf5aI1DH/e3Tl9SzX7ksDQncjpwBgL/TYTGlkYLG9gJxcpoA02YGuW1/57K+hxos5G6htzwv4CwNrOIlUmFrnyVH0yNupFxbt3/In5OYJNnEDFiV5nQ5p6TB+7hnq68LvtbUTp0J6MF0yDX1jI5YvcmxoR2KfhInPQxTDHxpWFc6HMLXqeSRV1epukcMJ+Ppc27Z2lYNJOma2AGsa8ntuNVHYVheTlczj5pdc73pMab3H2mWXQhZvDFmnLYyow3PjFdX9QWIN2nF00RHLEdFNz7GPJUdAZvYlD7b1CXaLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7116.namprd11.prod.outlook.com (2603:10b6:806:29b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 16:04:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 16:04:14 +0000
Date: Fri, 17 Mar 2023 09:04:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230317160409.7a7zlyj6sh66cvie@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
 <20230317153531.1011865-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230317153531.1011865-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: fb593816-10b7-4942-4831-08db270140c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUUoSAG3U1BCEQV9BaltBsP9lQVy6CzhIFr/wi0W83suTMVbj6Cl7HyYv/6FYJC5+hvniBmKLcoOCIdUfDX0d+N4nSpFc9vKYRPCNKeg83edUfjkb0LwVdJQvfgYvHe88zY/K0Fgt5LAcrNyIYpUw47s1lDfOtk8ltxwKgO9dVoM7IOmvz7ogSjvKSG8/xmOAKKSYfVQjHQ9wDN/Z7CRnIZAYlAbSJv2+ABwSvgNFK9AllNRsSzwJE3bZgIyZYque5q4Rxk6fUZwa4TrdIqJQyAfUV0vLtwvE+0B3Lo/hJ/05ns+2BTr7TP9TuEvjtn97WRuTwQUElk8mvALI1F84oC1qrE//3Fm1vRsKGtn8UqFQILZaK+NucMQUY+4XmOc5eoyd5J0WCHLhBbjSCe6g2FteWj/JJawYTV1U2oO9Vqq0SncfRzFb1JP/mQFR1KrPWzm2w14zWJAt9KwCRihOUhJi6NYihwYWQ998R03IkCzvs627VROZsMBcuX1T0WfI90m/4a7uEXw/c/OHMknpB3FX9/qV1G3YeTupbiXyW90zOW38+zJTO9Ucp2J5GlXlyYsfUo4XSMIN8LKca/y12ugC+Wxqhx0iT97Q75qxKjk1LTQ8HHjj6dWw/SI3HHEKbUDlgJYxoeJ/kY/AvG0IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199018)(2906002)(83380400001)(6506007)(26005)(6486002)(107886003)(6666004)(1076003)(5660300002)(66556008)(66946007)(316002)(186003)(8936002)(41300700001)(6862004)(4326008)(86362001)(6636002)(66476007)(6512007)(38100700002)(8676002)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LE15UL4ZEmu/ZXgvKo2FckJnddFkLev6YQJz7iyjW6kmXBGp25aLBT+RXgUA?=
 =?us-ascii?Q?0qElWzYhz6Wz1/orcnzyySOYHJAlM7bikUKCSf9z5DzwXOwBtv/9ghTtRl61?=
 =?us-ascii?Q?umWC7C/q7MXAagHX4NHCsn3YOXSqIe668tgNIuiehF0PipgjDdmeUoqrtVQ8?=
 =?us-ascii?Q?r9sqYvJid2Gci+2P32jvuro4hEt7SKQ9InsAAsRw+1LFG3S62WfBS4VKLBcA?=
 =?us-ascii?Q?Re78rKqVHKAbMGUblKPoNr4QValJrgwm1YgB8etjdAihyu84azPhaQPUubg9?=
 =?us-ascii?Q?NVoMRYrVgP+xbZnyXuwrdccJknClY9Y9zHzbt0RgqvoqV1aaz/aXBLtrNtOl?=
 =?us-ascii?Q?yC5EFFmgE+f4zPVKDsVu/jB2TtxrHz9n9+MtgCmA/RQ7uOc98osGLKY+Vq3s?=
 =?us-ascii?Q?yGMUdqLbjf+EXsRQFXqY72gQ2qLpCcmIPQaWhnK0kT8KqTNNNbCPhZ2B11dV?=
 =?us-ascii?Q?L6aSBHhzPr2BOE/UnP51mNx58fCjr6ono+QI9ZlVNd4yBBE8bNIy5q6aFstW?=
 =?us-ascii?Q?I/nmLFjnig9NIeW2SP62Mc/pN70Fbqh+a008uIIRb043lRaTWzfCCAQtbq9e?=
 =?us-ascii?Q?RPI7fmJ6q2LpTBKnrjR6P49mc0Z4EadzJryYOQ+fDYOzCj7IZcavXLrqnyD/?=
 =?us-ascii?Q?yf0uP+zFK4m9+xFBrEpeP2z7tzpabykVMoP3BYXSEmdO14SI8gAzR1AbOG20?=
 =?us-ascii?Q?Pb/uXhjBeXMy/PpyOWtqHgCt2SmKhCNJuFB9FqaeIgl+w2m9TyEsVtofpXUi?=
 =?us-ascii?Q?9vRC42tcYHEtOzpcM2AzcrodZ1/uv/A87ryDN5H6kCwFmf+HR5VwhXifLQNQ?=
 =?us-ascii?Q?PYkkJSLdrivvhYj5lqDNHmW0I7PD47AGiM8AklQ0+lPQa2a5ujrqYPqXFqcD?=
 =?us-ascii?Q?EJI/4XACI85TbtPWqUuzAdDiuZbGXyYfWgFW6MxsAkD6TLbObOSq7OkM4TfB?=
 =?us-ascii?Q?uPnRzEA86AnJQ7BSniYMv7jNm9ectazs1/atmsqO0wH8YuvpeFG5l8KPYMXN?=
 =?us-ascii?Q?5XktRZQ+UbRTk3aAhqTFn11u0SgqLpd9Q2tyQu5q/gCMgEVlxrxcZt4QYuKc?=
 =?us-ascii?Q?n4WhJ7VocXcuYznm1xjlrxX4cV6erwGsYoFKwhDomDQEO+zvIC+jsFK3Eg0Q?=
 =?us-ascii?Q?AoW+o/O44iaXyXzxF+htmympj5+ARE2o2wnHC4F0aGUv1DtgAwPqgop8AkQc?=
 =?us-ascii?Q?klbV8XoYCwo84zJQOuJJA2uCsZgMXZHc04Gvd2P/Tid7hqm9ipXFo9NE1xiU?=
 =?us-ascii?Q?IUqVc1BvM7YpXvJWhNThCG/v12wc9ngvflrszZrBzHPneFCBxDw8qrBl3G0Z?=
 =?us-ascii?Q?oD08Tubt2lPhQNUbuCEhW8DzqxCTu2bkKFS5KxMWiBKAGznHn5bwrJxWfY1u?=
 =?us-ascii?Q?4hQUSlS73WsCFUIm0k7bpcUk7f06+KAXRMn1Ke9ZG7VhQTgJSvmeaP6bmX+Z?=
 =?us-ascii?Q?e9Lv40CpaeTwH3h+ZfuX7o30qAgkfiegWrdAZgGRpoVht98sacXresDlW7mW?=
 =?us-ascii?Q?Bmzv5/vJX3m9nKO64DvlkJqmEpNXwgAfMRkwiqsLrsY+3kcFqs2lxOqrI7gk?=
 =?us-ascii?Q?/uUH8WnV3O5T8vPXdfJctAiOHg/AZr+/++Nazpaosiwzvq0dMHSELCrtYmLy?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb593816-10b7-4942-4831-08db270140c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 16:04:14.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7JP1Q8CGwdbG6OodnUVMfbbnaf0G7g6Za/tI/3CJHmWHWaEjFn3oITYLEhz7IyMVK8WlP4Vh2kGMiNhmrV9gskj9UZ5ylha3WNfwxQyhT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7116
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Stop accepting value in
 xe_migrate_clear
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 09:05:30PM +0530, Balasubramani Vivekanandan wrote:
>Although xe_migrate_clear() has a value agrument, currently the driver

argument

>is only passing 0 at all the places this function is invoked with the
>exception the kunit tests are using the parameter to validate this
>function with different values.
>xe_migrate_clear() is failing on platforms with link copy engines
>because xe_migrate_clear() via emit_clear() is using the blitter
>instruction XY_FAST_COLOR_BLT to clear the memory. But this instruction
>is not supported by link copy engine.
>So the solution is to use the alternate instruction MEM_SET when
>platform contains link copy engine. But MEM_SET instruction accepts only
>8-bit value for setting whereas the value agrument of xe_migrate_clear()
>is 32-bit.
>So instead of spreading this limitation around all invocations of
>xe_migrate_clear() and causing more confusion, it was decided to not
>accept any value itself as driver does not really need this currently.
>
>All the kunit tests are adapted as per the new function prototype.
>
>This will be followed by a patch to add support for link copy engines.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
> drivers/gpu/drm/xe/tests/xe_migrate.c | 16 ++++++++--------
> drivers/gpu/drm/xe/xe_bo.c            |  2 +-
> drivers/gpu/drm/xe/xe_migrate.c       | 14 ++++++--------
> drivers/gpu/drm/xe/xe_migrate.h       |  3 +--
> 5 files changed, 17 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
>index f03fb907b59a..3c60cbdf516c 100644
>--- a/drivers/gpu/drm/xe/tests/xe_bo.c
>+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>@@ -32,7 +32,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
>
> 	/* Optionally clear bo *and* CCS data in VRAM. */
> 	if (clear) {
>-		fence = xe_migrate_clear(gt->migrate, bo, bo->ttm.resource, 0);
>+		fence = xe_migrate_clear(gt->migrate, bo, bo->ttm.resource);
> 		if (IS_ERR(fence)) {
> 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
> 			return PTR_ERR(fence);
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index ac659b94e7f5..2d3d9c44ef4e 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -86,7 +86,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 		      struct kunit *test)
> {
> 	struct xe_device *xe = gt_to_xe(m->gt);
>-	u64 retval, expected = 0xc0c0c0c0c0c0c0c0ULL;
>+	u64 retval, expected = 0;
> 	bool big = bo->size >= SZ_2M;
> 	struct dma_fence *fence;
> 	const char *str = big ? "Copying big bo" : "Copying small bo";
>@@ -117,7 +117,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 	}
>
> 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
>-	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource, 0xc0c0c0c0);
>+	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource);
> 	if (!sanity_fence_failed(xe, fence, big ? "Clearing sysmem big bo" :
> 				 "Clearing sysmem small bo", test)) {
> 		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
>@@ -287,10 +287,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	bb->len = 0;
> 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
>-	expected = 0x12345678U;
>+	expected = 0;
>
> 	emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
>-		   expected, IS_DGFX(xe));
>+		   IS_DGFX(xe));
> 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
> 		       test);
>
>@@ -302,8 +302,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	/* Clear a small bo */
> 	kunit_info(test, "Clearing small buffer object\n");
> 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
>-	expected = 0x224488ff;
>-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, expected);
>+	expected = 0;
>+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
> 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
> 		goto out;
>
>@@ -321,8 +321,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	/* Clear a big bo with a fixed value */

/* Clear a big bo */

since we don't have a value anymore

other than these small nits, lgtm. With those fixed:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

> 	kunit_info(test, "Clearing big buffer object\n");
> 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
>-	expected = 0x11223344U;
>-	fence = xe_migrate_clear(m, big, big->ttm.resource, expected);
>+	expected = 0;
>+	fence = xe_migrate_clear(m, big, big->ttm.resource);
> 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
> 		goto out;
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 73a7f2cd4ad8..557d6b89a6ba 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -670,7 +670,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> 		}
> 	} else {
> 		if (move_lacks_source)
>-			fence = xe_migrate_clear(gt->migrate, bo, new_mem, 0);
>+			fence = xe_migrate_clear(gt->migrate, bo, new_mem);
> 		else
> 			fence = xe_migrate_copy(gt->migrate, bo, old_mem, new_mem);
> 		if (IS_ERR(fence)) {
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index c0523d8fe944..fdcbab31a418 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -747,7 +747,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> }
>
> static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>-		      u32 size, u32 pitch, u32 value, bool is_vram)
>+		      u32 size, u32 pitch, bool is_vram)
> {
> 	u32 *cs = bb->cs + bb->len;
> 	u32 len = XY_FAST_COLOR_BLT_DW;
>@@ -765,7 +765,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> 	*cs++ = lower_32_bits(src_ofs);
> 	*cs++ = upper_32_bits(src_ofs);
> 	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
>-	*cs++ = value;
>+	*cs++ = 0;
> 	*cs++ = 0;
> 	*cs++ = 0;
> 	*cs++ = 0;
>@@ -789,10 +789,9 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  * @m: The migration context.
>  * @bo: The buffer object @dst is currently bound to.
>  * @dst: The dst TTM resource to be cleared.
>- * @value: Clear value.
>  *
>- * Clear the contents of @dst. On flat CCS devices,
>- * the CCS metadata is cleared to zero as well on VRAM destionations.
>+ * Clear the contents of @dst to zero. On flat CCS devices,
>+ * the CCS metadata is cleared to zero as well on VRAM destinations.
>  * TODO: Eliminate the @bo argument.
>  *
>  * Return: Pointer to a dma_fence representing the last clear batch, or
>@@ -801,8 +800,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  */
> struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 				   struct xe_bo *bo,
>-				   struct ttm_resource *dst,
>-				   u32 value)
>+				   struct ttm_resource *dst)
> {
> 	bool clear_vram = mem_type_is_vram(dst->mem_type);
> 	struct xe_gt *gt = m->gt;
>@@ -867,7 +865,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 		update_idx = bb->len;
>
> 		emit_clear(gt, bb, clear_L0_ofs, clear_L0, GEN8_PAGE_SIZE,
>-			   value, clear_vram);
>+			   clear_vram);
> 		if (xe_device_has_flat_ccs(xe) && clear_vram) {
> 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> 				      m->cleared_vram_ofs, false, clear_L0);
>diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>index a569851db6f7..1ff6e0a90de5 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.h
>+++ b/drivers/gpu/drm/xe/xe_migrate.h
>@@ -79,8 +79,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>
> struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 				   struct xe_bo *bo,
>-				   struct ttm_resource *dst,
>-				   u32 value);
>+				   struct ttm_resource *dst);
>
> struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
>
>-- 
>2.25.1
>
