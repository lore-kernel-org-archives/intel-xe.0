Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE672C48BF0
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED3310E22C;
	Thu, 15 Feb 2024 19:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDqbw+Bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDF910E651
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025688; x=1739561688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XrUu+nGIDMQS6lnlFaIIir7mXJ/ZXTQpQJKbgQl4jWs=;
 b=mDqbw+BgiogkKPpzS31tOuQKcmj4AOfLWfuwi+1CC18hZ/wM/TXngrts
 C9P8T0bcxGgpqilkyu6pvCGmqIGJJnmcEpihDOqzUWoRhy/k/8ryqPS67
 CKiLfEKKY2N0bvwP7PqDNadjPctMkZQrBpgwY2J3WZXBXWXk8y9uE4VhW
 qVhK8xKMfJpENqseYt14COTTaVqjs/PpyQGqWoD6Vjn3NCPLOZUGr9XBI
 8o11XDyDUm17Z6z66D2M8pr9Mz1UZOKoD3l243svpdVUbMAOBFiH+Vid6
 uoeQUubVjmxikeLkk63t+c392jQ7Et7+/h5sg1923zTiLNAnscV+C1N/U w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688045"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688045"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230421"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:34:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:34:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/qN0MSgDe6JePz2UOo3oBjH5p0y7FF+U4fpmdLIwkLNQSOz1FR05VfD8dmvJRTC6kMO/5q/DN38DWlQMuCwQOGtSKageWWv28H2KhGPh9HMsc6vEezef4UXtY1f8mQpyLrm0m8gKABkEjU3hNCnmJTNHBLUoaydCcI/jpGx3vV5MxmjRixjrCzqfyds6X2QNRYBcLBflmpDrLPE0CrGBhrpcKlhu2gAiFoxVAVlsinpeZGtF8DNPadlunIvgjcvHERFj9d0E6DI5QAzfxCHqePXW5vifJfnBxkzY8X3C3VZ8iS0VsBV0OoiUsbsGY7d9AROXNDuk/2tULukzNl6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayNiLGAYHeAerTPDkMpmcynlOYuXBIjQB0gu2L5IRLg=;
 b=QeFyS3s9CHOqkQUXALboikKGAmBIlvGsOUvIbyA1FEDq6eaDYoC3nU7KDKw9VXxglhJH8lZcdqgu9Hl33MLE0jlt1qHa0BPe6JtD51wn3Vw7NzzpXMTlSflylFze7HrECjZZJm0UjAHTtjyLne+yZFRMzRP25xcn4bn00fbrCCvhh9LIXFzH3iCuzxC7JrCS/qbmkDnnH2cjeA6agjSxg2yA6KnOM1voqNxzuE6i7pw8NVbf6Cf9CYsF0Inug+3EaJ7jsImusvNZM1Utrxw8aHUBgeJDdVhNBdomqDTCk0Z6iKeibaYgRPOJgRBXb7xHVcA11Ivpn2amzJuVnZEFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 02/14] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Date: Thu, 15 Feb 2024 14:34:18 -0500
Message-ID: <20240215193430.130106-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: f27d8688-1895-4825-5f74-08dc2e5d29e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9kv9xp4GxAs/pDKF7x0A53xTuD/e1GiwBRTYoEfcJNN7HSz7vlyyYvVGyWwQH6Y00AZulqT4Qf9LITPRAoadWMhVLkyvi4PvmSY6Yjuj4b4nWy1M2SGSMVI81+Aw/In8NWUgMEKKcAPKkxBU+JdBFQM3rGIGwatAVFxXFZXTR6fPLZfm7RWKyda3wDlQMC9IIUwCs/XW+jUhzw1D4GKAIQfvKLn3GqIjcZCcFqqMXok4ZSF15XV7RyPRazkZqLECRsqu4BTMxEHcHj8YI0CmgI7gu5TZd2WoOkivkU9WFnCd6NNtwWktWFyPBTt49qaWSeNyPrnc+YNPqF8/2riZkLnA9zedWZDZy5Skb/nUVquJsK0yKrABQS567Z7Ld1/jxlZYoe5FYFfGcCiM8z5m1RIGMY5G4I16LkEATfKImbP4hnqi5jW9umPbJfXa/BjmsSFWh0ERO7XOjH7kKzrHbUHrzJGXnTBP/QOvglh13fPhN9wsmhKARzGWlv3CZ27pUfGeOt9IkTj9lrswtS2kJ96bhHBnjjLTdgRY1hMP2WUMH2+5CmnDWy/5aMpm6V/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6KeyAHNBueJI1KhvPGPJMvjjdiHJPeEhqu7+vEFscLT4R/yHCzwbHTWg2g+X?=
 =?us-ascii?Q?RjmY3fHNnOwuwAt9bqlEluyE6U2y+kP6bA9vU3F0TDJM73pRgDqZxnl535bq?=
 =?us-ascii?Q?gJnD0r253Q7WbRVYy5m1eZrcDhmQlRq5eKn/B5sl3aPH+QYN8Aw8PFMfinsb?=
 =?us-ascii?Q?rViz9pPjJ6UNRPomMWRUEIIM4MFAMHG6fqwb9HC+99nInm73zLkTOefEIpSx?=
 =?us-ascii?Q?rT3rze4arnrkfoqfaifh9lLKaBn5WAqM9ZFeZt+8uqitM86WEVbkEMxm6x9j?=
 =?us-ascii?Q?KwAu7YXm8f/A9mJ0wweaQsNjXD/szDPSGKZl40ErOFRKP4SgksIQeW3kai59?=
 =?us-ascii?Q?lPmf+5OHNfPdmLboqT6sZ9q3DhFMHGrAEN+c9DQq6UzYw4Q3gJxJKdvMii8W?=
 =?us-ascii?Q?rskAJVF37oVdMdLYoxb66wiBGbf0lUY6p+umhAtZgzS4t3syyPHnTk9mhH6k?=
 =?us-ascii?Q?oGFqj8mg0nLO7jdPnDE8/Tg7XJiTbg/qZjgLYKK8KJJioPn+UeNFSJEqk86+?=
 =?us-ascii?Q?JK/8QyZriiHk4b+v9sUb3Gb+ZBQOwWeZXg5ncsRhEJdRoxVOHcluaXec3M0X?=
 =?us-ascii?Q?34S+t8TydpgGUtDm1xPDf1dsHPlth23lQngQW2F56bx1v/c6wxh7W+zCReef?=
 =?us-ascii?Q?rxG4HFTHIZ09f30bwm+QldR9IcixYb+euO2fKbCAp9TkaPdk72rOjwQalhoH?=
 =?us-ascii?Q?VbX8VVEHRvkof9xViq6wxhUHcmCj3HriZCqdH5gWCwztUQ8OC24E+TIYBPzC?=
 =?us-ascii?Q?L+VkLv3htjBPJzzU8SGhAYaloov4KGJa12aOGp2lV403Z6P0L9ruWUn/UMnV?=
 =?us-ascii?Q?FrC60jw9mTgTeqZEGNrWLB6lNpEm8gI1Mvrb0kkWycuDSNEwlnpe4XKIPy02?=
 =?us-ascii?Q?8lVWy7fbgOpbJ49tpg1H1hSQutidiDKKLKhqPc1mWUUjg9cYLlqN2nIJH9d+?=
 =?us-ascii?Q?TNRt27nU/FXyUkEVkGR6UgF9uZLYUZ/dx0OBDQQa6l63SBmZg5NqKdAwTHdV?=
 =?us-ascii?Q?1HQy9FR797fbgviHbTLtASqLHuNSpkURbKJoIXcMfAOr5NyoRisxKuNJcjED?=
 =?us-ascii?Q?TRfLBDuGr0dJkpDjr6sm0GgJhF33ZLNwLxq7V1By7jr3Edk3XHTm1Nm8x/9b?=
 =?us-ascii?Q?SbVABMGD+hGKN4EvC826LE32D5Xl3m/exe9oIDA8AwQLhAQapMZy8dPm950s?=
 =?us-ascii?Q?ghziS4oD0QmqMwZ1IeO9Zg0X+igiqvhEID1oGvSnIdPRCXp5CZYBdOJ45fvs?=
 =?us-ascii?Q?16D8Y7Rl/AVDC7Sa/gCKWLzSrtdf/1x2FC5UTTvqwyd3JrLREYfz+/o0ZjyR?=
 =?us-ascii?Q?W7QfjIjCv8XKsCUWSKQ3DU5FzaDDeIB4a/CvviiFMrwK7ZEAwN5jKL07lp4H?=
 =?us-ascii?Q?UtyDiU8lINJO1kpJ7psMci80mV9CMuSwsqTJ4sF0W+KVHGcIgDiSxv2Skc9Q?=
 =?us-ascii?Q?peRWOTb6jtOYZ72mo/zxoRdpJoXa4ckArLVyOVKYcAO/x/Wf2a4VNLOAaCqN?=
 =?us-ascii?Q?z122PKa5XNCUCdITCUfQyclzZZ4cFAKuCZ5Tb2VIUEkVOQH46IhSa/iekn+q?=
 =?us-ascii?Q?iucLHrX6wtBO/mRo5CweC05HjhlAjhDuFHEp85EN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f27d8688-1895-4825-5f74-08dc2e5d29e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:45.1526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C5JL5VW1Q+Oe38rsGxKrqhfDFSi0I4gLI8yay9vubC6UnYzlDJP4ipkXpDsSWx8C6IiFYMLAQ6BUubR6gYK0A==
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

The mem_access helpers are going away and getting replaced by
direct calls of the xe_pm_runtime_{get,put} functions. However, an
assertion with a warning splat is desired when we hit the worst
case of a memory access with the device really in the 'suspended'
state.

Also, this needs to be the first step. Otherwise, the upcoming
conversion would be really noise with warn splats of missing mem_access
gets.

v2: Minor doc changes as suggested by Matt

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5b84d7305520..641af3c7fd34 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -653,9 +653,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
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
index 64ffb9a35448..d1c105f0eda0 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -260,6 +260,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
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
2.43.0

