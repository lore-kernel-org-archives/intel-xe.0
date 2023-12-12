Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB63C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64F10E53C;
	Tue, 12 Dec 2023 00:11:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F4D10E53C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702339915; x=1733875915;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=uwL6InxUFxF5YRIuOQM8W3nwoeAEHKl5X9wrSbTRv04=;
 b=Yrm51Yc3OrVzDAoR/cYn3qXZoQTBkgiL5WOq5Y4fMfAatgmRRdhEaMEL
 2uBAHo3XDL9iqC/pXwy2itFR4hOHve9DSoyi54aEY+7lHTYqKKld+TZqH
 rk7YTZxUNvrUGYuhcJsQGRTzlTOuFu2tvDQdJnEBJrJFXBUqzbqFCQVet
 Ugqe7dRM6NlMb9B7Uv22cOinoSYOzNrEztOLcCUzmNZlIAk7WrbSpYA5f
 0+p9YMmBUXEphZC0yLH4AUabwzdeBot75uQEm74+YbezHFeR+imSmj52m
 1w41DQa9YbmbzGHalg3DDBcP5dLm9DaOkQsLvPwxM1eDIhNmCJbLdqt+K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8093489"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="8093489"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766586665"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766586665"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:11:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:11:30 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpChFmVoTCJ7chcYGkaM/dwzvPQF+481jyEe/KSSkqSBsh9XoYLMuMHhvrbU3inCdJ5nFC/oZ129jULPZh3xrcxX4l8W7LQa4P1xNICbNvuppuBCr0d6jv8Ggpd/wt3x1pH0RgX+FsBRL3oSIwmoTaiByjUpd3EPV51+VJuIlBPRMvquoICeOPvov/diOqfAB4PQF6aQliLYpMW0ZA/UTdPJVujVfsBBkcf2UM8Y82LjPBXCFYmcrM+qU9N4rAUjW3tRVxXzZn0oNK0DO4EtCaNp9Y35z/zV+no3PHsEN3Huq9UUe8f6mNrF3bXa1kqxtta+eHPzdGFsvYs3zaW9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbL4yCL5OqYIAvIOzkJGkIWStJF3zsIqqBy9vfcejmA=;
 b=fNFqlgEskodB2NUS0u9TypdAveJocRQCRyENBkQ7AtMjt8KGRrT0s3mDbbxI9ZO4ICIp2qTzcvI4DSqXmJwzcz4jBJSmLKSzcidDlzCWIlnoL4+UZEoXfL7njglVwVnsiUhUjgnfSRHS7CVLgJUFxmEeYvJb2lMwNFW+jz/tpz/RsGsscUpJkENeESF63h+st2OMYLMvd+Jxqi+RtyZ7ITVKz40cFpeMl7tHlEO3a18fPXpkHfGdvCysDGhRQgWmhRDueTvfw5mfjwkfIor830EV33yDeoSJ18dAP5Dlb0g5SS38L2tbDyq8vdhwkrtlO1LDkppi8WAQnKy/lpR77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8394.namprd11.prod.outlook.com (2603:10b6:806:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:11:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:11:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: [PATCH 12/13] drm/sched: Partial revert of "Qualify
 drm_sched_wakeup() by drm_sched_entity_is_ready()"
Date: Mon, 11 Dec 2023 19:10:44 -0500
Message-ID: <20231212001045.1099517-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
References: <20231212001045.1099517-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: be5b5884-1aac-4176-24e6-08dbfaa6e142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 46oEQndo/T5gMFAQNLVfHC2EpzXLqd5s6QMlJeoEBlQAj2lYX8TvUX4f5gp4hcVUUwME1B1xI0+aQSfa+/Xn4YPlhx3ne38mUyWh1SCRYaoNwDxUFIsH7VJLpD24B8PL28T5iHeTcLNdPUNdff19ZakA6YSdHNsT4X8mwEgkCDG1VVowdf+MzTir5MkJjoI/Xpn0ie6kbLapUmvXLx08xrk1JO8YR00Lq+hh/kz6a0G72KlJA1H5ibyi0AbJrj9YPN7DcLcFfb7gAn/191g56jHrj0fxReZpujMUa7z8Tlwiz/R53rSGevXT6RgtqnqYBDvf2/7ucT43nvMPqauGs84HmX244YhD9GdsZJcJ7j80z98cCBlefQVS9zgsNw164tuMcduCc7u6hWW7BVQHksZ8zcvlD9leXtxVQnWNdLHewnvvcMcweU+CnQvuriy1k4UyDwdXOWyj1gGSnhr2LhudydVjZekb8C1UEwr9JrTIVK7qPFbbfpjY+7RcpQP3ASM0QJSnNl0ED7rWgmPSdupciLR1lTCYNeDYX94s/ayeclyxpxA6IYiTQ+0xtQCeHErDoubG/6GfqM4r9dFScQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(6636002)(66556008)(66946007)(66476007)(44832011)(36756003)(86362001)(38100700002)(8676002)(8936002)(5660300002)(316002)(478600001)(966005)(6486002)(41300700001)(82960400001)(26005)(1076003)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBGp7Q6RWf3rGvfEiYzsPmcsxwm1q+E3HE6nNrK7nky+xNqVk/yIn7NRmpcM?=
 =?us-ascii?Q?wo+qrODqnH+VIyPDYzUL+BOhIVxccIDuq4l8OhSD0dEp+2oJohrOHw/VFHLI?=
 =?us-ascii?Q?3xzhyX2nKNb2ki81TRQRxAkGGRkiS2guF/pJVzelP8xKTtYa4vYa1RZOKB8u?=
 =?us-ascii?Q?c01B8+y9J0GP5i3dmzz7xsZ7CuQjAk5h34/AhwG8EKKcDFP/XsjcZv7ZrOTj?=
 =?us-ascii?Q?EuGCLQ+WqZDQ+EcLVtEAjE+t7AVHQ/Gi9WD+5j2mVTDclNChVJwuUPr6Rh2L?=
 =?us-ascii?Q?xQC7IOAmQ1xVhlLuNevzmV5fi6JB0cmY12umGkWl4izdVS1LzkSLZUsgeJ0V?=
 =?us-ascii?Q?aIj1adVhm3uB4tp44kpHcDzhaBCmb1+L6Fla2WDJlwNnEF+IzcNLiV35ZHmC?=
 =?us-ascii?Q?Era5Q3wtBSbpl7hBQSxkyt1rtsMxxwEIneSlGgxK1VjPwHVHOhWIVMLM/0Zs?=
 =?us-ascii?Q?h0SuGbXvBXn+RKnp4bGHaxt0341tl0a0+dSk7UQ6o5J0WGWA7sNPzVJXZvau?=
 =?us-ascii?Q?Z66t9Igw1B9H5Up0Ky2j4PuqVAPgo12zeySTaEPhMUv5YPohsapfNzXdVDiG?=
 =?us-ascii?Q?D6MR0aTFQWf35mD3Tyup8h8XQl2Gt4ddXLmuWmvpwE0wSG+e3jTZ+D4/ftxx?=
 =?us-ascii?Q?/F47b3zgMJ88szvuMEBmxVUttaXICg2oDHnigBPAZ5VYgya8TXa36bobUGeF?=
 =?us-ascii?Q?GdqcMIULKdJZEo2y6lWLRzWS7RovbB6Po3Vl+HdlouOHTrsxpXTEbCx+iOas?=
 =?us-ascii?Q?MApNW7wtHyjM8E5nQEEs331zP1DbKfhC7bCggaX1DrmEbtLqJajmYfkIU02L?=
 =?us-ascii?Q?M4v2oUMC45ukoGDlv9p6yg/r+RJ6ZjKBd3QISR0ee9QrHwZCQqO1Xa0c3XO/?=
 =?us-ascii?Q?gRCWfM0k34qmwwOavXsrgRqmGMrFF0kEGaeCw8plGJGTbfdQQWgxm5T4FpFg?=
 =?us-ascii?Q?Iy2Cccww1XCEJczGfQRdvDOkxzE2QxRjt6pldUyv2Wf79QzdTP30HuFN2S+G?=
 =?us-ascii?Q?KBubZcthkbeNW18AcbiE4JKASkEMPzDlgY2mACiFYcKeq2TLm28yCL2iXKtw?=
 =?us-ascii?Q?oxplJkf5PZtoEZb6/zKXY1fYO2J1wzWSvyvvBP4EeIK9Y432oWn6J6VkUhC+?=
 =?us-ascii?Q?9WipapcyDdPYvW/2EyLbN2cN5iOJcav/3v+eqRohxbHF1jTKod0YFW9FNsr3?=
 =?us-ascii?Q?F3gJ56Z/JA12es3OAmX1gobc/NXoxCb1nq5djezeBjSXa0MrLUAfrS5Pa8Kr?=
 =?us-ascii?Q?IaEA13V1Ren99IZQk8Cs+0H3ugt2mVU1AZQOeyUcf7yJfdtz77ovBzYEWEyK?=
 =?us-ascii?Q?9EwDxpqvaXqXBRwK/4aaTigLJYGnz72W9+lgJhSQhZI07MdFFYMKB98KbMNj?=
 =?us-ascii?Q?IxKcKf3R9MeWxkuIA2C1YMvfDKRZs92wy9H5Am5+y+PUBDo9wxiLtxRx4PGg?=
 =?us-ascii?Q?HTd94/aeOSoJegyFQGWt0uB3QzROEP/G1moTMFOnYzkVaZlWFkPBv4ZkeEO4?=
 =?us-ascii?Q?l5kPdol+Yi8S5AoqU+W9LofzXgKnBGsOaxlIcQK2okiCzn2+GJamAu7+LPDL?=
 =?us-ascii?Q?5dY6hzlS65bL18uh7PSfZV3vX4DQHdRL3q+6HXc2qk//90ooqkBqEh4pORzN?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be5b5884-1aac-4176-24e6-08dbfaa6e142
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:11:25.6047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2vmmDLATE3soMabxLIYkW0RamAa95oBWM/kM3AnPaxcMrAZPtUTwiAhHMUpdYqv5VJMk/F4h1Qpxw8jHlN9dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8394
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

