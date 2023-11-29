Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DD5C10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D010E69E;
	Wed, 29 Nov 2023 22:35:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8338C10E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297348; x=1732833348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BW7hYxzhDupsUqkvOXeMKwvqreU4GwIcZVu92NEkltw=;
 b=WFVJ85O4J5r4KOpPYdq8ZS+tUVcgIbc+FsLNMmrlQJcxj32aSk0k4AUG
 gmGlRW5wMrS3gO6dBA6gdd16Lrm7PP2j3tcVb0iVsNqTtDDMYTC+P0hsN
 F9kkCzJOHkUq0OzP0RG+VL+v1kiNRybvgoy6YTTG3OeOADjtlz6IeATAc
 aPwtOBlrhCNaXQjn3iEum1phHy2qGPvEZkKe6jOC/FWmI/TxDJzwJ+w0u
 uH5OBMVs2HWcsCIR4VxUHIVgP5CVluBeM4WkIFYpz2GCRcMsKk3oMRYmP
 k3UT4gb5uJQtLGi2qzkl+vzEaRiOJEemNUnRVGPetc7+b/Q3pisLyME9c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420113"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718891844"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718891844"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:35:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:35:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:35:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDGHXI8diLcLcEqWkrqSgGhfZpkcyhDSl1GJc2R37lAUCc6KaCSEdH2yE+IiHi0SeZq/nvCtC90orucll638+1NTK3/X9/4LA6ehAW1l1VzWpRhcsYx83z0MqPb5PGhVbwAh8+bb612nDn/rsnTumEgCkOuhkiIkldVV0aHQaziOz8+ghMwCQX67GMlrWtjme54+oLy3JxsyWX9q5HVL3xJraNQoEF6KDVxdzrimVyhBlNzHQFmS26Phz7xFWHgerwtqsUaI4jBWr+jF3LSmzWlNwpJbfYhAtpJLMxGil2qnzw13/jgGcotBAosqULVw7bux05MPUHmgT21YczLfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ0kq4GTk4PYwc+c9pz2dhRdPuBzkEue8ULFXnruwWc=;
 b=I0mqXJZkoQnR8ynsLwWlYEKKGdaATjsICaSV95bjmsVwUTgKfPZ37NhbGh5zKQrwjwZ9k3w8hg9+szwSO/FGP8AFylfOT28rrezos+OJ4rAefhmdOj2igoU01r9r66ec8QLl1fuir8XRqv2Js5UmX1AGwpxOYyK4iDMPk90HdF60LfERebp91XquKlKV+T+LqBUiPdcG62WAwffMexYvpfbNnbEND/rfPGZJCNBWPVbeFt+epdT1ckgg0babKjgO8GMOIBDijmJB8Ulq9AK32aKXe/owkDr8Z6CHUY5GXDw3khd94uCvhhblsmfuOO5I3WxMY6LBoDWUbEla7Rr1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 22:35:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:35:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:49 +0100
Message-ID: <20231129223508.1189461-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf2aef1-5969-461f-56fd-08dbf12b84ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9AgGeLbrIJRKQEnIcbdghkJ9qiUg4XKtgISd+S05QiqHtOhM0okHXnXfjywmrpe6ii6CXr2QNE30wKoYWS66Tl2tkJklILKZQ2DQFDCUohAHUKLo8+N1SBsrR43hr0OiQo98SVzStPHabTMX+sYktK/hHdOtSmxV7ALhenca03/4+LK1l+qhGphJpjV0jlfWvTALOrW2ztMxMK8xYMA8i+FoNkLo4M/QjtM4r6HmLbjDXGSVJ7Z+23TEEZhjNI3N9z2eWWpZt8kLpyw3noNI+R7ia0TmRBpS4qyzmSoj8//Qi6Ou7wRVJp/BhChWajFpDCDpTNhzyJKnuywyeEmKBmnZ/S0OT6r1u4hCIzqjueVQJvnsj4qbWmXA7O6s5a70TXWLhqlZsGdXEMgG6l+SzTSE+QpMASVm/Lsu6lg9UxMgDyRqv3pnY44bBHgoBm3q0MpjOEmRCdxZxLb3WxsoBqj+lYsuLs5ND4smiVqxNoyaYga/KAzIguepzbHHyi1H0AfPMx8TkxeWGuVgLNQ/Zd0fZIAGhLKgmEHkJVliKRMvkmn8OoEE8w0XC6bWQyWL+zhMWar4aXKro3ly0bpE9qWZvMwE5uvt5yphQKKW5XL9YwIBYtMnjV4zfac9bpq5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(2906002)(86362001)(1076003)(6486002)(26005)(316002)(6506007)(2616005)(66476007)(4326008)(66946007)(6916009)(8676002)(6512007)(66556008)(478600001)(38100700002)(82960400001)(54906003)(83380400001)(36756003)(8936002)(202311291699003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGY1b0hDeGlvYnltWCt6TGZ6N2twTzZRS1hKczFQemdvbmFqbzJwT2JnaEt2?=
 =?utf-8?B?T3pMOTlEckgzaTZoZzFiZXNPamhUM3kvMXdJeWRmWkhHVnNvbmRyVURLTjl5?=
 =?utf-8?B?K2JlTDA4RDdBbmVZMVdNY2I2VzVUT3l1a0N4K3BBQWNTR3lHYWFJdjBSeDRP?=
 =?utf-8?B?dW1hQkk3WTUvNmE2bkVoNG5EOWlScWxoN3haSjBpMXMweWYra1huRktPZlZQ?=
 =?utf-8?B?eFEzalhFL2JPRU9WcnVBK3Juck1mUERuTit3NU15MWdtN3B1NE9OKzE5bmpk?=
 =?utf-8?B?TlRLVXhFZmVTSllEOFpQeXFRcU8rbWdJS0tJd25md1M2MnFwZU50ekJMdW84?=
 =?utf-8?B?M3Y4SGkzVzJQMllIMmRQbnB4MjRHblBpQmhvUnJUZkxKQm14ZnpwcEpicFR6?=
 =?utf-8?B?M3ovbnYvYmtFVHNUd2xLck5yRlRuVU9sSXJPZ01UclkxekR2cXZrcFVsNjZs?=
 =?utf-8?B?ZFBSYW9WT2NDY3NGS0tFZjFTaVJXOGdPV1lRY25LdDhTM2R5dURocGZwdmRH?=
 =?utf-8?B?UzZYc21BZXpjcHR1QVJHS3IzTS9MM0dHMklReDViaGZGN1dpcVlNWWxZUHFz?=
 =?utf-8?B?WjV6SjF0bDRQeXRYTGlvRDNFRHY4VkhsdGhldGVYL1VrRWdXZ0pVTXVZaEVH?=
 =?utf-8?B?TE1JN0JkNVdjU2MrdUxOb3ZRNUZBcnFZUTM0MS8zOVUwNWJkY04yUTJLbzdt?=
 =?utf-8?B?ODFZZVcyN2orKzgrYkgyckZaUjJSNHk0ZmpSZHJDcmVHT0tzQ29lTXZwMXhS?=
 =?utf-8?B?bVRwMTV3K3duQ1N5SWFMOUlyOWZCNWI5clJKZDhjazBBVVYwZGNDY1lTS0d1?=
 =?utf-8?B?aUZ5enhCaUNLdE10dFpFbXk2NE93T0lVb1BDelZxOGQ2WHJiU29jeUpzeTJF?=
 =?utf-8?B?OVE5RDRBZWRtdFdoc0hGTnZBYjEzYy9KUUpyR3VQSXVmQkhjUWNJUGY5dUVI?=
 =?utf-8?B?NGRSMVhzSEQ5QThQRm9Eek1RRmFnSVVnc21MT3QwRC9WMkpSTitRVFhKa0Fk?=
 =?utf-8?B?VGhXWmZUU2lWeSsvSnZFMjlnWXVocE1UNTl0MDRiQk5EcW9pYWQ4LzZBL0dI?=
 =?utf-8?B?QWlCTGpqczVYUDVWT094ZzhwZXNzbnRSTW9WQUNnNWZGeG5kRktMVWJSV1FD?=
 =?utf-8?B?cmVHYjN3eE9CaTZhdUZTWGR5eE5vUDVvREZRUFZYR09CNnBzaTBINEoyckxq?=
 =?utf-8?B?Y3FVVGRwNzRSTERyOGpINDdoeUtiWmZCd2hXYlB5aVdMQVViK2tSYmdrMWtr?=
 =?utf-8?B?eGNSSk43QXdNcXhjOEgyQVBIUEI2MHFuUjBhcTl5aWExKzZDK1VoOGxWaUhh?=
 =?utf-8?B?ajU4b1dqOFE3WUw2QTJBelpvQXVObytFazFKNS9LZkJOdmEwSnUzb2NmQ21i?=
 =?utf-8?B?RjJ6UTlsbndnWGZsOTVGdWRNVGRxWWVkQ1ozWDZvWXM3cmx6M3Q5TU9QcnU0?=
 =?utf-8?B?S1FTZTV1anVJV2ZCVGl4SzduSy8vdjJxNU9IenhSWWRaMDZFL25ieVZSWFFt?=
 =?utf-8?B?OEhBK29kQlhmd0lFdVY2aDY1LzBqbWZBcTdCa3JOanljTjlCSE5zck9lOFM0?=
 =?utf-8?B?T1AraUdjQy9RQWNzUWxPa3NHSHhVOVBtS3d1MDJJNnZhaE9oQjBkanB2RFZ6?=
 =?utf-8?B?TFRaSFlXS1g4N2hjZUxKZWV6SFZsRUpxbEJURFlHMkpmckhEd2tyVURLdWZn?=
 =?utf-8?B?LzJ2VTlXbldHNFEvLzRKVkNvcjRod2xVT1Fpb1ZZTWdjb1VHcjZKU2txQm84?=
 =?utf-8?B?dUZmZkNET0VMdXVNVTBuMlA5bm1ldWZEaXlhZWNHOW0yOHhraUtJZ1ZhejR0?=
 =?utf-8?B?ZVdRRnZLSWNXbFMrTHVQRU0wYVMwSGIxVFdSaHA1OGpRM1dTTktvUThpZmEz?=
 =?utf-8?B?c3AyNHBWUXhPN0dVTUFYSlcwZnhoN3paSEIxSUxwT2k5WTg3NHVveHVUMWdq?=
 =?utf-8?B?Yi9Nc3ZMbEI1WU16akwySU5FMTY2SjhtSWEvZko0TjV5L2crSmliZnN4aXNI?=
 =?utf-8?B?K2pkRnA4NFd5ckl2ZEJ0Z1huUUNSTElXdUdWSzZyL3dYVFRMZ0hDWnJqMC93?=
 =?utf-8?B?eGpndGNENEsvMEZ4cTVSVTdQcys5QmJmaUZIM0psTlJTUGV2NGltQXh3RDRP?=
 =?utf-8?B?WlVoZ3JDZ2pGM084K0JUSXJVWXFxUmY4QzdTYXFsOGpzZ0x4eGlpR1l3MGo4?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf2aef1-5969-461f-56fd-08dbf12b84ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:35:42.0022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxKsnjLKQPJ76r5+iGtL3bXQkp/GWT956iOkYCTDSVNHeGQMf25xSX1QKas6zqefkg/NM1JGsL/o1bKjJJKHBDP8cG9qpTScPTSWcs81vdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 04/23] drm/xe: Move xe_set_dma_info outside of
 MMIO setup
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MMIO is going to be setup earlier during probe. Move xe_set_dma_info
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c   | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 296260f142dcb..dcb0871083931 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -353,6 +353,28 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 		xe_gt_sanitize(gt);
 }
 
+static int xe_set_dma_info(struct xe_device *xe)
+{
+	unsigned int mask_size = xe->info.dma_mask_size;
+	int err;
+
+	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
+
+	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	if (err)
+		goto mask_err;
+
+	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
+	if (err)
+		goto mask_err;
+
+	return 0;
+
+mask_err:
+	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
+	return err;
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -367,6 +389,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_set_dma_info(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_alloc(tile);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0f846272e39c7..9e8adb73cc978 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -25,28 +25,6 @@
 
 #define BAR_SIZE_SHIFT 20
 
-static int xe_set_dma_info(struct xe_device *xe)
-{
-	unsigned int mask_size = xe->info.dma_mask_size;
-	int err;
-
-	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe->drm.dev));
-
-	err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
-	if (err)
-		goto mask_err;
-
-	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
-	if (err)
-		goto mask_err;
-
-	return 0;
-
-mask_err:
-	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
-	return err;
-}
-
 static void
 _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
@@ -431,10 +409,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_set_dma_info(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	return 0;
-- 
2.43.0

