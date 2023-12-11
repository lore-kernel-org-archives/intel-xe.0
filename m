Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F7C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F710E4ED;
	Mon, 11 Dec 2023 19:13:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC310E4ED
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322035; x=1733858035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Jsp24Dqgx+RM1WHGj5WYMXRnDxwLJ+IEGmZ49OfCuVY=;
 b=V7BF08L5vc6spqZLh5I33LT5S7kuAA7EyaUGSXSPd2OpheH3p3KEGFxv
 MNF1GgGa0pkXQv1zN8wRcKevtdS8gyc0xv935Y5zbXbiaGYe0PMo58vzh
 yvdefto6cPO5Z/UB8Iz3/tNCH1sKj8eQI/ZkbG4LYmpKEXrGzQj3bVGU2
 OBcqrM5G5KrsxlEeEq1LHtV9BSzrMdBW+7/LuniuuoYBEdQ5dUGIqQGbp
 9i9ioWsOXO1irJ7N10sV13C1GLVkRBHbmFt6AI+ZuCoOMbH+QyO8iTyjj
 leys9Le13f5D17bfIvCxwMS2DVslCRpTg3yB+bZqO4RaRHeXzXI2xH/2J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866960"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585869"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flPpx7dNM9RW4+0w77qUEBCWe6IUbsTVmIsLkuz5rVMK7c3sfb/8myRu6iV9tAAPL3vp0N4yaprc9MzXmBFf401uGMDXDUckHLLYNk/7f674piUXt9Ztd9buXtnJ01K3FUn/bqO+DsOzUhwvCTlidf4t02RpNvvxjzz1LQh5/feE3gKbwGOXap4NNEoIW75IQBgv6T/fM5fbB1uJz904M2q/AOaN3Y3FNkog7hTbIYSHmCy0zawu4cHux5200JoPafL+HbKCVj3WZXvKAiNJwnSBPjIIeo3zyFTynEq8y+wfkuDxo52OhmlwwTl2GzbnJs2Ix9Uvvv/+GcKJFGrIHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbd692oi3MquCa81anQLg31h8XKj7ELIE5FWLlXycX8=;
 b=oKafr6Vxlh2Bj4ndGxFiRtjP/5osCOOSI+lgyi8mg5d/H8ecZ2aZcgshgwKzaX3tYsVmDdE6xwGCwf7rcDGFg59Wh/sBc82bJLjXGH1ihlfypL3nXRUYEdKJlv4v9ug8WFv7iYT0vyCP2IAuhgz3aKjgcdHqEoZo//2rXosW7WPqs80X+2/TyE8sWhJeFB6GLzy8UdTFLPCOp6sI9A9pd92cvyIcXyD5nDX8g9b7Gi1hvdJxBImZKkvZhbAkS8I2T1XoUU6YSFvN7+gSf6BXKZE1yiF6iuyeHQiDtEnbj2VrJMULJEhdqnsRwPEPrDrKq8LhajAcHsIoq/rfRPwJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 11/13] drm/sched: Reverse run-queue priority enumeration
Date: Mon, 11 Dec 2023 14:13:04 -0500
Message-ID: <20231211191306.1069362-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 553cee42-b9ca-4701-0be3-08dbfa7d4c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zMXXtB0hRkh3cGnjfU47q5zrFpoUfGCCkALvzthagGnl4uV2OJQYADoldIwEKddKGUbL255LuXGwMrnUn2C7vf9WNt6MA9739zSSrzlGUNzH6QiXPhMXZssvFu+A8iES+C6SVqKaHhUh902ECEj1nX2tU95+ak4T55CWUq9OYuDszrPgqr2KThdGBJD5SXWAe6iqR/Zj8VLbAM4QtK8IAHLTeqL2ZTYzPpBoM0daoFTI6NmYvm4sltDfS3kcuqqPmxFAKHmPVUXjW41fFoRg6zQaZHkPefdnatAhtFjqfqQkjbXV7G7o88LKJMzG10ftkrbXPpCIinXikczxBiJd9NAvBDzNVEUyLbaMkRwFsRMdQ3yvMxFY0xYp43YXmD9+y2n13vuTQ8kLAYzDxvr5hR4TrNChFx7lb6YCw21N33YtCF2E/DxQzHWRI1/FCoG1UfzKDlx/ZzYpitq6M3uR1+VeR/gFkm2qE7C9cTf4MpMMLF8oY7FlVDfUrFuG58RcS8XSMoqmOfExEFuYKQ1kqS4E5cXQOzUp8Ic6t1nQQdX51pNCXSjbv+NXpDrjQYt5TMi7eUw+34AvNRjVGxeD/HyXzrS+nIUD82N/E3EsPEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(66574015)(6486002)(66556008)(66476007)(6636002)(66946007)(966005)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BqTlVmRVRPZWw0QlVNQVgrVlV0Vm16SHVEdHBvWi8veG83VElhaWpOVjds?=
 =?utf-8?B?TVlwOVpDS3VkQmtHMGRpaUUyTTNYdmlPNlpwTndlcHQzdmUyekNkcHI5a0tq?=
 =?utf-8?B?TUtZOGhQUzZHOWNVSTVoMGZGM0ErZU5aOFgzYTA1NG91S2hITEhDU1RIMW43?=
 =?utf-8?B?UERrb0ZVNzdDeTU2NktoK0oySWN4aHpQYWlxRTJuMFlMNERrbmVCOGhndVlY?=
 =?utf-8?B?L0NoRFFkYUtBajRaR0RZWTl3NytHOFNub2VxdFRzVlJDNFVGVzlodzdTM0Zk?=
 =?utf-8?B?aW5jTVhKSXRuVkh6NXRpeTVYWXRCSjMzY2xlSTRFRHArYUtKOTBFZ1U5QjdB?=
 =?utf-8?B?NGpybGM4SCswNktEZGFKQWRwdEMwZHAyc2lxWUZzdUc3RGd6cFAzT0I4c3hl?=
 =?utf-8?B?aUJ1bS9zYjQ1R2ZqaG5tbmtUb1JxanJKL1QwcUJlWjA2UzBPaTJ4RVZTMVVq?=
 =?utf-8?B?M3o0VDRXMmtrSloxVlR4VXpwcVlFNHR3QjJhUmxEeEc3OVhmbkUzNzV0cGYr?=
 =?utf-8?B?QWwvY0FTS2szSS8rVWhvZjV2U1RxSzdVL3ZsYk9FdGp0b2piUVNLRnVWZWkz?=
 =?utf-8?B?cWx5QmtXRjJVLzZGajRRZC9VdllVYzR6Mm5sYUZGM2xlTEg3WlZ5K1hKSVIx?=
 =?utf-8?B?NWl1VDFNajRIdlVpbjR2VVBPZnY1MG1PeU10Zmd1VWh2SDFSN053R3ErcnBB?=
 =?utf-8?B?TFNLem83SUExNTVPR3FsYndsY3JUQnNCT1QxdDVCd2NkNmRvd2owTXQ3cFAr?=
 =?utf-8?B?NjRpRGdlekNIeGdrZDFBUHNvYVhvZXZNdzEzRUVNSGt6VExWR044amNZbXM4?=
 =?utf-8?B?NHB6dVJzQmtNR2FiQ2d4bG5INmsrVG5oWkRCUVhObWM3QUMzZzRKS214UXpE?=
 =?utf-8?B?TzNVQlFCOTRENGFCeEtxZ01DK1FtRTlZU0lzOGZVTXRleWpaSTFlcWN5ejZW?=
 =?utf-8?B?UEUwN0JNOEVqUnY4QTVTamJOcW1HRVROZ29hVzMwNE92ZHNLS3U4Yitaalpq?=
 =?utf-8?B?ZGIyOExXMGtTYVljUWxSWFN3c0ZOQSs3eG43bXoxWDBVb0NrWDBDREFQQ21w?=
 =?utf-8?B?SzIrWks1WWt3aGpJRDFqNis5VnQ5aEZGTmVIbGNYV0NJSXo3dEthNTFrZGFD?=
 =?utf-8?B?d2lEUTkvZHFqMi9hLzN0ekNKZENERmViazh5TjZ5K2FLcHBjK1JWVFRDQllQ?=
 =?utf-8?B?N3JSRHBIazhWVHAxUU9NcUY0Ri96NTBIb3ByZDBpaWhTRnZta3FIRHUxRFdR?=
 =?utf-8?B?K2Zab2pHWDIwKzZmdEQwTkdNWUwzS2N4aEVQSGE2VFQydDZCSWlIQVpmQTd3?=
 =?utf-8?B?U0x1eWhVKytCS1M1d21yZWpXNkZvWWJHaHc2cFlvNFdEY3phdUU5VmJCWTdU?=
 =?utf-8?B?NEViVHRZRGVCTG5lYXBYYU9sYURSYlBaTzdONDNvenBoT2xkSDM2a2xuNXVk?=
 =?utf-8?B?OEFNNG9lNW9KWmk5aUd2VVhOL3R6c1VVQ1VhcUY2NGdoR1gza3FpWk9GMFpN?=
 =?utf-8?B?b0ZVd1F6RE1mc0lOTVgrWWJ1b1hwR3p1YlI3eUdoRUpmaFFudVR3d3FpNjJ3?=
 =?utf-8?B?cnJ5N3QxNkVBUHlienNFd003UlJldnNBazcrTWNoZXpaVXduNHRVaWNSd2t5?=
 =?utf-8?B?MWROcUtoVUFSUjRlQVlEeFh2MXZaOG1scFdmcUtodjJoU3BCSzVodi9vM3p1?=
 =?utf-8?B?eG9ENFB1dzJaamNaQmhiQzhLSGNSKzlLM09GdUZzTU1PT3pyTHRJbnAxckxj?=
 =?utf-8?B?Skg3Q1VFWTlxNk92NFRqdXR6OGZuQkpnOTAxdGR5VlhOZURYcjVOSVcweU9h?=
 =?utf-8?B?TmM2eFJza0xoSHM0UFdad3FMNHp4TEtZNnhsMDVFREM0YXJ3aERNTlBZaWc1?=
 =?utf-8?B?ZlY2Vys0L1ZXWmxFVEFjTlRsNHU5aUFEOExnQzJzb2tySnptdnlZM1cwRWxw?=
 =?utf-8?B?VzBNdDJ0R2Nhc2RqZ1RZK1cyWGVxYXNOVE9SaFhPNjZMVWU0K2szN0lHUFdX?=
 =?utf-8?B?T3RRN0dVSGxhRG80dnQ1VFJ2UGpWT2VtUGl3eURuMm05bWZ1ZkFrSlljWG40?=
 =?utf-8?B?ZW9NOXlYUWZiRC9JaWpJOThzMTVXalE0czhTWjFHMGFwUTE3WFpURzRySjUx?=
 =?utf-8?B?NEk0ZTRBeGo1d1NGVEF4Q3VtT3gwakNhcW9yYVRET0MvZnlPUExJWXNjQ1d6?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 553cee42-b9ca-4701-0be3-08dbfa7d4c7a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:46.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fAtMn7D4BqPMRBcwQ9gDE0ZL///h1RrKJay8Grk67N6sRsml5djl9MNVkFfqWIZvrS6FbFmMx9caiCCWObZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

Reverse run-queue priority enumeration such that the higest priority is now 0,
and for each consecutive integer the prioirty diminishes.

Run-queues correspond to priorities. To an external observer a scheduler
created with a single run-queue, and another created with
DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
sched->sched_rq[0] with the same "priority", as that index run-queue exists in
both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
it so.

In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
any scheduler created with any allowable number of run-queues (priorities), 0
to DRM_SCHED_PRIORITY_COUNT.

(cherry picked from commit 38f922a563aac3148ac73e73689805917f034cb5)

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231124052752.6915-6-ltuikov89@gmail.com
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  5 +++--
 drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
 include/drm/gpu_scheduler.h              |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1a25931607c5..71a5cf37b472 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index eb0c97433e5f..2bfcb222e353 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index dd2b8f777f51..3c4f5a392b06 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -82,13 +82,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
 		/* The "priority" of an entity cannot exceed the number of run-queues of a
-		 * scheduler. Protect against num_rqs being 0, by converting to signed.
+		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
+		 * the lowest priority available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_LOW);
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b6d7bc49ff6e..682aebe96db7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1051,8 +1051,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	/* Start with the highest priority.
+	 */
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1292,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1313,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
+	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,9 +1391,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_LOW;
-		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
-		     i++) {
+		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d8e2d84d9223..5acc64954a88 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,10 +63,10 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_LOW,
-	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
+	DRM_SCHED_PRIORITY_HIGH,
+	DRM_SCHED_PRIORITY_NORMAL,
+	DRM_SCHED_PRIORITY_LOW,
 
 	DRM_SCHED_PRIORITY_COUNT
 };
-- 
2.43.0

