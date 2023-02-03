Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7072FC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5D010E08A;
	Fri,  3 Feb 2023 20:28:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9255D10E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456109; x=1706992109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=edCej0iQHCWIjfQBSf61uehZy9gxTc/VF32hyIfekSo=;
 b=XdLYs/RmQMZITCatlEKlM6jS7XeFI00TwK21vY3nbct8Hl0XoRMvWcnN
 jyS6ItzloqDS6Sf6C2FxiJrue5oJqU7Z32HMqVzFZTxmqAFr34DlzbWal
 vaIKwuBewtANxofi3ZUDjM7W61LMhNZrJpax4uVhfCKU6cWHBF1mCLlOP
 FPos0lB2qhpLK69IoWOYOCQ4J4KrZkZoOJoBAH6zemkbUtbBLDRdnaSha
 nKMILgrHXlklDYt4LkV9OQ4yETXi/ojP1FEccpiWvFmWYXOnA+dCFdOSe
 SKsxUpOphYFdC1qVC1iws9ilBWSPWl9/mU682CKEp4YqGFnnfM3AA7tbs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312504024"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312504024"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789810557"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789810557"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:28:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:28:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJGUanAewzjtUDyZDTtlv0L3o5Uwv5kkeRUSO07o5vCE9L9b6oER3QvoIrO9W7khqYmQuFy8eRB1smOQOMl/k2LXN5T/gZRntxvBqCwtyoVQ6kPgjlguW0/ABwRH8aJknnn2431Zaz8YS+MrzW1sMbfLOzLkxygnCS0CQDHWUQETOKp7Ws//A5x908ak95vgqlciEwymEbwa//jLguqLm24p8ja2IUVqW7G86gIhwwXJ5+oJ88/imtOSRVRc6514rJzcq4eKBx80YYtQapPwDJXuDBGwa5LwZhl5tiawc7GV37WJjU8tAgfXZkbEq3LzLev6nPk3YaKL1A9cyZ3o1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFnKoCzwrzKAeEXS9vwhTS+hvxqx0mMgnDTcY/6PGFk=;
 b=PxfGhtQDLy9y6kpDQGfchySIXNWiVggDvE+GtmVfJnvTxNSt6QLmACW/4B2uG8VBNFhO/xVX6Y+wvzKY00ch3D8q0VROAlAyEXBEEYbLtOg/thv5Bvvl7p31dWuzhoi+on8UmlHPapQN8AOEtDIPSf7Hoga3j1Mbfk670nodZqEIoQr+MQQtvf5m8MWeN/BU3GTVeWRMUuctfEuWcy6WfohgluE9CxGFQezyVAg4D0hHCxjwbrnoIdERpSVWL/EBltNeFsM021gVlCFS7VGzqNyz/mv1r90E4PFbgVvhkcEOQTEJu2WxxIN92aE1Br96hM91R9valROKNjmsvAXypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:28:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:28:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:41 -0500
Message-ID: <20230203202742.577659-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec53f1b-c705-42d8-d734-08db0625290f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HyclvxFiYiiahm1nNlu2mLoLPkbM7heJR4io+JrrQQrX/Ttx5Tk5+b+IrqNIDUoh4SMabWGeWyT1mVjce57C3wZXXRHQTDoS5N+TKLFSxfSjY4HZ9DkSyKPMj+aJZ4WplRf/auGp+tK8fbRkM+kwa8oVkXqt/sOaQV5ZtVm+QRXkw6bkPm/9o2zCUxXI833AbvTOQZWpCK2Etp7Kgv/K29H3C+5WJhIaTKbgBb3oC7sHAD1kQLB0EqaJB4OOIFMMjYC04WSh/8sZ1gk9pbBmFMqEdVd6ryZm9bvGlYjw+d/MXkBElN2kKTnP75uQhArS0YUs7PQoISJDdErCjIhwh790u8ze3miENw2d43Nv/eUihdo1wk/FpbpzVbxuq5GqSzldBssM8vYgCnqQdEGSmOCQ7uzkr2vr+i4hdoehrXVJoDR4w9AMo1Au6I3RQnALy1kipeihbFQ419LRIIgF5qbtglyKNS8+/RaAfaBzsW9U3ga90w8ghBGYW0enECLYglbUFkKJ/J8oxlJaenXETZlSTIuxqQZAg2o+l9xoLRyK5YP3gO5AHMSk33no0Vzd3El/ogdP5d6N92w4eE3sLum3YbYVWo0P9nD+fIIkWgFzomoJTiS0iOAENPtTBl7+6T0++L8Wo/ceICtK+mkuVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199018)(82960400001)(38100700002)(41300700001)(107886003)(5660300002)(6666004)(6486002)(8676002)(1076003)(316002)(86362001)(54906003)(6506007)(83380400001)(66946007)(66476007)(6916009)(2616005)(66556008)(478600001)(4326008)(6512007)(44832011)(8936002)(26005)(2906002)(186003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFDSDtYIlvRndC5jRbOWKeQ+7gfSMya/6v3HoJuuuVbIfczea0sKiVwH375O?=
 =?us-ascii?Q?j/AInuqgqwFhPsmQQkt3/SRQ9YKwLAEGLINAAfpIbJiOi6QeBZQFAqBsVadA?=
 =?us-ascii?Q?Yh/zkMNUXjaovMOrBIuv7RV8mVf/mTiPKAd0wOxi6iGqoA9IeOufO75W6vrz?=
 =?us-ascii?Q?w90KgMBd/UeaYgLJ7/0/gO3TUjIdIoQ2Z3ib86WnZt4kTSu+hu/CCCseIpmR?=
 =?us-ascii?Q?3l5fl/hVP7J84fkf8LO0UcfbyEOG1qZLJ0v0YOiP+75t+O5fdnlvwTNDTeWe?=
 =?us-ascii?Q?aZQYcL82SHLskv9FdC0I9ztnW19GHTu8lwUAOxXlilYIdBOZy8+FuPSYYVqC?=
 =?us-ascii?Q?RAo2BcKS1KJn0fi0RTuI2JzOCEUIWzS04qUC/MAdylQeCaFF98pjXIDbs45k?=
 =?us-ascii?Q?AoNmNuu5mFrqcdfEfiXPMksgBqzcBL6Escp2LPW2Fn++RyshdLT+rwpdot+E?=
 =?us-ascii?Q?fuO7K0jgjAtP9k+zfHlYTHXBSa3UMahBrKQpZzXuIdUyaRQjpeTsQBZqESkP?=
 =?us-ascii?Q?/7pvbF+TuRqgNKc3u7UcdaVsLYfOEDF2WQcLwpC75WsWiuKNKzj+Y3jk5lM4?=
 =?us-ascii?Q?wp4Ni6MCKREtXrNOqJe/x35IYXth922ldF1lmgLIqI5TJwvEMfrXTD54yNIV?=
 =?us-ascii?Q?Stbd0UHwKXJ305ZusyYFk1zoi85m/V6sDPrB+3F9jnxqIu7ZfS+jIJHkkOGd?=
 =?us-ascii?Q?5q9sSmi+T+BH6gB+lFCQztp2R8Ny/YbGRtpumP7Rzniyza++QSLeJhnBLdAM?=
 =?us-ascii?Q?3tpOgsm4QI12JbhlL5xfiqfq1QIlNGadpD5io5S67FQp87cXf/A6RXEGTqmW?=
 =?us-ascii?Q?u6DWtGIrE+K1Hsg5Ij3Ho+Ihm5U2T1TZfVebMqTP/RpWqHDV/EIyOjkbbxFD?=
 =?us-ascii?Q?pOPuWDZDqwOBxdyuLMMRBR8jC4O0hEXSwzP8U5arps/Rf91CXEYB/1rNJ3Aj?=
 =?us-ascii?Q?k/KCaeh2Qb6FxIarPZiFI5MBtKZKOJTzndmD5PuG41CQu0sBAs0F1LC4DRh4?=
 =?us-ascii?Q?Q5pZJRmbSy+EfeoqBfmZ1RhKE+hgqXjWlYBBzI6nGg8nc+YX8aqklxHzshSr?=
 =?us-ascii?Q?lqytwb+Llx6yLCQofqMw63ayVmzfPn3S1r65Fg8qpquLEQY+F8dHDDZJBxsv?=
 =?us-ascii?Q?IjL7tF/fmCdJzfYehXxvQWd2Ff5MxHaM6iYvlpfSSzkoSqbHHU2uOo0OCq2l?=
 =?us-ascii?Q?uZCT2xWaTFpn6oq7QoHKtTZqUB5XashMgKrNGE1tMYFe7d8ejg+Qfkxs0U9p?=
 =?us-ascii?Q?EpTcyv+nyENL8qfU1Y2tJsyEeepcClHgdVIebCWmdhJFe/3KESFxz5kxQd5r?=
 =?us-ascii?Q?6Q5D+u/AT0H3C7LcZCNrau/+55CWz2c90B53zBaygI6FQ3GT3HTxK9n8a9E4?=
 =?us-ascii?Q?uU5Nyg+u2tkmu/u21IKyFKVl+FGyn0+EYPcVNxpnx4+agw1EU0sq5g3bsFSr?=
 =?us-ascii?Q?66fzwgGqyRl7JdQ9K4edx0HNqn9EMazBvo+mNYCq10hRZn/SKfx1mR33xkPz?=
 =?us-ascii?Q?f7dhZ+qaiciuwBG6w36Ptj0QrSfQ3oRcQMV56PB0IY/X3MNTlg9kf7TisUqD?=
 =?us-ascii?Q?2FZlkHa6K4q3LvYrH80rIhZWA+2Yo6iqtPRCWpdZpV04Rz7ILAr+Jg3Z/snr?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec53f1b-c705-42d8-d734-08db0625290f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:28:07.8642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5RlJkopN6zxgTh9KkKfDuELEtIC8fHGi5NHHcx610rW2udn+/zIGtV/C5Dfhq5DizwtzRSQek+TOPjNSP7qIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 5/6] drm/xe: move xe IRQ-related display logic to
 xe_display.c
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is very ugly to read code with lots of ifdefs. Also, it makes
harder when the display part can be disabled in runtime.

Move the IRQ-related core to xe_display.c, making the code
clearer and more modular.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 37 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_display.h | 14 +++++++++++++
 drivers/gpu/drm/xe/xe_irq.c     | 37 +++++++--------------------------
 3 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 8d83b7c34ad6..262d8e06b51f 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -187,4 +187,41 @@ void xe_display_modset_driver_remove(struct xe_device *xe)
 	intel_modeset_driver_remove(xe);
 }
 
+/* IRQ-related functions */
+
+void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	if (master_ctl & GEN11_DISPLAY_IRQ)
+		gen11_display_irq_handler(xe);
+}
+
+void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+		intel_opregion_asle_intr(xe);
+}
+
+void xe_display_irq_reset(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	gen11_display_irq_reset(xe);
+}
+
+void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	if (gt->info.id == XE_GT0)
+		gen11_display_irq_postinstall(xe);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 79aba827b254..11f98ccfaf4e 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -9,6 +9,9 @@
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include <drm/drm_drv.h>
 
+#include "display/intel_opregion.h"
+#include "display/ext/i915_irq.h"
+
 int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver);
 
 int xe_display_init_nommio(struct xe_device *xe);
@@ -27,6 +30,12 @@ void xe_display_register(struct xe_device *xe);
 void xe_display_unregister(struct xe_device *xe);
 void xe_display_modset_driver_remove(struct xe_device *xe);
 
+void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
+
+void xe_display_irq_reset(struct xe_device *xe);
+void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
+
 #else
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
@@ -55,5 +64,10 @@ static inline void xe_display_register(struct xe_device *xe) {};
 static inline void xe_display_unregister(struct xe_device *xe) {};
 static inline void xe_display_modset_driver_remove(struct xe_device *xe) {};
 
+static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {};
+static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {};
+static inline void xe_display_irq_reset(struct xe_device *xe) {};
+static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {};
+
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e1cc057f50ba..7b7ddd11c2b8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -8,17 +8,13 @@
 #include <drm/drm_managed.h>
 
 #include "xe_device.h"
+#include "xe_display.h"
 #include "xe_drv.h"
 #include "xe_guc.h"
 #include "xe_gt.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-#include "display/intel_opregion.h"
-#include "display/ext/i915_irq.h"
-#endif
-
 #include "i915_reg.h"
 #include "gt/intel_gt_regs.h"
 
@@ -298,19 +294,13 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 
 	gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display && (master_ctl & GEN11_DISPLAY_IRQ))
-		gen11_display_irq_handler(xe);
-#endif
+	xe_display_irq_handler(xe, master_ctl);
 
 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
 
 	gen11_intr_enable(gt, false);
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
-		intel_opregion_asle_intr(xe);
-#endif
+	xe_display_irq_enable(xe, gu_misc_iir);
 
 	return IRQ_HANDLED;
 }
@@ -393,19 +383,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
 	}
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (master_ctl & GEN11_DISPLAY_IRQ)
-		gen11_display_irq_handler(xe);
-#endif
+	xe_display_irq_handler(xe, master_ctl);
 
 	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
 
 	dg1_intr_enable(xe, false);
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display && (gu_misc_iir & GEN11_GU_MISC_GSE))
-		intel_opregion_asle_intr(xe);
-#endif
+	xe_display_irq_enable(xe, gu_misc_iir);
 
 	return IRQ_HANDLED;
 }
@@ -487,10 +471,8 @@ void xe_irq_reset(struct xe_device *xe)
 			drm_err(&xe->drm, "No interrupt reset hook");
 		}
 	}
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display)
-		gen11_display_irq_reset(xe);
-#endif
+
+	xe_display_irq_reset(xe);
 }
 
 void xe_gt_irq_postinstall(struct xe_gt *gt)
@@ -504,10 +486,7 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
 	else
 		drm_err(&xe->drm, "No interrupt postinstall hook");
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (xe->info.enable_display && (gt->info.id == XE_GT0))
-		gen11_display_irq_postinstall(gt_to_xe(gt));
-#endif
+	xe_display_irq_postinstall(xe, gt);
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
-- 
2.39.1

