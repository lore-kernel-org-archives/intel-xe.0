Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6D6CAC59E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 20:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2416F10E0E9;
	Tue, 17 Sep 2024 20:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOlsoRun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372BE10E0E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 20:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726605178; x=1758141178;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YJQgf3ZNjaGxbE5PsX64oatametGPCKyQfRaGvhBUo0=;
 b=WOlsoRungv8EFFHY+7GOV6cBQ3cP66MRCk8atb3b8Zb2WiDzwJcKWohl
 /qiRQmR59E4pgtKNomptAll46N3kXH0tYQ1OoKvUlXydUlwMbCBlSVwOo
 mPLSNMUGN1Q2SoTN/oGTsvVuC0DZlXEc/FNr2PXBGJyr8d2LuUIuUmSUN
 u2IoiLonOrJrQe7+pBadzBFY9HWes9FMSCzIuOlBk5wI+3SWVZjsV11wU
 g8vMMC6xviC21gWDRlXPRQ4ZY5jtNnRIBVt61WfXE1N+aU6+ciIV7KSh9
 dJcG9Y2G/1JijVf1lM3M0IHbB6o9sMn2wmVMRtgiYwttJQ0yCVHFEXHgA A==;
X-CSE-ConnectionGUID: Z74vWOj3TPGISfRP1BUpbw==
X-CSE-MsgGUID: fzk6pCPXQKSjXkkJv673+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29275345"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29275345"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 13:32:58 -0700
X-CSE-ConnectionGUID: YwJiOQZpQDW/N3FxbP80FA==
X-CSE-MsgGUID: GmxpbxasQ4Kozn78Ivc92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100146726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 13:32:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 13:32:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 13:32:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 13:32:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 13:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q24BZ07QGonSQ6OR4VEd2PvsPuJCNNx1HS+8Y0cwJIfOaj7ApJcXwBeWaNIkr0k2ZupyLqS54Ws2vu+y7Jbs5p0RDkS2k3OBOmofsR5alsLgdYbqIqNPZtNsOjw6RFsdra1WGujxYjzeUyYwc7+aHnaUWmahwlXylGHhI4EYGHrmf02cCrBNjB3OwnGJNECphM3PNSY7Sol68dqxiCrUEUIPa+FPzV2LPeu2hzhs/2/6OZTWSu8hzaMJsN1b0uz5FulY9qHzRgiDvKbD6b0W4j4oA+VQqfFFwO8PLdMzDK3RxUJJ4SNP0q/x0mmoCNLtfdorTda6eRvmohIDjlEBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWHh87XVW+d+z/Iuf0YawqSH8R5a0gRuJUwsVfjBE6Q=;
 b=tiLAncehnbWbvWmGtgf1zC0otIgYeAieJowHWC0+dsk/2IsKPNazthtrbeDtAiqC+d1yGXcOWKC71NmP4mxswWNp057UuVYU0d/ePkChg/973Zt9lpyi8og6XQul1b2dWQS5887gyhIh4uR/PY0wlaqTMgFKQbMw6t3B+OTQWyNHVLqobhmiGJOZsF4k+oiC++E+JUFFsj3JVPvXrqQ4zQUFAGIXl1544CBjub5gNhG492Zqnvs3kwJfioTEduLLhdhs8Mxcq5/nMEAgwHgyCIGhOTwt7dcevYq3517IziLR5F0+iTLy2hDcHi60HtI96mYe2sjzwf9QGsJ5RYVPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Tue, 17 Sep
 2024 20:32:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 20:32:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/xe/display: Remove i915_drv.h include
Date: Tue, 17 Sep 2024 16:32:43 -0400
Message-ID: <20240917203243.659393-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA2PR11MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db19401-3492-43f4-e13e-08dcd757e478
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ddz6TiH1748ayGTT8Tup7EMM4MoJtnsEdpMZdFv3LiBNGPeaRrEVhBALS7sZ?=
 =?us-ascii?Q?Q0Bz+tdTM6Cq94KFens1Oq0RrXQ589rIFzvLoECZEdJ8M+YrHe1SMfRFpVT+?=
 =?us-ascii?Q?KobM8RPHyB1lYHtazb83VLi81fvOvprGoN6yZpaFVrIvRcdnwkvfWOrN09NI?=
 =?us-ascii?Q?Yk230Xyz/35YQDCxdCi1Skt9WZiB2qzrGLbCgvfEtJlttBDih5kFNZvqtUZB?=
 =?us-ascii?Q?vzcwlBe8zgZ92vW9D0RioxlCHQZmWw6JsGFcgA3Xl5ZfZCBwrVIyukNEEoK5?=
 =?us-ascii?Q?XvEr6U+tt4iQgFcFzHiuqWsOAtOFfPC31GxNS+HwTaz9xjPy/GH6e1FBen9K?=
 =?us-ascii?Q?zN51L4mRpEj+rwIsE398H2aptl/8vcS6X9L955q3t9CMwF1W2ksVXp/RChTW?=
 =?us-ascii?Q?C2C8GXvUS42AqM3uy0AYVmbyJa8HFIhPWLNeEo25wAd+kLxiNXy+NHl2Wwg5?=
 =?us-ascii?Q?smiaG6jZWoryyFt2Mtf1inSjjaQrJkdtvLsoX2ojdCMb5sMrlmJV/6nxhoka?=
 =?us-ascii?Q?zRL+DOr/KSl4k9UqWfkxVWeIk3W1+gL4eST6/69hNHkn/MgpF8tTY0bSgaBv?=
 =?us-ascii?Q?+l5EM2dKk6e2JE1IofwQg/e02M1vWdw5zi9xIYnxQZocmEK2bfBBn6DjwIvz?=
 =?us-ascii?Q?/8YKyok8iFdcdR7s9JRGVQBMfmFF4CNkkJ3kJiGoQAWZG1nFY0Kr3kQ4TrSM?=
 =?us-ascii?Q?UmLjWK2f9Ab8J6MsNarozUHmqjOUBW7MEnPsIy44o7td2jHGaC1gW3yH+LUN?=
 =?us-ascii?Q?sltlITe69vsGPNhf5rsryqImxxHeLMCUIT56uSZKSR8CLCfueUZreB9OvQE7?=
 =?us-ascii?Q?JLiD5oyb9FVY1JcSXRSay0BSM1rV2ZBwH6EVQ3e7ZKQyLl+xyv6oKsp1mkJ9?=
 =?us-ascii?Q?Gt674SwWHmz48WZFPujYG5DdhIV471PIH1WUVCRZiV1RVZuApYLoTeg49BQY?=
 =?us-ascii?Q?t+/St07HNXJ8Im/HFrD2BroQ1zlQD/KO0zlc2Zjsk9FUtpiwAugwjRYbvdTW?=
 =?us-ascii?Q?w2sHXxZWW70aehPwRB4ZzXAW5GjHk/AS0Ir8QAenG3YF786KLizjEaKONTnI?=
 =?us-ascii?Q?I5tGTxXcX5cS/g6aN2olR1uiT4m3fHninanH3mtW5iZuuzgKuMvGEFM45IVB?=
 =?us-ascii?Q?pfXDnoksER+m/HBrrm26q161W1MccF/UudLC4/+Ram28gdD2AT8Gl7ml60Fi?=
 =?us-ascii?Q?RTNpEmcxhVJQQ5MBinMcLQZOTmPiBmkoFo+bmhDWS00OImwChCIVDnzBnCst?=
 =?us-ascii?Q?XHa/HgErgRyXXASJo5y4nF9DpaCEghFTM59uJdg9elB4Gb9ZWsyK9+Gn3p+5?=
 =?us-ascii?Q?8Z2mh2L9IFZPG90cLXGxndIWPUAx2Kwbsgf+SRJo6baxzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBmAAnDESvLGhnOCb80vOI6y1uBCYMsNsOjrUmkIInDdvq57wRI/Z/iCIyuZ?=
 =?us-ascii?Q?Qn3bPEYy5aKxuNQN/gTk85zpJHe5jMxbRZt1jDePcwAGUrm5ym5hvhYbyuHQ?=
 =?us-ascii?Q?Y7XJ0YJnPyLNYeNlm63UuT5O91H5Eetx/pJb+61egdvK39ggW8yg1VnEPjDz?=
 =?us-ascii?Q?xX/KvD1uJioVE55M96vQ/j8+wENAHC3kIG7836dRQaJItNHyp7o8UU4Rd1gj?=
 =?us-ascii?Q?RiuypLvJFr2Y+6DnwM1LpyrpcCmvRlERnrcxOhRNDdcFZlT0LK0i4Zg/KloE?=
 =?us-ascii?Q?Hhg6GFM77D8TKNtCLS5TwFxXkOgrAI+zCQw9KTg4y8h0oFHCSa0qZ3/wCmJq?=
 =?us-ascii?Q?Lngu30tSnTROdd7hG4zcjdZPG9j/xUm0yoJHpgfLKYZVbBkfa+58AsvkDbVX?=
 =?us-ascii?Q?l9zUaGAtM0d9ynBbUAB6fXNhvdxVJqij/vZqErTrJ5V0zh25s8OTpH6RmBu5?=
 =?us-ascii?Q?SBKM8CeAtdXzLAQs1nmYO9QIkcYdV0tTfeP7s9Ee0N9Qsi//5SoKwEot4KES?=
 =?us-ascii?Q?hypVws5yz3KuuJNs7VDSQXa7a01gfPtcmkRo/RpRIcKZPKaGj1B3UZIpDtyE?=
 =?us-ascii?Q?L1dU1+UadjmvvwrdQ6PxBc4+4MlsO6Vl4IrBJ9ayXiEGSV0gEwlFXRmXQg/G?=
 =?us-ascii?Q?wBZhgoL6gUSVmGODytJ2z5WSPyYhUpRX0xkXT571Nw0foo3N2L//4OTfEXat?=
 =?us-ascii?Q?7USM2cbxxAnd/yzal+Tz7D5K575Hm1WBjjjtI5wtPjQ9Pd5SRuuQQuUUn/Ah?=
 =?us-ascii?Q?tLlctEM/dszvu++6RrNnxfhPhQIzcuX9wH6+2076kN4DJIRZv7CFDPNIY3B2?=
 =?us-ascii?Q?l1nHJV7ySZTNwisZOD9hQyp1JzCGJoBtI55aSh2V48hli/J354WAkQDQLG7K?=
 =?us-ascii?Q?SLmYbwS9KhxNWnowyWiXucw7Vo2UqI92s25bC3y838978veCwuT+kTunU5Zu?=
 =?us-ascii?Q?cVruxXb8tE8OgE9SXHGfWcchQDewMQcs9tAaXm0QLSDKszWIovFpHFp2YNyp?=
 =?us-ascii?Q?2XEr/NU1oeoG1Brjvia/XUeUgdJ6IbhERHerRdYGcezTS2mLvdaf1izuc5KJ?=
 =?us-ascii?Q?pLs63m6vfm4JbP0/zQ1kYYuo/QgmGHj3F4VOiqhMX25MghWvObIYpiJI8Vle?=
 =?us-ascii?Q?NX1bqA9ZlKobVEH+EHtbcVorWMfECp//OyXIQY62+28/Af3dLxWGWdG6A11q?=
 =?us-ascii?Q?eNE7iWFCiD8zkxVlAqIJBmkClt1tYCKNtcF0xq3iqpKQeo3S2mNX+qBMfM5Z?=
 =?us-ascii?Q?h6SHEDSW+oCb1mqXfUG30eJmFfiOLiHibDjr/iSGolq/dL/IGdlUBXDFF7fz?=
 =?us-ascii?Q?mx4X+vK+Bz1tluHaz6Gd0PiXElJhfYByw/ZJB1JYSVa3mWzK+pai8oYfuvWl?=
 =?us-ascii?Q?dNcDchq6NPqzRz1uZETZ/QZldh5Eks9VHx3/6xDGUFPcGxax4U5a/M4JUEsJ?=
 =?us-ascii?Q?/ar24mgOx1FeZQRUo9PLn+P+wLzVdMR1MlqkoVyLV8PcLzBP65flC6VGwI/q?=
 =?us-ascii?Q?AXDGfeVC8oCfwMnJMcpeGT+ukdziiIdC6IW0ITxA4sVB8uw56UXJZ6H5rvgv?=
 =?us-ascii?Q?VTMRmgntPWdYbJcVbVH5twnsBvxZaeRVEOd5N7LXlTJ21ixxXNYMysGrwMAZ?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db19401-3492-43f4-e13e-08dcd757e478
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 20:32:47.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ3R8dvL8XQwvE5kjSSIVV14YR8FOB6ccwlavMUD9tMb36w5rBSY0AOXW/sbd0lqQU9mHmVEs6p/c+BlojwQ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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

Change HAS_DISPLAY towards intel_display and remove one of the
last includes of i915_drv.h in Xe.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index a3131a67e5b1..5cbee5040e91 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -14,7 +14,6 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
-#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
@@ -35,7 +34,7 @@
 
 static bool has_display(struct xe_device *xe)
 {
-	return HAS_DISPLAY(xe);
+	return HAS_DISPLAY(&xe->display);
 }
 
 /**
-- 
2.46.0

