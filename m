Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E41C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31D110E133;
	Mon, 11 Dec 2023 19:13:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE3E10E133
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702321999; x=1733857999; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2osjlutTAAU+8xg2Nyg+i8/CEh1iCm/87zJV8W1zEN8=;
 b=fxX15QVv6YFLKDz63J/S73+XUZUoDACAu0KxIcfsjKJra9NzQjV2vHLF
 GpYphcGZvnROf9iu8SkI+ObGCobcvmT69SpqwyrB8Te3B3fbkWN7DrNVf
 QDtwjhKawCKNGjaSfpuQ7KnxOzSRixwogALy3ARFj0H/ArPVSD93HOz9b
 X7Ll7ntSelDbs/8Xm67aq5Q2RMd5aSoit+kv05346lJJl05/n8DxNooUC
 zmV7HpJeWcLlW6RlK0vaEvcYIdQHS8mdA3zgQ3GPa6OKAiCyQfJ6SNsSN
 Tr4fI8pc4J9uvycoC41N3gPjD40BSNG3GHFT295pvNL3KRclZ1Z/nj1q4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866883"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866883"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585590"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585590"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdLH0JF65rXSNZcMumIebe7RdAo7Dee8cUTk6CjUtaZuuLkhIbHRBWgA/yAHCwxkSfihWa4opATAXUez0IolCmZX1CWOomcFtFPozfouMRowbbqYCwYvNqShh+UdanzFf7CS3LT/6G7bwk0GyVbeWUYOHQ33TSL64ddA9X8ZhFHNuqeXnR0W/0T8JTHvmYgYQNhEnjAcTCEOjv8rgvs5o/m9Jy7wf7nRhlPE/5eey6hBGHz7Lmbajd3PgX5GpNrK7tP0EiKrbaQxpeNY25cwu+zBm0YHPu5fexcnc79U2zBnLEMG/ILkZhgkKUxCTGGOvdUEGrlBU5korlAWsyvF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/FuAKtfkvV4l3rUWaOQM+Q7Ij2+WR6YCsj3If/5ObY=;
 b=WqMP/BtoabNbtpUGoIoBhchNtC7io0SX0rFTj14t0RlDjpggY7FH+SGX8ufFaiaJqT3Mau2O6DqfsleAzfVWIhCeAsKv5gyxZaPC2J0OCZ9VmBv1yOwrF+urmGWL8IPJiOeUB39rUw8mEFlyOQy56pMjoOFfH99jJsPa08tj54etq+xpIVaEAdPG9pEiZ6j0g977MusvBIZcDt/8l445fUYoO/3cmDQpdMzvZs+Gx8Aiy0XW6PB7PdIDZx3Ud1lfDK/l5D/zaBFy90j7IhLB10fgIPVjSMO7wnn9fNRl01ZpxX7vUnPWNLpVOlw4+01A6weE3aXLMOT1hbAWSMADKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more
 descriptive
Date: Mon, 11 Dec 2023 14:12:54 -0500
Message-ID: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:180::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa66a6b-7ce3-4d34-17b1-08dbfa7d3697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61XDfeQ+9+1DP0LoauuGV0GP6zW0zgmWhcdH00NnfeEoptLjCOq9t90fpgDtrNwawcA6XzIzox+z1Au1Y4JFS05V2kQJ9iVz+dHjmN9OWAw/Fbuy4pKIoJKXgCSbnVo+ed3XMTlWahZNZNeByrRJmrH6wjort4rvk1R+mTKI+YvK2ZvlVwyIU6wUVAMlu76ZhWCgD4bSYV7Agak0eqi9ts2yR19iZl8r2ryXQ06KUW7ADvRin69U/UQDNkVuGh4yp3/lVg75MPl0J3oM3geRyyCj63hU6lIiBQzkpXBhSEXuA+m6xQLbv78pR9SvcgtAEc/nX3thaDNtR3hJmeYMXAlgfGRS4Q6aQnu6K1FvEpF5x2HvC0PV4vQE0RMPpYlHwx9ieNueFJUKlLqsLDTaE+eQ058NUF/ifyhqqvjd3WkxDFtYWNGWshlo94NQb65txo8V6SDvYLZCSHcu9+f2O1TiEnCZyThm2zSaGcbWAXf2wQncp1xlHzKB00p50I3u5MRQmY7RrHLjGti/n16muFml9kPIcXP/0TDb9Py0Dw8Ti7OxU+bDIGtIc7ZXO1TCiedgiqw/EbkIr3uF5U1NZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(1076003)(2616005)(6506007)(6666004)(6512007)(478600001)(83380400001)(6486002)(66556008)(2906002)(41300700001)(44832011)(66476007)(5660300002)(66946007)(8936002)(8676002)(316002)(6636002)(966005)(38100700002)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DmIOc1PeWDrvSDdF6ACAVMIq6cchlC/+Y71U8PsJI0wf6VPxSco7k4sfFOkl?=
 =?us-ascii?Q?abW/UniPFUKqevw9CLN0gGGhZ7EqwwKlGeQs+4Z6K0DQL6yo8Mkdf/KNV6DL?=
 =?us-ascii?Q?jqIpLIYlZKqESK1B7MZTqkD1o3LsJ9xEXPP1ACDZqFwNsU0/EIG97qEI0C59?=
 =?us-ascii?Q?7jjsQvYV3vqSyjJyJjCxlatoS9FJM01gUOcRoVWDO2X78AIj3I3euxR5LLZV?=
 =?us-ascii?Q?EuqSzsopqk9pnvhgCJMqZADt+KDbF8C0pfOdB1gz9+Ch4l5Dr0xcy+AmANnD?=
 =?us-ascii?Q?C9byBNlMW11UwrmkWdtN8nNU0bwxcQDyg8g6WBTzpxE4bakUbMhK13sOJEqZ?=
 =?us-ascii?Q?wG0YyZ+xTvAR8FOukMXa1Ux1Mx9ZUZqtaU+FQo0nEBYxhM0QCC95cnC7RC7t?=
 =?us-ascii?Q?a4os/qrBkYyETkAcbV6Wbzc4Q0Xk1VKl0ceNgviD7yoZe4ZjTp975YDWX45N?=
 =?us-ascii?Q?Kdjezsaolx0+zLVKLuAS/Ar0vFbl0iw/cTAPdoy54TvT5RJBqO4c9XqR7zEJ?=
 =?us-ascii?Q?mXfrUMI5pzAyxYcuN7qts3nKQsZGDi9vKRLVnrEnKPLrDFTduoOosugTeeBI?=
 =?us-ascii?Q?YBY0g68Pg0+3pHwY/+F3kaSKlgjq+ufAAi1Aph/D4XSLqSqhZaJsynRX8QFW?=
 =?us-ascii?Q?tydVdR0ADQHhOLpXoSYfFi7+2dIoo2OzXRJAQbLb7EDZZukXcxvaR6fg9q19?=
 =?us-ascii?Q?0Nlzc25nR5ZuRRLODr0ZEPqBKKhFF1TMTvfNEfR4uh7y5lAslwjF737EIjC1?=
 =?us-ascii?Q?25J7F7PNONUD1APsUV3GrnF5cX/+q70ulAk7ym1Xk4sF23ph95CnsM3xOh+3?=
 =?us-ascii?Q?1PAsmrJeXVmvJyZ1oDyTQkMg2ZGYtbpLs/LZXojyi5WXe4vDkC967gpMZdd6?=
 =?us-ascii?Q?lO7zG+4DMUswhPhb7jEIMHZS2li3NqSk4dAYS+lvLu20T8CxU4GIS4jrTUYT?=
 =?us-ascii?Q?PmmHVT/WCVraCt0FkX7lxkbU8zoEzqEWhlOJSZUeCLMyy8nukwo0qORFgPJp?=
 =?us-ascii?Q?VMY47Epr58ThyH6mPhouFkdg8UcwSbCgo3wAcPEsWF6NhXvuAQxXgbbUg98p?=
 =?us-ascii?Q?nHYVR2rrUTvYJhQIoSE/16Ui/be87rbNzYUn5xzyp2ghu7wZ7UYW75x1jctJ?=
 =?us-ascii?Q?2+af7B3n+2cEnCirkiYXyL3298DjVNRE8gsfyD53gWOqmTsyXiF67zunVV9n?=
 =?us-ascii?Q?n/qRjJkGqqLDDwD9WCuZKlhKpJRUm5Wc/hq1FtsGMvjMLH5iA7yab+09IbT1?=
 =?us-ascii?Q?MQsBPtSV+BC5qyyCSytDWBYrOeLVpT18zgo7Tw8RK96wC+3iKD3cgu3Dc92T?=
 =?us-ascii?Q?zF0rzD4xteLa3VDflsdhLfstHlOOP17+F7U+it5xLwSsAlK8VRmynNfscL1q?=
 =?us-ascii?Q?FObmxEKVS33L5ZS0KGiXZoZZnkh8pYuwDqErpE9WkABZ9yoJNyZNtozOPqfz?=
 =?us-ascii?Q?utdn4DqkhWWrhDwUm0+rVzngn9xdRXq8Ud/HHFkGI77UD8iMjKAWjWkhNbta?=
 =?us-ascii?Q?H7Ea4a0polz3QOwozyRthwZC5tyzjLG7Ksskbs3ut2idm1BQi5UITQophsCV?=
 =?us-ascii?Q?bOnnqELTlDbvKrGV6oovWuymlImf/CdKF+gXYOY2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa66a6b-7ce3-4d34-17b1-08dbfa7d3697
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:10.0345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9ScL6OlyagIJ9wv0TdryuP4FaQ1xch345zZ5kZgFd3025eBHmAvIRRPecv50+CjW82EMiETbQTn+eXIL2KNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

"Get cleanup job" makes it sound like helper is returning a job which will
execute some cleanup, or something, while the kerneldoc itself accurately
says "fetch the next _finished_ job". So lets rename the helper to be self
documenting.

(cherry picked from commit 7abbbe2694b3d4fd366dc91934f42c047a6d282d)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-2-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 98b2ad54fc70..fb64b35451f5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -448,7 +448,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
-	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
+	/* Protects against concurrent deletion in drm_sched_get_finished_job */
 	spin_lock(&sched->job_list_lock);
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
@@ -500,9 +500,9 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
-	 * drm_sched_get_cleanup_job cannot race against us and release the
+	 * drm_sched_get_finished_job cannot race against us and release the
 	 * bad job at this point - we parked (waited for) any in progress
-	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
+	 * (earlier) cleanups and drm_sched_get_finished_job will not be called
 	 * now until the scheduler thread is unparked.
 	 */
 	if (bad && bad->sched == sched)
@@ -960,7 +960,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
+ * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
  *
@@ -968,7 +968,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
@@ -1059,14 +1059,14 @@ static void drm_sched_free_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
-	struct drm_sched_job *cleanup_job;
+	struct drm_sched_job *job;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	cleanup_job = drm_sched_get_cleanup_job(sched);
-	if (cleanup_job) {
-		sched->ops->free_job(cleanup_job);
+	job = drm_sched_get_finished_job(sched);
+	if (job) {
+		sched->ops->free_job(job);
 
 		drm_sched_free_job_queue_if_done(sched);
 		drm_sched_run_job_queue_if_ready(sched);
-- 
2.43.0

