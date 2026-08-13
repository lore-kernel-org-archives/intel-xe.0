Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF8FC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430F10E4A2;
	Thu, 13 Aug 2026 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYDaFJp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6E310E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786616740; x=1818152740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qdoPhD7aZzib8ZybJhEv43g6XZtL9xmaCkCT6O3oqak=;
 b=ZYDaFJp+Hvi+9uKlbgaDLYK2W8bITKcPbSOB9XCjq/WPYe8l/wtaB+IJ
 kRBekvgknt5xPAPZS/4Q4E13S4q/5GqSW1zi95lC3scGogvubLO6sDUTA
 TaPp5VroSBEHo3EbGKEqk/9hWcxRG0pN70dpokgeHAK/RUuVqeTr041QQ
 cC55n3t8Ll89lL025//IcJjHRB0ge3Xlrbtb1DFqlwL0fp0mJyqlP0KOS
 MVhElJwZWvDzXKvEl7FgNXIzbSiAGzw0/tfsoLRUdQNeXS5iKCDUWkK8R
 bFkOsBGZQHKDENab8fBSZKDc9vFkC0MkgxlfzOoZDc/4MJGvOSD8qMeLV g==;
X-CSE-ConnectionGUID: R8uNFQtYS3abcru8YZ786w==
X-CSE-MsgGUID: k+mJTdRYQEaaVPTjjZbMoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98543365"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98543365"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:40 -0700
X-CSE-ConnectionGUID: q0+Zkn8ORCGRWLEwt/OqHw==
X-CSE-MsgGUID: AICoc86yTmmMLg7eQPuPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262589831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:25:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:25:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:25:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phipz1kqgs/0jr7L5glfZ90vHVpGsJJT3rM/cOMV/WlY7+brjm7MLyHdcn+pqgLCczqzTNSHkyFEGt4LDvp9B0LYYaa137S9xfYMxdZwr+W35nKwC8N8mbV+JMox7G6C4Kjrx29EkrzEjjS4DuaQP12f05UoY2CEUc34OU0Z+ORD8K4/hsAxCqB+X3sNwUVTsCO6v521Htl5sysxvfMmuozdbRXfm6OE7Ly0RLWcaCQT1oGk8K8Ec8gscJneOKc//uAD+b+AF2sE+bMgyEDV62vLwXqq6hqF5Ja3mhWxnxGlS3Ccg/i5q+hQM6hSELc/RMuGnZ1DUmrOchfyYbFBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rzSNXE1hvYmLj/vMqWQdxuwEF6JKOg1Bx7d0tyaqMM=;
 b=SxG+cahZsHpvr2Gwlmr8sMk7WPQvL05R7fqv587WAQBv+0wTBlUEj47yFgIZUZau5/nRUdTq+uDRxKC7ZAlh7Al55BsNGjFRdPESOndBkSF6vEy6seoFVbV43lY5AU7YZcbfbMNo5AC5MURMO+IzCnYKtVIdZVX8WxcoxI2gBdClLbb6in1zoi9DvWHdR8pKYeZxPLupOcFnPUKEqjH1cDdwiZkU5KW7wXW//LwXaHcbsdCRgXtUXuUSgCC5WrYu3rxiQT3bQnE7+uWeTEf8XWfuH1AOJW6FabSGLBGwiwC7jYOmVX4whVB2DZ/GKwz7wcvNj6AsSqrtgubM/aqmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 10:25:36 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 10:25:36 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 4/4] drm/xe/kunit: Add tests for PF-mem regions
Date: Thu, 13 Aug 2026 12:25:11 +0200
Message-ID: <20260813102511.200690-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260813102511.200690-1-piotr.piorkowski@intel.com>
References: <20260813102511.200690-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0168.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 80de39b7-105f-4702-c66b-08def92536bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 3U1qV0MzQeoNMPWgfdyKocXK2dajZzBu9ahzUuxODVsFJCQodqz7SYdTo/0O1gqNBj92EabcbkuFL1FgeejcjhdSbWlzbtHJpWko2onudSm0MpIo+8ILjPstltKSsaEfkZJnT3UrBeK6JYjoPOiw7sa4I4RSNr6SYr52ICIKobeSAILh2fcgA17hQGX9+f6QeXY59zovDQfvGcPnkQETDh/FcJmY5zPZorryNigUrb/Swkh1vf6No4/P6iq7XcMqmMlne6vGgkd+eHbczuwY+V7NE4aRACaX3iSe3WZV6bzufrPnzQHMSfbFIMXKzfUEzxWhuoWfx5PXsogqLT15Nj4Fe1NzVH7A1fbXzDPN7j/nuuQDrIWjex1n0oQ61gflrPk2cGbEXGdMLB04ej3F4FvPVSTrHE/ikSD+aCAaPkc5ErYUq4Js9hqqEo3fPmnQHF95MW02yeNTZoicOuwSAHpEPqqQAVvFL3rm9Nc/fHcMyL/Yjp4n3JkQT5UPJ8L8C2Uo/6utApcGGgRdXvtJdnYnY5oUjla2NbJ8E5KMK6G/rrbLfTyRPESpW5pNy1A6z7xu6r+hf9/FNp3mUwqcwP2HDkcWCn1P2SyE3FGmaXd03d7RaDKu0L2Gk+ggcgRl8Xkl7j3DMNrW8GouUh9ZIMyvMJTvsxYvzCl3bsnAhGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JTelJ6bkhXV2xmMjlsM2JmYWcxRjhGUnlSRndLeXlZTkZVc1hnNjRkL1lJ?=
 =?utf-8?B?c0FYQXJST0xWa2o0YUxLeG8raUUyTXBoajMzajNxQmpiNWxCbEpSNHZYRHJS?=
 =?utf-8?B?OVU4R1Y3bWo3R3ptVzFCY0tnRHFNcEEyZG5uRmp4ci9xQTlxTHpJdjJOSW1R?=
 =?utf-8?B?SkxIa0JTZTc2YnBja0pXeGFhNVdZbDNoYXdjSkV0SHhKU05RUk0xRXBlby9E?=
 =?utf-8?B?OVIzUXRQNGNaU3JnSUF2aUNsV1k1R0R3MlNURkZEaUNORFhHZWhFL3E5RGtj?=
 =?utf-8?B?SExQQ2huU21uS2VqL1RGR1N2M0dPcW9qTXR0R1ZnWERkTFR4cXQvaTFuS29j?=
 =?utf-8?B?YmFBMkFFOE1ISDlUeXpEYkVxUUtFQTlFOVFUcFk5QW4rNnJlcEJJU2RIaHYr?=
 =?utf-8?B?c09HKzQvZ3pBQ0RyVExNVUsrVFE1TDhqS2h4NlM2Sm0wQ2xIRzRWZVh0ZS9m?=
 =?utf-8?B?ZlJ1R3dVWDJJVkdybEFwdTNWbXRKV0wwRlROcW96dktpejlBKzdOa1Jrek5Y?=
 =?utf-8?B?MHZQMjYvVndMVFQ2UE5FQkZWWFV2cEZnZEJObk1xTlNDY1h3Q2E5SktHL2Zr?=
 =?utf-8?B?Tit1ZWtUSHdwSnhQRGNjRGFwOXVaNjFtME95MitCYWNzdEJMSEpLWjBYUUtJ?=
 =?utf-8?B?TTZleGFXZ2Y5MzRMUHpBM2xCMHhYUFVBVFF3WWo5OXJ1SFAzc2RJQjM4aUFr?=
 =?utf-8?B?TGxoSVZGb0Rtc2Vkc1dBRnIzd1JiVU5uM1MzcDJocnRiNFk4eTBQa3V5eHln?=
 =?utf-8?B?QkYydXphMnNGdk80ZDYzN3U4NkJpMWNpVFk0ZW9PUXdtVGl1Q1lYd1RHRGgy?=
 =?utf-8?B?TE1YRldyWFFZMWRPS3B6dVgxYnZnVi9iVU5GZkx2T1pxSnJqZlVWYVFVYzBU?=
 =?utf-8?B?TmZEaFNweUU1OFlxamJzZFNqbUV5K3NKK2RobWdaWkpOODJWbXJMVmhJRUR1?=
 =?utf-8?B?czFjZ3dDUCtaOU1OK0VRS2tSZ2dYcmpERGl6eDlNVWZDcDM0bTRXMkpIRmRp?=
 =?utf-8?B?MktCMkxETEltTTdhSklTTElrVGpjYjdtSnBTc2xSa1EzWlVoZUFOeUlzYSs0?=
 =?utf-8?B?SnNqekZhd3JIZm1pY2dsTlBrS1pqdllLMGYzQXlxMFJSczlhWmRKYzQ2ZDRh?=
 =?utf-8?B?MHBWenR1RXl3YkhNNFhJenYremFaaENpYzNFSUhuWVRGVHFFTy9vU3J4Qi9z?=
 =?utf-8?B?bHpFdjhuK0JkenoyMU54U1dCQVVJZXN1aG1Tam1ZdUg3anBuSkhVVzBXQWJR?=
 =?utf-8?B?UjVKOHlKams4Q0VSWk5INjBQNEI3MVorS0Zza0lNckUxSTJsdHp1UzdIOHF3?=
 =?utf-8?B?LzR6VnR4NllPOW5yZ0U5ZXhyeGYzclRiUkNTTTk2N2RBZU9SMDd5S2c2NUVD?=
 =?utf-8?B?RkM0VU5GNjZqTzAwc292d3BWQXl2bjFwdFVrSUkzRkdWeUJOTTQzcjJIVzVU?=
 =?utf-8?B?RUVTemZaSVZZWnBLSVZaZ21xSC9NbVlyNDlYRkgyUEJLMkovOXVMYzdLZVFE?=
 =?utf-8?B?Y0svWDlSQVN6SW04TC8zVXB5QTNxdSs5ejUyNEUrclhCeW8vRE9IZGQ5MHVV?=
 =?utf-8?B?QkNsYTFUUDN0Q09qQlNqOWRtRXJLTHRsVnNjMFBrSGFubGxRWEpaN1ppZmls?=
 =?utf-8?B?enFXVjliZDF6NWZpSFlqYkVvQUN2dlUyM1JDVk1JcWhGZ1NrOFZiRkVndEl5?=
 =?utf-8?B?RVZoVTJLWE5sMDZpM2hRVFpvQkhKd1c0UEtIQzh5dU9FaDBac1hJUjlIaFdD?=
 =?utf-8?B?NVF0Z1BCMm1ENzFTOWNhaHlwOTF6cDVjRWpKazZuNTJwQmZoaGVCaVJ6TVpK?=
 =?utf-8?B?bHB0K0pyd1RPRzVySzM5R0pWVnUrSStOdG8vajdGdWpxakRzNml5U0VnYW1I?=
 =?utf-8?B?elErVmhGTjVKbVM3Vkk5Sm5PaDlhbDBBMU5KNWlqamJNbUwzNjQ4d1RabVYr?=
 =?utf-8?B?b3NXWndpMXNwRjFwQmVzZER3M2pzeXE3WGZ2aUdZRGlOSWJWVTl3aGp4aTJu?=
 =?utf-8?B?SUFaamRrdTRhUXorcURQNDNQL3BDajIyNnM3L0NoOGF4S3RLajY1Y2N1WHpz?=
 =?utf-8?B?a3JMcVhWOFFRQ2RIanU1dEJqY0x5U2ZLZWJHQVpxeUVMWjNOajFWWFFtRThL?=
 =?utf-8?B?VUllWnBuaGtOWHhZK0RLL0EwNkxPdUttMGc0d0VEWU4vaFNnUmhNWjUyTjBZ?=
 =?utf-8?B?UmJGUDhYSE5LbzI1VmZ3bHlmbkVNeFUxSlhnbHhLbkhnaFc3ZTkxZjI2M0Jy?=
 =?utf-8?B?ZmwzVmQyRXc2VkFOM1AwTm45MnpRVUYvWEhpaTM2YVMxS3BKL0wxNmkxNHcv?=
 =?utf-8?B?dW9XY3IwV1FDRUw4encxY3lmaVUwaWNsT1ZGdldTMXl0TklNdk9BNDY1cWR4?=
 =?utf-8?Q?uyJogAjH9gdMfesk=3D?=
X-Exchange-RoutingPolicyChecked: qcPHVaSnTL1vkvlejBXnG3bLdsTX0cxW+PRzNieRFV9FRG6e+dKAOAevkAb1B7Dnu49LUgf47gq3cO4lS3uFOrH4/WofFTcXBqErVqxMS5o0Em7p7s7nycQEoxxFveYK4BsjS1jb9OQE4Z6gRLhqHv2t2NBNkxINcaRFHFB4+/Js48vJMBCKWrUpzzahvn/LUZsClMEJqT/+tjtBEH2RhzzT9yf/z3162AMIWDmAEeF2PVY12gSCJQ9rrfamKucxXfduuW7P9JCzNOCDDkxN67fmJ1RwLbsQElQKSK8G1seOUalej1DxQt3plCg/GrcmHZQplsj2HLZOTurRwYTGhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80de39b7-105f-4702-c66b-08def92536bb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:25:36.2293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo85TRm4+sgS5VqqTX6OzDE93VgQ6QIh0rhmOMHO+qU8m0jj9JOJg+0FDSdE4DeToNkQ/E+kHarWvxNSToE2jR55T5dX9ikXiJrLR6yj5Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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
index 29c93e9aa5a7..b62b5645c14c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -454,3 +454,7 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
-- 
2.34.1

