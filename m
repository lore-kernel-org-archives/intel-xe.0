Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E04C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 19:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43D310E4F0;
	Mon, 11 Dec 2023 19:14:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D6110E4ED
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702322036; x=1733858036;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=uwL6InxUFxF5YRIuOQM8W3nwoeAEHKl5X9wrSbTRv04=;
 b=YTPhsrBxADw77fnY+V65fSlcr/yEiMZmEQ4FRmIXCJueLHYaYNunNAGc
 GrXf+dwn5ZseoLopCYIFTuWfBXNpwhgyB+5Zsq5lfjdMwdzR4FczfpCD/
 dT1sIAKg74iyslqYMYnIcvlM4Tn2PsizXp5Xl7FQBHjyTCdxOLd9fKcDL
 KBGwuIQuXmS+qRa49Jb7GyVpX+QOeJoUM3QY4sO5jGTYbrhh/X+7o9IjI
 3To6VzKpxKLQncjZPx49kDqupmA6hQXdu3UzwmCjblEbhWRyRSDi2Qibk
 x9twP+taUQ2sg3ejVKfK6OWlj8blINRsvq9F81lZGI1LoRNLDTULRimE/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391866963"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391866963"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 11:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104585876"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="1104585876"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 11:13:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 11:13:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 11:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz4vWnwwR87nDrysKMHSC+7y/PtyZ+B79S5aiASI0M7ybk2pSHyfL5axOzc+GToZ5eyGEyyTU61m9dqiCvlFI7iXr1s16ygqwhlIB8gstBpzqqIQyYlxMw8ahW0mCj1nDWzgMCaCJUOn4GeLjZy1xbM+939dmDizy5woR38DhnrC694NmajovGh52Yh4hXHcDlfxirYDAyRot3mgYoWNkdLuJG9UpEdEJeWOhL7QrC5e9F/vImqFGqmGhxJi5Ep56G7bTEXYvrqR3H65Fc0XNuLVGYOqsCxXRPPtvLE+AEaX/gQOI+W8DQ8WpI5H7nZj+u5XKPKtIckqDddo2jxcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbL4yCL5OqYIAvIOzkJGkIWStJF3zsIqqBy9vfcejmA=;
 b=cp2MCYkRvw82t5YD+sG2EgtalLNr2zONYXLv/bc1uKvilWcP/FQzUrYcAcZdunIvc4WTI7mMLmM7OHKmyhRNq3DqH2IsNqHHX8sYMiyW25i/4TPGcFwbTYPh50JpaIXFcJLLimBktfv9YrQGe8WWB84V9FmaqNlAtEJdGJE39rR8lUrmdMZQUrAJ5mVt30Dd1gbWI1vMEL+I6U0oOMQsU57eaSP5gHf5995sIgJsUHE0Xv7hL3xn0DGpryjTqJ602AshGBRE9TA9Zo7g07ZTIcW7C7T2rjZkkHU8HzKfZxAhhlC6Jtme6+bXvCLiOEQlWIqSss4KuTmovPtwY3HYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 19:13:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 19:13:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 12/13] drm/sched: Partial revert of "Qualify
 drm_sched_wakeup() by drm_sched_entity_is_ready()"
Date: Mon, 11 Dec 2023 14:13:05 -0500
Message-ID: <20231211191306.1069362-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b2be40-6751-40d3-1eaa-08dbfa7d4e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrLsnB4hOHcebjnP2GOqKhpIwmxpSm6P110zxt0lad/BdaJXMeQiTRL+GXBjwY2TSEbGTJ8UrcYzp5ADIVaGIBOy0O4GbWlEPA7DScRjvM68LEOij9BQyDbnltegGc6r0B21os/X7h++MGvE91mE37e79SJSnJqbqu3ZydfjK5mIjJ6O4wnjxb5BN2hnu5SR//lMiSQay+yVA7aw6u/LB5xTzFUCyTbNrtx88CV0vELAELWjVmJ9zi0+lHgQpCBxBR8qNrEg/jkXjV4+d7L0r3uOh4yONqanI5UN/AUnyctaen1wnzEtCRK47wONrVcIssaup3OREqx8WUgckjXmn5+I7X09FW4VOxDKthIHUGnflXSMNxl/u8evhU3AZLxrjq4dfdWSTCtq1LmNKtMEA0Wi9G6oVsQDp7GlfeO/B842h6R18YVHJxG04gN+qFsOyB+GJHWPkkymiUNVPuGcCMudYsyy469TTKEP/x11AGMGw2ISgwLyUf9lK4UsJU2OrNyNQpZExROZYaNAvLBcuqN8W6rGTXqX3G1W3lLaNm5Z05gQs5FlhjKXAZgyFDjoyYISw4Nga750kM5iBIPVyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2906002)(41300700001)(478600001)(82960400001)(6486002)(66556008)(66476007)(6636002)(66946007)(966005)(316002)(38100700002)(6666004)(86362001)(8676002)(8936002)(6506007)(6512007)(44832011)(36756003)(1076003)(5660300002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91eq+pZuTuNX8yVMGZOO1DvkXYlW4H8KA42NvuVLfOHHuff7roIsPSXZ3y2Q?=
 =?us-ascii?Q?uWesyJigqll7M6WdmosZNRGCQ6vtDHdU6yinbO93oQfMqW1R5lFjJBlkfhXq?=
 =?us-ascii?Q?QzcRlDVzGgJNumRijI4jF3PkC7vIvvW7LAXDEwtmHWeBRF1aNUmiRJqPnVuZ?=
 =?us-ascii?Q?DEdGKv6Z81X9R2UwII65/9IdFQAit/NSxXsdoeXqiXU7H1T/0LTobhwB7BCn?=
 =?us-ascii?Q?jptBFuTdS7f0Wr0vLAHC57bMNw9ceGfgNsJYkT1MUq6UHz/B8P/CVRolpTZz?=
 =?us-ascii?Q?3iP3kQtlD2dE4VIoBieXRKTZrRaG7sAjl7S7lDY8dYN6cJw8QXXc6jDz9IGi?=
 =?us-ascii?Q?6vlInpR75/PnNl4S7GYrwn/grCx+N3prgI5o8ENRs/ux+CZbElaokOn+adAP?=
 =?us-ascii?Q?pmmKi0usb38TNp0UHOjKveYcva80cNNBCcKNidRXyTrrxGtxHDheFwAskHBN?=
 =?us-ascii?Q?7jSx3qd14YxqDcCkS/KMlIHTzO7Dn3dWHra9trFeDO9i862OXUddbdACn7yO?=
 =?us-ascii?Q?wKfqgQw6Ci58wROLCx+98OgksYwP+o75Hkg70/n7oEYV7GYQs1nl4x4apEGv?=
 =?us-ascii?Q?YHkLteHO9z1TXWWDIkGjUU/L2KEvLy3SPMTKVuYdE2hUwZmLlWysN0gSUGJO?=
 =?us-ascii?Q?y0rDlpdkfsmUA1l1UpPjGxtzBTgLbeqSJRJw0JEcj/fs2pvYnD/qLoXAagME?=
 =?us-ascii?Q?AHrqd+mqnb6/eGedLCiaIeFWjoLa4oUERO4p6zsbouA6CJL2A4KpaI/CCfTI?=
 =?us-ascii?Q?JFrp7p39FRnNFP/1WHSF/T44/I5hsdB9k0IXL6L5Js0eOEAqBJlOpSxVjxdo?=
 =?us-ascii?Q?/F1hrht9m8eLVjHQyiA/pY7zUoz8qao4fd1xZZXKDCMK5klDiAoV5kWH7kyd?=
 =?us-ascii?Q?B605iRZr+zrXDa3Dpvs2xdf8DuJ61CgHTzkzQqYek9apLeew6dDGWmbwTA9k?=
 =?us-ascii?Q?m9JTUZuhWX2SVx7xv9gbCEPfV22ceifSOAnbXvP+mV7bd74hMlYDtvqOQZez?=
 =?us-ascii?Q?wKDr2DKyqP2kcDsUc1PlZZ7P3keB9Mogmyw3NwSJ6YDxU8l+pw52y99KOSI3?=
 =?us-ascii?Q?B8m0tJJmDfX35vNA41jD+LP49f3QiXPx4VE0/kQL6STJX1JuevhXoj7Um8qt?=
 =?us-ascii?Q?rhoUXYojDNwR67ONzgRsR8kI9ApCtZ30j+SwzylKtnLzYUCMl1fQKYhFG3jK?=
 =?us-ascii?Q?seRLJEGjbr6HLIRFP/DdX8Ty/J3g8DyZHN03sJqA8knSC49awC2DB0Mx1aAW?=
 =?us-ascii?Q?pf4O125n4/cwM8F6k6r4d8iTHPNgMOMXAeOxmkZvDqXUTwz5aOMIObP4PDEE?=
 =?us-ascii?Q?guJZJ6sSEypg/F8WXT9LiuiCa05OJbdMD1r2cE9kWceWZuBwUE3PCs4WKgFo?=
 =?us-ascii?Q?lHkV66MMniA1+COgXqZHHOzHLi1BxSLQm9AYw/LQDLgbkykqo9nwGxTK4jaj?=
 =?us-ascii?Q?dgs+nXPU4yQBn69SWabuhqC248bmjSdY6pCkRy0bwB2F2DjGCBvW7420smY+?=
 =?us-ascii?Q?7/meBcrRt74JthyFLPaDtsAILd1bqFSZfwq2KXNeZ+T2fkfjx5FwYMWbASmq?=
 =?us-ascii?Q?yg/V6oF4Szy/YtFDQadHKEGX91LcocDY/ccLZQRpJrZU6HxR8d+F58DHYiH8?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b2be40-6751-40d3-1eaa-08dbfa7d4e71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 19:13:49.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WetLM6QiYYMbcOzT+vKNZzdx8qja/LK/DIL3SHSkneIYhSAe5nWMVCjQyWWdyOpVz1ufBv/egDM/NxPObnfZpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

From: Bert Karwatzki <spasswolf@web.de>

Commit f3123c2590005c, in combination with the use of work queues by the GPU
scheduler, leads to random lock-ups of the GUI.

This is a partial revert of of commit f3123c2590005c since drm_sched_wakeup() still
needs its entity argument to pass it to drm_sched_can_queue().

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2994
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html

(cherry picked from commit f92a39ae47076ea123c7980fb85e6e33313f372e)

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20231127160955.87879-1-spasswolf@web.de
Link: https://lore.kernel.org/r/36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 682aebe96db7..550492a7a031 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 		      struct drm_sched_entity *entity)
 {
-	if (drm_sched_entity_is_ready(entity))
-		if (drm_sched_can_queue(sched, entity))
-			drm_sched_run_job_queue(sched);
+	if (drm_sched_can_queue(sched, entity))
+		drm_sched_run_job_queue(sched);
 }
 
 /**
-- 
2.43.0

