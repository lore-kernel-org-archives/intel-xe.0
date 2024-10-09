Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98058CEE33B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667B910E7C6;
	Wed,  9 Oct 2024 18:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQ5KAyXQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5260D10E7C6
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 18:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728499024; x=1760035024;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=GxlJXcGV+PvQd8uzvVXjuL6KQ6YuPTZ/0uPdogvqWis=;
 b=bQ5KAyXQMyQRAP4BHSUjvq0zQdLRT1TtP7tVXwCDRqfGwaspqYA8ffvc
 0xLh9/c2nMWaDgtkD0iqi9TUHephoV9oItzPUkvgYK9iXcq/mcuABP3o5
 7ZCJiwwoklKX+iYCVsvgtq5LZcJ53hBgcswf63VQ+NNZuP0BVhqUyClCT
 DjXTg8pUkwaMhAERQOan+JDx0Ez5mXR0jZmMgnv++JpSQyGbuP2rqZbnN
 PHztFwyIJhrbS6qlBw5gKBh+XBbdWlm0AZhY7AbbNz1J2cGXuWjoftqRg
 lMwcO0bCOVfjv6qXeJpK1c+JkyB0IO+xT9Pe0V/F7HoAhs7gSuPxYa+yF w==;
X-CSE-ConnectionGUID: mjdRakiuS3WgKCQvDlqvdQ==
X-CSE-MsgGUID: C8WOzEftS+aQv1kbUmrCuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38950384"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="38950384"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:37:04 -0700
X-CSE-ConnectionGUID: WzvnnUW9TW2uvDVfl5iMng==
X-CSE-MsgGUID: hxQOrgKiS1CeXBQVxC9NdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76807821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 11:37:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 11:37:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyxUHPS8lJ4wI8fDJgsNVmK+T8r+grlwc9/efmOdu3DNZA0MFWB4YqzzKUF7mScKjKRUa3T6M8IeJrICZFvdf+bdEewMJo4huqq0hrIsqftF0X0k/va5X0SqRjswGBNULDVB9Gy6xBLny4aJ2gy8joH/sjf8cMCxIG8alqBUvvaBCmjE+4UDbM2nU8fiM9Od1VvIXu5Q3hfUAby2NkkrSSNChn1djoHSXzmrVsrN5V86ZPUSNuNZjH490q03ZEAhrIFWEChFer3YJRthQLmgYN8vi/QTlbpciSXjX4UXV1VbQ93jLSOlADIr28TfSuhbhZR04b+KgZbn6S4R9d0dhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beN8rX+s0MKMXVrP1B9kB14bNhsm0LrNmii7Oxd/YYA=;
 b=vvxY22H6OY/JHOpqEm4aHzHPxuY60F5YLs5PYmwf0GYa6MGPJ1BIHlVvADdj+DHcOtY4mdJJG0dtxwoxsfGNobo9Unv2uMMa0KvpqNflQnrGSWRQgg5QfCjl/HOU3H12J0yGbsgnE7QVvANuaTLdX4q9AJjQiYQlwgwzTOv/v0z7UmLG1wDRjExatDCJxFE9o3EMtNpr+Y02k0XeULY1NhpWr3zR6Oqqxo6je3If353Ax5B0I8jdvtL2FXbW001oNYKxqM/OebgWU47pS07KVGYuUFyhDyDOgV/UVmLgreiZBhDp4WVkQfgbc+uGuApr4pcNPEWCHvgDP62E6Rh2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH8PR11MB6730.namprd11.prod.outlook.com (2603:10b6:510:1c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 18:36:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 18:36:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/3] drm/xe: Introduce GuC PC debugfs
Date: Wed, 9 Oct 2024 14:36:46 -0400
Message-ID: <20241009183648.36948-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH8PR11MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: fea78cac-2622-4d25-031c-08dce8915844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wxa7QZ2tKj1HKAIAsvbNqE5yq9EVTGBbT6Nml+7Ut5LlDoX0DvxkiG3ja2uF?=
 =?us-ascii?Q?Vwi8Rq0rJ7E9VxS8Qm1F4P+7v61UgQ0hqCGq+3AbdNw5S4kZuJTdTL5f51l5?=
 =?us-ascii?Q?yBNQWsi/bHdNjpzMRoALMMZkN/ZYmGHF6563AyHHiQWC4Evt357rg+mZgXKk?=
 =?us-ascii?Q?DEAvD5hnwCfQ3f2ZDFTc7HkbLDuqdhZf9dY0QAZIu/XGVPWWjLM7+6eHap0/?=
 =?us-ascii?Q?regh5Qakto1DsgzxcZirqiy8SO8UtS5p+CnnJf/JPoUz2fUKBckhGrDE0ibQ?=
 =?us-ascii?Q?RL3TnggXZ/ZYkgoLr7nsrwAtm8uYlRlI+XgGoJVm7IEwK+LV6BlofiKgseuo?=
 =?us-ascii?Q?6mPRYPvsBUw1sjT7VLDpbTXbQtMpMk99T9tmzWhPz/7cOd0XvdzdFYEAHblb?=
 =?us-ascii?Q?aNSfmxh5EF6OSPTIh0yP5OoynYtZpuiSebnzp4RwO3DZzssE5dH2T/PMy15t?=
 =?us-ascii?Q?FI+7PoBbf9Qvq5Gx7W+I2E5OkzEbAlHeFEwtqKh+YtE6FOmLugFmDWsykoIL?=
 =?us-ascii?Q?mPvvJ9Hn+UTiBfpRka1oEqJeF8xYsZyUWRUNWrgyHyV7atjgJ1L6lb4qqHnH?=
 =?us-ascii?Q?ZB+K+HTENzQLjw5GPmJ9nt58YI+N0PPKUSExITWszurZWZOp3PRVNn+hvofu?=
 =?us-ascii?Q?W1g59V65eaZjMmsDVWvEJgrNHra4AmjzlBzL+cg7poDqEXNHMrJKXELXEJue?=
 =?us-ascii?Q?uRJLbfw3VdaHzi9sPU3pPwK0QW5+fvEUgsAiYA+3UpnpqzFaDxE9/VMEL+DM?=
 =?us-ascii?Q?zbO3rd9w54BD8yg9S8lrAbKKIOAtF+pG4q7yiO3QvbKV/QPEMhhZAP438grr?=
 =?us-ascii?Q?+/s4w5oxv97HlifnXr64N2evZmtmsr1b9PxiRmTm4au0NZytVhajWNK03T1+?=
 =?us-ascii?Q?5sc1AWwiADqMB7F8+AEDtidDs8kCYHSaaF0cDYURFXKZVLtZVEYqpk4k91ar?=
 =?us-ascii?Q?EEVqBcYM0lciYFcBdh8LyBLjjcrxr4IveG7/93JUFVkTPv1MxuP5T/ZDg6ot?=
 =?us-ascii?Q?wwhwFINR+tVg+yam9VFa7XTqHJT7lKlp3T1ityQSHlBkwOR652vkO44H3gMt?=
 =?us-ascii?Q?7wUKyvKka4jeTM845DsL+ddHJ431T9QIzx3TMwliWNo7PWTXuBnHDfU6BQHO?=
 =?us-ascii?Q?xQp39EJU174EUb9YAiCjUcrSNgjyAWlR61D6GEsL7fUvvfGRe+9kxe9FceCX?=
 =?us-ascii?Q?haWpHCpnfTaFrA7cO8vdvi+8a+IwutwL3TKMKmDk+4QjIMzyG4+f2hGFaxmi?=
 =?us-ascii?Q?zZLZmH3y2L+Tfq7FW2yzFXVlhCP4hYJbQO8Zgq905A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0852WFQzfmzkK5Uc+gXHP6i+CB0+ZxHCbZUxdWOFJ+WyU/fjY72MF5pHTlR?=
 =?us-ascii?Q?j3kDY/gH1igG0L4ElhmjgHKZIYpJjqZAUil7KL4Uf/up19TbCkhUnoX6pCGK?=
 =?us-ascii?Q?2RdlAUkH27GI2QjzS4WRWWaOsi1TQ3Mnvylv3dSztP7RlHU2AOonfpkK+/zJ?=
 =?us-ascii?Q?YfMGCTUNkGk+cMtgqYUviSB0BOFvk5fIrq6Gs1NKO/wzwi10wbtMCZx3/LOH?=
 =?us-ascii?Q?C0/fAUjOEL7bFahGKd5jRJZ4qNOSmyyLGVWXad0tm0+bvu6ohyelS4cLAVFH?=
 =?us-ascii?Q?RS1fKiSmtZeonbzojXe++t4BCPz6lrMNa9uYU7uVbNXEYmaj5kv6se0pz2m0?=
 =?us-ascii?Q?9neudoMi2POmD5h7jqbi9kz2GlSv7X9bUVVDpU7fpyheaIYDblD0UA3KYXSS?=
 =?us-ascii?Q?StK8fwVnc0UiLDrQ6dxRsGq1C6f33TxzppU5z4IgJWrfnFFH+ueJtX7q9NJU?=
 =?us-ascii?Q?KpDR7a7Gy+aewrOuos/JYgza3MdeF1A3bMmxA2MpWUg2lysm8xkFqo5c/CXf?=
 =?us-ascii?Q?Acqn4sUCQhArWdxiBUV5akxdRpCQpcRDlDUeSI5lbqPMY1UsWDelXZWvbpvX?=
 =?us-ascii?Q?UTZlL7jXn2bViYPQ+6wdU2uqHTVqGBjXKSoF6VnZpRCY45xhTG7bcrx8529t?=
 =?us-ascii?Q?mYQiQZx12Pt3ISIAipVvdhwZypOYUw8Mt2Wr3Ae73dj+J04x3feiDKZdd7W2?=
 =?us-ascii?Q?5ytz6M7I/DbZmiKp0SW/74fke451w7VbD5fOyHWkyVphmpb0xq2iMtmyottp?=
 =?us-ascii?Q?v1Po+2lN5H7s2pv3MF6nRpTMNnTx8xz+7RNvr/ZWtcd7HYG05HEQv3roZGj0?=
 =?us-ascii?Q?LJCZSdY4WV9T0Gru3EnlnnXz/0qpR82Vllb22NiqXrIT5e3ceiEYSrkIn9KP?=
 =?us-ascii?Q?dRETtXWLLW6GeGRRAakQ+w8b2w0L54W/1A4RF3RBmL7717iN5JvORgtQ+k4M?=
 =?us-ascii?Q?Do/qMj6Q+rJw8XCpzBigWlse0t/1zvPd9vWHyr9Irjd0sG/8p1Tfe20xHszS?=
 =?us-ascii?Q?6ckEC+1dyQHjgs5cMheSdgMP0KFY0NztgMvP8lxNOyKmzWg3Kfi9f91og9oK?=
 =?us-ascii?Q?7pPtTCQJZMjtasN4r7sQafBk9jyTx1Iq32kNhhTE5vVBOq1bum7tb+/LVB3L?=
 =?us-ascii?Q?wXerF7ql38G4DXKoz0rGHvTV6XZpZTapX+HQ/EC9ohYL8As+FRNQEK6QBWuz?=
 =?us-ascii?Q?PGX/H3Psdjl42uUPsRl2vo1XrwuZBY6XJ9CUT8Q1TcXZWhUt6beb6r8V4baz?=
 =?us-ascii?Q?N91jM4ytQ4qDOdmVtwoENtzl/w/Ky0XP7KbkmHddKqARYXqx2JUk6q8h5VUQ?=
 =?us-ascii?Q?cbwkyGd4bdAsj8t9RGBcu8Hpa4VOdxOYLULozm13YiWWKPFHyqUpsxAuHtPk?=
 =?us-ascii?Q?5OlqGJmkx4Y2sv9ELKuUnZBaKFqeoDCMi36cuNuD56zVqifbPnsc9j8TNmhP?=
 =?us-ascii?Q?28QbkuIix7tpQkePgW1cgArRwPyrqA9bt4kNYfyGnO9yxTsFQQA9rxg2d09u?=
 =?us-ascii?Q?Szxp/g/m4ON8rUuWoDo74hXaMrOMAMcLhX2omyc8yszA00vQrfPgQnkIXQkp?=
 =?us-ascii?Q?5UHvnLa1gfRD0Cx6I/c1x/robVolM2TtNDlQCkeDyyG5XaYf9i/A6PKagXN5?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fea78cac-2622-4d25-031c-08dce8915844
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 18:36:55.1500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDMpDEetsukZig9p4fh2g2TxqoDr3RTFyCpZ8KzmkJhYAgmiC2/sNvVW/C6ZwjHcLicTIEmfpA30tqKSPf5hPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6730
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

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c      | 67 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
 3 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d3822cbea273..8baa4913dbc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
+#include "xe_guc_pc.h"
 #include "xe_macros.h"
 #include "xe_pm.h"
 
@@ -47,9 +48,23 @@ static int guc_log(struct seq_file *m, void *data)
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
+	{"guc_pc", guc_pc, 0},
 };
 
 void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 2b654f820ae2..4b38523c49e9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -1082,3 +1083,69 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
 }
+
+static const char *slpc_global_state_to_string(enum slpc_global_state state)
+{
+	switch (state) {
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
+static const char *pc_get_state_string(struct xe_guc_pc *pc)
+{
+	enum slpc_global_state state;
+
+	state = slpc_shared_data_read(pc, header.global_state);
+	return slpc_global_state_to_string(state);
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
+	drm_printf(p, "\tDCC in: %s\n",
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
2.46.2

