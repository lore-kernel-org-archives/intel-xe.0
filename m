Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CB9C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87F510E7E2;
	Fri, 16 Aug 2024 15:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilBoJLfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC0210E7DD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820583; x=1755356583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qw1MIFZmWoDjikNpo3KUjAdOq2Q9mJbzfmw2/m1JkpI=;
 b=ilBoJLfZxwNxgM9UXIA1hrCPCVj2+nyk6J13N5pYQB/7Auh7gEhyKiIH
 a0fV7K+mRbDsgPtDYPJngmJgEAp6EqpVu62rdvf8lvBhaOarPmF9q+4xk
 CmYsEBvZ3hmZSupjelnqlhIAbaavcfVYoSAQXksV6tIgN8G3dirCmxD/4
 koP1l4CTFyxzmAQInP8TytXhpaHjgSBtpVA1sVX6eqvzcEBZSZzKw/jps
 lio6UWyTXJJxk6jAbYRSINrBtGizdf7fmKzSOS8r46joYYHKm3e6NwHqL
 zyuyrVvFGPgLxvTnre1QSOrwmBjdLnW/RxsNjAT9K57Yx/AjB4CjkfBnu Q==;
X-CSE-ConnectionGUID: naErCiFcQF29fSrEpIzAfg==
X-CSE-MsgGUID: HTTN43r5StyC7SmChYFIBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13054367"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="13054367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:03:03 -0700
X-CSE-ConnectionGUID: JY3tLSXVTTKkZjLsJM7pRg==
X-CSE-MsgGUID: ilDRO20pSWGUfGwZUgykyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59384090"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:03:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:03:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1D/be5TLCVZxASYPsDil5R0e+qUU78jAyPqk++dOMos+DkJH9H2ILorNnZH7YTQyQ8QbuhkjsO6o7CGSZDoPjEWt8soPcq4tGjwAZIUb9phjS7XB2aIh2Mfyz9bJiDI6jU7JgAs4wwP0U/XfDif+8qAWMTbj1cIaSX7LI3/yeeOEG0zQ78T4D3dzR26hh+1gHBX3Lxcqgz4AocC567kguTj0LdL5/fvXfQyEOWWXcTNFfDZZleS9WKl9Via4pLd40DjsWw+pTPpu56fDGeNrMrJHKddGQg8ftSNv6qi8x+O0VLCeiackUoaN4EgQA00JV643oBvITbiygWfDPkLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9n4zj4tm68dbxIoJLq7qX24KVWzpf68sEZxKyeR4vU=;
 b=LkOAC72x2T1JZo7wDvGetaK0+yafzayxKcmwB6OMyFgL29SK51u/+u+MHjq1yyc1hK9elkNmPCkhMYmrHUHoy1UXlXmE3AcM+nFs5kXGERrQBqcQje2whIqcOZaPHmg9rF6AHj8VJHlHK18aJb+eR+0ye9Rj/w+r+WqQXlMzVy+1Whg1KniSdg2iWXTV3mlp2ZrIAKMai7lt4rFHuFH9Fa4ejfDNzBwoeDFqv9pmOqI75NBfvQyoObZAojS+5LFMljPI8/XsUqLTLNd1LvTPco+8en6PZ2KHnc/nvfJYCfX2devk3NQ368j0AApfy5G65JNgOPkotrhMKoRRUvgr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Fri, 16 Aug
 2024 15:02:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 15:02:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Fri, 16 Aug 2024 11:02:34 -0400
Message-ID: <20240816150243.87596-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f085090-7544-4d5a-050d-08dcbe0481f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uDGYbN3TmguruJYUcdWZjlRBJsSmTyj1+aWox0qDHA3GWHIoMu+6rMz50H8w?=
 =?us-ascii?Q?qXwsCQIdnHLPgcQGmQg9xE3C65HcO/UtI+VjuxggC3FN7lbwze1t7OzE3jg5?=
 =?us-ascii?Q?6SCMr+U7mNYuOHQ8o3+xQOI2hXKeZDD1e8diWwyOtaEO+lS/TENZbAghmHsd?=
 =?us-ascii?Q?OKLIRaY68Ohw9dHnFNIp0C6aKQu13k2/XH5iXMyztomUvTq5cb6OaE1tCq1E?=
 =?us-ascii?Q?yImh68h6STLgw1BbAi/y8bfo1eQmlUru+mWYvhiO87go2QKFyNMsckVXyZsb?=
 =?us-ascii?Q?GWsdWA1rUy1dDDThI8XscQebd3Aj0P/o6JmjILPKdsfisGqQuBuiBb5HCToC?=
 =?us-ascii?Q?FhG3/oHSwRg7RSSlC/DCIrWi+BPnmucRyDtBPzFJ+NQBGcKiH3XDaVGVBZGD?=
 =?us-ascii?Q?K4bi3IMwifdHhbbl6dXezD6AMIZKmaTqiHZ5RAMNzKp5J3iIiOJtcmamYGm6?=
 =?us-ascii?Q?vjY4limCIXqDpuQ1C8QlTDAtm/VawqJtPXr8BKqLWQWyumjOoT9Cp1gpw9ne?=
 =?us-ascii?Q?f4AB5KAjNTr/sBU5OCHcQHh/4JcNI2BwE2IsWFEQGYDqJKVSaaEiO1OTWNMy?=
 =?us-ascii?Q?qyueyfcB3pNyMWTIKuZoanpHRCuAvz343HgqTwE+2Svc74nP0KBN85lvlw/z?=
 =?us-ascii?Q?31D8sqxYPT88fSDsJc8MLnGqECtxrTjX9qCeoXNkZTjc2mLIxW7b3EiyQJwD?=
 =?us-ascii?Q?U925ka2ykiB504PRVNoJdBh0fcN5eQRoaI2TpMvz4zsym+icCrJXQWCVWqkW?=
 =?us-ascii?Q?kh4TWHE57ZhjqxqA56zgQBCSfzrpuvGK8XI2LxHhClU91JvjpH3Zy5SLNgCb?=
 =?us-ascii?Q?JwIC/kSg9OqisMSgh/lUiWSU7cgOgoGx9osGSHvbv9XknUjnGyCNGBgjUipy?=
 =?us-ascii?Q?IV9zlTDpnpOEmeqobCtL3v0W9XtXlPnYzRALVnRfavgNrr5/L9MO/XuxKcm3?=
 =?us-ascii?Q?ZOpZoO37UTvWAbKJHs1vDahKGu5TkQ32LaJh5W+N7H6seA7ZrRiq3UmpOscS?=
 =?us-ascii?Q?HeWWwfFisnYJ3Eap0f+WQ4L2KMv+9Il3t9A/rLL67AsYscfRO7Y9Uio05Drq?=
 =?us-ascii?Q?5xQ3xWWxCEiaAW4vkRFqqkA/g4zY3O6g8v77Za6NPjD15g7HSsqOXaaIhNza?=
 =?us-ascii?Q?BD5ehw52auSvMTwHqKANolNEIUZ5plrTSjN8Cu2N1mqhMby4wkV1FNL/tf3j?=
 =?us-ascii?Q?mk98DqY8m6gjHjs4wBIj/xT2ipNXHvYiXtS5UnLHuhWidALyOha/t6XcljTx?=
 =?us-ascii?Q?c1kzkv38eEUnChnI0nB3bi8zNEptE6UV4XYSxcIJTgJn3nM2xiCl9VinSJpQ?=
 =?us-ascii?Q?l/yMjMSqlwIVuR15YRqF12hrksuHqZ8hl/llywphq854Lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k0K6w6L32GEBfIf4ZOIJ9LJdep0XxI+TMrm9mQIdO0KDs91S2IEE/Ax+CQAZ?=
 =?us-ascii?Q?hCgE7FaYTLb10qM9wORcDDtCxprh+QtRG4KJG1dZ0E5QP/gko7tS4H+2J9tW?=
 =?us-ascii?Q?LxQlmMEycqZsJquFttIA6D9/b+jyLAqCnYDVHsf8nUABu5X8s5h5l590So26?=
 =?us-ascii?Q?tagkHKrU0xIqCER4W/Rw2yayBvb30nG2DQdgTYJtSinJNi7U7vGdcHRMqA5a?=
 =?us-ascii?Q?CCdHZMyibxnds9DZyPKafh4NYuFX+1H8nM8Izcqa6MXXUgDXGMrYlchQ4ZI4?=
 =?us-ascii?Q?gdWxaBoDv2aKJaTIoS9BU5zAOmE6l5z7cLc8yc3bOH7T+S6KybIzbODgB41F?=
 =?us-ascii?Q?u7we98dCYkphGU4ILKhGhqxYTIJSzMWPQNXCOFOCBe6ovVg3ovJ7qnQq7Zul?=
 =?us-ascii?Q?cMAMfx8zaw0rqL58JCqvzSIiBE94TdMBOgjscqdEYss+twk/BM1b5qDhMtu0?=
 =?us-ascii?Q?rz5MMKfxEOZ7HqghY2Df2mFhhaWcGzCNZTa8RZJsZRceGmp/7f+N22mEkM8U?=
 =?us-ascii?Q?JihzK7dCqYYI1nukkEjR+u4dzqyg8zv+U48qSxe1lu4GxIo4lvL7fpqdNdqC?=
 =?us-ascii?Q?ntcl/DUDMI2K9DC/bTsKbHMZNE3PmMxx3NzIXr6VUyxXfWBTrsoikNnF90nb?=
 =?us-ascii?Q?lDBHrILKjIz9BhRhTuvIjhBtsZZa/j1K+uzTd06OzHom4h2C2yvavdiKPBau?=
 =?us-ascii?Q?oxypnCSqcaBLyVLHHTnO9xPmkaaU+ZVi3yyuh0aFNGlJuhy2h6enu0s0DtMb?=
 =?us-ascii?Q?lvADZKB2Wqbi1iCAu3bKZtuRMIcMR+lAXJgsuIK9DBbAnYb9BCqOcDaHO/fb?=
 =?us-ascii?Q?l4FE8t2wf2WlwS538m/DirOnbxd8wWF5D1RRvoks6QF6zOB8GB5l6Jdz9zGq?=
 =?us-ascii?Q?dxjLcqmPuV27sGac2R8fd0aNu+w8kCDm114a9O6PmVQ+5RK/D1EzP9dbNuwW?=
 =?us-ascii?Q?K3fWtQCKrwcB7hhaTiulAgD4tFEPrleHoOsLQQA9rmwj0hCCFVWCQHMHWD9q?=
 =?us-ascii?Q?6SvZoq1DiPIZ7VtpTxKWlNcChh6FkdrK3bTCA4bu5P+sHtNJ6RMcTgjLfVQR?=
 =?us-ascii?Q?LM725vdJXTdO1TRWtYgfqSlqmabdrkjRYBQVcXLhKjoqmMsgo81TPJ9RBqJO?=
 =?us-ascii?Q?mwfnniOnnOhy02smpl3N2GPp1o0wpdBdXe9auHgho0kMn6CkX9lRv112pfxD?=
 =?us-ascii?Q?Ne88rV097hXSBEYQXmjtxww052eF6WjiXOcalLwqRAMrnA2wCEyVR3BNy9WW?=
 =?us-ascii?Q?1Eucnay18xdMbZyzQob0pVLI958No4ZH9U5t5y+gbU23DNlCxubG7C23DPge?=
 =?us-ascii?Q?PCoeMgpxac3CceOvs+XtM/fyH9/kD0fxAaplnnzdIJfRzp3u077os4WrkW5i?=
 =?us-ascii?Q?LE9AJ+FOtGw3B/njYOK1oFZJ8Q8u6f3t/qa0L2FGULLWc7nsOePlmd6MWZYv?=
 =?us-ascii?Q?3ve6nRkIb3CgmPzgyR0ljsbHqbW5prpRqq+B1JaLpFAxIMjv4F4zrnA1Eq1G?=
 =?us-ascii?Q?rGJU8U1dZOZxrvf8QH/+aZPtdaorPRL3jMzQ/Mh0TgIjvjgDej7TWnKPXONl?=
 =?us-ascii?Q?SpAv+XkLojejQ6/91iBMxowaOLim6Q3IP6b/qOL4OVpqKse4GGxqD/x4b78B?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f085090-7544-4d5a-050d-08dcbe0481f2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:02:55.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IT3Ky0acnUHhfTVCWpBgfnqOAWoFZrvJzKMg8fQEwOcn2eENSn7vQ0hEStr30woXG1nHftrGY0dksW6vFFirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

