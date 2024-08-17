Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F1C531DF
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727DF10E032;
	Sat, 17 Aug 2024 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVR9zvXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890110E032
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890966; x=1755426966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qw1MIFZmWoDjikNpo3KUjAdOq2Q9mJbzfmw2/m1JkpI=;
 b=KVR9zvXPpGgreng1dY5VoQeGpTWKzm8lX0/WVY48q4G/yvtyJAr5IeKd
 7B1XZLRSydKaZ43dLnn/ARO9oG+/WAwHn5JcuvjFI8lSflc/CHVpmy78j
 FyZngO5VCLknkEJtBKjyddavgRGXSASOXCNusBU21luZmjJFn8inUvQsZ
 bfsOe3oIb3kYex1kZZp0gEt4YNCuzSM1vMEBNFLLigLZhq0sRhvyap7th
 FdjfXOqfABr/iXTNNzwTUbUoEp6wTHjiG0qm7oMEv65QcfMLStQkvv9uI
 idnPZuZddywIVdYRxRrl5KM4dLS40cCG4exFsLK3GKDEU2/IsF5cfV/4i A==;
X-CSE-ConnectionGUID: pZJPByGJSPWrK7+znOk5ug==
X-CSE-MsgGUID: 2CLhxG5iSjiHcP4SntEHtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22035584"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="22035584"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:06 -0700
X-CSE-ConnectionGUID: t8p551uQQrqKErv9pps4tQ==
X-CSE-MsgGUID: GRMtpK2PQR6pauRkK6LKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="64801587"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jglsakUJWTbVzcZ03CEOUftRxKaU5RZldMBmRJ4lDrPL9LoRusT6PKAT4THZYl+jBKl1fmFBJGm443bveXgaSmYYSVAVBuqDlTL0cNq5mxEyPlvabKHWwTHji6Istw58epG73mrgwTIN0qvwaMzU8h62L/h8fxzTADjSd61hgFTyabM6qRmKwpTO4lyCNTWu4wDug939qiZemUkETlITf1cUP7Ti95wvDOzTWmVAB7WNh547hjrqsem6yQKSX4PICrD5mp9A1WVxY0XJq/iF1zuuDaxt8eLl1vPYbUN6tpQYDrT4aoytiaabW70NEzbjlCCI/B4Ypvj9aN3/5f9pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9n4zj4tm68dbxIoJLq7qX24KVWzpf68sEZxKyeR4vU=;
 b=RqPtlH2XQ+71AqvDDcafeiRncJeruKz6iwjUOgDE+nKyqMw6+sbpmRv2aovgSzF1CjiSHgDQkSONs7wkQVJV+fJ3UP/ySKDLg7WipbvIhMxB1rkzQfgP7M55fJiJK+BZuJ57OeSPoU2UgR/7PHPWsLGIWtrKaTJ/b+Ck1ypSWtmVoT3Nyn11nqbGM9rDJJylmzmCMqrdv46WUzVlcsB62WgtbKENde4wcBChzJnYhubdN2e0sE3FWR7CUqVHoPI+0Qf29+SfSSWTiX/ZSy8uLLiCvQzO9pEj3Z7c9o/gvxOwA8vVjOZl5vWDfYkQMB4pZE2CbYIV3Cxy9kVZoQq1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:03 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Sat, 17 Aug 2024 06:35:46 -0400
Message-ID: <20240817103556.163783-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff53ca0-a260-48a5-46df-08dcbea864cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wZa1pjoI3g6JK2Ko8teR5aInYWFr0107I8Wmd/Rl2qtwBuDUdoKg/mLt8K/W?=
 =?us-ascii?Q?WkvSbeYq/0vlrxgyM6G1230cDywQcDM8amUXQ+yNB3elqu0TP4NjXVBYCmQQ?=
 =?us-ascii?Q?gQlmngOsNOTCI6bhKnN4QuuXb/+8HJzncsTrH4taCNdlSqtrNCREC5l3Oyr9?=
 =?us-ascii?Q?Wdl5pdV2i3BS88vurqg/1kdwdTsNQ0r3cvqY2HwU4WSwXruyfo2DPPpOi4KB?=
 =?us-ascii?Q?zPSUZas2kw8Pb1KclJXJ13yv74vzoCAPG5H7HVlDpRSIpI9gfPaqIm46sPDQ?=
 =?us-ascii?Q?xEVtHggUk7N3QGfcsMMldCFNBBlG1mBrLzRe7J/11P08867Kflu+CPVsCV8G?=
 =?us-ascii?Q?BCUNSDSBRO0xNtfW8m15cw6Rfnq/NSJWt0sZ2P5VDp4V8In6FFU0ixGT9I9C?=
 =?us-ascii?Q?by2jf6goCU2u/OCE1VI7pvj4jFy1gCkx8gGHVrS1CA5SJyVHfGpvrL1Y5/g8?=
 =?us-ascii?Q?MJ7N3J+T6uL2xM6ERy+PYWeZcT/Jp++lFOJmRJfnkC5sE3p6d+ixkVMxPGgv?=
 =?us-ascii?Q?Nvra7qeW0pvc0FTcAhDe8afKwkKI6LTQ4Hau59pW8joRGyG5Gm4W6Zo/W+Wn?=
 =?us-ascii?Q?bJ3XBXbW9y6GBWJUMmWRKZWpddLU8t2+hRhFAmDPG4ckgtau4i68XrtI+C1K?=
 =?us-ascii?Q?23/OALPB57WIAqrQv1IvV7UgLNWBqaIe0itKwhD1W1nSdBVoN6euAZftQlsp?=
 =?us-ascii?Q?aSW2slUlER4nTA/+4a+UyARht/rApQJPmbepOli0HfIVOP9PwbzXv0QxhWtO?=
 =?us-ascii?Q?d+Fmmodx2OVtNuh3T9/yZUyvdBoGC2DhEe8NXt3Qe/vzhRH+n2ZQ6hNg0Zwx?=
 =?us-ascii?Q?fZu5OIY8X7H5ZbGG6u5rNJ3s1BxZqw5r7IewrptOmuvYjcNqj3ysc0H828I1?=
 =?us-ascii?Q?wmmYk5L3xgz8bDC1POkzotBan2VNIMlWAISKs1v1Cnl7FbfvJWZnwjWfsSDk?=
 =?us-ascii?Q?XkPIE/jSrlikO2Na+uB/orOan66dIc082cYBGx8aWLdFtpHZGOlMC8ryVNja?=
 =?us-ascii?Q?F//vEQIqstRpOy8Pi/14hfE+6yRSZsaNRg01R6sq2GQQLH5aiO7cswXHJa/F?=
 =?us-ascii?Q?Erc8E6ryRgXCsmirinuih4PFHJW5i9DvvDGuD4lZkq6JTpnbonsraBxw0Y7o?=
 =?us-ascii?Q?gLG78GwJgWwfCHDMHwFO/kMRad3hn9cje6/BNRskoyyl7BOpptiX/mBvLT2c?=
 =?us-ascii?Q?ipVhhG9t8LDjMkFHivy9hcJw/+PM+MijINOVc80xFzbmFFUPpl69eTjXnls3?=
 =?us-ascii?Q?5ArZDzf+DqQjWPTA6Wqg/hRRzcgm8Gk+ZX4PchiNn5q15IGvR5x9XYEDH1B8?=
 =?us-ascii?Q?kGhzXgWT5lFhtuka2Hz0ys040+83Q9PLkjIY/jTJEEF9Pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvCLqDi9OpKGDJURFHLeEW/Vfq+PENtdL10obC6kuq9O499USueIxN9zLXF2?=
 =?us-ascii?Q?lNr3qjMcS2mPo6vqJeSJZ/n8VS+4cjmtyLGEDoGn7/633L7bhK3DBVlR8irs?=
 =?us-ascii?Q?ZP8/t2Df/Ft52zImrezeZPzeacnv0wUFHIzrUoEKe8GhSpYL+FSDrh+i81zr?=
 =?us-ascii?Q?jlZbAHS3Egh8nKH5Ek3kpnb0XaExzetRtnfUGiDa950QVtjI2faHHjM4QO3V?=
 =?us-ascii?Q?5x0roT7af/pBIJb4X1/9rwbHhcmmzPbRyOXGinWriz5qmNO0bwNe1AsSKdCN?=
 =?us-ascii?Q?5opJG095XX7JAQt+mYAQbbfZmSSHkywYcXhylmD0K0HOrAvTVPqxvsTDBQ/s?=
 =?us-ascii?Q?nDJya+O/cOJa/xvukbOg1912nQhOLET0CpyAfVT6RZ3yAQ0KW8TFvZmarGz0?=
 =?us-ascii?Q?KIrIPpWUuCSMUavLxbO4gnJFDyXup/II+6zx+feP34SYp5C83AOIbEf1X6t5?=
 =?us-ascii?Q?j2vrxIFyvHlPXDrE9lHt+9/H4BRxE0UW+PzTUVDHlqHSkTk5EVMvZUzi/Rus?=
 =?us-ascii?Q?ATpXqUTcPs76Lfl+ERBFsjYxoDveiWLFFtAYSsEtTx9CK9OX4E3eudqvGuZv?=
 =?us-ascii?Q?hzjlt91JIcG1xqaSyROAY+WQVTHNB4LoKJfTwAo0d5sEkHPT0Dk9D+jq6dbE?=
 =?us-ascii?Q?yFhKaLDfMv2ZkGmblnay/vGhSRwz698L7QphaHRaN3JOiQURtB6h5XCJhXG0?=
 =?us-ascii?Q?XgkgEwt5euLZeLvf+ZpflUmeeehlqtqBZS47twa07oAAgp9/YO6M3yDmNkNB?=
 =?us-ascii?Q?+DXrB9tiNECwaBxs49W2T91a4kb5TKAf9DUSDIshpHo+JB3IzZh+dPI5q/VY?=
 =?us-ascii?Q?qcbQafZlGjJqvA3Hf1nz8X1x6FUuvMo601S7ixzWn8B84yT9Y/o85dnE3Ida?=
 =?us-ascii?Q?YMAdMGUCD1xUHlOxeMNcH9BbpY28on9oV7qbLq1BOe6juZYgejdLk0Q1zmKm?=
 =?us-ascii?Q?jeChSeyC47rkF7HWmKWaBFCyYFYPHh4JK6Qs10IraaWDOEYabc8htCBkHJH2?=
 =?us-ascii?Q?RSvh4UufTAOmi3B/K1oJ/wrpK9gj9RWfUksLP4RZIBajF9zLCwtmT7LwnuOz?=
 =?us-ascii?Q?+Hntey4F9eeTo83sx/KfjTn86uZTJQSO/uKC7Z/X4h9uK8kieNwLfE5b72gJ?=
 =?us-ascii?Q?2zmQDjzjKYGdNr+h9dlkSOqs5kAbUkIXIHidWTLazKKcFHSXutdd69emqBzy?=
 =?us-ascii?Q?rxx6nZiNayWd/+yL6sOgpWfNIbcsc8FoAx4sq2yWBjyY5K9kGcCwOrDrjhnt?=
 =?us-ascii?Q?Iyrez3vv19ZnX8EqO8uOqI+bgifgAYUCOc8hzR4Wh+RRiKQXCS5p+DLRfNre?=
 =?us-ascii?Q?EYfG5J/rirHLexO3f0i7/OUzWu/UBRLl8qdNySWFO7297QYm6NKiO7IYOojQ?=
 =?us-ascii?Q?Ys3r1d12mpXp/cBbqWQABjjo4IWdb7YR1SWoMq/zofOu0JfyzqeqvltibLNH?=
 =?us-ascii?Q?6P7gB4Fq7vsc4AcZlAuf36Lnp/TegI5G3Rw5swySsle+HqYGspyB90mUVF7s?=
 =?us-ascii?Q?twB+mvlyhuFJtvqZ0oo77+SRg025QECB0ZTYsKMJuYNcn8Ox3NIHzr16PfDn?=
 =?us-ascii?Q?w4VF49beKRVPQyXEcUzMqU94HcxESwH+SNLtaMSZj34dCV8U9mNWRm+VXvP6?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff53ca0-a260-48a5-46df-08dcbea864cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:03.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7teutDqbwc8oX0YnT+XkTSMlIVGa6X1WQyT42AVcDbP2Oa7+ITBz4JgVo6J79D07TcSwQNiZoCdfV8G41mDDTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

These includes are no longer necessary, and where appropriate
are replaced by the linux/types.h one.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7929cc2425e8..0109866e398a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MIGRATE_
 #define _XE_MIGRATE_
 
-#include <drm/drm_mm.h>
+#include <linux/types.h>
 
 struct dma_fence;
 struct iosys_map;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..dca374b6521c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,7 +26,6 @@
 
 #include <linux/scatterlist.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f46fd2df84de..f7113cf6109d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
-- 
2.46.0

