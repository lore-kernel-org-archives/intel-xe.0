Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7CDC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5908010E539;
	Tue, 12 Dec 2023 00:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A7510E52F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339876; x=1733875876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=/Y2f12SDioduIuD+EkQsCKkHRe48o3TYVRiATy/RD3w=;
 b=CjF42OuBpjSlyY11ZWLaxgm0sjMTxZb0TcTtrTRxgUXZrDFvXV1ngwDN
 SJJEQ2B1WFaLjrhrLnd6xxLXc65ccbhh8f8YjJY5Qjuo0Yr23RXz6iaS8
 7Ar603m1w1wt/yNZ8mriK2J5zknVB2i6NbfS4l4I7p+pEqaU8fOExgpFA
 ZKre8mszQq90IP0BPf90X6aTvv1kM4/PD/+Jztdu5HTg9kavUeBgKalsK
 dBaoNeSFSJR+dgLNqstPN57/KmCbjmLFovB9pB+whSAJj6xr8Ya+v94gk
 dTfW4rMT4LRdn1UNzW2vEQ4cgiVmQQokeSvypKHq1eeJ1N8pGFF+yi1WN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8092255"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8092255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="14720254"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjprCTwrWap4W30hizq7Dm64HEjbll8/Hzx5QUfHeZgVXFSMnfoUZ5LpwW7B3O8ztsu/QLaJ2L1txK6QcHsr3UHx9+CS/7W2q7UUYQFaKm0+NerOyga7y3jfBMnwgIjNrjBBDWQViAx04WcC0s+cxqd01cfpe/wIYTg1dWZDS3mxkJgidehOIPUH4iFfP+l81+ykS0Wnw+ub4HqIsrAC4QbAeei+mYbZ81iw+lTefQWnOvM7w2Jy1xaVxoSqyJlPiOVBitwVjJx8TuqEQXn35WtfBaH8ZzUJ23kJ3LSTeT3dMwUS+hBrZyrnoRd9kscy/9GJ6r+oduq/ATNl+Io+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJU3vpP74qgriU8r34lZtdD9dzVVa8849ftI0KfFZ/c=;
 b=Uq0s/MIYDtH2IjP6ntgHoMTE0vNAdxsFdiGCSvuqYpRv7D+RjkLaSshsxV0D45FslEzkIh2z9CJxJRKup2JAnwuEUJvBE6QPmW38z7bHCDoNzRWwM32mlsBpFjNk9NdZkA8yS57nNQfv0UFytzk13UHHPpB2KFiQGv2jpYRrQCqd1lvKWT1BG8oU+BG5P/RNvA6ChKgaXIQ78FKMO4S0H7wiYBbknLswzjYC6CqUdK8a9Fvs/nRtX35m3vvcrqdendlq45jmtmNWgMaLUMddIJUKNUp4yk5Zl/lYXZnodo+4Af69Mtz2f2Q2xUMJfQDkfwOU9D8X/HvfZT2YcTXwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:11:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 06/13] drm/sched: Don't disturb the entity when in RR-mode
 scheduling
Date: Mon, 11 Dec 2023 19:10:38 -0500
Message-ID: <20231212001045.1099517-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1a9ce1-6c8a-4a9b-7ef0-08dbfaa6d4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzqpNZ5zG6inamBef60oVfc8Q7t6DJfdF46tvnGuFCxeV4Lju9LFDwhJmIRzfq50EH9AEPRuRMk1o47bxlsb51i2agTsR8dcmMYV4HorKCAcosqr5qc86r1x6UGdcBRY8adJ7AOLJzZ4wNRu5SiM9H0geZRwIKVPskZ0h+yeINleM856KgGoCyWY8il/ZqnA1qkSLgGpqz7d++MglqKuunrRgIvi+JslzEEZyxJ9ausB+J72QPVPluH94+uGO9yyrE7DDD1bZNUZG0p51KUv+RLDISKY6lexkqcTkXr0bJJaHNLSvDT0jGSqAuo+FesfzaZasjvqmrwcLypC7nnLZiPWqrZgJdcHJdGOnGZrT3bpbsJ+c+WbprxZGgrMDXdirXzgpDD/Sundg9xy4u21dJOBqR7rG9gIhtAW9wNki1/g+rIeeVO2/UM/wWHyD9cpqUp+nd7EaVc61Z8KxrUx5WPXC9pZHl78mJK5vF6skJ/WH3hJYwYmyNiN38yDwUDvLQ8NtG28TiCGwjBvJZJfsnZV+/pZAfDeyWmCIQJK50U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8v/aFOFV42adzq2nAOJ7qnqkjlYH1ttt0dwQ5cegRym5CvLK0OhBSsnISOPT?=
 =?us-ascii?Q?fcC47ccQIxSdgTKxtc/si3hTBdKiOsdESzClMbl1ewoZFFugG9Dyo/8650mX?=
 =?us-ascii?Q?5QzMxakn6LvMp45f6H5V0PwsiHkY6OfbxNigiOPKx2/Sw9O5CvYI4+Sbdnxt?=
 =?us-ascii?Q?Y/eHWLVgFQnBmJlI9p/Iy3DS1saKD7ZjuQnTchOWNjnIZgpm/Fev/IgA4Axe?=
 =?us-ascii?Q?OI2fhi6SyltWXQaNWk7Ba9w5LReqxXpVohgccIpeKkydh97Uri/VO127eH3E?=
 =?us-ascii?Q?7aX5zOB3Donkxh0Kwtao/3ZX7tbb1C8jJUFKVUyelLp19/c6Xa9bMyAIXqs9?=
 =?us-ascii?Q?va+X8wqeTjWf4SabQ9W8INDyS97Ga05BQP6AaPLOL/7qIZjMw6+gZU7290pW?=
 =?us-ascii?Q?D4d4oMibjymfZtD00nl0O+vzZvzyUBqvGdcSpekd6vIw5TWNcWG3k1fcP95M?=
 =?us-ascii?Q?0IJws7e5/LUl1GlBaitMFHAwr0ofgLClHYjCqhTWMx3bmF0NPHpO1XUkOOP/?=
 =?us-ascii?Q?222B9T7j6xINZlfkl8AXCComebekb0f27zS2FoSBNA5GSCe0hTxhH4Dk9OWo?=
 =?us-ascii?Q?U0q1dAdN5vv4Pw9dlugDDvpt1Sp/eUicbBNVx013ZWLGIHs3jVLSj/ChaoaI?=
 =?us-ascii?Q?IJNcHnvcy4UNJGwESDbXhn2zJlOitlcdycogOyKAvaIz7hOSV/dGwHIy5RzY?=
 =?us-ascii?Q?oFt92D7IRXs0imSDyNIYWpJ+d7UU3pTe1U6ZCI+x3cDQiqz/Scv4NWvDwLCs?=
 =?us-ascii?Q?bcDVeCvIA0kvBiRFOENzdWyYZu1dMf2yYy00Ihd1eHBwp3PaVGQdr1b5MokF?=
 =?us-ascii?Q?Xh1mP3n+DUKufJKtnvhds7mE7uTxBFsOWC+ZovxvPttuAPt8YMh4ZqfkX7cJ?=
 =?us-ascii?Q?u02WhOYZP2ePG651uEYy0krqWdqxn1+dLzXGTeYd7NInq6SZt2aFI61M3nDk?=
 =?us-ascii?Q?PeDhhriatr0l5kTaBlkAm6NRDbNgl+sDGe9kW5XFGdaS/Q4OrBKDHDQa3sor?=
 =?us-ascii?Q?vYKGYF8dBFfqTgnoIu33MsPL00zfBThAnCUCuQmcMG9f+RXZvL3yjjqaeso7?=
 =?us-ascii?Q?1Gog0MnmPYCgvxrQPodIm3ghKoRDMKbS50roNb3c8cFdTlqKfpYH56IqWqE8?=
 =?us-ascii?Q?Najf7HTGwkvk2GJ69MHhDyi435F5rW1Uo18SfAtkcvI02+nqqBlZACoeqs7a?=
 =?us-ascii?Q?85oJ+E12hZ51bwIESJqenbeS8aPL3Rw7wSxQ2wxlOSOPU4CNuAuXMoKLIm4w?=
 =?us-ascii?Q?jPLFxtX5JT6yUEsyMlt1jTyczEjB7NP0o31+oC6MZFXLK492SwES0/IgKmLT?=
 =?us-ascii?Q?6f+d7WovDRbesUDxFKg1/UJCFV1NUFnd1TR6EPNzWUzu83kVuFkZphSdQksj?=
 =?us-ascii?Q?F5JpEIFkszazpnUyzeYKtvwhC1mvT19+ddlN93cRWf/LsZdHL6ghVVf5hwG/?=
 =?us-ascii?Q?GI037IrRq8//iWCblqGBap5LwN1aNIz6jfzQfEUyhzcv5aUb9KUviohfw8zd?=
 =?us-ascii?Q?5CI1jMeJsxEQl4KUGFs74/awISpl1QBzAb1e4Bl9uOUuruY+ioIIjcA5Uz73?=
 =?us-ascii?Q?Nxby2DXiYdlFO7HwMO2fCI9rO0h6uYK0ecN0WCfmyOdrjHha49bULoXsvytd?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1a9ce1-6c8a-4a9b-7ef0-08dbfaa6d4c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:04.5754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU9FQ7VZ5jdlZNCj3DIfgHdg9TjGhE/WKfAPdpehbKJY0wODOcjQK7j9tdHs26ee9H08k2sgahMHkq8vAwFMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

(cherry picked from commit bc8d6a9df99038f61adf2881ad9f717abe414e06)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231107041020.10035-2-ltuikov89@gmail.com
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

