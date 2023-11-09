Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F808C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D71510E8C5;
	Thu,  9 Nov 2023 14:55:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CD610E8C5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541698; x=1731077698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ifcJIHNulHcEGHiTPLAL+OY25IUZ24Ls+EfcA1JvAQk=;
 b=j6f25jU1Z3q6eQQlYvaQdELsxRIEFIEpT4CQmFNF2GX56dpqDuLrRk06
 vebd6NshyAs+7AdgRJIKhGBuom3MWAzFCOnFi4PM3YEQrZXe9VThJk17X
 i4AUyUDFBh+GPX3IQtvZhn1W63aP8UMM2Jupsesbi54smu6OzaJuyCqud
 KPsJdo+O0MuzxPf4ihXDMeWZ6txivssbOCQw2BzGHb/j/9dV2DLJqLb66
 NohTwd3kUmCb5rg4a5TnjXCmeyOfgIo1gYJwb3y/IzE+444XptX0OQkvm
 yIzimrMOMEak48wRKpvXyYnrE3ZLT/rU14qW3e+NR0lcB8o3BsWN5dc32 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389801454"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="389801454"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739866767"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="739866767"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2mR4Q38HaUoEhYu83b881Dg5psHzz4ATQHvjfUL0BGpTEjdechKMYNkRk1lk4EkGOtbOMVH7JFDYwS7SDU5vobg9eMv4D6Ub3Ui/6WBu1fJ+HtAYm55qATrIHDWJaD+EiRy64jYqEyMAgTxSbBqwjtgO4MWOa2830Up96bOMGqUSTyrlhT3HXiyNpTOoofDm1O16wfQfK817fM3MmuGDSFzN9sWIasX1KNVQwglVHEIx0jS8Bn9frLtJ/3I1/xPXQou9jRIzHrKPJRtNPAh8boPbajU+X9bWVVlSoNMZ69BJdeHr6fA16NUbbTXc6LFOnBNps5DRuC1vyqBve1JsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Dupn3ndmFZJsmFqigE33brwmu2KXu+TxwK7KUDTE2w=;
 b=Vf14ck+EaupqJUQpcVrpSomgqwPnoETBl0daZlI002tUhYQ3YHsxS+K7fz+FLWO7Hh54czOLRMBfGHGgY4HMo8A9pEaJMVZcP62vq6fJfpo0vAHDUl7xBL+Sa/TvnhuUkXM2Zx98feBcMHf9nDgfZHhbFcTU6cFnEk3j6q6KqNfCHw0bq+xZTVBmF+u9FdLkpppRLv4a9I873LAKEMjLE4sSwZihXuYq9qPOb7G+eeUxZX5jo9R7g4MGfwK9gTisQZtbTMC12jNC8zX5svk5Y636XAt65Olkn4FkRE0Vt5P1++zjk/ScQgxsONAzZtIhzsBQgTLGfdNSG7QD3odjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:32 -0500
Message-ID: <20231109145347.345120-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ccb5e5-bf43-4ea3-eedb-08dbe133d0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nm51BPFKJEIdjait9iP7miRpUaCZ2wbBp/XS0HowO7kiNbR2mBv+8dLcsVsJxAZKqu+csE2YHVUdvyhZlBJQgrXjBL3cyOPiUIUehrKD8UG8aM91B1BVJXW1LeesLv8GgXNuBWVi+inUuR07PefdrhJvNiVexdAHx1hVqdY9ITEZ+8x4aZ1uZzTIGLb92Mo2OSZvf1EfsKi61ZCGf0FlxK35oq2PUSr2Taf5ewPh1AdyJPMzWpV18NRDfgY0gC3lE/VfG1TBgUckq6CT2Glv8GExU7MecO2M4VzlbtCib9bZDTXrbl2LQA5Ue2Q5YuOTtNaEsfoVcNUfLP3+FpGZCkchd7/qddFBlGzIf97Wa3Kl8fKz74AKE+HvUrEaeyswLM1cvEIvDFaNHhiXqgD9xbQNxB34zYIT2f2JvRlnZaIcowRrrhSoFltFhbIE13wLVepEts69LwahcY39JLdnlTDPPWQW4Pq5D0IkH+CkqZdICL7JGaLm1Ox9j+QzGbP7LYCOkTTRioVvgpwgm3w7iwduguoxILmzZYk+OZcCG2uTtX/r9YTnw6/BPEbRGD07467hKtlonr+WpDMfHVcbghtFemxQcvZKsTswysrWJ3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(966005)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(1076003)(30864003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Hm/Y0do259F+heazUGwO0XdxoZdJ8YsJLeE4PZcjZIVar87oHQ7dM6sYvAV?=
 =?us-ascii?Q?OxoL1h1diPj4Hyd3wmxCjM9YzQMNGBm2qg7fd70WvJYItMZavkg4gwceNFwf?=
 =?us-ascii?Q?rqfYrNq5+/M6XDm5Ekl+qQdZVZHTHhu3J5DqH0vQIK7NLHxb7OEqQ2CDU04n?=
 =?us-ascii?Q?INS9xa/xHIWnIE+xZbx5hbGqXOCY9ORzQ5+YcLrPvQVusOi6UzAOvzH8MJ++?=
 =?us-ascii?Q?TOi0Up022gHfo/UwI5h/Jnaz9xDh+mzq3jD8WIu5UkUveO8maRCnzFQlokUt?=
 =?us-ascii?Q?SXgJo3A3KhoP4bZ+oBRqVjEGVHSnSFxo5l1Ko4DH4MFVWdqOMAzLdyE+/SVE?=
 =?us-ascii?Q?kkp7jk4+vwqQNFEIVrPOJVb6rdqhYEMbJ16a1sfDf6KIr0nzrRGX3SESF7Mm?=
 =?us-ascii?Q?OznNtoSBnYmpzQ7fGF4zGUcduaxITZOR9/E0F2wfQdcWLMkEt7DR87EBlXPc?=
 =?us-ascii?Q?cq8LePkzcf+ZHumrO8uKt54McnL79ibrXCEXkewKyyMVY2PPSaILnLU49NMg?=
 =?us-ascii?Q?B1eRxnxq/1qZsP62jMe6+gvI7QBfAK9cEGw7NIYUGH1D/GX+o6JqYkAWKkgX?=
 =?us-ascii?Q?bP90I6k7UxDhF7DIdAG/XATIerajHW2wtsDTVFpZkawTM0eOpVY3IpYjaYuq?=
 =?us-ascii?Q?KsiS2u1Aza2jTD+A+knod7Pdeg71J6nKgA8ZTHE2rxzJS83r7jgS9YSdYvfI?=
 =?us-ascii?Q?ybj9/e3Ne8to8PF05+SEN0ujc9iitiN9cUQZ9alTxxAlYcDpf55k2V1/7Gm3?=
 =?us-ascii?Q?Yoa0Zd149jM+I5HDzWo7hIC1Vfw+vCzZ/h1C/Pb4D3ppeHxgUeOVsgkVrMF4?=
 =?us-ascii?Q?06tqeX/ZB/9nnfl8El1bwsU2nH5Gn7bfdhsoloLQyU19LqSE2g3o88QJOzQs?=
 =?us-ascii?Q?HuUHnfd2dI8/d3J917qs9vvr37zQc2/jL1P8hI05JhAPzMfXzLjUZLEKdc78?=
 =?us-ascii?Q?7PrgfV17UgwfrcIK93aE/QIEV9CZnMjwbmr5hmlOHZ3Zt5qe6SB1U1S28Un5?=
 =?us-ascii?Q?fqXDiwT36tgaoyuk2NE40txoZHPtoNwz8p7SWSBFdvApm/hH2u1jVRfZhOH9?=
 =?us-ascii?Q?vIvyI+H54PQbmUsJBY1Kwu9cegHXgvmbczsHLj4ljZEvDnNHSgqZ1gL1OoGi?=
 =?us-ascii?Q?CE/kqOOnFZcDlBnWfUj67JNCCFH00ImTG0S38P2e9yyenB+s++mjKr5XxoVO?=
 =?us-ascii?Q?5OntpTXkczQVBr5WgH0urudKlqXtc5VHIgb6tOrYbiZg3sMBz8DMJAEMItEo?=
 =?us-ascii?Q?Y8Wia8RKAbklf9Whd+Fu2NNQH2GR/eyEgbcTMaJRLdbOtgbbtjPvw4I/jtBy?=
 =?us-ascii?Q?DSP/o7yX2/lTr4Hz/0V7+so0nX4R9k2b9bKyLnB9Lz9APpCMYC10cJdXX55r?=
 =?us-ascii?Q?xjW5WHaselpkFdcW+BBRLl77SyMgTBJRPXT16g2Q8N2iQ2/ULTql9WiUCJFd?=
 =?us-ascii?Q?TLlBMKuqsE+kGIwqlllq2AB1kaAZBYZL0JLS10OLhLW9sdaT9F/w5OymYFq5?=
 =?us-ascii?Q?fc0gNWxF9gYE/HoDKhkBuJlCyjET6p087z2I94kgy9RP6tJ4yQmJV5GCCU/j?=
 =?us-ascii?Q?xS9VG0mv8hK5rD3ZWf8x+lOcKbg74qCASK9XvE/Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ccb5e5-bf43-4ea3-eedb-08dbe133d0dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:47.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/+KZB6fe+is/glAFKgm6y284w52MTniepM2/YZx/b/HSLSUJhrI+VuytFk0xRzgqOqg43Q1Acb4cXVtH+IPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 14/20] drm/sched: Convert drm scheduler to use a
 work queue rather than kthread
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

In Xe, the new Intel GPU driver, a choice has made to have a 1 to 1
mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
seems a bit odd but let us explain the reasoning below.

1. In Xe the submission order from multiple drm_sched_entity is not
guaranteed to be the same completion even if targeting the same hardware
engine. This is because in Xe we have a firmware scheduler, the GuC,
which allowed to reorder, timeslice, and preempt submissions. If a using
shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
apart as the TDR expects submission order == completion order. Using a
dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.

2. In Xe submissions are done via programming a ring buffer (circular
buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
control on the ring for free.

A problem with this design is currently a drm_gpu_scheduler uses a
kthread for submission / job cleanup. This doesn't scale if a large
number of drm_gpu_scheduler are used. To work around the scaling issue,
use a worker rather than kthread for submission / job cleanup.

v2:
  - (Rob Clark) Fix msm build
  - Pass in run work queue
v3:
  - (Boris) don't have loop in worker
v4:
  - (Tvrtko) break out submit ready, stop, start helpers into own patch
v5:
  - (Boris) default to ordered work queue
v6:
  - (Luben / checkpatch) fix alignment in msm_ringbuffer.c
  - (Luben) s/drm_sched_submit_queue/drm_sched_wqueue_enqueue
  - (Luben) Update comment for drm_sched_wqueue_enqueue
  - (Luben) Positive check for submit_wq in drm_sched_init
  - (Luben) s/alloc_submit_wq/own_submit_wq
v7:
  - (Luben) s/drm_sched_wqueue_enqueue/drm_sched_run_job_queue
v8:
  - (Luben) Adjust var names / comments

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Link: https://lore.kernel.org/r/20231031032439.1558703-3-matthew.brost@intel.com
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit a6149f0393699308fb00149be913044977bceb56)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
 drivers/gpu/drm/lima/lima_sched.c          |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 131 +++++++++++----------
 drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
 include/drm/gpu_scheduler.h                |  14 ++-
 9 files changed, 86 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2625dd86cdee..3933b11ecfac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
 				   DRM_SCHED_PRIORITY_COUNT,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 9b79f218e21a..c4b04b0dee16 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 295f0353a02e..aa030e1f7cda 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops,
+	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
 			      DRM_SCHED_PRIORITY_COUNT,
 			      1,
 			      lima_job_hang_limit,
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 95257ab0185d..4968568e3b54 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 7c376c4ccdcf..c4ba56b1a6dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -435,7 +435,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 	if (!drm->sched_wq)
 		return -ENOMEM;
 
-	return drm_sched_init(sched, &nouveau_sched_ops,
+	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
 			      DRM_SCHED_PRIORITY_COUNT,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 68a5556dcd92..58aa5e507069 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops,
+				     &panfrost_sched_ops, NULL,
 				     DRM_SCHED_PRIORITY_COUNT,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 54c1c5fe01ba..d1ae05bded15 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,7 +48,6 @@
  * through the jobs entity pointer.
  */
 
-#include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
 }
 
+/**
+ * drm_sched_run_job_queue - enqueue run-job work
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_run_job);
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -275,7 +284,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	wake_up_interruptible(&sched->wake_up_worker);
+	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -874,7 +883,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		wake_up_interruptible(&sched->wake_up_worker);
+		drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -985,60 +994,41 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_blocked - check if the scheduler is blocked
+ * drm_sched_run_job_work - main scheduler thread
  *
- * @sched: scheduler instance
- *
- * Returns true if blocked, otherwise false.
+ * @w: run job work
  */
-static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_work(struct work_struct *w)
 {
-	if (kthread_should_park()) {
-		kthread_parkme();
-		return true;
-	}
-
-	return false;
-}
-
-/**
- * drm_sched_main - main scheduler thread
- *
- * @param: scheduler instance
- *
- * Returns 0.
- */
-static int drm_sched_main(void *param)
-{
-	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	struct drm_sched_entity *entity;
+	struct drm_sched_job *cleanup_job;
 	int r;
 
-	sched_set_fifo_low(current);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-	while (!kthread_should_stop()) {
-		struct drm_sched_entity *entity = NULL;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job = NULL;
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	entity = drm_sched_select_entity(sched);
 
-		wait_event_interruptible(sched->wake_up_worker,
-					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
-					 (!drm_sched_blocked(sched) &&
-					  (entity = drm_sched_select_entity(sched))) ||
-					 kthread_should_stop());
+	if (!entity && !cleanup_job)
+		return;	/* No more work */
 
-		if (cleanup_job)
-			sched->ops->free_job(cleanup_job);
+	if (cleanup_job)
+		sched->ops->free_job(cleanup_job);
 
-		if (!entity)
-			continue;
+	if (entity) {
+		struct dma_fence *fence;
+		struct drm_sched_fence *s_fence;
+		struct drm_sched_job *sched_job;
 
 		sched_job = drm_sched_entity_pop_job(entity);
-
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			continue;
+			if (!cleanup_job)
+				return;	/* No more work */
+			goto again;
 		}
 
 		s_fence = sched_job->s_fence;
@@ -1069,7 +1059,9 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
-	return 0;
+
+again:
+	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1077,6 +1069,8 @@ static int drm_sched_main(void *param)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
+ * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
+ *	       allocated and used
  * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
@@ -1091,6 +1085,7 @@ static int drm_sched_main(void *param)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *submit_wq,
 		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
@@ -1121,14 +1116,22 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return 0;
 	}
 
+	if (submit_wq) {
+		sched->submit_wq = submit_wq;
+		sched->own_submit_wq = false;
+	} else {
+		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		if (!sched->submit_wq)
+			return -ENOMEM;
+
+		sched->own_submit_wq = true;
+	}
+	ret = -ENOMEM;
 	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
 					GFP_KERNEL | __GFP_ZERO);
-	if (!sched->sched_rq) {
-		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
-		return -ENOMEM;
-	}
+	if (!sched->sched_rq)
+		goto Out_free;
 	sched->num_rqs = num_rqs;
-	ret = -ENOMEM;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
@@ -1136,31 +1139,26 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		drm_sched_rq_init(sched, sched->sched_rq[i]);
 	}
 
-	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
+	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
-
-	/* Each scheduler will run on a seperate kernel thread */
-	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
-	if (IS_ERR(sched->thread)) {
-		ret = PTR_ERR(sched->thread);
-		sched->thread = NULL;
-		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
-		goto Out_unroll;
-	}
+	sched->pause_submit = false;
 
 	sched->ready = true;
 	return 0;
 Out_unroll:
 	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
 		kfree(sched->sched_rq[i]);
+Out_free:
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+	if (sched->own_submit_wq)
+		destroy_workqueue(sched->submit_wq);
 	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
 	return ret;
 }
@@ -1178,8 +1176,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	if (sched->thread)
-		kthread_stop(sched->thread);
+	drm_sched_wqueue_stop(sched);
 
 	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
@@ -1202,6 +1199,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	if (sched->own_submit_wq)
+		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
@@ -1262,7 +1261,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
  */
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
 {
-	return !!sched->thread;
+	return sched->ready;
 }
 EXPORT_SYMBOL(drm_sched_wqueue_ready);
 
@@ -1273,7 +1272,8 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
  */
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 {
-	kthread_park(sched->thread);
+	WRITE_ONCE(sched->pause_submit, true);
+	cancel_work_sync(&sched->work_run_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
@@ -1284,6 +1284,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
  */
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
-	kthread_unpark(sched->thread);
+	WRITE_ONCE(sched->pause_submit, false);
+	queue_work(sched->submit_wq, &sched->work_run_job);
 }
 EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 038e1ae589c7..0b6696b0d882 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops,
+			     &v3d_bin_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
@@ -397,7 +397,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		return ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops,
+			     &v3d_render_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
@@ -406,7 +406,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops,
+			     &v3d_tfu_sched_ops, NULL,
 			     DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
@@ -416,7 +416,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops,
+				     &v3d_csd_sched_ops, NULL,
 				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
@@ -425,7 +425,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops,
+				     &v3d_cache_clean_sched_ops, NULL,
 				     DRM_SCHED_PRIORITY_COUNT,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1d5a20af4a06..e0e7c4eb57d9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -474,17 +474,16 @@ struct drm_sched_backend_ops {
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
  *           as there's usually one run-queue per priority, but could be less.
  * @sched_rq: An allocated array of run-queues of size @num_rqs;
- * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
- *                  is ready to be scheduled.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
+ * @submit_wq: workqueue used to queue @work_run_job
  * @timeout_wq: workqueue used to queue @work_tdr
+ * @work_run_job: work which calls run_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
- * @thread: the kthread on which the scheduler which run.
  * @pending_list: the list of jobs which are currently in the job queue.
  * @job_list_lock: lock to protect the pending_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
@@ -493,6 +492,8 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @pause_submit: pause queuing of @work_run_job on @submit_wq
+ * @own_submit_wq: scheduler owns allocation of @submit_wq
  * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
@@ -504,13 +505,13 @@ struct drm_gpu_scheduler {
 	const char			*name;
 	u32                             num_rqs;
 	struct drm_sched_rq             **sched_rq;
-	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
+	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
+	struct work_struct		work_run_job;
 	struct delayed_work		work_tdr;
-	struct task_struct		*thread;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
@@ -518,11 +519,14 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	bool				pause_submit;
+	bool				own_submit_wq;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *submit_wq,
 		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
-- 
2.41.0

