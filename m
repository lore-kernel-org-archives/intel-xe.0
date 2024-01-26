Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0A7C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADE510FE60;
	Fri, 26 Jan 2024 20:31:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F064710FE62
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301116; x=1737837116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nt1V+4sY/yfUsqm82ZtE9U0xbCRucu1AUFy7q45/WG0=;
 b=KnaF7A/HxjqesZZXlirTmrn5ljxhF4QeL2n18EOmoyjM00ewlc3NzfDG
 vVSfYYb0aGY2XnuGWjdBkeFVC+KmFvQRdaA4Sl+I/enWd5XS5zsfsPUGr
 bNCS5KPa+1hTfcAaUktj7sc0XUETS1gztLHaXuL2qvVF/yexHfWAmLJ9N
 u0oTDQpf9VeUrM/rEGPpcK89VkgHAb9MpdqlbjHtw4Pum6dMhwYPDwEk2
 ZP51bVPZ3TsNXBlHdnxbAg75IRbh14MHC/oduyqlN3Xqj0rCnRFsoFoh+
 YSwVWVIoTjDy+5g2zQ/Fkl2jMgaGVp98mz7k28foswOkerOa29LtUyuii Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9245014"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9245014"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910434659"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910434659"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:55 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:55 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOn+bWGPYo8TjAL5d83EsEosD4zaxR9m2rAsyFJ75hHbvwBRguOi2tJerDYDh+gtyf+w9F3zTqiqGilzBPtGVJ3rNvCO7960W/eGJdvopJeXyZ3+pHu08vX0RodhiW6O2l1/tFu8Dl3eCtb7JL/ZCD4udeqNw31fKzB6RY41LkCxbAN93Q+NiIAbBbTuQ8BLsF7wcfEugkRi3Mrbhd9kJQUsB1fwk48p/VOQU/4Zf4Rm8glmFbt633mD3VWW2Tp2ftKZykLethqtbFtJ3b+i+xmJ8en4i6s0DkB1PVNjT6Bnp/VAbCa7Bvmg49eLoGjyfnfd+8oZLGV3/k6RVWGjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBuR4NaaTji/uD5Yg30u1ZbY6I4t5Cr8bDE/lQ9dmzQ=;
 b=nRrreyEjhTHmsJGe4eDfB4YqUV+WMoxZm4Z61mefwJkF9T25SIO9YLzTkI70kd+qZ5Wtj4v0CnMOKQ06dUjjdN70VebDMppT4UbWdkSnHsX+D6aRl/FAF8Gr5ol3qWESxJOY16h3DE7oKf67oUx2yBV0Fm7B4/1Ahmhq8XjqrPUGTEk8ydaFcd4/8V2I/KcW3UlnxhZJNP+nUXJI2u+OZSryU9QMCfzvCzN8FDr4Lm0yQl7p7VNaNDM1ArvIfCR5YuYx45XG6Cxn6FpvJPVRXalofOltrWqYzavgYnT32BPBHrHlpD93sUTShFgB3jz7G3Ap/V6apYKiGJ5VjVLJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 18/34] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Fri, 26 Jan 2024 15:30:27 -0500
Message-ID: <20240126203044.1104705-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c528efd-22cc-458c-ba74-08dc1eadcf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGU7MIrDnr2jGZr9jqMwRfDLyp4hcPoRWDHq8rOuRWInqJ/EDWMzH7LMcH7VTPMAAaNtvndWhYcRik3/a39xDA2Kngnv14iz16KwwJSC2wF7FU8mj9Pmt4/7msbTTPr1vfWVHrM28fDG1Q203EszvMhsPAzJVulzJ+iZJuGQLZQy92id7eJFrpfasF1MU5iQKrrhsoh78Ieyrp7vuzek9iFK0QOOFj4hmoe2JMOL+qbvt2EmJ+VQbpCiLdb1+DglLLsChrAx/VMecka6/cIz9TFJ7oS217jYnS3s28hNvSD94wKS/jiZqaZysbSQnO/ahHC2Sh4RDxfAxO0v6NiE2zYb6eb4mwOPuwyfZmoifdgNRqc7asA5++ydj0ua78V8L94Lcsad66Wnl9AQr1IcKsdI+n/gcoaG9QV1bchKinUbN8y8F73CVUytb1oPpYG62NOBQkl72lbWOSeHn1YML4J8piqh7koZml8pODxcatZAfGuyN1vEKwHC8qkib5zeyJwetgQCwk3+LPw+w6cz2etyZYhrnApY1yFGuaI2u6njysS46j4uWkhx4l7KZSiZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uaaG+p58FLHpuD5pp2GyRCpmpQy1NwBeHPmVWeZwajvlcr0XRZuR0j7tZ05B?=
 =?us-ascii?Q?7TALdbkdMmvYS5Llb5/WD+kUfb4SDh0lMkdof58WBSAUlE4EAFIFifEHu/ZD?=
 =?us-ascii?Q?37PuYmFn+hg87hpuGyN5ciVPI/qUpTmgcZOCLb82yvfNjQsSBVd76coP2NgF?=
 =?us-ascii?Q?1J+/cBfEQKYS0RoZ1xa7DfVmaJfVbgdFfgvluKqiwkeyxmBG6kq+QMh1YJkd?=
 =?us-ascii?Q?OVyyuEALDgPQ16W/EhqpXPJlpnPvJSIEUvZqS9iHHGwYWJrpFVkyd9BM6pbK?=
 =?us-ascii?Q?2GngGRgD+m5aZ2ko4NmaTvg1iVKUwWnYz3ZpjXIcl9U9W94zc0kj+6khG9Nt?=
 =?us-ascii?Q?cfYM3T3Hysw0HqIOaK6DtZ057chRG5gscXJHVOjvzLHJGN9hftiVOTLSXww2?=
 =?us-ascii?Q?vte+KQD8R1u70Ph00xA0a86Rb33pbpKycS3DWAERz2LkXUfzNIanJ5ToASsa?=
 =?us-ascii?Q?5qm5g2ejIgkJBBpYU7OLo1auvBP8C3vMY+bTRbZQOWaDUtm10L9IMqlwbLZu?=
 =?us-ascii?Q?GHtygJkiHUEEP7EbHRBotdVynodQN+V+0jcrgMacci3jXWNv1Wqi65Hvb5Bi?=
 =?us-ascii?Q?2qwbgbRS8cI33q9UOO3vi85j5mpdilgZR4P4k/u7BBEALJhZJgorvpZkmnz2?=
 =?us-ascii?Q?JfYBms9cbJBI5lOuIBccr9peKbgOEGAOCiojjwJZUDGb118pf3+FZJUmYrCM?=
 =?us-ascii?Q?I+RvHb9wYvngm9Qr2biGoFEMshnjEvtgbu9MsJHgSwX8vClVAlBoJH5YK9sq?=
 =?us-ascii?Q?tcqMz0z9j3cWjMU8AsShm1xm1CB0uAcQ515Ykj2rxsxKcn7AaHTDcvfeGVyv?=
 =?us-ascii?Q?ZcwlBXqCqW+AXczJrT6u/A0AxiKQHEMAuPENMnwk8p+qofrFV8Dw5SRP8/cy?=
 =?us-ascii?Q?rVx5Y6HkkiQXe8LWZxVhbS9JBPDZalF1lhgf4VVvdlGuOxRWMfp2EuCSJXCv?=
 =?us-ascii?Q?mgvDZL4j5222CDkQGcsuC7y9LKOcRuzPT+iEZVQEtsDPxtL7KQDCdzJE6G51?=
 =?us-ascii?Q?1sFTIoUPTbQGtmYGHDsflYrlckz7VkV2UN3AR3bbja5sL7ZHhP6cQxcZ1VZ4?=
 =?us-ascii?Q?atXEAPOYhN38zKIaRnUtyTSP5sy1ivQdJQonHKOz1OyripOD1VAgX8YY9joJ?=
 =?us-ascii?Q?DkBpOF/5BThJRCszTnZVFXzUjJ4g5RvDGo6kowrGcthNHn54my7IefZdzYDz?=
 =?us-ascii?Q?Ekdb+jBHkfFhbQ/WOQPyjGmz3MgufQdktLuoUiY9rQocpC+dgEMhWPS34jom?=
 =?us-ascii?Q?MScL3ivhARySoW2HbMlnmUmNA6VzZGL8jUSAMR6vUwtCcDfQVRMnOkWvOe/7?=
 =?us-ascii?Q?urh42Qx7XX93jrc2X9kcF54kwa1FR474yU+WSrSDotuiBArQrcAl1mLKxUCe?=
 =?us-ascii?Q?eGhTDEyr1il+YK4orm9ann3FiP4WE3UTV3NH3gXu1YbnLf+eXhsezHhOMxCM?=
 =?us-ascii?Q?oie+IpMGvS+LYiyFNFhAxnQo4ri5mfl/9cK5t+r8+wdAIcsU5Zvpnb9uL0zL?=
 =?us-ascii?Q?VHwlowYEWXoNqrfplBAiiA7pJ7TSl7sSlUc1LdR/rFxnnvvuBre1k8WcXT/f?=
 =?us-ascii?Q?fg90K4bK8XVsjRQX99MxrF4yA4niTxMSOhUby/r7RKC+MwfKAKICbNjfpjCH?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c528efd-22cc-458c-ba74-08dc1eadcf90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:44.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfhoHBRq84E93t0fwUwvVzB76EeJNOSPtQLBEfmEkWvo/Rt+WLF7adTynTrwrp25lg0RlhcOVaXdDFZUIVjipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The mem_access itself is not holding any lock, but attempting
to train lockdep with possible scarring locks happening during
runtime pm. We are going soon to kill the mem_access get and put
helpers in favor of direct xe_pm_runtime calls, so let's just
move this lock around to where it now belongs.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 23 -----------------
 drivers/gpu/drm/xe/xe_device.h |  4 ---
 drivers/gpu/drm/xe/xe_pm.c     | 45 ++++++++++++++++++++++++++++------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1711d9064ecc..0b27e09b3db9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,12 +45,6 @@
 #include "xe_wait_user_fence.h"
 #include "xe_hwmon.h"
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_device_mem_access_lockdep_map = {
-	.name = "xe_device_mem_access_lockdep_map"
-};
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -722,23 +716,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
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
index 74074939d157..050d4b6cdc65 100644
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
index 967d3dc0ded5..86bf225dba02 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -66,6 +66,13 @@
  * management (RPS).
  */
 
+
+#ifdef CONFIG_LOCKDEP
+struct lockdep_map xe_pm_runtime_lockdep_map = {
+	.name = "xe_pm_runtime_lockdep_map"
+};
+#endif
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -285,11 +292,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -297,15 +304,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
@@ -334,7 +341,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (xe->d3cold.allowed)
 		xe_display_pm_runtime_suspend(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -354,7 +361,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
@@ -393,11 +400,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
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
+static void pm_runtime_lockdep_training(void)
+{
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
+}
+
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -409,6 +436,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	pm_runtime_lockdep_training();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -438,6 +466,7 @@ int xe_pm_runtime_get_sync(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
+	pm_runtime_lockdep_training();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
-- 
2.43.0

