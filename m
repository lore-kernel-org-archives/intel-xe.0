Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC7010E9DE;
	Fri,  8 Dec 2023 05:12:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02EB10E9DE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012329; x=1733548329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tM8ZsPFPNaT8vMTRhFZwet9zkWirJbrDI/de8Xazhts=;
 b=f6nuYZ4VOZLOH2cdtc3pE0m7XeAp1TxayPTXnsCNPK1TosvygZ4byV92
 yXYnurCq1NQtVes3ftglhGlrk8mKKyD8HmhfTukGeyUf4jlKZqkWqmg1Y
 e1qTW502HK4eQlnfFb9D8bRoEkOt66B4SZkwHy72ZI2mYRRi6jsmi3wO4
 RU3bzCZBf+tyWap3JQWa/fvZy9ii53/Qwq3RPBBBPCKMG16TujhYa0WJH
 IArx86sx7w3PlecWj3iQCyckDcxbWESNu6qX2cLXHZhikCXGuSFLEIEQ1
 EqgBkyAEan+PFt++dPR9OQnYdBGB5sOeJ8c4wFTohvJs5lK/tuv98kF1f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="374523144"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="374523144"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800984276"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="800984276"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:12:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:12:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:12:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuZNPZv3nULQLrQxLMOQ8umjZCUDeZovWEjGwDYzUKSsc98OHw7BFrMDO3w8WqIxA4Q65n5mFCCswox4kYD+F19qerEXNGqcFd/FccXMS5Y1FuP3zIXnfrw2oOlS3dAbG6tHEufW1PHm4tGdAq6M8U9SDhp+6iAIlwOFwiWXtx7T4xiu+8gAUF9w+wP2M5/wEzaHuQUwYPw5kaE63JFLdYY0KlYAJKp1yAQCq/BJzCEMo2/NrPi1MMHqHYzQU9nWRmhNQOhAv9A/RJ0l+e4NqbGCef+QrfKdTG5QOZbUEHkzG3I+7CEGoXJH28eUtIisNIFOABzJj4Vt+NWMoXSfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIwZUJI7RtU6z1EME3Tena7/xbhvunspR9qJt9x4S0I=;
 b=aM7ftv19NzvQHWljSoDJsLEwyzpU+C8+eBjpRpPIQZPpCTqbylTSmc4PhjpwK5MvBx+MlNRnfT+FePvW6Jwynp7lEAtqPSAcgSctiCG0b5+qn6movAQBLeOE8dONpIJPDEA6BL50a6jie9ZV7qRGr989oPr8vDdgqrw29adAjuLrRIJ5aTo5y9cHW/Y0OUrbivOBxTgmp7oVL9TF/ShYoNM/cxzY2qTmEmZf5gC+XY7xDvQ2Wr9bv1wz1SAMnNBsS+4nt7PjJWaGfDFPP0naVNV83nIHddDGtJERkN/P4d6F1JwKz+ZQIqn8xpP7bSFLApM2sXf94nmM62qZ6AV4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 05:12:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:12:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/xe: Add frequency throttle reasons sysfs attributes
Date: Fri, 8 Dec 2023 00:11:52 -0500
Message-ID: <20231208051153.664055-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208051153.664055-1-rodrigo.vivi@intel.com>
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: edd7a187-a49f-4f04-c848-08dbf7ac384a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRla8k6TjU9ypw38ad8hjJZpk6Q0Zj9HR/BkOR4rPQ1CaI7U+C/Syxb3reQtZa6AiwmdmERv7mP+bm+EuOF7ayRFotPEkloHKVYP8y3cFv+2To5wMwLKKYBoLYfrBTlT/KwFa3vAp9xC8Kx/xCQCMJkt0WBf2mg9C6dnNXLmEzEP5NqirJYu2tLuXVh++XL+iI7D7lHuEWKtuYB0odS46aP205HxWcGafguj1wHjwd5d2Hn8KCjp+Qi5pEsR5Hp7snL/CDsnpWerbnoPEgWG+m8GWsxXC/bgXfbzjKCt1YW/H0/guArPASCezk5Tmbvh8mZOycAwcNZtz0zCVV0Mk6rj9j8aigbhJnMsWhOQR7t+FD8RVPelCiJq5+GTerItcqD+YmzL41LoI7R6s/JsqtmziHdL5q5Cfhy3RmqczT7nODqWr5zBkOkNdKuYJezxAKrgn3JTCWS8zAB+NRXfUIHPkzK5Amq4IzDPWDOWTUvRMJiXYXM9VGVaqM+/JSbSKP9LFJSUy4TTf+jhpgOjNrS7ph2DNfDRnKOptWswrNqi9TTqMqHjcIn14PYKxWVc4nmDMjXEdHyS5e4+Bunb+y/H4vh6ZaN3J6TyzOGRyJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(36756003)(82960400001)(2906002)(5660300002)(6666004)(6506007)(478600001)(1076003)(26005)(107886003)(6486002)(54906003)(66946007)(316002)(66556008)(6916009)(83380400001)(8676002)(8936002)(4326008)(66476007)(44832011)(6512007)(2616005)(41300700001)(38100700002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkJmYVFQcG02UXdJOXlDVXlkSWxXa3ZBaHhseTd3dE1QQ2tVUFJ0QjFMbjQ1?=
 =?utf-8?B?ZXhDL1JMbWpmeCtIWDFGcjcwYWZ2R3h6SnZINVdneVpCZjBkWG1HS1lWTkRX?=
 =?utf-8?B?emMrQU1TNm96VFVCaG5kTXA2RlM5eUNFb1ppMXRYcVV0eEk0ZVlxTFlIbnFl?=
 =?utf-8?B?b1BrYjdNYmFvNzNkcUs4cmMwOGxFYVZzTElEVkltYnpXMlF5MlNxUVI0VTZq?=
 =?utf-8?B?VEQyZ3FBUTYvUURlUTM3MXRPbmRmWjdZWW82RFZHVVV0Zy91ZERzUkhPckdV?=
 =?utf-8?B?dTNUUTdWK05mMFcvK011NW9kbmFCWkxxM2xsTkl2aVVRWHdmc0lSRnBFTmJH?=
 =?utf-8?B?ZHFIb1F0eTdvTkJYU1BKeEhVRlhkdTJkRWpveGxSMGhEUkdReDVCczUxUVU4?=
 =?utf-8?B?ZVFRYzNGLytJRy9jL1J1cXFMMkp5YTlnRzZhZEFlaUw5emdIeG9SR3dIUnlr?=
 =?utf-8?B?dUUrWjd3UUJJMXZMVDlZZ0FYRjhIYnlHYlFBUHN6T3hnaEVad0VMWERNR1pz?=
 =?utf-8?B?emcrcXU5OWovWGVWbnR2eWRTMTRBZVhVNEpFYm1qaFR0dmdoYWZsM0p0Ymho?=
 =?utf-8?B?WUhySEtXenVzeXRyYWxuZlJadHRHZW5keGNxZS9vRHFuNHM0NzU5MmUyMTRo?=
 =?utf-8?B?SlFPQ1dSclovak9SUEtXb0E0b21HWENpQzJ3WjhHZEUvelpaeHZFVnF0UmVS?=
 =?utf-8?B?eHNocDVjQ3dmcDE1V3BLRVl1Q3ZKS2k5WkhRSWxDajJNdzRRM3hmWWE4TFRy?=
 =?utf-8?B?Q3BwOVpKaDRKektrajRTTGlqYlRNcmV2TEFrVllMU2h1d1YyaVVROWxvZUpy?=
 =?utf-8?B?MEltS1FjMkJ2OHdDZ1BKUzc1M2FRVW1BV0phcmRNcmgxOVdlUklmdXNJRndm?=
 =?utf-8?B?TGUzNUFGUmI3YVFlTFVGUUw3WTBSRHllZFViSzc5SFlCdWxBb3hHbS9HQmlF?=
 =?utf-8?B?eGxDUTNscE01b1l2bWxOMXBleDAramx0R0ZTVmlJWnBieGxEWEJOTmova3RT?=
 =?utf-8?B?Y25xZ0plMkVVb1pNcVJ3QzlSTVpJdFFKMFUwcVh1cU5xWjN1NGMvRmZ0cmVO?=
 =?utf-8?B?M29XcWdLYjJ6VzdBYkNORVNlUVR0TWkwaXhEU0lwc3VXZWJ2NXgrZi9qZDlZ?=
 =?utf-8?B?aUsybEJWRzRMTlF5a1RiWTlSbWhaQUFrRCt5aGhrYXIrWGUvemg2ZDNkc24z?=
 =?utf-8?B?WU0zSVF0MEtNTEJnTnhjZ21tWHJld2JjUCtwcFdub1ZVQjVaYTA3U1ByOS9W?=
 =?utf-8?B?cGRMWlJHTVdLbEdSaERQNk8rcDhYeXg0aVdGeGhxbWp6QzBzRnowUGovS0hl?=
 =?utf-8?B?R3I5VWtYT1ZCaTl0NGxxSjRlZUE5bXVWeXRxK0dKbXQxQUJTbHk1ZkN5QVVp?=
 =?utf-8?B?SnJEYXFSeWdhOGlzVUJsS2F6MCtQbGwvQWFURmVPYjJkN044Q2VrWmVUUmp0?=
 =?utf-8?B?ZGpiVDgzaEVhSkpBOEl4UmRkMUI2bllBenlONmVuajQzc01qU0ZaWUV1djJr?=
 =?utf-8?B?MmU5V2tYZks1Q3JCUGdjVlRiRXRCaWsvdDdSNlFRWHNRV0dlME9DOThXZkxv?=
 =?utf-8?B?SXlMdUlrSVR1ZTNQUU9UWXBVY1I5Ujl0Q1V0Z1Flb0NCaGFyZWdvT2dwUEFM?=
 =?utf-8?B?TktMTFZmM3pwRkVIaW96dklBbmN0dUJLNXA1T2VvcStaZXlieGRIbzg0R2tu?=
 =?utf-8?B?TW9KUlNxWVNSaGpuZG4vSnFEL2g4TDhCTVhJRWgvdVJUelVMUG1rODBoSlR1?=
 =?utf-8?B?cHNMUXVnY3laMEpMV1gwdHZ1NVVUOFBWdVFaSDN5VnozSlhKb0xKd0xOR0RT?=
 =?utf-8?B?VWFTc1ZQVnBuQzd0MlhQcEFuNjVybVU1ZHp4SWlBcTBsQjZrekJaK3JZaktQ?=
 =?utf-8?B?dzNaWUJuZ1YvMTFlL2M5b1QwK1VKM3N5Nm8zc1VSK1o4eW9uTXRZZFE3dzB0?=
 =?utf-8?B?Nm1xaFFYUjdEWHIrM05YS2tDeWZPcHNJSzMvb3VyckhXdktabXZGVnlhTHNu?=
 =?utf-8?B?SGY0T2xkMnI4M3lweVh2U2pWSVdkbTl4TXhqZ0U3eUZkVzZhQklJWklpenZr?=
 =?utf-8?B?YmNJaVRhTXRXWFNaUDhJYmFQd1M1OWdnVStsQ2JvQnk3STBnd3RWdmNJVmRT?=
 =?utf-8?B?M3M1eXNzc0VZNXZ1dmkvWXp2dDFLd05tUkNHR2U0OUwva0JHY0Z4L0xxQnY3?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edd7a187-a49f-4f04-c848-08dbf7ac384a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:12:05.6231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaHFu3tGIumQ84S56c2winDsVAVNzI/SMcwMl2TupndchXzfV5X4ZZq7cI88HicD3fES1GlMnefbrnLIqPHuJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

v2: Remove unnecessary headers and clean-up action (Riana)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 ++
 drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 251 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
 5 files changed, 283 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 232627e0946e..d35548e437f0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -78,6 +78,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_throttle_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9744ed0be3a5..5f5a72e9d0d8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -478,4 +478,16 @@
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
index 2c3830d0e9e5..08eabcafe7bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,6 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
 
 /**
@@ -213,4 +214,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
 	if (err)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
+
+	xe_gt_throttle_sysfs_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
new file mode 100644
index 000000000000..63d640591a52
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
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
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
new file mode 100644
index 000000000000..3ecfd4beffe1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -0,0 +1,16 @@
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
+struct xe_gt;
+
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
+
-- 
2.43.0

