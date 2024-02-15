Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA60FC48BEC
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5AF10EA05;
	Thu, 15 Feb 2024 19:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfH/Gefy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E670B10EA05
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025700; x=1739561700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PdliTIFyut1ihHdSi4p08mQY2Mog0/YS2LohIMIE9sQ=;
 b=gfH/Gefy4dC34q2et/0S2Qa6uYgs3kqAXeyVcdALBL80tR6fbmD/ebKL
 eXKwZ/9JfVsMf16G6O/OyWPOdC4TVSkOy/Oei9cetvOHg5g/OmKCSGiIf
 hBoXjcDkA9IdYKf59/pIg34B4ziUCbSs15ts4iGu9Q9fxQBeZ7EZ8Dhgk
 lcxULZaupbfGhz4Ncpk75iCWUtXdx2/7rCsTXvVA77Uqm47FvnKssn2na
 9SQI/G7J5Lm+wax/wwnJhgtSsErgkuijSwq5nJWGmB4dUDY4VNfdQUUPY
 xRY8J7IT92bpTw9n3awUl2xAJqzcbe8oaYNmZbT+8l4+pFSSaSDQtDpAv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13539202"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13539202"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8309400"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:34:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:34:53 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYgHHL20OV090FdtGm7HiHRpgAFsHlorcz8I7TlgURqo8ZNzjiiE6lmV1Z47CGtmcwVMaqhKDQMduzJPYsDBwWSzZAxGdEgzV+4dsg9r0Oh893JpQA4eQhRnunQtTkgzpel+D8b9P8yX9SrYyZ0P79Pwc/LDUvKMqW/JS1SKQPL+ASWSawFcEkubzvEkrRMxcPgX+28ikI2qIPLPYlK7UVaTUDxpBnhf/7rHpzx57r3yL5vteZC2hrxAM8KsrkUF5KXeWKerdSdzwffr2RDv1QXTaTRePtCpblOwxl4bVM2o3LLFFqWDnPldfe+6wBFbSACqE2aHIisHUvI+c/0Kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HJMTlRNzXbCH5ILwGNbP/ioH8HQw7L2hBCpZf+Prtg=;
 b=PR3yexpUzBcJi77o5IcnFaXt//az9E9qN1tuAS2h/Jaa5jpZoL5ae3LsUbtx5LzBkvHFyR8e74dClm7n6WDJ9SrqIwizuQF+iOlPPks9tyD1R1APusO2+zHdctwe8JmRALe1nEjPuO5ckVwOP6xpa0xVeX24c7/g1EJHyqi7PR46OznAW7i/8C3ZOoCStQVMr5thI4Hx0cyYrLUcUXOkcSXcoBfYgXx8lDQmExyz5T5GCVRjl2cK5PYDGmEZYQWjsckHjB/4Pkhp+TG3ZFdMgyl8yWUoWyFJ70rg0tl/pQlGZRhWk9UckfrDIhhU/Mu2SeV8UV5BkEUCqMam2B7Wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 04/14] drm/xe: Convert kunit tests from mem_access to
 xe_pm_runtime
Date: Thu, 15 Feb 2024 14:34:20 -0500
Message-ID: <20240215193430.130106-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a97e59-ce75-4d71-6f78-08dc2e5d2de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jo2rLOgX2K3i/9WeTUDsjDO6QYRz+KxPqJsb4GQMyRkHXK/t6D8p7HwnKRDMaCbU7amnIM01uvydGzIqqHJ53dLPr9Y05LCJXNVdx3FczDUndUSjgo3AVOUDUbypbtlggExF3/ZGhj6S1WFpjD1b7LUSVW06uYVn/bJy1f2YPZYq+itzRuZGIBvqjnKenWcI6TIjizA7CNwUcGcQF6NvU/SSosp94SUCr8N2XcutPq/8HUd7DYc1qGL4rGLwqZTk+pLixlVQLUa8ZH84FkSwpjVmp++cYX2l396zWki2OBmTyVThE2Q9I0Z7v7Iy/vx3aLE2efiEa1v9ZIqNTki82lZgUp7ez3L8AyLaSAXrUrn/jwskT7PDKkOwEypDorMSF5co0oqRis7Xvl57Dy9VwxlcXo5iY/pJLAb9oJ0kivvmS6U6s54/ekDmpge4L3Rwk/CF+8oDXvmdqsO8FkhsX8E83V5rXNsPeTdVio5h9Ro7VEbY9esnwdBH+sOsjQ8BYyq6kNfkZnbkr/VNm4SmqQf19GkjZYwnIaWp/3KnzES1GgXIpdhlGjcUYNzwQ9sA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lKucYxwSf7vQoV24mEuD3CCxQMKeKbu+z33Jy+pUEmiFLjwqLuNcw4sM8MVB?=
 =?us-ascii?Q?Arfa52YtbmOD33N20j9pgXLcqlCuDO6R9GBhVL6Tviz3oQFiF6HhYnJH7juc?=
 =?us-ascii?Q?VIvCPmHLa5i1EPPc988Wj+/EG0KNNXxTJraKFDE7hLh1eKsmU2FXPeHnVhHO?=
 =?us-ascii?Q?IaLtLSqnbf4S58jXmKEI85VapA1CFlItsxYNfX5pUwkpnfq7t9G9gJeuC7Q3?=
 =?us-ascii?Q?aeS4FO3+AWol1dOngXirk64PBtFJpsxrh/QK7DrVOQpPqPOz3MQOBnYs/Mbf?=
 =?us-ascii?Q?eVYxq0LV734CF6WU8P87oLXfu8Oi9lokmd7DSVs23tTcHu5gGiNhAIeHp9Ws?=
 =?us-ascii?Q?FhffA/FSJKrN7FGf4qra+PZjytJtrzbylB8gDeTY3wghxcjXQPMhMFJTD80C?=
 =?us-ascii?Q?jQ9UKxjBEL0Vt2pCwbq6RNezcPEDVpZycJGFvyWkqNs3O/3y3DMSHV7L4XyZ?=
 =?us-ascii?Q?8+7LE9shi+ocLpneDtd5y9NtJWL+vGdSzTIN6xtI9VXhRL+AQqyeE9yeJLUp?=
 =?us-ascii?Q?2tjbi4dyfqNMR41KlSvs9i3utRq/+XxVoZ2JbKqr7ypLRx62PvdokTzSLf+h?=
 =?us-ascii?Q?GEU4t6ccjipAIVr5fCONW/fEr0RFqsY6cLVtEflTkYIuiCeDcwxYbtAGckmK?=
 =?us-ascii?Q?Hr3FitraTuifAycz9e2mD5sL5/h46B6sqempBGAMuTn+d7amIL72hk3VpdLw?=
 =?us-ascii?Q?oeh4sYgSEn52ofeai/LMTSueVw4co+UWlmzl3ehBTbaiLX5gzpwWkKNHjnA2?=
 =?us-ascii?Q?sW5dShOO8pu2wlIsD6OMwkfX3Cf/oxMVGpmWBnN7v1KSEALZkQ1dzAMAWEL5?=
 =?us-ascii?Q?wvCFOj9cHYH6AmQZbdtjjDexW4jTQcmeoMfgks7Unf4mlSXkx2vZkq5cXdBS?=
 =?us-ascii?Q?MLPtbWDuBWFPpQUnt1x+DsUuSdSB4VzSRx/UBRxIlycIx70CWIvfFXuAhJbU?=
 =?us-ascii?Q?4DFvCk16cZViDOujPKmxAsaH1R9Wj5OD9wNwkunpPH3AMco21YwNUvGp6cVq?=
 =?us-ascii?Q?jZuBqHx3Hjp6sFyI09Iw0fAmCqzFytI9SHHwEo2lDzQrM2RDYDwoNUB2XH17?=
 =?us-ascii?Q?u3vwYGErYs1R4lV1mVb65gYaEKNmR9gZYdARHR1uGscG9EdUe45mwxRde5BR?=
 =?us-ascii?Q?ZiOO7Ef0U0qKwEKu+drSuOvr+hsVsXzKfwbLSeaknhJ/E0DCZKHHvfqVrveM?=
 =?us-ascii?Q?MZMT/c1j2FWkG+ANkRFaVBA8EqfMcQpYiNV3hswGhgUFN4/lVu5t2quONqpR?=
 =?us-ascii?Q?DgPL6kcX8XCHv1Dhcmdx/XCF8Vm1Duhtm5EFVQV00/AR7W6LGFZuqoU4yM8r?=
 =?us-ascii?Q?LBx5ozT0RAm4oHaxh/lAgvC8R5UkX+NPJENko+gWe6ToSINE+SOopQ61ip93?=
 =?us-ascii?Q?L1qFoKY/Ixdf7pcrQN6OxiZnhlDRGUZue+RG6YN9G+V4Az5dBHNXuYhbcVmp?=
 =?us-ascii?Q?0Jy6wXQInZ5DQ+q2Pf3mv4yJrH+IbHde1kims2vusbcZ9sAqMvMelMwwGSPI?=
 =?us-ascii?Q?AA9H49trjn1xyIvcuRpIXYuhG+Xy7UB4BhbaUDXxm8TTG2j0IzzObXUWg01C?=
 =?us-ascii?Q?y7TRTb6NSdPVxOvZ/FiyiE/JBxgLgLgsdc5LHrh6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a97e59-ce75-4d71-6f78-08dc2e5d2de3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:51.8134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1yUL49tOypDyGAmlwX00EcSpT2iBnSz5ekfgmd/HtSiVPCDvw/KY7fIfB8QQ/EFYkQ0w3Jf/YJ/lTYd/7XeFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

