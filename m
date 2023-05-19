Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF9BC77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6156510E05E;
	Fri, 19 May 2023 13:18:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA7E10E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502330; x=1716038330;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=qJxI7BBD6lJgPLthJSDYDNx0SJgCoTe3ImmCT/f8zFk=;
 b=JPw7Kv3+FMTPQ1D1BxIBdXEmJrTJ6Cl4siM/sowA0SUfqtApRTFsAN7V
 IbnsXj6gTpRVUKoOS5fzDXuG6Idk7u/182DgqhccSXj4tG9sD6ZdNMs56
 ZqETkANGXyNJBpeH8IfNk/H2YbjtGi/tLqzTHxWTPMb4PwFKxM0aQaJsR
 bckBw4vJyrmBe97nhq1q6UcQUtEeJBz3HwsqmOSCNnuSFY3rPFtxFUlLa
 uvaJYD6L2jvsMwDqzMML1KAMbjnb94wsYeXPFMd856Fl/93jyftn2Z6Cw
 g3XES3b0HIykx/kJsWxxl/R/UNdkvT2CMBN54+BVwwJ1BzEGpAW7uD7Jf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="349881814"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="349881814"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="767612792"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="767612792"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2023 06:18:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVOu34vT1YO9U6MjvFZ3bKDSkqyelKIvh5DKmcV64KTqyGRi8Mj5otZl0oEkBMYrxT7F5N76magk9AzjTwVo2OzBLaj6YCh7nqxW8XBT2csjn6pMuIPZXk4B3EXlUUpgrn5yGmRq5u4yZd/RWk3Cb/MB9Gwo3p2eEV7dVsp4cSx3YNN53/1UHumFcJUioB9FYwQSLNOrGwfhVFL6Hb3spQZXdK1C2LUUX7fOkHsS425oEZheqM7GFL8TKzQb7JL9IAYog/1oaCQx/yLSBg6++5fBtW28jsVLQmUY3menUsMrMfgkXNcaDbRk4ItYNnzog68q49/tS+FfhZCBOVT8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N6YCAucTIo4RhUKk3R5Hx+o0bUTNBvDts9/5KySx0k=;
 b=NsCMYn9chCgBjewoz6aE9xLi3CKesbvN7xy/hqsIizxtAZrqWYl5TFG9Ly3SqstGU//STcdMZEx5YeZllRX08mVAb7AKDPgSniROd08mkLIG290TQ0+wBSt5aGrFi0R+0bo98MlXF+hFdjKZx9/GpwkbXL0gSw3wl+NMazMTsyUfFZzMKHiv22xlI7rTsngPiZUqBn5mA6/M8wFI6uuGK/RQwqdy2/bqBLnXaN5Z4KmDAsOWJfqBnUh3GZcowiPygf4HM8PQcqMayceQhTd3Z0IyGcp0QeXKHFXv5+SS8PebN/iN2WbI349ShO9RrOQf562I4Zb4TmwZgmrX/q8GDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:18:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:16 -0400
Message-ID: <20230519131820.2020660-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c189876-70b8-49e9-ef51-08db586b93cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAmloOJAkq/vzWc7x9rOdOmUSsd4XQoLqAdNe6kFhvv+OGOGgvyw9l6mrAeMWzxXjrJI5UPBW7X+C3Kiqd/u60bJdINGjGOcGZxi/FYr1POKG/R3Aqql6GOxR1f/QjPDBXeI8B+AMxsl3MU1ECNAoHI9Inmf7hSG7x6Bb6eW5TMao2WoiEeDEJNpySXAOaRKNLsTfw/GHrUUrIVml2ireTQQ/28rG44/V7/DDHySgOHSwLQg1eDWKhEY1nMlPsPa0Y1PCswgozLKZAEigZJUlhFuLjgoSVGdHgnE8v+wZ4WtwhjWSJtpbl4OaJR66NAfi7hxYkWc6lkXF4CtxMp3CqKp6p9UPPdfro1m6l4aksnkztCRJyyoajamo3am7m7XyODCLQE+yj6AetVzTn+nf9r80osYlvVagAqfxa2zUL63OTq/+kiukMTM+0HDeIzo6v1waD5F6f7ZFHgk/v2s93k3hJskzX/+AIZPmHrjgvzVo6PhJCARPjqGcfmE9ImlDE3LpcV8Jg3EwYXKlg7nYxuN3xUCmMehSYtRqrgPrJCza24F+lg3i778RUxZcxn9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(30864003)(316002)(45080400002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wcnpx4S+dnuhIkbIlvE26cNHp7vQy7q+8X9UzFfWd8+rsBO60yvFbZO+77Am?=
 =?us-ascii?Q?4jxsGv33OWFjNFz+/tVkmu/mR34aLKXlzxrMn33YO0m7V7fNiGX+3v5oskLJ?=
 =?us-ascii?Q?vkvMxoOKvXjqnSsJKJcktypEC9b0d71l3lsjXZ2T7Vo8Dq2ukBt0YCn/SuM0?=
 =?us-ascii?Q?zGsNvGR7zewDBtrXqGaQafyK6oMCe7mgZP7HuPJCTJUhTgEiAEuoZ1Ys0jUf?=
 =?us-ascii?Q?mVaQx5vmlfYpcYnFtfqsm/Hz7IHHs6g5dAmCWSARnb65pXTpidehHp3h0SE9?=
 =?us-ascii?Q?+7jxyk71C67VZnqApzB26XytBE+IL96hTJLJLytNi9v+4kf4wOGF29ZOPmOV?=
 =?us-ascii?Q?z6EtYnLxsMsGkuDzMYrDdb2lcok6vR+VEm2dMkL1mYUGuI8MuVmHJSvyaXvW?=
 =?us-ascii?Q?/4C8F2XO0C+gng+Zu807YoEsH8wiuM2+XhSNEn1O+RwGeuYOnaJiMZ7E5Ifs?=
 =?us-ascii?Q?uYSFQrr9yyjuHrOSfgE9TboSwZGgrVWqnrHNGNLMJQT8ibHX5wIRc15U5wod?=
 =?us-ascii?Q?mzjDQvwYgd0rm46wyhFnpci1wor6wMGNjYN2tyo8mbMp7kT1Mc9lZLGumGZw?=
 =?us-ascii?Q?HqCyaZ9UBlOy2kvnn39jmx3iuq1/FWiHq0wIDFlyz7gYbyAckJxiwXyfm7ZX?=
 =?us-ascii?Q?/ve9OpCpfFx5NdhMw2bPHMzC1PiCIdV9ptvDQkbuAOrh6lUWLoaR/gYSb/GN?=
 =?us-ascii?Q?a3pNleZalnnEJAHUiEc7rA7g/Kw9z0kvOzdIW3aXmDQZuJlfQa4ewj/yjRL4?=
 =?us-ascii?Q?KyaM69u2+847VhjerFNzYb3e3Y/CLNgH3S8iEdBEY8PT1a7pdn/RoBbKUnn5?=
 =?us-ascii?Q?dQ6LjoKIXz6FX3euPKyMedCxGEizJrqvtGzH4c4WrcC/EsLM6k2x1SGrDm2x?=
 =?us-ascii?Q?267WrGAbEyzzVJOEV3E2im+fLpBcgszzKP8jUV/4ysPvfLdsLLWCebGj9P2N?=
 =?us-ascii?Q?jIJSvQUR4Vpimp1/7eTDq72y3bK6yuDYUqC16Z/kg/nPx3iAG4HrikGVCrtp?=
 =?us-ascii?Q?8r7ovvpwIAddPYczTW4ZwF7iTZAH+1TM2ufJV+YcpyzX4Sfp0qYtFe2D330p?=
 =?us-ascii?Q?hXznZ9xWlilJXszEf3cqiVP5UTK/5396xKS4sLAU4MTGJknUutA0XSWWxABv?=
 =?us-ascii?Q?mih/76qNaF8ljDUNryiN0crnkzNpJKSM9ZJyxtODCxIlACUkEsBVSTMHG/Zq?=
 =?us-ascii?Q?SKxEWLdHjnQKMxD7A48zO6rYL+/a28N2Gr025AKsbsg4GCS3QBRAILvao9M6?=
 =?us-ascii?Q?fKLXwNpbuc99Sp+aSXuphBM/GrZY5l/FLss6c4lY7k/dtAQ/1Rtk5M8Hv/cz?=
 =?us-ascii?Q?97CHebHqHPHoBD1gR44Ai54cYEafzoJrJWcUk0CDbG6SQt0fqvfK/er7Zyy3?=
 =?us-ascii?Q?IqyWRLz1/+1LwgjhnwqMS4mV3CzdnLb0K7sqEc/gEQlHHQqF7Hefffu9WfLv?=
 =?us-ascii?Q?YqpwaJbUCETslNtnwpa+ESUrpj90uWGUunZb/pmrMKyqPeVufXdHoSBREHls?=
 =?us-ascii?Q?7+xzvudCXKxvbFnveZWYziAxrm1IxIkzfm/lR32hMSrcCo0PbjXHJ3eDcKrx?=
 =?us-ascii?Q?6YRJEHBHsikSd5n6WVGVcwqnJrFH1NhdYmVrNHB95G0OoHODcax0v68W7xzz?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c189876-70b8-49e9-ef51-08db586b93cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:47.0607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5InUxTy/T1t+CvTeKmxFFjYKFMSXEb/lZbUjLDdheA84np4j3uN2lF4C7VcAyuEJwDNK0Y/35lE5BXAg3xk6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 07/11] drm/xe: Convert GuC Engine print to snapshot
 capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Handle memory allocation failures. (Matthew)
Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
v3: checkpatch
v4: pending_list allocation needs to be atomic because of the
    spin_lock. (Matthew)
    get back to GFP_ATOMIC only. (lockdep).

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 237 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.h       |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 +++++++++
 3 files changed, 298 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 250e56ee2e75..cc8191dfdf89 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1596,75 +1596,234 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
-static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
+static void
+guc_engine_wq_snapshot_capture(struct xe_engine *e,
+			       struct xe_guc_submit_engine_snapshot *snapshot)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
 	int i;
 
+	snapshot->guc.wqi_head = e->guc->wqi_head;
+	snapshot->guc.wqi_tail = e->guc->wqi_tail;
+	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
+	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
+	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
+							  wq_desc.wq_status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
+		     i = (i + sizeof(u32)) % WQ_SIZE)
+			snapshot->parallel.wq[i / sizeof(u32)] =
+				parallel_read(xe, map, wq[i / sizeof(u32)]);
+	}
+}
+
+static void
+guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
+	int i;
+
 	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
-		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
+		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
 	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
-		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
-	drm_printf(p, "\tWQ status: %u\n",
-		   parallel_read(xe, map, wq_desc.wq_status));
-	if (parallel_read(xe, map, wq_desc.head) !=
-	    parallel_read(xe, map, wq_desc.tail)) {
-		for (i = parallel_read(xe, map, wq_desc.head);
-		     i != parallel_read(xe, map, wq_desc.tail);
+		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
+	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
+
+	if (snapshot->parallel.wq_desc.head !=
+	    snapshot->parallel.wq_desc.tail) {
+		for (i = snapshot->parallel.wq_desc.head;
+		     i != snapshot->parallel.wq_desc.tail;
 		     i = (i + sizeof(u32)) % WQ_SIZE)
 			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
-				   parallel_read(xe, map, wq[i / sizeof(u32)]));
+				   snapshot->parallel.wq[i / sizeof(u32)]);
 	}
 }
 
-static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+/**
+ * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
+ * @e: Xe Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a GuC Submit Engine snapshot object that must be freed by the
+ * caller, using `xe_guc_engine_snapshot_free`.
+ */
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e)
 {
+	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 	struct xe_sched_job *job;
+	struct xe_guc_submit_engine_snapshot *snapshot;
+	int i;
+
+	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
+
+	if (!snapshot) {
+		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
+		return NULL;
+	}
+
+	snapshot->guc.id = e->guc->id;
+	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
+	snapshot->class = e->class;
+	snapshot->logical_mask = e->logical_mask;
+	snapshot->width = e->width;
+	snapshot->refcount = kref_read(&e->refcount);
+	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
+	snapshot->sched_props.preempt_timeout_us =
+		e->sched_props.preempt_timeout_us;
+
+	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
+				      GFP_ATOMIC);
+
+	if (!snapshot->lrc) {
+		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
+	} else {
+		for (i = 0; i < e->width; ++i) {
+			struct xe_lrc *lrc = e->lrc + i;
+
+			snapshot->lrc[i].context_desc =
+				lower_32_bits(xe_lrc_ggtt_addr(lrc));
+			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
+			snapshot->lrc[i].tail.internal = lrc->ring.tail;
+			snapshot->lrc[i].tail.memory =
+				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
+			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
+			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
+		}
+	}
+
+	snapshot->schedule_state = atomic_read(&e->guc->state);
+	snapshot->engine_flags = e->flags;
+
+	snapshot->parallel_execution = xe_engine_is_parallel(e);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_capture(e, snapshot);
+
+	spin_lock(&sched->job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
+					       sizeof(struct pending_list_snapshot),
+					       GFP_ATOMIC);
+
+	if (!snapshot->pending_list) {
+		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
+	} else {
+		i = 0;
+		list_for_each_entry(job, &sched->pending_list, drm.list) {
+			snapshot->pending_list[i].seqno =
+				xe_sched_job_seqno(job);
+			snapshot->pending_list[i].fence =
+				dma_fence_is_signaled(job->fence) ? 1 : 0;
+			snapshot->pending_list[i].finished =
+				dma_fence_is_signaled(&job->drm.s_fence->finished)
+				? 1 : 0;
+			i++;
+		}
+	}
+
+	spin_unlock(&sched->job_list_lock);
+
+	return snapshot;
+}
+
+/**
+ * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given GuC Submit Engine snapshot object.
+ */
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p)
+{
 	int i;
 
-	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
-	drm_printf(p, "\tName: %s\n", e->name);
-	drm_printf(p, "\tClass: %d\n", e->class);
-	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
-	drm_printf(p, "\tWidth: %d\n", e->width);
-	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
-	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
-	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
+	if (!snapshot)
+		return;
+
+	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+	drm_printf(p, "\tName: %s\n", snapshot->name);
+	drm_printf(p, "\tClass: %d\n", snapshot->class);
+	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
+	drm_printf(p, "\tWidth: %d\n", snapshot->width);
+	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
+	drm_printf(p, "\tTimeslice: %u (us)\n",
+		   snapshot->sched_props.timeslice_us);
 	drm_printf(p, "\tPreempt timeout: %u (us)\n",
-		   e->sched_props.preempt_timeout_us);
-	for (i = 0; i < e->width; ++i ) {
-		struct xe_lrc *lrc = e->lrc + i;
+		   snapshot->sched_props.preempt_timeout_us);
 
+	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
 		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
-			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
+			   snapshot->lrc[i].context_desc);
 		drm_printf(p, "\tLRC Head: (memory) %u\n",
-			   xe_lrc_ring_head(lrc));
+			   snapshot->lrc[i].head);
 		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
-			   lrc->ring.tail,
-			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
+			   snapshot->lrc[i].tail.internal,
+			   snapshot->lrc[i].tail.memory);
 		drm_printf(p, "\tStart seqno: (memory) %d\n",
-			   xe_lrc_start_seqno(lrc));
-		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
+			   snapshot->lrc[i].start_seqno);
+		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
 	}
-	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
-	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
-	if (xe_engine_is_parallel(e))
-		guc_engine_wq_print(e, p);
+	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
+	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
 
-	spin_lock(&sched->job_list_lock);
+	if (snapshot->parallel_execution)
+		guc_engine_wq_snapshot_print(snapshot, p);
 
-	list_for_each_entry(job, &sched->pending_list, drm.list)
+	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
+	     i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   xe_sched_job_seqno(job),
-			   dma_fence_is_signaled(job->fence) ? 1 : 0,
-			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
-			   1 : 0);
-	spin_unlock(&sched->job_list_lock);
+			   snapshot->pending_list[i].seqno,
+			   snapshot->pending_list[i].fence,
+			   snapshot->pending_list[i].finished);
+}
+
+/**
+ * xe_guc_engine_snapshot_free - Free all allocated objects for a given
+ * snapshot.
+ * @snapshot: GuC Submit Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
+
+	kfree(snapshot->lrc);
+	kfree(snapshot->pending_list);
+	kfree(snapshot);
 }
 
+static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
+{
+	struct xe_guc_submit_engine_snapshot *snapshot;
+
+	snapshot = xe_guc_engine_snapshot_capture(e);
+	xe_guc_engine_snapshot_print(snapshot, p);
+	xe_guc_engine_snapshot_free(snapshot);
+}
+
+/**
+ * xe_guc_submit_print - GuC Submit Print.
+ * @guc: GuC.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function capture and prints snapshots of **all** GuC Engines.
+ */
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 {
 	struct xe_engine *e;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 8002734d6f24..4153c2d22013 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,7 +13,6 @@ struct xe_engine;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
-void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
@@ -27,4 +26,13 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					   u32 len);
 int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+struct xe_guc_submit_engine_snapshot *
+xe_guc_engine_snapshot_capture(struct xe_engine *e);
+void
+xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
+			     struct drm_printer *p);
+void
+xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
+void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index d23759959be9..88e855dae056 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
+struct lrc_snapshot {
+	u32 context_desc;
+	u32 head;
+	struct {
+		u32 internal;
+		u32 memory;
+	} tail;
+	u32 start_seqno;
+	u32 seqno;
+};
+
+struct pending_list_snapshot {
+	u32 seqno;
+	bool fence;
+	bool finished;
+};
+
+/**
+ * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
+ */
+struct xe_guc_submit_engine_snapshot {
+	/** @name: name of this engine */
+	char name[MAX_FENCE_NAME_LEN];
+	/** @class: class of this engine */
+	enum xe_engine_class class;
+	/**
+	 * @logical_mask: logical mask of where job submitted to engine can run
+	 */
+	u32 logical_mask;
+	/** @width: width (number BB submitted per exec) of this engine */
+	u16 width;
+	/** @refcount: ref count of this engine */
+	u32 refcount;
+	/**
+	 * @sched_timeout: the time after which a job is removed from the
+	 * scheduler.
+	 */
+	long sched_timeout;
+
+	/** @sched_props: scheduling properties */
+	struct {
+		/** @timeslice_us: timeslice period in micro-seconds */
+		u32 timeslice_us;
+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
+		u32 preempt_timeout_us;
+	} sched_props;
+
+	/** @lrc: LRC Snapshot */
+	struct lrc_snapshot *lrc;
+
+	/** @schedule_state: Schedule State at the moment of Crash */
+	u32 schedule_state;
+	/** @engine_flags: Flags of the faulty engine */
+	unsigned long engine_flags;
+
+	/** @guc: GuC Engine Snapshot */
+	struct {
+		/** @wqi_head: work queue item head */
+		u32 wqi_head;
+		/** @wqi_tail: work queue item tail */
+		u32 wqi_tail;
+		/** @id: GuC id for this xe_engine */
+		u16 id;
+	} guc;
+
+	/**
+	 * @parallel_execution: Indication if the failure was during parallel
+	 * execution
+	 */
+	bool parallel_execution;
+	/** @parallel: snapshot of the useful parallel scratch */
+	struct {
+		/** @wq_desc: Workqueue description */
+		struct {
+			/** @head: Workqueue Head */
+			u32 head;
+			/** @tail: Workqueue Tail */
+			u32 tail;
+			/** @status: Workqueue Status */
+			u32 status;
+		} wq_desc;
+		/** @wq: Workqueue Items */
+		u32 wq[WQ_SIZE / sizeof(u32)];
+	} parallel;
+
+	/** @pending_list_size: Size of the pending list snapshot array */
+	int pending_list_size;
+	/** @pending_list: snapshot of the pending list info */
+	struct pending_list_snapshot *pending_list;
+};
+
 #endif
-- 
2.39.2

