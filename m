Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20FC07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F3D10E5E3;
	Wed, 29 Nov 2023 01:16:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75BC10E5DD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220613; x=1732756613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VurglYA52KQh61LJXRZe+rlKLtbhKrLBSpQw9TWZkiM=;
 b=bJoyDy/3+ZSmtbPgyNGdxr7hgqTzE4OmLTndPEo3w7oQS7RdPCOHFl/E
 xD1PvKT3PsrB8hmzPvoNF/FrFPY79qHuh6ZUEJSCx2ZHsxXUF6QwP4inN
 oXmOv4FwPPXnTFjkNDYPgzG3mHFx139QRY01304iLpa2yvQzntBjG/T0x
 vd8c4lsW12qVhW+1ZFc8i5hCPu3RUCrg4iNr7VH8pXbK95In4vk4ZJiyP
 P/Mn92QG3Zrk+V4Ov7egfrLL0blr/OhKnVHQ+/C4k9dLrZ3tGnUQTVhSB
 h9wqjK+NC1dTxy1lE//a+1SpR9z63tld2e2NE2O5DiMkjr1aIV+hQQOFH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436543"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272559"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272559"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:51 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj2+rkj5flah8EcDbW6m8ql7IG4+GL62c5S5b+FQw1DzT36uYKWiykoaUkmw1OSBLeuN7CMw6dJtX0Pke0wwmVFAPlMHvG461Bmu1jJHjARyv0k51VLC2gg8htj1VFTJWS5IBsPE/d1rhEesJEEgw4zfV+p6lC4a2nc3vbGrL2TlZ0Id8qyyGEn6ZTqpppIntlXRt1MJ5K5NLIuUIWjh/BSPt0miEPm/tdPANIcWZYE7AN20STJncq7jcYfTFIAzVo1CUADCqMEx/mfut2w8La6yTSkS5AAh9e+SQwRwsfMD2KXQCf+ulQ0D1QUAYL94UWzWt9BL2QniC54lBSrMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUqJ3PvEoe3NXg43oN23dIi4d8diPyPJjoeHlTrL6X8=;
 b=X92jxO8WB81G4fTjjwZpAu74smo2+B8DLj2LjE1pBX5/Ucy/tpYjNSGs6Rd2SWq0Q7kzy/xOwbmMa6cMc+h5QuZMaRJx7bTDdi1Z2o3sPURk73bJqwKBVG04lgsU5FnY9r9Ne0An0G+Fr9T4btEYQdYDf4SA+11v/fjkdv1wpDCEbdVW/zBtynDoplcfRZhIB0rvN3/qKGI4GIyKyQOSaGKRfHoa6aYeLr812RvJFceGbkyejDq2K0e/j2vZEPo0aTdaCRc8g3kDEfxte7tljComcMvlsMA73hJIEGfNeq5OC17lUozWc2fFoe8TFYHqRHGHgO3gac/VG4l8fwCvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:07 +0100
Message-ID: <20231129011624.836843-6-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd1160e-82d8-466f-5f52-08dbf078dd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JOqXRcjTDB1ZgTEE2YKUs8tvzkDIa5b7rDP0p2QOz/pbstJTlvQQPflYHekITTOXuR1NWx6c9KkTGT7x3NlhtNbalRZ1sYWk58AIHs38R5m2H5sMD/VkzWCEL0PR8E1i8Fe2MVKLt3Qxx7VXEQVW9FF+5L/f1ItLTYrfES3mbFK6SC2cErSFSOxSoj3+kIOwQ3gTdPz0U/ao/tbtycouEKqXyMEdvpAVrhF796yacmmKrHAt8Are5R9OT2HneOSI640xzV4T9UcaFc1XYHeBJc2lm4Zvy1TE2KOXJQgVdyvkQ3qcen4Mqmhm61FlqwjuAUF7BpJOnicJW4eBDDBeLkfoaGjKpI6hQnSIZorzRD2D3CCS6ZXPcZqp2QeCDEC2/pOTGrP3ukRkU7PhzPfuF+cP80x1rsxLWZr3979tkiK+kTHcqGikGXMY8/bXpcfbVNuE8z+a4jE06wa/RsHtaZ/pmqaj3BjatQUwsn0SpXKmiB4CytyPg+09z0eC7jt/QzIb0aIOOUhUvTIlwMOuVfrfa1i9Zc377UD8vHJiZZiEYn7FMMdqI4i+CrDHR54
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEc1M2ErM2JOeDl2aWwxVVR0YjMxTlpxZytnUHdKcnp5d0t6YU9nOW0zYk9k?=
 =?utf-8?B?dE9BYVhRd0FsY053aDJoeEtEeDVPQmVBenVQUWJRcG9EWFpVTCtVRTJ0Ti9V?=
 =?utf-8?B?TWZhYzdqbjlaaW9BTFlONmZPcTB5STJuNmcyTHFNNXl2eHJvM0VBbUg1c1FM?=
 =?utf-8?B?Y0l4ZjFVWlEzdkZxQTRMRStBK2dHSHVURUp4ZkNEWE1YUmR3N09KTGgrdGFV?=
 =?utf-8?B?bkY1UUxGdkIraDVMMlEycW1iRnRjaDUrUVVSd2tpdG0yc2luUWNSV1l2bkJM?=
 =?utf-8?B?WUM2ZUNtTkJNRWJrc1lnbVVIMDFZOCtpd2dHeFk0SU5nZ1h5T0tPdWY3YnlY?=
 =?utf-8?B?eGpGL3dOd3FBU1lFQlZoVGJFQXREYVFLTjhNVUlLcnpVUzV0VDNPa1d5ZXVj?=
 =?utf-8?B?U0Y5dW1qdkJTWTNBZmtYVi9OL2N6R2M2QkNFT3JJbXhxNEZPZmlzWDh4OGh6?=
 =?utf-8?B?UVBEUFBIcjRHTDUveWZLeE5JYnBLZ2dyWmF3NU5nUGdIbjhGVnRXdUNEckQy?=
 =?utf-8?B?VlRmb2kyZWdIVThYTWtaWVhrTE1XblFVZVhYdDdhSHZlU1lQOHNIc2tMMUsy?=
 =?utf-8?B?bmZsYjN3VnpVNDV6MWo3cGhPS3Y5SlJXSjVHZnlUQkNHY2JHL1JTbGhxb29q?=
 =?utf-8?B?UW81aWdCVGNNZHFwZXdPbG1rdExFZkZYd2RlUWdqeTJlenFJM01mVmU5QUcz?=
 =?utf-8?B?NHBnMDdCQm9tUWFFZ05zeHhFQlMxYllPWUFSVWlKb2szMFNETjN0SHEwOXRa?=
 =?utf-8?B?ZlQ0d2tPL01VYjZjTGN1OVlUTmRmSUNjcVVRdFA0RXJnNmVidDNQY2g5ZVIw?=
 =?utf-8?B?UDN0R25IZGlzRVd0Yzl2VlBKWlRGeVdaTnh5S3VvbXBBY2ticDFMNXBRMjBh?=
 =?utf-8?B?VTVta2JjQ090NVZxdnVHYUpCalRtaFFpbTByZEVDaGhsYzlCMTJmemZtMysz?=
 =?utf-8?B?YlNPek9JU01TL2N1aUxGaGdJandSZkp2RTIxTTVIQ2xJclFLcTNTS3VCbENp?=
 =?utf-8?B?ZFdGcFFQZW5odm50akNLRlhHaUZQOG1PTksrSzYzZVA4eEdqWXhVaG1Beng5?=
 =?utf-8?B?UFU0MHBKUktBTE80RlUxVzFhWnpra1BPWXR2NndyQ2RIc3pMendJeUZzS3Bj?=
 =?utf-8?B?WDM4TEdoMVgrTHZoQnpVeWd4bWFraytNV0Y3NkpLLzY1V29tT1RVRWx3UWl4?=
 =?utf-8?B?S0wxTTQzbXQ2eSt4SDZwYXo3c0RjTXE2SDJXcnBLV2dXTDRscGh3WjhKdThV?=
 =?utf-8?B?YXhZbjlzVXE2N2VzcEo3R3pnUGxtWGdGK1VXY1JkdE9VQ052WktpZVk1YW1C?=
 =?utf-8?B?c1IycGRiUU1UQ01xV0p5YmhDUXBISDg4ck53YzRXdVhrZEQrNDZPWkhKb1RD?=
 =?utf-8?B?TmcxdmtwNU5STDdmWWMzNmxjKy8xSHFGNXJCTkRGV3FpRUxVbG9vRjBMYXVu?=
 =?utf-8?B?bldjZTNNaVRJZjZ5bVBZTlpBbnFDSyszdlRjZEcrcWdvWXA5SEpuKzE1OVlE?=
 =?utf-8?B?QmlTcWxmcCtjSGRCSzk0QlRtdWMwd1hRa2JEa3ZCcWR0RUFlcERHMlM4My9m?=
 =?utf-8?B?RzVtRzYydWVKWVpUbFZkN1ZFNmsyWHNwNjdMUStEbGNyQ1FsRC9xU0hGbVlX?=
 =?utf-8?B?QzNMd3hSK3dCOE9XanFMTjZQb2V1SkRIZExMUkZPVXgrUUFidjJuNmZSbEtQ?=
 =?utf-8?B?aVlTVzU4NWZSd0NDTFBPRTM0NGIzaUorVjg1aGE4ZWpDcTh6T3ZGUi9zYk0w?=
 =?utf-8?B?VWFRdGdpanRGazlTbVJ6LzJXYUZ3SW0yb2thWG1QUzNVVkU1SzRWZlcwdTBp?=
 =?utf-8?B?ZGM4bmpiM1I0dDRGazlpUk9yeWcrdGhKeEdHNFhtbGtaMENISWlXTXBpRHpF?=
 =?utf-8?B?RkxBa2NheGlSRlFncXZNS1RNNVl4WTRFeElhOENNUzVzelgzajdlayt0VERX?=
 =?utf-8?B?YTRyTTVEbStzRmZwQUx0WkY0S3FPRm9HbEVtRWNzMkNEQitQRVVtaWhkQ3Nz?=
 =?utf-8?B?b1YrR3IyczIzVUlxNWlGVXNyWGZqVVo0RXBmRmJ1dDdUMWtKWEcwWExPQ2ZL?=
 =?utf-8?B?dUVxMWo3MDE3TnM2Qlpib2FIcHFadWZ4eThWVTlGUmlPZllDQXlCSlZtWmJp?=
 =?utf-8?B?MkN6VFFHcnJ2NFpwazNNU0YvK292V1JPaDdzWUdydnA0UXBTa1g0QWRTTHg5?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd1160e-82d8-466f-5f52-08dbf078dd03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:50.0303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlk0aFxjzrLS84UDpuFn7gpjzcHmcvqKMPxCcERzDi3+6kq1+x+LQ5VIIY+aWmBRJW9ni8PBYoUWwKZgKGOw0NBL7YlnMQcNxnNfUdHTjqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 05/22] drm/xe: Move xe_mmio_probe_tiles
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
index dcb0871083931..785bf2e610b7c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -403,6 +403,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_mmio_probe_tiles(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 9e8adb73cc978..9769d56988ece 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -295,7 +295,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	return 0;
 }
 
-static void xe_mmio_probe_tiles(struct xe_device *xe)
+void xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -409,8 +409,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_mmio_probe_tiles(xe);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 218b796629adc..c054c27f6925d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
-- 
2.43.0

