Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229EBC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FE910E9B5;
	Thu, 22 Feb 2024 16:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0Zuwhgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFBC10E9B4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708619995; x=1740155995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OvCV7quQDAHvQr2SJOLi9qWvDio3PdBNdRBc/+6o+p4=;
 b=j0ZuwhgxY+iV/0lDEzYs4L96wQMwY4z98Y6uJBmu1i+InmRuufGNcv1M
 pJWf8Q4rilKAbX0N4LYQS5Uq4Ns+GhF6Adgs6BTEUNCbglVqXkIx+rj8q
 qeh/Mjf/3/T7hmXFI62mR8DM4Qc1TJ1UQ4LR9h4B59i11pfP9wqUkNgA9
 OwZf5b5RbO1DBlNF9Cx4vdnK9fy9L8w1EBSu3aomY1kCLB0TS1e7Opk5x
 TNkCOtTJxRW4VPIfYXspWwGpuFzmx741TQ1sJIK9S0nSN55nUPFaG0hmd
 Mxzt4P3IbSfJX3H3ZsVJyFjMTwIe6if9eR0kRc459nnW9p1NsNqPuBIC6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730635"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730635"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:39:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552815"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552815"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:39:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:39:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjFDzXD2WnN6gPZdf6I2rTvQ7QteurHk123WLNPSctnkhH6IPd/KVNWxr+YmY65eer6ZJB1hIAcNa9LMvs1YxUvrBkYsarGIH3EX1n6uoppuGEzf59mmrFtfo3JGa+40u4bk6fHlEnDsJ1gC/765j/hB9L6ut/wrMrkzVgenaNO7ne0U7HJzM86/8+dElVVs82xwG/oMQa0YJQfEoCjrJ0ZdeXlzKFzbq34ZRgA9JObJZT4Pr+5vHtdhTe8jVdk0wTIxXLgGP2Q3Eu0HhpAXCk5Hh7C1PKWixkicYx/YX8Y3/IGB1OBgq8Huap7SBg3+MN2z7KxVDelItSPPiMNugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMCQ/DHjYquyUzuSTmRJv7YI+73GXK8asr0ny8fgRfU=;
 b=gPRqeqlvGLeyXzx8+Iz4aX6NEqWSgl33uMZxPQGkxew3F+vTr82zUVVoC+0bM7lda03c2M9lWQHvV7by4XMgpzvPTIwSBnjLeBIF6LPxFxMWncU9YvgqPf412osBOIiLM2Dvp0sp5/OccmHyefkJnGnxOkwl2mPfYtv2NypwnVDyYZyS2B+CKKjNY9zlFTIJac7Dw2Cy4JlVmRphFQUAAMjUCFq9sOJ9G8Z2AdTHC65LB+TcxkLDnwRXhOK8YfTOBZC+iRxNMpNEjJJj35rOZDj30X5uYspnsL/tHSf0r/zXevYRQBdC3sc1dF1nYiY8JX1Zez0cMyFMJfOE2/4E/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 02/14] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Date: Thu, 22 Feb 2024 11:39:25 -0500
Message-ID: <20240222163937.138342-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd922cb-ab16-4acc-bc5d-08dc33c4e03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTv6nD5rXal8EDL0/48GF4GXcOx83/d1AKrS0lt1l2L2SiFi/EjGAYhLyCkEXwI8NptnHj2kUcb2hDq5YaWQ97j0ChMy7gWgd099bmjzL+TvH84XtiX84a65p7LaxaLTijXnRxAfmurSl/6FTL22xKsbTsjH/9YGvk0rFdf77oHnvsU98m/zULYcnnv9/b3t0UkULlPo1xsvAEe0Rm5+X8f1QaNg7H/4QeJ5DQK9mJQUhdy/WFxO1HvPveJvhFT9eFLdfySBzqjsbJ6ie/mj35yBBGbZbuP98GvOEQpe/0wdqkUS5eaXsibQPhQfe6m4/hEpk8NUX6V+X+AIP7dYw9cNIhiuEDRWpzNvPLmbJdJoifDu42EWvslcO8XPzEspUk56X32cHxkLJjmim2tcLrjaRCK/Gr5Q6iBx8B6O8QP1Hw5tm5vhhc9VsSdYUIzkeLjbvD89AUX/TqzV76UY4fyx0m/fvKc/XS6krr0RwuMB04H/KeIqgzF+DxNbbqnjr8Jur/14WorOuVuOyJ6dPpFZSkHpFakVVO9Yw9yI+QfbA8VoQeRZXQ3GCctXaYvp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1QohQQ+GdElqbvF9qBLW5m4T7JhW6H0nOt06LPRX/JOmlWytM78hd39d5T1?=
 =?us-ascii?Q?CGgMwYDq5fZvUX/5Flt7/w1A0fk2h1XVWjygLVQBraBtmGQHGzJAWJwjbbeS?=
 =?us-ascii?Q?1kMPe3sSJyUPcPkOzd/dM/pJ1M7uKzDtoJzMKL/A7PHjRHVLAzjUTFxrYcD7?=
 =?us-ascii?Q?cyuzFH69iL+zFP0bRwzk7X5F/Uo++p75YQNSOUgQ+i8cQSuHapykDOkUIRCV?=
 =?us-ascii?Q?TK3rVzCAedsglUOkpeABsG98O9Q90Lm9zZcud5JzWg1FjoRM/pFFCXbBChxj?=
 =?us-ascii?Q?o9Zox2bsvUhlqQeGNaOSUJ8oRuoCFFF6O+TM0Fy+uIPkqWoGarg8Ad4rBwbd?=
 =?us-ascii?Q?LFc55g1kFz942DhaA4CQCPN6ydPQcF29Kbz1sIYMedvM0Lfs6t4QnYO/A1YB?=
 =?us-ascii?Q?PLFI7Z/9ZrMhvMIv/VNOEKITJKuf4i4JRYa12HG0VOi0EJSM0aXF0smXQs7G?=
 =?us-ascii?Q?E1AOyf3NB8CkDhycn2+r2szA4TjyyCEuCXEfvXrqKdiuVkp1SqNweSqDcxFF?=
 =?us-ascii?Q?7Qi8OH3PiNv+LecI66LcsJ8vX1DTb6Buw5Jp5G31A2WElV9p1FzWp8lGqUtM?=
 =?us-ascii?Q?lfOec44sUekfGtk2t2rYloIgsDM1SgfP3LKl/b7fL9/G5SNwRzgynvTtBIg9?=
 =?us-ascii?Q?ruvijXDAJo6gAi19Q93e9GmYTgWeuSdjVdiHwPbwhViI1/Rmw/y9ojNOuJqy?=
 =?us-ascii?Q?QbR3QnoRdKc73p31Mu1Mn/slCCBorUi6oL/29RUSPJsyx+maQ7hrvJk6mFE1?=
 =?us-ascii?Q?zixMxbM2ES6R2sSdIU4YpvnDq4FNAcbA1cbx0DZMXWINM8Ce9njsuxkk87Mf?=
 =?us-ascii?Q?QrFnVGvEkkuOcyKRvsFSMjmHB6HozAP8yPu7Ir6NYFEpe5uf7TPp+r4YVxsw?=
 =?us-ascii?Q?Yb6FpbZsvJaUzMYk4BbU8YrmVLVF9I+Ko7IeZk9y+E01QxhCT6PKn5dAmoe3?=
 =?us-ascii?Q?VkmMlV78yAesBLBiKMggy0nCAHPDcCTincsF+Zs4e7PCmjX80lr1hEkdw1T3?=
 =?us-ascii?Q?uUL4fjOMmJaC9foLMTWaX62MJtKfa/Pkn1do70EhMfnzfDJfiBc5hAcncK//?=
 =?us-ascii?Q?FeFS8xFgVLPXKobIlETa6XddIXuBHHty3FEUZLnjyISoOnyQv3M+qLmrv/Vc?=
 =?us-ascii?Q?fIOrKe7JMVEsOkStc3dfYV67sLGKNg+knfRaZrNqgDAk5NnjejLaj7HS9f1k?=
 =?us-ascii?Q?kM/63iS9uU1FHaJkfsXtKY7lzaXHOdjTJNxs7hNyA8uogP9p5n1if3oBpXqm?=
 =?us-ascii?Q?uvdd+n0vbg0eouJ3CmVBCYcz3cN8vIfv36j6XF2Yq67J86XP35gtHEEvyvjs?=
 =?us-ascii?Q?HXaRGDrRq+srENYOA7p5H7a7FHjOB5DLm0dJhIj6mVKSyBmjWXq23wfsfs+m?=
 =?us-ascii?Q?84Zg9EVrvG2JlM7Ewf3hE4GejQO6v+L1B589O4SzvY5XNPSvlT4WKeHSXJ1p?=
 =?us-ascii?Q?VGROW1cKDiIEiM5EnJrkbJmhMZbqbRU7Y3/WjHR3U3jh85PvorBMrz+CAsSZ?=
 =?us-ascii?Q?Or8e4sJIGx8WqihmfVoQq5G8HHEzlzU6dYuGC+CG9mpghupWaYnoveAsHBWq?=
 =?us-ascii?Q?eMJBT4bYsIk6uRsNNUKT5WXnosxNJZaDZKw4whS+8c9ODLi0vIZVhz5PQn2V?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd922cb-ab16-4acc-bc5d-08dc33c4e03f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:45.1481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXIX8Q+f4wvOAl7fSwyVRhSqjTZ6YQ3maFjfq/HmpIH1xeqhVZhP3o3XpoBKbXwr0PlCk1JGkQpP84/LkzU5Fg==
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

The mem_access helpers are going away and getting replaced by
direct calls of the xe_pm_runtime_{get,put} functions. However, an
assertion with a warning splat is desired when we hit the worst
case of a memory access with the device really in the 'suspended'
state.

Also, this needs to be the first step. Otherwise, the upcoming
conversion would be really noise with warn splats of missing mem_access
gets.

v2: Minor doc changes as suggested by Matt

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ca85e81fdb44..049bbca6ed56 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -620,9 +620,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
 	return atomic_read(&xe->mem_access.ref);
 }
 
+/**
+ * xe_device_assert_mem_access - Inspect the current runtime_pm state.
+ * @xe: xe device instance
+ *
+ * To be used before any kind of memory access. It will splat a debug warning
+ * if the device is currently sleeping. But it doesn't guarantee in any way
+ * that the device is going to remain awake. Xe PM runtime get and put
+ * functions might be added to the outer bound of the memory access, while
+ * this check is intended for inner usage to splat some warning if the worst
+ * case has just happened.
+ */
 void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+	XE_WARN_ON(xe_pm_runtime_suspended(xe));
 }
 
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ae220f21acb1..5289d8c0c3b1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -261,6 +261,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 	return READ_ONCE(xe->pm_callback_task);
 }
 
+/**
+ * xe_pm_runtime_suspended - Check if runtime_pm state is suspended
+ * @xe: xe device instance
+ *
+ * This does not provide any guarantee that the device is going to remain
+ * suspended as it might be racing with the runtime state transitions.
+ * It can be used only as a non-reliable assertion, to ensure that we are not in
+ * the sleep state while trying to access some memory for instance.
+ *
+ * Returns true if PCI device is suspended, false otherwise.
+ */
+bool xe_pm_runtime_suspended(struct xe_device *xe)
+{
+	return pm_runtime_suspended(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 64a97c6726a7..75919eba1746 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -23,6 +23,7 @@ int xe_pm_resume(struct xe_device *xe);
 void xe_pm_init_early(struct xe_device *xe);
 void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
+bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
-- 
2.43.2

