Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9CFC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C810E684;
	Wed, 29 Nov 2023 21:47:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7067210E683
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294420; x=1732830420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BW7hYxzhDupsUqkvOXeMKwvqreU4GwIcZVu92NEkltw=;
 b=cI7NRJvmugZYyXIDx2KIafoopQIBhIEMTDQmp9pVVhMwNASO0CP1p3Lw
 bAxt5kR7/tGJye0S7rD5GxqZND6jsLk4i6x3iO723LF59DioaOMfNDnf5
 Ylm5aFTLPRyu7qdQbEeBweECGtOM4wWKw0WTB5MD5iDXREKdepjZypcIj
 LwxVa7KmUmuxJSOEr8kbXGJs2kWZYRa5pG50vF5n9Y0FtycC6WHI2zAe9
 9crLpY38ZZJL5QyPZBmnhHTGfhxuzXQmM/E0QvCJUZtn/BoaTiNhN1vka
 q0revyhWvvcsLPvDvdPyv40xMIn+YLXOD1STPyzWle8KVc2rFJdG5dZ6j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975250"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975250"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100680121"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="1100680121"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:46:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:46:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:46:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C71HBPWS4jHgP5vSgAueD1Rtrg9IDkLKLiyHOZHy3o1mG7GF3u/sBlEuunpu5FnAsCCWIf94lYBaZIRceMj6GUcc2Xgmc8NlF8IxlDcvI5oTh2xJVlCeRqxAoT4OyCyna9mV94TgJSOsg0YsuKH1rks4BcO+eM/cv7XrkqJXGZGY9XU12YkLfiElkks0jBnvlUaU1CzNkIccjg+n1x1U+y6Y13qmuZZURS7xo5hm7wAwxTlOAm9e3zGb7bUmi821gylJGWFHu/tmSNqAbBCu6LzAjgzwdydGJ2v9L24xIUE4YK+SWPUfaZX1GC/xoTPDE0PvHStS8iXknf2x5kt7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ0kq4GTk4PYwc+c9pz2dhRdPuBzkEue8ULFXnruwWc=;
 b=Ti8UMc+MTW8qbVamZCYaabA/pR2+QkSQEhg5A7rF58A+U/VkB0KHZ7ropGtmoOWz8vliyWu028CWeEsnwvBkjV0AUHzho/YhPc4h6koesUMsqH+RRQrMilv6didBXams9ts8Rk60J9JwQN99PCm32+MXFWzWwY8v7MSjrNlEeUV04ZpjttERJFTLRw3Cp7ccCe4MwLl+RTjlnob/6lhr9lShUDgo5LT9BMTdNx7AfW8Zy5YZsuxAQh2AtUl1aeFvUGJg1wVWakIkFmUqygLpOKIQzD/p3at3V1n1L+HGr5WO5cwDjzH3p9NCjEfN2IhQrXAjI3HltjPDPF2dygrvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:46:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:46:50 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:00 +0100
Message-ID: <20231129214509.1174116-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ea75c3-3855-4be0-5f60-08dbf124b1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DydPMR7ksnasV8DDHqDG2dWVAs+LDWX1El21IYuXiR2zUqwWxJzTCRz6P5QyuLS20rzkhiAwOaXufzHelNes/ep8XU1dY/7GfG9UUXb77M0A5M2N5PMxol2GvmR4xKv8orHOxcIf+kaonzjoehSXbF+UpI1S4ZZZB30T1weAD+YEmiOhg3OIHqvF7VafErsZOsZ6fklqbj9vgj2o4YO+uWAHqcsCXVZcAMN/UM4e77SXv8BhEpJUriEDvKJCVpHeYACbjCxGmx6aqhW5OTyVm9scLixgXWMRuG64WuaJTtcStol+BZ6zfpcHU9l0GyY8IU0mp78zgNeTHcBJMNHxwuPlVluBOgObgiRXCNJHSilVffkcu41e9VuVGPG0s5u11qG+YvtR5bWGkxHwaqof7IieKLG3FhQpvKHt5U3t1BZ6Ib08vPbdXcF21qALgx9Hc9J47PyaMOQC2/ULTZilrskFWF8vFxx76vJp5Lnq2/QZrgydPtl/PzJtL2/vAn2JHu2TarAHq6nIWBhDj+LgKL8WEQje8fKS4S3HdH20CnK8PzJTIDB8fB6GrWd7wKSBsCebSvHSdwdlTJBjqhfFwADtWTEGglCBQiftPkiaba01TG1sGh3EMgLw0YIwWegQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(107886003)(66946007)(66476007)(54906003)(66556008)(316002)(2616005)(6916009)(1076003)(6506007)(36756003)(26005)(6486002)(6666004)(478600001)(6512007)(83380400001)(38100700002)(5660300002)(82960400001)(2906002)(202311291699003)(41300700001)(8936002)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHV5UHI1M2xXQkRYU2ZWRUlIbGZuUGozZFp5eFhacndrZ2JDMmxuUGpwNVNj?=
 =?utf-8?B?VEZ3S1JiMjczNCt5WU1xUjV3c1gzdmk0cXRzR0NYKzR6OTZMYTcvVTZpRmly?=
 =?utf-8?B?NjlPTFk1cUlwTEF3ZFN5ZXFIUkIxQXJOVDdtRDdsZFVxWkRyUTBFblFZQ1pL?=
 =?utf-8?B?U0Q3aVNhME9FUFFDN25POFhuczBEU0RGRDhUd0tsbXpRdGg0czBXeC9vVlAv?=
 =?utf-8?B?WVlpbmpqOWlKc2JiUWZLWExvckYwUHRsZHJwZktCdzRGM2Z6SlpiejF2bkZB?=
 =?utf-8?B?bTBnZ0VuTEN5V3kzZDArZkgzYzhwb2JCMitjSXZlUVJwTU9IWjVubGd2R3Uy?=
 =?utf-8?B?aEN5NkxjdDFaZS8vR1FEejRDRDQ5NGVDSmQ3VDVpWUx6bDMvM0g1Z3hPQy83?=
 =?utf-8?B?N2g5WU5CK3VJbGQ1TVcvNmF1YXNxYjNOcWFSM05WV3ZyK09OQ2JOSTBDUlV1?=
 =?utf-8?B?eG1RZzNJNUd0Tm94ak5rSE1lZmMyWUZNaWpwZnIwL3BNRmJWL0VYS3MyZE9C?=
 =?utf-8?B?TVRHTjk1NlFZSWMrdEY2WHB3QmFWWCttV0kzN0ZlMmlZTW10Ujl4TWx0YUxo?=
 =?utf-8?B?TExxc0xlM1YyUDFVcDA5Rjc0aTNES2U3dDkwVnRBTjhMZHFERkZyUEFZbkFu?=
 =?utf-8?B?T0krUnZieHNhbnRpNDBvTG9zM0hwT3pNR01YL1o4YVZXT1p2RTZVMlduR0dF?=
 =?utf-8?B?OHppOEU5MzlIc2FnZ1FJSDhVUGlpWVlISDI4SFhJRm9ZMzZyNytrQWxxTVYz?=
 =?utf-8?B?MHdLRUE4Rnc0Ykd1ODZVWjViNE9ZRXhHS25LNndFaTBPeEdSZjBFdGw1VU1I?=
 =?utf-8?B?anMzOTFBZGRhajJ5NHlNbW43NmcvZWRqUmlRLzM0YUU2aENoOXoyeXA3YWkr?=
 =?utf-8?B?STkweTEvc0VrQUxUbFV5WWVzdi8xQjZZYkxhQzJmR2MvTEtaMzRrR1l3clUw?=
 =?utf-8?B?RUhHV21FYUtOZ0haNllxWlpiTVRRN2p2QjFTeERIb1BUMjMrcHJNQjdvZFEw?=
 =?utf-8?B?bEtPS3dLMzZ2U2JiMTFMSFlQVjNROFJPZ2FCWVk2THhLeTI4eE1ZMlJFL2lr?=
 =?utf-8?B?RTVyOWpWK01VYVpiMUZpTTRMRnR0MmN2ZUhwcHpYZDVtNUtCclR0UGoySEJ3?=
 =?utf-8?B?T0xvWVljNGJmUUk0c1NSa3NzTGdVczF3Q0F2SnNxbVI1eUtoaENmWW4xYVJu?=
 =?utf-8?B?ajNHeXJuRW5seUxhNW1VVUtpNnNjbEVFSmpacEFvdTRLMEQ4R3ovZjk5c2lp?=
 =?utf-8?B?eVFvMlhVNC9uZGFCdTFEY3dDOEU4TEZ4Qkl1MDJXcDY5ZkhNZkE0ME9DQ2Y2?=
 =?utf-8?B?VHVQaE42WU1rR3V0ZXZwUUVEZ1lHN1pxSnkwRFhjaExRV21CanRXU3BraUNl?=
 =?utf-8?B?ODhaWnlJdWI5aW9kTTJHUjU3SlBhc2xtUXh1VDVJa05Ic2xoQzFtYmVYWDRm?=
 =?utf-8?B?dFB6N1dUdEVJeU4vdG9UQzlJUXhqOTdsRXZYSkVKZ3VpOUcvaFhJRXlvb1h3?=
 =?utf-8?B?RzAyUm4yWEtvb2dMMGdrWFNBVllVa3V5di9LUVJBVkNvZCtlSDJHUHJBbVBJ?=
 =?utf-8?B?amRVWjMzaWMvWmVOQ3RvQmsrRks5L3I1ZWliZml2NElRdjFpTVpIenpJQk4x?=
 =?utf-8?B?aFI5aER4SlhpcXkxczQ5ajZnUUJNVFFnam45Q3FzMHpvbWkwaVVmemdrVTlB?=
 =?utf-8?B?a0NIUzYvdlNqb1lPOHdHQWtXZnpnZUFGQUlrVnZiUHRIUmYzWkwxWmFCaWFh?=
 =?utf-8?B?VzBDK1dUT1pVNzhyUTZJVnBVQ0lLWTB1WFhaUWRHUjRKVDAxT1I1RDMySm1a?=
 =?utf-8?B?WFpSRUtLdVU4alNxVmRYWW1iMWRJWk9xbXFVZS9mT0NzeVlMZnNLNVBoVFcx?=
 =?utf-8?B?bVkwdGttbGVKbXB5MUQyV3FUcUdIOEZSWG5BZWVFdDEvT25oeHNrSGwzaHJz?=
 =?utf-8?B?Z014c21HM1dDNGxSNFBMdHBXZVozQTJueGVVTlEvcG01ZVVUSFY1eVh6TC9i?=
 =?utf-8?B?VXd5RlNPNTNCYkMyNTBWRUNlTGRvVk8wU2RXSStUaW41aFlYUjg1ZGM5aTFk?=
 =?utf-8?B?WmxneVhFRnNiNERFRnVPa1JXdkVsU0djci9lamZDbjFFWFRxOGROZlZwM1oz?=
 =?utf-8?B?ZlcyV0JZQldSRVZOWEMzNXMvZHhpb0tOcUg4ZG1MRmlRYzJPbXdHN1BUSnQ2?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ea75c3-3855-4be0-5f60-08dbf124b1cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:46:50.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tw8PtvyG6J0olQ0gkkL2cM1czptNbQsHnBPdpvKWZxlcT08cjRDV6JLug5p1KCaCfkDW3Oo/asqrUiFiq4zvzmSC1hLANibkN+UMkDGVXNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 05/14] drm/xe: Move xe_set_dma_info outside of MMIO
 setup
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

