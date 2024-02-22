Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78F4C5479F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8809910E9BF;
	Thu, 22 Feb 2024 16:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMuGGn2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8422C10E9BF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620018; x=1740156018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JSIiTbnZG7ceRv+U8JCWhGdlKkiUn7qUPnMbNPSZUrM=;
 b=EMuGGn2JXMKvyzb5vTrVWhDpdlHWku6SgSr/7EgpAptqJk+OjDvl8oA3
 JoNjcfLNwoyRH0+Zr70kYzi0CwO1JDPe9fX6+SznVb7rfx+ONVlQw9mr2
 G/QD/A2I0rGgfE5lGNtituPsaf99uuNyLWt6xV/+Y6uqE1+jvb0Me2850
 8WNJrlyDANG+1Hff5KqqhBGirZCHoJLVR2+mSqFMIAGgVvFYN6GYPLheN
 qmOwobqH6aiKxPLxT/I8UrLko04LJpsWISkBjkTQ6qOC6VzBcQYWK6yAS
 j32C/TaV+VCt4+ghAEfkf6sMUx2xGW0bH8MeFSrIhL9Y5LQ+cfhVHmYYp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730694"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913552883"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913552883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqZo7cf3hDPZIoxRJesXRvJO+S81/K+ptweCIdiUMQHvEoHCDdGhmV+zea/DiwlSg0iFWgcKYCyzY0KCL+X0DJWepGzLKRd0a0nxUQM55mnIVKHCKyp876GW/qXOd5MSxhZ8QtnXgr052/y74H9K//2Dp0irXr7obQTfVwRa6AQ0EAKD/YECDmXY1Q5Yp5fJ65ga/daSJNBlxfAsGb0sdQRiibQa1nWiu8PcCCDJW1EzVAP7GrIbkb4A8kiEiyzkq7Mbk2wHt3GUsa2v/at1e9e1lkeLAzWwpg0zkkQZQCHfTHqIQBE1PEEYp35Ry90trZnaig48j/WrnuvIXJvY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJm3YlJCoorr6BJHVR9jchH0+E95epySU/8eUnCGM44=;
 b=azA4UseeCnJQvfRWt3pvCE8u6pyVTmeSCmn/uQFGvFZG6wfpj8cLHUB3IszhagEymVJHFWiF3mUPfBhX4yBB5s1U9RoFWawJCdYu57XGdnLwpNgjVFGeym+4aSZFowVCwukHUYD1aZezv57n6p4uBok+r0vDbCtjSDNvVPs8XesBkbxH88NbIypCZ1K1E+72UdACBGVLJ+h/xcE9sYutWjrQGv1Jdeorf/Qyd8sn7irut+R6hN8d8ndjc0sJ/b8CHOvX1VkInTk0yYIihUc4uaKXWg2rRJGXlemusHCioVdNEDfTEJu9LLVIl1twl7Po0UGuxTpvIhC+6Vix9mt5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 10/14] drm/xe: Remove useless mem_access protection for query
 ioctls
Date: Thu, 22 Feb 2024 11:39:33 -0500
Message-ID: <20240222163937.138342-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b1c13d-0c46-47d0-ecdf-08dc33c4f139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSORSVnsSwB1jX9p//jxG3Y4275lTwQCulLTXGbx1SXljP/dpND+oJ3feDkDGdMzZXLZHEZnauc7nvDrJ45d5+ooV9PHmNhE1I2+I8in177/PBU9yjsbjP0DKK42VKn4ZGVhzRYgOgA+fGeP/uAZvnup/U0dXWxpoCQarTtEh0Tz0+KwCkna8P7kOwG0v9lNclQ3LhNqGe6gCkMWU1w7NhCiMr3XWluvr4ZoZ7gksMVuKswAEiKDDESle0btz6KTajjX5v78t+5unjR4xU+3rn+VAt9g+ijypVS3wsREispx2ZkJ/zW22xEP0uLVIxPI0e490UiUSwM/pPheRICsSiEbnXaoatxWqb83zFAUA8AOvN8+aH3W5KRV/fiDuWczAB8DFa1BB+RCh03nGS5p7JWDgubOGf7r0uatIdtgmmtuEyKt85Ne7GXg7/sgGG3OLWaT/H20W1ODjpTiPk3V35DoJhOTUd9idBHCGdtihHUsy9n+57YHLcqAwtnh/U0HVTuR9/vKsONOLKK3ujqrtnqUVJQCj9xwl+L+s6d7QdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6m8ue79770A07hVlJUqGkZ4GSSYOGfH3D5IJ0nFx7dzdJN5HajqPNJHIn/Zz?=
 =?us-ascii?Q?yjtu4egeyIOr2TjSK3OvG2DIDOnAI/YGIoQhOBSDBcNoKDlppQ8b8EwkFVhD?=
 =?us-ascii?Q?BlCEFftFnEGy4iuRZfWefvBu6AKrkYutfURmMUm2c6nLoKzs7eu/EOJBA1ll?=
 =?us-ascii?Q?oQ5xUYGc9mwI0XFCmniKko1tKM0qOq38by3C6goCyAgRBiPaEfy7pKVfxoWr?=
 =?us-ascii?Q?6siARKvN/xThuvQ5fMqvMM9mX/1jIfmUBmCYwIO+oLjCSr0OZq7VYDyHn2FJ?=
 =?us-ascii?Q?PTlbGm/zgufKgZFHZ+FlGx12qCQ6hzjURjWLgnUtcZEbtCVBAUeT7+92lknw?=
 =?us-ascii?Q?qkp/xPmhbol5XQGu/qUyVmSNgTuJw3T94SkAPZZdSs60y+ptIWKYJyyEFhPL?=
 =?us-ascii?Q?dvGD5Em1D0uPMaM2RY1vLPjFcBvyGMtx/ARzblkK9o4Kwvc5RsQwF0fYpuQH?=
 =?us-ascii?Q?IFl5k5J5fRoRFZMlOm/ZQHrdjUEp2aUN/8DopqDelessnbRJlPL3SRQfPXJu?=
 =?us-ascii?Q?29/4vLTmhzHwc4svKM4pdngav5Y54e9fd17hoaI74uAiPlVED9I8ksU2rqnF?=
 =?us-ascii?Q?/BbnKFX8wP3l/EEm0Ea7mkTokCFlToqzMG+xh78obwxROpOCXQK4nOm29WmT?=
 =?us-ascii?Q?kBZbWVRYmUjUPzIc/fkOJ2FUmJkXCiS7uCR9vU/pO3pXEXs4gzexL3mqyVXA?=
 =?us-ascii?Q?pPPGr5zAw/BYj3An84Dx0Xtba66v3HfEfJfILK4oh8tZVhZusrQmqOPf0wv8?=
 =?us-ascii?Q?6Z11ee0clObu2ZkQawrN2FisApKsxbI/Vzw/vSOdX6HmiE26nMOzb1hsRk3r?=
 =?us-ascii?Q?1GzGwsVm/oGXSu1y8Ge6ZtqDOiVo3YbNiAaxPtPfMqmcbWFulabtOWTW9MCW?=
 =?us-ascii?Q?Cy2dDlqaHvlvLiJpt0QC5PjO7cHDYGKTwmEazsnjy59uYPY8dUbMNtTtJDKL?=
 =?us-ascii?Q?Bws4tQgLUTd2l6L3RDmUPW6uzGTBv3ZyaM9zQPYIxC2TjXAAnYLSjz4c15+F?=
 =?us-ascii?Q?Bwurh55S6o00PfLFC1KSb5R57iwCsaxF9BI1HAMZ/kbvtIlTKNG6KMrR9Y6C?=
 =?us-ascii?Q?mUizN9linngC97RZStts5Cuc98JGpFtHz+bZKGp6GAIyLA7A5aZ3LzVD+1z+?=
 =?us-ascii?Q?XhyXWNox2JbIGN63XMPz+3CaexIr+EwgYZIwoTKuIjGkUl+Sj/UK52pwlVbA?=
 =?us-ascii?Q?+wEp4VQPbVTCvmODfOnMzl97MGRc/bfbUzwzPjLMjdp29/pxc3gMhtwoH6At?=
 =?us-ascii?Q?QDXzHF7YYAg1qtq7oiNVleqLEVql7ay6rW17T1A7oC1sq3AyEyoSC7bL5ZSC?=
 =?us-ascii?Q?4nFzODfQPBWQY09iMDsYo7X0ZSOuxGNYaAnlc6Plaxtlx5D9yFYXgDjZreYe?=
 =?us-ascii?Q?XFQEBMHMsBO3QxBlw30n4rqgkzduqRx43TNczDm1EX4NpvWKvLzMaSfcmIx3?=
 =?us-ascii?Q?bL3gdR04ad0avDZMzZmF6z7hBfZC4AfaAU3YZcLWVLnJNd0C6FvnJTdXX8iw?=
 =?us-ascii?Q?VxVdPC2Mew3VpqrgcLgrkV9s54o/DtdO0VaAVcTLYhf+X5PxWqKGmVjwPDgX?=
 =?us-ascii?Q?EmAH+dtrdSPtCGqrcezKkW7684ZKlS/3cdsObmz1InmmghDOnb7jPY/Zj8Yk?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b1c13d-0c46-47d0-ecdf-08dc33c4f139
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:13.5898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhHHWA0uq5S0uHFI1L1Rm4BFBE/zb3gam/ItgfJpQTXF6u6s4EgqpXmmdKIApkVdQfPXXRJl7cwqgwWrduWtXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

Every IOCTL is already protected on its outer bounds by
xe_pm_runtime_{get,put} calls, so we can now remove
these.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 92bb06c0586e..f1876b556ab4 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,7 +147,6 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	__read_timestamps(gt,
@@ -159,7 +158,6 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
@@ -433,9 +431,7 @@ static int query_hwconfig(struct xe_device *xe,
 	if (!hwconfig)
 		return -ENOMEM;
 
-	xe_device_mem_access_get(xe);
 	xe_guc_hwconfig_copy(&gt->uc.guc, hwconfig);
-	xe_device_mem_access_put(xe);
 
 	if (copy_to_user(query_ptr, hwconfig, size)) {
 		kfree(hwconfig);
-- 
2.43.2

