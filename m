Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7B1606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DRl6x2C2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eLWzr6Uq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4C7112286;
	Thu, 26 Nov 2026 10:08:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D27112288;
 Thu, 26 Nov 2026 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687697; x=1827223697;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=vQ8gQgyQU4gj50VtF0LcAFQESEfbqz4W77ken7quKAc=;
 b=DRl6x2C2Rn5XzwiwM7Rr/NGXVERKGkQN+Ma1Pz0N0xwl44R78oznfPQb
 pYP8FiCtRFKRcCigFnesDpkU+jTGRiDiq3RSsQXpsqULmz9E4uMiM+XkS
 BKfLRE3AZR0E1gUv3RONWj+I2lewsQEQnDJnAZ8myOpbXvqiDKvVdICCy
 s0vJ4/ybO194ea28zsyMmuRI5g0aJg6uerJvYxXrotOjd6SLrBlG+g1Oz
 +V+HOfUy/STUn3Zx3YCx9Z4JgHHMFqWesgftNCaKJvunliNGwS55lJvn+
 VI7Usrl5vNBnrP9XxYz6acIrl+R9oomoXtN5BG7bZcG5n5PoQHYLignZJ A==;
X-CSE-ConnectionGUID: 9+tpCNIwRYO18yO1lvS/cQ==
X-CSE-MsgGUID: kAbCJQzOSOGpPq1tM2eOkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4499557"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4499557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:16 -0800
X-CSE-ConnectionGUID: FBLgHBA4Q9i88e6hSrdhxA==
X-CSE-MsgGUID: qBQJrS7TQamktW0y2zxFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12393139"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:16 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZo+J8oxuBmbcOSlaTKimFkIEzauAXaUxwVRuqKFvv7bXIchVVXh5rFs3TDkIoFvjFdnvh5JEmn3JJJB3PUWg8RBh4+dRPhFey8/LCN2de0JLYSG3SmU6x4EVlrBvkKdquL9OZrXnv6Y3ZD1//6eETo3EEvftQ0MqHbWCeDmjlC/ZWQY0iiiqQHyoIsWALGMsM/mflvpZnfmokEWXG/pUwuigWzFm3tuLxVhFSTGhhVSLfRSXf6DHSF3gJJ3l5T9CSlfyAjrVRq1WRupzq6FfzQi2fCzj+/4aolJZRQLeKm9m6hPc0RjXelMAkRzcWZq5DW1crFXcnM129L2SbNjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhymovBvssZxwI8MaE0azyYjD+Iya/NSmn9Ha6//TaM=;
 b=YKaqC9PwHDTWmLV7LncA7RPTq2Phv9lB9SV8FQzr3ppd5QD1I3krVfLKYmVbi/GX4Nx7Yyzb5Zhim/6Pf16L90WFMQzZb0fMrEIdUl9m3enDZkwegNaaNM/yYUp5Qr8oNa7A5adS5PGs+IIyhuKA7kCUfxv9FHCOaJjm0B7OGPb79dqbYIjysQskGiVbFM1c/EfNQC/JcynMMoFBqTOSH/z9o0g8NtmntQ4n0F5Bif85fU+9s65W+ILMj3ckk5OHremN7Gc3qDCJhhiYq8ouAS4red/26tGe0mzUi3IUr10ifJBlQbm9MROkXoYW50NhWxxxHKpDdtxSSr4JhTDDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhymovBvssZxwI8MaE0azyYjD+Iya/NSmn9Ha6//TaM=;
 b=eLWzr6UqZUSdCib4WYKrXYHis9QfdBYbmT9QVLajMQWUFWyWKpokLYIOi4qVLZm1H28TjS25or07tMVUvf30Ctxuil/kxDTHUENepWwsqH9Nu+J8Z/Y4b20yhQGy+QIVxlQ0yS2PMRgGNzUUHW8HWj79b2J8XsM+ek8N8vQT/9E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:06 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:06 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 04/13] drm/xe/display: Distinguish failed system suspend
 recovery
Date: Thu, 26 Nov 2026 12:07:44 +0200
Message-ID: <20261126100755.1252635-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fea1f0-9244-408e-1393-08df4ba52a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|261009221227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: T3d51LEDHaMEf9fC5EkpKJSCIy/i/m/dojHU0qDPX7gWHKDwnx9Wi0bYloVnfZMg6L1cZZXgPscZMYIZsduB8thmCV6UDg8+4MyrkGw502bJu+l1SR9yRmS3ehAxTF2ijDrApmGXPhY8HuLMFwWDug/BVgol26a94qDUdavwOov+BsTETguRhQpuHV6uXUpFZxljjrK9FBF0Y6XmzOgXmgg9fm1QbfSratke1sra5BwDwIVKg8gooBT2+v0tXA2L1WTPvWuT5WNiGh+uFXp+P3TG8Ib5pEs2i8tsIkMadkZJyZ8KyQqZXycYuxtbsOsfPMMxoH5vtWhHT63BWpXi+FUETZn3J2q/FGMC7898u7SnqWxJZVcIxPfHYOf87qTkCQwI2dYac9bWO5A8Xdk5PwqCyfpYA7/DfsSqT994WXgeX8C0UuIyZCQhI0IaTW8RfvQCYujkOyccwgyYZXlGjWQ3kilhvKFImvy6NdvXzBQzRZi03zwPROFuDaOisfKwmzSE/mIUvkguSBXxYeXjuxaCuOSXghpn2zgjtdKnMtYOka1GZXbd5DW9Zv/C/D5OIxX+PDqQYa6SIJSMkJjfIgRaP6ixS2SD7EI/0rPZOvELlWGLMI7dA6kZZJtfYIYvVSBll5ZesU3qN2C8RPYW8tfP5ueM3csVUFRjxOx8aJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+LWzRZCMk5fNekVNFgld4uNBpNZJ4edhJaG4Yh8/i0qIKVcyO7cNmFfQLvOX?=
 =?us-ascii?Q?e+BzRN1Ty67NElf8cGe7i6ySJoIRFIs2n8qBUHZA2+IRwGwYHA87iLbevIJK?=
 =?us-ascii?Q?B/UVO3C/IOaP364OTvo2vpE4e0Uzq1+zFApPJZVecb80lsskn2tBO3SktoQb?=
 =?us-ascii?Q?oT+4qQjRWfBS89xZ2ipNtmpVTr4XfxdgJncA2GtgOPrwax2/BZO55Fj/nwAO?=
 =?us-ascii?Q?1NqTG61/RQVacjzqZsyOLgYwKOSo/DcOqnOwh9DKedfCm2OaZ+0ABB4WL/F2?=
 =?us-ascii?Q?kwNnheoQtIUABpH+H+t7tSh3FXhp4balmh/UpYBrwkPtdZrb45hG42C1ES/d?=
 =?us-ascii?Q?2uevQqJbxqQbVlwMhU1mwopxXfDTlLMpWNRMxx0UX+ibbg2d7cXSpAru8bUX?=
 =?us-ascii?Q?4U3P+vxLMZAX75zs16vmDeOFycnCMjMmOXPb3sciOibwNhEPV+royfvD8yrO?=
 =?us-ascii?Q?kMvLUVG5xGcsdgN5/InkSIhQkNPnmWaz/vwAg/EBapQMoLtc5lM4qq+gb+Ap?=
 =?us-ascii?Q?u6kHtv148djIhQWZOooWNi9aeMP3Oll6LwnE30isYHX77ZKXN1z7lm/koJB6?=
 =?us-ascii?Q?uyQ3rwb4cMDOLesVMwX7FA5Yh00FH7v4oNxfpm+SxsG1Gt+o9sdRSoyE3zLp?=
 =?us-ascii?Q?f7UqHd+QeKiYiiuRr+8eFDwEtx9vdEI05C7abUOm0Gv28KtDYsVgnt3lEL8z?=
 =?us-ascii?Q?BtGJBWe9Y1Kjis9Y/5th0101g5W4yMTNiwJEWgij9eIisdp41qRQ3nyaeXPm?=
 =?us-ascii?Q?0cBijXCRk8ziPBnlt8YsR14mhW+g2pr7Q3IsIsMcxEdb2Qe6sEWn/qfZejER?=
 =?us-ascii?Q?hXrETdxafz5tSRFWcsNfoRPAns7FTQDnTl9z4yObpyy/nGhYf/BP9vEBATvk?=
 =?us-ascii?Q?P7ItyYBEShVJdwzNHYnlaXFbYvQy+C/LuG40Wxg0wK6f5mITjUDPHBDvGLDW?=
 =?us-ascii?Q?d9tztGRlZIFFMMK6uVlMU9XUQE3S2UtmueHYLPXF+RKzpCGaCY3WWZLnLocl?=
 =?us-ascii?Q?3Ac/lS1bRP/L2xhDqCVO4Nd64RFLs8HvtxwEXLX+rx4YXieE6czG+qwjpHTt?=
 =?us-ascii?Q?EVWp3KOy4lAPXVOymvF25Ig7UMQhnEauMQHPooHHWHI+SVjRC/RA7NXtR5p2?=
 =?us-ascii?Q?BxK36PerKYo9GDa7+Ocqr+CPD6YRm4fxXI4cTQB7SUvTeaFGhPT4OKj9QLIS?=
 =?us-ascii?Q?RDZTzvWOUdXQLQqkEHblieW1ApFx/M4ZJmaS2buebTA0ZZHxWKKStNAn+fAq?=
 =?us-ascii?Q?1/fyzULWsAvWdWoDrrLUW56zLvF2eghbODC8V6GZXgt6DAC/TB7Ld+I1gF2/?=
 =?us-ascii?Q?RxGn8wt9bBub/5a1eT9yuID8q+XaYHvmhZD9ILT6fT8qC9iH8ZYz4vFisDbe?=
 =?us-ascii?Q?rgtU7CykHQzuxkhs3kOs/jKmbk1343H7Rj9T2vVqG8s7KQqYcOZhK2qmMRVX?=
 =?us-ascii?Q?JkaBtcJH0z95uYgTgDxj9cr+EIlJHJhb8aVI58I+xP8NqJZyM56qaJqLzIoO?=
 =?us-ascii?Q?CvW2cDCONejKP+o5Z3sW2uP25jPZTZVHTdDYDZp0qZDllHMh791wVkpMLIoa?=
 =?us-ascii?Q?inmGJpUFuf5nuIjysnG3QortLoSUDr7eQxnGVixJf0w86R6hWjjeRuD5cGsy?=
 =?us-ascii?Q?VW12co8bJ9rlz4qzSRMhG0yYN7YTEW7hqG6QPScNwi8B3Yn3GNXXRxi7whkb?=
 =?us-ascii?Q?8iuVPaxg8BNmBeNvLAne3anyViB/xRj4zKsJ7N2/ccsBC8I1LX+BiECmOZRt?=
 =?us-ascii?Q?DaKE01HFKA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Nu4pSkwQFPmL1BIOeViXpqDFyLh9eksXACAhQ6gEfGbJztvqhkeEneYyg3oqSj+G8qvu/W9jKYxwTWwvsa+SbCOQDMlcEbwz7M93GxKTYT6f/ccRPxLdG0Sju89MKRTXJdM9hVELhIw+f5JXS5kbAYl10dXFNnTpu5H3XB+7HLnYQ7msKV9Sez9qexin4Rn1ld/QD/yBgUKoqidSBe8NoaqdFOoSe/LOCyzTiNsOmn7sTX+BkFMi4P79aQPlhNKUcH1wI8ZUR76Ktx9tav9ld1EYojhBF5g1mVbP0ORe4EwGuYas2U8bs/LC/lpzaUtjAteWTgDZBhKBu6MblP0NcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fea1f0-9244-408e-1393-08df4ba52a22
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:06.0282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aALG52g5Qzm+KngFu9ofXEk/14GV1HUGXUDDiHm2gU9KoXU0hDSwK/bmKUZ23/jFi9iBz0rA5wIXMzb3zNnUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A suspend failure before xe_irq_suspend() resumes display while its HPD
interrupts are still enabled. Pass that condition to the display resume
path so a later DDI-pool change can preserve its cached assignments and
HPD source tables on recovery.

Normal system resume continues after interrupt reset/postinstall, with HPD
masked until display initialization completes. Document replacing this
distinction with display-only interrupt shutdown/reinitialization once
those hooks are available.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 7 ++++++-
 drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0236f69a0f883..f757cfad4bd6e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -286,7 +286,12 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_display_driver_pm_resume_early(display);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
+/*
+ * FIXME: Disable display-only interrupts at the end of xe_display_pm_suspend()
+ * and reinitialize them here, including failed-suspend recovery. That would
+ * remove the need to distinguish recovery without an interrupt reset.
+ */
+void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed)
 {
 	struct intel_display *display = xe->display;
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 6c580d9593b03..79f94be0cfb65 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -41,7 +41,7 @@ void xe_display_irq_postinstall(struct xe_device *xe);
 void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
-void xe_display_pm_resume(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume_early(struct xe_device *xe);
@@ -80,7 +80,7 @@ static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
-static inline void xe_display_pm_resume(struct xe_device *xe) {}
+static inline void xe_display_pm_resume(struct xe_device *xe, bool suspend_failed) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend_late(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_resume_early(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 36693df655941..884a2be28c17b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1464,7 +1464,7 @@ int xe_device_suspend(struct xe_device *xe, bool hibernate, bool flr)
 	return 0;
 
 err_display:
-	xe_display_pm_resume(xe);
+	xe_display_pm_resume(xe, true);
 	xe_pxp_pm_resume(xe->pxp);
 	return err;
 }
@@ -1543,7 +1543,7 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 		 * Try to bring up display before bailing from GT resume failure,
 		 * so we don't leave the user clueless with a blank screen.
 		 */
-		xe_display_pm_resume(xe);
+		xe_display_pm_resume(xe, false);
 		if (err)
 			return err;
 
-- 
2.49.1

