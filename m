Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BC5C7EE25
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0FA10E0A9;
	Mon,  8 May 2023 21:09:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC210E06C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580141; x=1715116141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4OGiWVNDMBQ7etcB7IqC00YbFKW22lr7S3hvPvJEHHY=;
 b=S8krJYoPi0fQ49guBLMddPxG0dustzMafrz2A6BNCmIYYWnXDLiJcbN8
 aaW/7f218A62Bon4mcxwn+SXG0BJnoA2eTlWF6hk+6W5uNYVmwllGNtXJ
 qg/kc7pjbS3A9yJTKy5zrgEqS/T67z1owIEaPKLwsxxg/PzQMbaJeOEBJ
 e9rjkJ2Sd9BWve7X5XMLBaz7ojY2JbvWNaJCIZYyWYyra52Nq2IYsGnRG
 WVeqR3+OPyicYWZtBUA4FbNuWUZOKV2MJMr8I1Aan17rZeslYynYPAHrZ
 Z5qu6/JhUqIXKOI63DXU/ta1TO/05EAcoxwp4XHiwyeX4LCi5tBMcG9Oh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347222734"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347222734"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676199837"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="676199837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2023 14:09:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:09:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGABp/2dhp+wvof53tld7u0B/HHujTBbDF5imhjjlw5n89hfkWF2gTo/cAdN1NLz8T04FfdzcGSE1x4Ks/M5c/7vRZzjELjurON1EcH3DUpldpVtCmdX+huJWZMDgTK/tLXoQyCmEfCWql056YdJHkUwn7/5/7/sgB+tx6ZAaAwWoHttU0W37Uc5OKXPWLVP56UuB3N9FxM/mYLt6NXyeLlyf0wSGl/mGLA2ApVorWZIUIKnunuO5XWwO7PC/xGFZ8lSGrE7ZGQFyn6pgRipQ5P06XVBhTa+DTJ0An5pdM2SuAj5IrnAy19y/+dda8TX2Q/vaAbL5ZYdJslneni+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m754hjdiTrTzrq5rJXUZXDrSqxDwJqeXZGLM+whuItg=;
 b=W0o3rzuyQVizyZm2IYohr17FofJraxSg0OpAFPF7ngzh+nUlBYDvRNj3KhjkLoovDQxqC84DhDtqNqSHpO+EAHv8KWjZVq5u9lgYUADC3QPP8yy7iynCVM5i+XrI9DBO/6gxf2gR2rlSymHh+VvGiknzDdbZ92RSBdnDB3AmIBi1yeqECz5Ah3HTE7nTFsxy3kb/WN6GhdJhHCEWsizwpFYzhAfaG6rhfT3b5AL7S5BF86gdqwx32bDxLdXRGFHst/qiXdC+9tnwjPn1VdMfEs63OqnzBXE1ku0fw5myEXZE4Y/eMXNrWwQJtL0p4DQpiIh8HA0akMy1UdTKL/XB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:08:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:08:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:22 -0400
Message-ID: <20230508210825.1405432-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: b48b11be-b8a3-4027-8609-08db500870a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnMSBdXv45BgTr44x181Rj8SnuixD4JmFJkKuCyEf2G4frJ/Qk+IOQ1ThiKZcgI7zuJJZO59o9JH/sjnp1p0M6sMBuETQJpo6Kp1Hpr27ouPKA3qY+Ui7yl1Vdo1sWtyhV0DmVA4vj0gRcDU1yvgre0r7QWmWqlqrdL24Dzjm7OP1ZfVliU+h0iqNuNbRq8GHWfjGQbJbzL3811nerGWS7/UEUz2Az1GSpyKKH1tn2r/ZsyubsBDtSy5blFHg4XWkS8/ngkZEzc7t0LjGm/UrDARE+KnuLYIarv/YqxqDEsvCXo/UFdBaphF6izzV+dyZnySFfoPTarmBD73N+K+IOX3eC7MtS2pA81vFBvL4kxcQoqIAzaWmkE66NnW0a0u+Ufjpzd6RxsrJxHqSCE5w0s0aSNubWWVN9JG21cJ0rjUKINTNmFh7tryeZHAplIzJAx+tmDeNOVCHmf2OwMHsNV0m5UcXYmjSzD25+zAFwVpUs1w0nbDrtCcjpvWTAsYBIylS2BysK3gC7U7Ho39IZwOs/+CjO/5vXmHPD9Q3rT5NQ5lDI3jNxQq3pWLYTNt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xVpEmoo3tx7rGBcVJY9VJFJC8Yzc5r3Mczy8oJJHPKSIx/27MBu/RO2OIfdk?=
 =?us-ascii?Q?RAPNFfHDmeOTuOkkBq2QQzAG+YmzNVxfN/q0/PoqmByPxlUJuDUDROPgKzRe?=
 =?us-ascii?Q?H1RHjnl57zQxX6U+QSUUGvFqSVq1QjywdlxT55KngJGkQzYLm6w+QjAcE7fi?=
 =?us-ascii?Q?P80Gbg2HCsC8C5CqeWHtHtEmyE+IpL9kOZY5DnIS2uASnLSKwvCP4pLsyTJd?=
 =?us-ascii?Q?C3cjFcRVGyJ8pA42kmpd2xlzfSMLrYrvq1eQqIs8VD+xgbKvMGx9Ev/WBCp7?=
 =?us-ascii?Q?R3Kv7RpkoYC7uiqgz944c/Yjp+gekgoum7zU2I1OW8cqUDejSJzc1HRnc6sO?=
 =?us-ascii?Q?ZLnBQWeL+xW+LRqyN7MpmbMvcFd5eB82DHzuW/wXcASErPpdwH0W50mWEnXD?=
 =?us-ascii?Q?jynpkTCjopBCanMAVmL2lPGIi8tMWUzKzJHkb6S9wjcdvNrPbHTEXMlEQn0R?=
 =?us-ascii?Q?Ok91sKdrvbketIkiR7M1V6sK6EGaDev417/fsYDVBa4KYEU9LQP9SzsDEpRX?=
 =?us-ascii?Q?GWRaXtrJiVU4xQWw1/WDjrWePAP6n0iquUvHr7/ab/cjoUZ7z+1fhLsP9llZ?=
 =?us-ascii?Q?IWeMepOBIKhP4r9a9apyiMUR2br7ab87cudud2J4ihoAFJCPYm14Byb99QjC?=
 =?us-ascii?Q?gxWW1kICzagFRBY1gijVKJPghOINsv+N4Pk/avEvF7TU/agQ3JndWkQk/Qy5?=
 =?us-ascii?Q?TYVWjXxu/7ebrl5rZocHdm8ibaCmdRZREnX7EUHYUTYCALt/BftBMtNx+jkw?=
 =?us-ascii?Q?YxY1/YjAuB4TAH3WR9GbvpETU4PyThVqcZCwDz38ZVUJtfYdtDi72IOGoT1o?=
 =?us-ascii?Q?WEq9iK2f9jCkebYCH0WnN10ZhpsfZXxZZgkTKaBwhiCcRpftHihoxIKuLu6t?=
 =?us-ascii?Q?MefM+SVtPsoTJmelag/RLYVCqIr7Cji26tpXVA8+n7DBSkZzj7incJmhtDWN?=
 =?us-ascii?Q?dUAX8vdf4kOYq1nbinN4gPXQuvsZqeq4F/XOIK6/gPG85a5L/pOYK6I5waye?=
 =?us-ascii?Q?vXRrAuMpoSFPkj/SQ34vH4XAb+qOl8F4D99wfESxpPMmuH86mNNlxnPt9ve9?=
 =?us-ascii?Q?gJNgxOVZP4aFsvNQrLr8RQh30Bw2nF4HF3g7Ct7OucaB4FygBDixcxs67MaT?=
 =?us-ascii?Q?KqxO6+wB0+llQNBA8B0Vl5NvWPrHbSmY7300b+c/hUXkyGqzQnSMG2CkGxOe?=
 =?us-ascii?Q?eLsq1Rn4HflFs+UFRZpzbFG8y9bcsoAej8M5PlD8DJbYAtnaVIuKmKjfBh8q?=
 =?us-ascii?Q?bV6GIiPSXzuKGBlOtJWoj3wVY3CNiKwWkCG3l6N7FBczmAHxOSvZjXAd/nrk?=
 =?us-ascii?Q?MS0gveCjCUoAXUeSNxRDDIXaGj3XvIfQdi1uNjEvRdPEbPY3hwrA8UdzeSLP?=
 =?us-ascii?Q?VbgOFNJNIxnRy6Z1zxQnd42OsDCB964FJXKTWbxrKpeTq7RpwtlL01R0p3Q1?=
 =?us-ascii?Q?vjA+P3GiEtIlZl0cZKCg/fLLgiUjtS1y0shMUVS7T9Yepb9YqANEZCNA5Y8u?=
 =?us-ascii?Q?xv6waeTHX5TLj5jFyKVqoyFLfnujQnkTyhB0w8dukwTogZs/25mJ+VT3g7Oe?=
 =?us-ascii?Q?dXtoTg2ni0Y8cWqZdmflHbRBgt4YhgMo0WWlafWkCKm0LCvDzarhU6Pbcu/D?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b48b11be-b8a3-4027-8609-08db500870a2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:08:58.5324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aefwBfr5VmVvrbVPToPO4KBvZgVqrB3W27O/PZmpVWcfxJjnkYr/ktFd+dx4RaUlOQNHz2AILBQRzLFAT4hj/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 08/11] drm/xe: Add GuC Submit Engine snapshot
 to xe_devcoredump.
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

Let's start to move our existent logs to devcoredump one by
one. Any format change should come on follow-up work.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d526d8ec2fd4..b9f343c74828 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -12,6 +12,7 @@
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_submit.h"
 
 /**
  * DOC: Xe device coredump
@@ -89,6 +90,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
 	mutex_unlock(&coredump->lock);
 
@@ -106,6 +108,7 @@ static void xe_devcoredump_free(void *data)
 	mutex_lock(&coredump->lock);
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -117,13 +120,15 @@ static void xe_devcoredump_free(void *data)
 static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
-	struct xe_guc *guc = engine_to_guc(coredump->faulty_engine);
+	struct xe_engine *e = coredump->faulty_engine;
+	struct xe_guc *guc = engine_to_guc(e);
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 1e44d5346364..e055b266af70 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -27,6 +27,8 @@ struct xe_devcoredump_snapshot {
 	/* GuC snapshots */
 	/** @ct_snapshot: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
+	/** @ge: Guc Engine snapshot */
+	struct xe_guc_submit_engine_snapshot *ge;
 };
 
 /**
-- 
2.39.2

