Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1115CC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F4110EB27;
	Fri,  8 Dec 2023 20:28:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B25110EB24
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067278; x=1733603278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uTRfOyZ1xMhCQ4xkzaV1Gf0OPXDP28wIAGxJpKVT5o4=;
 b=IY2NHef+LhhXMqsl95LJJ8ulDHol7OkwCh9fTVakElqEeHWkl6+FPMuZ
 CDMScsYEeSg9KS+qvG5I5vpiuSAeoGhzVX3S17BS0kOnUEOwJ3+ZWrNj1
 dfizV840+nZSsJQfQ+oyt/Zyqwvf7UsjXot1Z7q+coII673C0cS7FPjuu
 3mPk1ZcVHycZVonVzsWszUe8LZtYYVwvqbjmHp113gwvKmtqC+fXqY7AO
 +gEmcHK+IIeM4/YKV9kg01j2+TnamyWJBbnEgaPAe4aQ+o3qtkvdaMVki
 H3T9VTg54OEctMGm3xyQH0Zku9k/aYe2TWzRpayWZjiQijF4cZZixdgAH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7786287"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="7786287"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890259975"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890259975"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZPUr/n8YQQtTd8rylyDU6I4TT5rCedhousMSS40Fo7KGgYwBAWcdnQKU8QO/fpiAdV8pX93gBGuf3Dk367t8Q48YIlLSJOcsu0peK6bOvslCVlNV6WmdE9S7ycQ//5mw8goHtrWkPx/LfkevN4k3O+qGIoSqGf6xZcX+TmdveHXPjMpYU1mNVQVNC4ayJoNaWk158447ETETgVjO8KMGCOI+E385wyKShU7mxg/KSi7QyikuFagyhQa6ArlpfwZHiTzvkjOALEypxogXMe62Wj/L0oHPP1LRRIGk6sArxa+uCs+BWaG0t3HE+kVQTiBdL89WRt3J0YjbQOQZ0RYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlhmukh0b/2/xooe5v9Zr2frdtGTvtH9Mz+mXq/F81s=;
 b=YflbHb5MmagwQ/VPUtWTu2klbmjuI64i6L/sGASuxu024f6CwadQfWjDc7ZYdYXT7ZZCzCG53O8o4M219MU9HbAQuQ/HOB1WGyMf2L/z2wILHPv4ILZMhYqn7Fr9EX3JZp08xn+TpnDICtUPXoN7TyZwGcSOCqrvj03T8oU6lyibBBzojrKTzA6c4bmuRSzGxiuu1nOjo2Q5ON/olA9jNP1RRN4T1Z439bInI3rNiAIu4X2BG/fmXqyVG9W6NdXdSnNP5TjPJVsVAhRogWc+Dp04aB2KE+xeDM678uRYM+FOMmZSJo9b6E1eFeEVpD8zN9O2FqON2ZlqkDieY80cMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:27:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 06/13] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Date: Fri, 8 Dec 2023 15:27:16 -0500
Message-ID: <20231208202723.918082-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b53b76-aad6-4e25-96be-08dbf82c222e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhSQ+c7gIllH5gW58+j15KBLQxISmaJ6C56P0bb07fjFy/hCebES2TZt0KdJorAPhhlKif0ulueJCgNgZ8XkH4JTlc4MNomoQOA9XEXPqXOIiGi1bbcJf4tdEb+zxMD+YlYUj+1NtQh7PK+cDMWnHTWdOLucIleSwT+6uwggH/iHOGCrLw72C8qXqzAmnFk+x6iviw6TZLFFDMfGdlGLeJ/rF8DbYa2rO1B7weAIgwFrxh2Yt1ovFeRp8wKGKFAGk4M/58jcp4nap8wBlabJG3jiZPkWh8pwKCjl/BVSmsUU5TzF2gyOMeUyK9lpxDemzRWpc7tRcwFPS1AO/MHlSTtKtSHgKYjvzKuTXY5aF8iemMqzHWERg2EJtEpbA3x/6JNYCiOfyLkgE83qL7ofBsD4mjAROLINUuHWm2aQIKnkFvyjGXoZy8LxlPqF5GVoo6i7LAAqoLEK04OJ8rqSjAZjavjYfLVgwtSTGIS9VK0ldzs+KMKfWYcXpV32AqSIB6F7rpzCCF9/u65B01dJw5dHOBtypfPLMfCgQSdAY2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SX/ZhMxQ58B+YTaMdELzjhBgkejIuHOiB8uuwRCsEIlXXcggwsnu4HE/5fa2?=
 =?us-ascii?Q?uzaQer/cGvwdyVi3DhcCwt/KFbkhyxeQ6cfNKUVDzeO7HJ9/4qwVGAIpTb78?=
 =?us-ascii?Q?H+vSzDA7Gfvsufgp5kH2pMoDpWIPcflMgepk4YrescbeYcDMCcmassb4A+3R?=
 =?us-ascii?Q?n9PziaXL7Yo1Ijhd2UVGvipjTaeZITwbVkmZjbP+9DQ9Mv0lqs5g6rUrV9KA?=
 =?us-ascii?Q?fv1hnNkz1WJeenxn7HROY/bAh6ord3VIfh1rykOGrXWBRyfioI3B555DLkLS?=
 =?us-ascii?Q?VT4b/azVghIk39kozjPTz3NuN4gGjPylikWa/TnTmEgNez8rkIy/QPn0zzGk?=
 =?us-ascii?Q?U59oowdAu/lpLSqPoZV6txF41L1HiVsMa1SrIImDFhYGIfNa7GcBZ//9agZS?=
 =?us-ascii?Q?8I3eaY4x84KAZRUbFR75Q5nImQtkW5PldkQCBnt+MHIVuJhSe1ZuVPV5x1ZR?=
 =?us-ascii?Q?q0FTGet8pYv+avZxcnEVmEU1D4UZK1KqFSNuj3sd0lk8oFg/0ehovNpsWv1U?=
 =?us-ascii?Q?D8NLtgwibyqrY22GmE8Ab6yDG4QpVb3rOeh7bmHJfCYG/6cnpj1joEwaq+/E?=
 =?us-ascii?Q?QFxOBlbkbBRrzQM8vdsXuAtofSAL58fLuw4YJOGYj6AmFMwl7PlMg1hqJFG4?=
 =?us-ascii?Q?lvnduiv63w6+kLMht9Bzrbmn/fwPM6Jfl9fhI0bcUkTmD8Pgh/YaSj3D0BQy?=
 =?us-ascii?Q?YbqqzPAalGjLSZt5nQeEWJcg88PUi3egGKrc32aaqUy44zhZSkDfvplEaXHb?=
 =?us-ascii?Q?nAvdvThSS1OwAum7bxRZlgOUvUcA6oM+y0QCfb1IpCwWvnm7YybAAa2/6tBV?=
 =?us-ascii?Q?hIuAULERRR7G4rIVQw6l3wX//PmoVICGm29uodOhFVma62L9XpBT+R31SH7y?=
 =?us-ascii?Q?jI+CmkkQC+OmV3ytUJIazkHrmXa1pDuj1r3E9ABEWpJdsvwilKhKGXDu1O/w?=
 =?us-ascii?Q?vHR/ozoevQ9fgW3+77KZagsRoKqw9O26egMJP89NVnqK6X596QpQmnHdE61K?=
 =?us-ascii?Q?W6is5OlpOnPsRxN57W6qkU5EYWEZctCWvG7oOLOTGLOR81BEhubs4DJE0F6w?=
 =?us-ascii?Q?RCwByI9wW6OT9rldtpH+CeAemx359HEwDqZU/K3AvPzxNDEap5fOcq/bNF89?=
 =?us-ascii?Q?+yOwML5d3vDGzWhm1sJYyj9nnFvI9N4vewEZfLCyJ4guZw8jrI9S4tALN7OX?=
 =?us-ascii?Q?22GxsVqGrvP85T8jxFeZdjKS01/TSBsORGsnSTRe81sr3FQxnF6iAcmipol4?=
 =?us-ascii?Q?B2+Nwe1rAxb2sqvJpej1jaZr6ettW3031he1lahCGof1thKpsfK4YZB6dd0S?=
 =?us-ascii?Q?LhZtTxNgsz+mZXUgp7ASrCzzkCz0kqySAZOSVE3FxuPY4wpS4CUYGxzj5Jka?=
 =?us-ascii?Q?nUy+CpSHGmDQIe/pHZoGxM3pE0dQrN2fAEzDlYE3ty1fUtpRjycXqxCc+JRs?=
 =?us-ascii?Q?w5b2gQVwgzlaAhiUBQxZNgDN54mbU+agd8GoN2fwGlDKlR3QUMPKYpngY2mV?=
 =?us-ascii?Q?vV5fMN70T97D6Ho04lvZeA6B+w6F44KK4S2b/f2v4CvnE6wjc9Ai+2UHT9vp?=
 =?us-ascii?Q?HbSyQ9UKQI92UE/Fk0m4MDoLjQeXDxQ+3UHuqSiyfhAlIP/NJkIR8NuB3UQd?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b53b76-aad6-4e25-96be-08dbf82c222e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:44.0860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVhTijEE/WJ3bNqHZOOe6BSbEPz+bgOCf40kp57+QGriMcRIatnl1oWhGPRszmmdoMZGLTsMXMm0xLSvPSsOfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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
Cc: Danilo Krummrich <dakr@redhat.com>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Luben Tuikov <ltuikov89@gmail.com>

Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,
rename __drm_sched_run_job_queue() to just drm_sched_run_job_queue(), and let
it do just that, schedule the work item for execution.

The problem is that drm_sched_run_job_queue() calls drm_sched_select_entity()
to determine if the scheduler has an entity ready in one of its run-queues,
and in the case of the Round-Robin (RR) scheduling, the function
drm_sched_rq_select_entity_rr() does just that, selects the _next_ entity
which is ready, sets up the run-queue and completion and returns that
entity. The FIFO scheduling algorithm is unaffected.

Now, since drm_sched_run_job_work() also calls drm_sched_select_entity(), then
in the case of RR scheduling, that would result in drm_sched_select_entity()
having been called twice, which may result in skipping a ready entity if more
than one entity is ready. This commit fixes this by eliminating the call to
drm_sched_select_entity() from drm_sched_run_job_queue(), and leaves it only
in drm_sched_run_job_work().

v2: Rebased on top of Tvrtko's renames series of patches. (Luben)
    Add fixes-tag. (Tvrtko)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231107041020.10035-2-ltuikov89@gmail.com
(cherry picked from commit bc8d6a9df99038f61adf2881ad9f717abe414e06)
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 27843e37d9b7..cd0dc3f81d05 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -256,10 +256,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * __drm_sched_run_job_queue - enqueue run-job work
+ * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
  */
-static void __drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
 	if (!READ_ONCE(sched->pause_submit))
 		queue_work(sched->submit_wq, &sched->work_run_job);
@@ -928,7 +928,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		__drm_sched_run_job_queue(sched);
+		drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1040,16 +1040,6 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_run_job_queue - enqueue run-job work if there are ready entities
- * @sched: scheduler instance
- */
-static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
-{
-	if (drm_sched_select_entity(sched))
-		__drm_sched_run_job_queue(sched);
-}
-
 /**
  * drm_sched_free_job_work - worker to call free_job
  *
-- 
2.43.0

