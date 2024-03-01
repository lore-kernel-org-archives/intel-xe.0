Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E0EC54E55
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 18:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE8A10E743;
	Fri,  1 Mar 2024 18:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2kzQDAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8B410E743
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709316344; x=1740852344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YmlD7XRvOl2idfJMZy6kEV7SWvPa6E+DP6Sz5iBV5iE=;
 b=K2kzQDAoR7JKDVtdKwxOXoCuAEL5cNqtXxADjNeyzVo242/ILcBHOtDY
 5HfvcWeOr6tDArH2T6MZ7Qoo6pw0mDvQPG/U784EvSOcgdksCYecveHSl
 4eQ4gLHB2/D9bPdAL1nHnN5sAoya6299Oz7QxKiYNvK1IcNulP0dYMa7k
 SkSBGX4+mRtjsCQ4I4mIRHpUepxQkS8YHrsP9BpV5Op//Hou9Uasr+p4V
 Dx3INPqNmmZahkyIpjFr90AclD5P3k9ZyBNpcK2eQH63AtwPksTWA6kb3
 gezyO+UPbeV77CY7BTMW1zuDJQ+9gj2yC7h5kUm3GY6UPsFUkxayGomNs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4038606"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4038606"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 10:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8700354"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 10:05:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 10:05:43 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 10:05:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb1QnvnEHlz7rC0/fPsAU2lnpEMIysvNp/lgkjz+ZBRHMBJyu2fP9izNaxl8O8kbFkEmqK0rF2EpzMzDf3douL++hQ9gcLNxhi965OpA2lNBSz0aX5/uePCOFAn8zUSez7M7azYIVzgA3mJVSjkxuufMvVZWkHaUoHLt68zzfIVM4NUA27oOG3Z63n0z6uMtLN3S/Cw8mijuYJWquiLIWZVYik2wdxJV6mzf6fZB0xcpisCgVp95cIlvG18HKkVh4HIUwpSk+KE0xXu4qrncaWtKbyALuiml0qG5jzkrzGuEsJB4KAAm9g6svvPetHYbvGRPq4j45hG7FfP54infcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljDX+o+uig4maoVrHcB/6TbZrM11HfmASRSjb7+5e/Q=;
 b=lGy9ZNhNWrUC8S7yWd3ltG780gV7DqHBVF45aQ9rqcabY+eZdlRyMv7+UgxDWPlVO6CNOHMFfn4+WULRkqfAy66eq8woz6ymfZuq4M9S33GPY3XY4zq6n1b+PLjXGW2HBfQijSEWN8HCeMHtsWVKcZE3BcI4tR3xvW2R+xyuUbaCbYYkwvZuTUnp+QJ5auC1L3vlZeZHBwjb0IwZAJtuldf4QoW9Krf9sG2iZ/W0NjxQl2mSWDHMsq0HqXhcPrsRXnx0i0SKa9nIVNJbjE3xNTp6geKnRNwFynEOIg2me4jkhqtyjfeIhwGa1KPr26NJ4amfQg+RxEiLzIO7SKbGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 18:05:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 18:05:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 3/3] drm/xe: Convert xe_pm_runtime_{get,
 put} to void and protect from recursion
Date: Fri, 1 Mar 2024 13:05:25 -0500
Message-ID: <20240301180526.643505-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301180526.643505-1-rodrigo.vivi@intel.com>
References: <20240301180526.643505-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: dd43a111-e856-4c8c-2fff-08dc3a1a32da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q17hngq1GU/6MSW5vcF+oE6rUgNLT5I6kYNqzKtjszjAqeUMEfthDz4OYr5LgLlgk06yXN8yuRrcyQgX/fMBCeqhPBC7q44YCBnJ3mQchY9O2aLB8Gzz4PtByWdKBDhQ7TCTFCKRMN90HudRnwBfYQ7Y2/oexWfQbADHyl4BGYpwJ9BvQxwWIAk2Gc1jk0odKZeZRI5VkvxLg/HNYGfBP6MmPgdGbXZiKF4zotQyH7x0GXwP/FoG/8GY6kcvWfspdz6aZ0jTI/747VdFJTrLE/CRStJBAuzrjqQ4P4isom0gKlkWmGahvGP/rzAnH/WM0DPrk/OPeM3GBbKSmuvw2yUyrELzrHJGk4NvhQ9GgKQcJ0AHSsXWRpnO9oAAg/NP355xw0mwRohI2UvJBYlsYOuEXio/qsXKoaNRyP7ykl0qCkYNzg8lmFfANA4o82bz8vafA/roPzP3FPW/APB9I3bZhWoSHM6ie6A0Or8S8xrFoeUe2GjAJxRM0/cHhK2070Q31sq/oYCcXvyA16JRIkeqxbVgZ3bIvEuLze3x1tXtVAhuNRqYL3rFWO98oAgGmuXI7Ob03ZnukcHwe38gfB6M3H4xOpcJh0xEuECqbJ3vJ0BXzwe9h4GIjZvcJQG1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iidsn062Q6Tc9+YJg1A7EAd4KWRWENkgEa15x1RI6MxswnYOtoUecFkw/BtO?=
 =?us-ascii?Q?PIJQUKcIGgY5bfC4jluIP1iBWpemXcJQEtOFCmiilx0P0m0LxkdMD4pLC6kH?=
 =?us-ascii?Q?2e5psLHZJU3AQCO+ZuV01zmHGiHlQo+uSgKBqqz//Uqp6S6FLoKym0O5FLq+?=
 =?us-ascii?Q?nFZzYUkywQLRaVAdYfPlRjXoB9npjAfDvZRsRPXy281THamkgSWAImdfxoPF?=
 =?us-ascii?Q?LqCewKbSwD2qXtmxR4H1Cg3eMbM5PsrQrtR9xjfV1byIXFk8NLtA3+LPbaD1?=
 =?us-ascii?Q?4mWxEN9NXXqR6w9yNVmwG0oKG601t9A1R/eAx3E+qI9b1UA/OZqThGsGvVzp?=
 =?us-ascii?Q?hvS2W6M5BvlwbrWEKJMWciYtnv/DIh/GGSnUbyqDzgBG7m1hDNDtE5dSv4up?=
 =?us-ascii?Q?5eq5GMEswaMyJmJbvfUJQEWOIJQ/4wieagUERaUpS4ISFVdUB0c4qcpRXfFM?=
 =?us-ascii?Q?A7ImBAaOphiAq4IexBTRT+cd6FKoaKJ/y8GKUuvyeZ6ieTSrc+gmgMtx8NH4?=
 =?us-ascii?Q?QYDiScK150lQLR5A1wiwfeN+AQKmjkpkllIxj/J59z22oGvXbd9O+EXHeF6B?=
 =?us-ascii?Q?asXP6M//Pr7qMbyKwWP4FpniIAXUnVKCGy2UUHhLDYGbgUv+r6hmQFwVnQB9?=
 =?us-ascii?Q?d3KxRCHFHGqAsFjTjNb1dOgmppNBD7YNpBmRdD2FJyIK+CpwgiQ+ny5kiuGT?=
 =?us-ascii?Q?r5mp4TUVRN1AXeriaTiDuY6E0b64ZhUShnxXJzRFR1WGsUUhDWXNQXs3g3O0?=
 =?us-ascii?Q?6fF681q8OMTxnErK4vsNFO+vrhlLYD2/4LGFWnhZBNb0BXCJdI0dGMZH3qIm?=
 =?us-ascii?Q?9IPUTu5o0kJBaYZPVgBRTgsYtHIp+C2FYzmUFWmsX7mHwwC4EVJt84PxYjWu?=
 =?us-ascii?Q?ZQ5lNkYvIljrLsRlIEHFUwIv2UmwuZQ/9ZQY2gWLsHTZcn09reDv/ndmcFzJ?=
 =?us-ascii?Q?2it4UlC0SOfiVmav4B18TZPKNw4LcEkTTXQP2LbYe4v5cbRullljI2RWVCuo?=
 =?us-ascii?Q?Ih9oi8rAt2DhDE2QbOg2zUFUZr9fFWL8QPfRsuJHS1EJfmvQMPsPsqDmajoz?=
 =?us-ascii?Q?c8iLCl88ikVVxgM1sWBjxHwkUDeCvgNgrUv+wFIcz2EICY77k0rZapeo0ala?=
 =?us-ascii?Q?RVlOjIYMPQcpX0tgSovp1TQUtzqlCfbxyXHhNXZmnfhjl9Ad2rjWVsGMqoZb?=
 =?us-ascii?Q?kz2qxDbhgr5B2zqBZnZ5oVDq7SrVqPYdxal5i9IAQ9OCwycKamZ0eSdF//4G?=
 =?us-ascii?Q?gqAQW+u3vcYAU6RoW6wCZV2kH5MiYhC7QZRtON28pcSkUo4cn6HwRnAWMMuA?=
 =?us-ascii?Q?xdJTcRP+oomwJ3/gW37vZBs4YM/+nDRJSZ9HO4sapPdwvMAXiAgdHWr5sXIW?=
 =?us-ascii?Q?0niax6evBkpRW1Y0zAHd7OLyUc2Os2fwccfSVSeQZOEcV8Mw9ch2UyA+VLlu?=
 =?us-ascii?Q?8MLzGpjFSxN02y+JMr9EQRaE/xKReXwenm49Ixp2Y718tZwB3zatki0SPC76?=
 =?us-ascii?Q?1pnE5w+dwF8q0Xv1WiMRyJ8EO9SX4nn0DvhCYGWish7I5P6Nkf4HtGxHWela?=
 =?us-ascii?Q?evjrGIJ0w4vr8SxApfSskdiS421UCICmj5evdoMS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd43a111-e856-4c8c-2fff-08dc3a1a32da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 18:05:37.9802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4r22KFzhCO2p9JMrehfOGmfINqYcKXUeF3ersDWeC8u7TA1p2H71d1pMH5ZXSOhD8oUK7Oi/tDcdpSqzlkZmjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
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

The put is asynchronous so there's no need to block it. However, for a
proper balance, we need to ensure that the references are taken and
restored regardless of the flow. So, let's convert them all to void and
use some direct linux/pm_runtime functions.

v2: Rebased and update commit message (Matt).

Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 25 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pm.h |  4 ++--
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 3e13a666fcc7..9fbb6f6c598a 100644
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
index 29c20099a3f9..0cb38ca244fe 100644
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
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.43.2

