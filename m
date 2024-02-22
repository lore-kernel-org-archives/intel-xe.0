Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED3FC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE310E9B4;
	Thu, 22 Feb 2024 16:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3uxexAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78FB10E9B4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619996; x=1740155996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OrzVwCC3aJMjKeCMEmCPX1xFW2xzLF97X6EWOWMfIiU=;
 b=T3uxexAHWn+oAIO14Op10GSKBrGdCvPqyV5ummpOBT3vYwncu2Hxc7Qe
 E5PcPlFCKm1KgemR/EHPyGK7tayYhdLdyOCQ7qg2IJdrjEg9bbQULt3y5
 Y3gohdzzOQhBrhb3KkgWsDGRaZrsqS2vhCbzybKzNlevM7ixHxaR03oLp
 Wnf4pC91K5y4AeiI4rcGdMRqNEwwdTgzz25aS6SMv2gxltzWMwkKkTjCb
 iUfq9M5f83qzt630vNygx+l3+M5VAA11CxGT2dH5qeNVrx2n5SNpEkb7P
 jMZjhG1ZoiUyH67fL7JP2/ztCrSiaz4tU2VDyKgd3iiL3ERYdQ4Nd1FW4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730637"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730637"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552818"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552818"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:39:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:39:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib7QtWye9Q+DrIsh2wuD5CQ5mNDhSIEK1cDz8qQRKzNf9MOMfMooNkUugwFYrpPMLoO2xzMVzcMaQkaDkRjJL6MgcRmfGhHypMquZMZcYSMChM59pMpLoqHiWPodgpaf1u6FDLxnwRzcsYVrRhCDGyxSBERrPuKISrhQn01KUq55k5nTcH+oRjsMWgXiGuhnWUj3uyxcsHDBstD68ih9EqhZGeCdu+cBtz2KYlL4dq3eE/3qky7C8t8FMf+J69l3Kg1XHm40Zbrd4dbq++064q7CZZhPhX0Eo03EYfH9ZMgvIOCiSVsAj3dtTaH3aMudwMLoELqZcujpDPDzF9r1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OAYqRkRSOZ0Xe1RDtM04ykgLNZD37mQMaJt00pJYlE=;
 b=md7kagXfFCkpnLcHOEhCIQX1hcIu7uDBYFoHg8M8YoOrwBJ4pSv+AMi33nnxGkpTdwZJDYC9Jv4c9eJSEG7BS5NpWphVAOyuQHymMVXAaW42pSq9cGN37iIBGSTV7bWtN2lWYGMySe/yOdX7CmCCzkGJHZG0mRQw4tfn4YJZmKDwqlFyMP0JX8zhOXik8GEKy3pEspyAStEsrln6hwdnW5h7Hi3yjx8BB0sxPnhr0U69ssUicHt7jz98IOWsuTZ5IdtBmk2w82iiEqlHTJG1TIat15OeGKYaQ6rE3/YxlSvBXIWifUAiYCHEkNEKUW+I1luKtiMu7OS7C5M8WW0gTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 03/14] drm/xe: Runtime PM wake on every IOCTL
Date: Thu, 22 Feb 2024 11:39:26 -0500
Message-ID: <20240222163937.138342-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0041.namprd17.prod.outlook.com
 (2603:10b6:a03:167::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: c7870250-9948-4de5-5d97-08dc33c4e22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+h3liVaCxqMrzTQN40t83eExvAbm+G5RstzzY5sG5uBRh8ZKSqFw4JTk9wadJSUXnPpJG7c+ZmGfpb8+Ue4d8lAl80VHwPvBaFzDSs9lO312nTBK7/yHXZ+F7zbB3k94xZQCSrS4fkUuQqPef6LDhSu30zOWul54ozyQfsrBpiASXuFZ/TtofKUeSw14Y+5aeAHOGz/gGt38dqeWFt+rPJQH/+iA+ToU8XIrtk7Anp8eEhpPh6vtDBcnFvKOCi3in1+Wl4N5/sc8bU3T9lBrs22Z3vfXOnzm5cz3AU7k1kBVbeW3Fk7DvBOfqMt8bAoxkMlOCQ2NV+6nXDDk6ukQR1B5HxpjRJC5T/sdd4ZHTRGmVe9kyqP3ecf2UOBsjAPI+2XXdmPC2vcI9H+bBgla4qLAkbPwsNVlo+DXYV2sRgkPimXPAC71PhTz16BWli4HZerT9sLUxRV8kIRSHrVJTiVarUaQcdL7bzW7d3+l6wZW32C0kvhSbAUPkEDn+GA5S/FE/Sq2NqlNYWhcrbqFxWZLbzHJgR1VqPzHkA3NaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HX8HXubSmlEN+dknXbt/y1jXUA1z57q5ON+CrESYOU+W0UgdOm9ONdJrxrPy?=
 =?us-ascii?Q?v5a4tZik1ZSW2WC96BNS6o2HZ0l563iSN9COYc+0Zub1eyxNwliR64+lGVy1?=
 =?us-ascii?Q?7CmFelX0EVl8/wR213dIy+69yvx5ahnbkArX69ddQjcAMoI2Zhbr9rVlCo6X?=
 =?us-ascii?Q?ecsHceAdUTw6kLThEqJTgHrik+Yq58fOkjHnm9SZ1hyo1NI51VuiKkMnX4vk?=
 =?us-ascii?Q?8gb5VcUnEb2vWX4spMeyma6bBmFHdOR9eIu8SVl0MkjILANLY7HnhNK0UmIb?=
 =?us-ascii?Q?L9COaxdCo2X5nKpxYalOrjTyD89MEZRaneMqscobuKO+26A/6TAkKi+vb7Nt?=
 =?us-ascii?Q?nsslWuWnRVkEzGEYYJ55kh9UUcsi2egeB6C3zFPMkoE3a8F2ou4tVdk4ZprI?=
 =?us-ascii?Q?/kuiK9Yt8UYb34tStZ0ajY4zYrisVCx53lO+biBiY2y9K31r7k/C9FkQUsHJ?=
 =?us-ascii?Q?MXFlYjgRPpAPFpGuuJhu5XdkZ5N49tMZUE2mR9mIB63QmV+GI3kDCEn20k18?=
 =?us-ascii?Q?e509CwHAi2fqz/FYm1MshRhz17VVcrlh+jkZUPg62YKVDoPXlw61MDGvEuqM?=
 =?us-ascii?Q?de+8m7rMnPxyl763rAN53g3/D0/AFEr8CSSY8DB+J1QiKuk2vBWOR4Qlg3Jo?=
 =?us-ascii?Q?TGObvCEQGhV7wWaQFdc5DAhcZVKC0XgnVxMl9eONNw6SNP2AoIJfkrsmhwua?=
 =?us-ascii?Q?yB75Vx7hRlAty2i4YAow+TVH11uQXGgL/qUJigjz5WSDHnYRHjKF8bNFk0mK?=
 =?us-ascii?Q?5Tr4eXVdwY1k/IP5V/HkrQEhCGM3NirbQbv5hbngAdXm4a28LrG9OgMTQZRC?=
 =?us-ascii?Q?3Emd7jifJCNBl64fyAzWnrtPnMuVFKQYQ/LKe/Bg358ipH0yxBTPG2LAU3uW?=
 =?us-ascii?Q?EFqZArgVrPwtGsUPMM/LqBSeCu/HiDmHY09+p2ukys0fQTD1/pjVpsv0pjGE?=
 =?us-ascii?Q?CtdqaZr/Hw+/BCw9f1FXmdphGBcTOMpGKOeAZNtdco9IxBQI8WzD16QL+pXk?=
 =?us-ascii?Q?GCzh2SOo2nLQQxLXR68j9uEo4kSV8jsA7PnZl6n+gBi9eVsBdIxvABNHjKkM?=
 =?us-ascii?Q?5YZxYqbizeIooMyo3wR5B2SVsx6ZnZBSID5jgS82MhineGZ0ZCfFg0ak/NAn?=
 =?us-ascii?Q?HgyEMb3dDvitACrVJg8+byW3fBSugDohpvN5Ob8P7rfwthq/Bj/iEMv+r6iE?=
 =?us-ascii?Q?g9oZnJEHfZ8M3tJfilyiRhLvDoUVVN54WQIsbTxuILV4edeOOoE9tX9hbT1o?=
 =?us-ascii?Q?O4yb1uvM+ewZ6H7w7oogNG/IIAUGeMV79IxYbGVeTKyiRWOyMRzNXWLI2Ji+?=
 =?us-ascii?Q?y3iPs7S1BUmdztCxkMYcIqBSJaH8pJVOOmqPk/kaolcRlZui1nW/eh3xb4GG?=
 =?us-ascii?Q?tbo9/ibNvNEYutre6P7JNEZfD9aLeYYxCpH79v0CzKSstvdA2bBWUBvqaqkX?=
 =?us-ascii?Q?J2atrL3srtVDZXMSci/lXbo/ttIF4f/QEspwJFyXMkBejfAtNemN/oiLbjOF?=
 =?us-ascii?Q?RPx44313tQK4Hk1O6kOKHYmKL8Wp86T2hrGrpbXUlZexFj16VdLBPdFZxbQ3?=
 =?us-ascii?Q?2IPwL+yYmSfYMOjKbZm2qt6XQ564YbyzhrVM9xeCEp8jGWhhMpEWxplY1cEu?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7870250-9948-4de5-5d97-08dc33c4e22f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:48.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBNV0J1hh3Gmw0Qgi3JGXMvx/0yxeauSJIs2hMSvRAbAGTRtyUA6WdPQ8dPd8Pp5+kQVF+3Au55zZybBXrG8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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
v3: Make it NULL if CONFIG_COMPAT is not selected.

Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 37 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.c     | 15 ++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 049bbca6ed56..919ad88f0495 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -136,15 +136,48 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
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
+#ifdef CONFIG_COMPAT
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
+#else
+/* similarly to drm_compat_ioctl, let's it be assigned to .compat_ioct unconditionally */
+#define xe_drm_compat_ioctl NULL
+#endif
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
index 5289d8c0c3b1..b5511e3c3153 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -430,6 +430,21 @@ int xe_pm_runtime_put(struct xe_device *xe)
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
2.43.2

