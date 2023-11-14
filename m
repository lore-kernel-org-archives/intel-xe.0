Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B3C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C910E214;
	Tue, 14 Nov 2023 13:03:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272CE10E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967013; x=1731503013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BqWisiumG8TtrscNOqCcwIFY25xbowyVDk5p0hmQj1Y=;
 b=iVqSrOJnVjFD7KAGb06Nqv2gNNMqemBlxh1s9Lpx2YzW9PkAlPrIVL9v
 eVOlAIaexkuhCfhicb0d/OOL1xeJCA/5dImVlmxThf4TiMLh93gxNLAnU
 0LLaWN02x3N2VJJifxQzIlmgo8OjQ0v8R7KT9kpg6DC8D+Y796s8DL3zv
 dlI2KSzQmHKfTK1tUf6KS3UfgiGE79VthjXBKqpgZqCzTMhIfYGLgjSJx
 K4IQf2lJOmqESbslu02aVcsXXGpotKDsEeeGNihrkTuUcaRWkiRj98JOW
 wzOedyVhnAcC9+ff/jeHhoyjKNdYkw0hz0IYS8b7Vu5pjRpyqeFfoLo5o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12195204"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12195204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908354024"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="908354024"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeQDLvAATHaw1PZn0a0aTtQpaaXB4furEYgiu0n9t5oHs3MVuW+Yb39fSJqYx+FrVVJcZPQdEV+M0opXmas58MU2LFAWzzx9uAPFOni02kaxKch+91VxePeQrsOtSdpqLyFMLWOFx2bYrxTRr1zwzFb4kEz6IZNDJQba9f73wkOUe98lLMEDj8tzrilUcq4Oi/ZAPFDaXWB+zUVD/BQRJZpcLujuV/ZmPERh5fzhI2emV1FHbn21SBGpfo5oTRt5dK6L1fVsoEd0xyRUpwdUDLC4fGuNt8wYG2mWPh3cJmN5VqvL2nfHej3bUdQNVWGqD6Navi2KFbXHiT0sgPoTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SVcutM/ZEFmeedRe3aF92jC7DZlg0h/nHydxm2rWT0=;
 b=AxUyGEgJsXYQE2R8ZfAXcONqs255xkzT6ImPoRI/Bohm54JDu9n6BsZuQUKjunCB7DxI2RuXx9JgrS5lhPFZh4n3tEC9XxkyKuAQ+Y3HCsah7Y9NwDJXpDl07s9quHrSaxKdqOm9I/yvE1+UuiuksjvZhU2+TX3QSagPRSy4j5PJxvrOdNyuabcXLj6J3SdQtdPCjJ6aMSVAhmqu2ZvgUZeSy2zOnRsaoO8OqLM5SoRa5LfBJXl4TcKUZpg+7LIB5zXweWLauXdwg0ybhvW0116wnrTPr8DSzKCzJLkikQ7dfcfRUF8crj5JWbg2zdPC9IuOXdFpJgUXd3HTEOVfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:03:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:17 +0100
Message-ID: <20231114130231.2299661-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1a0865-9585-4422-2e11-08dbe5121927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfcVDKBAo1Jw8xU3hDX5Q0jXrSGsCuhq6WVOZLwXHOUlcIeyxEEaZ9IKdVYW9/XzLUhDt6oM3YdMsWJLF8Z8hfFFqZ8t32tlmtF/QwvKzigJAXxWbiBkncBv76hr3UBfJmaRWSVsVay6E07Tw7E8jUdnx0ldBLMhFjQei82GE3OqBZ2nsU8Y91q4b+GxWu0RwUDInoKAje1Wj/gnGiV608JIdszYtnEEfw8Tk0RJte46NEA0w+9+HJ4u9ewMxvfRolJKMY8a/1Ypi+Sm3/JriU6Q0myBrn2E3OyhSmaHsiWwk7OSrWZaxGZ5G+aMVjFOxoq0R1YeFimBoDjm0WhcqIfOGflxjIZFqyi3OOzPN+ISiEHUmIsKqGCwOUmAonDTejQ5z+107HcjYZAVm5HDDAjakptRKSrrCaRU6RbZWfIC3bJxcHySe0ZzPbus5AKHIf4ZeFBvrDCMZulJcwkIzUMsrEsASDhxp82BL8MLINlddtJnguViothswtdAhNZic5LN2PI1yiVjL9DuXt8c7E8C9APNdkqPhadkUnuEt08+S18rqwrZ7sye8h/z6o7m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66899024)(66476007)(54906003)(66946007)(6916009)(66556008)(86362001)(36756003)(82960400001)(38100700002)(6512007)(83380400001)(26005)(6506007)(6666004)(1076003)(2616005)(2906002)(478600001)(41300700001)(6486002)(316002)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9NbjhTVUdIa0srbmo0TkNsQjIxVDhIb1BJckxleDBMeStMd1pEKytuR0do?=
 =?utf-8?B?OE9hbjhzS1hPM05Pb3JNUGpacDZBb3N3WkVSdjF0MlIwN0FHZFJ3L0hzbFZX?=
 =?utf-8?B?ZG9HR1FVd0JSTmg5bjZwMnNKM2s0ZXMvaUxuRUpvVVVUTW9EMEhZTUh2QStz?=
 =?utf-8?B?aWs3QSswdURtY21hSUs2bmIxditwdDFoS0h4T1pwMU9jL0NGN2ZnL3h2S1pH?=
 =?utf-8?B?QWZnRTBwQm5mL05UYS9OKzhZOUN3VTRxM2RERzFCaFNiV2xRRnFDdnFCaFRs?=
 =?utf-8?B?RGZWZUlDWWMrT2ROZi9vNWtJV0hIRVJ5TmNsQXkyUGdsVWJOdCtaMUpLclh3?=
 =?utf-8?B?NkpPT1dqS0k5SmR5Wk5sS3VxZEFxQUNwaTRBNHE2MHN6RGd4bGdKbWxWL0pl?=
 =?utf-8?B?L1hHMnh3dHljSTQyQjcvRzRlRHNrZUVwaU1QZ2hCVmo4bUtZNXNHYUxicGhB?=
 =?utf-8?B?RHNTdHZlVzdRWmNFdVR1UTdzRkJMVjFQTFROL2RvamZ2S1AzNDNmcEs4cDZu?=
 =?utf-8?B?N1NGTy81QUxWb1ZBc3J5ckkzUUR5T1djZ2xTMHZqZG5YRGxhOUVFd1k2cTNt?=
 =?utf-8?B?YllvQ1dQeE9KeHljY09JQTlqbXcxYmdHSlpOK0Z3aGl6YnAvUHZXTWdOaUZq?=
 =?utf-8?B?a2xIRklkeWhJa3VBNWV2MjVGV0I3Mm9GSURRYTc1cnNhdmJwRndGc3RKMk05?=
 =?utf-8?B?YUVyMHYxWVhweE5rQ2NTMFBXcXRsamRobkxleGVmUWtUaWNscVk5MXhNNUlP?=
 =?utf-8?B?ZEdpWnBWZ3kvRk01ems3bE51dnZjMG9oMTZ6OTQ5L25aMVpQNEVWaHkvL09k?=
 =?utf-8?B?Q2RZL1FyWjFWUHNCVDFvUW5qd0FvMmx1dXVPSDJWN2JPVjVBWG5jMytmSGlx?=
 =?utf-8?B?NVF6NFNVVTVJMlBCSW5ybHJQTnRBMEsxczlnY2hZSGd3Zk4zYnQvT0dlbDJl?=
 =?utf-8?B?ZEppSUJVQmtnNUl2NTNqQm1sTzJUWVZkRnNOeUZKdG1xWTI2dWFaRmw3TnJ6?=
 =?utf-8?B?a0dKMXZLR0RwUmdWeEMzdmc1WlZjRW0rcGNsTTAzZ1NDMWc5MWZnNnIycjN5?=
 =?utf-8?B?WnZ3YkRweE5wSlVLcUxiK0ZYaXFreTZLeGNMeU96a0FoTmFxOVdnVmsxUkFo?=
 =?utf-8?B?S24yRUxZcUUzTmtVM0ZsZzdaTmdGS1hnc2dPaXVtanpkaTRqRjkxVXAwdHg0?=
 =?utf-8?B?S0xVSEU5dFJKZDdSMGZrSVhHcyt1V2EyalFNaWg0YnVyRnJ2RG1KRER5eDJX?=
 =?utf-8?B?NGRLZjI5cVRjTFF6eG5RNFp3OVMrSlhNWjBUeWlzNlpidnpucy9LOU0veFZM?=
 =?utf-8?B?bTZ1My95b0xyQmZRcE5ZWHRNdTNRQmNCRUVadDdUY2pPM3hmOXdqNU9FdE5L?=
 =?utf-8?B?RXV5RUZYMC9zRVoxMDIzUmhUc1FiK2hPakxVcVQyL2kvT3dubVorREZVWkUr?=
 =?utf-8?B?bUFZM3NuVXF1Q3poQ2U4VGhRVnRqZVJpTDVzamYwYS9tU0hYclVzNTNjMlEw?=
 =?utf-8?B?TFVNTlMvRitCSEZPZXc4NUFhb1d5ekllZU1hNGNwV3RXK1dSdXpaU09zYjhZ?=
 =?utf-8?B?c2lDZmVzUDlHL1FRVWk5WEpNVEQra3VldFhaM3pmWHF2Y2NSbHh4Ujc4V2Y2?=
 =?utf-8?B?ZUozQWVWNG1CekdMWmEzRjNGQ002WVE2OXg4bzhUR0I2dEtrR1JiZEVzZDVL?=
 =?utf-8?B?SUthQWNJTnN1ZFJ2NmFUWnBSZGpuS25seFFyYXc5YXVFdVM4cXpIcE9LUWkv?=
 =?utf-8?B?MDJVVkluTHVXbFBSa3Q3VVZKQkZncWVIWjd2TFdWZy9rNG1TMTVoUUVjeHlV?=
 =?utf-8?B?ak9GNnBpN3M1c0FZaG1nem5pQ3hpZGJDMnlUejg0TkJpMVQzUXpwanMvN0Nw?=
 =?utf-8?B?SWJyQjNrQXJmeGl2cEMxMGIzTlpOYmFZbWxWdnF2RWpnMHQxNGN4MUlBb2hF?=
 =?utf-8?B?L1ZJMHNmNS9ydG1JLzVqK0FjVk9nMFIxT0IxNk1EQTJpaWxKRmpqdFRlZ1FM?=
 =?utf-8?B?MFBTVHlJMGJQeE9iMEpTSGdhazNPdmt4NWtxOUUzMEdNMk1iTSt1WXBtT0JO?=
 =?utf-8?B?TjBaR25Ib2J3NnZUVDlrZHdJRWNra0RZbHFONE9tNzUxcEZFdk5ZTlR1N1lI?=
 =?utf-8?B?TUNDdG9LcHVFeUh6L2hlbXREUmp0TXJCc002OGxnTXZuZHY5a24rZ2IxQnlt?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1a0865-9585-4422-2e11-08dbe5121927
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:29.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7iqM9bhHmCsGH7clYiMY9impZ2J5/y2G/ycoBbt+0dfuDAJ3+j6jO366JTrOo0dd18Deojom3MLnLCBOFSLKpCo5/fpiLjC6vpo5wysC1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 06/20] drm/xe: Split xe_info_init
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
index e6b59c4b02bdc..d603093f32274 100644
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

