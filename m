Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D95C7EE32
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 14:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DE610E0FE;
	Fri,  3 Mar 2023 14:50:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7388B10E0FE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677855031; x=1709391031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=wXo7lrm+iApqnTyejywljy7VqDXTeSIGrCv/JMakfYg=;
 b=X5hHTf77TJ7F73hcolr5NDJJfg3WiAsrM8ZdrRyqhKyoFyuDlUMuy5q+
 Nlcnpb/gmlt/8/zV3lUN6kyBj+X7PJQxdEyYddgtjbPPInX8idGie/2gf
 qRb03nvVd0TpFDyA9YTVh1aU0/yj2bSKRSF+OW7hYGg60tv5nMUkBj0LY
 8TVseDvL+IdfTS4nPoHBHSVzH7C4ZXGjtMJr+gxff1ZAy3dYy43EL2fD1
 rbepLYqiK2NojkAY1hP/4mCbPedj4hpxAD+bM3raVBg6D3OEr8o9ptKVp
 ZsuswWfS46P9xi37KzGeuMaS88lap0fkTD2RF3YwM+PiQXX7Noc/6wsiY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="397644824"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="397644824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 06:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849477152"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="849477152"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 03 Mar 2023 06:50:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 06:50:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqSRF7KbET2Jga0ORSPB9ryEwRBVZ2PeIr9m8ew2g6EbMuvPQcpvLtUETC/xB6cNvQ2a8dJ8nHvOunVwPZl/S9rS4Epgd1mzqECBCT0fTUHMfnsUQR6Q3rkbi93fnHhpkkWbHT26kFhqtX2W7BTHgwxIqoLNY38C1SzSmOnSnbLWjy/qQXmHw54+bBrQ116Zs3FW14ynzAK5ShClLRTyszNKa3MF1VPEOBsgncsCv9RXUH8Y1Yeh6u22er+LB08IbZ5CMqZ9I6N0yrSolQd3F2UnXDsYO9s13HK1ULYci+qJqiMd8ejngHAYtTtRGUxiadBLLIt6gzSfwE/hHtM2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB1cFIWtd6PjKK99qc82+g4NtP0Wk9XMtC6cgmdzZcs=;
 b=gwbh8LOfYmKSvI6Vevv1eeJ85p99F1APY6FC3c2swwQxD17wUwJuecwx0Da32k4I22elpW2HfP5R/c1HS91KLYVDKjDYoQsXSrTlZm4H7g9LYZV1V3ugyO7z1tM+HaqBLA7OqZbombxQ5xCJ3SGrDCQrC5h2h/4zMi+CjqAZvKO2t3KWVDWxdGfw5Gl83TFmaqno1BWtSbuB6mgVqDSAaQqfJRyEI9uECYHd/i5WsMLDkDf01YcL7fo+VLfsSZLY9HXURGk4FUBBtNYo5aQef2YpXcqZ7HUkNnOI2FoeAc8F/SMoxtO0y+W3UvIuhnVQAldr1G3cWUajeg8d5zqZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 14:50:27 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 14:50:27 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Mar 2023 15:50:13 +0100
Message-ID: <20230303145015.1018870-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145015.1018870-1-francois.dugast@intel.com>
References: <20230303145015.1018870-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 32114d24-5f5b-4f0f-9169-08db1bf6a0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oNScSPNmw0fx1KIpTYIv5bXRNLbj+Hen+Zp7jLViuLHsyyuBQl7rL/Ur9P9Qf/CgTNskYYS8LId8NsAjLng3sC2H3ljHs1bWDIeBY44q20/Ceuu16UeHtUSV8fZm4vzhpOf8jJtHNz93Y0X9XEJzu0DYuC4E53Dia1JdkVB22RXPP4HubB65bsKHqCpM+qh72owTfORWTT33xnJwcfxDKfQ6FbH3eolK4GL75tpy30lvek4Zkb0t2zSnSA7LmCExJsmb+DGP0KCoLenhvlwdu7bzl4uyAKrNjSxEt/MzpgBMzqAiCtQsh9SZUUEhpRwR/fmLyDdwRmwelRYLE+y/FS2sC2yjSYqS7gKBtK3EM8EZceOmlB0agNQwNY7a3/mmu+xJc3biCLyIon0jXMjPCTMintAGlRJ+UO9acNLqbDK4P01GsGHOHmER4MuME45W1xaBSwLQQNEyANKuCsloqq2UVFBupYQDwVWzDRFUGmKlv+Blpm5EB8ANDJ9OGVEshCXW+lujs/0RArEho2808o/X5bPYFDOA5ctr8Leb62EaugwFLx5rAQ5wnoDkv8eT4iJpxXSh8D5hlLAJOGjn3WNcQyP5GW4Szr5TkzpAJ1lf6gV36qsvF+12oxcGiRuHySW+L5RPMons6dqc40Bpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(36756003)(83380400001)(478600001)(316002)(66476007)(82960400001)(8676002)(6916009)(38100700002)(26005)(6666004)(6512007)(1076003)(6486002)(2616005)(66556008)(186003)(44832011)(6506007)(66946007)(5660300002)(8936002)(41300700001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1lkalFTNTFsUGozUi9zQmN6TTdGZ0EzWUpQU1BRbGpLcUlLS3VqUldHZEJK?=
 =?utf-8?B?TWpRUEpHbVFIMWErZE1qYW1mdTRFNDBjNG9YNTRiZ2xLYXBhVFhWUmRvdFVi?=
 =?utf-8?B?RUszN04rek8yY0hZZTYrN1ZzYW1pK2ZFUitCajAzbU5JenhQU3BFS2RFclBO?=
 =?utf-8?B?Y01SeDcrVEpBNHI4SFY2QmQ3bnNuYTc0LytTZlh6TlJCUU9BWG9nQlhaSzY0?=
 =?utf-8?B?ZGhzNkhidFd3ajBERThZUEpmUC8ybmdWdzZKV0N1VGlmaW5tZTRjb1VDS2Zq?=
 =?utf-8?B?Q2FydStPeUo2dDcwckUvSEYyUzA1RENVYnhqcDZoTHNpdmpMcm5BRHYwc01W?=
 =?utf-8?B?WTc1cm0vQXZFYXBjSnJ1MjE1WUFkRHNERy8vc3hRdVhIQ2lvdUZ3dlZreUQ2?=
 =?utf-8?B?VXI3QkJZTUx6WUhnVzR2cXgvOFA0QzBBdDUxV3hHK21NbjVCUzkwakV6dkdX?=
 =?utf-8?B?czFhVlV6Z1FGMDRyblBZWXM0RFdpaFB6bVA1bSsxQzRqMjQwSzl0UGp1ZmZj?=
 =?utf-8?B?dWVIcHhrV0d5ak16RmxsV0ZNRzFpY1hSeTlxblhRaGtQZGdmQUpiNS9MMVpz?=
 =?utf-8?B?VzEzOW50N1ZTSDE3eE8rYjVxZFg2VU8xZVFjUHYrUDRsaitqb1EwSFNYZmky?=
 =?utf-8?B?bm1HTzJuRmpNcWJ0ZlpkS2FNVEQza0hhbFZOeXZtWDhldXZDNVFlKzF6ZmRn?=
 =?utf-8?B?ZWc5S0J2U2pkWHhrNTZwcDh6QUFnb1ExWEoxNjF0czR2bTBpWTN6RzZPdmkv?=
 =?utf-8?B?L0Y3OWFvTGdSQ0EzaUlXWEoxL2ozTVdYZzhuR0xKZi9tbXBiNU9wZDhsQk1j?=
 =?utf-8?B?RTVWa21EM0ZGVWYxT2hkN3lDUmpUMHFjLzFkdTRCQ0RUQW40Tmk5ZzVwanN1?=
 =?utf-8?B?UThTSmlNNld6WkliQXFsbjcwZTRna0IxKzNBSlN0bkJ3QTZ0WG15c3Nmd0dI?=
 =?utf-8?B?eDRjSE9KclRUQlhLWVM1YlJUV1lRZEtaMHp0ZlhMa3I0MzE3Ym9VR3p6Q3FY?=
 =?utf-8?B?Y1dJWGM1QWl6WlIxbmtueCtvV1hPWUJrVVRLZmtLWDFuVVQza25RNkFBMDhY?=
 =?utf-8?B?OU9NdTlaR0tNd09TSmZLek5vL0lIWTFzaDBWeHYvS0VqL29DVUlyZ2x3MDkv?=
 =?utf-8?B?SWxDS2FubXFyREhNZjg5em9PMk5hMzQzUHppK1lmdVAwWmhMNk5BTzk0V1hv?=
 =?utf-8?B?Tmo2Wm1KeVV0dFJlMGk3MlZTbURmV3l3SUoxSmpSSUlQNm9uL2wyM1pXMmpF?=
 =?utf-8?B?MG0yY2FxVWVjM1ljWkFIb3NxSVNjOVppTlp5ci9YSSs2VWJzdkpNWHhyaVBN?=
 =?utf-8?B?NU1ZMlE0eEcvUmpSbEF0NGhWbjhNRHQzRnEvNWp3NFJoTGJ4TjRmUEJ5ayti?=
 =?utf-8?B?dlh5RS92MW9ySXBqSXBrWmRqK2JjQncxYXpYVjFJVDdFcE1IVys3Z0VNSHJ3?=
 =?utf-8?B?eGtJazYwTVUyYm1EWHFPaTlDR2RXczlyMklKbUFRK0FOeGVHMFZnUjNUajh5?=
 =?utf-8?B?ZW5NUzEyK040c0pHdEUvY3pWRFQ2WkM0alZMR3RUeVhVcEsvMjZHbmRZcnRl?=
 =?utf-8?B?b2pwNEhTQjNWWmE4T2tRVDZUaERZdXYrcDI1Um45NmxxYUVrbzNqRkt6cXhh?=
 =?utf-8?B?aWlSVGhBQUhTTmp6UVFUWHdYU0RGa0lWdm9GZFhneDUxRUJWNGRyTkJ3bThE?=
 =?utf-8?B?a0VuYmxpeVY0Q1gxRUxQaXZZWi9qZ0QydGgwMkt0Z3VkMTJYTUo2d3BaVExS?=
 =?utf-8?B?UUk0YkNvaFM3TGNpS2NDU1pPZGlDZmJuQzRpcTJLMGNRd3J1OFlFTXpWM3V5?=
 =?utf-8?B?bHR2aWpIT0lrV3J6ZnAzUGxvQWg4S2dUcE43WEdpM29PRWNoRXBmdS8vZDI0?=
 =?utf-8?B?Q0xDZFpOYXBXQUR5aDZ2bGRCL3JvRk5NU2JtalFDcjQ4YVo0TnAweVV4bHFN?=
 =?utf-8?B?N1QrSDNmMGNxRStzSEtRZWNlVitrcVlBSXlKak9zRlY4cGxHKzYvR004ZWNq?=
 =?utf-8?B?SWhMQ2JUQW15dGo2NGlldmZabmJxbnFkbHhJcmhEa0FkRFpQQ0NvLzY1Z242?=
 =?utf-8?B?Yjl3bFY3MnYzdjFyaXdkM1ZuRzYveFVWR3VwQmN0bDhyN093NjlNeGxqRmU4?=
 =?utf-8?B?RjMvZURjUFo0emhXSEFZZStMMVpnbGFIYXluaEZkeWdqejBjd0pLQUNNRXBz?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32114d24-5f5b-4f0f-9169-08db1bf6a0be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:50:27.7367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Swuy3xMax3eR8eoWksyaC0wLYZJYwTVZiMvDqSeRzF9kqjeUtoMdbUELKIVvR8u3qPu8HT1N9tYzZJzfjTEMlyPVG8W0iynrCkNyPqnApRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 2/4] drm/xe: Move setup_private_ppat
 functions to platform files
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

New files are created for platform specific functions, starting
with setup_private_ppat. This is an intermediate step before
introducing function pointers.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  3 ++
 drivers/gpu/drm/xe/xe_gt.c           | 43 +---------------------------
 drivers/gpu/drm/xe/xe_platform.h     | 13 +++++++++
 drivers/gpu/drm/xe/xe_platform_mtl.c | 21 ++++++++++++++
 drivers/gpu/drm/xe/xe_platform_pvc.c | 24 ++++++++++++++++
 drivers/gpu/drm/xe/xe_platform_tgl.c | 21 ++++++++++++++
 6 files changed, 83 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_platform.h
 create mode 100644 drivers/gpu/drm/xe/xe_platform_mtl.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_pvc.c
 create mode 100644 drivers/gpu/drm/xe/xe_platform_tgl.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 18257cd7227d..c28831a10ae0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,6 +72,9 @@ xe-y += xe_bb.o \
 	xe_module.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_platform_mtl.o \
+	xe_platform_pvc.o \
+	xe_platform_tgl.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ff2f464bf083..0eceb5789d15 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -31,6 +31,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_mocs.h"
+#include "xe_platform.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
 #include "xe_sa.h"
@@ -93,48 +94,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 	return 0;
 }
 
-static void tgl_setup_private_ppat(struct xe_gt *gt)
-{
-	/* TGL doesn't support LLC or AGE settings */
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
-}
-
-static void pvc_setup_private_ppat(struct xe_gt *gt)
-{
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
-			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
-			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
-			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
-			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
-}
-
-static void mtl_setup_private_ppat(struct xe_gt *gt)
-{
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
-			MTL_PPAT_1_WT | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
-			MTL_PPAT_3_UC | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
-			MTL_PPAT_0_WB | MTL_2_COH_1W);
-	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
-			MTL_PPAT_0_WB | MTL_3_COH_2W);
-}
-
 static void setup_private_ppat(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
diff --git a/drivers/gpu/drm/xe/xe_platform.h b/drivers/gpu/drm/xe/xe_platform.h
new file mode 100644
index 000000000000..d00377e807db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PLATFORM_H_
+#define _XE_PLATFORM_H_
+
+void tgl_setup_private_ppat(struct xe_gt *gt);
+void pvc_setup_private_ppat(struct xe_gt *gt);
+void mtl_setup_private_ppat(struct xe_gt *gt);
+
+#endif /* _XE_PLATFORM_H_ */
diff --git a/drivers/gpu/drm/xe/xe_platform_mtl.c b/drivers/gpu/drm/xe/xe_platform_mtl.c
new file mode 100644
index 000000000000..acc244a6a257
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_mtl.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_gt_ppat.h"
+#include "xe_mmio.h"
+
+void mtl_setup_private_ppat(struct xe_gt *gt)
+{
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
+			MTL_PPAT_1_WT | MTL_2_COH_1W);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
+			MTL_PPAT_3_UC | MTL_2_COH_1W);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
+			MTL_PPAT_0_WB | MTL_2_COH_1W);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
+			MTL_PPAT_0_WB | MTL_3_COH_2W);
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_pvc.c b/drivers/gpu/drm/xe/xe_platform_pvc.c
new file mode 100644
index 000000000000..fcee1426f395
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_pvc.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_gt_ppat.h"
+#include "xe_mmio.h"
+
+void pvc_setup_private_ppat(struct xe_gt *gt)
+{
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
+			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
+			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
+			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
+			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_tgl.c b/drivers/gpu/drm/xe/xe_platform_tgl.c
new file mode 100644
index 000000000000..7b909a1a90f4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_platform_tgl.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_gt_ppat.h"
+#include "xe_mmio.h"
+
+void tgl_setup_private_ppat(struct xe_gt *gt)
+{
+	/* TGL doesn't support LLC or AGE settings */
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
+	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
+}
-- 
2.25.1

