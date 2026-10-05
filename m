Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6F8CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC41B10EA11;
	Mon,  5 Oct 2026 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLXB8rpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8D10EC51
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192692; x=1822728692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cOYh3tvuCteLFr093jOYfZ6rqsJRTFz+o0IRpkWAqGA=;
 b=cLXB8rpUw9z7ym16rLlqJLwtinaFuR9WQHDGc1/WfjnYmaXBC81SWG52
 hAKaseO2cvJIUlP5gOLw03aQtHnYL8OISBvgeO6P1mS6OhBAPD5yvIBQC
 gZGzbty17D5ZogGBAY1S35xEr6vQPRB1qsFNbzdXdsxHgGCn2qjwWgTK2
 6vzCOjDgWfRFXaVna4CJyz1IDh3VKil0hSPqTT8d0fYmkcBZ0AKUj4PW2
 PE3Un542wgRF9oHbuBlyo9hPq70uce6r+Fy2jM9J+UnNY457ZapibQve3
 c2PwoySPqiyhIRZhSu/bT1cH843LMM/Q76mZp+w+q+6e9SwWxJFlXjQpn w==;
X-CSE-ConnectionGUID: fMx+pD+TR0mCY7GkRVRNPQ==
X-CSE-MsgGUID: 5mnhhzsFSKqDdkkNAnPk/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="101183405"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="101183405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:31 -0700
X-CSE-ConnectionGUID: JIoNmu9FSiCVSSEDWubWyw==
X-CSE-MsgGUID: 1A0gsJpvSPKD1YprAgCOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="281544940"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:31:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:31:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:31:31 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:31:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6ImodWgGKC49V6s8JP/8La4d+WIX7lZQEWuCZxl5KjNSO0uzM3Oi0ik8FVzZJG3yQUdp+IzENJY4WWiRzDR8sMqorj11atN4SsTTHpdUXBkLgy/DSEyssvoc4bTW/IbTqFoagHpZgly6KXl1HwoUG9HTjZkyDvgzmi5IJV2nReYLL8/QtZeSNW2O4fReGot27pgCzoKgpCqmsRz/Omj5H285F2jCbDjHJFIqn+UcnUX0m8Jw5HuLbRYFg0nYUJ9HkGERFFshg2QjyE1o+cgaoQKetzGWZ7k/dVcF3oTOZO2qx2Njzdxmz5QTe8ENNqiEPqlMJDZV/NUSz3sWhkowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN+siyYeG9vV39BcnLV42R11Nys4oVmQDnFtP+l5tmM=;
 b=VePh8xBGzQ17+nMeqtN30qnx6ktEY/uBfXzYHhOBEP9ToALQ2jZfCnGX29eRMA3jYJQRukf77b/H/vTw+QuQFX6hCODm5l+eFohbsod/sFPtOf1plNnAs0C7Q0gIFuHLrHslsSalyrTibpczftrzI+t5P90yHwBH3sYA8ykVaZCDZkqvwNbhqh8rYa9h506Xv4YTS9nCs9Uv9sFulYwUEx0YtT4EAsx4USWd7X1HwtJgB2/xQ757C5NtmrcSyM+HEDwKtiSymL1tTSRqf77Zq/8bAq1sMjVZR7mpYulBatkc3ArSfqZbbA18o5tFTY/2mvdqK2P07lJndMa3HPvsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:31:08 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:31:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 7/7] drm/xe/kunit: Test VRAM pool allocation
Date: Mon, 5 Oct 2026 11:30:21 +0200
Message-ID: <20261005093021.3741599-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 585ed5a5-6b59-4e8a-3bd8-08df22c36318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aknYF/Rt+4LzLG+hGv4q0UqWdDXtcOWz1rKILFfcKXgLHaTV05NyxwWG2bXxoEzqiXFPbi0Avt0PR6U5wJOcaWN6MBUzj3OQxKlwTYvUMM1Cf5Yxgz6pP6M7vQfHqUWWotqpzrt9ve4Rm/KnlP0ALIDb0CRofRxKXOYmfRp+H3CQGF2U/CLrfyXz9zi+rQzCAAUKybj4ZH3mjocxacXFhT5kPpa9mcaas0iae7WgZwkJltRVPp+PQvfUCNs4xQk0iFf8dMyzROKBW5g90jCj3poYlB94q+pO9BtfFkUEn06brvoXV0DocrMA5t0uq4gEPs8O+o2s2jXiyEhcR02UljUagoIviSrktL8kQDoqUABcRxKcbccKqKMucJU893ms4S1ci+QqEPlJKK6zLH3iiAv6NY0Z7nxnD5s2pYB9jPNzymQ/M+rej6lN7eU+ckdEOv/SnS2v84JBljswen2wdrv16OXkDLIW7aNjqwcDhPNcip/KwWXfeDssNMd31YZop+144s38qqBzq4Eva+HFh9EnxNX8kjy4c4oOVh/jlCUvJofF7JIMCFrFkumrXNZhqi7dgtYYPCu0BVD4ps6Bt6qNwVxfuTNtIcSBlt4vhOEz+tZ3eZiugwGAL923fW4u3vHEcp8l7jd03NMOkl8O/RZTtvBcUn+mDeJwLQq96Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVd0b0Ftb3VnaXNYelFBWWEzNWNkZkVWVytYMWJPQi9ybk83LzJ2Q3F2UUNh?=
 =?utf-8?B?MmtvT3dHV2R5MWRMaDJudGNidGxpbmRhYmIveGlBdkh1QTNFWHozTkowekx1?=
 =?utf-8?B?N1p5WGR5U2VmWkNvd1AvbE5FcWNxQ0Z0aE01YkMyaHlPa1o5VTlLRWJxQlVu?=
 =?utf-8?B?Y3Fxb0pSNHRrQmlqLzk4SEZRYWgrajhORlQ3aGxPNEZMMERNNjJsNkRnUVdN?=
 =?utf-8?B?Vno5c0hQNlhPYjlWVVZtRUJwQ0F0dkhvOWViMDdNZ1NjdHI0K2NNRDFLUXZz?=
 =?utf-8?B?amU4U2NVaFN1VVNUVzdmdGVtM1BaODFrVEZjSHUwNFBqb0FydkxEejNVVlJk?=
 =?utf-8?B?bkV2MlBYbVlnQXNxVHdKMkxBVnlXSDZ5cjRabHJXRnh1b00yUkVydURweHVN?=
 =?utf-8?B?ek1JV0ptQmg1bStXcGNoZG9YUXpuUHlqMmpPZVIrMm1FajRzVHMvd0crZWZP?=
 =?utf-8?B?NFBqbzBOdmhzVXJ2dUVHV1Z5YlpYdlhOWlBOMXA4NEJxaHUwb3NvZG5GWGZL?=
 =?utf-8?B?WkJESHZseHFrV09QQVhtNnNRWmFwUWpjN3hudnNZMVdQSUVFbWxtdFNvZS8z?=
 =?utf-8?B?blhqUXFLRDJ2TkpWbzBoRll3Z0hyUGRjYzZndG1mSTR0NTJXQjJxRTV2aWpq?=
 =?utf-8?B?a1VnUXowR05SNFArcHNBMTFzS3VvaXdIQUIwNDZPMDJia01TVTJMS0JWeTlD?=
 =?utf-8?B?NUUrNzlWMjNDQmR0U0JIL0pDa2lCc3h3b0hGekFwcVpNaEdKQWFXLzJSUk5Y?=
 =?utf-8?B?ZzlQR0FEWDBuVjhTWDhmYkFEZHpKS25xWEVtaWs5dnhnNHZLUURNTHVqZUlO?=
 =?utf-8?B?Skp4bVVHTTF5dXV1di9RY3VSTGM2Wm5rOVBCU3VEWEpVS0hVbUcwZm1ITm8v?=
 =?utf-8?B?S0NFeFRPQkwwcTQyd1hERHlqZFFRZUVlN1lJUE8rWkErRVBNa1ZpbVIwcUU1?=
 =?utf-8?B?TEJlc0hWYThjOE9TNjlSWGU1L1BGblc2b1k1UWEydVUwNlpCbVRXbFFmcnhW?=
 =?utf-8?B?L1R3eWpvMHlRa2p4ZDJHYm8rZFRkdkRxWDk2Q2xyYmptdXlFVUNPMjNBaXhz?=
 =?utf-8?B?d2FQVFc2SzFyRGg3dC9OM3FzN3R6ZzltTmVmQlZzU21DYUhBWm5KOU0zaEJ0?=
 =?utf-8?B?RW9oRENrSlo4a3E2ZFhIcHM5UXFYQTZWN1dOdys1eFN3WTZzVkxGWEwwUnBp?=
 =?utf-8?B?MWpiYWkyN0hUdklCQmtGZXZJTUJ6ajBIejF6QlJNeGxQSTFSVGlCejlMT2p6?=
 =?utf-8?B?cEI3dXA5Mm9GUDhGeDZycjVJUjREeWlqd2VwRjlhRGFHeUVValdhWjFqN09m?=
 =?utf-8?B?WmZhMjlHbDMyS25EbmlLQkdHVkhZYTF3MFFjOXlSSjFvR1V0K1VzQmNTVkVQ?=
 =?utf-8?B?V054elA4VWkxZitkaTlQSnllaXFoYUtjNlpROHBiNkl4YnpWekdYcFNvcGhW?=
 =?utf-8?B?OHFtQWJybFlFTCtXVi9NZzNsdlI2MFVCZTNiUHNXLzN4azJuRVc2ZFBlQTRw?=
 =?utf-8?B?STU5S2pWZ0pFcms1cFFIWWhzQlk5ZmQ1S2lvME1OdmZUZ1VBWldDUkNRalRD?=
 =?utf-8?B?ZlBYOFhPT2ZoeWR0bEoyYXB3a2txNlhoNXFVV2s3MlIwR2N0WGFyT0JyTldH?=
 =?utf-8?B?S3B2cFQ5QjlXZkc4amhpWjZNb2wydENjQ3U3Q0t1dXZ3bGkwS0lsZGtuTm9n?=
 =?utf-8?B?SG1PTG1ZMEdJNHI0ZVJ3dTY0TjhCWmQvTUZMOHRtVnZQRnlWZEkrQlRRWGpx?=
 =?utf-8?B?ZW1pL1c3NGRIUThYSzdaMXY0RGhZMm9WZmJwcDJhWDJMNVdzb2hXTHNjcDRL?=
 =?utf-8?B?aDh1dmRkQlB2czdkUkx2TDVWVXVkRktmY3FVNGd1aEdCMW53aWxMQ3lKSW1M?=
 =?utf-8?B?dGI0VmlZVFdOallUanZ4ZkpGaGR0NlR1b2hiSkFjSmZRRXVYeU5GOGtwTkhN?=
 =?utf-8?B?QU1ONWZmWFhGbmZCY056Szc3YzBpT3F3OFhaS2ljOC9YMlkvWkFiYlkwUDBM?=
 =?utf-8?B?bDVQb3pDbytmbGppTnNnTmU3YU4wU3lmbHJwVTlYNnNJbHJuVGtZNi9Kc05X?=
 =?utf-8?B?TzhONUNJdTFiYndtMFF4QVNGaEJrZWlxSkRLaTNHYlgvbDRyc3ZDamVYS1g2?=
 =?utf-8?B?Y1F2dHVJYzl3azc1WWpvT3dIM0tDVnVNQjRoS3FPdStFdm9Fc1Q0MmZxNlla?=
 =?utf-8?B?US81NCtBNy9XMTN4UmpIMHZEY1NPRXVyMFBKSG1YTWFWNU9vbXFQL3lOMUlu?=
 =?utf-8?B?d3J1ek05ZFhDRURuYWtTNloyQmJoU1RrSWVOajlFNXdVTFdJWU51QVV5NGtP?=
 =?utf-8?B?VnI4dkh4VHJYUm1LTHE5SUllZnJ1TTFoSjhxUm5kVlRGVFBiWGR5ZkZMdjVn?=
 =?utf-8?Q?4lnoTdqJuBSpVuQ8=3D?=
X-Exchange-RoutingPolicyChecked: kgybV2gMg2CA0lbNGOBh8qrMB27wtOn1xNBYexFlQXnUtn1FMP5bcGn7WZzfkGsVQkDc66RO6J7uwfBeQaqNCAwW/Q/Wqt/mAFrsc8anFtlgmtFIQEnM6IDpc6CPyxB0RxIpu3JGYCVNfB9Z68ATFamdlVS1D1DzpBqXO+tLkXf0zBaLMHIJVzRdw/iVvYNjtyeFnK8O88PPqhEetnyImZu4q/WRULKI436Okt+j6MwcshqY38IIPAeAieanSXsv6Sz5z1Ux+IRocSC3lxeFBTB/HW8VRyXzq8vu9xHi0dsnhh2ftP2AAjt89ip5tTu/rIepc1T79KGS9jM8xDuY1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ed5a5-6b59-4e8a-3bd8-08df22c36318
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:31:08.7566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15cTI0mITE0WGMg4MXLbBYxMTF8YdiqAnMhQdJZh2TH+dY3RAR+unxoLX8l+tzlZ4X6qxpLBB8MPEg4HPmAySEFYAwq9q78T02YrsUovVUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

