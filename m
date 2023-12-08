Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7853CC10F09
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46D10EB32;
	Fri,  8 Dec 2023 20:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AFB10EB2F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067282; x=1733603282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BIYIiWE4jDpBWlT2T5XIh1k3dUrYHsfv18fg4D4pkBY=;
 b=SFEadZtAERaNzkSB+Y6p7GPZxFhTam1rHjyWIO5Q7KPc1/b+//oO5tEk
 9F4QHphIxsPmjwHf4UDEorNbqQx4xA9GMvhj6pbSmTirJBtCKtkDaVfVY
 WDJYHjAYhAT06tnT+XkOPMLqA/QEAZX3EeHHHQ0pDuacQ+y1UFGwqFFnV
 a6lExeUQCU6R0Nied7Opz8FkgXUMuPot2NAJn+Yf8aTAsjtBSNdRzMiRZ
 X+jPlmc2v1KIe8EjWL58dpGk7yOPTD2r2g1ckLuiab0t/CDWZVqjwoqXM
 8ZtzkEzjwBZV5EC0R6eiBvCfxIVWsKIA8LKcAUQTkae6bSc2b8RETPXm5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="398324713"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="398324713"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="895657396"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="895657396"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ2i8FxIrwqQrX6atlfP+Dzij7BBa+5I73IM8Iq2GPmPK+GPsGe7Sg4t3ta/KLpVjoYbqYphAidZunKD4pTO7OK0euaIteRZEqVBfCzgU96rIdsgHS0q5+FyOj9LmLPm4I919IjYxLPWV0iWJt12XSlhfv+JICvrcVXOtpaymWYvFn6WUcjCGHQe7yK0UJYafjXf5jcTKjc14POUwetve2YOlWuFZ2cQT/3rhylQPZFnOesQ9Ghe8P4drOYMzkawDZ2oyfMJve6XdbmMQZJL1YnGjdZM54JQcbUV9ofncZIj0n59uVsMn3ulLy6GKLqkDAMhRdq+UaDxzdobrDlxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nJydOsk4uCm3jYy0MwnhUAxN38pBdQypiZXWokQlpU=;
 b=YreQcAKU6ZTWslX3+t1NZOseabm5ubf6xai3E6AxjjMFfPeMCphZN+W1sct3BF/O2Rvjprl3zQ0LvovA9eQBDq88XYByFH0nUGJqzG++Kj8HSlU/5d8Dy4zJBVeiUgHHo53I0gr+vqU7UanbMwWHEAppVLDl1CfdFLstS9KpN7++I42vW1QugK8UNGAJnDA1Y5084EycwszyvOk7zkVlVWtl/fNmQCUqAT2NHCGOv6mUdTnwPKuyQb4OCmrDf0ntr46S3Ne/j/V4jascztipjPXyZwczvwsuHiALq/dv6HOQhZmyUviPeJjbk4IvFfmjtwdxirZoHEJBvWZQq1liJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:27:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 08/13] drm/sched: implement dynamic job-flow control
Date: Fri, 8 Dec 2023 15:27:18 -0500
Message-ID: <20231208202723.918082-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 6355269b-8224-40a0-bdb2-08dbf82c25fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ItIT3xJFRmEwjocoLAO5fMJglxJ0hk3w8rJYlYChJPzDUBm/JC/vMrMtmqIzVXk198Wk5CIkjPe1Cz+sXmqxwz5+dHs+w9NSuW9Au4FQ2ohMDSO4uC/ukqiDOaC1LnZKod/wVLdvddY2ZNpG0NRzfLiUNnsYt1554to70e8bDo+4ZF2oOEYqneFmX0mKnJVkGONhmwFwiwB3aaNJBkH/PivX5S3yWkAvXvALhmriuWlAYJZSOSC7MGJytl/jQJ9X0r+fqPC3Iu04ptOlfxkOo+Rhzqb4E4LtAoLuozynUu3S5Rn+8HQ+zqBL0Tex/5b6cZDXhE4gRiLVnrmPvoZ+nInNPTCs5pTYPVlV4vsViFFtSdPG+fddY3qCwHowBUtZPvf3UzCSYcD8WCfH1ofrgb4VjQzdpTT/pWI1s2oulRPD6wp/56Q3fZHBAHo2mmqVCNfHDTFy4zw/PukHEAiLhjU+/3EOfiO+MKWxMqkv+IW0Ry4+snz9BUhRrPb/2FeSw3W/w2aNKmM9hFEr+oSIbXvLxNZyjlo7w4VfbRj2OM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(30864003)(2906002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f01EV+fXz5axD5gxtwCVHdbKcG589KcoG+25mQFEBMANO628IiwjVcV7AMoo?=
 =?us-ascii?Q?ew/uJebskgIrZ27QBmnT4CtTy4gzm8RFIcfnnIiojpN4LMDVJQI3PjGMe7tF?=
 =?us-ascii?Q?JjNK27IjnRuwgAs5ZakCl7HrmNA3LxkzsF1gtd/0ggObsgz1A2DXdpZ2peZ1?=
 =?us-ascii?Q?90V0wgbz2cIfuDyPjkXdocw44a3aoQWZNb4HgpEHwYceG4in72Pnwl2s6VAB?=
 =?us-ascii?Q?NlyPKe8Qa4Xdn/dbLHHqyy85er3ViFmLwiMlZhZTQmDnefqkOKQxenCe1+Sh?=
 =?us-ascii?Q?imv3D61GpUPC3InaueLFXWEM0cDWUnd+596Ll13A2SlmpD0fq2IjAW4HU4hw?=
 =?us-ascii?Q?CUFJkFg9LzMb3wFfs8aXLeXL0yRDTCy6JZAUTS+my3wRazT8AB2+Xsfd6eQH?=
 =?us-ascii?Q?ylnj6SIvqiE1uL2OvpcmxCn5QkmB6I4KzBePlzu+OeD6wEMf+PAcuOyv7fcz?=
 =?us-ascii?Q?/GfeSZriEvm8rgE5Tnl1m87VTomoEgDV3HDk/AQEAbcKbL5bGqaZVnaA3263?=
 =?us-ascii?Q?wtD9UFDvvjPgcoJih5ZgXhlU9ebhxGb9gyrL2dHEZSaXDdP5ZFp/udMvUfdX?=
 =?us-ascii?Q?DlgDyyafnSV9e5gJuig2r6Pq1sfMyNuk9bDCo18MXUjcC2k+xuIu+xSoStU2?=
 =?us-ascii?Q?x/vWpBDrBUHqCG9xZVsG7VewYutN8JKoH7CcyC46vuyVeeiYxd3ShLpozMG9?=
 =?us-ascii?Q?Z/DrRzrc+kDaFYuiUOMIEKXv6cXsE9LlKmlLxRub5+udTBeZIJADSZ/OaUf2?=
 =?us-ascii?Q?yXaJjF9Y4BIV7ZsDrw/iQCyrLIvbvDki5Hl6RNhbLEiz9wnHRWHfaJ4dBEJA?=
 =?us-ascii?Q?Dt69ddvKBIZYin55pwi6HQaTsm/86axJuZnxeonaYX86fohmkL+xyshYPL49?=
 =?us-ascii?Q?cercJcuGhOnfq+Jda9kDbbHhQX5Dkkdnw4NIBoJWeGTajvAFjI7K9EbJFJJa?=
 =?us-ascii?Q?NMonyEuvcwdVWcZ+Ai9RsnWiT4GvfKjMWj3ap5Dv2vt7yq0ulLi+HpWpAoXH?=
 =?us-ascii?Q?bqcW19y64yFg8keQIniGRGTjnMD+Z5SSQa8ovVo+7secdh18JlOSw8JZc+5C?=
 =?us-ascii?Q?3cEjT781NCT2lW5Wo/U8kvHIwwJOTZ2VJCpNn3Kw5esT3722lk+K2xxNy32k?=
 =?us-ascii?Q?imY1N3Ml0DnKwoJsc8gDSxhgOOq5S9ZEl8XXX4d4vYvZnB/7ynLhmJbRVgWa?=
 =?us-ascii?Q?bRYLlyp/7Rb3xId5XiUcERKrrqO9bnRePBUU1kH3ya/LQFsUMqfj7dgO5Fbg?=
 =?us-ascii?Q?S5flaIEzLlFlz1osrv9rrgR5MLi/R6o1M4KWPVsPhJRfvidlE0UUeOUHfaG3?=
 =?us-ascii?Q?ibfnYlK3R1xUKO4O7zmZE7Ax0GN0KU84V55RHNx7zgOxnZGTQnWY0vdyqBkz?=
 =?us-ascii?Q?MNY8otdpAY5zwVLIL93YrzrBCuZRop1V+ipSsRwvfY/VfTtgJVfIT4ezGM0A?=
 =?us-ascii?Q?fegWsPv9t3mppVmg9KdqSeRolp/XvoEJwGZ4gLTbNS8t1bnZ7UcRahf/N+UU?=
 =?us-ascii?Q?kF7A8gaOQiLd15exhFXCSMGk6AtMGmg4IOP2oUVfi1FDiFTtd0g4gycv/Bri?=
 =?us-ascii?Q?UxuBvkdJE/dM31ku0u1idCbLTllI2ylmxmysece2HyIWCZFX1SPeIlPyEyxm?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6355269b-8224-40a0-bdb2-08dbf82c25fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:50.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud6IGSabMigQpgXMcygRBeDNl3Mt0ppvjP/RP6X8xUjdTqfBaE2ZivjDoBOjtsfXkKqi3HqzZVxendGqr7ov3w==
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

From: Danilo Krummrich <dakr@redhat.com>

Currently, job flow control is implemented simply by limiting the number
of jobs in flight. Therefore, a scheduler is initialized with a credit
limit that corresponds to the number of jobs which can be sent to the
hardware.

This implies that for each job, drivers need to account for the maximum
job size possible in order to not overflow the ring buffer.

However, there are drivers, such as Nouveau, where the job size has a
rather large range. For such drivers it can easily happen that job
submissions not even filling the ring by 1% can block subsequent
submissions, which, in the worst case, can lead to the ring run dry.

In order to overcome this issue, allow for tracking the actual job size
instead of the number of jobs. Therefore, add a field to track a job's
credit count, which represents the number of credits a job contributes
to the scheduler's credit limit.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231110001638.71750-1-dakr@redhat.com
(cherry picked from commit a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f)
---
 Documentation/gpu/drm-mm.rst                  |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |   2 +-
 drivers/gpu/drm/lima/lima_device.c            |   2 +-
 drivers/gpu/drm/lima/lima_sched.c             |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 170 ++++++++++++++----
 drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
 include/drm/gpu_scheduler.h                   |  28 ++-
 14 files changed, 175 insertions(+), 51 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 602010cb6894..acc5901ac840 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -552,6 +552,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
    :doc: Overview
 
+Flow Control
+------------
+
+.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
+   :doc: Flow Control
+
 Scheduler Function References
 -----------------------------
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1f357198533f..62bb7fc7448a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (!entity)
 		return 0;
 
-	return drm_sched_job_init(&(*job)->base, entity, owner);
+	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
 }
 
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 2416c526f9b0..3d0f8d182506 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&submit->sched_job,
 				 &ctx->sched_entity[args->pipe],
-				 submit->ctx);
+				 1, submit->ctx);
 	if (ret)
 		goto err_submit_put;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 9276756e1397..5105d290e72e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1917,7 +1917,7 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 	u32 idle, mask;
 
 	/* If there are any jobs in the HW queue, we're not idle */
-	if (atomic_read(&gpu->sched.hw_rq_count))
+	if (atomic_read(&gpu->sched.credit_count))
 		return -EBUSY;
 
 	/* Check whether the hardware (except FE and MC) is idle */
diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 02cef0cea657..0bf7105c8748 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -514,7 +514,7 @@ int lima_device_suspend(struct device *dev)
 
 	/* check any task running */
 	for (i = 0; i < lima_pipe_num; i++) {
-		if (atomic_read(&ldev->pipe[i].base.hw_rq_count))
+		if (atomic_read(&ldev->pipe[i].base.credit_count))
 			return -EBUSY;
 	}
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index aa030e1f7cda..c3bf8cda8498 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	for (i = 0; i < num_bos; i++)
 		drm_gem_object_get(&bos[i]->base.base);
 
-	err = drm_sched_job_init(&task->base, &context->base, vm);
+	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
 	if (err) {
 		kfree(task->bos);
 		return err;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 99744de6c05a..c002cabe7b9c 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
+	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
 	if (ret) {
 		kfree(submit->hw_fence);
 		kfree(submit);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index c4ba56b1a6dd..e03fd2bc8a11 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
 
 	}
 
-	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
+	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
 	if (ret)
 		goto err_free_chains;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a2ab99698ca8..d5e777deee5c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -272,7 +272,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 
 	ret = drm_sched_job_init(&job->base,
 				 &file_priv->sched_entity[slot],
-				 NULL);
+				 1, NULL);
 	if (ret)
 		goto out_put_job;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 58aa5e507069..f108c2b72ae7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -939,7 +939,7 @@ int panfrost_job_is_idle(struct panfrost_device *pfdev)
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		/* If there are any jobs in the HW queue, we're not idle */
-		if (atomic_read(&js->queue[i].sched.hw_rq_count))
+		if (atomic_read(&js->queue[i].sched.credit_count))
 			return false;
 	}
 
diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index 3143ecaaff86..f8ed093b7356 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
 			   __assign_str(name, sched_job->sched->name);
 			   __entry->job_count = spsc_queue_count(&entity->job_queue);
 			   __entry->hw_job_count = atomic_read(
-				   &sched_job->sched->hw_rq_count);
+				   &sched_job->sched->credit_count);
 			   ),
 	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
 		      __entry->entity, __entry->id,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8f5e466bd582..044a8c4875ba 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,6 +48,30 @@
  * through the jobs entity pointer.
  */
 
+/**
+ * DOC: Flow Control
+ *
+ * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
+ * in which the jobs fetched from scheduler entities are executed.
+ *
+ * In this context the &drm_gpu_scheduler keeps track of a driver specified
+ * credit limit representing the capacity of this scheduler and a credit count;
+ * every &drm_sched_job carries a driver specified number of credits.
+ *
+ * Once a job is executed (but not yet finished), the job's credits contribute
+ * to the scheduler's credit count until the job is finished. If by executing
+ * one more job the scheduler's credit count would exceed the scheduler's
+ * credit limit, the job won't be executed. Instead, the scheduler will wait
+ * until the credit count has decreased enough to not overflow its credit limit.
+ * This implies waiting for previously executed jobs.
+ *
+ * Optionally, drivers may register a callback (update_job_credits) provided by
+ * struct drm_sched_backend_ops to update the job's credits dynamically. The
+ * scheduler executes this callback every time the scheduler considers a job for
+ * execution and subsequently checks whether the job fits the scheduler's credit
+ * limit.
+ */
+
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -75,6 +99,51 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
+static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
+{
+	u32 credits;
+
+	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
+					      atomic_read(&sched->credit_count),
+					      &credits));
+
+	return credits;
+}
+
+/**
+ * drm_sched_can_queue -- Can we queue more to the hardware?
+ * @sched: scheduler instance
+ * @entity: the scheduler entity
+ *
+ * Return true if we can push at least one more job from @entity, false
+ * otherwise.
+ */
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
+				struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *s_job;
+
+	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+	if (!s_job)
+		return false;
+
+	if (sched->ops->update_job_credits) {
+		s_job->credits = sched->ops->update_job_credits(s_job);
+
+		drm_WARN(sched, !s_job->credits,
+			 "Jobs with zero credits bypass job-flow control.\n");
+	}
+
+	/* If a job exceeds the credit limit, truncate it to the credit limit
+	 * itself to guarantee forward progress.
+	 */
+	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
+		     "Jobs may not exceed the credit limit, truncate.\n"))
+		s_job->credits = sched->credit_limit;
+
+	return drm_sched_available_credits(sched) >= s_job->credits;
+}
+
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
 {
@@ -186,12 +255,18 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 /**
  * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
+ * @sched: the gpu scheduler
  * @rq: scheduler run queue to check.
  *
- * Try to find a ready entity, returns NULL if none found.
+ * Try to find the next ready entity.
+ *
+ * Return an entity if one is found; return an error-pointer (!NULL) if an
+ * entity was ready, but the scheduler had insufficient credits to accommodate
+ * its job; return NULL, if no ready entity was found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
+			      struct drm_sched_rq *rq)
 {
 	struct drm_sched_entity *entity;
 
@@ -201,6 +276,14 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	if (entity) {
 		list_for_each_entry_continue(entity, &rq->entities, list) {
 			if (drm_sched_entity_is_ready(entity)) {
+				/* If we can't queue yet, preserve the current
+				 * entity in terms of fairness.
+				 */
+				if (!drm_sched_can_queue(sched, entity)) {
+					spin_unlock(&rq->lock);
+					return ERR_PTR(-ENOSPC);
+				}
+
 				rq->current_entity = entity;
 				reinit_completion(&entity->entity_idle);
 				spin_unlock(&rq->lock);
@@ -210,8 +293,15 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	}
 
 	list_for_each_entry(entity, &rq->entities, list) {
-
 		if (drm_sched_entity_is_ready(entity)) {
+			/* If we can't queue yet, preserve the current entity in
+			 * terms of fairness.
+			 */
+			if (!drm_sched_can_queue(sched, entity)) {
+				spin_unlock(&rq->lock);
+				return ERR_PTR(-ENOSPC);
+			}
+
 			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			spin_unlock(&rq->lock);
@@ -230,12 +320,18 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 /**
  * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
  *
+ * @sched: the gpu scheduler
  * @rq: scheduler run queue to check.
  *
- * Find oldest waiting ready entity, returns NULL if none found.
+ * Find oldest waiting ready entity.
+ *
+ * Return an entity if one is found; return an error-pointer (!NULL) if an
+ * entity was ready, but the scheduler had insufficient credits to accommodate
+ * its job; return NULL, if no ready entity was found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
+				struct drm_sched_rq *rq)
 {
 	struct rb_node *rb;
 
@@ -245,6 +341,14 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
 		if (drm_sched_entity_is_ready(entity)) {
+			/* If we can't queue yet, preserve the current entity in
+			 * terms of fairness.
+			 */
+			if (!drm_sched_can_queue(sched, entity)) {
+				spin_unlock(&rq->lock);
+				return ERR_PTR(-ENOSPC);
+			}
+
 			rq->current_entity = entity;
 			reinit_completion(&entity->entity_idle);
 			break;
@@ -302,7 +406,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	struct drm_sched_fence *s_fence = s_job->s_fence;
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
-	atomic_dec(&sched->hw_rq_count);
+	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
 
 	trace_drm_sched_process_job(s_fence);
@@ -525,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 					      &s_job->cb)) {
 			dma_fence_put(s_job->s_fence->parent);
 			s_job->s_fence->parent = NULL;
-			atomic_dec(&sched->hw_rq_count);
+			atomic_sub(s_job->credits, &sched->credit_count);
 		} else {
 			/*
 			 * remove job from pending_list.
@@ -586,7 +690,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
 		struct dma_fence *fence = s_job->s_fence->parent;
 
-		atomic_inc(&sched->hw_rq_count);
+		atomic_add(s_job->credits, &sched->credit_count);
 
 		if (!full_recovery)
 			continue;
@@ -667,6 +771,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  * drm_sched_job_init - init a scheduler job
  * @job: scheduler job to init
  * @entity: scheduler entity to use
+ * @credits: the number of credits this job contributes to the schedulers
+ * credit limit
  * @owner: job owner for debugging
  *
  * Refer to drm_sched_entity_push_job() documentation
@@ -684,7 +790,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
  */
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       void *owner)
+		       u32 credits, void *owner)
 {
 	if (!entity->rq) {
 		/* This will most likely be followed by missing frames
@@ -695,7 +801,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -ENOENT;
 	}
 
+	if (unlikely(!credits)) {
+		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
+		return -EINVAL;
+	}
+
 	job->entity = entity;
+	job->credits = credits;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
 	if (!job->s_fence)
 		return -ENOMEM;
@@ -907,21 +1019,10 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- *
- * Return true if we can push more jobs to the hw, otherwise false.
- */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
-{
-	return atomic_read(&sched->hw_rq_count) <
-		sched->hw_submission_limit;
-}
-
 /**
  * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
  * @sched: scheduler instance
+ * @entity: the scheduler entity
  *
  * Wake up the scheduler if we can queue jobs.
  */
@@ -929,7 +1030,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
 	if (drm_sched_entity_is_ready(entity))
-		if (drm_sched_can_queue(sched))
+		if (drm_sched_can_queue(sched, entity))
 			drm_sched_run_job_queue(sched);
 }
 
@@ -938,7 +1039,11 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
  *
  * @sched: scheduler instance
  *
- * Returns the entity to process or NULL if none are found.
+ * Return an entity to process or NULL if none are found.
+ *
+ * Note, that we break out of the for-loop when "entity" is non-null, which can
+ * also be an error-pointer--this assures we don't process lower priority
+ * run-queues. See comments in the respectively called functions.
  */
 static struct drm_sched_entity *
 drm_sched_select_entity(struct drm_gpu_scheduler *sched)
@@ -946,19 +1051,16 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	if (!drm_sched_can_queue(sched))
-		return NULL;
-
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
 
-	return entity;
+	return IS_ERR(entity) ? NULL : entity;
 }
 
 /**
@@ -1094,7 +1196,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	s_fence = sched_job->s_fence;
 
-	atomic_inc(&sched->hw_rq_count);
+	atomic_add(sched_job->credits, &sched->credit_count);
 	drm_sched_job_begin(sched_job);
 
 	trace_drm_run_job(sched_job, entity);
@@ -1129,7 +1231,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
  *	       allocated and used
  * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
- * @hw_submission: number of hw submissions that can be in flight
+ * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
  * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
@@ -1143,14 +1245,14 @@ static void drm_sched_run_job_work(struct work_struct *w)
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
+		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
 	int i, ret;
 
 	sched->ops = ops;
-	sched->hw_submission_limit = hw_submission;
+	sched->credit_limit = credit_limit;
 	sched->name = name;
 	sched->timeout = timeout;
 	sched->timeout_wq = timeout_wq ? : system_wq;
@@ -1199,7 +1301,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
-	atomic_set(&sched->hw_rq_count, 0);
+	atomic_set(&sched->credit_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
 	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
 	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 2e94ce788c71..8479e5302f7b 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	job->free = free;
 
 	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
-				 v3d_priv);
+				 1, v3d_priv);
 	if (ret)
 		goto fail;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index b838a3e53040..9a50348bd5c0 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -320,6 +320,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * @sched: the scheduler instance on which this job is scheduled.
  * @s_fence: contains the fences for the scheduling of job.
  * @finish_cb: the callback for the finished fence.
+ * @credits: the number of credits this job contributes to the scheduler
  * @work: Helper to reschdeule job kill to different context.
  * @id: a unique id assigned to each job scheduled on the scheduler.
  * @karma: increment on every hang caused by this job. If this exceeds the hang
@@ -339,6 +340,8 @@ struct drm_sched_job {
 	struct drm_gpu_scheduler	*sched;
 	struct drm_sched_fence		*s_fence;
 
+	u32				credits;
+
 	/*
 	 * work is used only after finish_cb has been used and will not be
 	 * accessed anymore.
@@ -462,13 +465,27 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
+
+	/**
+	 * @update_job_credits: Called when the scheduler is considering this
+	 * job for execution.
+	 *
+	 * This callback returns the number of credits the job would take if
+	 * pushed to the hardware. Drivers may use this to dynamically update
+	 * the job's credit count. For instance, deduct the number of credits
+	 * for already signalled native fences.
+	 *
+	 * This callback is optional.
+	 */
+	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
 };
 
 /**
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
- * @hw_submission_limit: the max size of the hardware queue.
+ * @credit_limit: the credit limit of this scheduler
+ * @credit_count: the current credit count of this scheduler
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
@@ -477,7 +494,6 @@ struct drm_sched_backend_ops {
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
- * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
  * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
@@ -501,13 +517,13 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
-	uint32_t			hw_submission_limit;
+	u32				credit_limit;
+	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
-	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
@@ -529,14 +545,14 @@ struct drm_gpu_scheduler {
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, uint32_t hw_submission, unsigned int hang_limit,
+		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
-		       void *owner);
+		       u32 credits, void *owner);
 void drm_sched_job_arm(struct drm_sched_job *job);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence);
-- 
2.43.0

