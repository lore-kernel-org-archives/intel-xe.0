Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748AEC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286B10E550;
	Tue,  5 Dec 2023 21:37:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD210E64B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812230; x=1733348230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ODTkBEM78xiG+zEh9SK422NtUOEjStjfH/MKJmE1JMk=;
 b=C/JQ8M6TEYZsE9Y13oUe54HjQhrvkdqek7Yl1t/bir2ADZzYr7iOqjdG
 kxX6pnJjT/hI9QEXYStte6MLxEAqnuJzBchBB/wLR2DYSHiukK1C99fKB
 SScSSO7fExJXmjYjCBOr6ZDsyeUZdkEqS3HRcUxL08BnMLOrbaL4YIqdt
 tocuHr3UIMKp34qOa5y520Km8Kk3YdNCoPdQIFzLX7kqgNjYDL1Yny5n5
 /fbiMPBW64+lxRV7Cptx0MmMYIBhHc3p+oJodSy+osPKcTU3Ro44J0uhM
 nW84zyogQ2+qKjXwdnoeFnswyiTzNGyauJ9DzfYHKIk5zz3aGh3wB2GSR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458279171"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="458279171"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:37:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="720855385"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="720855385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 13:37:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 13:37:09 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 13:37:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik74icxUkfhAdASmDtT1WD3Z0N7k5GHjgfozC9mNVWtprmdPo4wgTJKSvsla8fLswsji4+GK+I/+2rt5tYfIru+s+PIGywZiYRB/zG1vRw6Mw4BoGOT2JbqWUuXeMGalaz2YY3FjdlJwAtfINqZk4GFm0tS2OJRneu+DQJWhJ/kz4qZbd9rqz8pHEKn0WJPy3JeJJZVGx/kdhlKnXk7QCjD6oRBZJPGuL4tun00HfvZp/Jh14A7wWHDu+NHLJjRKOpIxziXIiWTkjW1A6uS/+lX7HD+Vn3zmN2X1zHS7bHjwTEFs0cBj/OEBVGixH4ZhDNfXYEmJWMxhJrSPGgg4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zi+PE+dFP+mug0wR6qT7i+6uif5KUldJV4pcsw7Ato=;
 b=Z5VRD7RWv14Tii65164FmJPQo3ikyQYzXEUVyzQjybUgVmJdEraKiKDOgg296YHLHVv7Swg47FiCqljbGhSmtMEU7WSIb3ubZ47+MM6sfa4DUKw9sInL6JTaKaURhe3R7E8iw89VlFczZiPAYrKOFyKtsLoj0jc7Ka66f8agdCFKrf203TjXR1LsZa92hO3bXIfPpOrM7TnKRRX2QBFVMVIE+KAdN33ZftmLnN2RO5aChBEJBC8ty0itFwyn5Nh1T420uwTXzIWp+npQCgu+QyFJKqqCEera7ixcoi1fiE39KFhyVnOGRrnwFNkT2m7xs13DXhZ2fsabS4lvIT0q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 21:37:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 21:37:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 5 Dec 2023 16:36:56 -0500
Message-ID: <20231205213659.179813-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205213659.179813-1-rodrigo.vivi@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cd6bf0-baa7-478d-daae-08dbf5da53e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMD+wzWKwqINTrHOFNzaBs3pgWMWtLVfGFRf1gRfVQ/Sj9iCNMrbyspceBvw094yZsK7FTC9zANTB/H1W/QIlPYMNTP9FAgeE2nb48/oc2xbAqr9HiBj3P0EOPfpz71EtvWlvRQRmLkJ46T/X4G6AyLcGdkeN5nn8FVEucjOQmYkW85+lQPxv7YPE+hHDg/LijWzI4axOXlINbTRIlgLSzXhzO/4BKkCyC+43vS94uNEi6YjTXGTFT8zTEH/A3+SaGqXsc2GDVVzbNDIZJoWBywfEJg8NtZ2QvSNsCvWmuKg2E1+gn4pOZZP97BVBurg/m2NnP5cG2wB4y2tkQR9NfGe/h0FmaoKW7Ni+S+Wdo431steN7lI8aZ/H/Ti2/kBxDaB6/1ZERvOztqWMEJ9ginDwlELx4V7zq/ECrlVCZOQnT8L7/C4PAyaH2Cb/P+G7NIdPuC0ys6sbBPEMnCHo+AVL6H0iHWRLMu1lYspxx2eLnhied8ifCo8o03hKHcsJSqK5V4uTX7TNmxpS5cTOVO3b75OeSKh2H/GpimLUujWCvIETUl52FWy+OmC54yV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6486002)(26005)(478600001)(83380400001)(6512007)(6666004)(1076003)(6506007)(82960400001)(36756003)(2616005)(107886003)(316002)(66556008)(54906003)(6916009)(66476007)(66946007)(38100700002)(5660300002)(4326008)(86362001)(2906002)(8936002)(8676002)(44832011)(41300700001)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWxmYlovM0FBM1MrV3VRNkdHc24rNzBQMWRubmJpd3ZXNVB5L2hsYWQvMEtH?=
 =?utf-8?B?WmNsQWE3dSthSUNsdXBJbTBMNUEwelV0VjBrMnFKMlM1Z1Y5YUJ5N3NTTXA2?=
 =?utf-8?B?dFNtdVJPd1lwbFYrMTZTa0pZTk84ZTVydGFaN0tnRm5RM2k4dHZ6OS9oMndQ?=
 =?utf-8?B?UjZVbU1qbUZQUEZkeDl2Ti9MMkFsbFNVT0RJVitnOXJjN1F2blJWYlViUkdP?=
 =?utf-8?B?OWN5MVN1RjlJalJSK3hLdTc2eGY2Q1I2cGwwcXdGbGNCU21BU20rUFFON0dh?=
 =?utf-8?B?RGpjOEZ3bCtkUGFDN0VTYWVnamdMR1NsbzIxZGFkU3pVU0xJUzJCck9YblIw?=
 =?utf-8?B?bExZZFVTdWRIemFvNnd4d2JaT285UWNlMlZjd0laREQwMXFHdlhCU2lJUGxP?=
 =?utf-8?B?VjJwMFVsWTQrY0ZlbnUxenZDSXJRR3l0QVE5cythcUQ5Q29GSEtwS2d1SnRp?=
 =?utf-8?B?RHlMY1FVcDFqVE1LTW83UEZoZkRYSWRzVUdFcXZva0tOVkp1dWp2VnBxay9J?=
 =?utf-8?B?K1JLbDkwVUFGRml4MTlGTitOcEZYYzJZd01VNVBrSUN2Vk9hZTR2eTB6cEV6?=
 =?utf-8?B?TkVUblNDb0oyWlZGV0F5MUFwdDNlbkxOMGliek1DK08vNWFLMkRHVkJ4NVR3?=
 =?utf-8?B?YUoveXVNdHV4bktUNTZ1Z0NGY3hHQnN1VjRpVEdUZE9sK1ZxZEZKcWtVbjVI?=
 =?utf-8?B?emZwdW9lMldUYkEwMno3Z09VbG9wQzcxQVE4UUYwcFVVbDd4MS9Dd09HYzhP?=
 =?utf-8?B?RkN6TGtrRE92MHRjb0M3WVl0ZndYdmQ2ejZWai9EVWlRc0wvcjExdDNxT2hi?=
 =?utf-8?B?ZFVMd2ZlQy84ZzZ1eVczZldWNmcwRURmdVNxa3RUWTgzbGxQRlZlcU9HOWJh?=
 =?utf-8?B?M3I0dVhXYVJhK09SbWd5anQ1WTBPVnFZYXM4aXo3dG5iVDNmVU5PTDZxZ3ZI?=
 =?utf-8?B?eXZscU5FMWRiU0hwbTJDSmhEeXR4NUo1NHBTZW9XUjJoeFpldDNsNUhoTFg0?=
 =?utf-8?B?VE1MT3FIOWw4UzMvakFIMDlUTHgxKzlRN3BGMExtaHBlRFA3Q0hPVFY0cGhU?=
 =?utf-8?B?azg1a3JCb0k0bmFKTklHL0hZYStINzZJd3JXaTV0dTkzTXpwczMvelB5bDJW?=
 =?utf-8?B?N24rSFJkcVJWTFBoZjhlclJNZW9nK1hRN0VHQ3N0ZlJsT1A3V3pUVkwyei9H?=
 =?utf-8?B?WHUvZFNQTVFnSzZlaDRRRnJkalVtcERzYnBwVGdncWJ1Y04xRTZkRDdGQmtm?=
 =?utf-8?B?YkNTMXlLbHpNdE1rL2VrY0V3a0NIb2lxcDBWMFRoSmxxUFpyYnhoSDQ5S29s?=
 =?utf-8?B?MWtvMHY1ciswbUlZZ1NDRmZuaWx0bGdaNkNaM1hzYmw0elllbXhCRUlTMzcr?=
 =?utf-8?B?amN2T1NxV29yM2RWbmhXRjJOM3lPVHQ3dUs4T1d2b1p2L2RVWHZJL3hFR3Q1?=
 =?utf-8?B?TytnNXNKdTY4Nk9kUDRZeitlWW9wcjgwTWZqWEErSzRBMlo2L1lab1BzbXlD?=
 =?utf-8?B?THA2aDZqcXpvUXo5TUZLK1pjSUtmWWhrNW9jZkt4TTZ0QWk4OW9IVUR6K0k5?=
 =?utf-8?B?T090VzgzdUZVL0dmaytJN2MzYk9BUFkwSkNMVHpzZGx5SEx1bW5PWjR3L0Jy?=
 =?utf-8?B?UXZVN29tV1RpRFZoZ3YvWnd0NUJZUUNkZjFlSmU2SzQ4NS9Qb25uV0NwOWN2?=
 =?utf-8?B?UXJHVmFUOERsM2lGaW1BbUZxQXRQQ0JLQzg4VnhGMXh3TnFrMUxTN3FiU3F5?=
 =?utf-8?B?ZXlyMnQ0Skt4WTY4QzRwSXBEZ001YnlnY1FoOGxyS2hZdUlINTBtN3Vhd2Nl?=
 =?utf-8?B?V1VNM1FRNVNMc0psZ2JNeS9YT0h0UldsRFNIUGZWeFVlaGJXUG5Ib3J6ckZn?=
 =?utf-8?B?R0xGVW1OZm0yMytjWHIvMUozR2lidlhjellIcUNTbm5HbFJqYUFoVW5NSDVZ?=
 =?utf-8?B?amp4c29SUU41TC9VNUdjUm1HTjA0THV5K2N6QnY4SnYvWWFBTHZOVTVBZUZ4?=
 =?utf-8?B?S1A4WlZqZXgzVmJjMXI5WHJSSytENFhkblRrS1U4ZEpLcjJXNkJoWkN2YUQx?=
 =?utf-8?B?Q3M4OTZlWndDTDJyWkFWWVRjYW5CVFVqSlJNdUVZTHM2VUdwaDBOcGFwa3lN?=
 =?utf-8?Q?gNLhLlEtEqX/TdXiEkKDzkUDd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cd6bf0-baa7-478d-daae-08dbf5da53e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 21:37:06.6376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axeaBINc6Ot+gHTd9InCCxrUCfUBO889Iy9044RJPaRg9hpCtyaRTELlc7OGNhgNmxBuV6bWB1auC7icid3glg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Create a xe_gt_freq component for
 raw management and sysfs
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

Goals of this new xe_gt_freq component:
1. Detach sysfs controls and raw freq management from GuC SLPC.
2. Create a directory that could later be aligned with devfreq.
3. Encapsulate all the freq control in a single directory. Although
   we only have one freq domain per GT, already start with a numbered
   freq0 directory so it could be expanded in the future if multiple
   domains or PLL are needed.

Note: Although in the goal #1, the raw freq management control is
mentioned, this patch only starts by the sysfs control. The RP freq
configuration and init freq selection are still under the guc_pc, but
should be moved to this component in a follow-up patch.

Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_gt.c       |   3 +
 drivers/gpu/drm/xe/xe_gt_freq.c  | 217 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq.h  |  13 ++
 drivers/gpu/drm/xe/xe_gt_types.h |   3 +
 drivers/gpu/drm/xe/xe_guc_pc.c   | 197 ++++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc.h   |  10 ++
 7 files changed, 344 insertions(+), 100 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 87f3fca0c0ee..3bca43cdbe3d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,6 +72,7 @@ xe-y += xe_bb.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
+	xe_gt_freq.o \
 	xe_gt_idle.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a9c71da985d3..38a1e9e80e53 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -23,6 +23,7 @@
 #include "xe_ggtt.h"
 #include "xe_gsc.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_freq.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
@@ -494,6 +495,8 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_gt_freq_init(gt);
+
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
new file mode 100644
index 000000000000..769d59441988
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gt_freq.h"
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "xe_device_types.h"
+#include "xe_gt_sysfs.h"
+#include "xe_guc_pc.h"
+
+/**
+ * DOC: Xe GT Frequency Management
+ *
+ * This component is responsible for the raw GT frequency management, including
+ * the sysfs API.
+ *
+ * Underneath, Xe enables GuC SLPC automated frequency management. GuC is then
+ * allowed to request PCODE any frequency between the Minimum and the Maximum
+ * selected by this component. Furthermore, it is important to highlight that
+ * PCODE is the ultimate decision maker of the actual running frequency, based
+ * on thermal and other running conditions.
+ *
+ * Xe's Freq provides a sysfs API for frequency management:
+ *
+ * device/gt#/freq0/<item>_freq *read-only* files:
+ * - act_freq: The actual resolved frequency decided by PCODE.
+ * - cur_freq: The current one requested by GuC PC to the PCODE.
+ * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
+ * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
+ * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
+ *
+ * device/gt#/freq0/<item>_freq *read-write* files:
+ * - min_freq: Min frequency request.
+ * - max_freq: Max frequency request.
+ *             If max <= min, then freq_min becomes a fixed frequency request.
+ */
+
+static struct xe_guc_pc *
+dev_to_pc(struct device *dev)
+{
+	return &kobj_to_gt(dev->kobj.parent)->uc.guc.pc;
+}
+
+static ssize_t act_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_act_freq(pc));
+}
+static DEVICE_ATTR_RO(act_freq);
+
+static ssize_t cur_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_cur_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+static DEVICE_ATTR_RO(cur_freq);
+
+static ssize_t rp0_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
+}
+static DEVICE_ATTR_RO(rp0_freq);
+
+static ssize_t rpe_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpe_freq(pc));
+}
+static DEVICE_ATTR_RO(rpe_freq);
+
+static ssize_t rpn_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+
+	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
+}
+static DEVICE_ATTR_RO(rpn_freq);
+
+static ssize_t min_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_min_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+
+static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
+			      const char *buff, size_t count)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &freq);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_pc_set_min_freq(pc, freq);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(min_freq);
+
+static ssize_t max_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = xe_guc_pc_get_max_freq(pc, &freq);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+
+static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
+			      const char *buff, size_t count)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+	ssize_t ret;
+
+	ret = kstrtou32(buff, 0, &freq);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_pc_set_max_freq(pc, freq);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(max_freq);
+
+static const struct attribute *freq_attrs[] = {
+	&dev_attr_act_freq.attr,
+	&dev_attr_cur_freq.attr,
+	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpe_freq.attr,
+	&dev_attr_rpn_freq.attr,
+	&dev_attr_min_freq.attr,
+	&dev_attr_max_freq.attr,
+	NULL
+};
+
+static void freq_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, freq_attrs);
+	kobject_put(kobj);
+}
+
+/**
+ * xe_gt_freq_init - Initialize Xe Freq component
+ * @gt: Xe GT object
+ *
+ * It needs to be initialized after GT Sysfs and GuC PC components are ready.
+ */
+void xe_gt_freq_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
+	if (!gt->freq) {
+		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
+			 kobject_name(gt->sysfs), err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		kobject_put(gt->freq);
+		return;
+	}
+
+	err = sysfs_create_files(gt->freq, freq_attrs);
+	if (err)
+		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
+			 kobject_name(gt->freq), err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
new file mode 100644
index 000000000000..f3fe3c90491a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_FREQ_H_
+#define _XE_GT_FREQ_H_
+
+struct xe_gt;
+
+void xe_gt_freq_init(struct xe_gt *gt);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index a7263738308e..4d24d0e78e6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -299,6 +299,9 @@ struct xe_gt {
 	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
 	struct kobject *sysfs;
 
+	/** @freq: Main GT freq sysfs control */
+	struct kobject *freq;
+
 	/** @mocs: info */
 	struct {
 		/** @uc_index: UC index */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index b1876fbea669..2bdabbab2d7a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -57,19 +57,6 @@
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
- * Xe's GuC PC provides a sysfs API for frequency management:
- *
- * device/gt#/freq_* *read-only* files:
- * - act_freq: The actual resolved frequency decided by PCODE.
- * - cur_freq: The current one requested by GuC PC to the Hardware.
- * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
- * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
- * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
- *
- * device/gt#/freq_* *read-write* files:
- * - min_freq: GuC PC min request.
- * - max_freq: GuC PC max request.
- *             If max <= min, then freq_min becomes a fixed frequency request.
  *
  * Render-C States:
  * ================
@@ -100,12 +87,6 @@ pc_to_gt(struct xe_guc_pc *pc)
 	return container_of(pc, struct xe_gt, uc.guc.pc);
 }
 
-static struct xe_guc_pc *
-dev_to_pc(struct device *dev)
-{
-	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
-}
-
 static struct iosys_map *
 pc_to_maps(struct xe_guc_pc *pc)
 {
@@ -388,14 +369,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
 }
 
-static ssize_t act_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_act_freq - Get Actual running frequency
+ * @pc: The GuC PC
+ *
+ * Returns: The Actual running frequency. Which might be 0 if GT is in Render-C sleep state (RC6).
+ */
+u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
-	ssize_t ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 
@@ -408,20 +392,25 @@ static ssize_t act_freq_show(struct device *dev,
 		freq = REG_FIELD_GET(CAGF_MASK, freq);
 	}
 
-	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
+	freq = decode_freq(freq);
 
 	xe_device_mem_access_put(gt_to_xe(gt));
-	return ret;
+
+	return freq;
 }
-static DEVICE_ATTR_RO(act_freq);
 
-static ssize_t cur_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_cur_freq - Get Current requested frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct kobject *kobj = &dev->kobj;
-	struct xe_gt *gt = kobj_to_gt(kobj);
-	u32 freq;
-	ssize_t ret;
+	struct xe_gt *gt = pc_to_gt(pc);
+	int ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
@@ -432,54 +421,67 @@ static ssize_t cur_freq_show(struct device *dev,
 	if (ret)
 		goto out;
 
-	freq = xe_mmio_read32(gt, RPNSWREQ);
+	*freq = xe_mmio_read32(gt, RPNSWREQ);
 
-	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
-	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
+	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
+	*freq = decode_freq(*freq);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
 }
-static DEVICE_ATTR_RO(cur_freq);
 
-static ssize_t rp0_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rp0_freq - Get the RP0 freq
+ * @pc: The GuC PC
+ *
+ * Returns: RP0 freq.
+ */
+u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-
-	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
+	return pc->rp0_freq;
 }
-static DEVICE_ATTR_RO(rp0_freq);
 
-static ssize_t rpe_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rpe_freq - Get the RPe freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPe freq.
+ */
+u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_device_mem_access_get(xe);
 	pc_update_rp_values(pc);
 	xe_device_mem_access_put(xe);
-	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
+
+	return pc->rpe_freq;
 }
-static DEVICE_ATTR_RO(rpe_freq);
 
-static ssize_t rpn_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_rpn_freq - Get the RPn freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPn freq.
+ */
+u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-
-	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
+	return pc->rpn_freq;
 }
-static DEVICE_ATTR_RO(rpn_freq);
 
-static ssize_t min_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_min_freq - Get the min operational frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
 	ssize_t ret;
 
@@ -503,7 +505,7 @@ static ssize_t min_freq_show(struct device *dev,
 	if (ret)
 		goto fw;
 
-	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
+	*freq = pc_get_min_freq(pc);
 
 fw:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
@@ -513,17 +515,19 @@ static ssize_t min_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+/**
+ * xe_guc_pc_set_min_freq - Set the minimal operational frequency
+ * @pc: The GuC PC
+ * @freq: The selected minimal frequency
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
+ *         -EINVAL if value out of bounds.
+ */
+int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	u32 freq;
 	ssize_t ret;
 
-	ret = kstrtou32(buff, 0, &freq);
-	if (ret)
-		return ret;
-
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
@@ -541,14 +545,20 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret ?: count;
+
+	return ret;
 }
-static DEVICE_ATTR_RW(min_freq);
 
-static ssize_t max_freq_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
+/**
+ * xe_guc_pc_get_max_freq - Get Maximum operational frequency
+ * @pc: The GuC PC
+ * @freq: A pointer to a u32 where the freq value will be returned
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset).
+ */
+int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	ssize_t ret;
 
 	xe_device_mem_access_get(pc_to_xe(pc));
@@ -563,7 +573,7 @@ static ssize_t max_freq_show(struct device *dev,
 	if (ret)
 		goto out;
 
-	ret = sysfs_emit(buf, "%d\n", pc_get_max_freq(pc));
+	*freq = pc_get_max_freq(pc);
 
 out:
 	mutex_unlock(&pc->freq_lock);
@@ -571,17 +581,19 @@ static ssize_t max_freq_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
-			      const char *buff, size_t count)
+/**
+ * xe_guc_pc_set_max_freq - Set the maximum operational frequency
+ * @pc: The GuC PC
+ * @freq: The selected maximum frequency value
+ *
+ * Returns: 0 on success,
+ *         -EAGAIN if GuC PC not ready (likely in middle of a reset),
+ *         -EINVAL if value out of bounds.
+ */
+int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
-	u32 freq;
 	ssize_t ret;
 
-	ret = kstrtou32(buff, 0, &freq);
-	if (ret)
-		return ret;
-
 	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
@@ -599,9 +611,8 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret ?: count;
+	return ret;
 }
-static DEVICE_ATTR_RW(max_freq);
 
 /**
  * xe_guc_pc_c_status - get the current GT C state
@@ -666,17 +677,6 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 	return reg;
 }
 
-static const struct attribute *pc_attrs[] = {
-	&dev_attr_act_freq.attr,
-	&dev_attr_cur_freq.attr,
-	&dev_attr_rp0_freq.attr,
-	&dev_attr_rpe_freq.attr,
-	&dev_attr_rpn_freq.attr,
-	&dev_attr_min_freq.attr,
-	&dev_attr_max_freq.attr,
-	NULL
-};
-
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -952,6 +952,10 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	return ret;
 }
 
+/**
+ * xe_guc_pc_fini - Finalize GuC's Power Conservation component
+ * @pc: Xe_GuC_PC instance
+ */
 void xe_guc_pc_fini(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
@@ -963,7 +967,6 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	mutex_destroy(&pc->freq_lock);
 }
 
@@ -978,7 +981,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
-	int err;
 
 	if (xe->info.skip_guc_pc)
 		return 0;
@@ -992,10 +994,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return PTR_ERR(bo);
 
 	pc->bo = bo;
-
-	err = sysfs_create_files(gt->sysfs, pc_attrs);
-	if (err)
-		return err;
-
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 054788e006f3..cecad8e9300b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -14,6 +14,16 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 
+u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
+int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
+u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
+int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
+int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq);
+int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
+int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
+
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
-- 
2.43.0

