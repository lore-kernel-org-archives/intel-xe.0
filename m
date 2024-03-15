Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479AC54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7011225D;
	Fri, 15 Mar 2024 14:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4NGyUaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E5911225A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511294; x=1742047294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z1imJt4gb2PRvAIVpyzVk+L3eFQuo534wB5k9mDd72k=;
 b=Q4NGyUawjticPGxmVrNlrYX82392SEStOZUzQCUuXCX3XikRpuc6BX7j
 I4exn/A+Dv7U34I97PHUuOUxfFaJqKmbN67yIhyFVuE4Or9UVnFeFgQNt
 7EZRfadQMtJt476WlJ/d1VoLQj/5Rdy/RDqOoyAAdQax+VfYsX3HvjDXI
 ZmyQY83vQNtTrG5jgSgkgbB7oAM0SeRZtolXwF+ahdzbGGookI6aMbEPP
 elWu5EhmzEONETO9YabFAX8xUGHNsV4fIX/KwkRtIdIsYn9ieiylXXX7c
 7PqXXT2/v0rGdT4fFOZYfNYZUK5NHwy4iL7DMDk7OCrRc8EehZ3NFpsl9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16780089"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16780089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12589879"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5nWMNhZe6fFKLJBiMRvYhPrl5vSi/+aPnEmP6yhdNnhNFYuMXDlY6p2RUgf/DOOMsCO0yj+ucR8jFtc8vyBUlGCF1QryvE1/pu38R2Yq1pHIa8Et2ffkIVXM/g/3TXP3TYNz1MrPyteTGzCQnl/6BlCZLyVK/f2FBt9KnMqjlB7ee/RH4HyeIeoi898E72naWN5OUIwl4N/a2A/ZT+FZPtP2aFhuQP9j9gxOCeSkIGkqEegV+HemzcCjXW/KkQBGyj+GSxKHMmR2AUPzIsdAfSZnjp9jJy7yEeYVXuKquhYeRgWt1k0ZqfVH1UkGxde6IS43mnaUMZlubGeRJfGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK6TbxXrVLtavnJ92pr+M6NErSboJBQDu5NspXoIgmo=;
 b=QBOOopWitfhGQA9n10fNJCcKKijugYox59B6ULs/TjS2+Q6h9D3HOaBbPYOHbslp3bo2ddp03tIBVCTCkDOZZrvG4L7jvQ2c9afUBP8CwI4S4hp73yTVdtU/eGVBrUy9vY0thJoj1WNVB3MX3B15LRE2ehbzog/IdZSF/+oO4dSJGdtVwhGsyPUBYhPKoKurQxNdmdCIHIW/+t4rntOBgzMQuwM+ALsqqOcK5KNJrT3Jq+hWAmQgER7HokTi/ff+upw0gQnMvZtZIc7OSi1JXtVKG0TchZybhJh97fF9Q0UVUHEjy5cdjCtc5+OriRtfIF17Rx7ejtQnPVk+VMTQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 14:01:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 3/6] drm/xe: Add extra busted protection for the no GuC reset
Date: Fri, 15 Mar 2024 10:01:05 -0400
Message-ID: <20240315140108.217862-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c51916-6eb7-4297-b4a2-08dc44f86906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7pk0mPmJP/61ZQrH4bPWk22XKsRL1dwa1R2bhc1DnbNPwpqIETY6nVC4w6NoLU+iUWQOC+vJ2fu8ThJ6zBfYT9zXjSedie9ShIfFraB5u2bpzTzgmAm0XeJHVRJMqJKaRxhon9YhqhRLTlWQr8dihOuMkyRVeEBgAKagcMXBF77YfW8ZOsY67SMVch3w7FnlHSJDrE5V4BjZo2Oq3RqmLfrLMiQN56zoDLjHkZlmQ7y3xLgmfcWWCuXWRlTQsT8TLvvGd2EmFM20J0CXLrdl/DUOvyhoQInzhpLgKVqy5iSai9qxP8jefHf/1QK63q89XSOEgXP4kv91WJcnGmTahPfWPOWL3xcJqGrCZo/6P820lStWXuY6j+JuMpos9yYBHdTs7OEsqCD3Km6kBfL0ePOkSJnoKst3vZRTkQamB7gNFNGJfIXMvRT89nLkmXNtU1WS9iDK8oxX7VTsCwiuh8ZkQ6VnmrsX6mpkHZ/NIH1hvt2Ib6rz2/FLn8ceZDvDLGCdD3Umo4+K/tHyZedpnmqfbONn7iI2sKApAAo/2JJtUtPUmW0C2VKdeh0gdNbZamuNthbyWODpsTM/3Ng9gvTdkKEsM3u+F6y1Ossv5VeUD1BZoIUKJrYW0veflpY6eUmHZRx2S2vRCoZ6r5UvJO3k8xTWYWBBYGNA+f3HGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ub5z23/A5B3ieL68+em5/sqK/na10FZK0YgSQufdgJws+D3ChscNGNyZg0l7?=
 =?us-ascii?Q?7BPMida2OGrrKmjgvpJuIaruY4mOB7TN2Jv+W+9a/fb+VP5lypgP/mLioMck?=
 =?us-ascii?Q?j1oz6ByRYU3etHhQigFjnkaL4bHf9VmiG9W5rxn+mRaIJsA4QAuFhAALdLKI?=
 =?us-ascii?Q?AoVAeExe9qc6iJy8tFZL1SZuUPiTSKUspZI9bTs4u7sBp7L0FPTipMbBnJFn?=
 =?us-ascii?Q?lYngxAI4sDvxCBHJ7uEu3EYcJ9LV8cB5rmiC/jsbBjRxscMSXZSZVB+Yf4V6?=
 =?us-ascii?Q?S+FHx8VLOb//ALnmfdKtjUNs/0/sA8G+uuoyiBApIUIPxLZ72dLfDcfg9mQV?=
 =?us-ascii?Q?r1KqR3I6TYx4EEhNYYqb1NWTTXN2HeqtBGQzBm6J1m5lKfPdheRVTbSO/Lhi?=
 =?us-ascii?Q?Oj+X12e4L3p0G+cKl73aP+8Wb6NYf9JM5ILZtB9Udc2IJdNy9p7hmPNSoZbf?=
 =?us-ascii?Q?g1M5+ewKBk/XnFEKZRSBDi5AJ3jEkYTAktcDPTYOE1JPg+3yPU41oShVAGwi?=
 =?us-ascii?Q?JILthdcOJmxkjKKKUY227yiT+VDRu7Y4tR0eRGDV6SNwIHCM3AG1oNmPU8v5?=
 =?us-ascii?Q?vDOpqeE1TwstzwVkj4/ePqbyOge/QreA7Q5cR8YU+mID1ivnOE+7j1Usr0Ci?=
 =?us-ascii?Q?puB7UWDgMdPhdypkpChplFijUXEcaxvdbRe82FBc47PVGDiWgGvn5HYre7wc?=
 =?us-ascii?Q?r+8iF1+OZSdrPXbPX6Gvm35MQiGmeO+Q8GK1D1WpzPfG5o4eZxn3ZH5biHWC?=
 =?us-ascii?Q?7XVFd+OhJLNqGWj1ISlTZmT1+up1VKdOXKkprbH74mNp6j0puIjpuUlCxbcF?=
 =?us-ascii?Q?StUCvHAZIj97Xeray9CymVUUsCXVMDqgR2QdLN67ERNrGfTECXV81uLkxX33?=
 =?us-ascii?Q?5hl7SRbpnx73RhLq5rcku1c8VhP55minkJdui08P9J74k8d2cfjnYVCflAsz?=
 =?us-ascii?Q?sWj0K1m5sQCOiBQ4oo+wwOdqsQxbT15VPadiGJ3t5hXUxQ19mzL+/eI4ipET?=
 =?us-ascii?Q?cJnwRKRk9KNR2pF8OTcrqTzHXkkksgyHgNtsKK345Op/1UoJgxAQtslK3huJ?=
 =?us-ascii?Q?qifbMrDFX/8uzOeiZTTt+f3wa1RxTBOJI48R8Wc4DFa/OfwDIEnD6Q8ylMRp?=
 =?us-ascii?Q?9Vh8wfG/1SrspCYmyBF64s6hUYXescvmV9MtOQxRQMUrSjbQZfH2Q6Jod3ep?=
 =?us-ascii?Q?l/HggoJvVJBdW+piZIa9J+0BC87008z7mvpsPWNJ593XwhlpMkCxTHgNOvWn?=
 =?us-ascii?Q?qwC2I3VYpgdangwEeLeOiqW9oXd0aBdcB3LBnkXHuyY1ejCOcVj7bD15DRMe?=
 =?us-ascii?Q?nvrcbK7T5q7wBrNMfVmW+azxyJnHlXboMuSJSkMD093oay9FznJ8Z8zL1LqS?=
 =?us-ascii?Q?MD2ZVoPOm/ysR9HUts276Lyer0j54IOIO0fqiGxAMBE1bZvZVlY38QCKsMi6?=
 =?us-ascii?Q?+1JwoR4mRgBesVfsm1kQt2fZFUbc1jpMuQYG8peBIiytL7gfg977NvRjgj4F?=
 =?us-ascii?Q?ODpvfqGKcrS+NdO7FtOQ2lrJ0oDuw/ywus59gUNb/lO2svUMUjgKWYkuVm7C?=
 =?us-ascii?Q?6L22PTuzZ1RmLB6IaW/k9oVfCClCP7exXY0q5DbHDPmDHVKfpA10vmfx8IjG?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c51916-6eb7-4297-b4a2-08dc44f86906
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:28.6751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wm0RHEfnZ9n8mZE3wmNMPrl4O8+pjS7KuONvRFJTit8sEiwHg3y19TJwTB9UCmLjVkVEyVpTm25FWPnvE2tAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

When GuC doesn't reset the GPU on our behalf we need to be
extra cautious on timeout and skip scheduling jobs or
manually forcing gt_reset. Otherwise we get in infinite loop
of timeout and reschedule.

So, this is a preparation for introducing the busted mode
where it gets busted in any single timeout/hang without
allowing GuC to reset.

XXX: This is enough to get a clean stop for the software
validation teams to debug the memory. However the device
unbind will splat some WARNS because memory is not entirely
free since hw_fences were not released.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 82c955a2a15c..ee663683e9eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -176,7 +176,8 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
 
 static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
 {
-	return exec_queue_killed(q) || exec_queue_banned(q);
+	return xe_device_busted(gt_to_xe(q->gt)) ||
+		exec_queue_killed(q) || exec_queue_banned(q);
 }
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -960,7 +961,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
-		if (!xe_sched_invalidate_job(job, 2)) {
+		if (!xe_sched_invalidate_job(job, 2) && !xe_device_busted(xe)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
@@ -969,7 +970,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_registered(q)) {
+	if (exec_queue_registered(q) && !xe_device_busted(xe)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
@@ -1010,8 +1011,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Fence state now stable, stop / start scheduler which cleans up any
 	 * fences that are complete
 	 */
-	xe_sched_add_pending_job(sched, job);
-	xe_sched_submission_start(sched);
+	if (!xe_device_busted(xe)) {
+		xe_sched_add_pending_job(sched, job);
+		xe_sched_submission_start(sched);
+	}
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
@@ -1024,7 +1028,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_hw_fence_irq_start(q->fence_irq);
 
 out:
-	return DRM_GPU_SCHED_STAT_NOMINAL;
+	return xe_device_busted(xe) ? DRM_GPU_SCHED_STAT_ENODEV :
+		DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)
-- 
2.44.0

