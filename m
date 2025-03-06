Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1BFC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 23:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61CE10E033;
	Thu,  6 Mar 2025 23:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEO0WXbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8784F10E033
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 23:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741304356; x=1772840356;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=1OMY9kACY/TD7p1YJw3W2JCGcxno4OPcu+J9l/VDYWw=;
 b=NEO0WXbKgJBHEhkohJaQeikjLKMLIPbZ+mSPUllWW2y5qiNeJ62yc+Io
 XsAJBCpQ7BGfwRHUsZkcbclAxgp5TrkXJeX6Cx6QlWnUXEb4xB5g5csC+
 VQYaGIIsRw3cu/YWP9LXa6we8N7651tx9VsejBmiByLQG0fw8yhxReED+
 EgUQVQegWV16VmnbK1iwvWc6RUPw6rIgpN8yR37Y6dEHePvRhiNsZFk8+
 O0W8lan9k5/yb9BtbpD5zgya7wObby63FccvR1vBUQsKhcg6a8JMSPCsQ
 nAlxgxO7kfb7I8nChRfL/3qjGxcm4UKMhkGKG7ygxMQ09VmuS/nRebIg/ A==;
X-CSE-ConnectionGUID: GThaOaWQRN2+4GFU2SwK4Q==
X-CSE-MsgGUID: 9M0qj2F+SeKZWth7wk9YGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59747810"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="59747810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:39:16 -0800
X-CSE-ConnectionGUID: YO8e84JWTHKTN03BQHOZhw==
X-CSE-MsgGUID: CfVar6H1RgK0T0UGn5V4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156384742"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:39:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 15:39:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 15:39:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 15:39:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7eL93JK2yeoDnKaZVCMTQ+uFkJZSIkDh1dO3+5rUSt0F+SX//vzoR7FtythkUMVRDA3eGZKD38ja5KoLIwPBu8tbiYTgQM0y8Pc/FNjEwHfN+Lt8fuqvalvfEiinLNC6haODt4fjEKzCU3osT+/zuMFo9RZh5Sr8/+PLlzbDEjRcUwREHqhHbzuYvLpvxBUjL24fk2nST4Hl8vgduTV/L0cIk/G0FSKA7CX8nGVW0nvJ2HiC7ZoDawYVh5gV6CI61bPXimkYJEIAbRiCAwuXGw5KfoTKGdHJm/aUpk/xGEUBhqec5A/98BODPyxM7AVLhJ1o9H/3QwyqsZ+3uYTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5Q/lCYhLXVMfTySnF5xKsPvCpGSPb7HH2t4zB/SsvA=;
 b=X2LMkGSyEis9ZU176irNZ5SI/GJsrl6rwUebBjP9kwjMCGxZrxls35M4zzW+m3hcxlx+K2qYzgvFmLi5jofBOvi7UQzmwbVCo3yTlPjceNZJ/WrdMCBA50OZczk4rfz+fM9Yxn6+7btIeUTDaIwHN4mB0/Oe+2vvEtjIgrbdsRWIzh1/OtEm/g67Ts8B7M2bsb9B4vFnGY4FgyB+YSk6CIKW901gvMPREmuS+Ypn0DIS3j6/esWd+EwDt0F42yCZ5Jwu1bbKWIVLbPK1WuR/anOxQaxyiGMKWIhh6uBFCPcVrNJJTWWYAS0t+qXV7hgtIqyJSFpSaKewNxUCu1hAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 23:39:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 23:39:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc_pc: Retry and wait longer for GuC PC start
Date: Thu, 6 Mar 2025 18:39:06 -0500
Message-ID: <20250306233906.1043286-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0082.namprd04.prod.outlook.com
 (2603:10b6:303:6b::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8f4dbd-74b7-4680-bf0a-08dd5d081828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ab1XdecfKxueNqRvZU1hNY53Z8Wy8PuRl6p6YSLoEz5dG8o0PT1/U9QCYhHR?=
 =?us-ascii?Q?sB2VjkaHuQb0FLst54cwia2LyaH25kq0whserhaCaZzF883mIOb+jlCX5eCT?=
 =?us-ascii?Q?7HUbCo8m/azwQn1fvnaQBUS9OttKZA6EaiQisGezYT4gDuUp2ahBFhOGB/3r?=
 =?us-ascii?Q?ukfQYvKhr91BoHFvlFayz56f/IBWnw/nvw1EhwzIx/iPSdNAOxqRK7687ou2?=
 =?us-ascii?Q?+QIeRrq3wXAYBAlFy9LUsBDLQxMZx8gbBOLRcS4wzGoiO69UAWWXLNvSWTLM?=
 =?us-ascii?Q?CBbXNWzsZwJEfyx+dSJNa5FO66Gdr6Eczy1EJ+DMQBym2j5ukN3XR+qL9ERF?=
 =?us-ascii?Q?xensDn7ChgNzEorwvIUCN4gOTNMwaRXCLwyjTyrRKSrq9DTVQ/HOwf3xhs9A?=
 =?us-ascii?Q?Lk96/CxaZsxh0t9yxwRhV5yyG+LbKFCQHEZp1FD/GUhnPeREKx42Wp/oWRgB?=
 =?us-ascii?Q?HjqCi6SVmRVgByCbVV5GSSly20rpX9U5YFEVr8QKOfr9WoFR93MoFfylT/rG?=
 =?us-ascii?Q?qbm7oVOdcwEOLaGibDWsgSy5HODg7QFP09gTqiDHjBtPaU9Yq0GEOmNgrLr2?=
 =?us-ascii?Q?qWZb1gQqzf4udOxu8gKTR+ZtExVwvkHgGsLwQRAh8zozVV4YNKy4mp0xNUPO?=
 =?us-ascii?Q?JGzD0qyN785+KHW63U65lPZJXr0w8H/IGwfKQV6h+VBEEz+N7ArTw9Iz3fDR?=
 =?us-ascii?Q?B4sM9RYz17xPaSnS4zqjBhtOt7HHCZr1CogqMgBAqhtOflgrLkV+TRkoil0z?=
 =?us-ascii?Q?7fEl4Ou6KxVQML8c7rL2C1am29EqYqoeOlMMcaDhQ9aqZwAOc1ve5blwoROv?=
 =?us-ascii?Q?/AlixNCUeE9YiwYAUm2PXqBIRm7Eb8RXglfTMDk4aZJqMDSFq2BUCAA7eCPv?=
 =?us-ascii?Q?q/+rLUQAb1dkQdsWhzhQk3TY6CGaOli1IONpGCO656iqntVL4l1pRiR+jUOw?=
 =?us-ascii?Q?l2CJN2J/dqgomKiiMvfkvbge300FoBgE/k0RBMCN1pvbfl97LX1Mks5JsxQ+?=
 =?us-ascii?Q?QnAfVEJdJdFuoZesT6jFOp4K7Y0xTyIKFU/j7ySErRYOzBSdVIm1wfToLNop?=
 =?us-ascii?Q?k8qqWGq83HDPQ0W61vbzlUUO3KFEHZ9tzeORC7no3A3x8xf6wAWxal1wen6b?=
 =?us-ascii?Q?vD0JjFgJZvHsD0FArhFQitlbMX8kRoWjLv7S75eh8gaiP6/O3MLKLegyiLhf?=
 =?us-ascii?Q?noIDK3MIQEtK5H5vViIIXxkjqgrpmFSxttGGyfUzVf9eZQWEoCk33/beRdlp?=
 =?us-ascii?Q?2Tg2a75UniVHVIzq4DAYtWsIpKNFFu+ogeWONX1uYyrBPJcTxInKt3mTwRH1?=
 =?us-ascii?Q?CYSniLOJpcpM4Omy1M8yVZtz8w1sOMD6cC4nxk+Wr0DRVDhYilz9A8XXoFmu?=
 =?us-ascii?Q?LqA4Ogk0QUkTPrtT29QS4nv9srmA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nCITzEi7S0w+VzG//2SKVRPj9ZIPxzY5MjF2ZNNX74Ej9fC2OeilLbVsDTry?=
 =?us-ascii?Q?8/fQJm+BcbLjOmDTi0xh+VdS4yz2mGs2OflAs9djdGgvoMoyVmu9BUfsJtZH?=
 =?us-ascii?Q?jcF25Y9s/gsO3uNoBJvIAIufJr0VLVPhM7ZdgRLoaN1Bop60nIlfETfUnpdf?=
 =?us-ascii?Q?g2PcpmNUKYi5LjJfHAK/NqF8jMVqkqMRrBIlp1SWWkGqu8Y/Xh8//mX2yRz1?=
 =?us-ascii?Q?3BVjaXjMrEvdTYa2aNpAhvoKk1dE5N7hQoFF1bqz7n2b1JN40/JU6UmysiQa?=
 =?us-ascii?Q?z3r98wSBd6pOnFA3hDRSwyPqyaVCkQ3OA+KfdxsErBiVBzLiXoBLr954XvpO?=
 =?us-ascii?Q?//OvjbES9MpqnpcUn1liCZ6YLHyHjaIdwVdVGa3TmB5vyHRglVjmWpI3GWk4?=
 =?us-ascii?Q?RtBiq1iyVCbLhp7qZ6cTUwa+NemgKkshRAgjPeLLds/TS35aRZBYZf8/IrdD?=
 =?us-ascii?Q?P8UJOhyuHJ9HblW1xwOh/GQAgpu9nXJfv7Afx2J4bggWlB/eEOSRl2l7ilTy?=
 =?us-ascii?Q?XpvmXSoobMfzGUcROVS+25PjhMZiytk28ncHLYMr7IsnqOMh8jOCuS51zzZC?=
 =?us-ascii?Q?5HtjsB6CXhW7Y/se4iQbQXCukjgLuxCbhsqx2neXOTDPhuLboZ1WTJZ5Hyk8?=
 =?us-ascii?Q?OIq8vBxuJDocnGcx2Sxf8RmnS5qcKtfQQ9LbdDFEmhvS9R30TNcU9pzP5DFb?=
 =?us-ascii?Q?1z37myfXITixdvH1X+4yfjv2iNfn5LjzTLRYEFkZH8JAl31Osf7Le96FVYhA?=
 =?us-ascii?Q?TxpyGA1dUiRyyEGWG/IGXtbqaM8AdzcW8dACuvmQMn1uUl4z0w9FMrnwMFQP?=
 =?us-ascii?Q?Rcjtcvrb1RuMdawW1TB2IdmXne1a+VWdKcEqVgKhDjkuPlAZ4V51Oe1PGyxm?=
 =?us-ascii?Q?JHOUDrWUlY8eB4Lz0ZZqQl/BxRO3LobmNVUzlZWOxGJPmYp3FNkRQ7DE+lku?=
 =?us-ascii?Q?r8ZXNoZYElvGyZYb4BIKuW2vlta45MDsHR1otmq0peNLcjLLlEEnspx8Quzv?=
 =?us-ascii?Q?qGuEebqH9MJu67GbvN3DptrULZDXVA2J6dmjm4CAcZ/qrVJ39MeeOZRBA0bu?=
 =?us-ascii?Q?Ulcvru83rRLbspvUQlq5PAsTJDOnOM6B5Ro4EeTK1L9QR4zWS1fKgg4rRpK/?=
 =?us-ascii?Q?dRDynNZMZAEhs01n2bebGp1YOQcdO0iqrqOiMibcsni9CYYl2qMnnzkv4rpT?=
 =?us-ascii?Q?5g+a0VhPmzbXWVj4NK2jfRxXS9aZ0F3zHUgtP302mjU4mVhj4dBTKz8gjXCy?=
 =?us-ascii?Q?oocMRcx6S9RyhsEnDOH7wR8ueY+HY1iuVnPx6a5nTgRFGKU770NutpJXXCg7?=
 =?us-ascii?Q?BpTpLw48XhzPe+olnEAfpuMS+Jq7sE3IE9q5EYRnxGZlOe4uRGvHorqQpskR?=
 =?us-ascii?Q?OaTzfbg6glrbXvAKkN/yfSjK6zFcn+u1ezpYaasYCL86NWscVa6B0YSwgCI+?=
 =?us-ascii?Q?iRvHjFpIrDHFw+UF858KmVWLx6uQP0CEX+OEEJNIEs1viGX0g41ZolBmGUqs?=
 =?us-ascii?Q?/aPuVk8GvDhUQF2VDUoAv2dICh9Kk7zBTq1DbbpUVDggrRDCSD5wpzCe+VDc?=
 =?us-ascii?Q?tnLzInjX7q8pq8nT6T3C6K7H+ekFkvtrvkeRr7HL7w9GFQbul+VqAsjYEkSx?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8f4dbd-74b7-4680-bf0a-08dd5d081828
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:39:10.4728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxPE52QtgUXXxyPawnSEkhc5UUndWOOqlfBBAgS47JkHMItZBl3tCNwNVFy9srKDkgQvEV2D/TqWO/zOlIqXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 53 +++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 25040efa043f..ec39a8f2781f 100644
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
 
+#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
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

