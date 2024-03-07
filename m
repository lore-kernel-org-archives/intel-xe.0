Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB98C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89C113602;
	Thu,  7 Mar 2024 00:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi3nprU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3165F113602
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770565; x=1741306565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DXremiFvnHC68PZFZWwMtsmVw9kO7rQdA9e1dkF56B0=;
 b=Zi3nprU+AZ6TlcLi78sKT5B+/FfNgrQ+nT+lvoc4t+9CSrrZqSlSh/+E
 praXfK9HYRyQRudbkCBPD+n/FS9JvT+e/diURLqHK/F7dCHTKyx3yf5Xy
 Q/D9MRSBglMVV9vNUGAYcxjZ/bX2f2N5m0CYKTCzzMhJGDz7rMuxlJxwF
 oAMCdX3B7JvB92eet1KK7iu0DmAWtswzAvo8LClm5Z9GV38PXAUbym0+T
 /GJywtQPz+usTkAISmD8WOH4r3jpfkXsehVzM+4zJO4/S3uyVlD7wdAE+
 tt3O3082DlOcaf1ztbAbUURJeJvM9co2klyw2NNwi4A2i53NmCY0pSSH6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21939932"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21939932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911770"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:03 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzI4J+SQt1ouz+bhMzJ6NA0+gmah6wVoZ2NdUTYHv44FWlHSwMdzq0qlZtEZTCOkRDSMLjg3t2YP3H+E9OU0hcS2GLMWSZDwURXL8lafNFOq1dhInldXJnT1h2if0oGPmXYDKPtbPVjj8kS6LxqbxaWG4nSqQmZS+nsL+W0TwIyheZpe0m+R1UiZ4VKSPTmYgywPm5DoUsxany6gS7tYcpZF8GIVI2JbGas3XffZWul5UWctqXqVFzkcG+ZNRXYnku10eLo4Vy4UoCC6hRBn/4XjJJXBAmtcrb/f4PXulYa58DabJNmaCEMS3R1PES3P33I3KcvrQJD6UpmFHhzf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2iPwGFFNWBotxktHNZbl+wlXA/CPRrTldt/byhpmPA=;
 b=J8bNhVwr9uTVG8kbLJpY/QWHCPJezkCUJlXg4MREn1Z9E84ME8vQScGyEHyjb3ZT0JB39GwD2v4QIn96kjJ0ZPdcYTBHdeRRbNZfQyp5IQTvCzVxAS11+aBla9jhf1BEVIpSS0kVxHT3s4BRTALtAdDJJzF7EBswG3tM8uYyx/zdAmPYhcQqVB2AwnUniEbTGl7hFzGEYWVL42NmEpMMokQALR+ILOpVb7iFMy1Ng8niYaby1yelb1kg4BWDu0O3aybsBLKt9o6owQPkO9VeR9EYe7aO1SdmsOmSig9/kaWEG+vb586FmI7BnwUIMSC0MPgo55EVFCPXeO4xx1KMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 00:16:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 02/10] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Wed, 6 Mar 2024 19:15:46 -0500
Message-ID: <20240307001554.162153-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c33532-a384-4685-306d-08dc3e3bc4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzHN2n6VIZcqr+0LMKjNyaiiJ4vy5hrJhtcHNBVj5RW6TpvOxw+TuFmyJYP/SjUpClbYxgfSUGYAGUypUE1c8AcO3B1jMsxulWHBFfYdNyiEZV6sIqZI/98TVw4S9LcOhTfec5V+bv43gV94YQ20LqsAkyaEOMI8oYEE2dNzoYDacD1IJQ8V8yFgAH7bt+aQNHIq+zCrvQeDGlddKywn79s6uxwh/P8OJ5274h6PJtmguFMu5ExiHHi4G4tfDJLTvASbYfEbEI83+YkOra8EM6Ef4PcQJ1xnVKahbm4heG+R1aASZ8JZcLC/xIYt2Kldha9IVzqKLaSnDYDEg1myeY2bZ19djxT7neex7b67uBNLYlFqBrPq7niE9MmhP+fN82B71LVvmA9xfNU2j6hEUNezCsDu7viLV8vB1CJBksN02bRZhqOPgA37eY+Ou3sUqwgUDTwhLI33+CgZnCgDC2vRma2IUkAlD5CaTTpzDYu8rOImyZdivv3Lc7xc0G/XcckPAJd4Zap6CdhKvuo58fv1RueMD8YclFmA/a3JjgON9kftHeDBbwcEGpOE+agaCtePAkQN41+XKCMLkRQ3FwULMLAV5nrr/J7Ye0dNYX7PCwzUqu6hwa/sgLp0VTXzoSdKK9cYyDEGn1oX5L3knqgE7IdX0W7LVJKtdQlNZ3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rViuFY+XMf+9fWTGrriSPdgeHtXDSfuB99W+ZtrHwCUP7+MJqTmch/3Z/jlP?=
 =?us-ascii?Q?F/wMz9pp06pl776l0Bt/zoV43II0eimr+BC3Ew9f20uSoXULFqwvK07kUqBQ?=
 =?us-ascii?Q?Pc2SySGN4Fmymr5JK9iLhnqcl+dwo4Qp7NDmC2z0lKBnYrrweQ7WiQwcMhl2?=
 =?us-ascii?Q?McDqEUdzr2PLYLCp6qBMbV/DA7TlaSrSXo0VbCXgR/PKyfht7Ei5ftNPu8Qd?=
 =?us-ascii?Q?mVvSYaTD3llDNw74tac2TpEPBjnTd/8RCaWuXI3ej8pzDELb8hK4LPe5pLt/?=
 =?us-ascii?Q?5FcrC6iV9MIaWoAK9xqGzjpKFjc0YWN+Xb6bw7Pk8ygfAJ0TXdg/0xsb/it4?=
 =?us-ascii?Q?k7Xj6PSJI1+2b+PWaWfhNyNnluvLj/Jx7ICktR7q2JR24XHeVRIaehe11br5?=
 =?us-ascii?Q?VzFGgIAZ0zn4r3G1/AXZtgVMHbNR3CuWadjhn39X3IjCkbHB6Gma0cCNAwAq?=
 =?us-ascii?Q?GC5K5TIY/VeIhrRaJf0VLsEnVCaOfSAD0ZoSX1syiVhRxTidxqCPz1DcAiPm?=
 =?us-ascii?Q?jHPsVf1YHGfAIXBwrBw/mRwSo6CGzMoDoGXeftAqcr3nz0Z4HAcHeObkAwqH?=
 =?us-ascii?Q?jBLcVBg4eNcMfmY3PeGtSPOUVwb1ohzian4a8dmnIYk4cnDktO1UlnFstOzT?=
 =?us-ascii?Q?N9su+z697e7LkfdxL1nHauKA2As/8uwjS0vym3sqAurL26YheZb3DD2naOCW?=
 =?us-ascii?Q?JNm5zmV3uSV0IgWd5uj4k14AVM0CvLlRgCyzkwj4Z6XDuZ54X7UZfUNGUPt8?=
 =?us-ascii?Q?L66dyH5xy/7nSvrqgtRcChyxIZsEjBV5UbHbDoKPYZTWSuKnL75+57ImDV3+?=
 =?us-ascii?Q?GQsxydhDPXiiGnoDnF5CBpcuOCrcIVk4YXCFu0XRNicnG8/6LtyAnMjESHpV?=
 =?us-ascii?Q?I5c87xbfBDgzOshfK6Icvyi5K0sNJUGxrOPWBXXnXZGTEyMWJ2mxtIYROu1y?=
 =?us-ascii?Q?wVg/2oFcLKBbDRXsO91zWE3ywsCJObp03nAgRP3lDJKRNC9b8op5it/WCPdq?=
 =?us-ascii?Q?U9sAKiYfFfMgfeDWw2nZ1aYMpTGU7efImw7AADI9hJYT8qM0snHcpclWCnaK?=
 =?us-ascii?Q?WNlrEOpSCKRlteeMC91Vx3fGFU7g8wy3ZJU9I9dBG0nd7JxD2wfbiKg/HOsv?=
 =?us-ascii?Q?npxQUNMNO+DX5ZaNmNhJUNi/wL8yQCp9g4qKUQuPY9ssP0pD5eVzLe58U8X2?=
 =?us-ascii?Q?EmrjxWKXhWDZQD8AiFYMMFkLImzYXTiqBaSLiCu2/3Sa4oAKQJcSfVFmzCFE?=
 =?us-ascii?Q?+MQyzCTvkq1upPEY0viEeph5xUoHz6BNz+zZOns7cYiLJlOhOLXidvvkm+Qt?=
 =?us-ascii?Q?tSmNBsPrnMViwRUuYHPXIL20VJ403+fgAHrwOH3cvid6jzcG4bjiscniqE0g?=
 =?us-ascii?Q?jzS6gES7ubuNBtt87HtMx3hu+PCOaNho6B1MeEdKddpEwZJZ8MZv0bPymWGq?=
 =?us-ascii?Q?U9nfCOdybnNsyGaoakPYrBDNnUcYS1W2rVQ74HTBZtOp3kDfTOCjwGQrhWVI?=
 =?us-ascii?Q?G4UobGbpKaAh5iVubfajoZwlTgZLgmGKj8Zu9PXtTFMKNRdKIuG3txwQMEW4?=
 =?us-ascii?Q?+fFPLT0a/B170IC7bipQW12FdtUcBGo22nmtfNxcmEWSdw0VoY2Be9FqGJm9?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c33532-a384-4685-306d-08dc3e3bc4d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:00.8222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuGPeFqLRGsQS+hgd28az/q8FedGBrb713T2FlXDz4d7s/0IZcsKO49dWNoMuerqUQufh8Di30G9wqZPbjPVzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

