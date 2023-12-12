Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C0DC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E6A10E540;
	Tue, 12 Dec 2023 00:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE9810E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339915; x=1733875915;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Jsp24Dqgx+RM1WHGj5WYMXRnDxwLJ+IEGmZ49OfCuVY=;
 b=GYyum6M+s3TTtugPAZ0RD4DuHNZ0T8L8JA+6mL8fivJN/TRASAl1aob/
 4z549EM/Hr8HUtnKcO73dx2khiQXCnCuPsz6x1CmaiXTRlGYig2RAtYFg
 rsyp06DuBKkVI6ajwKLfHzIsTVo4vHJe8uWEQzX7j0ClCypqD7CgCC8HZ
 EwyfAB8sO9SShRHCFmSRs1bc+2rJoyGXeLbCMeuvzDLXO8/K0eWiCwwl8
 T4lo4krzVLcoYjZwCG2XxFYFtx/1dfhQuYcJWfwZOyQmUXljSuYhjebLt
 Ck+/LLF7iY00W8h/POEr9d3wE/kHxJglewf0ltKLKihDkYVG7SALjMnv0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093488"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093488"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586664"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586664"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:29 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+uYESSiB6E5pnvqO3ADqeaOovnLB2w0ohZVCqgMue/eB2WDs1+Bc3ylN3Vwfv59+IgKIRqQoqsV2kZvcrjL9aSHseQWaIWsCYGdKLYz9rnIsknITy7Q3DD1mmMdHJhDsMSArHr2NbsPFw6O/FjLhbw1EtCVBaZbvray4eL+v35U2JCUAdsSBYebKTinkOcOUAbN+fs2d+nmHlIiWTWRsBwILMlDbTB+CvuMzu+cqkNsOurVo0iyBYKaiPUd2OCUDaZFdSZYTP57QtlJTAPqamvA/uL7fHqb4CuOMDes/CdWRaPIr10uJyhvagSm57VrPFjROyHGe/ROlr6lPjP+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wbd692oi3MquCa81anQLg31h8XKj7ELIE5FWLlXycX8=;
 b=FrFKkqx3tTAz9aE0QkaNseKP+Mp2zxWLsNdwxh9PRai+4buWFng9iLGnSGRO+L6UiyQiRLZ/j1O57q72a3/SVtn22f2iZAcD9aOAf6jot0nlrv1YmsxWbWUk3R+6tdFZ0GEKuCsYnLeLZr5tl4LpjKT6xySHLz1BfjMVHC3k1CWPp0bCa10UabcOVazodiOsWjoqSFHn6bycKhqvV9WX+2zr/RsHFkDEFvi/RJmGAl3F0P6m/BwL9GYngWxUUaFYbk9xV3Ugvt7a5k6id/YKxbnuA+Y+BfvCAZkmNMYOvy7UCiaQqo4ozbnOKU33neJA2mKiOpM2q700BqRNKvo2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:11:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 11/13] drm/sched: Reverse run-queue priority enumeration
Date: Mon, 11 Dec 2023 19:10:43 -0500
Message-ID: <20231212001045.1099517-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e875d6-c50c-4811-89b7-08dbfaa6df22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ikrc5v5TxifUtdjf9y5Y2/AITc07y17lmluj5+wEQ8z/CkFbU99WQ3CfPSNwYiVkrLKhFvSKWhTNpd1jwZHC4LBbcywtJVZVMCcwJQHsh6DyfbLjsoV6+MmXkXk74YU/Gy4ldqqLI/U0O0BwEJIjxAiTbbiwMJxgDVU1cw5l3HT0CAN1tH5q5oOGxPqPJtiaE9Z855qToKKB8BocNSNgT890/xRtJEvkdpCIdwKm50qt9pRqpgU2I69RINv4ip8PBZ4WTCISfbGT2eGwAIh5iF+7LpiRYAxg+5VwsIEbS3RpEzGlI9F0AsodQdehLDR1y9EqaFqA06cuDitplZNd0FNtm0RaMUr3RqQvrVKY9g27YRWjAqF/bPBksMPdNenXzACPUU5g0aQoFNolRCGNOBx+ld4V0xoLKaAoqoOlKeI4kNrIZbRjgtj62TiBUg/UJQTQRkKIJbcMu5vSpsGvAfB93pwUfWqgkU1n83nmiNbGWHORsWlfl38A6kIk/WKT1o401J7MLU94+UuHW2rmiG6ly+r8C4W69j0lj5rX/gEyAdLE3/a8P8WzN+f7Bbdf/xbRcut5f+B0dVH5CybAs2u3z4zrsRbjdiD+dOCuHeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(36756003)(86362001)(38100700002)(8676002)(8936002)(5660300002)(316002)(478600001)(966005)(6486002)(41300700001)(66574015)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1huZzZVSkw5aW5tMXZpRVRwVTUvb2paVFRBRFMvWlNpUmFFYmM4Wnp2SmFB?=
 =?utf-8?B?K3gvcHJjdEZWSGNnNlYxKzdaTVJKdS90WlIzN2hPblE2ejVrL1Rhd2taU0o5?=
 =?utf-8?B?NlQvLytBKzdpR29WMElLcUZ2R2xzTGFIeXlPTGlMdDNONDl0U04xQkdsKzRU?=
 =?utf-8?B?R0hNM3NxN0tZM2xydTl1Kyt4WHV2czJoSnQyM0llYlhHRHJFTzVCQm9jb3Vn?=
 =?utf-8?B?ZTNjREVMdW0yZFZIUHlneUFGOHlOcWEzU1pxbjg2NmtwZThvUXcyMmtOUWRn?=
 =?utf-8?B?S2NZQ3F2WnVsYmJPanF0SjN0eUhmUFNLdWNHRUY0Y0RzaVdxaUxyQklLTVBK?=
 =?utf-8?B?ZTlNM3B6UWJYVzZrYlp4WFowNU5RSHUwTmR5RXhsZDZDZ2EzaG1pcmNKY1pv?=
 =?utf-8?B?UlpEdGxUYzBOTEZlZGN3ZE12Q0RlTUU0eE9ZbGYycXl4VHJoSHdVWkJ4c3JQ?=
 =?utf-8?B?ME5yWFE2MVpBS3pXU3pUQ25lVzdtZ3FvcTRrNHY5aGZSdG1IYkhuOVAxaDF5?=
 =?utf-8?B?NlRBSzBnamMxTDZRbVhlUzN1S3ZzbVo3cEkwQVhCYUFrSWN5TE5teEhncWsr?=
 =?utf-8?B?Uk15UG5oSnp6eStUa09qK0JSb0NSWWRmUHJpbHlZUlVneEt6VGo1ejVXamxa?=
 =?utf-8?B?SVJMU1BuUlFpOXJxcTVoeGNpU2pIcVc2TGc4ZmVVb1ZUVnRoTk1kK1d1bUcz?=
 =?utf-8?B?dXFNTWxKL09vbjhnK2pLVk5ENythNExWMXZ5dnF1bXNpV3htalNIUmpnVXpC?=
 =?utf-8?B?dWRweElVUUlCWVRvMGVoYVhrbHFJSjRpMTVkOU9yVmVBZGh5OTFDd3BIODlQ?=
 =?utf-8?B?MjlvV2NBUUpKNWhIQTBjRkl1UHFaRGJSUytwaU01ZlpvaGIzbjNaT1JHNU16?=
 =?utf-8?B?SXE1UDFsOXRMZ2FNODNUaHVZUGJJeTYyUWFRMTdlcTZMYUdFY1A0bDVWWHlG?=
 =?utf-8?B?dGlkbk50UzRxVWg1UENSZWFBMnA2KzNObW96STFWWTk3QlF1VU13MkxZMW9x?=
 =?utf-8?B?Q01WK01QUi9Hdk5SOWZpMmpNVVVWSWNGQXFCdXFCUWNoZWRmMS9iMFp4TG9p?=
 =?utf-8?B?NjZrMFNzUjFoQnYyS2Z6eGh0YWN3c0d4aW10ZkdxME81SVk1dXBWdzJ5K3kz?=
 =?utf-8?B?OTJmTmxGdDVvTVhNY0tXU2c1UzFYVTFicjEzTFVWY2w4ZVdXVWZBbTg3eUww?=
 =?utf-8?B?MGM3OTRRYmpuRVdtQ0l6RUVVUEd6b0c4RGRIL2gyQ1loOFUrWll1QmRKOTNZ?=
 =?utf-8?B?Tm1MckMvRFZNYVpPSXhrRnBoY1ViQmJxSG96cUpCTFoxV1ZVKzlSalVpN3ov?=
 =?utf-8?B?VHl2QUwxYmovRklCMUdtbzZ0RUlXZEhMRDJZVmlRTU5vZ1Q1RHJ2V0pSbmox?=
 =?utf-8?B?TzNlVUsxN3A5b25abzM2U2xiVTRkYWZhNEtuazM3Vk5ZVVpsckNNTHJOcGNW?=
 =?utf-8?B?NnJ6WW9hVDZ2NU9GV1pyT0FNWnNtRDliOXM5MmNibGdBcDY5dXNFTEdqUUM0?=
 =?utf-8?B?K2E2TjlOWGhFeDBKdWY2Rmo2S3BOb1owNkdJMG5mbUsvOXVtdFM3Y2ZJKzl3?=
 =?utf-8?B?d3JaWWQzMnh5TnBKMkFjVUxHZFR4ZVJneUY3aFZJWUtjSkt2ek5XU2lhVko3?=
 =?utf-8?B?UEh3dnZNNG1md3hGUjIvL1dveVJ2MFZXSHhEWDZjK2lMSmt2dFl3VjNoZjEr?=
 =?utf-8?B?d3cyQWNhbFh2TjVDZUpWM2VvcGhGWmsvdDRHSzRoUEUyVE5icWJQTldvNWx1?=
 =?utf-8?B?emNLMzcxY3lmWjhUU0VUaUVNUHJmNlh2Tm84enNweHNBT3BFaWttSnR2dGI2?=
 =?utf-8?B?ZG81cmdaUXNta3dzZk9qaXZ6dWtGdUk2ZWlycnNML25kNGZnSnJFZXZtRi8x?=
 =?utf-8?B?T01xM1lkQ25ZQzB2dGZoZ3VGNjgwWWxMbFlGU0tueDViRlNwTmUvOFJqeHlz?=
 =?utf-8?B?U3pMZzAwY3Z3dUVsVUhoYmUvNURjQUJxelZuSDhkU2IzRW12ZnhBRDdLNkFT?=
 =?utf-8?B?SkNnOVRWYlpRaTlKU1grenpDRjZHeEZyblJ5T2JwM3ljRzluM1oyNFVYbkdC?=
 =?utf-8?B?ZkRWVjdERlpzckM0MXFRd1ZWb214TmR2M2ZEWnd1bEhMZ2h6STZkSGxpS0ph?=
 =?utf-8?B?T3ZwMlNoYy80TXhLQnY2bzZoTXFPSnFMbTRTaTB4NjJmdDdOZWJiVHRSRElC?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e875d6-c50c-4811-89b7-08dbfaa6df22
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:22.1802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g390ak4TD/4GKCdUK+q5Fs9gTJ+8YniYrgXI0MzybXYjSwI8FqUvN5jdO1fioc3fE9jYY1G/dBl8p+f2M7wOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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

