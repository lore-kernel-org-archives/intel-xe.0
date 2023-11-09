Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C99C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6135710E8C4;
	Thu,  9 Nov 2023 14:54:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1836510E8C5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541695; x=1731077695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=j1Yl5t31tVPmghl80KuOfGpXqhQIOs/At5DnSR44st8=;
 b=EXWNfpqaEs01Zro3c0xEcipwmBz82u4QKmuiZkDvq5wWXUJYb1e/Yxig
 VL0ftZVR8RlJW/eR4XgJBIoaWJmQrF0MZ3pHDtbcrqnolfnKWx1oJ+YhG
 0o0macdrcU2JcCi9nmdegLH3tDjjOHgTBbFpvy0iErHDR21TRkGbp2zgc
 WDWJ3uCF9rgjOPO2m4k3MXDOgiloysuZ8RycMWSkJqZgFAUOPEaxZHZ1J
 r8lDehZCqcGEJpTOJCqM3y5rkdKj4cN3ZknOFtzU5PYFDItC89U+ozV+L
 syNcM517iAnQus4W5fB7VEmJ0YkR3sdMLgDhBbFeRirPJ45i6Bt1J8BSH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8647848"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8647848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1010657953"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="1010657953"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJRWB9o/0NBYkVl4rekSdpuE6+ssrVk3Ba1RO6FJ/FDeV/Jvj14XGYtA6++RkbsroJtyGpWCeu9FwhbH9qyb2HN9gpLFVRGZvt3mIISxsXvTSaIjRCG6CFOWNY8YYEDB5eB9ljmx3MAm2iZugDsgNfcspaYX5x6R/QqmfIb4sXCVdgKq1MmxOYmKTT3Z5ZO3KDy6hIsXOfXxIicxyyvp2RXm1frYGH7N2mSNYSPluqvRwRjPwfaYSHxQl3vBUhHLMYXhWThtOQqxVpzlh2yxU6q9yO4z1WC/NdS34kUA5NSaXx7lCUzvnc3yrfEXnpls7SBSwLA3CahReHTf+b4tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yk9/PMOUb92uzqLRrBWjRVGIdKsT+TD6vfD4Qj0P59s=;
 b=bWva8u4ttQYKth9+oIWcXx+9/kSc3+fZZ9lIzUGZiP4M4MP/a9UpcSn2eQ3eSaTOXRKpdu08K2ydN8Mb81k6mHuXAv6C0X8eGmQ7gqJr9CbAe3y7PmeZIe4pxPBpo78oSFxwcCGuu6N4HQ9CIaNqjrpCl0LL3L6qT02kNQD/I4AGkCpmjgmBBEDiKPM4brLGpRHrs1mHlFY9pPHOcNWTb25HmN1LNEMpIJw9aVEewEQUTR6LwjJo3fRB+rs5HHpC+DuwV0iqhgyNmoqNgLiUYMjciWw+IsUSDRcii2iMoHCL+5kusHDJ6JtjeT3/GjIZDvscRJeTgyJkkmlYomZyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:33 -0500
Message-ID: <20231109145347.345120-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0007.namprd16.prod.outlook.com (2603:10b6:907::20)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbb0fdc-d8ef-4974-7771-08dbe133d2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6y03z5HM4goJZLDC1XQw2vDBcIDMNl+q2YuNQRw0QJ0I5gm0jpGXrVXzx/n0DreKz2j2oOraRUg5aS9mlW/XZ5vIPkLyEB3/r2CmyO1GGi74L0w7wOjXKTeYEFe8DJLQ7JXZp/L+p4o1sDTezn5iaUoNubvxHtMYCLSX2vMiB1xHfHq2gvgG0Gl9WFbgFOirQ5n2ZjReH32kw34AlJwHhxzLdZZEmPb8o4AvyQihgpd0f9E68diAfP6Ujg6dyNnyWw9ggwp8GxRcCkwsLjmfU7x93jY1p2sBsvUJrH7eVRGpg5iaP6+J5rfz7+24Dq5axjyGVrIiN2CsMqfRNVI7IrnylBOvgz6pn1KQqVOkumXbudbSSWFEoyk3LEZzAi+sTmdYjg1k4SKl7UDH7zBBKMAQRnbfJ8Ef5AYC3njhw31NUqv/YC22u4zbpAy/IFaSl0cLi9rtLkp683nox92AcZ+u+dhJquj7S5aDg37XlQlzMubYz8vbj1P+DZai9c1d5yemo54/m0pZBEVxEasRdI6RDtYuroG00jRDjBmt94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(966005)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TABPFMctmxH2hSf9eRNhSwh+4WTWcYCditoe60xLZZu6ih+2UQj0QEyngbOf?=
 =?us-ascii?Q?w5VzEv6VCt8AXFm/3ZiUYwDgCSdKf4cjmwm7vcZ2lGkEsIjlhcRxHV00xkbG?=
 =?us-ascii?Q?wQwUmHI9heO0eEImik3Hh7+AMaWvE/LyPtAO7uZhO0RK4umrvlBqUSPXv8eA?=
 =?us-ascii?Q?1eMFjYkObgzawc5hCEfZYxtAtX+6zwkb1fD0HKbJplm85MkeyOF8s7N2rTec?=
 =?us-ascii?Q?ugmi9fyZuwyFdM4Xmt32Kg1+obLq0E2LNwIf10ttymblTVE8QU27/Dx4rmCo?=
 =?us-ascii?Q?ttX2ddB5TOLcoE+91MGZ2OM2PSaimBGoIVTi4krCkOvlDzBFsSsE4MI9YT5v?=
 =?us-ascii?Q?kQiIQB7chtOA2vdyfgrDjJ1Gi7ZduKK8eBTGEpNi2U5Ak4OiusgEFzffMDei?=
 =?us-ascii?Q?fnU+ikWKL2x1B4PSwtgWOzO/ukIjMk2qklucUsb8Zxxb6gkfHdgYaRBLhuOH?=
 =?us-ascii?Q?cbv8PBf8fnDI9f0XKkLfx/7cyYM2ewPm79nr8evfp0roo6pu53Vuu1SotTNz?=
 =?us-ascii?Q?FES7lKQ6PF4Nrk6PLtNwB/YFSHBnUEmY6dj6vKeEZ8XeJ3RxmvoyRJ5xU0C1?=
 =?us-ascii?Q?zZYASa2AgiHUTf5O+SDWG1cbUuiNkCRKvo6ELKacA8abVcm0zI+IgFDqOfw3?=
 =?us-ascii?Q?HXnF9BGtjMzwLHH4rGqwtgO2gW9wMPewvlYH0xL2XF0kPQzC06eAIsCxOpV6?=
 =?us-ascii?Q?01OCEE+L7aaUuhrHYy/teZRlSFRZNdPmbJm5U6tRO+0itQEoRJGj2qpy1VUH?=
 =?us-ascii?Q?qKmZIXo2mugb47kozoJOOGxLwRhREB0dh/weMfSN9KYi8zgFIdbjrm7C/gei?=
 =?us-ascii?Q?teLcZPoqfePbPs6/G1Uiv9wp/Ke2dIkE9XT740bsgkbiHwQGDALnk1zfSrnE?=
 =?us-ascii?Q?OsfKxSPtFiLUzytdXwGAEMRaX2bLgTO8869HpGJY8Kxekr5/sA5bPnAmPjPg?=
 =?us-ascii?Q?4YZVRJHjFsS1knveQQkvUBzWQTtWFCWdDA1la4Ig/hEg7cxdg7SISoDE8fJ+?=
 =?us-ascii?Q?CfFBDi/eirn7L9YhTp+N+p6ff/OIXK3KJUNsyy/uO3d5dCgZt9NwqCU7O10/?=
 =?us-ascii?Q?nsIuAwvJBMhaQNi7quviCCtds3kEcn3ZwgofnBULQfzvbeAJgMx9XjDtqg4l?=
 =?us-ascii?Q?V1vRBgmbzKBi+X39qL3GPbwWYKLSDRo02sM0/BBSWacansROetVkLzEKrj+4?=
 =?us-ascii?Q?hnS5CdnzS66GcqUbkPF5Zlw57cF2p8D++UmH+hJfKdEPmd2rEtpPbv2lgLe1?=
 =?us-ascii?Q?0m6apALEVn+RcKtLm/gX6O7H6lmBqyJv94uFdYTQjfArE7nuqxQki3W1ngmH?=
 =?us-ascii?Q?JrgWAFJG8cVmbosLM9RbR0U55GhAXtnueKeiH0ytiPt16TQdJFHGoW8kM7q7?=
 =?us-ascii?Q?K41E0tWLIOGVuy5DV+NYuEESd4FNS+PwQohCCZm0gHYq2sD70pU8JC5gNo+a?=
 =?us-ascii?Q?xcU1or6nHCLswQlVUZSj9hTCb54fAPW9RmgCPKhsgnwi0J2BlAm7sIQWXunx?=
 =?us-ascii?Q?xki2J/BGkrct+lvCSY2Y3VqsHXyMUshVBzEqhceXdC3f8yUUEXBZvtM3YzPh?=
 =?us-ascii?Q?jgelw+3mSbII7Y7E3KoiO2hjFcpL9qBFIKdN3DZ2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbb0fdc-d8ef-4974-7771-08dbe133d2e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:50.4889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC7nkTGCu/44B2G+dQMK+Yt6VO6xdS2/zGHn3gsnncWnuR88NcOi4q6kR2z2VgwCbgdZ1U6lOfJKOpN9Sjzv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 15/20] drm/sched: Split free_job into own work
 item
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Rather than call free_job and run_job in same work item have a dedicated
work item for each. This aligns with the design and intended use of work
queues.

v2:
   - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
     timestamp in free_job() work item (Danilo)
v3:
  - Drop forward dec of drm_sched_select_entity (Boris)
  - Return in drm_sched_run_job_work if entity NULL (Boris)
v4:
  - Replace dequeue with peek and invert logic (Luben)
  - Wrap to 100 lines (Luben)
  - Update comments for *_queue / *_queue_if_ready functions (Luben)
v5:
  - Drop peek argument, blindly reinit idle (Luben)
  - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)
  - Update work_run_job & work_free_job kernel doc (Luben)
v6:
  - Do not move drm_sched_select_entity in file (Luben)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://lore.kernel.org/r/20231031032439.1558703-4-matthew.brost@intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 146 +++++++++++++++++--------
 include/drm/gpu_scheduler.h            |   4 +-
 2 files changed, 101 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d1ae05bded15..3b1b2f8eafe8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -265,6 +265,32 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 		queue_work(sched->submit_wq, &sched->work_run_job);
 }
 
+/**
+ * drm_sched_free_job_queue - enqueue free-job work
+ * @sched: scheduler instance
+ */
+static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_free_job);
+}
+
+/**
+ * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_job *job;
+
+	spin_lock(&sched->job_list_lock);
+	job = list_first_entry_or_null(&sched->pending_list,
+				       struct drm_sched_job, list);
+	if (job && dma_fence_is_signaled(&job->s_fence->finished))
+		drm_sched_free_job_queue(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -284,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_run_job_queue(sched);
+	drm_sched_free_job_queue(sched);
 }
 
 /**
@@ -943,8 +969,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			next->s_fence->scheduled.timestamp =
-				dma_fence_timestamp(&job->s_fence->finished);
+			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+				     &next->s_fence->scheduled.flags))
+				next->s_fence->scheduled.timestamp =
+					dma_fence_timestamp(&job->s_fence->finished);
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -994,7 +1022,40 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_run_job_work - main scheduler thread
+ * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	if (drm_sched_select_entity(sched))
+		drm_sched_run_job_queue(sched);
+}
+
+/**
+ * drm_sched_free_job_work - worker to call free_job
+ *
+ * @w: free job work
+ */
+static void drm_sched_free_job_work(struct work_struct *w)
+{
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_free_job);
+	struct drm_sched_job *cleanup_job;
+
+	if (READ_ONCE(sched->pause_submit))
+		return;
+
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	if (cleanup_job) {
+		sched->ops->free_job(cleanup_job);
+
+		drm_sched_free_job_queue_if_done(sched);
+		drm_sched_run_job_queue_if_ready(sched);
+	}
+}
+
+/**
+ * drm_sched_run_job_work - worker to call run_job
  *
  * @w: run job work
  */
@@ -1003,65 +1064,51 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
 	struct drm_sched_entity *entity;
-	struct drm_sched_job *cleanup_job;
+	struct dma_fence *fence;
+	struct drm_sched_fence *s_fence;
+	struct drm_sched_job *sched_job;
 	int r;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	cleanup_job = drm_sched_get_cleanup_job(sched);
 	entity = drm_sched_select_entity(sched);
+	if (!entity)
+		return;
 
-	if (!entity && !cleanup_job)
+	sched_job = drm_sched_entity_pop_job(entity);
+	if (!sched_job) {
+		complete_all(&entity->entity_idle);
 		return;	/* No more work */
+	}
 
-	if (cleanup_job)
-		sched->ops->free_job(cleanup_job);
-
-	if (entity) {
-		struct dma_fence *fence;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-
-		sched_job = drm_sched_entity_pop_job(entity);
-		if (!sched_job) {
-			complete_all(&entity->entity_idle);
-			if (!cleanup_job)
-				return;	/* No more work */
-			goto again;
-		}
-
-		s_fence = sched_job->s_fence;
-
-		atomic_inc(&sched->hw_rq_count);
-		drm_sched_job_begin(sched_job);
+	s_fence = sched_job->s_fence;
 
-		trace_drm_run_job(sched_job, entity);
-		fence = sched->ops->run_job(sched_job);
-		complete_all(&entity->entity_idle);
-		drm_sched_fence_scheduled(s_fence, fence);
+	atomic_inc(&sched->hw_rq_count);
+	drm_sched_job_begin(sched_job);
 
-		if (!IS_ERR_OR_NULL(fence)) {
-			/* Drop for original kref_init of the fence */
-			dma_fence_put(fence);
+	trace_drm_run_job(sched_job, entity);
+	fence = sched->ops->run_job(sched_job);
+	complete_all(&entity->entity_idle);
+	drm_sched_fence_scheduled(s_fence, fence);
 
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(sched_job, fence->error);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
-		} else {
-			drm_sched_job_done(sched_job, IS_ERR(fence) ?
-					   PTR_ERR(fence) : 0);
-		}
+	if (!IS_ERR_OR_NULL(fence)) {
+		/* Drop for original kref_init of the fence */
+		dma_fence_put(fence);
 
-		wake_up(&sched->job_scheduled);
+		r = dma_fence_add_callback(fence, &sched_job->cb,
+					   drm_sched_job_done_cb);
+		if (r == -ENOENT)
+			drm_sched_job_done(sched_job, fence->error);
+		else if (r)
+			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+	} else {
+		drm_sched_job_done(sched_job, IS_ERR(fence) ?
+				   PTR_ERR(fence) : 0);
 	}
 
-again:
-	drm_sched_run_job_queue(sched);
+	wake_up(&sched->job_scheduled);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
@@ -1145,6 +1192,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
+	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
@@ -1274,6 +1322,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, true);
 	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
@@ -1286,5 +1335,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
 	WRITE_ONCE(sched->pause_submit, false);
 	queue_work(sched->submit_wq, &sched->work_run_job);
+	queue_work(sched->submit_wq, &sched->work_free_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e0e7c4eb57d9..677ba96759ab 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -479,9 +479,10 @@ struct drm_sched_backend_ops {
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @submit_wq: workqueue used to queue @work_run_job
+ * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
  * @work_run_job: work which calls run_job op of each scheduler.
+ * @work_free_job: work which calls free_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -511,6 +512,7 @@ struct drm_gpu_scheduler {
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
 	struct work_struct		work_run_job;
+	struct work_struct		work_free_job;
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
-- 
2.41.0

