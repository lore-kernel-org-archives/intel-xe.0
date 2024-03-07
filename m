Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEF7C5475B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12A113602;
	Thu,  7 Mar 2024 00:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIkHE9Zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EFC113602
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770582; x=1741306582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7s+sV35gu+wSf8DL0h029UtY/J5uHXMfZo4fdtly+pk=;
 b=QIkHE9ZsESdL6uJyv4SRONJhCS6gz58dsAJriCb55s9ngUkDI7iYFPJz
 XdezspcEms+O34fgAWt1tTHZWOCUohij9InuoxLgA6FP58b94FaaOY8SK
 n1P5Zvd8cDcOANR3ewkvmxHExkhbnfpXFToF8bM8BL8ummC3QiEdjYH5J
 We3Ym9pWmMzZ9PDgiFw7EjuLDkJ7DRieAoQe5CbHpAyPYjGHMKjPTPlWx
 qXoSgwFmsBdZeqvg3U2t1znfXlfNqtfL3zxkOCPgui1R6cIf3ZIqVYdHY
 onnSiUtQnO/1KWioCYY/O6i2T69BjO4wzkV9EubgheQ8Z77ziG+gOlfry A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21940036"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21940036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911856"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:22 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE8QO8IcFSI+CBGLFPYUD6ZcKpR45jQgYkauN9Q++9ZRJF89wkiB5DFaCJv61u92lVZX+obTttJGCXIOZ5RupTTykI2NpuksCswkszy53uX8HsLjWAB7yGMf4uhDOwOI0k8MxmdrWrOdOdkJOY5kOzHuHmjYzPBIGYNmhFH5BV2haS49n6IiV7WOXm6wba9HaYWoJhV7gu2bf+Yc1v8ir/qqweM0ISs3GDegk66WSD3o9Mmnu/CHLLaRr1GDRrhcL6v5/tBiddtRlC9h0KutUl6et7aagDQWpjNYLM3esS6K4huLaiUcEi2HVZFMUF3sZFWsd5+zG4hvwQmD1zxFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSwgLjqorcNE8qlj5MKvWPLFuLky0gZdruzELHngmmc=;
 b=IYVvimZzIW4ISP5RSzP3uyjc1d3lILNNu1QOz80PoPihAVRYcyWNKX4yReQ+PcW4OpkktI+qIV32Qs/eDt7uoghQA2FwdUGhWfjR6fwNVDMf3AEy407ZQYBKeUtrADzNP0kStJxIhyh9odNQlMVdMjXGmTWKoA1GgmNPIkTJYBWEx98MaBTTAPi2HS7LAsJnV9gIaIEWRPPKYmEbDey8d658DD0UJK1lVKAd4+2vDJGlWZmen9lY+jCOajPReb0qsIWvQKwaLIpMA+2kMggCHpSzgJuaiQuDC8Q+fJH1coubQKJXX1+snJwt/SxA70AxmN/hHzuTC8WYT8Irtdedvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:16:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 08/10] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Date: Wed, 6 Mar 2024 19:15:52 -0500
Message-ID: <20240307001554.162153-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8bf249-315c-4df6-2cbd-08dc3e3bcff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5OUdtIx1cz8WbMRwHp6Y8oW6u9Wf4b6eWRxt3yCldsaqy9IYpt82/SaEXem6UkuDEo32UmFxoHiSv4Hoce5sgHH6AF817lxEefObUiOU3SynxmvNsibjj2y2QXYVPazcDUAtn7Qxh8y9mtKKTOIsXlIHFINNOu5xWJvWUcvoQCcfXtFLz7wV9eOj57r/NDXPms55KrPFM+VMUs25CqykIucjtfbBEmVkHvwLqb1/k//OBqsSe0/Lj4uDYrUZsmlIM5EtgK6duf2mXd4IFYOa+h9dkDYdr2n20hP3fXsx3THW63cg4+tpWmeglOxlQzpcHBJ0cZSC49Ey/lxeR5c7/OrPgdOfyiyidTQVKoN5nIqVGY1n7/SGcqyDzYDPG9/Oat0ZGuLsoZmyh7VuTYhR9qhanncOUNpkKcFC5TKS+GydGqi3L+FZfQNpmQVq6BSSfoIHmbVPAqWXsHLBM+1E1r+LMLkKtKLrerVeaKKV/P2WA/noXi9871zgVFwBPyMR0uKrvD2chMiuJsPIY0O60ItRMgYQOsZ+IiQuoMDrJLW/p2W+IqDstXvUexHBXUcfX7jOih5/UeZ9ocKKgh5QMyl8x+D3nVEh5mjKiSXlVejCY9jn2hjkiuuNhx5VGaqX2MnwhYG8X57XZ0GA7dYEJq51UgU4VNxBHZWtuqNpvE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5eJgzVr2MkUfbkIrmPqKuUbttGjHAdvjhIGXIVnGtWZPwA71xaEKau1mTD0?=
 =?us-ascii?Q?48M0a5UPTea02MRPk9eSyWBS3+s3YlqjvoT79SteMGY1j20TpLLNmzDLV/wH?=
 =?us-ascii?Q?uFocNIRQTcRVSET1c6S83vmRDTisMd3iDa7C67bVmXYe7lugv3JMUFZ+eM2Q?=
 =?us-ascii?Q?+eGQot6SDF43IyASe8wKqGkEVsdy82vrfj8GPYXNDpn27/LfkChgKW3ZyxO4?=
 =?us-ascii?Q?yvjuuOKW5djl9IwEYrsAC0MmUFjd+J1r5ZTbyLGuXo2mZypWFYlbsb3XDIP3?=
 =?us-ascii?Q?zhZhCqwKdCL3DqKD/bhFbWU1yUfRQy5wrr8x8AY6ltcIBHC0P+D61Vqfpt1i?=
 =?us-ascii?Q?zBZ3ym09J9UvSDV49LgSjNzlW0tIt1G9dV6Y41AdpVV0PYtKcaAYpIDIeEQx?=
 =?us-ascii?Q?9Y25ZfJCH9nJlw9tf3xyEHyK+NAajPgUA2YKg6DrSj1k2MeouVpziQhP0GYE?=
 =?us-ascii?Q?1boJCdsNSlyBjKwjE26tt54a8JMkdv26V1xl5f4sY/gaxpDLpYihl4kznZeI?=
 =?us-ascii?Q?HO7skSBhA1Mq/tQXmAcJ42bcAJIBaOY6cR6R+Y56CP+6ZeF24AIZsUEtUjoZ?=
 =?us-ascii?Q?GfxcHCu3VwYVFhFsJgHdoLFgJsB+BYe/Sgg/NUXhtdENf0j62v+DnIODmivS?=
 =?us-ascii?Q?Hi4Gk7GDNUaJb/cMEbjEUdcfs83VIcad4s5TxLycH/04FjRPWYp/ktZmTv5C?=
 =?us-ascii?Q?jQpDd38YQlffzToJSXy82RahuQafM8UR2xY0b3DSMiRifdsYKKCzobHlPDdT?=
 =?us-ascii?Q?DXcTgGk8sbkzKfGHwIOFYzDcet3blxZFmdNplkr88o968WMT+cq6lHvaMRgZ?=
 =?us-ascii?Q?hRpn0A6qqkwM3RBwVRCKVA0VSJTdBQvJ6E0GH80WLd/f21sbJgUoNP7ogcDk?=
 =?us-ascii?Q?Y+RiCDlngk3pdMBSt2FXpA0Qup7XP+22BMtFjTENToed52dptXQJsV/A1Ai/?=
 =?us-ascii?Q?mu9IPODo/hfeas1hqZvs7PfvkKfsb4ZamZvpBi0rZrfAd4WqxlRsCryIzuqj?=
 =?us-ascii?Q?nJpyc0V1ayagphjQ6jzJQ1T8fW5V5rmNNT03Lpjv6dhNoBJcjCLi3A1oJzmc?=
 =?us-ascii?Q?cuP9D/D3og1l1JWCLTpZhoFVcqs42OVaMPs3iPsi/tCbWhv77OJER0Q6GAUg?=
 =?us-ascii?Q?7E2k3sGxFrh6fxEOTeT4Va1+cCaVVtev3UZDpUCyZlbmuekZBUWMgbQygac6?=
 =?us-ascii?Q?U5cq+uqA/Os6NyZSK2Q5WKCx6Hg/eHABJNFNMRdjlUJsEa4W9CzwbYigR4bU?=
 =?us-ascii?Q?oCtJ0WtQ4TtlSkEXPdO4NTuT7Lq1oRaKOBmD7jHKOCnfVVnWEK4/HKIaeoav?=
 =?us-ascii?Q?J6qt6gZOhAc/yrHh1f4zPftMH1aX1uja9fdur5cc8nZg8cPY/5NvAOYpQH0w?=
 =?us-ascii?Q?W4vztWHYOq0mcAgEEk8BZ/Vr9VD/hJrYMifFktSICM9ANw0v3/JXhs/u/mcJ?=
 =?us-ascii?Q?+Wto74KFp8NYkxeJ2FnPj2wFgkVYJMYx29oHruFUNA5xyNSMuwgZPsu2Fxyf?=
 =?us-ascii?Q?iwV7LjtDZSVZMZnV5I1y/wx0eCzzSnVf/uz+zUNObaXiXaVUvtyHNFi46fZC?=
 =?us-ascii?Q?wG+ZhCrBeVu1tdXEYqr3dpxdYNjdKXeqhGJdNSq8OCsmrJcBQlI5xH8Rn9hw?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8bf249-315c-4df6-2cbd-08dc3e3bcff5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:19.4457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRtXdODOHPt70oF15uOiYjuFdlsd+26CJ5ArUGq9LPsh2wyKk6HH4sSTgs6JB1MJ7DUPMYVNm00GtdTm8yzUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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

Now that assert_mem_access is relying directly on the pm_runtime state
instead of the counters, there's no reason why we cannot use
the pm_runtime functions directly.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 17 -----------------
 drivers/gpu/drm/xe/xe_device.h |  1 -
 drivers/gpu/drm/xe/xe_guc_ct.c |  8 ++++----
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a9128bde85c1..6c7850dd70b5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -655,23 +655,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
-{
-	bool active;
-
-	if (xe_pm_read_callback_task(xe) == current)
-		return true;
-
-	active = xe_pm_runtime_get_if_active(xe);
-	if (active) {
-		int ref = atomic_inc_return(&xe->mem_access.ref);
-
-		xe_assert(xe, ref != S32_MAX);
-	}
-
-	return active;
-}
-
 void xe_device_mem_access_get(struct xe_device *xe)
 {
 	int ref;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2327b6c0ae6a..b45592b0bf19 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -134,7 +134,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 }
 
 void xe_device_mem_access_get(struct xe_device *xe);
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 355edd4d758a..8d7b1b42b2e6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1203,7 +1203,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1216,7 +1216,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	spin_unlock(&ct->fast_lock);
 
 	if (ongoing)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1273,7 +1273,7 @@ static void g2h_worker_func(struct work_struct *w)
 	 * responses, if the worker here is blocked on those callbacks
 	 * completing, creating a deadlock.
 	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1292,7 +1292,7 @@ static void g2h_worker_func(struct work_struct *w)
 	} while (ret == 1);
 
 	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.43.2

