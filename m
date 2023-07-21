Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66093C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D79110E6F4;
	Fri, 21 Jul 2023 20:42:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67D610E6F4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689972146; x=1721508146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z82I2eJZ9R8qir63U2JxX2HxCWWkqZCclnnTfjFcZfU=;
 b=AZn7BQAXk4t7Gv08qETGvTYm/MHcQgQR/75VR0zZrVORmRFQADedq6oj
 jeBpw1jFFOBcEu/f55dKGELQKag+0ORUdJTa2k1hql8+qp79UiTspxzMT
 /QpY2A2C5Ta2b2rQDcSeOeQw16oXzFB9ezDx1EoLPbLrr5mlislHHfs+r
 QYzWfW4drPsfMNZqQWGvTYD9HfT3+Mn9wh8uZGqt8mH2RGnNbultmC8vV
 xhA5KdlXv/mUPBN9a+/1jwHAYbk/TdLAmZmD7QSlsAB6/dpFQ79CpQW7s
 ExnQGbdqUFlj0zqSrI81xKFZm2XGPltrVQVudp6EjosaSNq4QsXQxxodp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433347151"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433347151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055690448"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="1055690448"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jul 2023 13:42:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:42:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:42:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKG07hmOVEnic5DROQbHH8EMfkXgTpDoPaZ5r8kGo8BDvPezsaGhml5VF0QcmMKSLOyrq89otAFzmWfpjSmFjQ59i9QQN/mSb1mataDDlLyAZppnkb0Qb3lKuhQgbc2YGpb5OBQSAqWPUfLGX3VmqakMZfqKqBvurn160tPaKp7qcJSbrBBloDbU0AXsqpeIw1qdkaOmJQGFCtNKdDBgkGPi71c/uD0je0G/kkDXFjzYCifP3z8VIF8imKYQjf1G0tpjb2WaUxDPOHcwoH3oVQMLunFaI7ZfbUIanWGIMwk+wurnty4K8k+mjwzUN7QHBSJlDh0SFOm/Vs9rOyU7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5yYWjdTvyhlnliqQIEyVPkoUwTsw6j+WS7Dpd4P8/4=;
 b=ktytxP/UMbkBrGIWfG2W+85XsivRHpNfI+dCOKc3uT4tGT4gM+AFE7S/7kTUI+XB145Giv8AFmMQ2CBcnv/H21RYF+cr4PaOS9cM02x7K2bPXL4XABz+eacUW76ozuyfoEF0tpC9L///lcA5MgBJEMmUYrqX+ywDK3kvhluvevRTaIshtxVGAON5ZQXUxVxf2AfnfadpM+XFqzkjQLcv911u5pcz218M2lOIY+XlXVYliAzsArMda8VASLstU3WlpWED0/tz5VFEZAqOV2TBe+y+E0y/wmWYHONwNgda2gAUpDQM9h95ei8qCNFieQcZQsQro8FEa2hXWZQ93JKYgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Fri, 21 Jul
 2023 20:42:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 20:42:24 +0000
Date: Fri, 21 Jul 2023 13:42:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <fe75j3veluxlrknp7hmawpoy5mokdkdty7g4zsmr4eufb2bqxy@qmfaosaslr5z>
References: <20230721191027.267010-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230721191027.267010-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: b4902a01-40a5-4e2d-4b0c-08db8a2afc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: an3iIpB4+joD48v7R6td/42mUpU2FmHZrT+JBnkkARc5lvABSJvEVGRZCnIpNXLtaykEe40+Db1qUuH/Yd1jaDQpiWRvg0zQkVPGDxin9yoVdf2x3f1nxsCqUeh1VedWCcQIscOYK9e8nugeGi6XUv9M8sCufV8Jy8+aKeeuvQnoE8GN8slP4xCW+HGrrSDe+CQ+WgL9ANpgkbZQ+VtSHKJQpObL+ky0ecdHZnwGHtrtQW3PkZhWDsXPOZbxRzXezUe9PQIccB1s91heIwwr7HP2K4GLiDazjP24PaA9JABOE2Ibl+mXARyEhLwXjdt/dSEuQClgOt7VMPN9cf2EXHCuy+ref4VPKfF8YAbI7TGPdm4Ga9ChSSr9CDxyeUKqs8H/6mByaU0Q63gvOZXMIoZEWRsKAmVEXXfSAjoq3GdbD3SRcccRYvEkPAbWUgwofI5sTUjGNstvnUaGepes5cfAJWdUv8K3hElEFPgkIIqW9Nwd6cfH/CL/esyh83njyCyIS2Q+RfbMnhCODqr9RM7MtIZayMM96E3ecdJoDSb7iPAOijBGWldXt22POJmq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(6512007)(82960400001)(6666004)(478600001)(186003)(83380400001)(26005)(6506007)(9686003)(107886003)(6862004)(33716001)(4326008)(86362001)(6636002)(8936002)(41300700001)(316002)(8676002)(6486002)(2906002)(66946007)(38100700002)(66476007)(5660300002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wlMLOIasSfc2qFZefyAfniFy/wB9yHlPsKawBdPj1DU9J9gUJLPR6XGNIM/W?=
 =?us-ascii?Q?q8j6Z5KEy6hx8NOi6Vg31sdl4yem3qOaBxmASkze8PCBM+ZUbG3UcABeN642?=
 =?us-ascii?Q?LhWOZCvpht6eqif23gVt4k7ayFxnqqJtCeJP7q7lx4As35Yp+ODHNJxldpVn?=
 =?us-ascii?Q?xfiKRnYf/MGnEq8r7bqC+vVV3/CFZD/RrMqN2pagYX1Js/+nBlKTFNQzpyJl?=
 =?us-ascii?Q?ps9wy+tYtw0gx86DyIf7RWGYz6ZqevI4O/CdjD/RH7vkMFghqzMot7clnTwS?=
 =?us-ascii?Q?2YOFdSovTX2jmjGSZgjwOm2BXqdGkFLAV7duzpvbq5ATkyC9MFXxUBhuhZDe?=
 =?us-ascii?Q?5jS9qerdv2Tw7oOPQC9xNkpxfd4fUBdj6Odako4XdanvDe6vxVI37yO5dQlg?=
 =?us-ascii?Q?HYP4eSin14d5iSMpPRKbtOutjAlAbNfgLlh3cP0dSOyof+UVwQ5MjZGch9lv?=
 =?us-ascii?Q?1pvnDrnLkM2g1cr8nVs0middSoCJH9edMQpQdJZCMIW8LO0vqdXtDCJcByk/?=
 =?us-ascii?Q?0011dwymYAIY7gU/z2D9wh8PPuj6kVq0axofrhjSEJ0wPFFVzFslSjunTzZr?=
 =?us-ascii?Q?gV00APyF7R64E7al6vcg9fr2JxtkdvTAf7IjQ3TWxGRARar+9MeqTzdEVFz7?=
 =?us-ascii?Q?zW8w/AnZxcUli0Ak6h3dIi4+oYr/hi/POMDg7in3neL6q+DhdAbK5onV1A9p?=
 =?us-ascii?Q?Ulip8oV5L5SzNVC9JG58Iuj7IRWo9u/6uj3kav7NsCI1L7M1G7gpRLkNkA+V?=
 =?us-ascii?Q?XPnvj8qkrcnCu7DOVVjk5IKiK08rLpxHq6xHTsV2ny/ZTQqgn5vsFln7JWYi?=
 =?us-ascii?Q?3xJ2m9rBSkfWXF4wf6jtU1fYdDgKocp13JJ4e5nPLi8F6Eyfpw87cPoVOGNP?=
 =?us-ascii?Q?5MK9rsP2ZkNBSc1FL1fehA9aiko+YfajMFFTbjrI1nL36EstByfiwDDXCppc?=
 =?us-ascii?Q?9leG8J4BTXqWlxQxawFcUPdqmtj70RUp4fPsbEr4pvHBOXPaF/xZKVPpO8lr?=
 =?us-ascii?Q?gFKElpYXUdPA8DAnWW6bHtGfVt5y3XjDhTp42RH2awMF+ODWbOHxlaDIIQ+c?=
 =?us-ascii?Q?Quvnwt6rK6Uyp7QyXLc9L8qA5IjRCfNJec7HskVZlJmCMEdYlWB59I+1iREH?=
 =?us-ascii?Q?Re9OZ5e5DMdrgCHcXq3iECQ1Zfa6sl5ASV1kvDGD6k0OdiUWmYzdnKGqoUEh?=
 =?us-ascii?Q?SJJ5FcY3cPShvcg0slLBrPBin4Bfl9yZ8EbA9OooImr/HQdWnZDwQkE7h5G8?=
 =?us-ascii?Q?U/FVfy070oJoWqgEOrtm52XRfySfhJNSQoBlGG3PMfZqXwS2h7E4XMV7fliv?=
 =?us-ascii?Q?12+DiXYwgOjkjxX4MxJORZQM7knMDwtVkqLlhYG3kui5911B6SHnCA3AL2bd?=
 =?us-ascii?Q?gWWhh+i1bIeNuY+i4S3jekB3jBmwr7TppTQ77LsftfaWdjfcj1+Dxjc2wSU/?=
 =?us-ascii?Q?rAB6P50tXUpzkYQ51zk2rriOfDJV5MN/DwVAsm7yFoJ6r0I2wmKgPflwmbnD?=
 =?us-ascii?Q?T5Z+3nAifSpMMNZnY5KiRS6qHCZ+Hf5hrqTXv5VGuDfFQpX9zX7IfvYCpo+d?=
 =?us-ascii?Q?oH927bAvlJ20gnwYt3ASskmPqI1MJP7ntYkRNael0ZD2X3lqumWkHDbLPfVI?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4902a01-40a5-4e2d-4b0c-08db8a2afc65
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 20:42:24.6181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bHMu5a9NEDm+j314NqFdt5+bVkCYYuFGa3E4tJ83GY4GTDV4fPb6xRCXwxVqSt9hG2AJNazdBmsgDVmp43p8HptZfwJ4EL9dDbcARKNH4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mtl: Increase prefetch size
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

On Fri, Jul 21, 2023 at 12:10:27PM -0700, Matthew Brost wrote:
>MTL requires 2k prefetch for RCS hw engine, fix this. Also wire up hwe
>class in this calculation to not waste space in the common case of using
>a BCS hw engine.
>
>Bspec: 45718
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_migrate.c |  3 ++-
> drivers/gpu/drm/xe/xe_bb.c            | 21 ++++++++++++---------
> drivers/gpu/drm/xe/xe_bb.h            |  4 +++-
> drivers/gpu/drm/xe/xe_gt.c            |  4 ++--
> drivers/gpu/drm/xe/xe_migrate.c       |  7 ++++---
> 5 files changed, 23 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 30e5fdf6ca63..71a127efe99a 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -286,7 +286,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 		goto free_pt;
> 	}
>
>-	bb = xe_bb_new(tile->primary_gt, 32, xe->info.supports_usm);
>+	bb = xe_bb_new(tile->primary_gt, m->eng->hwe->class, 32,
>+		       xe->info.supports_usm);
> 	if (IS_ERR(bb)) {
> 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
> 			   PTR_ERR(bb));
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index f9b6b7adf99f..15e616fcccef 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -14,21 +14,23 @@
> #include "xe_sched_job.h"
> #include "xe_vm_types.h"
>
>-static int bb_prefetch(struct xe_gt *gt)
>+static int bb_prefetch(struct xe_gt *gt, enum xe_engine_class class)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>
>-	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
>-		/*
>-		 * RCS and CCS require 1K, although other engines would be
>-		 * okay with 512.
>-		 */
>+	if (xe->info.platform == XE_METEORLAKE &&

why are we checking for platform here rather than IP version? I think we
can take the route of doing a >= version here.

>+	    class == XE_ENGINE_CLASS_RENDER)
>+		return SZ_2K;
>+	else if (GRAPHICS_VERx100(xe) >= 1250 &&
>+		 (class == XE_ENGINE_CLASS_RENDER ||
>+		  class == XE_ENGINE_CLASS_COMPUTE))
> 		return SZ_1K;
> 	else
> 		return SZ_512;
> }
>
>-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>+struct xe_bb *xe_bb_new(struct xe_gt *gt, enum xe_engine_class class,
>+			u32 dwords, bool usm)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
>@@ -44,7 +46,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> 	 * requirements.
> 	 */
> 	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
>-			      4 * (dwords + 1) + bb_prefetch(gt));
>+			      4 * (dwords + 1) + bb_prefetch(gt, class));

I'm actually wondering why we need this bb prefetch at all. Couldn't we
just always map the scratch after the bo and call it a day?

Lucas De Marchi

> 	if (IS_ERR(bb->bo)) {
> 		err = PTR_ERR(bb->bo);
> 		goto err;
>@@ -66,7 +68,8 @@ __xe_bb_create_job(struct xe_engine *kernel_eng, struct xe_bb *bb, u64 *addr)
>
> 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>
>-	WARN_ON(bb->len * 4 + bb_prefetch(kernel_eng->gt) > size);
>+	WARN_ON(bb->len * 4 + bb_prefetch(kernel_eng->gt,
>+					  kernel_eng->hwe->class) > size);
>
> 	xe_sa_bo_flush_write(bb->bo);
>
>diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
>index 0cc9260c9634..ad6170b0b23a 100644
>--- a/drivers/gpu/drm/xe/xe_bb.h
>+++ b/drivers/gpu/drm/xe/xe_bb.h
>@@ -8,13 +8,15 @@
>
> #include "xe_bb_types.h"
>
>+enum xe_engine_class;
> struct dma_fence;
>
> struct xe_gt;
> struct xe_engine;
> struct xe_sched_job;
>
>-struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
>+struct xe_bb *xe_bb_new(struct xe_gt *gt, enum xe_engine_class class, u32 size,
>+			bool usm);
> struct xe_sched_job *xe_bb_create_job(struct xe_engine *kernel_eng,
> 				      struct xe_bb *bb);
> struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 3e32d38aeeea..d928b161c480 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -88,7 +88,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
> 	u64 batch_ofs;
> 	long timeout;
>
>-	bb = xe_bb_new(gt, 4, false);
>+	bb = xe_bb_new(gt, e->hwe->class, 4, false);
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>@@ -126,7 +126,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
> 	long timeout;
> 	int count = 0;
>
>-	bb = xe_bb_new(gt, SZ_4K, false);	/* Just pick a large BB size */
>+	bb = xe_bb_new(gt, e->hwe->class, SZ_4K, false);	/* Just pick a large BB size */
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index bc7dac4e2086..649ba38bca81 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -685,7 +685,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 		batch_size += EMIT_COPY_DW +
> 			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
>
>-		bb = xe_bb_new(gt, batch_size, usm);
>+		bb = xe_bb_new(gt, m->eng->hwe->class, batch_size, usm);
> 		if (IS_ERR(bb)) {
> 			err = PTR_ERR(bb);
> 			goto err_sync;
>@@ -914,7 +914,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 		if (WARN_ON_ONCE(!clear_L0))
> 			break;
>
>-		bb = xe_bb_new(gt, batch_size, usm);
>+		bb = xe_bb_new(gt, m->eng->hwe->class, batch_size, usm);
> 		if (IS_ERR(bb)) {
> 			err = PTR_ERR(bb);
> 			goto err_sync;
>@@ -1196,7 +1196,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> 	 */
> 	XE_BUG_ON(batch_size >= SZ_128K);
>
>-	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
>+	bb = xe_bb_new(gt, eng_override->hwe->class, batch_size,
>+		       !eng && xe->info.supports_usm);
> 	if (IS_ERR(bb))
> 		return ERR_CAST(bb);
>
>-- 
>2.34.1
>
