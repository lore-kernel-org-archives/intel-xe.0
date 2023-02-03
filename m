Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FC1C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C26D10E08A;
	Fri,  3 Feb 2023 20:25:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1010E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455945; x=1706991945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=49bhUp7BLxIZHmvrH1V/0uzpjuuS4tACW857NXB+5/I=;
 b=ZYW15C4xR7sKLBfrhIyOUD7wE9KG7BNYVmj2G7zv8a2BHkmDfGCVCnHB
 DLnb4J9LeY7Wuny4By8JNL6y7k5sBp0lnpdygpEKvc6uKDpjyRppg4stL
 dlnjhgSLTRgFcyQ1AOvpm5IEb+mCc1amJzc+v4WwPSsOSqhGc/GdVqy9O
 ffnrbHr+vOaTOy+s9Zjj9G2ZinbH7Zvg8UOcHsJ6SYhSJdD46eodXbOpr
 oJcq1VeItIJo25I8U2XSyaXMok7ll08AUK64ORfYlB5vvBxuECvtxVqw5
 ieGF3VDqSC6LNBtHoituF8Ffzt17mnbDoAm4Zm+ASgfc35R/7IyFNuWdU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327483615"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327483615"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774450108"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774450108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:25:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8HrAYinpF7bs0HzEOf+imi2v/PqkxwbqZyGwTUuxVkdVT0brrbAOd8TY8V6pfWt4F+KgOAY4ds+vBUfENFedEMiajXmB7zVp8pe3MDJnsOHq6NCUcspMz7hXaNzlH0qYoNSi73WOfHhCJAAsco700ayNmoG31zZjsnnBEtSdwzl9kkIZeDS6YoKXVfy92UAOu8zvmEdO1BhnXfPy0aemkHw30n5C7u5BniTojS9w/wtGK2z72heL6/V8Hbz2Tf1kJ+E4ZkaYfCC49cJ+Pw6GQfROSwqoNHfDa7+A4jivIK+bJNXGLTC1HzufYE0FgZ/WjBwDI6XGUzYDbB6QDS4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybRVowxqiRBQbM5LMqLQrhkeFJo9wSFe5ofDG6pb03E=;
 b=gXRkm4XPEWVsDGWvFxsrXxgHw8kwaqz8N+yC2D6vOxP62Dxb5Zu/zbibZnsiCzS7zPKEqCj69+H2kE5bT0lul0NKLVNYZIO4fHp6JloAdZnLcC3M8xtUWThQZCtEInl9GJP/Mlf1eKkolbKO6pX8tHA4Gndm2NBUyiqAmHuenZvGPRUnA0jUnj5XovoTVLvNVTePeEbo5hPKmG3dcVaLAyZ8UEcPUpl3Yqw/CkJ/MHzB6isTwEdi3JMRWAPpCR36YaY6q12zIBpaKYM+wU4siFGZA3SgZokUXJs2l9M3UqE/mwjdatjaGTPu0yaObHpP3F5P2HbN71LdeHPsCRNbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:08 -0500
Message-ID: <20230203202409.577032-22-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 331433a6-b046-47f3-21f6-08db0624cef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BvFXsfHWVJV15MewgsxfG1YARb2LQymEQ1Ls4qZXbYDRb+U0wRcUnjIhLolcOCSzEjmZUwFL1eIxcNcne3z+/cJZC8dd8/WZuHlNiAOOK0Xq/dXfVESHhU2seODPBwpdxRpFior7oBDpDDOmhbebyq/SZtw1S77quzC7UQcLMx4sz1HNghe/3t9wa6rksJCtbFsPEynTVnt59oRi538FJ4pWccfaUzozX+HYHmwyPE7NSCxp8rCDPyp2vWoRisYidB8R0zBgVuSOWZ28CRQLLAv+KvyszTEEhak+owJKCMlhxr7nMPoxvIu+UJ/duewW0t5qKWknurigu+rHbv8p1anvsui6KXTRpNfN/h3O4huH/yntyjjogTwEUk+gQeYpiFNTmcVYbaWEuc0/2anB3v+hdHHEi/60spt0rmZYGrYVlvaHthkcX6wrawBTRsVjjFVbzUSQkCuW3pwWfeXtN286reMDn89V1kHI4YUEV1h9ChMFK2IJhwsbDGoSR96mpr0+QOkbxrbc74KnNiixBvui1qe+PC9bRvTEWBJ5Z0gFJ9JJ6ecvF7Lbvejv87yyIEBm2pK8DiihO5JAZ+IwaTpKDXf3DL84kfud9lQA7xI+EBOTBgm8CIv7dfILFpTEHbhqT4LRJ+aRg3/cYZ665g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oh5PAFVkyzGOquwkG/SueNuleHH//SCG1dk/RlBy8LP9LMdavmlnO4LVM5kJ?=
 =?us-ascii?Q?KuDHamR4fwcztgbXunKEFqkZ6e8J4h6Ksvcg9lHHdqtGlD7qNiZi/UDVPe5j?=
 =?us-ascii?Q?Pbs0NhKaukKVvTKl/ckcUIrBz8DOBdUBqHGxmrv9d3VevMZfQ9oDGn8+FZSq?=
 =?us-ascii?Q?UDLTZdVzq9plk29Hwf0J9/MvDTtAW0/mYByccp3HpYbaglb69dAzVTgMTPtz?=
 =?us-ascii?Q?b8ubrpFqEQ0W4LvDfDKGW3HdYpNWfwq/vEqOmUEqw9oFOUOVYyCTmhbo7hnu?=
 =?us-ascii?Q?ReRupnAsGu8wXynYH3aP9qpe7UtYmHQXE0GiPnnu1FOdmx6kSBEs0rLH1ghT?=
 =?us-ascii?Q?zcWJs1m8tNXmU9hr4P08P0nj7DfdbMHtkPj2RD/dfCz4iC8g8gI/5zVIBZxD?=
 =?us-ascii?Q?iltUn6FyQXnzJQomTgf8ti3p5NJVTJg3hBaJgFr82l9/VlkuCN8lAuk4Xyti?=
 =?us-ascii?Q?sNM7ei4pYHIE5IZeT3NGof4cDiBsQ25HF/jsctZV4q1lawtJUBA2gXIA9U8R?=
 =?us-ascii?Q?zsKXwg4fjXBvAFcT7EOFnqWFMji49z+j5abuKTWBQiEJTxn/boA1YnMH/UnS?=
 =?us-ascii?Q?8mnXG588jY0eh+5C/OMRYgEsxXkDUNY25qJgL5HjpbeckqilhANoG7c47IP+?=
 =?us-ascii?Q?i+SoRQ+x0m3LgynF0SdyreVSvfFu5j7FNTNuKpcFek2G2dirdEqqAP5xCJuj?=
 =?us-ascii?Q?x2oY1LdYEVxuDAHpkSdV4AEtxlnY8RQep3q4z4Ob8OXu1Ah1UAhJGG4BgHdK?=
 =?us-ascii?Q?XC+x4KmbcCH3nU9VxSqlvc3JjhkI6kJ+u8XYyWRSSZbNvpjdmvZ8xgmOQ8Xm?=
 =?us-ascii?Q?2QTxMAB4V/UJiLdci0H80Jga3Wyjo4E5ysUWYEldePQ57oabFnGY4Zk29MDi?=
 =?us-ascii?Q?6JC+V1nF9/dhiM3ibC49yXhNKAC9j2m/25b0yHIo3JYWV6w89VF2L+lx2wo2?=
 =?us-ascii?Q?Wt3EmohjNA7jjVibiBcZQ0v9SjSTR9P6Fb6OWjZZijIPUCi1f1AZ19yZ4KkV?=
 =?us-ascii?Q?YTioxYg8qPOvCTx+qW1MJWtsW1JsqCC7KSccl6+a1y3RO4jEh5ff0PbY7FCM?=
 =?us-ascii?Q?kaeJSL0uV3KxgOeCLwtyf8wjBkIkkQeNoCDVE+ttFVph5cQrj9EKZHzUlm5D?=
 =?us-ascii?Q?EDvvNswYd8CSVeGRSjqWqH1BXIjvItntnzHz0ta0iRcR5VktGOKwII8jrcG+?=
 =?us-ascii?Q?1VrCUoJViRU41thwk8UKoBFsEwGXldg5IcXhg6bPEc2KcCTDdp4lXOFHEw+f?=
 =?us-ascii?Q?FpzfvtE5/Ul3fFPKPB1I19G7taNN1wogVJkZ+WeKrwsYNCROK3r0lR47dYD9?=
 =?us-ascii?Q?DczCv97aum+1WIu3svSUi4xz1yxtZXz1QII0sLDzHPBdzyojyN9MvB8ndWp6?=
 =?us-ascii?Q?lrL+3Fbl7jyku4CtW99upxzg7J3KeWzqoaMBpjV3BWrVaIy09pnzKDQLeDoX?=
 =?us-ascii?Q?aNrzCLVQ31mVwTognp/JqPmJ3ZpRBmhQrMb5qxJUKrCe4op7plddSpeBjjXU?=
 =?us-ascii?Q?ul5cNbl4ZaATjk59NF8BCPLkahHYm1DZSlSQDN45QEA7QnUjG5WAq30yBQbh?=
 =?us-ascii?Q?dHdoA10VI6tyNgjEpYASD+cKpl8KBPyLVyEh2jIGGZNizrmkeuKcrNxZUyAn?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 331433a6-b046-47f3-21f6-08db0624cef1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:36.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2YXSXMcw072+RUXobxkmVKnbHpgh3Sff52qRAGEtHgcY2HLHbNBt45OCpG3SLumRNbOC+kMWOODv7BsCz4KnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 21/22] drm/xe: Add TLB invalidation fence after
 rebinds issued from execs
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

If we add an TLB invalidation fence for rebinds issued from execs we
should be able to drop the TLB invalidation from the ring operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 200 ++++++++++++++++++++-----------------
 1 file changed, 110 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0c2cc9d772fa..435cc30d88c9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1160,6 +1160,96 @@ static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+struct invalidation_fence {
+	struct xe_gt_tlb_invalidation_fence base;
+	struct xe_gt *gt;
+	struct xe_vma *vma;
+	struct dma_fence *fence;
+	struct dma_fence_cb cb;
+	struct work_struct work;
+};
+
+static const char *
+invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
+{
+	return "xe";
+}
+
+static const char *
+invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
+{
+	return "invalidation_fence";
+}
+
+static const struct dma_fence_ops invalidation_fence_ops = {
+	.get_driver_name = invalidation_fence_get_driver_name,
+	.get_timeline_name = invalidation_fence_get_timeline_name,
+};
+
+static void invalidation_fence_cb(struct dma_fence *fence,
+				  struct dma_fence_cb *cb)
+{
+	struct invalidation_fence *ifence =
+		container_of(cb, struct invalidation_fence, cb);
+
+	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
+	if (!ifence->fence->error) {
+		queue_work(system_wq, &ifence->work);
+	} else {
+		ifence->base.base.error = ifence->fence->error;
+		dma_fence_signal(&ifence->base.base);
+		dma_fence_put(&ifence->base.base);
+	}
+	dma_fence_put(ifence->fence);
+}
+
+static void invalidation_fence_work_func(struct work_struct *w)
+{
+	struct invalidation_fence *ifence =
+		container_of(w, struct invalidation_fence, work);
+
+	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
+	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+}
+
+static int invalidation_fence_init(struct xe_gt *gt,
+				   struct invalidation_fence *ifence,
+				   struct dma_fence *fence,
+				   struct xe_vma *vma)
+{
+	int ret;
+
+	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
+
+	spin_lock_irq(&gt->tlb_invalidation.lock);
+	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
+		       &gt->tlb_invalidation.lock,
+		       gt->tlb_invalidation.fence_context,
+		       ++gt->tlb_invalidation.fence_seqno);
+	spin_unlock_irq(&gt->tlb_invalidation.lock);
+
+	INIT_LIST_HEAD(&ifence->base.link);
+
+	dma_fence_get(&ifence->base.base);	/* Ref for caller */
+	ifence->fence = fence;
+	ifence->gt = gt;
+	ifence->vma = vma;
+
+	INIT_WORK(&ifence->work, invalidation_fence_work_func);
+	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
+	if (ret == -ENOENT) {
+		dma_fence_put(ifence->fence);	/* Usually dropped in CB */
+		invalidation_fence_work_func(&ifence->work);
+	} else if (ret) {
+		dma_fence_put(&ifence->base.base);	/* Caller ref */
+		dma_fence_put(&ifence->base.base);	/* Creation ref */
+	}
+
+	XE_WARN_ON(ret && ret != -ENOENT);
+
+	return ret && ret != -ENOENT ? ret : 0;
+}
+
 /**
  * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
  * address range.
@@ -1198,6 +1288,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	struct xe_vm *vm = vma->vm;
 	u32 num_entries;
 	struct dma_fence *fence;
+	struct invalidation_fence *ifence = NULL;
 	int err;
 
 	bind_pt_update.locked = false;
@@ -1216,6 +1307,12 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
 
+	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+		if (!ifence)
+			return ERR_PTR(-ENOMEM);
+	}
+
 	fence = xe_migrate_update_pgtables(gt->migrate,
 					   vm, vma->bo,
 					   e ? e : vm->eng[gt->info.id],
@@ -1225,6 +1322,18 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	if (!IS_ERR(fence)) {
 		LLIST_HEAD(deferred);
 
+		/* TLB invalidation must be done before signaling rebind */
+		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+			int err = invalidation_fence_init(gt, ifence, fence,
+							  vma);
+			if (err) {
+				dma_fence_put(fence);
+				kfree(ifence);
+				return ERR_PTR(err);
+			}
+			fence = &ifence->base.base;
+		}
+
 		/* add shared fence now for pagetable delayed destroy */
 		dma_resv_add_fence(&vm->resv, fence, !rebind &&
 				   vma->last_munmap_rebind ?
@@ -1250,6 +1359,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 			queue_work(vm->xe->ordered_wq,
 				   &vm->preempt.rebind_work);
 	} else {
+		kfree(ifence);
 		if (bind_pt_update.locked)
 			up_read(&vm->userptr.notifier_lock);
 		xe_pt_abort_bind(vma, entries, num_entries);
@@ -1467,96 +1577,6 @@ static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
-struct invalidation_fence {
-	struct xe_gt_tlb_invalidation_fence base;
-	struct xe_gt *gt;
-	struct xe_vma *vma;
-	struct dma_fence *fence;
-	struct dma_fence_cb cb;
-	struct work_struct work;
-};
-
-static const char *
-invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
-{
-	return "xe";
-}
-
-static const char *
-invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
-{
-	return "invalidation_fence";
-}
-
-static const struct dma_fence_ops invalidation_fence_ops = {
-	.get_driver_name = invalidation_fence_get_driver_name,
-	.get_timeline_name = invalidation_fence_get_timeline_name,
-};
-
-static void invalidation_fence_cb(struct dma_fence *fence,
-				  struct dma_fence_cb *cb)
-{
-	struct invalidation_fence *ifence =
-		container_of(cb, struct invalidation_fence, cb);
-
-	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
-	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
-	} else {
-		ifence->base.base.error = ifence->fence->error;
-		dma_fence_signal(&ifence->base.base);
-		dma_fence_put(&ifence->base.base);
-	}
-	dma_fence_put(ifence->fence);
-}
-
-static void invalidation_fence_work_func(struct work_struct *w)
-{
-	struct invalidation_fence *ifence =
-		container_of(w, struct invalidation_fence, work);
-
-	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
-}
-
-static int invalidation_fence_init(struct xe_gt *gt,
-				   struct invalidation_fence *ifence,
-				   struct dma_fence *fence,
-				   struct xe_vma *vma)
-{
-	int ret;
-
-	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
-
-	spin_lock_irq(&gt->tlb_invalidation.lock);
-	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
-		       gt->tlb_invalidation.fence_context,
-		       ++gt->tlb_invalidation.fence_seqno);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
-
-	INIT_LIST_HEAD(&ifence->base.link);
-
-	dma_fence_get(&ifence->base.base);	/* Ref for caller */
-	ifence->fence = fence;
-	ifence->gt = gt;
-	ifence->vma = vma;
-
-	INIT_WORK(&ifence->work, invalidation_fence_work_func);
-	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
-	if (ret == -ENOENT) {
-		dma_fence_put(ifence->fence);	/* Usually dropped in CB */
-		invalidation_fence_work_func(&ifence->work);
-	} else if (ret) {
-		dma_fence_put(&ifence->base.base);	/* Caller ref */
-		dma_fence_put(&ifence->base.base);	/* Creation ref */
-	}
-
-	XE_WARN_ON(ret && ret != -ENOENT);
-
-	return ret && ret != -ENOENT ? ret : 0;
-}
-
 /**
  * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
  * address range.
-- 
2.39.1

