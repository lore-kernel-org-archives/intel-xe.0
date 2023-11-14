Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B115610E43F;
	Tue, 14 Nov 2023 11:45:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADFA10E440
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962314; x=1731498314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tly8Ujvagp99l2qUHUgK3GId6My4D1AhFs7mYSOaJQY=;
 b=DnY/5ZIQIA5/g7MpZ6lDkl7ctt01J3mbIQGivpBfRIgFosR0GPTAjGIo
 b6fCD2TlbferUlbMwhZEnjEBhuPuGx7jCI521uZz0gzsuHa5SO+6z/onK
 Mub4Kzk6RGu8B7GZYd+Eputw5Ck4jinUKXBZFWEnIEhDr7gxPezZKY/UJ
 7yK1SiqzEHeDA7aN0EL5AWH+OrML92oUIcqtJ/ExjEqqFgnPRoT1pmv+d
 peb/1BUfxXiOAS33FUn8o4mfgKEDvt0qPNYAN2AY14s8WBqu4X9kB7/Pt
 OcPMvh6wiNK/V0BaBo11ulcXToFt3eViCuMLBpfuCLV+KZB6xBUNfsZ9L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476849757"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476849757"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="741070894"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="741070894"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsQKHhgPYde3I6YoX+baNa3Ie9VNxB3VueW71oKUL0iNwReGgxhuSXCa6Em3RKThiqd+M2RjMdaCOzzrOTAEXfxg2/IKuntgXzeid+/wV4TZ2+oMMzkWa0+yUFp2/RTRUGkf4cnyJyahu5sEcLfXRPrVzOuFIglkvQUq/n7xoEe7gRRB7K5RjkQs1mf/AKkO/YdGLnVPbSjTwRFRA39J7znns/MIuz/4jc2l7MTN5zdXKJMREyr/44R69s9X8n7giQITNTqsthgSuTi9Up4pcORQtxt54mIPfJJYfhh54QRsRMp0SEE7RwamESZy5izMeP5wHaQC4Hp48j4MoWlMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iSRsa8UngSH7gd3fi8/0j2Q1hfspP16v4Xmp5jmNuo=;
 b=Kbjd8bcIDntwUcAGx2iCUbu0dmkzFH9We3KqI1i3EIs7FODFWZ588+VUguUZYhdILHiDVU90JnbP0TPK9aIiw6sOqWXVViat++KtdrvubPchqLSvDAeA7azIAfFTJ2/CPfeAD+NWDx6bJvnWXT1epfjQ4FLdzUwwKgges8avpwin3L4s0AhiAXnsNaoqk8UFWOLqyo5lMvroOt/jGeGZE65+Vbo1TDIA8FKVPkCktp5GwMXchJ6YwI3dREqyccKHNc3wUwHDbcJJH6MJFfsSPVlbaGzNiZX30uQgDlAyCY/5i8B7uNFCNXMwnYoOZxKjCaUWGvT38fl/Lq3gW8dJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:06 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:51 +0100
Message-ID: <20231114114405.2207747-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd5526c-b215-4b10-799f-08dbe50725af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vhBXZbcrxzmkE6jMYt6XRBbgxEU17dCj2cnyJOFTRfVNQXBUTXsyBop+WXfkaOTsPtvg1M6hdCK4GWDYSOodsiRlSaVJxBePTfQzyC/IgZYxEiROG2Y6+VDwsEmicn1WK0goqlFC0ZLX7yic4qNGcSNbst3/TDxYiZXR9XbpuktIHh247cFuZledPEd6GELyNfA8SjzEuvUePvnUW+qWS6/Ol79776YCHoHLO+YCHbORJN9dPXQD/qvRzKmiH14C0Xc4jg8dWqJuyK+cXt1jBGU2swyiCTPn+4zQLIp4FdqzjkRs4z6998gT1JfUnvov28eRE16+RYnLwMP5xscer7/aJtrg+JhY8qq9yrh2Nl8L0E33jdeBZfX2AQ7HQLF8Zu7PVzUIpfcIhNR8V5I9yvsAw9EmMNReZ5YG0Qim4XhNNljjO0txLF/MMRFd0klYjExbtS8ov9z0Ko8MJhowXzzYhlOLC5osfJM8vqpKSwA0WYpI8eui0IogZJ6tVjAZvjJH4EfDbXvwlt5CdVO4RsoQ9o2tTqjedXYoppS/s9s7RQj9iq6IVBSXIoYE6Ja
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(66899024)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHR2UkpvVldRNkdRZ1JOQzU0TWdFQW84VFNXcnd1b1IvY3M0dGRFV1JGSCtX?=
 =?utf-8?B?V0paYkFyTExPeUV6eWMxRGtWUk9EOElhVjJBei9OaGFUVkM2QXpPN1I4SDU5?=
 =?utf-8?B?SFFtR080a0ZweGovZEVUbEtpZHUrSUZMNlo5MG9ib1p2WWNRR0J6ZG83ckt0?=
 =?utf-8?B?QjhGZWVOMnVKRVRkbmZZc3RZam9xbE1kY3M1WG90UTdFNEJjR29vem5xTmh6?=
 =?utf-8?B?c1JZcXVTWXo5azJlQ01lb3REdGlJZFlkTHV5dmY3TnhBT2VWQm80cGIwVzRD?=
 =?utf-8?B?MG1kYzVzTjhVbStIbEhMdkpxV3NIWDk1WHdRbEhpZGs1cUJ0US9mLzhRSWhQ?=
 =?utf-8?B?bzZKZWRHdVpVRzNxMTJ2S20zbVQyZVR0dDViYVAzSmZWU2xkZFdUVWdaQTh2?=
 =?utf-8?B?SjY5bDFVUW9QeDZkOWZ2RFduZlVtR2w5aFZHM05DcURTWmVsYWlDbjZ5c2Jm?=
 =?utf-8?B?eDlSQjgweW5KS0FDRG5EMEY3eXNrb2xXOXo2OHpQSkFTY21lQzA1WDgzQjRN?=
 =?utf-8?B?Nm5XTEo5dEh0djhpcUtEdXdTKzE0ZklIZjlaUU9qeU1KRGREZjBOZkl4U2Js?=
 =?utf-8?B?SUZRSWIyVng4QWFWeVlVWmw2VDMrd3V1RVJremdyS3ZVWVpKSEo2UlZacStx?=
 =?utf-8?B?NldnZXVLVmlGdTUwZXovQVdyVE8vTFdINTh2VjRBcjczQTJOeWlkRlU2clNL?=
 =?utf-8?B?d0w5T0t1M3RvaVY4bzFRbEpzQ0NqOXY3bHE4MXpET0F2VzFSN3VnbW1LQWF5?=
 =?utf-8?B?bGd2TWdJUTlFekkxMC9zcnNVUmdJM093MTFDSWJjN0NJT0syak9CTjdBQWs1?=
 =?utf-8?B?Q203bHB0TVNlR2t0MjhsNWh2aWIzWC9lblhzSHBTSVFVM2lQYjk2c3BKOGdS?=
 =?utf-8?B?cVJCaDZwd3N6MEFkR012b2lmMUdQVmROK1h1NUx1bE9HQ25vSjFRT2RrQzFk?=
 =?utf-8?B?em0xT0w0bGFmL2Q5VFVZZHY4SW4wQzZiT1U5WWxnVzFXZ2xkTWFxQXFjZ2Ew?=
 =?utf-8?B?d3ExeGwyM2pvUnl4ZERxQytuUXROVDVpYi9ydG5vYVpGRWExL045UFJoSmZ0?=
 =?utf-8?B?Zk5tc3dWMDg3VnMrdWpwZkJEY3dxZmxuRG14WG5jaC92SUtnTDRhdXVYanpt?=
 =?utf-8?B?dU42THplYUhrSUJNMHFzelVKZk54a0NRN28rdG93aDIxb1lQMGRTZDVPTXNl?=
 =?utf-8?B?TG05c09iTi9zZS8vd1hZRW5JZDhoWHNxSWY2d05la3pOOWk0bkE3Z1piamN4?=
 =?utf-8?B?REs5Z2IrcmhoZGpyRFk4RmJHbXUvMk9DY0RGd0dMb0o2TVVlZzZ3OFB6aVF4?=
 =?utf-8?B?YzBWbkljcElKSEVlQmZwcnpISUlkU2VMMUJKbE1WaVNBSEY5Tk94RDBlOWVv?=
 =?utf-8?B?VFpXbG1JWlhlUjhqcTExRmZtZ00rbnBZT2kwQ2VoRDg5bWN0Z0NoSWZ5VVg4?=
 =?utf-8?B?YjVoWGtvRy9XTmM5VFFnL1o5M2Y2Rm41eCsrRng2bFRnb0p0Z1oyckxkUW5F?=
 =?utf-8?B?dGdzbDhVVjBIMlpMaGpscXdvS0t5MmsxNWN2L3V1VHJldmVvMEwvYXJDYnpu?=
 =?utf-8?B?YnBveVdaWC9iVGxVdkNBWktRNEJTMDFMUmJ3OWhoc0xsYUpTakFCUWphaXlj?=
 =?utf-8?B?NDF0ckZ3OVB3VXl3N3N3bzdqUW1sdk52K1RLaTh3QjJ2ZjVyYStxWjErM3FU?=
 =?utf-8?B?MWllZTBTOEJuclBzWk95T0wraXNRSDY5Q3RYOXBseGpVa00zNHRUTnFTSjZy?=
 =?utf-8?B?S09rdURCaUhqWGpYWUQ4aU8wME0yOXpXa0NLMGZJTFlHNlRlc1ZlSWdSMmdq?=
 =?utf-8?B?SXIvOWI4ZUZMcHZSRGtiSHBvUUVhK3JiTVN5WXhNNDdRb0drWDdNSkdyd01o?=
 =?utf-8?B?VXN1MFRUeTY3MjJiaTdWN083REw5OVRGS1JCYU0xdU9hQ1BzcUVaS05rZjU4?=
 =?utf-8?B?bHk1RG1rOWo2d1FuUUh3dEZ1Qkd0T3dMV2FVN2ZzanBqUkJaZlBXYi81OG1Q?=
 =?utf-8?B?SzRlQ212c1NNRDJ1Q3d6T1Z2Rkdsby9lalFYZjkydUxwaGRYWHUyS0lUbVQ5?=
 =?utf-8?B?NkFRTWZBbnMrQUxjeHRpMy9XaVIzYm5LTHlHUlFLM0dOSWZzV1llS1dOU1BE?=
 =?utf-8?B?Q1I3blBDVnZSN3N3N3VVWVhjUWVlelZsbFNqV3JqTFVuSEtIdmZrN2doUTJo?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd5526c-b215-4b10-799f-08dbe50725af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:06.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgvmelZYriSlLmghJmcbVvXzSUZEKy1UOUKaLwycx80a1RUERAACjHf47K1PrLaKWyaUMiwbdqQzOGMnB7PUAurDLJkbCC/wTCq57dkwf+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 06/20] drm/xe: Split xe_info_init
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Parts of xe_info_init are only dealing with processing driver_data.
Extract it into xe_info_init_early to be able to use it earlier duing
probe.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v1 -> v2:
- Add comment to "early" variant (Lucas)
- Move xe_info_init_early usage in kunit to correct patch (Matt Brost)

 drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
 drivers/gpu/drm/xe/xe_pci.c       | 41 ++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index a40879da2fbe1..733df9a270db2 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
 		return -ENODEV;
 
 done:
+	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc, subplatform_desc);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b9fe73280f56..e4a62452ca1f6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -532,7 +532,34 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 }
 
+/*
+ * Initialize device info content that only depends on static driver_data passed to the driver at
+ * probe time from PCI ID table.
+ */
+static void xe_info_init_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
+			       const struct xe_subplatform_desc *subplatform_desc)
+{
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
+	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
+	xe->info.has_llc = desc->has_llc;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+
+	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				  enable_display &&
+				  desc->has_display;
+}
 
+/*
+ * Initialize device info content that does require knowledge about graphics / media IP version.
+ * Make sure that GT / tile structures allocated by the driver match the data present in device
+ * info.
+ */
 static int xe_info_init(struct xe_device *xe,
 			const struct xe_device_desc *desc,
 			const struct xe_subplatform_desc *subplatform_desc)
@@ -544,10 +571,6 @@ static int xe_info_init(struct xe_device *xe,
 	struct xe_gt *gt;
 	u8 id;
 
-	xe->info.platform = desc->platform;
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
@@ -573,13 +596,8 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_llc = desc->has_llc;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
-	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
@@ -591,9 +609,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  enable_display &&
-				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
 	 * version 13 or higher has an additional dedicated media GT.  And
@@ -712,6 +727,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
 
+	xe_info_init_early(xe, desc, subplatform_desc);
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		return err;
-- 
2.42.1

