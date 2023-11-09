Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8CBC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911F688CBF;
	Thu,  9 Nov 2023 14:58:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3121788CBF
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541930; x=1731077930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VClpJtQF5dwwXSdFM/WGxTqYIBNQLut2SyugBJhXN2o=;
 b=ZWg4YxwJ7LDvc4UnKYzJ27HuImsJngLWRrkYn0IBOvO5rU/RROBSzj7D
 qK/TxeB1h61kb/9jr1MX6eO+duVsFCY/PvdcBnEcVDy9+pXFp0v3tAzQP
 yE/rz6Nx6ax9LPwa6YEcVY6zEJ+c9KIXRXa0r/Y7HhFIfJe167NYJFyq+
 Oprua5BOKAqk93IoGEDpZvfkKNAnSWLGPZ2z7mOZKq+tKnnbijZPxzxvA
 E4Nxduh+ky6Q592cV5AEqRgk54NcKhSKEXcTtwt8IxlTh7CsPIUgfvqZg
 OeM6JDk+ExsE4695v92zx4y9gtFDGGjCarruStpdJzKy6ej6hURdXBWn/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454300164"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454300164"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:54:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4561367"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:54:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:54:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:54:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3pFKrRYOdLmcVVVqsD01+drMrHrc2EupFUUvNho/21aLaMdLCW5Wa4C0E407lTtvnrL/+ss021/xMu5qFcTLMZ8bqCSPiZoPH5MesDkubT7bRTL5Jd6reqSO1tfGJFuGav3vLeLUInq9rA7rayDsC3h2QplGVAINVk7LN+6Bp6aFkn5Mpi7hlbcLT61t0nzxkIZpBj6qOt4rEV4Ab/i+XrM1VC69F0fNtEjQ+LcIuu0o158upPSSYR+rbqY9de4lXa+ePpAjSd8ofLmsJc3KBZCIu9z4yFFjLnaUvjVnYiLzlF+dlrzBbiayvpTVJj6+q728o3JCcxVcY7L7Aazdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVHq5ab9Dp7rsEUN4Mnih5VWSPUvmjTgJtMwV3Sb3vs=;
 b=oUW4Qudq+04yMQHjakNdCicFFZGKyDKINGfV5S9lC6lzmvndhBZiZnHmdNbkh5YpNvDI6hqul1Rx1zZTFTEofY4TJ+eaMPuSY51FXfBk3zmYVw6gCr0mLzQ5nfRMTmmczMY9jmLYBww1pS772dk2lKE8NgkYWntqZJLByH2Ple7gXMKGAvGhtnRycEaRPYDnWgcAAUXGTkhdInnqWqTZ5DZ157BZyI22pYmaovjrUkz3EzWnzHkTzuECSy27s+tu/7M3xnbAyN5Rlq9Du5MwAgbHJCJ/aZs9LWnvzelbyLCT0YEbskaOACHcW940eQj0C75fazBX7opWHLQ3O0QV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:54:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:54:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:20 -0500
Message-ID: <20231109145347.345120-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c8012c-16d3-43f4-5473-08dbe133b7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9DCx3E4mvNZVvKqIDWokphrUEXhRecVB/+fKsglsmC91+8/kL49/xw+RIKhAer35ngZHG09GMXktLS1oLrRFxxPUPq3UUCVkCnndySr5D6MZbe/V/0QyBaea1nhY+4mcZuB/tu6XUodThEubuM2ZkrPX394b3nvAlGhp1KWU77e6BnqoLCO5veMjn80ht/dnhM4Gu0zHAdSfAPSOsbGpuZnMTp5mooVBMJzi2vxabuouBba+5KVL6+JykMv7wGHMGOdFGfjF2GhcOwIw0r1VvisHZaZ/3ni11izGzlO2+IsefeV4aEF3L+wom6/BQEhhhHgnpNnajkkwWn6ciwUvCk5VcBBPCC7v180sPeWhK3lsmEDwX6LKaq1BxB8aviqkvrRfVMeOIQKG8RWSkB8MuXXrNUU26K5z8Kq8EQHOk29TtzZabmbYkLGw3PxgdCEd6gaUUu0vCmHgZayv1DzdI6Uq2kgu1svj7uuZvHL77TQ+mBEH7r5bXsF42ociwhKF4lQTCmodGu3G5pGk10CxbkfE23hz5jVMprCKTtFsGYP6Q8dZ9tzqCqvj3TghCkrm7KuLGOzAa0rPv6dOufbXA0KLRPQCKHGBC45CGjsl7LqhG+HJXc5yUVb8apoT2ym/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(26005)(2906002)(82960400001)(41300700001)(8676002)(8936002)(38100700002)(478600001)(4326008)(6666004)(6486002)(44832011)(86362001)(6506007)(2616005)(66556008)(66946007)(66476007)(316002)(107886003)(6916009)(30864003)(5660300002)(1076003)(6512007)(36756003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HilleHHmo8X1CtE45SyONZ1G0ah3WccmL8C+RT7XQfgmL+AAObANx4Gm2/iL?=
 =?us-ascii?Q?k5uScCE60CJDOnokoyhNawow/xCpKdndAvAOV0oMjGbZMy0kEV+1SQ45ccAq?=
 =?us-ascii?Q?TXZ6ibCcYzL50oYjY+pMtOQUNLJUgcqBgM91FOpbpLs5dB1MxMe9UWcMTXv9?=
 =?us-ascii?Q?whjgF/Dd/u3JdKBDhJbw04PbBj4Z/WbhTN1XjRY0JEHWEkaJrEM+kR1g+nel?=
 =?us-ascii?Q?b+LFNzATkncjJSAZcLnZXseaCrY28QzkvJFkkFJFxX5yLOeipKaJ79Ztqa+I?=
 =?us-ascii?Q?ZOZu2/txNwAXbI6mYEFyJNYeN7Oqd4475Nl7E3AAowy/gypyStuY+pDV+ZYg?=
 =?us-ascii?Q?jh7fQgt0fDgivPW9PBM/p1+HV9nOqIMGEgIfJR2RzzA4hSfzVQWH9AQzWc0D?=
 =?us-ascii?Q?8x60n9+q9eW1m+VOM2iCzY/jjZSae7Reyk85kBohTveKLLtUrcZFi8/pe6C7?=
 =?us-ascii?Q?nfyo2qHab2wKsOCKd+1xdLAgT9skiBYOOYtM/AK7BGy5/KngJvVGKUdUXNjy?=
 =?us-ascii?Q?2AhIHhRC9+ppuBookfXdm+R4eKSd8KzfY5w2P65YhnspcGUOaJ+f8XuG4/fY?=
 =?us-ascii?Q?xdRR6I1uFk4JqoHSTrry3g2Acn3g6bS9inyX9ze9QilTnn7P+oqukq34LGPc?=
 =?us-ascii?Q?hiN4lI5FgzFAoy8lJa0QSLgWUumN5O7kjd1bVpvBdJP/SgH7wzarxQlb1PP6?=
 =?us-ascii?Q?+SpnFwLtmhRGZigTaPaVwbcqUq6n4QJcyxIuFzwr6ZIBxo1unqcWDQbPCrBU?=
 =?us-ascii?Q?1R93eMOJP18qhJPPvSU+I2my9j50Tn5fJrHeGF45bRUge7KTrdmdSzErVWqw?=
 =?us-ascii?Q?aGJuL4M5F1/2OR4KQx8uOwAxptNpiX+L7oBCl0m8zaJHygW4/WLYjH+L31Hw?=
 =?us-ascii?Q?65+fCJCs5C6eWeosQVtUL3WLN3K/X21S3DNUKW4Q1qjTd3np28e3hQ7/LNAL?=
 =?us-ascii?Q?yz4ngp4+YX0AiZD2bb3n8t9eIcOU8aJw8x0CPKS9G7qcfZ0lYJNs3tX1I0/p?=
 =?us-ascii?Q?KSchItiCBcVajuK8IQkf7tw69i7N2j401OA3MuiduglnWusVM+9ldMCGgMKW?=
 =?us-ascii?Q?yc2eK5hgLlT9XzfOs4ajmhMBlwKwNqaKMol9ErhNmfhuxHUuhZZg3RKvTo0X?=
 =?us-ascii?Q?hmskgzykmI+pya8jDUaPDNvZpfsWw1GeR9ImdjjPrTz2yYD+xj3aEDb7ZU6S?=
 =?us-ascii?Q?pRVpD2eaFQXCS+k+QemKIz8Lvk8BTNF7G4nzL/1IoS3XHeVw9HALgKMKEgkt?=
 =?us-ascii?Q?inDe7kFsw0WoFg/EZIw81kpdbr97SCEiR+Xo/vcFwzPAnPevL1PY9GptIdzo?=
 =?us-ascii?Q?6MAO8j78Ad79HOTvSndBtXr0hfDZu03k/gd/dcy2gV6k3ZMm/sORfZyYPaQN?=
 =?us-ascii?Q?3uybjk0mNc0T0/dXXWV+7ySoShxHgXO9gpAnJ4N1b980GKja3eIH6blSHbWO?=
 =?us-ascii?Q?tY29sHUxyt+5gsK1e4aELEwMs9ARl7TjpQMMyFt94MFcPjbJafsWsoRYwkoe?=
 =?us-ascii?Q?eSr5XGPwfsZG6PCYljF/nZ+Kb9areuXmxp1UybmpqS1geNL65TwyeBicZbPn?=
 =?us-ascii?Q?bl6ra0WH23PPLloLTzbIb/pJArZkz0fJhRLniXyV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c8012c-16d3-43f4-5473-08dbe133b7b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:54:04.7011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx28Z8/3qwchuwskiHTRGPbx5kOWohrbpH/Z5PqegTJUWBonl5QXvRRj2fZIb7haeLLzc0HNXsX3mfLmL78hhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 02/20] Revert "drm/sched: Add
 DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy"
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

This reverts commit 0dceb0dede50613712a065d627443f4c182e6e2c.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++------------------
 drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 63 +++-------------------
 include/drm/gpu_scheduler.h              |  8 ---
 4 files changed, 24 insertions(+), 118 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 1dec97caaba3..65a972b52eda 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -83,7 +83,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	memset(entity, 0, sizeof(struct drm_sched_entity));
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
-	entity->single_sched = NULL;
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
@@ -91,17 +90,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (num_sched_list) {
-		if (sched_list[0]->sched_policy !=
-		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
-			entity->rq = &sched_list[0]->sched_rq[entity->priority];
-		} else {
-			if (num_sched_list != 1 || sched_list[0]->single_entity)
-				return -EINVAL;
-			sched_list[0]->single_entity = entity;
-			entity->single_sched = sched_list[0];
-		}
-	}
+	if(num_sched_list)
+		entity->rq = &sched_list[0]->sched_rq[entity->priority];
 
 	init_completion(&entity->entity_idle);
 
@@ -134,8 +124,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
 				    unsigned int num_sched_list)
 {
-	WARN_ON(!num_sched_list || !sched_list ||
-		!!entity->single_sched);
+	WARN_ON(!num_sched_list || !sched_list);
 
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
@@ -242,15 +231,13 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	struct dma_fence *prev;
-	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq && !single_entity)
+	if (!entity->rq)
 		return;
 
 	spin_lock(&entity->rq_lock);
 	entity->stopped = true;
-	if (!single_entity)
-		drm_sched_rq_remove_entity(entity->rq, entity);
+	drm_sched_rq_remove_entity(entity->rq, entity);
 	spin_unlock(&entity->rq_lock);
 
 	/* Make sure this entity is not used by the scheduler at the moment */
@@ -272,20 +259,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	dma_fence_put(prev);
 }
 
-/**
- * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
- * @entity: scheduler entity
- *
- * Returns GPU scheduler for the entity
- */
-struct drm_gpu_scheduler *
-drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
-{
-	bool single_entity = !!entity->single_sched;
-
-	return single_entity ? entity->single_sched : entity->rq->sched;
-}
-
 /**
  * drm_sched_entity_flush - Flush a context entity
  *
@@ -303,12 +276,11 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	struct drm_gpu_scheduler *sched;
 	struct task_struct *last_user;
 	long ret = timeout;
-	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq && !single_entity)
+	if (!entity->rq)
 		return 0;
 
-	sched = drm_sched_entity_to_scheduler(entity);
+	sched = entity->rq->sched;
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -401,7 +373,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
+	drm_sched_wakeup_if_can_queue(entity->rq->sched);
 }
 
 /**
@@ -415,8 +387,6 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
-	WARN_ON(!!entity->single_sched);
-
 	spin_lock(&entity->rq_lock);
 	entity->priority = priority;
 	spin_unlock(&entity->rq_lock);
@@ -429,7 +399,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
+	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -531,8 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
-	    DRM_SCHED_POLICY_FIFO) {
+	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -555,8 +524,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
-	WARN_ON(!!entity->single_sched);
-
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
 		return;
@@ -606,13 +573,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool single_entity = !!entity->single_sched;
-	bool first;
+	bool first, fifo = entity->rq->sched->sched_policy ==
+		DRM_SCHED_POLICY_FIFO;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
-	if (!single_entity)
-		atomic_inc(entity->rq->sched->score);
+	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -625,10 +591,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
-		struct drm_gpu_scheduler *sched =
-			drm_sched_entity_to_scheduler(entity);
-		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
-
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -638,14 +600,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			return;
 		}
 
-		if (!single_entity)
-			drm_sched_rq_add_entity(entity->rq, entity);
+		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
 		if (fifo)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(sched);
+		drm_sched_wakeup_if_can_queue(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index f6b926f5e188..06cedfe4b486 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = drm_sched_entity_to_scheduler(entity);
+	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0626aa6f7b70..38a00084edd0 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -32,8 +32,7 @@
  * backend operations to the scheduler like submitting a job to hardware run queue,
  * returning the dependencies of a job etc.
  *
- * The organisation of the scheduler is the following for scheduling policies
- * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
+ * The organisation of the scheduler is the following:
  *
  * 1. Each hw run queue has one scheduler
  * 2. Each scheduler has multiple run queues with different priorities
@@ -42,22 +41,7 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
- * The organisation of the scheduler is the following for scheduling policy
- * DRM_SCHED_POLICY_SINGLE_ENTITY:
- *
- * 1. One to one relationship between scheduler and entity
- * 2. No priorities implemented per scheduler (single job queue)
- * 3. No run queues in scheduler rather jobs are directly dequeued from entity
- * 4. The entity maintains a queue of jobs that will be scheduled on the
- * hardware
- *
- * The jobs in a entity are always scheduled in the order that they were pushed
- * regardless of scheduling policy.
- *
- * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
- * when the KMD is scheduling directly on the hardware while a scheduling policy
- * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
- * firmware scheduler.
+ * The jobs in a entity are always scheduled in the order that they were pushed.
  *
  * Note that once a job was taken from the entities queue and pushed to the
  * hardware, i.e. the pending queue, the entity must not be referenced anymore
@@ -112,8 +96,6 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 {
-	WARN_ON(!!entity->single_sched);
-
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
@@ -144,8 +126,6 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 			      struct drm_sched_rq *rq)
 {
-	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
-
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
@@ -164,8 +144,6 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
-	WARN_ON(!!entity->single_sched);
-
 	if (!list_empty(&entity->list))
 		return;
 
@@ -188,8 +166,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
-	WARN_ON(!!entity->single_sched);
-
 	if (list_empty(&entity->list))
 		return;
 
@@ -720,7 +696,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq && !entity->single_sched)
+	if (!entity->rq)
 		return -ENOENT;
 
 	job->entity = entity;
@@ -753,16 +729,13 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
-	bool single_entity = !!entity->single_sched;
 
 	BUG_ON(!entity);
-	if (!single_entity)
-		drm_sched_entity_select_rq(entity);
-	sched = drm_sched_entity_to_scheduler(entity);
+	drm_sched_entity_select_rq(entity);
+	sched = entity->rq->sched;
 
 	job->sched = sched;
-	if (!single_entity)
-		job->s_priority = entity->rq - sched->sched_rq;
+	job->s_priority = entity->rq - sched->sched_rq;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -985,13 +958,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	if (!drm_sched_can_queue(sched))
 		return NULL;
 
-	if (sched->single_entity) {
-		if (drm_sched_entity_is_ready(sched->single_entity))
-			return sched->single_entity;
-
-		return NULL;
-	}
-
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
@@ -1238,7 +1204,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return -EINVAL;
 
 	sched->ops = ops;
-	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
 	sched->run_wq = run_wq ? : system_wq;
@@ -1251,9 +1216,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->sched_policy = default_drm_sched_policy;
 	else
 		sched->sched_policy = sched_policy;
-	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
-	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
-	     i++)
+	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
 	init_waitqueue_head(&sched->job_scheduled);
@@ -1286,15 +1249,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_run_wq_stop(sched);
 
-	if (sched->single_entity) {
-		spin_lock(&sched->single_entity->rq_lock);
-		sched->single_entity->stopped = true;
-		spin_unlock(&sched->single_entity->rq_lock);
-	}
-
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
-	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
-	     i--) {
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1335,8 +1290,6 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
 
-	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
-
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4bc1fef4fc2c..fb47c8c96661 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -79,7 +79,6 @@ enum drm_sched_policy {
 	DRM_SCHED_POLICY_DEFAULT,
 	DRM_SCHED_POLICY_RR,
 	DRM_SCHED_POLICY_FIFO,
-	DRM_SCHED_POLICY_SINGLE_ENTITY,
 	DRM_SCHED_POLICY_COUNT,
 };
 
@@ -113,9 +112,6 @@ struct drm_sched_entity {
 	 */
 	struct drm_sched_rq		*rq;
 
-	/** @single_sched: Single scheduler */
-	struct drm_gpu_scheduler	*single_sched;
-
 	/**
 	 * @sched_list:
 	 *
@@ -500,7 +496,6 @@ struct drm_sched_backend_ops {
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
- * @single_entity: Single entity for the scheduler
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
@@ -532,7 +527,6 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
-	struct drm_sched_entity		*single_entity;
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
@@ -618,8 +612,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
-struct drm_gpu_scheduler *
-drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-- 
2.41.0

