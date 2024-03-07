Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2592C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A39113608;
	Thu,  7 Mar 2024 00:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqHzWKs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67699113608
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770593; x=1741306593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=efORqW9DPexTXL35fJhr4a92UrMVGGjeC6PBuyDaaR4=;
 b=LqHzWKs+ejmkYoDIAqUjK+L2W19gnwjZ6yIofV3LuoCSOq/vc9EUKfSX
 Jgki2HZu03pn86tKqO3S5EKUv67t49M4irwYBUggtkzOCtW7/UpSMekvQ
 y0fDayj5Lx6YWIRUY9M9w51MxE++n3ChsXjptJ9IRjVABF4Km4fKN4I0Y
 dZjLOx1ob5+tbXyLGmlxU3Q3k+Kp1lV2MRabC7fTg+tb+OJALnSu6Uael
 JrYmXhGAmT0dqahD7LKk4tUtuJ6OUV2ZPWfC8QtU3o5oc63UCbwmVR0OF
 OVYLirPXEYq55DGfk1Q+30pnBgQaGp6mzJWmQuxBepCFThUdmgjpcZdvs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4350867"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4350867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14576869"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:21 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eob+sE2dCwaVBgxCtpc6zo8BiYjmUbtPBz6fBkZ41op+IZK3lKDTQEnVOBCEgOozeiijhz3phOqLU85Qkg2qJH2Nu0oGIaLLXwXRJ7O1gJ5SNJxnKk7ALkhZkNyhBePLYRXDFL+YjARFbnHuA+/GoM8A3vYoa6rbMV5F91G4ieAxBtpFp9Y7LcDf5bWUD8LPWUJ/QzM6rLPZ0DJ7FxjKx7fglHdakvPZssRDYpKb50Q8vNNLBooNrqiuinYIcKlAG54Ulg7f1FwcTU14zc+zwneVIULprVk8Dw6Ka5ukzuu8WHdIX2XvmiPzj7mXFj/QxnHKe7XUvxK7KteamIafag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghQD6frvWmPnHI03RBWR1hECZtqYAp7bLYo2INgja+A=;
 b=Pff3jXqW88WsU0TMQEGa99kKKVVu1Lf9nqjxdRH2QsM8d8we2PoKVznk+lQ0iQWYyN2BNEhtGPoTo0mt4wBFjvGlfrluAMklyc1jdajKl6CKcNcUkBHAMiTwqMSyNMMoFeZq6h48Ms+ZDDuzqfiNelDtQaA23ApddGJBngWrv9c26aV21RrVbIaACToA+2cnQUjRyMqrX5ja5zgb39zpkdM3z1DqAYRCeS1bwpcjUULvAwxJXaJ4XZa/RsBZtUrkEAfiGtfLZLHrhF66c1L8RcJNHSsnRyXkjIH9H83DdG8Ftr9jjDxRTm2E+Qjw/IrOcxiBKK1F3w0KnsmG2CNWiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:16:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 07/10] drm/xe: Introduce xe_pm_runtime_get_noresume for inner
 callers
Date: Wed, 6 Mar 2024 19:15:51 -0500
Message-ID: <20240307001554.162153-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e14019-d2e2-42b8-fa40-08dc3e3bce13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQ3Py/w0WmsEAbOTAqyuLqHzRWrWVpY7UPZRJFOKsSmCfx12/yuZzcpufRJK3CSbu2rRIZ673kK5RVvY1VyLxkphZbymXOxPYjlQWK4YU23XU7yontAcMAPTZex8IP2uuU0eTd9xWox5tdurTeN67M9nCTI7UNGXyAPb4n/RszuvzLGEJ/2O6ZQHEz7gRXtM9ZGRUoon++E32zZHbvz33SyeIqCllEnoOqynTq26SaeKVCQk0iwiHUnAgkxfgRaXSpm3r3TygexO9WEKShWjmJzTMtcCKY6ESbRcBfsiMKqNDaQ7Y/9BnaluMymkFGVIiBRV3au4PY19ZI4LB0OGjAVc7yXcojqZdG0EFe745szB8WzFFn8e1wg9gmigc/OCICA+JRAeBZXduuEqm0FuWjuab33UItDcbhzpfUDLxMMUR7zc0QxLLATWFq5BuCyaNZdq8kK7qDDZ3MpaDfon0TUn2qOh+a05mGYEnvOLesGoVu7IUq5us1qZrJbfetR4CpNo2zKPjtvJ7TOAuz8JGPE+kig8MNS4oX+OMhARzRjOSH1tt+GFP00EV8i54m+9ZUkq82MpfVz0s0BoMgM1rl5v3ubMThCGmDX8sWyyQXohPxwnRA7OMqru+FAAeAByubb7fRAfYBI/eyUnYJA63UixKtWCfknYW6uR87Wy8KM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?znFnkeqD7tw6XPLk8SGKTlI+PUuzWOqgDNJ0R+YwJ2DzFFla+HmOnN0PQkh/?=
 =?us-ascii?Q?Utns4i9MZz5VeOzYpX+UOfLJILJxedwzTFDo3JQocLMuKDcSoK+SJMxK8IJc?=
 =?us-ascii?Q?hZeAXqE6SuRQ5zOgdLmnh8DOgjs/VdWdygzOA5TDcFNW8WTLY15dY8M9QJp9?=
 =?us-ascii?Q?B+GC0h7Exvbn1rcbEI2h/V1DiIZHzv5IWNxzuQ5jk25rwalrLauyXR/bpZrW?=
 =?us-ascii?Q?vg9jAgVSTY598CqvFmIZ4Syb3P8hnTRaDq+w6WgGIOOL5vVGZQH5+qWOzf9i?=
 =?us-ascii?Q?TEhrHF1NXJ9OFRb/NVmbGNqJaCpoAnGfiJRobhbxrkShAMqrEBKzgKdhLXIH?=
 =?us-ascii?Q?+bqP/BOq6CEZlXSVkI0zauOAX/3sfU5GAoOasxTzKUULsb/EQaGRDkcvYEF1?=
 =?us-ascii?Q?wMha5jKA+finLkD6htIbtrtbcok/3XzsJKZKlo3+GfGrtfJ5BDYpmTfWAFOm?=
 =?us-ascii?Q?S90u/86I4REWRNUa1kgFbrm9uIV3YW7Qy6YdhIWnJs686/QncTiGI82DuSMQ?=
 =?us-ascii?Q?lJsLNvgbR7gggQTGzGSnE+WPwr5YV2emSbNZwezGG/y7qMRl7sAZWDPpyLOL?=
 =?us-ascii?Q?vsfag3CNWnmlZEfhttUDHkdv0UUQ4I4Mn4HhKWes3qtHyqPtuoIiEQNC3iXo?=
 =?us-ascii?Q?gU/XNVplXxM+mEFFJk3PdQymRbp0BhkkkA4Br4VK1qL+Uy2U+EvyTpiKkdLI?=
 =?us-ascii?Q?JylAPqAU68+gIXglH3Uk5JiGKugp+7pwfvZ48eTtkRVGJcPYtOAIY+A1pvb7?=
 =?us-ascii?Q?dL/frnVdJOgvkvW6JNm05gXOZjsJIK8ExkIIEPlSG9OJOAYWxxb7N3RfuUQR?=
 =?us-ascii?Q?/Cmpkh5ISaJK+GBaXcjcTDAjEObBPuuzcTpy1zKkDpXF1johb7chauh6y0uk?=
 =?us-ascii?Q?jR13IZATwYP6hpxObJwhH25iKvwkMkO9AmJRvw8UNW2MtM4JvAr8wzYrRU3g?=
 =?us-ascii?Q?FcuvAf1kDh3tilZltDS+jfTQ6d3vKe256kGz4EZeSCA8XxYl76xUtacGsM35?=
 =?us-ascii?Q?6iVfrPIWfhKjEW/AIaCNL8riGMFpR3pV9Qkoxx7FYj9/J5CaFZ8s6DhQmakj?=
 =?us-ascii?Q?0ZuClymuAmwqKuZwopLM08tsdy6FVbebA38pFNPFJ1vPdc9179Z0HlbEqU4r?=
 =?us-ascii?Q?RCNWvhsROyWHVLiQcwCqs/4eq8NF69r33VJkNLouhi5w/zjHCUnuLqV48ve5?=
 =?us-ascii?Q?mz0jPveEYdRsIuYYGeEFTWpz/Gpnjj+7vfB54lVV646VZa4m0t6EbSnXIBiH?=
 =?us-ascii?Q?d3oA/KTGQj/9fDOzlCVZs+tM62XKBhibbqE6oyw2Bl4a6xXokLjbY/qEt57n?=
 =?us-ascii?Q?LwtcvdEezsdNHCKiVe9Qazt6kQm83Bz58Z0vDEj1HQ1pbGoESVLUgUkUNCDl?=
 =?us-ascii?Q?A17sXSG2VXofbfBR5f5B6ORMj+o8A1gcHiHoZFGysSghgKFH1cT8RLfGpf4u?=
 =?us-ascii?Q?akTS8dEzK3DazHwkb0qFJFf03S0aZJTupoU023Igw17+tEtbxW5Njg8vrDn1?=
 =?us-ascii?Q?OlfBEzgnf62XfB3wVbrZNusLfjABFCm73wZ864j+jk9VeLlSe3qERFQSA87J?=
 =?us-ascii?Q?3v5aKIlTBsnoQSRAi0CVyIWDfGjXSVZADe+1ur13gM8J3lvZGrFt9pI9dzpk?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e14019-d2e2-42b8-fa40-08dc3e3bce13
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:16.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ7dtDBsWy7kbwV5fSTQx8F4MnnUQdmEKhf3qLMbRc0DtzyaG1WdwZOIDkZxrZVXavua+D59hsnDwv7muEmzrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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

Let's ensure that we have an option for inner callers that will
raise WARN if device is not active and not protected by outer callers.

Make this also a void function forcing every caller to unconditionally
put the reference back afterwards.

This will be very important for cases where we want to hold the
reference before scheduling a work in a queue. Then the work job
will be responsible for putting it back.

While at this, already convert a case from mem_access_ongoing where
it is not checking for the reference and put it back, what would
cause the underflow.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_pm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h         |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6a83bc57826a..f69a9c99329c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -128,7 +128,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+		xe_pm_runtime_get_noresume(xe);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index fcec3ad2c903..3e92f09b8d83 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -502,6 +502,26 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
+ * @xe: xe device instance
+ *
+ * This function should be used in inner places where it is surely already
+ * protected by outer-bound callers of `xe_pm_runtime_get`.
+ * It will warn if not protected.
+ * The reference should be put back after this function regardless, since it
+ * will always bump the usage counter, regardless.
+ */
+void xe_pm_runtime_get_noresume(struct xe_device *xe)
+{
+      bool ref;
+
+      ref = xe_pm_runtime_get_if_in_use(xe);
+
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	      pm_runtime_get_noresume(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..119b630ad1d1 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-- 
2.43.2

