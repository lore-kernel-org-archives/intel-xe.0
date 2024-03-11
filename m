Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DE9C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC37112C39;
	Mon, 11 Mar 2024 19:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvrWkpUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9193D112C39
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185372; x=1741721372;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=0OH2pdLRjKObCJ5hJrT8dD78kkM3XCAK+KkNEbAS2N4=;
 b=fvrWkpUTQm0zr8FKDY5nRs/hLEM5fmKIfB6efM2kXDHxKYlZwZSzXBqm
 m909KEr0jqDGZxwbZHhSXgVBqhmZHIfZtlbrCeEPdmmGLWpvD2GUjew3D
 96W3R1Fk2endn5wnDDMvt6jtghGuo3ngKnsKR0pWBmzUylTuEqRF3HgY4
 77VnAuQ3gGe3aRFBwYN2cDosNUnOH7qgs4MwMwvhzpBIvid4CnnuZ8ths
 UTWdXZgdpZCOhGy2rO6SO51h3BYpeGaW580sfS9QoviXfyev5Gj6nibQq
 HWmpU2Cdvt5S7T/q/Lcbf3xL4NKd5mCs4W0gahbtrAEXOyGTmgJSFZeVq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4986572"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4986572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11266820"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SV36AnpFOGRbbrkMES+R9A2AhEhjoLH/I0Udn9487Wl61VEM4n0qDM2k4c5hZPOVkVaiumf67Tm/3gLY7ZIPqSTMAmBKl0RwduKOqsGP55TaMJMNgPCo3PtLQMR09S+ETfFLjH/XwzTKSCSHc3490jQOoKC0PWdwu3XHfrjJZsiI374Fj0wHzqdukyTwA0cwcfyAmfto42bW9wUj36dSwiZZjWcxeh5kCF3Cg/YnNWiThvgFScpVansMiQRQMUI0dYYAR8DU8/NMmMxtwCvgTPqSUsK4iyhSFG+JlhttpO58ZBbmYer3oVP/lznjZqGWFsHAAZzYMDhsD8mxhdmPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ly7smjagvht86Iw2ktVOVkIVjFz3nKai2Lzne3lG+r4=;
 b=RosFTd3Vhn3kyQr2RV+5atZYYmdt7KU0uj104M0vfzJdhwhThball0Tvd+jrxZSEyEb9kx+FVSIQLt2SSV3wvcQ4ysXCbpB7iMb6QkKMv+sNDxbzI69kQ/Ey5QNqcm+5tKc+0j3uUhLZYWjLtjujknVTfLdX1ecnVB2IQk1b1cqoUj/RR8QNwMOi6Ep18AXV9Ol8rYHrjeOXFFLqItGk9CHrfFiJ5QtsqM+iE7C7EeDQGEQdAeNCt1p9+Hb4rqFKcofsRFOUZya8B79Mo+IW50FMTHsBsw6SdaOF0vLpsTAQbH6OIy2K74WA+SqGZvkOrpSjNcmFgGX2217365FCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:23 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:20 -0400
Resent-Message-ID: <Ze9bkL-YPvwit2HJ@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 04/11] drm/xe: Move lockdep protection from mem_access to
 xe_pm_runtime
Date: Mon, 11 Mar 2024 15:22:56 -0400
Message-ID: <20240311192303.33961-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4526:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b227191-e366-41dc-e154-08dc42018e62
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: af1ff55e-fd3b-4336-593d-08dc4200b49c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:17.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyJk0BtvTepwPYGS2wCekCFDcmBG4+LUHz+pqk4VqFeRkncVIFec3lN3KXQ6Kd6quakkLqZSByuIRkAztaQRDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.3223999
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: h9pBCfhAZAmOr9sN4m4yrh2AVFBPcifONFgtGmcWi9bqQ9Lip7j8itoi0u8kXMlHmbgL4YZ/39BKXESNtoKtDVtwHwlArrpvSuEXkkcOqyEvDMlIPAsxgjGE0lY0LkfsQDrvQjJV4SA1fCNYuSC+tzhGZluDZPtzXWcvTV9PcK3hdJ7ZY1phwEsnvx0Xp3epGLnUSk+4L/kIz5Dvqr8S36Gqi4Ht6aM4YU2C7rtD+FKXl9l5Ps1sWKInzQGXJljYrFZWdRdPmigVOkLjkBK8dC2oClBnd2LK50yPE49AE51G7oBtbmb9OCyXsOZl9x+bzNlQZDnPstKq9xqA4GXnxcANXsbkKBxCWmSRDZjNkTtWOb52kRa6a6R2O0+4X4Td3KIV80nFPaOzXcH7HzwgAZBibkOPRPJzUtXV8TUuB7L0HtRipOnrN490+Y9PUz00ni/krfHzSilNjyE5rqF2zrBZVo7/C2FyvB5b+ZDHf54qa/Lt0V1VWkKalbHsrQHDVsjmc94B+JhrDLmezK5tz0xFOhzMWEdTxBcqpwar6t4jGJqoB7Sw+m8I3+evb3D6aj3hqfLsRdIu10gW7ialvS6KK1IKeUqkJNlwafXMCvZbmD/WfZUDv324585YHRhQFzVRE20pet9d0hAeaOPZmkyptC6yANt4O4duckmcFdE=
X-TUID: /6eqATVI0Woo
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: af1ff55e-fd3b-4336-593d-08dc4200b49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qjkcV6gESu4qdD7LeVmZ4bLvMqwQOJoUAUURJO7IEg4+8Om3Kx/arQZHW6wn?=
 =?us-ascii?Q?nBR3/6CTL82TPQ0T/Nx1VWozzOxKg3LMu8tGInD0SSv1iSqNXkhNfg649V60?=
 =?us-ascii?Q?e3/lUBWPOsf7D7UzJo03ckodEX1URWE/O6540/5qFIHsDKlWYyB7zx1Q7nhZ?=
 =?us-ascii?Q?EaiZqcwlEfv4dcaRMP1Si8isvVYE2RYP5p85reN/ddgL6Jh8IXRGam6/qTdZ?=
 =?us-ascii?Q?MxZMBbomyKQSdffg8yx1UkNS2wB2n+aKg63H0JVCO4Jz/ZWXNmyPtgFlHafv?=
 =?us-ascii?Q?gsfm2wQtOE2wiMl2uiIJKCcpWlz3+OjrhS0XAAdaUIuk0w2S+rkesX9yVbjk?=
 =?us-ascii?Q?MQp1MvS2HkUPp18aRH9DWSMLMV6H4B43lBJabwGrruIteH9v35a08ln0xiNi?=
 =?us-ascii?Q?KMrYedZniUCGoi1HuWH15KVTLNmcrshaZtAkJ4ucY+WOEbrOJWMVfu1RBhPd?=
 =?us-ascii?Q?GFbp4G7Rc8xXkMK7QgC39ceY8w9GCGXDZ300VIha5S5Ptf4OhzWtjSATeeVx?=
 =?us-ascii?Q?Na3qSNfyFa1eHF23MPa/Ca5lrGhg9PjVN8QYtHjWMMpVpC1B4f3CstNTxnzl?=
 =?us-ascii?Q?iAGpGIggc4F6ZsUUrKMtTUo5cdyepSElCe5b9sHSLzyVOVD6bEdE+vjlH7VP?=
 =?us-ascii?Q?EpEBg15lGnuCdGtcODIGushMnPhQvB1TiN0LIhmHGk6zzUezDKgkpL9GOgS4?=
 =?us-ascii?Q?pNr+d+LOPErW0Zq5ijraEhSas+nStDpr7fubi5xYRC4+8DTpXNqwO2Hotsuj?=
 =?us-ascii?Q?BVJfdvxd6Yvi2DvD08qR2SYpy4qooeoVGmFKGVHE+cbLX4Hbuy4purT8U/vP?=
 =?us-ascii?Q?3lbKht+HN+6HhX2zBduUTegQfGd2Mbtef4B+bqQEnC138aEBlHZrdpRPyH1/?=
 =?us-ascii?Q?E6oMEYbSLlV1z8moRr/EO0urUS8c6qGwTe3KIw7QNIXjGcM21HKzpTJy4Uqx?=
 =?us-ascii?Q?pLN6x3WAXVhHQKkMBUcFMDLHiaAA10ZtkvIVyklS13mhIJDBYCwEYnqbEmKx?=
 =?us-ascii?Q?Vb2cu9XB+6+r83umGU0C7O29/kFVmJflhWfFP7YLmDnXP7wZlmrVPq+/SaDf?=
 =?us-ascii?Q?Bl73XsAjE/OeHALa938teUgRIfOCVpTDmywVE824NWGUonK5HPsW3+hIHNjR?=
 =?us-ascii?Q?ywH7x8sB8JjjJLCbg/6hwhUIYjXQM9gze63uhZFbf+cQ33kRJTVEh9nutPa2?=
 =?us-ascii?Q?RUGY99D6ICQebiBqcgQ2N1v/awr+zQeRfwaigFkYqjbp3gKTJyW581wv88DT?=
 =?us-ascii?Q?qgsXywqLUNDbc4JZyXG6tb1gwIIdisYaFX6V8YJ3MIBLo/DF5UU///XSvyyD?=
 =?us-ascii?Q?yJ22glzxLASChwU3pyWl/2Dq1AzNuaHvTfgxTWkhLO2DIWZtr8HwzjFLK07w?=
 =?us-ascii?Q?f99uX5OgsmlPga+6mpESRVcouMsHfUlKvN23nr6+6kEYB40E44t+mKSUmiF2?=
 =?us-ascii?Q?RtcQY7joWLUUhsnkLLJLgSIfmp5OVuipRtCRlDKETZyMm+0HfG/eF9oXX+t6?=
 =?us-ascii?Q?7Fo74QTbsF3UIpcVq6Bk2ENj+zjXFBzkRnOjpsm0FA0dBQCXeHmZTpOOj7up?=
 =?us-ascii?Q?ABRHpTFUq3kGJAItobf5TO2UoVCmZ4WtNfz/GQqwPDxeMQQc3fKPPfi6q9nA?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b227191-e366-41dc-e154-08dc42018e62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:23.3570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D4FJX53QawQ5xjRbCxZJlOcsbjw4PZ/xsdDw9j1bo5amZSTF8ABJDC4VYUdtPLA8jjYD3cs8u0tbgFBG2osJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

The mem_access itself is not holding any lock, but attempting
to train lockdep with possible scarring locks happening during
runtime pm. We are going soon to kill the mem_access get and put
helpers in favor of direct xe_pm_runtime calls, so let's just
move this lock around to where it now belongs.

v2: s/lockdep_training/lockdep_prime (Matt Auld)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 23 -----------------
 drivers/gpu/drm/xe/xe_device.h |  4 ---
 drivers/gpu/drm/xe/xe_pm.c     | 45 ++++++++++++++++++++++++++++------
 3 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..49a413725c8f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -45,12 +45,6 @@
 #include "xe_vm.h"
 #include "xe_wait_user_fence.h"
 
-#ifdef CONFIG_LOCKDEP
-struct lockdep_map xe_device_mem_access_lockdep_map = {
-	.name = "xe_device_mem_access_lockdep_map"
-};
-#endif
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -702,23 +696,6 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	/*
-	 * Since the resume here is synchronous it can be quite easy to deadlock
-	 * if we are not careful. Also in practice it might be quite timing
-	 * sensitive to ever see the 0 -> 1 transition with the callers locks
-	 * held, so deadlocks might exist but are hard for lockdep to ever see.
-	 * With this in mind, help lockdep learn about the potentially scary
-	 * stuff that can happen inside the runtime_resume callback by acquiring
-	 * a dummy lock (it doesn't protect anything and gets compiled out on
-	 * non-debug builds).  Lockdep then only needs to see the
-	 * mem_access_lockdep_map -> runtime_resume callback once, and then can
-	 * hopefully validate all the (callers_locks) -> mem_access_lockdep_map.
-	 * For example if the (callers_locks) are ever grabbed in the
-	 * runtime_resume callback, lockdep should give us a nice splat.
-	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
-	lock_map_release(&xe_device_mem_access_lockdep_map);
-
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..2653f53bee4e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -16,10 +16,6 @@ struct xe_file;
 #include "xe_force_wake.h"
 #include "xe_macros.h"
 
-#ifdef CONFIG_LOCKDEP
-extern struct lockdep_map xe_device_mem_access_lockdep_map;
-#endif
-
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 847b263afe70..393f14411ae0 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -68,6 +68,12 @@
  * management (RPS).
  */
 
+#ifdef CONFIG_LOCKDEP
+struct lockdep_map xe_pm_runtime_lockdep_map = {
+	.name = "xe_pm_runtime_lockdep_map"
+};
+#endif
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -297,11 +303,11 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	xe_pm_write_callback_task(xe, current);
 
 	/*
-	 * The actual xe_device_mem_access_put() is always async underneath, so
+	 * The actual xe_pm_runtime_put() is always async underneath, so
 	 * exactly where that is called should makes no difference to us. However
 	 * we still need to be very careful with the locks that this callback
 	 * acquires and the locks that are acquired and held by any callers of
-	 * xe_device_mem_access_get(). We already have the matching annotation
+	 * xe_runtime_pm_get(). We already have the matching annotation
 	 * on that side, but we also need it here. For example lockdep should be
 	 * able to tell us if the following scenario is in theory possible:
 	 *
@@ -309,15 +315,15 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 * lock(A)                       |
 	 *                               | xe_pm_runtime_suspend()
 	 *                               |      lock(A)
-	 * xe_device_mem_access_get()    |
+	 * xe_pm_runtime_get()           |
 	 *
 	 * This will clearly deadlock since rpm core needs to wait for
 	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
 	 * on CPU0 which prevents CPU1 making forward progress.  With the
-	 * annotation here and in xe_device_mem_access_get() lockdep will see
+	 * annotation here and in xe_pm_runtime_get() lockdep will see
 	 * the potential lock inversion and give us a nice splat.
 	 */
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
@@ -343,7 +349,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_irq_suspend(xe);
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
@@ -363,7 +369,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	lock_map_acquire(&xe_device_mem_access_lockdep_map);
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
 	/*
 	 * It can be possible that xe has allowed d3cold but other pcie devices
@@ -400,11 +406,31 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 out:
-	lock_map_release(&xe_device_mem_access_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
 }
 
+/*
+ * For places where resume is synchronous it can be quite easy to deadlock
+ * if we are not careful. Also in practice it might be quite timing
+ * sensitive to ever see the 0 -> 1 transition with the callers locks
+ * held, so deadlocks might exist but are hard for lockdep to ever see.
+ * With this in mind, help lockdep learn about the potentially scary
+ * stuff that can happen inside the runtime_resume callback by acquiring
+ * a dummy lock (it doesn't protect anything and gets compiled out on
+ * non-debug builds).  Lockdep then only needs to see the
+ * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
+ * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
+ * For example if the (callers_locks) are ever grabbed in the
+ * runtime_resume callback, lockdep should give us a nice splat.
+ */
+static void pm_runtime_lockdep_prime(void)
+{
+	lock_map_acquire(&xe_pm_runtime_lockdep_map);
+	lock_map_release(&xe_pm_runtime_lockdep_map);
+}
+
 /**
  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
  * @xe: xe device instance
@@ -416,6 +442,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	pm_runtime_lockdep_prime();
 	pm_runtime_resume(xe->drm.dev);
 }
 
@@ -445,6 +472,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
 	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
 		return -ELOOP;
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_get_sync(xe->drm.dev);
 }
 
@@ -511,6 +539,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 		return true;
 	}
 
+	pm_runtime_lockdep_prime();
 	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
 }
 
-- 
2.44.0

