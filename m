Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC3EC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBD410E305;
	Wed,  8 Nov 2023 00:34:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6156A10E329
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403672; x=1730939672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/wYArEwqx3Tmm0OP8I8kY/I5l1sPYQioviCOFI6ZSZE=;
 b=TzrQP4Ia+0i4nuucZVjPz4NG7uuC0jvXt98AzPUgHZbZR0UiZoU0NmMb
 puZVnvwAq5VZbWwKI4hpJhtIqqZBO87lNV8inqQxz6HrRgwd7KzA/Ugye
 H3wR8ayclBmPXbbckfakHZU367f3eRARMuObW43aXAdct7c6LeskShfIj
 5rCRJc6tFkrZkAge/P675VWJhP/L7hTUKZ5Z8VAW3v/KBzRzOgZTdW2R3
 VvoosuN/19JK5nccutr8uOB2iHocKsITTBwuornOA/wo/TTEqA0JobLmy
 e1+BUJ+JqEs34lKgzz3zMOCPxo5pzJnqFHDjrQsFvvEPm4zAAQZ7nm46F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368991712"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="368991712"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762889629"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="762889629"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzJ4KoYNDktWtUVmo2HiFpE9guVqmljW8gqMRchcavO7FN0F78RO2QDC+krP8IZKIhs2YxnDkSp6tREUpoN+xCtuQZvAAIz4MTQuqab7yi5EE9j3eh+uOviMjRZmY/IHGzsNtWlqYVxLTop7P/Vpn4/qQ16VQsVKbymrI31DUsD2R7xaBgmbVdeULFRThaetIhpkNX4jIsqAq3c7VSyHHEHqo+sTMDTh65S36omRuPaa2f4nmC+xGL3sq36hafo9kn0w49lMlrj8c0Y8agh8f1Mhos39NVHlPN3V9/v0vzNdFDjfLZEB2/c6Mh9TvDou5/9OUbQWpxlp33bIrgtqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvVJJy7r96NPa6R7uV023TRZagOdtV5IuKs3Yi0UHQ4=;
 b=bclR/93NBQC6IP9bYrnG29acui3N5VjF0Ns2R+eWv37z5afn18tOOLuoH0CvstxSV0wz+vNukQv9P7EC6KbSrmorKjStNXTgfvsEDZXvKMFXNc6RLn0JpP+q9w8U0ncRTpxftk7tU0bfjHB82F/+p7owfDo8Ot0vN8S5GliZeH5/JX+gw+Ne+QwocMLCO+JQNEH5ZGDymSA1E215nV5Yr2SmaYFxAPpfd36lqyGkZnOYLpRdSDrwx6eVENH9CCWnru9+P1gVzXIpgVdqcxFW410UU4seViUG+z3mfn1+6pa/CCZl2PU/km0P6B9/3Ku5CDHO+h67KbizImpJoEqpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:37 +0100
Message-ID: <20231108003344.1169016-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4f37bc-324d-4400-9997-08dbdff277c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2bIbCdZRcsxqHcC88J1BfHAX8i2p1G7P1A7MUtbC9GJtyb8SmcOyIFYiboU/uJoZqttYNIR/ZteQxMRSGYlUrMSXpQoNwlKaRCiE9pD+C+j29hznnxiW9VRHNRXOqMLmQrqlFruEao2tF40N+UUKmckS/RKUIs8+NefkLEbJgBXHk6bfRCxF6aWjvy66kfg+fKlM+Z2hyGqQnpwxwTDfgRYNkCW4yq9mnLXjpn5kdT2pDqqGC/liF5fwWsrxfmNP8OxYT+UKXNq4MqA7FkQYtNyB1ITtOzcxF71+qXyYTAN1RfPlb6SeOc9jNWuSrPJSWtdNoPYcdy4bnvG+vWpQ1XfjtNRh6AL3sFUN5S0cqMyn/JvtirD1PgH0oZe6d6BHMwi4o+tSrfLpnOWaDrR3tJoKhGRW4BJHPwOoPJLeqj8ZZQAIgbr//o5BF3h0MJ5xbUX8nS/lZvBOSISkd4j4y2n6+KrmbObu1MjXPleKelzBRqf8eZkCAcuGt2Iamx7SUMdSsJKj5tt4iVyiAU5v+bhSBPVlMrY11i5eB+LMBHslzMIOU3eHdy1zgQgYVJX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFMxR2xBa1lGd1BOSXoxbnRMblBHZXJaYlo5VllUd0k1a0o5aWRORGMyNlYw?=
 =?utf-8?B?ZUh6Z21HcFUwZmZncTd5dmlGanVnSVMyUlBRc01iakFXMzFocFZZSmxENVB5?=
 =?utf-8?B?b2RzWXprL0d1ZXhTTjVScE1PMHFjbnA4L1ZydWpSd09SNjYzRlRuaGZmSldC?=
 =?utf-8?B?Ukpud2FIR2NORU5aRjNDNmcxU3R2THV3VjE4WXYrcW10RG9hZk1uaVB3YTU5?=
 =?utf-8?B?L2ZBdkpOcHJOd3VEVU1JdHc1bEZzWUlpYUZYMFI4WWREZ0tmeW5zdVlSWThK?=
 =?utf-8?B?TmV4UExKQVFSNXppZnJhNjlVNUxJMFJZc2FzbkU3QndTMlhRTzRkb2JPcFNt?=
 =?utf-8?B?ZE9RVmIyZTJ2SWRyeVlINjBHUWJkdnBGOVV2ZmxvS2QrMnljSTQxekFmdVhy?=
 =?utf-8?B?MkpwN29MazhabXczRWNJcFZuVFZWZ3lKZkdLRjZrSCs1RzVtdjFPN2lFSzFj?=
 =?utf-8?B?TDg4STdSZitzUS9yZ0ZBQ0N6RkxtV1dYZ3RVS2RlTTdyK2ttRWhIN0lCM2NU?=
 =?utf-8?B?d2ZQc3d0aXZ0c0FVYVlGbU95VVdSaDBsSUhGVXp4QnVtMmo5dVBaSExMQXlp?=
 =?utf-8?B?TzdXSjNUYWhoNUFOL29QelVueklOUmM4MW0wcmcyZEw0Y1VQZ2RBL1doa2tq?=
 =?utf-8?B?TlphMUk5REdwUEROYlVUNnB2N0pOb1VXVFBwNWZEVTFQaFB0QzAyMVUrL0Fq?=
 =?utf-8?B?bXgrUWVrZU5JL1B6UmZCT0JMRzB1dWFwdElBNTVWYmdEM1JLNk1YYUE4QnJv?=
 =?utf-8?B?L05uU29WN3U1U0N1Vk42RnFJUlM3cUlsUTVleVRPNEs2V0k0N2Z5a3AvN3Fl?=
 =?utf-8?B?dlJ0YndhdXNRc2pTcC85YTYyTXVacjRFazZtdDZtaUtMVHQ1dmIzTGN0aXNj?=
 =?utf-8?B?RmVaSjlUbFNTanV6eDJ2RE0rUXdSTU05UHZjcXlzRUZYb3gxM1J0ejhTbzBk?=
 =?utf-8?B?MEMxa1grVjZjL1RLa3pQdmEvUTBLbk9jK0dtQ2t3ZmUxNWgzeEVENzhnREZQ?=
 =?utf-8?B?RkZHT1RpTVNVWnZRbFJmbjFTSzg3NFBuMEU5eEtuY2ZIczBHMFRsS0I2M1JE?=
 =?utf-8?B?VCtMOGI4T1gwWUN2d2UxYVI4ZGJaclFIazhlOUl5dHh0MEs4amhpWXBFcUx1?=
 =?utf-8?B?d25GOXBQNkxzVXBVNTNEZ1dCcXMyOXFUQ2RoeUZHK0dMOElxWVVyYXo4YURz?=
 =?utf-8?B?OGk0dHRFWFhQZEljK0tzcjJWNWRKK1JmOWVPdndjdTRTQm1NNTdIZzZaSE5D?=
 =?utf-8?B?T3VqditVZ2ZXbGdxNmxRQjlWK3VOUnZHVnlLdHZNeHRVOGJscHFMSEgzYS9F?=
 =?utf-8?B?SWIramEyV1R1eW1aSk5ZaUdCdE9WRHJpd3NhVWZYa25UYlU4SDVKeDkwZEp3?=
 =?utf-8?B?MTJUUzlFSXdDcUltajRGNGdTaCs2aHcyNDZyUjNLSnd6dnUwREVhNlMreURP?=
 =?utf-8?B?OThMcVJVdFRDdGRTbkdyeStKT2c4NndkWVFHb28wL3dIT1plZjdzWlNBRUE1?=
 =?utf-8?B?Vlc0V3pYSkw0c1A0akFaVkMwMkZ0MGs1YURyOXZiN0szUVlvYkFYVXdhOVMx?=
 =?utf-8?B?MUpIVUVIWkgxWkcxVWY5ZGkwUlJOU2EvNUlEL0VTc0c4U1c3WkVPSVorV1I3?=
 =?utf-8?B?VWsvRFI5c3lQc0ZXQkFKRG1Xb3RQTGRCT3lZeFJQZVdpSkRVNzVCSi9LaWRX?=
 =?utf-8?B?ZlozbzlDWmxoUUUrWjAyaE15VEgwM1dvTjIxOVVwMDloejI5dlY5ZWwzY1lS?=
 =?utf-8?B?ejl5aGM2Slkrd0U5a2p0VDlPWExIUVNMWC9tT05LVEhubWxhOWlSNTV2aDMv?=
 =?utf-8?B?Q2czOGNNRHB0NnJ2cWdKYW41aGRoaGladGw3TFdvTkJSQ01RbUJpY3VEU1pF?=
 =?utf-8?B?ejdFNC9QcWt0VmJzMjBhUmFzSkhZQkJPU0NISWFCR2RVcExxdWNBQjI3aHNq?=
 =?utf-8?B?bi93cXBmeUVLTk5FU1VtczBmWkRnK1hQT09HUFZBT3hNd2VJOWJ6YzM3ZWxL?=
 =?utf-8?B?VzRSRjgrNXJhMHNHQXJBMUkyK05mdm5PQkhFRFFoeWhrL0N6ZUdlNG9QMGt1?=
 =?utf-8?B?WVc5RUkyNGdsWDZpUmdXVVAyeHAvU0NiRWNEOUl1LzE0SVVBQVE3bVlpUTdj?=
 =?utf-8?B?dlhRMTVXSWhkQm9BQ1pFUUFMWmlUeVlRREU2S2tPWWs0enNoaTJKd2NMYUtu?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4f37bc-324d-4400-9997-08dbdff277c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:28.8627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3+U9+/tpIhZjl820OkZzc0vahunFfLg7Lie6CI3qVaE0Nl4g2aJTxTlg9MnkOaDK6sfhhVMBteaXKAwUQ8s8SoteKf0sJ02IyisXzD9VfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 05/12] drm/xe/mmio: Move memory training check to
 probe vram
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

The check doesn't have anything to do with initial MMIO setup. Move it
to the place where it belongs.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0da4f75c07bf6..f4cddf2dfa3a3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -254,6 +254,18 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 	/* Get the size of the root tile's vram for later accessibility comparison */
 	tile = xe_device_get_root_tile(xe);
+
+	/*
+	 * The boot firmware initializes local memory and assesses its health.
+	 * If memory training fails, the punit will have been instructed to
+	 * keep the GT powered down; we won't be able to communicate with it
+	 * and we should not continue with driver initialization.
+	 */
+	if (IS_DGFX(xe) && !(xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL) & LMEM_INIT)) {
+		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
+		return -ENODEV;
+	}
+
 	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
 	if (err)
 		return err;
@@ -384,7 +396,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	const int mmio_bar = 0;
 	int err;
 
@@ -409,17 +420,6 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	/*
-	 * The boot firmware initializes local memory and assesses its health.
-	 * If memory training fails, the punit will have been instructed to
-	 * keep the GT powered down; we won't be able to communicate with it
-	 * and we should not continue with driver initialization.
-	 */
-	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
-		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
-		return -ENODEV;
-	}
-
 	err = xe_set_dma_info(xe);
 	if (err)
 		return err;
-- 
2.42.0

