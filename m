Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59293E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 15:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263C310EFDA;
	Fri, 20 Dec 2024 15:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhSnODvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9249E10EFE3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734708626; x=1766244626;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tOokshb4YEO7b07NcGujQKsRBenLnX0QQIy5mT7ebyI=;
 b=lhSnODvkKpUlEJX7GX0a7VC6KDlY39zlOUNrNNJJyv8SkN0ayM38BmKl
 mWZ9d1jPlIylrTID9Q/LLi7j+E+mL2exa3S8lanekJl46eAqLeW5K6ie0
 7RtXtgzVAzMGAvKKMyApjt6CpFnxcp+gUGw1nRr3owYX+1r0PoefdZQAI
 lsuaxefnKpcj0hxuDK6s+o2QJK+AIxzZm3oVJxfhcwrHTDU/Z2nkPtuxm
 hqkd4+sRQLPE9/o0WjzMAWPxrse/rxZubXauRo3L4ygLD7SI+JcQXlS0O
 zJIHvehWHkghA0cdtqoV+3xeQiFxwHOxX4qBaVbSMzdaxm6AAe0ba7OIs g==;
X-CSE-ConnectionGUID: ymTJMseiRgmIqyJ5W6aTUA==
X-CSE-MsgGUID: FLQj6WT+RHm24W/cpIskFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46639454"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46639454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:30:17 -0800
X-CSE-ConnectionGUID: ZXgpS7T3T4K69321yP549w==
X-CSE-MsgGUID: bMSY5d7VQvi+wvquoLG2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="103408510"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 07:30:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 07:30:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 07:30:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 07:30:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWXyimXB8ulGF8F48NZ7AecDC4639FOaRVyUIhVkgTTbgEshvVTPQlldGNwZuukKxM34w2I0AFo/eJxjaV6v8Px2c95fHb14+m9mUsBiu9dmITA+/sTVcOzx021+jfhYUDlrs2NRtWJnnlQFsbCK7mUN7kQgrgKq5uNiViVBgWMvWU3Dpizff6mR7LgwT/WlmEIyNWIPxicmWiEZaSTwv30s9msK/baGwkFqHRTi+r56Jq1E2T2mPjJmqxmR/Vkj7kA22jcZ0BiUqH9uoT96gszMS72Go1b2Fcic1t6bXEqLRRrNUvZBwsFvLAi7syDqsTO030SCLHU8/N4GIqW2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxM77Aj5eZpp88dQ5kAv7SJwmrjk/D0h2KKBWdDQL1Q=;
 b=CA7SloInw+theF7yUDj2KKmUPcLNs9jj53Q5oAfOztxXaG0+sjpqZ0twCDbJ0BHa0VFCtZiOZ2Vn3k3nJCY0EldevmruvI8dH2pCBYKRfxK9aQ0G84+8hFGi34F7Z2MoSu+dakavtCtIGM3npxXHoBSmhcbmttlr0pn8Jfh/0joRz9upM5TmgE/1oPDAc1oqAko4Tu4750oQV3zneu2rGDkbz5lYCfD1n2swx99+dQKHPkk9+aOeQAnKL11tmKsEtKSFvpN/i46zYukmRDSFdRhUsy8/mRaKqHAmRc+lB5+vm9p3zqk61ZRTgtwGlLrqBzoHeGEBPnj8NaBrnIfYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 15:30:14 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:30:14 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
Date: Fri, 20 Dec 2024 10:30:09 -0500
Message-ID: <20241220153010.623747-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA1PR11MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 818e5da7-a7fa-453a-ed18-08dd210b3303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hm5D7eG7xIoWAFTNeYiwCExYzd2LsGdkOCQ3N62CH+iJUQ6tqhD6wksynIEp?=
 =?us-ascii?Q?/yy8x6A5dAnLW4WPsSI/UksGywmDRpMO4XWaCLgsqhDoWEyXAUF1jOiYSlM1?=
 =?us-ascii?Q?y6kdcWd6rg9gIHoyKYO8Z1PxmyNBZfn7Cc2DjQJuwIsAGJujmCUL8xybQ7xM?=
 =?us-ascii?Q?itKbxcvbsVK125WOZBV9ow041FkVipXfGQOmckSykosrP9IsLua0zvU2GntU?=
 =?us-ascii?Q?wycYGJAlPQnfC7EgiBL8siVdjIZM6127ZmHn7IMYVhSD6tIFuvrPcU8sD7VD?=
 =?us-ascii?Q?zRbrSawoEznvGYgPtE4+UW9k7E4zZYFdiutGfkoRF+dOMbUBHBWbOtjFuO4s?=
 =?us-ascii?Q?2sQfuJgE5bNl2nSmLwV/Xzyj/WRc4foxPnPA2CIpqLyfxsWeQ0sJG8aXvMZ4?=
 =?us-ascii?Q?hl6cR1vgiph22PuQ3cvJJr9y8bSfelXJWYrEfLajrsY2MatcT71NMLZuzDg8?=
 =?us-ascii?Q?fDGvphxJMeAcRgnaOlOP79U6ZF+3x4flWayWAVymXXGp/beorbaNeRHuJd5/?=
 =?us-ascii?Q?AlQ1vXqML4+azPJuZjxL3QqUEtKcBS+RXglGv5nOJu+YE/ano3Ki4m3qiyxh?=
 =?us-ascii?Q?DyVeSS7fqfXi1EhHpfQVVyIN3ndSvWr+KyH7DimIqJ+qlnmDA0Te4P6Bk8Ej?=
 =?us-ascii?Q?Zzo5VHzWa+2tRvBN5s3ain5gsiTjsHmCJSmtXdyLeCKZr3t2SakLpAosM2cC?=
 =?us-ascii?Q?yYL/t+N+kYM7m1SLzk2HgYRFjudcyTLunNpqamBCdIkCTca4WtgN52Xa4j06?=
 =?us-ascii?Q?MdK7kFD/sSnwx2RbFmhOT6NsFOBluaHdxSqas0H2eR871XZ17TywBTKLBrsB?=
 =?us-ascii?Q?qC7xjc9W65Lx72YmeXRUNGOmRgiUwfuMtoE6N9bh4LHZWsKSY5k78FNUMn/3?=
 =?us-ascii?Q?mr/0FmYBT4pig0BZHQn70p7u8kKQTP0rFqSKj5yMpvISLaNhkuhVNY5RB1FI?=
 =?us-ascii?Q?UD6hrhM7gQZhTKdgzAVfKVAJzzhX0UAqRBtdQ5YgaiUAGkOpNSSTXwsNZwCb?=
 =?us-ascii?Q?JGONZkvX1j/6KgNa1dVLg/sl1vS8EEgHFOCwnGumwa9hqiGINz2w6MYc0wb7?=
 =?us-ascii?Q?KvWAasK4/MOFbco12qLTx9wvEvwyI5CUjEd8pyp8DaQpiSk+4zOPNSuAvDRH?=
 =?us-ascii?Q?G8bmCwCFc0bIueEwKfHan4En/5OyZ8lZWdFk03GDbpNBoYeIVkY+6qOonrsF?=
 =?us-ascii?Q?aeJtw7iTOepuOxMcCB0Tix4qAQ/o4TYH6W8T3ss7+ns0q4sXAU/KDGdVJGrE?=
 =?us-ascii?Q?EBnCSjfI7XOS7zgCIOux5Qey9RLlC+hPnZLRtkuSqsGPQrjFFqFJq7+P5k1y?=
 =?us-ascii?Q?uEmq8SlfoeHk7KSqZOJxganQ6URxbr2A7PMIssS479UOjrkGnHSS5tnlS+YQ?=
 =?us-ascii?Q?O4xKfuHrpj1qqB5POE02aqFiZBIG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ajT1jLRsaGscCuJpKh5QgThkdB/OfebI8eY8ql+9aUqy9Ciqr72pOJwf6lRR?=
 =?us-ascii?Q?Ozf+SjL9wOpe69y3RbWUC8fUlGICvs/tK+3FyONaZpJf2DqsGOxYx5AJ+QIJ?=
 =?us-ascii?Q?e1muMWCfCLg7EIpaR6TywxPmDeVz8r/Xr5im+1VByxx+cEgCUZu+u9JZpvkL?=
 =?us-ascii?Q?6lTDjMj9LIgHNz6uOZ2w4VabDq7LaiX20bcDdUVU6MGclnZ1ywtMbotmUxIR?=
 =?us-ascii?Q?VgOYbqIEXma6idiciNV12yi/qpOmItjLC7vicWbwPn/RFKd17rvF6LphvHI2?=
 =?us-ascii?Q?OvfCXpSg5Zgu5Gy/46eZyfQ24x8FiWHcibrBVto3xkK5TnH9oDmggHuNAO6z?=
 =?us-ascii?Q?jT7xowDbwL5RjVeayksd4QgYozP1LWmYAdG4fUrcWjdpbF5ASGBASDt9Szd1?=
 =?us-ascii?Q?K8fi8xNMIZcplvhRvomAUb3qRmq8O/jcViUEU02s4vXkDwp8PyfoXnkq5AGe?=
 =?us-ascii?Q?k+fz53g87Fu33M84xCQAmHqaJBWF73I8UsFanjaB7gcwKzwqjUjUF6FQu8G8?=
 =?us-ascii?Q?5r+RlvWMzbUs3SsCdcSDl0Xjc8y9Q84K3TYeNN/ChSuclboRNV3I6hMRtF5i?=
 =?us-ascii?Q?nFvrGmRHsJV0vBHcXVJoakaGFniDdznrHgOBXbJXIj7YM2v0ugabqhw/tgVh?=
 =?us-ascii?Q?JGoy6foi8bITL/WA44EhXNkdZigmcnlkU+dTKSVlSl79XUzoxRq5FdRX2CNR?=
 =?us-ascii?Q?DTWr1rgkxMoXxOpaFx/JdKchOs876IRlDX7NYsowXE/yejT3S9ygFPwktJYI?=
 =?us-ascii?Q?yAs5xo02LbusPA0KVtUMZ3VTjmExCQfdz8XKCRKqLL/i5ywrFxjDMDjvEUAF?=
 =?us-ascii?Q?MDYsBD4EVPk+kIr9fV4hFoSTKt84bhePjMu4DCEU5VlzTqWqxYicUQqjdNpP?=
 =?us-ascii?Q?Gl7wRe9+75Q2w4d/QRqnx5LpkS8fCZYX+X9lyxa5Jmhj210FbmVjhjqapGkU?=
 =?us-ascii?Q?kLQPMDk6OJBXTDUaaGSJFPHDlb68rgYmaCGoi4CfjC2rOrcbITdgLpiyN3Yd?=
 =?us-ascii?Q?uSEUWupC4VLvzXG7CCmGtSGzREjn/FmS9anHwr+5O1Dup+SlqU9z5bs5TPY3?=
 =?us-ascii?Q?t0dT32j4RKVAytAcMqD6hh9jbWJYlO02p43bFNRFc7b1WeTx2P7Z3Am/S0wi?=
 =?us-ascii?Q?lDR1RUU3iM6/A0eLeDqq8ikOjqYaMuqMsRXU/wceoukgZeLLEQeYZYD7Vpqs?=
 =?us-ascii?Q?hJSdPa+9hyebTISh22M5jjVmjxtIUNFTMiRn1slUQwWfJFb/87O4qwRJ9/07?=
 =?us-ascii?Q?JZYtjXoJVGh+aVjAS6nDeqSop3OomblqDQ9ZQ+VBN3fv92M2EZ9reN7iCBlo?=
 =?us-ascii?Q?an01YHfirIZVdALJI50RKhW42/VlqrijSD0SoMazIowi75T87MqefMlUArkF?=
 =?us-ascii?Q?qYj6FKxsCyBSp2DXsWpraZSAad9QMtkfSlWBOz5eSp0ENNPcZXNTjUsk3+f7?=
 =?us-ascii?Q?XYBnEJ//afpvRZUz+70urBtf6Vku5lc2vBNVu12VokqQuQ3kdT4lMeQnznmX?=
 =?us-ascii?Q?+dHcs4D75jRtWFUTHFlkpcV5SILP2x0N6Yn8DVShsOe5QkyFIrKt8wQUfxf1?=
 =?us-ascii?Q?0ZCYyHbP3x2ItJaKTBH/+z6wYOa7hNLJgwFARJjBok1+OEjTvsi5XQfKVElM?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 818e5da7-a7fa-453a-ed18-08dd210b3303
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:30:14.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1sq+6Cbblp2nxces/Png2dVkmax6qz0EgqtjRP9fAa8jRetWj+3GryPSCpZqpf8pVSIguV1KNyTmwPgxYgIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
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

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c      | 67 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
 3 files changed, 84 insertions(+)

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
index e8b9faeaef64..9f9e0642c796 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -1094,3 +1095,69 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
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

