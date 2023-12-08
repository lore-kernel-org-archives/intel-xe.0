Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E70C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63210EAFA;
	Fri,  8 Dec 2023 20:28:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7410EAFA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067306; x=1733603306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jJSvzD5YOB/h6YcyQlfNqCkcLWXOD722iKyTP/w4OjA=;
 b=AQsUb62MJyNh7NsKoivhLRJ7OvNjPAjs3NDCs6C0qjofA13HQ/5l4F+c
 K8dB3EpL2jijUN4VO4BUI+KbHcy+pGcbyhaBSyAII2YSdAh3Czc+MSAGr
 C5wO6GDodndAOepJQmajTL+D0Ung6wctcuXDpgsz5JknQJnsJFZbxYxhH
 53F/qo7W1SWexO57gildEuTCUujIXZcS8dY+QaX43Wha9fVeVMDfigWqO
 jgMcBFGpxl9CvQ84lJIhDFGSZViFDXOveLuhA8wqvBeJmExSyzFed2pb8
 hfHK/XjrJ28pRBvblfv+QZrAFRlSyKxmGZsDJaAagOz4sJc2DHTtDPKeJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="7786368"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="7786368"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890260201"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="890260201"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:28:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:28:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF9YO5uV/fFfuLoNX5U+GqITyHXl/4qdQVR72n0nPIn5bC9/VXpTmxHxJnD0dxDDIJMqrJx3Zdoi8kjkBaQHGcm0GFdQc73bDUC8hjAZo7bM1C5sQlKowmZixyBCOxFVctzEM2fzSf2RSKtzzx/2rIyrbzoYc+nC/GJD2oNoVPXOD2Th7sQ89dxsbZlXRToTSep2sQjNpA/kXefnt0Hegs55Q1pf7n+Xy3C/gUydPhV1T9iOXZSR4LwgZH2INtmgyoufQrjc64fXfMe4Qs1BFDfUQ7+4qBIqdL0Ay2SDRN0uUxEoarZqx57lcGUrst6AEf4F3V5WBSjrWohBzQfFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znWZHiu08PT8fH1qqbCdV3+tzhpxu/3qEn1T6o6icB8=;
 b=VQlmrWsGBsd4EN/CzCYaN1MEABoLVmOzjeRUcXiyCpfOqMSsG96KeLfpGeDXpxcN+CPGknd89W4ITmLZxuy4QAu7hstfS3KR4CH6pr4uN4hoKsmd8k8wJLDOdxIt0f6gvAohXtgcjVm0C42/fv+GontSZi7v2mi0oQ8tqlVD5ml4ITbSKpyQRx8zM5PzFXiT84KQS2mtT5YT+v7BzFErqRAWNvNS1RJHtKlbKwTbIWmDIhygusvPLF9T4TWG0+SRkGqRH6aokUr7I0hcPFJqmVoA1AxTi4tLWx/kAsHsAdNcbiID+mKZimGX69mWGX/Uhit2n70mUPP3gLKZBGfzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:28:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:28:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 13/13] fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Date: Fri, 8 Dec 2023 15:27:23 -0500
Message-ID: <20231208202723.918082-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 0129762a-3767-4825-5a05-08dbf82c2f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DpLiJF0hZ3Ut7BspOeHbgpVKAs3VPpwfxE8zwTX/qbIExCTiuXEiHAaAGisDFFzBp3n1NulVIZhOwdS3wNBtX/K8ZPZCvfJ6tWRlDdoa6VZ617k39T7ZsiQ0K12hV7S6ia+x6lnCbHldRZ/egAy+NMKA4cwTTuPin0vs3Mgaf8Zba3Kr6NbtBTgL//bwimTljGCzNiH0f3McBTd3owXl7sjDvvMpFXHxLNOu3gu8lrRULtQv7gCpR5AxPG66n6THjHkV58YRTD41u8ANhZwbbJSg1mhPPDq6Cy8l0uY2VRwud5UreLAZ/YRYvecapoj7KI9waDHhyxnh9Kr4l0FLmoS4kJWxu8LRvZgMQsy89odScnPvYgvks5hJF8QYVdbITb5jKOV3q+dtse0xKF36tQ/J8AehadvR7fD96E9/G5Wjgvqild/cCVg8KSPARLRxR9lrV5j9r3xwQrmgMtkFB8q80wq1CdJbPRHgL3E05I7++txQygV33XOXHYjljzLlh8x276/uHocWFw6/ekwKf5bvtyk3gxQEnRW17WmwJo6AHMOqBPSepWHsi1ujJsmC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQmHatmO30X6Ckfx0BFc+vW0LYzyO4WlYZ2gqvasJDP3BQX6wPq1Ltt2rTDV?=
 =?us-ascii?Q?paoTELPVKpyOLHjs4qSRva89NM1z4CfuSHoYPKywu5OBySquzWcQnFXRx7TN?=
 =?us-ascii?Q?sOi0S4ruwfVLhn+usa3+LibPIf5iej4WplUHe0xaxKWR54wr1soe9LaMHOcB?=
 =?us-ascii?Q?sXa7oa0I7CI7ecwe1AfF8k5M4SGCV5lu2ORiDxtH/uwD70e8SH1e64jft9ks?=
 =?us-ascii?Q?alPB2MZfBQmHE1VwGyz4xtNqMhHU6aCz5XwTLa/kYhpxHNm1dl2eq5hipb/e?=
 =?us-ascii?Q?0R8lV08HTG+HsDu796MtgSHSN9x3e6I/PdfQsZEU4vlibPY5oG+NlOR059OY?=
 =?us-ascii?Q?ZQ8MgwVO5EKV5Axv3rIEfQ0OxvR/N0zIElq0fRXvkFOjNnRDVJo+LLKtUVdY?=
 =?us-ascii?Q?IccXCFY4T4IQ4E97GBKc/wSjJaNtU5dbGit20Df1JPq6gI9bhRTQC9xvzt+Q?=
 =?us-ascii?Q?AP2qdshj8kUB+iqyDbBipau0HBOTZ6hkHhklPA0DPrusSPO0dSyBeKfsHPkm?=
 =?us-ascii?Q?e6QRbol4euPCPZIzu/Ci3y5WfIcK05SCYra9skx2NfBbGc2Fpg/+m3FjwRa9?=
 =?us-ascii?Q?6flxe/9/Krsxm3f5Hp1DwNzFgCaCY3KMBbF1GSg4Ww1ZWYGqPXDTIYHMgwND?=
 =?us-ascii?Q?XhsTCrjEX/savmCmMnadHADMhV48V4sqrnyF4e9UAmhXrUgDVpo+msjtnJwV?=
 =?us-ascii?Q?8R5HNsHyCMwNiGjrw/EOl/CcSKl/vPtkhYhx3E/uAlQpkJ1z5OuSpwSnakhv?=
 =?us-ascii?Q?htIbEY1WnK30bAI+JoEErG6VYMsvzRHRHnwSlozMWzqzQ0GNCCFG3XvrNQpJ?=
 =?us-ascii?Q?/lES0d8eo2cjJbHr6wxzksBsy+7EYsrZjwzeYA0unpg98TCGpya2aDp1ZvjG?=
 =?us-ascii?Q?eoG3551+V/kMBikjH968Ca4Uwg249uVGvG2prLKYfuzRSpAn7FsGUidrCkOJ?=
 =?us-ascii?Q?x7sRNV4yYdopwz+ZtkTOq7rBO9p80L7V6fpQCCBoMrCMrmz+8SnH2MnT4Sz6?=
 =?us-ascii?Q?ZUXDkE/5DmGkbOe5WZs8hPJ7JrD4/4KjBP7qPGaOmOZ/chQXVKf5peLPcX4n?=
 =?us-ascii?Q?EUd4aa6lsEa610DmydIBblQGumAPqAzk2OxKH9Tvwk6hNXliuQ2WYGUF5heJ?=
 =?us-ascii?Q?22KZMZ8BmLNgeJrZPBpNNiqxCllMTfhYDB+iQefCFsXMdTzAeAsxamJEJKnC?=
 =?us-ascii?Q?w0ywXNkkMoricNzvni4K4m+oV9Sn1MwANYDdYYW6HSPnOa2CtthTxZEmfYcS?=
 =?us-ascii?Q?631NjIwgSF662vA0TuB82L1igvxZzOq3vrisqsoXOlswSEff0Xdq+u96WXvA?=
 =?us-ascii?Q?/hQGQPLL34vkhAcZjNRWWhV9lhIevOpdQdtriUldsRr8euzK+SqklZXybxBA?=
 =?us-ascii?Q?Iw6ptJRgr3hdAtqlf9oDdoCZGJ3lXnFCObIdlfX0OSlKqjeoYefrPT4oxsdj?=
 =?us-ascii?Q?UpuCCuzm5WnYvN1aNXYej6B5YG+HBzZGhA0s7jNlQBaL7EFPHR7f6plYGUMV?=
 =?us-ascii?Q?WxGHT2LqBldl6hNmSxRk+GX05j2K1F0V8ovrTxgoaj7ThV3gliStlLfwd+OP?=
 =?us-ascii?Q?doweT7q0lHBcPCDubZ8G1iZ539vO1V4LGhvYJWsh+AVKw9RwsmyHyJLRwM0x?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0129762a-3767-4825-5a05-08dbf82c2f8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:28:06.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaLZYGD4HbBKoGHUrDXkAoP58ejRoKfMBmVg7u0Aq+TaZ8Ne64xuGZuTunDUA+OCwInfq/seck5HMmeFfU+gYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adjust to recent drm-scheduler changes that already landed in drm-next

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index e8754adfc52a..c36f73a731e1 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -344,7 +344,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
+	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_LOW,
 				    &sched, 1, NULL);
 	if (err)
 		goto err_sched;
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index ea785bcd3eb2..27720d0ec623 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_LOW,
 				     (struct drm_gpu_scheduler **)&sched,
 				     1, NULL);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 46b132ee1d3a..fb512e1ed3c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -411,7 +411,7 @@ MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_sched_prio_to_guc[] = {
-	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
+	[DRM_SCHED_PRIORITY_LOW] = GUC_CLIENT_PRIORITY_NORMAL,
 	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
 	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
 	[DRM_SCHED_PRIORITY_KERNEL] = GUC_CLIENT_PRIORITY_KMD_HIGH,
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index b467d5bfa4ac..a9c7ae815bec 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -104,7 +104,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
-	err = drm_sched_job_init(&job->drm, q->entity, NULL);
+	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
 	if (err)
 		goto err_free;
 
-- 
2.43.0

