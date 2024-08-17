Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0ACC52D7F
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666A210E05A;
	Sat, 17 Aug 2024 10:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfDz4Gr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8910E034
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890972; x=1755426972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ztNNkbP4Biog9Ks7cD984As0zfmR6LiN1m67YM2oqvg=;
 b=ZfDz4Gr4K+AZ3t/sXZHYPltnn6c8VNHFvAS42feDpkwAkZZuK7rLvlwi
 2dbrLiv7BuDAkLr6Y2uoie20BMUwvQD8vWDTQb3y71QXpINfhnJY55RzH
 e1+Mg9NtyGzCenaryvhuUlJqYJMUWyxMW/v8BdLgiRUevy2SoNGMHQN69
 TDZLnt3DDnZlkv07qcHmaZGVnIUctDRM4Rj6BC4r8f8niHw5rM8L/MBkX
 RPcl6xtdBH4kwf+YpdEgBLlTY9L3iVKbuzPXaDkWb/ReCCoZM2DlfAq2A
 S+p4brF3HUv3K0nwZ3zuneE/j4GtQtJkACWyUnxeZkGi/50mIjmirPE9a w==;
X-CSE-ConnectionGUID: Lt2Dhm5ZT+ycosFc7jCTWg==
X-CSE-MsgGUID: h7B3q2RpQe23I4qIydyScA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="26049109"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="26049109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:12 -0700
X-CSE-ConnectionGUID: NDBCiexnTQadiIG/GNCzaQ==
X-CSE-MsgGUID: /FgHle09RpWXWCFiWwm/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="64866595"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:10 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6YtEj+AtBILeyznlf50o7A894wzV8d4fHtUxAmKb9y/2Q3kk/BDJ+HImiLDOfkD63wD6Doix8C59/4nuHnB/0Hx1/X6bP5SCIEfnwOIrEo/IlBriwV/g5a2TcBlO5LxLZ0hWcZk1HrqyJaogZ8V0cGLNCB4hrgRln4NYMC1tkJ3w82LayBnJPy+5X9U4WxspZ40pg/R/0LSYLAm4Yl3gofZOCOAo3jUSJwQCHIBfP7Qv30cEBhSvwfoNPpFEVx/s1Snrby8+9ZVscOabdFH9wgfKWQPxNvt4s+C1rhUK38dQkA5/81f7yrDL/2VK88a6y9R3jCLzpQcmNR3oivYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXx2BTRVOpncqWpa7ZUfLp+vyv+IULJfw5sCymzd5ps=;
 b=y49q4yASqEJ0Q6gs1dQUKn4Ap9vtcIEXGxH2wM3M6w75OyjkG+nE6ufMQFNw6VAyuWVg8espCwB/9fHg0WNu4w0TCGOw0bK3ggXhFGekqXP/RPYqMpiyoi1QI4LneFn3R0fGgr0+4J4X+PfRf0HOBBsapq3uwc6UFEa6C2oUgXInu5uwaUoYWQouWP5HTNS+/fMtdcGtw1pmN+/s5tVdPmheA/2Lmf+nngRrGe5EKN7+vWFa0Hzc1+C70O+DHsgCSyanmNQjfs5fgXEyTUSln0qoIMCIasUxniSLvo3AWpMvhdbmQUBYhcEBJ4cfo4ju5/5N79pgRFhcYGKQM8qmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:08 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 05/12] drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
Date: Sat, 17 Aug 2024 06:35:48 -0400
Message-ID: <20240817103556.163783-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4464a50c-0794-4ab3-6cde-08dcbea86766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q9h8wzLRnJO9ev+za4ncqDX6sQADQSdCLeeK5LxSNuP2jwaCNJ8Y5eC04F8G?=
 =?us-ascii?Q?ZqXAl3LI744YN4AziUDcunsCO5AVYNF6MBhHVdrbz8PizLOAnxp1QhiyKtbO?=
 =?us-ascii?Q?gS3VxYhViqqqSquIAKHTR2XW85aTG1l/Ge5mymDSf/vznZoK/fXm0YA7e8ca?=
 =?us-ascii?Q?k257T4ipddX8F1zMoCqabe5T/GDL0cU7zM/gBGgM/SDRarHeMld/eB+2bPlH?=
 =?us-ascii?Q?PsC0QFs/3KBpRaRA8dr2BxJEKbbNtwMqSRWFpxBEmME/Rlb1cvod0fvQYjfQ?=
 =?us-ascii?Q?1YuGfwyYWfA20GmWWq02Jb9Ta/GB+j7T96D2Cd50PdfamzX5WgSPxIom0MA+?=
 =?us-ascii?Q?zmWNpJHAQZiAunt6QvCMmdXm5tD8oZhCZH7iMKYlBOBLbHbaHpS7mxRgs2fh?=
 =?us-ascii?Q?UOUVnPlBqjyKM76026lM3bfiPkXjj5ycr4NA1hrNwM9Ek5e9lkADp7Xg8m9F?=
 =?us-ascii?Q?tpNBGDbOjniTBUEoTt9VgMpl8VfkpgvTW96tcPYBQ6wAF3F2XfkQ3IP2w31n?=
 =?us-ascii?Q?GGPcSiVPMg4kJTvsO990++uVQt+hCB/lKZChqntsC2U6ITfRsJnRkiY2Q9C3?=
 =?us-ascii?Q?8OyJvhfifJBbEghA9s+5M87jLb2KOAd0Je1h2hyCR0u6LI68cQ93guito2gw?=
 =?us-ascii?Q?k0aoW0AswRz+4t0Zvl6446y2GO1tuooIZKzgHAMGTOqZs/4QpZTQVXEBs9Yv?=
 =?us-ascii?Q?MAYzCcjTDZICQRcxBsALGUVFDlQ/LtolTPWMtHQxMQxsYx6jmn+PXtP4Xbvv?=
 =?us-ascii?Q?AsodAcOJ+k1+/vRtp9XfqMzzcNHTXBJu6oyWl4B2QQz+haTnsIfGYmIwtznV?=
 =?us-ascii?Q?wROEtjKXcew/STrZlsGEOO9CxA7xS4LDP6sGwGSnUXoVArylfrgS6kOVUHbM?=
 =?us-ascii?Q?WIGrqTCzfqd/TFrh8Ety1xp9kyjqeMdmWPzYV6vxr2djV1w0SViqgjOZFgGO?=
 =?us-ascii?Q?SZnMgI3MPO0AwZd8KBZgWgxZsdveTNae2sAAKs2bzC4rWOEQJFEioI9CS2wv?=
 =?us-ascii?Q?NYYTPT7wR8Qxt4/txLIaEsO2GudS51ZikZIpNs+5iXNrb/h5uv++ZDEEyWKM?=
 =?us-ascii?Q?J7c88NLGS7pEYAbBw94jg4MScdVZgFbJ3h31sEy42IJrDWQU/abl5NlJ20RK?=
 =?us-ascii?Q?+iya51tq1pzJSkN4RD4XU8PtPZ9qlboW4xd3x0olO6PcXXbY9Vm5xEs59vA/?=
 =?us-ascii?Q?JWSVdqjimQIp8dpV3g63qhzIg+GxXDr+9faP0QVIZDBggcC9xhb5puikFMht?=
 =?us-ascii?Q?6wssxScSy2yS5NR/B3J2ctWbhyc9SWaXX6HJ0TmY/AvFGTbT7d33ipZBrUd8?=
 =?us-ascii?Q?0W7FvarP1MrOfTj3X1TpfSz7IvRVCBrNE9F9z5Ut9ndH8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VZCMAU4Gd9eZ7WiHInm2fIM7myfXR/gfoKxNNh97y7MP+/j4nWz5zZ7uiEqP?=
 =?us-ascii?Q?fU+EzsERorXyp/K0DpQr/nkttbVlXCIKPb02ne527yhsOu+lGBZesSv+Tndr?=
 =?us-ascii?Q?c2/geByb7jgkWMT6NluVXYKTDkTZbVDJ9y2YXEZuh2Lktn068sBX8nSTA9dO?=
 =?us-ascii?Q?maq3SLGhJgDTOU/IbxssC8Sws0TUYzAjsdIv+AAN/WZ9+hss4v8c0TpCvNsL?=
 =?us-ascii?Q?s4zQxhp22r3wdw0dmhRiNbl0BSafDpSYf6Bal86IWBdW0E4BbdzfCeFKD55v?=
 =?us-ascii?Q?kfZcDx7RtTdRsdxyXP9R+QiXdKwCinyDpmZjLiQ6QfN0Mk21K8l4LqRb4sBm?=
 =?us-ascii?Q?eEYO3cLy2ht8RtkYyIVOHfZMK4nxz1fnPfILtR9rkQrWaWmCwxXbO5CAi2r1?=
 =?us-ascii?Q?KEpLT2P9xwFR2vMPzjU5JUDkeq6+Aaqjf0AROE0Mqt7MCRT3uHY+YCVHHUQT?=
 =?us-ascii?Q?1imujbXqd6ede755sGDDcVh22qL150IHWm7rXmwsgr96XT0uhIWL3+IEq3b3?=
 =?us-ascii?Q?jVxf51JNRVSamdepI66IkitkjcJq3eX4Wm5ZjxvyD8jv7CNnx27d8+VW49mE?=
 =?us-ascii?Q?xNEyEytOKoP8GqCkr1Ls4Cp4P3SrTqDQ1eG9vaVyj2dAOzhjrDfgczRxEEaL?=
 =?us-ascii?Q?qE/DmG4zrY/oNLTekX2KrhK0/LhNiwv6i6T20+4NOEFwKs/+g1XifU8Ss3/A?=
 =?us-ascii?Q?bd42kVw3cFeKiuoTdQfubFtVjoWtOrkrlS3KV08+AdFhV917TVAZgyy8bmkq?=
 =?us-ascii?Q?nGlFc45vQUHnPEPJv1zF9AvHYhEEZ9RqaNT8TTiZUtjUbxkHHMPvMTVsTBTx?=
 =?us-ascii?Q?9Zxh0mvwjfv9+2DZaNnoAyljZfQUBS1rhLCcO291Wv/NdU0HVsL4+RCA1p96?=
 =?us-ascii?Q?/4iUIuOyjLw+1hw5tMiJSfAnoO2HMObevhssBfjntycXZVUAm9TXeFMRBioS?=
 =?us-ascii?Q?66DcPuInjAQupDMoejFMXnmb7Ogql2k75P5sGsHnJ02IF6pLPPLzbcP/1XJ/?=
 =?us-ascii?Q?yObrKUihcrjjfqSn7nyYvtZgiAM4A9D2WYK95GVG1Y9Iy6XAN82k/Fvh1O2i?=
 =?us-ascii?Q?MmECLDcXvG33h5PX2QQVsoIHdiyEYGi/G77tUTKea5iN8XL2QLQS09qs/WLy?=
 =?us-ascii?Q?1c2lomjj7tmoUIFU6pga9lIFiNdmg3UH+yGU1I0ytkZF/olaf5/qAdeV74kA?=
 =?us-ascii?Q?r2VWwR/ovKtBv2pkrhY1rN6lEBSep1DcbfoyWQZnHMrwKmgC45ruQ3LbMOd5?=
 =?us-ascii?Q?x//EKPSBzdjwF7KPvi0wjxsuO6o5XMf4BTybE97dXuZ1ZAyeUviD/ncxGDYb?=
 =?us-ascii?Q?ZI9dF1G/zxOaUp0YhQ8U7syaBk511VAKuBhbHvJ6m1/Iq1dLS/mSo+ZrMuuK?=
 =?us-ascii?Q?2PAlXXqhsqzoVNImt5C8V0ezgyEFuT7ZXZaXVS4nBIcN1JJR9Igu4+pUXMvH?=
 =?us-ascii?Q?sLmN0Lb7R5UkEQsLE6FmqHr//V/IlVmJbdLNz0OMCZi6TPzOiQhvW9ALH9Km?=
 =?us-ascii?Q?TzsQsHIBC1x/mz9NxQG92TbwHZYpISyJ0mzIVMCcVtaO/fu+ZBmNN29Y0QE2?=
 =?us-ascii?Q?zzKOCj3ndFS6qN+RJaRMzkW0yiGAB+aNGIzsr5vA5ctPyCBInlgc6ymm3Nnx?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4464a50c-0794-4ab3-6cde-08dcbea86766
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:08.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+P7lGNcn9W70t5pWvC/n15xbYySoAyjDvpgtDAxvPUi1sjqrao2GXoIcMb+COlm124g3zt/ggR1asxwIcEyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

The xe_ggtt component uses drm_mm to manage the GGTT.
The drm_mm_node is just a node inside drm_mm, but in Xe we use that
only in the GGTT context. So, this patch encapsulates the drm_mm_node
into a xe_ggtt's new struct.

This is the first step towards limiting all the drm_mm access
through xe_ggtt. The ultimate goal is to have a better control of
the node insertion and removal, so the removal can be delegated
to a delayed workqueue.

v2: Fix includes and typos (Michal and Brost)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  7 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +--
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |  6 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |  5 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 72 +++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h                  | 12 ++--
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  8 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 39 +++++-----
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 +-
 11 files changed, 90 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index a20d2638ea7a..3028ac1ba72f 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -7,7 +7,8 @@
 #define I915_VMA_H
 
 #include <uapi/drm/i915_drm.h>
-#include <drm/drm_mm.h>
+
+#include "xe_ggtt_types.h"
 
 /* We don't want these from i915_drm.h in case of Xe */
 #undef I915_TILING_X
@@ -19,7 +20,7 @@ struct xe_bo;
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
-	struct drm_mm_node node;
+	struct xe_ggtt_node node;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
@@ -28,7 +29,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node.start;
+	return vma->node.base.start;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 42d431ff14e7..a93923fb8721 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -204,7 +204,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
@@ -218,7 +218,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -232,7 +232,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		if (ret)
 			goto out_unlock;
 
-		ggtt_ofs = vma->node.start;
+		ggtt_ofs = vma->node.base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -325,8 +325,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 800119c8fc8d..ae8a786f5d65 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1098,7 +1098,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_node.base.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 1c9dc8adaaa3..faffbda55517 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -195,9 +195,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
+	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
+	return bo->ggtt_node.base.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ebc8abf7930a..4b1de9f5be00 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,12 +8,13 @@
 
 #include <linux/iosys-map.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -39,7 +40,7 @@ struct xe_bo {
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
 	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	struct xe_ggtt_node ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 16a24eadd94b..d2b3d8a0c1bd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -204,7 +204,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct drm_mm_node ggtt_balloon[2];
+			struct xe_ggtt_node ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index dd5cd0df705c..1cf682d15253 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -351,61 +351,61 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  * @ggtt: the &xe_ggtt where we want to make reservation
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
- * @node: the &drm_mm_node to hold reserved GGTT node
+ * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
  * Use xe_ggtt_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
 {
 	int err;
 
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
+	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
 
-	node->color = 0;
-	node->start = start;
-	node->size = end - start;
+	node->base.color = 0;
+	node->base.start = start;
+	node->base.size = end - start;
 
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_reserve_node(&ggtt->mm, node);
+	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
 	mutex_unlock(&ggtt->lock);
 
 	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-		       node->start, node->start + node->size, ERR_PTR(err)))
+		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
 		return err;
 
-	xe_ggtt_dump_node(ggtt, node, "balloon");
+	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
 	return 0;
 }
 
 /**
  * xe_ggtt_deballoon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
- * @node: the &drm_mm_node with reserved GGTT region
+ * @node: the &xe_ggtt_node with reserved GGTT region
  *
  * See xe_ggtt_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(node))
+	if (!drm_mm_node_allocated(&node->base))
 		return;
 
-	xe_ggtt_dump_node(ggtt, node, "deballoon");
+	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
 
 	mutex_lock(&ggtt->lock);
-	drm_mm_remove_node(node);
+	drm_mm_remove_node(&node->base);
 	mutex_unlock(&ggtt->lock);
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
- * @node: the &drm_mm_node to be inserted
+ * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
@@ -414,23 +414,23 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&ggtt->mm, node, size, align, 0,
+	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
- * @node: the &drm_mm_node to be inserted
+ * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				u32 size, u32 align)
 {
 	int ret;
@@ -452,7 +452,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start = bo->ggtt_node.base.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
@@ -470,9 +470,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 		return 0;
 	}
 
@@ -482,7 +482,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -523,12 +523,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 /**
- * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &drm_mm_node to be removed
+ * @node: the &xe_ggtt_node to be removed
  * @invalidate: if node needs invalidation upon removal
  */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -541,9 +541,9 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
 
 	if (!bound)
@@ -563,11 +563,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_node.base.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
 	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
@@ -602,17 +602,17 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
 /**
  * xe_ggtt_assign - assign a GGTT region to the VF
  * @ggtt: the &xe_ggtt where the node belongs
- * @node: the &drm_mm_node to update
+ * @node: the &xe_ggtt_node to update
  * @vfid: the VF identifier
  *
  * This function is used by the PF driver to assign a GGTT region to the VF.
  * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
  * platforms VFs can't modify that either.
  */
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid)
 {
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_assign_locked(ggtt, node, vfid);
+	xe_ggtt_assign_locked(ggtt, &node->base, vfid);
 	mutex_unlock(&ggtt->lock);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 2546bab97507..30a521f7b075 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,15 +13,15 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 				u32 size, u32 align);
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct drm_mm_node *node,
+				       struct xe_ggtt_node *node,
 				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
@@ -32,7 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
+void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 154de298a4e3..af312a7d1031 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -49,6 +49,14 @@ struct xe_ggtt {
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_node - A node in GGTT
+ */
+struct xe_ggtt_node {
+	/** @base: A drm_mm_node */
+	struct drm_mm_node base;
+};
+
 /**
  * struct xe_ggtt_pt_ops - GGTT Page table operations
  * Which can vary from platform to platform.
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 227527785afd..f107ae550c0f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,6 +6,9 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
+/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
+#include <drm/drm_mm.h>
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -232,14 +235,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region)) {
+	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region.start);
+		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
+		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region.size);
+		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
+		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
 	}
 
 	return n;
@@ -369,11 +372,11 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
 	return err ?: err2;
 }
 
-static void pf_release_ggtt(struct xe_tile *tile, struct drm_mm_node *node)
+static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(node)) {
+	if (drm_mm_node_allocated(&node->base)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -391,7 +394,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_mm_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = &config->ggtt_region;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -403,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(node)) {
+	if (drm_mm_node_allocated(&node->base)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(node));
+	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
 
 	if (!size)
 		return 0;
@@ -421,9 +424,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	xe_ggtt_assign(ggtt, node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
-				vfid, node->start, node->start + node->size - 1);
+				vfid, node->base.start, node->base.start + node->base.size - 1);
 
-	err = pf_distribute_config_ggtt(gt->tile, vfid, node->start, node->size);
+	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
 	if (unlikely(err))
 		return err;
 
@@ -433,10 +436,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct drm_mm_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(node) ? node->size : 0;
+	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
 }
 
 /**
@@ -2025,13 +2028,13 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region))
+		if (!drm_mm_node_allocated(&config->ggtt_region.base))
 			continue;
 
-		string_get_size(config->ggtt_region.size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region.start,
-			   config->ggtt_region.start + config->ggtt_region.size - 1, buf);
+			   n, config->ggtt_region.base.start,
+			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index 7bc66656fcc7..a73d9a4b9e64 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -6,8 +6,7 @@
 #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
 
-#include <drm/drm_mm.h>
-
+#include "xe_ggtt_types.h"
 #include "xe_guc_klv_thresholds_set_types.h"
 
 struct xe_bo;
@@ -19,7 +18,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct drm_mm_node ggtt_region;
+	struct xe_ggtt_node ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
-- 
2.46.0

