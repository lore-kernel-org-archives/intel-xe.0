Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D660C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D962E10FE5A;
	Fri, 26 Jan 2024 20:31:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF810E2BB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301076; x=1737837076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Tn5hZF4PR9HsUTSS63Nb1HWq1amddSiwwRJCHzyB2no=;
 b=JjnhVMp7xv3iGJdjuwjT9ckQAZ1W6Z4IZDkN0iy0XQbEKKT0jw1ujLWe
 cfYqgXXdh7XmWQ5M9a3Y++kcyvtVCcAY3kfaXRMjgBaE+UWYzZiAOoxxU
 hw/qkrtQd95afLYX7memJ6Goh6lKsWZwPvzGBoqG7eszzOauFhq088lpb
 eAPemksnB6YZq4ELIV0vKMzm611wzE/K9wRelQWsLSI6xl32Oz189jz5N
 sK/7xpCxbvzHynFMf2/Dy7SMZjrIOvXYtKhu/Xn2iWTaqsSC5iH6cFGnK
 aLNmqaLfS0vb8WDlCWK0OTIKtBdBj/VsfD1CoKKfBBAbzfVBsSsqNzNkK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9244916"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9244916"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910434362"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="910434362"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfcj2wog5vmeKHaWo2rAMw+nFYxHEc/PyOPNnQOepcdjllUmK1XfBDfvm8dseDHtu4NlVVD7khCq+QvwBYoO4uFQMoeRkXmhK3KnQYE8GBWLL7G445MpCs+2leecXjW3GG57bGYst9r8aFx6psK9C6B4nFmsS8gEdcZypp9wi66tg92Wa4melc1aRSxcAsQVGU7EnECRRu7sN8yQVzDwcsdd1BOckqwD1gLzu8EsldMZs3jZR43OxvF5eVMWywS0kJqY0vU+v6laWufH4N7a/xfNPefTiQlQCisWYhWW3lJbZYtmK7yF7xm56uwqAzVxMipvwooy05xLyuCIRMW3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA9aSrKknmRuR/37tXpFG1Luhzb4YG+gxZuHDuFpWUk=;
 b=EPDk48UnVV0w1F1l8Rm9eJWJJZT1L9Htiq1X78A69IFkABlvClNLAA5+yKEJrw4qGEqtrG7GddlTNQDZfRYaLiEuY3+lX662Zqyu+io1P2xHXr4k8JAEXg7k7PA1/+yoSAuqitR+36g5db1cDqL9UacUH2OZ5hqkdKm/AYJsO8TGJx5+R6ZsumMthcDi+jb5642Xy2fPM8NLHDZyaZxSD9pP74HX65tweYFkZ8Z0NAvgI1yXyFWJDp/7Kyg/O4k/juQpJVWac9lhbrZLzGjpieToTjdqPd2IgR1a7+w6pUqkn1fZly6z8Cggbe3vd91LvRSwgBX165EbERkjTBjd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 08/34] drm/xe: Runtime PM wake on every IOCTL
Date: Fri, 26 Jan 2024 15:30:17 -0500
Message-ID: <20240126203044.1104705-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 668a6fa3-39e1-4aa9-72da-08dc1eadbc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1oIu0h/RL+n6zeMpTD2aMwc/hdy9/uZ8xoN/PIvWufk5FrWl4EU2pdl7gTv8CuMJj9pfKychKP1Yuc47Gf7WnkM3Ue5NwlMZQgAN0COezJJh3NMZ3PxPt3POt7dF+FZ4Wnym0H1GO2wt3K0CbGm0l7iPGzgVrd+Yza37whsjMXqcxZQes7s6QUsbUDF3olXwwGCNZsYc4fkhQots6Cp96/f6nNhmxMZp5k6BrT956PJAfZO0umdMCFe6g9dmPNPI+CnTz7wFkRGmYWi5uLvEDJIK+08ajdD19Jv+bAALDPUvNpf5c5pnhI9DuTvAwjhOElr5utBJ0R8hvE/z4K5t3L7nuyjsqxnrmlVGpkpykh+i1Ugm44UsN0+jrcT/ZY4wrUuGPp/YePd7uoxjPtSdY+XYeJfaCRPFrNbaG6XUHxHfbOB9xqFZWYDXMTbP/GCuPAYGOE9/AAkbHGANgJKohQlhi4gIdD8FH80o1BHbFRqIOhRRYR07bntCqv57TTLsPb6nVZoETcOBYnPK0ZC1M4mIR8FuNdEp01q6FSjq8vwG6X5SNuxw7pon73t7yr8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26jeA2qqPEFqqi4YBMozksDaNpYDpKOlOxW5F+Z8ggFFioxy92RyDTy5hX4G?=
 =?us-ascii?Q?p3eP14xrSe6xO103oTJtNdf7j1mJKd28cjuLOpmWGdGoa3fRdijv2swPU3tt?=
 =?us-ascii?Q?ZCNKohZVgIDtSje06SJBh8FFZ7y+PXqoJnjss64T3sEhp7TG4apSvFmOdf1Z?=
 =?us-ascii?Q?hV2fuJ5d13oFLZiyb/koRGWBmvgG956LN9h4yXC6U2AJNypZ1DnLC4LtncXc?=
 =?us-ascii?Q?/H7MWivrJ9FeO4gTvg+U97W/yEym9RQAkwznYzUdtNJVj7LloECdN5/V9Cwj?=
 =?us-ascii?Q?Axm4EfBX7g9ymvyuwci1CQN3tpGXFZiEmfgnVNz+fm+SCMNTe0y8FvyXFTmh?=
 =?us-ascii?Q?719F1kF7vnD0h6v1mNdixYXejYpvKu1GsLYq+hC0z9TvrkjF5ZMyBDOmH7bE?=
 =?us-ascii?Q?mAFHBsXxs+aZkhtJZofbyTsKFhrZwpCTxr1T1iqQBE3E1eQkwDX7KUDlfYDN?=
 =?us-ascii?Q?9/pcCH3agIqywKt7G6AOW3D5m4dU5vBfdldcr5zH935PJTb+sDx1RJdCNGny?=
 =?us-ascii?Q?bQpRRo95obNaO/oXLTMwtL5Cu45hfzybCNPhfky0VoAbcqlzqX4uwVhNdkvg?=
 =?us-ascii?Q?tkv/w4c1KRBrxYIt9rDchEDcZr2yAB3NMqc8dXFLOfDDo+we6jew1vNjFEWj?=
 =?us-ascii?Q?t7lYGHbY48XKJrnM7ncHSpGgLMSawFCbjvSllos2ENGgTVGeg7Ph8HXv+7N9?=
 =?us-ascii?Q?vmpQt0zVIic57m3dR50d73BlmjigXpk2Q3Btl9SBxFTQMBvLul5FELY0QTYy?=
 =?us-ascii?Q?64QopXDY1QNBaamedb/4LGyfKJIL3AK8+NsjaD/OOdgVfA5e6sr6jpYOzNHP?=
 =?us-ascii?Q?2w9mjBJuyW0pA5fxPI8R5VF9ttbOh9sepEyVwXoPAwnlVYu54I1UbMrn6psn?=
 =?us-ascii?Q?0kDeRBJ0Tc1UiM3eT3nOaOwXyY8aJhNG1K1N5YoDKXOQ8mFQ6j7/RnZGuclw?=
 =?us-ascii?Q?3o71h6jUEtH9BSuDcLVok041xFZa5fBZrDitzJR+12BzulCzJ2ohXNruByQq?=
 =?us-ascii?Q?0YfnACtXlfuWB8aCinJakRc1eYXkJ1BZwXGMBYNzDNauqEqMSTA0S1tESZHP?=
 =?us-ascii?Q?A2RFsPnv2PuMHqRmlXdrmA16sN73Kh3+juhUiP0XTb3bUlEy3WegANmGtzSy?=
 =?us-ascii?Q?28vJE0mu7dF2nQi7t0WFaznM5P5frwb3zd8oD/cD9D5Kt1UOmxxJMlHur2Vi?=
 =?us-ascii?Q?UK3ewTFKEIyJLPzVBYcEAivQ7KtVSfgEbmx40M9OKjtQwK8fOnD+i1mLNwgS?=
 =?us-ascii?Q?4nHfmSiTOuYrWwVgP/0V5+jMp7+6u0snQTkcUSkykKegdz8U7AAxXslSUsdU?=
 =?us-ascii?Q?Sws/ryyS8TCfNyt4npxu0VjDQ0iMqnAUv489D9Pfd4c1cPyo1GGnam/q+k73?=
 =?us-ascii?Q?4dYkzNr8e8P90v6hgwFTGvfHGmNfXn4bBrfiGaMx54cgMHfcRUYqJoG1jvy7?=
 =?us-ascii?Q?u87Vat8YZFzQy+VSqSuS94LEo5O5rnoqlisbHAsmmRiq2QfMRS7KH9mcSl+/?=
 =?us-ascii?Q?W0YfNOyx/ba1sVi3LSk4F/74DTipPuuO/sdGzpv+M4yaKGZen6c6igrE2OX6?=
 =?us-ascii?Q?Z4zqle+O1/+mydxyvSVwfN8II8MjFYoC5mFJuRBqMdWUpn+OsdZEdL6C8tof?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 668a6fa3-39e1-4aa9-72da-08dc1eadbc37
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:11.7384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIMUp+55T9tn2pdQohVipJm/oPBde/LdgVnKfH5I+vwwOEJkLvIJnxB3qrIItI86YCj3uOZ4lm2jTycLvc+e0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's ensure our PCI device is awaken on every IOCTL entry.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 32 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.c     | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01db34f06a7d..ab41202ecaf8 100644
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
+	ret = xe_pm_runtime_get_sync(xe);
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
+	ret = xe_pm_runtime_get_sync(xe);
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
index 3ef14937d5d2..d98f4bb3ad02 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -429,6 +429,21 @@ void xe_pm_runtime_put(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_pm_runtime_get_sync - Get a runtime_pm reference and resume synchronously
+ * @xe: xe device instance
+ *
+ * Returns: Any number grater than or equal to 0 for success, negative error
+ * code otherwise.
+ */
+int xe_pm_runtime_get_sync(struct xe_device *xe)
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
index a672adffd0e1..7d8cf87b95d2 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -27,6 +27,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
+int xe_pm_runtime_get_sync(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
-- 
2.43.0

