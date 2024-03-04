Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9BBC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A7D112448;
	Mon,  4 Mar 2024 18:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="md2qRtXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ED9112449
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576541; x=1741112541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=p/fgyIt2gItHcKCX/wyWNK/lLxb09/72eTt3DwnUCsc=;
 b=md2qRtXfDv8tDevpc7a+WD3lsVdSgYt4utuj3m06GwivVQoA7ENSmkze
 wYuyoWy8NOw/6z3A8OO4B5+bIVwqS4yd2ekYD3Bts/a5PK57a0CuLM9tT
 BBWJDrbNnFUaACKG32URCSwfWvkMSvyKNv72dS5zgoLC7gJLcIEHFbTFk
 pEuhf6waYzO0RZ/PjJIwRCFth0lwXzVlB6nRQMPxa+GrBA8QTUwrhri3E
 61RHKoaKn0TLY0OKi320VRO7RJJ12WbTj/roDnFHD2zftBh0dWAupZ8J9
 ONTZPqgXB0Gs6ixQqhwdNYlkBHYwMSUGi2Ij+Hcr9mXxpOkwBdYHEdjyA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15492992"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="15492992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9026177"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbE9ASiyGh7vFhESkaZpyglEE1iJ3c1HpdRImAK31bQpfVyuSMbvIYf6LBskkEPkEQxrxVpoRY3kPA829U2rkdfy6970DSP8qLg87EdfffDVHF0P+w3LFJWF2QRDb/wRb7tgqRc7lkXNNj4LknDZersT2yaOz3NcR+1TT3VdjqwQi0o1lr4V3MKAyufD6Fd8+UyD18TWsoeMhsXfYzvwq1c1hsKTjT+rMaXA06UP7tyHYRn0wczya90h+QaHSyS4EN6gl11/xqTosnBIBadiHvPwimT/jATrJHCxpdg0ZTVdfkEFE4BeUNVZniSQYis/XUwS94noNgcIrqQc+Sebwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=is3iq9snime7p23mzzpzx/kokoSPvP/XUq2UlGo3lhk=;
 b=SVXHdA8GNN4hjib8UN8E1/4s+cmTQi5foviSRdsa3HA4RgI19lIiN+gFG7wakSm0rbGreNXkm5ZHyP+gFp0WVoNrKfyug1VwwBcixRdGeCGQwT+pfha8iDB043W9nR6/qbQTHX8LZXNqCKXm3KYRIk25HqbMHUH2CA1VXWz7UrOeg77i7SWFQKXpDm2xZH7nn/tmtrgGhfinMZ6zV55J9OSA4yfC2dJ/ekvRb+CNwZooKvPEq6OaegS+ZA+W59iyXBzJoe3bh0sWOLfnnRSrQR4AjO+yxJl5OHn9mOdO5UZrjps+eTCLVCiznXj14/JqMnEXGuqzzsvAdzIKFfJUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 6/9] drm/xe: Introduce xe_pm_runtime_get_noresume for inner
 callers
Date: Mon, 4 Mar 2024 13:21:51 -0500
Message-ID: <20240304182154.42611-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a5f643-dc6f-4523-7fff-08dc3c780514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8i4EQKMq+Op9rb/Knfktg6p6ws1YvI6K7uLIcjZueb/qRkjNVbLo4Y0P3x6mfNe9CHrbbL5wesev6o+RYVFOhFAxDuVB15cxo2LXAsCaTLeEwxKKKGCZYRRzbf42xXcVIAKxTmL/G9xknlAAplrqQpF++ym1Qq2rccmfQWRITrYuQc1k30lMB8875XxHlOE3rx3AzUKWRcWF2ZSbFNgTkhQeT4Jv1l7G1JQwoAOwv7PImOIpshS+2gvS6nVQ9OZde1MjVjYShfmXte0RIp3Y63S4u8z+fP1rmJnMRwC1YzjlgXyLESSJlxNgZ7I2Umeqga74xAeWyTa2HY1KuHqbbaLMnaXK0boO2cUr96Mt3NSfxj5JDOZvaBVTm4uMY6C0sLwc7GyPMoQZZoHJ5FwZATIz1yEyrKvScd+MlRcEXRMDxS/2KFqExjbSQ37rLo0qpublEj1hZXIElpEO/nLaLvtNGzwll3853yNBVx8s/i70bUyV6X4fW1DNnhUpFRNelDoS7OYdf/dldw9Id5CcfKi+5FvHYP7zfjZ2SD/UXMOWLoYITexPwPjq1L92swC6HySP4/RoFZ37P7/LA5GwOMUJtyvdYPFCJM+hyMo1V8SlNGo2xQOG1lVyQi/mUU4F6dEADbWEId59ou1pF75zL6mvs21+MM2MFp4SRsrPZ9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1plmPNzZWf/kiTFNAoSXqtluARwAGV2xDmY3IV8TJAxuoOmxCeatL1J9o2F?=
 =?us-ascii?Q?AsRYuI1akbThxUdco6tFDt53xq7/aN2X3PlLnw5cUpY1ps/pizICNaFRlBKb?=
 =?us-ascii?Q?bux3UG37a0X5YmCqitKE2JYzjBF/m7F5UI8mr80tvv6j9e+moYrMPjS92mnY?=
 =?us-ascii?Q?wOi5xn4gPh4W0whWtq+8rPeQEa8sRQhPmOsbIj/mb20vkKKMrrfW3gSiFZDv?=
 =?us-ascii?Q?YWq0KlxkEvgn1EJojU0NkXfHNOlSarL4J7KCnyXaL4QBhrLAmyLBY9fzm7ke?=
 =?us-ascii?Q?8xDTVAW3JaPXPso2ghK7q9I9JW1hpSuUH9HiM5YIxY3uKsnhWvIUTxinHfkX?=
 =?us-ascii?Q?tPZfcKjI6ZWJZyje4qspXw2KUnQDBSoNNukdAMuIaeDbGkvzchPD1YkPY6Vz?=
 =?us-ascii?Q?xjtd23wExvfQP7hQCGlcWqR8DHxyFhYWd9VjqbqaDLJgsaOGMHgGP7XsRqiZ?=
 =?us-ascii?Q?steev+vlqo0b/wZaM00Di2UEqqQEvtSTBZqokOHG0DV562eQMrrdSZ9B6B0i?=
 =?us-ascii?Q?lI1FLDLr8xbuDigud3ePFkOXBV31M/+Izwyc7XCqTp+8+q+LIIrV6VjZrQz2?=
 =?us-ascii?Q?Ev5F40srpvtsdVxOlT69Ni8Gs700ETiHDYAlP1FO0XGMwgf8SbpoCxv7wmlb?=
 =?us-ascii?Q?R6m5tWOYm0xeNe8fwNRHGrIHD3r10rMX9ACJYNcO3QcjspVzpB8mkC4iD0IK?=
 =?us-ascii?Q?5fTE1gg3VUE8He10juBwxUBKAfnHFjkuuvv3BrZN1hep6aY6VdVffRnlFQ11?=
 =?us-ascii?Q?YqUnGsAkzv4B3UQWlMIU8ekJZbXqIIlfD4Qylt+8Wa/dCu19crebqgvfzN8c?=
 =?us-ascii?Q?4O9xHPuUuuY0tzOtwZ6suD7g9dFqOLLFl0s0Qh+rJIphH19fByNgqekm/YX8?=
 =?us-ascii?Q?Q93fHfGFZFVcqaNv+6ofl5XT8IQvTY+UlBymkc67biOpmnMIEyEZr7yUYo6Y?=
 =?us-ascii?Q?YCYWZiRhdbBn8WROeqEV1p/S6ipAj8pyHyq1J1BTMuOU/A9blSccE9sr86Rd?=
 =?us-ascii?Q?2Kl+6W0kCS2y8nmF/umPKtYlhE/nZII/UiVbqh0xNjygzK2uVVxdEm+mInbw?=
 =?us-ascii?Q?1d4YgN2dFZChM6PZzPLPrmnVQS+d/AoBbVxpZ+4Gb4NqNYUnu+Vv75HpVHgT?=
 =?us-ascii?Q?KMWFgG86gn+kXi6GKkUvUdBzAbSwO4b3bwhiZO+7liWsSRrVyOa2pg5DD/uO?=
 =?us-ascii?Q?Lrb3YBNiNjaAW+LTBMd+ATCNBVnu4krTK/fkrrMe3ygKHjK34w1SXTWPLQfO?=
 =?us-ascii?Q?YxD00++TFPs5/2cHKGMcim6iZeFX00uULXaDUb66pIT/wu5wOenhM5pO2AsG?=
 =?us-ascii?Q?VERDcZiHrhHQ0co6x21kNd3n7dd1f1TVVlvvz6DPlsup5V9J8PWLg2EO0JHE?=
 =?us-ascii?Q?FGnrhOZpkOqwTO5cd6bUZMjk1K8NvXXEMs/40o77jNApE3HaIAbeBMy8SbFK?=
 =?us-ascii?Q?OPDxMvsYBaHt/+wgLotfjTlxjnIeqdPAE9K4iFyO90Af/ik/FHf/V72yF4/N?=
 =?us-ascii?Q?2BKF2H8Lcb8rayFy9RlyuKlgYpm3sSuZzBr35jGrKqrkgyJzvbitqt3M1jnA?=
 =?us-ascii?Q?RH1yMiTaiIoYAaraYPTbY3W4jITOrx8KYVMrGPa37GmgmTR4VSrtAzV2m2XU?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a5f643-dc6f-4523-7fff-08dc3c780514
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:16.0955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: canP5w0jgFxaBO1Dr1nv8domvhWppC0+of8aitPH6uQKBkgZw+QkajKItcpBEZMS2S/BzZVVohhz5U0elw4SPw==
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

Let's ensure that we have an option for inner callers that will
raise WARN if device is not active and not protected by outer callers.

Make this also a void function forcing every caller to unconditionally
put the reference back afterwards.

This will be very important for cases where we want to hold the
reference before scheduling a work in a queue. Then the work job
will be responsible for putting it back.

While at this, already convert a case from mem_access_ongoing where
it is not checking for the reference and put it back, what would
cause the underflow.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_pm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h         |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 11e150f4c0c1..cb83bfb2cb6d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -128,7 +128,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+		xe_pm_runtime_get_noresume(xe);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1c323e4734a9..71b7663accd9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -505,6 +505,26 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
+ * @xe: xe device instance
+ *
+ * This function should be used in inner places where it is surely already
+ * protected by outer-bound callers of `xe_pm_runtime_get`.
+ * It will warn if not protected.
+ * The reference should be put back after this function regardless, since it
+ * will always bump the usage counter, regardless.
+ */
+void xe_pm_runtime_get_noresume(struct xe_device *xe)
+{
+      bool ref;
+
+      ref = xe_pm_runtime_get_if_in_use(xe);
+
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	      pm_runtime_get_noresume(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..119b630ad1d1 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-- 
2.43.2

