Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707AACD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5A210E28E;
	Tue, 19 Sep 2023 14:29:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0721D10E28B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133768; x=1726669768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cNdrnPTWZWGc2d85bEJDmx5MUiNPfrm4Hcxo21RMJqw=;
 b=kWNOL9U9eHvf1vLPH0s+mA4tDO2ydj6WST632VgAxuLYvuDod8jzyhI3
 6qiH9eY2rUOGTCqHdZ7QsP43BGritHE9rulIFydk6g678ok9W01nSpFZc
 nnefHEIGKAQejb2gWTG6GdVCU99znUdjCL9MkmsPrUFPiVhntM4AID+iT
 /H/09Ggd6MD74ELYcXJ2qLjQfQpsENFaltJmDv0/2zj2mKUrKbB8WuXqR
 DPV7sqOtZTmknzGBYALCFTF2Rc0L9PN8RMnr4YQ6xWDkM6+BFujSJQTf5
 cJvF6JBci0taoULEaDFW+UOi5LrF+pSLSKA0uaOQM7XND2meInWMzm/gD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359350622"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="359350622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="722902491"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="722902491"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIQpwqKVRzFxR4BHxhAm3hmqUj2Al27c4tGdtG71dcIE5Xy/wFaX1S6TzLFNWuQ3IbTTYPfe50cJcIiUy3ADG9U6S44e8uTLX7+yL4SBITn0WhsFA+kvE6cmHajKPo0CEfln5QHLDUmhhYWU0nZbnGyBcxE4I82TUfakSKruSRMxL/KrApRC9RpBNGm/U8h2LFye3R+BvsjVgkXal8takN5ZU71VlQsS5MjxNF+OxD/VXkC0YkSRVCSGk0HmAm6+po5okROxTR7zurISgGTCvkpsqpZgdBKNeKfJu19rD44DmsyyHAxSr2T7j9ZRtiiWRRqmDOSiZDolxLs7/Bmb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asQhbY1Ye+6JSzD+5wfuHwuDQIXdggvngP60D/5qw1o=;
 b=jTCiYh+b/fqUfQXVOLo/3VPSNotqYOzau5jQNrYSfOOi2QWwtNwGO5NHmIgfZwWVVwF2Iv4dIQljLEFfwafAyoYP5AD3yVEqv8YGH8xbWKKQLeU/SWjY+3ZHf8HGX4TbEGCUj5FJeA+JuR+FPioKD2gqBUnV+xvxdQaP5cvSfCntgo7XzWGHocN6zLDqDVL4PTHX6KAXO7R9Sx2gGdzzaCTPWMI33mio2sJh9etuN4XwbV1GMznzslY/Ix3409AaMV80nVy4EJlKWorKftjfiu+Uf21Z75RA7i29YNNQhUGjSwJSslN5t82xZXR4qW3OiwO1ycNcOu0tshl9TVlV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:55 -0400
Message-ID: <20230919142504.91652-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 164e6689-2f7b-498b-a132-08dbb91c5e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8R3EefIMFR3dPo9ocNqddxp+uRLgukeJd/rfsgidiI6J2SnRoHCNGikOGFFGeKzw53AgB8cgfhyD3f6UUe2WFsixNJyK6t+PAuE09uqGmbGEE1h9on8thMPvoo9mbkTbf3ZgUIoGO6+/PAy51qKitZ6hreIqD4751O8fLicQekMzXOT8ZI0mYTWwcZmX42vXAPKuJiVvWuVCVlZPcJZ9VyySkYlWid+0L6xnUZgIuGIHPt76Yyc/IhLLb+UuqbW2XkBTczePeezAiqRMKc323Ukd4tKRS8zvn2Ra0glN7iqUkHwU7gkSSO4u7UYPolOBQ4140IRAqXWevisj0hLUsdfvrXa8nJHRD+yDuRBFIZ5W34LClmd9Ow8UPkXEkkV48PGRaKdMrmSdQfOX4k+H6K8wYSckvHl6c1GSOxNvNkKwYA8WvguoR0veUTJSBliWMOLpej0pjr2NGXFrZTVIZOqShr4sMz9m69x9FFVY5vT1GlCoPXtY2yrJLQgdxJg4YXFvEaRwv9oiTFnIm33V4aP58cBqYyulYFMPExJ+iiHR7RdboL3aQRjK6HToWgO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0DwqIJxCQJK6qYAfor5eY4kft31wY4ZYtjFcWdFMf3HNyUrByh3SKXNqM5p?=
 =?us-ascii?Q?LaFLg/VMMOrBA1Kv5hk8RzhaO2fOrehk1KOCBxYmua8dyiUHyuSLkW12GB88?=
 =?us-ascii?Q?rU4lUl8mprw9GM2/1nSipL0rk18zCwUGLpQmzeiwoD9hqupX7UCOys4ZTvS9?=
 =?us-ascii?Q?LESqsfgbiMai3QEkok2kO6lxtpHZwOIF0Ei8GHVa3e4fVUHi4+HnoSYk+HBr?=
 =?us-ascii?Q?+3TXyktbYbic4ewU9AUj1NWkyepgtcq7PdN7oPic2nsnzAyfnJBBblrhWsJj?=
 =?us-ascii?Q?KALzeeCbZ1noEr3TjgZ/njmvb96NtgBpaT2wtACG+ygqqfafxZeRQk3IxqUf?=
 =?us-ascii?Q?jlZAvPZuk6hcQJzARA0QpK1EAAclUfAvdePXAczECNhpcUEB3Zh4Xx3wKLrH?=
 =?us-ascii?Q?kKkESHtAL93uhP9EmK0bRP2mwn6eYKLueakjLtZfpyBLSlWbaNUIzEQmzLBO?=
 =?us-ascii?Q?ouQYfAsTtmYkMO4nqJG0eP0ywNrXZ3OrrcZNTSwoC+HhaDwNIMq/xbfnXPxW?=
 =?us-ascii?Q?soVFHcClltN7FlnVnfLJr8sBNkhAYqtkZ5Y2nn5IWL7UFWV/LoYf5gOy0D1I?=
 =?us-ascii?Q?mw9L+qORlK+OIszItdL8l5u83Iq7/BqVArvR30rBNnzRmKDrrc2WmXmCs9yu?=
 =?us-ascii?Q?Wo8pju+PSmA7QOaY5A1kDaBP8Fch9BYE8eVV+yPMX2lua/1LPDSZ7UFJZJHX?=
 =?us-ascii?Q?xTQJoCjKXgyH5aXpM1VNuWVukzJyBxJ/pEri3Z2W7HV8/xQhAD6/EN/5SqqL?=
 =?us-ascii?Q?oztwHVfA164lc+WZfTGTmq9eVA7HwzvAC1aOh80n8shz5BGtBMYbPHmQsYq5?=
 =?us-ascii?Q?IApu6JxwFdOi14/pdPfnq8GZZs6eXCcjp+GlcTbRB6PVbfKvejf4qHxhbmhy?=
 =?us-ascii?Q?zCnrB5Seg9m7UncgssltetA7usPpf0WR+nENy854pV47Q3HdkYBbxyPfjhoh?=
 =?us-ascii?Q?1DwBfIJpXGpLlpXEshPDaNJ2nFeHX7L57CEy62UAe5asd0O1lX2fERS20Wof?=
 =?us-ascii?Q?X9Wc073ABSs26ZCnidEGGtEv07WPgwTwZ9lI3lWA/jBsvmOPm0NwdedOCjjf?=
 =?us-ascii?Q?KUvfFfH5CE6Y8MTVhJQ2t2l6NYnLcQft57M2AKvVs0VBdBFxl5otl8Qzcc3h?=
 =?us-ascii?Q?W0/o50UYetCz4fCSJ3PZdxUwHFhNnITGuuSA0xUvOVY/dgH0u8QjTzU+T3nr?=
 =?us-ascii?Q?KBs8aaWXJyblYLaRCICmBPx80YPWShf9q8cuMD/iTI1Z5GO2xMsRXCExn9m0?=
 =?us-ascii?Q?FE5QdqmjMD0mcjyS0Cc6y2qQFFQnCza2Q9XMF0MpKarYheL/RRAxB7UFJQWl?=
 =?us-ascii?Q?kBoyP69QFaDwZnGwTwcxprFKnWzNQ5Xytm/vvtdZdNUSYtNYLtE57blYQyO+?=
 =?us-ascii?Q?+OYTyvD5fICcu7cbMO0rWkhAiCWqofqfOtgOooyGbFOuvHK8GW0OQWcYvAR2?=
 =?us-ascii?Q?0hM4MKrwilZjCx2pqbBuRcgrzQawidrV+bCPX55ZWSBNO1w0AbFlmyVOR6bq?=
 =?us-ascii?Q?nLh3FG18CvI+heYUs4N0KjiFEN+6hm/4BbWJQo0sVA3Ci45TBw/mKxy9WteF?=
 =?us-ascii?Q?2WHzTSDVwhcwCPrCTrhasK1EEZN8Kk2InalSZ1afX91yjvZX0WHoxOIe1EMD?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 164e6689-2f7b-498b-a132-08dbb91c5e77
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:10.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+at6+lEiJH3HnHfK608/GuYdYKs49Unv5OoIU8eODLEXDjZ8x84gP3+4oeYIdNpuK3ivt3kdx/PqOd8plo5Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 08/17] drm/xe: Deprecate
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

We are going to remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from the
uAPI, deprecate the implementation first by making
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE a NOP. After removal of
XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE the proper is simply inherented
from the VM.

v2:
 - Update commit message with explaination of removal (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 57 ++++++------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +--
 2 files changed, 16 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6f1e64896a2d..68cd2234acf5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -323,39 +323,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
 				       u64 value, bool create)
 {
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
-		return -EINVAL;
-
-	if (value) {
-		struct xe_vm *vm = q->vm;
-		int err;
-
-		if (XE_IOCTL_DBG(xe, xe_vm_in_fault_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, !xe_vm_in_compute_mode(vm)))
-			return -EOPNOTSUPP;
-
-		if (XE_IOCTL_DBG(xe, q->width != 1))
-			return -EINVAL;
-
-		q->compute.context = dma_fence_context_alloc(1);
-		spin_lock_init(&q->compute.lock);
-
-		err = xe_vm_add_compute_exec_queue(vm, q);
-		if (XE_IOCTL_DBG(xe, err))
-			return err;
-
-		q->flags |= EXEC_QUEUE_FLAG_COMPUTE_MODE;
-		q->flags &= ~EXEC_QUEUE_FLAG_PERSISTENT;
-	}
-
 	return 0;
 }
 
@@ -365,7 +332,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))
+	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
 		return -EINVAL;
 
 	if (value)
@@ -742,18 +709,21 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		xe_vm_put(vm);
 		if (IS_ERR(q))
 			return PTR_ERR(q);
+
+		if (xe_vm_in_compute_mode(vm)) {
+			q->compute.context = dma_fence_context_alloc(1);
+			spin_lock_init(&q->compute.lock);
+
+			err = xe_vm_add_compute_exec_queue(vm, q);
+			if (XE_IOCTL_DBG(xe, err))
+				goto put_exec_queue;
+		}
 	}
 
 	if (args->extensions) {
 		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
 		if (XE_IOCTL_DBG(xe, err))
-			goto put_exec_queue;
-	}
-
-	if (XE_IOCTL_DBG(xe, q->vm && xe_vm_in_compute_mode(q->vm) !=
-			 !!(q->flags & EXEC_QUEUE_FLAG_COMPUTE_MODE))) {
-		err = -EOPNOTSUPP;
-		goto put_exec_queue;
+			goto kill_exec_queue;
 	}
 
 	q->persistent.xef = xef;
@@ -762,14 +732,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
 	if (err)
-		goto put_exec_queue;
+		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
 
 	return 0;
 
-put_exec_queue:
+kill_exec_queue:
 	xe_exec_queue_kill(q);
+put_exec_queue:
 	xe_exec_queue_put(q);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 347d28442701..f73b9e80b25a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -60,12 +60,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
 /* queue keeps running pending jobs after destroy ioctl */
 #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
-/* queue for use with compute VMs */
-#define EXEC_QUEUE_FLAG_COMPUTE_MODE		BIT(4)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(5)
+#define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(6)
+#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
-- 
2.41.0

