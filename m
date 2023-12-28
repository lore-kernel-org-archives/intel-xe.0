Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7023CC46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1F310E1D7;
	Thu, 28 Dec 2023 02:13:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A633F10E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729581; x=1735265581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EysT039l9CiJk85mttgTRLIiYQh5FnIBQWhNb9ZvG3s=;
 b=lt1sDQi0AjuMcDOP0ISM1mP2qoiChSP170lkcuTXuQM3KCDiZnxdatIC
 hzupu7yKGZs7Vu/K7kHi4FEb3JhBWdvbCsPoJuO3DsdEgmnBdow/qfhtY
 HLGW/U0werIhl+TUkQSrZp+4dYZlkWGbtHSDFYKxISE0jVjyMWe085k+t
 fSJrOxTIGmrlt2ICokBMM7uhSqWxu7Ka9gzDuWhfJG6ukjYJETmsMFHoM
 Lk7QaGX2LXQSIEA5Ek29YjduMNG5o2TIc+j9sqNg8E+a6Nz60HqNR6ICv
 7ZHgUcIs2hswANvBB1Fq8w88+8z13BjZZbmWjEDH1XQaiiUD21E/q2p7h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062192"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062192"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014326"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014326"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0yfPTI2Ed9h6rqGY/cweM4qzJOGn+vnrrewiN2uSa7V0Ip2CjG8r2R4HE8HEAAJ2JVii4os7XOk1D1XO5uDuuhKu78I11muKDK7ODayc36QmKRPKHGMJuPa9+WkwKLiIEhd1fuwJdf1FcutFU9BEGj/8RAKnFe5owR0knnGz0A6P+JOP8NGyCOe6xkkootub56nZeDruYzR0nva7iR4MncLKFsNoIrg8vlVZjeyRUEF/+Oc4D5HZ7gdffsRz1i7o19umT5Hvun+S0ahC3T+oNyWUmIcbJQjIgeRDkEU46PaRYMDMQMp+LzeSNBC12n4wbQOLQOWAz9eW6kGhrXCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+TaYTP7ME5wD/QXNBM0LbnWRsOtOLjQpVU+iE7+OGw=;
 b=Pqqc36SA/catvkkACeuU5+fYasxVeEdHiwRsiiFDH9QAk0cmSE5P9O8bc25pcDbVz7xzVitqV7KzNITam/EppZkMh5ZH66+RmFlYZH6cJ5jGHGqeTq746DGvx6FDNUN9rXzN/gi2jBO8Km6nuS2jzCIZTf6eKtab0u0kNR9lcurutdHKNH7LDKDqfppkLx3YCTkLvu41Y3z0I/o+8Hkl3i7x6NJbteKqsVxLHGTfqkt3o0dDbmo3WDTfWopXS87zgkxYEuW3Ba6jj96uWzpZdQgV3bZYThz4UXJevZEox1yRim+GM5KaltBxvVynWNNhaLkr69eSHqTpD0CErad1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:12:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 06/20] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Date: Wed, 27 Dec 2023 21:12:18 -0500
Message-ID: <20231228021232.2366249-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7868f5-1b6e-44ab-9e92-08dc074a82eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VisRWcFBn9W84xCiTByyhL8JSe6V84HAns9DqTkJW0aea23GDY3j6C9ZXm0r0kGhd3bssNvVpny9CJMPLb57FvEKA5+zLYXGFzKaQ4WnaqRWUtMtqEv+4brwZkhXJVRBXaF2y6SNIo7J9IK+UK5uFJqMyX6QWSLU4l5SuIYL8lkB0iUHhjwKcB2daNRScbNPBDSV0A3uJ75goDryadlV3TMrHmAeFo4SC4GpB3X4YLK6aDN7rulKUivEvLxb9XC+iGNLyFiGMpOaPjJ5COkePX/0SLihLun/M0FpznRvbmPFRjKXm1NllDkeKYVyfQCOltueW2OSI/K5dGFTS4hW5CcmPxEV+tB6J0ciGIzNlXFrvqVJyrj+vAmZX/Ea0545G5ZaFiSKVNNNTjicBp/nYPI8wNBFMPpGy2V45QcwawUPEBPdPzQfwqSgErbZsLmuOzbGAYC6t7G9ExhDa3s+SfE1UXl+Sx6rX2i0H96ZQARUT3JapD2o5a5DsDZCpE2d+YlBx6gGMzegJRfAp2gQ43qkmcAY3a5lhs0wFN6TyWbJcaxBkO9lRB7N7ZWoBtujjrUHrijnqZTBOkykWGRHyj8rXd+KKSBxoP2CFMWcry7EYL6GvEwf6VY+7vynzUG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HSqpZsPYCG3bnZ0ovJe1dvIOEtrjY9Q2krJwUxFv8gc9mr7mDKqMzu4I1FMC?=
 =?us-ascii?Q?DBbgFsF6qMWzoVI6AJzfUjA8c8pcMJeY65YXOEZayXY37Iih0wSzsUzZ1Dek?=
 =?us-ascii?Q?vHyeFsRaGRGFOekOU76oAmfcgsGl+IWAdiXdhBMqX96MYzkVjVVNYFEPjxIM?=
 =?us-ascii?Q?JmSyCcDNqwndIvJnywjM7ux1WKxLtnj4lXoDWnp/iR5gYjqBN+3PgVnhsQan?=
 =?us-ascii?Q?E2lRl6j/rv3r7VTh9mGJkPg28IO90Mj8ril/Qkn6rmnIwxE+JOOn2b0aZ+/z?=
 =?us-ascii?Q?JIIoFWfjYbUxVIDdLsjfn0pSH7DinMcWOLA4lmELnKrWhfYTAWwTCZIwPiXi?=
 =?us-ascii?Q?BIj9Q3FdxyyEAP99dEoNEJmfcrW+JGy+4rXrbex0xRpmk3IRlgzrRCRHX8fK?=
 =?us-ascii?Q?MfBHZqVfcz30Wk6XZgO4eI6T97qxLCZK67WF0jEmvRCf1dUoTAR3GG2jYSY1?=
 =?us-ascii?Q?pTEbZAcWQFxo6y2TLs99VKigM4BO8qSi8ZQXESq8D++4FO6fathSEFlQN1+n?=
 =?us-ascii?Q?QlziupuziZTmbGdePh53nXKswhad71qucZNtyRcVrwNm6PH+yBO1o1Sq0pqO?=
 =?us-ascii?Q?rYWfH5XShrrns1reZnT3tglXbH54ZL2xLBlj9ERbwHIl1JTMXjoIavioL9k0?=
 =?us-ascii?Q?AF0vJ7ki63zS+X9EWN6nuAXiY8l4/r0pwiQu8SkQuA6SLQGdFHDQ0d2SGUGW?=
 =?us-ascii?Q?72w+ngQOVQbZKQLFU2s6wIEzLSMU8Bty03AZx0Yo1XhlfVgzw+l5jkB3KONS?=
 =?us-ascii?Q?0wfgGUyhO7CUj20RINI4An1pQQtI3CrAq4+ByDMtb1pfisaMjscNHtGZs/33?=
 =?us-ascii?Q?x92Pgve1Olm0/LtooVrC1k3AKtFNeTLvT8N1zi9VP4k3lKuCL0JOURCRu+51?=
 =?us-ascii?Q?zD8wEL9PEdMIkzKWOuhJlClndGF+TUVkehYlZLrsDNsZmt0HD/LWIUzd/bWy?=
 =?us-ascii?Q?q0hpOp20b7sopM6xOv8kEASUciH4OvhjyfpfNlkx4sBT5KXIOFet+vQKly8g?=
 =?us-ascii?Q?sYF9s2FO2avQxECuP8dOz4hu4DIhhzXWgBVmHCU+QD5ov+l+KkO3D7kXDfTv?=
 =?us-ascii?Q?Xbh5YzruH0ePconxfsBS8skPHWjVTJCxAzcViGMxUDvNL90g2ll31hMLECDU?=
 =?us-ascii?Q?0BL0KJoYTzd0eY/4tjTtjuvTINrkTb/tBqQaUcKhnLlD9eRGU6D66ATRh0lV?=
 =?us-ascii?Q?QN0XmA+wvta9cX9+0xS6OXXxd+2+S+2lELujVD7qJOYHl7EXR7RFRwLEEnJ+?=
 =?us-ascii?Q?8K3lLmEgbwb3zKcG6WOw93l38me/vYsBN8hzZkL53wsAmvuRHsbMMdjsmD4j?=
 =?us-ascii?Q?DizwRfeJsTVbdpYpmXsmitEnWUgxkVMa/JgTU9c6dhOgVxkzwgHATr68oI81?=
 =?us-ascii?Q?WQMdPdmgHz9ePsUibnvyKF57esXTI04xeTJh45mvseZmobCTO1XfM1oYXfzF?=
 =?us-ascii?Q?AhMXGmZMpdlfMeYMaB4FYUaP+aeQvLGGy8yYHlMqapTUr9rSWOCrrsYE3uBf?=
 =?us-ascii?Q?thQ7csJEktobi+Y5k8peYhxThu6xjCb36r0mAUIJM0temKFTncE2MjanJO6T?=
 =?us-ascii?Q?zDGqqJciWxHo4uEjdxCGFcfQblZU0iD2JyOaclPMfj7EuI3viAWyL8r5iMXo?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7868f5-1b6e-44ab-9e92-08dc074a82eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:58.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/3/QqzMy1x5sFHMt+PfffJ26hGrVC7TteeScWg6OuEpU9ux0Pt3WWLS7nc8pgiRI6ZSt+OWhY1F6MFdI8he3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The mem_access helpers are going away and getting replaced by
direct calls of the xe_pm_runtime_{get,put} functions. However, an
assertion with a warning splat is desired when we hit the worst
case of a memory access with the device really in the 'suspended'
state.

Also, this needs to be the first step. Otherwise, the upcoming
conversion would be really noise with warn splats of missing mem_access
gets.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86867d42d5329..dc3721bb37b1e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -631,9 +631,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
 	return atomic_read(&xe->mem_access.ref);
 }
 
+/**
+ * xe_device_assert_mem_access - Inspect the current runtime_pm state.
+ * @xe: xe device instance
+ *
+ * To be used before any kind of memory access. It will splat a debug warning
+ * if the device is currently sleeping. But it doesn't guarantee in any way
+ * that the device is going to continue awake. Xe PM runtime get and put
+ * functions might be added to the outer bound of the memory access, while
+ * this check is intended for inner usage to splat some warning if the worst
+ * case has just happened.
+ */
 void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cabed94a21873..45114e4e76a5a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -246,6 +246,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 	return READ_ONCE(xe->pm_callback_task);
 }
 
+/**
+ * xe_pm_runtime_suspended - Inspect the current runtime_pm state.
+ * @xe: xe device instance
+ *
+ * This does not provide any guarantee that the device is going to continue
+ * suspended as it might be racing with the runtime state transitions.
+ * It can be used only as a non-reliable assertion, to ensure that we are not in
+ * the sleep state while trying to access some memory for instance.
+ *
+ * Returns true if PCI device is suspended, false otherwise.
+ */
+bool xe_pm_runtime_suspended(struct xe_device *xe)
+{
+	return pm_runtime_suspended(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 069f41c61505b..67a9bf3dd379b 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -22,6 +22,7 @@ int xe_pm_resume(struct xe_device *xe);
 
 void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
+bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
-- 
2.43.0

