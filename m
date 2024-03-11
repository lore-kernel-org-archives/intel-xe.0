Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DC3C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695C3112C3A;
	Mon, 11 Mar 2024 19:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4Cg3PiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291C112C3A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185373; x=1741721373;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=5kbhf1xbAIctSZ8eqpCnNc4Fe/rt3++0NZGwxm7kKJY=;
 b=C4Cg3PiPjsZBstkTRreXVJ3HU2j0e5KZ3eh6ZOKJvHVuo1ixZqyWpTDa
 AX9ANNTJYSikdLoP6KdS/1/M4DzVpzsAR3sXV7/86LPkc4jBIHeoRhMZ4
 ahafKDoxDPBbH1geYXzGXxpol2/mQc0MT3ugrUkUcBCMCZoBR3xitRY+P
 4uqpt5/0eqDhP4H7lJXmOTOvWMBy/CR72TGHZusW8rOPdNV2aCP10qegE
 dgttX1XAN82VKJlV5YRK+D2JgV/eyHcBjkWlrWYmObXNenkJHR4uFXjuK
 K8HX8HBOgCr5ip6Y22n5aphb5anjKMGEC/gx8rjiWq/72D9o5c4ptEDwi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8627947"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8627947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="48717177"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF7VsKktxGPLrQaHckAxakyRqhNYEABl/7G+H1m4nQkgiZcd1yAi4HZ8HDbMrag6f91UIK9H2272tbEyUwH3gCzlR+SxRMsykMIWGiiUfaIydGQ883v3hjTjms4rsgvHjN6jEBrDGCnzphUXnrOVAVzGK9I51VyoTl0OHQae1oKOavJvxba3FpC5l9Sjmykz/GayNadlF5igI/w8sc4GQ5rMDTLiCiuGy9FuAvYXDuteiOlJd6EVo22oMJlgZ6HTCVraL4IW2m8w3EGXfcJmwMQ70EXJI9UH44VfDGM4ceeGvS+eVDm/VQzDJ2UanpsmY3ZVrEgwR+LVTsIZTXSrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEgnDhXMzqO3WTV37HUuAMsl+sCzS5xhJh1fZhnSdyo=;
 b=gfy+1RSYBg4aqMwl+FQonbowSdMtQTzkSqCpDL2c6QUQx5A0cKyW5eLtowrdmL0Z+lO6e9zfwrsrt+aY1ojSo6qZ5yipQhlgrXRmpLiBMeGKwwEp0E8by5pf/orw2sx86VKvNHG0RWb6xlrsxoOpT8NatFMawzT9zObRtKc2kfjRYFKtq1586ieVR7fWqxpg6wEm9MvQ4/up8gL9qce1IaL5YqTOmLnLrQhRNedUfXtomE3OKmQwzjj5SZEtHJ/63EbnG9IZ2mqUIWI924XVs8mWOGZ8TmqW2J4IYjmpCyJoQTQLCXFxucz2bsO+3/+zDhV1s8y3xMAMuZEGe7/cLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:30 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:26 -0400
Resent-Message-ID: <Ze9bljo96A10dCOA@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 05/11] drm/xe: Convert GSC HDCP from mem_access to direct
 xe_pm_runtime calls
Date: Mon, 11 Mar 2024 15:22:57 -0400
Message-ID: <20240311192303.33961-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4526:EE_|MN0PR11MB6059:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdde4d7-9e99-4151-e259-08dc42019283
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bf6f1a-06b9-4d51-aedd-08dc4200b6c2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:21.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBJ5GhbgJu4ZTK2MFOLXBcvyU9aGiyjZLmMLWOOBumRTP7nY3NbFv3h0/HPkPXTMadc+iVnpDjz8dsrQD5vA3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.2325200
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: YlMQ8yoG/kWOinIfQBHN5zA7b9udFCgK4lt4DykcTTlF4dJtVbUVsK2mWTQ+EzEBlwlNOCXVvXcxGa0GHvZdtzyIkM+cuOulaWaPVPghppEU0lrxPYk0FVgSFKdhEOAf5Q/tqOgH6+4Z3n0WqCfB9v1rUhONIIpQh4xbFNZ3LIOw9QAmnIYQN98udcl65Q4SJ33v/b+IW90sh/DtyB00OYwFvlER1q9pjU2aCMAaUYnQ57Qgw4gy+O7X6MrBl4CbgeuqqBigGQr4x5u+JdXqIv+NKkE3//I6yTbybYxEgEeh52QcBXoMZuIpkdYy5as8SODdUOraH+mUXuBPMYjjSRJK3sWssCfEmJRO4eRmNCU5iwKIGLIcm0+OsSjxouFDE1lV0lI52h49lh4y0sQUlOJTcSDpF3lFPr/Fijwksrwjsi5LfSUmMJqEa2a15atXdItz3aigqnpNwuRXYGTVcKQNDD9qEcpI0nR7iEMMU1Jeqye100/2IratU/VEYcLQkFNknv3ewEVXBiCQspZVB0I8+WoBY7jhHz7Z9AEpfkrnA7ch9sTfFrd62klQLr1Ko/a1ThnirbhC77pKAbs6umpwXkRf8S2oxYyjMs4gD9ofLY0sU3LPN473K5GgQR/rvrD/gIr2Qcd5ynYKFvWgKWPbDf518SgvpwGlwYn2SM4=
X-TUID: q+5Wzu9/1n5T
X-ClientProxiedBy: BYAPR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 38bf6f1a-06b9-4d51-aedd-08dc4200b6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KC/4bqJslvCEL9tMHc9skRHs4bevmIwTD0Sva8zrHw1FtomCT0XIRLO//mZA?=
 =?us-ascii?Q?HWdeoVmC9tBEfZQEM7QCnW1d5jXLJjMY4hDy1lcd0CI9lNnRWd1Cg16vO4hL?=
 =?us-ascii?Q?RugOHEeUtb6jkVlLIrNoMDEX14/LZ+WU9aclkjyfvkeDRSeJiTgZN3b/VN0z?=
 =?us-ascii?Q?oe2XYZQn6BpiBeoiJpQZ5fgWwMO++sFYFUDQuaH1P4i9Zb9lKoV+4sjCyRvj?=
 =?us-ascii?Q?uSGn8ruAqhPPGWEjYgOfT8PFfh6KlRM8xo5bQzSWSs+s0rNSoKdqIuvRq8pr?=
 =?us-ascii?Q?+WrN8255MBzf+7fxKMsvGstw4qDobkgnzNTI6tIs1kXPbOpDJV5flnphQlie?=
 =?us-ascii?Q?yO8j0jXAlsaHb8M6O6HLWpp4L02UI+kI9WjW0JYP5dT9mZpO40b6ys3GS0Rb?=
 =?us-ascii?Q?G5axYXQL2pZqh8y1G8/5TfPYWPRo5OouYCvo+/J4NEbXbxHHkXTxaU3QXMoq?=
 =?us-ascii?Q?ZP8fjc3lMiYYLCpu7aXzEzQzNLJRrr/F46qMqye/uSGg0U59S+MmHEvwbsUv?=
 =?us-ascii?Q?D2ZmPz69JPAtMFKTJxP+42L8qUNmlDiFXyCp/6/oBnKCQGk6al+Sqj0ZtsY1?=
 =?us-ascii?Q?bnRWQo6DVxe6OS8QoO3nNEDS2W0bYE1sidZr76N9pDSoC056YWq2frAjqv88?=
 =?us-ascii?Q?NCnk/ogv3H9xETanXHpsWFA7BER2W9QJnj/Oroty5FWCl1BNq3E6dERxJzzT?=
 =?us-ascii?Q?PE5HXmqeK+Q/Mk3JSbzSiYGmrImwtZhHys3cndJV6yZAyhiTjl+LtM4rH0Jt?=
 =?us-ascii?Q?Z3ebdfDZlQIZgOn+cbFZBNTf1XlmG4yuoKYOzJSUavf8tQjDQQIT8ScxYT9R?=
 =?us-ascii?Q?yjtb18gGhCmr6W2mMwXfDtDiyvCL6xeYhh+9HLQ0jc9p1ocoOkRTz4vBwJp7?=
 =?us-ascii?Q?XdM96duk3mlCxGnl6JR8rnWNFFCANMujLrw+8BCreiuJbsB7Tcozxwfzn8gX?=
 =?us-ascii?Q?rKzZ/oSdGiW5M4ELeh11iDdpS8bxUT1MPZWfh5dMDEP3Q7hCve18KYNrGsUo?=
 =?us-ascii?Q?Y16WUqN4LJ4L0SviUqCSiS0edqW/c9A0sUoiJQHxukY5loHQ5dMgfurx0hyi?=
 =?us-ascii?Q?wHfz1EAmRz81lMvq9/tCn2BiGmodxroLBk1mksi1R6tt3jK1nIHjAG/Pemcz?=
 =?us-ascii?Q?ob2fiXcqWCvWF3s0F0LqEGYDGHbR/DEd3rs8THnjAbuafceWG48Y5xKUls0B?=
 =?us-ascii?Q?ZyCTdlpWhZFQEWgQF8H9Bp7CRvDQClOR7Z/O0VaF3jGkKQfw9WSwzD7StEDi?=
 =?us-ascii?Q?Ip/bXwG5/6gmQe0L4vfJHJm6UkCy/mROH9x5W9HU70wHijqGqSe0XRb5dlhq?=
 =?us-ascii?Q?b+sQIS9hLax64fF9iKqhPzkAfNBdYF5WOIQcgME8+5bOKYTiKAA7zc8G5Nsa?=
 =?us-ascii?Q?msSCFHsp/EKWqnu8+kl9/B/1BEAi8KoOrK3e406EBGnflZ1S60qJuwJdV9El?=
 =?us-ascii?Q?Wl4ug/PL0ZRjUgmhu4wFWaeGkAggRFIMjzWgF/+NxCjqDFqCCVxHioFIpjb1?=
 =?us-ascii?Q?XvuaHYBoCIMQ9lHjxk/w6Gb/6n+kZ9PMooJvxY4UYpaeOS9MD02iFTpUyjYp?=
 =?us-ascii?Q?xkq1lhudvZjyVw35Rl+Zr1IsOe6KyNM/jfN4MlTL1V06k8cnbqti4J5t3aTB?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdde4d7-9e99-4151-e259-08dc42019283
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:30.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaBT0BrPq/sbWvqTqbKMiUhwZfot8KqO8irQBPjved4MvGPc6YbyHxBmOQ++1PBJDiHZyQtufAR2+DMByVnfGg==
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

We need to convert so we can continue to kill the mem_access.

At this point we should be protected by the display wakerefs already,
so let's use the noresume variant.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 25c73602ef55..a221f0cf4bac 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -217,7 +217,7 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 	addr_out_off = PAGE_SIZE;
 
 	host_session_id = xe_gsc_create_host_session_id();
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	addr_in_wr_off = xe_gsc_emit_header(xe, &hdcp_message->hdcp_bo->vmap,
 					    addr_in_wr_off, HECI_MEADDRESS_HDCP,
 					    host_session_id, msg_in_len);
@@ -249,6 +249,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct xe_device *xe, u8 *msg_in,
 			   msg_out_len);
 
 out:
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	return ret;
 }
-- 
2.44.0

