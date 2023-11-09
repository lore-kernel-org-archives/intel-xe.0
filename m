Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0624C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699510E8C5;
	Thu,  9 Nov 2023 14:56:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1610E8C6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541750; x=1731077750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OLRrTqZyuf5QxdiEFpNXHDaLwNi7yIvUR+8dndSgqKY=;
 b=R3U8BdNASAUftuUs8BtaMSDLrIwbyG+lzC76KxRJ8JNhULVxaOKXDQWJ
 I9UsXoIlQdkG+JUI7FkssEOZ8tXks4Wy+gMOpH1WstcLZOhNmrTYGksdb
 JoR9tZY5qWYA6h6zp4hW65X3PCAaUUPHjmAll6yBBj2WfQz0fq6WBwsdZ
 yhmsRD7F9mzcy/stvh2EmUFOLEBO+0kKi3hsxZXrbD/RZ6ETqrDiKS0U4
 64fN1ddVqTP+Nmk3iLjT3h4H2rRhnfDfLFs175VcpcpzTyy7VD1Ece8Xe
 t5LWW6uJZLJtgrBhaXyJQHlu2Z/NH/hsfYYleijawEy64q8pNYbGuT4hT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8647989"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8647989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1010658025"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="1010658025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:55:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:55:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imKrFmcU2RfRUxdKYsw5G/9qHssYI5NmV4Onj2ky8zyZ4PkVvX/cWq259AK/lRORXNpMUFiI9wYskXsU0gCmjqrBvzi8WJoE012PuklzraHpqgEE3HZavQVy8ZwW+BlaZXEPh3H96c+TeR2sK0n9QOzmRBfQfRyGE49LUZ4YL3RjS3on+YVGXJBCFlZv2S2/m4jcV0m6XZbMF2ckF41JgiL9o5EgjZbKRyPCPuvrCtxUkmCrs61XkqvFxYcWwO0czchUYk8924Paq2htOstIgYT7BxxZOXEE9WAuOPiTL+KJM+CD3A7FT8wIFGiEgP6E2EZjyA4mwu1+1x7klMxZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30w0rHzNm0Lh/9UmEAEosphiW3S23FlfKiwznDqWF2Y=;
 b=HlfOb8ZPAJALyKhye1kHRZQJ1KNAQDOf7WvS51Ygpw+I55BLbHPmB3Z+5JGkVwJOrinBeBqvdybss3w6uRYVrnYMXMveXY9O2T+e1ImRaIf28Ed6MVzTWj1Srr1zd8tBIQMzr58hN5fT/z6BzzXZx9wM13GcyWJnMRTQ2D8bufy9QMAlncCe55vKN9STB/9Ip0noKFQ1iFDdM8D+WjiLC85FLgvPCpfOC7N7vlE/t8IOtDMZGo68E1rPGujmfKrL6W21+Nap9jZvfBvqE6uRhUIORecVMCJ8wQoU2FELBBVU14e1FOsHKSg43FkC3WbA+fNGF+VFq2B5ZiYlytFiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:55:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:55:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:38 -0500
Message-ID: <20231109145347.345120-21-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:303:83::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d809640-0a11-4bc0-cb5b-08dbe133ddd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4A7O8dBBAwPUd8ZbEd5d3iUE3vpG8cRhSFC6JUCzqYvrq4OPSpYngmnaTU7I3LA6x2C1boczjQGfmNUwGjABOe8SN5YGEvILSIAuFcpgsibaoXT994YHJDtdwIB2zMvXH3uL3iahljCUT1WYzLcvA6cjv5h08Kv5BRBRZhFPQQC9pmLpaUZNqZM+yk0TiRoBwmJW9M/ZEY5Fmx/fopq2cqxRuDhXWqQVaBLokhuyL+X/g1/HSQ4KoY4ySpy6Wtp4hKulLBo78DKtA09MeoW8wHIem9igeURWm9nmRFD0MBReAKbnUpoldEqQWsFdcG2XJRHESk9XY/VfnffvELX6D9JGKk01l8LIQKslI7AFg1aQ15NwpROgMYV1ymJU3oZDpCcqpwZof6KYsGwybnZcY7IL5RYcUmkQtvXBg4leX3HaXY99bvY2ePuL3jviMLG/7RARA+xjLZDIOxD1DCLemYMMnbxPNQchlYjeP68MPbSBlDzblR3yjPL4hQ3Ez+f165e70HQvwyclKb8D4sN1qPiOB7wjtzFMFFEImnnrHlEO+jGepAicc/Fs9cbqRY0v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ynmEwanoLfatv5PdeFYPEqC4RRCwo3qUUHkKeUsbBrQ16WfQnR/aGdRsxW64?=
 =?us-ascii?Q?Tv+nO0M0x4o1Y6z+dUJ8TtFGxJc+f1WTViEGU8nx3N3tKC0IKZ4L98h1Kqo9?=
 =?us-ascii?Q?czTnlVitX+SgWF6Fsr4aWCPFCZ/UTqKBsqDgxP2/ALr5c7nGnvJvPk84OMkQ?=
 =?us-ascii?Q?FHG6GJCcP+ZcbkH10tH8s61IOGZjDAd8++E0RmM7SSMVs7vq+aJQ4XXC9n2m?=
 =?us-ascii?Q?QfRyI2EUjrgF2/E+XRMaNdyVMazxWIFoxB17Hg6xzJtR/0UgcUn9EV/KHLXR?=
 =?us-ascii?Q?sBCGf4ZyMw5WFzpiWj4KilpW7caacOs/b+6XHGGeVE2/q361hOUuNX/9T/5R?=
 =?us-ascii?Q?an8VNOB/PCM+00yZ+2BJBtbDMwfCaJQO+t1XKH7byNlQBexBgmDdm2dpNams?=
 =?us-ascii?Q?IJOiUYWTQOwOFUckMJ4UOgSsBSwA9MFqbwpsq1xhVMsNLUv5hyrgvHc+iQPs?=
 =?us-ascii?Q?mfll6+aBmefIeKx8P7viUQCcxMtsj6q2IrBURWYhXgQhh7+AUkSEt6lVn5KP?=
 =?us-ascii?Q?Cfanc9lHU/jWe4K+Nag9LIV9VBZBSR4n1I5ybp97JyK0JyqPDlMCskJUOh9e?=
 =?us-ascii?Q?x7I5kbd+TlV1McbOo/GCf6tiRwjhksXaJr2pajK1qi+MiRg3pgIyml5zj++i?=
 =?us-ascii?Q?ayUqDm8Prl2b5+/eUJsNTAIsJ/iEttYQKyboJ0Cq/mBe1MAHhIUEXd3axzwe?=
 =?us-ascii?Q?giMNim6XhjmFe1pU46jXOtTjW12udt/vq6hzW58zgBC5J1Uh77uZVvwP5MV4?=
 =?us-ascii?Q?wccEK/amId2oKHhNZDyutqVnHS+GLuyA8pWsIkI9O+/JpBETFNEoBptYmBwj?=
 =?us-ascii?Q?ezvIqA9CSy4wEMqdJSLYqcaAqKcgnJ6d+bf7MpH6GJURuSDJngc0J78mfWfN?=
 =?us-ascii?Q?zgWXg6yrvXWNuZj3h1o3GuaQ/GZRWwcf1EC689j+wMBI1G2vHfN3CzV2XHQN?=
 =?us-ascii?Q?yjvmuB5qFF8ag0Z1JoipB9PApU2EViUMyiCNFPzeV2VSQV3pggF8XyiC0Zte?=
 =?us-ascii?Q?5ipAgRu6Eu0TZJSQHgkIU5KAdoG0MjCd95K0eElQKHitwL0DMT8elSKEAtJQ?=
 =?us-ascii?Q?AROU/h+s1d/JLpQZhLLjHIPjfeFHZyRI3f14QVKQkmMayorbuWRevMMqZGbk?=
 =?us-ascii?Q?tAPwdVPg/ZsZhiN3yXJBglKU3GzdIHj6EknMbGqemsx9z8XTv3EpTF3PoBQj?=
 =?us-ascii?Q?VQ8Y0wpUDarcgIV7dk45uGi/+iVEeAt71MuWAsZ1Lf163e14+1CM8zXxwI/A?=
 =?us-ascii?Q?XbGWIGTr5TY+NoFcwhp9ffq30YEyosyMbtJClqLvo19tpnzYBF3vegGFBNxv?=
 =?us-ascii?Q?QHzBQSv8nGBmel00PUGknGmmnhmvof0yEB4csG8qb2NnbynE+ZV5v1e+bx0q?=
 =?us-ascii?Q?4VJoHbg7yz3JmPy0nTslfagmAexe6wkaLbJsSXigrppLYySFke23QsiebuUF?=
 =?us-ascii?Q?rcCD3kYMhEfJzY4kvnxY0NB7GL2pGApu494wI08V9s7ZNfRolNBMa9oS47ds?=
 =?us-ascii?Q?AkSrMv4SRNMnigbWf47isZsQ5kO6z7Kty04IOscrf/gKLFAURKoPGQUYp6oP?=
 =?us-ascii?Q?ACj7E6bamHW2hA1JEXulSi55bKL5Ye10Pk48/sxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d809640-0a11-4bc0-cb5b-08dbe133ddd3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:55:08.7369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxJneT96i15dMs0O+HI6BSzp+lTy74z3w83E5ixdw5dz4C0DY2qCjs2xubhwDN3SSrVo7MN9bcOp6sgLcbGm6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 20/20] drm/xe: Use pool of ordered wq for GuC
 submission
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

To appease lockdep, use a pool of ordered wq for GuC submission rather
tha leaving the ordered wq allocation to the drm sched. Without this change
eventually lockdep runs out of hash entries (MAX_LOCKDEP_CHAINS is
exceeded) as each user allocated exec queue adds more hash table entries
to lockdep. A pool old of 256 ordered wq should be enough to have
similar behavior with and without lockdep enabled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 68 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_types.h  |  7 +++
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8ae1a49186e5..fbd0fd11da6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -188,6 +188,58 @@ static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
 	return exec_queue_killed(q) || exec_queue_banned(q);
 }
 
+#ifdef CONFIG_PROVE_LOCKING
+static int alloc_submit_wq(struct xe_guc *guc)
+{
+	int i;
+
+	for (i = 0; i < NUM_SUBMIT_WQ; ++i) {
+		guc->submission_state.submit_wq_pool[i] =
+			alloc_ordered_workqueue("submit_wq", 0);
+		if (!guc->submission_state.submit_wq_pool[i])
+			goto err_free;
+	}
+
+	return 0;
+
+err_free:
+	while (i)
+		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
+
+	return -ENOMEM;
+}
+
+static void free_submit_wq(struct xe_guc *guc)
+{
+	int i;
+
+	for (i = 0; i < NUM_SUBMIT_WQ; ++i)
+		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
+}
+
+static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
+{
+	int idx = guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
+
+	return guc->submission_state.submit_wq_pool[idx];
+}
+#else
+static int alloc_submit_wq(struct xe_guc *guc)
+{
+	return 0;
+}
+
+static void free_submit_wq(struct xe_guc *guc)
+{
+
+}
+
+static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
+{
+	return NULL;
+}
+#endif
+
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -195,6 +247,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	ida_destroy(&guc->submission_state.guc_ids);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	free_submit_wq(guc);
 	mutex_destroy(&guc->submission_state.lock);
 }
 
@@ -230,6 +283,12 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (!guc->submission_state.guc_ids_bitmap)
 		return -ENOMEM;
 
+	err = alloc_submit_wq(guc);
+	if (err) {
+		bitmap_free(guc->submission_state.guc_ids_bitmap);
+		return err;
+	}
+
 	gt->exec_queue_ops = &guc_exec_queue_ops;
 
 	mutex_init(&guc->submission_state.lock);
@@ -1166,10 +1225,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
-	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
-			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
-			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     q->name, gt_to_xe(q->gt)->drm.dev);
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
+			    get_submit_wq(guc),
+			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
+			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index a5e58917a499..0fdcc05dc16a 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -61,6 +61,13 @@ struct xe_guc {
 			/** @patch: patch version of GuC submission */
 			u32 patch;
 		} version;
+#ifdef CONFIG_PROVE_LOCKING
+#define NUM_SUBMIT_WQ	256
+		/** @submit_wq_pool: submission ordered workqueues pool */
+		struct workqueue_struct *submit_wq_pool[NUM_SUBMIT_WQ];
+		/** @submit_wq_idx: submission ordered workqueue index */
+		int submit_wq_idx;
+#endif
 		/** @enabled: submission is enabled */
 		bool enabled;
 	} submission_state;
-- 
2.41.0

