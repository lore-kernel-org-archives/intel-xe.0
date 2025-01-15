Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746E9C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809610E717;
	Wed, 15 Jan 2025 14:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMR4lzc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D340410E717
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736952376; x=1768488376;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kYlXqRgp2mEm24AVQsx3AEeIxNKp+uVtH3O3mEwm9iE=;
 b=jMR4lzc2XYcAOdtRTWlUcUUbtEhm90AZ68P75DILSfkI5JDjSdCGHhQ8
 9Ysw7H4eF83Y/hhN/V0yDIsaJQFnUnFy9Gesvg/KGx7zXS/1rvuQDU8MC
 yJvNxfUSvxmaZII9RyMA4VW/F0PJQhvgmKr/UkCDgE5sRFWgbuvjHnF/B
 xeQS+Q34G/vJOiBiqATMQ6iVpYG3RVK+/C18aw4i1h/Bl+BpyFqIX0HyW
 KyaAKIzVpCatgYFKfNdOEXuw1BSFmnc0wN9Dsur2NNZbZOCYj3qyZjuhn
 xHO180FGzPnH/6aav+qBm93sNMQISmMXxZ3/CUSSDjiCDIU1UaMQ4uB73 A==;
X-CSE-ConnectionGUID: +gfuJuerTZ2TxolaeJSu/w==
X-CSE-MsgGUID: ZG4FNl5XQJm4KbhO6jJ3bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36984566"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="36984566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:46:15 -0800
X-CSE-ConnectionGUID: LFvPxvyyRu6xXZ07vi1qmg==
X-CSE-MsgGUID: iWmCduoaTJ6rnVAWanUuQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105748238"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 06:46:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 06:46:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 06:46:13 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 06:46:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUDEbhW4QOXr6GkYQY0UdhO+124gOpo6DLE+so6xlr2gDBbnDD0a3lgayA0jQAnZZWI5dW7Y0ycoYuuYi8galcxHT5yeHoMKnb3STtkGNqldtMdQHFm8VbNYpimAxQ94AkHOyxRzdEGbQ1fqvDbAI5SoNeyPpr9gbMHki20oks0G1IJjikXFnLh/3s+W2bqeOsVsjTsoUFH4s5i43Sg49s0Zq/uyPttjXh2yI/LCERE4SnTTgxu6IXAVD3xWomi85E0tC3vNQ3A/z8SRTMa5BHWSs11pP0VkjFEkmvb8yC8hSNAcogTB5FO7KPe4H1s2TsWi6NVNdRjnxIdpL60DmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyR7DgyvV/GhNH2EMVMe0ms52LZindhGHzNMuiFjDOQ=;
 b=IgwD9Za9xanxPyhW2evaZLiUvjNivTiAKsyk8dVyeTpRkxgW5wRoJe5PKSiSK9Urawjt1deXq8LT1SFh3AhREaVIJlmXnJWD2Nq2tK2t6lWwSPo5u+1V0BvsDL0MXNQZ4bHzJ5sbKGC1bZpfoRNWyon5VzfRsGTh5LUEDE+iQAi8qMTCmteKB5bSyqMSbMuPlJNVxCaZLT+zhtzp8er7DYN6RhshpneijfTEQYLK3nYyk8kEzr4l31hicS5NQaeS/WvrJlISx260zhdIZlOLnyDLKdZdgXhFSY4KVsDU0PV9+1hC/84fxaDfcveOTL86DF1X4jGj36qfBgxq6XLBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:46:10 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:46:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [CI 1/2] drm/xe: Introduce GuC PC debugfs
Date: Wed, 15 Jan 2025 09:46:02 -0500
Message-ID: <20250115144603.1141375-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b358df-2269-469f-2a6d-08dd35735a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TuxGhbCIiiHrhwUAOSMfEF6+Xxf/8btarUYBQ2Yg+POoYqIPFxRCfI1orUKC?=
 =?us-ascii?Q?rmFCin2roGMIC3L33q0lmhEojWfExe9s/M4A3UWElTV7C9S8BF9jj1Czh13X?=
 =?us-ascii?Q?6ffpOhMY/G8Lok5IeQioSnpMbAsiuZ4Vn3D7omTuaB8giWE1k5SQHOsXvZeu?=
 =?us-ascii?Q?y/JsQQ8F9E2FnOhLMu8j728OGSaShy0jJsomdkjxHv25yhVKNdufsEDpbmrR?=
 =?us-ascii?Q?1B8ETK3COE6TdGyd3KJrPqx59qy44WtshkVVClMJ17/4xcWbD1pGThSfjzrK?=
 =?us-ascii?Q?C80i7QjQqbEUGNLiY5W4qMBF9dvHi8lmQQ94HmV9MxBERdBKRkfBY+zC4Qek?=
 =?us-ascii?Q?BfVT0LZQYgq+ZgW8oreuow35mYmvWs/iEXz7CZ5j+Kcs+TqWkoQaJOLA2Zob?=
 =?us-ascii?Q?QASoMUDIxF2j+bG2PP7NvX2R/NNkEFTMOKJYD6bMwp/SXE/60P6sH6Wsqb0K?=
 =?us-ascii?Q?tDn7h2T+X0rTVucR6qnxJOY46g4XQzYfAX15Z/ARRYuVPOU/+jo+jlLJW3ai?=
 =?us-ascii?Q?A8LEQjXAFWOWfMe1twmc07pyMVnAngy9p/kYo/45p3w6+GFWhYqXi//dKEXM?=
 =?us-ascii?Q?h62F8hLuxMFlvn5pMnFNit6kxlgUeTLwBZqyW+fhgbemOSLZruBfTb7fMreb?=
 =?us-ascii?Q?IMrYk4vfDuL4DMgDHq4AmAtLjffJXSG2HnP0fMApUQz5R+gwjmyORU5Shces?=
 =?us-ascii?Q?uCMzEWZjVvu7Hz93ydpJGDCBUxTJJAkcYW1+fzcZMnaUSlWPnsuE2Z3o4Kmr?=
 =?us-ascii?Q?XfXdwOb9AlalH4Yoz1Ue3yxdese+DvJvjGmAIikke2wL2qrFKJ8eVJaZoZ2G?=
 =?us-ascii?Q?4kzE0CxwAXTXJc5YdKSVUBU+1WcKugPSDrVEsGJX1HqPl67NuusjrIjEgDy/?=
 =?us-ascii?Q?qvNE6LivRgg44NCZrLlxtF0R48sogwqUy40PboV3Jd2Atwv85WJq4qplXSIB?=
 =?us-ascii?Q?on2Kt10YjvqDOhu8fkOTVL32Zmegv+p+5wxWRRSbVXR1/H+Qf1DhteKlDJJ0?=
 =?us-ascii?Q?8JLoFWN12odBe3Ca223Vy40qpFgPtrX0QIFXWxisJEFi/lGcaM63Xn7jjtyH?=
 =?us-ascii?Q?KIEEvxbb0swJyiXYAvX07PBrq6PB8jFlBhse4v9uankdC2o6IS7gQhiHlh5M?=
 =?us-ascii?Q?q+Jp83ojRyVR+VqKYXKnY6iW/euMWF5ahfHQgQXo6+wHc6UXMU7xbuHYJxCZ?=
 =?us-ascii?Q?FZJMAJ0o2meMQu8NMMDdsb+RRqR+Kq8hNtfJsN/FFCmIX41RvXKlokrUTab7?=
 =?us-ascii?Q?9kHXCVNxC0IO8htXBj7m4UeUYvLDgoDO9HFncW+kItvGZ93eoRtHXTA9HHB0?=
 =?us-ascii?Q?xbJhIkuTD+QKvh7g3Wt4hYEag0x+8JmS/iOv6xeVxCTOsGz4Eg3R0qu9oGWv?=
 =?us-ascii?Q?OvBEYvDkjsiuHUysKKB5EFdncgL5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/gEh/fDJdBbxnSQRlqHwTyBr3R9nOJTXX7jOD4C53eybqxPs2SH4guqvUVMh?=
 =?us-ascii?Q?+6qDqKB+L2LH+IUfJUaBBUp8alureMrPuJw8f9Ae7g5U25HTG+zo2zDKErW/?=
 =?us-ascii?Q?mbWYpmj+r7QtBVtsjvhvcJBpmYDiQ43dv+jZtc0oHbLAEtnCPwtgLRexwGOL?=
 =?us-ascii?Q?AaHqEf3KzGhZwaLop08BtmayphI+zypNDf6wG3Wq062TiC3HpEaZM83MvoUi?=
 =?us-ascii?Q?GD7kKSN4/LLSNrtibg6UgUeNtIgJX/gBQZlhjVe994uCjPnGsSE9iN0whdqK?=
 =?us-ascii?Q?M6Lxgr7kFEVDFtNXQljj0MnsMJOfZ+c1HPLUcGR2gPM2UVDaZd99T/oxvJJw?=
 =?us-ascii?Q?jR9Gb2tHWnR7n5kiTLWqpETE/O6bOYePMKWtMZ0kCjihPrj9xZFA54GgI6/S?=
 =?us-ascii?Q?F5vYDFgF5gUEfAJvSkVrZbss685RqDpKc0dCKu0zCKVOg8QP2fo8ZWG6uKvX?=
 =?us-ascii?Q?/onEyUpQbo13wazeUs7jP2jRymACPL8D4M3ipyzvgW/hICAek2HXbcJRBVtY?=
 =?us-ascii?Q?9FZvIlozdG/JShqY54AJ61S1ldiORAb/tu+FFffGU+vi61/2glZUcyXa7IeV?=
 =?us-ascii?Q?gpN+gpaOZ8xwF/VD38Q34efIfY4PEC2awq1fbWNFu0XXJcKHFtFDUDAzINy4?=
 =?us-ascii?Q?YAo0WnEymfCiSvBCbFiSITa7aZvJ3nri5whqxe3x6ZpalPQYnucrKi2+V3CK?=
 =?us-ascii?Q?s0s4mXlVh5Xlt2nAs8PsQGGZOj/f2YURlS7lb2JMTNznFBKGycx1Q3PuzdOG?=
 =?us-ascii?Q?AcyYUhRewx1z4xyY4Fe0pFVBEMvkuCe7XNDiRAggKoz/qTlD9A3M7Ycq2ZXn?=
 =?us-ascii?Q?Sb7Ih6JIRbNDjZFi7F/KOBYtRScAnfm9NYvIOJmnAeNNtOfPxBMccTT9P54v?=
 =?us-ascii?Q?sDVgLNMXmvF9chVA55UiPRNrO88kvOWqpQN2kKdEcFqzvn4uwh1LO6xWSxLQ?=
 =?us-ascii?Q?0mBg6ZyzN/qUcF1oj2Yz4SebMe4xdovpSLpOe+0cNKrrIUnB4DomFL4gjfln?=
 =?us-ascii?Q?+5G5NC4KoOOCzV9NxdeOBqCxDhEe7PYWT4h7x1EELHxNFqYT4HKuSDe0xETb?=
 =?us-ascii?Q?rYqOLEPXxS0iD/eHhUpenaaq5FcjAeZdEuKLdDFLmB8MSAmsK1FMqBtcdGt+?=
 =?us-ascii?Q?tUDDI6OaMDA9PPW1CE5nbvDTacuy/0bzl9IOIVb5vUz3NtxTzyQArTnByb62?=
 =?us-ascii?Q?v6VHBIFii6CIl/ngl05ppIuSiKyhoBE7HpCP2GSJFiRjEpMpFhTJ4TLAw5hX?=
 =?us-ascii?Q?GB0uUF/OsC4V9gDhUZUvLD8oO0cvAjDvQIfh8LCZQ0vCrEZEKrEGO1riW37h?=
 =?us-ascii?Q?/VuovIvBefkfcSkTkGLud0mvGKqskKGDmNNjq65cZ609xle+j8E5CKpXM3s+?=
 =?us-ascii?Q?uOYsTZDK5DhFD7AmrRfuud4L9N5z/4r5aThCAyDrT6tjuCUVrXLcqtPox4fs?=
 =?us-ascii?Q?NFIPFNEw9nd5BB/YXnpPQhJo5nZyzuYTyVj5XqgXIKiM43039m0gnndxsq4a?=
 =?us-ascii?Q?enKACNI01O5oVnUxTczXbc2pUCfWutnYY1UHnM/QvhrwmW8q+KZ+DfSMmIbf?=
 =?us-ascii?Q?fX0P2MMRAdUf73L7eU/Rb4HKmvtdMvF69ZbrxdFKf/8cf2VZT2k8TJsrOpuT?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b358df-2269-469f-2a6d-08dd35735a11
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:46:10.7218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ2g/Nh0QJ3aEmD1j313q+GuTkzlKG38GOp6MCqzFB71qO1/NZD2QZPIli+XaBr8u4BUoqa/RKqeIAkoFwEhjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
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

Allows the visualization of the current GuC power conservation
status and policies.

v2: Fix DCC msg (Vinay)
v3: Simplify pc_get_state_string (Jonathan)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c      | 59 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 995b306aced7..0aff1d462bc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
+#include "xe_guc_pc.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 
@@ -60,10 +61,24 @@ static int guc_ctb(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_pc(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_pc_print(&guc->pc, &p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
 	{"guc_ctb", guc_ctb, 0},
+	{"guc_pc", guc_pc, 0},
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index df7f130fb663..43f9617baba2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -1131,3 +1132,61 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
+
+static const char *pc_get_state_string(struct xe_guc_pc *pc)
+{
+	switch (slpc_shared_data_read(pc, header.global_state)) {
+	case SLPC_GLOBAL_STATE_NOT_RUNNING:
+		return "not running";
+	case SLPC_GLOBAL_STATE_INITIALIZING:
+		return "initializing";
+	case SLPC_GLOBAL_STATE_RESETTING:
+		return "resetting";
+	case SLPC_GLOBAL_STATE_RUNNING:
+		return "running";
+	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
+		return "shutting down";
+	case SLPC_GLOBAL_STATE_ERROR:
+		return "error";
+	default:
+		return "unknown";
+	}
+}
+
+/**
+ * xe_guc_pc_print - Print GuC's Power Conservation information for debug
+ * @pc: Xe_GuC_PC instance
+ * @p: drm_printer
+ */
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p)
+{
+	drm_printf(p, "SLPC Shared Data Header:\n");
+	drm_printf(p, "\tSize: %x\n", slpc_shared_data_read(pc, header.size));
+	drm_printf(p, "\tGlobal State: %s\n", pc_get_state_string(pc));
+
+	if (pc_action_query_task_state(pc))
+		return;
+
+	drm_printf(p, "\nSLPC Tasks Status:\n");
+	drm_printf(p, "\tGTPERF enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_GTPERF_TASK_ENABLED));
+	drm_printf(p, "\tDCC enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_DCC_TASK_ENABLED));
+	drm_printf(p, "\tDCC in use: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_IN_DCC));
+	drm_printf(p, "\tBalancer enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_ENABLED));
+	drm_printf(p, "\tIBC enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_IBC_TASK_ENABLED));
+	drm_printf(p, "\tBalancer IA LMT enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_IA_LMT_ENABLED));
+	drm_printf(p, "\tBalancer IA LMT active: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_IA_LMT_ACTIVE));
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 619f59cd633c..39102b79602f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -10,6 +10,7 @@
 
 struct xe_guc_pc;
 enum slpc_gucrc_mode;
+struct drm_printer;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
@@ -17,6 +18,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
-- 
2.47.1

