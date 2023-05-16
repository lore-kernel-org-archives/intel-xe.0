Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E166EC7EE25
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DE210E248;
	Tue, 16 May 2023 14:55:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA110E26E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248896; x=1715784896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=psYjkknZr9HZBMqNWIxeM+AGaUgDC5tpQFAuPIakueU=;
 b=LuBGYhN2UTORUz4mxvxo/9TL6an4tySvKz2re8r7IORDqMxCG9zVn8U/
 3PmOwghdGtju7/5DBHQb/DIysiBda5LsOdst1kUNE+FIbrNj2H43t4yQe
 hC5jhrXWKJu15+JR+hYv78ENcUNZdpf8xOXUux3V6LsSw5scalgDQJ+bi
 NPeeElZ5eyVSsOWMLXGO+6OQzcxSkVDppThbmBEW4nNgKzHuiLMzEhXYn
 x0k+6MkqnIgC38uSHWrYiPqssAlVLtPlSmthNxAyMlQOKed9ZlxE+I7EU
 YeOdZswkE9cVOcTXZUoPf0ZM/gZwHnOM7aRRkvFMNOOqIhaAN1ncfLiBZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331114613"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331114613"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875651294"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875651294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 16 May 2023 07:54:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLbW1+3K1QJJChrnNAdAIoyXuZSyxBnfw1OD2iQYjhrWAtgV9KIfZZF0TZyVOF4H+bzW/ah9zVrdoaakzP7XLyw+UX4K+eJV2uVk/cTDV0UtxTVPmRiaZPM2LMEC0eNkHs/8mHrrWgCCgolCi033eJqh05EFe+6N4U8Rmk1SnkE4brP6wgvEj7lLZ7M+Ak+cdcvY1hJD8ZopGbL49hf6f9zGm0WYn7RBsQq6dEnP0w1nUR1eWd3GtGDdvzGhRC6f1UIZtOjISHr6ATgqSnles0pJtTxkrM6WzGiEFA8H9Lm2z9/RnL9CqxSB3ZcSoMKMjnACNmCVGCd+dqYmBiAaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdUxWW/65WqKZoi1EoR57UQJpGHQTHgW7WnFGWbCA/o=;
 b=Q+mbFZn76yHu/9vu9DyfW5d9Wq4qicIEbLor4BAO/h06vspqUG9rw07o7VeibelDqv5Gz3YnyxnqKOfbc6X0lP136YitkdLcSI4JGuojfAVzHburnkiz9jfwpGuWDZg0izpy5Wv+U2/WstIcWkheIcGFGythfEn7Ys+PvRt3Kp+z2iH4FbPyngLssA1GYqo42RxbsmbpanT+FMOIyMW7J4LD4v2iDBfg1DqMf08E0TXnwHO7oMhQPkHxeBpy6QvSgxrAnsYk+4DGqHUtFjFDFRHGKiHJZFcD16DcqUewXF2iDYkLo/A/6GJS3jmGFNDJ4wj2gWvhV2l8YobXw6btgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:13 -0400
Message-ID: <20230516145416.1851984-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0199.namprd05.prod.outlook.com
 (2603:10b6:a03:330::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a484d76-d162-4a7a-c6d3-08db561d801d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RE8r0U4FYIH66Th3MIufVnDl7KQ9oGWfsD9sG1uwY79A2wLuam32N0vHyrHz+jtt8jDBCXDZsHDOWjUDqNmVh+qdsu2XkpItclguJrwThl9g1oE1tH7o4fRtEltJHOxMlNaQInRCWYTQD18hDz4ulL3X2kL/pfkt4IVZ28IB0mVkZKfMuy/MQlEt7XTKTh92+mwLpLWUuBY0Mlkg3YLrXLUu/G4t4LuqEyztS1hQ0KdrjEPHrZ68L8G3eL7h+4LKeYrXOatZF6mMB+0Xbspc07D7InA9y1QS9b3MR0FmSD/NZXpw8aPZPqBNLEDT2P5Lv57T2pX8nQjSMQExjHPHGByU5pirtV+f+06Jj70lRqwtE4Hi7sjXNyDX+AVHPiXR7JcUAF4LnjhTvlz8ascRLGc6XAatD0Tuu00kW7BL6uSPRarv9W1oOYplx4DcE36butug4a21kU98nTzdeiQpV4Ako0wwVNycVHOogPlaSn7UefEO+NDVhGX/cUxdVWdlaDg3l6L73jQh9CXyrEmHrQgrDy6U4P3e0jERQqduzxryMCRn52g/Boi7S6Dd3K8+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgYL3ot72XRSWF1snmXvtbB9PfWLIiKvvAmi0C+tG36DH8kFAj1mlM6Zdpwl?=
 =?us-ascii?Q?Vy+ue41k83Ykvuk3x+2KXUA/0xZjOGttyo4W4so+r7Eos0B2ZQXIVH4HiPcA?=
 =?us-ascii?Q?IOufga+9+4VznjwVJ0yJHYKgvT/TFcRExM23wZO4Qft6fgmJFEq2dbzIK16H?=
 =?us-ascii?Q?E402J6BsKRtftJqLnzXpKMjPesyhQ+JO1PzX4od9h480JWHuKvpecfo/2dya?=
 =?us-ascii?Q?0RQbIkmzP0+aIOfeyAJcgG9M2tT4UX6DAuwupyzvwKoQFJY1Jl8MMtDSTgph?=
 =?us-ascii?Q?rx6fooam/ON//WC7yXRIIxRuvlrJhydiFKfTEH6Tm5o/g6uadwc9bPGWMUiS?=
 =?us-ascii?Q?7jb0JDYUCP/ov8u7Giol/cOFKDqKljtbQYydA63H8AZlMRb5AGA41ikt/sNx?=
 =?us-ascii?Q?eQXjUuCbrY/eIQaIuTfCkHHbRISmrbJkbWja9qM84bfCaQb7QRreoTjocisj?=
 =?us-ascii?Q?cKWie86l/S6JwIp1GDwLF8qD0IPr//B5e+Th9ut7Ekhczb053O5Y4Qw1tjMy?=
 =?us-ascii?Q?AxKMJhZqL0W3FNz/uUM5Jb72wheQpzH7p/fNtTIUsxjSA/yhcytK8EpuVaIu?=
 =?us-ascii?Q?v/feL7y5CFAYpfUQucYaz+c8zswDaE2pE8+xwlVSM179Bh7QUiYNmQcm5mk7?=
 =?us-ascii?Q?iaFquxT6I6yLUNyPmCc/vyEYhxqAv3XVruw/C5XB0V7aCocccowrO2GuXWTy?=
 =?us-ascii?Q?WfbPYrhN4Rincu38AAzF731JfOW5INDqCBPNuCWRyJpO9W6/fwVZ97f5nxl8?=
 =?us-ascii?Q?wvCIA25trc8zmGAxr5/ur2EKRnbaVlAe3+lXveCdjwj/ne5stjb9QyhM3kYf?=
 =?us-ascii?Q?lQBOn56c9ssK6s6QZO4wZ0zOQtPxGSHOTky7DxLB5qTIyZJ8MfhSscR+lFIi?=
 =?us-ascii?Q?4Lt2AXuX3J75SkLsmflJQoDGOGTW1R686tGv92iWml9hVITyqc0OFQu1zLjC?=
 =?us-ascii?Q?SCYk34kNAdP93IogpvvO5Us0IARBoNpkfL5uqBOpuUhtgkoTW8x4vQDtA52N?=
 =?us-ascii?Q?SUwLdblxO0vI9r61ngaXVJh7u2FaLWHNMDHbmFdBiusp3pmtqhnIqYSuZ4kP?=
 =?us-ascii?Q?Xll4tU8UKVSE4OnkgAiyoBmnmegUYvbAV44uktGdbZnTR2ggnUhK6xBqyzXU?=
 =?us-ascii?Q?p17uTItQKK+Gx5dP3C0fzt7UbzPnXdcUJo36oN+vDQgmd5AGCu7pzMZgFNs5?=
 =?us-ascii?Q?Pu7HcDQ6izN9d5Q2R1mCDrLK+3ZfYceS1glgY8vCd0UcSrIC/hu3Qw8ajk0M?=
 =?us-ascii?Q?fDefvGjtthEC74zmloh1uloNYQxxoCNqXKAVFF/wBQp+kSPbZNfNdl4Q0rbH?=
 =?us-ascii?Q?nTHaJLsncNoT7enpQjnGerEtao7outIrjb+On6kx4yehv747KPLSd9+ktjFq?=
 =?us-ascii?Q?9cXeOiS8qT1YLBxAgKq87W82bu3veew10spFUNXLeo6LnslJFpRWqQUrW5Dn?=
 =?us-ascii?Q?1iIrSPSpsL91axRELoBKLWR0SXRExphKPFCEXG2pmLFsilKQCjF9eZpXPNMk?=
 =?us-ascii?Q?ZcTszlo9F0axha3Es+BkcLEAsIQCBfV3ZHcqpfMhOUHQmjIfBvxNeKSu3iFg?=
 =?us-ascii?Q?Xv65Cw/xBkfAAi5q/TfweG7oaWdWAFbIGanG9j7+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a484d76-d162-4a7a-c6d3-08db561d801d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:50.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RUyrM0N6zKfCZ9VMHdGK2a8AQUUURRoqVgQk38CfUO+KJb6yYFrq36CljkYDox/ABkuChPEy6jFQ0+zQ31yzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 08/11] drm/xe: Add GuC Submit Engine snapshot
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
 drivers/gpu/drm/xe/xe_devcoredump.c       | 4 ++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 59a617a0eaac..2da27ce6e116 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -12,6 +12,7 @@
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_submit.h"
 
 /**
  * DOC: Xe device coredump
@@ -88,6 +89,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
 	return count - iter.remain;
 }
@@ -101,6 +103,7 @@ static void xe_devcoredump_free(void *data)
 		return;
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -119,6 +122,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	cookie = dma_fence_begin_signalling();
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
 	dma_fence_end_signalling(cookie);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 4e3371c7b9c5..7c6453224139 100644
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

