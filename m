Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B76C10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8110E60C;
	Tue,  5 Dec 2023 21:37:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B8610E60C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812233; x=1733348233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1DZkIHIqEHFSOV9Yzoi4MdUjA1urIW77XUO8aQY6KeA=;
 b=VuCO0bubvR7ViUAWAVCTBqw0NTEMv42bxFawHl+g1XGTBCMm89fc+bK1
 BAU3I8QvhXKylIK8vYm386ffnV9fVOFstSfrz/U1zkQUACBBgGsXNEqhg
 exycD9wWylvsHgZhCw35JaXvEH9t1L4X0wVKaCHrhpj+dI/nGN8blx5xW
 PkW4N3c8H7a8MSTM7fqh9Q4oGbyv9yrHu4TDRkVsvpYDJeLvAd3hGcTRD
 /R0BoMzuR5m7Img6pKpVjk9nQFOnlHbe+pwqqOFXBXBk8WGoevoN3N0iz
 Izq+NJEv8Uy4qHgD6TavnYqLPeJixfeF4vkkv2LlXaXoJu7MphLZHk5QV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458279174"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="458279174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720855406"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="720855406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 13:37:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 13:37:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bot6I82++JVyZC3jTpm0xwxKUc9X2Oek2/rRbR9XZb5Jk5Gxzvquwc3KurZne2RECkYZEGjQ5T6QNoLAGN0hb+27J3nhnE+FYqZF7sbTK9bzonxAN15puGACr44ODOV0e622nh9crG1UFwRZByYK2OfjQAU3LddBJDUbEpVnme6yscmn5r3+wTas9o3z41Vjr7xKbMgU3uzN2cQsavpY2bAlQXFBBq3XcaDjgaKvnD4PyuqT6YTD94fD5PJrwiZasD/qrDUi/jUjFvxeUuMyWKASnjgRTurzKRDAff42TXZD+VYm5KgTzQM2peYlWYK6BNthzvQnLP3+6WeAtxIPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRuKTgv/xrAMpl23FKEaH2e6ZaH6R1kUzB+l7n0X+mE=;
 b=mrZ9Rh867oXy2p+DbwQPG89lgJG/jZ1fS5/7DSNydT/mhpWmqr+Nob7sTyTBuM1CrBa0RiOqHEcHeUjTemBE3MWHz35GMk1VHXXJOmNyE0Ec+FVikQNUq7YU55fjaSkCEj37HC3mNsa4AwJ/l/3c/gVEBFym10zGPGHQ6bF3yJWF0MGshZxHUXEtwumInzaOTgBZZc+V/0KssnV0bRAw+NKQwsrUrWlz1BXEj4cKUSLX6xlOs/c1OkTuzTAtD+QsRgdLoXfYU2oZsefydym9BvL7e5NJ9vn7fRT8t/kh2I1zGysL5BWbzlMFhF/pTUmx2BnZgiDmhxD/WEc9nvVTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6832.namprd11.prod.outlook.com (2603:10b6:510:22c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 21:37:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 21:37:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 16:36:57 -0500
Message-ID: <20231205213659.179813-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205213659.179813-1-rodrigo.vivi@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: d7600a88-ed2f-4a1d-3bf0-08dbf5da55ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RU/tO9W+O8OM05Mq2Cm1nJ74uDumAdu8/ptKxOQQnXWhdqJjWu0hVADt0mmwbyUAoL0TC/F+O0S89JQTazZJGbPdYOzo2vEXQLUpHi6wIdwo9PP3AN9KFyRDssjCPfUp3GuakeHvHzVK+Ks1KAqdr3ec3F+qhWqGFsRb2gG0ZAg+q4yeMnTrpYZNS+uOq+asUF1mhUwdEZYMlnq7dQItBuuNtJD4n6I98DsXirCB6+bJJX0qJ3AoHkkeVfIMWUyzb9V653rVIAOSEBm8yOnPF5YRyor+cX+1UC7pMXQSCpV/ebroqFwEn3BHNpbPCd9uPcyu6X9ddVpXxSuQZOEQybC/LWkMr5I+3fRsYD/tWt9cHJo/b0lKOwLzfZzQPqamr3eFHC+oAqtdzIhwsj5q2rkzf7C4lIxsYNU0Zsbhg78hq5UFY5xPRhxG0v4yiEcJvjZ/nrUXqq8jpJZSCQ+HHPvTb4kKNpBw1+6nLW8IvyrsBFcRieLR7GNsgrJNr8kYIC43yfKu3xh/jomdZ44dNMjD+7HbujfbK4z0xI2nKpzF4goFaq34OpQhwmrr9twEUJHLxKyKpgmPzudkDkFo4OCKcM8H2H8di6ExVrctAbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6666004)(36756003)(6506007)(478600001)(6486002)(1076003)(6512007)(26005)(107886003)(2616005)(66476007)(66946007)(6916009)(66556008)(83380400001)(316002)(4326008)(8676002)(8936002)(44832011)(54906003)(5660300002)(2906002)(38100700002)(82960400001)(41300700001)(86362001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkgzTVdYYWlxUTZPMnVKSUlGSmJsWVkvR0hkcXpQOUJyUHlwZDhsRmREZEtC?=
 =?utf-8?B?aTZPbVFoZDQzZzh3YUlOdU01UzF6dC9YeEwzM0hvWFQxSWxFd25YK0FQSGV4?=
 =?utf-8?B?RmFQNHhPWXltZnpXb2Q2NC9yM0d1dTBuZVVoTW1JandWRU1MMTBGWGxmUkR0?=
 =?utf-8?B?MFFCc0VlRzRjU3ZLTjh2M2JyamRZVFA3YnkvdG8renlRTktsbFA5TlNLajFk?=
 =?utf-8?B?RmExeFN3anM4K1dSbFVlaU04ZkpvTjdnc0V0cEk0UkdrL2JiaGl4MElSaFQ5?=
 =?utf-8?B?dXZ0NDlBZngvOEx3VE5HQXhBVTVjN0F0VUo0SXllS0NMVnN4cUtibTFGOEJn?=
 =?utf-8?B?VDVGN0N2M0pvajNXQnV3Z2RWbWp6b3pQbjd2T2lTcVhPTGtuUlJLT29aTEhL?=
 =?utf-8?B?YThVYWhmRzY5bFkvZy8zVmFxbjFZMFEwTFB4V3Q5TFdtOVVTMnYzcm1BcXZk?=
 =?utf-8?B?MUNyNnFVeEYzZEVxcExHaVJuUGNWYnhWRXdJbkhtdDRZUlNpQUZWMG1UbFdN?=
 =?utf-8?B?RFdaQXFFSFhadHFJZVJzZEF5Zm94TlJ0ckoyWFZNb1hHN29QeDdsWEE4Kzlu?=
 =?utf-8?B?WHN1YUo3aURsY3pDTGVqVEt5aXJ2UUZhMVRYRHZncWlXZmtvYVdOSkt2MTFm?=
 =?utf-8?B?amVqTDhVZDFMdm5odUxITzRuTWxXZUdCR0cxcm9pRVBNYW82M3ZnOW9vN3pz?=
 =?utf-8?B?TjdJaFdvVFFFd1F4TTgvVkFQY2VoMXhkeVA2Q1U5R1g2VDlBYVVaRGtHWC8r?=
 =?utf-8?B?aHFmTFNJSmphNloxa1pPcG91a1Y1dU1YRTFVVENjZG14YnIrYVUxS0pzRFZM?=
 =?utf-8?B?Sy83ZW9WZUZtQTJZaG96alQ3U29rMUhXR2UxMzg2V3hxR0VuOVg1anlvNUtJ?=
 =?utf-8?B?K2QxWHlSMEVBTDVyOGFPQm1wWEN4dUZBblBJYURXeUJuRDkzQXNtMThHUDlT?=
 =?utf-8?B?N2p4ZFNqVkFiOTRWM1l1L2dIQjRqQ1BFMFlPdm9NYURmN0dZcStYVWVkMS9i?=
 =?utf-8?B?SzQxSjN6bWRvS204VE5uYThrR3duU2hBM1hETmNpQ2tzd3g3U0VQaUc1QVov?=
 =?utf-8?B?SGM0WStrVnc5dHJhTm9DUzhINU1XOW4raURQSDMvb2ZrWVBQR2wvTXh0a3JS?=
 =?utf-8?B?L1ZBamtLazg2SHZtSTFUaXFwb1VhbHhpTzRqQTh2K3dwM1EwaWRPK3d4OGRX?=
 =?utf-8?B?QVNxTlJNejl0QUdPaytTY2pLMGZNcEtGU2kvK0VMenUyNEJJMVhJaHVFMHVZ?=
 =?utf-8?B?QUN4bFZ5WmQxeDlwQmpmb043d1FXN2dVcGhCbzZaZXVkRmQ0S1M3U1ZrZ2ha?=
 =?utf-8?B?c1pzVHRZMUdHSG82eTN2alBNdndGb3JGc1JvcHZWcVZmMWlkdEpzRllCUXlX?=
 =?utf-8?B?QURwNWpvbjRPaXNQYXU2a2xZRndDWWI4Q2hYd0gwenkzRWVpejk0RGU1Nk9G?=
 =?utf-8?B?Z0NDc1hkY3oyVWRtK0VNeUR0Y3ZkeDdzQ0FKSDNPN2NDNVc5a1N5TllyMnRt?=
 =?utf-8?B?b1lHNUxpQ0RpRjRzZmhzZmU5TlNmYTdwVzBPVUY4Ymg4Y085QksyNDJ5RHZ6?=
 =?utf-8?B?bkRqQk1yc3JoaWlzOG5xUk8xNVE3VllJL3VLL1VzVW5pcnJYc2J0V2lKSTZV?=
 =?utf-8?B?Z0Qrd3F6dkZselI5NmZUZVV6RUZKcGRJak5pN3RqQ3pPWlRQYWE5VjNVc0FZ?=
 =?utf-8?B?Ry9sMmxhT2hwTGEvUCtQU1JhSjE4RnlKUTNJSG1JOFRtQ1AyQjBUWU1ERnoz?=
 =?utf-8?B?bEdjTlFmWDBoTkJXWFJZVVBjRytoYXBtRVFzWXFVK1F2em5nQSt2L1VmalVt?=
 =?utf-8?B?ekpwWjhJUm8rUWN5YUw0bWVLQW5jZm9mdVhVRDhhT3ZNbkdoRnBva3I5cEVl?=
 =?utf-8?B?dUVmMWpKVjhkZ0pwQVRmd1VDdjlpYUNwSkpFNFFsOGhOQnVhTUNraEUvcFBN?=
 =?utf-8?B?ZUkrMW5sdlFSY2F5MDVYVXAzaURIdHdJTHVzb2cxVkErUUR4eGx5eW5JSHc4?=
 =?utf-8?B?MHNLQk51dmh3eFlYOEVSY0lnMTFTOVJqSGRxZlN3TDFTcS9BUTRRWVhBd3lJ?=
 =?utf-8?B?STNRa1pVMWVOcGtXcTBGa1lUSFE2SE9ET3RUblNxZlpHOTlva2ZnMzYzbjY1?=
 =?utf-8?Q?DBnIz7NIk128lqliyQF5gT+R+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7600a88-ed2f-4a1d-3bf0-08dbf5da55ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 21:37:09.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLf87KyaZFYKXui8yvUzTjlO+T8ZPaqkq4IFi0lYyCEJz2tkdtyB3JqwscCEJfCb880kVlAN2KVLcGWUb3gMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6832
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add frequency throttle reasons sysfs
 attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Add throttle reasons sysfs attributes under a separate directory.

/device/tile<n>/gt<n>/freq0/throttle
			|- reason_pl1
			|- reason_pl2
			|- reason_pl4
			|- reason_prochot
			|- reason_ratl
			|- reason_vr_tdc
			|- reason_vr_thermalert
			|- status

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 254 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
 5 files changed, 287 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3bca43cdbe3d..c4559590b256 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -77,6 +77,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_throttle_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d318ec0efd7d..19d00e4f0a33 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -463,4 +463,16 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
+#define   PROCHOT_MASK				REG_BIT(0)
+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
+#define   RATL_MASK				REG_BIT(5)
+#define   VR_THERMALERT_MASK			REG_BIT(6)
+#define   VR_TDC_MASK				REG_BIT(7)
+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 769d59441988..39268a9c5b6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,6 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
 
 /**
@@ -214,4 +215,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
 	if (err)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
+
+	xe_gt_throttle_sysfs_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
new file mode 100644
index 000000000000..1132e827f1c1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include <regs/xe_reg_defs.h>
+#include <regs/xe_gt_regs.h>
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Xe GT Throttle
+ *
+ * Provides sysfs entries for frequency throttle reasons in GT
+ *
+ * device/gt#/freq0/throttle/status - Overall status
+ * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
+ * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
+ * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
+ * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
+ * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
+ * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
+ * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
+ * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ */
+
+static struct xe_gt *
+dev_to_gt(struct device *dev)
+{
+	return kobj_to_gt(dev->kobj.parent);
+}
+
+static u32 read_perf_limit_reasons(struct xe_gt *gt)
+{
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+	else
+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+
+	return reg;
+}
+
+static u32 read_status(struct xe_gt *gt)
+{
+	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+
+	return status;
+}
+
+static u32 read_reason_pl1(struct xe_gt *gt)
+{
+	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+
+	return pl1;
+}
+
+static u32 read_reason_pl2(struct xe_gt *gt)
+{
+	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+
+	return pl2;
+}
+
+static u32 read_reason_pl4(struct xe_gt *gt)
+{
+	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+
+	return pl4;
+}
+
+static u32 read_reason_thermal(struct xe_gt *gt)
+{
+	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+
+	return thermal;
+}
+
+static u32 read_reason_prochot(struct xe_gt *gt)
+{
+	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+
+	return prochot;
+}
+
+static u32 read_reason_ratl(struct xe_gt *gt)
+{
+	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+
+	return ratl;
+}
+
+static u32 read_reason_vr_thermalert(struct xe_gt *gt)
+{
+	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+
+	return thermalert;
+}
+
+static u32 read_reason_vr_tdc(struct xe_gt *gt)
+{
+	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+
+	return tdc;
+}
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool status = !!read_status(gt);
+
+	return sysfs_emit(buff, "%u\n", status);
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t reason_pl1_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl1 = !!read_reason_pl1(gt);
+
+	return sysfs_emit(buff, "%u\n", pl1);
+}
+static DEVICE_ATTR_RO(reason_pl1);
+
+static ssize_t reason_pl2_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl2 = !!read_reason_pl2(gt);
+
+	return sysfs_emit(buff, "%u\n", pl2);
+}
+static DEVICE_ATTR_RO(reason_pl2);
+
+static ssize_t reason_pl4_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl4 = !!read_reason_pl4(gt);
+
+	return sysfs_emit(buff, "%u\n", pl4);
+}
+static DEVICE_ATTR_RO(reason_pl4);
+
+static ssize_t reason_thermal_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool thermal = !!read_reason_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", thermal);
+}
+static DEVICE_ATTR_RO(reason_thermal);
+
+static ssize_t reason_prochot_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool prochot = !!read_reason_prochot(gt);
+
+	return sysfs_emit(buff, "%u\n", prochot);
+}
+static DEVICE_ATTR_RO(reason_prochot);
+
+static ssize_t reason_ratl_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool ratl = !!read_reason_ratl(gt);
+
+	return sysfs_emit(buff, "%u\n", ratl);
+}
+static DEVICE_ATTR_RO(reason_ratl);
+
+static ssize_t reason_vr_thermalert_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool thermalert = !!read_reason_vr_thermalert(gt);
+
+	return sysfs_emit(buff, "%u\n", thermalert);
+}
+static DEVICE_ATTR_RO(reason_vr_thermalert);
+
+static ssize_t reason_vr_tdc_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool tdc = !!read_reason_vr_tdc(gt);
+
+	return sysfs_emit(buff, "%u\n", tdc);
+}
+static DEVICE_ATTR_RO(reason_vr_tdc);
+
+static struct attribute *throttle_attrs[] = {
+	&dev_attr_status.attr,
+	&dev_attr_reason_pl1.attr,
+	&dev_attr_reason_pl2.attr,
+	&dev_attr_reason_pl4.attr,
+	&dev_attr_reason_thermal.attr,
+	&dev_attr_reason_prochot.attr,
+	&dev_attr_reason_ratl.attr,
+	&dev_attr_reason_vr_thermalert.attr,
+	&dev_attr_reason_vr_tdc.attr,
+	NULL
+};
+
+static const struct attribute_group throttle_group_attrs = {
+	.name = "throttle",
+	.attrs = throttle_attrs,
+};
+
+static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	sysfs_remove_group(gt->freq, &throttle_group_attrs);
+}
+
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
+	if (err) {
+		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		sysfs_remove_group(gt->freq, &throttle_group_attrs);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
new file mode 100644
index 000000000000..d26d0072f907
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_SYSFS_H_
+#define _XE_GT_THROTTLE_SYSFS_H_
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
+
-- 
2.43.0

