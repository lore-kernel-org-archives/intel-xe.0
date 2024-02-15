Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF7C4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2610E68B;
	Thu, 15 Feb 2024 19:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd3wd0a1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ACB10EA05
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025692; x=1739561692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aqgFoMITMe6h/Q495SdzeCpGylELkT7WfAxoPY2C62g=;
 b=gd3wd0a116vmX+WzsbE6rh7oXp2QpdzoOndfGCYF/7PdIFWXuwtazvuQ
 v6C+A7oWkJOuQDELRV5qOX3LCqP7DUEE3C8EDXUUTVI1bSbyiRk7DI1Hu
 BhhJpA3YLuGc7v7v3hnTxENaZd51QPz4oB4G03bvHo/k3I0WJTxUNkQBk
 CBdFZBXs/oQBf/ll2L5U6dQ4vroWILKO9WiBtERftZylIHXt62CPZXhYa
 TfIMMvyPjZZtjIu+/GgODKmO6DAFi/PGk2iJZxfLF5i1vu5buvUlvmzSW
 OkM8ye0p92ePk3tyPXA6Inn/BzQ+mDSPl43Bzud/0X8ifHMOt45QrsPOE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688052"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230447"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:34:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:34:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFKDCUD1nhe7dATx84VdvH9Q7zlj6CbcNPDay/U6AUyjnRsq9Fd+OrXwHeyUbnKHUyeMB3d3B5Wu4m9VR+k0PRsxIRItDbYOQBNdEdSCsQKDuTLjR2+nPuvHf8DYesYJYf5NqVBUntSaZZxedGeT/zMA8SHKzQW943Lqm56e7pT+gOqyLN22f3dZFoIgWlIDdhnyYLL2VyKfjTDisgYPyV+Eo64LENN1l53MoiNdQLS+f0X8CKLpPq47E4pMPwVGUqTFeJmYZeFKf/PlNW3yu+BbsQ7ZlEDbZohsZ/Gf7dpaevTDwQffK9wE8zSZ83osbHkFy33UKAaF/H451Q1T/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDmDtz/7dwC2+H0CRvNn7cEuVLd1a4HWw4y1EFJ948o=;
 b=VApoORvK1HCoK4PUMMr625rxEuFowKSvMieII2RrJS8fl8SwumeAIdGeTaJ5o6MA/54A04byxwG4MxAFpvMsxUbDe74xCC3YIyLS+cTxHUzdJgj20jDc+NPRNTdVNOryySjxs6cJmLmticx0JTBUlr0s4BPcz0VediCr3FIdDXMPv9lnMkAEVVMfl7m/XIRAkX8ZxFmrwYVCUCPVG2+D+0/MYl+ywja0D9NOBGjX2GGeDD6AeWSjdmU9SVpLoAEMAB+DdDiihKHrBS7FO/EM1hs0Gd7Z0FHTFmoBSQdG1k0K2jZ+j17BDowMhwFNsVVGBv29oZAccss1i1lLT0PEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 03/14] drm/xe: Runtime PM wake on every IOCTL
Date: Thu, 15 Feb 2024 14:34:19 -0500
Message-ID: <20240215193430.130106-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: a2805f5d-7dbd-4382-4a90-08dc2e5d2bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvGjDMvuxaLA89xUBniBnYV9rgl3W28jOdG9HwNbWSC2c7MJXyY9jQtnR9ZmZ8q9x3VcIMuOTKTHzhl+fM+gR0V8GR8itvquaP2cXrGlPzuk+6IoxF0wY/QuLj//vYABrw9G+Qv/l/5fR4q0hUW+bjgls+dX1LRShGSj5vMofqFjJo+PXKPQTD8YbCZNLx1dfqCWN98zHCpI/N6ZLhQHle5tFSh2NvbQoS1TiRnEMXAfIQ92pXR+aJ2KRHKSwvhkgISF2p7FWiRUEvuhTIVXd43A7jdzltV+2Sljyg1zhvwjHLAMTOkgTpnfIEBJgim+OzmhovvEAR4VHNJa+X2fJTy1snojn6dE5urpWhhpquFtgstvyPd4NpB9sWwSRNqckpKOhBqBnOwflJ5P5ZMHyiS609qjDqEyz1xeluo2ReZuddMDkKExdaTbTJdVdI4sERaslcQJsqzlXIHC/3G3jm2Ra7aJ9gU6VDxEB58nUuHBFi6LaixGD3DGrV1jGDiVknyuf7r7AQklIJw4e/sinfAi6b7r3YprW2VvMyGIC+6PBheC4tVK0PkHzcvFQzUA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ItQgfSQyob5YDV/LNpU39QKrnm0bPmV0pPeQu+6XiY817qCJ3ZeetYONfP9v?=
 =?us-ascii?Q?sQ7yO43bBb1yE8VfpX50/mrRF1GT8qXmgURq72lQCE3Y0Xp6ivLKcvr98Z95?=
 =?us-ascii?Q?Ibg+ZEsKDjzHXQPqoemIdGd/bcGw2hD83YOhyVi5yJOLYSg5yS1XtslGic5K?=
 =?us-ascii?Q?CiwfOQqIdgzhXVLEHOvqK/3taa2toE9YSSQhG718gXgPPQPQcQ+hSdp76Ce0?=
 =?us-ascii?Q?+xfje2+C5/yS9IQ8aGAaXVcNgdXk+kM0qruBYTRaG0XI2mNJlGjeSKvvnh9H?=
 =?us-ascii?Q?BJk3dTb+7WutIf7e/zblyTAPyWQYiKNFzNsB21z5S6q4Op22kDx21XYBT3Bu?=
 =?us-ascii?Q?p5werbKtJOOyok4j4AJHydNSyZ5ZsENN9UjSo6TQwjLvTq0bKTRycAPWvRSA?=
 =?us-ascii?Q?pUy2w4ADw5Obt40+fvk/RnGF/9yjdpCO5AtgMlhJaIwJKemgM7O7R09KECre?=
 =?us-ascii?Q?YIWWW5lTQVnoPS6KLCPIavAwdtFXciYJkOkS7BbZXghSaXiMNwCioPPRgTFi?=
 =?us-ascii?Q?crtXABbAyVv2DS71vKpFRonSvNcM/EfbigocXrJ2Pbmu5wT+8GkGBXNNz6Md?=
 =?us-ascii?Q?uxE3c9TjurU9FFh1KPCNP2HBuwxRKwMIVtmSaNa45PxQ1ECL76ZLh042+RTR?=
 =?us-ascii?Q?jTR2tf/A8TI1CJ+9LCnUn5d4QCfHig6MYGHo8ndfG/C33w43YObABGUS6Gj4?=
 =?us-ascii?Q?MRMFFVlXDi0MLqO8onDE9SY3anPB5JEleCW08N0e4iV7gkFqTnOAn6RG0Jif?=
 =?us-ascii?Q?SDTrOpYxcj38DyS8lkQhLRyOQ88QwcMKkza+hq1K4kTSqGAkGrV+klgHIr3j?=
 =?us-ascii?Q?w7FbQO8t0R7IetdPaYa3nj/926ubsc8XGdxrlnLQqNQ+RJpfp3n9aRMAQ38E?=
 =?us-ascii?Q?ehWM1zFFyUyQbloTL83G4uqy2sYnO2DrPe9V7tP6z9RpMgakXdXssCOK+Khk?=
 =?us-ascii?Q?UpkJfo/9fvLYx8oPmSFB0woWnwOXbXqhnUepeeJCShrGWDiC+OXAZOxW3F+6?=
 =?us-ascii?Q?oU3O7aaQznu4fEZoAoyln5JoTBcaTeY8EiWgBO62B4d0k5J3TxQQlYxKf/7T?=
 =?us-ascii?Q?0zMeiPYuyG0pipZiznhN746kmmtuxKmK4wzOS22ogxOe1MSFSQOjeOU8GyTE?=
 =?us-ascii?Q?E6zymSDYWJLfMUY3sPh5LNNKbxNImwxVV6+7637zUNGriOSMsHhl+ge0Gcc3?=
 =?us-ascii?Q?GBwMwV7Z13yW5wocYVeJuiokSOIthsCRBCK6IK7FtskCeACN8PgQPcSa5YfJ?=
 =?us-ascii?Q?oDJQEna5RkwsRep7sJ2hOf5zm5QCN50az9sJRxjlTlhYniRG+ohrNwqZ9NEU?=
 =?us-ascii?Q?7Vf2p2NEihDRzTu96yXZnElaF5b0NlBkitzK4/SXLjovhligcixjM4PdpCtV?=
 =?us-ascii?Q?rl6sNVubYAVsy7NnlUSS+WNUnsr35ZJolqSKPnX7unfJIRCOugwqzY/gGKZC?=
 =?us-ascii?Q?7G9YC4B+Xn434+rJmyzq4bgP4/NYJrG2uts5p+rKsp3SVc8xgaZ4KSLkqMpK?=
 =?us-ascii?Q?R4PzPDqiC0jkIe3Mzwk7Js4zLIfpdNfYRUFHGYy65taZKimeSKnj7SJnesDd?=
 =?us-ascii?Q?bm0Ghkyj8Ahn2mWKbXHuVdQhdRDzvIAwCtjJrrXB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2805f5d-7dbd-4382-4a90-08dc2e5d2bfd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:48.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+y8e9rLjLxdvqzGPzQaNsCrn5McE2vtEBpqZ/jVdd+cOc9QYk1wp+owPPmdlfbmG0KelDL4QgXpOXrOPCZDuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Let's ensure our PCI device is awaken on every IOCTL entry.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

v2: minor typo fix and renaming function to make it clear
    that is intended to be used by ioctl only. (Matt)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 32 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 641af3c7fd34..f763385b941b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -141,15 +141,43 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
+static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct drm_file *file_priv = file->private_data;
+	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	long ret;
+
+	ret = xe_pm_runtime_get_ioctl(xe);
+	if (ret >= 0)
+		ret = drm_ioctl(file, cmd, arg);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct drm_file *file_priv = file->private_data;
+	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	long ret;
+
+	ret = xe_pm_runtime_get_ioctl(xe);
+	if (ret >= 0)
+		ret = drm_compat_ioctl(file, cmd, arg);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 static const struct file_operations xe_driver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release_noglobal,
-	.unlocked_ioctl = drm_ioctl,
+	.unlocked_ioctl = xe_drm_ioctl,
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
-	.compat_ioctl = drm_compat_ioctl,
+	.compat_ioctl = xe_drm_compat_ioctl,
 	.llseek = noop_llseek,
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = drm_show_fdinfo,
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d1c105f0eda0..b7a0e3cc594a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -429,6 +429,21 @@ int xe_pm_runtime_put(struct xe_device *xe)
 	return pm_runtime_put(xe->drm.dev);
 }
 
+/**
+ * xe_pm_runtime_get_ioctl - Get a runtime_pm reference before ioctl
+ * @xe: xe device instance
+ *
+ * Returns: Any number greater than or equal to 0 for success, negative error
+ * code otherwise.
+ */
+int xe_pm_runtime_get_ioctl(struct xe_device *xe)
+{
+	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
+		return -ELOOP;
+
+	return pm_runtime_get_sync(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 75919eba1746..7f5884babb29 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -27,6 +27,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
+int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
-- 
2.43.0

