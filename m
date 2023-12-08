Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6CCC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2368D10EB35;
	Fri,  8 Dec 2023 20:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637010EB2C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067282; x=1733603282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cbC1hQwgmpRcWoNrwxAd9/SDe5hO/jS5DkD4kBSu73U=;
 b=H0LBL4F/7PMQclST+VHyV2j4WFRcL4Zx9v975HD185zIGaO5VnLfUygm
 RzyP88sNwI3e+E5eIQV5YBIdNfAjLeIrs60cd89Ju5p/NJsDAGub+ItHc
 nc7o1SSD0qFIG2Ytl4lUcV9QwOHJIzL2oKHSJK+gE9daUcgsku1JphYon
 nOoeSSpEjIBggR2nCzzzlyMpjgLfDg/p9q7lifnVmqUbrHwhWAR0POLbc
 w6bAoATMFMQaIZ0XCPD7xkVGARAu0mrWc93K5h6mp/BshMX2tfotzGwf3
 VN3skVK8o/4KxqIBgeSmUcossyCcvvXUqDwb0P9n0TtS851tqf5Zc6QCL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="384870143"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="384870143"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019466190"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019466190"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNWuht/yeS2N8r0ZFucI6NY2o6BSjiNGlsQZWn+zyTR3PQzbA/3D1Et8s0YtbHY4PY/QgvNBCLN3bVjW6a5rYm9NSYgk4/MuPDpfhg6L/NCi1GJfdUdxZKi+YJ8vnUiluSAMRl+qbE8B7mVj4AYiYGbIrlEW5biKoa0/vaRDz9bv8pec24jBTV9cTeAb7PdgI+4v3AemaSS0/frdbgSohiqEkp00Spda755PHyHFe8BmMuXeyfXbpIGzsqxmDZo1jMwpmwLZXFtVEEA4VdzCA0tDZnAMOCiVu8i8I+9vGdylIeKuzVvroaa+hjTXUwRrjaIH+XgAX8/o2wtsTX7GFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0v8tjljY/7rZ8eeZDAEaF9FqFtdSGORASv4OP6jv1s=;
 b=dFeO6OnzzAUiqncOQH3OKOKj2X0lchKJqixNZNT4FgKlCXj7AR83uX01gD8LlhbESIVmigXGNrO8Wl0LwI6pak3Q3KlFuKOREPMo0KnV3HUdmqLCCc5lJ4Zo8A7gPjKauUucADMF3GoE4OfxftWiRlHzkqIrUg5X8dTj4SaTAiQUHcMj+GIT0IrxQZjYSQRUZX95m80kQdhwfBbmck1M8FGoiT+lyyizaRD671DohFZKRC6XIK6KxHa4vRq6d6GeGP4pBH1QzFWG/4m+7iPdwvskCEzlNtxssV22LdViWZexT+nNK+s2aMWr6OHz7oYHRbdpHM4J6P99OzpVXMS0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:27:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 07/13] drm/sched: Qualify drm_sched_wakeup() by
 drm_sched_entity_is_ready()
Date: Fri, 8 Dec 2023 15:27:17 -0500
Message-ID: <20231208202723.918082-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b2af0d-cae8-4c0c-0d22-08dbf82c2409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44Tvni5mZz5z04efqLiEOPowNT+TaZtUH8rCEofq8Ub2ZxQAYUTWyhIW/voSMCxq2PzABVK3mA6stBUdEIfvkDbl2DeJ0fT3iNiH1Uwb/MvrvydeFaFplOB5ZRoLKo5VKyXWJeocoRng79DJCM3Z1KP8BcbC/abItZAIoo8ffAwP4JIjNZptiA2RU1U+FiFt3Ghco+PlC6oqulif1JgsGyZ8qqG8B+xRoo91iwJkxvud2elC5ta9HqksFHMp9I/rxeaQzRoO+LUrCFIYST1R7Y8eG5MytjuIe8gErHzVb6PCuZXnrMDFXo4dO2bDbWRxOwLtT19qitNqPvQQGhhFk+h2aDpghujViNvw8jFR3plF/xFMq4Hf6MpQGMaWy1cKl5+6QRpKs4bC2GQwhx7FcZGCUai+Bip79VjeyIvlIfwif6+0JC/hoajpBbdMrEg4mhROV6ZTbMyv2an8RWbfuEAQ6otBNIHd5P/5+3z3NcngAfIRHShOXDfYhp3VIs9csy11RyAPgK5lVVrWUZ4iF5MHg8ON16mQb2FtrBVX/+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IuAITZV8Xq9BwZbUIc2NqEoYP9+Nm/rNeS8EbvuEsXmtKnQLsYSc3cPEMa9w?=
 =?us-ascii?Q?omLe1c02Ob/3W6PdknjyjaWzyiKtOtMG5UpErvIPHuryEkEB8D3nvuCLfAiX?=
 =?us-ascii?Q?+MlvZGzAh9N61mxjVK1qNzPckCUElfC2hTeGhHD/U8OAzYdveBa4HOzn+My/?=
 =?us-ascii?Q?fyjkwyM2hHirqj7i7q1jVKyNJ+HE1Wv+agYUNle6W9tN9NimnmCM0N9yA3Vs?=
 =?us-ascii?Q?k3EyWJbSqpc8VMDq/wZaWUhLVnvxQuoMaphFiCvpaCi8UEHHP1ndll7X0yK6?=
 =?us-ascii?Q?9ggYv3qPujCgqQ4NP7C2oW95FzHtxGET7ipRHds9bBqurBujln0xavyhKeAt?=
 =?us-ascii?Q?iN9zlajP8s15OGmb36pp+131qb+gjN2Pg0q8gxyRa8kls+s9fusBfRWcWMbh?=
 =?us-ascii?Q?I90jaC7s6KBxdReFnDl4DkVTS3HRdC+lhWUNvzDcg6ML7c5CiWsoSNmb3W4c?=
 =?us-ascii?Q?uJq/P5ZrGZCY2aiu4fwWa4cAgA8kp2q2iR79jIHRP1A8LTFV7hCFBhM0Gek/?=
 =?us-ascii?Q?czjYBSRjMyWsvG0NIweI7o4S2YdWZzhuYXEkpAymrfip4wFM0edRmzvAglAN?=
 =?us-ascii?Q?zC8Tc2quRWYvYz8NVitLmw07Lfcomj7KGeS5yeS/9TqernPHbdcvE2P8SGJD?=
 =?us-ascii?Q?mtBoV8lyrt8o0YOZ0HhrdzOoYpKYoKkwBAnZsbTdZC2QCgtccLpkwvEI+k2v?=
 =?us-ascii?Q?cm072xmEX/xB20To6eBepTACdra+i7g7fp9eGIcpK1NASdOm7Hzkfq3wQIVO?=
 =?us-ascii?Q?ms7KBCvDMyarRAiHbXlnMr4ci6vDPZuEvq9n7iyWG2xKvCA0ryR9S+cV4Lu/?=
 =?us-ascii?Q?DlxAUNwqys8Dze+KBYqinH+ecS0d+MnoGCUYpT5OgAiSfnlElpv+4yZI+CUk?=
 =?us-ascii?Q?MuRgLviYsD5T7oXj9VBxFtVdXgjgfbnW/NLRM26cdTyX1lJq4utwceAGh3G3?=
 =?us-ascii?Q?acbyKbSn+jX9uwsHExrmMH/2nrFZUy0OvVlPTEqb5lMTn5CJwOWLublcyGBG?=
 =?us-ascii?Q?YDcGlHpMqQhdFhfyK5UyC9rHF03vsOxrpO+v9R7DSJdc/xc617CjMyIagE+Y?=
 =?us-ascii?Q?bT6qY4Umy9MI/vQuki2TFVXDUivUBrKDwaE3bFlkAAI5d0id2S94nbNG3vhK?=
 =?us-ascii?Q?GuCTRyrjdbl11VPbJKEwnQlbSKiofo2NWQSFvHCQyIvLCx7NMERxNiEP5pL7?=
 =?us-ascii?Q?K1Lw4d3je2XBqiPXN4YbB4/Qv0uL5SqBo8eGxWLVhaEOOgSUr7w2xWV9vu0H?=
 =?us-ascii?Q?elDoZcIjyYnjqYegAh6Dy31X1vXrHpFZ+U6pxHyyd3S9Kgl3sohxB7doCySV?=
 =?us-ascii?Q?H9nb7VEdpufAwb8hSWt90W3Dcnu2ID6zS10nsJvocdYe6gc0OVC+xXE8VJCo?=
 =?us-ascii?Q?d7eKEbyJpcUVirgLcd6x7yuj1uHsErclLBE1SjOHHYFtrmaoy/Pi6RZ42ff/?=
 =?us-ascii?Q?ttrZ9YfHLmLyj2zBJyMyY7hXn5gvRVbR5V4DKZwfK+eM91wab/CJHk58OtKG?=
 =?us-ascii?Q?HXJdSAzBXOV9aoKXfBOeKN+txPjlpgsPcDCty1kZ5s/ONtdmfmwzYgB4uD6h?=
 =?us-ascii?Q?tnOHMWaIRf0Na7nLf3u/yJS1P90lmZFC4JUagbE+spwRP5YtXDg03TPnFx97?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b2af0d-cae8-4c0c-0d22-08dbf82c2409
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:47.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJzHRgS0R3KsCUZuDUKs8q1fSPFcj6KyZ4k59lC4vP0fqeaDvgb+z/zZQft20/VxlB6x/v2+MwZzg9Jcz/yUJQ==
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

From: Luben Tuikov <ltuikov89@gmail.com>

Don't "wake up" the GPU scheduler unless the entity is ready, as well as we
can queue to the scheduler, i.e. there is no point in waking up the scheduler
for the entity unless the entity is ready.

Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231110000123.72565-2-ltuikov89@gmail.com
(cherry picked from commit f3123c2590005c5ff631653d31428e40cd10c618)
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

