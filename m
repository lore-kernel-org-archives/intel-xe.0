Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE218C001CC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B7210E7EE;
	Wed, 17 Apr 2024 20:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIIkZaAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A921B10E7EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386424; x=1744922424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bTQSpL7J7yBH8+M5STJibwdlornHlDZYslwgFAArKWc=;
 b=YIIkZaAC0bGjbLngAunECGpNb0AZ4IsCy2iK9CAubE23n8ylyXUZSVkW
 OpTBa4e3iAvN409xUOueldcU2SCM6G0O8hHoTdw89WEOPXT3Lf6H15cLm
 cn3NXszTDLQXT+7Tz3iDCCzJEVdlkWH10U5VN++N2m4xH8RlRd89t4AjS
 OQweH+OHp2phjf8zNxmoRxLu5ohsQ9oZRBG68KDO+oYUtjozHpiVr35Nd
 hcFG8+LZtbkk5sa8E1SqR9BFuUht0s/D4rnc8syhLPfd8ZJxh8Elj/zRi
 E0KS/DqtKzxpoplkRSBvLWavNUJOmug9J4nx9XPFR7RsK9lob9KNSacnn w==;
X-CSE-ConnectionGUID: cchY0WTBRoeaM3IkYFAMzQ==
X-CSE-MsgGUID: ord722A/QaSuJSOiyL3niw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8764239"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8764239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:23 -0700
X-CSE-ConnectionGUID: Q5u2L0OHT7uAyMeB1HzfPw==
X-CSE-MsgGUID: 2ggGhXQiRCOE8SYkSQjvAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27375832"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5DfgWWtJAvuR98efyeqnOuG4+sPAADRmb+rL6r7pzY84kq3vIkLrSrq4Upx3bmzmxBrEDp1XnVtoAHHTcZejxJjUfNKX7zNwGGBgfE9x2GkvoVne19AXff1ERPCNcWDvNlbl8ZVxSWBxim5gaGFqoN8UwAagJKfWvIJYvpa39LPVfbdSRzP97js2+cfuoAWHUwLj6gY9BAm0UCsHjuewS0FLmpEHxCyqatCVPPN1DEnqRq/HFWONicDb+qTUPXLF5WdkJcCbdBEKbzRiDmnoa6wMJ98Y60mhKHuQuCN8fp3YyAI60sHbNDHvCzRS2gyQQ5xOH1/nUaQQqgRswApRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF8LUbJ7TjBAQlEi2QaISOAWtCPsS+/woCdwgsM+n5M=;
 b=oXDe+vlFKdHC2nr/pb3qei09ZG39C5Rjxaib/CTfWiUrK1vpnoF7FAKjqzt8QyM47qzbjs8wlvs6d5ybPBVjq2+3hp5XF6Zp8+62i05XUfB9mYqRZfgHon0ikwbaLpFpgE61u7v64pYoNiUfM7SrdzjylcOm52AOCeGB7W41dbvrMfgDPtPidF74Y8IDCitgxrMOZMQUXPOrBByNsPEXqn/JWdtDdJRMaOpdEbB6mVXCVVw/kJF/EVrjI1xdy2j8COC4E8xqbXgZP+eFcWR4RDhV0VSDzCzdu0IM9ZLa+UJNA9XcyfTkDJivfqFBt9D7SQWytYC+PNyMakXqG0x2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 08/10] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Date: Wed, 17 Apr 2024 16:39:50 -0400
Message-ID: <20240417203952.25503-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: e14b5261-3ab8-4fae-5e98-08dc5f1e997f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6X9bBhxd66CFSSxS0a/EL/P158qb4leDjQjs3bGbcYLYRPd26fEP8fpuPPNScYbYH7YVgoYR/R95/PHi2Tj4YLh4YtusMdsjEWjS2pev3z57jdv5RAI31pLLucMDWcJEgTcvywdXofsxDjPcbrjK1B7S3acb3zYLcxeVTwWNb6FjAuJr6tbmLeAiLKwhuck1lb2Bt8Ia86lEt+z2NYlP67Jr7m3ztbLj76mKNv52d+xicmzonXib4YKr32nD1I58YV01dZeNG0ROpHRNH18UQWZMWtiooeSI/sNyrm28QKsxRazFXQT8cYiT6siIxwQTWo7kQGdjT87p4wOhdISJsCXg4WkQ3NDdb1Q+BDmVpzOmhOF5Ohwxt+j0Aa7aqUctw2VyCGfLZTkiH3MdMN9PbRItzLEfh9eBJrPu6B3UBFuuVvCikdGBvtpQ20CTkfUn9r1U2f+8W6h8Wtesdxl2f47yujDY+4T7feQMSg64daXEt5QNBWW1tiGXf8aVRrXWw6CLNKjNlYIw4vAYQl+RQ3ZslSFfPJrsI0wuJbKgs8foLr6IwAJM9FH28NDEt2ntwUQFVWecnrDakTVej5O8b7mLKw/QumIzKgniXhc8rkGm1eg2xNH7x+xiTMtW0AZCXxf5iJXItownUSe8tKe17gMLZbtdURDCZzkuZZ4LO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dOtHwLjPnqWgjI3HcocbsuC1i/yUWyYs2pwsartwTKkrPhEnKuaCuv4AihAh?=
 =?us-ascii?Q?7HjKD4jBY+eaS5WwIqWdj+OP9LIFTUViD/79oW68X0LpR9tziMiHkT/JLy6T?=
 =?us-ascii?Q?o0d1P9Sj9jn1W1KU3wa7O9GVcUiR7yFPIYnQ/6jOcFqt26sfyR6LdRLMwdnw?=
 =?us-ascii?Q?mf3ALif112N+7Fzik7umhdSUAO192VArFP/dsktkDgl1YyeI3YbsVMb41nM+?=
 =?us-ascii?Q?G7sUgKQWvt7LCMBlg6Vno9Fxcz/tfwCus7G8NkWEDkCVz8V7VqSYOtp9xqoc?=
 =?us-ascii?Q?mBbDZ8y/wL85sufS43LlaISKgyAUtExrQaMZhZwQ8zTz5yXUg+gh2EkGuvt5?=
 =?us-ascii?Q?REwRP6GHLB+wZXF6obzZ56+zzyf2exoocKizFGmjNAWozP8GkNXqCfBBEwAu?=
 =?us-ascii?Q?kj5z0vESBIV+3/JDhm+pux5EywkZTZGMXTFm0BnosAODM0j7j+3KK5lZcBaF?=
 =?us-ascii?Q?x93jux//ypCDvuJnxwEgXqz3DkovSMcBex3TKMQIOxIFD6SGxR6xQ9O7E5i7?=
 =?us-ascii?Q?emF8EnR0Mw2JvjqKNj3tyIe4szszmI7cfsaP5cCDB8h0gsC3NiChHcEEzIgW?=
 =?us-ascii?Q?qpWPdl6rzAlKMM2Ccxx4+5JpJmJo4DVuytwuSTuA31+Brpcd8zR7UAXi0Ru2?=
 =?us-ascii?Q?M0/kO24X1l1jvCgJtFsw67WJf7AyA+oypoPsHCHvxdod7trgwoojhJmGgW+o?=
 =?us-ascii?Q?SX4tMCj8OfXmmvhIjPqMS8GCidrMNlpXYi5Y4bDMLejIhTlsFt4pru3eVFuw?=
 =?us-ascii?Q?1SXW/QE17fGc9k0NiJd8K4w4D9ePfRgyYoDktBQDiRJSv1G4+ihmPv3Y+z4K?=
 =?us-ascii?Q?c4rqKFbi69uhVizLyVQRoH4Y4/48tvNnKSCtAB7g/2WAMLgN7NjJREUN09zP?=
 =?us-ascii?Q?ma+aLqj2HJCJxrQXpqrwQHZHMvqZSbwrsoxEGlM1pqQMc7JfpeXBANduOit6?=
 =?us-ascii?Q?BGdxkNHBp+j1o72qM2FFcw1mWkpe3/PBjKoQe0NuN5//SZmVJjIFLBBLiX1g?=
 =?us-ascii?Q?atCXLp7QcU2eDw9vjfsukjvelKVF2bA/QuFJC4Kka3LN+CSZ/nRd2180fsao?=
 =?us-ascii?Q?p1N67HOaWpjmt/Mp9ZUigJYhpVeffBt1DC8HUB4ekFNOrdJeONoDD97yFJD6?=
 =?us-ascii?Q?RM6yUQZwLo5VihEq5y4+DjFC/tYEoeB3C0GrdJ1zQlZQnhNlahnXG6Rd1Zl2?=
 =?us-ascii?Q?rVVOqymeIPLjkDQ06O/CCzTrqtCOTFrgk5j+gi0llsIuTQcnySIa9CJ08v6k?=
 =?us-ascii?Q?nP1Q8ltSy49U1afXED+dYuEFAtF0QVmQ2W+8tSRgChthIrqYxhKCD0cyZeYJ?=
 =?us-ascii?Q?cA8IdyBzSzR4ErFUi9RH162rPoq+4OKQCjBUR8RZX6PlrxrK1e7fYIZd/Zge?=
 =?us-ascii?Q?Xh4WjX4zr517dd919NWe8IijrRon6hOlaMMP6nD9Lrh39353t9gddtuUzGfQ?=
 =?us-ascii?Q?sDH1b1zImW0PrsBs/u6PCd3ycimtSexY2vgSEHrhz69P6H0wmb5rpnNSy4mn?=
 =?us-ascii?Q?s1817jaQ6jOw0uYyf+9gyoBYrRBsNsPFuMMm0/uCzkylVAJOAxz4Cut/dueQ?=
 =?us-ascii?Q?Ixe5UuMWmyjCTFW+CHg8H/4BQ5ltX0+1wpEFQF6ovHzCF59BF+QJXOvmgxHa?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e14b5261-3ab8-4fae-5e98-08dc5f1e997f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:21.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rx0+YDVbEP2xzp2uqdjPpHzggCkVtT/H2lEHhy37IbrEKKPYHdcfkfuwb2yDsMFgVL30ZWhy5vyODrDGj7GnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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
index 1f8f9018b27c..47a4bb0b0a7b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -733,23 +733,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
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
index b1412d432ec2..ac9324338ccf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1210,7 +1210,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	bool ongoing;
 	int len;
 
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1223,7 +1223,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	spin_unlock(&ct->fast_lock);
 
 	if (ongoing)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
@@ -1281,7 +1281,7 @@ static void g2h_worker_func(struct work_struct *w)
 	 * responses, if the worker here is blocked on those callbacks
 	 * completing, creating a deadlock.
 	 */
-	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	ongoing = xe_pm_runtime_get_if_active(ct_to_xe(ct));
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
@@ -1299,7 +1299,7 @@ static void g2h_worker_func(struct work_struct *w)
 	} while (ret == 1);
 
 	if (ongoing)
-		xe_device_mem_access_put(ct_to_xe(ct));
+		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
-- 
2.44.0

