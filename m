Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F29DC4706F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30C910E258;
	Thu, 28 Dec 2023 02:13:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74310E259
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729606; x=1735265606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Z3p1kflRW5N1QLNlyM+xBXELxEL6yj6QeZWlmHWcWyQ=;
 b=nJkK9yoQDBJtacuF6j2wFMlRshzf0g8ShPl0h6ommtkzClXz65QDq3D5
 65UK1ICZFNQxt7OHALzFWMYUfTOBGm2ybH36VaJFoVkEVhekLSmI509c4
 tM0SMf/3Xqp/7sIwnE7HWQIsjFqzDaQUKZcmXorKVpIe6bYQ4dGTPUBvR
 3c9yufkb05O6MZbREc1WdQ+GqC7yt9DVgLg6NUB7cGg4M/mKceEkGnaoB
 Z0qICUOFl3uGKBXawUge5502qBYbnOEseTwjfiCU7H4Ja5DVOHz5fH2uq
 CIxExOYxUZKKpGIMFqBScdE6v4cPrYQ8O8UuM+Krbzg9+/TO2+GmhNa/p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="10062200"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="10062200"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="869014350"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="869014350"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:25 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:24 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhxtuTVz6oYTmnzkc4029wh/cxGhjqCnzp2MnTWFKnwRnp6Lm8SitlEMbmyIVEwh9Bwl4K63EPcsSM4DokSuLlkLfB0Uot+2nrvDEWOuimB/rg+W7JuK26gwvUK+rBRyFwkg7d5CzWNLnHliDH/JtFB1qVIvRItpSKk12gehyIFHP8L/8BIjUziEQGkcgaB50BsF6izy8yyP6jfzEN1GYaEP0u4glkuZYa++1v02DT+cRM77rK0enkBjRCVeDS7LIsIaYiJQTLlzi+4/KvwV+We8oNBQ7LBIsig3VAh3nkCz2lKCWhCxfxd6bYN10HhvNf03aotbCCoPHtGM8F4YUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioGkiR39Lx9+3355iaW41CTpUZqkyA3ivjl0NiqhWG8=;
 b=hyEwZ2xSqGNSOI7iQ5ZiORHSKKeyPM2VKFcOzqMKoL3mlrxguTTLRmigcb2VvD5Yd0WjmpYBLGbZYa3XoRvoCCfKz4RoMz/suQZLalUoC8TRd4mB8tts+KDP6NWwmYWoejy2cXmugpFuIHbjbkFxSiKJeRtfqOjz1c6W9zg38VYyQB+eF8Q4IiscK/8QuHaakhLbHeF8UkInC1WhCP4mj7B/ATXy1GGcSZ39Y2mewR3rM9/9j9ecio3tyb5IRMSmBb0j9r+SJzwTBDEgSL/tUKZT5Q0kfFcynZ95E/kyF/pcbxYtzbv30JYqjH7Uvnx14Z7LpdXcSkwfmjSpvZ879g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 12/20] drm/xe: Remove mem_access from guc_pc calls
Date: Wed, 27 Dec 2023 21:12:24 -0500
Message-ID: <20231228021232.2366249-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f8aba3-c767-4c84-c8a8-08dc074a8e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3ufqA5rCte/AUT8+2nyrAFARPBB5CcCfXJCxhlmPz1zNtltM+TS+pfORiL4F79aCob5s/+H4uKlwxs5pcYJaOGhc0BklZLllTxIVXpUPuSrEaczIFt6Ixt/a2umVkC3NwXf5rv6fi/+c9EmvB/qaxgY7CVuDL+Xf7BVl2Ty++jZiRh8EbYBqM3vIgXi88bbd7sBoDV8SAveF6nsdTbtjfnihZ0cZV6c28BoSL0MGyz4dHJvjJ3MS9kA1dBuG3yv/GWSAaf9QNa1/MwTOX3lfomKescjyQ/sZ0D7o579k/guycnmr/oDe0H44jnBUWGHLuxIVTnqHYeFjMNA964mK0WsyEIBp+SonkQ8seJCpxW56O7Z2+c8D7P6g/jGNg2RApvdkWiSdfxoIYi2Ne2pPBK7D1L77+aA2/xSJP/aoNfFBeM3CnCzzj7qKVKF8voYcea2yhY4GHRDQmqS8GlQAKJTgN8LnZ7K2Bv7hxJo/pn8ncx+KGzPL5NLB8zHQAOW5cegexFOUNp8dRJXu0BBpQKUPfl5QZoos9ovqGcgy0rELXqYkmHMv7x71qpsozPC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SLdeA9G/ObQgbwZHHBfiGbXg2t0I45KvAij68zTc4MqX8VXKCnDJbaVGz2Qw?=
 =?us-ascii?Q?sirL99uwJKQjAuAWshwfHALbR0VrxlRURpIAhT7ElWKoWPf5DOhJMTHzyEVl?=
 =?us-ascii?Q?jGtWd487DTiA1nIdVZjCqz+P+EbWd29TX8D/bx1Bogdv4cPW2p0J203XW6Gg?=
 =?us-ascii?Q?Fqsw5uoTWfDmoH1FK0CkYo2KlmJbOM1fRHA2AaA1f+I1rbMe2TDMnXzz8xk0?=
 =?us-ascii?Q?/YMcWQ3yUNDdkZeaUebqjoxCn+6kSKVzEaQ4p1jg0/ZfBwztKAcDRVGiTpAT?=
 =?us-ascii?Q?zaTOgJ2ec+eb7lHmOXoXSTK+NkvHcgfjqoJmHRI6pAct39yqsQliQxvT501A?=
 =?us-ascii?Q?FZ3RHjMR6u3eeyNiyv2mqKXobCXRPRSeS81KrvJIKKvN2BgIEN6eEsisdsIx?=
 =?us-ascii?Q?iOw5eb7n9KieixO6SV5eAYWuanMJhGvWmITJAuf5u0pWNbxvi16BYqSzNxBC?=
 =?us-ascii?Q?pmrjoIKUNf8Zkqi3+XCzSGE5NhAeJpJbGKS+yihOLy+bdVHCCJTxyB0yk3rU?=
 =?us-ascii?Q?Tm3c/jgG98XUAvUjor3Ir+WLSXDuDWQ84M/ASuQs7ru0CV629wEE0uEiC6u/?=
 =?us-ascii?Q?ttz71p4pMpgY7wxz3CUdThPV/6Y9+QnZ0n2e3THB7Uqrb+1u7+Vy9pv3Oj0F?=
 =?us-ascii?Q?LgEW1YaGQXTd/E2xgUu2+ACTC8TWaeZKL2RjNyysjsUwhMLHqZoNpRlWyHQC?=
 =?us-ascii?Q?DT7s0GMzQHchMzlqBwkeBQq7LYV42vIiS315FsdHMtviLWjmNMIGaAUzeEyM?=
 =?us-ascii?Q?YRFGBdPGIf+hGpgXD8xQ5EC+6bXjwFAmRfHFN4XldWfu9deLXXbfJ4LodEa7?=
 =?us-ascii?Q?bx7FCmLktJ6fKwDzf7zJcNA/TG9ctqeenegSfsl/VjXwEtyWGqs56EzsVO+h?=
 =?us-ascii?Q?R/YrcItFIY4QsLWzeGvNadCeaJ+pRDcDu/A3qfRkvQzfxpyLC+ZLgdfmp1No?=
 =?us-ascii?Q?1oEqne3NxL9ckYY6y/VEDK0DfvqEtFynNC8dlMHoPy/mKM76b8liSA+HfwKz?=
 =?us-ascii?Q?RIMNWzW2+BfhxCQqk+tqm9LMotqOv6P5JoYssk+HNynsySYHXlMQL4webehs?=
 =?us-ascii?Q?m3gcJp5QrY/HrJJ5RBHwULjVNl2n035tOTz/QtQo0joSkHG2wzgptsMfttVo?=
 =?us-ascii?Q?NzA6+DyHgG1QgCBiXihF/Tcv1IBoRxxiJ7U2R4Ot6jUrrNoKlKrXCB3lfl6M?=
 =?us-ascii?Q?hLCSJVvidfFv/K1DpGY/kLDy0XC6cp8uOxJOFpgJODit+fTFdwrCPo0JQHIx?=
 =?us-ascii?Q?dHgn70F1x/TQKb/2Mk4JNoGTtcylG2if9eM1RnCd0VzKuXBpfH4Iyzkj4gPN?=
 =?us-ascii?Q?ET0QLdumQGjQQyHioqfyi2nKov0cbB/+bgp/WUh6SP0+Z/RTp5aKSJAqbbxW?=
 =?us-ascii?Q?3wObC/7+fCyQeAX3yEe9GUs1J4Z1+nFQrNcX7w3g6P480jCTeGQc6gQAWyv+?=
 =?us-ascii?Q?vB3VRlaYZDagTuCUIsCeTSUgHh+uFtUqxAapWt02dWAHoxaQUAeGRw50W/aL?=
 =?us-ascii?Q?RRBP0j2oCXHOI+d9h7e+G72Tcag1C4wqfCVzpvLX89yiIqu+qoZ7TgvbGEIr?=
 =?us-ascii?Q?H+qYYpE+C9Eqh1liwDBpNpzrelu5QlonovU3K3fOXxTLINE9NN0iVqnYXVP4?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f8aba3-c767-4c84-c8a8-08dc074a8e4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:17.9346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBqYl7eLGt9MK87ImP9o6/NuaQ7rrBIUcpdJ50RqIw/wYiyTTVL/S/nTbWJHnesw8eyW7tk6mtYNr7sU1ebVHg==
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

We are now protected by init, sysfs, or removal and don't
need these mem_access protections around GuC_PC anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 62 ++++++----------------------------
 1 file changed, 10 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f71085228cb33..ce39eac7c8f54 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -381,8 +381,6 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
-
 	/* When in RC6, actual frequency reported will be 0. */
 	if (GRAPHICS_VERx100(xe) >= 1270) {
 		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
@@ -394,8 +392,6 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 
 	freq = decode_freq(freq);
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	return freq;
 }
 
@@ -412,14 +408,13 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	/*
 	 * GuC SLPC plays with cur freq request when GuCRC is enabled
 	 * Block RC6 for a more reliable read.
 	 */
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out;
+		return ret;
 
 	*freq = xe_mmio_read32(gt, RPNSWREQ);
 
@@ -427,9 +422,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 	*freq = decode_freq(*freq);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-	return ret;
+	return 0;
 }
 
 /**
@@ -451,12 +444,7 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	struct xe_gt *gt = pc_to_gt(pc);
-	struct xe_device *xe = gt_to_xe(gt);
-
-	xe_device_mem_access_get(xe);
 	pc_update_rp_values(pc);
-	xe_device_mem_access_put(xe);
 
 	return pc->rpe_freq;
 }
@@ -485,7 +473,6 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -511,7 +498,6 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -528,7 +514,6 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -544,8 +529,6 @@ int xe_guc_pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
-
 	return ret;
 }
 
@@ -561,7 +544,6 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -577,7 +559,6 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -594,7 +575,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
 	mutex_lock(&pc->freq_lock);
 	if (!pc->freq_ready) {
 		/* Might be in the middle of a gt reset */
@@ -610,7 +590,6 @@ int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 
 out:
 	mutex_unlock(&pc->freq_lock);
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -623,8 +602,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg, gt_c_state;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
-
 	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
 		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
 		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
@@ -633,8 +610,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
 		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
 	}
 
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	switch (gt_c_state) {
 	case GT_C6:
 		return GT_IDLE_C6;
@@ -654,9 +629,7 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	reg = xe_mmio_read32(gt, GT_GFX_RC6);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return reg;
 }
@@ -670,9 +643,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	u64 reg;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return reg;
 }
@@ -801,23 +772,19 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out;
+		return ret;
 
 	xe_gt_idle_disable_c6(gt);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
+	return 0;
 }
 
 static void pc_init_pcode_freq(struct xe_guc_pc *pc)
@@ -870,11 +837,9 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out_fail_force_wake;
+		return ret;
 
 	if (xe->info.skip_guc_pc) {
 		if (xe->info.platform != XE_PVC)
@@ -914,8 +879,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 
 out:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out_fail_force_wake:
-	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
 
@@ -928,12 +891,9 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 	int ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-
 	if (xe->info.skip_guc_pc) {
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		ret = 0;
-		goto out;
+		return 0;
 	}
 
 	mutex_lock(&pc->freq_lock);
@@ -942,16 +902,14 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 	ret = pc_action_shutdown(pc);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING)) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC Shutdown failed\n");
-		ret = -EIO;
+		return -EIO;
 	}
 
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.43.0

