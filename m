Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C196AC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6010E109;
	Tue, 12 Dec 2023 00:11:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762710E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339858; x=1733875858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4vneZwQkvTKDND8/paTgaOYteiDuGjJPfG2+smaZCIs=;
 b=HdpH5HoaHTc3HpaZS4cU0jgo+Y+MD8nGIwoskAT97HXHaThcwKER0g2x
 KaJd6FyA4Um6vtYt8XrQMr3X+EtnaaDZyz8yxTNxQ6XrAeCXeR2AQCzY8
 HDSRwhjguqDScPfN8/0kjYcoDtGuuesL26zZD9Km3EwGJqpWIYxhdVegP
 iKDSE3pEcvQ/oZrOjOtQZn9SrBdoEaSvvFPjwagJQx7g04udLJR6NTMRo
 dQOKuQ0nSKvJMPwIxeJJ2F65aGZSREBpe7m7dkaNgu0Jno6r1mDCdE+D3
 QdGFUuxYLst23ypz5otULmIeX4Hh/KZY4oifR4vThCYoM/ZIKCmJ3h9El w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8092105"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8092105"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="723012514"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="723012514"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:10:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:10:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPfc93zFHFn2ztL/dWkI/rJP+NgOjbUaugZjdz2772p8K3hhzcUdRzjIL4cAgf+PYe7SjvRs57jLhN22jQYjCGpRynvYrbuJnc24NxApcBOKVYT+pYEa6ybm2RULP0+lhRV+yDEnTat8Wldw1i1rgLnJJCq6JXCY3dJQCj6bxfXiKTyasdsCXwJzpKFNy4OIZmrcgtKMUfSMMb5psESJ8DYDWled6RJPzUxUjp78h+w9/wi/4E8UQ0tFv99+pxXspGwVPKYJaN5CLN/uKryOjEFEWG3zEDBsly/Z/q/b/+aWmTIxfmIdqne0Hs4hghpakaYPKHwG8IDMJ/nI9sJqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZPM4WJPXrGGGa2CkcPwxpjiSipFEZdoF9en2CIT4YU=;
 b=bfve9X5Z9BG1jgRXrodzYgHWpxSpKGRjFxh7uorzFlzel1oVvTRfHv0THrK25ZxeoHYu62Kq99LxzfGUBxhPDSoMokmUWMjdv7zbybwMeGLL5zTkGFu6kNiU4DKyQWsNtV8MbaK5rgO3eTlpSvX/Sh1/eBDAtHcv9mVyALQgvJAVQIiwdHi/g9hiL+3D4Ep3T6XAEgrCvtuXSvcUkxmXk9fXd++FG8rgC0k0YKeOWGlZ7L1BT+t3q/2teZ5PMZD3zN1OSDiZ74y2UrZkuSfW5wxbX1XVFNdu1982mKQ0jsw5xnePQiWuA/31e0pLjLButxYX2tj6+nDUDl44E4CTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 00:10:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:10:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 02/13] drm/sched: Move free worker re-queuing out of the if
 block
Date: Mon, 11 Dec 2023 19:10:34 -0500
Message-ID: <20231212001045.1099517-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: e2afcc93-5ba9-46d4-67e4-08dbfaa6cd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8UmyHicQwuyPWtr7nU5nHYz7A9tosT9OK6HxjqNRrQdnp7c1JJp5n0psthjxJhAfgxYCtojORpe7DY2WLTdG6+6CieJVe5uoYD+alw7nC60HIVJ2SfoWGcKPgjwB+onJzyqT79uXz/8yihzzes4+bJ0sC4tEAZOoEQOe6vVJgbXOtOY2EIr19ktIrTCOfRxbUflJMw8Yjy7FjPqt1IqHh0VhzZFCp/s+Ucw5gICotUJioL9sJRcuKWKsXzOM0RmxkndO16Sc/Yss+WyerGz14sVz4sWkjje0/Hr9/oZZv8nVrQEzxoFlNzRvlcFCQwUcW/Y0N938g18EWKn823YlaG2nFsJi3jQPNSA8njN7b2v98HGAHCeIpQ1pNjEuDqy+Hwru4lr6NWjiYQzIxyuds3kiA+nLZrXUGl528B+aOTdcHajNbRH6XLDbZiYuM7HXi+Yh1Np/cnS2hWvbAaF9CjTUnw7LqT5kO3u544mlzplGtwJATijzN1FByYIi6/hteBbdfnE4S5cAurTY+gnZ58ot84g2/2GCwz/WVncCkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(6636002)(66946007)(66556008)(66476007)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(1076003)(6486002)(966005)(2906002)(316002)(6666004)(478600001)(5660300002)(8676002)(44832011)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bHY0Ut7pl36IHoRI5TdDkHivEFxrrYxnbzw/9FC7q9QWVKWP/a5JKAjQM95y?=
 =?us-ascii?Q?r/xZvoYouJ0aXxxwtUDQrDiMIpo5Ru9zKQN32GgwqTuWf6ZSqi2iFt5G7END?=
 =?us-ascii?Q?zS6PO0LHRG1e20uG179SzkP2Wq4mZgMHblyZsepUdP2i9Vmh9R3+dUH9+p6u?=
 =?us-ascii?Q?XKm/aybesQLDZybITb2idL4AOXdW/ZRAOfHqWuxZ1EJuWWLpxJp4zgKyacff?=
 =?us-ascii?Q?bbK3WDFHKSnEzexoNXR0My7J4KBN9REecPzCyRbXbhW8EbbCnGtLdFY/Igcy?=
 =?us-ascii?Q?ZdYjS4X6RUOMmdlT7ND06NNKfdC86WLMZ/WYxDdNmSQDfmcJtvV0TICIhjSW?=
 =?us-ascii?Q?QB4UfRtqEIRISGdgjU8249LpwWDehw2kd+TYMi2Qy1RN3HSg4Lg65oF13M+k?=
 =?us-ascii?Q?9Q4z+TGJAa/qSnyN56ZNS5pqUDeXFAJOJ7kJK6EMIJtk9W0jsFZJxeW002d/?=
 =?us-ascii?Q?yXsN891P+UVS+t20zY2+CBat1suoxldQjF/4XhDVwYe2VavQUS0RaFy77UIc?=
 =?us-ascii?Q?wCdbi4px1OB96spOUgm5qyGXKIEYrTFbnGRupvEmhe0KNp/V3BQIuVcGS7WQ?=
 =?us-ascii?Q?Kn85WHMZe17VCrelBhSZR7NNrKdSSWMGS8vPNW/hcMJK19S9VjMUEJgQGTLL?=
 =?us-ascii?Q?OXkaDk46yfpvdDBWQ0UkaE4W5XYyqclOqu8y0rTB/KR51UT+pwUB6GsfBZWo?=
 =?us-ascii?Q?ntRhFEqoyZ2kUoVPj5y6swdKYm27MMjVN4fPhKzR4Y0mszAtKE42upYE3fIr?=
 =?us-ascii?Q?zI14FifLGuFQMrtCcXFUIMYvlXoXH5XfrGVa/Cd1uWfF+9XqwqCMeHdb8A2Q?=
 =?us-ascii?Q?wxm9DfAdzGzgA5aedApx7/EEUmNh0hRkng9AdnXtH/Wy2w+sGK7f93n4YrdP?=
 =?us-ascii?Q?3qIS4Dhnat2KHW9W2ByqlKHnAYZottjYEuVFxanBT682q1yT7y4Q7XmdQ3q2?=
 =?us-ascii?Q?rrCzvKdAFs81RQKofY1ALrTuuFDsbBBe7+nLjYnYSHgFsDd9zbKFf9uZljfA?=
 =?us-ascii?Q?YvN4G5D1zdkpbBhcJKjz2xK/oAqMsIBkj5EijJ2Tzz1CkZtOfSQqgslaYthi?=
 =?us-ascii?Q?VsTIYn6PsTm6eXoDr3IgVvLeeD18XtJD68ncPs5ZNfuxA7aLvKSEXXrHo/KU?=
 =?us-ascii?Q?xQ1rnTPO2G4iCiGMZh7wxrVsHlcX95WqboBwdr6x2mFbXrhX4/DYpNDF4GEg?=
 =?us-ascii?Q?6CJ7hRrgHoWs13RHotyROBvJJX/CfZGV3W6sNBLXjlkfRX0ucngi3kWcsvN0?=
 =?us-ascii?Q?uxMAu0JLa/+li7Ted/pW/j/3XstpPEOA3c5Rn52yJQvvI5gqeNkrljuLO7Pa?=
 =?us-ascii?Q?lWDNzffDPvU+ldo+CoLXbm3dNeC8W2eD7DgBahZ9e5L3vkPDlq4C3agf0Wlb?=
 =?us-ascii?Q?mIWFAhphA1OxdubVfc3dBDJHuBKFpOmHw/CKsMIHZuyACjmL12Q5uid+GKYq?=
 =?us-ascii?Q?KZGk1rPX1M+JPG9KC/AK6ebt6/s42qkmMiK/PSRfCisVNQ6MfbDk3VCp16wU?=
 =?us-ascii?Q?VMa/3ZZaduUUWjddRa0UNgJf2loMB3FMUweMru4tSiYgJQARfvzf1jKQAw0K?=
 =?us-ascii?Q?VnKqRpkK0gZe2hY5At+fJvMrvxvrd0pnKWtunRoYW3MOaR6rqtoAUwb/VTfc?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2afcc93-5ba9-46d4-67e4-08dbfaa6cd7c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:10:52.3790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlRBr5+U6IZl+70lbO//tqBSDHESbW0I35YAYQq6sqxDiYvewtY2PlTroraaCsppUegf+C5QpWHAatJN5nIcFg==
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

