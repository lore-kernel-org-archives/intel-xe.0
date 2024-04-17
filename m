Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B12DC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 19:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D58710F7BF;
	Wed, 17 Apr 2024 19:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUCEk5rV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5F010F7BF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713382499; x=1744918499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ah9urNygXar9TWiue0ylIfC5MUQOFM1XeS87a/EjyMQ=;
 b=JUCEk5rVF4Xi8MjATsOjwv5eAzCv9PQmXG6m0BMpYm4oDisHpPDrfUx9
 t6QeZ02oBhxmKA2tpgkHrVEk0JhmYUB3yq9vzaVa1l+oDIwC8Itfqd/h1
 MNGiFuipg8iFOwyL13pSQZuzBcFG5SfFQBiewnmGnRriL/pu9XHeH/4KR
 DicYtD8OyFE5sT+ZYcgSda5TOHUthEf0bvoBZNSRCldFxhlpQwQssjGU1
 R9rGJ1bEhaGNuLkA9F5g+zBZYOgq8QC/mfJhHKlwLSrkR+jLhNezEkoCu
 hKe7sLPttW16M14cdYDdYpDhFALgMHGmCHSE9JkUPrQLqarVPDcxvF7dM g==;
X-CSE-ConnectionGUID: GPE30TL8QRqZEOc5gQZWGQ==
X-CSE-MsgGUID: 6outj3HdRa2aEUlc37FY+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9052124"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9052124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 12:34:24 -0700
X-CSE-ConnectionGUID: AAqi9m9JSJytvlSsQQg2PA==
X-CSE-MsgGUID: gwkAr2cVT++mgpEQLHSdrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="27396139"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 12:34:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 12:34:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 12:34:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 12:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzvWwquuN5DSRxP26zx/yxiWCSae3rzD6J+Q/XYwrhbZj4tcNISRyo9GzWNCwZ2l26kO2rCkOMCth2cDk026rXBB3xKsbRKemAWJa+rLGMeJrFEKFinzZsKfmirpUH5DvKnaR7Tb73JrippBR9iOAthvAnwLPCkfo4xefV+Mnm5392r5MyA6KtfoNKY+HanaQM1DFwjVUAvmEVCTxBrHIpZLisTevJ4pyAs0Es2F6ShuVwimd1CpuEnlTNxRak66AmZ1WXnvYmn+zQJPunqbtDEoSF5LCiu8yXuiBkYg7gekurg3HIXO4mcma7LFCoF2WaOMD6cJuED4iD8WJMev2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqKdSizfgru2x+5+TACMDj7YlpmEIGsi4EsavD5XyYw=;
 b=WUQzQEm/1+xS4+Y3JNC+PaQVdd467qTh3p+IXgX2wWStBHGeDTMJiDRMdlvs3eaQ5n09tF7tAGNWj1qMkiigtbcY0mk5IZJB92IC/kNrTXaKzxUsDVoyyRb0CC/zK2yZmf+DUwDc3XChprbN2EjPICeJ1HYHQUobnVjkZE/ibzWd8WNpYyCvXNZyuVtJT9JpUOo3wxN2HBzVTbJWuC3DcT8d/94DyJEeqK013Q89Pf4t6jewbMZat3yMwMzoYpX1pew+DB5P1WGmbP6Zu9SYOd+/8Ju1kRsk0enn7bms/Pc2Q92gdcBg7gWtHjcQxoek+cukj3bWCBVxUUD6XLe5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 19:34:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 19:34:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe: Add outer runtime_pm protection to
 xe_live_ktest@xe_dma_buf
Date: Wed, 17 Apr 2024 15:34:11 -0400
Message-ID: <20240417193411.21833-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f77907c-353d-4904-c53b-08dc5f156127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0XVhrrGHHJUEJIjmPdjRquPtCtKkHNKErYlkxQSoCLEQM+xYIU3auHpKU7WakU+i9hfs1iSOnaO4ZM4lFEMn2gaT4zGBjjdNI1sE34m1Sc5Bh85k2I/xcq/Oosvl/8x0LgiQ7B2mKyMJQMk+c9z//hpw0kXJ8EoslMJmkbhXGEhSc4eqgU2IoJRfGlGo7sey77UdXCMlM/EEh4ZAWB6mrFW9gi5IZ/v8H0Cmp7yxCqOZI5XmsnMuwjMm5ah8Hf37PfUDfUf37Hl6KmNODSAt7aMj4Q768yWtjgmOF0pGggHM6yvI8EGIKqXbnjx7RHt0FKp2brudXfSiDS3+QzDUzqhEjSsbf8z7FOd6PGIsdLQ4HYLcjaLZMZcaQxgXnFOPA+CxmKRDJUpWNvGx8NzUz6NnC4QUE8X1E+/PG+pfSBnxmBSrtvB0m2uk8HSCpdt7+KOIwq2lDpzqAhvnuL2UlsXQGnwdq4H1xtIkMozRdkfRR7ehKcXp/OOOz7KWadPQBtL5KkAAPuOtEcKlfIyBburlUj946tZuTZDpdAXk0+f0lD+zP+KV8sCjgk3d/fanIuyHrFQb/zUAdiuEqef0sHaInJLbpMxYbU+pRQze/jY63p82+tc3nOQuK5fb01tC5DXix9Z67DdMjuMGVDeEouVKA5QXxRfic5CV6+e578=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dfS+N0OzoSvs7SxEsBcJcNeNiAprP4M/AhExuOEHZoeOUjoT2+TOne71qhCy?=
 =?us-ascii?Q?Q8zA+5ai9PBZKVkaJPUzXNm+dxdF+k+giYEA74Ikvh+AEpNRtaWXt7TdQ5XA?=
 =?us-ascii?Q?9/eDHVGmnqaLaQDJSL4TZ8Gm7JnwFuRhs6HLKAgw9otca0HiBj/KKs5cAZQy?=
 =?us-ascii?Q?DffT6gzPXerkjdvc5l0Wn4ZPjGRqkfHXiq+RKH9F+ckm0dL7AishZWyOIUNS?=
 =?us-ascii?Q?EetTJ7YHPunLbrkdAG62UNxW0ZndXukdCy77mKCEUSoDuysCZM1BjjBWIbSM?=
 =?us-ascii?Q?mPimbrzF7QJVyU96Sg7G7kgP5Zh3cN0k+ttb7YxUGAsi7mAycvJ4rZbe7JRK?=
 =?us-ascii?Q?Y1I5aHlkvkOID5KMDiW3cjfBAS9XN9Sxm8gHsHVJ99HNc5bXeAXRvHrtOl3e?=
 =?us-ascii?Q?9X+eSe69EK9IwemW4aqaNJmrZbOE6aHkJs3SEoLK3Y4XkaeIpcBEbacHdRcG?=
 =?us-ascii?Q?uyNKwjcaLcIswyVvr2KU/j6DacjwWr/lH2Y/d0RPZ8Y5peLTHZlmFSt1QlNJ?=
 =?us-ascii?Q?aUkTtXHFuCONfgzPEYH9X7unEY4c4KAQJBGEcA6K9weMAcvcxEaULzkfhdyN?=
 =?us-ascii?Q?dhQ4q6ll3S/ZbM6fCNIdnBRTsle3Sv8V+FbLAS20Aq+ToNGQnNCIFwM4Tr7V?=
 =?us-ascii?Q?aV+4Vfr9ilsmXnrTfkbWgodPskCw/mpjTGnasxt4+hJsp9xeWq738lgg4D7R?=
 =?us-ascii?Q?T63K4O3ibS82WNipkRT0dFLhlJi5wixzZj0s7ZmzLmzLjyUHjPpD/adclw8+?=
 =?us-ascii?Q?65TG/bZb9jjElkAxnsh5ufj6IqGby3z+rbkZo0TC41QJQnIVeNP5mOGVbqkC?=
 =?us-ascii?Q?UTEGhkteFOtjEIOQaiwOfKtzB2Cd4TGFfHoIvolRVf/T2HfL5lCImp4hN9nI?=
 =?us-ascii?Q?ARVm8//fwnPo1AtJ/tvK5Q/aRxUwIqhClPLQlpL6YJbMonHDDWGBXi8Excqe?=
 =?us-ascii?Q?k36zdTEDGOAn1wchHqXP/j6Nwyym2Bu5Jjq5sAxVtGonWME2m/bUzDxgb61e?=
 =?us-ascii?Q?QO7sfLCRuT8nHrt+zI0Adjw0FWKqFH+YC8UUIxGNcLC1TAI7yx5GTak2SEBM?=
 =?us-ascii?Q?P5yK7E+h1GqbL8yAdZVL9BJJi8rJLMapy0ru//YlAOv9jkRhDhDdd+IJgi1z?=
 =?us-ascii?Q?2Jr5v5bSsW9FM4L5077No1Oncmr3FBcjqrb3qrr+OJFos6oOJ10APkeo1yKN?=
 =?us-ascii?Q?hjBQfBnM5aNpDjnS1DP46aNkUa/W9gUt8ckiVOJBWH2qPKVkQBlMwIkOk2X+?=
 =?us-ascii?Q?SCUiX5YWB5vmBw0RXESxPYw/aJKDFqVJ3Ti0xYRSq0jehYozRMZgBv3smjUw?=
 =?us-ascii?Q?dgdzm72D8pZap/7ibXs7akBAl2kIQsqy17Gf1YmmpkyfdC4SiJlRnhQrHqYS?=
 =?us-ascii?Q?Vyn82W3Rk8+67vlDZqUXPE74bydS3TPt9G9rNxdSs37rJ6+ByrsQ62si/C98?=
 =?us-ascii?Q?3iESU03qFsGxkD09hbgISOgUJI1elPcXzzfgA/Dg72y3BQwXAsFTUyHWNF27?=
 =?us-ascii?Q?McZ6BUjCBTiUJRTXTchIBBPoPwvpROvvZridPlghU8y2tM/QOd1+mpz8m8YP?=
 =?us-ascii?Q?uhg+2uCjHFRCaYSCEk27va7GvLpvEIPOHNQBD7Nr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f77907c-353d-4904-c53b-08dc5f156127
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:34:21.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y2UHlMrzo3UO4PbJqDu4drC298hFFv3ANKfHbnRJAxSSinT61Mtr2PR+O+hCDRcVXWZWRecZqbgsZ6JfEOdfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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

Any kunit doing any memory access should get their own runtime_pm
outer references since they don't use the standard driver API
entries. In special this dma_buf from the same driver.

Found by pre-merge CI on adding WARN calls for unprotected
inner callers:

<6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
<4> [318.639957] ------------[ cut here ]------------
<4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
<4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index d54dd5b43007..e7f9b531c465 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -12,6 +12,7 @@
 #include "tests/xe_pci_test.h"
 
 #include "xe_pci.h"
+#include "xe_pm.h"
 
 static bool p2p_enabled(struct dma_buf_test_params *params)
 {
@@ -259,6 +260,7 @@ static int dma_buf_run_device(struct xe_device *xe)
 	const struct dma_buf_test_params *params;
 	struct kunit *test = xe_cur_kunit();
 
+	xe_pm_runtime_get(xe);
 	for (params = test_params; params->mem_mask; ++params) {
 		struct dma_buf_test_params p = *params;
 
@@ -266,6 +268,7 @@ static int dma_buf_run_device(struct xe_device *xe)
 		test->priv = &p;
 		xe_test_dmabuf_import_same_driver(xe);
 	}
+	xe_pm_runtime_put(xe);
 
 	/* A non-zero return would halt iteration over driver devices */
 	return 0;
-- 
2.44.0

