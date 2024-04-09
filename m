Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347DEC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AD6112FB8;
	Tue,  9 Apr 2024 22:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgEYVhnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEDE112FB4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712700928; x=1744236928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o53YY6JVNl+tbb5rx5RiG8JYHKioNpxX/ofUcpDCCbw=;
 b=QgEYVhnp5VEOOkY6188zX8HJDCRONBs0On6fgqJy34OEelDLpX9R0+7Z
 cKdZHUq/ABj4iLybG3JkicmKD1qnPz9HyzSMvbT2qOQHCir3CPg45rLB4
 JthtFeYApJr94Idr3OBf3F8HDfTb+7qBc2kVHKAUqDBKr6bUEvyw78WuJ
 2dtY7DCwMYsxcwyobbQeXkypGVy4UzszZymQ/rMkhzTBx8/GzcTKf7FFr
 1LmfwQ4kG29A6XPat1AtfRMlNPMeDnswhcsJf3R6/q0N+ClFsaGus2gEK
 7ufQn1SAWFEGY8fg1r9h5F6en4R9WXBEzwsNS4s48glw8jU5Uek8MLkXw w==;
X-CSE-ConnectionGUID: YVWtb68+T1ikH+OSTMxkYw==
X-CSE-MsgGUID: WssRVBrPQxG8gA1UmyQ1Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8614432"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8614432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:15:28 -0700
X-CSE-ConnectionGUID: hbIf7ygdSoGOzOGPLJ7GlA==
X-CSE-MsgGUID: jGBSb9m9Tg65UO4jk75lVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51562217"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:15:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:15:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQtMAchSvTdqfeHzQrfGf0MUIgsyoojnIvLZWe1RXEN06eHYSHIhzmEFA6WxSA8zW3c8zymTONogo88daxI5Jk4qz7nFpcP+E/mCsat1ocJufI6/ddhWSbK2Stc2pzYZu//7PyxRE2vDkzIXPwyRy6oueZWRptE0+KAKjdsgcmplU1iQzQXOfxZ3D5wha0/aQeVI6yAKBWdsw1SfnTSrljDyJzru81EAZoRSwv5dHsvCEZ79HfKGT1QjhYCqwRQzze9ltsi+i+cYhe3pf8H85GUWJv3n+38ucA7sYufz+LHavNZbFSpYgeaLBZjjDMts1H5+IcJ6zgMhwaMmWCijjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILGPluZqx32aE3zyXA0PT7uSU6Phc+AJHKMussT0aG0=;
 b=ECP9wrWhLRycBdR9CLBV2H08jR+Osm2Ixw8TCeKLl1zqX+RN3D9ivJogqVjvX8xazWoLVrYLqLHrs4VFfa+PNh2fiaQGSDuARIojRVRMmivIfdMh1sKoSJhxgkTvJ4BE7EjmvHupqjzSczCxm2tsblqC9aUbR7DI/bgAtcicD0xu1INpu74FeeUFJtDLHSJ/+2HicNsDulOJ6Z3vSdF0MqNkAhiIl/ieL6nDRarVb9xqtH2UeLDdBiW0jAdjxpveBjbEmoU/avIkpHfD0VarhiRlKFazw3Lp2yy35hIqAWiAMvZG+BSbIqNWiLeHi4gTJ93zpim1JntmZSnCp73x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 22:15:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:15:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Date: Tue, 9 Apr 2024 18:15:07 -0400
Message-ID: <20240409221507.1076471-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nVMxUXGVmEqzplV5CtaO00VDWCUwVeS1BcR1+jBBkiDlGl3zY7NsmNbSKE8UFODH4qClyowXlHLX4qboCaQPweyjV2qpEaFiX+aOeTRKuIp5L/++INy7ycdmq4UTeD5/rZxeH68dVHSD0FqgjwPO+Qbt7m0FxjE3QwWC5ZXgIhGJsaWZMkSNu8p4y+mKMXMaRN/XJCh9Iv17BF748Ia6D+GUyTauz2ELIAPei+lP98mXCoYsVXkF0whfkXmdGImUq60uUYn7+mP7LnCG38ViUoJTn1g3PcmtiV6cB23jyN0AXQYDr8rsWYySInIUGMHPwKy41PSdCjNNK8U14lgVvFRygLFnDvmdIS04+JjijVnxz7R4Q+q/k8e6LxzPg25uLCTH68XqlfjfBkfs4jE5AbxY+hqjiqL4S504qonWXxPpFDYNcJdeJDbYv2SwQYmdcK7bMzh7sH5w0w0kNSZ6E76Y+l1gIq+lAkgNuc9etSOtt53HkEilTXD5QGIbW3JFwPorvxrIb1lEHNGtdcrhfnpezFJc6yrULKpGpkjqsDVAEQGu5RH9I72REVKjPTgphHM4s97KNPt1y+5iNmFdjq0B9PFJH/giRq+xfJuPoCs6ThACrlohQpfMNNpIVS/CCeTakx3wWrousH19yzMMlEN6juIqWSa5meGnL5Fs/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d+bFa4ik+VtI1rw93wv2Idqt9xqg/v/rY16YxBrQwwt8QvVy5/57gfdVjUrS?=
 =?us-ascii?Q?izu9NjUY2Em5lQ8bgdfH9Ze9JjXSuQgfEAzWAH/aqi23QnWz4qmkNOsFVmJY?=
 =?us-ascii?Q?pbon7q9N3p4QKuvDUHt1ZTepDJ5PqY5A7CV3LucdnRtFGCq/FzP09TTtmco9?=
 =?us-ascii?Q?6/kWZMyjrhfRVdskyTt/7s1HlUvb8PTfq74hYxJaD4vaNUzIki7rRvy2DQZk?=
 =?us-ascii?Q?6AK8Xfs24hyviYJhNksOA+f54J39lExEGuWSVqgBZ0dzR8QQx+7Rf+6d1o5M?=
 =?us-ascii?Q?sqQNhW1Au3MRQsKSA02BfS1lwIc7bU0oz8YYtO1yKTmq5RbXjCqdImUG+1DQ?=
 =?us-ascii?Q?1djEJJM7wFO+GKUBEuK3VoHzAVZhaZ747jqq6zk8Bbt+hpjyTRpWymnnAahc?=
 =?us-ascii?Q?5KUXh4ckxpoIFYCGr0tIrw0aC9raSs2RqMqECzOL/72BWisyAKG/YnpzKUZI?=
 =?us-ascii?Q?d2sF89sY8GGqspfQ80J3NamBaNlMypUMld4urFclSRirPgsO6oNCIKcvWWQX?=
 =?us-ascii?Q?wyx1pi6Jo5uCej4d5xcLjfQVrpoj0J+PKla1EestoiRGSMswkPkz90ZiErS0?=
 =?us-ascii?Q?iIDpQQQRlUriN1gz4hFh+XjuHJZ5MpL/AB7e8P4/271QEEW0Daubjd2Cauk4?=
 =?us-ascii?Q?9pskyhQ9b2ULYNxo1/YhT42u/tqV42rQ+ChRe0iVZkhO5+Dc1fAeS/i7ZlOC?=
 =?us-ascii?Q?eY6rywGCTzgFutNxVK2NDMiMHqniALkuffSsy9vZAU6JkkatxAoJ2+XaMoFU?=
 =?us-ascii?Q?Pp0+vVAy6bypegiPbuozGcT7X7Y7uoJyD49KdBX7AftXUx11MKtkpY8kbsAn?=
 =?us-ascii?Q?8EzaYJnrvM6is+YH5TbJuNVhIr3++WPyAUXi2BrwfxhGS05FiuddjhvZJyNL?=
 =?us-ascii?Q?AJFXoaOe/cl83VCGhD3hi4i4WGcqLC6g3oC/NfbBHQb4F4s4sPuKuWE5ItPn?=
 =?us-ascii?Q?A7gAzoEY43rcfthqa6LWsYJ6H61luej+jOKmpfr8CARQQVKMsCrgvcsop1/u?=
 =?us-ascii?Q?oQWY3LysJeqy9DukjXFTr41ML0+CmktMp2lx83RKZNA7JMCGKfGApcVBrMYA?=
 =?us-ascii?Q?lXFs0PaScvshqzk7TAhCOu2MdnKz9GiguHV8I4cck5vmyIGFib0tl4PXtRrb?=
 =?us-ascii?Q?ucr/sr2CWA4H8K6niwKfAkp87IsIfJt9T07fPLDNXshnRNvjB7j7/Wj4mp+w?=
 =?us-ascii?Q?LCkY/Nwdr210Bt4rGreGqsqBNDIgUhqZ3yXLxwEa2JHwZNCKIqVqGauJ0JYX?=
 =?us-ascii?Q?4l1XxqbCAF9ddUK3Vu074sj+6mrNZ4V33WQagWmjClhBV7x/Jh8UUBw64F0V?=
 =?us-ascii?Q?8K7CWf6tTpZIXVmDUN/vFWcy3BZXTuWTV8KXjyR1ExIcjVS/Ve5ICGTs5QpZ?=
 =?us-ascii?Q?MvAj7i33examKWJVKgSChV1dfO3n/4xJ4egsRlIEtPR9GgSyC23DVuRiyZ1U?=
 =?us-ascii?Q?BKfONdEwv/KzMCVcYmoUkmqK+0ntTeGBqslIlm5Pnvcs41vtZim1w7MpGiFJ?=
 =?us-ascii?Q?PJva1nWSGFWjWDY6DIDysJoEWzga8OiM6huVvXuZr5P+hGgLNnsnFTAw5JJi?=
 =?us-ascii?Q?pX5szmvW0G1iSjT5sXEghyTN+n8QoFQlGV4qYe02lWwg4y7hdlYKBaVVaYeO?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db6ad2b6-de77-454d-bb2e-08dc58e28e38
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:15:25.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU5tFg2a4n5S8pGEbMFZIQYz660KnCFu9OMuZtiDXokMTQCms/wakjYZgxXjaCc+r5C0FYgXepupkpi+W2nR/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
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
 drivers/gpu/drm/xe/xe_guc_submit.c   | 28 +++++++-------
 9 files changed, 163 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 86150cafe0ff..6ff067ea5a8f 100644
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
index 7928a5470cee..949fca2f0400 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -445,6 +445,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	mutex_init(&xe->wedged.lock);
+	xe->wedged.mode = xe_modparam.wedged_mode;
+
 	return 0;
 }
 
@@ -787,26 +790,37 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
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
+ * Return: True if device has been just declared wedged. False otherwise.
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
@@ -816,4 +830,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
index b9ef60f21750..0da4787f1087 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -458,8 +458,15 @@ struct xe_device {
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
index f1c3e338301d..ee7e0fa4815d 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -495,7 +495,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
 				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
 
-		xe_device_declare_wedged(gt_to_xe(gt));
+		xe_device_hint_wedged(gt_to_xe(gt), false);
 	} else {
 		xe_gt_dbg(gt, "GuC successfully loaded\n");
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index dbd88ae20aa3..ad64d5a31239 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,6 +9,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "abi/guc_actions_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -16,11 +17,11 @@
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
 #include "xe_wa.h"
 
@@ -395,6 +396,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	u32 global_flags = 0;
 
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -402,8 +404,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe_modparam.wedged_mode == 2)
+	mutex_lock(&xe->wedged.lock);
+	if (xe->wedged.mode == 2)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	mutex_unlock(&xe->wedged.lock);
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
@@ -760,3 +764,47 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
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
index 0bea17536659..7de97b90ad00 100644
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
@@ -868,26 +867,33 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
-static void guc_submit_wedged(struct xe_guc *guc)
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
 
-	xe_device_declare_wedged(guc_to_xe(guc));
+	if (xe_device_wedged(guc_to_xe(guc)))
+		return true;
+
+	if (!xe_device_hint_wedged(guc_to_xe(guc), true))
+		return false;
+
 	xe_guc_submit_reset_prepare(guc);
 	xe_guc_ct_stop(&guc->ct);
 
 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
 				       guc_submit_wedged_fini, guc);
 	if (err)
-		return;
+		return true; /* Device is wedged anyway */
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&guc->submission_state.lock);
+
+	return true;
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -898,15 +904,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &ge->sched;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
-	if (!wedged && xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -957,7 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -981,10 +984,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!wedged && xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
-- 
2.44.0

