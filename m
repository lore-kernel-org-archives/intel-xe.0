Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F8BCD1292
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6374112757;
	Wed,  3 Apr 2024 15:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP05iqOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C6112755
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712156910; x=1743692910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hGL4Ortnfv63zwLo7bts/4qnXlkhP5rnvjbqXFKzNg0=;
 b=MP05iqOHewaBT9Q8b8cMIgQNmVRAtMoxKhHgNctOzNmPEwJHVUvZ7ttl
 6l5ltcwCZUpikI8PuZOP+944KELhJfir3fX5otV88VKTjaswi3951JPdo
 QLjfG2k0GiJ79QI9NrHK6f3rxdQtyEd0e6helwhUt+n+5aW//+18od2Kn
 DRmiM+hULeUARpuvqBhhR/QSXH4CZL0ALEV5IvhXwV/yUrKe3p/MN0XvK
 zCnNTdK4ZMfQTu1aLzYYpiiHHMBbHdK8X3TeQLHt9OqjQoFTXs1KoHFam
 J4SajwNWyqT1VJnpdIGBpLecqB+/Tq8EEPz3p3mfmRlutTkdCQeaFQVP6 w==;
X-CSE-ConnectionGUID: HzCmic7CQWet2kD2nTTZkg==
X-CSE-MsgGUID: qET9Ep7OTX+MmHxDvR2RgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18757923"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18757923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:08:30 -0700
X-CSE-ConnectionGUID: MReCEF1NQiWxk4anQnDlRA==
X-CSE-MsgGUID: zcBC3ZLOSm6ttr8XZvcA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18907070"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:08:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:08:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFM9E/zW246aiOU++74/rFGriV81VBylwA5x6y+rI6h86/N5v3rQYBZO+M1lilT356UdMD7JZy7IJ4r4a2QpNSVpIGBNGHAV4O6k/Sr6TJzFOOKJ8bD1oqnUDYTLfhOts2GHUuhGWvOnptPtaaRJBKS/stNkQYvsao9FJDD2kpYR2OEiA8/pQsGQre0mY5o7A9ZcfhYKa7xRckFCVpmdfxItF6Ts3x7Z66pICl6b+0FKBLhgDsIwp5ZIEEtiJCSFseOl9/b+45WQIXKdHZ2VswRwHdQzi/ynqBWJptkrsfMXP+KERVYoJ3Fouqg39uLk9ZaIKLlmcHvdoNIfpLtp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef1QHMlFYH3pf9I07m+kWYor1CeKM0aZTPte80v8UKA=;
 b=iDcRMfg6/3L7WWdx6h70CTioVKc4M6Mkg7iKJHXIzk0fFwPDmRWn9cEW9wFyaG8yfWJwzbNizMYpHVdEAh/uvsCv6gtCjxtoNMp0ivFu35xjl/mRtuPHhsQ/LdSoZLESxLTgYCIu0BeIiK0arZkLu70i01wSezm93bPm0qm6O2WoDpV2Rzt0QNsbjaiofkk/awvgf+8F+8bjUDas3tUpd1gqrtCgBdQCl+3li+5DoEt02Lhe5ruKv0k96fpuMSOwWQ5QeJpS2ct0b0gIHqLpaWMYoZcpbPRQBWm/Es+xcrvQn4r9vUHy+BFiVeUTJWf06tsrc7WeMs7G6DRp2nxC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:07:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:07:51 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Date: Wed, 3 Apr 2024 11:07:32 -0400
Message-ID: <20240403150732.102678-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403150732.102678-1-rodrigo.vivi@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4uojG27rYs7/pjPMyGiyleuoTE2IUshTyDlez8mkc4j/XQqUM+IzYXmH57F6BqHMbERr+NWFhFDd0SE1Ed3u5YDX/rfdihdWPTZbBNV5J832uQFBPrsiOiVITU5EH4SC9U9EEEN1ptQe8GMzNgnX/yrPHxclSf/vfQ3O8CA1qpJ9KvS35s9wB/T98okTxzjZXH1YhYx+K5U4pY6boyOYEuHTckjQBSoM0Ne4Y8SS61Hk6ZLuUjG/HEwyNT4AO5Jkm7yHnu+5ys6nVs/Qo/2+eR48AkoyvLD7yYDYQ+5SXO2UfH41b7zOvBb26RixVf1GhrR3f5N6w74NyC/a7gQXt1+9Z7yPcMtCnLQk3MIItaQldRBceHUzUkHTY0d9tqkPDAFrI97l4kvLlxLOXYsvuM4Mce8vF5aKszOzBcl44zGCBNfVitPrAFHLGJl6nG3vHcVmCRFz/pit50iY2ifplbWdOhiPJeftvwv63zDJ3hXHKkSTMLIy2NouTXkExChoA6jYWqua9LeeKmneZ946/43QG+E48ueT3O0zy9zUpNlH3DpjooQB+aUeS6XwYh5EBvp8k89pwGp6YIKMl1hCS7KZxqy1PI6y3XWLxKFknxvrzwF/ASeE822i9JfoFR5zSFhPmNjLJXp7BQYmJ7/PbUuiYx+DxXbHIMWJkXst/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ZyPxc6+fQhDsrG9KIvjAvp8/mlzu2I9sb+vXr0u0oVv9P0oATaozj2/oTrx?=
 =?us-ascii?Q?IYsL67DbM2YPdzXaPhiydNRyv9ulpsSpcmgz1rIKikGcD5M8cQNqbe60eN0R?=
 =?us-ascii?Q?oww68whBf7zNR7kqcJtlP+4NgAnl3KXVibkfbjhS07OO+vdG7birOFwQZAxK?=
 =?us-ascii?Q?FK03oCuf+PgKu1OJgMRS4is69+6kIoaSPsXAr4s5ab+l/646VEKN2+tVdsjU?=
 =?us-ascii?Q?9YHo76n/z1++c0e0V00aIGXRS2dzEfx4srGLrbLwWNYQSjiJDT9PuIW3VS8w?=
 =?us-ascii?Q?m/5EVLYMmsiK+pjvjREEZ5fw40e1gvCIfYZWF4/7u1SGOtOrzeBlgCQ9zl/g?=
 =?us-ascii?Q?NbZxHQWcHBH1L6Jwf9OnkmF8/7cI8yWvRioKd//OsbN7NMzXTk0lNIEfO4f1?=
 =?us-ascii?Q?veGQ5J4+0+5QhYxANHJJLl9OC6A2HEOdAu83msTlOjxHtg3mKc9LHe3Y++bA?=
 =?us-ascii?Q?WeL896iOMdn7ZYp+3j3OTpFOrEYtxrX8YpTghlr7AcZGyPte63XYSzzgYs/o?=
 =?us-ascii?Q?rw3jGr0Qg5k/e1MHFWtWu8YpECeiLKvxGfw8cquCYkJ6JnoAX2AudWvG6V6l?=
 =?us-ascii?Q?t8iBg0u8lSck5fHQXPpPNC4l6klakc+3ibkxbWTRXyd5ggl8okO4ATmysq2r?=
 =?us-ascii?Q?Kwwo2g5XcMwWWMsUErW8b5s7DJ3M66Jmjh4eoD+M9cjwDF3WWMGF5hDte9jf?=
 =?us-ascii?Q?3zemd2ZDF+9gMO5r+B3oKO6yNXtW1JSPx5hs8c1yaukCI8fZYeseGA7Scgwu?=
 =?us-ascii?Q?nfbpU3DA7Hjwqgflb8RDBMh5BCNYmTU2Q6Q1JT1nJXCO70Jw5sl3zSpLC5ds?=
 =?us-ascii?Q?p6i3xn8ao2S8smAVQtJp7gmhRoYBNOk8y6YEQkXBZ1ubVlcyAfNYkGmOEiRY?=
 =?us-ascii?Q?bLl/gyc9AughAny8j+YqrJ5GjATJS3F7lzjAauZtZUo21NpAouwx9IljvX/4?=
 =?us-ascii?Q?YxYN86Q34U0RNTMIgP0ReaUIUDMAE6+QEFyZiZExAdjwxkIkFN5uwP/QUkBV?=
 =?us-ascii?Q?5VfCirhDeXA8TSlGt3SRpUltuMCSYkybXiLvtph4gtEAFYQtwRbTyIahAnnb?=
 =?us-ascii?Q?1aIaB9hgtdtimBNBZa7vBF4dMxJi/AlJxTnHsQpWbyIu+TVtsGweEIKoyMcU?=
 =?us-ascii?Q?fgN1UomxdRoeqYsG2YTVa3Vwude9arRlIwVBZazuCTwU1LrytRk4IVEz9vFl?=
 =?us-ascii?Q?FkSqz4JdczGaeLQ7bkqq7mAon31XVqATSU0EtpUkp1cdovA6sETQDc+uX9vK?=
 =?us-ascii?Q?umIv399DK2CyIhTENplxK8I5g8PVqI9nHes4Y+WFHuI/Jp5/Utvg7Im97ryP?=
 =?us-ascii?Q?UpKdzuigJUlSZqNj6SLRlR1w6D7gQAXGvk6PaAglbp3iW5r3/ZLC54xR8XeC?=
 =?us-ascii?Q?pRG59qqE+pZAZm/JMc06Pl9b2k6rZhNXOtXwnZhG50wfAkhZRebIUrno6d4g?=
 =?us-ascii?Q?8ZQTbnc3T1CwPOf1z90InEajnJgJmwpQEKCpQs1w4aJmbZq0ndjpSaFjV8pw?=
 =?us-ascii?Q?BysWiZrKB0Bd7K+C0Vjg/cwKo5a2NVZ54+O8iLHTnGnuWxzTyXU/+wP0TxXw?=
 =?us-ascii?Q?W5Nows/Ra3c42eEhSbFhbM3I7SY5vY//jfYcYVKs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef249b4b-c81b-4966-4b6d-08dc53efd499
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:07:51.1664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5llG/LDztRd/H4MgGdwIamE6ZNZlMN86Ht6BhDLF7sxZafbfRMsDprOqyiUjeZY0YVmQJ9w/vTIU4G8+OFY21A==
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

So, the wedged mode can be selected per device at runtime,
before the tests or before reproducing the issue.

v2: - s/busted/wedged
    - some locking consistency

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 56 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++------
 drivers/gpu/drm/xe/xe_device.h       |  4 +-
 drivers/gpu/drm/xe/xe_device_types.h | 11 +++++-
 drivers/gpu/drm/xe/xe_gt.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 52 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   |  4 +-
 9 files changed, 150 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..eb0932105e80 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
+#include "xe_guc_ads.h"
 #include "xe_pm.h"
 #include "xe_step.h"
 
@@ -106,6 +107,58 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	mutex_lock(&xe->wedged.lock);
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
+	mutex_unlock(&xe->wedged.lock);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_gt *gt;
+	u32 wedged_mode;
+	ssize_t ret;
+	u8 id;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
+	if (ret)
+		return ret;
+
+	if (wedged_mode > 2)
+		return -EINVAL;
+
+	mutex_lock(&xe->wedged.lock);
+	xe->wedged.mode = wedged_mode;
+	if (wedged_mode == 2) {
+		for_each_gt(gt, xe, id) {
+			ret = xe_guc_ads_scheduler_policy_disable_reset(&gt->uc.guc.ads);
+			if (ret) {
+				drm_err(&xe->drm, "Failed to update GuC ADS scheduler policy. GPU might still reset even on the wedged_mode=2\n");
+				break;
+			}
+		}
+	}
+	mutex_unlock(&xe->wedged.lock);
+
+	return size;
+}
+
+static const struct file_operations wedged_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = wedged_mode_show,
+	.write = wedged_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -123,6 +176,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
+	debugfs_create_file("wedged_mode", 0400, root, xe,
+			    &wedged_mode_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8e380a404a26..31bece971a13 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -436,6 +436,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	mutex_init(&xe->wedged.lock);
+	xe->wedged.mode = xe_modparam.wedged_mode;
+
 	return 0;
 }
 
@@ -778,26 +781,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 }
 
 /**
- * xe_device_declare_wedged - Declare device wedged
+ * xe_device_hint_wedged - Get a hint and possibly declare device as wedged
  * @xe: xe device instance
+ * @in_timeout_path: hint coming from a timeout path
  *
- * This is a final state that can only be cleared with a module
+ * The wedged state is a final on that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
- * snapshot capture. In this mode, GT reset won't be attempted so the state of
- * the issue is preserved for further debugging.
+ * In general device will be declared wedged only at critical
+ * error paths such as gt reset failure or guc loading failure.
+ * Hints are also expected from every single execution timeout (a.k.a. GPU hang)
+ * right after devcoredump snapshot capture. Then, device can be declared wedged
+ * if wedged_mode is set to 2. In this mode, GT reset won't be attempted so the
+ * state of the issue is preserved for further debugging.
+ *
+ * Return: True if device has been just declared wedged. False otherwise
  */
-void xe_device_declare_wedged(struct xe_device *xe)
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path)
 {
-	if (xe_modparam.wedged_mode == 0)
-		return;
+	bool ret = false;
+
+	mutex_lock(&xe->wedged.lock);
 
-	if (!atomic_xchg(&xe->wedged, 1)) {
+	if (xe->wedged.mode == 0)
+		goto out;
+
+	if (in_timeout_path && xe->wedged.mode != 2)
+		goto out;
+
+	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
+		ret = true;
 		drm_err(&xe->drm,
 			"CRITICAL: Xe has declared device %s as wedged.\n"
 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
@@ -807,4 +821,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
 			dev_name(xe->drm.dev));
 	}
+out:
+	mutex_unlock(&xe->wedged.lock);
+	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0fea5c18f76d..e3ea8a43e7f9 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,9 +178,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged);
+	return atomic_read(&xe->wedged.flag);
 }
 
-void xe_device_declare_wedged(struct xe_device *xe);
+bool xe_device_hint_wedged(struct xe_device *xe, bool in_timeout_path);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0430bd51a5dd..39ebe683c33e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,8 +455,15 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
-	/** @wedged: Xe device faced a critical error and is now blocked. */
-	atomic_t wedged;
+	/** @wedged: Struct to control Wedged States and mode */
+	struct {
+		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
+		atomic_t flag;
+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+		/** @wedged.lock: To protect @wedged.mode */
+		struct mutex lock;
+	} wedged;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0844081b88ef..da16f4273877 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -688,7 +688,7 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-	xe_device_declare_wedged(gt_to_xe(gt));
+	xe_device_hint_wedged(gt_to_xe(gt), false);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index a7cd65a9cf32..3951e9197cf5 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -500,7 +500,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 					       SOFT_SCRATCH(13)));
 		}
 
-		xe_device_declare_wedged(xe);
+		xe_device_hint_wedged(xe, false);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 37f30c333c93..fe6104c5cec0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -14,11 +15,11 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
 #include "xe_platform_types.h"
 
 /* Slack of a few additional entries per engine */
@@ -314,6 +315,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	u32 global_flags = 0;
 
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -321,8 +323,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe_modparam.wedged_mode == 2)
+	mutex_lock(&xe->wedged.lock);
+	if (xe->wedged.mode == 2)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	mutex_unlock(&xe->wedged.lock);
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
@@ -678,3 +682,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
+{
+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
+	u32 action[] = {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe = ads_to_xe(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
+	policies->is_valid = 1;
+	if (xe->wedged.mode == 2)
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto out;
+	}
+
+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 138ef6267671..7c45c40fab34 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_disable_reset(struct xe_guc_ads *ads);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0eba01582f7c..f42f1b567067 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,7 +35,6 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
-#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -962,8 +961,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (xe_modparam.wedged_mode == 2) {
-		xe_device_declare_wedged(xe);
+	if (xe_device_hint_wedged(xe, true)) {
 		guc_submit_device_wedged(q);
 		return DRM_GPU_SCHED_STAT_ENODEV;
 	}
-- 
2.44.0

