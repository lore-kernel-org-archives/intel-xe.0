Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C106DC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5910ED36;
	Fri, 28 Jun 2024 19:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiXymeHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD41B10ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602895; x=1751138895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qhtJWOt7N9my6tk0n5Cl1/f4lHb4dfDb15pU96m+R9Y=;
 b=UiXymeHWWKVILPzlnw5BneIGBCuvz2fnNrgbtjuHeLU3oMWpRBeOeSYW
 zkf57yzRJY7HubAiXtIfrM/obVAATIFNf29EffttOPilGf+F/eNmHtCeO
 /eRmxmKM+tNkCeHjmrriIDxcWLH2i2VffpHFWRNIhJhx6Kr3rgiDV335i
 blQEddE6LrmPpJTgNtPZgYMJQQTPzVHZ81NGJ6yefb8r3yiejmdP28zaJ
 V/I3B0cskvN8Hgx4ayOWWsHJ0JcSsbez0dT/9Imdp2nerfuohEOiwAday
 j1MC/4Kb+qCzbXkIALyzlDLfHgEPokkTkak/WgpQWEPULT3JuZHZ0LbTV A==;
X-CSE-ConnectionGUID: K+n73/fERkac/v1JSxeGDQ==
X-CSE-MsgGUID: Iy/+1PUzRFyn8DRHvN9lAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27930967"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27930967"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:15 -0700
X-CSE-ConnectionGUID: 0uWdz7YBTeCpjRK+Nu6Wvw==
X-CSE-MsgGUID: Z8fzAsFMSHupNH1IztlcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45498222"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5gteagPfgy0THvT/SdL1Y+lwsef2nr+JmRTCYXYXYIt/IsWJPE0wUe7h5XuwYEsQwVv0MnlhKWE3/pqSKwW0g6q30eJ59s58nHCr0icnWggQQGVKbFbCt7Pq5720r7zI/58XWF+iIG7kIBCixU/K8ODeRQrmxpsWFy8oM+S4+EmClUdH3OZDyphiKx+rOywvNL0Eb1kyG8cLrvFmnfCb/rQ9opxbh/uKpeOpupgIz7kYvvki2oi5ZfxzcNVny5a9uFzL+Ek8aAmhSjrHCYiWK8jpmmoBSnLvjwuWMkjHH1kss1WB2GiXze6bR0tIqcSfl8Wvu1dEYQPKeK89iHZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qF2wnC/df4il2Rr3tCQ821CMJw3HSpmYysusWhCdRHk=;
 b=h+8uwBckCq4qykFzfY1ItVUEGO/s7xhjfvA1WOk9hvgye1Bo/OLuqme2zaee0u8m8fEV+L+O1YUJJs1yyvmbJM+3Gv/MXHO431+XdCrVSF87vUTGQB1P0f2ihceRm5Rzo3COQFbtXlT17XWNRc8UXlf6CuDii0WH4lOTUzEUxVNNBvr+OSEZKv9HFYVzCuPyKg/1XrIuPAx7jXEs75os+BH8KgqeVw2sWdL/xxkdJMXhCFV7rnalwFKcfg5bbseVJid9uWksYL0M9H3hgp4jze3C7fp9sOn9T8DGXlzU9xQi+gmwHKwky1mdBitjs+Y15Xo+Y6vxTt3kqKhzDt26Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Fri, 28 Jun 2024 15:27:44 -0400
Message-ID: <20240628192753.386137-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e80b38-a1f3-4acf-f95b-08dc97a8724d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k325PkAI2mFnnE3DZKDWhW+XcCCoBfM8ysSDodTU9ISjFDO3iW5y/jLMo15a?=
 =?us-ascii?Q?xNv+KI//iw4RfN1Q+3GdQxw0XxU4brv6dk7xJiYF+7yF02YYrAjAdVIO0qpc?=
 =?us-ascii?Q?nzoSG8nx+TZ17wdszGZ/m2tlBlVuyi8wkrnx8j9ol/cmyp4DssopTzdbJhY2?=
 =?us-ascii?Q?L6X7Ic2xVjpAi7Vd0QWML2W4wXDyRJzw5Gurryd9lOQ0JnHewIcEv5lgVyp/?=
 =?us-ascii?Q?YR/C0i5VSrT4X3ivQRC8aEbZyKZzSgw185O74zED9qLDQzL8PWt6C5Heh8/9?=
 =?us-ascii?Q?GpplXM6+EcYBPIO2ae5kAJzpeV9FSOYb2rL4i35zwlm/uja3JZdUmerOD02y?=
 =?us-ascii?Q?aFhlStD3dAozvJRm+XK84e7M5kHQf8P8xIr/HJ6zyVrdCcYR3UZhnmCjNSCg?=
 =?us-ascii?Q?iO754A2dEx43VRuYBRk61pcL8U4UFv488Lmx802sl9v+jjYVikzfbXGUZ0Fh?=
 =?us-ascii?Q?5X8kE1W+EutseKehskH79s6tLNEU4XZ/nI557Jp3exjVYU7WkDfE+D26sKDC?=
 =?us-ascii?Q?jOusgXg4dL+zrbgknqeSK+UHRzFezPfIFWvzG67SX1SsuUH7kpy0BUzHS80y?=
 =?us-ascii?Q?8gG0W8LV3Axy3RLSKuO3xGbOjf5+hOi7sfdve7jZob4/jexOAByEGv2XXUZF?=
 =?us-ascii?Q?t1vDX3bSUSRV0evxBajN7KbCguWB6ro6lRVaz60QW8Y4VmKNOEpChzdmtdoE?=
 =?us-ascii?Q?UVbCP9eUQxPKQ/0Uw4R8JiD3Wk79cLJ/IduWtPiTCldHCWhDW1+07EdibNmo?=
 =?us-ascii?Q?kx3JgJT+apCXP7mqjbN/3iKay0XOfjOWXdgCskfYUMtC0FzmMSmaDJ72jqyf?=
 =?us-ascii?Q?eYq9iCKr/buB6NypPQZnNDjJssKu3TmnA6LkDhIq8fC6tO3PUh7Y5LYPS997?=
 =?us-ascii?Q?uUZ+6LvPI8x7g9scAPo40EBVGTwsWZK0UlaCkD4Rb5iQ75h6X8qh8bsh1jJ5?=
 =?us-ascii?Q?f5DAHUSIlR0EwOvfeW1CykbvkkdwzfpZNM27iymga1xGO9nhHATuyuLjbBkM?=
 =?us-ascii?Q?SdVIAostTIqP3zguFLdSAdYStPhSyd8+R9IUoluxlS9GQumtomctfYIAu/wQ?=
 =?us-ascii?Q?PujzdA8+grGkMeuGt7Xtq5sOEFNmEzrDndwq1CGu93l/V5mlx2LkIZZTbG8t?=
 =?us-ascii?Q?gS5foKcOjd3InvwpJfEWQ4x4Q44E758jXsDWpnlGgocRT7FffFY12wwVDxEq?=
 =?us-ascii?Q?hmjZX8TMWBoqRfX/Ea3PuyDOeu1Em0uskLuoxyjFgClJDeg5vrxzeXhyuE+N?=
 =?us-ascii?Q?Lp/1egLfWoXoCPtbn58QW843qFIKeb9DrFAKMM3mTXov1F3q6YKZW8UfZwLw?=
 =?us-ascii?Q?xjWc2CTJWo7uTqmM7i1h6+NhvO/4t6uEuJFPUSjStsVj0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8HwFFMCU4d8krth/Ds62L281aozSjFlajTox9YlfNaTrCZt+/AGfnan93ASO?=
 =?us-ascii?Q?qDgBFjbEqVKmQ/WI2p3SGLo+0KZPMusPpYnRz2fgqk+9BYNsQKkqAVK+Fgst?=
 =?us-ascii?Q?CaeSQjrMMfQ9xldk91h4SykCIg0/rPLUgk9kuvNdskWMXipohQwazboNlEcw?=
 =?us-ascii?Q?HvzUsbLQ7ShOo/uqXUfrk5cGJF031KtXGg4A8SWaTojRKFXsdA5TDIxxomnv?=
 =?us-ascii?Q?bKudXMzckv5R4U8W2npS/J8ZoXgUCjP8wcvpjtmEZpGIwUYzJYSN2sa/s73P?=
 =?us-ascii?Q?x9HyCsBOmu8qJaIf0A7iIcYX1XoJ74u+nZ1NlByVkdV91RMsJP08LgJUsYqc?=
 =?us-ascii?Q?8A5T2MGHp/6WBeMgyDg0EJPzR91LD3kdDEJBQJw9iINiPVtr6ptKsxnNW5Sv?=
 =?us-ascii?Q?bZY/WEgUbkKPEaOxqFAIT878Q3+W4HncxWmpGHcZXcz119iTEOhVgBKemFVx?=
 =?us-ascii?Q?peI7jO2G7BTKLObhkR3BDUEumRziFuEixBj9cE4xMKf9XypmZNgOeQMwbKPT?=
 =?us-ascii?Q?cWFLL1CzGg+IIdZ8uaDoAJIb6QYhGA9+NBVdGIoQwQwNnw7ZI2GNK2cLR2vn?=
 =?us-ascii?Q?d1MA2tRttTIbogxBWYIPAX5sewdGkP2AqVJma59pFz+LGh6/AuxdfwmeOgQ7?=
 =?us-ascii?Q?90muZhJiiPPYVh97sJ3Gik9cixgs2JQF1IHHNF0l0pSgi3k1dASm6SoKZxU6?=
 =?us-ascii?Q?fE4Pw7xeQPIzoDjUlMY3Jjf6FHFsRSFktyK2JRIyqHUx7TD+pW//XwMs8zcc?=
 =?us-ascii?Q?rMiB81OgUSFlQKg1QoFoX6ZHGOKDvsUlzIsDilXckSdW8cGg8SOTZ7NIFQP5?=
 =?us-ascii?Q?l67mAfRuHgfEOB3O7OXCx6fXZXNquPaB3rxIjOmDty3sht4qL8GgmxEAGkrc?=
 =?us-ascii?Q?kEa9Un16+XzlxFsbwvosTpf7peItyEvMuzXsMyu3ON3ToS51VBBdmWOvdUNi?=
 =?us-ascii?Q?pqMfqshuDwSAfc7IQL8IRrLzLwqTz+e+B+OfeRmHCcu/LTLqs2o4ANf6cOH3?=
 =?us-ascii?Q?jEuuWHlQum2sNRDDRnPgkrbYRVyn9GgYFqbhLqGzqW0Qxmw+R3n/ZMyBDyVt?=
 =?us-ascii?Q?ayC4Wb5Nin0lBefrqlm1U53f02LGY0LWTSnmdoVNyF45roKlWvcuasX0Ogk0?=
 =?us-ascii?Q?48Ns9ST2Q3CaEzyku/cBX9zd22ktCmDClsYDi14IQUUg1DJKH+Ne6wtjxptB?=
 =?us-ascii?Q?QSaiMsjFId3/7WjM8dLAuqSlchA4+iPbeZRMCON+avOEWzsJlB/VlhYZp4iT?=
 =?us-ascii?Q?+745c7ia1qHhaXqQ+oc7gZP1LkjobH/AA6wzRIU3TV4a7HOxOXeLBtSIf8Mj?=
 =?us-ascii?Q?6Fh+//WrT24CvgaF63ivHW5ISaIzCt+wu6qMLk68xUe7F5ZJvC0yzH+lkSyd?=
 =?us-ascii?Q?sq69GyKguX9jiU5T6djwL301vViCBnGfWgMzPyoLWKrMDxPHD2mLz5drBEmz?=
 =?us-ascii?Q?T7ysL4z7GO9P9Vukb8EnDaiCOIScOAiBEYLZl1peVnQFQfx4sVNAUp59sHgP?=
 =?us-ascii?Q?/KF3XFfoiFO6yaoyTvNsp+xWC85mgRiH7q7PsdwCcDmztWOhPUrypNi8y9R5?=
 =?us-ascii?Q?Hev4D/kreVhHerXM7ItY4RO13jZJxddocYPa4na7+6I9Y4x8ghh9kz/8mCmj?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e80b38-a1f3-4acf-f95b-08dc97a8724d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:10.9740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MxPwIobB0zJU2JNYNXnd4Y48Ko7buu5VnWje/ide3BjCynf1pQr2RRxAhZyiZGiOY/iQEVHEa17cu9nsXIPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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
replace by the linux/types.h one.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..438d8f2890be 100644
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
2.45.1

