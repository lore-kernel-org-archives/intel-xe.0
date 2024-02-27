Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AABC5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960AA10E53C;
	Tue, 27 Feb 2024 18:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEiuVFxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020D10E735
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709058948; x=1740594948;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Q0sd6pQVABBlSGfqiGZ4UG33N14C6p4FqHDfPafHivc=;
 b=lEiuVFxWVfHzwTMVtcy69RHMr9GOm8oOcXTgmXq5Hfn+g5aqhaebWNva
 mfGI+RdAuYBS9WQUZmDzglUDXc64WSIzmtfwOzFNy/792hJrOEAxidg4s
 7ZLhtqrVi0fHxvAeUVY+JrhrGSNhFzxRaz5Tzxj/9xj+LD0JLtPoRXDVq
 fxwIP3ce2146yJHIsL+op4NHAZrpCpo97PUr7urnjZWt6YeBN1BkuAO5U
 U5Ip3qgIr5lok5QTlMuq5xEu/YEKWMs19+pCMn/oliY67r2uSCtJzsuy3
 24XRn2nb+wASl86h/bgZ/MzYhB7PrPliy5W/QqkdDsUfztplllBc0DV7k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13973561"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="13973561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:35:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7112806"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:35:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:35:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:35:46 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:35:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrVgp6NGGw28xBDdXN4PsUI3M84JCCBGY6YnWSoiIlZ/jo0ZuxZMMF8iX15+Gzr3Ok5ML2Gn7a/9J/ZLy4rJx7SLCLJDAmDbwsTNxQgDsEw/ecN3SZyqK3+EPecUFdEeHLXmlEXa/urPRiG7C6jaPge6qhhNZTTkNz3csMkMsBhWO6zxYVPMXqznguZseD34rGr2a3KZrK2/sQL0a+z8LDeLW6lsX7eDHCF0L49FG2y6wnHnG+HrJXgQD5xrpwO33I5v9y84w7tm7RA/tX16x8/8X7S/XpcnVt+zsLwWJhSy/F85uZI/MBcqegPfOf1PkG6jozpJeRYLFjpDzQX/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVVFjNvykcel2etXGFNVDopzLkMwn+fK3ZQe9k/yFtk=;
 b=GHJMohg3d7xmpus3LGtMG7btmnbne+/2wQrHx70qKHw3ZdKgm7w13GSjuo1v+RWxIWcquzZjQqDbbSGB5dqbXjxkRilD8rIBBCipZjNcDdFuNYKs+v+1vW2C2W0iNVkYlYU/UJPCQwfSoXEnZdRWcVRJqpz1Mg2ZpS3LMMbnMrHW8dlVePciTF5AATkyOP3vIa7mKiCqOUVBlasmBhOrX2SceXVg3mKsxB3ge9hkr4jnD3MgD3I4TewCP8xmR27T+fqj75RMHYhcXZQv/6grg7OMVMsJ+akaI+DU4bpbSLiJXeUMsyLDiGZQ/7Q5nxA7Y/ToxmcuwGI2KOI8IKJ4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 18:35:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:35:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Convert xe_pm_runtime_{get,
 put} to void and protect from recursion
Date: Tue, 27 Feb 2024 13:35:33 -0500
Message-ID: <20240227183533.505053-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e5fa3a-fbc5-4cb2-599d-08dc37c2e4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMQpf0wdrhXlood+syuPwUDDeQQoDZ1L3vrxQfLSVAgrdATyRV2Sd09hSWLU1NxBq4PGDIhpKDOiijnBtPtketIm+V8490NbGpMAXn+ZUfnzjbpqNA6EML2fwq9BevgSiXLQJIRFkh/+RXirGqvUUH8yIODZLHV6v3r0WtLVsF7BMqx/1rcatX4ik9CWF1fFicCMNLs9uTpm53xFH7+l1/ZvW5V8SkVq3tzy3VsXPwFvtjGYhdA35L1fuUbWPJ3VaghI2EldPyPYcG9wq0sL3HqE/nGPiAg/D6zTNSwG0dj2VaoSSE5YYB8VAmPfnty/Ul85Zq08ZNuxS/x47XMm7s/mgmwX9kCKiYpGf1RMOsAAsukO991FYLncrZ3spWlziVCk54drhT4E2Ny88qE1Z0QXONOzKKng8wmqucrOaXbkVpgoCj4Vy1bpOT92a0E98OKt/6MA4LJxD2AlK5rUvkn+C/NaNeNtA9upPnvhM+jZFhNvegaUxlRoQJcTfpTn53g4E9SOqmcifvb5dMlgBj6WlaFTm2lc7g4Ynr8w/LMHUU52dbDVSliR/4Ttq+A3xMaYSKt2ukUrTLnPUSyhDxncE4kH1HDJTut1mAbRns1D3JY0m31ggH1OGAaIAmPbt/RVYYuC+qRwYaKG/K2uCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zAuCEHon9FAPh87naWoNf+NDaxGR8i6u/a5h0g/yQUtchogQ7J55uyTl3424?=
 =?us-ascii?Q?+Cw0bzoM6aHzO+2DuudhMqgVVCt1nauXbfbRuy0+LXem0KVoTgahnld4gOA9?=
 =?us-ascii?Q?/5+239fOmuAuVMRsc4aop8yYkC2J8loZCz9D6X3f6y58PXagzl6KymnqBRc9?=
 =?us-ascii?Q?4byo29xIi6ZXeT0FBB08LUvd7IBhtNxczDdkBe5khmZj1Np3xtzz41MBQY96?=
 =?us-ascii?Q?FVh3U/pS0H9p42Cbcr/qVQbE5cIYdKZrAXrKtfhTWL6L2p+8EmC5WBmrIQOk?=
 =?us-ascii?Q?W7aD0QfkaEDkjukNotoAhhOI/PN8voJAUnwcgicbnyGt0bC1owzzPXb1Zl8N?=
 =?us-ascii?Q?VFJXEJnKSMCpmTcJmR6RjGwBhr4+kKhXTr6dOj2u/8+3b9OYNqfD4SQQuoMy?=
 =?us-ascii?Q?d6VsBTz/mAuWAv1/ycWRgBOoE7XTQDdBfSma1VkoCCEDVcQk0+YfaMePO+po?=
 =?us-ascii?Q?9CaM8VGQeBiUBDX8Pq2Pb02QECeZBvHMRnU86AnUZ/lWV343ICsFaWFU3jro?=
 =?us-ascii?Q?zpkcpuR+W1+NCa/Z5D+EcYq4oEvFXF+DJd9vLMIWTMeDNw8aSSaOgvmeDNfk?=
 =?us-ascii?Q?sPVIjKETBE/MOwHS/mxRNtXFnzWstVRBCfzdZ5/UtNlXEhQuyQvJ1dHKnz2F?=
 =?us-ascii?Q?3zSxN1UqLWdAjQp6uA0/56eBXoNJdMO1Q2gyq9W0lQCZxoy2wyPrrGTOX+aL?=
 =?us-ascii?Q?7ZaKcr8fENVsHLlNWa64YNyh5f2kxwWVTHBw3q5JIp+wjA3GPiD3dhQscOvW?=
 =?us-ascii?Q?j09Cas4Us+ZAimvKVX+qXbmeL0b7FraUoqvuO1Kc45whCKxz1GsOJPpZU8De?=
 =?us-ascii?Q?6dvX8R/z47/9pw5c6S+YGdXNNfFMNAxLg4jODG0j/yu7O1ANFjy17BnssF63?=
 =?us-ascii?Q?X15sl8qcMxoex0JS6Aujru6M7dSJ06sJu5x+PFRYwwhjo223m1D+t2WfOoEg?=
 =?us-ascii?Q?d7B3Jwd2FGzrcRj6pZnwopY31A5WxaSPIB4ncn+/W164i1DtzDEys43FBdWi?=
 =?us-ascii?Q?wIOf2ueIiXcHJSDTQ2J8/x3GfJyzjHDawgV5Vk4htJBDokulMfGgWkjlViRJ?=
 =?us-ascii?Q?V+gKrzAFz0hj3608EZBt6hmQC5JLjn/onmJ7v/maPvsMRq2sjAHedd6WRrgZ?=
 =?us-ascii?Q?2GflNNajZJduiCppmPWxMS/JztRlfZNb4Kwvv2aZaQqCRX3QwpOpAWQTfR8O?=
 =?us-ascii?Q?tC33fgvXiUu7/Ur60I4DKn3kLClUX9EB/XrgzTU21c4Wzf/6EtS6yPfL1lm4?=
 =?us-ascii?Q?b8aNWmlvO5vaWijs6WjWg7qTRFU0AD4N0cL4RHXlxlJ86B1VfPKES5tf+dO9?=
 =?us-ascii?Q?uHqr++2luMjTE58JSY0AHDr9ixT6nTJjGanqRN+Jhfz8/7ZKtyyXhesEtUtj?=
 =?us-ascii?Q?4G81Df6MsSUXwKOTXj5lOgxLB2jcEaAWl94JM+piRnRh45S2MpMR1Fa7HFwA?=
 =?us-ascii?Q?Rip6/SLrwLy5sqUYgP1lJbRNStSBPWT5S8JIeBlvgSPwZXUyj/owgJULPJeK?=
 =?us-ascii?Q?MsTV/aXq8pGlatJ/4tVW5V5/yo2mJ89yLtPOa4j8AlcUQSI2cT5pN9dlCSPB?=
 =?us-ascii?Q?Nf88SsqsUvM1hPqow/H/6J9Y3xYVwXfbV5SOArTM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e5fa3a-fbc5-4cb2-599d-08dc37c2e4df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:35:38.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnJWlC5+GyGVhWrwK039tr0EUW/rC40qVSDREqBder0pHz+fjL9lZVDacL82H42xHUVS/kbmrkEc+cx0fgfDRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
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

With mem_access going away and pm_runtime getting called instead,
we need to protect these against recursions.

For D3cold, the TTM migration helpers will call for the job execution.
Jobs execution will be protected by direct runtime_pm calls, but they
cannot be called again if we are already at a runtime suspend/resume
transaction when evicting/restoring memory for D3Cold. So, we will check
for the xe_pm_read_callback_task.

The put is asynchronous so there's no need to block it. However, for a
proper balance, we need to ensure that the references are taken and
restored regardless of the flow. So, let's convert them all to void and
use some direct linux/pm_runtime functions.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pm.h |  4 ++--
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b5511e3c3153..3664480b21ba 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -408,26 +408,29 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
- *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_get(struct xe_device *xe)
+void xe_pm_runtime_get(struct xe_device *xe)
 {
-	return pm_runtime_get_sync(xe->drm.dev);
+	pm_runtime_get_noresume(xe->drm.dev);
+
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
+
+	pm_runtime_resume(xe->drm.dev);
 }
 
 /**
  * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
  * @xe: xe device instance
- *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
  */
-int xe_pm_runtime_put(struct xe_device *xe)
+void xe_pm_runtime_put(struct xe_device *xe)
 {
-	pm_runtime_mark_last_busy(xe->drm.dev);
-	return pm_runtime_put(xe->drm.dev);
+	if (xe_pm_read_callback_task(xe) == current) {
+		pm_runtime_put_noidle(xe->drm.dev);
+	} else {
+		pm_runtime_mark_last_busy(xe->drm.dev);
+		pm_runtime_put(xe->drm.dev);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 7f5884babb29..fdc2a49c1a1f 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -26,9 +26,9 @@ void xe_pm_runtime_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
-int xe_pm_runtime_get(struct xe_device *xe);
+void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
-int xe_pm_runtime_put(struct xe_device *xe);
+void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-- 
2.43.2

