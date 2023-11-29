Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387A3C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C5B10E5E4;
	Wed, 29 Nov 2023 01:17:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA2310E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220626; x=1732756626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AOBphwtnwM6134W74U44Nq7TNEpjOwQjrqmjsKMF9K0=;
 b=JLsTfRdM8ZUOBY64W+4bPtKWePULa9IaodcVQ9Ve1LpL7YxiW02wOO3z
 6Fn0SxIJ0yMksLnkZJbNjQuVc/oupR2KRk9MZrSOA9zFLz+bBlyb3zgP3
 8udHP6oOJraxT1v/0MlN0hFBruNuExVYLs4FgPzZwZP1N+BWZWtJv2m/D
 Zdey/Bjrp84OiPe6+oOnZDUtKYR63WnKBqWPHfvvLffaZAHvtAVOLP1j1
 H3gmY+ghi0BclgGzHz0YzJqaSlwa8gT2K91N0cQWguPaRF16aMrMJsX+j
 0VkKL5Y1TmpzDZK7EVcRnKdPDZsGOxnNeEG7tNVpzJPs/7AAPQqHTsFOt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391930155"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="391930155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745086155"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="745086155"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:17:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:17:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:17:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAFFCkmy5DBRGw2pVy/V2sXEqHd+snWwUofFEnIpXmLuw0TAOLiwDcHa739Ohc/ZJ/0wiljM507v+9LBYSbhdaKBNDjl1F0O/LRU24SuAGmeGGWStK1HGPSQ1id8EhOBICk4qEPm7x07VW7sb3uTQlmApsM2/6CoWGg2d3XoAScLFRarw7i94XxszzahHi1n90/jCvzy6xM4A5I701qimKrpt8tRNIh94UdiGobqU8ExBLVHH9pca0YF/fYTA/u0lrWRZnedegx3pnSxWsN1NC03XMgoZ1ApScbdIHq5maSz8aZfZ7F0lxRPrN+Vps+dLtNmylSB/+mHg7sgKwr2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAX1PbiSrWqKRQhcskTB/Kgsw4S8dD8K7P4OP66ZwfY=;
 b=Z1hd3Bk7NlCaZvZyzeSCS/SyYudwTRdBCKn9NxE/gYgzyfQKQexM6Pa07pzT6SoF8KLRhrBWs2CZpgd7ekgc+aDXxNux9govXpQs3tP3iLMTwuTxRsij9hRMdB9EWjuzH7mMh9ct8i+rYIsOpLI+4jcVbt2bFbYTwEEP/mYP1qhtGdcwlu01ZwDkYwJ5liTO2ZxNjbUaS4MzJLKJWxMjN3up0X/iMyPJa07204KM9aAN43zSBUlArV86ojASxDf7Z30WTEFaIlQ4I5qFOblGqEBB0DcuOK0fDzuMAeeEOfuI9NRqlhEfvm1UqWsFXiObau15t/gnBZGt1Xucj3vyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 01:17:02 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:17:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:11 +0100
Message-ID: <20231129011624.836843-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 706a3d41-ce6d-42c3-b91c-08dbf078e475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpE3k5pBm8BIDQaR8dfh3ZFQMK+Sba5YByAEnVqEV1g/+bl8MqPzgr2isACjPsiYF8FnQzN/ilZdRAmC05Bvc9xOFbzC0KsVxMym+70aqkOtAmO0gYVX5YmlWpTtzMIlykUMqzWOjve8H9d4k3mq7trnyHTugIG5r7tDv3MD09lc9irXEmlxLVHCz2NkxBoZ2AAsaP0yA8cnzElZ1m4aBnde7Up2Eje7hCZB7VDgzHr6gubwEvHKnXdRoyKhYKOM9cWShIbZG+/fnM1SVPeHENQU8vK4PHqkuuY5GvbU7pprpRs6c1eTFRHsxNfh7fz8TsUb0ZRJuHSIzp1/uGhvrCrJXt2JloQBHkYam8R9M6SsrQYbcFj4CkD6fkYjODU8mYyEyCQsCiE/gwVASNA3r/yF4uV2fS6wgcVFM0wHiFK237jpcqlA3k35kQqobYuVaWwBGgmcwucYkl4gB+L/DPDd8O9jtO/TNqIr9/lpLyXRriHJqwpx6T3QTRnYScFHAtjdYwoDKmQtu6LgcyqvO/JiH9rhhJSd/kvEHwUycuT/aSns0LXrGhdQOVYwktwp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8936002)(4326008)(8676002)(6512007)(6506007)(54906003)(66556008)(66946007)(66476007)(6916009)(316002)(478600001)(6486002)(41300700001)(38100700002)(86362001)(1076003)(36756003)(2906002)(26005)(2616005)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2ZjRG11RHcxNWdNMzVCbTRRemQyOStHNEs5N2NNVFpGN3M5M05zbElXY212?=
 =?utf-8?B?NHpxSnlKT0g0dkZETzNsVllTWUVGUmlEU2p0MmR1V0sycEpZQTBjMTNFZ2I3?=
 =?utf-8?B?SEc5VWdzWWVCeGxMbHd1ZTI5RGViNGFDMWJMbTFJRkhrdjhkVW9xUmh5Z0Z2?=
 =?utf-8?B?WlhmbG5Ra0Rmc1JIZzdDbndDWU1neHUzNkNWNnRxbFJoY2pCdnFBS3F1cysw?=
 =?utf-8?B?SjlMOEdNSjlHYUl0YzRVaFZYS2ZkRjlZS2wwcmM5ZW5FOGlSVFQyai9WSVAr?=
 =?utf-8?B?RWRDVEhWdysyNGFlK0tSSHhNcllVTFJnMy9HVGlLWDFxeTJEcXdNcUFIVlFi?=
 =?utf-8?B?bVlOK3B6V2MxOFlvd0VEOUZvc05ISnRSdjljSjY5Ykc0VWVlVjE0cElpN2pC?=
 =?utf-8?B?dWk2dTA2VHJ2d200U3U1MHBER1lxTDhZNXJIVjZvR1gyY1Vzeml1YzZYTzRl?=
 =?utf-8?B?aFBWS3BVaThpRWRJMjFybTlYNGtRYzN0ZFdzemRhWVJmSGEzdDV0bE1INjk1?=
 =?utf-8?B?ZnBEVnNRNmdMOFNJMmN4cGMya3loQUZYMWZJaTgzNm02QURVbGwzdkdPbitX?=
 =?utf-8?B?NWVDdW9oRHNtV09pdlRlS1ZROWdST0lzRVZiWmFVdWROZjcrS2NJeGVqV1Jz?=
 =?utf-8?B?Q0Y2NnVmbmlEdk4wcjRucVAvZmlrdElXYmJSUEY2TWRLNVdINjMzNGJCSkUw?=
 =?utf-8?B?N2QzdHY1WDJibHMxb0NocG1pY01tWmRNVjFzNk8zSzNSRVRrL1BGRCtaY0wx?=
 =?utf-8?B?TFl2TWhidDN0am44ZXUyS1NVR1VwSEloZ21xMjJ2MUx0YmpkS3dRRWNGekI1?=
 =?utf-8?B?TDBmdjNRT0JiU1RQb0s1Yy9FenhYYm93MVRiY2ZiaXRDdXVKQWExR3lZNkxu?=
 =?utf-8?B?SW0zaWlUdHhMaEFoTCs3M3VTOGxrT3NPUlRiVTU1TlBndkFIQjdiTlh5UjE0?=
 =?utf-8?B?ZGdheEQvRjREWEExQWp0am1OcFFiTHlhL2dOODhsbTBybWF1aC85WUE0RjZ4?=
 =?utf-8?B?WGFNbmJPMjJlQXFWYjhvQlBhV3dmRGVOZ2RYR1FSQ3k1YWxLTUpMbTl6RUtw?=
 =?utf-8?B?OHora1IrYjVGUVRBSVRXTnBEKzdYZm5BZmhyVzNXQ1FPSUJoZWRHcUh0L0VF?=
 =?utf-8?B?WFRTSmxXT0lLTDJ5bnNBZG9hNlNiUjVRNEhzSTA5THZubyttdkRIdnRCUTNu?=
 =?utf-8?B?YUM4NkJJNkVReGZaV0NFWFRxUzNDYXN1a2dXT2JJcEt2akhvVExjU2hIc0xL?=
 =?utf-8?B?MmIrckhDbVF1RExrMjdscmRvZWhObnY5NFFKNEZPT0FhdG1VU1g2ODRmS2tH?=
 =?utf-8?B?Nmx4b0RJd3NqcEl4dWtBMGN0bFljeXB2NTdoUnlRblNlNUxWYlpXR3JieC9z?=
 =?utf-8?B?TVVla0pLNUc4TkorK2pkWTVlY2hmaHFoLzhIVC9yUzRENmZtNG9vN3RHcnlm?=
 =?utf-8?B?WUUxQm1XaEorZDBsNk9XTTUxMjRnY1J0eDJzbjhtenJaM0ljNzFmQ1RDUDNY?=
 =?utf-8?B?Vlk0emNHT1FzSVBmUGxWNnVwcHByckFuVWdJbmFhYmxrUDlYQnBiUWkwNW5D?=
 =?utf-8?B?RUIzNVVrOG1oVzZ1dlhZcWczS01tOUI5ZHpBZHZ2bFFYNHRVcHpJQVVqbDN1?=
 =?utf-8?B?NHZHanJoWHhuakpsZUpCMjAwOGswVVFSbXp1RnNqQjNxN1hsSjJlSjNpZDda?=
 =?utf-8?B?Q3dnY2FOT3VmbHlWMzR1OExxdUYyVlh2bUxjTmFTQkNFTlFlV1VVMEdZMUo3?=
 =?utf-8?B?YklYbFZrU1QxdFU2WnBSQmYramljOGFxZXR0cm1nNzFkeXpMWjFOM3VCcXcw?=
 =?utf-8?B?NUU2L0cyRDFPWDJSQmlWSVA5ejFDQXBEbFFVcGVuYWZua3pnT0JkczFLbjdO?=
 =?utf-8?B?MGdlbDN5TDF5dWFTS01jQ2MyQlRlL3lMSC9pNXB5ZUNzQlQwMEZMWURqRGNR?=
 =?utf-8?B?UEord29YWmk1V28waE0vbi81QUZNeStwTGhJMGllVjcrMnZuTHFEOXk1bWdQ?=
 =?utf-8?B?eElPakk0SnoyMnpva3B0aVNyeU45VjhON2lyZFJ2TjRldk9icHliNE4veXpE?=
 =?utf-8?B?MGp4d0s4cml2dnE4QXFwNjJFUkNGSkhSd2NwNEUvcVRnSDhNRzVsa1hKMFFT?=
 =?utf-8?B?bFlRSSs3NzZaeDBtUG5GV3FGQzNMYUlXVDRmSzBPMTFRaXhaTjU3M1RmQmJO?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a3d41-ce6d-42c3-b91c-08dbf078e475
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:17:02.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M251apbg+ulP5lTKrghzl7PtL87dRvmmXMN4Su133fb+ZsI9d2phGCQO/9pNqtHVlC8dEcFO4sbPYTdE8MIKLeGSyTHKQ2CPpZlPTUTofmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 09/22] drm/xe/device: Introduce
 xe_device_probe_early
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

SR-IOV VF doesn't have access to MMIO registers used to determine
graphics/media ID. It can however communicate with GuC.
Introduce xe_device_probe_early, which initializes enough HW to use
MMIO GuC communication.
This will allow both VF and PF/native driver to have unified probe
ordering.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v1 -> v2:
- Add comment to "early" variant (Lucas)

 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h |  5 +++++
 drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
 5 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5e1f73c8c77ad..f4be4b13a506e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
+/*
+ * Initialize MMIO resources that don't require any knowledge about tile count.
+ */
+int xe_device_probe_early(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_mmio_init(xe);
+	if (err)
+		return err;
+
+	err = xe_mmio_root_tile_init(xe);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_mmio_init(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 54694f98c91a2..3da83b2332063 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
+int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
@@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
 
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
+
 /*
  * FIXME: This only works for now since multi-tile and standalone media
  * happen to be mutually exclusive.  Future platforms may change this...
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d1b59021c9712..6148c9da4f64e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,10 +15,12 @@
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 
 int xe_mmio_init(struct xe_device *xe)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	const int mmio_bar = 0;
-	int err;
 
 	/*
 	 * Map the entire BAR.
@@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
 		return -EIO;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+}
+
+int xe_mmio_root_tile_init(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	int err;
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	err = xe_verify_lmem_ready(xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c054c27f6925d..98de5c13c89ba 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,6 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_root_tile_init(struct xe_device *xe);
 void xe_mmio_probe_tiles(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2483650720c54..1d5e50bb49236 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -539,10 +539,12 @@ static void handle_gmdid(struct xe_device *xe,
  * Initialize device info content that only depends on static driver_data passed to the driver at
  * probe time from PCI ID table.
  */
-static void xe_info_init_early(struct xe_device *xe,
-			       const struct xe_device_desc *desc,
-			       const struct xe_subplatform_desc *subplatform_desc)
+static int xe_info_init_early(struct xe_device *xe,
+			      const struct xe_device_desc *desc,
+			      const struct xe_subplatform_desc *subplatform_desc)
 {
+	int err;
+
 	xe->info.platform = desc->platform;
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -557,6 +559,12 @@ static void xe_info_init_early(struct xe_device *xe,
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  xe_modparam.enable_display &&
 				  desc->has_display;
+
+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
+	if (err)
+		return err;
+
+	return 0;
 }
 
 /*
@@ -624,13 +632,15 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
-	for_each_tile(tile, xe, id) {
+	for_each_remote_tile(tile, xe, id) {
 		int err;
 
 		err = xe_tile_init_early(tile, xe, id);
 		if (err)
 			return err;
+	}
 
+	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
@@ -724,10 +734,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	xe_info_init_early(xe, desc, subplatform_desc);
+	err = xe_info_init_early(xe, desc, subplatform_desc);
+	if (err)
+		return err;
 
 	xe_sriov_probe_early(xe, desc->has_sriov);
 
+	err = xe_device_probe_early(xe);
+	if (err)
+		return err;
+
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		return err;
-- 
2.43.0

