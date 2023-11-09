Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BDC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9783F10E8C3;
	Thu,  9 Nov 2023 14:58:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690110E8C3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541930; x=1731077930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9bC4fQjTfRsXI+TaYFctrGpPqXpZiL/TW5jNFJ3auqI=;
 b=KwerkWpnYiZazFCieOBTYbM0WALOEuXdFQkqUYhFYYjy91Hj/M47QmPY
 efn5t5COWVegJPZEgr2qylMTiXRFGVZo4Frtx6GTGXkKfKvWaeaQLvVK9
 sqk4SY2ZHv2oM2eD1j6ofrMhj/C1mbOa/OoyGWNkTgDMcfKR4CaFS5wz9
 MLoQ8UpmyHJTVR//FX6/Dl8j/s+jLb4mOjoOkLm5S8zls9Kfx8qEz+YNc
 ayI3wDpSzpvLEI3H9GOQ7dgV3n9Kczh0wAG5sR0RvkzWusoZwk1jSXWNh
 NHi/IthWF+3mI0o8Mcxy2rtjj9DaNDNJejAaVBK9EtmYZpwEwxtnPpvHa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300172"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300172"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561370"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lae2nWn7Tit2IAGmw6xhqJ3VO/7vELYs1UWjJ8DPq3KwWZBlS7TZcf8/ar4wz+uWX52LSSWrUxsmx8lsxAro5s+yfkvTdIv/Be2eWt6q/UZmAje4Ohm8HZ5IDChIXqK+APYt69vDxh9ommkX7bPjgKAYcsbd3idneSsXYvgLK5VhVgEWpUJb/BR28A7J6LZ0wB+6+RssXoLio/NIJs9x+3RBKZfEb6wKyvvdJr/jaxx83M9O2SUze8XM51vW3a/unx0A5EQn3iLHf76UH1pvwcgOWQVnAKYGzKbhtbs8ckks7kV9Q91Qwnv453zX4LhYdZdHgtwxSoqsUTZe7YMu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw6QJTDYfbTPiIckQSE2BIe2re1vQeTeMnXZ36JgPxQ=;
 b=bE+3QJ8DkB1bbtMA8Qsg4zzyGr97ub3trpP7rWnbx494k7O27hVb3iSQc6C4WblOYnFcbTbljG1tUFS15pM0olY8e7/0RcXX56xzWOzV2wYz6/nGsqDxD3uGcvMNh2vfUx4y+Sdqid2zVBU6BFzXYho1PiYztL3CUEzkLlCed+ruT6K+Tsx0difunqvUo/VgN2z+OmvaXlWUq0TZGnRvexbcz2kgfuj0g8XsGbv8UbGDBo8FLtbIzUEZqWNiAhHMl3p6WEkmxrRGpJxWD8uxfvqw5NQ+AGI3T5ibNDaqb6X/bTElmR6upZbg6rgFDLU8pEvibXV+Oyk3jZWUhHhmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:21 -0500
Message-ID: <20231109145347.345120-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:303:b9::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cad36f4-8c81-434a-7ab2-08dbe133b9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPNGx6tiECIFlj0ZbaD6OfeDzwfnOssRhSeRqlVwp2YVTA5z7n32j067kAkydXx2dCHewGQE8cMZ4f8y4LZj+s8UgswiUs9R7GTS/7Dd268huJLN5zwjJaihdPV9zp1GVMAvfR29e7dgg4V8OlhPDrJ6Ga6KFzxH9a3/ULrCuvgLs7t9tK/CVRMVHJxLgsVcebZ6uCYbu0nyP/EIk7Y352V9/qw9dw7wEjb2H9VozNI6LKo+hRD3N7RsGfCk0r6KXxt03ngo9K5JJQqvovdObP2XjD5/wgMYreldJ+OwEB4tT3IcdLfmLdyuZpymRs80MYGYGnoGW/pa8Hith8tj6MFmDMK0ue16dPC3FZHC+uK6upe0w/cOeqK33WCNVQgAyTsMa+1bYmDHvVQTvvdc9TnJXUyzSnkhcgaCejtJEdWWqD0qRd+LxXES5cunQLSgp275h0R9EUEKT7XfPAjfb+FU7iOwzjeDtSmhy69uLBNzlqBIePSB6LLSAiODl2af1qyyh+CfEChiN6IyiHihOjXnLW8GGNSoq9Fb3zfhMK0TIWyvX6f0U+SCr147VpkW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(30864003)(5660300002)(1076003)(6512007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87ewwv2FxQuWeagFE8Y1pFD13fdd85nR4OqwU1gUOI8gk2R2EpTFbqrsCwXB?=
 =?us-ascii?Q?8WbfK5PvAKB2e4tl/AMG7v/Wh1CfoR6XTvqXaYwLecY0nal1lAAUCVPyS82G?=
 =?us-ascii?Q?Biugj6IzylpfKoszhKIRITKVVUmi8O5mYmysZFCyrfkbGJXsApWAAqWAHh1w?=
 =?us-ascii?Q?EQLicMnha8EtedV/UdDzdLUNTF+pHylU+PJS4NLmckLVICtyVmdtpxSmX0gF?=
 =?us-ascii?Q?ZPglU3ceV+vT6gKIqJX9fhhmq5Tx/JK4vuQhEel3IPRU3d7UvYf9yfOxTWs9?=
 =?us-ascii?Q?89SoqTI/dt5Wyb4JXEuf+OYWXtzbeMmd3p8aIlA4Np3LxYWXoXHgeIwCx7GU?=
 =?us-ascii?Q?lYZF5m2vsdq4IZWoMOKYB4i5XVirb+dvNTigXP1dmnOjjN1apEG+Mhn0iEd9?=
 =?us-ascii?Q?YAWwYRGBaWlWff9baqeJxU5zN+21LgjCOCtThR02qHhjoOQMYGXOdLDXEbEt?=
 =?us-ascii?Q?N65EeDYBapihixO2NWoxPwrPfMhGloA/ZSwdlHiwlzGlWJQv4RIrC4XtSAUn?=
 =?us-ascii?Q?JCQxLbiJtfWlYQTykKgAzeLr+vuhjZ3qOT2N4yZWuydJ7ajkrFC2wo+9rXqI?=
 =?us-ascii?Q?Ivm+Qi06ggAbF2Opq0mnv50yHeDuwCAEKrEbSix1sO5BrC3Tz9uxgwR50NBl?=
 =?us-ascii?Q?RNp1Q+qTA1mPPWI+j7vdM4Y/RXAtMF3JSVOYVxlHRq7kVeMB4tyKnkaMYm/4?=
 =?us-ascii?Q?QrLtQGq4QcNma7xmkaQwmf00h9nj3KDOXrVOQ9BUyhwUulVun2ZCWlsZMmgU?=
 =?us-ascii?Q?tDigUJR0F94PU1C//MT07zjrJjibPVdglQmp94AvnTD7EOZkMn5LfIdnYv8w?=
 =?us-ascii?Q?ea6dyWlqoMUX0qxkgmygXZ75PslfzRkMld79apFl0VeWeOhm05rdEOiBhPdI?=
 =?us-ascii?Q?LbkDnh3sFXJR+tgxGhXar5rtNUresSP+r1/Pc0B8cjbaniU+4aFl+NP6D7dt?=
 =?us-ascii?Q?OEaO5k7fAA+puQICTfM7kv0Z7aGm7MAih2w/YOQDemyyUNxJ+PT9QI9vcmHl?=
 =?us-ascii?Q?odyfFZ3aScdvK1xAhAXYnBjytbiuVnSjUGpoqHkO3Ymb3IZzSigyzACve8mx?=
 =?us-ascii?Q?K1Ta2H4ZQMbRRYlZyH+MM+Doye78QxBZIx7aDLOkoDhmhcgheycoMmbyFdHs?=
 =?us-ascii?Q?p4nqRks8OmO0ZFzOT9W40NvbbYY/obH8ThLiWHrrvHvdah6Zz4KamjElFtEG?=
 =?us-ascii?Q?cAUjdBfIGJiBHOFuCVutv7c74mqb9nze9N68fkdlGADXwyiSkj9CcAs0A5JK?=
 =?us-ascii?Q?Yyr4jnKB48T1SNrtRMoV4lnKJdOqo2jRs+3R6fhSI82KMG4Ejqj3K+sGA6e6?=
 =?us-ascii?Q?QVQokHctZssIjOpdISE6FzHJPy2DWoVtBzIB1NUqMXuByAxzYzioMsEjfne3?=
 =?us-ascii?Q?cAe/40CTVQciEqBjo3ADuAKm8pCFNojuPWpCO9WULzU69g+JcwgpchoyXr0W?=
 =?us-ascii?Q?LvvmoZllT0HmFkt83y4uHW0mBV0OFzy6zhVKF99ZpmHmdqGISl1do5//Q9eb?=
 =?us-ascii?Q?HC6myAr0cDB16XA+msjCOresQ+Jm0AokEYQovJ071iC5n1wg34C5b2i4jxVw?=
 =?us-ascii?Q?Nd6XxWYxAFBQIlRrJP/xTrmMysoERliOexv8uIhA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cad36f4-8c81-434a-7ab2-08dbe133b9ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:08.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWEdaQGPa0AoCCzwiacSTsAm4hUc1Dn6QgTjOObrle1BTYwHLtCn0bkmnFBWUO6e2MC7xT0I2OmVR0vSVnuXRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 03/20] Revert "drm/sched: Move schedule policy to
 scheduler"
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

This reverts commit 394fe33ea259ba7b01dd7b24cc7e9ddf98551c56.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 +--
 drivers/gpu/drm/lima/lima_sched.c          |  3 +--
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 +--
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 +--
 drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++------------------
 drivers/gpu/drm/scheduler/sched_main.c     | 23 ++++++---------------
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++---------
 drivers/gpu/drm/xe/xe_execlist.c           |  1 -
 drivers/gpu/drm/xe/xe_guc_submit.c         |  3 +--
 include/drm/gpu_scheduler.h                | 20 ++++++------------
 12 files changed, 27 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 501a7f71bcb6..b64fd2a28f84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2283,7 +2283,6 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
-				   DRM_SCHED_POLICY_DEFAULT,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 3646f995ca94..618a804ddc34 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -137,8 +137,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
-			     gpu->dev);
+			     dev_name(gpu->dev), gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 465d4bf3882b..8d858aed0e56 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,8 +491,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
-			      pipe->ldev->dev);
+			      NULL, name, pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 813bff7f0c8f..1097f8e93d6b 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name,
-			     DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
+			     gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3cb0033dccf9..4c959dec42b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -437,8 +437,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 
 	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
-			      NULL, NULL, "nouveau_sched",
-			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
+			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
 
 void nouveau_sched_fini(struct nouveau_drm *drm)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ad36bf3a4699..326ca1ddf1d7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -835,8 +835,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
-				     pfdev->dev);
+				     NULL, "pan_js", pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 65a972b52eda..a42763e1429d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,20 +33,6 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-static bool bad_policies(struct drm_gpu_scheduler **sched_list,
-			 unsigned int num_sched_list)
-{
-	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
-	unsigned int i;
-
-	/* All schedule policies must match */
-	for (i = 1; i < num_sched_list; ++i)
-		if (sched_policy != sched_list[i]->sched_policy)
-			return true;
-
-	return false;
-}
-
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -76,8 +62,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
-	    bad_policies(sched_list, num_sched_list))
+	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -501,7 +486,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -573,8 +558,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first, fifo = entity->rq->sched->sched_policy ==
-		DRM_SCHED_POLICY_FIFO;
+	bool first;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
@@ -603,7 +587,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (fifo)
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
 		drm_sched_wakeup_if_can_queue(entity->rq->sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 38a00084edd0..856366d326e8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -66,14 +66,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -960,7 +960,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
+		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
@@ -1184,7 +1184,6 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
- * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
@@ -1194,15 +1193,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name,
-		   enum drm_sched_policy sched_policy,
-		   struct device *dev)
+		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i;
-
-	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
-		return -EINVAL;
-
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1212,10 +1205,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
-		sched->sched_policy = default_drm_sched_policy;
-	else
-		sched->sched_policy = sched_policy;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 5e3fe77fa991..38e092ea41e6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,8 +391,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     NULL, "v3d_bin", v3d->drm.dev);
 	if (ret)
 		return ret;
 
@@ -400,8 +399,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     NULL, "v3d_render", v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -409,8 +407,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     NULL, "v3d_tfu", v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -419,8 +416,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
-				     v3d->drm.dev);
+				     NULL, "v3d_csd", v3d->drm.dev);
 		if (ret)
 			goto fail;
 
@@ -428,8 +424,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean",
-				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
+				     NULL, "v3d_cache_clean", v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 73d4cfb54fcb..9451272b448c 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -337,7 +337,6 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
-			     DRM_SCHED_POLICY_DEFAULT,
 			     gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6a288bcf07f6..8ca364b5b1b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1166,8 +1166,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     q->name, DRM_SCHED_POLICY_DEFAULT,
-			     gt_to_xe(q->gt)->drm.dev);
+			     q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb47c8c96661..5de4ec663791 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -72,15 +72,11 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
-/* Used to chose default scheduling policy*/
-extern int default_drm_sched_policy;
-
-enum drm_sched_policy {
-	DRM_SCHED_POLICY_DEFAULT,
-	DRM_SCHED_POLICY_RR,
-	DRM_SCHED_POLICY_FIFO,
-	DRM_SCHED_POLICY_COUNT,
-};
+/* Used to chose between FIFO and RR jobs scheduling */
+extern int drm_sched_policy;
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -517,7 +513,6 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
- * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @pause_run_wq: pause queuing of @work_run on @run_wq
@@ -544,7 +539,6 @@ struct drm_gpu_scheduler {
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
-	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
 	bool				pause_run_wq;
@@ -556,9 +550,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name,
-		   enum drm_sched_policy sched_policy,
-		   struct device *dev);
+		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.41.0

