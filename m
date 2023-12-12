Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364EBC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0758B10E53B;
	Tue, 12 Dec 2023 00:11:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01D10E53B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339882; x=1733875882;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=h7+6wGrj52rwHr2SqZbnmxWBYs7RaHZTJoDK016FwzY=;
 b=OS5h7pwHv6y8EVpBiS3lV8MIqCwH7Q0CwtiQ2FPAE4Hs3ICKVjVklrYT
 ExYwIkUwRhxGA4s+xqBMmNfP+FU3uLdsLtLsR55il09hIHILm0k/aVAbv
 rDmjGcpYoAsC5zYEr6MvUNglj65YnUE0E2eiA+cioBthqnKK2QTbr978M
 l6Mnz69Y9SdvSr5ktTArjaIDhV6u27f6wIGum2lUJy8Mz4tT5I0U3s3/U
 F50EIOVHYd8u5oCpYMAYihdUEthYEj8r3bUu0ULcpZcHSB7Gctb8/8H6d
 xsURxGwYPwSUxex/c5/Yl0Y0FMcZvoTaarCGffsPacfktuD6ZdDDbG0E8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8092312"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8092312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="723012847"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="723012847"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:20 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azDRB9ekMEQFVh7Lz4eR9XKAIZa3Leh7PMhRboWosuQ6qOke10PBwwmtB6DO6pb591dW+ZwZMT1QGadb8woXdGJZyaoNrfBy6IlkiUVLTbL57ZkiAxYiH3AYHSM3qSuAwW6kXqNrPnT8nB2YvSXi6a+UHbnc6yz/1xfKeYsM48Gadx8uJol90W5ra2YY7Fhonkzo4BGJFT9bF5geGuQ7XTcppV0o3GRn2D4uOH5yY0SnYba1F+qSldYmKL4/a11ikfoPGFYs6vAPegaKWYDAFgZSotRX3SL5bO1DcclWBAs3ELOUZNXQqGc1JBiZGQxVzrgaK5dpQzoY9eKn9ZiOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTNxxB1slgguJ49GMNHJBtUUVQuTod41hHBb00nMT8w=;
 b=aq2pA7wTtQc11PnJq3lDmEqz8cH+AQGOEhRE6ZhU3zMBGSjR9D9yBVWHcgnaTfulFFqBIhB8DmYNN4Zg0UjhNjcfrHrKryflnMdnvKYlBtA6/PxhWdjDsgKgdxeg3YOmS7ENsoh3fmrP1Jureb1gA6Kb0QJk9SwFtYT86Vv51lHuUJKGgnlQe3dKPpYBcSUeFILx3+d5rET7+gCiwBkVZUDYb4Gc3gaBDKIIVKuhLZDz8yk8/muVko3osl0yVdG+QnMgsoMSRKwjtJNlu+K50z+CyiJddswXwWV0Gp27kH7y6pzrTzr4tTzaBsB+DalWxk0JeAoLDamlffm+RgQ0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:11:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 10/13] drm/sched: Rename priority MIN to LOW
Date: Mon, 11 Dec 2023 19:10:42 -0500
Message-ID: <20231212001045.1099517-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 22db2b84-fd51-46aa-c74f-08dbfaa6dcfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ushkwzGMkP17oqbjEcG2nKggdAU4eDiXejNcUv5Ci7QG6nph/RrDPOT77OPc+C+obhTBg9iPaMPpH5BbfbjDk5hgI8zfXppv9MOBKXmARF43I3dgGnCbm4KeyvFrRec/bBIbHQBG8FcR/OHe64FQg7+sIwRyuMpMf1Umij1w6vgOQk+h7BjL3rHFRiuu2dib0FTZLpFlJ8mYb06+7vtf9+kL5AUeOtvLWmBsNSzCSjUOTI1ywmXloSw0KeTt3Qmdx5RCVN8wbg8qXoyeUg8QM/S3onLW8+CS/5b2Y03Ts4h+JzpY7NfiNamwVRSclXGXT4htxlr5Ox3dOwemtc1VWeR0BGU9kqncZUEWQ6M9S7MER6ZRdwWWnMd0XoT17/ACX45Mzi2KvhtcPQGccuqhaqFJoPlhqKZMldxnHnxOwfwuPXzTStxyqy6XKBpeUOy8UdLSU6aLqzhD/xsngpp+Grve+4yoP/Y8xM6+sxOnIXSviuwZ97x0xyvHrTkab68Cybhz0HamENY2qi473NT/XKRvnJJih1TpmrlfB+uvyoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(66574015)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2V0N3UrNElZVnp1NzVzT1o5Y1o4cEhpRVJyaFlhdUdWYWp2anlyWG9NWldx?=
 =?utf-8?B?MGZCSnB4SzQ4dUJZNUFmTFNDQnkvQWJYSnZJVkF1ajQ5TG1jZzVCNE5nWlBW?=
 =?utf-8?B?ZmZyV2lOWnMzcnlEZzdMWmYxa1RmQzl0b0NDRFArVGdCb1pva0w2VFVsL3VC?=
 =?utf-8?B?SmR2SlFqUWZxTzM4LzNGbWFoQ1VxRkUvVWdGQlFNRE9yZnZvSkpkeG5wRTRt?=
 =?utf-8?B?TVE1dnFHTUJadE1hbWRLYnVLc2pnNklmRkp3S2t5Q3dSc2VmL1NrbWxFSHdJ?=
 =?utf-8?B?N1RFNDc2VG5ISklOejdLMFpGSDdiRWc4Qmkyc0hwK0xielh5c091T2FkVUN2?=
 =?utf-8?B?ZlRVWFU1N2dhZ3llMWFzT1NGTFJDZlhoL2RzYmJ6bzFSSnl6aXpQb3lyVjJi?=
 =?utf-8?B?OXF5SmVUbGVvenJzY1FmVm5zU0RDUTVCMGVURkFvZW5LQnE5cGs3R2hLMFBJ?=
 =?utf-8?B?WFBWbnJxbEc3S2NoRGZ2TmRVSzRKeDh2ekUxdkhHMHJIa2JGZTdBcVlCNzVT?=
 =?utf-8?B?Q2NGVzVmOFJGa3VBK0FDa2RaODVJaXBycFh0R3dDNzJJalhJV0srYUtTVmIy?=
 =?utf-8?B?M3djVkJ4cEJkSVRxU2d3VEh6dXJhT1RqUTc5RUsyOFhFUnRHemVHZGJESXV6?=
 =?utf-8?B?MnQxMkFuczdxeDNlTTVYQTZDV1N1Vkc5L0xKU2dab0p2TzJiS3JHSGZMR2Rl?=
 =?utf-8?B?YStaa1hQMCsvc25MZFRFeEdPVnBwMkVLTzlLUklNNklHS2VWUFBuZEFyYWlP?=
 =?utf-8?B?TVMxYyswSDU3S2tIbzBUUmg1dmx4WDZtb0YrM04xTDF1b2JwV216N3dtaWlQ?=
 =?utf-8?B?WDlvU2JXbUlIT0VEUFp6OHdUMm1RUkNmb2NLNzB0c29uenowcnVucFN5Wkd0?=
 =?utf-8?B?WVdPRFY3N0tINHB2eGpEWVl1WDF6bnRSVHhoRkZqMXl5K0luV3dzRFFsV09Z?=
 =?utf-8?B?VEpKZ0MvQkVJdkJWWkFYL2V1WUU0Wlg0VlU0RTFHVmdCcUVDSHNzemVlNWVG?=
 =?utf-8?B?TVYzOWhVZUtPR3RlV2p2dDBreTNSTlFoUDY2bUtjWHdBNExDNDc1MzFGOHd1?=
 =?utf-8?B?cHdPd2E2SUFrMGI0bnJFUkhjNWgxTHhPekFOYUNnaFN4azZHbVFnODExbTVu?=
 =?utf-8?B?SGxWajVtZmdRbEJ3bEIyUWVpSTVGN01EQjY5bnJsNWxzeThsSis0SUpGRWJp?=
 =?utf-8?B?YnRSYWNhdGhLRHFMYWE5UjA2dHIzYnBwNXg2WXBaUXNEM1M3bW5Ob21jYkE3?=
 =?utf-8?B?cVVVUUt2a0pGQW0vTnJxNTUrZWM4RGh4NHBNSE5HZHFnWUgyUmFoR0xsT3RI?=
 =?utf-8?B?ekhpZURVMHk1L2Q5czhTNkF4dnlLUStOMU9rSnNPU3dXeXdkNG0zL0dzVGRk?=
 =?utf-8?B?V3dLUDJ5bGQ1cnR3UkJkeXc2KzArR0c3QlIwM2YvYjFCTzV3QmhQRWtMZzFQ?=
 =?utf-8?B?S3I3VVI5UHpXYXhjMFZPZm9OdUNmSURqd1JlSWE3MTBPMkVJQ3FDeWN4bjIx?=
 =?utf-8?B?Y051ZW5oTm1IcFJIdU5VdHZJUjBieFBhK1R4NHJZdHhaaHRUaGxLQ0xhRG42?=
 =?utf-8?B?b3kwbzMxR09tWnNOcjByTC9renhnZUUvcCt5WTJhZ2s5c3p4ZXR1OTlISlBJ?=
 =?utf-8?B?SmFXaFN2MGJzSlRpTFFVdW8xbUVhakwzNUthelZjTXMzbWprZFh6Sm0wR3kr?=
 =?utf-8?B?Zk8rQllSUEJNRzdBclhJeklaSnUvRXUwb3dWdno4UklKWXQ4dVpYdys1RU9p?=
 =?utf-8?B?S3FwYVl5ZHJZTXJhY1pSeGZyeDVqRTZ3RnExY0tZSm5IRjJFaFNLZXp0TnhG?=
 =?utf-8?B?Yjd2UHQzZjNOcklTS2dScUw3MUc1WE15d0hQdTFlR1Nkb1BRWkVtbkdqNElI?=
 =?utf-8?B?TldnTmp5VmRXcEpDb01FYXQ3MWUxeXhvTGYyY1BYdkN6RytldnBuck1TbjRq?=
 =?utf-8?B?d01pWFRlZzJWSzBORVBoNUV5c2tHR3YwQnJRWjdwa2hMNkNVZTBqU2ZHM29v?=
 =?utf-8?B?bU1IUkx6KzN1aXJUWnRORU9TZ2pNa3MrWUx2RDhwOFhDRXlkZ2h6SmIyNlRK?=
 =?utf-8?B?ZGVrOFpFYk5hRHpsTlJCMnRpU0E1TTNvQXNOanZETmFIZXE0eHVzWHNmeFk3?=
 =?utf-8?B?RHpYVFFHeVVQMExoVnl0MVlDTDJZNmhTeHAyNDE5QW1Vd3FUNTJheDh3RDFy?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22db2b84-fd51-46aa-c74f-08dbfaa6dcfb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:18.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD64k5vZadi4sn6vS9UXJViV/50MeTMBPhCwv4pOQrJIiKCD25UXsI8Y6ODB0HPGqELq7rv4ebyVF+q4EivtGQ==
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

Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.

This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities
in ascending order,
  DRM_SCHED_PRIORITY_LOW,
  DRM_SCHED_PRIORITY_NORMAL,
  DRM_SCHED_PRIORITY_HIGH,
  DRM_SCHED_PRIORITY_KERNEL.

(cherry picked from commit fe375c74806dbd30b00ec038a80a5b7bf4653ab7)

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
Link: https://patchwork.freedesktop.org/patch/msgid/20231124052752.6915-5-ltuikov89@gmail.com
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
 include/drm/gpu_scheduler.h              |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index fb050345b9f2..d46786618061 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -68,10 +68,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_NORMAL:
 		return DRM_SCHED_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 62bb7fc7448a..1a25931607c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4252e3839fbc..eb0c97433e5f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ee645d38e98d..dd2b8f777f51 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_MIN);
+						 (s32) DRM_SCHED_PRIORITY_LOW);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..b6d7bc49ff6e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN;
+		for (i = DRM_SCHED_PRIORITY_LOW;
 		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9a50348bd5c0..d8e2d84d9223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,7 +63,7 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_MIN,
+	DRM_SCHED_PRIORITY_LOW,
 	DRM_SCHED_PRIORITY_NORMAL,
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
-- 
2.43.0

