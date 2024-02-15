Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F7C48BEC
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF80F10EA23;
	Thu, 15 Feb 2024 19:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hoc9rYpt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACEA10E651
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025705; x=1739561705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=z68X/Mr+4y13JLCZQm4s6vmoffreDgmevjQz5mgKBr0=;
 b=Hoc9rYptFhVMkSaHs9UAiJUyaXqkl5xKsB8yud4ocAuCK4+4T2Ri+Jiq
 mWibDYw22HOr3ggE/QoRIo1p+OiPiTnEEqxR7BvrMYdHumr8Y3ErsiJid
 YdFL2HQ0KOpEPQ1xd0EacADCnuGfgL+bjjfjbNYMxIJlFk6z4eXs2ln5c
 TITlRFF6TkNlSGO+jMovApvzXsVcCpnv6f+ZdNZr6utQcXiLkfzG8uPcZ
 iEXat80KRMyW6rUqnmm+lXtjjNV8JwUzEDCDDjNeG7HlqZTnQU95EG2Rj
 nuykJvi5ugRPA0NnAXS0B2vzKLyeGtNiN8hximG2KY+pQmhsA0DdKqZEb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2276354"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2276354"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3921128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yko3UaMsREF/tzpH5CFDUxE5Q8UU+ROX4LP9f0r68Wf92RDvTWUhUEeoYM/PhOtmR1td7k8cscsRn4sKvHganIr1/CnTYEJRTKL+KGkp5xF8XhtrGjEW15cAB8snA+xoGlz2hYlh/qweUNW3YkHcqqy/Qx0f3LWQH490ip0C19naJ2r0rDI/No6PLqhGGg6tdX9Ngl9hk29XmfYuyhvgk3HvTI1ZrLjn6buMST9uwKEHhbIpwzb4jzQbbSUT17H6Q68+njV/m+waWEq03zDThwaGfgtiNe0/FcQ7ARG9iHx0tT524Gg/4UHDkux1Q+aA8UJwoJkQ8aDoyIu4NEDRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z79eUlOAJ0SjkYJL1Q8rhh8yIVakFZCJW9NwPiQBLIQ=;
 b=ceaaaCfKI87Ew6pTK+ULIATCMbKdIt3emNWjerRaYIlSaG3ycfCc8FxjQBQT04/qzb8AvpExD+EY/uHdMArtVnRSXE0JZuyqi1Wu1Wr/cFJp9sd237QZm8WBcLDtzsqxyNfiY2O0WHYPjPZh6v+Gv9Y2m1A7lMKiSbkvX/djxF1OXoio2u0WFKoiAbKVkEq4EnfjxEeLzdMHn4ijSFSpjBVYK3X9qqMXMd6JzWIvXB26Dlpjgpg3f3pxUSfMLG9VZcS0gISkhVpsYGQ4ZyZFG4vm0SYH+irgnDkUdJ5hNkOKZjsmjqSpQLLRiS6jYvUUXb2CQ9xIEtAez+kqPgioQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:34:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:34:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 06/14] drm/xe: Remove mem_access from guc_pc calls
Date: Thu, 15 Feb 2024 14:34:22 -0500
Message-ID: <20240215193430.130106-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: affcc738-4067-49a5-560a-08dc2e5d3238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3nsDZ1ZuNz23+A+nHjnMHNTUpETpf1tqSOIJtx2q8pSfsEPT1czYYbzSDrNAKSbi2TBzAj37PoExQyWLFPbCfeG3uFkT3JozevLUOxge9Q76he+GBfmOFz11FeduxFNPVTZr2rhLJKHARvgLVAkb7rSPZUjpXBOICsxzZcb7vwcj9ap9Ver/pqWVAAb1H4wTYJycHcpHt92Zu2xapVRtpzH+8pfeFxECAf2DSF97YQelN5j4Hp1LqPhiOVQFmdDl/HZFLk46iNU/ZLTN7ho8iGtEM6mjkIZFLOIKu4w9eSnVyTAk/7Jpg9BxbxnLnx18hwow2BL1SA23kll9bYP7D9RHc6zyAMjkaJxWvyVkNDkcVojP0Guv4GetdCQUYIUUPqDCGUCRZiguSLY77Jiw6SLcERSYCpaDuUq9asorFl+uLVVC9J1qwQEQITo+i6LF569/Y0FDy48qqHaExKNt5PXx8FUCYe72tglNhWbUsHmhVOYsk5uH/o8kxJBzymh05Cu0ZZmTJSh5rLx/ixSgMgYF9M/qIkZF85J2AHhOdSbV1TrK/wV9AjiB+/N9+z5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M0LmUR1UvWUL3sbbHsnsscaZqK7NMVLQ+DN5kjP0KyuwpEe51EPkLmRCqXCp?=
 =?us-ascii?Q?GcNLGp3qhm3bWo91ca287jJGCAijgkb1+by3VBz4Q95xhBs3D/dFBONdWO3k?=
 =?us-ascii?Q?K67qY0txeWoyA77WllfL/usVwy6PXHxlovH0xNpShWGUwUW5Pbfo/jPdXqna?=
 =?us-ascii?Q?0gdM0Qci1JiueGeZREvpRzohxlGgMti1G6L3EdDTZjHAOIIGm1vbc63FmyOc?=
 =?us-ascii?Q?RRyNUY7m33kRK5obD37K26Uo3ysaNEDhhBnjMmrtZCGSRuciRUcHFVp/DiR/?=
 =?us-ascii?Q?KEeCrkZCTNcGucqJZOq5AGRtOyv449rWUXloCavQQgGaEhDq1C3zZGLfMgGQ?=
 =?us-ascii?Q?Ma9CSfeFexTaDlvobkYD0qa29EknJ32fB4seylPFu0ZVmVJmn0RoPMhNzx86?=
 =?us-ascii?Q?t5Ge99+1K9dGHaUFfpIW6xRdfdBJRvPXD+e9u09aXB18yN07aG0G9XYs6OY6?=
 =?us-ascii?Q?ZVk7Fiap2g5kz1pfG/OggNGNEqEn9RTO93HMn5twX7fmE18YUGqgGSMoEyZe?=
 =?us-ascii?Q?o/C7qHskwaeIALIi5p4HzKAuxKjtZG+a/VXInvomin77uHtajEMEv5iwaZL/?=
 =?us-ascii?Q?7MCo69TToVG2q18y0x5sZtIp64b7gmwWNhoHYPeA123pfnVgasrKkgCRQhiq?=
 =?us-ascii?Q?5pqtBpzj+3bxFOHsElLyRn0nzwZo7I/VBNNYmVEwa39MdmguvE25m3ODib9f?=
 =?us-ascii?Q?QFXvw5YBRM0LIa51u7ozhdvCs4xS8WORnu02K4+h3K9T6AgznpleR/kBS5Q7?=
 =?us-ascii?Q?lAKdJoHyfD+sysKIiP12FmR9UTDD6W8WYWBqLGsCgL46u7qVzDU+qA5QhDzW?=
 =?us-ascii?Q?j1FE+OaRLgA/1r4YgeOO9XLFe/nu1zfChq5qEgidrzIotkFaDXIK1looVxUz?=
 =?us-ascii?Q?joRWUgl6y28j3zlCYW2W+khkYGDTx9v5LyVoUqXaSFF8KyhvPtABFWeHW8R8?=
 =?us-ascii?Q?skSsDRBHgCEtFtCToGucPRy2u/HxEyBxzqpwLuo21CeyLb5jvwMHBonD3nk9?=
 =?us-ascii?Q?I4G1/7SuGjjPNZWsWhpht726dcuuUdrhibRntfEmwlmYvWS3JQ1J3ukDozyB?=
 =?us-ascii?Q?v6FAgp5UoK0d0O5T/ACXhPgxmslYaslWYhlYGSGpzRyoB5FtNo15jhoQZ+eg?=
 =?us-ascii?Q?+JVC0aNRyDf4iR98yl4bmn6Fyh9/T/PvkhVUl93x+iLParIE1+5zRZA7Qs97?=
 =?us-ascii?Q?0WDNhuA042SWUmaHvFqoLHolhtZQN/scTi8Vsoqd0Oail8u/Bwq3BpUF9Cfy?=
 =?us-ascii?Q?dN6t8ll2tZFOmoWEnX2HfrCbVxhUJ6lFz+BmMyLppWo9lGdAS9tZoBO/GbCx?=
 =?us-ascii?Q?g9WCjN+eZIOgqGOBTGnWVVF84KgUg2LTDxqLGtuoU//C32PHiNbAFMbVrDWo?=
 =?us-ascii?Q?U1fUUxCr6ZSHU3NsJQXCYUCkjU51Cp18Kqpk/1oF+UReDfkNt8yHgK27CJu5?=
 =?us-ascii?Q?FbEt/7x1S5eAd0iEpfYoAdSLXmt/l9OlckSK1yyHwENiTO2DS3X0r4I0Fx4R?=
 =?us-ascii?Q?yqzJY+T83d+5c5N5haHrZEutgnjyBTfCwOU7GXO8E//59JGdsm9YoMLY2zzO?=
 =?us-ascii?Q?hlox3nx/pbYNPXsGVWlfqdJ8XnMiYViLuWhwz2Sxqb8WIZAqc2LazlPUNz9c?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: affcc738-4067-49a5-560a-08dc2e5d3238
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:34:59.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUZ16fzdCwx0DPpNCW9fcTCpAMwN1okUoDfJcy/t0e3bIRTMi45Tee00H5GbLuptcUuz/TVXtDZGTwfxcpajug==
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

We are now protected by init, sysfs, or removal and don't
need these mem_access protections around GuC_PC anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 64 ++++++----------------------------
 1 file changed, 10 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d91702592520..ce39eac7c8f5 100644
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
@@ -963,9 +921,7 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
-		xe_device_mem_access_get(xe);
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		xe_device_mem_access_put(xe);
 		return;
 	}
 
-- 
2.43.0

