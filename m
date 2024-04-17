Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F5C04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727010F2A1;
	Wed, 17 Apr 2024 20:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYbed89X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA75210E765
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386419; x=1744922419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UNKEI6zirD4ax0r37exyn+F+dFl0Gli9c6//Bmb1YwA=;
 b=EYbed89XtoaI/2JyfiTWmIvbBi6fOgo0owYmzaW42fQEhnVdadmmryb/
 6HtV3ukkOSmlPKu8v2OPwCV1OnNw9Te1hlccyJWTisbCLXL+JrOS3tmBP
 5iVFR3WM3yUYDNLi2SEYnkc7KfvsKVXA932b5hH6LLtOIab5FHu4U1buW
 bB4vW07m2a+f8n/MT+74dxP7ktKF/jt0NueYbNGjwZCSUEx7chhUYcZKO
 EG90D/7tfS/ikcQ341fyftJbdfJAj2I568Rq/xGyJkWCOerGl4mA6c1o7
 bRSfP4lCW7HjF/jLbW0GGge3/2wEkdiwMPLlvcdQGv4/1WLCxSJ3o/kLJ w==;
X-CSE-ConnectionGUID: NcezlkiNQe2Bcsa0XYr0NA==
X-CSE-MsgGUID: FsYadmlpSvWi9bPdATQTHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8764232"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8764232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:18 -0700
X-CSE-ConnectionGUID: pJiSY6opRCWtPrPsnRTj0g==
X-CSE-MsgGUID: vx/ppb1BSeS8ueVKr5ddFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27375805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bosg50dXym/NYgPG6PZC6VL+ErirYYBMXswullxYzLoka+rADzwtGBhZQLPMBJ54cxy4KIuPVkQt9qXW+P6DHuwf4T5CG44rfXPFQ/1ghjU58LRAX3ZDwwAbsjgZfhfjj27aLmhL3h38gBpK/+RE6ouAbyDkHG7IOuGzk5DhjYST2pxPnNvBpMDpxMZk8TT1F38VhVTPah8yqb/EWU2XZE/fEKgnpU6hscOVxApRLrNwCeLJaNXvqNeb/U/AFLlYIFxdz9XYcSfdiR/0RNLn7oJwA6L/FUTxPs1V/Ys3joRIVQzzWZc/jfy0qxit8+RCqnG9ApTn6S/zdNeTan1ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FjisuDv2RXy/ZfmbDBZaJi3GLe+SlXoOAKL3qb1htk=;
 b=U20xep4ro0wZ0iWocEkI2Nt8LWnSw/+wYHTA5Fk2KKrACNhDbunOBL1RuUd90tiOulfs0j3H/H8WoMypyk7DX7eSIl8azvVlVG8KySz7UltWW2DGX4i69fXBzz7L16VHaWN4i+B7W1EUAiB3LWDd25TsTZVZbWEm3ZX65fJz+WqCaXKTddOS7mHeF3aflc7D1YRktJKA0kR/QQ5Pc1X/V1MdH6/nBqsZ7c/3Z2NRCmqz4zD+HTRlfUWil8rq4qW7xhB+T4M8vz+VOmZxbflkcOAawqVstmGjzuv1kktGqV7Xi8i79r3SI7peWV9ET5QbbOW1T0R7XYDKLennmsUfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 06/10] drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime
 calls
Date: Wed, 17 Apr 2024 16:39:48 -0400
Message-ID: <20240417203952.25503-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5b7dd8-03d1-4884-84df-08dc5f1e95d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9aYn57ThDGYSCt5RngPmW7DmPs/3upfKId5KzWcnojIywJnP0DIR4Q42L7XTgeCHFqSuR1E20+/HaWidk0oTPejT6ZVzpdMZx/vfnCUC7CyJJUgXTe4ymg01sXS80FfahufKne+4a/xjsYzAxJTfA9ewbONoNuNug0kfhTtnNUSkOSgzkzGaqSeEm44kVVyiXqcxNcR2ElXUY0zyxN7IcneMFNdQ4EpIN/UOtGMuSkizZBl4+ttyLWDYXT0xD6z8s7PDXjbbjWeth0rlurJtpyG59CoMnuLLgaLUKLyM14/SfovGKkJGV4pLUn5sYndr3zT0M36o59kzPRRUcgqzrHSf0QnaDGrmgW+O5PHUlCuE1cVc4PvFOcDKhT/Mb+CYy4X8IWqXTutTF4yc6L2CThkwg1FrYeZHCb7mmeYfIBkkSUhD5/fC9GiKhdrMvxxSJAyr5Gg5bQHgXy1IRixdKUz45gvgxrZJnKmP4tSXDUTIxo6HknQu85OvH45AJcPukFT6MnGjlTtTfXMdFpjmozJQMK+8Xmck424Hlpp3CX5nuB4Uaf3wuJswbvYVhQRsbl+lrD0tYk6NKs0NKMTOYA04dghzcE46lQdwWWAw9snFlSysbzFqQ9Js1Z67g2kivzjT6IgpiwqrWZDOU1VZOjY0oGqgaztSZqh+GyrGrmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UAvobOMG2V6YG4q6BOWdnV79wuAKmujLXb2TiaGmwHZKXLrnwqi+JlrJNSeQ?=
 =?us-ascii?Q?C1g//eJ/GB8wPyFtzeqRFT1nrTMGLeYx56GhmVJQcbJDWNtfGC22wonBQD5+?=
 =?us-ascii?Q?hHWZDB59Qlu98JIV2+xImVXmZ8AlH4DjOJIDRfmZvs48pr6YnXmmjm+GdnJm?=
 =?us-ascii?Q?pNEkUT0Cuu98zrsrplKsGusUOsCBlCY0nuelzodmYRoesg4NqiXBYxcKNohy?=
 =?us-ascii?Q?tj8HbBxodguvXNGVIykcm1XMa4YKkvgw7yWL2RGO6cnC4L0opNrDtpX5DjUv?=
 =?us-ascii?Q?uJG1++LYC7U/I6f/1DXlhh/DeBfCP9ZxQl2BVaHlJoPQT9yPAHAKd6RRyP/R?=
 =?us-ascii?Q?VHsztTfE3qBjtjrzO0fYD04Doko1BWi5VbA8v1lr6Cc/+1oJs/WT9HIMLuHR?=
 =?us-ascii?Q?ouZu2w0bWYiOGdhI5QELr55Rtcs7pJwRDhmQiNlYeXkGq6YQxEH/cQgLJcrh?=
 =?us-ascii?Q?/mgseTRhKceag/cAtibTU8k5EeZFurZJOzuqO7anp6OEwkMRt7phb6JUrsGA?=
 =?us-ascii?Q?HQ0pgY1KDZ2FUol0wmzWhZXD1aZJy2JYFN8jMCilRrU8MFXaGfyJVGMuJDIY?=
 =?us-ascii?Q?jzJOSAznYjAHjgZSW0xVXHFUkG2nyVIMhkwcFtf/VBP1F8NXZwnTt/QpECRq?=
 =?us-ascii?Q?jSI8moJ/acvVnhTWnf++NDGfT0oU/b4YnF1xfP8we1PDeRBktSd1NvsiEkSF?=
 =?us-ascii?Q?UPKkq6XmJ0BcpJPzM2mlWnqZPY+TYEBi/omx9EizPTQug2yaIqogzql1vHuz?=
 =?us-ascii?Q?LZSXoLeEh8w9j5kc6bN9eBitHCGUmiwEUPI7wOPVHQNhti4mtl01Z2tYG0Qn?=
 =?us-ascii?Q?oCwAN5OlGRDZ3H82WcqQFrXGNsHC6UAnsKld/YxSufvFMYrwYDqGhF0NmW4z?=
 =?us-ascii?Q?jMT+KiZAGsuHCc9lSg2TepcyeV+YB4eFM2/4gvBqF56GSRfgmthcIfFyDrmF?=
 =?us-ascii?Q?4HKQfJBwk0t7KJQfYZum6cc8R5yjm41RNy0LcNQLXQSO1P02k2A5/liv8niF?=
 =?us-ascii?Q?2vL/5O9RS/dKKP1x0whxTHWgwHcCqswHORy0l3Nds4bfEVTv9qoRa8iQxx18?=
 =?us-ascii?Q?Xb/K34JO9OY4YnFFRS2J4K6UkTSNUaf7Qe+uQbEq8Bd79R4xCg8jvmi5rtHO?=
 =?us-ascii?Q?WYu2UssKu9j1kFpMva3hWxp8aMk2dJI6ZxA+F+/TDZjuZw849xnja5pLyaAm?=
 =?us-ascii?Q?1ttzv2IUp3EumFoJyJD3cqq5JhFYtsfglUW+vzkgAhVJvLeLlmYe3Fp26QXj?=
 =?us-ascii?Q?hRV9huvJdLHgru1fkv82yId+SGgSO/RKhOsBL8b/KL+H2cJZQV99tjZnT7CI?=
 =?us-ascii?Q?PPfzZLThj5II3DXi8FXq4OhcqUGWFoxAgg1T7FbdyPN7q9tceWD8PBpDJk/6?=
 =?us-ascii?Q?zHdla+0pbP3/ZnuvO0td1iG/RaQqWsjIdmengqK2ZCf77yV+G1IaQfisArNy?=
 =?us-ascii?Q?nmr1EwOIXoghiVu/+GDbO1/4/PJU78EwfuUOPjeVJbR3vH6KWFjZKILJtzug?=
 =?us-ascii?Q?KSnjnBqQRFwCtpIkLwJzSvTQM+uwfUl8b9eZA0aYSdLyeHcsTlSkQ8z7z/Rg?=
 =?us-ascii?Q?WKst3XmkH7fKtPI8LPrEaPYB2J41MXtHv22eMdbD8FQykHXvVYZKUk4N1gZ/?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5b7dd8-03d1-4884-84df-08dc5f1e95d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:14.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ekyJhkNRMoqgwnvfTT1IuwIPsweBvFGH2zhc+qeQwmE7ZU5J+POs/mN7X7oAEUd+ay595SLm2Yx1DlNzukRDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

The gem page fault is one of the outer bound protections where
we want to ensure that the hardware is in D0 before proceeding
with memory access. Let's convert it towards the xe_pm_runtime
functions directly so we can then convert the mem_access to be
inner protection only and then Kill it for good.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fdeb3691d3f6..9889adcc458b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
@@ -1107,7 +1108,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1138,7 +1139,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.44.0

