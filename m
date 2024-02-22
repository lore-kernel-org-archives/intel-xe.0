Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08A0C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780D10E9B4;
	Thu, 22 Feb 2024 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPHcRqiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D351B10E9B4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619997; x=1740155997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y7UCV3MI0FKrrW1V9o5nga9clsYnghD5m45tQVXTL+c=;
 b=RPHcRqiWkQoPXNLc2ThmaH7te6hJju/oLnqOzdsUanz0stA5psGLU6mw
 rtOHs/J+ahSXoUO/LPFuFX1NhCjZpgOSpUbsfKKarLnnl5+fIrfn2P0/S
 gEJxVOK2Gc0T7Wp0LJVinQmDDZnfvMMv/UxyxLb99e6mas5a0ojuPU/PP
 xbuaF5WbQWCX/PRy/zuOSSRifndPRJeIb/n2mJmhzs/972J077rVCPQbj
 HsARtj8qCzymAIgRFXAV80BT8kASalVyZDnLFY3O5NuY6qM/FwWzuudlf
 mpOt2dAcH8icEhtzcQb+ltUPVpApZ0wuFGuelu9mVEIB9ojodcti3F94G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28296212"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28296212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5490237"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:39:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:39:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AECgs47DuGYAj6ES2xEIKdJ7bJb3y7zK+x8MKywdGcXn50ZpDVMZqmX425surlj8shaEpYgTErPeeszxOEsRvrdPGSngBI7gbqUA9+IHeVe+DC/j8iOHseXlmIUTeOjpUXVVqk/6ag0XcwGV5/+IV9AmUhh7LCdFjH8xsnNtubwtY2MIHnzQqaZmsSWNEhWW53hjPqMG7tixS9kirj39L49hOigDpeWj4wC+rWrivs70v545o+Ssvewd06vuvuEUEH1u36JQsCyjBWOUhMiL9kWcLmlg6gwsJq5Qsgkm80pPnjdvqPWCLM9msUumh9S09z9UUSGOBSQ7yZKckcLfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=300vmas/U1T+nEj2y82zOQI4uAt7DleXHvaK6JOihHo=;
 b=WB9R+HX2XD4A3CUncDwmND+6TUJgTS/hDXrhC7B28aZvbPfgjxt3VCGWiaVmnmUw9YyQuDsULTF97tFJ6XkltL72ka8WP7d3m8erle6paBMb6I6OWbWJgKu/sJWRvAhbk4D66kt8JODc5OksajTnemx7PmFq/HPu+SR2oC5jn5tVHWELspDpAySVY7qWDX4DgqRsUE7li91H1LT4yPwWqyuVx2Tod6PF5U+2SOjUqaJ9iY5otliu723jgBj9/ax85on6IXayF0xrj8gMBlKuHII9mphC+qyC8rpOH/H4UPPSnYMuJ9kr/rxyU+ZEnNaDid4pDBD15epWL1OAP1kaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 04/14] drm/xe: Convert kunit tests from mem_access to
 xe_pm_runtime
Date: Thu, 22 Feb 2024 11:39:27 -0500
Message-ID: <20240222163937.138342-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d98c880-e953-4a71-4841-08dc33c4e4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/P+/znFB/RZ5byIxrzNHlCF5ocOQWUiNvFIf/xV850oYx2vjQH0DF+IrIF31B8yqTwg2XzqzQmiVXHJG/cLHd/43SOQeo28K3nkCwpGWcwqqGHAP5ZUGbJZoN1Gq5YBrA+/ZZD3wuP0HKtFU3grk0iBIFghuMgU9NQfeL004qhqQAsza6DHTpZRpKcYKMRYxoyI2jIY8Ov6Lmsqf3PFQZflChfBbqVQsvAvH7EeXtH6MIHKAfLBVZEKaDYF3CSy04mRXMFq44hfTrz31uOpgMt5OyNS83beIycIOf47R3S3Koc56ZVVNDABDU8Ht6Bb5/gjC2LjrEYjzkxpZv1ElI2FiZIWGnUm8ETNPHHZBcpxJAipCexgjMcpnP9AB4NZBvgzOnSUhtVl2PgKjMPHYxZ0gYzRH3Wtcqgjf8d8ObXpy8qR88ckac0w07//3FiQUUS1AAdrajPhmfsiFXkOkqfAmmi7Eh2h1z7jJ0qq5AmW14kIORUaCBBEkAvSPMcJYZ8wqQKrpHLbdu2CR4Ems6XPBbEldST7hNXW9j9uG7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AdofyXg/r02SVoIZXoPyG3oy3mFWduV2MwIGaYEHDA/oxMRK+WaQb/n/XJNE?=
 =?us-ascii?Q?VF9GO8bPu6bmky3IGvLV1kL2+UFEG988GNTFxyq9ErFoXoMIb+3ghhyudlRw?=
 =?us-ascii?Q?Cri4ZXGtTu4kRXL0QzQ2juB6Sl0EFY59QOYHI6zeewfbZV5snEJRpDl8VUmF?=
 =?us-ascii?Q?AQqnnekLeML8dcgGzvuLbLdiTF3oxMdGiYgGUyZjZniSgk2np6YTVX3tN98m?=
 =?us-ascii?Q?P+UMhW5Ii9Ko1nuB8eVwz+PRrfBKzKUCYH/Xi+oVNi14ZpexmDnM57GpAvgy?=
 =?us-ascii?Q?TBAxOd5Cz/W5DzHOAUyEDBDf802OPFgaJyhj67zU2Es3sdb+cOC5ArQFIffl?=
 =?us-ascii?Q?4eTJKEuB6HICC6K9OFtLvVSO/hEjNVZ7A9bP82XRvhnFTyvvrca3Ft1sakSH?=
 =?us-ascii?Q?6hLw/4Xiey8iNLzcQDkPRRoH7B1ThHS+qd0e9eO8jhc8OB96zsfWk2HNXNHE?=
 =?us-ascii?Q?MzNSU3DRmAO46txFOY5YR88flnEqvoQ/Ri289bvawskcYRY0MSbdMd5fCBt6?=
 =?us-ascii?Q?s8Swr2zw8fHhS05kApzcp+GxorO6mcOsRZ1MG6DmfLFZKwS4JbfNXsL9wwHK?=
 =?us-ascii?Q?HuVEcbrLZRkOox+vm7wQOmJ27WJiZMgHNaCbL6dK6cyLQpUf4RLVvvimH3z0?=
 =?us-ascii?Q?vfqWixkze2Ld76oERyJq/YqUN+k3lQ4ipHRydj8A8rcJAM5fRp3RNW2edukP?=
 =?us-ascii?Q?Y38DnqEOpGI51N6efjZAg65gjGJC139/HV5GTqYQdiQ+kBxF52Mq2n80LWPf?=
 =?us-ascii?Q?3IkxXjqq+WARH+VeCBhZqNvnbcXwKOb5FAwwR3jTcrdPik4JE8UHWjXlYhPw?=
 =?us-ascii?Q?yl9iyqbpH0SfyLQlCw09fGccNtGEam1SXEruVNcVSv2t/cgM67IAVwffLRlm?=
 =?us-ascii?Q?X5GlbiGcybepZead4pIBUKOUlX30Fm/JrS1MxH22iFkJ3F83LAtaQ7cuFpA6?=
 =?us-ascii?Q?coz2ARUkDdm/fcOg9oraLcYXBLRnP9NT6sjBrTaZ75D332aOXxMLC0UEP23R?=
 =?us-ascii?Q?lOaIEOmHm0flvgJ/dnyJQ5HslsqKjvq5vY8RD21uKgIz7oS4c4fXUf04+aUI?=
 =?us-ascii?Q?c807r4DX19+F+lBR0iG8b2GD/nP7RuSfsG3XyZoO06a0wQjdwpPGEOCpWpMa?=
 =?us-ascii?Q?xRFPsieYNzCUzaz6gdIG94b25YXfweSfJbO5/D+t0W0KSq/6MHkophFToJb1?=
 =?us-ascii?Q?kBcm46B8aoCuFigLX1zqjG24NSG7HMHWOFfCuk3S/DPgKUtRluH3H95cI/GE?=
 =?us-ascii?Q?MpFTB4OCoGf05DmYIsXPGa9mvPriOzl9cQvyefYExnlwv7BAlLY4oYl8VogP?=
 =?us-ascii?Q?cFAZJPcasYSX7+/4VoEgYdi1n8DDGPURZ6oIfqOj3du621upIFwW/+YGSaoZ?=
 =?us-ascii?Q?YDFlUI+1LjlNwIrcLMSqdGbnMGlNZamNU0nd29bWESOeSyYbpeiq+FLIn2rR?=
 =?us-ascii?Q?Dp6PbHAdQm/tdd71Vi1jnblEL7JKRaDTySDPSIfgbkj6XxrSzA+jDhFKF0nH?=
 =?us-ascii?Q?GVg8M3OnTKkgtiEPc3oCyzdQNFmNj1ACpN44szRmSofjulJ4LPUtmXtYgZ4g?=
 =?us-ascii?Q?T+KnKlz/ZTYt3XPF2HCMgq/zDZ285DVfCFVKnAxBpSKa+SAtzVxBshenr5Wn?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d98c880-e953-4a71-4841-08dc33c4e4c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:52.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2+JatfH0lXRyfqQ8sNc5dxXFpV98fqCREgCztgXzhMA7nTi3BljC68ggwxwnwenmKiUZPUwvgckXw3zeimz1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

Let's convert the kunit tests that are currently relying on
xe_device_mem_access_{get,put} towards the direct xe_pm_runtime_{get,put}.
While doing this we need to move the get/put calls towards the outer
bounds of the tests to ensure consistency with the other usages of
pm_runtime on the regular paths.

v2: include xe_pm.h in tests/xe_mocs.c and sort the include block
    while at it.

Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  8 ++++----
 drivers/gpu/drm/xe/tests/xe_migrate.c |  7 +++++--
 drivers/gpu/drm/xe/tests/xe_mocs.c    | 19 +++++++++++++------
 3 files changed, 22 insertions(+), 12 deletions(-)

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
index df5c36b70ab4..df0cbb2ddcb5 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -10,10 +10,11 @@
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
-#include "xe_pci.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_mocs.h"
-#include "xe_device.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
 
 struct live_mocs {
 	struct xe_mocs_info table;
@@ -45,7 +46,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
@@ -65,7 +65,6 @@ static void read_l3cc_table(struct xe_gt *gt,
 				   XELP_LNCFCMOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -80,7 +79,6 @@ static void read_mocs_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
@@ -100,7 +98,6 @@ static void read_mocs_table(struct xe_gt *gt,
 				   XELP_GLOBAL_MOCS(i).addr);
 	}
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
@@ -113,6 +110,8 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 	unsigned int flags;
 	int id;
 
+	xe_pm_runtime_get(xe);
+
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		if (flags & HAS_GLOBAL_MOCS)
@@ -120,6 +119,9 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 	}
+
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
@@ -139,6 +141,8 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	int id;
 	struct kunit *test = xe_cur_kunit();
 
+	xe_pm_runtime_get(xe);
+
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		kunit_info(test, "mocs_reset_test before reset\n");
@@ -156,6 +160,9 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 		if (flags & HAS_LNCF_MOCS)
 			read_l3cc_table(gt, &mocs.table);
 	}
+
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
-- 
2.43.2

