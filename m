Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C4FC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276CB10E2BB;
	Fri, 26 Jan 2024 20:31:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680EA10E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301074; x=1737837074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rz5Tf8WQLKIEB/RdP7zbHUlh7e5ieYQ1WBjSQ4cts74=;
 b=TIgmHsmwAsDezGN6pWUPEiPYa5Se5QyF6HQVMGK428IQEDuOdhKRGFPh
 HY/yqbpsubA8mnXezzVh1VwSlp6qK7A1OyaySFmMOLQFzA2Srlx+/qOXT
 eOcdr0+fPk3kPusI6UDD0V2fx8R6jMDZpvMuFhP8IvEaaiHDmRE+cGo/C
 1eTPzVLvfNCPbCe7tBVWgqHFxeNiY2jUJ7ynmHBs+TjOseXTWna/eKYpB
 01Bs/ntWpwP1HgssscMWyQwpwGfpK90MEgs7LNaiXkazHckYjMqpRy93w
 CQRHk9ggM4uHefdGtU5qOyvdCuyChNLOTnMG7V19teq4emhiB/WmPOVYJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948343"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481863"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481863"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gndb9iLyEjCKrbjG57g7sQS6xGIubl6QdwnvrPSV6+7/p6Q+/ZPlvT0KpQ/KVYsRX3KM59EwAbOD/3Dlcozcwzg4K3VWRxBc1HT3rzPYG0+i8rPUWvO2GhCQqCM4o2L7neTD5sTQInhgyq5c3xOJRQtl5iHXrgmLkdBcEZRbCT2WWzQI0ydfZYD+HnreqBWZR09QPwTNLJwV7Dvkmg00GIjRE45m+o185BF3TALH6cPOX1wVtf4hSOJNY+lxd/w1XrzGCV7RuUL870KjnNFq6LaRnU7oHI0E75qgGL95dZ4iXKPfASSsTtMJCxJJOXIFAFPzemD3OBVKRD2V44QJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj+9u/UAVs+pmcMXOE/w+CY6VJaGQeU686ABZABeqLM=;
 b=XLZma1pnAg/7niOW/+IL8NvI8GYXODH/yONgt8vhDpoDaBi0yj7g3cF+/vIkK//Y9MweQB08dpz7Hp/2wOQSG4L8tWG3ScX4DfbbQVdWyhBHNXIn5ymXrM87VC7moEj1dr809sOA4qtg3g62iBolTiseRZCGo8xydGGZVW1UKtz3oSB5H78L1PG1V1y9KKMbqpURKPPEZbgFzlnQ2J1NRYX7ajOhb3499eMrWfwZYYVrB3PnMMFtr1gI4w13CE28lmeEoq7JWqEqcG88nmJOWc9GwCMM7LMOUQKMHWAY7XnKkU/PMUUFXiKrSH8XLjLtvNHxIpknbGLc9gOmtbS4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:31:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 07/34] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Date: Fri, 26 Jan 2024 15:30:16 -0500
Message-ID: <20240126203044.1104705-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: b113c3f7-ba3e-4da1-f2de-08dc1eadba38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgcsAVLQiCIXEbN1YTkOk92nwhFBTA63T4Mg2bXzylkKW+jh8GLGZuCWAF48wUyiAJiqIPIH5Hwk/mJsSTwb2RZR0AIZk0G4p7jduhKk1cJ+7vzAbebiXFiK8tCOwhTIX06AebOQxIa/BEDgSQz0aGT91w6ppYUb6Fr5rCWO0QHU83a/saQWTjem/0a79x7eQin1fMAqm23N6UKsGFzAAUoHWh+toySsrnPpCAXWMSgKBBdjSM9zSGdLrzVvivJPHoGyVVimv6ndAg4J1yiw2W3q2AiXUt17s0UmXyOQ03Xa/kIk2BuIeLHK5sHGkuL8krmCsxz3cn9QLlJO47V2B75yRgyerfgu82PRs+AJULoYA6zT6T9P3Tvw0boP3AKWGnhJ4SNnKX4go348M6sgPBQFeyKVQXE974dJWarAfrOGWysJ9Yxf28lRP1fmQHum1y2lH0qXYhmJ3F7qjOpXQTbe+C/7MAVZcZSPShhr+c1Zd1FneTn/JCpPMjaRNdwgP9+pqdCVwpFmgEpJBfwjS48Fl43DQ8a5b2R1Tfwj2ouI9gSY1T1zVEoBZJJ4Fjc815SE+V6vn3TwAU4ldGi5WUiwXQuaj9mC2vkX9xDVkFObbakZQw4y8G07+OrTzFeh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ofITVOBIXFVXXII0A6Iwoijly7TNAsz7m76PbXdsKsPOV2e3ja4PuUwKuIQ6?=
 =?us-ascii?Q?Y2Js+rQDz0KSv4S5pt6IFST+AX7qBkJrx9kgNlyXk5DhU0nfgMGNCsw6eUYT?=
 =?us-ascii?Q?GLPhV6N8wfEeAeHJ0LLRE/CHIQvrlEG3tZgN0hkfKKD2xio64kX4RTaEYfaV?=
 =?us-ascii?Q?t/K18iHkmr/uUqyZ98SJ2pF/xS/lmdsUnrvZ3bFVYov+/WWlXQJ4ZrqzWAlX?=
 =?us-ascii?Q?oXv38zY8HJW9y/FW4+l9OOcImnBZImyfpb1bLI3Ecycw5N1BlywGEO4ROu1n?=
 =?us-ascii?Q?QRUGj2/Bq2daroUGOOmjzFl0z7VuEGSlq+8tr8TAZX2NQdxZfTVd9IGnNiLZ?=
 =?us-ascii?Q?mCH+5o76uIBKmppbBC9+8Hf+r7eePRp8AiOOrbzxQtwLfEDvVT0b1295tPSz?=
 =?us-ascii?Q?z/w8jyjruEJXuEKdo3s4boWmANkeUlF44DAeqyC20BYehrXckKuOL3/9CsZO?=
 =?us-ascii?Q?yeqH8zmBc4VxWzgZxQKLypRO7i/0zF/YdpgzFezQpQ+eYMCgVdnOggeDpx0D?=
 =?us-ascii?Q?weIVblVFhsPYp81CRmZIvVtKR72xeJhzBDl4PzODSevXNaaL8JkVXfmMx7Up?=
 =?us-ascii?Q?b8LeFGSA67ocSWxQQ8l6UoqICt3Xdo52+U7qBUxWu5VtA0k601rNgUay1fcq?=
 =?us-ascii?Q?JZbWA0G6fYoZR8k6tEMMNbaLCrnexy8MD6xCf6wTkdMcoaIgYVWgGugnELhG?=
 =?us-ascii?Q?XbWOS8D96QzYZWTV1RljGHaUwKUKyfgtnra3A57LGATIFMmTWqiKdp8nWs/Y?=
 =?us-ascii?Q?PzSPMURCXYdqM9KZlhyNrc35gPkdLei7jdd0KPW+EYa39VA/tpcJ5gzPpf8Y?=
 =?us-ascii?Q?hms8gTARBigUAL7LCFwfM8cUcvYckh8Fg1gvym38xxu938WFsLoQ9/JYp3Os?=
 =?us-ascii?Q?wej9qfqIFiVMuKaQjMTE3N9tcgiNwvo97uSo1RK3mHbUVTsowAY2Qbm+JJuU?=
 =?us-ascii?Q?3zW4x6vD2Me8pimQLjoEOSXIKqq22YO04yN3fpcCLm9E1joYw+SG07YS7W+f?=
 =?us-ascii?Q?DyyE8UpbE5SLnjkBTiKQrCkxxRNJFaAC+8abg+iM00LkzqXDgs/6V6MIyO5n?=
 =?us-ascii?Q?T3RWQQ2YdKG3F+mP5mhTtcz68XDdcPypfvZBRdiRZ+I4WgHEayOjOH1eCKsK?=
 =?us-ascii?Q?ecYeWsQ/B8tF0bDYatB2nR5j+24A3IcZR4xXSpMpb6qvHHwxRm8bJ2qufLhn?=
 =?us-ascii?Q?G3xfZHgo1SMBQWAMPdfnsqbyt8g+Nr3xZ3/VKl6PVgGK8rpTc3sMsoUSuAOM?=
 =?us-ascii?Q?CjKeXVEDbzpHg4i2CGKvXjGgH6LouipHY6QUQ7Id2R7nPh3wH2r2yz5A8GRb?=
 =?us-ascii?Q?nzJ5UZ9ckj6WfFNtskAwPdvIhfcbbY0tl9QmWViFVm5dblUjyiDqa5BYynGm?=
 =?us-ascii?Q?yF8WrmyzUzbqoHedJ+GFKW+5PRKPcRpIww4TkWwLvbe969+gVTpLyT7qwgwj?=
 =?us-ascii?Q?A3+elSESaztZZnRP2+MvJDLrTj2jredtgSRO27CObKNgT6Y5JCNDMhX1ObUv?=
 =?us-ascii?Q?1cr5poefvX1iN0AYGFCAPb9cl3ZHz2Np2z3MDbIfjm3QxE48g55Vxft1VEk4?=
 =?us-ascii?Q?vGixKNyKIQunfS6Wvu0179QiygmBHCZIPjModsVhTV2zi0YVPZKwygMC3wpX?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b113c3f7-ba3e-4da1-f2de-08dc1eadba38
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:08.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sxsc6pl361gGjAVdg1kHlsmpoieWsDvSc/9WHnbwLpYS5w4bTd1sKNPiJgTnfvV1Zv0OdG4yVwXn8YxDlo0IA==
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

The mem_access helpers are going away and getting replaced by
direct calls of the xe_pm_runtime_{get,put} functions. However, an
assertion with a warning splat is desired when we hit the worst
case of a memory access with the device really in the 'suspended'
state.

Also, this needs to be the first step. Otherwise, the upcoming
conversion would be really noise with warn splats of missing mem_access
gets.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aa..01db34f06a7d 100644
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
+ * that the device is going to continue awake. Xe PM runtime get and put
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
index 9910b748adab..3ef14937d5d2 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -252,6 +252,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 	return READ_ONCE(xe->pm_callback_task);
 }
 
+/**
+ * xe_pm_runtime_suspended - Inspect the current runtime_pm state.
+ * @xe: xe device instance
+ *
+ * This does not provide any guarantee that the device is going to continue
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
index ecb19ee10db6..a672adffd0e1 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -23,6 +23,7 @@ int xe_pm_resume(struct xe_device *xe);
 void xe_pm_init_early(struct xe_device *xe);
 void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
+bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
-- 
2.43.0

