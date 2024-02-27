Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E8C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AF210E497;
	Tue, 27 Feb 2024 18:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLSSkcLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8A10E341
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709059419; x=1740595419;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=UYj2xVefXhU/cCeTx0ZVpgoQ6tkQRFiij5ce/TOAQq0=;
 b=lLSSkcLYnsnFt/CkNiTVTR6iAfr7VAIw4kP5Cdu+pncTnrrLJr+VKXBE
 N6jyalmC5WLWfDVtulZLwsyxdo/QC3fhh5bcQyN33A9j/FI3pKQ8fjPV0
 BCqERX5v1nBafPJ3SomQKLGRTMANNZSAQm/2940UyzowqxndxaVPktwkW
 p5dgILFDGNiryVLJ0wAfRtoLahFDux2E7nXTmoDa9J1I+8/kJyQqtTlD/
 w/lgInovoF6gWvIQnJalggVS9ZFZFU9tI0nmm71wSLg3Dra7aFP/+yGWi
 Z2Y1DgAB+Ub9rCHZHpyaLOMR44ZJ6McWKMOkhAv05L2xiQ9352p/g6IzM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="7236684"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7236684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7351323"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 10:43:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 10:43:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 10:43:37 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 10:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yfs21QgH+dJ8Q6GO68NDWig2JxwWnzK1821H9etSZ5vUxDQJGdII5yfEVZ8yxN1xborAbn5uaL/qkeRWWneXwYB9RQft+opv4DSkLhYNTpaGY6ZrKNwECi50ID9/QdndaX/loZxej1F217zfhqVSbEJbg4z+NGjo4Moh6/zXfJuu6NVWbopysg4cYI9RaSpuc7+QtHItIr3dFcztVuZdajpczBSjAfO49/ZK/qDACcgRJMDe5LOPTm04YM9JlIBuWgiyRwQCw1N8bSPqPL8dMeIz2OMutGBQ8bemde+bZlK0n+zJzeML7c1NmuUVKBFC0dBSMnN72N5PyIk0/AfnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2d110HN85ndSJALheUX0K/MRCbZxwJjdtwUzxxArao=;
 b=Zy6hB6ER18klZcaMSJmpYZkWwrMV+Un076VmDYPIROME1mWW9SvjoVs92gSExMWkRHrjl6u3d0ExHXd4fruXRJx+m7ipt8BX34ydHLon+0/sICvDSR2vzbbEBtnh24jRQ93JLo3ErbVHJmubh1r5+a4ufrkdsTHRJ7rwtFa9pEfziEIrtqCyfP5EYcxHOBUvIebqPQNxoOIEE8S8HQQJjrbq+wh9JskF5ciGjRqzRnZH1OB1TxnelHT37VwoFojASf4o1cNLBfrATtyhrP2S7Oy9L7RCL/k28e745TiRUXKg//c7hOnNw9IMs9sJyQH6bQ5TMA31MH6Gl3W+nr1wcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Tue, 27 Feb
 2024 18:43:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 18:43:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH] drm/xe: Stop checking for power_lost on D3Cold
Date: Tue, 27 Feb 2024 13:43:30 -0500
Message-ID: <20240227184330.506881-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: a18627f9-a65f-4e7b-aade-08dc37c40015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwCqnUrqDYhXWVlnm6mxl5ljEfBmHwgZRfhwYsw6M6mU5AN+Fykr2tX0zlRsclrcuAQEWNrAzijfGNg5lmpX00z181XoaS7CHioQppz7NuybSFveO2b1UG1XBCl9n3NUSc2MroXZDj44sJRezjtAtl3jkuRJN5JAd1b5tu8sgvoRJCLCNc6o0h5JCpQbNx69W4J2BYNSjHJuk1S1caJLRz6h1CRJv78DUkhwIFwDjYMNQNeam4x2MZ6N2alJ9AMp4z2pDwcqEGIJfS/xNnSYypd2YD9moxN9unNqms07GRl0mqBIerNPddjfyG3JBzo84aXVWFGYeBxO3BzqjRVsJMlLV4dWmhyreUw0MshnWSXgvdC4Uaa07NDOp4Gy1z3Hp5PuKp36Il9QsL5TH3P5rTNSC/esavAn758kGzKnUpA4Zu57nIYhW7nIqk5kdp2/oYXgLmya4WAeOB+XQqXLITkq8q6JF3LLdHrULxw+33LFeINl1n2pHkuqyktkpVDVkyeRyqW9zmr+YY3nMA2D4Xlbf29JKl/A5mwnkGBlsqouYZZ1esI5G9k/vaQYrePO/PSZg8o3c28N4kpRATQaVLTwhGngfic1/Nsua51VLhdKgpfENuEwJlyw/hqkSyyBTuSNjWyq69SOhCGz69xebw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gs1A4aP1USC4PABIjnMv84cuqGYZTqJlUkLkZpSVQUtv/TS4+f4rxjU6pVpL?=
 =?us-ascii?Q?BTS5mjxWwWfyKz34M9t7fF+9xs3ZXW9qHDNUjLLDQnZyPXNaiiM9HnlZUeG4?=
 =?us-ascii?Q?O9Urlvv7LRKBPeVpVnpNPZOl1zf/Ff7mvL9JB7RgGGbNjicZfshbyeK4yd1V?=
 =?us-ascii?Q?Ow6T/wjKBzP88u6gX18ZoYHt9yME4RaNxnKFs+sbBvhtD9U3OuuMs9Kxucf5?=
 =?us-ascii?Q?xTslJ+LtLKlbGk0Pjsgt/MtngeNmebIl++PbUPTn8T3X4HqKqDpB78VFBnnU?=
 =?us-ascii?Q?SQsnfd2onEf/UmEnzYBAfy1sgi0ISqco6l8U+wRcAS5cLeW7utfXx0Vm9k0K?=
 =?us-ascii?Q?7eu9S7kOThDazNQJZlqAnYD/gpy7tYvR2/IACGhSS/6RC9Tygz0pz7Hf47Vp?=
 =?us-ascii?Q?VPjiHSOA9Uw6NYZu0cN1V8o+4aTcJuhfWM5EV0OjrPJAhHqNPLdlIREvoofT?=
 =?us-ascii?Q?lidRllA/ckCPvXXhIjXE7y8aBppwX3bnxP/k9TdzF5B/o+WuzrCfwVmYOijX?=
 =?us-ascii?Q?uD71b3U5S363qqj0u9qaNabhJzkAdA0AacfL/+hwNb5W84MqMEn0bHeFRZVf?=
 =?us-ascii?Q?iWcWReO3fQIWFfFaIvArE1fZOgSeqiINpJlaobI/4qNPxozoPF3WQSYOFbYt?=
 =?us-ascii?Q?X8+ydpGO2N+xiQBiTAy5v+LvBgr3YWlThmXJ31Qhej51lxJIY7XvwHm45Lby?=
 =?us-ascii?Q?MAoC4CybN6OqKvLXRy/8MgAT79FRJCyFLT4GG6QmNVCKV6g2Bdit6UVw0p8D?=
 =?us-ascii?Q?lodjtQJh1nNPyaETDrd3Hz6NuuPnbZCOsiFCDpLzj+l7V0mzeUhmld4LJ0N1?=
 =?us-ascii?Q?XBTrDxEj7aC4G0GPpCtDduxe5R1ibs1swj19bngUcInEU1hgTVlYGpaHNuAc?=
 =?us-ascii?Q?jRga32T8kWr1kE0/SMJ8y0RrS8y43XtCrq9qQOtxmCK/nu2vRtwgMQv6nOiE?=
 =?us-ascii?Q?ZkxbIfzWLuuPotWnVm+RspBbMdFeDSCqbC3N7yj0GvqADsQQyUDQ5Ym2rOr6?=
 =?us-ascii?Q?gi+SoGWiw/hREs7o7ZN6As85oXtIUaurhjohSrLZwWXtYvrQwlo/eBFHGljc?=
 =?us-ascii?Q?iqbqOkD46/xjJuz8jTcAsJNymOcIvHwoKRNaL4ouRxGqKTk+QupEuoEgB8ik?=
 =?us-ascii?Q?veBYPooGmh0TGmmyFhyDAKMGKxEy+WafJzzokre7K7EMhVf8vLvT/pX8iypj?=
 =?us-ascii?Q?I2pg2QIY0F8laWob1zOGTSkc0Ipc4+N9DDvQIsFHN97oadV6ciMzucm8U4AM?=
 =?us-ascii?Q?OZUnS18pawvY7Xh50/Z+N/4dZzNmzXCjNuz1cHsQVK9y1FDPraiM+ypmuOQ/?=
 =?us-ascii?Q?HC9JaRfB+FIwrETF/czIt5+8BzY3/b0ItyeNIm+4XY7FCB7+KN9UXaExnxbJ?=
 =?us-ascii?Q?X5oFrqcHlgRw9e1+C0zKsflUkoxXp7emTHqGLN4Rdlpd9ii2i8PbAwTZbfap?=
 =?us-ascii?Q?4fOgh4SwDGrDig77r9qV86RjwngmxlWO7zeM8y6hQIcXAFyuSYD/Vz3HR33M?=
 =?us-ascii?Q?9cd02HvH9h3Jusy3W4fv0beqcPBd5rXzGfuhMkW0h7a7G9AJmVBgzA5ZVmyC?=
 =?us-ascii?Q?/Jtggl86rvjmTCZNtS6AjxOAhN3KvAfXgGq0bxx4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a18627f9-a65f-4e7b-aade-08dc37c40015
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 18:43:33.7073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hpw4Ot4cK0SbHg6QtU4zlnByIglcMHjgXYsvD9PoJFwoa1kgWefwFbZ+V5bhxNvMXozN1weQmNfXCAqbRY7eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..f7eb473a3aec 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -423,9 +423,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b5511e3c3153..9a03a4d5b439 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -365,15 +365,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	lock_map_acquire(&xe_device_mem_access_lockdep_map);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -394,7 +386,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.43.2

