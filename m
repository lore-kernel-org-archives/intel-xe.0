Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F14CC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 16:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870E10E079;
	Fri,  7 Mar 2025 16:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3IA2bW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A831F10E044
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741363411; x=1772899411;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=OFzWhr8aSYtoh2C8gaHhanfydRF8VDQr3vo/jGgCc2k=;
 b=A3IA2bW5oQlCV1553/tU3weQm8a4SMFMPY1IU/FwQIBLqgRuQ1bdhHlF
 J6CkZO7ZoLDSTJT9wlfsbKaX/TTucrzcb8TxFq6eNBh4WSXHAxeqoQsxf
 vKbZCCRD/lVt+gXVooRwxOosmWP0NnUHxsC7zblKfwOW+QfLHbe/rsyQi
 /eT25OMsFyjpIdCS+N+HRRJrqL8WHYPTkQQtmVr0kQ0wfYGfcYjJFxg0O
 2/LjZnAcP+/L6jrKkGFqdC/9T309LKGC6ur8A3jZdBWuPfe19c/0NeSii
 SayUJpV76Tet9cTmiLMiusw1Xf5AOXOgeJ31odk/E4ovKrq/Ytq19xTHF A==;
X-CSE-ConnectionGUID: eAXzNxVoR+iz8BEnU6Tlug==
X-CSE-MsgGUID: 9m3ZGieKSlKE5d2jGCGNdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46339948"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="46339948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:03:31 -0800
X-CSE-ConnectionGUID: nHjB8WwOTJWyHRIiEci9hw==
X-CSE-MsgGUID: aSvFoTlCQj+T/JQhPG7pGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119860762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 08:03:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 08:03:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 08:03:30 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 08:03:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByqpG2xFXt8xYADWiClIcLyzi4EgCGFWCc5HPBFFhkSA+tIOMyLrH0WaOZ0g0UYQ7LAIe98ZqsgZrfxrF0I6Wv209nAhSQwNog8HSgNp+RXEPCPE3oylM4Ap0TKjzL04ZU7sUjFfOzLcxAI/Xk2RjCyh7olAfaz+glTEKYUPjYNpHKKWcMZ9xcn/Qn5U7kz0JMcr5OhZDf2Sb8DrVBb69geNqmWUcljr3R+UBie2Inu1l7U10XGdhdaj6VAKNTflRGhZZlyKAwpuvNiK+Z6etYPXmEUOPv7mpjGRXLPccD2+6evx8PWLzXwKsI+B/HRDK996JD+RP/hY9tL+qW5x/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFJcSzPJwhT1G0DDwXECo/oOeIC52YQlFMOA8Drd5/0=;
 b=mVFhO5zET978Z7oGWUr97egy0qYtSqrW04AitSxlVgdsdVtHqCI7I9WhzTdAauCo4C6EeTgWl+kc6/LOb1OMD7jOKBeE5WUTlZFzdD7AquODRRcut76RM8J2gJWww8TB4G/iJfrWVHDJHKHNNpod3NwAbSTDzsAoooHrITfwfXGCw6mqiVNUNGxGkH1gfyFbmmSDIaU5jK6oTMTAOOrq0SwNkHsf8gwJjopBnE/40yYp1Lrhi4o5UOKtMgi5/70RKv/hwziqY1foKO03I+VQjKKRKT/g2i0qOQgzsDv/GH+4mgpO0aXuOUu7l+mvGK9RSeYuTA0CEvUx7bOXaFAV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 16:03:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 16:03:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [CI] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Date: Fri, 7 Mar 2025 11:03:07 -0500
Message-ID: <20250307160307.1093391-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 867fd307-eb02-4c23-2b89-08dd5d919023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uIMgjMjjlW2YIm8WYqk6nodg/IwCxTKzspjr8f9sF7AIiGXpsOY52e8vzwSH?=
 =?us-ascii?Q?+4huWAG/wTACwVAXpoFfE/tzAfMPLpdiKJe1cUpssiH69iR0+sXUt2ceYZxr?=
 =?us-ascii?Q?tRaa4KBN1cY1tSHJKz2uTgzFcxYHgn43AXV5JSzG46xgN5hg+yja20+mMSjS?=
 =?us-ascii?Q?U9KIAEen2H8g/UxrVffK3eo/+4DzC2O3HGLPEoGv7vPg24rjnlif1a9K6RM5?=
 =?us-ascii?Q?eY8j6poQuW8bXCPzFD81nYF7YqVK9o0hfJYk9DodXAyww1uzu/BfdcNRqV7H?=
 =?us-ascii?Q?trSr8WnrLY+ELd/gI1gmL0YvkTk/p8xA67ye7XlxOmR4Bl/3iT8kVB4s11te?=
 =?us-ascii?Q?IAzlgoj/a0XxC27S+adU0GFgLhKUefBNJuIeDdtV2aWS/T6PdWPmU1wFKJ34?=
 =?us-ascii?Q?V+tZuX4Afi3YGeihkQMGNdlpaLIvA2l87MVLoo3/ADjG6dLsp813Te4Kgawt?=
 =?us-ascii?Q?FeO3PG5n+g0H9vdT+BlwZ4LmcBYi87JoFya5FzbH5JfZ8pRvPmdTcIPbUAX1?=
 =?us-ascii?Q?ToNaD4MI4Y4c/EJREBJI6VXomVjlGGlbnZGekTh4DDKHfcqccStdeMVgvc8p?=
 =?us-ascii?Q?daDP7CkOWgCv//MXvlBEjMap+YsNPSUxJzX7sYH+1cKoa6YyK25PkK+oJQwr?=
 =?us-ascii?Q?5JOkmU7kmLDsuyyt/7hLwHO+tHGGQcYev3rGg2uz1jm5HAkduCa7kJtOu/vU?=
 =?us-ascii?Q?An7ECLp40+4f6gy9ZWMZjrXi+53+Ug2Qmq8hiHtvshWsa9ZbkWkX8w/+ZaCx?=
 =?us-ascii?Q?PnMo+Pegr4tjouorKHHFNT/yXcSVds0j+t2XsUw24oWg9z/kOMAz0bvUGbmd?=
 =?us-ascii?Q?0EJYGSiaY+AC+t1wAquSJedg5HmxYxdft+jXJUihhPlIRKppNdf8oK+Y4XDh?=
 =?us-ascii?Q?4++wNlXJTdfNET6QZNgY8kOjIXaeKQZeA8bbKmmOqP6jhn0LyJsZA3+R/BA0?=
 =?us-ascii?Q?nkESI/AcKjcy+bSakZNuRpe7w3ghKVfbc3i6hvyn52pmBnGqd2gns44aTb9J?=
 =?us-ascii?Q?OQ7i9jaxsOR88OPJ05Xg6B0lgOm+9hqpcuM8aJ+CYe5J98a8wDmiIOWCXx4v?=
 =?us-ascii?Q?DIzr+Xr2Dy8Xrfcsn3tBxX/iQ9T747OqonB+F+uf6/Tcc/nnULBKZkf40naB?=
 =?us-ascii?Q?hKK17kbFjS8QxIDX0tieXIKWh8O2nvaYdf+HC0OFj2JxtowUp1TOBecIK3d1?=
 =?us-ascii?Q?tOkR0fclRASzxn8f/qunRj8yGi0mhvZ/wR0/KrZBrDVx/Jt9pxBV+L9zF+6L?=
 =?us-ascii?Q?RUBs1z2RzXE+d/XkI1bWVQl25SCieDlGqfAD8BSgl7EzVkI/zkF7IgrKnOlm?=
 =?us-ascii?Q?V87a2X3Ll8141i1ZlXGMzpfRzLNpd7XTRC+S92zCO+BlY5CR8ctLO7tPsx4y?=
 =?us-ascii?Q?86wxKuUyjrI7YMsWtpqUtwRw/dwX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ExgA651ctJDTNM59Z48hEKLG7p/CVD51sD/wDlZCybBhM7yQwsF9z+Vg4f6M?=
 =?us-ascii?Q?AMD8fjtZ+I3QFc0Rf0qXBBZu//DNO4YQAmi0D9XE0GTr0s/ESxmynfeZCrHT?=
 =?us-ascii?Q?53o7o4LDtGNeYt/Jk/p7erYv0OQTVJ0ZSTdt51poGIDszcKasWKKG1sTjtKG?=
 =?us-ascii?Q?m9d6E2am1NE+tCNGkWGE82Q0VqoU+epxCL3XlPW5qVcAFPV7ylTO+NdCjbCV?=
 =?us-ascii?Q?vUTkaFMkw5aHg+FYqyWOwxMBW2DabPpiJ7ectDdvKEVx7LrUeayfLRf51L0C?=
 =?us-ascii?Q?RDDLVSJZMUTeOzP24s81QMUdhklvTEx3QieYBhRpEdDXrTnatkYsy9ln03dL?=
 =?us-ascii?Q?wuL4/6GXI8cbz2KbCII8/DpYWb2nr6+PeVt4CAjD43GE00A5I7Hc4CsbI0p8?=
 =?us-ascii?Q?mOwYYiYObshWjNvwhojM3bziL25whgkEx6Qumm29SQzme2y4DYHF5LjvIQ5o?=
 =?us-ascii?Q?+ClWy9UcF4VBoENKXLmJExHmk5mfqx5XVMwJfSVDJpawJNq7bti8Km2L64Ez?=
 =?us-ascii?Q?Vz8mAHWCAPEcskqqusTMAZqkZ9bV5CZkKA76J9vHRQiClWQu3woP0/TZ+5QZ?=
 =?us-ascii?Q?JMRJSGXAAAZ73K0zeSozkb1Ywn44Icl3ItlAzUNz7mOESPgzz6uay8ceA0rW?=
 =?us-ascii?Q?DXBkcjltsrqBWExnn6bKeGQnLRrnU1n2PE9WsXXndxBiUy3Hvkog6Y06D7X4?=
 =?us-ascii?Q?yX9eI9laT8ib62J10/6kHt85DScIyRU+PWfWd5PylwIXx7L7GfmKw8Jokc31?=
 =?us-ascii?Q?BxgUur6flUgbHpPnkuv4I06GlLmfABfBblwXHUKPqOtMPVXvbATruzxN6vA7?=
 =?us-ascii?Q?MPOPVFZMEfic5MkvwtBL7Qtq/p4Qk3vOXCyLM9Te3I00HNUHw/m7xDZwOAfs?=
 =?us-ascii?Q?SMmxRm00ZTTv+SLd287H0cF3xnWKY4fj3bXqYQv+6k5HRtu7pqkoyaZQbBpt?=
 =?us-ascii?Q?fTKlZjWRV8gJqvm/w4YOHuL2vpjR0N4l2J+hvoHhtiPZU434zq8FOxdhgp+D?=
 =?us-ascii?Q?UPorn+dHUKEcrhY42jKdokLh/+8lQSaEqWpIR9LA6STi2Ho1zt78jTyIkq/X?=
 =?us-ascii?Q?DLpoyqYQ8LO1NAcyzT6SZajw7DaV4nPvGmYDOruk94Hkqt06CAPrKwbGH/Eo?=
 =?us-ascii?Q?+rvXnq0CipoD3sId+ls48dahJ/MhLKdCTZUaEokMHP8zr6Ub0GLUO7f8cSmD?=
 =?us-ascii?Q?9kkXUmCF4SzNDGOeR57w+NauHpYaWk6MULONSKLjLCBUg3DNW9JMFJdE1QZ8?=
 =?us-ascii?Q?O87uqpK1ZydL0RqYSqPghZF+oiZos0xxMHtNSNgYdpRv7mKduQ7TSvstwz3I?=
 =?us-ascii?Q?OI36qB907uzp2NCjcCLvfZ2iJJFHiHG3Q/Zf6v+K08tlmj324tCws6FDOUqY?=
 =?us-ascii?Q?lJj7jTDZHL3j9YMAh8FjPZH0XkUuODfmMYs3UQOMlCR9jDp98TJ4NL4xgg2j?=
 =?us-ascii?Q?P8lrIWypY5SRuwj0ygvcmTsVTCbANy+Ng78Z3UreU8BvtyUEPqNpEUf6PLPt?=
 =?us-ascii?Q?K9GHAal8dt3KDY4KMa7ZtD+ps0ntWJGlAgoah7uwCyWnhn42IU3i8aJBMHKU?=
 =?us-ascii?Q?NTjGxLwlMxW6Gk2ar7SPiqXauowlwXVU9cckWu+f9beq3ppT4Xt2JcM/NX0v?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 867fd307-eb02-4c23-2b89-08dd5d919023
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:03:12.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vF6Nhw34h2BxTXk0oubzJsPDF3Qv+RgiOvuM7ltjxhnoGz+bLnEVSiH3dbv0m+Ae4m+zoLhaiQUvMK9mRpwUFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
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

In a rare situation of thermal limit during resume, GuC can
be slow and run into delays like this:

xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
   		 [status = 0x8002F034, timeouts = 0]
xe 0000:00:02.0: [drm] GT1: excessive init time: \
   		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
   		 perf_limit_reasons = 0x1C001000]
xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
------------[ cut here ]------------
xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO

When this happens, it will block entirely the GPU to be used.
So, let's try and with a huge timeout in the hope it comes back.

Also, let's collect some information on how long it is usually
taking on situations like this, so perhaps the time can be tuned
later.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 53 +++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 25040efa043f..85215313976c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -6,6 +6,7 @@
 #include "xe_guc_pc.h"
 
 #include <linux/delay.h>
+#include <linux/ktime.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -20,6 +21,7 @@
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_throttle.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -50,6 +52,9 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 
+#define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
+#define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -114,9 +119,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
 static int wait_for_pc_state(struct xe_guc_pc *pc,
-			     enum slpc_global_state state)
+			     enum slpc_global_state state,
+			     int timeout_ms)
 {
-	int timeout_us = 5000; /* rought 5ms, but no need for precision */
+	int timeout_us = 1000 * timeout_ms;
 	int slept, wait = 10;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
@@ -165,7 +171,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -188,7 +195,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -209,7 +217,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -443,6 +452,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 	return freq;
 }
 
+static u32 get_cur_freq(struct xe_gt *gt)
+{
+	u32 freq;
+
+	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
+	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
+	return decode_freq(freq);
+}
+
 /**
  * xe_guc_pc_get_cur_freq - Get Current requested frequency
  * @pc: The GuC PC
@@ -466,10 +484,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 		return -ETIMEDOUT;
 	}
 
-	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
-
-	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
-	*freq = decode_freq(*freq);
+	*freq = get_cur_freq(gt);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
@@ -1016,6 +1031,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	unsigned int fw_ref;
+	ktime_t earlier;
 	int ret;
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
@@ -1040,14 +1056,25 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	memset(pc->bo->vmap.vaddr, 0, size);
 	slpc_shared_data_write(pc, header.size, size);
 
+	earlier = ktime_get();
 	ret = pc_action_reset(pc);
 	if (ret)
 		goto out;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		xe_gt_err(gt, "GuC PC Start failed\n");
-		ret = -EIO;
-		goto out;
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS)) {
+		xe_gt_warn(gt, "GuC PC start taking longer than normal [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
+			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
+			   xe_gt_throttle_get_limit_reasons(gt));
+
+		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+				      SLPC_RESET_EXTENDED_TIMEOUT_MS)) {
+			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
+			goto out;
+		}
+
+		xe_gt_warn(gt, "GuC PC excessive start time: %lldms",
+			   ktime_ms_delta(ktime_get(), earlier));
 	}
 
 	ret = pc_init_freqs(pc);
-- 
2.48.1

