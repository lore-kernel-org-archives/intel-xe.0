Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCBCC02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A5810E73C;
	Wed, 15 Jan 2025 14:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khllhJlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECAE10E73C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736952706; x=1768488706;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kYlXqRgp2mEm24AVQsx3AEeIxNKp+uVtH3O3mEwm9iE=;
 b=khllhJlhRCPCch8dFHJPAcc8Jo778I3B0ChRX+bPMEed4BrWb58BIQLy
 SGU3m+Iwx/OR8D3PVBlOgGaaaE8TAl9vZjtlhgoYxg89sgWeYLH41s1Rn
 mSrehlCHNjIYYj5X4epb3gWY/NWXO+9nub2M0ZiKb/KQXn25+3zih5w/8
 YvDGEaoskzst/m/PX1PLu2ctJEX7K6BiTJFm709T1B5S/Kz9SqROjOcN9
 JlzsLMvY7x/SGCXWMy1fvOX4NlNjnP1SoUyIvI5MfLQ+2YwLOQnEldqaY
 4Sj88mGfV8j26jTvkUTi3mTU+OxZANL66fEgLA3+BR2zBvCNUQP7jpcX6 w==;
X-CSE-ConnectionGUID: MnI3EP93Q2i7FY4R66633A==
X-CSE-MsgGUID: vqv4s/asS625L5EY0lclJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37404223"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37404223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:51:45 -0800
X-CSE-ConnectionGUID: ZdnFUYhJR9C4LL6Hg9c8DA==
X-CSE-MsgGUID: ULsb94kySbKsqBNqqESvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="105694270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 06:51:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 06:51:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 06:51:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 06:51:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ws9AWvR12e/TQ2f3oERTIgncXnp9jZypMS5HWoY8/PXnuxZcwqDq+RF0LHlkwOnVq660NlHFMbg/ZHzf3uzmCMEz26jAZWxzdIz/MYA4CutdN3TYEUdEBsVFM55enuVOWmTJnUdJHrZvido3birYiaNBp9va2SPgG5ZEllQ8y3vZKunM8hIkKMbVSfHClpWc7hjeg2mQi3ryTFfYyUuS9PJk7qthmZ9LYrmDMbtkbV5V0OL/cUlRD+0yvJIXJ2ffwQvdGPWn+Z2b4fWgdAISnd6Es50uxOP2XaHWBXE0vH2PVHJznLW8olWYjgzSR4i9aszvXWmM4TDaflH+zkm64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyR7DgyvV/GhNH2EMVMe0ms52LZindhGHzNMuiFjDOQ=;
 b=xdpEfV3PbNjHylfj6MSqt7hPczjsvEmCNuGHL0boU9TdILVmg333qJ90CT5sYN77ZNdVQTIDX4iRUTjpj4YDCvcTQaErbxsIl9nx8Hri8vHBGKC5QTT545wsW3tqLEm2uaTK4BlZiV6xPxoFZBbtEnI0p5r2IBtG3lbdMSgOrO2Lo5B23yO4ze7WeZ3ZEmxttr/qVPKVYqNEQQiWzSwUUSIpKSZo4qtrQlF9kxXTHBP50ZAApvW1QFSyHI+m7REdOBaPtrtHCJ0AMrAFuZuh6M/VN8G9EjMtTYu1OmxwxyORZtrADFX0KZ5meHJlTHwFdQcneiPgqypaiqQdy/ktTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:50:58 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:50:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [CI 1/2] drm/xe: Introduce GuC PC debugfs
Date: Wed, 15 Jan 2025 09:50:52 -0500
Message-ID: <20250115145053.1142023-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2c675c-ad63-46fc-babc-08dd357404a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2MSVh9TW8btwU7B0ZHvRLh9TRRBwOhY3xqYPZRMvzxByhwbfnVuh7Ag9E2QN?=
 =?us-ascii?Q?wiLYMkeqJpUb4HFy5XG3cDp56oOr1GsJl9NpzeO3vy8N+2VnoSXJuSfzRRah?=
 =?us-ascii?Q?hWvINYa7EBSOxK5yoAhPWaAr5aQFSVpO1obxpL5UROFgja43mOV0NEYKDh8l?=
 =?us-ascii?Q?m5vVK1XMtOBivtOrgnZOfd9ayhc0/Fst3exfBBydpCXm3GLHLapXyI0nCRh+?=
 =?us-ascii?Q?dl5AnGX9eZ9mWdG4dECEaeVzcNkVbVjOUjhZuEir0Q+1BVp+1i7UcjT5DweA?=
 =?us-ascii?Q?2K3zjjoPcAfr0qTihMM+taiEHhzbd/Z9s0MaEcvzAqTvRUr8A7BSZQCSe+/W?=
 =?us-ascii?Q?uUe7hs5E9CS3aqHRMTOWJO0+IPLlPlBnr53TV0ItHe5TelKP9xDgBJUnwYIT?=
 =?us-ascii?Q?euc2YN0tTxAtyan1K4fyNurrlgak4vNjgr32aWrW1XVqLMo+YHKphP+7PP+r?=
 =?us-ascii?Q?uWMRCZR4Q3zM9yBPA5TTd+GJNT7ohLBmLkox8+/g1cnlQ7MZ/edRf223JA3d?=
 =?us-ascii?Q?D8XCDRiiV4keUG8vG/970yeOMwjTG3qVGpYssS4ouDqEgu3QgWWhH5bqtAZ8?=
 =?us-ascii?Q?N2O2DCKh/dDUQAN2t5WuqJ0fw2ahP29rOjDYvgR901rej1mBYsmRuqvLfHz9?=
 =?us-ascii?Q?Ao6uf6hq19n8PF5tUvnS+gfQi732GvIkHv96t8kK1MtykPy41kM2EuLXSe2H?=
 =?us-ascii?Q?T0sLcuhyCUbUakK3oTZsQwbIx4oHiuNCgJaLUo16lq/go5IN5kUShBbCJIDi?=
 =?us-ascii?Q?Rdcz3oyo53Zgz2Q7iRBbC/dXF6GkYZWnMBqNJt/CzRS6t9z4+1LjKHhevPPA?=
 =?us-ascii?Q?o8kJDiUzP2djsmWWmfTcrwtK4FCCfQIcwJkaicd1BKXJ4IMLZhbIpRgJUTrr?=
 =?us-ascii?Q?LLxDu0GAvXCPv8MY4hgUzJ+L159ARTAva+8jSFyM1SQaA3RLfwjdgZ9AsQcU?=
 =?us-ascii?Q?rosVJXL8GNRaxL4Dp7UD9/AGaUoxqjnMBycqp5ro6LH1jMwor3juynVRKDjR?=
 =?us-ascii?Q?qVM/NpsNYSY9+bmNMQGe3JZG5VVUYlHI/ZvdlJ8KYr4EEF3fkEB4r+w7RzVt?=
 =?us-ascii?Q?hwN7zuovfFeSJb68232ucEFGnlYdvc2QRYneA+7uLhYFzYkYNHIlUxZPf3wT?=
 =?us-ascii?Q?Iqzt0Z+o12TLctcdTO8h0Jcm/mRaTg+sg+34T60BZA2IoEMy08xnT5W10A2l?=
 =?us-ascii?Q?CIzPP4h7bnXOaSW99EMEEJE9VCH2mRP9nlNIlsirNUorWnK7r3uLIAWiWQcg?=
 =?us-ascii?Q?8YDCoGOrBaW3dJVJZIYvDh4Eyr7/XWpdHxRTArQ56SSR4Gj6BA6xRrPaZlos?=
 =?us-ascii?Q?+jDuRvHPcfdYXObHSROSUEVe4c/MxlGHc+cTosI3fMNAHPQnjXNQpnXKM6Kc?=
 =?us-ascii?Q?nBBoJUNnttO44EUnguihBeQDP6tm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ITjp0zMKYN+/PynB2AA5JpSvPXhT2y11V1tvYEx53OIqDyqtU2mGVwP/QqJ?=
 =?us-ascii?Q?u7GbX1nMk7RocXxq1mVdQMk/Pd40CACSroYeunnI0CNWYujsf++ytL4nLf58?=
 =?us-ascii?Q?mtzk5tMk+YAPDesKrVyBqciGInLLxkECdlJkY5TEO7nOfTfbcDI+B9YlIFb3?=
 =?us-ascii?Q?aW/aercKyUxd8DJ04FdMNnWfZ1zxCwe+L1v32mDYa5qKyu5v1jhWPBwJz6sN?=
 =?us-ascii?Q?wwGcvU7rTUxCyg17/DM/fbo2jAhkRrMMmgbvq6Dt934ggP8TRB2t+Hs89jRy?=
 =?us-ascii?Q?gY5w69zf22e8zFQPxeCcokB3HfIhudrhSsfThfBOSWHhjNYZLq+EbZL1OMHV?=
 =?us-ascii?Q?jOmWDDdZgWIxpvf6VpR8Zz4ScGFZzmI+C3bGVGkvVr9W4p7fPUeXxaTVO3So?=
 =?us-ascii?Q?HF2bTGCvv36vclrZnyWdnXhM2qX6fOviJKEQxHHcLua6LNVMq99a+3eB2Ya2?=
 =?us-ascii?Q?VkIrJJncrk2UkqNzQ/ThKW0EEJvVk3Ch4Y6kC3hkK73HYEUR0zO7tolh+vrQ?=
 =?us-ascii?Q?fuqkKqYc5NwAzwf5akvQhMOb0FiordwVOrXxWQGgB2PJoLGny7iPqMR35Y3F?=
 =?us-ascii?Q?8gQI5BVcvbW+rPluinMl6IqeODm1E4yq3W1ZA1F6yLwB1Mjsj/khosLRSI77?=
 =?us-ascii?Q?iWrXl5g9UzhRzlyyBxOKtbcyRnBddsStzDWZLMHlCvqFHTLoZKS3GJ6J9mOG?=
 =?us-ascii?Q?+GW361nawyZGV5Dn9ywN2WEMuHlWG5hdt/kthlLjieuo8T0RcIMqxnjDfBIL?=
 =?us-ascii?Q?zms5s+JFOay169zhqIgLfyaaBWGAEvGJmE55v9Zy84Lys50Zbphf68e5gMOR?=
 =?us-ascii?Q?pJxzwYPbYZlcqn09dNANnHz0pGr0XNKMVOS/Mjsktzl39YkqgMbvHKF8CdxR?=
 =?us-ascii?Q?tRN025knXSiv+z/RLsP+KGijq1Rd/Y5ZFmn+RLt82lPFwxmtvECeXeyskBWO?=
 =?us-ascii?Q?8mK7SrY54cDAKTiEdqf8XxxNGB7UHbcMCZ6eIrVcOI0EU2Ybpff7HyuDHqUK?=
 =?us-ascii?Q?LpfP33mAWW3VpjTkXRyyVZ0VpwMrwfi6zlqhQKnSTSw7mXyHVqBuOZDlnZ9e?=
 =?us-ascii?Q?T+hbeYY2P4Ll4DQHzBSRodZRDb5ny746Q1Bme3G2U7u75d2GCm/FHIC85W1+?=
 =?us-ascii?Q?5zRknmJQRTaDqah4BTzkXAxaSAvjo1fDQvWHfjfqzzus5EvXyl80l8b7Um6C?=
 =?us-ascii?Q?XbjVXsdNai48ydEr1uy+sOCpGfaN/7Yx3vGdxK9XRkyKnJ9c409pNUBhskAz?=
 =?us-ascii?Q?3XFHbeD+kDUUds4DxG+Vst70Zomn/DvnCoQ4ILsyJSI6JFmoCVa96WDBH5M4?=
 =?us-ascii?Q?y8fxh0PyOB74SW/XEuQo3aNcJEg+4H97jzFr4PQPJyqirHF/D3g3E27qK2+w?=
 =?us-ascii?Q?Y5426AXQJAADAGQibuWNWsscc7Ft5QUahf8CMKndaWiZbz6l0hxnTUHEF1n6?=
 =?us-ascii?Q?RkXotGwvfj1e5NuEtqdlliZP9GzIEwPUgdrXk7M9MMkXmtXr48/loogPKIAn?=
 =?us-ascii?Q?9Exno0+VSAabRAcfPNQj/VYcmqeZlQWK44ozJOmBASFgosKco0fPw6n1JNKm?=
 =?us-ascii?Q?yYhcOxsBG4e3fzLB47GkvHCcypLOiie8alGHcfpfMBwpqvaViQr8v6rNwe+t?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2c675c-ad63-46fc-babc-08dd357404a3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:50:56.8796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP8Dkvz4MKqNzx/tM++GfOc38rXsTPKMzHZWK9+W8woxgMvv4J4vweCWB74y3Qyn70tqgrXEVwmUJce3Idnazw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

