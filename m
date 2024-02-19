Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C51C48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D1810E421;
	Mon, 19 Feb 2024 13:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQDJC6HX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70E710E421
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708347970; x=1739883970;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ouad/vHxK39+p7FivKsCI6Ov1bNBXrHsoCUjyrxzYXY=;
 b=lQDJC6HX5lsjFTe9MjyffWTdsG77rtdFuOa+9Igq5WrUuVy0LH6lDjSr
 utrtH0XtzQnnHlQ4cAWjo9O9drd4ZuqXhFvZsIwg3WBz7+pv4emaZBZx3
 FHzun93h+NeagSS04Ysc246eNCyzbvg4VrzxQIdRaseEjP9YwbcQAQKBz
 xTnoFEE4g4aLohltwUVKaFFoOX3xYt5U3LH12VK1NvF0ojDjgVytFD5CW
 x0GvkFh6MGX7Zs+jMR/rkuGpQT++6NeczLQhADUagds8ysfSOV5UKatzo
 jA95U2ZqXDLk9gEVTnfr0BTTH3bYSse43+qfawke+cKr/exudrTldml5C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2298217"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2298217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:05:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4875023"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 05:05:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 05:05:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtffZwviDv5OwELiQtQKvwtUrvrRLgfF7RBgfYuDvzfVlO1IMr/PC4f7Ut6xWouNKwsjTM++m8HlUICmMEkWbm0s8YAbH74+UflVR76YiKA8ChT6rgo1AsXWIiOll4VroM5y9KQBmr+endEnlJTfzoaNd/SrsmB0J1dS86erx1+ec+ahhpIqRI1Kiz7HOeYzUxL8eGx+JYF5yk/p+M0a+rwDdZrpsyNlNlwwK002dW0O6ysA88cgix4TOXcuwuQtES9qPp2Y5qiD4Ac5vtfxzqApjnNa6L+cBmeo7SBF2vpvV2PBiU4u2BBvp77KPf6KkemKIMlFSGV5GtGel766vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZeG858TNIKyhDuvwyovQILHFpLv/vTYwwUKzI/4jDs=;
 b=l57yyThWHTNAmZMK6TlwUW+q583EViD0hbleDqise2IPfMoz29DbyXmCOx1b3aBX3zq+K2e92hiKLPpr1cRCzD4IW5Y5vazeRnXNiwH7Oa1qK6F8Frr6UXdt0gjg+8Avoo7895XyItryydNN0K/kLAQsSSAUH9txSZk7c1tiwYjdU6LxUoZe+42lPY0fakuqEWbQrQw7U2Q/xopqGBFiAqKZ88wSDA/qAA5ti/NeNxxlwY/VwgZ5VERlnCTzeHFaGBQuuOTW6JrwoOz5MCMZVpVdE4LvGfZlRJfZ6XC/tLpV57wPGp0IWf6G3uYOzmqZ1zkZneDHd1dtzeT9Q6t4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.27; Mon, 19 Feb 2024 13:05:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:05:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 4/4] drm/xe: Initialize GuC earlier during probe
Date: Mon, 19 Feb 2024 14:05:30 +0100
Message-ID: <20240219130530.1406044-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219130530.1406044-1-michal.winiarski@intel.com>
References: <20240219130530.1406044-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: a08976cc-e7f9-4a67-b394-08dc314b7d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SofjolWFFg3HjmHVrRzcU6yQaUQ6rfm8wR4FQTBn01uwE5SwZvjq8qsYHPNxheK+49cvBJAQqGGscFxgC3sGNtB/PWGpZx2570v+Fs+FO3enb2lztzGteRGqtdHqcV2XjlEAlmQTefKWfpjH6GTb+3C0zznAZ4Cx6ivVWYJvIC//vBgZf+lUMKIzEhRiRqM0O+3NuP9s50iquut/6ExG3XbBeu1nTRUNFGuh7+gKT8h+risjfACrvIhkgrpAcqKOCiY3YWEhU+dxprGGlcjTCy0FK80jYI3hb/t9+kDrWQm+vjrEluSY59A4NRACcBAmxF2FnLSqXckYTbHlvky/ktqMVnbfWZ8qH16cRMy+D/MOBLXiKlnLmkgepQpyuR6rYBZNq1Hrhp/vJ4rAwkqJuTNvc4Lr6xIdC4Zv77FGGL/V4BIq8j1Ei9vQH4jUBuP4bOSlEK/IZHmoJv++7Bl8YJ84+3Lx+KHdgut+yNec770nkbXCedW7M4YvfFRYsAvzSUxYI12lm92zPZG59nehc2rbZoCKJYTEUc3TxrM3HiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NndEcjI4ZHNFcG9yZkgrNGJNSDZxcnJhWXk3TXJKNGJGNUVLUS9XK0N2U0dl?=
 =?utf-8?B?M1VUTHFzU1lxeUNyOEloYmF2QVpUTEpLeUFjY2Qvdk03UUlISHVubXRRakd6?=
 =?utf-8?B?em1DWnFBV2diaXBlcDNLYVpsK0ZzaEtOR0dNaEZnS056YSswRkMxK1ZJK0RJ?=
 =?utf-8?B?dlBLdTdaeVdkWExPYjcvK0RVdjM1aHljZ2dEMnVUd2UvNjY1aTZmQUI4d2g3?=
 =?utf-8?B?WWtOVktlVWQwd21VMVVLUy9NTWpTUjNmMDVUSmlXQWxkQVlNWjkzUkg3QWo5?=
 =?utf-8?B?RnNjbkU0WmhVTkFydU1uaHU1NUhnanlPV0ZKT1ZXZHA5cjJGeVVhU05yZFNw?=
 =?utf-8?B?a1g1M2phMmRaMm0zWU03YlVxTzNwZW40MmZhNWlNdURwNkloekdacDNpaVBn?=
 =?utf-8?B?SlptSzJCTmhUcHhRQW1JQ3g2eTcvV293UWo4MlJzeEJQZ2hPR2xDSFhIVjNk?=
 =?utf-8?B?QldDQm1VdVMzekpqZjlvR3F5MjBxZlA4VjhUQWpNMTMvOHNXS2RHelE1aEw5?=
 =?utf-8?B?dkFFMmtDbGRyanJhZFF3U1gwWHczK2lYOUFDb3AvR2F2dG1iMmVoM2trMVFo?=
 =?utf-8?B?eUU3bUNmd3pVV0JtSUZ5YlFiNk9FZS8raUtwQU9aSzJZVFRxeVEza3k3YW8y?=
 =?utf-8?B?NWoybDUvOTZOUlBTN29KQjRMaHZuWXM5aWlad0ZVQ3BpM1V3MSt2V3phOWhW?=
 =?utf-8?B?V2Vmbzhwb0pXKzRzVlNlLzZhQWNseVF1Mm5jczlmN0ZYYlhVZ1ZTVVZNUDZi?=
 =?utf-8?B?V0RrVG84WjZEQ0RmKzFyUHI4OHpjWE8rTzF2V2I4SWhWazZId3hYbnpPdzJq?=
 =?utf-8?B?bHJsekNzK085MDQ5T3RRL1gwVjlRaTh1OFRRekxXVlNVZHk1aXFyMnJxUUll?=
 =?utf-8?B?Y1hpRzVrWjBIM0I0UUtTK2tteVp4Yjk0MWZWS2kzT3orL3UyazU1aFNodUZu?=
 =?utf-8?B?N1o2WTlKQkhWSmd2OExxc1NMcVVNM2cxMjlBVnhpWVkyeXVCSy9ZbnlIYld6?=
 =?utf-8?B?SnZkZFNyd0VpL0NBcWNnYWFMUlI0NEpBSW1EOEdTOXUxY0FkbnloQnhOdjJU?=
 =?utf-8?B?VFRxYlVtc3FMWFRFUnNQL1dzbkdhYmxXZGtRWExHODlpNTlYQS9MMzFBUnIw?=
 =?utf-8?B?VXRJUzdUVE1GZVJPWENLemZvWExtK3p5N0Fja2pxazQ5S3FWekxXbWowNUJh?=
 =?utf-8?B?VTZydktmanlWM0ZOeW1HWjB4dW0wdjFuMEMvL3VzRVdFL3VnQ2QveG9xVXZy?=
 =?utf-8?B?aDNWVk5TSlEwYzRqTXh4MnVHQzI0UWxURVBWK1l5U2x6d2tQcjhrblBhT29N?=
 =?utf-8?B?QUZUUGlucTc2dDhYa0IyWUY4R2hSQUk5WkRWTVE3ZGhzMGgrM05OVi83eElQ?=
 =?utf-8?B?NGJMcmlBNUQ3akp5Q0czUUVtRHhpK2ZiV1F2MXo2K1BwNXpjb0RTdlN1ZVJ5?=
 =?utf-8?B?dnNNSTZBSnRQeFNseDh2K2pTelJkQ1cwMWgvYnVNOGh2eW1ZN25wVE5ONlVD?=
 =?utf-8?B?UHI4MXVFcDE1cFBIMzIrZVd5aFJLWHpCbTdUNUF5S3R3bFg4UUloRjIxVkdn?=
 =?utf-8?B?bmxCeGk1MXNQSkpXM1ZkSmZIbVBpa1pnOFpaUkF3TTI0alpHbkZUSGZLUjVV?=
 =?utf-8?B?TE9uT0xuRmlUM1V0ZlZ1ekRKbHhCNWJ6UlNydTk2bzhneXBvOElrSWRnUDZs?=
 =?utf-8?B?OXpNN1l5TWw4YTJScy9GNlcwZGd3TWdYdEhaZ0FsY1ZiOXovcFNDcnJpck10?=
 =?utf-8?B?bWRqL0xWOGI4OGtMSXFOOHJoUTU2YkJadUxQWGV2dVZKTnBrdmQ0NUZQb25Q?=
 =?utf-8?B?Y3ppYnZhWkQ5d1BqK1dBc2R0dytWT0ZpdmtPdlRNK3RJbGlzR2ZkV2lHMmFz?=
 =?utf-8?B?a1FyTzNRZjlxTUhVeHNsZEc2UnRrYlJTVG8rWWJuWmQ4cnFzNHQ1RlZKVXFI?=
 =?utf-8?B?T3VtRlNxTDZXY0tMMDZGQzllZU5YNGtnWDE0R0tIQTczS0F4MTQzZ3JuY2RW?=
 =?utf-8?B?Q01GMlJZVEVsVTQwQVNDQkhnYVY5eDlWeGwvb3lmTkVvbWdDNVVSL0krcmQx?=
 =?utf-8?B?QXZEbWJUdVpkSlp1V3g3UUN4a0hQdFc0WUhUc093cllDdzFGWHBrbWRuUFZQ?=
 =?utf-8?B?RGtKZ3RCcnUwNmtaNnJHcFhmR2ticCtPb01hWG5PNGVIN2dSTFo0WjVBRVNx?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a08976cc-e7f9-4a67-b394-08dc314b7d32
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:05:47.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCVp2OkmmlPafbd535Wx6jM2H1HDPZ2pKS1fbrJ6x+6e+D6zW0Xr/jzaghSKrCNIzZYM1G8fjIV9zWMxcSAXlfM05GjH9PRd4SOM2zDfThQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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

SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
to access a curated subset that is needed to initialize the driver by
communicating with SR-IOV PF using GuC CT.
Initialize GuC earlier in order to keep the unified probe ordering
between VF and PF modes.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c     | 57 +++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_uc.c     | 10 ++++--
 4 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1cf7561c8b4d9..ca85e81fdb443 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -463,6 +463,12 @@ int xe_device_probe(struct xe_device *xe)
 		}
 	}
 
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_hwconfig(gt);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index fdfb70c7db9f8..b75f0bf0a9a10 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -315,7 +315,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 		return err;
 
 	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	if (err)
@@ -354,8 +353,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	xe_pat_init(gt);
-
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
@@ -364,19 +361,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
-	err = xe_uc_init(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
-	err = xe_uc_init_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	xe_gt_idle_sysfs_init(&gt->gtidle);
 
-	/* XXX: Fake that we pull the engine mask from hwconfig blob */
-	gt->info.engine_mask = gt->info.__engine_mask;
-
 	/* Enable per hw engine IRQs */
 	xe_irq_enable_hwe(gt);
 
@@ -444,10 +430,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_uc_init_post_hwconfig(&gt->uc);
-	if (err)
-		goto err_force_wake;
-
 	if (!xe_gt_is_media_type(gt)) {
 		/*
 		 * USM has its only SA pool to non-block behind user operations
@@ -474,6 +456,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		}
 	}
 
+	err = xe_uc_init_post_hwconfig(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
 	err = xe_uc_init_hw(&gt->uc);
 	if (err)
 		goto err_force_wake;
@@ -503,6 +489,41 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	return err;
 }
 
+/*
+ * Initialize enough GT to be able to load GuC in order to obtain hwconfig and
+ * enable CTB communication.
+ */
+int xe_gt_init_hwconfig(struct xe_gt *gt)
+{
+	int err;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto out;
+
+	xe_gt_mcr_init(gt);
+	xe_pat_init(gt);
+
+	err = xe_uc_init(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	err = xe_uc_init_hwconfig(&gt->uc);
+	if (err)
+		goto out_fw;
+
+	/* XXX: Fake that we pull the engine mask from hwconfig blob */
+	gt->info.engine_mask = gt->info.__engine_mask;
+
+out_fw:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	return err;
+}
+
 int xe_gt_init(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index c1675bd44cf6d..ed6ea8057e35f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -33,6 +33,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 #endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index d62137306d280..7033f8c1b4318 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,13 +32,15 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
+	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
+	xe_device_mem_access_get(xe);
+
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
 	 */
-
 	ret = xe_guc_init(&uc->guc);
 	if (ret)
 		goto err;
@@ -52,7 +54,7 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
-		return 0;
+		goto err;
 
 	ret = xe_wopcm_init(&uc->wopcm);
 	if (ret)
@@ -66,9 +68,13 @@ int xe_uc_init(struct xe_uc *uc)
 	if (ret)
 		goto err;
 
+	xe_device_mem_access_put(xe);
+
 	return 0;
 
 err:
+	xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
-- 
2.43.2

