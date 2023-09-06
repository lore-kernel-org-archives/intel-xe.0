Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFAEE14CC
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 18:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22A10E6F0;
	Wed,  6 Sep 2023 18:16:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5446F10E6F0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694024205; x=1725560205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HGeOXyXJlhkTJcAak09vKLxP6XPU0FYBJDl2OZnC3HY=;
 b=R+7ndhdrkqVQI8X33qJ0RZVifHNQCjdiE74ORmDBum4lxdNZ2aB1J8Ef
 Crt9xi21C4x/tQ3Ug9z/TaBTPfJmz1xe0/DAxHWW31JLMMl/aSJ2HWRaA
 V1MmAdfViDLPjNFcT2Y5fPQBSjmxBR/QVZGABTY0OFKmC0Ile3YffYpG+
 Ovlc+jXVLN0VxGDDv0GIK8OHtRsLfNFtnxq5rvWoHbKAPw4qnnuWJ084K
 /+231rT/XHCxD3e+2Y7kZ7lJjlEhr+TnSKu3kuF8+232dfbLA/ZEHL18w
 gUHaIs39YqzkLWVQ3Z+9TPiTxlinZAAng63CRQaquvtm1zJZNdL1LUp0K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367367480"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="367367480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691395761"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="691395761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:16:44 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:16:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 11:16:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:16:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi84UFGubnARVO2FY01F2yOeIWBc9TlwKmPvjeZhpkU+5pMXlSfrCg1BE9LJkUoEjQaDLRqOqXmK6aI5rHXLEGF3kB0rRxjC2mQjEixixBzj8XozXm8XrLkEyVdveClWk/0VEbTH4V5acAjhduhZ+zK6HeYR5fEPBHAJdX7EQl4MaqOsNw6TXUi5+9mhqhxxolju4CNrSOPFJ9Z9p5gKZDU0+n/hjF/nz8q1bhLPcOI2yX5vVE2kKeFm3gMsgaNLGJACcu03goo52TP1///MfmL+kxLv02M8rq2hXojiTgdVO0BMZJ4Ry/hedeikG6GxwhFPgKr936E+I9tbYF9QNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2hmaAWSoJHpNgHgjQX+yr3op5/lA7HnzdLm262koHg=;
 b=NIa1Ebbwc1VJNhHDDzXKvPaXt/hDZy7j/JzdhaJ1Lo0iVAn8hkOViCHmSNbzP2bzjRVfzktD+Op91uWzQsULS3DqcwEct18Ggkv9c5JJ7rpPIEkMqpxRDbg+uFHjDuiCfcDFFx7EC1MQVxXv6f3Ri3dVFpGsHi2YBBarLcU4OKB7YDxbzijKS/dL9kniH/+Vj3R4ts7MvZHr3Xn5aGT1NqIdA7GpYIxoPH5u0C7cyyByz1cHliUGgb/ZQKem5e8v6519ebweG22LcJrv0eLPq06uXsnA4EXSt/k1fMJm9E6lEl3v93Bz06jRPTgZ9FaqJQ5TV3B8A5g5g7Ku1VJ3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 18:16:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:16:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 6 Sep 2023 14:16:32 -0400
Message-ID: <20230906181632.342494-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
References: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 5176c3d2-b0f5-452d-623b-08dbaf056965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8YDdX9nBhW2c97KxfYOdTqqHxtgQQ4CNoijj7F67WaoEWubMvnqMuyMXMDwNh6lb3nFCJ31sBNfUu342PQ9K0VHiiYajBI00dMR6QJ3pCp9vFrj3LBhXrbFbz4n3MJ26o88B9lAgl6Ns4hJYak1oANWCYsRoy+WXbdxAYobwHDrrpnN7yjvvmNQbDGQn0I+hRrl8vdYJb3HZp5x5dNvFpv5+XdWFBhXdrNmytz9c9sq2JuRjzSzrsdWyp79Z8UjzUndmJcy3gnq/bMQs5WAbqUkr/t64UbMFEAXuIAD7BYXnhS7q2CvfMSAnequB50W/rfDgWT71fr4AxIzlB2HZdPSfKm0nsSi/6tQkgk+0PGVk0jXbtsaM0cln+5VrKPs8om2f00dHabBswMtI90xblsFQnluR6Mzx6SJ0UhYQOQ/X79b3wK+ZWbZ1FjnaXwEKh6XgKEw12eXw2Wi6awYhqznIZ6K3BTOVtxBavyNLgtuWEYrhrVIXPAUmBupWgNTUoqGCvZ/qkaH2rUD8voS38OEld3+SbUAAUFNXl+i9Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(186009)(1800799009)(451199024)(6512007)(6506007)(6666004)(6486002)(2616005)(26005)(1076003)(86362001)(4326008)(44832011)(5660300002)(8676002)(38100700002)(2906002)(8936002)(41300700001)(316002)(66946007)(66476007)(66556008)(36756003)(6916009)(54906003)(478600001)(82960400001)(966005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFMyZkk0OTVibTBmTEN4cmo0bXBKd3Y1NXYrVzJ3UDd0Y1ZpOXJlVjdWbW1Q?=
 =?utf-8?B?cG45L1hlZHpMZmdTcWFhRVRqeVVPNXkzMUlNOGFKaWRqREx6RVNTeXI3OEVa?=
 =?utf-8?B?Q2JSYVRvZjVBTjJZTWNsSHk5VjVXVFlDTi9DVXNDVFlRUkJRcTJocUVLcGk2?=
 =?utf-8?B?ODFSdVd1V1kyMWNCc1dEQkplcSticWpHZDI0dVdhS0Q1Ly9kNlNWWVRXZkVa?=
 =?utf-8?B?d1prNmoyT1BTNDRDdURVWEU1Qi92SzZPMC9WZDZHZ0c1ckhIUThNaUVZdXFp?=
 =?utf-8?B?VktxV3JlK0xRZ2lHT1NYVzNSNS9LRXEwUzRLRjN4U0RwdTlta2xhV0w3R2lh?=
 =?utf-8?B?UUlZY29ta3VPd2VuL05sYXphb1QwQ2pLZmZLR1VaM3hCOVFFaGp2MjQ5b0la?=
 =?utf-8?B?WmpxN3dSaGZ1N3BjK01wa2xpajEvWGlvZVVpQ0I2TmpSRm9pL1BYZVdVQkRL?=
 =?utf-8?B?ZmpQQ2NISmQySlNwMnNjN0p2a25DVjIwYzY4S2hrN3llTHVLRFZRSi8xTzdJ?=
 =?utf-8?B?amlxK2pkaFRRMXprZENhUlpLemZ2MmcrWWFocjgvZWdmS0NpeHk2N1F1Z09s?=
 =?utf-8?B?dlRIUjUyNzRKVk51dnV4MFlLZEtZelg1SHVUVXNuM0JxZzVsc0xZcnZ1Sy83?=
 =?utf-8?B?Mlp6c2JOM0l2SzFZaEY3OXU3Z0hjcklWcW5FbXVqblNtYWM3WnVLRzBjRVJ6?=
 =?utf-8?B?bW42a0xYRnNkTWNTMFlBTmErVjBQUUFnWk5hRU96MTN0VlhVZ21VQnNrbXIx?=
 =?utf-8?B?bUhZMkpPN2NxeFZTUUN1QzlLY3hQZ2UvZ1NKcUdHV0tMeElFR2dKM0RDOUdt?=
 =?utf-8?B?aHlBbDBscFdqM2wvSWh6ZjQ1VDU5OE50b21MTnJHU2hwUVlHenk0emZzVTVj?=
 =?utf-8?B?YmhtWnJncTI1WnhjelhLZkgweEI2Y0E1USsvSGZMZHZiQVZKbGxyaFhIK3Qw?=
 =?utf-8?B?R01PMDBCbStnVmtMbmdGc1htLzFWb2tPYVVlRUh2YXIyc2IrNjhDWXJJRXRo?=
 =?utf-8?B?OWZNSmg0QWNDMWZuOGpPUWlRVzZOd3hOTVA5dnNlMXFObHVCRWRlRmMxOGxH?=
 =?utf-8?B?aXdOY0RsZXFDaHd5SU5FMEhOb0R5cXZWdEhKMGN6Q1BiajRMa3h6eGtiL3dL?=
 =?utf-8?B?ek9Xc24yUGF2UisvSmFnZ05uR1I0RG5qZExxMCtlZDlIRXZWSzZ6ZzR5emJk?=
 =?utf-8?B?QkdjSnY1OXVrdlllRmpScE4zY1YwK0toamRETU5SSElRSjU5Z2FVTXY5NVRj?=
 =?utf-8?B?WncxeW8rSU9CTWJIdUZKTjNXbFppNHNobkNNM1EvSDFGRGxRQWZMMjdBbVZv?=
 =?utf-8?B?OTg5ZWNJUnVFYXpIQitPVDZ2YWhCb3pYdUZPZWVhcXJPMHluNThUeTNZaHZU?=
 =?utf-8?B?UmZObWZTZmtBbmZtajN3c2J5S2hieTN4TnZGbUZxU2hTcUF3SSsxUnpMeTdX?=
 =?utf-8?B?bjJkbStsQWN4QXdGZTd1cG5UbWtRMWJMUWQ1akJFcEZPcnU0SVpnY2pYaU5y?=
 =?utf-8?B?ekFkOFA4d1RmenlBNGQvWW5FTXQyZ2VWY3dCYVBCZWxXb2tsek9HbVUxMWx3?=
 =?utf-8?B?dTkwaEw5TFZzUXZDNURaRjZIc252OFNVNUtYcVZscDg5eko0WWIvYTJXTWc5?=
 =?utf-8?B?cDVYS2tISFRPQWZYdjUyWjFHeFRqY05tVDJ2bHlEQkNBSW4waG1IUkFHbzVD?=
 =?utf-8?B?QVJCVG5jNlVqSGpRZWxnNGROcUVpNVVTdWdRZWxsMFR5cVpJMlMyK1M4bXFL?=
 =?utf-8?B?Y2x1SURWSHJGUFFWRWIxbGMxc2RqeHlnRDdHUTRDVy84T01ydmtuMU9LZGF2?=
 =?utf-8?B?UmY3OXh2V3V4a1BJbkhabXd2UzR0WlFkd1Myais1MHZrUGxXLy9VaWFjcnRt?=
 =?utf-8?B?MEFoQjd4MGJ4SzdLcjFIaW9HK3pLN2NhNXRvcHJzWHZFWmduYnRXRWNrWEdv?=
 =?utf-8?B?Wlo2a1c1bjEvWkwwSEVteTRCWFgyRVJLSy93YnZ2NFBhL2Q1WmFPNkRRb3Br?=
 =?utf-8?B?VjN0ckQ1dkNwVVJCRWorcm9hdXA3VlBTQnVXdVJ2d1VjKzdWT0hwS05kVFp3?=
 =?utf-8?B?NWNOM0JEcGJ1Q3l3d21EOUE4aEpqSEFNVXZkM21IUGxFdzJLNm9Dd3NHbXQr?=
 =?utf-8?B?cmp1YVdQZVV0VjJKMmlGYjJvSmJuQlFQc1R3QWlPMHJ4TUJEN2NnRkNLaVVJ?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5176c3d2-b0f5-452d-623b-08dbaf056965
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:16:38.4425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaCo81BDtWzvseGtAVp6UwHa3Gh7/Iff34Ax+ayG70B87vHxtER+F/u86/dKcRJSrCKo0BfugmSNp07mzHaQsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix typos, lingo and other small things identified during uapi
review.

v2: Also fix ALIGNMENT typo at xe_query.c
v3: Do not touch property to get/set. (Francois)

Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  2 +-
 include/uapi/drm/xe_drm.h     | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 1db77a7c9039..c3d396904c7b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[XE_QUERY_CONFIG_FLAGS] =
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
-	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
+	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
 	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9cc..902b5c4f3f5c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -256,7 +256,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define XE_QUERY_CONFIG_FLAGS			1
 	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
-#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
+#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
@@ -449,7 +449,6 @@ struct drm_xe_gem_create {
 	 * If a VM is specified, this BO must:
 	 *
 	 *  1. Only ever be bound to that VM.
-	 *
 	 *  2. Cannot be exported as a PRIME fd.
 	 */
 	__u32 vm_id;
@@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
  * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
  */
 struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occured */
+	/** @error: errno that occurred */
 	__s32 error;
 
 	/** @op: operation that encounter an error */
@@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
 	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
 	 * Once the user sees the error (via a ufence +
 	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
-	 * via non-async unbinds, and then restart all queue'd async binds op via
+	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
 	 *
@@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
-	 * than differing the MAP to the page fault handler.
+	 * than deferring the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
 	/*
@@ -907,7 +906,7 @@ struct drm_xe_mmio {
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
- * Wait on user fence, XE will wakeup on every HW engine interrupt in the
+ * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
  *
  *	(*addr & MASK) OP (VALUE & MASK)
@@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
 	 */
 #define DRM_XE_VM_MADVISE_PRIORITY		5
 #define		DRM_XE_VMA_PRIORITY_LOW		0
-#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
-#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
-	/* Pin the VMA in memory, must be elevated user */
+		/* Default */
+#define		DRM_XE_VMA_PRIORITY_NORMAL	1
+		/* Must be user with elevated privileges */
+#define		DRM_XE_VMA_PRIORITY_HIGH	2
+	/* Pin the VMA in memory, must be user with elevated privileges */
 #define DRM_XE_VM_MADVISE_PIN			6
 	/** @property: property to set */
 	__u32 property;
-- 
2.41.0

