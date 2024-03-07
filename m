Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD7C5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9726113606;
	Thu,  7 Mar 2024 00:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9DkCXDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D13113607
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770570; x=1741306570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UjN61NFNfAgMrsrRlCLSWQCq03ZhIKG3HlvtkF9L7Rg=;
 b=k9DkCXDezrNcmXpmYQch8OOyFR3hbSGtttjVW2W2OvQ4DfabeGWwn5Om
 pZMu+ep+o77UgDiIc2rpb4hH4f0iwd9x5TdVclNrxC3ef3TiSPLvMtgcJ
 etwCtTx5/d8aspn2kvuv5qyUYqvSF5uRPldP314hW8X1/lcilGZLiXkcN
 dm+FWEdO43uA9NmEw8McUZJHi4KPp8CxWQUfCbU8GLI2JY9l5TKO2aA01
 vPWWx4RMwN7p2OE/GK9+qtSjgpH0ffUnegvnKsBMjlzTKB46s9iwnunpF
 h8zQzTpOqW19BmYDGI6IVFjj8ZnhW3jxQE2E9pxGbeJ2pYG1OxTXCHhtm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21939953"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21939953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:08 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgNvNE1fn3ls9IHxYMPer89l5jNYCjeJXg7h02r9W83+I+gfhlHGYrVU8CASgOGYSCtyu0ckhCRJvRoGsZ5oXN8qirGsaAqvkYhCy1P+erWkbtgSzVl9leObwS2qHXsHGU9vAxq6eC8bgH2pjPq7vrDQJwksFM6amu/JxwxuVNO2RejrElLHtNSmh/7Q1J9l+dl3cJtMUWHx6lO8H0uDne9C4AUt4EKhMJQDnhJ/d5bpS114q3dutZ7/Jm4fAioYL/qushwe1Hhkm9yRYRaLXMonqY9BfthPo0FgUa09r/bNWe29m91ZahMdoBcwd0ssEzuRERtmJlT32wx42am4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrqovdFAV33dpiwFz64imAXGRtkaL/6t4PvRUNljamo=;
 b=RIvfDq9mWy6CaspU+FU3RSeeKBU1uO7Myo0chmsSqEhAJ3h4MEGWmX51eTn5K7KK+H0/YPxFyU50UQsMjuDF9e4htzO0JDqzLDb9E9oiVhOK3H9PW3cLVVBSfAzhEjNhOT/BeQQMXuByFR0mTGQ72SGpEFbCY1b98TYqnAQ8RkvTGpJf2ldBQWr2HtzpMZY0rdma0K16ZovFriA1LkK/w3ub5so8xdKnZvLpEMXCRJ9E3WVgjUai6YhMg916HPrMSeAcJyrXkdTdv8ndJUCGvEW0NRA+iQ3/4n7AHTRWmUcgLuEw5CGV/SWXjqF2RI4Wa3K5zNfHskrtFpIL6vZXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 00:16:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 04/10] drm/xe: Remove useless mem_access during probe
Date: Wed, 6 Mar 2024 19:15:48 -0500
Message-ID: <20240307001554.162153-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dfc4dd-4d2a-4672-ed4b-08dc3e3bc864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60dlpTElocGagYXLXfPINAGhH/V7RPPAEA2O+1FUWPYhsaoEhvBfAj+Jujcezau2BL+5bsO2UrE35f6ZhzUdnyg8LDZFBzhqdN9yd5VUwoL2C8IeC5vbhUHL/dKzf8WTrpC1kgrGZrzd6LRQASyevXs+qye71HIhSEcjUfCJJ3JtuciRDFynGD4ILrH6KiDiWxeqPei60aTEx/xtspLjSUAKujl0to3PVVswPkUkjtwfCe2GTLv5s3249imlNlUzUGC9oM2TtUsRAsZK8TSeP4zBtUrMaz2v/41v0b3lPWGRi97VM0FIGLv/UeTweT2cvwkiT8qRMJj+5AKWXe9cnx0swpyjAxBBJYlfszSRFRGekHK1MYLTCUkqYxD7gl4+Mu+QkY2kKPAs7i4ZQzNTISbeBMBV+hbDA/Uq0jWKpn2vRsypDQD711SVmQXM5RANtithlFhFN3A6IdS+WfdMVTDqGGtCbEk8CDxL0Dqj/2CuLA+VVVxj5IP3fAohe5OBEmymmcQfr+4qqcMtJc0CcSqZr71Y9bmKhb80lpsqpfUMMBi9hAcq2UiuFBeHr7RvbblDIcwtyHb8wWZPkIhLBZ375Ay92UIpkBfJIvyS4xrrHD4J6HN8Dmb0RaH2BhnDYYrLUFIFDBqxNn65V+irGq80nueq/jssfj3ZDph/ELQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zPQKxob/kXl49gCkfMJA8vSvzWLrHHz4ru5fAIAgzNdTHR476GHyWl/QAdAD?=
 =?us-ascii?Q?ljWmF8cfcaBdqU5LtU1aH+uOs98YJz3ZdmL/ZiUIAao64t9hNRQIvACMq61T?=
 =?us-ascii?Q?pY26BuPTngn9Pzz/hNd8O3zv6OIZDBc+G0sIUH5BQkX0jnCY8hv0AM0y+y9r?=
 =?us-ascii?Q?h7nNtG6BNgCY745ON9em1TfbB0pCI2/Vq0lz2Lmn8LD16C3T8E5koLbOn+tK?=
 =?us-ascii?Q?KTWELwb7cAWXp3VnLPXRj5gb8uuV4evTBM6Sn2mi/QcP67Ji1QlHmb+J1JyJ?=
 =?us-ascii?Q?dfse3zzBYjLmtw9UENCMxUln/1Q2Rqxvq6msPhl2SL7WfxjibMAAR7kMMn8r?=
 =?us-ascii?Q?RERlkxc4WSQCKd7ZvbJayAVq2hlH4fjlLZoTPCA9R5Pc2uCuMdc1dZ+N1dgj?=
 =?us-ascii?Q?5iwhXgUMxddSxbQGPzMBPg1/5tib0NVvtyPmEd4DYZdkMVRJchyK+S8K8h+L?=
 =?us-ascii?Q?RNuvNJrmaGZV7Ex958UK+C6pPGpQm1LH6YmU8Y6ct1ZYHJRqIc1bmX8OqDuY?=
 =?us-ascii?Q?mEapt1Pe6eYnmnGQwOlEXC9GiqkE95JKRdfPE60VPaFjMbx4CmpiyAk70Iq/?=
 =?us-ascii?Q?XVLT5XOLCunHSg5Eriri5z8bWUuZqe2r/zSKsUsnxkiD3DBOmAF7ZZ94fqFL?=
 =?us-ascii?Q?QWikTBBcbIUHkAQve86B6E2fP5lC3LVNuCGIPhaGJD1RpMcK6N6m4bcZcR5W?=
 =?us-ascii?Q?BVIgVE1xRvf+Wqq+abTDntK3iTfCxo5Fslkp3CWaEXFaXoyhCUM+ZDKm10rY?=
 =?us-ascii?Q?b8BkxMim0II+o2SxOE582yJsIAoqeRYqXZpDAd4jcuCBrFcY7hu0jZEOwwZn?=
 =?us-ascii?Q?liroiXu07ianTE3rzQrQ3eTHEIgDXj3+R0LCkCnq8eMzZmkuBk0qPY0CLIzm?=
 =?us-ascii?Q?RLHUE2bLJMpM7cJgVjj/772zhYx2Z+QnhfqMKJQiX+K4cGhxCWQR2/GiaZ9L?=
 =?us-ascii?Q?OcGW/FDBPnQ026ZhAPVptz8gjwGZ9/VYrMEiJUhg/AQnZIEESjZcubheOLHJ?=
 =?us-ascii?Q?Pb2RLaXsToxGfotXlgg6rhC6JcBixGDiRu34hTqQsYW+N/EgXAlkfRlftTyW?=
 =?us-ascii?Q?GTWZ0+ADQ7KWPWLW8gEXhnvi3meFvUG6OlP9ySOVVvN649kSK47e3hPE+2lL?=
 =?us-ascii?Q?3XkzF7504M8yf7NN2/twkH1XImDjc8lfDUuEFnLd+K04EsYSiKBpcEzqxFCk?=
 =?us-ascii?Q?dj0vKJw6VS3jB8qNl2BjYNAeOK/DKWFVYES+u2++ry7TtegzydmW9+G8VkAj?=
 =?us-ascii?Q?5gwV2QsxIs3gkvbyt5atb7GykVFtlL6J+J7EEAsk741Xm2U4AgpG1wZbW0pv?=
 =?us-ascii?Q?fmIW4ux0rAlZ1QT0oRpfnXcq9yD+cSJ7WwqUMSUhaDDTLsa+gMP9fYj49r93?=
 =?us-ascii?Q?u3AYij0oQ1ewa/tae7GNtVPGHwHdCVjaTazDMKyqTdDELnCJtQga0PCIctWD?=
 =?us-ascii?Q?rAzo8lRWuGKin8YGvUQ2HlIwxnpICJhR2n3pYTQFyIBPOkh646g+4T8B7YeU?=
 =?us-ascii?Q?XJ1rEXiTa46B7SCUvKsqQQZC/Pfpcbnq14YHM72MUMh7GXjydqfnBoOx7ArU?=
 =?us-ascii?Q?1NkOm8gx2eUXSaFYqjcCmUy1gFrbiLOS6bjDNVNBBqgBBkCVz4xeR4CWlecG?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dfc4dd-4d2a-4672-ed4b-08dc3e3bc864
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:06.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4lP4+nCYyi7WTwBXpCnjAyEvqlrvXv5/pSrSbQZP7Cut2vpdh2AnZhd5RBuS2O4R2ivZ1GOSSWEBn2W+AJzkw==
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

xe_pm_init is the very last thing during the xe_pci_probe(),
hence these protections are useless from the point of view
of ensuring that the device is awake.

Let's remove it so we continue towards the goal of killing
xe_device_mem_access.

v2: Adding more cases
v3: Provide a separate fix for xe_tile_init_noalloc return (Matt)
    Adding a new case where display HDCP init calls which
    are also called at display probe time.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c             |  2 --
 drivers/gpu/drm/xe/xe_gt.c               |  9 ---------
 drivers/gpu/drm/xe/xe_tile.c             | 15 +++++----------
 drivers/gpu/drm/xe/xe_uc.c               | 11 -----------
 5 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index df1df072f3c5..d21e535c0be5 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -70,7 +70,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	xe_device_mem_access_get(xe);
 	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_SYSTEM_BIT |
@@ -90,7 +89,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	hdcp_message->hdcp_cmd_in = cmd_in;
 	hdcp_message->hdcp_cmd_out = cmd_out;
 out:
-	xe_device_mem_access_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5e739513ab0a..cd5bdaba07bc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -206,14 +206,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 int xe_ggtt_init(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..063b710a8c7b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -347,7 +347,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -389,7 +388,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -399,7 +397,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -408,7 +405,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -474,7 +470,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -483,7 +478,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -496,7 +490,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
@@ -519,8 +512,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0650b2fa75ef..74ecb5f39438 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -160,24 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
-	xe_device_mem_access_get(tile_to_xe(tile));
-
 	err = tile_ttm_mgr_init(tile);
 	if (err)
-		goto err_mem_access;
+		return err;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool)) {
-		err = PTR_ERR(tile->mem.kernel_bb_pool);
-		goto err_mem_access;
-	}
+	if (IS_ERR(tile->mem.kernel_bb_pool))
+		return PTR_ERR(tile->mem.kernel_bb_pool);
+
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
 
-err_mem_access:
-	xe_device_mem_access_put(tile_to_xe(tile));
-	return err;
+	return 0;
 }
 
 void xe_tile_migrate_wait(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 7033f8c1b431..4feb35c95a1c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,11 +32,8 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
-	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
-	xe_device_mem_access_get(xe);
-
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -65,16 +62,8 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
-	if (ret)
-		goto err;
-
-	xe_device_mem_access_put(xe);
-
-	return 0;
 
 err:
-	xe_device_mem_access_put(xe);
-
 	return ret;
 }
 
-- 
2.43.2

