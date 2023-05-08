Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11128C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38F910E0CE;
	Mon,  8 May 2023 17:07:20 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C598410E2D8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565638; x=1715101638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7iqpRT9aWTenZneGA1Hsu3LG/Ilo2eiBa/EgDsghdGU=;
 b=mpASYLlawPDcVWE2BaGbM7mzvKVFaYiRv4QyEwJkWp9CBxp9w7DcJMjo
 gfDHeWDU9rHKXRx7N23oIQoZ99bCtaW1Ot7p2BB6minEIMk1sV5oDCQZ0
 ndP66f1SoPM3R3tlGZ64tb3AadCxBhw6cJNnaK8NngCpXHmr3bVcL8TVw
 4c8JmdUFvGeRWBYMlVHj+a1iTdn6+vJi/otygdVp/OAviLzn7DNPn0UWO
 uSfRPLSdQb1/7Jy86FSOCPobsxpdWAg6fcPhT7BbCevtBKfIJt1+JMSv+
 chfTVAd3ehIhpWtNWaar823Ft52Pp20Y12yuDo+wQ4SNwfOhqS+RX6mTU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347171439"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347171439"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698596598"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="698596598"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 08 May 2023 10:07:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:07:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:07:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED9hXfcgmh1WMMFECZgClUNRSH0YwVOUef3erkgRfsrbSvKbKeXxkn8MwqF8pjS3SC5iEODhfv3rg8/Rc3L72tbRcZddLTXeFhRdfc3BotYnxWrG4dpkjNg0FW4OCEZtPvKCJuU52eRrp3JDLZVoZN4oXRHzmgMTwxmzqnC8flOhn8TzhrmfMozFsr+EGWUtLR/O47+zmeDCZpuH4Lw0/VewmULw1BS3iPULSom9on/0X+aYcShNc1rrfEVM3RSvsUdRLWmbn0rY7IhmXfWPlRbF4Mk3qu16ui/p5tYT5+uKXBZ8OB8RKPbcS65+YkdcC71E7h3TuzMvbQgO+kUtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+Gz3nI24zyPL5Fz6rHkZ9ksaMGvtlJKd+LVML+YiQ8=;
 b=fO7nA5fgfEv88QW1pTWZ2gbhIOlxJqcgla8Q8aqBIYrxruAPervHjD1ZZbx4JvfYc/M2eMNS/EKJ4dgILwtF1IUQyu9Z2zVpK3MKoGCP41prkFONBp1ywif3EYLqRzvcesXr4+p8kh9ruoPwOtIbDAAehnKZGUaYgJlIBdftrJPMiAe3oacgwAJqyw3wnuGgTB1nTe2ZJrzJpBgd6pg5Yi8AJkCWl0thtnvR3unafQhpgFAp9YFFB4r9Gw0I60H1iYkp7GQsUDF3nz3RiA4BcDRToqy9XbmxOGLQSyVYa6oLJpLpoJ5+YBd6qzsNATwIBCIR/XuNZ56SLJAtlexK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:13 -0400
Message-ID: <20230508170616.1289914-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 184b2b65-2a17-4bbb-f356-08db4fe6a243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HOJN9xe/rM9ZtnSlTJg2Mo75xuoZ6QNrpuWpNuW1I6Tbz6O3PUk7BacR+DLVlinw8KrZSqZCVn+W/lChk/9xQXyVVt3QZHWlkRIpb0TcabvfedXjKQVYAdT2qYKmJDCvT98NyGMvLBfCGKh9v9foKEhBUsUrVd2wW1Ed477em0EtG48a5kq76qdsEBO/LGf04CTTNcu4ZSoJVYyLVZWCxHR1wAE1gB7HKDMjSUXwzJF9C3DP6udLnQN+RmMKeKqo3B+cLma0lfuFTVzyhq5MGN4GYtlL3bPuTqMWg+HrtlnhQorPxHLUHA34flT0p1yZbInDOhIrfYVaGTUOcCun3jU2ypLTuhPK2iiDCOCq/C712oW6HNwwqOQcMDa1Oxb4JrW7B/XcBLG9pF1LSe+KNS8IpDFAXgZoPKEj86lQJn+iw27ZL+PgtAmThmuzsqxOFUi8/W/spPV1OAyqnw8LjLRn3/MuKAf89kV2+hTM+/9I1F/wHzoYL/Fyd2ExieDpvTODSGfcByvjwz0FGEM9nA/MKy6pHnnIaBuFff2RJks/5rwCPe5gz0dMCuOFsDf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(36756003)(38100700002)(2906002)(44832011)(316002)(5660300002)(8676002)(8936002)(86362001)(66556008)(66946007)(6916009)(82960400001)(41300700001)(66476007)(83380400001)(186003)(107886003)(26005)(6506007)(6512007)(1076003)(6486002)(478600001)(6666004)(2616005)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TD9Jt+zbJuI0AagajRzGodjaCJp50Hq7gyOw9pwuHr7Dl1YbAXwwWGCgSbFW?=
 =?us-ascii?Q?2D01hw0fieuPuOkYtapdYSl3uqJwAyvDp28h+Clv3jI7G8dCLUCDbT+J6xfB?=
 =?us-ascii?Q?KfCvkXWDKxaKjzv/sb54RS7y8eXGKdfOtv7B+w+7/GSJ7pkc5OQqXuCebOKb?=
 =?us-ascii?Q?xrH0dYYUd5E0l1o2RYTaDkt86DIhwuGbMyQyFVs210hhZmfBnHjUPpMTNDlH?=
 =?us-ascii?Q?orsD8qFhiSJXPHJXH4gtMq9T65JKszMFHrLoRCb6l27RgPIm1lT5cWCVcDsa?=
 =?us-ascii?Q?VKYJh3xrw11BX4apFc1716eBxr+IdQZSjCeteY4b0sQl8ejpiuSkuZr7ceyp?=
 =?us-ascii?Q?1bR4/EXWawNepfqbdiii8O/h9J4lla+FyA+yvMDHrDXUbCVvesFd4wDwfIvR?=
 =?us-ascii?Q?bwQmi0ZDHToEwTeBTUi1MBuGtpId4hvMWPcvU1+CjPI4O49zsgibgr9SbiCx?=
 =?us-ascii?Q?+i01TGEgcZdd2kNsbo1IS7oqnK4ch2Yvel3sgWx/c4gpRspDpOdFqCFu6Vkb?=
 =?us-ascii?Q?MdlqFtEmnQptNkFUCGFwprnhAUgG26qvg4zl7BTxtkUnJMvDj/ZGto/WkuN7?=
 =?us-ascii?Q?s6bijBD66Ga4TeeEyBDXPf7kINV1GfE4Gm/ejWw8lYEJbFp+kteIkgm8ZJB6?=
 =?us-ascii?Q?F62LjZokhDy/eXVrpZTHYnhT/+d9IpwSE5+4LB57lKSnC2TwyrYY6NeK0w8F?=
 =?us-ascii?Q?JRCg2bq5ZzUOJLgQzY6aILjBFl3s1kS/eOBMVkivz8rHEn+bQPWFU1NPj41q?=
 =?us-ascii?Q?7FZExAcRVoLIVP8JKHawgTOVVRZxXQomjAOc8nb55s6MqtyYbKUB9Z4Atrea?=
 =?us-ascii?Q?OmfB8LekKwpf3wMIPBZodAxXmrCHVbenHMZ7qftSxeLfRoGOScVCeiNzTO/0?=
 =?us-ascii?Q?TIYWqgP97kC6m3fQH9l9Ycer4+suH10TdTI1b5Ts4DOTWO1PdRep3eBZKKU4?=
 =?us-ascii?Q?7zM0mwtfQtizerrDFo2Fxp8Mvlwoxz3ROKuLYY23/ShBd9Ib+wtvPySJDbAd?=
 =?us-ascii?Q?ykOwSmiVY2b6APG+kIZQBE6IOcHFP//9YoCqeIOiWATMRci0j2ZaezHx/ntr?=
 =?us-ascii?Q?4GdA6yRVo+Q7xeb3lyU4E8BjibO1VGmeOAy2BJowg+T0HYsxZKLUvnpZPpVN?=
 =?us-ascii?Q?RHXMxnJmD7QESKRJhjaUw6F7UaF8xkHFqMLZjTnBg0qbpLvTE8cKEKJQmekE?=
 =?us-ascii?Q?lv99aLjeO2BvS1fxMJnat+VpgyVmBSMcv3bwFKuMSTv808kMjySiMhSg5NLr?=
 =?us-ascii?Q?WtRk6DyNXHudqzAaplKCzOsp5DmnlzQsVncJqiTTyESUBD0yKTKyVxcBYQ1N?=
 =?us-ascii?Q?MLpl4mZyK21WsSPffyO/hi/0eFucsWxa25pyocjZMz9OpF7X4TGqhYF7FUpe?=
 =?us-ascii?Q?QGlKlWhP0nIKSIkGBiNTTQBZWleWwiXgWwm3UigePy1Q1jELSQsiOjZ2/I1b?=
 =?us-ascii?Q?nA8iDJpV3GDJS1PhxbI4eIVH8alNN5mG78d5LyLjKvv+BTW7cdHhHoA4Y1fP?=
 =?us-ascii?Q?1rb1Xf3GwfQz+RbC6mXVYPGQl52s/IBowRu7RdY/M/xuRWwbBYF4MhJWk96H?=
 =?us-ascii?Q?NDd3+wSo5BSAdtKcY/XYGTtiJIqdKhlFW7FxxJ8ohmhJSSTtCYTkHbj7AmRg?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 184b2b65-2a17-4bbb-f356-08db4fe6a243
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:58.8750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0bFCGd3fFK9FfuRgbrL6ZKj9dhzYFJKn7RnxlDAHoRdjXq7CivdcUKUynRMpDiJjwj3RDf9jCosUKpj/nS5kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 08/11] drm/xe: Add GuC Submit Engine snapshot to
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 7 ++++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 05e19ee1ced0..c17fa0c7770b 100644
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

