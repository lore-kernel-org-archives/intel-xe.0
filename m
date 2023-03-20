Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9589CC7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067A10E248;
	Mon, 20 Mar 2023 08:13:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF91710E248
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679300000; x=1710836000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IvD26WOAfu8kBErWHpvaWlvPhcgwLXtlmo7Xk2b8vVM=;
 b=lNw3u7H8p/OWw4wtoYfUha2lByFlrpksOO4guTsCL/jMCW0ISOiK0KYF
 qZ1ftM/B1JSKXl424LzFO+dNuzeBpUOooz9xztQ/lDQP19Y7YJ01bcuy4
 Wm8ZSup6VeoAjhRzlAwz/gYqhAi1McWGDi53qJ1WFNtm7FL69csA44wEV
 RybA1H8/NqNQ8kyJpyCQ2+XAAZaOMWOwANiM0QBOTibI6iBADUI6eY3PB
 DYcuEob+gNsMUwTLOzgrebAJ0gY0N8ZXK1Fa5liCORgbchX0u8GMTtVtS
 8MXc61pEAjBfw+Gh4YeOPZ9xJu1IwhYs9eNZyjR+sFORYXn5Z9GjUxGsT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322444219"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="322444219"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="674270138"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="674270138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 01:13:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 01:13:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQIUoWv6vEM6QyQJNSnP4AMeJ/y+gMeD9BgqhKaFK+hnUqSd2/NwXg53CJO4jfXcWyPRQU6GdA+oY0ajWtmrO+qBXFHx1bssOmq3KBCLcVQq3E4znr0lq3V6mjI/LFkVaioXLz3t5L2a175/gc+3hEOL90UYJQdo0UJ81LJgRA6I8KldpeDoU3corw/aeOQWp8XkcwevEmwsxIX0IXzVFAt86TZvNJoyF3fc1oHiqz4sujrRYdaKbcHICdjevbdDXQBRHTf8mcfMuICXsY8hBK7draMiwH/FHBJsyhn6BGTZ3tSNU2ggJxD4sBHYGyKAd6zIcPQ6VJzeDmKEcgK8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgmQfQ7O1gdXYK2VeVymh/He9G1Wyk7Y0FQMNtKDet0=;
 b=oK/MR2o+Cy8xLXcDniaYAU6pAATgKxG2Ljnq175Vd+a0QB4u/AKlIfAj0tdFmmcnSwR8jGpeVQO6mzEnnsm1eu/dERrKtjfK7J4Le6i4uCeAETdeQOw/Av342ydlDJ1PL4RW4Fmywp2K+tjgY7JIqygl+eFvHdCpUaOkXBvF6ZQO3QlIXJ+bVvB1a6r7uyqIvwjDpDan+PRh1YPJS3bM/wrPm+F7414ggKPSLxGA6EqKhd/4fN00MIBVP/1GGKIbnrf9JWvBaKN1YxidTaV8Bf/eaz6qjxBFxy9chDzWTskmmKI6BDrevMQhiKygjc0ddZkUH3kPfk+BPb80eM2jiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:13:13 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:13:13 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 09:12:57 +0100
Message-ID: <20230320081257.1788039-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320081257.1788039-1-francois.dugast@intel.com>
References: <20230320081257.1788039-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 058633e6-b8f6-4716-22ae-08db291af32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UgESPQvvFoI3MDH0blE/tQ/P2FRpoaYLfXam8/z3S/ATQ5ILvWo0CBxGa2Wgml+/A2ALjcCM3unvDVAlNnzOg8bqhscRIQaCC19QDa9ZP0H6RAH9HouSieOWyjktJBuIIMiFk1FLoJdX/9v9tc3qzIMV72wydsvqSAlbZxbr3QfTzoQPIl+/Maf3hS26CFFOnrTtnue4ci6s91wj6vAMSVUTaPH1NdQjRIlP4z76nD4aZtebvVbZqepBKKKTOmGnGVEUtoJr4l/969Lw7lfMWyAmYfGtwdytQ2Cc9LYs5xTwSo36RbtW8mxRLMBUmN8hQbXrtPcIaf/LAomT2gf2WxJXbijV6j/sd9sF6AOmGsc/Kk+vnrnJY3OzydeL9Nti8PVVzu116nMaopcssgJZetg2ituhBiW42GFgNZ4FtxNJyVferclf8KxlNqOznrYN8/avME407TaAi1rf61X4mibP3uNPkllriJ/N3U30QnYAYP8Bm0fktyuJLesGMncrHtudLIx+R7ztKadqN39ne7GiYwNpzUG8vOvYfObgHaCzkkoA+zeBV3tv7mb2RYismaLoeDXbGPaPhfvAI41i5Rc7eDIxHJREbctr4lbpyxdlUbeZsUgKkcCfDEUocwqIXTgraqRXE0Dl9hcMlouQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199018)(478600001)(6486002)(107886003)(316002)(66476007)(66556008)(6666004)(6916009)(4326008)(8676002)(66946007)(8936002)(186003)(26005)(1076003)(6512007)(6506007)(41300700001)(5660300002)(44832011)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlpoZ0IxQnhtS2tPZHpRdjFaOHI4YzhLQ0pwTE5CNjZXY0F2K1VmbGZzL1l5?=
 =?utf-8?B?NXg1b2dQaGY0ZjhxNmV6OUhPc0E2VGJGc1hRMFluNm1WL1A1NUg2Wk1ZdXN5?=
 =?utf-8?B?N2h4Rkw2RnUxdnluMDB5SFRPdFZuT3JNa0VrN2ZpVHk3MFFFV0pLeHQwT2ts?=
 =?utf-8?B?VnhqVFFLcEtFYVJ3MXpWUVpvSDdBdG5pdlBQVEEvV1Vrb1M1NlQwMERRMVA2?=
 =?utf-8?B?UHVzbjByYTQ2OWZ6S1A1R3pDV29CcEhXMGptZ3FjSU9GWXplaVhFaXhwY01y?=
 =?utf-8?B?bGRPQkczZENVWEMxS1hnOVhXSXdLVHBQQzNHQTZRbXI3aDdsTWl3VzZlamQw?=
 =?utf-8?B?R0dPNUw2cmxqL2djNVFkbTBUUlJpTVpHcEp5S0YrYlRhNVkwdEpzVmlySU5r?=
 =?utf-8?B?VDhiSzNZNjN6bVVuOVJhcGtOeWRmbVN4anpmNkFxbVZXSUk4SjhENm9RWGEv?=
 =?utf-8?B?UkJnTWtyNUh5WmRmcEYzYjNGZ3ZjaGg2WmM5VEI1RlkzRTZIOTVITUFwYTZi?=
 =?utf-8?B?dHZIU245enBmSmVZVEZKQ1c4cWYva0xwNEZEVk9xeWtkdElQMldXUitkZHdx?=
 =?utf-8?B?VlJUUDNtZTJ5bDNXcFIwMGxFYWRzUjlZaGxwb0tXeFJpblcrWEJBNmhKQlJl?=
 =?utf-8?B?QTVrYUNzRjdEVVZ6NWVaeWJ2K3RmOG05N2NZcE5iN2lOMUJ1ZUJmRUVvQmw0?=
 =?utf-8?B?TjM1ZVBFYzZMM3ZYd2UrRXZpUjhZRFdPb0hvZ25zcGZ2VGFJTEV4MkVPQXdG?=
 =?utf-8?B?UDhvZ1E4TDJjbXhPZ2luUndtNzRlTEVjOG15OVQ3OVFCM0lRN3VmTTRhbGJG?=
 =?utf-8?B?Q04xVGE4bVlXWk9EQUVlR1JucGZjZ252cmJlaC8wSExma0FWb2sxMXlaS05S?=
 =?utf-8?B?eGFIQS91MGRxY2ZTczloNDlhMHU1VDhyVXNtT0N4TUo3WXdUMlhjSmxDOXpz?=
 =?utf-8?B?OXYveElPMGw1WnMyZnNpSjBUL1JpS2ZyRU1rQXJJdE1OWDhyUWUxWmpXRGJS?=
 =?utf-8?B?SnRLQWZZeEJheFprLzRzMWpoUU9ray85YnZBeTFFemcxK2VIbW9IK1hDS2lH?=
 =?utf-8?B?QWNaU1d1Z1Q1N1dWaGh5SHZSVUhWQktXdTl6RDExY3FBaEx3TUFuM2lweEx1?=
 =?utf-8?B?b1lhODEwVzFEOGJ2cUg0UmtOZnBCWVAwN3drY1dsVHBOelExU3Q0cWtxRk9y?=
 =?utf-8?B?Rnd1UzJlekNVQXRpbWt4eTRmZ08wUUZGbXcxMjFCTXdHS2R0VUwzZ3haN1ZT?=
 =?utf-8?B?bkNyWkdvK0FOMmVCKzNGQmRkTlZuZjNxMFdvTWVnNWhLUTFDY29PZE5RZkxT?=
 =?utf-8?B?MllKT3UwbmhnbWk3Q0g4V0xXTVJ4ZHhlSUs3d09vUXV5bXk4YjR1VlF6anR2?=
 =?utf-8?B?OTJiYzB0MVk5STg3UGh6dmRiUjNzOHhNVlYvaCtmTWdjQnJKRzAxa1dncmU1?=
 =?utf-8?B?eE03bG9ka0I4cW9vMC80V3BpNzJZZnE3QlFMMFVycWJRZHpMREpjcTM1R2xB?=
 =?utf-8?B?MVFUY0tPUERtQVpqQ1lXK3hnQ1dQNTJ5OENzelVFRkhVdzNtU1BjeUhvWDVM?=
 =?utf-8?B?dzhxTzhJNHpOOEM0V25kck5hanUyRjdPd2lkbnFjbmxWSnZPNzAzQmV4WmpM?=
 =?utf-8?B?TGs3aDF6WkFCVjFjSVNaZ3prbHpjOERNNFA0eFlYcjJCd05pWHpQR0NiVSsz?=
 =?utf-8?B?TnlRUVNqc0RHVFl4WWdGcmJDL0NXRlBZOTIzMUpIcWM0U254ZUJ1L1lQY1dz?=
 =?utf-8?B?OU9zd1lEaTRMSmJUUDBmTzBHTUJyM3NHWXB4RldoaE1hTTdkLzBkNFVyaEpa?=
 =?utf-8?B?UnBnci9vVDlCN0NGV0QwZ0Q1MHZwOVJmeHVZS1ZpcFU0ek1MQ1N3UUQ5UVJP?=
 =?utf-8?B?V0xRVWVwb1hQREJWUkcrTEpNVjFkb25OQmovT3JaZUdWVGtrYTZrOCtLN0ZK?=
 =?utf-8?B?ZjJUWkIzTmZaSU51MVZKWlEvYStrWkFpc2poczJNdjRubnBBdDEvbFVUcW05?=
 =?utf-8?B?MHk0R1EyNVRQdHpPZnE0ZjVXNitlY3NUM2E3Y000TXcxNTI1UTJKb1h4c2xa?=
 =?utf-8?B?ZHhualo2MXNwc1daQS9GTWF1aWVWZnpCOWxNbEVDejI2aEUvUHBjYVdjdEZz?=
 =?utf-8?B?bTZQZkxQUkpIUkc2RDV2bFNxVm9sK1crMFQzLzh1V0NrSCtWczM2TnBPY09N?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 058633e6-b8f6-4716-22ae-08db291af32a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:13:13.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqQRxJ0yU7/EflOG5xESJGqA0UuRIdnW4MQ71YvBNns5wd8cEd13MwQ9vE0ASFsv6obb2bmViW41fftfhzpdI4aYezTgotNxwedRfl3JsJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 3/3] drm/xe: Add platform specific
 functions for a new platform
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

This shows how platform specific code for a new platform can be
separated and maintained in its own file. With the use of function
pointers the modifications to the common code are minimal.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_gt.c             |  8 +++---
 drivers/gpu/drm/xe/xe_gt.h             |  4 +++
 drivers/gpu/drm/xe/xe_guc_pc.c         |  9 +++----
 drivers/gpu/drm/xe/xe_guc_pc.h         |  5 ++++
 drivers/gpu/drm/xe/xe_newplatform.c    | 34 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_newplatform.h    | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 8 files changed, 68 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.c
 create mode 100644 drivers/gpu/drm/xe/xe_newplatform.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ae440d85918..8745f8095c36 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -67,6 +67,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_newplatform.o \
 	xe_pci.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 718cd18b6421..103547750ada 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -30,6 +30,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_mocs.h"
+#include "xe_newplatform.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
 #include "xe_sa.h"
@@ -42,10 +43,6 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-struct xe_gt_platform_funcs {
-	void (*setup_private_ppat)(struct xe_gt *gt);
-};
-
 static void mtl_setup_private_ppat(struct xe_gt *gt);
 static void pvc_setup_private_ppat(struct xe_gt *gt);
 static void tgl_setup_private_ppat(struct xe_gt *gt);
@@ -413,6 +410,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 	case XE_TIGERLAKE:
 		xe->gt_funcs = &tgl_funcs;
 		break;
+	case XE_NEWPLATFORM:
+		xe->gt_funcs = &newplatform_gt_funcs;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 086369f7ee6d..18d732b49789 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -62,4 +62,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+struct xe_gt_platform_funcs {
+	void (*setup_private_ppat)(struct xe_gt *gt);
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ef3ccf83ea3a..cffe7443c2ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -19,6 +19,7 @@
 #include "xe_guc_ct.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_newplatform.h"
 #include "xe_pcode.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
@@ -117,11 +118,6 @@ pc_to_maps(struct xe_guc_pc *pc)
 	return &pc->bo->vmap;
 }
 
-struct xe_guc_pc_platform_funcs {
-	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
-	void (*update_rpe_value)(struct xe_guc_pc *pc);
-};
-
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc);
 static void tgl_init_fused_rp_values(struct xe_guc_pc *pc);
 static void mtl_update_rpe_value(struct xe_guc_pc *pc);
@@ -923,6 +919,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	case XE_TIGERLAKE:
 		xe->guc_pc_funcs = &tgl_funcs;
 		break;
+	case XE_NEWPLATFORM:
+		xe->guc_pc_funcs = &newplatform_guc_pc_funcs;
+		break;
 	default:
 		DRM_ERROR("Unsupported platform\n");
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index da29e4934868..c2c968da1dd2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -12,4 +12,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 
+struct xe_guc_pc_platform_funcs {
+	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
+	void (*update_rpe_value)(struct xe_guc_pc *pc);
+};
+
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_newplatform.c b/drivers/gpu/drm/xe/xe_newplatform.c
new file mode 100644
index 000000000000..9e791b633047
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_newplatform.h"
+
+static void newplatform_setup_private_ppat(struct xe_gt *gt);
+static void newplatform_init_fused_rp_values(struct xe_guc_pc *pc);
+static void newplatform_update_rpe_value(struct xe_guc_pc *pc);
+
+const struct xe_gt_platform_funcs newplatform_gt_funcs = {
+	.setup_private_ppat = newplatform_setup_private_ppat,
+};
+
+const struct xe_guc_pc_platform_funcs newplatform_guc_pc_funcs = {
+	.init_fused_rp_values = newplatform_init_fused_rp_values,
+	.update_rpe_value = newplatform_update_rpe_value,
+};
+
+static void newplatform_setup_private_ppat(struct xe_gt *gt)
+{
+	/* platform specific implementation */
+}
+
+static void newplatform_init_fused_rp_values(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
+
+static void newplatform_update_rpe_value(struct xe_guc_pc *pc)
+{
+	/* platform specific implementation */
+}
diff --git a/drivers/gpu/drm/xe/xe_newplatform.h b/drivers/gpu/drm/xe/xe_newplatform.h
new file mode 100644
index 000000000000..e4e0448b86dd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_newplatform.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_NEW_PLATFORM_H_
+#define _XE_NEW_PLATFORM_H_
+
+#include "xe_gt.h"
+#include "xe_guc_pc.h"
+
+extern const struct xe_gt_platform_funcs newplatform_gt_funcs;
+extern const struct xe_guc_pc_platform_funcs newplatform_guc_pc_funcs;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 72612c832e88..aee2b1a4ba38 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -18,6 +18,7 @@ enum xe_platform {
 	XE_ALDERLAKE_S,
 	XE_ALDERLAKE_P,
 	XE_METEORLAKE,
+	XE_NEWPLATFORM,
 };
 
 enum xe_subplatform {
-- 
2.25.1

