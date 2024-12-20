Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A1EE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EDB10E2D6;
	Fri, 20 Dec 2024 21:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6fVsF7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A7510E2D6
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734730912; x=1766266912;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=vCuXeST1gNu80kIPud88IZNCpmY6Q/9B50zTfiBn16M=;
 b=K6fVsF7RY4oaNlzIs/WvrAgpMPfvoRY2/xy8aHSJP0Oxd2/npeKs457R
 eyee09VJ77kAQsSDOo6rHd6I1VlFtZcIgst+PagGBwmnBprtOKqP7FyQv
 G9jHgFEJVlRG3009PRYVoXzr4hPUxEEH/wQEVYb+S8EVHqRWp750n1KBP
 AyG1t/+AQLqkEQszM3g3lPTvALo+1G6uex4h4HJFcY9P0z+q7GLQjOJBJ
 UIpjNexMPfvJ0QUzUQjzGWsoGU1ff6VRv9n+62qoP6tC0T6w4lCffup8W
 v3tniIT1m7I6Y/3y2GaYn87qFXCiiePtDav94NnIVi5Qt7XcE/Qfs/Y6S A==;
X-CSE-ConnectionGUID: /qdD8H72RjCqcN7HS5Q4dQ==
X-CSE-MsgGUID: KLBE2V+JR/+XlB8x7jnBVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46297664"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46297664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:41:51 -0800
X-CSE-ConnectionGUID: ceeMfCUTSyCrzsD3mdcsSQ==
X-CSE-MsgGUID: kAajrln4RouDv6mJKoZrnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103606329"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:41:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:41:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:41:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:41:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isH9fQ5p8NcvyPGixX10GDpWopt7zizk0EYe/1uASs9b1w4r1gft2PZU5inOzbj3IOld+55HNYvGvxyP8JVU1UsJDizY2tlWocjw/TqGeNWMGxFo3WhyLk3VucSSYvRAlCDZdmQR8cR8NDMKEkLu6oQCnAayFH2an/4AN+1b//87qpCj3wg8baPDGp8uiEwmVOSHgALj3Vtl098HvrMAk9EZ0HcPWJvSpzmjjJq6l9lG6tHM1CuTiA4RwU5dv2R7XbKMO27WNoje0DxA4wtT4IBk08tBPYiSfKsrAKeN7VY4+GHuKYlky6Zc3paONCoVzsUuRnDM0FUEJKw/qsgqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5jTjyUM5PRd4xfEbdFfK5ees5DkgOwLUddtjXNwAAk=;
 b=G3jUikJpIvtAvR6QC+9ZLi847AD+7YU1nmNkiMeFzUGE4MZwLS4HxyIYO/PLgvf3/2xrqgM4+ReDxF+hSltxpI4wIAD8UsK4rfTV/uTusEAHR1UHPH4Key9cdsOi41rZObepIomN4we5jRnjsfhhb1iBnH2AUOVoKke0k+DJBP8aimsi6cxBqEqlcjV4mfDIzwoKQ+aE9YG7joN3g1EIyf49eIISZpYR647Jg0cN6HqzSLxpmliOaHfajWGWXbFuaAwi0tIdrnxMiYpBw5AhL0cnZaMXnE4daEGvZwGFxnxZpwOICwWRaniNNEjGwMrjt+mlv7xl1CRJ0liKPcoftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 21:41:43 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:41:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
Date: Fri, 20 Dec 2024 16:41:38 -0500
Message-ID: <20241220214139.773729-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::15) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS7PR11MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: df715aec-57af-4351-ee2e-08dd213f1879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lNtYOYixbrnMk8DLvcFXp/PD7qFqKm89A4mqXALguvVvCjD7WeCON+1nn1gZ?=
 =?us-ascii?Q?LO0PclBTezaAryiT73tX2MFef/SJnPZCD8o+6hJWcljPHFrA3BCTZjpkzDjv?=
 =?us-ascii?Q?bNEVFxFNL8QeHwScPi6uaOiX6Tsb7udS2avRETIYioBcB0RY1QTZdlVL2my4?=
 =?us-ascii?Q?YmmQ2q/L/o6mAoWk0QItN0Dp2DtAbm+AZamO/ieRrLpXnhcg2HzxNzXHtkUk?=
 =?us-ascii?Q?ZRyD8arDklFcVESpkeQl7zbvyoq9g0YdJ0iS7NiaJILVL8qlCJ/oq4qkcm9k?=
 =?us-ascii?Q?yBKAwAhWMcSCtWBod9jVD2rkxmgqOsUuJlGR0FSKsGDRPW6TJlNBwQ0JHg8w?=
 =?us-ascii?Q?qqDQhqy9QzI/78TfOwV3yM5e/8X45p4Fi3I8DIUs7J9SbVYWXnqjGbAmDZNl?=
 =?us-ascii?Q?1WrCGJ0ULIgzvTzv9JBQmzMHrOsGY1qmRC1yE8M+m9wMyjQHrzVZ81c5B0nl?=
 =?us-ascii?Q?23n09j4vn3BrVNHOx17tDkKFbr6LuODTzYRs/OnYmHGO064ig6VZkK2k6tA6?=
 =?us-ascii?Q?HFQDVJclt4iETz5MFogOULbDCVVRUh371/3fdIIl3UAS/uEhKuTUqNHgoh+/?=
 =?us-ascii?Q?sOkhAYrItYKUPT+Zh+oh2nj9x1hbY/ltK6lfhSahM1y+JfEn/wKtAnhpUfC+?=
 =?us-ascii?Q?lChpMkoUEvTWONgZTTNAQWuz+xzY0JjmaYNRVVCi5fRcP0THmFhMQvwZ3x2H?=
 =?us-ascii?Q?hxOs7ADLZi1LdIcXbc08KpHsstyPbXQVZGShqAJOdTBJAH28Mgg0pU7W2Ijw?=
 =?us-ascii?Q?fLv67O6gqQab10gFJCaJb25YArJdn4BJYKMyzf4GWq8e4wsnJi5j7uvq6Rlh?=
 =?us-ascii?Q?71XxQRyIrH/CiEizcqsFmHtYsTy3/oDIOjHzE7MSYRqmAhn8CNpqvpyLdPqb?=
 =?us-ascii?Q?VdZhxlSfcdP+Hd5s3tbE4bCV/GNf0YTT7sRafMASht4fqXTxj3rILBYpMLUP?=
 =?us-ascii?Q?C1m8Kc760U97w68HhsfLl8PEb63rwWaUtgZNGjJjlVAWNtPVsp0EQA/2h4iU?=
 =?us-ascii?Q?w+MqgMzLz4nHv5lpGosM1gvMJU5w9rLaKOXDhE/EcsW7ovNzIgnhTDuWME1N?=
 =?us-ascii?Q?2bXjtBNGXiQEmCAtLtb+9HC3wRDvewAK+KbxkHskN3Q/e+zwaecg8BV0wzd1?=
 =?us-ascii?Q?cv65IWkIWCzUpGxWcoUD67ch1tYgb8E7ZpL7rQmr6sObe2vPO5CJSTSDJe5w?=
 =?us-ascii?Q?IM6e4H6zugqaUR0cEm+EwehEormT/iEEZH1wljmA0A/Tl2FWaBc4eZ6Lfvh3?=
 =?us-ascii?Q?6aCKwIS7DFPtxUePMgMMkMbO7SyC9TVGYdyHqMa/p/EpdZNKu+txjh0pzGja?=
 =?us-ascii?Q?R8G3a7CC9ajp79vXVfAZ/mNOPgP7GrNBL4s/sLoP+AJlM5ZtyVWp57c7mJRa?=
 =?us-ascii?Q?Ql62yzzA7JQTPvW8l5PSDioF7XBI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwSy3dEMBm0uO7GnXvPSOgOLEZo8Kb+OE2jdDEQRbbqIoiteK212oCTSirdV?=
 =?us-ascii?Q?x8LnT/+lOx4tQaL8CxIebETfmqAZEGRzHONzS4C+wKL3ihImWhGz/vaROveO?=
 =?us-ascii?Q?Cj+l9f+AL+2ByHNXX9ChGwydo2R/irbN2NGF49NI6LZXZcB08voBjoX7KZO0?=
 =?us-ascii?Q?vzhNj/ViBZFkpQz/aQJZ/FF3HGqX1RTpTt7EMw2dI7HK6IypgaYHYOy9JOdW?=
 =?us-ascii?Q?pMJHZlG5rImpaa2MmPeXQGIExedSYPcZWEgpdAuIqdu2cv7DpyBX1wtxh7Xp?=
 =?us-ascii?Q?Htr+fQqqlFTjTr05CPiQKbvkQuiJ20hEIR4gPE+wIqLEyy8WTa/9D4vyq9FU?=
 =?us-ascii?Q?Jg1jspOTpsAq49bowctm+krCy1aogfsytnaSzgqh3HRAcNPQg4vpefronbEx?=
 =?us-ascii?Q?0Q4+mpFnhONOVkSSwzd1bu+O88ROx+gdf7MppKLCB41gicd3g6U+HWb20lQN?=
 =?us-ascii?Q?YqzkXXotB/uae1AlvtE9XX7GYxcWW428Vi+rdBtR4/dNsAoEYtRj4QQ3THpd?=
 =?us-ascii?Q?c+GpT2leSwVGCB6hVArn7dd6XUzhOlZ6sLiVQW62rdweFVmdM8wnTLgvmtOk?=
 =?us-ascii?Q?sTyYgy+AdGvnzXQnePtQA0l2+gZ8tX+fe66pIr/W6yBY8Q5674aMgETfgnfS?=
 =?us-ascii?Q?7BbM6ExCv8qNGHORxFwzb2OKOZ1z75lRvKU4JaLiPwmTOTjOhP8zpq7WMwLn?=
 =?us-ascii?Q?0LHirG4BLN+puGnF6er+L7b5xRrOTaADEVdiJ8ewgXmw8CfPxKTRgrJDorvu?=
 =?us-ascii?Q?v/4mnQixQVMRS5dloTaJQ5+UHYQ9wU5RA3u0wx9VuVGu3dfIXKlm6j7ghmtF?=
 =?us-ascii?Q?72FsA9Z5dujlgBzx/yTjWLQmNKwnGMmaDnHEqXdB7OyxQgm0mjp8+H0lExoz?=
 =?us-ascii?Q?D1FAfpzvhVKmVrZLWHc+KCzbUiPk2xCVi1x0dmf/IY7qtlWLYBDjJi+zD5RG?=
 =?us-ascii?Q?1c1s6nFw4WoZhWNYqqsytmabxkspWn+Os2jjAfPrQPcTurX79+5ooWbAK9Zq?=
 =?us-ascii?Q?CcpeeP5UPF6/DIu2+AFuYL5m0f4zDhKdiCfJhQ10vTufYObT3oFeVBEUnTB4?=
 =?us-ascii?Q?a9663DV+ytQ9gfQZeWvY2khusygBObwWpbMqzbFD23qt+xcbldr6AVfZsD5d?=
 =?us-ascii?Q?KB3gfE/yAk0r49gN7oZPExjXnhfQy96OObZhsYQJteZNvmPaBcLeZ7+NKF8u?=
 =?us-ascii?Q?wWndvMUab+5aiXEhXetNXpV/i+fdHovPL+u7okQKp+7fiq2TQ8wov5dUJ/9M?=
 =?us-ascii?Q?MlG6bgGjFeyMN4GVDSRFGOnEDWc/0kP5iHDuX9G08Ztrn3J0fgYGHDokN7Xj?=
 =?us-ascii?Q?hWENY41pLFvOp1f4DrGSpUa/lmsLAhkNIrgV3B4tNfIfy2L8QJGMbEFJlpYJ?=
 =?us-ascii?Q?m06DF0edKryubx1dIZU4RDEUQMV5Zz5ptQAiYIChfq8cAn7SphVtS1jnYXEQ?=
 =?us-ascii?Q?MVN3h5kibjmOoLBxQ4HL3iPscKXlubQbCW9AXF5FAGWMDDOAPKBI84coc7x3?=
 =?us-ascii?Q?VnKAJkcHvAgb5w0ByuCX5CrX0lmatmTg4wvjAONNWyR20Z0KWjwIUUC/woiC?=
 =?us-ascii?Q?8cELixXmduma4FabKGb1C0uvtgNtW2SWxVgKgUr3U5D7pXPIiZGLVs/eFY4E?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df715aec-57af-4351-ee2e-08dd213f1879
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:41:43.6126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nyHK0Th0q6T4GyDW7YbCp/a0SHEFvXu3IaKL4JGuynsvsldujip8wYYTu/Kqr6qYu4gTl0JJ8wfwm7ly08byA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

Allows the visualization of the current GuC power conservation
status and policies.

v2: Fix DCC msg (Vinay)
v3: Simplify pc_get_state_string (Jonathan)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c      | 59 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 995b306aced7..0aff1d462bc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
+#include "xe_guc_pc.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 
@@ -60,10 +61,24 @@ static int guc_ctb(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int guc_pc(struct seq_file *m, void *data)
+{
+	struct xe_guc *guc = node_to_guc(m->private);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_pm_runtime_get(xe);
+	xe_guc_pc_print(&guc->pc, &p);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{"guc_info", guc_info, 0},
 	{"guc_log", guc_log, 0},
 	{"guc_ctb", guc_ctb, 0},
+	{"guc_pc", guc_pc, 0},
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e8b9faeaef64..5080cbea3790 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -1094,3 +1095,61 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
+
+static const char *pc_get_state_string(struct xe_guc_pc *pc)
+{
+	switch (slpc_shared_data_read(pc, header.global_state)) {
+	case SLPC_GLOBAL_STATE_NOT_RUNNING:
+		return "not running";
+	case SLPC_GLOBAL_STATE_INITIALIZING:
+		return "initializing";
+	case SLPC_GLOBAL_STATE_RESETTING:
+		return "resetting";
+	case SLPC_GLOBAL_STATE_RUNNING:
+		return "running";
+	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
+		return "shutting down";
+	case SLPC_GLOBAL_STATE_ERROR:
+		return "error";
+	default:
+		return "unknown";
+	}
+}
+
+/**
+ * xe_guc_pc_print - Print GuC's Power Conservation information for debug
+ * @pc: Xe_GuC_PC instance
+ * @p: drm_printer
+ */
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p)
+{
+	drm_printf(p, "SLPC Shared Data Header:\n");
+	drm_printf(p, "\tSize: %x\n", slpc_shared_data_read(pc, header.size));
+	drm_printf(p, "\tGlobal State: %s\n", pc_get_state_string(pc));
+
+	if (pc_action_query_task_state(pc))
+		return;
+
+	drm_printf(p, "\nSLPC Tasks Status:\n");
+	drm_printf(p, "\tGTPERF enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_GTPERF_TASK_ENABLED));
+	drm_printf(p, "\tDCC enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_DCC_TASK_ENABLED));
+	drm_printf(p, "\tDCC in use: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_IN_DCC));
+	drm_printf(p, "\tBalancer enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_ENABLED));
+	drm_printf(p, "\tIBC enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_IBC_TASK_ENABLED));
+	drm_printf(p, "\tBalancer IA LMT enabled: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_IA_LMT_ENABLED));
+	drm_printf(p, "\tBalancer IA LMT active: %s\n",
+		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
+			      SLPC_BALANCER_IA_LMT_ACTIVE));
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index efda432fadfc..e333eddafcef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -10,6 +10,7 @@
 
 struct xe_guc_pc;
 enum slpc_gucrc_mode;
+struct drm_printer;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
@@ -17,6 +18,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
+void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
-- 
2.47.1

