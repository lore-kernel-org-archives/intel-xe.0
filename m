Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E50C54E60
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ECA10F284;
	Wed, 13 Mar 2024 19:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJUGwuQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A73E10EA7B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710359714; x=1741895714;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=h2LGV2E/VkK6Dm1FfzFC+SDMDPVBZhX5WrGlKzTRHwQ=;
 b=kJUGwuQpWWGdEPCqJEqJOGLmIJoefsLNefHiJwBH4YU80Ib1BPgiUy8B
 Wj9PbCGJ2pLgRGU0CaXCNnz63yhPvKJqaGN2Tvsr26APIK2ZINTSewlBU
 skB9jrHLwCGe8MWAV5pmm2jmmsk4WMsxSpSBXvF95dD2ldPBx4a47Hm4a
 WKi0g496cSE1yGDSqcRBxzTDryfUCdE8dwZNwBiPoKwUgXYok7g5oKHPn
 b4t9nBPLmck7UOCGZ7PfeYCBaNIcP2/hpJ1oPfChY+S+MQx4rpQoQIFJj
 9PgkMshce+Hpx7Qu9uHq+4dw29KkyPhfFUIWiTXZAWIbzr7QG7lSIhp+t A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8970262"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8970262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16718922"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:55:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:55:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGv6wz8Y8bASZYbAm6r5UzXiEamUNzmlJucFLJbzqzXamfsNI2+weF+tOR8cvOGuR+J5Ec6zNQbNqy3ZJg3d3+Kc/Lme/PTWufXOAt8iQEeKmfFzOFcdOWG7y2cZSddwC4KqiAHMXaLFbRJrfgiZ7kyybiVKFMj8cJdvBEf8yRF1fNrGtqS2DifbeqCW+/wVTLOA+fjQc4TJw6Cn7fzLUSdzd6yHNwU3UITAjOttCrL1cLrrAZILzvy1be8qyvIQcBvhlucwOJ0d8faJMXKjLYNDzjApwMKUNmE5vSI/myJIqmnSUfMrGV++ecepBhHrY2cLFuiZM85fjFkx2sjpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQf9uZwmYDGLdvSmas/sLE+kNmV1WqF9fry0xLNk7cs=;
 b=AZm1hmjxT03rEq3oUq1uJEAacF/X3KA1+BnKJlpcdFlZsysQFVApIomCyC0vKBIttBXQHTIUmoLkE/WB4t28C/YayxfzLHl4FDt3v8G1L3hJYMJYKCCnwoR1FyuC2YUE/9yOZ6g1WWrZlJnRA5VvyXlWVUBsNsthrcrRXqu9CNw1aiyt65Gi/8XJxL/qY1yNMFMHWjhTAU3TDry8+ZKPDvh4rPZsg/gANcJGxcdZ3yfoOgXqw4xDAj1sCc2ihThwXCsMwhB53QKAxVkclRl2jc/izNxQU8RDq1iPKMUfErF3sUyyS+iVV3r8S40aqlFOO0iI5f/GCUKuTN8Mk96HEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:55:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:55:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 1/3] drm/xe: Introduce a simple wedged state
Date: Wed, 13 Mar 2024 15:54:57 -0400
Message-ID: <20240313195459.141463-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a15d639-9a48-4260-1f0c-08dc43977a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbzhnBJnwpSMdnRuJ88BeyznLfm3pnDL3UwdPd7HweBnQRJKV8Wv4EyFbrf5vxL2grcySCZSQSC29a3GYPbdFGMZhJU18R4zfD35/NFCxZIrNkOAYvknTNakihHhE9Iev686dhIkXvmoVf+RJYGuhZi4vyo1Y6lauCKqgNcMittLaa5+SHr3VB1+mDquUXLNCWvdiNbRLWTfsyc2RWPuaW1N0K1pmvNyHvRO5ZQRGYajiOzX5OuKaz6VCeCTse+y7uLsJ3QzDtVrAnLqHXkFUCcfPdjOrcFrdjahjGnhxdxnWVhFd4yq7Axq2gYWDEhwcOE9OdLDjwhX7zfOeVJ80t8B2T3euka/fMGAC614DsE1JHcY3b79r3Whrt1mGeWEN2uPV6+xQ+K1zwN3AWCZMJcd8dU9EfWH0rAq00PpPBi3T1b7LgugUEq3zW0wXWFwwfbLvsVr4Aox5kKf6GKbq/CVUMqsfmwBsUVLbXX6pQo+YvvlWv4/YtdJe9vDPnyMViAo8SzVwZlPRmgQlJjqV/iffM8x0o+dxO0syXhp9oquJP48ZcNe7yGK4Lr9+z6fCFLw6Yl9iz+Bj9OysioHzO9eRj1ZrzWdA/Z2fIsSN5Y16AzExvNXs4dOhvo74o4tXh9/Ff11nowEfQER5iE4fmCX4H0ms+TGu0Htwg9k1k8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tGluoNquttKxAYsJAXJ3oAcVUWEvnSAYT6Jw3ezKtcfkVCq3ecPZAIebH4M8?=
 =?us-ascii?Q?FSrdhfHXSCsK5qlNZ7ftkz9hEou6kGI6a3fIIBG56M+tW5SW6CiUSInXcqEq?=
 =?us-ascii?Q?mfknutk0GAi6ZhUN7XYISj4qyYQpS6QB8BBMHZlQXRKgG2ruX1hWtL3qOSxY?=
 =?us-ascii?Q?qEDDEKhMZjuVQiECXnsu6E9Aitsl+GeSe1cCcsxdPiVnDDPTi4bINQ6dJT1B?=
 =?us-ascii?Q?wiHyJJj72xckpzWxHxTJezyHQIy90co9x2CoZThD2PT8DnYs2HTSobC4DTKh?=
 =?us-ascii?Q?IbTJ2Em2TV8rRrjhyv/MyCj9RaR+r32P3TG5Cmz2peHQfjwTWzjFTBCzXRwS?=
 =?us-ascii?Q?3gFsf3dqmHPcUS5ilNpPGsJgYEc/TjrxnxvXFsM6AqR9ijqQA3vCft8CRe63?=
 =?us-ascii?Q?aqPJ+91W62CL3ETc2BlTmR0mf14vWZjxiLyfqH3YfwkPRiTA8Oztbr0BCB+x?=
 =?us-ascii?Q?X57Ky42cQ7I8VQLLg5HbjK6g0b2IuK4M3gzUsqmf1D88iNMIQTAr/EOq/P8C?=
 =?us-ascii?Q?+Z3slvF6Dg9Vhcx+16kqfy2o6ZH01VH9WODv5ZnIgYj1pc9mESmLO2OUDKE1?=
 =?us-ascii?Q?6MMohywB4wq84VfANPQiPtEpDOczxrx9AkWtc2gTm9SxA4cig/QYQsKHkQ70?=
 =?us-ascii?Q?+XJNro6uyblxab6Uk6weVxWQ/yRGJbnr7TrZtIfVtFiNzLndp90DbZwJt4WR?=
 =?us-ascii?Q?aNsFGJRZM6aYwfkuPHsWWqy/VSu6iUvovmj/pqT2IEU5nfIuAAhjrhD+QxhD?=
 =?us-ascii?Q?RUR/O31sle7IbqIY0eAOjqg62H2aCPFo+AejYG+JDNrePk5UFEQ0dMhLg4oG?=
 =?us-ascii?Q?6vp8dDWzVUYRT7TfSn4A4RBxWUO+zatWrDuQyu0qCwtry8E3aeGvZN+8Glbt?=
 =?us-ascii?Q?IZloZc9IzJTojSf/FJKu9GdIPUSQyjELJ9p1nKE6DaU5NGM4EsngeRvvA1os?=
 =?us-ascii?Q?m708w0miSE392uanXwmnc0IH76qPbWlNrV/VQKlW3OAXrLt8+7OZSEiQlJt6?=
 =?us-ascii?Q?Ea/lJ21XukpdIFYodkvysduth0LLGAtxiGq8tA9fMpTxzqSoO262F5H2kMYk?=
 =?us-ascii?Q?KuTZetFtEzjG51z/zF0jhHc1iMHkNdG37jXniJiKp9oHgw+XNFPMw6C4bb2t?=
 =?us-ascii?Q?UFfGj6eUq8DKdtn2l6Bfcnhi1kw90h8JtcvYomRx1tm4INMiJn3/6f0IyhUh?=
 =?us-ascii?Q?L7F4RJWdzBoza24Q15eNsjyU4BwLoM67j4zANb2HvlpgwTGreDwbzqn1R+BG?=
 =?us-ascii?Q?1LvF6Z9PbuY2GkHc2xIm/wOAXNtAg6oLdTeBUmvtQAMFJN6wvrTHNsAjVjhs?=
 =?us-ascii?Q?SV2Ox0CKb6LSLzR/64oH5P3bQEyar5RymaHJqbu2c4/QqEJf6oGFZFXd8HAc?=
 =?us-ascii?Q?3H+zqnCG+Nizin54JTe4vO+Lv+lsU+m0PUzvlEEBoJFRHwthxiEjUzZwbkyi?=
 =?us-ascii?Q?O6Z8h0oME6m28np/aFUj2mb+YVEjFmdVJfSlP3h72Il5SFjj8+r26KGjynKK?=
 =?us-ascii?Q?5a4Gghqt41fOxq9dP8haJ7W3VV4+uh7avRZ8VozuceAZTNwfJEM3HbCg145N?=
 =?us-ascii?Q?NSpa/v2udy2pNEkQyAgRxzZllOeGYHlhN8WCukMO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a15d639-9a48-4260-1f0c-08dc43977a04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:55:04.8220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7KMPxspqOCrPRKLO+2MNWvc5jzxxE2do7T4cgPRr94mMMEART3iAKzT+WTEwsiR/cBhTWWQs5m1pwQBkrmgxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

Introduce a very simple 'wedged' state where any attempt
to access the GPU is entirely blocked.

On some critical cases, like on gt_reset failure, we need to
block any other attempt to use the GPU. Otherwise we are at
a risk of reaching cases that would force us to reboot the machine.

So, when this cases are identified we corner and block any GPU
access. No IOCTL and not even another GT reset should be attempted.

The 'wedged' state in Xe is an end state with no way back.
Only a module reload can restore the GPU access.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
 drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
 5 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..5f0a2bdb7c24 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_ioctl(file, cmd, arg);
@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
 	long ret;
 
+	if (xe_device_wedged(xe))
+		return -ECANCELED;
+
 	ret = xe_pm_runtime_get_ioctl(xe);
 	if (ret >= 0)
 		ret = drm_compat_ioctl(file, cmd, arg);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..d10664d32f7f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,15 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+static inline bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged);
+}
+
+static inline void xe_device_declare_wedged(struct xe_device *xe)
+{
+	atomic_set(&xe->wedged, 1);
+	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..13971eb2334f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,6 +455,12 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+	/**
+	 * @wedged: Xe device faced a critical error and is now blocked.
+	 * It cannot return to life without a module reload.
+	 */
+	atomic_t wedged;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..972c0c6d0608 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	if (xe_device_wedged(gt_to_xe(gt)))
+	    return -ECANCELED;
+
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	gt_to_xe(gt)->needs_flr_on_fini = true;
+	xe_device_declare_wedged(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..5b2eeb2048b5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
+	if (xe_device_wedged(xe))
+	    return ERR_PTR(-ECANCELED);
+
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	int err;
 	int pass = 0;
 
+	if (xe_device_wedged(xe))
+	    return ERR_PTR(-ECANCELED);
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
-- 
2.44.0

