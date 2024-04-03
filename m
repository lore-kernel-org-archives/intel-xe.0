Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C42CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F87112755;
	Wed,  3 Apr 2024 15:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7r8Bnzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC52112753
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712156910; x=1743692910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cowTmOWWoxKXNPAvpbYpgIFvoaLTu3S/Sc+5/5/VfjA=;
 b=L7r8BnziE2V2nK5PCGjC0qhSKDk7D/rgQcnmzKv0zGk9GTPpq4MhNTPR
 LhhW1HvpLRc/OJBC+eX8mZwav3yB9BXMgTMO2e/Ghw4S5Wg6rJOkZNRxk
 bhlQ0DEpeRNpS51JH7PfwbqgngyQEAIrKwUUTIrrxhid/0bbYjTc29nz0
 nAPVHP0zTtRRe8u4Jt5FrNiHLucDQu01+2MNzV/g7aSUtY7n1+n3qauuF
 MEcAYohfzfTobK3GvkKSzomMIlgZVImEaKFvtB4lZDV1Beq5J2q8mhWN2
 docoHNqb9wQQA/qgy3OOWsGkhp8jD/+zZeqA6lQKz9yS7I5t1OHAsX9QC Q==;
X-CSE-ConnectionGUID: iyWSFPrJRk2RJtT0NnF5YQ==
X-CSE-MsgGUID: njN7B9g3Qmy84dU1fOMqSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18757922"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18757922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:08:30 -0700
X-CSE-ConnectionGUID: pFyGhxJ5SZWSpKfy/vw+9A==
X-CSE-MsgGUID: gZOtzAEpRxaAHz5MPjND1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18907069"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:08:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:08:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwjrxOv0j1HIecfz7aDEpRV9j+hRylXeb3fob4Rs8Z13rOK7LAIdckcCyee7BnLPIc4PlZJE1RodBBLj1GUARApLnL8alGkZhLpr2+bt5Ox01XTDtifO6J5aGXPCZ2NQAVGiHh/JGudiFZ2rrp9IpCN9n+rYewYxpDGiez6OcSThFIYpWO9YvQrzVu8EqdP/5YyNUqg+40Y/1Kx8xfalDGQyH1MuS6Gd/QNejftrubVfy6Rxtp8lB0eCX9Vs9iwqQcFbMjW6Kh+9MnSjJMb75kaTFvfgrcEc905tOReRe0ii14Mwi5aLafp/5BadDDmPG1glVntXZEyqQQgFSZ3c3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2an5dCkVkKGmqkQvlfjp3Jkq9y4C9QfMKucjhLygS8=;
 b=PgD2oy06Sh65UjpDeh/fFtGlEUCmVSucaZQRAO6qT0/J4sKCiBBCYVvgpGOn7o/upEKXy2lPFE7BVRBwY9rzgx2SUXheuIkxT4hAFyWZ5Lq4IejeCVQU/4zpHm1EhE/4s4MNOOKSLrJTxPG/sShc2EAMA8ruShCccl+cQgdHNtLIL70cJ5nGp3/UqAi7LVAf+JiGU/DKbwVdWvB5I626XgKPwKhBVRmOQiAQXFu0Hd+i3p1pJA8sqlymRf7tw6iTBaLqCyC1LXtvTHbCZCADVbsac4UHvZHzZuJJ89RL3Bj1dM1nTaOAIcUDS0l1VyrDzALrTCSzH4+hKjAS/wehiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:07:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:07:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Dafna Hirschfeld <dhirschfeld@habana.ai>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon any
 GPU hang
Date: Wed, 3 Apr 2024 11:07:31 -0400
Message-ID: <20240403150732.102678-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403150732.102678-1-rodrigo.vivi@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6689:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gXfuLKXrX9rWmGJUwbjazFmFhRR2BAqMBLrJp45TsLPsA7tNtSnFzd/Y63IeUZxXdmq7MGbsTzganhGxIoQ7MNeZwnJhE3jYQ6PSb/EiEo4WdZElKjljhB9XNYxfqyIFcxTmn+LgRFcF1kH0wZhE6Aprvq1ynGRsKYQnq0uA4Ie2Gif+Z00Ih7tvSGDe71RkQVNlHIqkTk4SendOsS08WLgAUav5x01X/OEulfnZmcJm7W5Pq/jO1QusrdDkrptngxULp3BvtXLSk8c/3GgrE4DDfPle0sBuatGzT/XzEFjZbBkI+DTGfWC5buowJfq92ZQPjJlePKB4iSlHa05fUI7a8PhkAzTIeNXLciXUo0YltKI25Zs1MqGFPEWW4jkocD3UGMgZiHfw5epSEKgrWhskn9G/xHXdQWQ4a3efKZIf1mCChSWUb6H4KRHpvdm8DnQTCOYaKIaPiWQvdvq/QtNjYRjw0WC/r+aWAoV8OmF0m19HYkB+Hm6Ixb5j3hWxC2AqZ6PFlWrdOP7iWueEgfZ9hX3M7Yq0GKT70gFyfZ5JcwIu2aCh9cSM5u6O7G7Kt0qqj0susTblqf6AhAi++M9gvVlSfbjCkGbHqvjGIFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTH9JmUymh0KJ3MPM59hfsKTKkDgS8SldzVa5l5PAs57yzJt8sdNhhr/9Lbn?=
 =?us-ascii?Q?CuO7SLZ4F8SbayzkAyHoF+uxog6OG0Az6M7jIbLusndFUHxqUwC8HikemOxI?=
 =?us-ascii?Q?IobkY1U9iEBhb5PcbhQe2LwCTK2brdaBABTXzWnhsO2hAhtNml8T57TGKqB1?=
 =?us-ascii?Q?w+GmHBJ7SiZ255jpoMmS1/Sp5ReL4YUB+gxIXlD0ruod9avuNl5FveqQ84sG?=
 =?us-ascii?Q?NZ5HJscyRn72JWCjuSELqm+TK63ZmJtGN8Xc7tADSuajvSjO2djCgHHMHFgD?=
 =?us-ascii?Q?dL2NWpAnwZvCFasUHpZlw49zlufBSnWZm6A04jMUlV99n2H63PFDAUKhJRJR?=
 =?us-ascii?Q?T277D/XX7ZzEwxn+Qo7Wglhf1F2zLcLC8sjeBSs/IIulC5S9inN29AfrYyQn?=
 =?us-ascii?Q?D/vJ6D9rmTb1VspCjnuOpJfizqtC5pLHQ9m5G69RbFYSLOTEK+c6ja/2dJpy?=
 =?us-ascii?Q?OFcAnDxuR1rR1noTBrzOooYb9QX9tOkrEfRHmwbQtmPOt7ti6z2Pb8I0HjKS?=
 =?us-ascii?Q?uUg6Ti/pRmEhp9BPj2kewLzADZDS1URB9yznR0XahM+QZOKZsSlBy6RKijA9?=
 =?us-ascii?Q?Y6PdhBVK7b2eq/ZkMlGgJ9dR42y/IypAcCC+1XW2i01lEAdNQiX+rXF3HmHy?=
 =?us-ascii?Q?MPGPawWCJa49Y1rOvhjo9rSBwIUvMyfdQR9YYb/hSCZHdRNLRgta+YZYLGkA?=
 =?us-ascii?Q?OURLuelH/t0HoL6pjmKircMhktBaVbmx6tOBgQLJHeUCuTBDtY4sNrD34p3l?=
 =?us-ascii?Q?isabgeU7/zOi8W3GOgT500PNAxeDPyk69LLU22VndB+P1hXkAj6oZAsjB7ua?=
 =?us-ascii?Q?ccmA7HtSGD+HewSU0J3NgdeOju47BEc3sAaabGYri34euopB2BA1YgTWuqsW?=
 =?us-ascii?Q?5rncRIgKBpjGLi+77rlU7Ra/KNEmgdZLa+xhFpHgyA2RKp/WGDqfxgr2eeFa?=
 =?us-ascii?Q?sACS0lKlYeKSJsgTdLxiRoSDfR0xuLTwC4AeNzZVNuBDKujSG9hD5KV8T7fU?=
 =?us-ascii?Q?Yx7QEV3LiJ2GQOlvMqI+nb2jK6v9mTHDuYTV2jfCgNf4rtOd3zIEbbcIx1ko?=
 =?us-ascii?Q?x0CAaUn5vqMibcBzN1+uoO3HC9P2VvMM2DL2238dAphGNUlYM3t0PFrR6dfT?=
 =?us-ascii?Q?zpLfamgH5Vt7s5DupqAh7ZSJKTbsxwSlS4DSU2x7AcpMfi/k0JEndyZXUepW?=
 =?us-ascii?Q?5oN4VQisGcDNAVDIvYsDcRBWSo2XsiiyL8WoZvCkdlrTo2S/FNM0r4raPPil?=
 =?us-ascii?Q?sNOA5Ks4FYMHHJXW3mdYrjH2QmvbkN0iY+IvhBIq34v44ebplLz2LpwP4rSo?=
 =?us-ascii?Q?SLfiv6neJxWfngqqdUZG9+T1+yD1DJkshm1jl0fCNie+yK6/cAv0kUE3LDAo?=
 =?us-ascii?Q?p30SpjujV3dTWaiPugcJo9baCd9TrdD08JVualkR7PDMERdZbIYcuphVxYkq?=
 =?us-ascii?Q?vDRxGqXU5UTXNWWBHdeW2TYho+0k/nHDHvybR8jAPfKKLNDK2VUYnt5iO7qO?=
 =?us-ascii?Q?5F1ZwlZYpzCOVSqkGPduUybCq5n7UWrE94Bfzv8vifIUJNt/mrD6nTCFBCXd?=
 =?us-ascii?Q?xFJgqKquFhEEH0fVX3MPiDih5Xe7rm8DkEnjTqkc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc4283b-02ac-4435-8e40-08dc53efd263
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:07:47.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X/W2JL9VOyRuDOct6QLufIi5qmD6PS4p/V2WFAE9NnZfZL8ta+kSlFYTTkNe4agDjxfbY11QGksL3YB4AKPJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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

In many validation situations when debugging GPU Hangs,
it is useful to preserve the GT situation from the moment
that the timeout occurred.

This patch introduces a module parameter that could be used
on situations like this.

If xe.wedged module parameter is set to 2, Xe will be declared
wedged on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

v2: Really block gt_reset from guc side. (Lucas)
    s/wedged/busted (Lucas)

v3: - s/busted/wedged
    - Really use global_flags (Dafna)
    - More robust timeout handling when wedging it.

Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 32 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h     | 15 +---------
 drivers/gpu/drm/xe/xe_guc_ads.c    |  9 +++++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 46 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_module.c     |  5 ++++
 drivers/gpu/drm/xe/xe_module.h     |  1 +
 6 files changed, 86 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7015ef9b00a0..8e380a404a26 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -776,3 +776,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_wedged - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module
+ * re-probe (unbind + bind).
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (xe_modparam.wedged_mode == 0)
+		return;
+
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c532209c5bbd..0fea5c18f76d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged);
 }
 
-static inline void xe_device_declare_wedged(struct xe_device *xe)
-{
-	if (!atomic_xchg(&xe->wedged, 1)) {
-		xe->needs_flr_on_fini = true;
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
-			dev_name(xe->drm.dev));
-	}
-}
+void xe_device_declare_wedged(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e025f3e10c9b..37f30c333c93 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -18,6 +18,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 
 /* Slack of a few additional entries per engine */
@@ -313,11 +314,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	u32 global_flags = 0;
+
 	ads_blob_write(ads, policies.dpc_promote_time,
 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
-	ads_blob_write(ads, policies.global_flags, 0);
+
+	if (xe_modparam.wedged_mode == 2)
+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0a2a54f69f50..0eba01582f7c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -900,16 +901,44 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	xe_sched_submission_start(sched);
 }
 
+static void guc_submit_signal_pending_jobs(struct xe_gpu_scheduler *sched,
+					   int err)
+{
+	struct xe_sched_job *job;
+	int i = 0;
+
+	/* Mark all outstanding jobs as bad, thus completing them */
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list)
+		xe_sched_job_set_error(job, !i++ ? err : -ECANCELED);
+	spin_unlock(&sched->base.job_list_lock);
+}
+
+static void guc_submit_device_wedged(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	xe_sched_submission_stop(sched);
+	xe_guc_exec_queue_trigger_cleanup(q);
+	guc_submit_signal_pending_jobs(sched, -ETIME);
+	xe_guc_submit_reset_prepare(guc);
+	xe_guc_submit_stop(guc);
+}
+
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-	struct xe_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
-	int i = 0;
+
+	if (xe_device_wedged(xe)) {
+		guc_submit_device_wedged(q);
+		return DRM_GPU_SCHED_STAT_ENODEV;
+	}
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -933,6 +962,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
+	if (xe_modparam.wedged_mode == 2) {
+		xe_device_declare_wedged(xe);
+		guc_submit_device_wedged(q);
+		return DRM_GPU_SCHED_STAT_ENODEV;
+	}
+
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
 
@@ -994,13 +1029,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 
-	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
+	guc_submit_signal_pending_jobs(sched, err);
 
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..5e023df0bea9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
 
@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+MODULE_PARM_DESC(wedged_mode,
+		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..bc6f370c9a8e 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,7 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+	int wedged_mode;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.44.0

