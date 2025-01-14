Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463E8C02183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 23:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ADF10E488;
	Tue, 14 Jan 2025 23:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/QqN7MD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776AF10E487
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 23:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736897105; x=1768433105;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kYlXqRgp2mEm24AVQsx3AEeIxNKp+uVtH3O3mEwm9iE=;
 b=V/QqN7MDImjuBMzMFQqm3DG9bej6AWvwj5Dn9h5aWjWuslYHfEDuFRTY
 JU7aB4Vk/ASEyKybZI9RwU+myRBET/PvD6au6XoSUX6eWTG4uXYj2NjI0
 CDT2ok9sOGoMk2Oyah3jV1Hld6Sa0BK+J17O4JkcCgGH40HXfD1nxOh/d
 fMt7v42dlUOQBl0LC+hLQUf8UEynRqDKKKGg6Abi76AdHFpY0d0I8xteG
 Cs0peQnk1fxIxs0Bdtxp0Fk9d9NA1BxgIXWj6rykI/XRvYeknOVF+Dn0Q
 57x6VdT6U5JM59r1nRyA8HuFLnfq/OGZsUwJTxx5MYkRh732r+TchSFEE w==;
X-CSE-ConnectionGUID: P6AJs6AyRF6dhfUphziusw==
X-CSE-MsgGUID: EGfAmfdET5GMBRCZXQ+fxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36911988"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="36911988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 15:25:05 -0800
X-CSE-ConnectionGUID: E/AvNaX+QIyAHDWH9TCXog==
X-CSE-MsgGUID: evKgtNeETjCT4cNuVUrOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109926587"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 15:25:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 15:25:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 15:25:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 15:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKSZRfHf5ZBNb+eGphYui7UsDUfADpPsnpzNgvRgiroj8+DHNwGNO/KwEc4iBF6dhTomwTchF722zoClfS2wF67zsUAN7bkfe3FrJA23Um7PF6GRHdpER9/aQ4FldGoZY31I+4cMiSkWqY4lHFvqPeyGIRzrmUtnYFhE7qkb5j2nod0zpTF99nnFdRemEnIiaRVMa1hd7kha6bse2jaQL52mhIBxifMarDRMtkxTu0JsY9Jq24ueJCR41jUFnu6POH3aJsKeGyNrjXmU+nyqWjSolSk2+GXWyS6BoIvwZxeVoAiqiHWBiN4ciIX/ENG7jgeOoiYwwfZfWhWfULu4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyR7DgyvV/GhNH2EMVMe0ms52LZindhGHzNMuiFjDOQ=;
 b=Ck5JRdAuiCkqY1IGOSZLnVXeQF5WJ6ceoVbF32ZyrloZRnENFfhUWEGSQ/VdCGZxiDYKKocBqakZCuVAi3ib+A1dVKVxPkdxfZDXX9aj9wHb+H64EEnj7AIggxYNpQmYwssOLy7Yem0zAOmkc3yUGtC3W7U23TuFaX7hfJO5URqbAINiyf4MsJE0v0I5AcNR5liMx8vnGbf9vJ450tV2y/dEJAL9l6U+Abo4moD3zvP6iPTpWXtYtHY+p+eNtEvwYJLFfmMVUZ6M4rjhEFDKIzYUpfvpjHa302OHXHAF9Kc11z5DB+y1elTwplnNCbPkicLw0f7AWf1bjoIjY/woDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Tue, 14 Jan
 2025 23:24:47 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 23:24:47 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
Date: Tue, 14 Jan 2025 18:24:42 -0500
Message-ID: <20250114232443.1135355-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: a21a495d-d534-4886-cd31-08dd34f2a288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bFbdwwfBMdnQpqmouUNwityDKfYr2Mnprkue45oN5zCvsQJI+c3vKuSMblVE?=
 =?us-ascii?Q?hlGxFegwMnmRpr5KnM1UtcVLkPqkE4pQ8uUspNC6poHvlCEI0H4E1nxyXnw0?=
 =?us-ascii?Q?Rd29F8DfCMDhK71Ry8S+AP8Q6uVQi6faHlydIlnAh43nYYr/50siTvy9tHYb?=
 =?us-ascii?Q?Hbkvx+ZSxiaNYcQbYq1EblqEX7UOZa3xYKMCZIKIXuV1OMloIjV0vx7zCDUh?=
 =?us-ascii?Q?cFwNNCZP1865t7uwEiWmge/S+Pl9Gcv2onUHy6NEFoccgPcZXffifMOpv/y9?=
 =?us-ascii?Q?1G25Uv9Pfs8lNYLaSIHT18iYmuQbQuRQK4X+7dqgPxFCsHn6P7o4eke4M8bf?=
 =?us-ascii?Q?PkGD1wXhZ9IcL+KkGW1RBA40iHag1JvYoJykzhImZ1pYq417RPsV6CoDiU0p?=
 =?us-ascii?Q?ykdY6lIWyoU/4mbS8vHLVoBL8/H95de9pzDHx8/GC4BecN4yXEueMf4p0uKu?=
 =?us-ascii?Q?SmEoQKBBG09l0DRDsTwFFSqyP5rotv1GN0hSxfpgqzfvtQDqlEfa2OXtmQfm?=
 =?us-ascii?Q?Od2PWtePOKVAKPZYAs5Vfy7WTaJeKcyZfGhKlaE0Lu3K4hE4L/lYQx/fKUyo?=
 =?us-ascii?Q?E9Tu3SjeGpaapMjppTdr7m+T2riExH9DHxmuWT9v1CA8gJ4OA7wOnFKPi/4S?=
 =?us-ascii?Q?FmePBlGQeH+gqxoOU5IscJziPre9wKoIvnn6J3WoWmW0VCD5+aedAZDdm/Gs?=
 =?us-ascii?Q?f0vkPWsT8//e3yRfCQSa1NDix5TCuz7mqdF0TtF0wjiKUuY3wouKFVGpp9N3?=
 =?us-ascii?Q?9SYP0ymmW4onqtwzS9Vl9H5gOkJ7NBVZwsydDBECEcMTvLMgAf6F4/k4uRzb?=
 =?us-ascii?Q?w+f6BFgiQb388vzIl3mprpCDFR0rfoM6LwuuO/+jKZowrBFJTwxOfa/gtRe+?=
 =?us-ascii?Q?O1+2lja9ex8eB+AdGV8CyL5eQlx/jiUzErO0VACwlyMoelX5yryKKJHPBi4z?=
 =?us-ascii?Q?xk9PYYKQg7osUmEY64W13XIGAswRSDNL8fYHlZOvNHFrfVBPjcfbiLuMOSI4?=
 =?us-ascii?Q?K4HFDDsW1fh3UewsRID6AHjqJxMTu2fP7J7Jdz2N1NFW3ZZ9jYa6qFOzAImK?=
 =?us-ascii?Q?8AEC4anBdXrODTEMtFLwPmtrrMbzFRmGdUnFgW0vqEIf5cf4CGH4wBnVlm64?=
 =?us-ascii?Q?wcUEvDqx2ztjZOqUd+lvRdCP8cpDz31vfvtiaxVysLPs270k46cxYTI3um5X?=
 =?us-ascii?Q?zegZo815Zc6NheGLhbi/OHRcwjU/NbDx7J+ZkkN4oltAtsuPHrC2GEotScuh?=
 =?us-ascii?Q?pPpTihBuhV1aoLfWoGClggoahsLN/sacOsFKbf6l/OMn3r6ts1H7wX3d16dI?=
 =?us-ascii?Q?nQ3Wg3oeXBO57cj4SOWl4FkX47N5Nm8zpx2tPRHcj6Zc3ZVkNjLRaqGScQs6?=
 =?us-ascii?Q?9I7OpnilWU2qLImvneaI/dBFz76Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/bLUxAhUmcOp7wTYZGQTPUqljIWJUPzGRo80rkMT9PRv4wkhga2shispPViD?=
 =?us-ascii?Q?zSxKMo2qU5V1J71Nc7H8dsFf5KMWv3Hi1TGVy3UWlnwbmBRK8s/S24G7eFUJ?=
 =?us-ascii?Q?UVlcWcqSUWk/WQ4k5S60PUApKHwnzZ0FyXdWycukhePoyOgg8B0Y05k1aq0i?=
 =?us-ascii?Q?/rSLFoePuTcQKjKBQLFMGQobO3T+uJ5BBa71ZD5Nv8/m8fCLIhWgxZikNNBO?=
 =?us-ascii?Q?jowQ0EOuukXvCrewGxNru+yV4hJhTfjeUgSzQdvFziDps9LZT4bR5gfXI1f1?=
 =?us-ascii?Q?Ff04D6mXy0zvrJ4XoyY2oyth7Y9U9OX8NGN66uKENoHYb/VkgFQylyabP8Lf?=
 =?us-ascii?Q?4PI9kz/rb778AMFjwmXYJEvkZxaWsqbytmRzTYmtjfFYa5FlGFmpOUX6HECP?=
 =?us-ascii?Q?ossdLQ7hAx2WzvdKu92Rwx7u3j4q8sXkoHRD+NkrRrWjjdt9z8WEBzjUW91D?=
 =?us-ascii?Q?SZexkZuOAtRpz30zbGlKcC0PkK1mwoqz6gavhB+izPvoostsTi82tqUwcMz4?=
 =?us-ascii?Q?0zkSqaG9TACK9XAlXOrFQyS1ccj46eaPyyD/bzYt86fN/xPIj5kqbh8FshMp?=
 =?us-ascii?Q?j5enI5mOIdZZQUQeGABzQWJg4YO1aVOHCB2GibCm9IxkWXWnQNhfCzYYgyeo?=
 =?us-ascii?Q?66xItI0j3GTJnoIDslxUp5OLvtLbaHLQNeO3vmIosmlUD0OyNL831c0gbpAn?=
 =?us-ascii?Q?vP8oE5fAMvqY0XR9Ar0oJlNr6XtoRlDOoso8xKKasq6lcNjjYE+at9Z0Vcb3?=
 =?us-ascii?Q?/OexBMzsFjQ3j5VZvmzJyFxRHeZxtMccUTaROU9GqAjmCcpi+/uGSxJFUHcb?=
 =?us-ascii?Q?0BUjARqmreOvyhhoM3/IW07hCNA0KK5paxmQZPoM60p09GwgW/UJIKekpSg6?=
 =?us-ascii?Q?8ACmsbHw5nxcSGZJTRNEsLmWGzk8CBkkEeinxOwM4OsonxFdocZPKKlCkQcn?=
 =?us-ascii?Q?DKzlkzW/LPrGSlvSMJiB2yYZ3So6IZU32gcnp7mT3NcFk7kQDmCc0QXYltat?=
 =?us-ascii?Q?lIwtmLdwk9bLJkWRJ0rJURnTDFWFItiOLZzPFKQ07e6Weh4xUGEwHyEUHFQ7?=
 =?us-ascii?Q?DQVIu92YG9mxyCQxbo69ErT9HECoLfhLWt2xltSRjNvkps3JAPQJMdYQPSvp?=
 =?us-ascii?Q?uwX2DYP/TLtNUiQ8Glqmw7IfDu4Hmm8La3KhG3RuDDw+aaZK0iCSwrHr32lW?=
 =?us-ascii?Q?RdkTILh8iZWvxzkephEu7A1rB/y4TP8il5t+VdL8zPfTFUMMvaiyAnnIICH5?=
 =?us-ascii?Q?jnMgwiHK3f5q8BatmS5p2QqmQiSDL0kDnQ3BqEkM4kZQ2czKPqRVGF8XoNfN?=
 =?us-ascii?Q?KzDlwYjuOOv95n99sEsSFhoUjaHh2vAjH6Bct2w+WBVTL32jzL1vaHIyyCPB?=
 =?us-ascii?Q?uopE27ZurH5DzXqSmBbEgmEy1QV3muP+KPB19ZP9d+Ff3wtBdxVpd+/T7J9d?=
 =?us-ascii?Q?bsh/W84udqv4M8sKL3tPt99dvZ9NJHYuGpgTsv9jiaK7s356weAvozGj0+s0?=
 =?us-ascii?Q?WRfRFrgiHtmwzxbO6DtjVBBn0NRv2VZVVSfLsCu1zpg5rpm0RAnJMGXIzbSO?=
 =?us-ascii?Q?5dLr1GAePYNF75oluKdbXjc42nqnzSt1todlOxFCcGTq18RlVYlbaeZS0qRm?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a21a495d-d534-4886-cd31-08dd34f2a288
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:24:47.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTKMi0DpiAyxtE/uVs/PlhyzEbE5e2tgBbbkb7tOfsT/9ugIV1R2QmeE1bH0w8OR5IYvJR8aYT8kwRbPEBMVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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
index df7f130fb663..43f9617baba2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -1131,3 +1132,61 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
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
index 619f59cd633c..39102b79602f 100644
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

