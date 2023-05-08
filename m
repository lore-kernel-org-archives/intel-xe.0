Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B9C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7C10E2D8;
	Mon,  8 May 2023 17:07:22 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFD010E2DC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565639; x=1715101639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bGJWcpkwUvtfYUs/B3E1ES5cXfE5qShI78dRs8sme68=;
 b=UXZ1rnnnLPRSs297IC0Hiaj0VoNZrQR/CFDF3Ba/B5Xm6PetwTlhIXPK
 +zFnaSNhxPZ/1Xf/xy42bOIl7BWi/ZHTVH8G619ezUBI2u45QgeNJH4hs
 cqPiFOMcs5Y5DLNeoRDd7bbFdBSJC4sC0Sh/C0KaX5NwbHrtoAcE7od9m
 NFPh95CdXklFv2qEKyYjABHK7P7tpTUYlT4aTHEzCF1LGbIHtIkfSb+IE
 d6MAM3h0HEasw4W4LMr9z8oLxtZc2t5ct6BlQSMkMuWgUDHBRxUlAgRqi
 /Oz70zn93txf5P5O9EUYFps4//8K8nUIeoYz9PnlQ8QEjeZfLgy8FTqAR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347171444"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347171444"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698596601"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="698596601"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 08 May 2023 10:07:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:07:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:07:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:07:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4ZyhYuBqu4fv3vE/ocaK3zbZGYfk6FxZpjO0rlWBw3nqXqdEkH6I8L4j6Ur6/3vjIPizsZZ548UU51Z1gRP+x6MP4arebZimi6zWK4QOIzVBUnA5G0HDq8O76fccvOwRAJk3D/Uwcqds8afuWzer3JaE1lYxe/dd6+BYRyDmOALijOI8PvtKHL5281UuDJ4M0396/rN12RRgIPhXJpU8CSPWSdnBAmLZ7QccsO9+Wbur41wsLceXDn9ELQ87u/DXQKhbDfYcuezf7LJmylREPufdkSWjHbeQf719pC1tcxwSZ2EaGS2oBymwqNoGG3Tk+O+D1vhDYfLPTHrgthXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFe3ZwVd5VqfxkNLn+mg5VBfv27m4Dwq9/x0da7kIQE=;
 b=js6u8y9rIqj6hSNfuLntG89iLQ1OhOzXGO4wwoNZnbwvnYQgJ+EZUn+w51xdokFh0ZiI8BvY7/Fk358SN/uXCe4t6AqutPxZsSwsGcRMdZ/7Gw3uLed5rI475hjuL1qqKURrXdSGV11mf0UGxaIR9BzSMS17ZGEF1G+s5qZ/nCaozczYp6uxWZJfYPmPU0RsJCCgV1ny7gIk3rzhUN03fJuoAnXAHGj6prTj1EJk2zNbjl6tZTJKTPFtiomvfsx0QCHHh46LvSP2wAlkOmtisyQu2I+g21zcRXUUjDB/xXlo+6Dvs7VodCe0E7j5zutQIP17VMQrBlkvBgbxhtTI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:07:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:07:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:14 -0400
Message-ID: <20230508170616.1289914-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6536f9-5319-4304-c8fe-08db4fe6a4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8g6KrNZ66xDeFvjkIcZGL1HkQ96fSj0FuIiMRNTMYbUdv4Pj3XFkeBcQV9YKlr4l6Qq80B+fY/kehFMpNWrbMGyHaJplKQ94T8p8+YTOU7qnjRMKGsKXuojVh//j79U4gMuhmdQfDW8homqU3s4HnIoswebhHB28qzouktpKi7dULYgijUU/nCyj6MJdla1maC1cKa4mIGAudPWXOHgcu/uvZyJNX26jlBzuhrdIoUDit3WNTJcHVfJic3CxqV7bcx5QzNpgZ7g9bBM8Vq9LuFDGjfZ3z0jrNUpPG5hxdOz4Y90jhSYJ4e2Y0eSM6IFBx7nbxQEwRt2mqZiEbE/++OEUkqBxbRMTywPRiaYpczLbB6qxOTnNirSnrdH7hQhGOjFrp8zDbWiRaNhx2ZCm2niyI25Tiegtma2BCTh5R3EfQUH2tu4KGAJV6CLcwFeHLCF7yUnuu/EKwqjRnMOZicmSyADUAiEQFws4d4nTDVTkQ4qg/NkwWJeiMjLycXbO2+qZZI++l0nEX9ebg3EGGzAgiCD+uTbIvw4XJngUXAiUwKhLQl3ziL3KgDAy82Sw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(30864003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VpIhlvIXnE3r94lVmU1Ztj7t/VoC/cwMVw3UukhUtw90cLX4EV8bp4eqh7EH?=
 =?us-ascii?Q?oJykwGcifq+R7C9W2CTLF+a6lKobQV+IhRKvWHPXiId4ja03gT8L8wz+v8r5?=
 =?us-ascii?Q?4/5qMgi88tudVvQwHcLoOGFMhTcKUL8h6HKLHmjA7XcFVx8iI0HLqrDv/nRd?=
 =?us-ascii?Q?i0pcoXars60L00svEA02u3oOHykfZQydYks0SlIxMsh6S2TSBzBXG537uzUh?=
 =?us-ascii?Q?QZ63wpSja1Cd5R5K78ulB+4/vBjRt3ZBCveDlP9w6ej/W7Fd9lJTZyOPk9vO?=
 =?us-ascii?Q?GA+0R+5FBKdxKDKS60euKZ91auVTYITtKnBfbcSyPyESheDF7RJ4q+7dc+38?=
 =?us-ascii?Q?ZV0KUX5B00j2YNte2LhfYNMqQqaRBmMUoCIWsqV5yrb/8QvnP6W9kWXzMxbI?=
 =?us-ascii?Q?abJ3l4+3GwD+wyXHe74yFujsXJdwRJvfbz5RJ8bgulKaqn9wQW3fSzebr4tR?=
 =?us-ascii?Q?ojXQOgz1sEHKWBGIL5d5lv++Lltq+ukhBQ01wU+1pl9zMDmrYuYr2DHGyu44?=
 =?us-ascii?Q?P23BkwyQa2EbllhDNZPNl1iOzwAwn50CiJzqKlAYB1dg9uBIryEx6nAtHks7?=
 =?us-ascii?Q?Ogc1G3xvr0+tuKazrPZgu/FBbTxCnBrTKnLoXB03w5r1IETHZTyqQAFcMgBh?=
 =?us-ascii?Q?jQb84gcyVGUO0NkjxD7tSsLk5F/3FaMdUCO2jbuI+ZIIii+FBav53Pna+xis?=
 =?us-ascii?Q?yNXxqxKqE/m/PjxRUsa5IEIdFhS4Htr1byt+KMjTByzMTLNCc4wkn5T9aan/?=
 =?us-ascii?Q?k0mhBEYJ2V2PvXy4CVhDSTC8L+BMx5JYoe8WbDR+oXcqokT9LEWfybwGDdtF?=
 =?us-ascii?Q?m8jex8J5l/6+EK4aUC7ePMQ77Y6wSJfbBj4ySfmf+aqz4tk5T/FFipfuoXTr?=
 =?us-ascii?Q?yPzTbq82gJaag6tPNy+TxzKBosa6pFRC1y5viuS/wzm9gyRkUe2WdKSKx3Bj?=
 =?us-ascii?Q?iOcuKQKAWNS1BGW5XItbDoRyP296/hQKsxIMJO3TuP1bwaAhUAJ00/MQbdNP?=
 =?us-ascii?Q?vQvc6CDeeHvhmqsrgP6SDVYlVexyauIbiFez8sPv8fDLmiB8q3DLJFt3J8kt?=
 =?us-ascii?Q?xl87/1VGTbBOkMdOtkH17yXI0uUYGrsOMFVrmZsXGjhLzqos8s225f37Pmmu?=
 =?us-ascii?Q?A6ECm+ZZdncE8P74ZGF3ExIio0NMBcRlA1FGueo7QjhYXShmfy/AxVKacr8p?=
 =?us-ascii?Q?1WOsRpw48dYyJCvtTG6Umv+d8hXUj/JUmWLQaHJNi/XDkh9EZxCmx5Xyi+6e?=
 =?us-ascii?Q?dia2ffyAg1ztB+qKiCEmJxXer4tKb1JrCDTvE7zPzVZ68Sjt0NyARyKk+0vN?=
 =?us-ascii?Q?+kEqxXwwEvDE0LoUKXYQnjW2FK+z8vHUpgNt25YWZzY/yMQ4r9D7lPSbf9Jk?=
 =?us-ascii?Q?DAC0zqEMCFdnGkajXKUYFTqv+Pv9I7k0TzeBwcoKn+2C4aGZk8IE5HvOboLN?=
 =?us-ascii?Q?NGqX2YXocgFxk05UMwleo+xJ4PgE9g4M33aJGmFaK1wnDXV94JPZzTq10AvD?=
 =?us-ascii?Q?Jym96bE1Z2hZsuVL/omXLoNI19ZW+DHS5MEgfDWcCmNgu8dRRtCb0gvI2/ot?=
 =?us-ascii?Q?svuNwmtibhBTNEOjNuMbnkPDlqhUCudi+WfL7jLdkeofMwMLGS1Dm4DFFmHu?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6536f9-5319-4304-c8fe-08db4fe6a4c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:07:03.0490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9SLwp/wkgTbJubWwItjdkYbcbMbjQuKqYVQohZ8CCl+douJvOoJnomG5hGUhrPRyORD4dnPa5apOh5PyRls3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 09/11] drm/xe: Convert Xe HW Engine print to
 snapshot capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Addressing these Matthew comments:
    - Handle memory allocation failures.
    - Do not use GFP_ATOMIT on cases like debugfs prints.
    - placement of @reg doc.
    - identation issues.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 225 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 ++++++++
 5 files changed, 256 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..13ca17f1ff6f 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print_state(hwe, &p);
+		xe_hw_engine_print(hwe, &p, false);
 
 	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 514b8e9df0fc..b017d10e81cc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -752,7 +752,7 @@ static void simple_error_capture(struct xe_engine *e)
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
 				continue;
-			xe_hw_engine_print_state(hwe, &p);
+			xe_hw_engine_print(hwe, &p, true);
 		}
 		xe_analyze_vm(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a9adac0624f6..34bccaeea548 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -569,77 +569,188 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    resets or from some regular path like debugfs.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * 	    caller, using `xe_hw_engine_snapshot_free`.
+ */
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic)
 {
+	struct xe_hw_engine_snapshot *snapshot;
+	int len;
+
 	if (!xe_hw_engine_is_valid(hwe))
-		return;
+		return NULL;
+
+	snapshot = kzalloc(sizeof(struct xe_hw_engine_snapshot),
+			   atomic ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (!snapshot)
+		return NULL;
+
+	len = strlen(hwe->name) + 1;
+	snapshot->name = kzalloc(len, atomic ? GFP_ATOMIC : GFP_KERNEL);
+	if (snapshot->name)
+		strscpy(snapshot->name, hwe->name, len);
+
+	snapshot->class = hwe->class;
+	snapshot->logical_instance = hwe->logical_instance;
+	snapshot->forcewake.domain = hwe->domain;
+	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
+						    hwe->domain);
+	snapshot->mmio_base = hwe->mmio_base;
+
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe,
+							  RING_HWSTAM(0).reg);
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+							   RING_HWS_PGA(0).reg);
+	snapshot->reg.ring_execlist_status_lo =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg);
+	snapshot->reg.ring_execlist_status_hi =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_lo =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_LO(0).reg);
+	snapshot->reg.ring_execlist_sq_contents_hi =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_HI(0).reg);
+	snapshot->reg.ring_execlist_control =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg);
+	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe,
+							 RING_START(0).reg);
+	snapshot->reg.ring_head =
+		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR;
+	snapshot->reg.ring_tail =
+		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0).reg);
+	snapshot->reg.ring_mi_mode =
+		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
+	snapshot->reg.ring_mode_gen7 =
+		hw_engine_mmio_read32(hwe, RING_MODE(0).reg);
+	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0).reg);
+	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0).reg);
+	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0).reg);
+	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0).reg);
+	snapshot->reg.ring_acthd_udw =
+		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg);
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe,
+							 RING_ACTHD(0).reg);
+	snapshot->reg.ring_bbaddr_udw =
+		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg);
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe,
+							  RING_BBADDR(0).reg);
+	snapshot->reg.ring_dma_fadd_udw =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg);
+	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0).reg);
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0).reg);
 
-	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		hwe->logical_instance);
-	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		hwe->domain,
-		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
-	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE.reg);
 
-	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWSTAM(0).reg));
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0).reg));
+	return snapshot;
+}
+
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p)
+{
+	if (!snapshot)
+		return;
 
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
+	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tMMIO base: 0x%08x\n", snapshot->mmio_base);
+	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
+	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg));
+		   snapshot->reg.ring_execlist_status_lo);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
+		   snapshot->reg.ring_execlist_status_hi);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
+		   snapshot->reg.ring_execlist_sq_contents_hi);
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
-
-	drm_printf(p, "\tRING_START: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_START(0).reg));
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_CTL(0).reg));
-	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
+		   snapshot->reg.ring_execlist_control);
+	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
+	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_MODE(0).reg));
-
-	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
-	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ESR(0).reg));
-	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EMR(0).reg));
-	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		hw_engine_mmio_read32(hwe, RING_EIR(0).reg));
-
-        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_ACTHD(0).reg));
-        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg));
-        drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg));
+		   snapshot->reg.ring_mode_gen7);
+	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
+	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
+		   snapshot->reg.ring_acthd);
+	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
+		   snapshot->reg.ring_bbaddr);
+	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
+		   snapshot->reg.ring_dma_fadd_udw,
+		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
+	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
+			   snapshot->reg.rcu_mode);
+}
 
-	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		hw_engine_mmio_read32(hwe, IPEIR(0).reg));
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
+/**
+ * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
 
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
+	if (snapshot->name)
+		kfree(snapshot->name);
+	kfree(snapshot);
+}
+
+/**
+ * xe_hw_engine_print - Xe HW Engine Print.
+ * @hwe: Hardware Engine.
+ * @p: drm_printer.
+ * @atomic: Boolean to indicate if this is called from atomic context like
+ * 	    resets or from some regular path like debugfs.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
+			bool atomic)
+{
+	struct xe_hw_engine_snapshot *snapshot;
 
+	snapshot = xe_hw_engine_snapshot_capture(hwe, atomic);
+	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_free(snapshot);
 }
 
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 013efcd6d8c5..f933fa5cd72d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -14,9 +14,16 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, bool atomic);
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p);
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p,
+			bool atomic);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2c40384957da..da838daee9c9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -109,4 +109,82 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 };
 
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of usefull hardware engine info and registers.
+ */
+struct xe_hw_engine_snapshot {
+	/** @name: name of the hw engine */
+	char *name;
+	/** @class: class of this hw engine */
+	enum xe_engine_class class;
+	/** @logical_instance: logical instance of this hw engine */
+	u16 logical_instance;
+	/** @forcewake: Force Wake information snapshot */
+	struct {
+		/** @domain: force wake domain of this hw engine */
+		enum xe_force_wake_domains domain;
+		/** @ref: Forcewake ref for the above domain */
+		int ref;
+	} forcewake;
+	/** @mmio_base: MMIO base address of this hw engine*/
+	u32 mmio_base;
+	/** @reg: Useful MMIO register snapshot */
+	struct {
+		/** @ring_hwstam: RING_HWSTAM */
+		u32 ring_hwstam;
+		/** @ring_hws_pga: RING_HWS_PGA */
+		u32 ring_hws_pga;
+		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+		u32 ring_execlist_status_lo;
+		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+		u32 ring_execlist_status_hi;
+		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+		u32 ring_execlist_sq_contents_lo;
+		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+		u32 ring_execlist_sq_contents_hi;
+		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
+		u32 ring_execlist_control;
+		/** @ring_start: RING_START */
+		u32 ring_start;
+		/** @ring_head: RING_HEAD */
+		u32 ring_head;
+		/** @ring_tail: RING_TAIL */
+		u32 ring_tail;
+		/** @ring_ctl: RING_CTL */
+		u32 ring_ctl;
+		/** @ring_mi_mode: RING_MI_MODE */
+		u32 ring_mi_mode;
+		/** @ring_mode_gen7: RING_MODE_GEN7 */
+		u32 ring_mode_gen7;
+		/** @ring_imr: RING_IMR */
+		u32 ring_imr;
+		/** @ring_esr: RING_ESR */
+		u32 ring_esr;
+		/** @ring_emr: RING_EMR */
+		u32 ring_emr;
+		/** @ring_eir: RING_EIR */
+		u32 ring_eir;
+		/** @ring_acthd_udw: RING_ACTHD_UDW */
+		u32 ring_acthd_udw;
+		/** @ring_acthd: RING_ACTHD */
+		u32 ring_acthd;
+		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+		u32 ring_bbaddr_udw;
+		/** @ring_bbaddr: RING_BBADDR */
+		u32 ring_bbaddr;
+		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+		u32 ring_dma_fadd_udw;
+		/** @ring_dma_fadd: RING_DMA_FADD */
+		u32 ring_dma_fadd;
+		/** @ipeir: IPEIR */
+		u32 ipeir;
+		/** @ipehr: IPEHR */
+		u32 ipehr;
+		/** @rcu_mode: GEN12_RCU_MODE */
+		u32 rcu_mode;
+	} reg;
+};
+
 #endif
-- 
2.39.2

