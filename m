Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A1C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA4C10EB23;
	Fri,  8 Dec 2023 20:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6A710EB1F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067277; x=1733603277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C3xbKI2sbyPpg2QXIjEB7SCQpVAEEyAvHir0B+SS7dY=;
 b=nJrMOYfFA1jCqcQvJqqxOmtqWng0oiKjNA6/viUfthUng7iedQG7Hs9W
 y0nTfrREWcamgUvLfy0umlLfCCvtSIvyesRhLteIv3hKd+XzaRa8QWe73
 Isnmv+M8hG+CbzXKO/Mi6YnE0/nJCIIlP/bCBUXu26MH7uxwXEENbNHNo
 Ruh+MooGK7d9CwXiKRX7aWufHIGsZWG4/uIgfy7tpBx7PhqSA7FKBVKFd
 zrdThJQCcxnk7DHEUhwAi3iRZuUDLX0HVd6L/4VxYkkyxnnpD7e1SI86y
 L3njGQGJOc0F+AJzK3wA3UN8eCX7z6Ebc5RMxqCOqncgjN8G6SCi06tyK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7786273"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="7786273"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890259921"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890259921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:36 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7eadi6p44DCP0BtNx1A3hEpmbzJM0mdkAxQRYmWjr4iGBgVWSdCdbL8b2M2nl0aPw6T1WaK/dudtrsk3j8JDcV99u0P81RBKmDQmkpzjpS8TEjUR36ZFwwGGuh8r3ZT9nEzPAO6XlTgLU5DYoxmfsUNzJeT9d+UgP3EmLQM2eq5GLU6TooA9kcJMC0fi35YvydCI+L6DabPQi09YL2lWcvcuVCdJMJc4q+6DI8+f/cMXg12lGyBnD0RdCVJRW8nvjlJTyC/4ruiCQr0b7sGfJuTfuQs76thNAoMkYlwXFGdc9cqqWW1Pn/pDNY+bkeH0yw/H2XNAM6xYMSrRi3EUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ5B/GX3akVHTvqeXwoli7Ad9wfH7iQjUiAZTFwRxfA=;
 b=fGmxRMbptkHUdPyciWf7V1CjpuLLPDhvRXRc+uknpDc+lYWeWEl3QCgdwgi02KuVmHvFPKeOvkc0P/Xx5RxjK96VcxyymTNdkhLv9mZIpCJY08+rPx4ak/2i2zIcSLWQlN5eNPsrqWNLX8azqsCu51ap2Tl0+0JtCR3m0izYIBKUUTRQ00oIyTe2LQ8Dg05CEOr7aSCTzZ3SbAro64HXjAA7TtOkMVSV6kid9zU2ctPXad6jR4YFjUCY/K6i0Sb6p1+7kP27R2oN8Decwi0ZdtbiVeQR4iioI1XM0KwTb5lDqflYzjOonwWbc1w+VehyJklXdloNt8k9BmXtso+q8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:27:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 03/13] drm/sched: Rename drm_sched_free_job_queue to be more
 descriptive
Date: Fri, 8 Dec 2023 15:27:13 -0500
Message-ID: <20231208202723.918082-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6163ad-8c77-47d9-5ccd-08dbf82c1c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qg56pAGI6jx+1s7jpE1A6A0CM2jWtEc2/oPBULdAqPYSLLVwmbX+fG/TT+lMWHbQ+OxmwsPrVh+2xznaV3XKq2+gwqOHDhtJMZekItjhv4BH84zLbiTBlnLivKpiHfuNYAw3+Q+hGURtscr19Jwoy2oNRnDN4shCUTKYXh6zmn9aB5gA+30dG7Iqmu5vsxHkOHqpKG+inm/9BeY4JRAJxdcF/VxBj9DjZ+BVHJ6MGd2+iXotT0StVsSPCDCls3f5f6NmjNlNwAqOK6LNKFEJAfGkMMX8NjMINOAjXfiTpQ6O06bhbsjyMSWb28XLzgtKDdC0ILxfAZrxZGzYVIJuXvJmUi92ZAXWig/fEyyUEzQAVoQET95RFRgEevDGTBKFRPuTp1HXBiaQfFkyZsPv8iQLS2XqDv2qu0tbT5j73cZO/dTU8HUPu7Cn7e8TAiiMtfM5z4RN+IuvFNlL5Pf3NRkHW6gL/t6buW92dEAVvG57FHSyTruTBc3nBmd1b1bCH5ST76BgXeLxe30pqWvW3fSPozDMzVBi1UBRJpUWA7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(966005)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+82nu8jR/PVzvNnQbUHRs76SatetUPW2yj8kHAIC1jUChzi1Y6cIcgruAN8m?=
 =?us-ascii?Q?7b9KUuKWUAjcH5pKqwFJfqdDv1kf4mFibe4DZkxNP3NiOpnwOfZtGHuhTVYh?=
 =?us-ascii?Q?9p7sjr8kAG2NQVRdCXbrJbVpLfnv1CQTcewZ7fj0NKVbQXNz4ZJ+nHWRzFMT?=
 =?us-ascii?Q?8uiCsJZUEVcnRepbMCv0yin14LHYSir9AZyZYN1MctUAlsbwY8wRUVUWORwZ?=
 =?us-ascii?Q?X2YFP4if3GV07OpQTGeQZc++ShP9X0nr3bER5tIxI7tVfcplwq+NdYFt6D7V?=
 =?us-ascii?Q?0dKbTW028EeCUGAJTUL8FflvaexjX8tUYZzfB41Jp59tYuJFeVImMNUM77/A?=
 =?us-ascii?Q?Sg1HqGVfJHFajWieasvv9neFeAuEO2EtuRBQaaBGrsuszvaW0M/o244UQk24?=
 =?us-ascii?Q?9HDpHX7XSqDXPsINH+ju74jnRxl9Uj3GKIcOQvgKSnR059MTvpu6TriaaNdd?=
 =?us-ascii?Q?FaOREumW0M41lPVfZ6fm78vDbKHbuu7nwajsGEV32wQ1DAEycmcnsN0islAU?=
 =?us-ascii?Q?fKN9MUalJ+83Jn9ga4AjdbE48Yzrl4il4CJJdEk1bBnjDfQ3aWmtzr4fOF/7?=
 =?us-ascii?Q?cd7qLoMbJ0pllbOdc7ARD9e4eDMRN42rdB5yxydJ4KuS78fnYMyOHlaJtGTp?=
 =?us-ascii?Q?6ltpUHZ0oXFn5R3VGHVGFUX/9iZIQFNp0evhJ4vWs5cz4T2frPI1C+fzQvqy?=
 =?us-ascii?Q?TS4H77D6mN9u569LxbXXAlGK16WtYWkJlv/9DhrQT0p5XgXYmm/inWxCrTsU?=
 =?us-ascii?Q?j/ZghNkd5qGaS4zHrS3opVzbYX8QZb8JFT1MjkTOA2t+UFf9ovrDe2TUY9/1?=
 =?us-ascii?Q?+dvrJSMMH0wmMb3VHMHKI4+jmqxZwqscCpZqfytEKKleb9fYm0F/rUHWkEC2?=
 =?us-ascii?Q?5FrcCHhDtQGUvlEs/+oln1yxVGcA20+p7AhVOwsiAyVgaZrwD5uEj+EdsrVL?=
 =?us-ascii?Q?/RIMADl4WKXFLB3T7FhStBbWyRfi5MI9t9kqekyeLoOc7xIMb/KcMgW4pvqT?=
 =?us-ascii?Q?dbcHygIo63DpOlyaFh6XMwEvlou+pLLTwebP5cOCBrEgk3kMNgnMwZt61SDe?=
 =?us-ascii?Q?VYnMZAHJsBGf5eEUSUY6CFsew2jIOhlYpMn8ISWU1mCr8/WfqlWxQqawbGVK?=
 =?us-ascii?Q?06XBgDuS6Dvl/24fmOz63ivYWSNzj52fqiZAWSVj9pLhf3Z5K+vlTF+9vi6W?=
 =?us-ascii?Q?XYGPQ98TYJ4aoRKkVblnu2i87UUzbINZfuHt58IkIxYrNpx/QHQRiJJ8E7PG?=
 =?us-ascii?Q?mmIi9ABMS6318WYDZ2rBleiOeusVYnAlfEgHFQaVvK+BZuo6hIjIYON7PjOG?=
 =?us-ascii?Q?ZngeTJopEJLwPqJ3X+NG+4Ko1ACBjJ2gumvpohxBuFkX3sKh3fTpPdD0mkAP?=
 =?us-ascii?Q?AGh7Vwii3ZgQmyruHEeCztFbag0Kae5oHIpq9qO+60nYeOJ0LHtUjQX5D//6?=
 =?us-ascii?Q?PiZdknuzMEQscabyNhEL5v7XqsxUn8+uZEVF8yLivIO+P+44Du+UZwmcJixb?=
 =?us-ascii?Q?Ww2zd/HjodRxDQWHJs4Q39E1w9C/ucgmpbQ9Q+iXhc61ZghefQAZUJTR4lxm?=
 =?us-ascii?Q?lSUw+VCpt5KhAZcHB919Q4lf/unIRyKnH8SjdM0MfBWisgc7goFUCPBVXOem?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6163ad-8c77-47d9-5ccd-08dbf82c1c68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:34.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLfTg0ylNU9nidTePedyIZy06V8v4dsXHuXRm5GkuSFACT2JM4QxOR7T/RHIY3QGln1L3oEgmNcuBiOLxSHUQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

The current name makes it sound like helper will free a queue, while what
it does is it enqueues the free job worker.

Rename it to drm_sched_run_free_queue to align with existing
drm_sched_run_job_queue.

Despite that creating an illusion there are two queues, while in reality
there is only one, at least it creates a consistent naming for the two
enqueuing helpers.

At the same time simplify the "if done" helper by dropping the suffix and
adding a double underscore prefix to the one which just enqueues.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-4-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit 67dd1d8c9f6543661720b9a89e28a25488cb8753)
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e1658030613f..f9baca20b438 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -266,20 +266,20 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_free_job_queue - enqueue free-job work
+ * __drm_sched_run_free_queue - enqueue free-job work
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_free_job);
 }
 
 /**
- * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * drm_sched_run_free_queue - enqueue free-job work if ready
  * @sched: scheduler instance
  */
-static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job;
 
@@ -287,7 +287,7 @@ static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 	if (job && dma_fence_is_signaled(&job->s_fence->finished))
-		drm_sched_free_job_queue(sched);
+		__drm_sched_run_free_queue(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -310,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_free_job_queue(sched);
+	__drm_sched_run_free_queue(sched);
 }
 
 /**
@@ -1068,7 +1068,7 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	if (job)
 		sched->ops->free_job(job);
 
-	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_free_queue(sched);
 	drm_sched_run_job_queue_if_ready(sched);
 }
 
-- 
2.43.0

