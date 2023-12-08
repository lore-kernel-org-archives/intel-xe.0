Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C45C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06910EB2C;
	Fri,  8 Dec 2023 20:28:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176D210EB2A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067280; x=1733603280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xbdI1IPM6PiV6bIoqtPk7HMR9RBfLjSLD1epLTO89zQ=;
 b=TM7sSjGymZrE2fom1yIjKlrXyA4Zdzb6tSss6MDg/jeD4G6bXVy3kc7e
 p2u3SsRgdhZ4wteysoSkHSQ86uyi2aZGR6UYqOIxgmyVcBfsgjQLKIH8f
 Bfiorl/vsBzGCf4iGoGreUzkmqXyKHS6Qt+u4cwOgHCQcATGe9C4W6HIc
 4enpEVo8qUSNbRdJK4WP9WEAsDI/a4PgqFnH0bbpxxz6qWbsOSShZ/yLT
 KQoVhbpm02s4Ak1Ef1aM+r+1O3EQJhHT/lMVvT7WQQQRx/50qQrnmaM/b
 ZL6hnHEK+NuNjzeH1O2dvTj3zltbr3F32k6YwS/pHU9Ltx2iGS46wAgzt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="398324656"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="398324656"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="895657271"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="895657271"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFmBCWpnVhVKsqrFgFDgt+kT7BsNQIvBpvmgH/lkTe72+IooPVlz3NTUXtNDmi7D3D4ZEcdLkni2VnxNPNt4n5pxAKm3KQ6LUrgfsfvBnHqtYqnZyCJDODLVSh64mYOySsPKFNK8WW4kAqwFGTfnfadKCUNbTX7rXJSE9f9EJXVbeompWcXevgS1da/+cPJiA2fro7h9dEVipXVQU8aRJwz1vElEpx5oUf4uxczMLWR9VI57ZSXBiAz3bO0WQ8sSokAmGlEenoiDR+fGQzKANlWLbynCfFwNC6nhoIINBJelA89LpyNyv47EX5eWqKjvkgVA/OfbRsNTUsFiDZhODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=curU39sDum9p0DdbyXvW1SGMS1jl8+resihzARx822I=;
 b=m/NySOp47wjgu9pMpE6l+XOBf6886tUFyz7SVIV1LoMbf2rWSUMgt0XIB6xoj1FYGSrFsqle+/houvyZDqVUXNW7R6jr3ZRZygObgUTC4NIZw3o7gB1LDfhf2ie8cUB3kf8fiiOFf4ZCoR8+iyHM6qzshHMDzI6kk4HGAufMrO0FU61ERSWpFpTJCgllk+7DXgAK5Ob/Do5AELw35D+CGdKmlwse4agZULmqrbQsBOSuY/iMuGApcZ2T3H6ZP9yro0NdgiXQEfc1jORsdR6cN3xhUYjzYEldtFwz9prhNg2WdIcvlyGWvzCK+C2UuNeF+G2Dko7GSSQzrzNSBguJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 20:27:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/sched: Drop suffix from
 drm_sched_wakeup_if_can_queue
Date: Fri, 8 Dec 2023 15:27:15 -0500
Message-ID: <20231208202723.918082-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 217b451e-6e9b-4353-d224-08dbf82c2045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JV/A/4do89DQdjKhjY0X/LLRuLY7HLQMTgVibPpYqvSgBGpWw8AtQrZ8Fs5YrJ/SOvphOvmDQUSNoeF9Woi6SDBp+qh+3gJlo1hsrItFGjAwPrvlHGIEuI0z5jwMY4Myt78w+3n5JBV6fuZXQ5+TJhmUZVOV6ou1BM9i4o+nfaXhhTWBd/mucGuKWxlsi0apiG2rdoKWYkZC34HybsNidke+sXmZ4vDfqeFhtXIOkG6YzfN3KGSXd4WeZ80uKATe564MaJHkb2UPDAQ02HI8Wv9I2wZRtbdaET9koCU9QK4S2qlhy0zeslCdaMj36vVGT+96pYt5CzYgVUkh+99IqvPnEBV82QcG2M9asUe5LoHzuSOIrgpU8OzbvNFL6BUkIoEts4roATrCp60MlL7kcHk27hm7oXcfJcadAxJVptlfji59x8VilWCwSypsRmsSStF92Q6/nH8FzOh6qVvVYnnjEKlnUh4Ix8ocwCc0NQEqzrgrPMLtbudqym9W3BxPJLsIpwusKGZnVKc2gO/rtAVF9dJ4VHTGJE26qvS3Unk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(8676002)(2906002)(86362001)(44832011)(5660300002)(36756003)(8936002)(41300700001)(83380400001)(82960400001)(6512007)(1076003)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(54906003)(66556008)(66476007)(6916009)(66946007)(478600001)(966005)(6486002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/ycN6oUyXcJnJkypnYG0ckqLpr3km1GF/Xv6PMrm/L7+J6pJP7sCXhtDGUN?=
 =?us-ascii?Q?/4b/jZTYtSdZ+xZGN5bpDfNS0WbWJ8r1h+PQgfi0tdYNen8yuC5aCcDRxrfY?=
 =?us-ascii?Q?IrmkqyLfUG1ZNYACKZxaDP0LwkIfWzMHhhxRapiCUKHqw24E8Tt/NCZmlDOd?=
 =?us-ascii?Q?8m2ES3a88LwGXolPtdNKPnuguTGXlOPcUxijahVpbdcOci74fFaEUfC5w327?=
 =?us-ascii?Q?Ppf7ikfps01FWp9dn8/Jsb9mpUN+VSJM0dPQxijpbD/A79gObXtU/mXWs0Qt?=
 =?us-ascii?Q?lu9H9qXxt1Bh7gXpp5zx8dSYlr2EWJWRKtSpCuALzkUkuezLjAqFZkNyOZds?=
 =?us-ascii?Q?LDM7qUu7H56zy3v01dIkio3Q/DydxubIsuPvpFnujBEuJhQ//UiGk3oLP9PJ?=
 =?us-ascii?Q?Sni+Y3/QIsDtSlyIDFvI2KB8nXdvOF2B8KZAbZM4/35cfKy6n3KXfQsRPe5h?=
 =?us-ascii?Q?IzcD9z2A/kqEHtE4rEy4CZ/L3xT/qYSZiTIcWEoNJxebomGXSIVA7974NVCF?=
 =?us-ascii?Q?ApiFt5lnltfr+9JGWusBeVIlOII4Vfevz/uzy+MXm/nOmlB98QECBkm1AkAQ?=
 =?us-ascii?Q?6yWdR3rGV//ODgiB1ckrv0/T5kN7eH3K8vuO1yltwjZ802zr2RBOI8OKyh9j?=
 =?us-ascii?Q?jVB1nX1spv/mBmQhWA6YiqYMvsfgleTpiuwfxsT/tOZuZPmVDa0XsV3qAY/P?=
 =?us-ascii?Q?mVoVywCADD7xm94F8x5Ojryyhxz9Y8G/IX9TB5EQ83RaHmbdOA81fupTqiSX?=
 =?us-ascii?Q?Hv3PlPV4ebSevu21ZsP1adgcxVZzURoLxWphIPTknkwSMVkgciiEgvOAtlYi?=
 =?us-ascii?Q?MT9lfOyv9yjZI4vjeDaxSJHuSsB9ej+8qZlt7WaNB0FLlJNx4ep8dihe6r9k?=
 =?us-ascii?Q?fFtgD7VevLMIdx4jfy3bzGlPykt6JY9y4a40a2188krSmTbNreg1Gnsv096c?=
 =?us-ascii?Q?zelDmtfFaeXKWZncSI9xeihzygWemw1Zk8esqZY66ICh0W7B/meDfpdqAEU+?=
 =?us-ascii?Q?BYcbwEfLsYWSNiJEZMhCVkHVkSF95twbkPi5QAbupj3QsBT/fKm7PoKV5H5n?=
 =?us-ascii?Q?8QAm6VPgpuKij/uwZA601+N1Uw/oNJI/qmWBKqSFjFgpuOiQKUn+ozeDGrhg?=
 =?us-ascii?Q?VEMKw+1HFT9C87BdhcCf2rvo3jMlPvR89GysL3NEpoo5zdMWDJ4O3aQqqvVy?=
 =?us-ascii?Q?wwp2m+l4KwfDTBwohNcYOX+jwc9bQUtXdH5Rb0eNp0rlwyMSHmNHilF7CxIn?=
 =?us-ascii?Q?pehnB5rcEYbQhL3hRKODvI9tCWI8gtcErIVZ/T3jXthDo/el5kB35BOenwJc?=
 =?us-ascii?Q?fGSapHgbd45kA2DibgVuIT9BiT7BoQYnUB3oAlUDV5C4srI7OuVxMMZUx3mD?=
 =?us-ascii?Q?O6Ot/fGMytOXW8dBQGDUtyGvN04qrXmj4OSgJPr5c44XrjJqclTZmb5MxK/O?=
 =?us-ascii?Q?EnB19WVnxiOfDE+Z89QyhCEw6BsP2uidpk4QgxKvISEcwshYgoepPA1XR+/F?=
 =?us-ascii?Q?+q3LXEUtWFScRaXF7Ryy5d2IJOtseYo90sV+glkv33fJ+j6YzKjTJ4HkzyZV?=
 =?us-ascii?Q?MT0o79AUWYABCkq6M1LcpBM39+HhQJgul0mOFopRgejr1hgSME39Le0u84AR?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b451e-6e9b-4353-d224-08dbf82c2045
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:40.8543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQZW6v8/FFpcBpL6/OuZlKY7mCYKfmUQ5fdnAlWCnih0IFMHy95ZgI1G9UVPKMbg34GhuIWG6w2utX2Sr1sagw==
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
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Because a) helper is exported to other parts of the scheduler and
b) there isn't a plain drm_sched_wakeup to begin with, I think we can
drop the suffix and by doing so separate the intimiate knowledge
between the scheduler components a bit better.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-6-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit f12af4c461fb6cd5ed7b48f8b4d09b22eb19fcc5)
---
 drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
 include/drm/gpu_scheduler.h              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 409e4256f6e7..f1db63cc8198 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -370,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(entity->rq->sched);
+	drm_sched_wakeup(entity->rq->sched);
 }
 
 /**
@@ -602,7 +602,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(entity->rq->sched);
+		drm_sched_wakeup(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d5ddbce68fb7..27843e37d9b7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -920,12 +920,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 }
 
 /**
- * drm_sched_wakeup_if_can_queue - Wake up the scheduler
+ * drm_sched_wakeup - Wake up the scheduler if it is ready to queue
  * @sched: scheduler instance
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
 		__drm_sched_run_job_queue(sched);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c1565694c0e9..43730f1ecbfd 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -558,7 +558,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
-- 
2.43.0

