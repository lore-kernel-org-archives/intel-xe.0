Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE7C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5406210E08A;
	Fri,  3 Feb 2023 20:28:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0E10E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456078; x=1706992078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lDSh88Jl7oXS4BmA7s05e4fMovoGxknzzMHoAaCrA1E=;
 b=NscNsN3anVmi4As5m+ARyFrhi/MhbZKVVPw5bSNV9imduR2ATDp/RMuk
 tURn8s57I34/TJ2LRbsBXJxU+JdPjnySc3HBYuurLYNCa5LD5MDpQibhb
 KxyQH+tjLp5WuSqlOML4/o7gP4wwUYlUcfcE9+r6kZVooXiefPjohUxnc
 kX/FU6fiYr8ZD7GIh+qhrlSJHJyRJl14573pggabAfy4/UPd4x8lWbG3Q
 d2tkC7iwn5Xl4OZ6TI0Hqctm8z/KzctgL396xi0N97C+AWrxkrEWYQt5o
 bUeS8dbq2kTig4inLTc4HhvCod4JeXuK8SRRTV+sl0rKJKYWTC6KTBmxu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415060088"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="415060088"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="665848785"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="665848785"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 03 Feb 2023 12:27:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:27:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCn8dtBRWGOWl++7VZmBGAfW7Qm+Nu38ig7pzMU4/QfE2KYglHOCzhKVlG6m6JsPBnwf8TAnmeMt6nxeDyoSEo9sIdgJHcfCGz1CXmiz+iaO0HmjYvN0TBiHDZ5Pnk3sZ8C8HmpoKWKCjXOI0scFytrweYSLwoactXMVXavfEIoqzY/rP98pW3/vSLh6+iNcsKbW7zHDVNVxOdaOlE+x+8lqoxji+yS9voQqyDSVIuns72B/S+aA8t9WY+8TcjdxY/hHw5X9sIXboUxkaXgKrU7UUlxfnikyo/YD3G5bHX/HAMFFG14IcqpP2S9OMZIuD/QuFymFnaRDeatY65nS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkERZ1JwsJfwYrXF2MF78ki45oXuSWj3ztzMD8GqVb8=;
 b=Y3dZxVHz0GC7Pi1A0bnt7meqrab5p4NdGDTpNH0t+7E90rRXeAMsg8XuKVpLGYkE41VKqKpt08ZQlUlZZ5PqqcY8iK+FdhCrDGyZFWT24OQdzxsjB656/SDADazhRPPO45wEDqR7b60VZN3T0PrhtbxV5ArwBD19mqKxkUHQPD2ma4umPCvmwQkdu+kj6AT5vJhLuApo010L0TK3dfaLZhIkvaiFLHzAlKn2LBTtRwn8Ddh58zv2ABDzvXMtcIg0j1viUwMxMkfvKlWZjzI6m9+O3+a6Ql6dcYj4LvfsO/5SsFZJRqWZ1TjhqgNqncc0ftcfIBe/neCxRZNgVswJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 20:27:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:27:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:38 -0500
Message-ID: <20230203202742.577659-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 730ad22f-3ed7-437b-9aea-08db062521be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bo/fvgy3qSyEL9Nzz3x1ZETd07cJtlfKbcX696oo+jF4X4N2ONGNZ5WittAkpkhEyAUHRHD9ASr+d173pgR6SvJPzCjDVauG957/QaqVyf0KlJcn1TNm1bEqELGASS10vQX3bVk9JgvodGggW2KvKYGrDLON63+xgReymW/pZNIjtY59K11s67EhiF/D7d5ztTAYrNK1Tu7u9nTxHL1SJfWCPNSjK8PoCzljj9FptyTbIOJYqvQt1vaAPjqi3KkGxMpQmv1pfHdjTLUWx+/d4/bTnCtJ8XCeQXldbgEEG1GYmijMjBBvKdL1/hFBaiN0LV+QC9ZIxuu673og4ddNMIwuK6QW62BqeqOiE3zoGU/uuqn/MRbE7WO/5laIeRvbm/XeEYbmLnzJtG4f9NAuIrCgwPYnUYi4nRkj2g7AhTB2yuzLeVJ1QZWT5PK0PQpKOggNOmHJJmiPbdOgsuXMuFnLMeabPOdVm2xBD0VcF+VYPd0rZo+/Ckk9TNc+88NaqhXpu+aA3hdUN0pJpQ3z3wrcU9+eaLCITcMZhkc4KLjm4gUr3kERPqF+155OWeR5dFbwYgBYkRUD7aGqrhTnXgPncPrS1zknspZoUONXieGH3XcPbanF3QPcrLXT6MombPed7lVwJFpSwOJx19YG+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(2906002)(44832011)(5660300002)(83380400001)(38100700002)(86362001)(82960400001)(8676002)(4326008)(54906003)(316002)(8936002)(2616005)(41300700001)(66946007)(6916009)(66556008)(66476007)(36756003)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(186003)(107886003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNxTVNXV2trQytMUXR4WVhEaWpzdGtrdWFHOXFSRTJoZ0xITjhUcERaYWJx?=
 =?utf-8?B?NStEYmEvaWRFWEl4ZTNoT3VzZGFwNFVMQmcwdW9YTzYwSWNmYkdsRk8yeVVP?=
 =?utf-8?B?aVc1c25ubjcyMVByZUtjL1dxZGRCR1Z3V1NxMDUzTVFRL1cxS3Y4cjdyTnNU?=
 =?utf-8?B?Q1hyWFlxTzFvbUJ3bUhZcFFyTnd0MnpmNFlKUURxeEt3cXh1V1pwVFA5Y2Jr?=
 =?utf-8?B?U0pSNVpBcDhzbTR0K2VnTjV1Y2lIa2EvdCsxWngvTmpmckFWc1JFaVUvYVI1?=
 =?utf-8?B?M1IxcDZQRUx2M3ZKeHo3N3F0NWpVckVYT0twOU1hT3A0VVBoay9ybkpUYzBp?=
 =?utf-8?B?V0JjOVE4T0tuVCsvY1hPekNCVmFETHQ0MDJlK0t4dk1zL1VHOTExUTA2ODVU?=
 =?utf-8?B?QUJ1b0ZvSnRwWHZYV2xsRWRDT2xQdUsvWW5vd2JpSWE1UXVBc2dObXNwVTVC?=
 =?utf-8?B?dUlCNEx6OW1BelZqN0Vnb0tvaWtBTm1aZlZzZmswaVdkUVpLSkRXUjlDbnhH?=
 =?utf-8?B?NXZacVF4RDVwaTY0bFdXMzBGUHBrb2w1UGFTVUo0WEtWT0dvdUdLeWV2VDQr?=
 =?utf-8?B?YTgzOXUwdWM0cE5SeHZZODZhSTJZK1hpa2lvZ1VPL3lKTCthdTZvb0JkeDVr?=
 =?utf-8?B?c1puaDZQZmR6eVFTR2cydWxCMm9ZZDZFTlFHWWhESmhydks5OWdOVDNtSmt1?=
 =?utf-8?B?Z3M2WGc5bzlJcHF5R1hnaUhzeXdTODgyc0xHNkNlUlpETDZSUGVwdy8rQWZh?=
 =?utf-8?B?LzUxcEdjWk8wTmJtSWZJcTlwTzdDUDVacjVnMEdDM0FUdHA4Vy95OU9rOFVj?=
 =?utf-8?B?SG1rRXlsbkJvdU8reWFnRGZRRVJaZGlocTRiTGRPSEgyM2tVeWIzNGovSUFZ?=
 =?utf-8?B?eGY3N2k2aHFFT1NUZy9pU3dsT3pRdUJnYjJSTlR4eXgxUkpURm9rbTVzTWRF?=
 =?utf-8?B?YlcxTVJPSnA3MkpQallKRTc2Y0NxalhrdWdOK3NweVJITXJPTjdjQmJRZmxS?=
 =?utf-8?B?SU5DMC9ZRXdvOURxQUdicDgyWjlWWWp6V3NJMlh6djNVenJpa0kvZ3hJaENN?=
 =?utf-8?B?VzY1c3JrdGxKR0F6L2F5bzBsUWxYaU1zaU9CamR1ZHNRSTgxamRxMjczd2NV?=
 =?utf-8?B?QnIybEExcHJxckhZMU9vN0tiSmNOWEg0RWYzamE2Q3VOaVU0UHpPaHIwMENW?=
 =?utf-8?B?TldOeG91VnpnbHJTMDlMUW1LelQvenNvRnpXM0NvN3hrZy9RRDNOcFp6U0F1?=
 =?utf-8?B?bWVBNENtS0NhSjZnYmltNFdPVWlBZWFrZ093aUorcHA4VHV0M01jSi9wSXRL?=
 =?utf-8?B?bllmK25lenlhTTlTSlJlYWlQZlREc2hsdkF4VGs2aFRNbDVIdmYzS05MOHlY?=
 =?utf-8?B?d2I5T1dESndoS05ZcFZ2SFhSZjI3UUNja3d2azdGL2l5aFZQV0VVQlRKV0xM?=
 =?utf-8?B?OEJ2RDJYSSthLzRNVktiMUQwdHQvQ3RhNkYzNGhKQUZvYTVNK29tK1hlOTFF?=
 =?utf-8?B?ZGVmN0FyS3Vtb1NBbU5mMlcrUXVJVWFGQXd3dU04Y0ZIV2pGcDY4TW9PenBJ?=
 =?utf-8?B?dGJnNGo1S1BkWTdqMzI2ZitTRkJZWUVkZ2tLcCswR0ZJa3E2cFlnY2FkcVZW?=
 =?utf-8?B?dm1Ld1d2QXlLeHhjc2hCRGxtWHFzRUh0TGh1Zk9ueU12UU5vWVR1QWVjYXM5?=
 =?utf-8?B?ZXBSbGR0ejdBRS9NN2N4UmFjc1hNYW9QaytiTngwWEsxdnNFWXRkNFNHV3FI?=
 =?utf-8?B?bVdiYWFXcVVQdExqUFFISmZ0OUNCbUozR3RrcUtuL1JmcXBRZDBKQUZrbHFj?=
 =?utf-8?B?VWVOZFlKYVVMVXlHNTExRndHR2sxTzFxcFAxK0hJbnRXOFpBWFhFWkZJT0Zp?=
 =?utf-8?B?TFhBTW5CaWFrUTJValg4UnV6dUJFYXdpN09CcVNuOXlENG10V2l0VjJoNWJO?=
 =?utf-8?B?UVBOWnVRbmQ3aEYwRkFjWWNHL3FZbzZLL2h3T210clhWOEFLWW1iVG9SbVh0?=
 =?utf-8?B?elFXWkhMa2kwQnRnV3lod2JzZTQxdEFIWjhRZ1pwekRycnRKcjd5MWkxdWtY?=
 =?utf-8?B?aHUycXlNeTFyMWIvZEprNU9zN0kvOWtqbmFmajN5K2tWM1BXYjdPQ3hzT3gy?=
 =?utf-8?B?WkJOUmZFK1RCeHk1dmlHRlVKWGluTzJxTkpXYk10TjRYQkdjdHcyckJwMHJy?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730ad22f-3ed7-437b-9aea-08db062521be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:27:55.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sggETiuBCercvnYmTW4o2dRXcqT4AyYCc3JLsjLA/gWNfo6sRQR7WeX0f5nkL6Vcf8Myxs+kAd3B91+ZJopdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/6] drm/xe: place all modprobe parameters at the
 same place
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It makes easier to identify the module parameters if they're
placed it at the same place.

Place them together with the module author/description/license.

While here, fix a checkpatch.pl warning on force_probe description:
	WARNING: quoted string split across lines

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  | 10 +---------
 drivers/gpu/drm/xe/xe_guc_log.c |  5 +----
 drivers/gpu/drm/xe/xe_mmio.c    |  5 +----
 drivers/gpu/drm/xe/xe_module.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_module.h  | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_pci.c     |  7 +------
 6 files changed, 39 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_module.h

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2e1f4beba9b0..60938c2deee2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -20,6 +20,7 @@
 #include "xe_exec.h"
 #include "xe_gt.h"
 #include "xe_irq.h"
+#include "xe_module.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -42,15 +43,6 @@
 #include "display/ext/intel_pm.h"
 #endif
 
-/* FIXME: Move to common param infrastructure */
-static bool enable_guc = true;
-module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
-MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
-
-static bool enable_display = true;
-module_param_named(enable_display, enable_display, bool, 0444);
-MODULE_PARM_DESC(enable_display, "Enable display");
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_file *xef;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 3f19fbf243d1..7ec1b2bb1f8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,10 +9,7 @@
 #include "xe_gt.h"
 #include "xe_guc_log.h"
 #include "xe_map.h"
-
-static int xe_guc_log_level = 5;
-module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
-MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
+#include "xe_module.h"
 
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f20734cf15ba..8a953df2b468 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 
 #include "i915_reg.h"
 #include "gt/intel_engine_regs.h"
@@ -21,10 +22,6 @@
 #define TILE_COUNT		REG_GENMASK(15, 8)
 #define GEN12_LMEM_BAR		2
 
-static u32 xe_force_lmem_bar_size;
-module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
-MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
-
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d6b50f1c2a05..9cd1663f83f6 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -8,9 +8,31 @@
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
+#include "xe_module.h"
 #include "xe_pci.h"
 #include "xe_sched_job.h"
 
+bool enable_guc = true;
+module_param_named_unsafe(enable_guc, enable_guc, bool, 0444);
+MODULE_PARM_DESC(enable_guc, "Enable GuC submission");
+
+bool enable_display = true;
+module_param_named(enable_display, enable_display, bool, 0444);
+MODULE_PARM_DESC(enable_display, "Enable display");
+
+u32 xe_force_lmem_bar_size;
+module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
+MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
+
+int xe_guc_log_level = 5;
+module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
+MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
+
+char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
+module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
+MODULE_PARM_DESC(force_probe,
+		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
new file mode 100644
index 000000000000..2c6ee46f5595
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/init.h>
+
+/* Module modprobe variables */
+extern bool enable_guc;
+extern bool enable_display;
+extern u32 xe_force_lmem_bar_size;
+extern int xe_guc_log_level;
+extern char *xe_param_force_probe;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1d5b6afed2c3..20aa2b5ca9ac 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,17 +17,12 @@
 #include "xe_drv.h"
 #include "xe_device.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 
 #include "i915_reg.h"
 
-static char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
-module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
-MODULE_PARM_DESC(force_probe,
-		 "Force probe options for specified devices. "
-		 "See CONFIG_DRM_XE_FORCE_PROBE for details.");
-
 #define DEV_INFO_FOR_EACH_FLAG(func) \
 	func(require_force_probe); \
 	func(is_dgfx); \
-- 
2.39.1

