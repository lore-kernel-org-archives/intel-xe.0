Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56436C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E16D11244C;
	Mon,  4 Mar 2024 18:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDSt9VSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91D11244A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576546; x=1741112546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xuxJ9TIZjezaOdjtNI3+0GyZzVKIa1icdgWSLLsuyug=;
 b=GDSt9VSutOp9uYrI/qp3woIIhG7jAtxO1PbQkxlHgPFTK90wmoYmkDw2
 DsMMZPaTvYILNO4txatJSiAUY/vOsiOKGzZS0RBhg9Ia7wH1ESBK1Lr2n
 Dsv1LEno22x104kRIsWCcBiElhl8ptCEVERWHVQNCwXDPVhmQuCS8NwS6
 tcwBRfwCvhfzkMTEvU3myFDrJ4ieVvLETlbsU9mrbP19SeyCwFTBDN5Td
 8VZkFVgY01Ha3DvORxyUE8DovRF4D/k3ZAS7rQxb0YR9h5ARQv0wdQdjW
 mqpo2Y9u4nH7LM+chs2FGekZTnqD9ol/ymuCFj3/pMjb3uutJUFTbF5va w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4668136"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4668136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="40092384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnBRehIIil6HPk+0reALKJzC/tF0wp2yqKKj5xVGb5EYp8ZbSPZjxEPWGpXqKeFiPgysOpYOmAWjFRiQD5Xlamkx1qUrUQFLx0TE3qSjUOln0TLMGvsojoVeYQ5EJ91xX4ZzPaj8p20LmgJfNFdB1a6ddcmPVd0iB1MLPkTJVnIJ7JfK83zCxkDj6TwK/KxfHvX/jNWTQIHCoNTprEGE4YRvzChQrf9RbAAlochpubQ8vkmrsIGWnCCEmU9IUXRvT2somMjt7+lKB8k18LVZR7jjOPY2MPLOSGftqyQ/y+pwmYaE+J/2YPV+Hxja4og/DJdtT0XKBnJb0Be3XNyp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fVk/cKvfrVtQdd/+ieY77sy8HI9J5TqOkJ+FuYT9xY=;
 b=g4eQoY1ZDgdpOTe7cIw97yRwC3kfg3gk+6VsWqK6bIaG0GYowcW1TcYoydRXk3oeGbrzlKtiyzbKDaWjuksv5iD/yII87TGg4XbkDFWy1EaZSUJfeXJ5OuBwcUdfDbLyVFs8CIUsxec63b1F75Qr6DlrCcujkR/FVxGoEk3lRGk7JyvhU3xT6au5QFb6cGq0oXfnhWGK5AyJYlYcnqQgvQWWvHh8z+plrqq1/9jA6fuFh808EEM7clDpq83yQCaJArkPFt1DKA6PsUT/L/f/AEueCJlgjJ30s1db2N8jZ//3TKsgdeMamqOPR/N2tJxra8x1ZqqywI8DZUtGGd29rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 18:22:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 7/9] drm/xe: Convert mem_access_if_ongoing to direct
 xe_pm_runtime_get_if_active
Date: Mon, 4 Mar 2024 13:21:52 -0500
Message-ID: <20240304182154.42611-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 20543d48-c5b9-4a89-21a9-08dc3c7806e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pj7NDpCXU0Pj459fUEZhL1xiF75Ov2bXQKpSc9XbNos95ZONy1pp666ISpdaIW75k0j0usIunmDt8RthNfbvExOe7CzuYcSixuofAHsx9g5cK0LFEDGV0b3UZJ/xiMPnP88PwB2qAfccheSNRKNp02yt5va30cgfbg/ixjf0WeKGox45tAZm49++GbNuISxVspmgxdoHJ+kn5nPSJADdd81J/itSezE2L6i0sTbi6uahdHFqU5oznJzpuJBAoHKKdOTPlUwPFDWtQ5Xi3mQ7InBkjqwMD+ZItCiJafv5lGQSZUUiRjEUMjWLAMUILHr0bDELJ/0dk9mWgtm1e9kNHIEh4O43jYj0GHHmj9k+Lodv0MEurkCBysfUoemJE6Y6fEkIGhy9GbmZTlg9UMKIff3LrCZB1+j+YO8r+c/qc2lteLREFPSyMbzvzM+IQW3g8MSrdc439qqjdg9zwYJUndRNO8ZDFz4TXWgB90+pjKnIuioCPH2W61WxyYyw6/iBJOf/njnv8h6mBsqsyDEIpYEPVK3PiHGXX3Oi+hJ3+k0LqCVRq7BmIMrV9T4ncsZreQ6FylQgR9DAkLOJ3Tc6fpN+SG1cHkWRz2xMafhsvOsvQxwTc/YHQZSrGp0pOM2vKieEWgimFlz/HymXFM/9OkDIXt4vYaX7gOCDc719jWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?35kFQhH0hlEw80RkYOyY/vQHuIY0xG3/hQVH5IGeWF7O7zQRHZelq7iUYA1F?=
 =?us-ascii?Q?SAFzBcWRVB+h13nsnB3UJDnPOZ6DoBpza7gj1VoQDHqDlR2dYsvR/wG+qFUj?=
 =?us-ascii?Q?WokZhaziTWH6fwnAFIpH+cFoSQvXPFcO8dBA8mFefgJqEHXEpdmKUpFENdFB?=
 =?us-ascii?Q?qc6XYoYX6QyeEcpV147a8Mab10r7LWdWGvr+v4Xmzz3VjZLRb1MOnv/Q7RZo?=
 =?us-ascii?Q?P7DfmIXSoe72vWwvft0NdplUe41hFGYNJY3jQpGUtKOrtgW9GeUI+riulR/D?=
 =?us-ascii?Q?jLpj3U26h0+/hCsetQ3yKJMpuwaC6H7hqW8h82g5inyklTNZATxuF1rnbP2t?=
 =?us-ascii?Q?1vCdG71Nzpo52nlZs0OdFAg3mWxYI9bK6jJiwga/snOnk3mO6+i6SboIeuyc?=
 =?us-ascii?Q?ll0dqcNvfcu3YBX1D9kcN8zBdFxiHYOF4/rx3/XijWmr0o2xff7MFGhe3JA8?=
 =?us-ascii?Q?OiBlLrw7tPKVrukgYiCC7gKKY8H5uqKLxUrD1LtqWDVysTw5NH/vG1vH6fdH?=
 =?us-ascii?Q?4WyPzHHU6MxVRHkysgkmalnPFHFPUIstgaqKkrNkO3Dz8tCjgPLhFeeBvl3q?=
 =?us-ascii?Q?0DddkE8SUyq8/MUX20UW41pi80+h0kusMqagF/GhxtMrKu/r3VT8/bIotlFB?=
 =?us-ascii?Q?RbBHUzObTLdE3AwTVF19tmd89f7NtniTI0ohn1r141+zLXjtlDeIdipPLJcI?=
 =?us-ascii?Q?Ae9NEQ8JFLhtZ0uu6zKQQE19kaye3uWwI25xtnAlnw+x6aZaNVngv1bHaSCC?=
 =?us-ascii?Q?BM9aTLojoZy2wNjgbF1bPygk+rZfLEDufRVkLmlQTIWzgamKwDotloN7IiF8?=
 =?us-ascii?Q?wXskUNcPxa86hUyEzWajS9T3YsZpfrTdeZP3Hsy4VWx84RzLaylXvhKYKO/+?=
 =?us-ascii?Q?qlZUQIRKak7BQWOcPLLscvpTEVNy4Yj0gZ9WZg04VL9uAP3CKXe8qKkRvrbK?=
 =?us-ascii?Q?1MmaikTgoA+sqtAAGGReqRh3BO+QJh6qfWpW8JaOXPXzuGB7D1bYlgyzKQrn?=
 =?us-ascii?Q?+fhv3g9AeCC7cXXVrEbBrvg8F1JJ3FadgKdgA6wvDK/Djal3yJzcHfxBL0Ky?=
 =?us-ascii?Q?8GsAzVWceKTeNIBXLb4QucI1RzDMsYZ7ROuAJgsI5GOmDer4qDVitXRN2Oqe?=
 =?us-ascii?Q?UrIDieI2tyijta7OxRPzrv9adDHx/bEcTm4VpNUL3Ip8yoxa7UWWSdZXSq11?=
 =?us-ascii?Q?KRXFIRCf7IcD6vFzRCBa6bjq5Xj2EbkyxMngrBjH0HySD5qgepOru7ux/iXI?=
 =?us-ascii?Q?NzGWEKhQNS+cvq3jPa3tTEOV3KklC1Pg4Lzy03FWoNCH1B7m5IhwuRyQjRnP?=
 =?us-ascii?Q?kDaekmOEXg258GvE1OTX/e9t7l/UVak0IT1VNKstROPb6Bhy9mCh1WZMhMSX?=
 =?us-ascii?Q?MU7W6sHikI25XvsS+8qW0P4kBPJpr+4h122AuasI50kEx09XcYCQEZsc/e/J?=
 =?us-ascii?Q?5hYsTo6DFj2uRDEMhBxxHG/X4mQllvQdP7Gu1E6vav2YYb+79KCQ9gF6mqTx?=
 =?us-ascii?Q?M7yKB4G6iQ68H4gejtRX32R4rJYb6MVsVCLrHuAoXUFAK1S0rQkOSRWIs1Qe?=
 =?us-ascii?Q?KWjR7T0vMj8w39SjPLQBzJP/pyqIC2yOh1PEND4AKpFMYi6+EAEDyFaDuJba?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20543d48-c5b9-4a89-21a9-08dc3c7806e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:19.0989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+7D2c1YN3SKvEjj0xLOXJCyGw744a/MGF/AWWQZIw3OgLuHrkVoPvXZbGyd33x+FnlYRm1JNRnHTd/y7RqXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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

