Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0DCCA5FC4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 10:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC40010E42D;
	Fri,  2 Oct 2026 10:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6SInLyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561F010E572
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790937671; x=1822473671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cOYh3tvuCteLFr093jOYfZ6rqsJRTFz+o0IRpkWAqGA=;
 b=g6SInLybDgkv2ywXfMHJ720nZjFtyFIqRr0IlPr5jfRDo7WW/nNw0LC4
 yQDAas/Y0nuaipDfHYiW5K0cJmZfllJaaNHdl/VOvDXmiLD5tOme5cjD0
 4zOBzoRoO48pJ4M8GtUp7H4x9WXqXiS5q8iBG5XSfKbI15n3SOcHF4S1Z
 Gx0/p0kfrD7l32hOpWifz2mpjvZ6LppRr3cCoseYmoWwPUy2l7UCZYnbB
 4qJO7HjrCGiChlXAYA1Sk0giSQYf/VWdumgtqLzpfCWfZSv1A19qwBBKI
 o0Dv6cqm5968gXoJLwSagUC0hThubslzIytTBEd2DjGJF9XvhBnLFR55R g==;
X-CSE-ConnectionGUID: 4G7quDk4TJC8kvY8ZvraKQ==
X-CSE-MsgGUID: ggp9g25PTo6igGG0WKd/tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90733243"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90733243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:41:11 -0700
X-CSE-ConnectionGUID: Cf5i32iBSBCicPMU7WrPbA==
X-CSE-MsgGUID: 7I2cawbkSlmmjLAZdoQeXw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 03:41:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:41:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 03:41:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 03:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mckT7QEzhTmM7t0Ab/uSN4hQchiTTVNn71B+6n9zXG4jgg8LIDqoKaQpvFROhGIbntnSKGLyB1Rof/q7rvZk/QS1WAzI0WMCgBwvn9sNr+WmFVz9O12InNYtY7dVzmGik6NlpqDo6rOp1uB3RJfhdVhlYMuYKEGIfm/S7Erd79Zu0UIXC41bw+1ltvDVHZsGHy9m9+7lyYM2cHMY+5y44BQ8fCds7qqw8EuiC4o2mNB/NTsVYnBc++UsA9qLet/JmHa5oJOfSsrnTfAL+FC7HKPgrxiU4YHY1imen6/C4Ofzaxu82j9HBYBMin7BqfAU5Dh0f8f0BYDTfEMCdNZ0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN+siyYeG9vV39BcnLV42R11Nys4oVmQDnFtP+l5tmM=;
 b=vOd7WWzYnq/o9aOvqgftDcsWcj+Ujdtn/XKv5m3DlUGk2BFxCqDoXSUf2RUam9Brn6/1ClSZ8fc3rjhtFe7lGunhY1fC8DzmpViWShokOUT7fDpdL+MrPcbvu9Eg9SGg2zMnpZrNiQxu+EEU/tMJCmG9m7/EOU8T5gmJBYGSHN/QuEW7ScB3fhaPQO5UZv3v6B6URLnt8KPUQz3R/Lpjrome7DibSxlMwe0LHt0GmNz2H9QqF3+Okg2uEOlHwyJAc9u/OMGVieKoCjoFygDGNII3deNwMHKSXdGVtDP+k2y/MFO/39nb4qjukaHikm4Z9fRJhtENvTyK1mcgi2r9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:41:03 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 10:41:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 7/7] drm/xe/kunit: Test VRAM pool allocation
Date: Fri, 2 Oct 2026 12:40:18 +0200
Message-ID: <20261002104018.3648425-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
References: <20261002104018.3648425-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fafc14-343e-4db5-d0e3-08df2071a7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: rq0O+iQKshURaDGAPJZGtaf5WD6hC/tdQHYV+NeDOXlamLWE+vNjCHQAaYSUM8IZBjVxLw92r0/rjRPwQ+c9jntGpjpCNUhzVjEB9JsNwCfgR2JRWa9hLzgwP5zlQ3XsKt1rbC8hLb3mfvA9YsOCf8o2oQJtdtG1+madtTGvb7QI6t9kJyRejJIyoQb+V5wpnqapS2MLv4DEK31mclIQq0VR2EjU2P905L6Z78tYBLSCs1hLNEHPZJlykYyqhPJ/GMPNx+Bt0jUl/ricgQNFeFEEjREvBoVgijflZ50HZz7dZKQUeUbMmaEwop8dCo8KQalJG6ZtbuaPtL1Eu3MMXBZgf0ndJyjnpo8B6RBTpu8dV9Z1LlocNg4N8u09MZS3Cae67J3oyqOc8Fyj6sK/CxSFDWGn+Ij+rY8rVERuZbA9dlI2wld3EAIv6Ymv4d+FryM5pDvdNMAqMlN4t8fZevKQcmm9VZVD8e6FKURx/WLBUDF9R4MzyDoDupLB9sVDYW7mMrPI7DjkAtOmCbNMPgmZqJgP9Whb481c8TGmCUYnykAu3Y2YBpVHnRY0w3i1qDE1DZOK4wE4HLbJBiWyKoXIH9SofmM5sV+6znmf/IK2Cls5eiuW0iuMs7dAtACMZRwFiTLzhNWnl7tA4BR+RsruGpk/VzxPNJ72jE4lRt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdIeXpDY2JTUkNJUXZGdDh2YldSckRaYzA0Tm9LRmpodVdDTVpHcHltTDF3?=
 =?utf-8?B?bThyMGZ6SlhuazhWbEh6eDRKZDg1RGFWVHBqbFhrdFpld0MxY2Z3ZytiT0x1?=
 =?utf-8?B?eEdtdis3bjlOREFBN0lZc1NsRjFlRlFkbnJBMTF5eklaem50bDlKWVovczAz?=
 =?utf-8?B?QzU5QTdDb21aZWxqNkFjcnBtaUhqVXMrQ3Y3SDV2bUhyU3o5d2F5YWg4REw5?=
 =?utf-8?B?YmJmQ2QxdEdubHl2dnpIOWhYUkQwREV4MENsT0hERWNvckVBVkltc2xlazY3?=
 =?utf-8?B?STl5MFdLeEU2NnJ2RzlrTzRMV2NkS2tJcEdiazkvYzBBS0hVYlAzRGF4Uk9H?=
 =?utf-8?B?aXpwMkpmWmJpdXU0cENzUUdiS3BPNnVqSmx6MXhLbFZjNStPS3c0Z3NocDd3?=
 =?utf-8?B?VXlpRnQ4WmlseG1CbENOSkhFdytzRFliR0QwbFZkSFF4U2NmL0FJT3NJTG9z?=
 =?utf-8?B?bXhud2tQcFBxY015eWxJMHhIZDVsdXVYaXFNSmRlQVpSTHEweGNSY3dsUVlK?=
 =?utf-8?B?Ni9YVEZWT0l6MldoT25ka3EwTkNON0NVK3hMUWo2cCticStyVFlhK3FOSkJ4?=
 =?utf-8?B?QW84ZDJJazZ5WGh3eWRQZ1AvOFBLREk1L293RjZLeERCUzdkZktMd3EvdUVj?=
 =?utf-8?B?Vm5mL2dHeUl2UkJvNDFFcE5mcEhDMit1R1h5aXBEMW9wc1BPaVBKRTkrWEht?=
 =?utf-8?B?RVJHclF4NEdTKzNIdkVMZHlmQXNTcTlNNmVYNHJVUnR5ekNyMDVhanFuekR6?=
 =?utf-8?B?MTNZQ1VOdWNBODhpWUdHN1kxYXR6TDBzcGFRb2piVmtaRGZNWnRuN25YOHlC?=
 =?utf-8?B?VEt2TU9PeXJTdnFQSzd6SUNmbUlLRnFHbGJJRy9VdDVZTzQwd2dkQVliNEhI?=
 =?utf-8?B?YXdsaXB1TnowWExTTnFsTDM1dG1TVU1JcTRlQkFnRFBpbnN5VStrMDFIcnVR?=
 =?utf-8?B?djViK1BPTWpqQm9RWE04aVZYZ2tpTDlWSjhSb3JsYjJiWlhuclFxSEZkTndq?=
 =?utf-8?B?L3QzMThFWkFUdm5vVGxmbVBzMFYzSVRxdFpJejRJdGZDV0FkSzJpdnlCbTUw?=
 =?utf-8?B?cmdYLyt4UXZVQjFYbUtUdG50NC9yRU51NzdOeHR2UmREMVpKYktGeFhPc3dy?=
 =?utf-8?B?a3MwR0ZmRzNOTzB1d1BhcndGRkYyQlgrNk1uYXFCY3JRbmRtKzJZd1pOOE1U?=
 =?utf-8?B?c1BTRXNXN2RkeVpCWHpCcUN4YmJqNEw1a0JDVytwaGVNUkpNTzdvTWZ4QUs0?=
 =?utf-8?B?QWlneWVrQUxMWHlBUTJSbE9Nc0Fjc2xzdG1pU1FWQmcreVJMb3h5MUxtejRC?=
 =?utf-8?B?ajVnVjY1M1R3T0VjOTlOMjl4RU51c2ozS3pVREpvemtINkJjTi9JZDdHa0hC?=
 =?utf-8?B?dTZaN0F2UEFxSnBkRWZlSkdlV0V4Z3JyOFRXNFF2MlZucWZxMUdqZnZYcFVr?=
 =?utf-8?B?VjJJa2x0VkczWlBsOVYyZ3QzV3pNMVB6SnRsQUp2cndPUFV1WTJIbHcxMEJU?=
 =?utf-8?B?VFIvR3hWR0NzcHQvTWo2RGZoaytLL1dPc3ZyNW1tdzNUQ0M3WjVjR1RCam1t?=
 =?utf-8?B?dkdCc20vbDlRNkNKL0VhcjZ6dVV4ZEVlZzRBalRPWnFBamFLY0FpT2hwYnlC?=
 =?utf-8?B?bTBkUGlMTUdmYXFkSVk0Ulp4blJkSmJJbW4xVElUdDgyaHhERm8wUjR6TXVR?=
 =?utf-8?B?aEpuRmV5WStOK0Y4UVdTcnJtL3RTSFBnWmJYSkV2bUtLdno5ODMxTEtDMGZS?=
 =?utf-8?B?WmdERGJOaEliZk15eGtmVG9wazNvbUxSZVZKT3pUZlV2R3ZUR2RFbjl0VFpG?=
 =?utf-8?B?RVhZWVN3RDNFUlVmbFY3L3VUMDR6V0dibG5hZ3puOEgzaVIyNHVHQmZib3Rt?=
 =?utf-8?B?S290SEE5c2czUzduT0hsUjNhY3p1YVpEVVpiMTFYMGNURzlYZGYyVkZOak1Y?=
 =?utf-8?B?VGVYK0R5cnpyVWg1WUlZNDYxenNJM28xQ1ljem5RbVZMM3NrMWFTdEx3OHk2?=
 =?utf-8?B?bnVZR1pOQkNOaWE0VVNwb3dQZjE1M0l4c09sQlFYb2tmNTNnaVVKSDl2UFR2?=
 =?utf-8?B?TGVYa0Q4SlJ3ZjY2aWRpUFRjczhzNmU1VldZbnJpL3Jna0NHOUNYRGpoeC8z?=
 =?utf-8?B?VmF0bEJmWEtzOVpwYXZYTUk4SXZndXVYTklYbTBsYmJZVzZiUVAxSXk3ZENs?=
 =?utf-8?B?VTBFcGJzM0lNUm0vV0pkSXVCVVFJMzVYaitzaFFVSkhkT3J0cDNINWxPcWxM?=
 =?utf-8?B?aDh5eFlwUDBTbVYwZG8xaFVxZ1JNdFJoWi9JbEJIQy9CU2w0MHQ2NisyZ0Qr?=
 =?utf-8?B?dSthQ3BWWThUQzU1ZndtM0MwVnhSREtwVGtkaGNncVp1SGJnUGtrUVdNQXdD?=
 =?utf-8?Q?Uxe3dOWASC3VOlqU=3D?=
X-Exchange-RoutingPolicyChecked: LOwpBK9pSRM9jjH9elu5PMt9Y2Q/N/DvtFe53x0/SiOxwG60QXHO0URaCulQ/1kxmvFjXuBAXpTRUTIYyRM6uJa28OfpgDif5+DaQ6yq9HQNXMb7nb01E6aFSICV4LoEMHw+tp17clqfBD32EkZpyDXdDWPOO3TLl8Lsg2ePpS+OtzxhAEj5aoELin3tKJPjN24Ahlsr/ZOzm0pB/D+YW+o2G9Wd0nmkPAjsTQ07QqGmfiE40+SjFFpCRpW+toXakoStLDfsniX5zS2CnG9cFzvsIiQvpr1/UjKsTp/X9CFQODgD+usmcDLy8Ag+Bsc8SG0/qIuAgLh+mdyFTlLftw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fafc14-343e-4db5-d0e3-08df2071a7f3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:41:03.2504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rw0FMxgozaMo3PsiR6Vy6n35Y8yy9i39vwR35soJp9b6CtWaMLThK343MifVS+H1che5G9BbOByf5Kae923jgiCnxc6yvesbWkbel5jw0o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

Exercise default pool setup, pool splitting and partition limits, and
TTM placement range narrowing.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_vram.c | 155 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.c       |   4 +
 2 files changed, 159 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/tests/xe_vram.c
new file mode 100644
index 0000000000000..043c40b6bb0a9
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_vram.c
@@ -0,0 +1,155 @@
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
+static struct xe_vram_pool *tile_pool(struct kunit *test, struct xe_device *xe)
+{
+	struct xe_vram_region *vram = xe_vram_region_alloc_tile(xe, 0);
+	struct xe_vram_pool *pool;
+
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	vram->usable_size = SZ_64M;
+	vram->io_size = SZ_64M;
+	pool = xe_vram_region_default_pool(vram);
+	pool->size = SZ_64M;
+	pool->purpose = XE_VRAM_POOL_GENERAL;
+	vram->num_partitions = 1;
+
+	return pool;
+}
+
+static void kernel_pool_defaults_to_general(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_tile *tile = &xe->tiles[0];
+
+	tile->mem.vram = general;
+	tile->mem.kernel_vram = NULL;
+
+	KUNIT_ASSERT_EQ(test, xe_vram_tile_alloc_kernel(tile), 0);
+	KUNIT_EXPECT_PTR_EQ(test, tile->mem.kernel_vram, tile->mem.vram);
+}
+
+static void partition_carve(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel0 = &vram->partitions[1];
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, 0), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_1M), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_64M), NULL);
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, 1u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+	KUNIT_ASSERT_EQ(test, vram->num_partitions, 2u);
+	KUNIT_EXPECT_EQ(test, kernel0->purpose, XE_VRAM_POOL_KERNEL);
+	KUNIT_EXPECT_EQ(test, kernel0->offset, 0ull);
+	KUNIT_EXPECT_EQ(test, kernel0->size, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->purpose, XE_VRAM_POOL_GENERAL);
+	KUNIT_EXPECT_EQ(test, general->offset, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->size, (u64)(SZ_64M - SZ_8M));
+
+	/* Both partitions keep sharing the region, its manager and its placement */
+	KUNIT_EXPECT_PTR_EQ(test, kernel0->region, vram);
+	KUNIT_EXPECT_PTR_EQ(test, general->region, vram);
+	KUNIT_EXPECT_EQ(test, vram->placement, (u32)XE_PL_VRAM0);
+
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(kernel0), (resource_size_t)SZ_8M);
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(general),
+			(resource_size_t)(SZ_64M - SZ_8M));
+}
+
+static void partition_limit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *pool;
+	unsigned int i;
+
+	for (i = 1; i < XE_VRAM_MAX_PARTITIONS; i++) {
+		pool = xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M);
+		KUNIT_ASSERT_NOT_NULL(test, pool);
+	}
+
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, XE_VRAM_MAX_PARTITIONS);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M),
+			    NULL);
+}
+
+static void pool_place(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel = &vram->partitions[1];
+	struct ttm_place place = {};
+
+	/* A pool spanning the region only resolves to its placement */
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.mem_type, (u32)XE_PL_VRAM0);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, 0u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_8M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_64M >> PAGE_SHIFT);
+
+	/* A caller supplied range, e.g. the CPU visible one, is only narrowed */
+	place = (struct ttm_place) { .lpfn = SZ_4M >> PAGE_SHIFT };
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_4M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) { .lpfn = SZ_32M >> PAGE_SHIFT };
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_32M >> PAGE_SHIFT);
+}
+
+static struct kunit_case xe_vram_tests[] = {
+	KUNIT_CASE(kernel_pool_defaults_to_general),
+	KUNIT_CASE(partition_carve),
+	KUNIT_CASE(partition_limit),
+	KUNIT_CASE(pool_place),
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
index 1df4f2514afc0..cfc1dc77b2cb4 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -639,6 +639,10 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 static void memtest_bo_cleanup(void *arg)
 {
-- 
2.34.1

