Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5309AC04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238A510E541;
	Wed, 20 Sep 2023 19:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE1110E554
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238226; x=1726774226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QULVrm3IG2oLZHvKDU7m1e3m0srDDDS/tnyN7gdxVtQ=;
 b=aLzO593fuO3a4srD95UagDewvRjLSys5AxpkEyb+TizH43zEUW8bAbM5
 phW6BpyMrd/pChkiG4RcVkGtqBhAfTGX2pTXcCKTalVATbMLcc6IUJY0h
 sbvGVNvoYdoh4NMqbGNzE9tWs/x+rgQBFvHwYNePz4Wv9JdIc1yJI5mzJ
 M5Z08oUwSUEZgGeJFBD2mvqvolvF2o9HXxUoAf+4N0KIfnwM3S0BrybOT
 YUFvs8NfjBfVDimGA1e0YN1NVYJcMbBfJS6Q8yVZbFnwnyoiY9wPjvhbf
 CKzTT1LqYn0yAg8dQKoK6SBy0BfQvrWdKZfNlskcERWkQ2jKnYDzYzQPB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466630350"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466630350"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746771830"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746771830"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln8f4T+kt2mM9/kr7NqjcDqPUr0j9wNDFKmp4OuPZQCATLFgRZZbQ26EIu4sS6vc1tyAYALdLquO4c/sZEDo4jfRte6OHQOqdDQlkXhUYktxbLFTep4j8MPch/NfR8UB6UBf4jmsyp/xMIvIo0sC0Wwh0eIPGytjcdDTDmYz7e5z7lj5m+Yi7oqLUOvpdurTm0leFQl/JOYYKgw4oI+N5WlSVfNAANM2sNP6c1tgx4zq1t7Yg/aZiSCI6nq59wEiGo3fINWjUBv7/n230dUurJH42G4uq1H22u3XslUiMTag240TQrWm5K1oOlJ3k3TX9eNF1heV2m/dpCoI2EiAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aev34/yiF8jC0BIrnz9DqwI4Z2bLA7tA5l/xnX8KMdc=;
 b=f5k5xx0efiw6EWrfNO5XxH7S/AuT8fD3MILMUqGI3td23TgnaWQ/tTLtHrdAkPr6+1RbdZc1gYSXpLGYBFmJ+lE2QEEJUjVXKlRiM2xJ39RdE1JFBXhs5GQgTnW5veVF96mSKJQrgOz4rrVVrjYlO9xznBnHEcaIQXi5vaL2VRMVwhKC8ojAIw2rT4Lw2T62UKfQkpCCCWJwNfn0O9dqJ7BBIGikPrV+x8ELIDp/pRlzEHDi2UFrWw/mECUxetZRHb8cUOX7ceJhg/mGzraHEZ4hAFZyTzH9TeM56z/SKbQlVH58lIv7T20SkttTPPQVDUcrPsGTTmeJ83pfyXjE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:30 -0400
Message-ID: <20230920192940.135004-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ff015d-ca9e-4a72-11d0-08dbba1008a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yee7S+WUJ6u/LV/hF02tsSOhrf0EqTDGZvy0Gf5b2GK+14n3B6Ug7Zc80CIqcGdq2XZq+hVRCV2pnufpzRvPJUnAr4LlGe32QSxRceV9GGwi31JtwvnaiEjprc1fpp0gi5ZBed/vy+69wVH9sbkVQOKahGrbjDP5aF9nerCQKLQwu+jDlXdPTJf2MBqVYfxs+780wjd2oAX79W1YQNRoK78wYUYZfLSlWEadJFHlpFmIZO7MIpjauW2LJn+Tu9jBzf6B9W74+TDxtvNezD3kk+mr5gKIIwkj2FN7OavGbPQhTWxMtxabb3fehMXCGKoLCGaF6GDfH2cEqL3oB9C4tHadUNlROi7z1wNqBlvZDVzIG5oCtMGaL7n8zrkd3RNosj28VXNw3dE8BlSXeeRPnJsed50VVWEYzoEoF5XhHMCaH4k1h77eUkRpIIil06fElWIdYdV58vxwvv7J6PWD5+oDIyiYiPkRERFQMt/bgSn460YRRDUdj84yZbwuFVR1Axzaxgc5pzpSRs+xIWCZ7I07W1doNdDfD71pQjvz63Y0lIdP8b1DMrlyvtciX1aD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vdc7krtuc2DWvYeI2+49PWDT0ewrZXZpwVzGZi9comEkI6P37Hn5mNgtOpLx?=
 =?us-ascii?Q?KzbobTlIqnbmY0m6q/mKa1VXW1c9n12cdr6lLDJK+oXLOFRZM/YISYBzC2Mt?=
 =?us-ascii?Q?fg1ibVbbnQyzhFw6sZJRs5h95KWpEQDisEQjPU9VwVsFk5lE+MZAeDBqLM72?=
 =?us-ascii?Q?vFlV8L/W/LaUiD7bBhrJs2YyinmHzZsddurShpVAR0vh3LSJUqN0zavsP3UM?=
 =?us-ascii?Q?g5EQRuvEXM6Av6roXw0GAnbAO3j6UuYndw2Lytn6rSe8vOVp33J/8Kv3oHtf?=
 =?us-ascii?Q?h7sCFH5aVSPOxnFNk7qP162wp6O9qw8pT/ovToK9hs8Jgsm0W0/o2xSJ7p13?=
 =?us-ascii?Q?JpebudnZjtLrr28Wl8Yng+b8WRgAEkKxU7oCaVoRfrEUNHLUnGl4AXa2aA0Q?=
 =?us-ascii?Q?W1XjeuVRW9Fu03I9RCemQkTUd9/ka42KhyQGefPgaJu5RNZfeIKdomzzGl+8?=
 =?us-ascii?Q?j0NepCQGt/UkU5PrRWj7lS/tJkir8nxN4s3g3vXAqwcP/Lgg3RfQ+5oni9I4?=
 =?us-ascii?Q?kST7dChIvHwhbsrSD2F0v1bDtQ7Hko48iX5IzPsa48V8mif9/gVAmieXXGx/?=
 =?us-ascii?Q?Cf/tJnHESftiZZznSkBmpoOT2t3PxEhqQBRiYRA64X44ISl2iBktfRcjd+by?=
 =?us-ascii?Q?ipaGp2yiL23r1Y7lR7hkxaXC1rXRhy8HXnmdLmvyo6ga5DFsFpbAyHVH7Y47?=
 =?us-ascii?Q?jdC5oJRfQV5kRqP+RD4RHbdciugHCK8+SUMPOY8yl5P2YRkbZl9hDYd2qdB2?=
 =?us-ascii?Q?bNHUMN7PwtQb57OZAvZPcLmYgW3SLSBNDoR5ucaS/9Q5ZgzUVZdrGA2mfdcw?=
 =?us-ascii?Q?xK+ZU+GDkf37xG9uFSRrP4PeXH6IJcUxPvI08xdmRxufdvJGtx8dUbU/5dDN?=
 =?us-ascii?Q?2OgBCuffC2WxxUZH16P7C05iqvFKvdSHeF1iFGvOTYubJcKoRrronOJV9aPh?=
 =?us-ascii?Q?l2X+SaJTANyV8WvVvGop+7HbI7XrsoGwG7VYD3Rfa/E5uwGsEr7qoUKLn17Q?=
 =?us-ascii?Q?g77Ij7ikmIlGvFj+H4f+z2mP6iigiUdLE/yUbIYxbHdA4zWtj2LqtIZb32Fo?=
 =?us-ascii?Q?Alax8R93kUGgIZYT/QKmQ5NmBU5zaWIMG6pgTL+phq8gw2mPzFguD64NrMPE?=
 =?us-ascii?Q?a4HyI+GCF5vNhZQCsdDGzuRydV6x+2QjhR/lpw9+SbB6OY/0FBcOBxJNUnzb?=
 =?us-ascii?Q?4MreUUqjJQjRzy7R3+AP+yK/7JNLa5ZRiOFMXDZZepwYnrKrBLN2K/1376i2?=
 =?us-ascii?Q?ZnTdvGWAp1dj4W/iZTujUKqoemEm6MT7luM7Ar37ubic2cy/0e4KFmYHqt0G?=
 =?us-ascii?Q?ax0Hr8Zc3bUNxPGF5pnDG/Fd/zXjHQ1ExuooQI2yQvca+CnN2de9ZSx1rr23?=
 =?us-ascii?Q?KXrM0hyJnUVzqMgEfd84BUyTEweJCZaA+EZGFaDnueRMLNru/uMN9j+LAzUl?=
 =?us-ascii?Q?GmT196/9811vxQxD7Uwa4USnitI6CgGSnmgL8GwOTG7wkKdA7P4dppbOP1bj?=
 =?us-ascii?Q?bNxTRKghx947FeoiRjkRj8o31u+rOtYmKJ/tj9hhZZlNAp4EOj56HAbBucSJ?=
 =?us-ascii?Q?DN+2NUfmS+gFydi5X5VXL1AmWnEkKvjSd4JQdX15MwjLHM4eGgfQdvN82si6?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ff015d-ca9e-4a72-11d0-08dbba1008a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:23.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AHu1e0t9XKqIC9qSo4+J21nCUFYVCiFp/blI2d84BTpLuvA2eE0ZqENJzNZCplC9biQYaSoVroZJ1iXvDj39w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 10/20] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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

From: Matthew Brost <matthew.brost@intel.com>

Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecated in a
previous patch, drop from uAPI. The property is just simply inherented
from the VM.

v2:
 - Update commit message (Niranjana)

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
 include/uapi/drm/xe_drm.h          | 19 ++++++-------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 170d9d9c48d2..f70332986c73 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	return q->ops->set_preempt_timeout(q, value);
 }
 
-static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
-				       u64 value, bool create)
-{
-	return 0;
-}
-
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value, bool create)
 {
@@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e39d66a65c89..fb7c3a8ac572 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -784,21 +784,14 @@ struct drm_xe_exec_queue_set_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-	/*
-	 * Long running or ULLS engine mode. DMA fences not allowed in this
-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
-	 * as a sanity check the UMD knows what it is doing. Can only be set at
-	 * engine create time.
-	 */
-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.41.0

