Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D564C4167D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5E10E362;
	Wed,  8 Nov 2023 00:34:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B4910E305
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403691; x=1730939691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FO4l//lQV4VzSGYN75TsDbSRHLRVOhUPfcHS5xLYyIg=;
 b=m9nUzROe29yVgGih5vhmLAIjQ7YDJQmFyPQNB3wjFrV5WqALN8/iQPVg
 38df+ZycW7PP10ENhU7r9LP8WPQiwgVNJyDc91o0/T4TNDQYk2aiwgQAJ
 Jhamdqdu9Y9Bn4Qhg3LxDrXo5AmOh6kf2Yh8LMSzt8g5n/kveAZUciXfY
 Jwoz21pNXS60HXGOADsIsKUNhNjOLTBoCJ2pI5Qy29qOH/jzdqtYyC45d
 kKQoU/KssiERqyE5WoNAPknDFeOd6u5Np3LNyJY51Ixer4h7WpnINbVip
 4+PulMvOSkWBfiUm8q+c8+Nl6UzGjWGtkq6qAS46L/Lwlejy8C+cEooMz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475886166"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475886166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880019028"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880019028"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaGu5CU+w49FOijaRIAsOT+O0Z6ScsVIC0cCj+ffh766XjJThPpdPBQW55SpEPYZWpFdhvLruwcDmNpE+91apwInNW4fW5pAid3zVFuw9ouwORf8EILI3PzGF7CklWAq3MyBV5D40r6yCmQbMBiQKun5U9puAcmyyMyEecjLMJdm5ZaChe/4Kk9C7Or1h4IltdONUNdxF+F/eLPGXcydFfvsDbkUWtFY5YgcS6qdVJSaTl6ExWfA0CEdNsaouCJwDtDJJiIEN1klbLCEaa5D9G7tO8PSUDgAOXg0w+GISlzfL8IAroqqgHipZaIeN0lOLuBE8fXzRf2kEEgb+xGhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcIw9wClwWYsoWBj4Gk2Ijup7IZan7bR6FVcrZdeorM=;
 b=YnIzECP2W77d5ZQXPaAdR1MRZcikVQjcRH4DyZr4atwNvpwEF2/MEI3VKeF49tPeAjNGhKESgl7XUK6pmgv8X7pHiRcDetTx7V1ZJd48nrZ++p2la0jvVVPgFll5Ir5NogjH4hceVOTdyS2qT3CvArMKXqJx4WM7EOfvjhzZczWgUe7Ty2clnrSJOQKOLhUqeyPeE96Klu5IyMh1DEmkwKjvg4Tr48cUNC5iIkv/TUXB4K0CX3DVdRO3Y++A+Yguq3UImObiHJ1LsCgjVtSGlOIw5XNHfETRAgINdHmKi0u6bFedx70bXdYdrGNABUVDDntFuXie4Poo0NoAiI2pdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:35 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:35 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:39 +0100
Message-ID: <20231108003344.1169016-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 98920883-5e8d-4453-e925-08dbdff27bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8CBkWESiPISAANaWMC/FUTvrE1rQq37wV6/Xht9VXbP9Zm/a/54cVTgOnTMNtKi8Yy4AJfWQQi/kh+oVbVtQ68dcugkJ43nYGLBfDuc+L8Xeq3dqUf8H7HCWpPs9uF/Leq7owxEshibe25SBmMUSxOQ3aGQdgq2PaYv76/6icb/uWKZ3EaNSnh0PjX3LXbHpRePV4PCEih/TM2qnz97OjHtdhoQW9tPcwLj9H0L9F2HHr0KxzD4lpYhf34auQYXJ2NrMmwjORQ/btViCGSqnY7T7i2uYdg1+VALPev3UlVdCMEkMYMAbHtxvJCDqFUmbGcddILaMrHIS5vUMbgryh3rUzsM8Jdy9XJi2EHPtdDlBdTMJERKs6a/6TzFO6D4PCnYPvhl7O5OlHCXI9gPfG3qspbfT+qp9UTWXj69Zb1n0AirtuEcSwtCELPArQXebRf/Sc27YSV+RQVaRMNWdjlYmphfpDxRlwqqyb4qVYtjV3Un7f5NPu3YqqS6fClKa2eq1jf1qTaYxbfEL44L2Ool1LNLcgT9okiXI+Wv4T8/KWXT2KhrSQls0isaY3lf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGhXb0ZIbzd0LytmMDczOWlkUkpOaTQxMmtYekJSWVBQTHh3ajlhaXhKVXVI?=
 =?utf-8?B?TDA4aVZjVTZVOUltdUZtdE5vZDdsT0oybmxvVk1Ya3g4UEF0OTBFeHU4WDRO?=
 =?utf-8?B?U3Q3S0lYc3BiYVB1RklwQUIzdzlKd0ZsamVKd0hPVE0zUmtTQXVUajBIeW9x?=
 =?utf-8?B?TEVoR2VuODlpY3o3bE5lT1ZWeEppNmxJNWlCL1pCaVZvdTdVTkttVnkzcTQy?=
 =?utf-8?B?YkYxdzcyNHF2SFplUnRFSC9jcUVubmxOK1o3cUFMWDk1ODZOZVJ0SW4wc2Uw?=
 =?utf-8?B?WHdpSklYNnN2bk9kNHVvNUgwTG14RVNmbkRKMzZlUU83Z2VrSVZyaG9GYm1B?=
 =?utf-8?B?VFhDSFBrSXN6UVZBdlIzY3gyTmRLL3dLQ01EM0NGRW5MQjlzK0FSdUtVSXZa?=
 =?utf-8?B?aU5Wemg2dXlkdDFLS3RWTUpGMVRhdUZuQ1BrM0lNY2E3NXhsS2s1QWRLbHpa?=
 =?utf-8?B?a1c3ejU4M1ZFOEM1Y2l1ZVhSN0twWitwUFZWNklybVFrOFhwamQ1cFFoK3lR?=
 =?utf-8?B?VjZrRDRBV0VBVHhhNHVJeTJSZEt4QzAwQ29xWUNWc3AyNW9RTGlyZkV2bGtG?=
 =?utf-8?B?UXFmaDY2M3NpTlVGTEYwaTRoVmx5VGhXTzNGY0l4U0IySGl5K3RFZzBZY1cw?=
 =?utf-8?B?M3ZQZ2k2ZkZlMWtJU1hrUlcxd2xXbG0rbGFkNmEzWEFXTTlOWDI0U0dNN2tT?=
 =?utf-8?B?U0wvdld3QkFlZ3U3NUlPZ0MyS0Q3Uk9WK0xuMXVLQnpwR1RVeCswUXVKWFVE?=
 =?utf-8?B?WWtOenNwek5BMEtXL3JVZ3Zud0xFVUQrdW9USHJzeWtUOTI2TnF6bGtCdGVi?=
 =?utf-8?B?YnpEL2RmdTc0RFlEcVdjM3p1Zy8wKzdsb0oyWGVzNlJBdTlJN0ZTZzgyNyt6?=
 =?utf-8?B?S2NHU2hLVDU1bTlRVzFQS1E2UFJRWEVjdm9lNm5kZEpzc1ZBK2lkWjVISHZi?=
 =?utf-8?B?VE5JRml1YUN0SHZ0RFBXeG1GTkszN0tJdmp2M3NiNm9sTDJzdFBrNm9oZ29s?=
 =?utf-8?B?VnIyaDl0bXlDckZQUlViV1YxK2EvVHpCbldxUW1UU0ZYZXRpMUkydmVuaUhP?=
 =?utf-8?B?UkRRazFqU29TK1dBY0lZQmhMTk5wNTdraEV4VGIvTndWS0ZyNHNEdlFSL2Zx?=
 =?utf-8?B?WVhDM1BwUHNnS3paRi9ZbEpwS0NXeXBBQ0dLdkowYi9NNlpqV2tkZzBYUHpP?=
 =?utf-8?B?cGpJb3NtYURTYStLZkRTamRQT3h6eFNaNXh3OG9GOHF4aGU3Smw0ZW9BdWJi?=
 =?utf-8?B?ZlU3WkdaaXBNTGhIS2dHUHdoYVFqUnNYRFJyL3FOS0JtOTFweVdHbkdMUFRz?=
 =?utf-8?B?dWd0R3NnYlZMUERVTEdlbnlhQitLVGF6UWZXZXkyWmNTSEdoMDdrdWEwUS8v?=
 =?utf-8?B?NWFHWkQzYmFkMWhhWWJhY2dPMGMwdWoxamV5OVBQdnFtWGQxazJZUFphRS9h?=
 =?utf-8?B?ZUJPNit4aVo1clNobzlOeTdxVnB0NDJZSFlQclQ0bzVBamk4TDVxRDlBU2l6?=
 =?utf-8?B?WWhDMktoelh4WUxpd3R5Z3BQeGsvbXB4MnJPUHJaMERQV0NaWVIzY2djeHNn?=
 =?utf-8?B?YVY5dlNWZmhka1RwYldUb1JkcGFDS1l6ODR2M2x3Mm4xb2t3bmFRT2J6c1FE?=
 =?utf-8?B?b0JiWFpLc010L2dVaGFuVXlXU0R5WXVCaFRyd1dxZkdsYitDb2NHNlMvVzhS?=
 =?utf-8?B?NU5LbmpwQm5ZdW53QnpSSm9JVkpzV0hYOElCYUhZTjlzMUxMVXVLdCtxL1ZV?=
 =?utf-8?B?N2VZNkJidFRBdjFGd2FjNzk1eG81VkdWLzR4ZlNOT29sY3lyWTJMK3Y5aGF2?=
 =?utf-8?B?K0lsM05LOTZKTVlDQ2NmdktrMDZhOU5tbFg1UzJEdGwzQlZVYVNkMjhRZUVz?=
 =?utf-8?B?NDE2SkNpQmwrS1B2Nk1rSzE1MTIzaFVZYUltaVp3K3VXRlR4bGtoRXFNSGhw?=
 =?utf-8?B?NHg5Q2FMTU5xN0NlMXZmSEFSZUNTUVNIQzV0cmo4SDlTVWVjMVdjRzlJMHla?=
 =?utf-8?B?NU5YVGdac3E0b05WbHNhdC9lZlZ2a2JRZnNLTGJyUm1sY29CSlZSaDJmRTd2?=
 =?utf-8?B?TWRqL2pja0VKQWhIb0RNMVNXNEZlMDZyRHVITXJORnRUb0MzakJBamcvK2Nk?=
 =?utf-8?B?WlMxVmVuWE5ZbllyQ3lORHQ3UnpUL3h3NE5hVU1Jck9UWWtsc2hGVFkzckNz?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98920883-5e8d-4453-e925-08dbdff27bdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:35.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NQphu6lN+uuvG9CxgNfrGVJergvPS7LsPA/Y3mV+9X8vB7HuBv9Wz5Y5RHqUTwY+bAZ2QXYMYZlkOa+ZdRxGNio6+HakZcOXyJbTMS9+MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 07/12] drm/xe: Move xe_mmio_probe_tiles outside
 of MMIO setup
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c   | 4 +---
 drivers/gpu/drm/xe/xe_mmio.h   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3bcda5626493a..53be4f0424c21 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -392,6 +392,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_mmio_probe_tiles(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7329ca73e64ad..ff968ef611cac 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -306,7 +306,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_mmio_probe_tiles(struct xe_device *xe)
+void xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -398,8 +398,6 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	xe_mmio_probe_tiles(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711d..9f1a25cfd2cf0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define GEN12_LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
-- 
2.42.0

