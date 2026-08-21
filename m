Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D774C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 09:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEB110F29C;
	Fri, 21 Aug 2026 09:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UplBKg8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811E210F29C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787305598; x=1818841598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LHrFA6NysHbPhNoiLYUQcdk5AbgeppliulSskKCzVGs=;
 b=UplBKg8z9ceqAXZEm7PyYD1QfJQHOzLzsHqze2+NSHmxYuDXLte+GZh8
 1skbWahdHMVMgO6FQEDSi1F0CBIbVOqI/TkeKw8Z05PW06KBF09PtDXiG
 wQDaL53QxSbmmMRulj9Uhy/Byw/cc62ccOdRgSFBzvnLUO8UtXonpfveQ
 XpyA0VzFTFDSc3PwTqGvdAV0PoIaqiZikQbbyAl8g8kcc2CvlXE2krLcC
 NIZq6IOEFgJxU0CwpQV0Iz1BsYVvfGxwCLmQaEQcAVI1g8CdnABtm/x3K
 G2CaGJYg36JnBuloa/Hfp95u2mt9SjR5GjZ8fggLCyyr6w/GKbhhhWdUh Q==;
X-CSE-ConnectionGUID: 4G9V0kaVRIK6NlZRbdzmJA==
X-CSE-MsgGUID: KpYlMsjpTYCaje4hqnv0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="88055712"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="88055712"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:37 -0700
X-CSE-ConnectionGUID: 1WZjeCTHSu6q20LT889Thg==
X-CSE-MsgGUID: 4oMUVQrTRqKv5LeGyuZdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="262018434"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 02:46:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 02:46:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 02:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlbsHdKtx/Xu0wwochalbs7JmPnUOa5EpolDoN88An244iwShCkiYBrGdlAow4ZLwQ4nYFnCmN1FXwPOpAXT4f02LXNL+93kxIgzwfu14pQd1l1hm3fcfZQfaJbPvhBCdPkbd5WtexbL8pC1Ufmv9z1rBaMgQ0EkCKF5ktml3AZgCOTYgTFNsaZm3zNuDurarLnw6xubd0ncOIyQL/Nin3EkxbZZTa/Wd/qmM6GO8aot6S3BhfrRwqGUxa3PYkSbwpD9TXc25XdEw6rW6GHllUI+k8VrzkNeGq3BLG+WKG1dsZNN+Yb7bWMjslvWAgKgq7+35DcQ+oTNJf/rNQn6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cufz27JkokYZ4zp/+EYqRvTD+0N0hpoxsr45VAS4lEQ=;
 b=r2s9e6IYpIaTNmT7r0Ub93lpaEDpNs6HxQDSh07W31Ecvn6C+CCMYQKbEEWxc6Bn8wN1SPdv3C2yi1jAdSIInZfzskNi8Xvv153tRynM1rYTEy9h9iddV6VgDuYWCNZQAlBx5LHZcpxcIz5dqykGofjQeHcjr50iZYtqDsUmyJNN7HrEkuprQbPLyZKD1uEcmwD+L/mqNR7av/myRPtDJavWLN6qZJw8WFlJnHKspehGhyNYkO4MoQVy09ji34xx26/zQj4E2lT08viU5XT3hmoT9Wy4tNAADc0HIoQIPeZTFybCB8Q0cXS4sIaCBPCdutEEHu94T5TZBYUonQPhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 09:46:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 09:46:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 4/4] drm/xe/kunit: Add tests for PF-mem regions
Date: Fri, 21 Aug 2026 11:46:01 +0200
Message-ID: <20260821094601.607060-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821094601.607060-1-piotr.piorkowski@intel.com>
References: <20260821094601.607060-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0027.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 467860f0-de6d-4831-e029-08deff691583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: EB5mVqAKgQ168MgQF3zaRzhef3eGiN7DgUOaGriX00sPqDHxwVsSvzwrCTXjfdeSkflnz8kGEkpFwdWa/XzXnj61jwp4jy6x9dXWMmY5MSi2lXYPJrvvX02GuTveBxd8PJa1W2EwBvYTuXtsVhwe5rcc2xyWNWS9UvMJ6U3GRN+q62SaKUzM86dST2GRCxcsMVBrRfg89jtcvrWukhjOnni8QJbR4B8j32SBTls1pIna0AOOdDsRnmUNViWEHHE+HGjCpMDc3RZ3vEieskWTmlO7F0R7qN4eWpwpdsSraSA9dZkTt68RLjc1d1KjuUv9qsFasNorILM7OivLQBxVY2HhFl2RDhUN/urvgGau/E8Jwx2voGMmKXjBluH4LLHY9kyudVoxqGlTfOISH5tK0ASq3kuQve9O/0+CGKpNWt3SMGMHo3xS4SzfYKs3l9YvWhYMb/mDEFat1+kgJS7Iitr9uNAO7WwqVqs9xLNKbrBAIXUqs7WdA9xZTFTXScmKKeEZTWRl1UNekYzu1vYj0b2b7O1/+frkkIIG/1QNphPyZouVhXt/U3S0iJ/eIaqfQ6jaNdcTpEyvtzS0v6IrsCS47a3zru7prQLMfYq6LfMBhj5sICEuVq48Sei4GyDd8jzXmTjhI0vSuh3NZT2BCrVd1EYc2OZAl+x0Ez4KRIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlPU0U2NmpXbEEvaWVmK3NNeDdTQzVDTmFjYTdsTGM1RkU2Z0I0Y2ZjYUI4?=
 =?utf-8?B?VVlEZGYrM0Q2V1Y5cGtkUEp6TGh4U09FdmsvSENtU0Q3ZjJoTDgvV2dDdUpP?=
 =?utf-8?B?eDBuTFFpdnIvN3lJK1A2UmdMdlpBQ3Z2bzBpL3FvSm5lVXl4Zll1dklySjMx?=
 =?utf-8?B?WStYYzRyTHZzVDZmbmsxZGovQWtJcG5oSFBocVBtK3Rvd25oY05VTkdOYVlG?=
 =?utf-8?B?TnROaksxUmNKd0xheDRVY0QwTmNDOFd4ZDJuRFBsdmtkNFF0dDNJVHdOVTM3?=
 =?utf-8?B?UFU0dUtQZW1jTUw4NWtYMEIyZzdtdTdNdDBHUmxTVGZpKzhWUlFmQnFLcEtp?=
 =?utf-8?B?YVZKWGV2MVI3UmUyNEgyNnlaVHNvL1FXV1lNWFh1cjF4YXNzM05HeGtRQWRG?=
 =?utf-8?B?Y0NpY2FYMmNOUHRoT3UrNGdnUDF2NVBqZTNTQWZWMGZDb3dKckRIT0NDbTFQ?=
 =?utf-8?B?cHI2Q0VKc1dxTTlESStENXRvdVZqVjZSMU1jRFpFcDJ5V3hjczRRQ1FNVHoz?=
 =?utf-8?B?U3ROTDlSelBQaXZNalhSYmtsM1piOVU2NFByQUY1WnhUSllRL0d4eVFnOC9J?=
 =?utf-8?B?bXRjeWdlMEhUT2xpbDZqb2s2bk9ZR0syb29Ua05ScW5BSjFMeExIY2JXVWFS?=
 =?utf-8?B?Yk0rMlNWY21KeXoxRkM2Z25wMUhkS29QTU9VUUwya0JNQkNadTVTQTk3STdH?=
 =?utf-8?B?ZTdFQUMwODYwUjhqN1N5R04zTUZOeU1QVzVUbktQUlRxTEJkNHVMdTd2aHRK?=
 =?utf-8?B?aXBSNVhLTjFiZjQvM2hrWUo1RHVPanhMdHNXaGdLY3NncitXN1B5NU9hMWFh?=
 =?utf-8?B?Q09rUzl3VHR3V01GWkhCU2lhNVVjbmFJWk9JQWM0WlFKT1VpTGQzYlc2bkR0?=
 =?utf-8?B?Z25KRmlVRUpTWkNlaWMxaUJac3hoRGI1MldQaDNKMlMrVU5QTE9WNnd3ZE1I?=
 =?utf-8?B?YTMycy9kTUpwYWNna1VrUEhwNzAyRXBSTG0vSlJxRW90TWV4cFZKSnFpd3cz?=
 =?utf-8?B?Q0g1M1Q2NWlJbUJ3THJ5ajd1ckkyaDlpQ2tpYWl3bFk5dnhOVy9JWll0ZmJ5?=
 =?utf-8?B?MS9DZjhpQVVpZzkxc1UxU3hmY0tBNDIyOUNGdlVUN3QxbFlGbnpWK0RObTM4?=
 =?utf-8?B?RmxGVFd2Y0wxd1NKZW13b3NaWFpRTit4UWpsNFVCOEdaYWtsZml3Rys1Tm5o?=
 =?utf-8?B?cUhlZUhMNHk0UDJhbUE1bEJHU1FKODAycTkreUxLQlhldmpPZUZiang2dmIr?=
 =?utf-8?B?WVphQnIyaVp2Q3pzOXg3ckEzZGN0QjQwSWd3eTNpeXFkN2V5VnZtSlZrc3NJ?=
 =?utf-8?B?RVkyVk1sT3Jldms0KzRVUEVlVWgxMXIydVIzNUcxN3hrb2dIbkRKYUZHbVJC?=
 =?utf-8?B?T3NLL3VST0NWNnJIZVJUdVNvQ0hhakRUeEVsVUZlZHBkZVVXaHFCSnM0V25V?=
 =?utf-8?B?WXdNaDBsV05ueVAvRVlYYWVJNk9mSXlhMjhtb21DcTdHRnFYNTlWRDJoa2U5?=
 =?utf-8?B?L0pWMzRad3NhNXlOay85VzBLQkdrdE9oK2FwamxtSTlLdWl4T1Ntd3RGQUFM?=
 =?utf-8?B?ZFZ5TVpBcEVDdGh4aldreWgzUXlOM3pEbzlXQ21zNHQzaGFYeGxXVXBFV3Vq?=
 =?utf-8?B?cDYxMzRsN29sOGNXWENudHNNQjJtT29GaVBFZmxLRisvd0g5SHNqZkRHWm9U?=
 =?utf-8?B?M2RFTXZhNm5seDJIQW1GUEpmS3BUNkNEeTRyalpBd0JrdmJXaG42S1V6TFdB?=
 =?utf-8?B?K3JDd0xjek9EZHVybXdWeWNRVTZvbjI4Nll3azNqa0VXekR5TVZvVVVvRHNw?=
 =?utf-8?B?VGVsaEg4TGVibGQ2bE1LWHFwT3lrZ0RnRnZVL1FiQzJPK3MrbTNNY3hSZlFq?=
 =?utf-8?B?RzgzTkhWcElVVUN0MHYrd3E4U1dLMjJaekxTK3NvV01jL0QxWCtSelRJMU9o?=
 =?utf-8?B?eUFnSE5XYmJKU0V3bmxYYXMyaW9rWnQvQ0lDYmtNMEdsMkw0dzljM3B0elRy?=
 =?utf-8?B?U3hUS2lBdC95bXgzMzI5aUZLd3dMaWFkNEM4anUycTcvelpnSy9oK044RzJR?=
 =?utf-8?B?WE8xaFJleFNsQUF1QjZ6L1lxL2hNVmltc2VVL3V1YjN6RVpaWHVOSXRNZFBQ?=
 =?utf-8?B?WEk4bnl3NDZON2hMaUtkMjZZak10MXNoNjR0ZjA4WnU3Z09vU3Y4Tk9oZWty?=
 =?utf-8?B?S2o1TlprZS9jK3Y1bUtGWnR4LzcvVFg1Ynd0dFdjOVRSR0MwemVyT0d1K1Z3?=
 =?utf-8?B?WmtZYXp5c3VxRFNEeThrQ1ZWYmlIdnZzMXhqZDBIcjNTOXRlZGJ6ZURqKytB?=
 =?utf-8?B?WDRCd0ZVNDA1ZUJtbnpXeC83ZUUzVlowQk1zNnIxWHpQN2pHMXNuc05KMzkx?=
 =?utf-8?Q?ZKcNV6qy4MsBbtN8=3D?=
X-Exchange-RoutingPolicyChecked: ImDK2INov8R90xqh42C1tgzIsleW5G5fiXerqwjOI1idUE+MYFskyZXVs7pNP1j1zLhP+/F1scb0oKG0VxZx8KsLUcZ8WERh/bHC97uSB9bPTdh95GCdDPPEGe3qF2JhB3i9i/HrKsFapeIEisaycZVvmgQvMcriPvrs9Py3tLpEeqYCO5fsCKhDl10gyRRVvja4BhRUJFx3UG3qQmKA1iF6e+kPhcLElTSIN5yTziPfIc9lMGzJtNA5GQp3fTDm2ilF1LG0sqC919dO3aI/ssJoaYr9QRGbUGydKWsgQ4q/spVHSFN1YTWcj1OBSMvUvFQUum/3nDc3IFLH7mPjpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 467860f0-de6d-4831-e029-08deff691583
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:46:33.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2Zpe/W5Ls4saAUFLS0s88dPWV8avOSA7kYWjNDszuC6mJ3KUinhzhOZCvptTZuLDR0wIQjlqaSz3+hUrVJaF2gNWhZfq0R0AU1THSxPfCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
X-OriginatorOrg: intel.com
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add coverage for PF-mem VRAM region metadata, bounds checking, and
full, partial, and missing CPU visibility.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_vram.c | 115 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.c       |   4 +
 2 files changed, 119 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/tests/xe_vram.c
new file mode 100644
index 000000000000..36a49fbef220
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_vram.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+static int xe_vram_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.platform = XE_BATTLEMAGE,
+		.graphics_verx100 = 2001,
+	};
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	return 0;
+}
+
+static struct xe_vram_region pfmem_parent(struct xe_device *xe, u64 io_size)
+{
+	struct xe_vram_region parent = {
+		.xe = xe,
+		.id = 0,
+		.io_start = SZ_1G,
+		.io_size = io_size,
+		.dpa_base = SZ_2G,
+		.mapping = (__force void __iomem *)SZ_4G,
+		.usable_size = SZ_64M,
+	};
+
+	return parent;
+}
+
+static void pfmem_create(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_64M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_ASSERT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, SZ_16M), 0);
+	KUNIT_EXPECT_EQ(test, vram->binding, XE_VRAM_BINDING_PFMEM);
+	KUNIT_EXPECT_EQ(test, vram->placement, (u32)XE_PL_VRAM0_PFMEM);
+	KUNIT_EXPECT_EQ(test, vram->id, (u8)0);
+	KUNIT_EXPECT_EQ(test, vram->actual_physical_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->usable_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->io_start, (resource_size_t)(SZ_1G + SZ_4M));
+	KUNIT_EXPECT_EQ(test, vram->io_size, (resource_size_t)SZ_16M);
+	KUNIT_EXPECT_EQ(test, vram->dpa_base, (resource_size_t)(SZ_2G + SZ_4M));
+	KUNIT_EXPECT_PTR_EQ(test, vram->mapping, parent.mapping + SZ_4M);
+}
+
+static void pfmem_small_bar(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_8M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_ASSERT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_4M, SZ_16M), 0);
+	KUNIT_EXPECT_EQ(test, vram->io_size, (resource_size_t)SZ_4M);
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_8M, SZ_16M), -EINVAL);
+}
+
+static void pfmem_invalid_range(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, SZ_64M);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, 0, 0), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M + 1, SZ_4M), -EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M - SZ_4M, SZ_8M),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, SZ_64M, SZ_4M), -EINVAL);
+}
+
+static void pfmem_no_io(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_region parent = pfmem_parent(xe, 0);
+	struct xe_vram_region *vram;
+
+	vram = xe_vram_region_alloc_pfmem(xe, 0);
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	KUNIT_EXPECT_EQ(test, xe_vram_region_init_pfmem(vram, &parent, 0, SZ_4M), -EINVAL);
+}
+
+static struct kunit_case xe_vram_tests[] = {
+	KUNIT_CASE(pfmem_create),
+	KUNIT_CASE(pfmem_small_bar),
+	KUNIT_CASE(pfmem_invalid_range),
+	KUNIT_CASE(pfmem_no_io),
+	{}
+};
+
+static struct kunit_suite xe_vram_test_suite = {
+	.name = "xe_vram",
+	.test_cases = xe_vram_tests,
+	.init = xe_vram_test_init,
+};
+
+kunit_test_suite(xe_vram_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 408733c01d4b..dbe6b33fbaf0 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -459,3 +459,7 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
-- 
2.34.1

