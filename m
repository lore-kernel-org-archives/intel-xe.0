Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB3CC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 14:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB44A112261;
	Fri, 15 Mar 2024 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kH+QjZsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A252112261
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710511300; x=1742047300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rcfopLyB8bPSuROoeJyjpQGhkhbRfSy4hBbD5+zfU10=;
 b=kH+QjZsg1/zicxd5ARz/bmZaZHSeR/rkRRngSLBIrYt9Bdy6ofmM5gs1
 WXCxwXSiHKbma48pUQL0Z6uYPNSU48RSydDiZpaNJrvaVEtC0YQtXh2R0
 iRXMgP9EKnM3gy9YJ2hCw7DZmJ59DXgXAr6doa8mtaiwNY0MI7RLY0GJE
 gz6qinPdb/L6mfU8IZa4Dz1V1W8VxM2KiC7nReLcs4Fwc/elGz5UdYjBC
 wOjT4qdXpk3QWUjAcnqVX0YnM4WM0SRO5vy8qSWfAKx1hcrqP4+qWSgU7
 DDmhV78AaZvOBEe+TL3gm+Q82HNgJuzmW6L2PO4do9XQHGoO1FFcdZCjj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16780099"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16780099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 07:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12589939"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 07:01:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 07:01:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 07:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTps2d2vfgjFCAyiK9GqNH3Rd4zDrIDMUGetvmre/Yae/LK1EhNGRYFgQ1fvIZQ9AahK2eiG+7KYnBYNzEPM72HiTDdJeBx+zYktelM0fLgr/ayR9Kd0aF6OGBFHFE9qTBcF0OLgxZ8316RTeU20TZhdhDhioX989/XwU9idQreBjk1OPIpx5O+kWGiMEvC9Ievnd4E1tLCnfi77y03PA1uu7tO38BAsFks34Rk4r7AzitqtKaXFqE9WbKVdAW4H31/2q09C7XTcuQXXEbKHgzhf4CJFzznpWCAKF0ji5dROogYKnhRqPddrPJdITj7lELV7afqkUomiLPdNwxuc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaBooHLNik9BGy38AUVx0hpez++T0bKV9+FNhhrROek=;
 b=Arrz5uBISbluSFDcurjUDpHeNTH4IRzdpvadqFvLdugVzpvLQZwcYucu16odjSCSyuSYxkOtU+eMACeW+dBm2nU8z0CJV5tzCw/DwEoLdeQ0dYYsUW7LSLYFy6FlFsVxxifakLWeQjgVVrvq/oSQj2A2iDy8C+Ey+e2Oebqr003RrkQxZzl9F0sgLlNrchh4uKioBA+Jte6dOx/sfLHa/OvylpUiyjXblb9AWvAZzfdLzAEo0s4FMPxqSQEM/wrroBbsv3xje0BwbYSp+y5wcZQBMg7JgufiODMSKE18cmjNhxESPs2NriEhAID/zi8QrzzIXx50RfCtIT8QUiYbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 14:01:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 14:01:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: [PATCH 5/6] drm/xe: Introduce the busted_mode debugfs
Date: Fri, 15 Mar 2024 10:01:07 -0400
Message-ID: <20240315140108.217862-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315140108.217862-1-rodrigo.vivi@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 870a3417-ada2-43c2-8a50-08dc44f86d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkFF0eB0LHE/LBeRd9g8neF2NCkFkBwacVs1UmgtRa8ZIfB3ZCWNfFV+S9W82Rh7FN2G626KmNvNxnVSO5XqSvyuBrRqsCvTYCYajOwPXnkMv//Gi7dkTs7vudFPN1jYjUvlHf/zKmS584XqBmWebuAczqk5pR+baHFV9q28V25/Hb+WK89gWjF4b0a9h4HGNcaCXh+HuhghnxGICzd/aAOj/euxBUOmRqEJhZKqVZy6TCcNjwUilcQDDkNCqMsszTfAUHAr8siTBKvitBm145iA7v44pQARERP6JpNczSfINrYdRpqL0BPEOhAI9wUiMjd6DjkHd0s2ujvO9o1F0rK3inEDiQGe/4dKUJtQ1U8ojZOuhlXLkuOKR9ohkIb9veotjW6APnimiDnKwZcLVG2aH/ehRy0Vg0SophJNA9TrVC1dsDH+rWQNkz9RMVEaJ669qskKTaIjyIcq05Javxpa3jVr7k+7kZbZ2Zxfz+Pb5WZ8K2NuxZVcKEmvvBK5tSKPaGhvLC0Vj2ePp635E17nyaDf+obROFAfNbgge50hXNO9Mwd+Pd8CPMTSHraDALvlvO2GdmLEqOrhNxP2dUm4fkLXMYrHc+cbIe/kh/FPMmPbtU88esN4F1RTxj6SJO5Yto2ANyQv9igSlzpJST3TlaLSfFqcYnHuyZ40kWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQ7DW6qzkcNJCtF1fJ8aaamev3I0B1dAVqvNgKvGUa4Y7ymM5QyCYK8I5GEo?=
 =?us-ascii?Q?eRvHHOyKLZpV67vNhvkMvXmunw0GfeqL0aTY2Als9130J4Q21xWMfcy3ocGQ?=
 =?us-ascii?Q?/iojQrc+rTIxvvjD9FFSrSbCx65tfoMbHdBzQw5pRz5fdErmEch391W148vb?=
 =?us-ascii?Q?idt6ugCX6CnuptF5odgts3D70HVksR70xjT7yz7NYrMRYeYpFJt2us5koQh/?=
 =?us-ascii?Q?PWc/yBEyxKbMg1XbdgXwxGGNzaFrVn92ok/Yj4oVrA+1zt0OGAW635lhJDMP?=
 =?us-ascii?Q?6msAGjVkM69/IuI9y4T6gNEbCj42G6Bx/JolWrUPF9zvs8xk0/JbQ/j+GfH/?=
 =?us-ascii?Q?wQtdYTqqMJwUSYt4S4CdxkEjc7UXfZSvhJSMNqmJOV7qVJOeCcMD3cnNwOtW?=
 =?us-ascii?Q?O+uxmMexs8ZyWE0khuRnQEt2oY0vTz+vwMlJg28w9RIN8asZEeZFiYbpoyIG?=
 =?us-ascii?Q?poIM4nVx6WMYItDxE0RrrNHB3XFN4rNEQ6ZK44GM1k2Nl6qu6kGCJmVffH9U?=
 =?us-ascii?Q?E1sd2BZmUgTkV+FNTW+ni1i2/2Dn3khxyLufeK+2VrePm5mEnMUvRrnEEMqC?=
 =?us-ascii?Q?1PBzCVNm1ehtiFD/j2PD7cgHpkrO1mwlsIegWYy1XForr6lyNC9HmZT1mhBL?=
 =?us-ascii?Q?fIlAxqEE/5SPEMB8iU52QaU3WO1r713lAl3vOj1OahxnUIm7/DXpf4bVbpnc?=
 =?us-ascii?Q?gGfEzRGLmpKijbkazZWaex5VQ0CdqBw52sdlJcCgGaw/ST5BtnF/qewK+30G?=
 =?us-ascii?Q?9RV4RWN51BTX4o+xj/2ZzrPY78l2K6tIeQCZtzEwdBDRtrSOF/T8NJvmRm+W?=
 =?us-ascii?Q?5l8Ff5fB6vIQlVUMIdmApS/AkSm3diEHeXHf9boTkFwO1GdQiKbcZkkxlyyJ?=
 =?us-ascii?Q?z2KzZF5fCjaGe4+VzT5md6MHFb54lWyxVFh7O/iK3ZB1f8MaiXFRX4xFHN61?=
 =?us-ascii?Q?AO7oafHds6JANLloCg1yGpAwsifgnxr6LoBqJ6o7k+T7YaOfjSgvSCbhkRCY?=
 =?us-ascii?Q?YQqdh3Y0tcDpgfdZJROKGnrjYeLQbRrIVWSCt8Pq8mqOigY4velm1HQhPqma?=
 =?us-ascii?Q?q5cW1ED0gSGmVWbNc+RBQ9NSnPh6fVOGMaLAJolyRnPXut576JVwhXftfHwU?=
 =?us-ascii?Q?FsgrZUHjmO3maMU7guYYMClsFh4YbFy1FbajtRids+aO0rQaTnN3fH7nZJEB?=
 =?us-ascii?Q?hIO5bQZNe/R6brQ/WWYcSQh2PnCkOuGdbntU2ua2a/LXQWEHYdISJDjM68Kc?=
 =?us-ascii?Q?TFcpjmf9MAWsfajOBiqaclEpkhHkE3tF2mgg9+1tiHHAK4q3SNl1XX9JLsJk?=
 =?us-ascii?Q?6M0a11pWwocOwGj/KB4zPkIvvWgwx59OQ/bF1jfLFaf770Yb9ULNEWrsK3RO?=
 =?us-ascii?Q?VBeR67vaioFYby1FZL7l4mR9ZoM+FGCn7ShMIMHJtKxQpruxo37bsW1EfWIf?=
 =?us-ascii?Q?eZrotOWt+CaqYe6jb/QTkwCIz6Zac+N1f4WuHIH0sygdghnPg9VvrT+BSBhN?=
 =?us-ascii?Q?IIxy6DKY+S2YDukclYh7Ua1FwcPREB1i+8GPAOUz7sYUjuSApQzZoELWwcMx?=
 =?us-ascii?Q?ORNi/ZT0ZB1099IJMnCIScocKNxLNc66vxZFYw4V6z6Z79bH5MKiVSkNvxeT?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 870a3417-ada2-43c2-8a50-08dc44f86d7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 14:01:36.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6pJOpIocsbz0nWPBrfQZiX0FnrFmRoD7sfa5N6MQETexBKU/dG+SQ4eYVvQsHBN7FXISqEyRywx831k0gxKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

So, the busted mode can be selected per device at runtime,
before the tests or before reproducing the issue.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 44 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 12 ++++++--
 drivers/gpu/drm/xe/xe_device.h       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 11 +++++--
 drivers/gpu/drm/xe/xe_guc_ads.c      |  6 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c   |  5 ++--
 6 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..175ba306c3eb 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -106,6 +106,47 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static ssize_t busted_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	mutex_lock(&xe->busted.lock);
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->busted.mode);
+	mutex_unlock(&xe->busted.lock);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 busted_mode;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
+	if (ret)
+		return ret;
+
+	if (busted_mode > 2)
+		return -EINVAL;
+
+	mutex_lock(&xe->busted.lock);
+	xe->busted.mode = busted_mode;
+	mutex_unlock(&xe->busted.lock);
+
+	return size;
+}
+
+static const struct file_operations busted_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = busted_mode_show,
+	.write = busted_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -123,6 +164,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
+	debugfs_create_file("busted_mode", 0400, root, xe,
+			    &busted_mode_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e28e3628744f..49dc2a061463 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -434,6 +434,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	mutex_init(&xe->busted.lock);
+	xe->busted.mode = xe_modparam.busted_mode;
+
 	return 0;
 }
 
@@ -791,10 +794,15 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_declare_busted(struct xe_device *xe)
 {
-	if (xe_modparam.busted_mode == 0)
+	/*
+	 * It is okay to check unlocked.
+	 * busted disabled should be done at boot with parameter or with debugsfs
+	 * way before starting the workload.
+	 */
+	if (xe->busted.mode == 0)
 		return;
 
-	if (!atomic_xchg(&xe->busted, 1))
+	if (!atomic_xchg(&xe->busted.flag, 1))
 		drm_err(&xe->drm,
 			"CRITICAL: Xe has declared device %s as busted.\n"
 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e6edf2d3ee4a..a8074975538e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -178,7 +178,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 static inline bool xe_device_busted(struct xe_device *xe)
 {
-	return atomic_read(&xe->busted);
+	return atomic_read(&xe->busted.flag);
 }
 
 void xe_device_declare_busted(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2633fdfc1a38..f68beb660f90 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -455,8 +455,15 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
-	/** @busted: Xe device faced a critical error and is now blocked. */
-	atomic_t busted;
+	/** @busted: Struct to control Busted States and mode */
+	struct {
+		/** @busted.flag: Xe device faced a critical error and is now blocked. */
+		atomic_t flag;
+		/** @busted.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+		/** @busted.lock: To protect @busted.mode */
+		struct mutex lock;
+	} busted;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ecf45289b187..43f0a88bbe8a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -18,7 +18,6 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
 #include "xe_platform_types.h"
 
 /* Slack of a few additional entries per engine */
@@ -313,6 +312,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	u32 global_flags = 0;
 
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -320,8 +320,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe_modparam.busted_mode == 2)
+	mutex_lock(&xe->busted.lock);
+	if (xe->busted.mode == 2)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	mutex_unlock(&xe->busted.lock);
 
 	ads_blob_write(ads, policies.global_flags, 0);
 	ads_blob_write(ads, policies.is_valid, 1);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3f3160373631..cdda533ab317 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -34,7 +34,6 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
-#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -951,8 +950,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	simple_error_capture(q);
 	xe_devcoredump(job);
 
-	if (xe_modparam.busted_mode == 2)
+	mutex_lock(&xe->busted.lock);
+	if (xe->busted.mode == 2)
 		xe_device_declare_busted(xe);
+	mutex_unlock(&xe->busted.lock);
 
 	trace_xe_sched_job_timedout(job);
 
-- 
2.44.0

