Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55AC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1410E261;
	Tue, 16 May 2023 14:55:29 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42710E261
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248926; x=1715784926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l+Z74YeIzQ3aFJxsomL+KoNFqVMrZjMTCLfAaO3zPlA=;
 b=IKkGZsp2URciz9uksb60S20fO3u6/NWS2sgImplC8Z/3P62JXhzVcz4q
 VtVs0Lvgk/IBfwmsvgadtPx9f2erLh68CTD32tWhabHqHi3vSqsDlkqkn
 mMmBGUCS06/TC5eS24rGHLN84Q5ILii7aWcjAsr9E1XMmALRJP3qWzUxv
 gN1ptzlXabEl0sKf9Z5hiNi/3cbLUHNJAn7O6040HqUBC9b1ehr6LnsCl
 quQAo9792UXIynrWTUcRNoNTpM1f/STpli/uXqjljWEgnl2Ky0dB+UbRV
 TvEi6YVuUpnTO4sgnHQs6AOuFdD/UttiWml+Q9GcMyQ5xS6ZZr4qUzjex Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437842004"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="437842004"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="791102130"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791102130"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2023 07:54:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:54:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:54:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:54:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFaRv3QCZyhBG4MldW908Jnl0hJcAHa5i3DK0D4G1R5SxhSl3NT9MHpB/W85xXHUwW3FLsmRtxWI1XccmYyd6Jr/jaSt9R+xFgIOmLxwaWVTLrmLPF5/agW8826zlxe9Dx5Kd11pnFtCmmMYk0La78ZelMytCmfR5PyREXi33YBEUAWg+hea949W587fPI29psnM0BFpHsZ/N/UqJuzGfyIZcRbuw29jruh3aGsdNh+sxyS1Bm+m42bhHCx7Pzt+9rwlS1ZRcRWMUQB3rdXMoMZISIcA/HHES4JATgs+WFGF2Akay39bIvbW6Hx/HR6iKGHMgmVef8UEbIZg6FWGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4rROtbxq+Z/zpgg3+k+XBe4zI8Ldp5zJPDvOAZnlqA=;
 b=Jg/XHv3lFZodSx/MIyiOktjuyLcnbhYxnsWsEB3TIRfnnQ4XTyu5zt874JtlQTmvY2MY5D4/vfghrO44h6or9gEOz+jvnTmlztOA8dpV12BNZ9gwd1U8iehRgzw0WUuxhSEJBNwzgBQnXBLqtFn1sCwUIltbWIGRlr+IINpW7PvVk93hiVY4bzNMaVSHEWPDBj8XUVONvk2X22By4c9zAKtfEvk/8H006LbaCH3JH5jBsGAqlApC3/AgJcz8VZIwTBCKUD597Xy6GxNUY063vlr3eG7M2dzxEWTiSe/n0+6f+Kd0tsdgL7jIPhSU1ZNTU8RhJt2RtYODfAHeqkJ42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:14 -0400
Message-ID: <20230516145416.1851984-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: caa1d3ce-3b0b-4467-1aa3-08db561d8274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4fTxjmqRX5gtt70+e1pn2X2DTV4iSyyydQtnoqI/4Zueq8tPn7JqT2RYjGibBxFsj4COw9CCtI58P+H8YP2y9ZdI96XEw9L/M94v+Ro4xb12R5OhR9B5hqxWa305Wu4M43xbPBYfg4CHA3vbSVodibGNGTF59qH+Mlhkae1PvktXsMtQ2qpfkQ8QsXbsaEeF2FhRFZcNo6cwZ8I69obMNzHC3WDmNMbpfvDAg3/Qw0pLOiTMsXkXIyNmXW9c7at8BSNAeB7AnaPJT3y+OEact0DmcNH0/I82q4WmGU5JqHmUarJ3v8hT35Pby8RnHonI/dtFBG8Hb98HzHIQ7w7fJHdEYAwrwvQwFhwuz3QGuyPtv4DnEd60m5Eu7z6ek8gBDmGTHzfLohqTPHbDhCLqLxNL3yP2GJVrF0QLCPBc03KFsxVA8S2OljBHJ2lhI11sTCttVhwsWmcffYPZw1kdX15CjPm6Ia9T4l+GSKKW9dbiHwqktuBEPZTLBxBN7+aFVUZ+pubq36oFJyIGUoug7Gjvq9cwbdz6POs3zD+jBCNlCz0jdjkh3KTJ7mayvmH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(30864003)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(83380400001)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJWokj5RYxhsJTJEzRm62FWavPnCk1oylw4+lMJdqphbSbS/ofn8EvoZX1xu?=
 =?us-ascii?Q?riKuxki1B37KfNhUzvNAT7huLBO5/HnBh7PSGY3/eVhzW8DLexFa6iXaM5es?=
 =?us-ascii?Q?hq/FgmFEfITk4dcPNDlx3Jeyuy/NnyEvy9nSTIRxlxXOf4toAzDf8dPDaJQ1?=
 =?us-ascii?Q?qVC0QkAE2Z25qqHWEprm9bo0NP2B1i/OtKt47y9Z9LqCzObCt40D/6BKKggG?=
 =?us-ascii?Q?Qb+o37FCgYumaKisdwCXbnkAFJpwWs45zpaUQp/0XdGAH/qBPCK3B+5EeZT9?=
 =?us-ascii?Q?f8Y2A3vnsoHA88tzvSrznaEjU95aOlmJIwh1kXdVgBBCuLc2utpjp5ZWemCR?=
 =?us-ascii?Q?kW/wwC+CydGZnSs/6aEny2mg14c4UpZUg7cPsymCurutoNMscCO3lt5eNn4I?=
 =?us-ascii?Q?v+ILPtTa9hf5IF73UsqDXaFWMCwYSOZUaeQE8Q5T/g2bvYqN3cRprus3dEyi?=
 =?us-ascii?Q?KJVdPPKKjfq22VJRUtt00BTpOo6LAbE6EIV4cwVIxn7iwId3IhkF0khPpJQm?=
 =?us-ascii?Q?THVVmI5K+qeGzKl6xwf4FC5yFGZWxkwWQ8f5p8wzuUXFxkDnAonePj77IWjA?=
 =?us-ascii?Q?59dXb/JkiLRSe/29QgW+BtKD4E9zpDaXmhKCSi9Oosf/bjtUOO5oUkDIwH7E?=
 =?us-ascii?Q?PV7GgfQBGbmTaijrkqhJyqOFjph7hVfMVk2Q6d+RCPIq9IMNI8LTS4SG7DE4?=
 =?us-ascii?Q?kEbhZGU4el3aWk3qltQyqzgWiOm61LZfvovABNYkep4pEOg1bqYydK5MNDh9?=
 =?us-ascii?Q?i+tT4x5/jEI8whMUg+Ii7UfUcDEhgfuwuo2iGkHYlG3IV+6wWdrHyUGi540e?=
 =?us-ascii?Q?bRCgzjxxoa1XvdiV0uJ5tKwll6vPOu/zuLkgzUFitNmxTvzBx1SlUvv1KP/Z?=
 =?us-ascii?Q?oSEm0zT64IhHWw/1MYCcAeM/B3oAGxOd3OIioaWMCf+WvJSvHJ6lvudxVXs0?=
 =?us-ascii?Q?Yt7hCtV0VSwyV91Q04MG5bl0KzIgKT58gOlOWvIJ3IM6HsCFYklOEyYw/HfC?=
 =?us-ascii?Q?3mMSQLoDSuh97WPDDUSllHQACdHAHfXWuGAdTtMUuVAtghshEmZF0glG972c?=
 =?us-ascii?Q?mnYnZf/OEhw6DoXYr91aTERCW3fhirIqhmORb21oR4jRvLbMSJuznzC7JdnC?=
 =?us-ascii?Q?s3tGUNz56F7RAaQFwWYo1PlPd3KkbluLgJ4qG8s2cuWVCKp07LwnyUxgfQx2?=
 =?us-ascii?Q?fvZuG/mj/DEuo+jeDlXDzwkrp2WRcXLr/4PWTostLUisZgRrl9xZU56BnkVo?=
 =?us-ascii?Q?xGlp93FJOHrmtR0DyOHbVijKrmIH0zEOQ7/v/0yBxFEC92YTx9ZGDs5ZtWrf?=
 =?us-ascii?Q?2/7E6Sl6WG7TvzZpt+HDCI/aF+dPOwi/UBx4JBB3KslrpkdaovniUSSuB/9a?=
 =?us-ascii?Q?U+6KVtAf13aQ08tFLosRyBT+sPgQHjG/CjdSv5AWA794m9IMudhGyMKYbKo3?=
 =?us-ascii?Q?gRMZmp7uQawQcca7S8+MF4xBAvXML6r9QC+DdGjP5aGW2MMU+K39l6Ey8b/O?=
 =?us-ascii?Q?7mVSG8WbG9DrL+MI9/t3r3TMPQnMa/cNU3Ybi+62LCoUliS5We08BD8M9BPO?=
 =?us-ascii?Q?HVNSeTeVnBVUKY15pHf/YLt/hsPHNJRBBYKGRIJ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1d3ce-3b0b-4467-1aa3-08db561d8274
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:54.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdrsZygH5p1ybVHTP5mb1Xv/XcFmPfS/Rxhc63OLYNW0rgCdMr6aOiRSOTbeVw5Y6/gxKXlFB0QYXQT3EIWusg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 09/11] drm/xe: Convert Xe HW Engine print to
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
    - Do not use GFP_ATOMIC on cases like debugfs prints.
    - placement of @reg doc.
    - identation issues.
v3: checkpatch
v4: Rebase and get back to GFP_ATOMIC only.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 209 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   8 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 +++++++++
 5 files changed, 240 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..8bf441e850a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print_state(hwe, &p);
+		xe_hw_engine_print(hwe, &p);
 
 	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cc8191dfdf89..b209e4c2a3a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -751,7 +751,7 @@ static void simple_error_capture(struct xe_engine *e)
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
 				continue;
-			xe_hw_engine_print_state(hwe, &p);
+			xe_hw_engine_print(hwe, &p);
 		}
 		xe_analyze_vm(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 751f6c3bba17..71ac4defb947 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -574,77 +574,174 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * caller, using `xe_hw_engine_snapshot_free`.
+ */
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
+	struct xe_hw_engine_snapshot *snapshot;
+	int len;
+
 	if (!xe_hw_engine_is_valid(hwe))
+		return NULL;
+
+	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
+
+	if (!snapshot)
+		return NULL;
+
+	len = strlen(hwe->name) + 1;
+	snapshot->name = kzalloc(len, GFP_ATOMIC);
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
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+							   RING_HWS_PGA(0));
+	snapshot->reg.ring_execlist_status_lo =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
+	snapshot->reg.ring_execlist_status_hi =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
+	snapshot->reg.ring_execlist_sq_contents_lo =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_LO(0));
+	snapshot->reg.ring_execlist_sq_contents_hi =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_HI(0));
+	snapshot->reg.ring_execlist_control =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0));
+	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+	snapshot->reg.ring_head =
+		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
+	snapshot->reg.ring_tail =
+		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
+	snapshot->reg.ring_mi_mode =
+		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
+	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
+	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
+	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
+	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
+	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
+	snapshot->reg.ring_acthd_udw =
+		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
+	snapshot->reg.ring_bbaddr_udw =
+		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
+	snapshot->reg.ring_dma_fadd_udw =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
+	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0));
+
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+
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
 		return;
 
-	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		   hwe->logical_instance);
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		   hwe->domain,
-		   xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
-	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
-
-	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
-
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
+	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
+		   snapshot->reg.ring_execlist_status_lo);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
+		   snapshot->reg.ring_execlist_status_hi);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_LO(0)));
+		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_HI(0)));
+		   snapshot->reg.ring_execlist_sq_contents_hi);
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
-
-	drm_printf(p, "\tRING_START: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_START(0)));
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_CTL(0)));
+		   snapshot->reg.ring_execlist_control);
+	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
+	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
-	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_MODE(0)));
-
-	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_IMR(0)));
-	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_ESR(0)));
-	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EMR(0)));
-	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EIR(0)));
-
-	drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
-	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
+		   snapshot->reg.ring_mode);
+	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
+	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
+		   snapshot->reg.ring_acthd);
+	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
+		   snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
+		   snapshot->reg.ring_dma_fadd_udw,
+		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
+	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
+			   snapshot->reg.rcu_mode);
+}
 
-	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, IPEIR(0)));
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		   hw_engine_mmio_read32(hwe, IPEHR(0)));
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
-			   xe_mmio_read32(hwe->gt, RCU_MODE));
+	kfree(snapshot->name);
+	kfree(snapshot);
+}
+
+/**
+ * xe_hw_engine_print - Xe HW Engine Print.
+ * @hwe: Hardware Engine.
+ * @p: drm_printer.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
+{
+	struct xe_hw_engine_snapshot *snapshot;
 
+	snapshot = xe_hw_engine_snapshot_capture(hwe);
+	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_free(snapshot);
 }
 
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 013efcd6d8c5..7eca9d53c7b1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -14,9 +14,15 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p);
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2c40384957da..d788e67312b9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -109,4 +109,82 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 };
 
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of useful hardware engine info and registers.
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
+		/** @ring_mode: RING_MODE */
+		u32 ring_mode;
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
+		/** @rcu_mode: RCU_MODE */
+		u32 rcu_mode;
+	} reg;
+};
+
 #endif
-- 
2.39.2

