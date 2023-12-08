Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB8C10F05
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1444710EB24;
	Fri,  8 Dec 2023 20:28:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066CB10EB2E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067286; x=1733603286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Cnr8zZwddDfF4vEjrL7paADuC1ExRpYCnNPozP3c/Es=;
 b=Tlkz4xVilzIEpDKEFjcLXCL84+fA5xDvt6Hw336Km0D1QEVkqFlxF5Vq
 nTv3B9pXdYDUvLIP1m+ebJE7fQVz+7NXwxBzkPgxtfKN1C+V5Y6PcH/FW
 +QCvTtPUhlt+Zg7JkJN4tS1PY+20hL+8fqC0YomU6nRibgkANiOZMtTGY
 De1+PZiqBlt/zqFO0Zf3DvdUeuRODGs114B1mOv5QrzW4PEn2S7pk8zN5
 4dqEgIaK5H4315M/gg0wSQ6qnAEOM7pxc++9GuZrS1337NM7Nhsgxt8Ys
 ZcuK8kCsPZJP7xxM5vehbbinEodC0uJSuIN8XSSkbnk6qfxa8vhEYYABX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="384870211"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="384870211"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019466208"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019466208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:28:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:28:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:28:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgSsoat4ezWayXoqXoyhUUzYOIg4XgOkI/Eg87dNDeLB5QjFhIXzpUCah7BgCkfWcSlYoZ1YQXWV2jn8JwOH9pFoawkeFZ7hU3WJeAcmwE5X8ZX6Kdv8ygLlkG1d1RRWIY28nyHrBaDa7Uhwkp+6qLJD872V1moZQW8+2BCQDMRNp3yrnqL8MnjgPXqORasKYzCchoqIRr/MNOTTx2tfHj2MKYPHpE0Rlq7UHJ4HWRB/I6yCdcb2zJHOJqhB/Dcfy4cCUGPgx+zHPUjNnZB7zl/gWEJbf6ORYatGKKRWCf+r7zyOcnotqTQUI4ylPddTEb6ZdOpYKLaDeogoZWIN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnGhqHe9Gzj50QsHCYjZ+ZcHXFxTwrKf/jhVzS2N8d4=;
 b=kzP+TWG7uzrtP4RrSiz0qLg4j8qZ4lwh3TBtFU6kDBueY3UKZVtYUgzsVTD4eiD0LASlGQk3bFNur4glk+aB3km4ioFSpx9tRqC+hwvR/Ykbyk6MRxq1u3d/l78QhxyjGWT+eowDdZlt3h2Hvg3h31LGx6QgolspOsarnb1x42LlgAGNKofy6c1KN4x127KECYiC7eJgQD0F0bWSyFlvAJe9HhgwvGHPlAHUT02GMDzUTrsWTVux3HH9o3jxjiRkAirgy5P8O45n+LkwO3iHVxSVvBPYgNuzSmJHrT0ZDuUQGt8B2EIkljkFfRxYG8B5RRt4RE0feCkRP1X7DS8gIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:28:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:28:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 12/13] drm/sched: Partial revert of "Qualify
 drm_sched_wakeup() by drm_sched_entity_is_ready()"
Date: Fri, 8 Dec 2023 15:27:22 -0500
Message-ID: <20231208202723.918082-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab39b6e-0267-4327-e4f7-08dbf82c2d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/x8xAYV2oQkSwaslduBLevsVITTDZHXlNDA4bfOVojvBAnWzrAGC8vKcHDG36hhP8SwJ0IJ/sZx8DxTWdnE2NAgK4FJ93Wg8ji30qvhb9DGu+D8qXcOAJIiphiRPbRx0qcSqOun7KjRs/hFwZB+p/IGfN68wfWoIFl8HJmiMisPsd2ZoGHnu8L/abJu0aF6CkuD5v3dpScw2nShsI+BREjMOBGnja8anRvyDO9j5r852iPWwkVo2LHl9KsnO4+fk9jZq8HgU8KJQ3gWPmycWGbDVDLrRzdkk0SLVlRBrVdxh1SEV46EEW0ce5yChE8ZHabdQmuFoBBM8fWi57D9uXfFmJJuiVJzQduZRb7xrbatZsBJSyLS/z3TAcsiyAwILa3PkJddON9n426bVmpiPPSTY+WPd1xVpz+xlEHB1pODoaf+s+ZffEygytH0hqEEXPdp/mWbAp1wV8M5P5m9jIuA+AhSAmCMUekrJNLiZTcj3HAFIpU8H6iojT9AGVYKOh/XQTc4Y+PK7DN8lh6J43g0UQye/ICejoO7+6qIzUZmwfu3ZSKDDohdXl7xWL/IcsdSZ4Mp2iyA7qO3L5ijmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ek2JNRt+FPOaYVilgDV25Fz4H5qmsB2mbslz6BXL6eYp4VrNCAW9jjPIdp62?=
 =?us-ascii?Q?OTMDEknsXB1AH7ex4r34gT1awAGVWqfc64B+P8m9ra6bRKIUFf7u0ycPEx/G?=
 =?us-ascii?Q?FDoj6k0QaqO5NYjZ55Nze72SHhZsLbyjQjHMsV12aGPl9ERER5A4jRSjR3Qn?=
 =?us-ascii?Q?QYwPpG6KbkHVl58E6rok08TA2Swl3NVVYDRXF8CQnATlXQp9JCsqt3ciawvK?=
 =?us-ascii?Q?4pYWIz5H+nTmgciL+lh0i2/zBj9qS7MOWTWhwvHRAHo45XfN6rWf7bBEkYW4?=
 =?us-ascii?Q?g40JRK966iDa7xKAKWMQ+vuQsd0dD0rul3ySE8wGTIXENQCzr9PmZ0hTwxGk?=
 =?us-ascii?Q?QMVqRp/9f8Yq9hXYtXYyYkY/5IxBbnrPLUtOiJSEn/USI1tMpHmWSSoBtv75?=
 =?us-ascii?Q?RxWyC9kRganBH6fWmpvynf4vde8/IMYd0/bLEEpJXHYYsUbAqYzQY1Mkq3BS?=
 =?us-ascii?Q?cCLubnsl+FQBoOtkrtxAdJeTl1vrH7Tqm6QFZGkojTiMBCczNlRSeAj97gYq?=
 =?us-ascii?Q?U2MLkO9MhHvh96zTe6P6949ieq9XK6n2+8/hzpoxgJB21byhEdvyzQbXfei4?=
 =?us-ascii?Q?KnIn4qafumgTTa141kwh2G1LGwQ6lhnR4oIb4fn/rIhED7lDDxHzZELDA/a9?=
 =?us-ascii?Q?SQeyqe1Zc0988sOmeMsXNkt3Htq1GC4xNzsPgwcVcarKa5eRoOE6I0Hikfh4?=
 =?us-ascii?Q?ndukXtDAcrHu1C4eziejcGjE5B6/az7dBIud1NEIWISzOo9IBEpimHduvfb6?=
 =?us-ascii?Q?w4KvmQA4vgzoQEZs9cSdPL/dwH6VoXrbHCCSHxFpkLad+BzKItsAOtLnS7Iw?=
 =?us-ascii?Q?xCIzvFq5FNNzbVeyAWsQBjyObq79jfWH1Q6bBPtk8IcMXSBfgtY9DKrX8Erf?=
 =?us-ascii?Q?g3fdXNW5UBeC7xkyGqshi3LwCrpAD1htRI0qL50wPzPWhaf9FUggxkcfp98m?=
 =?us-ascii?Q?8DDzuxOaV11TItHL/bxFakaCN9SM2OBxK2dYAZGuvCJptcXe2N+pclmvOXD6?=
 =?us-ascii?Q?SBl8ijSh+IGL/VkW239LJKfnCrkyFB2UMiu4rpZJw2MJK40OlVvdsDib6DRB?=
 =?us-ascii?Q?AUkenkjZvEyp+A6NC0Lhk/EVyfBxgEnZ3xAQ73XPZWect6dTTuUNZWnFgYDk?=
 =?us-ascii?Q?2BVQ1c1ap0kixffA/UQsPFYGSkOFDTZm/qUGrv65RvCJ5RVwkd3sPlBN/NrP?=
 =?us-ascii?Q?/Ov69BxSnWKhM2DwsZlmgwTs+gbSJd5Uv/5X4Ip+1MxI+/wVC+TUrZGXpiiJ?=
 =?us-ascii?Q?1zTfjr9c+KDAqU1Mogw/kUMM3Y1uzqi1Yb9wIQqpvkdY6sTkpjHAAxD9ROFj?=
 =?us-ascii?Q?8Ror8u8RPnJAQBjzUP8/d3UT9X9kz/AwcFqIB7EK7Co2GS0IBBd6d1pcviYG?=
 =?us-ascii?Q?lpGrIywLRCVf3xheGnNglZIgG9DLtKuqQYb1Wad3XbSUem/1ShIrUF7PBwZW?=
 =?us-ascii?Q?YWRuNoGfvOSm/1esbqsbWt0i8qzCjyNCF5xRyCyQvS5ITsQwJbudUtPO0JJX?=
 =?us-ascii?Q?eZxG6/DxJh4Y5u2dTbyO23wDL5iieqWPttGwEd85Yjt5jHIoQ3XTvZNGQuO0?=
 =?us-ascii?Q?R0qADxklZoJgJT3tqwguDiDLUtYzhhD7rz7iXoM5+RXx26wlvRqqVn9wz4PZ?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab39b6e-0267-4327-e4f7-08dbf82c2d94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:28:03.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD/gJf1dhB4pBvLKZh85ghKDKT6Qpn1puEcrt29hbC8IUwjdpFjUE/ur3ktAGAUV4lpa1cMfAcQeTzyMUvv1QA==
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
Cc: Bert Karwatzki <spasswolf@web.de>, Luben Tuikov <ltuikov89@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Bert Karwatzki <spasswolf@web.de>

Commit f3123c2590005c, in combination with the use of work queues by the GPU
scheduler, leads to random lock-ups of the GUI.

This is a partial revert of of commit f3123c2590005c since drm_sched_wakeup() still
needs its entity argument to pass it to drm_sched_can_queue().

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2994
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20231127160955.87879-1-spasswolf@web.de
Link: https://lore.kernel.org/r/36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")
Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
(cherry picked from commit f92a39ae47076ea123c7980fb85e6e33313f372e)
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

