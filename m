Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD727C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 21:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691AF10E3D6;
	Mon, 10 Feb 2025 21:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WsAosdMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9411210E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739221649; x=1770757649;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=8tAYjBqFFHNJd986W8jYjM+86dE+ZMTjO0CH7FVlghY=;
 b=WsAosdMT3ht5OhDtlr/PBvcyAXR3AdtwOHtYSngMpXbbBF0uI5/vZfn+
 d6FWHHwGYZx3XJuGs2oLF49g7Q0bAokMnQyNrunFqj8dQ9prn2hZ2gL5C
 rjOsEmjzTrufPRdsXai/1s+oj1h5+ub44J/01yuMtp+i9kyOEFYXefRhx
 CWRqbBAFPSfPaxQ7qmk4B2hUHRRJmCJDx3C4pyF+mWfjKr3jYY0GbtFk6
 uZCL5Ah7QQShrOxv8529b/WQSQaMwTR+uqghu/G6DKeG+N/pdpz5ccSze
 XvIjpSFH1WjAj2+ml2aK6eE4iBwgmt76TKVqu3y7YlEBB9K0gFK3Ac9Nl w==;
X-CSE-ConnectionGUID: QRUleDhfTRy94eK5XEdLWg==
X-CSE-MsgGUID: 4N1uaduhQlCCNRIuHr+lkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43585896"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43585896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 13:07:29 -0800
X-CSE-ConnectionGUID: DPc3D26qQpCsvIwEclz3NQ==
X-CSE-MsgGUID: 0/fEDtMHSImPWd6GWT8NPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117380819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 13:07:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 13:07:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 13:07:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 13:07:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWfGur3OUiLFfJgdWr0rrB/IgOvSVTO4ndkxcWR4cBECI9TA28Y7GjIj2KAIhQVxjwm+yrSePPtA9dKYfeb8/N81jGMLho3yngYMSxMRIcbFpo4s/nIuPSBlrZBC2HLsPsIoI7DCfU/xbHg+kj8TCByE+7cnTtTqJRchF+lci1M45CtWApwWCwC3wFR4TclNVIDAusJxoOSDNs7u+h9InAIUcaMba6w9LKHjJqauXELoQ9gQZOyjQat5lcK2Z2paJTxs8XpXbGwMh82smJE6oQc3I/4nmkAhQ1UACvXZWAm7SDWTwc0utxrWdxW3GftjWALPeB23e8+wADfDhGdDZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaEEmf8gP8oA+WD5VYd72WxabxzaqY6YosWxOFNpV/U=;
 b=eZ+Q4FQehvA+umrxo3BTKsSDMilxkQth2SAdOwtSI16mz7MaI0oKwk+wXWdLFmI2EldtycS6kf8pRCkB074a9iurHVyWagf1ZsgaIZWi9Kg33isSwOd88PVQE4uWYGB23w8um0+CnTE903HdFjRIlbVo7e6yNHWXHw4U4xHdn93iXnjeo+vUdmwvvY4hIgGEPcfKFEiBbdMagTt6uAZyWm/EwQRLpc+rEMHlnm5MYNj1AwFuw6UGI4YXb6aOInbtBfhjdnIuhdUKcn90XltmyifZZAGcw6Ven+3O7USXlze71KrjJseASwuXePoLfjg0oWSxXn08EvfJL7O2/us50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by CH2PR11MB8867.namprd11.prod.outlook.com (2603:10b6:610:285::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:07:23 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 21:07:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
Date: Mon, 10 Feb 2025 16:07:17 -0500
Message-ID: <20250210210719.477386-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|CH2PR11MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: e61dc8fb-6ef0-493c-f953-08dd4a16e9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WsvD8nLPzgplyIGOu4GI62LBvsx41X+Z6Y75aB0V8KvsZjesNk5bfLV0pEz?=
 =?us-ascii?Q?ankkKDKYHy4WXptHgln2WgWgmfVrX0gQroumMhVPQXrAXXdk5RvtRtDzfsUs?=
 =?us-ascii?Q?o+zTXYYz7619WEf+0Y5OGyAOLZn2muI1zSDm5k3l1VABbOAg7IlcCPKj3M0R?=
 =?us-ascii?Q?ky60FvMLo1XmE1tElSpq8QXQBA5Y367v5U9TZyTF44pM0xrtEMgz8Kge1btX?=
 =?us-ascii?Q?q87GxVDFOYuNj52ueyjyiKObSZMdy9otRw7heftzNFdLpvR+veDCvkvbtYaK?=
 =?us-ascii?Q?PfgpJxInKzqdN8I35fxd/ic+nrXtDcymKNcPQvhEOY6P0kTAWTHS3y2MPbld?=
 =?us-ascii?Q?7ncI3X3eax2WulLxHrDZYFz0ud105rgkflW9BD4PzvMhxGEWbXjcddVp3X+R?=
 =?us-ascii?Q?3qx6yBx+/40re1+VyXSND7AfEM/Lc7ZVK2Y41oZfNDSHn48+Y4MCEntmwOx1?=
 =?us-ascii?Q?Fz+6O5bH1yKQl0AZwxNX9OKUoVfnaFj5ik639B+cvpNzB6sqkaEgVb0c0MPq?=
 =?us-ascii?Q?2jQKtyJNOPP62La1aP25rYsSllI1wOm61Fa6/ONDVJweHpR1bGxjVLWPQfEc?=
 =?us-ascii?Q?DdkdhaFAvQLAie9BHeVZ8HPLWGpo/OzPVvbLZnb9igVv5AFVhnZOHhOb2KEK?=
 =?us-ascii?Q?+5QKTb7SUoQVR6kHvt0kDkK26lL82L7GmJKn4V48xtDhNJOqx9otHeUctaDp?=
 =?us-ascii?Q?L8S9jI66PquaV9ytdhj3bso+zN54J6qMFSlvrsZc8JWc5gJAcoL4bdNlLfxa?=
 =?us-ascii?Q?OiAR0VKqJKjLdrlKk2ZngoEnzFg2zMAOoyytZ1CdoCqaqSNs7H/Z5/khwcAJ?=
 =?us-ascii?Q?eCHbU7/OgdEaAzx/tuoQ3ZWP2bxwrtrV6J2CtazBOfAJ/xjklawEpTMKymLS?=
 =?us-ascii?Q?UlfkQOe7XXE4JtEQPlwgtq1MTT9KKWokEvNSxlMoeMe0Cbgtx8T8Z64qZKAp?=
 =?us-ascii?Q?DTuQSLM9cOPfwyXjlRGwPbXqFc5XNkNsbLqGyfdNsg9APdBI9fS2cGdt/WtT?=
 =?us-ascii?Q?N+4RLOAbCSnj/ZAClQ5q+ZFZT+CpuMRQAXG6e3tX8amz9kyy4C0anTVc8WM+?=
 =?us-ascii?Q?Wdm8GjydB93PaLBRKEL3htoPhwopwOwZ2p1CRgi1bYbSdDdxOoS5NIU9XG33?=
 =?us-ascii?Q?FUmEv5sa+7VC7XWciPv4zzUf8uUsJy0ssGsfPH5g7o5r9Z13lIf5ph04Hg37?=
 =?us-ascii?Q?tTEmZQZuoKZmBUtlMVLbtTmZnWHLrReu/9FS0EjnYyRhVS4bBNIRARZcYJoP?=
 =?us-ascii?Q?UuJGoLzvhuQn89kx+xYxkuLk5DlgbW8kKxUICCPlRA55fxrUpQB4M40n5xQ3?=
 =?us-ascii?Q?WDFSpox/NBowd5404zbNEpamnH0y2F4CB1qeI0YySSQCqHOO0Xv6VbZsWVvQ?=
 =?us-ascii?Q?yT5xgJJGiTv+1g/+CX9gzx7rYRob?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0BtmOxKdEEIfdF9C0npvDiIh4HrmkzVe0g7vOx8RtuvKpoFJ6ZPKXsXdyzx?=
 =?us-ascii?Q?Qq9gwQr9MsU6uEq1hQXyOi5L6uhkoy4QBLA5bUISqknqXokcpacPmwk/HeX2?=
 =?us-ascii?Q?x+WlYxpoNsei+XRywZlwFhU0r7wlcOZsZTAQUzagsRJhCRA5O1ndkgorquzM?=
 =?us-ascii?Q?eGTOCWi+HK+Uhv4VTu04OBOD4g0Rb+hQgXP/spzHyBmRtw3ZkBrThcUx8z4G?=
 =?us-ascii?Q?iczl8er22lXpmvIMApVWKL29RMQuc6vSvNieUM+m0htobu9+8EgRcQFgTZlG?=
 =?us-ascii?Q?7s9fSDCI9eV4CzInFZ9Qe5g+g0sjMtj1QzRUYNt9zEyTRZA5eMu5bzWQnIIw?=
 =?us-ascii?Q?4evE8hBs4zih8+GTONyR14+WW2chhoYPs9QevLZEifu5WBcYvItLfadnUvz9?=
 =?us-ascii?Q?NUhaBMgT3pZ4LWAHLPjfMbQoSO4Z+0v6WYNocmwhpMqnLMGqVL2+ZrWUHNND?=
 =?us-ascii?Q?Uc5GNmL6VX6xDTowqU3hLc2YRkspJehethTq49cocVIbPsHgbtRF+dvyiwel?=
 =?us-ascii?Q?jrXMUH4NpaufHgcmWdm+zVXCww0N1lfIQrNflvUuTYu3dKPI0E2ymUF352TU?=
 =?us-ascii?Q?LyaqahRgG/7OyXQIr7TLmbZZKNa+BokJwwpt3rvxvpBlDXUaVxfqlAzC2r8y?=
 =?us-ascii?Q?6k//tkr9/8KoCds1NC4n9Sq/2FGCoCKHBAMCyOE8k+HjsR6TwrH5NyWrvJck?=
 =?us-ascii?Q?w8hoTXvxXjFpXGvl65yaHwpxESBBn/VxEm592qA8wp93j6Wrew/t3cinR2Tn?=
 =?us-ascii?Q?ld8DzPSiu9eHk3rHBRGo+0/PplshGhGHPdLg4xejQNptivku/1Vx5LTuNnOF?=
 =?us-ascii?Q?g2vfaCwQLq9NULsy81Jq/1/Oy1VU3mJhD6ZSKxU8A3bSFFPRMyhIrRJFs9ha?=
 =?us-ascii?Q?0xzxPBe912/S3FON+n1Xz/mr0irSZIGDfI8zhCWkUFq30bOlTQxdhtFdwAIR?=
 =?us-ascii?Q?rxAx3FB3Qe3LtwKgGndntDTNF68MJu3bqAME7mLP8WrnlxX9KD8RnBpYG9Jg?=
 =?us-ascii?Q?da8zgxhVM56lLy1b+joNg9mkBWZzEWGE99i2baT+HYpuUM8boy88ENkWsp9c?=
 =?us-ascii?Q?0MQP3lEAUr3DwQGNXz420dzYOIwN3UD2WRx4A0XBSr2Od7jX+SYdZzdBlJB7?=
 =?us-ascii?Q?lFlttm1KiPP7xGj+NrBwm3upYEGof6OVfpS9cI8nU7uKBn7MbLYI00snugbI?=
 =?us-ascii?Q?TSZuG9LUR6MkYFh450YvhCMLNxJQSML11/mtgIkZBAJkzPUletatAMYk8zBq?=
 =?us-ascii?Q?oeJL6WecdyCikBCBUmVLufjEP5ciOtGluHTz2Z3/vm/y6MMtOTLF+3Q/h4Ar?=
 =?us-ascii?Q?0cs2EJUI0Y0wJ2DqwvzQSi/PXsk8cBs8OVP2lCWHpyrwdUQkBEwTCKzorJpe?=
 =?us-ascii?Q?6zJHJ6g5bnbqU1H/lqghPtp59GY+t85AsuUP8gKterV0J3glokYPA2z4OuPv?=
 =?us-ascii?Q?yhzzDN/GVQwxEdO1zuwcpHNiHBhzGZ9HSnCPPxI03iNmb2YFQ57Exg8+FAPU?=
 =?us-ascii?Q?aEDKuBGT/1gUTZS0ZyS+aVRKAnOxnCokfoXBsD6X4x4eOLgq68TnaYLcJzxP?=
 =?us-ascii?Q?xs/zolem5q6wyVpLDSDnSL79vJ/ivStc5U6twHQTKG7MtfVa54ppNqUzvs/x?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e61dc8fb-6ef0-493c-f953-08dd4a16e9ac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:07:22.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNPE+3b7Hl+ufGv+YW8qW5mnOQRwwobj1r+pkCpJtRPOmL48bJKZbwhLMhKBPrUDAQp8hhEy5YEgd8H6iQVXZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8867
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

In a rare situation of thermal limit during resume, GuC can
be slow and run into delays like this:

xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
   		 [status = 0x8002F034, timeouts = 0]
xe 0000:00:02.0: [drm] GT1: excessive init time: \
   		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
   		 perf_limit_reasons = 0x1C001000]
xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
------------[ cut here ]------------
xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO

If this happens, this can block entirely the GPU to be used.
However, GPU can still be used, although the GT frequencies might be
messed up.

Let's report the error, but not block the flow.
But, instead of just giving up and moving on, let's re-attempt a wait
with a very long second timeout.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 02409eedb914..aa58f9ddbf84 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -114,9 +114,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
 static int wait_for_pc_state(struct xe_guc_pc *pc,
-			     enum slpc_global_state state)
+			     enum slpc_global_state state,
+			     int timeout_ms)
 {
-	int timeout_us = 5000; /* rought 5ms, but no need for precision */
+	int timeout_us = 1000 * timeout_ms;
 	int slept, wait = 10;
 
 	xe_device_assert_mem_access(pc_to_xe(pc));
@@ -165,7 +166,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -188,7 +189,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -209,7 +210,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -1033,9 +1034,12 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		xe_gt_err(gt, "GuC PC Start failed\n");
-		ret = -EIO;
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5)) {
+		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
+		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
+			xe_gt_err(gt, "GuC PC Start failed\n");
+		/* Although GuC PC failed, do not block the usage of GPU */
+		ret = 0;
 		goto out;
 	}
 
-- 
2.48.1

