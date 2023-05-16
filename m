Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E07C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2710E248;
	Tue, 16 May 2023 14:54:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A8010E248
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248884; x=1715784884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YkpjaPXJC00iqXLQx1CY/jTNSjoRLVX/4483oHjlZCk=;
 b=i9rn92Rl2G1RY0Rfu2bUPrskGDKVyI0R3Qkw2TBaddt+ZbgwK4nF6bCI
 co9e7Wu8e+E5ElZ68yx3CVWHbBtbGM5nZcPDRJMH7bCJdNowj+0t6wDEM
 Lo7YuwrlHt+unMF7Ltt2mj2ovr4cOdStenaoAe3zE3oW8GK0ofYnq/8od
 ULu0dhbAu4xn1aQOJ58ndlBZSdRbB1DB1KTrVa4U4a7PKIbictkrC0Lri
 RNP8P2ZE4IQmmy1S0+5uZIVtMyn4TruRkdFoPeKO703TW3uDoXYzqhULt
 bL1rFWsdERBOsN+ecjHUBGZ7HMx74HPs99rvvNVbA+cnsQpXg4r37ujsL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340867052"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="340867052"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031316281"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="1031316281"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 16 May 2023 07:54:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgnXnqqBYiv4FkT2+FKLt7QAtkp2QbueWc3JCKqEAIkTUUPBS6ZnvYnzWTKt5/jZ5uvRDl5WcbtdAfxn7YED6KZso/t1Cw2CUdVubqWVwF97AcdjrTmQxezcVDsG3IKMVgK7qk3J6t4Cf/it+NC8+5AL+A3V9rya8fnaHXF1WRqo4vWBy/OkpQbaLUrGn8PVLTD8RJ/F5R4KIyFwGiw8M45FXoYxlyLu9wnMm3MEPEgBsJVR4sbJiWwudWW+6stDSnQVAfYrD4yw7ewAS8e8RjbASpiN6dhZQiGwv+BoLkLDNChCVZY7cWAdVkekPKy1Pfd9wEiXrULwywHYe5arkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TACNLghlc+ULnhOfrHdFV69aNHJ6oa0d4/LLwobKHJY=;
 b=l+PBSee8Gm/n3A6J+OLr4wdVoudRWh92XHXb6znebWyU8A009ykCIA3RTFBoX6H8wquSdjXNsfuvzBeHX7uRtHUxU5bDHp5F8FE510cmsBOGbugyMWuXBKX/UUTocS+FRQ4sqczx/s/T+i5oHfJDXdjxetOjDjcnTQfaEu0/IQRpJFy/oXRzl4X6aLSBME9PHDg3MZyI3fMHj/2vMEZcGoKR1dkRxlAG/A3pI372geHJjkS7u//KDWl+hnttQjdTWL5cb3O4yWceEYdqAfOAlR3w+EsUcgY+rwMptQ/usSCM6jIZhN+HtNFGALaV3hfFjCYR9EFz8POKcRa5cAi7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 14:54:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:10 -0400
Message-ID: <20230516145416.1851984-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: f862e119-d509-48d5-c31e-08db561d7977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sQULmiOjzlvdN/xER4iZJ8M2wsN1FEJ0oQqt6LcNkzOS/ifNiPGvg+tol2K3deg24CQARRmPs7eu/8ADl2lBT3ijLEk8aos1ZqEwVAH8xbr8cmN4/uxcs6g3osTsmppuwHOaUbKxfTUkUC6TqN1jBxSPoOobOJ5BJy4HqEPZrOXK0aE95tH23os6MAm4LE/f26r5z3JJzzZr+Lx29Wkar9iVn7bpD/2CShaLpH5k7rjwD4pc0Lwu5QVrE5Lugjxngkw7pNeGXneeQvR9hgWwV+C72spmULAw8KY+nK3dMvVG1XwGZO5QyR1Q3mTBPLdntqZRztmOxdMMJh+X1D4cB/JhXS5ZT2QA+4w4BN7IIv297NrYF7B8+ahCAPg4+/we4v17CGv8F7QvX2yAAJjclrzZ/W5jRwu/rf4yq2vw9EFGgmNWC0PuWuiu8/cXKf5LcfmFsXR7pytpmXg+UY3HgBhL7LHFR2eg28bdAZ2DHASdV9kEJyjEPqWZWFIV2UB+ITd36ctiig+34JiODtqqU0GEl7b6BTjlMBAICbN6hc0uu6LYScUSj/k8mtxNVvm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(8936002)(8676002)(478600001)(2906002)(4326008)(6916009)(316002)(41300700001)(66946007)(66556008)(66476007)(6486002)(6666004)(44832011)(5660300002)(26005)(6512007)(6506007)(1076003)(107886003)(186003)(82960400001)(2616005)(83380400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYzJ4aRWEkACmps1kbi78n+Nsdn8O8NJRbehoxxoO+LPpeDoKtOt2dk29suf?=
 =?us-ascii?Q?XYY6HwGiv7NNZ/U0NEpD189HgaZbdG40CL2iPc+4JPwfJwearkUOKDEVZCAd?=
 =?us-ascii?Q?PP6BlmlvfIChjg8WQ3R12uwol+tlZeuu5ZDpwNw6C3/exn2bc+q2mFqjLCf4?=
 =?us-ascii?Q?oU2bZKcFR8Q6Kw5m5ELZlU/LSORQEKGaBn8X2+zAd1R86yCwU3Jciyj/G/JW?=
 =?us-ascii?Q?GPedRI3bs989j+Uf5duAwA2+kdSr50D3F/WolEZOXtd8hG9NOnudRrhJZIDV?=
 =?us-ascii?Q?ZfYsxAmB1AI17d6j+DBXYQ2f5sowUH1eSNls+mnKyKQeFaoshTF9irKTJsfC?=
 =?us-ascii?Q?6w9/XSQFPXjOKa9UagR8UqsoF1QinAZ8UjFDMbOsqtKh/BGk2aRJ4nFcdYrG?=
 =?us-ascii?Q?IetPhmTJ3JNGxL9rPLLA4N1wzvDGbGRuTjQeWcCUsQwG1uCer126tG9OF3/K?=
 =?us-ascii?Q?jABQ3f9C18ZlJ4iphNOo74ptipobwRg6dj+npnPnUbcGeocU7Ppiloeq1SvK?=
 =?us-ascii?Q?TQgjBUNONdfTMqtaBpCLpOfHFcvp6pgCIHFHTgml4pFzWYTqMRkYdbMiSpYC?=
 =?us-ascii?Q?98rgS70h2iFBYon3nQf7j7OwhLNnrjNS+kfQP+/dZ8Go/PAzsmLnnv9HRUxq?=
 =?us-ascii?Q?nf+OQLMyaH43oRaOpoxeypUIId0Z/lNjD9Rv7K5aziPmx+zDLSidksgV//mQ?=
 =?us-ascii?Q?5AEl5wzhhYNT0njRNIDMVzMiCK7ifksv64B2FshLtJWLPjOu0QqM74CmJ1Wf?=
 =?us-ascii?Q?Tg67LWIIIKZcqdZPvc33YiBIYrWJAeFNes7QiSkHxsgdrtixOLQP6DQm5V6Y?=
 =?us-ascii?Q?gTDT+HN8UUg8D+J5IKGKjiF/boKOiR5fEcmNB0UsVh4lFPKYHvyutBscmkkW?=
 =?us-ascii?Q?/GcqN3ZJIbFDVofy7rwZs1fTmTniyc6QaQpBcoMEG9TxWDw5t6SdJQYUhhIH?=
 =?us-ascii?Q?X+v3HN7u2SspVosxg8SdIoMp+cXbczESbh6mYVKReZ0C0CJZaHjEWp0+shcO?=
 =?us-ascii?Q?IZu/iskFAIMZ/rKzn2PK+WxmG9cMo3dkzd+31NE9L0oWatV+FGyK+h1mHb8q?=
 =?us-ascii?Q?i2oacKZTn2KUrjvtUaY05SXj5VueWdrwVf3uc+C181ZsLdLa3xPU1zyqNjTa?=
 =?us-ascii?Q?j9a5grghq4xB84dveWA+pptmPBSR5Q5Iy6QXL+jo12r6JbyqrlRVyVsruAlL?=
 =?us-ascii?Q?WRwBMJQYKh8FeEUIBXn4JTChnVnNrHh8Ka4d8WM68akyMNnlx70vj3vGsNsP?=
 =?us-ascii?Q?lTQQrZax9Yh6hOImhsOnc2RBAPoYiZs25EePmL2idrVHiarUaQLlUe0/rIhj?=
 =?us-ascii?Q?CKkRpMOlN+cXFMlc3rbL75yEOxFkSbg0jHPTJIzlY+ppvDSbIT7AtkDWeRny?=
 =?us-ascii?Q?o3i5hFSGjQxePpDgM4lFWgaXvtfnEcVxBXxTk6VdyaJt4ed/jPwlVu2ZExjK?=
 =?us-ascii?Q?uOsF416pr+WQfBXaC/38iKumNmR8g1/D7gd2TvQXE64q3/P8yNtFB2fRQb5u?=
 =?us-ascii?Q?s/nSB1yA6OIpgq+3R4Wc3XlptbUtPNvLXUrRRWg89s/sMlN8+68faLc7baiB?=
 =?us-ascii?Q?D2OjIaq1rKZY4Wyb/6axy7vwyt5wWsFXVMKJ2f16?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f862e119-d509-48d5-c31e-08db561d7977
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:39.9181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utkzNxC/t075W6T1RIphUWQqRFbthbzHEJLZLQzTek3RArtdH1EqLE6hKj/gdNXnkVXrzCzd8FQkIaT4Vry4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7702
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 05/11] drm/xe: Add GuC CT snapshot to
 xe_devcoredump.
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

v2: Rebase and add the dma_fence locking annotation here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 566764a41c57..59a617a0eaac 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -11,6 +11,7 @@
 
 #include "xe_engine.h"
 #include "xe_gt.h"
+#include "xe_guc_ct.h"
 
 /**
  * DOC: Xe device coredump
@@ -48,6 +49,11 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 	return container_of(coredump, struct xe_device, devcoredump);
 }
 
+static struct xe_guc *engine_to_guc(struct xe_engine *e)
+{
+	return &e->gt->uc.guc;
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -80,6 +86,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 
+	drm_printf(&p, "\n**** GuC CT ****\n");
+	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+
 	return count - iter.remain;
 }
 
@@ -91,6 +100,8 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
+
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
@@ -100,9 +111,15 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 				 struct xe_engine *e)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
+	struct xe_guc *guc = engine_to_guc(e);
+	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
+
+	cookie = dma_fence_begin_signalling();
+	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	dma_fence_end_signalling(cookie);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 52bd27ca1036..4e3371c7b9c5 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -23,6 +23,10 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+
+	/* GuC snapshots */
+	/** @ct_snapshot: GuC CT snapshot */
+	struct xe_guc_ct_snapshot *ct;
 };
 
 /**
-- 
2.39.2

