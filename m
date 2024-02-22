Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A896EC54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5979A10E9B9;
	Thu, 22 Feb 2024 16:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQft4XR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABFB10E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620010; x=1740156010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=H3f8H43rh3OXFPTnTWcETP8UZVo6bSmwXge9xnCgys4=;
 b=AQft4XR/KgxaBHmGtSMX0DqHlVcdCO57lMoGMW4z+DxrFB3jXix4csNh
 EkQlHgFBy4yYtONEv8PiAVcNVUjffXo6MpqJCMK3yuTye59+Mm8DV55aR
 hTRIGg94tSOCMKWa8haWA8922tnNViOxIpupUIzzzEbOalWTgYyxnPPB1
 HezJs3IUOeo8aLkBX715yiD1Uzdby8IWTRJj1AydokeBjRQVGrvpU1dJO
 B4vzhvhTNyb/+mtUAI40A7rt2VJaLT/8tM/Ue6Oj0K1O89+NqGmw85xqE
 07s3lWkklprZUc7Q2DcoJQZP2rGIMky8b1oNzGNSTwWfoQAVULvn+3syV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730663"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552841"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552841"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+cKSuFMG83XRMyZ0YE0bhA/enexELOjj/xli8X28jF418BQ/whTxyKuhnqvouL4wJSerhBCecuXQ0TmeQZ4PqxvtHTjLC+ja+ouAqNElY2vXW61YfMVjrkSb62Uxyn/EGgYBC0YGCjOWLivx4+nXfDJboyMeAkirjLEnqnlIGMaNf1abXmsxWFDZQz5uwlkVjJxO0vCykgSijsIinda8vmepggVh8oV6wf6hDpzZP57bba1iFsO/3iSjq2e80fMct3S8jiCLgwmGsfUcBhRrEfpvLzL+IqLozoLUQHiyzNKtTP9Eie0PA+wnzyDbgdsS+N0CQAgJtDUtBHEuDLB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP6cLT1Mx+3m6ynrD9a6dG/MyJ0ovrD5DKqAWNOHcBs=;
 b=CMqK5FfmloiMdQaNeaTMwltuT2lo6wVQegXcwTKqLWBnFqSCp13E1Mc7hhKCgtMkCphF5dTdmb8nhHRxAO3K/YO6D2ugVFb/4yzE1GuGtupjzFrVESYfjwIGpNb7LmqWhAp2/J8dDm+fYlDrp0DVtQOh5DDU7b9GmcO1EWVHCL0GBn+JCIaBFRgxJqARROoJKsrNgWgDJ11K+s0McXfXegsjYhdtG9tOI1nZFhcftcMm4Pd2mp2w0f0AXzku6Qsg4zuAFcjIsPHgPok0W1zb5epoz5ScnoSbU2eH5W3Qd7OqRiivTAgX5MR4H2HxdLSnA35Xx8zcsu91cweP84D91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:39:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:39:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 06/14] drm/xe: Remove mem_access from guc_pc calls
Date: Thu, 22 Feb 2024 11:39:29 -0500
Message-ID: <20240222163937.138342-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d0ebc7-a8f6-4667-be81-08dc33c4e8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ip/Fi71BYpciCn+t/N1xW5HVgcegOU7bXqBbGTcq9Jm+FHv1QlXOQOFOuQwhmUhPXyA03eWcnO/VylhrAL1BrgS4eQfPr3TEJWZPUNW3V0oDnF0pF1aw/LflbmNjeq/TnXkOyaTpNs6d3dd7b/95iE1Y3tLsArj+gdE9XO8bHwAR4jFxPWMnhc0jQi/9xo7JT+enX6YyDJv3gBtOob4RgrERsJ7rGMhA6VyNkmJK3mlaUt+WmYpWqLyKcn8NAh4EmYLI3+AN/Abit+r5QPiXNZei9XhwecAsHLyc8f4pg5rq5aAEjcn/4LsOTF8O7ajvoOD65CSeDC6pq1Y4k1PxwDPnELE5M3+dyBGLGvX2rHLeAROsYcAD1waOO+TNAbEbtFIl3Bp/bBQs8hGriKuFzK7q0S5KDJ6FEOAMRHMglgnNIF58jwjfSQOgS9ROLOWKMSYuCnJMw9NWg666TZ5MOc/+gL04zO9+BS75i+Snfr2D7nbnghi/DFSHnSJaGmlb7GXXLtK4kr3ekXGfaeT4l/ALnVNk+R6s9dN1h2QzBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNx9VvejJs1vMrEUu59HCyQAJERPKOkoaiygRn8iNflvAfWK4skfRU+x+uD7?=
 =?us-ascii?Q?SF7g29oOpKX6vngIRCT4eDvFxdXvlxgs7RelbZQRU9Bnl65QWFXciEoHKZSJ?=
 =?us-ascii?Q?RHo39svSRELyxt5OewHXVJ62dv8grvf654MzOk5/gCygIWCQS7nH1Uga1o74?=
 =?us-ascii?Q?Qe97SY3fqiwnVFlC3qyWeRqm9ltUAiXebqzc5XMmynJFT58fChvMbFrSIWjw?=
 =?us-ascii?Q?YoaItOjLRbRCgl82+oTtgfGO+on48GlI22Vk0d/UbVF+pWEKsLPCm5Ol6rZT?=
 =?us-ascii?Q?LLgRfgXkHcN2m6+8E9/qnfAgIVuyFVO6OqqwHER6pCTJEH+p2SPsMsyXxC92?=
 =?us-ascii?Q?9QwsZTk2t27HqfctY3hRzbVym6a+B21p2dYyLVux6pkjTSXomyVuclRyMw56?=
 =?us-ascii?Q?ZUbrZALf3ADQPsqdYtrAZ4i/RtRFSDf26MU7D9gX5VfqA1Q8D/wbrn7cB9pZ?=
 =?us-ascii?Q?7sRu58cE9JDib3Jsp6U89BI8mV+ZEP0wts5o6G8GW+jn6ewcVdYw78j2+g+8?=
 =?us-ascii?Q?eHmFJhT2U/1suE8CQU1F959vLQjOPH+IN5gya579NMXMdHy35/ZwISjSZYKf?=
 =?us-ascii?Q?w4McC/6oCUSNbdYFxKrcLa2eUPIvmBCRdrxl9K0tCAv786g7JiU2Smp16PjZ?=
 =?us-ascii?Q?PirDr0roeWuevOk+P1JTupC3MeGDI+S4fUif4QHZ/NZ+bEpJgwMhChhEdwXL?=
 =?us-ascii?Q?cmLkXBO2Qpv6FPpvWs69SYhfdAgKO7K2OY/Uk1k1Kl++j+0svIkNLJJ3F+Cr?=
 =?us-ascii?Q?Q3QXjyOLFA5Z+tFQScPr4oDEoaf6Z5cotFDdyoE+5tFC1iryFf68VeghODg3?=
 =?us-ascii?Q?h8zkt5EUl4R7VFg+2MpZFtmWGyLbw6URj0xbA5fheE9KS56G51uU03brjs6u?=
 =?us-ascii?Q?DDrQuSztT4CtzwxPzbdLdKugFtFxQZTOJJWdDQmij6yOgtFt0HweNH7WyuIZ?=
 =?us-ascii?Q?oABXkffNiEQoQNJW2OMYc81JjgVxv9LlEuJLZ3y2UpebrFxKKqqh68qN1nav?=
 =?us-ascii?Q?HocPb+YCjNVV20clp0a2dB8srclGrIR4PvXY9z7erWcOKwAFHrLrUsK7Zrb8?=
 =?us-ascii?Q?Ime0kZACnSXT6FUfsQUogOp0TCq8N1U/2JF7AAxYqzFb0/AYwF4o/VW7XfgM?=
 =?us-ascii?Q?kHI/+Dn5ssvAuYDxlCWiPRKgFPlMIoMJD0j/b93zk/soPFZBhcgUEWwEw4CT?=
 =?us-ascii?Q?2zgKBGeRkcUosEo7YdkM8uYELTGqDJq1znWeDZxgqrfO+5dtaNBqZvdRrVHu?=
 =?us-ascii?Q?rF9DidG0Jkk+NEocwrC42qiHQt/TV08+zaSO2anBHClB/gFVUvTjQp/mJYBy?=
 =?us-ascii?Q?g2K0VAhuZBHQvrhegzHxcteUZR/MzXZq60npCmNsvIlxP9CoUh+OieMXMuWK?=
 =?us-ascii?Q?IqpKHrGulnlD8clz0O1IhemGPAP20HxSCRvricLZ2I+3znsZ2te5E3ykEzii?=
 =?us-ascii?Q?Ts9/JN9FsXE/II6EJPwW6jiTCPLXMDqdG9Sd0s1bq1czTgUyYo4mvDdn2k2A?=
 =?us-ascii?Q?b8VYAZcWXoj5BNtbrr2yxtJKtFhyh8b/w9IRIUSfLSJOuw4jgpxd08KxyWZq?=
 =?us-ascii?Q?+1DvFDcYY+7h+p0YiA2BCzRwQmqPkaNithSOOggXtdU1jRKmr9oFY3OZI2H5?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d0ebc7-a8f6-4667-be81-08dc33c4e8f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:39:59.7282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eipB4Brdbd5uJanNBvQn/vJZHqNJlWtty3GL+ngn7s9edOnJWds1EYgvqW/Ao+C+y8QHjeaP2i9gYlfXwTpHg==
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

We are now protected by init, sysfs, or removal and don't
need these mem_access protections around GuC_PC anymore.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 64 ++++++----------------------------
 1 file changed, 10 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2839d685631b..f4b031b8d9de 100644
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
@@ -965,9 +923,7 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
-		xe_device_mem_access_get(xe);
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
-		xe_device_mem_access_put(xe);
 		return;
 	}
 
-- 
2.43.2

