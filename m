Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A38C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 22:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7F81123DB;
	Tue, 23 Apr 2024 22:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjwPMmMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915C10EC75
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 22:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910717; x=1745446717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YAuHXwPR/MtFAWTi83BpVpICzsWX6XKZdYH5Ff2Kc34=;
 b=CjwPMmMU2u+obH36NzjerVHda0MzFlAZkIT3171F7B+IhNlmOAoLoBR+
 u80hr/GDsGEKTO2BDFORxe6bWw0C2Z8zwHKJT7CziOOe6n4EI8bWs/OOz
 VRfHnrqhvGxTUQ4vJpIaa+ODX4RLy27QZ37sSxOMOrDhC9303CTGhL8+J
 fczh2w2biKTBA8vD3moM0EEuBJwTMLFIfrybX6oNYUGmLe0wjkpIjW8yB
 X/vZCJ9/kCtaUJlGHOlExjwjwLWdgegTVr+pVoVGcsDk1rCffgg7Kvn4/
 u3QYV8pcHtzdWc962dQD88Fa1eFMYWEW2cF4tLOtX9HZjBpcwlbsryKIO Q==;
X-CSE-ConnectionGUID: GSOtc7eJRxmkpbyKqL4kBg==
X-CSE-MsgGUID: XCzM0F5ORc+KfS8rf+w3/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="10059512"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="10059512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:18:37 -0700
X-CSE-ConnectionGUID: OTt4bT/4R+OU+ZTmdw5+Xg==
X-CSE-MsgGUID: pHBMSrBiSrmpdKfW7CWV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="25020671"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:18:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:18:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGKoLYELW1Te59OoN2jEaUxmiHnGK68COnnEuE3+J6baYCqW1GEbFQPPa4mamPZNe72R0Y/dR11Py0TeHrzQ49oH7LNXQM1SgtUhhWxiMWHWi//pCr0VY+l8D7xe8K0ZQBifZPBC473Ul0UIcZSHQAZUtGkjNsPWL8icI2IhhRnKKwFxnhdwFMQ4AwXcaBHqZI+35FdrxC79sCX1YjHX5Von0Kpc51SKVVhWat6Xk6+5w76KsWjLokk1KFQfBjYaWgpwSaaPJPIKu0xUOITaPgcyzSpH1CptSYKlV9KVcSRoC5ojKYnM+RnU0S4VLOcmSI5AswTGr6aMJ5X+bTR38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WgHhqosDXSs8pyb0qvpCtGVJWim68PIClhBodOU+EM=;
 b=n+cyjSQ4T8rBTfJscmjfDMOcYqlF9s/Q5GZilfWZtKLWM3/cUFxreO7vE0LM4kCT4PqAk+yO+LCoMLn74bUFrhImGjDDIysb5Sp2A3EVxmT3s+/YsvHGn2cCUo5wF0pplwJ4RYZNwyprYQuvjYkPcCdRhES7qA3Wt4+3h2FH+iDTI8zqygM1BCX+EMyeH6OOIW1h9x2O9gyCJSp69ifJ0KzcW78MQQjHet+7QId1Lpt5KF4stN93YrtXwlf5oTV/g54bWL5VyTgUoD2MpBzQyiFO9d52eZB+E48nQVT+ddbAjCGPqEOcIWM0RM9Sjux8MNwxI9/IowCpNpeUycSPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 22:18:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 22:18:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 4/4] drm/xe: Introduce the wedged_mode debugfs
Date: Tue, 23 Apr 2024 18:18:17 -0400
Message-ID: <20240423221817.1285081-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 3774ef23-9fe1-4983-e948-08dc63e34eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p1/3Qd8EAnAFsyeB27/othEUCRBfcg2MvHRjIoHHUNqutt7jmuUVlVYvQfVw?=
 =?us-ascii?Q?W38CAQxmNeSgDeYBAb4+j0tIG4WyIDNO94ekLAM+uDKUq4kvccofLniUFwih?=
 =?us-ascii?Q?rtR0lYfQ3eofkBUuLtzzLci9QW6EdHTmiI6UD5I+lRcOt6W/mEIspopt1q8x?=
 =?us-ascii?Q?hzcECnn5fzAAQKrvS4pyBL2yBIydRXUDxqHMEEdthDi99PsHLUc4V6SkY64T?=
 =?us-ascii?Q?q5/UzWFE0oCE7pgqBeAQlq9Y5eiFU25zNVWZtyJ3mgnRerxsVlwiQwBNji03?=
 =?us-ascii?Q?xAMtL+tFFC1jHhFjVMrRsHm7hhZBDwqSPFiH/NeeTDWjbLJev3E/goOHPC2B?=
 =?us-ascii?Q?8VCKoOCFPpvoJ2wyIwOpqLtfKbjLt254d7CfK3RyqvfTJ7EPIpJe4+le/FEV?=
 =?us-ascii?Q?59BUU1C0m0yad5epjdicB82dgRUHznB5pqx7gtRydEdq98X/2Aq0KfXxRx8D?=
 =?us-ascii?Q?akwEXCQ6MsyaXlA9yEu2shD/pTxhhVMr+6CCrkGLIUJSPEODDuCS99Zo4AtJ?=
 =?us-ascii?Q?CgFwvhiTvT5yhBA7Rr+pZpeXdZ473HIWGWLuUV0e693NJZOqK21/5fQXmpk9?=
 =?us-ascii?Q?1gwI/YaQax2SBF/2wUS49HW1JfBXODKJI1AQnyM39Tj3D4kEzgOnX4XurdaW?=
 =?us-ascii?Q?JlRNg2GKABIowblSMDSdzu+9jKrP9BJHc9q+zuu1QRQsOW5YOfuMeAbSBKta?=
 =?us-ascii?Q?emlLkCxMNjcOzwazV+eGN4B1VRhj1iG3zOAAjR616OscDmcAvX4plv3z3WWz?=
 =?us-ascii?Q?ym11idb52mrnb+bp5qrYwHgBgNeI3RBF4Qlk5h23kGGE1K63mNbYUMDb4oWp?=
 =?us-ascii?Q?M3a1wJ3X1lKm7+v4Ns21440lsd6GPYsdUZkiQRg0Bk0aPDfOC1lbkzGwGJLC?=
 =?us-ascii?Q?h+eOJ/mDIUtWFhjNoijR2eCMM/6gxQcpLH2cbDtxkgjPSdCN2euSHlZF//tm?=
 =?us-ascii?Q?g+4e5snf1eiMpnHAtENVvnWW+BpQH2W7Qx74URqeL0aBtoFyuzVy7hdKiKlN?=
 =?us-ascii?Q?gT4W6o0XB0Dm9bU/jq+6DmnNckRGo8DW9YlkXpKdxt9RTDc6JvAdDZfpm6Hn?=
 =?us-ascii?Q?m5PQay9iYRV1JasuKGlpa+/xN+p/HaU0cUCZT8fmhkGGYXoJEWCsPhGA9QSA?=
 =?us-ascii?Q?M9Uh6qswVOTTzNdDTOmmKdzzR111VTD2C+sBzfIaxExADNxT2OEXgyvow+mT?=
 =?us-ascii?Q?WNeIFLfSQWg77Gl4JCVu+hWx7CROvlJelGYzXmg0GADlr6iHz9U6+E4uXBCt?=
 =?us-ascii?Q?1a7xgOGkuXl3/vWI2G+WIpLpyvIKViGF0xjToFlEcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GNAxW5OAT5a6fXUREsTIncTo8swNW1YFzGhMaNukr2YLMvgtJjw/olDRA4J+?=
 =?us-ascii?Q?b/iq6GFrEu/x/an0lkIBkj/RCFdiVm39EVNss3lDf9iG4gE5zdg70fboXr8l?=
 =?us-ascii?Q?3pTL+jEhapAUX8AEH+4X8Qc6JpCpT6cj/XJbfUN7qzKJEGNzhCkSIrd9Gq0H?=
 =?us-ascii?Q?BvgjMBkKlLOOsSozHKJEFhxVV4neiWwFMz+ylJ2+JY3qQdLaGoon3FscBWhk?=
 =?us-ascii?Q?8iTAeytJGDC0yrlCPImNE02G55niqMyk5u4XdJLX3KsM9VNBPpjuLs/mnIyd?=
 =?us-ascii?Q?6WjASQZwge008GO+8eMPT7iHR/sFYgPVnDz3NQgZQ4iRYBefGUhgOASk5eG7?=
 =?us-ascii?Q?ipXzUJuM/Kr04V7PIhGqYA140XmYrLd66dvHBu5DKiQDeFaEsyrzVlMuo9a9?=
 =?us-ascii?Q?/J0xLgST8+mJ0mXGYmcr/E83odR3zZ3kV0Xuu5k1ky6U7boEIjfUsPzy7+MW?=
 =?us-ascii?Q?slUcUWAR637rw9vBSpIFp1HQycEcTFmY+9YCQE95m0zVx+EvLFtNN7IkO8ig?=
 =?us-ascii?Q?Tee7o8LCKeJwOuZuSvZvZBihQ/pwGtkob4FDAWl2+CbJm11S2ynRMnHImURA?=
 =?us-ascii?Q?0KU+nAwVQjc4fB3fxkfklbWoE/q7zM/V48vhq0BhQD1IOlgLyXlBDGaHPeyY?=
 =?us-ascii?Q?Psy6k4zf+nRPLbV+ZWTQFDpeqZmH8Q23QHsmuJvngQeBH64FQCi4VxoLxQdE?=
 =?us-ascii?Q?FMNxB92FXUlinltbH2a66vUGjzNP2ZSeDcDck0KfkoJh/rasfZp4xFHy6AB9?=
 =?us-ascii?Q?0s6YH35utZ94C9eBs/befvk6jF/xEnxIrUNduwWueYTmJTSpbYMjkKnC9cfq?=
 =?us-ascii?Q?WKpMfhE4tsmbj9lCO//g/m4U7GPp2+XQsbcz5GSGvQl9Y1IUUajM/Z8juu7l?=
 =?us-ascii?Q?5DZqddxuKEWHrxVLQs5sf9yNAUtXG+eEc1aK582ORnmJMYJFZoLGL0WZs33K?=
 =?us-ascii?Q?On4nU5Vu3UybPy8n8+5qMVEPU0c2IbWTxcJP+jlIIThBH0rWTAM8ndSPoGqM?=
 =?us-ascii?Q?XxRW8lA1qCXed+vFqPDXQk9NdVoKGyna07srHr0ubtfFt+ZmQMkkHBH9e4sy?=
 =?us-ascii?Q?b3895rOzRXbeKDXkV49KL5dVebxiv2NrskpXbivxv6yy12gv+8ojKxnmABIK?=
 =?us-ascii?Q?6eqSInIy2Iv67so2VbM4QV5I7NN0fzOpi+X4LAZEQ+0r4CpnW1kpiD/Hv/fM?=
 =?us-ascii?Q?z0XtNqg4wRSFZhc5MMYhd00wW6yVP7xXson/s/LgY6zN7jk0hbcSJfD3oLjW?=
 =?us-ascii?Q?IkndhFEjcuJqOqSNPYjRdrhkkBOqUVyllWpcp/7BX0zVTUrr84ze1Bca8TM9?=
 =?us-ascii?Q?IDWiAztSDTibw0VC+tOSGiYGVsnWVtDbR83DTVNy3A7+b48Zzy2DH7zvPvef?=
 =?us-ascii?Q?n+gHaRfOlAplKXjBrJgd+qN23V6UWsVxCTPdE43mrXop//b2BTes9xtbrB8s?=
 =?us-ascii?Q?K3CQuOVQB9jOWIqQ37ttF7vuMNHjiHfG3En8g7fhz+BXzssnRz3cCu5jKpHy?=
 =?us-ascii?Q?mGfyJ6uf9O02+kQeQU9yalU/8m1sQ33jPDYztctYwKiAvqt2R8bZxYlDXg2P?=
 =?us-ascii?Q?qIl189Txvugg0SpwrsO3TAH0Ds0un2HKaGHs1y3z9KpQcWz6TpU3wb8Jf2s8?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3774ef23-9fe1-4983-e948-08dc63e34eae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:18:31.1140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/DsTSr0ESBpIwPAvzx1Qyh6BDAjpeJwaQlYNod2Cwzmib6IThMucgorQV+bElZgHG21pynCrlCwUZVNzVwP5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

So, the wedged mode can be selected per device at runtime,
before the tests or before reproducing the issue.

v2: - s/busted/wedged
    - some locking consistency

v3: - remove mutex
    - toggle guc reset policy on any mode change

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       | 10 +++--
 drivers/gpu/drm/xe/xe_device.h       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 60 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.h      |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c   | 35 +++++++++-------
 7 files changed, 149 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c9b30dbdc14d..0e61fa462c7b 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,8 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
+#include "xe_gt_printk.h"
+#include "xe_guc_ads.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
@@ -117,6 +119,56 @@ static const struct file_operations forcewake_all_fops = {
 	.release = forcewake_release,
 };
 
+static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
+				size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
+			       size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_gt *gt;
+	u32 wedged_mode;
+	ssize_t ret;
+	u8 id;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
+	if (ret)
+		return ret;
+
+	if (wedged_mode > 2)
+		return -EINVAL;
+
+	if (xe->wedged.mode == wedged_mode)
+		return 0;
+
+	xe->wedged.mode = wedged_mode;
+
+	for_each_gt(gt, xe, id) {
+		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
+		if (ret) {
+			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
+			return -EIO;
+		}
+	}
+
+	return size;
+}
+
+static const struct file_operations wedged_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = wedged_mode_show,
+	.write = wedged_mode_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -134,6 +186,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
 
+	debugfs_create_file("wedged_mode", 0400, root, xe,
+			    &wedged_mode_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d45db6ff1fa3..a5b4a9643a78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -506,6 +506,8 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe->wedged.mode = xe_modparam.wedged_mode;
+
 	return 0;
 }
 
@@ -769,7 +771,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a module
+ * This is a final state that can only be cleared with a mudule
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
@@ -781,10 +783,12 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_declare_wedged(struct xe_device *xe)
 {
-	if (xe_modparam.wedged_mode == 0)
+	if (xe->wedged.mode == 0) {
+		drm_dbg(&xe->drm, "Wedged mode is forcebly disabled\n");
 		return;
+	}
 
-	if (!atomic_xchg(&xe->wedged, 1)) {
+	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
 			"CRITICAL: Xe has declared device %s as wedged.\n"
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 9ede45fc062a..82317580f4bf 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -169,7 +169,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-	return atomic_read(&xe->wedged);
+	return atomic_read(&xe->wedged.flag);
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9b0f3ddc6d50..0f68c55ea405 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -459,8 +459,13 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
-	/** @wedged: Xe device faced a critical error and is now blocked. */
-	atomic_t wedged;
+	/** @wedged: Struct to control Wedged States and mode */
+	struct {
+		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
+		atomic_t flag;
+		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
+		int mode;
+	} wedged;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index db817a46f157..6a5eb21748b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -9,6 +9,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "abi/guc_actions_abi.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
@@ -16,11 +17,11 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
 #include "xe_platform_types.h"
 #include "xe_wa.h"
 
@@ -441,6 +442,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	u32 global_flags = 0;
 
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -448,7 +450,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe_modparam.wedged_mode == 2)
+	if (xe->wedged.mode == 2)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -806,3 +808,57 @@ void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
 {
 	guc_populate_golden_lrc(ads);
 }
+
+static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
+{
+	struct  xe_guc_ct *ct = &ads_to_guc(ads)->ct;
+	u32 action[] = {
+		XE_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE,
+		policy_offset
+	};
+
+	return xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+/**
+ * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
+ * @ads: Additional data structures object
+ *
+ * This function update the GuC's engine reset policy based on wedged.mode.
+ *
+ * Return: 0 on success, and negative error code otherwise.
+ */
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
+{
+	struct xe_device *xe = ads_to_xe(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct guc_policies *policies;
+	struct xe_bo *bo;
+	int ret = 0;
+
+	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
+	if (!policies)
+		return -ENOMEM;
+
+	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
+	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
+	policies->is_valid = 1;
+	if (xe->wedged.mode == 2)
+		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+	else
+		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	bo = xe_managed_bo_create_from_data(xe, tile, policies, sizeof(struct guc_policies),
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					    XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto out;
+	}
+
+	ret = guc_ads_action_update_policies(ads, xe_bo_ggtt_addr(bo));
+out:
+	kfree(policies);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
index 138ef6267671..2e2531779122 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads.h
@@ -13,5 +13,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
 void xe_guc_ads_populate(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
+int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0bea17536659..93e1ee183e4a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,7 +35,6 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
-#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -868,26 +867,38 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
-static void guc_submit_wedged(struct xe_guc *guc)
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
 
-	xe_device_declare_wedged(guc_to_xe(guc));
+	if (xe->wedged.mode != 2)
+		return false;
+
+	if (xe_device_wedged(xe))
+		return true;
+
+	xe_device_declare_wedged(xe);
+
 	xe_guc_submit_reset_prepare(guc);
 	xe_guc_ct_stop(&guc->ct);
 
 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
 				       guc_submit_wedged_fini, guc);
-	if (err)
-		return;
+	if (err) {
+		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
+		return true; /* Device is wedged anyway */
+	}
 
 	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&guc->submission_state.lock);
+
+	return true;
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -898,15 +909,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &ge->sched;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
-	if (!wedged && xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
@@ -957,7 +965,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
-	bool wedged = xe_device_wedged(xe);
+	bool wedged;
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -981,10 +989,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!wedged && xe_modparam.wedged_mode == 2) {
-		guc_submit_wedged(exec_queue_to_guc(q));
-		wedged = true;
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
-- 
2.44.0

