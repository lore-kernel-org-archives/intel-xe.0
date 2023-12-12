Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13EBC4167D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3F10E53C;
	Tue, 12 Dec 2023 00:11:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594110E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339895; x=1733875895;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=1jlO03oxD5uHv6rGKY0QEGfX/GEacGWUcyfbEOqKeIs=;
 b=QzXa6l7WHfQKVHpwTNxbKLphwtre7zR9/avsCMcBZrDHHWaBjyFuv7jr
 apPOuCWCv2Hg9F6WrDRkeqL7iXNfyqnnu9pBSofUxVUgRmlBeubiOoZ2+
 oKJW2T6SNyHnCITHifeAjvsPr2BaCKh8qlD1CDR1Tz1hoRLp7sSY2jOuB
 573LsqADajB4FjKiJX3RwB4N++/bQOaf/S7rolduK4LmTWSx+nsvRLHtc
 IMiOwIxCSqa7k4m7UiV77MumQlbKUfZwubbSP/c7Ypdf4zV5avoCdpOB/
 PEi/jsqfyPUBtnfIa+zyUpU2CEZvkuHLkLiD9Vx8n5vSx2ufjhXYaoX9C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093416"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586584"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:16 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbB75EnOKD0+sNcTbFNyMHIEg3qTyzSyGLkQWq0+0wHZKeVKKTCHxdH6iJBOWyzH/MaBdwvCgLkIoLmPrTBRiYH+qE7x56sy2YHgozZ8HAEpU8CVa+Ecgm6bZh/PW3sG4B6wqQRle55xtkiyYviyMdjBAXeDdGQ0w6sQ3S8iqKmMqqkG3gCu3UeR9zCkWH3ztDSSBY3zn8OshoD/BtQrBZUOtfRpHdY5rSzPYndwiI3UOAjSP8GdVlySExXnbNKF6Y8wyjhd6ya9ep/C+91aV2DYxyMe9ZwPU3e7N3+9/MdzL2bUWHgrC4Mo147WLEU0d8Ap//kOYm7phnqU8sNWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceIsWg430NSCulIHY154K5996APGeha+MoNkSrZuoHA=;
 b=T4irZ24Sk0jQ6rtU1SiTpTk5l9Z46Wk2/S57bR4avEYID2NHPbhtDUyNWxc71WhyhfxKgCK2V41OGJKqKlPGL+7SHYHcfO164seNEtJK+dmQcoKgvZWgbnjeYocZfwJnq8VAJ68aVEqZmXU30mPDgnn0OSbTOjxtel9yfBSTeBwUV6PAddR8PIPQZWggtu03LhALVy/7njxKFrDyw/3PFysbURFoSpj0qU8ABoSznC0F4QbM9dmmAi4eTJLaqZ/0n5N9gAVWV1fgnJskV8zyYF3gDj1js6mJ8ZBliJLc2D+Gy1UC1NdTO3ObU1LIld9ivHsqWFpaviFbqAZO8Iy07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:11:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 07/13] drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()
Date: Mon, 11 Dec 2023 19:10:39 -0500
Message-ID: <20231212001045.1099517-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef32a74-bada-476d-f454-08dbfaa6d6bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +V1LF7vs0voQeOmW3RXeDEVG7clDa+K3D4/dRJMOWhmjben1TyGrYXOeTGaTTs2ItuHBCvDoOvE1+QcCGKLiLUsdidKDSBsfU767dRIaHTYb1qpxMBTm4tltlzrPECkovl78uHpiju78SdhA3L4Hxma/xpzm8pG6iWmzPylbpvY0rZmTYAUsOe/yYbsVCpRlcsDdBc2RnlYdq2FwQZQc1e762T4xS0RfHMaSnUJRSt/+3janIAsPnpggHod448BNzZLdPGMcrLyyk6DZ7p0tRe0L8aDqh85aNmPP97uxBhE8WvxzDCs5/7ndw2iu7d4IF+lnhPFam3Xmhk37ZtKjfP3blaYlPzHo+/RjrC6T0EDqDKuEK5A/bYz18bJ3CS4zYwF9/gDaBWqXIvXtW8JjWElVU6XtN2cFM4/sx0+KX4/pziC//P4Kn2t/Wx4MEfPpwcF7FOH9bb468W5OLhIRjCqav4DR8PpN7o2j6fR6NI4j5FdDxa+7MNhdjVcy+OVUtScfqz12lmxl9CUNu6YIyJ9iVzU1u98GwFDmD6dejs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFcFkKHU4x2kIxEK0CDCsdzsYDIIzyS2xKxcpddwgyH2gJC0acnfSnf3FxYA?=
 =?us-ascii?Q?tO0lGMZcMk1/DhsKmFwVz8Q8aCJlAczGHPe7oFsIjJA6iTtbMumxpG5uxem7?=
 =?us-ascii?Q?Hdbt63pNn2aFyY8hTpZGIh7TkGaa3kNDgfaGCi8Bmw3TPBcW1tuqTg8tmSGd?=
 =?us-ascii?Q?mkCD51/txDsxqTO4ZA+oz2CwgUzb7gUJ27magIpy1WRzyEBVx/Mt+45WtaE+?=
 =?us-ascii?Q?6SU9vTb7NEdGTqDC8jZHTfCGXiSnBkHb8Lb7nGiHm0oxmiqwXOdPCH9O1ddN?=
 =?us-ascii?Q?/dK3HaELgk4IwKlBLYE2mvv24mpDAy9CZJ7wu39ulryuTxAZkq73FSniFAVJ?=
 =?us-ascii?Q?V3aLN2twoDju4T4qT99eMIzxZrRH4WQ77OZiEwc+3Xyni7BO8cqFQPuoqjAc?=
 =?us-ascii?Q?Uusapm0eXiUeU2PI3qqt53vXj7uNRfrafZLo4+2HIk1ks9Y/Ojo6HoGBT2OF?=
 =?us-ascii?Q?2nXqyrHLkuPxsML3akMg0IsvOGvD/O2Kf8K2MMveY1dATj3ECaFSQEf3sHwy?=
 =?us-ascii?Q?XkPV5bKrAn0R/IooVb2O8T6bdncFcVE5Ppr2Ph/SPzUGQfCKN7V0IxlprgmK?=
 =?us-ascii?Q?vngSTktXEiRQltJ9/FBD6Rv783jXaDPYj24fyVW2Lc/ydvwOHUEv0N8g6A4w?=
 =?us-ascii?Q?xm8haEbJxdsxxJNmoKTzvMPFwz4PQxZbSi+BBGsva8NqpmK754fe5HehEcvK?=
 =?us-ascii?Q?92Fk/Tv55ph+udGktlRNvxeMFnCO+87NC4o4Kw74DxNaxn1YTJBMSU0F+B3b?=
 =?us-ascii?Q?VpnO4t1y422yDfYrfPc9nHDISyAmkD9DBKmtlhPbJBvHAmuhqk8bvjA7F1vR?=
 =?us-ascii?Q?899U/QM5VOTGIHwb0Qpxw33pZYNywhtpOqHwZksLZwCqDaBKLXzFSBYNDB6a?=
 =?us-ascii?Q?uUnlF+IAPMAFYdIQ6RymCOjwdLR4yqlqwXJriccydmdFIZPwShTIBlrMKbNz?=
 =?us-ascii?Q?istetlWOQWkT/kFJAzVSBlY6krOCjdCOoKkcmDWCatK5K1EWx00qDe4pzMHI?=
 =?us-ascii?Q?xoX2TBKg8Q2Gyqm8XTYYoL/fdHc7g1yDDS+Eycxk2A8sjJxyewG6cdd+rqQv?=
 =?us-ascii?Q?5juRIKC5rVt3fDS/6RMgS63jkmVptlliD9Dh0fcsukJMSdi27gZEIKovD/dD?=
 =?us-ascii?Q?oTrt7jDGA+BpvYN38sr53mdirh3GESRt3f2AJJBMiNInD+ob7qSxnzyWrYls?=
 =?us-ascii?Q?+g/KC/xIeiwXBQzusiryPL5ACeRkjJFSR3XXH/dfYztg5voFhBhQED53DWBb?=
 =?us-ascii?Q?ZvZYz77VjHO9J+O2tzeAX/yhaGw1YCK2seiKz8B9WAMDGDAHS2Ke3kg5GMQ9?=
 =?us-ascii?Q?/IxfnRgMyIFCT7+kDJpfDNfH8A9QijL+qWYnURjmRZHbhMI4GzrywPAyU5H7?=
 =?us-ascii?Q?RFZY4KM+6Zqi0KP6tSlUkFknEaEPBQiL8FyvisOj1D/jvSCKIydOc8dpt7NN?=
 =?us-ascii?Q?b4l85CRamXt3Qc7zgy+6FxIIIx3Wg6HAuUokoxBpkq5zHegWB1JAC4HsQrJu?=
 =?us-ascii?Q?qpPB5qZB5gXlIiAS9c7wPtjYP9cKmb6VDY6aneWLqBwa3qesEwK6iBrGvS5W?=
 =?us-ascii?Q?YJQVGBPSOjApzotpH/m9dGqDVRHROGjCNyf/c/2nyshuS/jApFNiUpGzrwgJ?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef32a74-bada-476d-f454-08dbfaa6d6bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:07.9939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJiCO12io39DJ2xPjYBWOMaZZvFY0DNPWpUzKg45A/xb4lxxL7S/6islUleBoSBw6RxPaKkyO6ruLsUo61e3Fw==
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

Don't "wake up" the GPU scheduler unless the entity is ready, as well as we
can queue to the scheduler, i.e. there is no point in waking up the scheduler
for the entity unless the entity is ready.

(cherry picked from commit f3123c2590005c5ff631653d31428e40cd10c618)

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231110000123.72565-2-ltuikov89@gmail.com
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 8 +++++---
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f1db63cc8198..4d42b1e4daa6 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched, entity);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched, entity);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cd0dc3f81d05..8f5e466bd582 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -925,10 +925,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
+		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_can_queue(sched))
-		drm_sched_run_job_queue(sched);
+	if (drm_sched_entity_is_ready(entity))
+		if (drm_sched_can_queue(sched))
+			drm_sched_run_job_queue(sched);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 43730f1ecbfd..b838a3e53040 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -558,7 +558,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched, struct drm_sched_entity *entity);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.43.0

