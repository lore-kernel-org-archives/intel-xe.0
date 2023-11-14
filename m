Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F9AC072A2
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765D810E443;
	Tue, 14 Nov 2023 11:45:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66C910E440
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962301; x=1731498301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nL5wgPP0m4tq1vIEOx5aT8SXc8/nkacwLss8hf2TJ9U=;
 b=E60FaAqsmk6LXQC68IaURpTkkW7hgF56tO8At3ZYfvWmtBZCGK+IEHvi
 2mLjCKJFBMk0QZHOdqgDCp1ZM/66+4b9H+TviUax42Uo9FAQS35RgHSYX
 OLDlAUGpw0EeH3GLKx2szJeZWAy99G1BR8o82uIhHvw9a1Lhln6erpPn+
 Dh/EJhw6/hGqxyHNjVx6ULpJYwkVM3cmvxZw5Gkpj9TQEw2t6FckHYBvy
 R6+hGO7EXR+r2UodOaT0BkcjovlbVF2g9R93BEHrcYqDIixjKQ+KkZMfC
 HUimYyi9GGDIhYjLn4x/mzPEWHreMOjrz3D2I3LoFWWUAUN6lHoSoEfof g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982100"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982100"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835008909"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835008909"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCkJmHGuCmKVMc9guYk7A4yQd5MfIvo5mJc6YADgiBFlLlx5XGWAZzRWiLvLamTZ1PJwU8yTThUDgc4jruGTJ/7RPQQ80G/6snlAuUFoTOisg3S2w3s8syeburmkRKQDfI46Du6pSVKmTDoqlOZc6tDc1QFtjyXUi6mF81X0GyQfmN4C+NRKo7QowXpfsoHwpE+dAg6k+XGu5u2flNYWmgkVWJdGE1MiTQq/JE8bR78Ay2NpgpL/3vnz3t2vjg0Oi5l3UCsG2csqynw+hFMidjvfIIJN2HLGaESKjqkhWrCjcwxiRtwTqk1WjlOck6/hqCQ+IXXiP60vl1yWKEyrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqLXF+h9i5jCkHd++QbtnzqVcdw5c5wt6X43+cjzuc4=;
 b=oBoqD/BluCWxQqvQ++jZdKJTW1oxlp+JBx5oVpI2oEy/lM7Arl5p0AnVooIF/RU1Sd0UZnHE3c3ZE5P2ACcbPYOf/BmaueOmsBO3wG1O2eQFmSBU2romaHo7jz4nuellN+XsfFf50sI0Upv0B+H0Xk/6XnbwT7si5fPVbtolGF6cxyjrTIc2FVLA/yoZqG5r/AmxkHlkU1YdXinyTtwTAqOu2yVhzFmIAHUR4GO+XOeTNYOhb0GQ8XKMyIDW5wTtftf0IGK/U+67cN9GXV2nqK58gYnmPxlWg7cUZRxrIHxLPvsfb2uVvzTNaPpBdXeM2wsuEKEWLUadN5+Mmc75WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:44:58 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:44:58 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:49 +0100
Message-ID: <20231114114405.2207747-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: c16b5d32-a781-43cc-5e57-08dbe50720fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cdJ1wWwjGaSY7vKHVMNvnjyraHmm32pQvLPivcJl5G9c1iHNYUORVSv8FlYHXm0urqkXyVVftpa+ViN+d2KxVpj1MZmILG0vIjg65JaNmbn3iUM0KNOP81VXXQ8hwe/+KRapWLJxhFOemvNP7I5bR7MmhyH3sm33gHsGw04iJEoO1CUw0WCNuOi5ZPN4bnMb+0z/eyynbM0mwgr935jfbFRvx5Ovv2+z+YtpT/j0HFYdgZo2gzMuj3y7RUEczVVrs/gEBT0AD3jAaz26x82pHNc+MNEDzgJtRawh2zpUBTAv70ygSTUHhXQbD+WR7HUJkmYhehk+mLGQKQBCkfv5/p3iYB4sMqMOlNkmyyeFXZlqktZ/Eio1HIht7w0n0hva3d3Oypu2Dprfo6aBd90dTGGM3Wd+tFh+i8eSXJ1A5oeKDQ3pD3+BmBHKuDH8IFZzaEPU05b45R2IUih7TQdjAKX+CO8BtbwYZp7MLnuVGDzXMxMQBmg9OhyNT5ZBNgHo1NZDJNcbuzHlQ8GvqWvVd5Qxzb9zrQRYOt+JJya+KHer9IUQx5Msz40Cj6iFa2R7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amYyT0dpTmxzc2lNUzkxRWtyaXc5NjJGL3hJY3QzT2xONG5JWlhFMWtXVkVs?=
 =?utf-8?B?bHpUd3V4NWt4TlRHWVF5ZlgvdnBCT1Z4QmVyTnZZcE05eTVDL0RVN3JvN1Bj?=
 =?utf-8?B?Zjc4MjRPSTJVTndVNWhvc2V4Y2lJMkZpUUxXWStudlpBUTB3WUJmdjBhQ1dU?=
 =?utf-8?B?NEtwUTIyRFJPbGJHZFhUQkVMby94KzdaQ2swR1V4R21odGpDQW1WdG5DT0pq?=
 =?utf-8?B?MDFrVFZKdmZNcXhuZHpkS3FMUVNodUI2Z3ZFUWJ3VXkyNUorbG5yYVdGK3V1?=
 =?utf-8?B?cjVjY1crdjgwdmsyQVZmNnNjNS93WXpaUGdJM2gyUE1RR1BkUGtMdWp0ZUI2?=
 =?utf-8?B?Qy8zc0hEbk9JYnVFYWpJanExenVUTDZGNUpXWXcrM0pkbW93ck5jUkZkUVc2?=
 =?utf-8?B?eWk4N0EzRFVrdGtRbmxaYS9POE81NDJUUk1LcjVOeU5YV2ZLaGRSMWtSeUV2?=
 =?utf-8?B?Y1FIWVB4VitzVzVhSlU1QUYzc1QyeVB6SWZGRDFvYWphV20vOTdQbTNpZmxD?=
 =?utf-8?B?dldFSDdwSURFd2ozMUEwcWc5cVdhMEc1S1QzUmk1S2oxWDVEUzRSeWxYazYz?=
 =?utf-8?B?RXN0b2lpNVR4cDUvN2xOLzloblFORnlSNzV2NGcva2FFVGltYlM2YnBUcFcx?=
 =?utf-8?B?bTdIV0hGem81VjBpZmNRejl0U01aOTUzcWRCcUFkOEdLV2VUMGMxZ2l3c0JI?=
 =?utf-8?B?Vks4Nk5jcGdsdFNKdlltOEVNRUVsblNzT3dnM1ptMjJIS2JKeWdTSTVkMndu?=
 =?utf-8?B?Q3RBWVprZHRqeG13bjZma3ZaZmdUa3Nta2hXcDN0YnVUNDVtc1JremlwVXNa?=
 =?utf-8?B?UjQ5M0E2RTJTMlJ6MzNnYjJrSWFvbG1Ba3hBajdzMHV0V2ZPUll0NXlUcWk5?=
 =?utf-8?B?Q2FyRnBRVUdPR3hVYmFzbGl4Y0ZaeG1lZE0yTGtORFNkTUY4WkZ0RUhPckJV?=
 =?utf-8?B?QmRaVnFIUklUYXdNUC9DYTNyVUZxaE9DVDZiZllmditRZjhnUG5VR3RqSGR1?=
 =?utf-8?B?a0tNSDR6TnJjbGt3SUwxRUtjQkFuWkZselh6bnhMbHlBcFdoNWJrcWJjREhr?=
 =?utf-8?B?L1FTYmFuOHJaUVZuVTQ1djFJSUQvc3lQNWV6TVFYenYrSGNVdHMxU3VUMUdG?=
 =?utf-8?B?T1lnMmtzWVdwWEVQd1ZpejlrMWRHMllualJMLzE5aUcva3AwNWhBQnBtUEtl?=
 =?utf-8?B?U2Q1dVVIcEJLQS9wWEtXbW1LSFlzaFBBbW5URXhyNEtsZ0dYMy8xK0JKanh2?=
 =?utf-8?B?UTZzY2w5b1RwVUlIRHNiMEFzeENYYkcrSzgyRElMNFFrZUxUSHJUQ2VFOVQy?=
 =?utf-8?B?aXoyRmhtVVg5SHVUelM3SldkZ1hNdkhOcThTK2M4bzFJQXNiSjFGR1VGVGpo?=
 =?utf-8?B?c2phbUl0UWVRdktzUUxoMkZreVVmNnBsc1hUZXU5VjVsdHdSSDJzbStDNXJs?=
 =?utf-8?B?NWFlTGdKajk5ckROak9LNzlHb2xyS0JQSm11Vi8vWjRocjFxaEQxQmE1ZTlM?=
 =?utf-8?B?MllENnY3RE95SUMyYWJDdHFMN0dQTlJ6a2xtTlFVZyt4VmZKYzl4QVNON0Jk?=
 =?utf-8?B?L1d6QTEzbFZ5VzUyNjhLV1VGTk5lWXNDVFh3Ykd6RVpjOHJhWUE2SjRkb1Fa?=
 =?utf-8?B?ZWhmQjBXckRaakMralNrTjBzN255RllkSmUxYjhzTjhMK1ZtVER1SzAzN1Ar?=
 =?utf-8?B?aklLUnBPT2RtS0dBUFF2VDNjL3JGdUJOVUhUZ21TaDVLei81ZFlyRGZwWlRT?=
 =?utf-8?B?NkZpMjIvdG40NG55N3RjWDI0SFlHeXhKVzFLKzl1YmkvOVdqR2dBdk0xWVN0?=
 =?utf-8?B?dGVENEFOa3RORTB0aXY1V3A3TklEc2x3a2VoOEZVWW9DK0k1a3JVamp2QUl6?=
 =?utf-8?B?NlhteTgzY1prbHJqWEdqSEVHTnZST1R5Tkw4d2k5c3NCdVl6VHVVbmlJdzZz?=
 =?utf-8?B?VEpEd21KY3ZickloK3lONDZVOEFQU1FaMlRadFRoZEZnYk5DUTQ2a2w2VXJr?=
 =?utf-8?B?Qkxic2pQc1A5Z3pidmZVLytqTnM4bTFjQUpGdEpvYTA0QTRiVDBiQjVaWXNa?=
 =?utf-8?B?VUFaSkpNc1BDdnZhNWtWZmUrdVVpMGhKK1hpbWYwcnlLNXlxMm9QbktwWkhL?=
 =?utf-8?B?MWM4MjZJQTJGMEVDaGlZMUlCYi9vMUVlUXV4aTlLclJoQUJwMWJvdTlvYmNB?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c16b5d32-a781-43cc-5e57-08dbe50720fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:44:58.5522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eh8D0tHnXX1eCtrekI3NGCaw4IbmCqVnGEPh1/7a7obewIrt9ohfZkpWFF1ITXIJz64OWXb888KA1Zv3JfA05EJ5KEr+AJfn+NIAl3+SCm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 04/20] drm/xe: Move xe_set_dma_info outside of
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
index af0abe56c24b7..ef5099eabde0a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -342,6 +342,28 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
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
@@ -356,6 +378,10 @@ int xe_device_probe(struct xe_device *xe)
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
index d8f9fabf715e9..1076ffdb3f92b 100644
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
@@ -430,10 +408,6 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = xe_set_dma_info(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	return 0;
-- 
2.42.1

