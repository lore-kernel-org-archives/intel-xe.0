Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA9C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A127F10FE60;
	Fri, 26 Jan 2024 20:31:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E0010E2B6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301082; x=1737837082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WGStLOb5EvGxxH1cOimJrv9EOc+jpNXMOUXHpBdEZVg=;
 b=L81B2xPH4Ll/zl3kBNsuStEhua5j+MSs9En/ejbE/7dJ4MhNxNr0Zcwi
 3bFTiG+WlA8Ypr059+VmL32+ewDDjSmFNlbfUbRKnMUHoUf0lpw+UGRaf
 6BRRBnuq+sEfR6xrZNjWBX58wBHS7suOFzbnCWyu9xvNGr6UssAGPOC75
 GU9FIY/D6RV6GnNMk1ID7aF8rONyL2fGo6QQhwznxDXLYJ2mrZwn5t+Oa
 XHdAJHywQ0lAq8gkCE1o9tr4ooXNn6+AmltFVVkjRwJOWav5vB36s1HOQ
 YyJ2O9OoXSyPU89EeafuJovN14zn3qEAEETE5Io6E7BuI3qHxxgqOnMwj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948428"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481915"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT9Exq0w9aIt59nvz1pqhhUScRqXUHSL+aziWetamrRxlLJ5AQJXAOdcFBjCulE6cuT1ai+NrZ6Q7/qat+Hjs8YkxiTO6xk0ngwqouMXhjO708gWerwVIWzBT+xfDan8OmrKJaGjrA07zmjoqPxZgLkzbLHASocW+XLsrnzoAM1X7qMlfNVdn4DR0UyfiYMIdwedEQD2QAdqj9f7bSqQqYW3EWIB1HwXg9NzjLop+juZB/aAzj4m99lPIYRQbYgwP+Whfku7izyIGOY4XbSRIDYp0wmYGok+R6nGupMO3bil1ijf7WYRCbrapSd4luCs2dPCJh+UctD3BXci2fS7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSsiE80ZqiWBdc0vNSSSoPrPkh21dZ92QxOESJLJOEc=;
 b=E3qAmzOsbzVjs9AehsJ/JknWdymLfr+S1a6xO3q14q4llgSW43Ks1bsKt7AJYEEMWvpCF0cTj1rsnJ806LiAuLuWUquDXWKNh4EEDfvq6mZ2feFZpJftKd4qTwQlwXAC7BSyY91uVa+zWpsqPweZvDcZu1lNwoy78eBDWvmIZzO4ObehTRIYPfgzxxbC8mSgrP//REtjQQr2IvfGZjAdtUFhJh2St5KtVfmaIqIUBVyqswZBkusSu/Yml71zwPdkfguHi9HKOpSO1/xw+3z8kfKY/XwR+5uyjCqAHL8tlk0YQ+nsLDMgsCwkTIPhWVNQyggUkvJhPu+KaF0hMuEjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 09/34] drm/xe: Convert kunit tests from mem_access to
 xe_pm_runtime
Date: Fri, 26 Jan 2024 15:30:18 -0500
Message-ID: <20240126203044.1104705-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 086dd5d9-8242-44dc-4293-08dc1eadbde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrU46IPYXCBlNsGcoQIlxZETo66PGeFRlSfBG65qQkcX+GSy0eyfzX61ihXA0v2JgOlYgYU1jS0q8Xrqq4LLre6hQpEvK39RINkHD1664J7mhPwmyhtjIrRXPVZU7HLzxA+dbrS8/fvboBSONQz8UTe1q95tJoWQ8D4Dy0SifzsSN/cclSvPfEXySHMGnBjmBMx0nvPoZEc6hOzV8ij9Sg/gB6K0qXGj1GkQpCUabk/Bn5LvvcncQcxkefPnqmSHVKLaPzpU3SIipbHV26f4m7ruYrNsQVyp6wVNlFess0f1hokyWG7eeFEIY9KxZcWFgGq7MridsQ5mab0RGOkZbrR+sB0KQPifnuSFfvpBaiz4f5m4PBHfluof0ao2ekTupzjlF+f/3TqF4ofK8Hervuww/bsrXLylRyiZIKh9tSAHSGcuHs732U53w06urmU/4DuBZ6LFHYkmNxq3z8xxg1t3g5u4qF9gAoBspix0k1GPtQ2VHXWgSvhVwyVbtli8d/9usXKvG4Scoq9t9nbtKUFA2yW9Asm+1PwjAGyUVJuu58ZqHSTIVBZhZpO6D/wc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSLRB4ESw/724zI5EPLtkhX+fDwyd5q8eOTl27+musv3wexBOIwlm9fcC1pe?=
 =?us-ascii?Q?owY9pn9erCUSlr8aceugE5OoYtBQsHFSiMgOnI7K2zymWfh9DCg6lhtC56wt?=
 =?us-ascii?Q?9zt9hyoAesJ3H8IpvBpeUtZOHxYYsOGwc0bkf53LlT/NbQUEIPbjma1PgPSK?=
 =?us-ascii?Q?W7/txXCRHJlWG0X+YSk3dAaEpfe8BA7kWUF/asmMA8TfXDFLW9ZvKRJSWPNt?=
 =?us-ascii?Q?t7xCqdeWoImIp7pcC6iVVUmx7EOFh5xJ5UVc+792OphG9R0mpRuJy7xxzN2y?=
 =?us-ascii?Q?Vk2MXEe9DZ4ysC10rLqyhTWSzfZdfyyBLZu/QLuff2QMz6n5OzOEtgTekIGP?=
 =?us-ascii?Q?05KvYnLIyUfwjNL7TUuQtG7IZKa/YSUOOQgHa65U6/WXleg2C5pwRQV6Ygz5?=
 =?us-ascii?Q?drsq/b5RQUUw1cBn/CIp0/srw8oW7jCeRbtyskmAh9drnaGdSwLhoFR9rNqd?=
 =?us-ascii?Q?KEu+uQZ1AVmy9XxT4WGo1OaA4//6edGwRdhs4OBBZPLNJr+2liW9vwiG5MDh?=
 =?us-ascii?Q?w/4jfZbeKplRr8d0MkOhul1ydkyCADh7A1qC2KL9pYLslWrSNeJKkYel/+Vy?=
 =?us-ascii?Q?xqdvLiZPk8O5dOMSEwESMrvuKu+pypKyrLYjcynyrJtHosLrc50+VhVsXG6u?=
 =?us-ascii?Q?JWX0oVIkVRhswfhRTIBppyTiefUswo8a3jNBpOnXfgWMxYJgZYzcCqQfMC42?=
 =?us-ascii?Q?jUoHa54t7m6XUPVRLTP08lBKqKr7eIuQ+jGERlifTNzGTWIIgK5jrbyAPGqG?=
 =?us-ascii?Q?MA/ciOO0sa71o2dAj3YAZMe9p91Oej7PfmzuApUk7IJkIqM3G894QVV6EP6X?=
 =?us-ascii?Q?JehnmpSTzha4j3idrM/DVLW8TIXTqpUqEmGxx7OLLA5nEP/vyVK0bPgyK6Gf?=
 =?us-ascii?Q?aCnxf+Yn1uYnCgHbWgpd1a8kNoSYO8kb1ZLurH8enxa4Yp5cNqwdiihJ+oLp?=
 =?us-ascii?Q?vvib1qfo7z7N+AADqysIZGYql9b9+ZoMlqvv9hgyOtmflB0XEuYvLbeD/Mae?=
 =?us-ascii?Q?LOLzZUGT3VXy9AAOcjvBWLBPcehIIwAPqyYsqehUh7xl7lpcGuR9sfJyKD1a?=
 =?us-ascii?Q?i3IbEnMJ2J1H89MxAZAhbeGeZ9qTdpf06TPaSYZHQrccZayVuGnox3hCMJ4z?=
 =?us-ascii?Q?OUum1LZ+QJHl8aC5I+WgrzdlBgYDo5sKxitwDOF4PtnFE+SvPIqNSvFm0Uy1?=
 =?us-ascii?Q?0MSwe+ladPoatCPEoj8Xm15IfS6SWi3fQS92t5yc/jYTQ1ULEEw/809rXR4G?=
 =?us-ascii?Q?Ij7qqvi8LrH096g44Z1tdxfFGtzTXquj7fIeKVPEbLsqgMmrgAPIQOY7ysqt?=
 =?us-ascii?Q?TfwBvWEIs16MU3UtWbm7sOsNr8zV0CwPZh1dxq1a8PxixQCPIkl5fOb3IrEm?=
 =?us-ascii?Q?L4fCisIKIzMx60m1xRm+Lv24n/JtWTt1FDED/IxkTIJwDRBoi3pqfZ1HkEgp?=
 =?us-ascii?Q?sjzy0Mf3IQed0JjvE1VRVYyZ0SkMg671lc6psiiZrz1QQyqmKGAUoYXJsEnw?=
 =?us-ascii?Q?yaEkYBtmT5V49TMaA86v0oV4A+Uq8i87X5tQI7EqFHXuNrubxdbLRCCtjBH5?=
 =?us-ascii?Q?xVrakaEnv62urhSexgB0TdT+Lw98JxFXe0cRrTxHyq1waVSRUHFgwRd7Zu99?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086dd5d9-8242-44dc-4293-08dc1eadbde5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:14.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iobTeL2LvIwURJX5DV+oatZByRlw/ie+sLOI1IELWyWgLCtk7FITmqC0u89ArdnI4R9LEzBzvhPr8lH1+865g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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

Let's convert the kunit tests that are currently relying on
xe_device_mem_access_{get,put} towards the direct xe_pm_runtime_{get,put}.
While doing this we need to move the get/put calls towards the outer
bounds of the tests to ensure consistency with the other usages of
pm_runtime on the regular paths.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  8 ++++----
 drivers/gpu/drm/xe/tests/xe_migrate.c |  7 +++++--
 drivers/gpu/drm/xe/tests/xe_mocs.c    | 14 ++++++++++----
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 3436fd9cf2b2..0926a1c2eb86 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -163,7 +163,7 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 
 	for_each_tile(tile, xe, id) {
 		/* For igfx run only for primary tile */
@@ -172,7 +172,7 @@ static int ccs_test_run_device(struct xe_device *xe)
 		ccs_test_run_tile(xe, tile, test);
 	}
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
@@ -335,12 +335,12 @@ static int evict_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 
 	for_each_tile(tile, xe, id)
 		evict_test_run_tile(xe, tile, test);
 
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index a6523df0f1d3..ce531498f57f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -10,6 +10,7 @@
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
+#include "xe_pm.h"
 
 static bool sanity_fence_failed(struct xe_device *xe, struct dma_fence *fence,
 				const char *str, struct kunit *test)
@@ -423,17 +424,19 @@ static int migrate_test_run_device(struct xe_device *xe)
 	struct xe_tile *tile;
 	int id;
 
+	xe_pm_runtime_get(xe);
+
 	for_each_tile(tile, xe, id) {
 		struct xe_migrate *m = tile->migrate;
 
 		kunit_info(test, "Testing tile id %d.\n", id);
 		xe_vm_lock(m->q->vm, true);
-		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
-		xe_device_mem_access_put(xe);
 		xe_vm_unlock(m->q->vm);
 	}
 
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index df5c36b70ab4..d561582f8063 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -45,7 +45,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
@@ -65,7 +64,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 				   XELP_LNCFCMOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -80,7 +78,6 @@ static void read_mocs_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
@@ -100,7 +97,6 @@ static void read_mocs_table(struct xe_gt *gt,
 				   XELP_GLOBAL_MOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
@@ -113,6 +109,8 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 	unsigned int flags;
 	int id;
 
+	xe_pm_runtime_get(xe);
+
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		if (flags & HAS_GLOBAL_MOCS)
@@ -120,6 +118,9 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 	}
+
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
@@ -139,6 +140,8 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	int id;
 	struct kunit *test = xe_cur_kunit();
 
+	xe_pm_runtime_get(xe);
+
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		kunit_info(test, "mocs_reset_test before reset\n");
@@ -156,6 +159,9 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 	}
+
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
-- 
2.43.0

