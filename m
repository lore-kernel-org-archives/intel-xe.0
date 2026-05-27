Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C34CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDC810EA38;
	Wed, 27 May 2026 21:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2RUiA0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151C10EA38
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779918303; x=1811454303;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BULL0nF6XYvyXQJLAcZMx5+j984H1z/bUi5Vtx2mHNo=;
 b=l2RUiA0VJMIsTYftEUnQDFYqOrNNfIs2BJ1D+5zFxuQw2QZ2tRIrfgyy
 T+Pdmx3ZEuFErMVsoRCBD4kDhsrOagAATibFyS6TutuZ1/ZjlZOa8b70x
 X08w427h+YUee6/BqEBJGOMuAqeFGvK0Yev84Wbn2E/fRz8Tlg1NIIB6o
 kxcuN6gTfTcQk/5ahxvjjrE2r7hytCZdFJ9IqGCvmfZGV9zVR62MaOvqh
 +eaIdmnDTHMZA5VpMA3uEwuxRSMJeR9oGyAQnq3BGDSLFrgSZ9n7duykj
 SMd3EAeKH8raxopkRSvVXE1c0EEsLRXUP54J1Hlz1Ef1QeE8iAmvJpmDC Q==;
X-CSE-ConnectionGUID: /odrzWj1Ti+uYB0zM1cTHw==
X-CSE-MsgGUID: 8M5KPQNcQY2CXslII01tCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80751049"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80751049"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:45:02 -0700
X-CSE-ConnectionGUID: kEHVsmt6SN6q/+QRQ+0QYw==
X-CSE-MsgGUID: Cnb0VlMgQAC5DXPPgtXZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="237934765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:45:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:45:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:45:01 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnPnxcJQJ1uNGcTesOX39g/sswH1E7pipiDGNUXTmKvjb9JIJeYOOwP/0CHc0vmNwjcCvuoTfJkEvw1s1QAHtgopzL5gui1QSeWOuVkrkwPON/5ZvZ1iQRGtyr6F9NvPecLPAt1k+aQIhyFG7QE/F3rJuqqjZA1r4E48Uxpad/QKZ7syOemDhr/xROnBbEVzywhvYm+WV/GOtOn+DjrvqXCe2B/B+1adzTUh6+bEdlQ69SHbMSRlDhIlQKmoEh05z4KFePf4EGnKppv/SEu6pM2RtL2eknU2SOpgfjgqMkUrbavL4P553qtdFRvzGBp8HN3fRvtyf4QYD6O4L+bJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QDgSZ4Xm5B59POD1KSR1ECUBqLEzpWzJGiCav30A3s=;
 b=riJKRo84M1FOJ08/ANB/SJtqc2mwrhgnuxSPE7n+CLOfhIOUg2j0R/Njmkierefk+K3S31TTDowGTqmGsacznKJSHkibtC/ggGSmaleXQIpFzT2XSPtfVm1wJAyLvvSXgjY9mMwJOxTefywTK00hIs2a6ea14QnlSBLcwlcRuOIJH1Ri4+4nfW1VAInTUaws+y/eFjOF8U5i36zvJdkb+TK16JN4XJ1tsz1AvbqcB55qhb18IbJ1WxGPUZufgXjOY2SHkIjm0ljJgHW5aP8WpRS+tFMFrQBTY3ANopENvWfcDvMDbReY1bt5GWtvY87NdDa+nScjmY7hbPzjOqgzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA1PR11MB6992.namprd11.prod.outlook.com (2603:10b6:806:2b6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 21:44:52 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:44:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/2] drm/xe: fix scheduler timeout restoration after GT reset
Date: Wed, 27 May 2026 17:44:38 -0400
Message-ID: <20260527214437.3891167-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA1PR11MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2859e6-0e14-4824-b068-08debc392efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: BQbI3HhQvhDOQD38OIW/sLQ08WfoBVaQB66lL9+AStbZ6Swqw5YeS9G1uRKEhwuUiNsomlTEvTFAZzDQJJcJQM1da+rE90tPFYs9IGlQ3V/OSCsiSnlVraxQdYcSUfFakwA6l6SXZoQQ/h5Dj7BWdhsAfNdCLygmPvTZnOPiFvgMzBtG7zfF2SFkpPWcJwxMjMGZWNU0GS9d7F8k+SPL4gAzs6r3P5cueVKamHxvO9yE5Z+bApu320j7t6E9X2oE+uTmCGu0/zcetzigP/p3fvi8l0OjxcZfgclet9qNyAtuGIbM/C99gTa7edszJlFzzU7p4Zcs8fw1MayPp6LSfRsrV/E1yVvQUHCVPRIKsHxcT9oNz+jOXB5WdPacSzN8nKq+DMBKtTxvYYF73pcyVfex9CJBrTDTB9TS5GIPpXOhJg3HqPxCZSWLip4TclrBMP4ygf7Wbid5fSofhg5ozyqQVFAynH9zuM69i0pdOFc4LdSIuo8POC3xbNPMFBVh+XM7xAzs8DhxA3Ezpo3mNwFQ1xQdo6HrFcOPv+ysM7TqXuUh22EHiI3yikQvbyPeYeyqYe0jzOYNOJ/vAC1X5RSFE+SOoEYyEqPoc/7SpOFL1nYTdx95sBss4vkBNC0ySFFSwOBglPG5W7l4IvgohHraguUz6vsOsBbOVd9sb8Bwq1W+1IaZITHq2Vi3j3Xu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GAo4GS4gpxTriwjyTR6q90Uai1J5ixZLvg9n0wszCsPkuxBpCC7oCBcTWbcO?=
 =?us-ascii?Q?RoWhiGXskfRmLf/9Iw2YedlZu78j6bHnW6WO7UTcp/KZpisRE182yW7AxVkB?=
 =?us-ascii?Q?LSkJF9Jtv3/AxhHz91qe9ldh5dcRd+Sbh70nPGrqQTkmUfNIDNrmTQOfY2n4?=
 =?us-ascii?Q?6GkV2M4qI9f80R10rN1zxEqG6MrMIMJe3zlQ46kLGKjRPUnInfYZhesHLvji?=
 =?us-ascii?Q?j21WGth+W2N2U4lvdNsbCpy0XIrbsQlYtamXkXg40BG5Ups4mk3HNzVJ4cXo?=
 =?us-ascii?Q?o2H2yk9Lm5/V6yxCFS/Pf9ylfyS+0cTsG1nrgZ0I2nQz9MOIjjV4ypG9E344?=
 =?us-ascii?Q?BexoWnEFOPLi4tcBeko6xz9exIkwALFlhL6BTO3hhVAIAFvT8XZXIzWRZyZa?=
 =?us-ascii?Q?YR9z92CfjDbfB5BSZwAGn4/FxAnu6IuPVS85sUkfB5UtZsEqMZp+Bl/9/+xa?=
 =?us-ascii?Q?4i11nXpWJAFixYtQwjikQOS2CDaCch/Gb95m9RkAsUNchpuMiOY5gXwVhLuS?=
 =?us-ascii?Q?H66uH0AJse4bNGctQsp4qdlUxarV0uwMav+WboXQuoCmmP4i/Ijtk5Z1AIKu?=
 =?us-ascii?Q?euicz9w83/tWJ1bcS4mqUAI6bcg1yUtmQmqkprcEQiiVBp312fgENPbi3GOQ?=
 =?us-ascii?Q?OKHQ2niHYXrXdPutO3Hnx8qqtVdQa0HApUcWxjdtQ+SuEm3svtGRiXRrSrj1?=
 =?us-ascii?Q?n/6T2Jd9CzOWFZXt5L14SOHASJAMXrZrbpEyJhFqVCoBCio8GcGJFWUCtdDR?=
 =?us-ascii?Q?neVkDkNxISQsQc/R3vCoEa2FPnZdCR/XSRbDMBukRXOXUNB4gMRWKsDjyksI?=
 =?us-ascii?Q?G75E9oVNdjI9QJe97zIcEg83W+fHFrPzwtGXMZyh1DVn97sxrUpyacaOZbYW?=
 =?us-ascii?Q?WX63+iJtvoRb7v3xOJ5JBAXEg6xF7BG8IDBWocroYhiBvoropGDJkhXbxulK?=
 =?us-ascii?Q?3fSFTFJEs6lVbkiyPJFjT5MVf/RxKWpYSang3AywKZyKVvmGceiw9oNbpq4k?=
 =?us-ascii?Q?63+4bRdTaKdUzeiIbcrDsFhP0q/Jc3AMPIihzp5hBEkYBtFVQZO+GOBObXUZ?=
 =?us-ascii?Q?9iry9AA4R9wTqZHvPU2JZKjH6o4a1XXUxB27M6N5uapCJgJIbEOn7EoUA12j?=
 =?us-ascii?Q?1Ml8MHDOoN9B9h3KPKRGNPS7DyrSvrc7o/XTuch94ZHk95KOZLGZBljToezt?=
 =?us-ascii?Q?I+QFPezeQP0kKMxQRC7GDbL+6JUaJ11hD519U72EXTWKRESi6gV0ELr5p7fa?=
 =?us-ascii?Q?0CKBrPDaILQr3oHPkpZ+EVD18o+ikgVE1iRW7crq6rB4vCcm/DNJrh40Rvve?=
 =?us-ascii?Q?yejE4n0UO9eOGdRiCYVvWQ8Dou1qtqlvhKD4bJnTAe0H/e31IEJcYHJgCWIb?=
 =?us-ascii?Q?zwzT0gbdF9lhFYAtQ+Y7+pyqpH1Ln7viUBcOjPxvkbhxSJRiNqbxDgcGizkp?=
 =?us-ascii?Q?nxi/14WpF3LRZnoySIsXtYf+JlD/3/2Tz1+Nu+amETjZcvlcmIUaK0CV+G9o?=
 =?us-ascii?Q?15JfKyfIfqX54h4Daa8+za4Ic6Tzegx/mVbGSWj6mbyOt5hqKcz1wr1YsIL+?=
 =?us-ascii?Q?0OYeNabEMCBjGpjKXwes/5D8R8KKjcn5a4kpZExkQpW7B00gxRWBxpThYcMV?=
 =?us-ascii?Q?r4D+JTVxIbnvb+HxvLU/QfmRq6Sa4Ts2YPSgCRQ5qCZ6EbS8wIVLDDlx8LuB?=
 =?us-ascii?Q?yIwOkdjluXT5NIWPyf8nATt6SlSh7Ue+Nf7vENpZhpPHU5XudH5z+mVjkdHz?=
 =?us-ascii?Q?w7FMSoQ+Qg=3D=3D?=
X-Exchange-RoutingPolicyChecked: sK3k7d2SZPLw1k+kQOyGaDVteQ07MJrAE5lCOG3VtzXVHADX6iR5dvjLhyr1uHqj6mHl5LSPjnhAiYNBMrTGQqUqxHugA3wrl+yOD5fj+sKdYEV9VMBYJyEyl1DPKzsfrnapGgpWUQxPuqICDNczIBHDNh9DtvLUNVeFHAH5jeH76yMgF+iF4OEktq+dbfoC1H0WKZuvzQwQBlthK6+UpdzxWefN49uc56pr7Nz57jJWnC51qVzCdF5k3dm5EAvdxTtqugBreXEOSiYtHta4+hN+fglBmOz3aUWJ8FuwxyD2cy267lR/xrGva8gF1LenV3ok8pAXe3uTZFiiwo/+og==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2859e6-0e14-4824-b068-08debc392efb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:44:52.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSJhKjQ5O34TrP9oJ9QVUAcFOfr6jssGy6RVJZxIlPsmh/an6BfP5B2fQF3xgu5qBFz1fwXynui5+zqNUfPsSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6992
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

drm_sched_tdr_queue_imm() permanently zeroes sched->base.timeout in
order to fire the TDR worker immediately.  xe_sched_submission_resume_tdr()
was restoring the timeout after a GT reset using that same already-zeroed
field:

  drm_sched_resume_timeout(&sched->base, sched->base.timeout);

so every subsequent job had its TDR armed with delay=0, causing it to
fire before the job was ever submitted to GuC ("not started"), triggering
another reset in an endless loop.

Fix this by saving the original timeout in a new xe_gpu_scheduler::timeout
field at init time and using that canonical value in
xe_sched_submission_resume_tdr().

Fixes: 8ec5a4e5ce97 ("drm/xe: Resume TDR after GT reset")
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 3 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 67d8ce368486..372b70a88452 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -76,6 +76,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	sched->timeout = timeout;
 	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
@@ -103,7 +104,7 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
 
 void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
 {
-	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
+	drm_sched_resume_timeout(&sched->base, sched->timeout);
 }
 
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 63d9bf92583c..6a1b93570fa5 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -51,6 +51,13 @@ struct xe_gpu_scheduler {
 	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
+	/**
+	 * @timeout: the original job timeout, saved at init time.
+	 * drm_sched_tdr_queue_imm() permanently zeroes sched->base.timeout,
+	 * so we must keep a copy here to restore the correct value after a
+	 * GT reset via xe_sched_submission_resume_tdr().
+	 */
+	long				timeout;
 };
 
 #define xe_sched_entity		drm_sched_entity
-- 
2.54.0

