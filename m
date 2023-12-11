Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD45C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBF810E4DB;
	Mon, 11 Dec 2023 19:13:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0510E133
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322001; x=1733858001;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4vneZwQkvTKDND8/paTgaOYteiDuGjJPfG2+smaZCIs=;
 b=mUYdKEgNY/TSYvrQ6btOeXaPP0l5yMn87ZXBi+i+HxfGj8NVmWmj1hJZ
 7RWcLebRMu90JpLmDle2DOmCRQGIsfwLIc15DxHZbaYlct73TlbXfaLqt
 +tmmTsmeV7YRggX4sP35oltSmFaf9ASkg+dJdsoIqtcSPC4tmY73XSFAq
 1bjO15V+x6dABVNc1o8BZnRP8TNcPNgrLzng3AdtdT5htdKoNX9CNQt0W
 k7Z8JPMbMjdplWsKpjmmlMhUCDRLz/l00LvegXeZpg/8iBfHPye0WRDa8
 pKt+m3QSzDH6P0n8Cd9ThNA15WNLgC0dMdabpqK2JQJE1XUvjD13HHLiy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8058379"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="8058379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="773205659"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="773205659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK53uwIn7Ag0EdeQ4h7Rqwv3iK1Segy2zqJfQy4AgASWR2fQq/m2TMjcr5TDAudO/Sh42acC0D7+leoqd/R/zzwNNd50U3PPSGzCh+PaZrQV3XOzyKcLbAbO6qGi9DLtlCd+1TL4YrOJ3m5bp4p6zUWjzCqEog0eCSnXzJAddhY+UUCBc0C0d0VDC8/Sy7mk1KUE6tVImAhlWwF9avgiEdjMUiOosQB2W0QT2dQ76ZQBgmNQgct4iR0nV3r+7GNKctCOa5LzMxmdgdVQne3ahDrYYm1yGXcxa1Hs4Yy+KYztOB+wP1xzbx90NqjesFVLsDF2pUigXCkzT7Wz8MWsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZPM4WJPXrGGGa2CkcPwxpjiSipFEZdoF9en2CIT4YU=;
 b=lVMIrLBtwCshqkbhZ5nogXMgVsH+9titlffcJj2wyKsUsfoyfe8qYubN/BHtsP349p4WjxhLOwm2D9/X+T5veSappj2//S6Q5k8Y1cgz5AVr8m6ihyUuarrmHmX+BgbAGzEykXRGhHE4zhQtu0yb6EXHURt6rvohIVfjDQoroV+QS7Sy0HM7/UzYs664U2gc1B3DYZA1BgFHzdkuXl8my6VdONT7aWO2EFCCiEqXneWtJAVOpX8rYVjvLOimPZYhzu3ogi4CQz7pqVPN1HE2iTm88G3rfQhLWex8PKpmjlv40KTuLixv7EwGrOKh6LNef580lhIv1hBYsgwQji6PiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 19:13:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 02/13] drm/sched: Move free worker re-queuing out of the if
 block
Date: Mon, 11 Dec 2023 14:12:55 -0500
Message-ID: <20231211191306.1069362-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: a52118f1-9f7f-4028-26b7-08dbfa7d38eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3J1eNT0v7PRSocp/7I3XaNMiHhN++QA4jzDirREUdL6YS3YgsfkIlKrplMsLPxbG5OeeNNoW+m/JpqzVVfVf5rethh4WGZgHGCyFlB3gMEPZMV5qfnSpITr5YjqDjfsFCJ8XWjBF14wAa0yu9PbxgartZpBeZapN2KwfrPF3FoLEBQnE1EHtuw57SlI1+mVST1YV0hGA3HLpY0scki7mDtUWixNjhPchySX450y2za5mu+JVfPaGsSFJiQ+PYI5OWIEZ5VDpuijqHOA7RXndAUP9+CPzzGm905D4kFdGnyonnoL/5vUkmS4ajwyVANwPXJJJiiH0EGPrKEQzaYvwYWBiCwGNPfnoyi2duNDmxI7/o1lss42GkVcMzf1u2/UlpXZkanIhUIdIANDJhSWNI6yj0pgWyZU84dFl2GdM7ROx6y0zTBNOsit1jofEhrbykyh/RtosGCgcGu/xnmYZIZGUHaHR+PMVvMGLJ56VhuJpt8dxIRVZBH5EIDRYjRdLzTD55Zhfu0Fd2DlUDp42XbUy9PldloSVQqb4uLJ2iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(38100700002)(36756003)(86362001)(8676002)(8936002)(316002)(5660300002)(966005)(478600001)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j0RLG78yCR8xJp5p/91ZWK5VETwqMwImIHVxDoZA4d9B0Bp0tw5lkY84Qncr?=
 =?us-ascii?Q?tuH80c7N8dLgL8bsQTRZEgA3R8LsmLuGRMZ/dpEqu7WeA7kVETAhkyLpl3ZQ?=
 =?us-ascii?Q?Y00rraeLTBy1V5EjPNoIJrSnLRVe1OCa+3HFgIX0av77xSnMEEllK3zjvILT?=
 =?us-ascii?Q?aQB5K60RSiBxOpSu4BQ+VfX0zpeilX1VST6PZ1HGYipud4obr9u2w0LLfpvC?=
 =?us-ascii?Q?EhOwFpZu6jWU+7qA8OhCQYIJ+fW4IFSIGfYsulnpFHRJGUwxIUnpmCLMzqms?=
 =?us-ascii?Q?Vt+Ac08SrHfuYq4h8itF3FzKTNHpLD36ctacK3vqwdGhcUCbI+ioCLGfSKzh?=
 =?us-ascii?Q?sNnbcolMrgZMcv8tJTnwwoKgWPAkEFSdtYnXKEb3Hyj2zaE5yZ2eT/bR17KV?=
 =?us-ascii?Q?tW8wua1pTLukRjJov8oG0fu+UpRI92Yx+obQWkemyro4J+Iohf0kmJyV7t1G?=
 =?us-ascii?Q?mSAPG9yJC8Z3NT2nBAncdsRMYOexctbNZzOjkVsWsHxynYakrv+cOTkq5gu6?=
 =?us-ascii?Q?XuB2QXFqQgXpYpWiLav7rC/OeVhnJGppIK/xrCiHFbIoGSgb7+HA01y2RXUf?=
 =?us-ascii?Q?4dVdzUGWR1GdDd6Ejl6sadzJpoxXNcfEDVyR4QufeEZ0uxvJcsrI3R0XhpUL?=
 =?us-ascii?Q?mMewHMvJ/k66qC32TScXo6n4BoSlz74N1O68GnXx5BKCm0cD3k+fq7g0mV52?=
 =?us-ascii?Q?6iIGtMd1jNu3SYkZ/PWfQV9RzOEk/M7uhMvN7gS/hXSE3GtAJ3BCAnVlWh93?=
 =?us-ascii?Q?O45dLO7WsqeXCZ8z4rYwUbAYUPC6I+LqANU7fktzZ3ou2gRuC8t3sRdP8YTf?=
 =?us-ascii?Q?LLp5wH1CMQ04s6IPuHccqsIThKVGRsVJudcwMS9y6oC26qGN6T0X1AumnG6p?=
 =?us-ascii?Q?Y1rmNqGwgv4mDdeUj7qqg2Zsv3yX26eHJZidxovR4UbstgBxRA6b1kniVQzC?=
 =?us-ascii?Q?72fNDfdkIIX4UFXarl6hR55yWhWRRFs005UI5jCmbyMfpTF1E9dbDewDcPto?=
 =?us-ascii?Q?xLZWSQcgMVfT5+ellYRIO/73I6NCF0gP+bj0Qz17XR6rWVNN9L1nN/3to+LN?=
 =?us-ascii?Q?Nih252esJ8EqeJBW8fPD2z/WQ9lFKZg28ttSlfe+d7Fa5eIcP8n9mdfUXrVD?=
 =?us-ascii?Q?fW+tlBlalwCSNSjKqPC00BWMUVoDV6T+1TWxKcyK0fbBshbj3hc8r3IsrK+/?=
 =?us-ascii?Q?PcCzTe/DPMB/bF5J/OwLaFwNqCqgOqivprl6gLmJ271PDKkLBCcvxXbliZyb?=
 =?us-ascii?Q?M5SbThRTbInUUVfoG9ELcaWW0pprsX+EhrNoesQdc9DUDSLMgJaDICvpOCT7?=
 =?us-ascii?Q?T3v2YSc2Vek9Pb0w+VdiYnDvkt3bt6F38qstBvVEYUEkqbldDzGTJvvvpvMZ?=
 =?us-ascii?Q?rNNaXu3RpxUIxbLQMHeN/KWivzGRIVTrBwuYJaRkAKKLDlQa8fQ7N0zU6Psg?=
 =?us-ascii?Q?awem8kjiEj+C0JJETCpJufmjTKRm3eaeMxdAdF449357cnZ/Q2pl626+SmRw?=
 =?us-ascii?Q?gcdmjYIhG2OJxfHpdPh1ulcoCVWazA3enpGqQktdhwiLW3sYe9sghFrTkm2M?=
 =?us-ascii?Q?0oNzCLC3nP3ipMXZjO3gYkXp8LBW/gqYG3yHnR+N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a52118f1-9f7f-4028-26b7-08dbfa7d38eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:13.8092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xz5KBB3MnPt6ValyQ/z5rN/JSCsrElZZVwmwrbYZ3kKCw6//EPV2g7a3LX610dZCjg0Zu8Bwve6VzlbzO0Qixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Whether or not there are more jobs to clean up does not depend on the
existance of the current job, given both drm_sched_get_finished_job and
drm_sched_free_job_queue_if_done take and drop the job list lock.
Therefore it is confusing to make it read like there is a dependency.

(cherry picked from commit e608d9f7ac1a94a4a63d1ef2b37dd80669ad828d)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231102105538.391648-3-tvrtko.ursulin@linux.intel.com
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fb64b35451f5..e1658030613f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1065,12 +1065,11 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		return;
 
 	job = drm_sched_get_finished_job(sched);
-	if (job) {
+	if (job)
 		sched->ops->free_job(job);
 
-		drm_sched_free_job_queue_if_done(sched);
-		drm_sched_run_job_queue_if_ready(sched);
-	}
+	drm_sched_free_job_queue_if_done(sched);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
-- 
2.43.0

