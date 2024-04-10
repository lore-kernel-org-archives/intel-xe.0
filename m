Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B8ACD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8EF113096;
	Wed, 10 Apr 2024 01:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDF2RHX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2B11309B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714349; x=1744250349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nSxVOwEbH+WCqoBU8YoKStW+517i5vod7yLcosdGvvk=;
 b=YDF2RHX/NaxHIjZnv+Fi2TBZKh1VRMXDv25Eq52a4Js3h/g0TTfGCCQ8
 iRv97VsVJYZKn1kN1lEjTZWTpYn7hIDkDk2P3LCH1TC5eozWYUjYDprwc
 1cSrtgwaE3hcNz4tWeo6irmn4QiYPXrC2sCI2poTKS9GSslLSYaQFOj8x
 cTiElIYMJtIsEOkSFxfKwWYkxpbmXHIi+lnixD/+C4si/iSS5AeOjt0LS
 bN/nqwm6mSWDIUmHwaAw6A6TQD9E+HK5cYMD90uRMv94kmt/PGjuXvG08
 FfVqaYikqVdWK/Sm0JhbjX+awxBixkPpc7blBY07Hgu4J4cfRYxul6LHf Q==;
X-CSE-ConnectionGUID: DaxzzOFdQ9Sk93IQTAqE/g==
X-CSE-MsgGUID: bHIK27/HQlm1MYd2W9eZeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8226600"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8226600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:59:09 -0700
X-CSE-ConnectionGUID: Dx4yx0cnTdyqirzMzjwPXQ==
X-CSE-MsgGUID: 7hGeARytRYu7OB67y1aIOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57849617"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:59:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:59:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN6RwV9aZZjDKGQJHceJU8HUFa3JjIqjc/EoV5t2vrezleP0pgUBxPY5/hhMx++zaasyxbYIXEovAstzGWso5BuBdmhYRoJMC6TePaAYj0X4AsCALybWPSgDfQ9QoXR543V1RlRp+2TeYzLU7E7lq2aNVvsvHjvLJbXxi+QyHrZ+tB++9ErJBbi8n3r+XqKx3IYQtzuhN1BM9S30kDIu27DvyXSo6zaQOcQRgRrPxLQDmlFdSImwDVaoeunL6eKroddMfCqUx4YbGa9KQ75RABf2iiX3LWqf9We61OPw8uvY0l9arSFlQPUU2vVb5ilB3Zx+80nCWFKp8rKoNkQosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxM1du8Aoyp60lBqrVkDkV9YZI0lnZaZb4HDaOIJ3wA=;
 b=Y22VANIBwnhuLmO0OD2v3WNYDeNj0JLLbyYvTMOyTstDNma9zGQ2TAXFmmPhPBXir1siit/qtdRKiHqe2qzB7FOCI4Un/Zue1MSCOuQE8BEhNGr3D1rTCn2LqIG8tiTG55o7+Nc+YmNJuAlGkP44GeOfgXRaFg4XuLRlPwr/aveasnOlQsBpwafah/K82BEvmwFH+ivzkRvQ9Ko8eiFGBwPBQBmHtJ7fo0oU5Lsm7xfc52H3ukBjsjIk6M+q1bj2gUh84tvYpAYwUW+oa6mzvF0ztCZSeRPBezEEpsQ4TNxsp9yj3rG5kCIjrODy9Im2DAs2+KNw0LHE5ix5E0MR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:59:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:59:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 8/9] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Date: Tue, 9 Apr 2024 21:58:24 -0400
Message-ID: <20240410015826.1093368-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IBbeM4EUGkjKiQkY/6DJHdz7lnfR7bJWBH9nDDgEFXjAOOuGPcfgdOUy0VULB2WAGoc5voLpirv74X/KfEfe71XvAtlxX0JgTe9rv0Mmf2PlCytRwKhiJDFPllPHjjN5L2iNPiFFu8P8qX4o1+pf8nLBxFTbomsobWcdDhcMiSXPxy06V66KoxY6a8dBFoOHEcnlEWxSQMIWtJRYA6jGIP4vrzh0KFUI/akn95VAethkL3M1+R1S3BDd9THRVdN48rfmsDuu8plJwgiOE1W30FPnkk4O/Ve2jybcimxBhSgy2qdNHfMna1gHYf6vNv3PEt19gsksgFQaPp86Uq/Y3sY9QABFTJ5py9gwZKM+SCb9M+o4cSwZsu3i8jrEP9mBWE3NxN0fhdPwqExvYqSeYWP3HE3xm4e8/gfGylFHT4Y9PVXSLMV6YSQhiqSISlGgToEDXLurbzeret/a314fzzCtTik9f+3JyV585qxb2O5BjmwttugemEmd3X+FXQY5tV/VOsi+Cn7dBBsEPWTy5ZvctLMW3sIc56kV1nFtW3rW0ZLN21ztzq0NDmR7lmQiYvAF8pKQuKIcEwhnDpwQ3amBRf9zREyKA/ix8ZEgsoxsdG/KEZVS49WBrjrxE8hmQHgqcb4IQj2WzgnG5yJFPPpLo2Zk0zxjo3+i+DYlhFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZoRKLSnwE79Ii442O9BBb9H8J4npzqwREJ6jD7SyAvfRr2Uw65BXvMy8o6P1?=
 =?us-ascii?Q?kIaZWegJE3IgwSY1cWBbe/3IughC8y/1na2ZYlrp3Mis7TqlXCZNI4eDXAQL?=
 =?us-ascii?Q?vIwPvGfC5N91HsG+N7MRugJ3+brDv+M6liaMZYSdWKRu8kipAtwuVpxrKkPg?=
 =?us-ascii?Q?e7hCC1m5ztGBgapJleAq9dcqzAXXh7WpmI45POcRuKkNFm7SKL6x9R1FhR31?=
 =?us-ascii?Q?0/6mZ+aL77VUbAbmOdVZeEp9ekhi980Kt8hjwx+XRlnQgjfV3wzV2Ks14G4+?=
 =?us-ascii?Q?n7l38WvCCpJCVvNMfU/GMTyRBU+HIHKAtHBTULXVIoPyxfh2tEU6wEaBp620?=
 =?us-ascii?Q?8no2KvLvpRm9z23obr22mnBBXUe8ls08h2rFd73Lk20L1t0lXt3NleIYfMUk?=
 =?us-ascii?Q?hRZefB2MK8cJroKE9UflsBv/v6BDMzMiFivLEG0lIQok1vFOCLih/tPNAiPf?=
 =?us-ascii?Q?7kY3zt+wZ7F44UmSZ27uS02Fp3a+BgBZ/PJ6YAZ+bftsbzLfe8tLaKmGWe5W?=
 =?us-ascii?Q?6X2HCDWAoBeOSOytZ+pp++8XHUDdbGKU0b9pseifNBxEKsV74F+/P075Ii02?=
 =?us-ascii?Q?ithrSKY1B1JeSKL6ThvwVkxekdcMcpchcwaATbiXRT6PIpZnZGgRWCeRBHdd?=
 =?us-ascii?Q?oj3f68yvi5NVq3GA4OZuiYRkqIzTjAi9U4aCibBstQgpskfVPDGGgx+TsB+e?=
 =?us-ascii?Q?q9J78g6s6VLOuT//8IoumYSkCgXGLaYYrazq/ONT8FELoAzWH17xzVQ9gE9U?=
 =?us-ascii?Q?sq11x+DS9vFXojzznjDO9dZ3CdveJSCSkZ9KAu1Gm0sny4s4FxG0CjMOOS4v?=
 =?us-ascii?Q?u73OGBogI7k6Oun3OpBiR9bfgvA7j3U/OABeXM1betb7TIy1ZCdEV7862em9?=
 =?us-ascii?Q?3IgG55Qex6r5xGmgu3EPV19wvF/LAgABj2vk9/Gb0yExrmOehZDVLjRHKs6d?=
 =?us-ascii?Q?TqFmsrqDcCHbMTEIZEl2KBruVPZkJZm6MZZii4+xnHwDJle5KLRFtUa0xrC7?=
 =?us-ascii?Q?oyqgemB8iTlFVPbtFZU+SeBTOe3MJ5zKjhN4zvgA0Q7BZWFPlgvAJ7OMFhdG?=
 =?us-ascii?Q?Jta/Wra89yVH5n2PV/hGSDKiJP/0KYnnB9hGcFwhknSAUSK0y5/R5U9jnZXv?=
 =?us-ascii?Q?7ct4C5lufz3ezK+3bDZEDDQjw5Qm6KsMh60QALR0N3bRtzO83UtX3e1RqR5t?=
 =?us-ascii?Q?LGq5VUpJqjQo665jq5MJBMXp8gPSzuACSFG5vzv+OckXFYyZ0jbznK3TGo5W?=
 =?us-ascii?Q?gNFl0CSWBTu+bR/wSr2ZhF+g3XpIPfNcL2GTGcgIQqomT6o68n0WMbpFRC3z?=
 =?us-ascii?Q?StPEUyCnRnO+3Fj/I0vrOfyEaaOec6mDcPeAvPfs8yydOSlb87h+hoTylQxR?=
 =?us-ascii?Q?vzgd8ez3L3QQg8s8nvULezwq7xZ4itEZU+P1pUOalxNzG0QgNPTePgeJjyIv?=
 =?us-ascii?Q?4TbXB/NmFZczr6Jmrg8LjBGdJ3Tdlle+uQ/Jboa6qvcWnCVW5Np3zg9OQ1Gf?=
 =?us-ascii?Q?MjjInSd3wfzXH0GmzInF98qpkjH2BAqlExlIiS4b6b0O60pXZTaMCNUiGq2L?=
 =?us-ascii?Q?fVmPYhyd1SBtPUoEQt+7XwwYfyxylSC+/QGWLIWd/8u5jIrJWRtWVu35spft?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbd2753-d961-4cac-5a77-08dc5901cb8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:59:02.7308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Asv4UhSWKrsM4LUHvIXF1z8ukCxN7TxNykHf16YSTg+xl6/+dH+ahAAcoe3901nKPWod5L/BrDyNGMF79xJERA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 17 -----------------
 drivers/gpu/drm/xe/xe_device.h |  1 -
 drivers/gpu/drm/xe/xe_guc_ct.c |  8 ++++----
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1f2fe1466917..730fd6b455b9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -666,23 +666,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
 	xe_assert(xe, !xe_pm_runtime_suspended(xe));
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
index 39921666e1f1..54490802e97b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -134,7 +134,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
 }
 
 void xe_device_mem_access_get(struct xe_device *xe);
-bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0aa3abaca66d..47cc56bf87c6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1212,7 +1212,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1225,7 +1225,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	spin_unlock(&ct->fast_lock);
 
 	if (ongoing)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1282,7 +1282,7 @@ static void g2h_worker_func(struct work_struct *w)
 	 * responses, if the worker here is blocked on those callbacks
 	 * completing, creating a deadlock.
 	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1301,7 +1301,7 @@ static void g2h_worker_func(struct work_struct *w)
 	} while (ret == 1);
 
 	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.44.0

