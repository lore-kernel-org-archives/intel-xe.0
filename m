Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA40606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f4IbeRdR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632DB112231;
	Thu, 29 Oct 2026 11:30:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4144C1121FF;
 Thu, 29 Oct 2026 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273450; x=1824809450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PvBwu7cj0mWsXiKBoLaJ2Vkrbi4v+GUsfed2Kj6JUmY=;
 b=f4IbeRdR2W87DHXu3tiyW2AHLm5+jiDcY1DihEQVUHF1gVyLXgi5E/LG
 /07tiBkDC9vuuNruJqclQaapXDj66BvDZNjexlKVKUHAN/7mKgR/eE2Wv
 nwPQ3bYKQKvLRp1gwLXylz85XlXByM+Bz5NapNuuyzA292B/Y13MZ1jr/
 MLyxEDi0FhbJPhmmZKrIDcYBtuRzuHu4qXsVFKmzNIoxga98Ygy6LiRKf
 2Uu9MkzWb2gqBBJrX7nj/zQX2wJL9ku5qy3AAyvgH3BU5X7LeKw0ajxnI
 y+BSr1Ci1YTfVOyxWLDtl9GpwGXa9iNsN+uEeYE79f8TfoNSBrkgbhyu9 A==;
X-CSE-ConnectionGUID: WUXM0WQoTvWM1WNlnxtQdQ==
X-CSE-MsgGUID: fGcvKZJIQGa614zeCBjHfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2018070"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2018070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:48 -0700
X-CSE-ConnectionGUID: QIZyXw6yRY+q5mPQrJby/A==
X-CSE-MsgGUID: +d7PMbylRiyxxruh0RSv6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5130215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:30:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:30:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1XI4V9VIYPR2quJ89kteE9HTJ4p/bul5iNXC8RtwUoZDv4DRvnuFOfQaHfAup/ogssR8/kFSAsIxTtB/JuMw+qTg1IM4Hi1b6crykcpHvO5hW3+VMQnOrSzdJhOgwIvc7P8yU8zfDFv9j0P8KWeQpY9EyW8uD9Gdg3NPVuOximXf2Z5fmpfH/gH23uJXHSl2NV6Wm5jXoLKHKVhnxx45vwzso0tDH73alO7Y5s8S0wzMnD8GnXPRtwdJDfpAe+cI3m5Yd3MSw8zK2Rmkoee+E/cVwIb/3qOMtAxjsTpkdXCtZWK6mdUCdgtxhLUXnQWlwRztM283yE67caFFu/WUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo8/48KFAJyBDXn69Dz4TV5in41me6G4MQwT2bx9qTU=;
 b=siKnLb9wpNH3drn/SqewUKHwuMoU7gphiocPD98P3mc0WbIP6YotIGjsJZciC1IPIjAj+sIV4pdxOAd+oO26zH6BtbAqOF5FdglevfzXJnM59EZjFyeGhhKn/Ur9Vn24k6j5lz1mREBGPAWcoTvlThhrqkcuLcfspAeX9zVgX0oDKXbxccN7J+JInsGHcwwmgvQvHDf8DFE9dFYgcMKNJR+XXY5SP+iYrUMaP0t4xGYKytXseYxPHLkvvUIpI0qfOwt+N1/KQpReAaEttJMpFuwmtObAch70wqrBZgpTTvtXlGh0FWSF3Nn+OpsozaebbUZH+4NmmIsKcTiuDk04Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by DSWPR11MB9823.namprd11.prod.outlook.com (2603:10b6:8:4e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:30:30 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 11:30:30 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <stable@vger.kernel.org>
Subject: [PATCH 4/6] drm/i915/ptl+: Add TypeC HPD pin selection for port B
Date: Thu, 29 Oct 2026 13:30:15 +0200
Message-ID: <20261029113017.618286-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261029113017.618286-1-imre.deak@intel.com>
References: <20261029113017.618286-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DC22.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::119) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|DSWPR11MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c9d213-8633-4ea0-cb0f-08df35b00949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|261009223027099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ed+eslSKsiDXtvoox4SCWJ14M9IPpC7JWTtivkh9g8KSG3jfiZB4sbkNBysnqmKXbk25sXAG23/peZlU6T4hAWjIpwT9vW+uUHrQaWaKijguRgkAlwDyI+16/KZ9opRFfYYB30wOYQ4z2rJp+18IBI6c3OOUZ99fwOlL192D23USxZm7YrSSREwE1A+Jz2Zz9/mvWjY0vj958/6sPRCUnkq14J0RqE9hrOIML38PDqw2RuQBCxenBwwHemAXlgZBPkuo9z6jLZvIiY8HeZNQLWvY4qrm99NfpdfwPfbl1R3v3wiq1Ejd+gnrXzBMdbg9XfxO/b30Ztbrli9M8Se7sruHGc/8JuWlrK+9cs7huFTtdSXc8rkUElBEKWpVyi2bYZ57B/rQce2iM90qpwGRi1f4S1xEF4grH3zFsxWPWrBXEinLZbX/ZHW1+CL+sgVjWk0NgpgNLILsN4hpwQ0BNUvLh9KFS+QZ1k22pITahjQ+zO7kemU1ZAXIZtPl756ZqdYOGJfPPy6lR7z5aAX61SH+fcQCyGP1N0FdFYFv0YyLMEddaY8UAKKwsxxIzuUgMRdk1sKgqeEmxaPjtMYjb5FIST2EVGZbzOEYx5KFmm88SVR013aFJPauQ3p4/f2j+BS5EI4YLGAotKZ9REeZ1OCYCaeM+m30Ytd3i1OHVTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eNO6Wej6G+r2cMDmUH441dwnSXgU7+LQAY16R0C/2sWqOEKcW/7Mj+K6CLKA?=
 =?us-ascii?Q?k1kYvk4W+1X9I7kYVX+8jloQnKJVKxI7T1Ori6lxHu0qyrWrdYanxdEL801M?=
 =?us-ascii?Q?RDIkT4VI06LK57aQWiS38l1W+7tFk94nbEYRcWer/qAkkASzCfJklrL99xhy?=
 =?us-ascii?Q?chfdJFvkbKF+e5ye5yvKpNlhNksqhRNTlHneNxPgrusjALZy0hz+rcdYQDn7?=
 =?us-ascii?Q?ITV+Vi2If2cblJzGr8PojhIgb69JRBJ85Z3IeXyYuQ9sUyzpN8E/e+qC28KQ?=
 =?us-ascii?Q?awuFSDm54gBEX/enEZWK5JyyffTtNstNmo1s0bjvPYo6xyVF6mmvThbeYH8x?=
 =?us-ascii?Q?lucee/SlY35GWQdHsRiR5+iW5zDA9FPtDaNMSvRlq/B2oJi+bujHzBtQQqFG?=
 =?us-ascii?Q?knTWEH9a/2ObC9HCiz+V4HGdGpA0jSZ+xA1WkhMXQE9soWDpvjkt71zcY0CU?=
 =?us-ascii?Q?iaVZ2u4k4M7ezPoaisCKGezpGxDQlA3NS35hAQSrzhHqsjx2cZAlfZVpduRN?=
 =?us-ascii?Q?Fhb61SRrt2HSIbb52iOSIkp/5FwW+gsUPEmMFWAVaEhtd/jjMYR/hG50hCN5?=
 =?us-ascii?Q?SgSybKllewg2UYZ77lGvBhGBhFAnrQ/CdCbfgY0DwC58nwdYt100xS+6fKXR?=
 =?us-ascii?Q?E9RgPdSu0SWx9AqfupiwiF9KAidasBDmhPn08oeRqQ01M7RMudOdoPcqdEyv?=
 =?us-ascii?Q?R17Iya15lm+1Qrip/h7xwYSuxWwGd0MPyEV3kVh6U3EP1n7ZSDEDyPS/aWWC?=
 =?us-ascii?Q?ThTHXYT1ZeqdY2WykYiLZ/5MDtkDLoUmWj1Gnu0vWUwuEMyi8OQSKXnQCEmS?=
 =?us-ascii?Q?u+vb7F08FnhXfOJ1kHiYptss8ItgCDQJLkJYnCvmsTKlLnIgVWyIcMhy68wR?=
 =?us-ascii?Q?sbNtvWDSzZIeGwrweXFuoNAAbyxj5Yk9tfdYN8MPjE3ay7wSwmvwJOyfCG1Z?=
 =?us-ascii?Q?3YGHKnv3vgLFxffQ7FjDGArde9Ax7CwrjE8BNDNd3FNsGbc0YSwyGpcMhikp?=
 =?us-ascii?Q?EBUxYMid3b27EUViDQ/PvDzzo0t5RlGhGKYBccqJjSh9LFj8a60oSRvhf1Sh?=
 =?us-ascii?Q?UhKZxDewH+dVY8tnL5O2bulAyz/+4IqbEPz7nrtS5snA4TijetihhXn0T6G1?=
 =?us-ascii?Q?QXJoAv8HUuWckuSYdPmQJojM/nfHwC2HVNg03fNZgUy8672c9ONEU37MNXGu?=
 =?us-ascii?Q?hPGzY04kJLwG16qNelCZhCiHDl/j1r9jIDjuxClq/mOiHFClfvrP9WSF+2Ap?=
 =?us-ascii?Q?tdKnoj5QjqeaI7eEE0HXxWhMIvgNV1ASlC09A/9Jd8xTGSSl4GM7dJWvbOZA?=
 =?us-ascii?Q?X85epdLzhLm+FfTU56bUAJNS9JamI49NJ+dwourDqgm8dw0S5m8emkXemvrM?=
 =?us-ascii?Q?fSXgSO0iCL6MmBq6IzZigZXqhcNNMlbTtcYRFtpPW8hr/FR1oHo6VJpR2Fzc?=
 =?us-ascii?Q?RrBlOJl2DCIrPKmf04/sLDD8HeIFVAMlT1BPA9pU0ZHzxjJEupcDPI71IiZN?=
 =?us-ascii?Q?NZU7mndoeCeOKvakE/ffIKts+1DjV5nrglLfWNCIPa3vhvtG3BFuhttWFP3u?=
 =?us-ascii?Q?Q+afoR7vIBSjbvlgG80mOFjzWZ0GFRKa0Qe5OvfttRxOWgG45T8upFHui61x?=
 =?us-ascii?Q?8M/ylwwCvYxm4qooASY++sezgMKvdE54st/eLD0DWtbnF/cleklIQvf8skhf?=
 =?us-ascii?Q?sfi6BKbJEH5ch8ADMzT/6nz2G0FDLUfpgVtS3q7AfHOjCiQKStm+n1EbM87b?=
 =?us-ascii?Q?aClIuJ1prQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: jl/l6/kdFtJP/ewqV7YjpTVa/ksGE9pUijCQOKrhCgKW6hM5FUllL/I1O7QiP8JBg9XxIqTZoU5zBDxV77QvlgUdSc+niYDAUJT6msvTprIcl+y3P6PBRl7DP9+cJ5P8urgBE0Eba42FjpAyMmaO9IgQSU8mJL1MfDzrXVwED4T9Pl6vk9vuK0y8toOiJWRwh9GzGKnNpARoggYxZltNdRB7cSfYtpPxrdRrtzOKlEPhCqoPgn6ED6bXcfvaSLkgIt3AHiAV9JWb0aPK12w2U/Q2EEdoz1PZBQyFszdVseZpUMVgTo14y59Ok/IgNC7nhsdhknoTNZb6Z9D2L+gbpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c9d213-8633-4ea0-cb0f-08df35b00949
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:30:29.9371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WF/+jrWc9TShwIr2PrG4LTR7mcy74AA1gMQaTOnqBL5HpRK3s2El9jmHA3/sQRzYZ7ns3kRdhdMAyk4rVDmxTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9823
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Handle the TypeC PHY on port B case while mapping the port to an HPD
pin. This prepares for an upcoming change that will set port B's PHY
type to TypeC on PTL+ platforms with an eDP panel connected to a TypeC
PHY.

Keep the existing port >= PORT_TC1 case and its HPD pin mapping for
DG2, where PORT_TC1 has a non-TypeC PHY.

CC: stable@vger.kernel.org # 6.14+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index dda95709c7c73..5950246e45a06 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5053,6 +5053,8 @@ static enum hpd_pin xelpd_hpd_pin(struct intel_display *display, enum port port)
 		return HPD_PORT_D + port - PORT_D_XELPD;
 	else if (port >= PORT_TC1)
 		return HPD_PORT_TC1 + port - PORT_TC1;
+	else if (intel_phy_is_tc(display, intel_port_to_phy(display, port)))
+		return HPD_PORT_TC1 + intel_port_to_tc(display, port) - TC_PORT_1;
 	else
 		return HPD_PORT_A + port - PORT_A;
 }
-- 
2.49.1

