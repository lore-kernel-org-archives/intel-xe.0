Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664AFC4167D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F3910E329;
	Wed,  8 Nov 2023 00:34:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648D510E329
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403675; x=1730939675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6d6I2NAIOLhzD1NYL5VEbnXnsqjMC0OfewSEiKUqv7c=;
 b=jVjOBEunNJsbESW/WHi22cmL6iafcgbC5jJOiQPF7ELnVl2Mc/MJHUIS
 WkZnEAdf5mhHle9l9hbCgO24rLOvG5e4u9DP53iZQAYy/Yd/aRSyA8m87
 zGDsvP1GhaOIU7OFXSEvvRSvw0Atevwbpxcevx9op6eCtt/mRh4HeuK8l
 etWG38yNaHCTZ5NrNFDlf4WE+uolDmQFwNyuflMbaS4FmWwXPMaA2uknz
 /UDbI6Ce3j7bR14yiXzptwi+xOEt/sShmyeClhs8E90nIRGJ0V9ABB+x8
 OTFjPwfMzMwOwIc09SQSz4zXQb/yMgnwMh2uXmqHycXLp8ea5WcSCg9U7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368991728"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="368991728"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762889634"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="762889634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:34 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RryLDYuesmAHms7K7zKToAmXnxHGZmeAsYrHAHp8Cmjb+LLMjCsMOJeBeS93oq94sJprlz+qtWDXE2FYhXPFvT9EKi10hN6x4VkKKLuVgOYCq03nw4F0dWqBUSP1/zvcIPihSslhmx5LdezWl+wlltLwJe+20LphRzJOJMgx32Ggp9SevM8kNyaUWGXmuCpGB89PkLkeW3ErNyvnCReGMG2lYsJALItivFlSQC/3OFHMUPWPpqsj5tBk2gVBzjtKooyUMfxGtfLb+hiy2wZWtz8mgpolhSY2T4yOwh7LCYCcRsJoh6xdHsgho4TMm44HIdNPVfqZl52cvg5ZwCh2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K+5ztM9NkL0FtUoZNmfgTt0EoEyGGGMi+8ATTbuuHY=;
 b=j396O8zjpPlKENdHn+kk6ZCwMwMjcGTFQ+UIKLI5nW2sbR2k5OJys9LRFjcRRPPd4613Hiso7WSIQbtXlbveFGOzAtzjEtPJhOPbzzpVnwNWL+iN0RpJQ+37A21PZHn/OYZlNsZ13M0gmz2kP5eFUyYDErRt55dS8LA8lNGc6ZfZ2jyOImli10YKlNYm1Bspkg7iunan65qazLYrHPqGj2TpgRpIrEMzIEAzixe7BVhUY9ERUVLWHI0whCap4fBfjHu2lpnZwYaJbokj1sxzjlhr8kcb6Sr1OghCAT0nEuZWEviBneQq7/6YxR0lARrYXgiaSligugD5Ba/NT+8uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:38 +0100
Message-ID: <20231108003344.1169016-7-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 116fed34-d3e3-4fdf-000c-08dbdff279cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1/8hdJ4baxp0LVS1w5kyuR4/7I4I7OmC9wHuQoXiwhcPjtaOpAVLn+FFzTZSUQAGbJuwrzmKL/zEdJz2UGlBWc4BdDJDzOLAJlmXjblKfea5OSiAZdLSVDtjkGN8Tx4DKKF9pHjt3PQL6cidVHWo65ggH2su0NM4ZocNeabYu12wVVAIm35i8H9kYJQcSVx7Lfseejo0DF1z/5sd6dUwbpv4JMqj/DOUlom6PbBVIBVIttN/zungB+Mc+CcBcb8rEycrGe3Ai+o/+smU8wp2ro967EOy630vEtXFYKeVspKqKzE48ByT7nn88fbHpW4cpqgYbmv5ichaYMgy+gl8ojn0k2A/f+2CuhZl4PU3gebeKepegRGYmN8hz638hLinIenE+59ELXGI+zVmp9dQyjx6z+xKkhhiwdbaG0+Vsr8g81J8U+muUm/JTfwoEH0G6Jv4AsbfVApY+F4kkcCadpQP1Ix1W09ptlWg45IdbP6EoCtfBQQIGMFuOEVHBQabcmyr93w4ml6joUjwi0Ct3aJmyssgMToMvPU+Ur3Ss/frUNiH0C0DHesy53bynD8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkYyNGhsQU9uNVVWb1dKRzNZSHNzMzVmeVZ1ZHo0SDl4MFcwZTFHNDN1amNX?=
 =?utf-8?B?Y3dONmZ5TU9ubTNxdTFEMFlMSU82VjVzdGZ6STV1QThSWjd1eWZLdEhzaW52?=
 =?utf-8?B?eThPYmdFSjRTNXI1azlXOFYvQXZFSlVZMVBUQllXTkNjM2gzRXZCWnZ4V2Zv?=
 =?utf-8?B?QTVueWxlUkhiUGhKd1NwS050aDlQbzl0bnNIZjFwQzcxQ0NMOGIyNTJMRFk1?=
 =?utf-8?B?VWUvNjRKeTJVVFgzQWNWRlRUbHpTMk9LUjVrVWZ0RXdjK2hiSDZlZkJqcS9q?=
 =?utf-8?B?Qzd2c1hkY1ozeHVlVEh1WTcwM0FjTy9CaFlwNFkvR1M0TkFOQ1AyUWNlNmlV?=
 =?utf-8?B?dll3Zkcxb3FKZ3FUdzBuS0VCK3V3RXRkZnM1N3RkOUgzVDNxQ3RnNCs4MjFp?=
 =?utf-8?B?UnpUdjhkYXJjcDBpTXo2NWZnZ05icFNySzRPVHhweHJMY1poOXpFRS9BQVEx?=
 =?utf-8?B?bXNoQTFSWTNXUzRETVBsODlBY1RyM0dhWG9TdjJSK0NWOFd1anRjQk1pMjNk?=
 =?utf-8?B?bTFXemVRVGdUNzJJUFlLY2RtM05XWHEvb09iaDZBbWUycUdXS25jYk44VEdG?=
 =?utf-8?B?ckw2RHA1WWIxY05yVGU5SDZiNmwyR2ZxVkVJL3pKR3VLSHI2eW5jZitwVEcv?=
 =?utf-8?B?MW8rSVFERDQ2djNlb1Z3TWRaQWJsUEhqRmZ6aVhzWkhuaGFHNnFncjh1WENz?=
 =?utf-8?B?cEpBdWdqb1RienlxSHBETWpKOE9wcWc5anpsazZRU0ZhZnhsdkd4OExQaGFr?=
 =?utf-8?B?TjRSV0o1dHZtL0cvSVY2Uk02N2ViSThwUVQ3YXJ1VHliUTN6K0RJWUZTTDlu?=
 =?utf-8?B?a2FpbE9UZEh3SjJCaTZFczlrQmRWZ2pzaE1zRW82RXJXdjVCRm0vSlVHZHNx?=
 =?utf-8?B?VG1sQzc0QVVneDdiYkFGMVBuaXQwbU9rZUxaZkVRcE5NNzlWWVFlRWJjeG13?=
 =?utf-8?B?eEVrZERxN3p0aWdydVhHaDUxU25tWTRHM3RyUlFXUmNtK3JROEZiY1U0cHNp?=
 =?utf-8?B?NWdNSmZXeSt4MzdFV2kvVGxjSDgzVGt6REppTnBuUWUyWDUwbVoyblZhZGZt?=
 =?utf-8?B?SDQycFNjbFFaWGFBNmsxaXNuMGg2MGhZaG1odytmTVF1MzFYLzlNUmowYTV4?=
 =?utf-8?B?dldIOGVOM3J0b2lOUjdFWWZQL2V1SzBXN0xkUVVic21kTitreVJSbSsrNDNt?=
 =?utf-8?B?ei9IMkVrdUhDU1RUV0lVU0djeWtnY29jQVMvUkJ3dnRiVzJhYUZydml4Rlpt?=
 =?utf-8?B?d2JZNXc4RFk5V3RQUVlxbUhnSndEakJDMHpleEpTTFlwM21BTGtNdkZ1Q0E4?=
 =?utf-8?B?NGVCcVJlTW4zSlRhRFE4ZW1RYVVVSS96dUVyZmNIR3E5aTlqbk1JV2xtalJE?=
 =?utf-8?B?SjdhUzlMRnVUc1RuU2l3ZUNlNVh3bUZQTEh1ajdJWWorTTdCY1dzTi9kVlVU?=
 =?utf-8?B?TXREWVJnV21wSVVBcDFydDg0aElESCtvN2c1VDJDczVabSs0MDhmMUVtdk9I?=
 =?utf-8?B?MkhaN0Z5Y0FWTU4rL3dwRCtQMkNpSUdJbG5LS3pSdGJQZzdCak53NndNcElH?=
 =?utf-8?B?Q3loSEpjUks5aFBweDlYdC8xNENNYkdzY25QUXBEL2J4bjVCNjhvTU1ZN0hq?=
 =?utf-8?B?OVdIKzBwdFJZWk5kMWNoWGVrT0R3OGI5UndCdVlQWXdLU0dFMTYxZURMekdq?=
 =?utf-8?B?SWp6MEkzaUJmNHA4K1VvQkZYNWpOMWpHNkNsQ1pvaE5LeTBHZ0VSWjdCQnJx?=
 =?utf-8?B?Z0RnVDdXVVNJQjhiVE9iOElBS2tKdzZNSElaZkJmVzBGYjlRVU9xWDVibjZh?=
 =?utf-8?B?Q3JvSjdUcmZNa1BVL01IWUxwVHpqOHhiOWx2TVBjTG1TWG9TOGFQT1dkYVk4?=
 =?utf-8?B?VjdUNmtUeVVlN1JYTit1Z3BQajIvMG0zc1RmMHY0MGVsQ0NRckZSSTU2alZ6?=
 =?utf-8?B?NWxwQkcvL29ERXpDeG5YYlBSckJPVjdGOU1aQjdkMS83OGVzRGVXZ0cvY09D?=
 =?utf-8?B?bG9mdlAzYk1TZSs2THMxMDQ0ZTk0WnhsclNDZXl1MWxQK3hVeHZzWDhqNHov?=
 =?utf-8?B?TmZzSmRmdHUyTVhRbURVWlZBTU1oRlZrWTlXU1M0WGxFUGloQTBLclJJYXpl?=
 =?utf-8?B?cExZOEt5WW55YmJGS2hIWGxOWkk3Y1hOOGZaMVlpeWU1eHBweENuek9PTUtF?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 116fed34-d3e3-4fdf-000c-08dbdff279cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:32.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N78m3REKyGhcNJR1My2Q8V682DFdABkb9rs1qvRtPvYdYQa8EDnE13MD4YjfvMaSZlxjurMoEHCcfceAzWrxC7FSX3IEIWWIwnbLdU19MWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 06/12] drm/xe: Move xe_set_dma_info outside of
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

MMIO is going to be setup earlier during probe. Move xe_set_dma_info
outside of MMIO setup.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.c   | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 78374997cbf6f..3bcda5626493a 100644
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
index f4cddf2dfa3a3..7329ca73e64ad 100644
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
@@ -420,10 +398,6 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	err = xe_set_dma_info(xe);
-	if (err)
-		return err;
-
 	xe_mmio_probe_tiles(xe);
 
 	return 0;
-- 
2.42.0

