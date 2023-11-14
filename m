Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C06EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D121010E214;
	Tue, 14 Nov 2023 11:45:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFE110E214
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962312; x=1731498312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ati2mheFZGf+nMw+ImTSRiEo4xlr0wSWTb8s6QBE8Gg=;
 b=QgIx5WwyEd6IdBlXR+2E/+Y2Hk0GOiZPFWaWEd/jUMC5xQDkRpC/sTFH
 nAmPNPoDvgK6Wm93XodRnVhr2EE4kOgfwausg453SxY3o8YjXkfO6WN6E
 CIpezJ0elOgFiLocVkVljunbFh4UqUPwcO57+PzIr/Icc79dROgNl1mhH
 M4ZhshX7dH7wpPUL28qAAscofOkBdo1ttwZ63XkaVJyQmuOZhKOd22fxa
 rAPa7EqSPqgKCV0qAyhm6Yr+6ue//bD0fWb/JtVqgMTyJYXgjujEAcwxd
 x2NdkCFxal/O1k2UIPhLCFvO6GFwZNDQe8ducoXux5jMq/CVreHzRXBSS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982117"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982117"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835008961"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835008961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPU/y8bmhyiTituZDRL4AIhc3UqNUijQ1IRNRTIHnm4WACpxHmUAij9SrIRcUL/6wIW1KjzH2NB3bKD4O7K+MBLUzYUXtcxGa3kWBZrU95hvbXFwOwq+fYIYypNPSXcji4XUhjLH1xiYByfejM8hOLwNj1V5C3EHc5psFdmzIeFHRPVTU/kfsgEkndxe6rjVk4favtN9SCGwvuSkum5VE7VfkqKbn5sY4WyCcM8grWtwApOsu/hdv1lqxTiByzr4FWWb8dqDZwIaHQSTNkHWX8rnhIUsA1lqvr+j2hRCTOBgNI+djlKHxcsug+2/5l9IahClCnDvEEHYyCJL8clDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSdjTC6FQNADb4FAi5pgQH4zEHZSKUmPBMN8uOFzbo8=;
 b=HL2cqB0Tzpk9N2/VuZJqDQ2PIVyiNZqUSVzfJuU3foNmWrBzPkN1Dqu1YIQJvfqCfxfz+0w/VIr8t9G+l8RPuMDqUh1/Sqj74r4qfzATMpFTI8USZTAj/sczd3tIeE3mUU6Q39qvsezjCvUst5XgfOz8a/8gS3jQ1bpdpjDnmBnSf0YRbAp0QuDu3eaZ5Q+tVQELPoifOro8DkOSVoxx98zo6kBXKoU1yNWs14/Q7OgatgBD98DA8lRySs3IerPmE40xLbHbZlxjZP1Ez6W3tYVvjuAkB1bup/S1iAF4w5wChwdgh4ra8SzpTOJS3zC51cQjpP9/z3aN1GKLCSJUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:50 +0100
Message-ID: <20231114114405.2207747-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a5aa84-9a41-4db3-b12b-08dbe507232b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvU7l8iUoof7cLiVdh225/QAamEGkm1e99rVuybAu9ma7rNKoLq4tJPVj1c50/gh2s7LDq+uYnj3XcTjBb0jgctiaLeayJFhhM2lyw8lwEAQAukQdqe/STIKjTqEXVBIv/DCQljRRoLuE4PsLLjwEFrArk8ITHPgnogSja297HkUX+mFuWAqvsWbCu07lTV39MGLH60xfOwpAV1ov2lxMwm8sUhp76v/ljn5u1SiQWB6ANTjiBfHqwoFmR884K22pf6MxKjyZu6CSXsrCOdqezzeLOI8N/U9zXTmnjN4kQW8YF1c4jQhQolwu+Hd3E1rcPlvALwMGDKjGW3EjxE9S8OUwngHqnG+EyFjHHqhAtTKiz5YIfZoxt6nMYgtUyu38E4IDgjBg1JJnBZxnckTZU1cL109zTCI+vHnv/YbGKLNGKdvoG/tNA+q+Gs5T8i2TJe781BaQxcXtiyx3OcIx8c2PEnHMfYdB9iVheUx1ktA9lYjmsBDd+qli4hzpzdYzqYzitm7tS/jvNj9K4iDBxY9htRK6qYxJQsQYexdUSG+k1HnMXY/GqK7LAOl6Vj+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEs5N1dINWI5a2FKVTlnYTFSajk1ajZNM2RGcnNPQTFEeG5ZcVA3K3pPS3JI?=
 =?utf-8?B?TmE0VVQrUElReHoxbllZVE1IM2xFNmMyRk1hYkNhejFFMXZYUnc0bDY0Q1Bi?=
 =?utf-8?B?cmRXYnE4dlJzYlNyM3JnaFNEUmRnVW5iNFdPcUQrUVVtYjJqNlpUZHI2Mm11?=
 =?utf-8?B?WGdITFBpYlRHZUNUeXNIV3RkbHg3ZXVFUVRObXVlSHFRS2lYbzllTXNuY0hm?=
 =?utf-8?B?cVZSVVMrSzlhVjM4c2NhMjZhWi9RT3ZselczZDF1SDlCbENGaHZXbE1Wc2hR?=
 =?utf-8?B?OEI3TUJGRmRBM2Q5ZUhDUXJLK3pJVjZTSE4zcUk3ZnBXeitBUXliL0dpakta?=
 =?utf-8?B?TW9ucm1UanBVcVB1NVdVV2gwQjJPR1hXbDNyQkc5cjM3Q0hYSDd4R0ZDTmdr?=
 =?utf-8?B?MWtEcjZBK0hMaGdNSG1SamYwNzZ5T0pqdnE0QlFkeUYzZ3owMkZjZTFTdXov?=
 =?utf-8?B?MzhoMDZmWmVFZS9tSnIrcDVLMk5pSFVPV1QyQkZUbVJNSzlnTDczV200dS9D?=
 =?utf-8?B?N2g5VXBxb1J3Q01VckFtSHdyS1R0ZUFOZ0NKalRSNVArcFlKMTdrRWxaY01T?=
 =?utf-8?B?ZWFSWndZNDVCN2YyL2dHc1B0Q0JpOFR2d0Q1YW9NUDI1UHgraWxmK1FNTnI1?=
 =?utf-8?B?aUw0WDF2RHg3Q0hMZnZhR1ZoS3MweityV0ZEK0poUnd1WEFheFNVWWR0dWh3?=
 =?utf-8?B?WmFiVmRQVXh1YTFEaFB0L0Q1OWlhSXVaU3pZNVRtc1NVeEdXK1NzM0VKWWpC?=
 =?utf-8?B?bEJodUhTRUcrQUJSMVpUN1NETjltbzMyaDgxNkp5dVhtcHJGODF5ME1SblJl?=
 =?utf-8?B?NjRtV3BYTnZPL1lTckp2MlNrNzN1QzBLK0V2MDJicVdjSG1DM3ZrK2NwTVZx?=
 =?utf-8?B?Mk1CQVhCVWtzOE1MTUJFMC84VWZoeGxHVkYwMDlIMGYvL2U0aWNKaG5tbTcw?=
 =?utf-8?B?aDV1UWtFbDJOT2ZibUZNcVZldlB6SjNuT1laMldVMG1qSlhRQTJ0N3JnVkdj?=
 =?utf-8?B?QVZPS0dETzI2Y1l1RTA5bExaYjJwOUZaRkJrb0ZQRGFCOGx5Tm41ZHpFVVov?=
 =?utf-8?B?VnJOUHpISWtJaS9SS3J5R2dWUDJERjBTeXM4ZFNCUzlRRWNFWU9iajV6M1pa?=
 =?utf-8?B?WWMyRDhXTHhKc3dZb1BsdmQ3Kzdlb1NQTFhHckVGejJDWjRwalN2K1RLTDUx?=
 =?utf-8?B?WjEzUExuMjRTSmdFbCsxTW5zc3diOGhlNmhacHI3VFI3S2NKL2hSR2M5T2lO?=
 =?utf-8?B?VFVMOWczcXhqbEtld3h6WGp1Vi9hcnA1RlRKSXA5QlpubWtOcWpxS0psSEZP?=
 =?utf-8?B?T3dVeGZpaXRiZkpDckRPUGZreGpJTGkzR0V3ellJbTRPdFJCeXN3ak54c2Rm?=
 =?utf-8?B?WHhvSTM1QU5xOTFQUGhzYlgzVE5oZ3RlNDgzVXhuOVY5ZkgxU2VjS3NJcXVR?=
 =?utf-8?B?N3Y2STEzb1FmOUtrZDN3dTFJT2ZLMEFrRHU0b1Q0Y3JzZGFJb01LODh1bUtm?=
 =?utf-8?B?Z1h6dXNZMWpMenBSeTZ2NmlBVnRoRkI0L0lKTG1hcDhTMEx0TTROekJhSnh0?=
 =?utf-8?B?emVRT001dU9BRHlKRlViMzZyUkZJcDd6c2ZXUFR4WUt5emdXV01mL2g1NjVz?=
 =?utf-8?B?c09IcGxZUzhUUHdzT3Y5VkltS2QvZkthUys1ZkNGaXk0S21tSUtRY0doczdr?=
 =?utf-8?B?TGxMbDMxY3R3ODFCQ2EyMEYxZVNONEd2RHNIR1hPMWptUi80VjR6VlZoOERj?=
 =?utf-8?B?WklsRlVEM2JIZnFsL2NLemRuTFVRU213N2gyMjFRenZ6dFNQMDhnT0FUcE9Y?=
 =?utf-8?B?eCt2ZnpLVUhnR25mc2FTdHpGNWZWdVB0Y2wrRVZsb3JSaHlEQVg5a3FPNWZQ?=
 =?utf-8?B?MmNuL3pPQnIzN3JMWlA0c3JoaVp6ellPTjM1N2pxUW9lWGkyZEp3dFhnZktr?=
 =?utf-8?B?VlYzUFN1QmdLYkZjaWxlYkVVNU9WZHlXMzNWRFVOWVRXTG51cEM0YWJ5bVV1?=
 =?utf-8?B?eFFWK2NvQjNMd2x0NFUvYXUxdmhUc01Tc21ZY1ZQUkxUNHFyTnRtMEdsMkZS?=
 =?utf-8?B?WDg3VGtxSHFIdGhXL1FJSUF0K3JmZ2syaVVRMWZ1Qk9IZFNEWnZRR1FQWi9W?=
 =?utf-8?B?SXNaN3BhdmFQa09iYlY0cllPNkIvZnJhVHBCRnMvcnI5ZE1YbTRlSkpvS1l2?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a5aa84-9a41-4db3-b12b-08dbe507232b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:02.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5afuZon+TVeRjLP4p6YBbDXBCYAgTcI5lf1zJFgXvMLWw3ve/+UAa8qYTCtNPdOGU6FiHYfGvW35lYeLGVyc193VyrA+s5QizmHdMQDbWqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 05/20] drm/xe: Move xe_mmio_probe_tiles
 outside of MMIO setup
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

MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_mmio.c   | 4 +---
 drivers/gpu/drm/xe/xe_mmio.h   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef5099eabde0a..e9dfbf44f7534 100644
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
index 1076ffdb3f92b..5a6053a61f301 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -294,7 +294,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_mmio_probe_tiles(struct xe_device *xe)
+void xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -408,8 +408,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
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
2.42.1

