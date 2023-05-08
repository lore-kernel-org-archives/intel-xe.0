Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D43C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726BE10E0FC;
	Mon,  8 May 2023 17:07:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F310E0FC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565630; x=1715101630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6mIvAH/TRTnI9uZtNVYM0qUSAlnPCiva/b7fZcphKhY=;
 b=cW2Pu3xZFk7JsGcJ0CC0ut1+aqlq07cZTyM6lSqAu/bBqn7blDdnY7K2
 5xAB2pRAeXY50qS5Ux2nbPv3u/RCPXorWsmeiu9CCrkDGNGxYCYoX+5A4
 6/aSU1vhRmXFYm1uoei8eR9kzW1WuXlc3HD18AwDQ0/5JObe0XHpv9wc5
 EVlGta3+Dbf1vb8f1N4MmCjZXI81/ZliT3nz5/OSfQBICwnJC3B/rh9UD
 E1s/sLF9rmlKaheitywLQuR5aIWF9P/cGOJ9Eewsbuvusl+dZItDhnZk+
 xqy0GAjaLzmFPcj0RL3vnepB/WzRiVWkY4f6rtskgGbvWc8ePEPA97orM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377800259"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377800259"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028470045"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028470045"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2023 10:07:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:07:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3QgoRcajqfGVi0tA/NiqAorLcm8EwpokoHE2nfUPIy31TumkSou58TMeSl0Q4wQdgF31mMDVBs6UurLWxB2YKNWTTYI9t6IUTSnGpDKjKk7Q0w86TTdLW6d5p3ElJFxwjVpBsO6w1KI60X/TaUUyz4Jr+Hv2O158ktq2CzsFhCIQOa1Jh+6eYFJyVLqOaTUElylaAD2VQJKBwA671BF3JssWAkPlCoT2TIimHxpxEWQcXuzH51F8f6a71Mi7g3ABV+d492c/1ybyKVQQkhli97kCI8ZL+AKEqEaZG4D0Wt/wxIcx9bSA16zNjibPylSOjCyg8WgFMbW9caIlb3bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTl3N65y6Mzqlma/KigT5TX2+7xU5WIxgsUmGd0KGDg=;
 b=ilhTbHvQeaiKuOGgF5FbHN+lMf477m/y856w76pU3/A2I7Zcqud48YcN+uCe6XPEDzHfOaGh9GEDzFH16RZFHtKhi43H4X5HXlF1XMboDhF425VjWvJwejjemR+mPwtRdv1LXha3uVumU6+1p/BV44B3271x0LwXx6g8iO/LhKt6HyGdavrAlqIegSdTyv+QUk525nDKEHpJ6Cy4Mhbli/OXNcK2WaXIPUGo4wb/PiYPta3++ndUMGjMbGoOPENl+RBPNm0Jl/19Fe64ew455QfEJK7DshXq03MXLVCJlrTL/UOBas1WvYQdODUapzxmLWd/kBx8VVCSig4euN2Vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:07:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:07:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:15 -0400
Message-ID: <20230508170616.1289914-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c99951-8cad-4b5a-4596-08db4fe6a701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0vS4l3EnzieV/pUy9YlGNiaxbieFzMyxADIfWlgtDsgw0fyTcC05x/bvUt0cm/1XZ+Pi/kpkTGJDxI8bopo6/igR+Xo2wCM009mqB4ZqjiraQix3QKEAqwJI2SfU7h0U8W2s7PUSQsdy9+DdTeQGPO9eUtHt5AGJS+t9t8TomDH8ceEodOVBC3oAnv4M4zJlqhBlVhAF9JZo6Se3r0VQsvt0W4m3JCXNWsnTpI8NrKsjoPpZqzpazV45KYZ9jgzRc8Ca+0Z7X14CD92jE96ZHm4GKQzLoo5I3Xkj55Y8jYLpbTvAgK25CiqBYMtvuj4P28KcOrmro5JLQNpj+0tq+3p6291KxCy2Y92Vcfm9xhpt8VUmwrtI8RjpYLvgYVYn1tVcA2u5wI3z4PVorPduBOxGy3n5UpIlJEQh5j+db57Raf3KAS02RQTNZfEagWC98L1LWypaEL8vsRLoYZiko0DJn4IdcT1VWqJrXOKpZKmRjTDYlgWazUYXmKgEhJrtJjB/VW/hOE5zj+7IDoz6hbitNHtPuMWFjBxoz0LSpPEPQFs8JQCKmlZrIn4i0PJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgAwgfHPJAsg2bXunhrz3A2EL4Xo0sw/ZOfRiYNAS0UiU0YLGbTZLj5+4Zct?=
 =?us-ascii?Q?boSoxpQdDjoEIyyMPNjDdWngz+gCPxxViVCli3/FpEnjBrjZMnUV3K6LiijN?=
 =?us-ascii?Q?TxzM2lpGwdwOVn3fhjcGIP34A8YvssJSKIwn9wog6PEIC+iI63+SC4sPAI5t?=
 =?us-ascii?Q?Bfp+H4E3veZ+tWWOEFLLPSHGbBIQVHViEcWOaBXXJjQnyBlEv74lwaObgjPb?=
 =?us-ascii?Q?9F0UstKr7nxJaoXFOtd5JpnLVRvGaJOum66KAqrY5pD9gf29kyUV4oRzov/7?=
 =?us-ascii?Q?7Dijftzciripz8BFns+TMYvOEi8gVVDrRcB2Lq0JfLJPSAAKAQYOomATC77w?=
 =?us-ascii?Q?UKBB+4oTuKLpQAO+4dPrqD1TSIgUieRcwe9vJrxiLGKla0Fvk8oSSfCp1KE4?=
 =?us-ascii?Q?gVmCncIBOsiethc52iG6nbvufzwH1mS9vxAlDVx9gDthzbxVhylyxXShoX2U?=
 =?us-ascii?Q?J7weKvT0GVJVJDYerE3TpnAw0NdUvgAj8pAI6Ulsls05ZtoSZDmO7XyXN09Z?=
 =?us-ascii?Q?Ar8FbjVfy7KxjPS95I/C0RGZIBlfDLOOR3kuN8PTBTMdtn9QyiWMCLZjlxzW?=
 =?us-ascii?Q?q3C1ynCgZsLLV2HDZaRwUetzcyCAmOWB5B2m6P4yjF8PY7CGh5Xof2UQnUzi?=
 =?us-ascii?Q?IJ2GtS3B8J1RAattPDeNcUV+V/qs17OTtdBBkfFmAyFdQv1d3UbyF/sqqSzB?=
 =?us-ascii?Q?wAceoCz5Rr3zW5PVuZ7RKDK0BIXYUicM85VCHEbu6rVIEGHr14Y2cJTOAJeb?=
 =?us-ascii?Q?cclUtSfnXvlIpJ66RMt+JBznXH+rBOlhGRuX9KbvbtTuyTXchUZ4hMd82Ddk?=
 =?us-ascii?Q?ddA9jXnvRyVyw1s7vq7MI0cHKoaBpmtZzAwdSPLKTK4Aut99EpFmYIsXy479?=
 =?us-ascii?Q?ytvjBwX7CtLqaXjaxcrcs+Mm4FUy+F1MFUOiYlERmSDgWr2qU0uQtVmy7Zsx?=
 =?us-ascii?Q?hXSTDsF5i+KGJqcieOX3lsuNZj5mMN6krhp4FF2W9YheWla6L6t/IAOmzJ3p?=
 =?us-ascii?Q?HiyLPNi1yHpLlGdD586Luk+5H+NVrpQITF2LvAHkfkJcJFoK/DeSlJsQQIF6?=
 =?us-ascii?Q?7oKd5JaCX+27udu/R5Ngn4z0NbK/xyt1d86LY0kjhxCQChUxlqgq/1N9E501?=
 =?us-ascii?Q?x7JTyfujCfZh8XEsJ3Wlt9H42SldXrNkvn7pz3cgP1o9ylnAdqZCYeIenerv?=
 =?us-ascii?Q?nm1oMwbL/6XyGKUIK6oGYO550+hmjzfzK3WUfbMJVDHdJj2nx/JjRdcKCH9Z?=
 =?us-ascii?Q?IxxDldQV/nwEH31HjtRZNBVCeCF12gtgNLK9Lw5Ws0p0kanPsPhNL+UbcZir?=
 =?us-ascii?Q?X04y6kj/J1FRE51FnOOqz4tcmxFIAjgWJlPCrkwhUaH0UmGq63tbkOxS3n8j?=
 =?us-ascii?Q?aqLbrH62zSsVqRY1HPYY6bXSRNCzOI0LZXcvKs+3q6ZLUr2mgwEwBW2ii5Gr?=
 =?us-ascii?Q?wM8HbJhgTnZU7klT2cQJ+2aqFuIUlDvQsnyHj+PvTBaIGk7dwimJrtcfGeTP?=
 =?us-ascii?Q?GwjyAfOWNq01OxKvdi+LbG6UJoCnZP2mZNck+EutBVOPW9/CfR8aLsSxynzP?=
 =?us-ascii?Q?vqS/h+mJDGPXEoP1FEdA7c2xWI8lxeRvcDuwzUfCqDrHJTEosy6buK243Yib?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c99951-8cad-4b5a-4596-08db4fe6a701
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:07:06.8222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb6pZZi4cHlHAQZ/TOxPzF2hcGg/V1qOgOJrfrjAyhmj2h5hOwuTEfuOiLMwVPm1LRlzF3nePELQ9nUc0mccxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 10/11] drm/xe: Add HW Engine snapshot to
 xe_devcoredump.
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

Let's continue to add our existent simple logs to devcoredump one
by one. Any format change should come on follow-up work.

v2: remove unnecessary, and now duplicated, dma_fence annotation. (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 43 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index c17fa0c7770b..b4fbac0cd318 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -9,10 +9,13 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
+#include "xe_device.h"
 #include "xe_engine.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
+#include "xe_hw_engine.h"
 
 /**
  * DOC: Xe device coredump
@@ -62,6 +65,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
+	struct xe_engine *e;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone already... */
 	if (!data || !coredump_to_xe(coredump))
@@ -75,6 +81,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	mutex_lock(&coredump->lock);
 
 	ss = &coredump->snapshot;
+	e = coredump->faulty_engine;
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
@@ -92,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
 	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
+	drm_printf(&p, "\n**** HW Engines ****\n");
+	for_each_hw_engine(hwe, e->gt, id)
+		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -100,6 +111,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -109,6 +122,8 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
+	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
+		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -122,13 +137,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_engine *e = coredump->faulty_engine;
 	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = e->logical_mask;
+	u32 width_mask = (0x1 << e->width) - 1;
+	int i;
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
+		if (adj_logical_mask & BIT(i)) {
+			adj_logical_mask |= width_mask << i;
+			i += e->width;
+		} else {
+			++i;
+		}
+	}
+
+	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
+
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e, true);
+
+	for_each_hw_engine(hwe, e->gt, id) {
+		if (hwe->class != e->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
+			coredump->snapshot.hwe[id] = NULL;
+			continue;
+		}
+		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe,
+									   true);
+	}
+
+	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e055b266af70..8b17ecf1b6e6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -9,6 +9,8 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 
+#include "xe_hw_engine_types.h"
+
 struct xe_device;
 
 /**
@@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_engine_snapshot *ge;
+	/** @hwe: HW Engine snapshot array */
+	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
 };
 
 /**
-- 
2.39.2

