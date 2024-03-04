Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B0AC54E49
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C895711244A;
	Mon,  4 Mar 2024 18:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJjFhhaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4DB11244E
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576548; x=1741112548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DXremiFvnHC68PZFZWwMtsmVw9kO7rQdA9e1dkF56B0=;
 b=JJjFhhaMHVjJ6TgkOZ0iBESsLcCPB6HW9Teiu5XUw0cJpFMTaUoxn/Mj
 tc8V0i7Juj+Xf2sgebyp2L7mRbo6+pBCsInBz6Z/4Jv/AL3arLK5weWFk
 vBQPQ/ybri3yORx/G/ktZOSwa5fD2XNLELvyqNkE1wgq2loDYDdgS5420
 a0SUMVVlOt9y39dErP9jwqlmkNwiAIhnUAn458An5QoJpSXef6UX54Olw
 PtE13zg0GmWmrF0d07y2Jn8yU1wzDA9gJXXYr1gJN85e5KuAqIb3lDAv8
 2VprleivTfd686nBSVUWvNEiLKoJE7GAXtLm8E2r68khv26t+8XxiWViI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21623959"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="21623959"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="8936104"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZffbXfwNRVaqx44MaZfqY4GhDSWa/VVlQz/uoqpGxN01q5HSAls83ll7qDoGMNMDbxCSjW8FmKxwavokReMBvhdzDNsxEEJZn6mXtBaR1iMaX3SUQQkMIVGksxurnRfK2gAJhYl5T6hNJTYCKE6MNzXkutyr68H8qb0cxu6vEqolRF+7wT07RlH3Y11hR2IPKTbaj0B18/ctozoadTXD+AboxSEEqBDJHncnS13KcgfGtAOEw1E0LvvkGb5pFeUMxXMcCwceTNFTLDRWzfBgXZv9v47qUMqZQpOwMNqOGRoKPRevt+bSHprK0ddDBMEv7MnM9Og4ZkrZzRdZYiW9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2iPwGFFNWBotxktHNZbl+wlXA/CPRrTldt/byhpmPA=;
 b=S7pbtrfbX7y0XqiZttIXqF2BXDgutKg2g0vdcVffyaEVJUNDHljxKcoLvAzlWxxb6AiQC4CRylWuk+QYa6NENn0+gz+D5CGsUSqf5EtQXwcF7IuU8zzfzHdbmfP3EoxSvdfopKR8Nn+4KQ3ggbCe5gLz+TFO/PfuDsqP4fXpOH4CEOGhjGQZ8W3XJvNBL/nYLCHqeHfu1OHsLGFPBj5p+ZpnDJu+lGBZMfl2C7IORmD0/fS9Q219I9inxzgafbie6S04LcKDWdsKm+T+NDXWtcKlO103gHFBzCGAhmioX1cbY4b0J8KxCg8e8A9h/ghcu1rK6qZRlChurLkUO1ljug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/9] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Mon, 4 Mar 2024 13:21:48 -0500
Message-ID: <20240304182154.42611-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d0c175-85a5-4aa2-433b-08dc3c77ff48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okyGlVge42HrYKfD0d32L4xQPYsCxV0JXDmaaHfM1W4CBYAHHe3KyK+PiRC+B558Gs6vsZdWlz2WzPQXc/tdOwQmo4ZVNlMWjeAsv7FByGWPY7RtlQQBtieQJsEQyTg6J2fKi9lxYTSsrkSQuyDMFj5nWeYWJGw8514gnSXJpC0X/dvOC5MOHocN1aVC+PFiSW8ZBxGS+DALSbUwK06ONXZyerg1dSroqFt8ACXUdNuDNHaQzSTSTve1T/0d8ikMCZ2kIStNaAH5IMV7J27GDVSepEdMGb3eTN/4zOetyopSM99FF5eG25rblOchD1OX0fVn/jeO8BDr/tKqxCO9Egg9f8A+0GbDiRuhaQpX9X2kijo8/LYl85Z18Yfb1O/o0W8dUkUlmZ4zH+wNIgwrmwx7vqWftQT2IwZe7wTd4xhlb2s2aj7V8c8DOW9TFd2fUQWIGq0pcWAXVc6ObedxEgqrtNc9nnky075ED9YcD88OUD3tC23kx0mrG3MwWjNK12Zs/7vOcHoFmLGhofCp+dbGrrz8M6pWhXDicUsdSx9aEhE80R9Jk9m3B0OIaPlEH6WVaAShGqQVrKB2zQjHrCmzooqXvY6OF9iE8NEr5w9Lb+0RD3zD5kY7JglL+qh4oDgZ22JwzHHYFrFty82Nf3iUudp0XWorcbdZY/2xgkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mrz6xln7a1HnrIOZWVdiuD0cJQti1tnF+MrFQHf3vTdU0sRdYqDoUJ/6B+M/?=
 =?us-ascii?Q?Rbkv15dhPIeNQmYiYNkFVLNIksW4hrnAKRfJia18bu5kwTD90jYUfrw8PfYX?=
 =?us-ascii?Q?92CfDeHgem/t8LfI8vXKL06SymR+0SpnAayOfa3updh0NTVhwU+xTTbN9vXF?=
 =?us-ascii?Q?Se2fFKoJI2AANnPW9FbSJLP3qYerVRX4C0sOZw5LODgrSYKDZEWsLsDgVPgK?=
 =?us-ascii?Q?vmPxDMtRvvDat9hdjU3tQMfnt27VVSOszX4dfPvgN+HqIBZqzOjnNjfGWsvQ?=
 =?us-ascii?Q?/w+jwCyD+5uGiuS50Phn+fZZj4zIcuBkIxNMvb235Lloa48qDlneN6k/81EI?=
 =?us-ascii?Q?OVjouaj6aZp3wMXq3asae2SdJD46vbYSD8ihw9krm0P/ZFb7IWOiMek88aFV?=
 =?us-ascii?Q?pq1qZ1PvNsrwJKBkA+TJMo3xBnIdUewObWywiw7+2JdwqygVrNDG8EVQEpOQ?=
 =?us-ascii?Q?15OOglsORNlsNq/VWsvZkobMOWj9iwZfPA2bPT9DxiqkCI+l+VOTvQTQ7N1t?=
 =?us-ascii?Q?1PRQtTafe2rPTZ7PaO8fcHwyGg/pScPzyyeAj2PB3btb+FybMOGb7e5pUGBx?=
 =?us-ascii?Q?oJCpiQoAA6/l3km391Vxo5HU9k3+R9DqNTRFypUg7QG4NSBKTMmKxqnVz9fA?=
 =?us-ascii?Q?Ow5/CD20NFCGqH8nzE+3LQDZ6WTd5T+xmEXTVEtU+iP5cMXZl6xV173BacEV?=
 =?us-ascii?Q?9vE6hnG8iXtCfqFdmRgbRAk4X5dQIujMEhFIKLgBXCu7ynnT+vhZy7vqWcBQ?=
 =?us-ascii?Q?UcTZfS0F5UUnTpRzOQ/Tjax2/mRWZ/cEd5rQol1SmD3S57usYHSUdYc5Nfof?=
 =?us-ascii?Q?WApXPBi/RaHkcFazyEeQOdo9S8zYAYJSeKb1oDC9QskTyiKwDL88DJdIqm/P?=
 =?us-ascii?Q?FObFpzdj57XTzzWrsgH5ztiga79SMFlwTLGwKHYOZmEIUo5wL4wjnEiKtwzq?=
 =?us-ascii?Q?RlFmOeEM0B1i/e/4VAkGLVmqyudbQzDMMfrgElM0lu3huAREu/c5SmMgsSde?=
 =?us-ascii?Q?VntPJhpIAOmEpTPMGayvnTqBrh7R4TI7GtyZdADgDwdAyrv8HRDUZPpTn3mL?=
 =?us-ascii?Q?QMhtBjy3lne6e9eBruM3qO1GjhGPeBJB05NgKKQMAbkuwJrfjoosZc0GFfxE?=
 =?us-ascii?Q?WA3d8cXMbFnItblqMEF8uj0BRQXCyR689zbnZRePrPMYDVquseKrhiqndL22?=
 =?us-ascii?Q?LTP624ZDZVUlgLBmkFLITHcPV3jd34v8fBDBKIopVd0L1SXVGtfebngCOp1c?=
 =?us-ascii?Q?4e4ZGm5gLO8WYcOROSX/kyt3I8zEyeWfk8ws6p3Aozsa/c5qqmcRZ8YMhW/I?=
 =?us-ascii?Q?wf4BXpu4NhKwKonX652UQdiU0ljtvTce78nxeyITqCd1Z6H1RFUQYKsQFTzN?=
 =?us-ascii?Q?LuwZbgZLYIok+uqEWV6vbeRgj6889igJZJ1HzPuFWnqUw/UFzwFJ09nYL6Fg?=
 =?us-ascii?Q?+UGPlS0unML8ToX3MQAvsgU0jbrcHrDqoww+0HZyP1og7C8PUaqHpZwHbcQD?=
 =?us-ascii?Q?NK5Ifzus2uvnK8nykYpT4rAFlESiuOidHh965jwC95Uv5WQlJD/PX/zDp5fw?=
 =?us-ascii?Q?0oeFbg1yxsEEUBRReQ1vi+l3Mac76LwmyZMyYBOY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d0c175-85a5-4aa2-433b-08dc3c77ff48
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:06.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eu/YL6wrKBi5egmfXkby4K5cCECpDejAsX3akatTMn4QrohHB08zT5MxxM62N0z2iNBTMV3KfgcDj0zSjKMorQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

The mem_access itself is not holding any lock, but attempting
to train lockdep with possible scarring locks happening during
runtime pm. We are going soon to kill the mem_access get and put
helpers in favor of direct xe_pm_runtime calls, so let's just
move this lock around to where it now belongs.

v2: s/lockdep_training/lockdep_prime (Matt Auld)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 23 -----------------
 drivers/gpu/drm/xe/xe_device.h |  4 ---
 drivers/gpu/drm/xe/xe_pm.c     | 45 ++++++++++++++++++++++++++++------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..49a413725c8f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,12 +45,6 @@
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_device_mem_access_lockdep_map = {
-	.name = "xe_device_mem_access_lockdep_map"
-};
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -702,23 +696,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	/*
-	 * Since the resume here is synchronous it can be quite easy to deadlock
-	 * if we are not careful. Also in practice it might be quite timing
-	 * sensitive to ever see the 0 -> 1 transition with the callers locks
-	 * held, so deadlocks might exist but are hard for lockdep to ever see.
-	 * With this in mind, help lockdep learn about the potentially scary
-	 * stuff that can happen inside the runtime_resume callback by acquiring
-	 * a dummy lock (it doesn't protect anything and gets compiled out on
-	 * non-debug builds).  Lockdep then only needs to see the
-	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
-	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
-	 * For example if the (callers_locks) are ever grabbed in the
-	 * runtime_resume callback, lockdep should give us a nice splat.
-	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-	lock_map_release(&xe_device_mem_access_lockdep_map);
-
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..2653f53bee4e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -16,10 +16,6 @@ struct xe_file;
 #include "xe_force_wake.h"
 #include "xe_macros.h"
 
-#ifdef CONFIG_LOCKDEP
-extern struct lockdep_map xe_device_mem_access_lockdep_map;
-#endif
-
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9fbb6f6c598a..b534a194a9ef 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -68,6 +68,12 @@
  * management (RPS).
  */
 
+#ifdef CONFIG_LOCKDEP
+struct lockdep_map xe_pm_runtime_lockdep_map = {
+	.name = "xe_pm_runtime_lockdep_map"
+};
+#endif
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -297,11 +303,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	xe_pm_write_callback_task(xe, current);
 
 	/*
-	 * The actual xe_device_mem_access_put() is always async underneath, so
+	 * The actual xe_pm_runtime_put() is always async underneath, so
 	 * exactly where that is called should makes no difference to us. However
 	 * we still need to be very careful with the locks that this callback
 	 * acquires and the locks that are acquired and held by any callers of
-	 * xe_device_mem_access_get(). We already have the matching annotation
+	 * xe_runtime_pm_get(). We already have the matching annotation
 	 * on that side, but we also need it here. For example lockdep should be
 	 * able to tell us if the following scenario is in theory possible:
 	 *
@@ -309,15 +315,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 * lock(A)                       |
 	 *                               | xe_pm_runtime_suspend()
 	 *                               |      lock(A)
-	 * xe_device_mem_access_get()    |
+	 * xe_pm_runtime_get()           |
 	 *
 	 * This will clearly deadlock since rpm core needs to wait for
 	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
 	 * on CPU0 which prevents CPU1 making forward progress.  With the
-	 * annotation here and in xe_device_mem_access_get() lockdep will see
+	 * annotation here and in xe_pm_runtime_get() lockdep will see
 	 * the potential lock inversion and give us a nice splat.
 	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
@@ -343,7 +349,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_irq_suspend(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -363,7 +369,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
@@ -400,11 +406,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
 
+/*
+ * For places where resume is synchronous it can be quite easy to deadlock
+ * if we are not careful. Also in practice it might be quite timing
+ * sensitive to ever see the 0 -> 1 transition with the callers locks
+ * held, so deadlocks might exist but are hard for lockdep to ever see.
+ * With this in mind, help lockdep learn about the potentially scary
+ * stuff that can happen inside the runtime_resume callback by acquiring
+ * a dummy lock (it doesn't protect anything and gets compiled out on
+ * non-debug builds).  Lockdep then only needs to see the
+ * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
+ * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
+ * For example if the (callers_locks) are ever grabbed in the
+ * runtime_resume callback, lockdep should give us a nice splat.
+ */
+static void pm_runtime_lockdep_prime(void)
+{
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
+}
+
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -416,6 +442,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	pm_runtime_lockdep_prime();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -445,6 +472,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
@@ -491,6 +519,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 		return true;
 	}
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
-- 
2.43.2

