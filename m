Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1861CC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EA310E5DF;
	Wed, 29 Nov 2023 01:16:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A12C10E5EA
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220610; x=1732756610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BW7hYxzhDupsUqkvOXeMKwvqreU4GwIcZVu92NEkltw=;
 b=dkcacLCjcga83GoRRy6cc0N1aMwop2HiJ0NWC1rMNmcBPCYbNfztONKZ
 q0i1ortW5PoyFtU/DCzf50Rswqhc3RVRw2J5IpI2BcvnL0jJOc/DZBRWp
 vUhaHAUc2lHPISWLhzpWu8y+1ONUTKLjM/mzCMF1sLWjuDgqZyJwf7ET8
 aA6GTAGrFlhTiBmsemn4+iU/e2arIEeAiWjAIWY47S7YhAoEi44LuyiaX
 4JB1AL6/Oxa62Yjn07H9s6YUvjJ0V4+0br0/mRg90LrsLqVxF4My61XK6
 rht7LnSF3GC/gIsoPJ1HaixJ9cp1ua4wssc0TJ0RNkPqNf3Hd84oLwzWE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372436538"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372436538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892272521"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892272521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:49 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:48 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7p+rtS0C8xE0C8CKRKeVOUO9eBt08aOX/bpSLCsB9/HtuXWJ4HrVbtfIAP5P8TktxMaICPikQcZqiKiyd0pswzR3CIl4DjIO9evHRmoZ+7VLdolvy55kiv8JrKHOpIDICG+MYCzxKKZY/y0Iyo/YeQGnN3hgxjCFWuRLf9fj1PjJZAOoyi2YQUp0ya2lbIYvg/Dn8bgj+M3aBFc9YhK6i3aXIc2KTzsB8w0g6CL/SzfYE9tezB3eeW5Yc8TC3yRvmZfPiITaVFrc0InWwaYXRQFelFg6vVV9EqidIkGK3N0/BkObQLD8e8AkJBRaTWSMMyEihn1tYh3//vS0K+A1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ0kq4GTk4PYwc+c9pz2dhRdPuBzkEue8ULFXnruwWc=;
 b=SqT1v4dZ7uNTttZ3SPc0wEzvlCB+l5AMc+IAHGm/t49hxaMbkURXdEn/lnewGHpJTzYutpElqkqlaFIFHcxB9tJveLLkGczcKe/Ngay0CrnZ7M6RdGqtLHiVcpwfQYRVtSCZ/a2wD7ccvDra9b91XJhlDke0FKFBn0fo2H/5mWBt1KX+H3HHltSwc48LUa30aU00bx9oFfnbLCvsfif3fvxDmXOsL8iBwXlA3roEni1YVKXeKvIcvUrNeLzXX32YY7V047gXjzDuLTUWdptigP/ot1z1WT/SYiSAOa1bQqK7RlgrMgRfJIq4vN7SA6dkbie95LEbOgffmhtib1D1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:06 +0100
Message-ID: <20231129011624.836843-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 33004915-e89e-43e3-6e54-08dbf078db2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3et9IeiNiQvBpNGIwmPN5ZIUoAqdmApPKExor32k4lVVJBRrjagHW4BsM0ph+GdCZicKcr/EwH+J1WwjQrBT5c1g29ESm8C+MnWiav/sNvgFiiKosweZ4THpOme6rXq3yLyxXlEFYJLsprzaBpxWmKUy8ey/tHTVD+zKedXXKvTXls33Uqhjl+LoYryRW17h9T4+7IMiHYXz83lWqXzZ+bi1ii1U/Krjb889S/r/p5L/Bz9PPHFCSKc97bG5Vym91fvFEKsGT+9VT82XlTLod6SEVzQp2NtLgh88S/dKp9M9niUaDaGQyyZ5BQW6jsoFjDg48xKM5UcI0QMdVWa0W/Ofvtf5nK5CMIMd3fxKeqjQCAPYj1WvkJ3LEBmT4x9PzO8AgTHWB1NyuVVQ0ycYW7XPPvF1d+6ICr2Pzq+FpK0/Scvi+MkJXEmbDffH3IkUEmMiEBzd/o5g8UPtdSZKvTwm4a3m3hkw6f9saAfs4QUI7dCnfvLih+TJRwfWc8MWLEccAbIfqQO3onPlwO3fAgNW8+tBL4qbaGEVnmW1NxxDqHcLpFeH70ju5aek5wkS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlplRElPSlU0YVVxczJiZ2ZqQktoK3BFZlowMmhTTDZRcm1NYlpmMUNqcXpv?=
 =?utf-8?B?dFd3ZVlpV2Q5TG9aTHF3dFdzemJ6S0hLcFM2Ym1rajVqWlhycjd5c2tWdEoy?=
 =?utf-8?B?VlFPczdCMmpoMEpFMHVwWitrekRSWDA2M2JsS1ZtQ1RFaFhUai9OSEIvNCtx?=
 =?utf-8?B?cGM0UXFnUVhYc0pSeFJFUmhBamk4U2FMSEtqSDBJdmhXdTBqOXNKRWlTd2o4?=
 =?utf-8?B?K3VGTWd1MWlWU3lCb3doaER1bDQ4UjQwUm5ld1orSWtOcjFpODJPa1llUnRD?=
 =?utf-8?B?OGNjZTdxT3lMSDR4VDJtNnpXZFM0UFdqRVQ3NXh6cGlvQXNIQWpiSkl5OG1D?=
 =?utf-8?B?V3NRSUNuSmtwZGV3MDZHY3llbFNwaXNZMHdmbjd3ZWp6M1lXQm9kYWt3dVhW?=
 =?utf-8?B?ZEp3V2VhL2E1a0EvUysyQjZlV2xPT0JydHp0NVpvdTd1VDNwT3BRYkJvVGhT?=
 =?utf-8?B?Z3VucEZUTjJWRjJ2eEU2d1Y5aVdZc2dtVnV5UDllLysrd0t0akNsbDFmUEFa?=
 =?utf-8?B?ZnVpeDJMRkJnanN3ZjAvWmhrRmFwR0xDK3BVUEl3eFQyNWJNd1ZsUnNUcHVL?=
 =?utf-8?B?SzRyalRkaS8xK2V2dHR0bmE5Nm10Nk9wMzVZcE9CakpVNXlaazlvczFwVkI2?=
 =?utf-8?B?VDdnRnNRVjhaTXBEd3FjSkRjWjJmNHRTaE8xMklVSlhYY3V3aE45dXZibDFV?=
 =?utf-8?B?VlNqMmxzL1NUREYrUGpUd21VMkR4WkhUakFiaWMvZnVZQ3VBM3d5Yk02cEJL?=
 =?utf-8?B?bTA4N05CQTdWMjAxUEJHTzBqWnRnSFhqdi9WQko3ZnJtR2pGQlFMbDQxLzJG?=
 =?utf-8?B?azJyNGtLNEhVMnV4N1R2NWNWZGFSNWhJUkM0NjM2Ry9RME9PNm5JZDZhODhX?=
 =?utf-8?B?TEs3aEpEdkJpMjVydDhhTy9qWXpYTloxNmQrekJJK3pIYTV1ZXAvK1NJVjJn?=
 =?utf-8?B?TDZwdGZYSXRLZW05QUphMVI5Qm1sVzM4cmJFc2x3WWtEai8vSDAxaTNDbWZD?=
 =?utf-8?B?OFQ0emhldm0xU24yczhCTzdIRTdiZ0Q0RGVjTzNLT0xjWGMvUzRLdDRDRnpS?=
 =?utf-8?B?OHVSUUJ1Umo1ZGh3a2NDY2JnekNrOFQzbkI5Smp6cmIraTIyc3lNb05QczZD?=
 =?utf-8?B?L0JldHVqYk9ZTTZtdGlTSTVhNGVtbGQ4aFA3UlF5V3JMYjVrNTdnSE52YzQ2?=
 =?utf-8?B?SnUyMGhYUjlqRHpOYWRXb0Z6bThmOGI0UmFlZDY5bzJyN25VQkpIeDdObTdU?=
 =?utf-8?B?WCsvcE1DSTRkMTNFZHV6alJMYWJVdW41NDZUcURvdVN5aUZENzd0cVdXTWsy?=
 =?utf-8?B?SmZXRlFUR3JTTG1ORHJZU3RlZXZCN3UrRnl2MHRCa2Z1cWdoZ0Q1ZXdRRytn?=
 =?utf-8?B?dlVGbmg2U25hZnp3dFBja005UGxSc2dhdjQwVWtZRmpmL21mZVdBOUNHMjk5?=
 =?utf-8?B?dERBWGxad0pJUlN4b1hoZE5PTjUyNWI3TTZPZmt4Um84Q1lGTjJMeXdRblAz?=
 =?utf-8?B?NWVYODRldnROTU1iSXVMWXh4dmo2dmVEMnAwMjNFVkxNMXRONzFrUnFudHlY?=
 =?utf-8?B?My9KNGdCdnRyRnFXc3o0cTlURldSMHNjNXdLOHh4QS8vamlwNXpzUWEzcHNy?=
 =?utf-8?B?U3hoK1Y1eXJSdzI0VkJUWEVtc3Nia21jQldtQlkydUNrVTJta2ZWTXNvZC8z?=
 =?utf-8?B?QjN5RisrK0ROczY1VXVVQlFKbEtuNlJsYXhldTJlWU5jL3FkWXFRK0JPOUFS?=
 =?utf-8?B?QlExTkdhSWI1TitUTGVDT3czSmRyN1ZCYWQ0NzA0cmlDTkZmc29HbnhGZGNC?=
 =?utf-8?B?eFhLS01ONU9qUTdkM0kvaFRDMTFBTGg2QkJnaSsvam5qUWhRR2FZdmlKKzdV?=
 =?utf-8?B?V2plOGNpOFNlNHl6dXhCZlI0c2Jjajl1TEdIa2p2emxSUHBKVnZUOHpLSGxa?=
 =?utf-8?B?c3ErdUpRQkFuNE5pc0hYZ05yRUl2dmhuRmYvVTVRem1LeWxRYW9kZU9qVWZC?=
 =?utf-8?B?R2s4MmdKdGYyMk5QakxLRkFuY3pZc09CcFhITTBlRUc2Zm5HbFREcHVVVUhZ?=
 =?utf-8?B?UFBRcTRYQ0FnK0RYK1YwYWVZNC93aGlVZnZlQnpGNVVUUktWcGJMdHZCZjdQ?=
 =?utf-8?B?K1diNGdCYXlidDV1R2NPSk91TjAwRlB5R245QnprM1kyd29hRnFKMGxPRGFQ?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33004915-e89e-43e3-6e54-08dbf078db2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:46.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VK8YDlX2PByrmIU5OKwW8JxSUV8YcMhM3rWUGg1UU6Fk6rIHeseb+8A3Cre98kHTi7MF6x1k1Pq/c5GR6mhYPaI3llT4Egymx9x8Skp8PD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 04/22] drm/xe: Move xe_set_dma_info outside of
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
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

