Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC868C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 14:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C5D10E405;
	Tue,  1 Aug 2023 14:36:42 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57F110E405
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690900600; x=1722436600;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=FcyLXxY11vZj6PRAOwpv2nBPHqZ9GJlsblV1nn/09HM=;
 b=CZbj7vK8+sfXQE5HW4VmxPHT195DzeHxWpq95McGvSLWk6Suw0GyWsIZ
 3mSC/1d8eeoGs9ylse9O5K+lV2vUUPHOG2h41SleyO5WNsWVrPQmYP/pL
 1pDGmrbolccYirUqhQmcuL6BMah9bImQOJhGRYCUaCWzMtnHiVQyxyov9
 BveAiWJBrVn4LFndK+ohec53CNP3pI7BnbxJ9eHHiwz5qUTg4NDpU9ZXt
 N4+q+6NaL9HfeAneCHSvNO+U+lZfpzhMR7obXVFThr+zN0L2lgIx1z58A
 vfMmKFujcxKsvsm19BBV43zw3tkUhEe11sbmfLPV3SECeKv1ZIhLVmC9y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455689112"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="455689112"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="705843455"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="705843455"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 07:36:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 07:36:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 07:36:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 07:36:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 07:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGFzgwCkj4yxKCjAR4JdZtaGAI/M4saPzd6q/CSUNf1kEi8MmNhlSOSTzFGVrThhtykdoe7QQdBQCsSTpbhW+r5lkRpNxOADVmoWJuptyGRvuWImShT/vnpKurl7iaBCl6+zrqSTyAy4UdXa01wLN0vNJ9qA7PfhVhUZJyA4cyo9z6OD0Wv17+RusSRqVJRT+T8jYnd2Jeq36LXv45BIXwsTtirkPTnq9y0IZas6xQGd5c2l4ty6IBCgYLakzKaw7WjLhoSPyiku2DFX1OyLWCFkVj1VcGHnOpXNBxRHF2nP6EMgW48I+yEI0kh9BcFgIxfew3jXRIgVSFYMFe1ebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK0u69cT/bDSWdTZx2JFBHWqdX50y4H36oLAdhXLP8U=;
 b=fWSs2bRdpg4kXXQd5fLKL6KYRduJecN5j4eBj63jcVopGEYYMccDrzt8cuJ8tWmv6Yv5H49tWIuCJL5xHFmi/SdfaDXtc0YZVr0jwo2gDmwNE4sT3SWuPpV48p3cIVHGq3cgl4xv2aEh5Sa9vAH4f8QARseL7jA46rgT1K5YaZr2DDmaunaeQeVQ+7dKI0ZxZSrvsqVbTOb/fXrTe5/eYmKb4rZrJsQxZ4dPlN/RUUlotFmT/TIGJ8lVr5lpm9N1oD8Zsaa5lm2uf0RRl8+nom2AIq0YCBzo/ykVJV9qqKsZ8WNbwp4tPMsMnx0b36GU1NX/O31PdisQ2meqFP4lGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 14:36:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 14:36:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 1 Aug 2023 10:36:30 -0400
Message-ID: <20230801143631.536243-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4701:EE_
X-MS-Office365-Filtering-Correlation-Id: 61da842c-025c-444d-e07e-08db929cb53e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbMUjtBDO2Q6slGELWaJPmD+g97RppQosyq92leQq+qrlMXTGKV0vt3AW/LhPIUMLcLRaGmdrEWgV26KBi01Wz1xpT/YYds+fX8SpAWBZghxycIr8ntr58hmuF6Wg6gB9TWLBgbCgdZKhbqHupb78uTGsioAQOAlu750AoUHeA3jnbR5bkJbDWSA3EFf5TjpMJ0ivxnDtkwf+qC8O/6e96G/4y+iF5wbduYY1Rt0ls9gcxo6w5BjwYgWuSCT2cIhxXSIyNNHdNZb1qrbQRAU8FSGMmHVLCQVaFWHH1aWC1mWHgKBNmV4pptIt9f2pqE25U1309FQsRPwB8rLXTvI2mPkMq0QqUwEX0EB9mUXm4QfHnyu7RqBwNQ7eKzAGJfYCtnf5PWIbqdFhkof/WtsOATUPlRkAPggkNDkL+2WgaO++hVioJDqL2xWLjeU89Vl0lop4fsWv6SVZ/JtOyQnuVbW9AfaZYSktA9C/XIOKSwChVNPOPmsnC1711e0iEpXCbC0wDSfmDTEN1zxoEj9rje01PInIlw/1Gg3xyvHUhGk/ziMwR/o8PxEwUGo0aak
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(66476007)(86362001)(8676002)(8936002)(316002)(5660300002)(4326008)(6916009)(54906003)(66946007)(66556008)(82960400001)(41300700001)(478600001)(66899021)(2906002)(6666004)(36756003)(44832011)(6512007)(6486002)(107886003)(6506007)(1076003)(26005)(83380400001)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVQ3aTZJdFUvV1NMMEh4eUQxM1FIaUVxWWJBQ01oKzBkN1RQZUE4VTZSR3ZN?=
 =?utf-8?B?bUhQV0dWOWFGTzFMS0d5aFpYSVJabnJCS0ZEeU10a1owMnAvT0t4bFRlUTNz?=
 =?utf-8?B?ZnRKb2QvRXJ1WmtEeEx6T0hFMVc4eENxeEM5WndaMG9qYTYyanM2Tjcyejdl?=
 =?utf-8?B?VE81ckpEQTJ0d0wyKzFTeUM4ZzhkMXRuNTdEM2hMdHlPSkxNd01JUVRvKzFw?=
 =?utf-8?B?NS82T1BiWUlVcUIzSkxvMUVhWVBYVStDUVNVWHlieG5OQW1NcUpSa1c4S2hG?=
 =?utf-8?B?TCtpcDMxaVJRQzlWMng2aHBvTGptRGxOaERnKy9oS1hRaXlNRWR4ZGZ5SjJ1?=
 =?utf-8?B?ajZZQXcvaUlmaXJPVkViOXp6aXVrTWJlLyt2NE9PZnZhcXVoenIxZlBPU0xh?=
 =?utf-8?B?aEx1VFZVT1ZGQ3NXQlFsd2xhRm5UUlcvZ2VZOXlwOW0weEUvU2dzSWlmVXJB?=
 =?utf-8?B?WTRWWlhLYzIxSnd2SkNpREQ1UW9RZXc3S1djREhoS0ZTMVNTMjYxeFZrZ0VW?=
 =?utf-8?B?TXlpOVI5a1VlUXJYbW9NUm1xbUlNVDZlYnR3SFBDc2dJenpnWm5PSXBHanpZ?=
 =?utf-8?B?dm5oc25VL1BJSWMrSGxOSW1vWmNFZXgwMjJKSmFqR244dm5sVDUzNDRYZHBE?=
 =?utf-8?B?N3N2amhITW5vb0NqWExnbTZwU3NYTkpwMExBVTRJY1MzYUNhcVhsdVpaZzFa?=
 =?utf-8?B?MS9XRHBuamNFZ0hHTFdIUCtlS1N5ZkM3dmJUMENwdmlZWVQrQ21ZUXFuNE92?=
 =?utf-8?B?VkNxSDdhNlFnb3F3VzU4VmxERlRxNUYyTGhZb3dubDhTYTVLSXc3MFdVNGVJ?=
 =?utf-8?B?eGUzYUwyWWFKcUh0OVkvYlhxaGRpaU9qeWlVZmR6eCs5RXVXUzQ2UUNnRnpr?=
 =?utf-8?B?cnA5OVlNUXowZTFqTk5IR0ZaNmIvKzdGQ3RzblVIMzJtTUR5RFRBSWY0R0lL?=
 =?utf-8?B?WW4zVnN2K0tHRHYyWUIrc1grRDI3UTQrMjZwZmJxZUQ1QkxiMXpaSy9xVS9K?=
 =?utf-8?B?UEJhMmFzbFhtWkZ3Vlh2Q3BuUzlDd1BiakhiY1B1cFpUc1ZVWDlPS0Y5cy9y?=
 =?utf-8?B?a0VPYTJSYS9kZXV2ODB6SlQrZVNmcG1IOTVacEszaitMbVZBTXI0UXhRTno5?=
 =?utf-8?B?eHN1RC9zMjlHQ0dQT3VGeVJrdkEyMDNoc3NISmQvelc5UHhlUC9PRHphRTBM?=
 =?utf-8?B?NHRjUEFzbnNlWFhramFndUw0Ymc2OFJMZzMzM0Z6OWtCZGF5YzF5S0g2b1Z2?=
 =?utf-8?B?NHUxQmJadnRid2pTRXpZaGZyNkM1a2RwZElVSlkvMVMyaEVjS28vNWp1SnJs?=
 =?utf-8?B?bG5Hb1JHUTVWeFZtWW9ZZlFYaEtxTnJjOEIxeE1qSkJvUkRxZDlDQzJmK256?=
 =?utf-8?B?K2t6UHBwajU1RTg1THZNMWN4QjRURXF0eWZFNWJmL3hYaWJoRU1JNm96SHl0?=
 =?utf-8?B?YldLQVN0SmhaQWlQY05MTzEwNS9NUEdzYlkyaGowaytNbWlkT3Y0VEFlZlln?=
 =?utf-8?B?Ny9JZVoybS94Q1JOYmhXY0l0U29QNXErakRrM1RTRjZHYlZKemhES3BFOVE3?=
 =?utf-8?B?YlVuM05vaXdVVFRtMnhCUUlOdkVaL1VoSjJkcWUrTnFiU2FwUWgyRXFIclQw?=
 =?utf-8?B?RFRBMGEyVHNJczdUNWJMNlFQd3hCNVc3SkhpZFRZdlVDMnRRME91dkdER3Z4?=
 =?utf-8?B?bWdjSGlKWHR5VmJubjd6THZ5b3ZvSEg3T0ZaL0J2V2ZVWkZFb3VIUzFvY1c4?=
 =?utf-8?B?L0tka25sOHoxS2M2eVlqT21hQkoyVTdvVWt3SVYwOHJ3VUMxa2NDMzZtZTdZ?=
 =?utf-8?B?bXVZU2ZiNjk0NUs5c0NhVGp4YmluME9WRHF3Rk1oSzBONDFZY2ZjYkQydlc2?=
 =?utf-8?B?d29hckprejFiSzlzdVhwVkRLNkJSNUtqMUl3OVNXeHp6SFlWVm9mMGZnQ3Uw?=
 =?utf-8?B?YVR1eU1sLzVBcTVvbytmTDNaOTRVYlVFeE01a2lEdjFkQVhJeWdUdTJKKzhO?=
 =?utf-8?B?cFBndXdLOWEwam5reXpXMjBMRmdWb2o2NEhXREM5TmtackZMQXdPdXdHb3Ex?=
 =?utf-8?B?Y2dHZlBQQytDTUZXY1c3N21LNmw4VnlQMG9kNklYMU1qRUdBU2tnZFd2aXNT?=
 =?utf-8?Q?4pNHK4w/Bt/QKcURGddHkGQDD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61da842c-025c-444d-e07e-08db929cb53e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 14:36:36.0636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61q/pE2uzV4/kZ0hid/vD3RK+mVN/SOORjrN2daapDDi7knkXZWvkwlDfc4S/iDXbU/8v/MbrPMj4k7eILIuFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display support
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Removing unused declarations.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/xe/display/ext/intel_device_info.c    |  1 -
 .../drm/xe/display/ext/intel_device_info.h    | 38 -------------------
 drivers/gpu/drm/xe/xe_device_types.h          |  1 -
 3 files changed, 40 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_device_info.h

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 9e9ccdef81f1..614cc2900104 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -25,7 +25,6 @@
 #include "intel_cdclk.h"
 #include "intel_de.h"
 #include "intel_display.h"
-#include "intel_device_info.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.h b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
deleted file mode 100644
index 959acb261007..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright © 2014-2017 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
- */
-
-#ifndef _INTEL_DEVICE_INFO_H_
-#define _INTEL_DEVICE_INFO_H_
-
-#include <linux/types.h>
-#include "xe_device_types.h"
-
-struct drm_i915_private;
-
-/* Minimal parts used by xe */
-#define intel_runtime_info xe_device_display_info
-
-void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b156f69d7320..c60ce94c1aac 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,7 +18,6 @@
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-#include "ext/intel_device_info.h"
 #include "soc/intel_pch.h"
 #include "intel_display_core.h"
 #include "intel_display_device.h"
-- 
2.41.0

