Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF8C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E331710E236;
	Fri, 12 May 2023 18:03:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76AF10E236
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914616; x=1715450616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jipVVpUX88W2UX7K/iUpGNTHAKOD1K2s74drOe3KA9M=;
 b=YYvNZk9S3kILyK1zarcJzl8ejDLiY9IjcHC/nWn0X19f2Lprfj+qp5VH
 Op+4e22YNoR4Fic3857SmOvfse5QlqMEuI3JWkpteelA/3jTFEJLetnHL
 eqIUyA5yJYtGurkWbHEuIzngGzNhCYxMgOqrwMXg1u0tNxUNzKAH1XVmr
 V/js07nm4/2pJxwBiw1YW54ij8lQiEpWaPEFuRtD1pjYXqk7oT8pQ4ZEQ
 uLj54e8L5FNOMer4627dPncstwR4MxQcfuj4UO1WEfOoroNOCJGzjCvR/
 z2HO0GX1HR3WMVHIlTfbqn8O5GOIBgdGR6Huh0KTyUibc2rF/4sO+EzTu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="349694332"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="349694332"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733130560"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="733130560"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 12 May 2023 11:03:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH2uEYAVKO4IubZYhqFVzF1YVTn2KjEaXd0oQ+17b6SZ5xJ4vfL3HcoSK31npGzywjGBM8mqZ9dDz5gQEU/ZV/kAW+qHtg0e7YyeTJ2rNqKhuDLavH+CfvfCWaOBm4GIExjjuXkuQrU3O3sdYAtPD6fuQ/7yzrqrADSmgQr/QfEiGkgroAoo77p7E9/gPsi6GLUrUuuwTtrkQaP47kFP3WCNemRmUCw6OnpKhfjlPAAnz6cgOluD9BzilLETNeT3bPDQJ1b474RuX0CVaRsDgR/wkWHm+U/YK/siBoBYzo+CEAK16w77Q5Ojw61t2DzOraa43603asc8oXnR5IIzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HconRmFYEYpJ0PuAC0dInGriaV0whktTPZL9ykXlCU=;
 b=LOKxn2IhXWVMt6Vx+l6dbTAxLW+OT1xQQE1lIS1T1Y8Ubu19DrTME/a50twuaWVVPXYS/i9uy5gglPq9UuTEoFNnksHLE1I9xHfmMBgHCoEqyNCyko0n9FEAILGCJwbiYABPPdiSimOIvl2R1rOE5SMkbBq6AkVLZd6EwZkdnPuP87rLB4sJWD2VdcoeUWWCmSOfJuKI49c0a4RhFFa9LMwMaXiI88USeUeXZfrwhLCGgeghL8AZoj7KZYeXGKP6m5YjA++rUMf84l5726pf8M2I/luqVXJgQIU047k1zlzLZiLJbR1zOmWc+jNM9aBL4yLIgAPljgVPH3wmM90fSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:09 -0400
Message-ID: <20230512180313.1765011-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fb0e8f-97ca-48cb-fa48-08db5313333b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqqsmy19s7xyLu3XPibhtytR8m7ENws8SZ9M4aWHIf6TteZsZzxcz0nUpXs/DcC++rvwhU8FEM3UZxy6AfKifFyO5IyHey5ouy6KuUFZer/2uwu22rm8dfSZzSg0swHO+SXqauiuwa+/lxrjQWqIwLCIxnCPZe5LL3zXk3CbDRdf1XdTLjk8N8nEHQT1NUcWQ8YczqQyZIwK6xyWticlF9Ce/+l/QbKAg8M9ubaE9g7mItGfdpfeqgkG5f9B+RHXwFTS/z6LpYsNQS7MvgWNsSWXvWp8q50tbTnKGUGgfrVc5cK8RUZ6qnB/6nZKPMkKNMvOOgdSfAqEEmjXPY5gbzu0XYRqgKO5I28S1likSt1YbDKe3W4SMzGLCPjiCMqW/LvDE5/h0tPe/6KlkLe0tGOra/vpAoSV2BkvWN8fK9gpzECaio3giQS84n6zJ4qmU39MhUTLbSEe+CFFGCQwEg5cznNsoQD8YgS5CaS3deJIEWvBu1wIPNazHVxETDVSc+NnQuTtLTtLNUeLL3DCQtvX8pjqJQN5DmwubUkYYyLOq3JTgiMVp6VcnLOpGsHN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nmrxjGuR+Z/YYV8eYkbgLx3OyhfjS8X9r0cnIiLU1KrQwzB9ASSRUPftDzGm?=
 =?us-ascii?Q?Z6+u3yB7ZVpVH6OKPnpjeDPR0Zt/9/BNQxaHUZtWJhhAVk5MV3I+9ZPQVwlQ?=
 =?us-ascii?Q?cZ/24U9ME630Jw/mVH8WbYn5625K/+UaZ+SnsesrFXQE05IIGwIyGwWLkTpG?=
 =?us-ascii?Q?r6aWAmVwDRWDK7NkAdQNG3jiIeePNDkPeUYmP7xUxFh5MXozgGoe2yMiiQqs?=
 =?us-ascii?Q?VNgGVGiF7jHixl6nZ4cetUogRKbDGfLuOIg+jh8Yh+dkLGdmosEAFRd4dc2W?=
 =?us-ascii?Q?UMX54z/J2wymyhW7iLsQqSspg/8MAAbrYQ2hvfgi8Xl5Lwcmu9HCWCf5lbVr?=
 =?us-ascii?Q?7ayMo8Ed4wswHapC+hum4AO2dMuQbZIVrOznyJw8yISG3l0BUH/ge07qZXSz?=
 =?us-ascii?Q?7rMCEWBiv6DamPMeDc5mKu6G6yIcTnJREd+3uNhDjN6MRU048rvJRqDNCaNQ?=
 =?us-ascii?Q?eQNmwA4bmusamTTL/KErGOH2IUwYU2fa9khjbJs6v8IvLjJSbkO6GcC/Qq+w?=
 =?us-ascii?Q?nlk+a57HNtGpeIyGyb/eaGFcNQXh3oIWUdQeomPpxld3DIUauwjn6Uc35LUU?=
 =?us-ascii?Q?EUIwjNV4DvtkTuHoyBkTJTU6sijR+RhH28PeE9wLZlwyci1Zq+eluK5CcInr?=
 =?us-ascii?Q?UKReAQLTiuXZ8eI6UZN2PLgYZz42jFdhvNoNIYasqXYnh3yCjSMGcafMSwh9?=
 =?us-ascii?Q?V7mNxRfVHHkAwUWTejPsVmWX9aAUMQiqr3ve+GhaFm8sMFnOuaU4ew+s8fxP?=
 =?us-ascii?Q?q7qXIAYokuchuuFaAnolNWe0NGu9aXesWdXqFZjrMP1WLlZZEJy1edS/9ydM?=
 =?us-ascii?Q?QGtq3hfaOG8bew0gViq6l7LBgaM4gzYPOGa1/q0lEvyfdhd0WiyEOCXmAgNC?=
 =?us-ascii?Q?IzfKzTn1/f14tn7cFO4bkcw+eDKwPyoj88pwIEADjFW/Qe8ZCATrljzFa/jf?=
 =?us-ascii?Q?kdlIXIMPifMJNk5xiSqUu/e8Dxs1hFk5ODL0ndQiK2VYuLyxkDbZwt5+/NEf?=
 =?us-ascii?Q?dqNj4w4K4q/ZK95To3J5fxi5aa1Rue0X5P93iej9VAzxheH7WdMb1mjynIPP?=
 =?us-ascii?Q?Sjf4Os2W6m2puXxI6wr97fS3XjLoiAZnQHvMyfBi7I7G7uRXP1/OrnBBWoPW?=
 =?us-ascii?Q?qofoVw6widxQCyKnpSNGeY9Fv1TRkhebf9k64OEjUKjvlc7REqWp8DmXFcPr?=
 =?us-ascii?Q?wWvVio1/3SqUlvJRrbNO72FSvVnEgCLuEuo0aJwLJlSK08higebET+Q+AOac?=
 =?us-ascii?Q?D3QaQm3of/cANq+urGDqUeUppg+IBSjN7nublPJBlx8+aNvGn8jQQuOUrj0E?=
 =?us-ascii?Q?/fZ1SwGy/Iis2SluNUimUBWihnDjJQjz9p7W4TFzOTzYKRfV8p0RM7IwyCpg?=
 =?us-ascii?Q?wA9sTILcAhJ4RZOwgbWUQTJzA4GhkpJHa0oz/QTK3IHfGYf6iloGHkv6iMin?=
 =?us-ascii?Q?RiMsfQ9atCW0IQOiSMk1D1I/pb+Htjbk/tA2OV0//1ZoneN/0MaIMu+WFSkr?=
 =?us-ascii?Q?LZakPMP8TgOGNPLUu53tZMNA5rfoKO5nf1G9QkdORnL327up9qALxNP3bbHx?=
 =?us-ascii?Q?vimzjs5IKIXl63/g8ynxUrNPPo0vK2n0VHJR1j/e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fb0e8f-97ca-48cb-fa48-08db5313333b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:33.4582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3amLleJY2G/YQDtr4j4ZNKvn3SFd852k+gksK0CdUlyyjAElVhJOi8xluUP7nGQjmj5UihfPc6bTHLF7fFjtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/7] fixup! drm/xe/fbc: set compressed_fb to NULL
 on error
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 6362c4ce15b6..d89edd98e5d7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
 #else
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
-				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
+				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
 #endif
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
@@ -363,7 +363,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.39.2

