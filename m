Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98786C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0C10E243;
	Thu, 28 Dec 2023 02:13:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA3F10E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729584; x=1735265584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xAxu3CLf5eLHEsYs1lHaGXO19dqXbuV4qB4wfIJUsaI=;
 b=ZDWYGe9yvvMaw2GRcdWvcrV3qR6yMjeMMGzoDSgfPeQVEyvuWsdV9dNB
 XDO3gRJ23dUq/lcJLHkGnNIEOLCA2klsh+qYqaOIzBdwZK5F38qImzyNk
 WcvHo9+FVyHH6u6gF0PqCHtea9LFADoIqDmtHqppZC3kgjLiG8bMQQJcB
 erLurMbZX+xulFbAGcDlKjNDA5C1IHxFG6y6owLAt6thWyXtoK0yQ0l8+
 EiORdLs6gXypZ/ls6Ym2nyTo3osVgcdSSd0J+h+qzDZecCMkGCNq6qII9
 8mTPBDsyLzRcXKicLTufZ3VU01asS8PZJEierTrPAkFelRX8SPHtrd5nV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460830257"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="460830257"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="20451638"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7xz0EQziLojGGT4LpEtVjmDeVAWlBfOKWRCqTNdC/AFjwfGY/Oj+FyTAGQRABwppAaS5nwX7KN2sCCQSv519dakq8JTdFdiNloURU09FZSXM8Us9L/8VwbSoPESa9Z78ukkRTFujkM80OGSISdIkESpfSJ7ap3PIqY5+e9SGTMAS8DtnKB/uTHwNRRE17MmGazNSMt2wYu7245wAtbfV9XSzovIsQsFebNHOnkZDlZzVbPCSpzwCT2WUHZouvxHF+850EX5/h2gxVCzOhaWkE2T9cbtGtRhftwjHrqeY5YCPedmfpIFf6aVEPY2Bv1qdiCpP0eNH+16bp/Gg3OnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHYcpqbrF+9Dw0tTePuiOyNVBaaOOmNg5A6l8h1xRLQ=;
 b=YkzLYbv4n9cKnK2Z73mIXIw8puViriSctOBSIohmADn+7rT+jWLxOp0qJ0IseeOBsRWpNuSYD1vZ6ml1lykwhaAPzwp6yZAQj0zuM8MoHY+d483hpvg/asyn3vZt0kFYvMxIfN3bb02BNA4hWw+FMs3Km28doG27eUyGPFhKr/nOw9s6bL2einYUy+BT4A28kZbN2CQYF3ZgbTd0WW3ftsuKpTk6kKeTrcKn9ESN1N0jz7WoCrk+GDhUGtPQq7SAVx9CIc921THZ3vs6+jTVojvaYFUBQryQ/Y3ctA1aocA3nHPoJ2+siA4tPk77Hs3axUa2fPPSmaU6SrfZlENZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:01 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 07/20] drm/xe: Runtime PM wake on every IOCTL
Date: Wed, 27 Dec 2023 21:12:19 -0500
Message-ID: <20231228021232.2366249-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f7067c-5004-42f5-3c69-08dc074a84cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUBU2M4htIFOJ+48g6zLeSVnbDoKQsU5oaxn03Gp3cQsKfEnldRnfZnP/Y+nW4jmOeCMpdkKDb12TEC/pGDAiIUwbiDTvaRlHeVHaBcl9UUQQFxqzFkFeveixk7yOxD0GxjjiTdt2UONjoEisn7zXjIRZe6ZRjV4zfCinBUsfp53YyMPIzIiq2KpwWzOnEQtMzxISxlo0ChqhjzU3Bt33Oq1ordblxe0EUsZ/rqvpQmnBIb/JfaPEHdaOfzoCoc0Ksate/c36U5dLffxfqx7sGx8wtjwWhrelvrcR+yI7iw0/8VaB6uCvjxX0fsRPB9m/oWMxjFjKtd3X6CweA3tVKcJ94PFldyqPZVjgy5AZ73gK3sF2yPUEyWxzUCeh9ZDByfDxE42ILxL6O96ElB8bOAQE5qejRO7osBptEN0K61MmjxM2+h/SLvV5DaF4CK0LadUxngWoFgPvjyxeFuGEmi9Q484eVxcba810EM/7v3fkTjz/4ROP6gb1cRdwgbIbEcTA+Ub2Hbk6i9zulG/lSiSAkqgNYuLs1PI0UAuYPYV3jtfwuZgwKFGykg+2D88
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VvQxAuXA+2wEL5Us2gQc1nbQmCK2GTKgHkp/RhohpnDh1MiI/5TPhsWtBMnm?=
 =?us-ascii?Q?55GTdOxMaUH0T33f0W7pbgs/miast1rOesMhcllHz39OdhwLJt4+P5se5Sq7?=
 =?us-ascii?Q?Ko9P7sKKyfebkg9oIJjRVSXsiO+hyzeLLE2I5knRBYfcjhM7uUhbQAGsq4N0?=
 =?us-ascii?Q?3zEIlGiDUNIRLOlQWkHjkgpGD0eD3QN4KV7TL5RFnwffrI7QOdoePTT0W2q7?=
 =?us-ascii?Q?PwlywF/9RpYrDbNIojkaSrjP9RcNBlutmbKhdpC/k91KruK7AJMrIehwYAn1?=
 =?us-ascii?Q?gbGCmFMSJ0vMdnO5yuqGACn4X8MkekZd3J5eP4HBvA4ZjIspqux04jSjoEs5?=
 =?us-ascii?Q?m8kAuHV8I/qDGMwhTWFtUTgKBPyNvsdSQJkia582gE4GEWyNpHlgrniv0SQf?=
 =?us-ascii?Q?ksqEzXOHalAS9aqKLJO/TnflJpNadVpqjs7APXhfN6yvfgSVD7Bo869SQC6d?=
 =?us-ascii?Q?bU3SigVv/5sJ8Fka1K//tL4xZUxBf+kcjCBXboX+haISAbzQqyxofV856CoG?=
 =?us-ascii?Q?WGdpDx7hkaXN05ig3kM2cmlzWOTdpDe/xbv0HaEC67LvuLN4mtqfuQtoRGPC?=
 =?us-ascii?Q?51uL/kXt8/jjfkIcibhVhlvmcW+HJFORU9dX3ZXiYWoAhl7TERTpiEv6Ar5/?=
 =?us-ascii?Q?+GsFQcVlafx9yji4qT1E2JR38/4rHYgikJ1XEAN+VOkp0VBxCJQFtDAvjGhE?=
 =?us-ascii?Q?g7bQW2I04+x2H8qD2fhmmXL3Y//deHr9aAiUTO0EHfBeCE+H6GzCMe+thI+A?=
 =?us-ascii?Q?21eMeBVXN1VaCsgTM+hTx688EwQ/SYphtwPtaqau+Fl28QrNkDo4XHKSKDKf?=
 =?us-ascii?Q?m6etfY7z6hE8sSmiPPpO6utbVD/jjaEEzW4+jF+sLY7NwJIZEDdXPtPigpuq?=
 =?us-ascii?Q?XBwlNC3/jkev+H98Gj3tzssBLBLbuTraZP/B5UrfNsrYc1McCczBW7Eo8iPA?=
 =?us-ascii?Q?jOK0mgUBDxkYv7sv56N+xE8I2ggNaGhDTG8wiEMMSX6wWAlZK27Ww2caYX6v?=
 =?us-ascii?Q?yl/sVB82M0WOm58MWdVswM4Lc++tpTK6GGXMtdL5GEEoA3Pv2nOaG6Njs3yr?=
 =?us-ascii?Q?02ElsdJNxPM4IBA0snB7CMmJELs/Mx/eP03/7gjr8ozw8LgsU67LGzHjQzhZ?=
 =?us-ascii?Q?O4FZLk7DbcvBWKY3AC2f3O1aPltbvcZKkPnko/zQGLdbmbhRb7gqAUvQWov+?=
 =?us-ascii?Q?5zAU0zNNBIkZGbOpgNi69FPsMJZyE/d296+/09/ktC8+ypWPO3AS0iR0ULbg?=
 =?us-ascii?Q?7CykUxPGHzSCnvRywcUnGPBQqfmTWKug9+GkkUYXdI0j4ESaOfhHHHfv2ZDu?=
 =?us-ascii?Q?zHiQNM/5u3dW9G7HtJUpHFr+BWg4UVZIUqeF+hRQ5hBPnPo5BquBzpOZO/up?=
 =?us-ascii?Q?KRR9yX1jpfY2q5o7Jk4lhp9OjNBx+5gNFcZs7wVwAgRCobJAIrNL+F4r/jmC?=
 =?us-ascii?Q?PWs78IyAtoFmQVn88SGMSP711gLfkpUELBNYre6uVtPmE3DU4Ho8HJSgeZb6?=
 =?us-ascii?Q?ATlbforiPQIO5h7FSCklhacx6vBPg/x/1f8tJIQbWHHQJravNPYGaBIyuiXh?=
 =?us-ascii?Q?x6dkViqKxtAl7XiA2NHmQb83Ak/L8frpWy0g9D2ghU2zIIqqIp0a82c4tanp?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f7067c-5004-42f5-3c69-08dc074a84cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:01.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6ThyL/gGuzCIL5ShQGoCyYyPR9bKIyDFjENj5otr4HmYrPRJMYOYcRQerK1QPsNCI4L7qioWcfmyzPSLA9ScQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
index dc3721bb37b1e..ee9b6612eec43 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -140,15 +140,43 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
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
index 45114e4e76a5a..f599707413f18 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -411,6 +411,21 @@ void xe_pm_runtime_put(struct xe_device *xe)
 	pm_runtime_put(xe->drm.dev);
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
+        if (WARN_ON(xe_pm_read_callback_task(xe) == current))
+                return -ELOOP;
+
+        return pm_runtime_get_sync(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 67a9bf3dd379b..d0e6011a80688 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -26,6 +26,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
+int xe_pm_runtime_get_sync(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
-- 
2.43.0

