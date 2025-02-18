Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA551C021A9
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 01:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEF110E2D1;
	Tue, 18 Feb 2025 01:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gM+qoiu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0F210E2D1
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739840624; x=1771376624;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=CFzvNIK6dIkMcqR6OtY+k2u4yBEteGFDaRQPw2e0FuE=;
 b=gM+qoiu++3LZU0Vaj439/LjwTd18TfBH1B8oA0CTl00kAYPPKV7zMapr
 tf2JhzWIQKMgEnlPhyRntCSVv+FBHgw85Bzwn3Ch5UXhl1r7Ll1Vu4WXp
 l7fWPiokREDQPAjB9Z9byE1reSmQ0U4DoGE0f3nnRsObvhvi+OASjYQq0
 kde+EyUUmwemhYRiSS6EpkeYUiygdtNhq+bcwcpDrB0e8m++YxLp0O3h/
 AdLXLWGx3xG6x+o3NbZdfGV3UYa3/wV788XwV7v4EsdbF7HFjQKJlQQ1d
 wdjQQusa8Nyc+O6Fq5zD32EfR7kakjDSl6OH+GSDCtP1eXPpT3UXF4IaR Q==;
X-CSE-ConnectionGUID: WtQLuZZ7Rsm5+8bFBeJbrg==
X-CSE-MsgGUID: u/Ai1PSBT0mV/GlzSZd+0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40647282"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; d="scan'208";a="40647282"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 17:03:44 -0800
X-CSE-ConnectionGUID: d3YPUF/rRGqIwvOFqYyZVQ==
X-CSE-MsgGUID: 2lMdoUVdSJWNaOOxVfBqxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; d="scan'208";a="119240894"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 17:03:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Feb 2025 17:03:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 17:03:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 17:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHsERAPZVJ/u9WgFG+A8GTNzgclzkMtyBjLp32uIoOzWGjzTLMfLPib9+YKhYN1ogY39VJpVnzR8m80Ve9VtTxQpx0zil029+f2IVkclM85kTIi0Wk2UHs7u5qiETZ4VyTB34DM+KDvdABGAlhEdxRMHgX6vBad5+VwCeFAt7FbgQ8mRkhKZHyuGmVzRu/iwnml3mmm6A7OtyRJZGR6LHxX/urjl1f0jR4J0CkgFDMHedfXd0Wuac6A/wg7bVqzvP2u8Ei8Qr9gfc7jImO6SAp8KBGe3xnACfVCjAhsq7cD9gU64HdbYEzCFu6ooQdoZiMvMusKFfvk6ai18JtpVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjjAVJZy6XaJB8CoxyOrVOKuh/wDJAq1vFGnjzTvYpE=;
 b=V8IczJ0SCd98r+p31Ege2avAh+rE+8b+sBvGwakC03hnG2g9LEHptByBt6ViAHabL9sTm17wEbWoq4v2pzBVD3DEL49FO7UF6vrFXwnDzzacheasCa+EZnWnGF95GEanOip1VqDnYiNRvPKfE+3My5Bs5XehVwHGTwpPLZ4yd4qJTKg423m/47YG3f7AUMefBrT7nPrIGE9JkuQShGvt3BDqNORBfxSu1bV+8mZ5p7uLPaODu+UkcUEs1ahwcHR8iZcYxh47wzTeGukP6VfibqPG/q4oZNJX9ThENge5jwqpIxL/k9BVOdV7gXgbGfhcI9OLykD/SyqHFIF9Qk43qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 01:03:35 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8422.015; Tue, 18 Feb 2025
 01:03:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe/display: Spin-off xe_display runtime/d3cold sequences
Date: Mon, 17 Feb 2025 20:03:30 -0500
Message-ID: <20250218010330.761340-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::31) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: e886a264-c0be-41ee-50de-08dd4fb811f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJkr9FeLelhVaGoZoI9YYAdO7YMA/mt7l2at+l8aoT/0xA2un7MuyLLcprTi?=
 =?us-ascii?Q?HuACxO4sfkky7xEn0UD3hdDfEKkRvirE0NXNT4HfA77y0QhEnVSx/IvUTEKW?=
 =?us-ascii?Q?ecTn0Wt1ZlZDL2Qq01MuGrEvj0wcgsMz6JkO3O/Uiw4JFlekj+R5n8JZ//pm?=
 =?us-ascii?Q?ra9XADE/Eed8snotCBC9VD4QHSjil7CYhutAPGAzehA8Ew3WlhJJCyx8fmvn?=
 =?us-ascii?Q?t92YOlP5P2y4nDaQyel+n+dbI91nQOXCwyr8iFsq0PM8Ssy7inYcdRGv4VDG?=
 =?us-ascii?Q?iz7DpCxNS6Ta5ga53NUMaJopo90hf1Ap5/rlxf1fBiY52xr3fg6BiktOkjHI?=
 =?us-ascii?Q?DNPbU4l3Gy2kUsIDMzqcCRthdtWZQg7lq7EzBqd3IwfFsYi+0lEj1NHwdLC7?=
 =?us-ascii?Q?xKl0iFXR5twpionGtKfYjMEZLMCHbUPOpKM9pglstt7+NU3TORg6d2bvAluH?=
 =?us-ascii?Q?nClojkSmHvBfP2soHa5uz7FIhVkzjOX0+p3Zk1SjHZgW1xwzlMS1FSHhk+tb?=
 =?us-ascii?Q?KILGbg/Z4pHfc/opTYpiWRk1k3WeIaZ7BMsUEF7q72BPaXcckeJgGIakt36B?=
 =?us-ascii?Q?+2xPB9Qu8EqQgNsLbN5lqIl1w4n48EORMXMa5h12bELNOsocEVbxiSTKdcTU?=
 =?us-ascii?Q?SaFhKfJAN/NpBWKFlO+oPdQ8tLgXJTQisXGAopYcuS4M0RA/4F8SypevaA6a?=
 =?us-ascii?Q?+iCvQVYy3cbpu450hvDmmrJtAWu2vc6iMpwZxi+QHZOOgLdsFjM5eJWPQSQo?=
 =?us-ascii?Q?lhz+qZWCFQOlM38hoe/AG1IiJ+g4EfegfQGYzsdUZklH2zfrEtn9uzD45M+s?=
 =?us-ascii?Q?pwCMY4TkHQv8LbEKh+GGMhXGiah6RfBymqW/WO28SI9stfak6VbMR9F7qHJG?=
 =?us-ascii?Q?/WlFBsVoAXAViRuGS+skPxZ3O9MRrbW7T3hiO3HmxdBHhLsvWTFs3BT4HaQ1?=
 =?us-ascii?Q?0fJ/SxMjoLRUaja9FaX/7kVZ6eXAQsPURT24S+xKSKDY/fUOa/16uuPGRxXS?=
 =?us-ascii?Q?nj3Hhe5YrAwgGvyDzq+DmbAuS5wVnvvmFSzJtDMa0NzugSCm11XP5YKkOWos?=
 =?us-ascii?Q?jEEmRWNVzq31nVU0eg0a8AYPFh928DEpE2DDGXeZ2wngQRJQ0Nas8vWHXc1b?=
 =?us-ascii?Q?UBSxSUflKm5KZRZQ13Q/wIqin3CahxT0bbx/9Z/tD2Q2GMLWxBgwqFfj813n?=
 =?us-ascii?Q?t02Qr2D6WBh5GWWova43vd3k3BPTYDtKmEBqmKc5FMz/tHaJ5AX+Kgkow0NU?=
 =?us-ascii?Q?zO1i3c/TCkhxoDu6PsXpGjYZ4Wrd3cZgjd4LBy2hAAFtDA0fAJFVDCljAvPT?=
 =?us-ascii?Q?0oNiFukB6j5e2HxBIizjsmteOZkH76eojBrg2duYlJdL3yzknF9YVRYIus5f?=
 =?us-ascii?Q?HqUyZrWKy/yMj4rFUa+b634F44Pj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSfEiH2eKYLRSLm8ZMakY5wvcCk7WzDWDhVHY584iyMv6jRoFl5ElQ1avr4Y?=
 =?us-ascii?Q?X9Iuo2Y2k1ivBy1Pwu83dLwIul1b4qXdBQmigphN5eUPbsYWe6xsb0genpj/?=
 =?us-ascii?Q?4jTmxiaf9nB926mIgnp60GJ6xkWp+zQ4VVSN2MesA0YZJgxwuEUZY1Hfgvuk?=
 =?us-ascii?Q?HQf1m3skOyH8svhO9exknb4atHpNhmdgGSVe/MOe1QoIjQL3DU0rLoR9kMwB?=
 =?us-ascii?Q?/Xvon6Vo56d7D+JlohSWznT4s2L/4HDdrM6GUSSoIIPlLbtjtwD/EA7tlbja?=
 =?us-ascii?Q?fCPSingkWlpBQV1ZcD2ed5SnhigNaQMenUelsoW/Dwm1t4F6Nh5FezWCTmIN?=
 =?us-ascii?Q?EEILdwbHVwII+Zi/5BnbxQuZMNgI0C0tcG1OwexdHsGwGg3pGD8ZPNVwcaNZ?=
 =?us-ascii?Q?liXkXWSwvck8b7Ka7CdhoAyjIkh7B8mF3afNK+LDVxz6ywVXbsxKa7/jgPPa?=
 =?us-ascii?Q?PmhiSU7maam2wnx5myA5MkL4tPsmsBvOVy8S1BH0/RlyQRQC154x8hMbYay/?=
 =?us-ascii?Q?N4dlsEzz/H2kE3jneQXfWn0tESJEfl/4y2aozQoy9p8lUVmgEyaiScb+kIse?=
 =?us-ascii?Q?4TVrkLKhAfWZ4kygUh16u7gCmd2KBa2qLI/1RTp31rwKBMpQdIvqEVGS+tEK?=
 =?us-ascii?Q?S4p3cdRAIrZbOM0c01ZKQRSPwjhbihd2tbNI0+/G+d2W1vOs26ZieuqbSq/G?=
 =?us-ascii?Q?g82Ub7c3mRGertUXSWv/7vKRF4Rz4mEUX5PLJMQCCO6d3GRCPTK4MOLdC9GU?=
 =?us-ascii?Q?od47u+1xv6nHG7GnWG/TRtCyVu+gB6p5DFizyR2sx5iAhy6StcTXX4UByKrL?=
 =?us-ascii?Q?eiISgpQHD6wHmjuZFwCRdQDz0hZRJl0ltCBasDQbtxCSIZqxc71uxfrkp9GN?=
 =?us-ascii?Q?JyTGIB5Fzqr49iTprPnT0WEXBzTiIwDo6O5Wpz8Yme8mpkumF+T1s1yDTowO?=
 =?us-ascii?Q?pRg3c19d6RpCe4A5FctSNqZ91NF2JGO0meHW/4DWC315aWzHpnlJzTMWRaWj?=
 =?us-ascii?Q?yF2NYSSdazmo1K6O1u+mW7H0w+HQuJsKielSTk+jNtHrcyJ82okQM/J8CZMM?=
 =?us-ascii?Q?pBVjoNpCyrdcwvII8BKRQhkpQ5oM+21IdcEEBTUjC/UM1eak/Z3StyL7uMvQ?=
 =?us-ascii?Q?9MCNVQzvBK/cTQOslvEVKmHLOP5lOesMjRM5rBhHFf2aZ9+ksWpumPsuIJ9k?=
 =?us-ascii?Q?FJXaKnC9DE8PB/wTBdOs1VCfO92p96+yEHCuIs+pF9dDqAre/45iKj1uYLQF?=
 =?us-ascii?Q?YA9rNeDiKtWPYcoSV6c21L4ABpZ33oaQZk9CHRtlKvCgNGwaeSxlMPOiVvZE?=
 =?us-ascii?Q?yv87t8gtJnlKaI51yZ10DG0z8X2wwvSJS6NQ6MDs1cQPywiNB9xf5Zc8fqCn?=
 =?us-ascii?Q?4MoT2LVrdSj8MRcIv0Ou8yGPHo5I8KAHOnYjBWxa1n5OXIu2HHH/D/xAV3gd?=
 =?us-ascii?Q?jQaLPZXNm6lQ1on4Vv8VWMsp8tvFLXhHDAjZDWF+DF3x7Qpah3TyBhfoNt+K?=
 =?us-ascii?Q?/IJwI9eLBdQWy8aifcbXsp1hRxaFg84v50Dy6OZxCsyNQNG2sJPOdHKSIoqz?=
 =?us-ascii?Q?Ej/pmyHnaitar0XoE1TQG03PCKDX6pzxMCuo3euLarCJJydi3BnbGlEsQ0CC?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e886a264-c0be-41ee-50de-08dd4fb811f0
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 01:03:35.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUdLzykLgJwyz0BBmelP7nEnA8bHO3tIRF6KDuEWiIySDh/oE41mfNDj3dHEVjTkoyqSbiU4bBH9s5kt762DTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

No functional change. This patch only splits the xe_display_pm
suspend/resume functions in the regular suspend/resume from the
runtime/d3cold ones.

v2: - Rename d3cold functions (Jonathan)
    - Rebase

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 87 +++++++++++++++++--------
 1 file changed, 59 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index ebe0e8c3d722..d524fc41df31 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -286,11 +286,58 @@ static void xe_display_flush_cleanup_work(struct xe_device *xe)
 	}
 }
 
-/* TODO: System and runtime suspend/resume sequences will be sanitized as a follow-up. */
-static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
+static void xe_display_enable_d3cold(struct xe_device *xe)
+{
+	struct intel_display *display = &xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	/*
+	 * We do a lot of poking in a lot of registers, make sure they work
+	 * properly.
+	 */
+	intel_power_domains_disable(display);
+
+	xe_display_flush_cleanup_work(xe);
+
+	intel_opregion_suspend(display, PCI_D3cold);
+
+	intel_dmc_suspend(display);
+
+	if (has_display(xe))
+		intel_hpd_poll_enable(xe);
+}
+
+static void xe_display_disable_d3cold(struct xe_device *xe)
+{
+	struct intel_display *display = &xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_dmc_resume(display);
+
+	if (has_display(xe))
+		drm_mode_config_reset(&xe->drm);
+
+	intel_display_driver_init_hw(display);
+
+	intel_hpd_init(xe);
+
+	if (has_display(xe))
+		intel_hpd_poll_disable(xe);
+
+	intel_opregion_resume(display);
+
+	intel_power_domains_enable(display);
+}
+
+void xe_display_pm_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = &xe->display;
 	bool s2idle = suspend_to_idle();
+
 	if (!xe->info.probe_display)
 		return;
 
@@ -299,10 +346,9 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(display);
-	if (!runtime)
-		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
 
-	if (!runtime && has_display(xe)) {
+	if (has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
 		intel_display_driver_disable_user_access(display);
 		intel_display_driver_suspend(display);
@@ -310,10 +356,9 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 
 	xe_display_flush_cleanup_work(xe);
 
-	if (!runtime)
-		intel_hpd_cancel_work(xe);
+	intel_hpd_cancel_work(xe);
 
-	if (!runtime && has_display(xe)) {
+	if (has_display(xe)) {
 		intel_display_driver_suspend_access(display);
 		intel_encoder_suspend_all(&xe->display);
 	}
@@ -321,14 +366,6 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 
 	intel_dmc_suspend(display);
-
-	if (runtime && has_display(xe))
-		intel_hpd_poll_enable(xe);
-}
-
-void xe_display_pm_suspend(struct xe_device *xe)
-{
-	__xe_display_pm_suspend(xe, false);
 }
 
 void xe_display_pm_shutdown(struct xe_device *xe)
@@ -367,7 +404,7 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 		return;
 
 	if (xe->d3cold.allowed) {
-		__xe_display_pm_suspend(xe, true);
+		xe_display_enable_d3cold(xe);
 		return;
 	}
 
@@ -428,7 +465,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	intel_display_power_resume_early(display);
 }
 
-static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
+void xe_display_pm_resume(struct xe_device *xe)
 {
 	struct intel_display *display = &xe->display;
 
@@ -442,12 +479,12 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	intel_display_driver_init_hw(display);
 
-	if (!runtime && has_display(xe))
+	if (has_display(xe))
 		intel_display_driver_resume_access(display);
 
 	intel_hpd_init(xe);
 
-	if (!runtime && has_display(xe)) {
+	if (has_display(xe)) {
 		intel_display_driver_resume(display);
 		drm_kms_helper_poll_enable(&xe->drm);
 		intel_display_driver_enable_user_access(display);
@@ -458,24 +495,18 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	intel_opregion_resume(display);
 
-	if (!runtime)
-		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
 
 	intel_power_domains_enable(display);
 }
 
-void xe_display_pm_resume(struct xe_device *xe)
-{
-	__xe_display_pm_resume(xe, false);
-}
-
 void xe_display_pm_runtime_resume(struct xe_device *xe)
 {
 	if (!xe->info.probe_display)
 		return;
 
 	if (xe->d3cold.allowed) {
-		__xe_display_pm_resume(xe, true);
+		xe_display_disable_d3cold(xe);
 		return;
 	}
 
-- 
2.48.1

