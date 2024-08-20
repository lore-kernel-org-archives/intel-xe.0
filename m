Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C3DC5321D
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CE910E34D;
	Tue, 20 Aug 2024 20:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtLZjojK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C1810E2F7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185579; x=1755721579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gMJjRGH5Z6J/3SmEUaMim6hHooSLoRjEbTga0XzZW70=;
 b=dtLZjojK5P1uZfIT9fJZ+9G1BpLis318nB8h+nHIfHGJn/8oZwzB6wDK
 mEO1O7pVOOVDat9nnW5YDfz55JlAmTgqFnd+/VY7CLdOeFiJ8Ypd+hpnN
 xVRqIM9vvSeNsD5oVDj+YN9ON4XELEqp9cnrlpbZjkWSiNVtdIlyqh+ol
 eNzYWGI8AgTF15gmd9Rqm6gLL9/iQ0Uivza5SINCQ9OlmGUMit8PpBfkz
 WtD4Pmp3d+A8lJlVTVMXfFxdKGzOkfw5R06X+Oj2xtSgmJzsvOj/wTc25
 +20ccIs6+UEp85elB5iPhOFFM4uD/Zm9TvZRI0GG4V582rHgXRKYkJu+I Q==;
X-CSE-ConnectionGUID: ubs4ERSbQPOshKOuYvqrzw==
X-CSE-MsgGUID: +aS2qpnrQAWgQo3TbQaJ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22132532"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22132532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:15 -0700
X-CSE-ConnectionGUID: ejDW5mQzTpimwnd7u2ZRxw==
X-CSE-MsgGUID: 3mJAtzJPRKa55QHnuvvkSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60488100"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4oJYf8aMTepp09KMPPrkfYQ0pPPkEKNd+Swgqiz+APyKMpFZv9qXB5cmkg4KXJ1e/KvB1vBHF+UaVVAcEgn6QrjtitSPNolH0Ti714+j3VUcB0fnCuDjFNRpSGkhClTmJsUONxiXzP3eRS70qRuLRhQVIIz9AgtvcRgabetk3MeRF6NATFXq2Yf/8vK8ThLgeNf5TL20WF7yphBSSIfvWhaF2EhXJD6Byftq2XjwnjijZ52+yYK4720kecJwPy4+oHP6XUjUcFgwOM1qvd/qXgPUatS1S5G5ZsY5TMKFmqpkeRwDPx9EnCF2VqVVprqpaT6goRmmLaqMnpVqRhnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FO50NkjQ9brq7QhWbHrKdEgDDiYvjYMwBB0ERjvPwG8=;
 b=ZSqZWUoiPR2K6eagIX+aOmm7W8FMTFFuuW2IVGDTbfdoyDRUfGhYQYM5QepDVV1EsY5X8rTHsOQXrs/5MGzRMv111SawlHDprWKUexZ+fIGemUuoLCF3mOOFggusbScxRbe1VosWJFmfdjrrUsUZSlYj1BwgB85QMl1iohbCfkXfnicxLu6AHOM4C74WZKkJqmZzPPVdY0Z+RjfVIxVXRrgmvDLtGu/RMEjY9eKHCSNtwWjs81QOYBgWA/v3HBbWmH7rCpHZD0g5m9pCDhQdUGfXzP/yiuBMQUEnZFR3EfdvDujjaEUn+5RqzGW5U/ezQ2oqUSOxf7nTM+zIOokUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH 10/12] drm/xe: Refactor xe_ggtt balloon functions to make the
 node clear
Date: Tue, 20 Aug 2024 16:25:45 -0400
Message-ID: <20240820202547.300257-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0361.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::6) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 572197e6-07b3-4642-898b-08dcc1565489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PBGs65EvwHFzqnk2tDEtZBCAvV92xcAVeBWbhVS6vwMsYNyz5JaHr5ogGQfU?=
 =?us-ascii?Q?ukFgGLFLVbg41Nyu3y/1l+dy3sZwFR0JTmo5fH49tHAputCLK8SE9nrXZB2J?=
 =?us-ascii?Q?jma2fMjxiZrYrSQGgtThrTdcsSx29ysdDEnTI8HUrq0IGP2yvf91NaZw3mIz?=
 =?us-ascii?Q?I+eazz04M/SrnFrfNw2nHD6MSYGyADJRArxjIEgd6vqgvzSZqQ8aGqtRKC5V?=
 =?us-ascii?Q?ZPtsvpTwqQIhhHC9eh9frxIQ231iRFTcqC8KTaUg3lfDtyI9eksrP0i0q7ey?=
 =?us-ascii?Q?LypW5HEPfbH7vUlkmJPbdgq8CLbVbNSmq9/7++/BQBo/pu5zCHYwI7hQA5VV?=
 =?us-ascii?Q?l+RrKlP6BrT1guINCR4uS8+1MTyxH4y3DaXVDcDTZcY1qdGQ2Ekcs2u3P32j?=
 =?us-ascii?Q?PL5741uUhy/hQK97bIOjmdvfbGolGeYSzHgVFSuTaplEiDG/ige7HKlrYmw7?=
 =?us-ascii?Q?9AQmzYx8l/Nb8Tm0CXLZObiOUdWoh/S2zplwmoHTVB+EeW6KtoK4TlCTKqqR?=
 =?us-ascii?Q?dpUERNmzcFlLOIGxFnA2SeJ5WXTEf5rilXk0gKITEBXgE5Jaw5JfmVaK1X9s?=
 =?us-ascii?Q?GMUhVY74DqM6Cj1w0LIfgKoGhfG/epqrToHMS2nij43an3i7CEhtS/ravHxI?=
 =?us-ascii?Q?MnRdOP3ANMGbLOMBmhd8Rth3uvHalBaJincmXQwGTEsRvRinH3gZmDDDbTVF?=
 =?us-ascii?Q?/76hHkVxFYP/5kg1m9ZYw1p6AmpH5atPOD5UYdnGwMKmUelAtV/LiHQHagHB?=
 =?us-ascii?Q?Cvr1MBW7rdW+eIXpo76t8ihxn9oYgIkOYjiwDp7aj02qr1cIeGxDp1dBhr0h?=
 =?us-ascii?Q?Xc+qqSmnBafdH4Mwip+3LA8+dkxYnX5L0PBJwX3nX9rk22nbTcxo5TpAcAJS?=
 =?us-ascii?Q?RzA/CA5Tqeb8WEgfltrwZr86DPv3Q88gFuuWFV5uEjHbs/gZD35CSrPEoPuh?=
 =?us-ascii?Q?aPro8SYFCLKK7ZYMJfRCwn6aEueai9PRkhSj5S1QVkhTMmXGlRJx7TwXRV2s?=
 =?us-ascii?Q?n3PUm7lqf1mky/6XGrCuApKANyblq4i/xeCfqtWa02fLRwHxoUCLnO1Q/6PB?=
 =?us-ascii?Q?xJRAKo+1w/feoyQSOXVS4v0l7cq2zIo7ZQVpzoCNeitmgRczdWfniIkSTYqY?=
 =?us-ascii?Q?gu1lcWHGM9AmzdGtrJqQ04cqpGQFXJ5N0B91Bo5Z1PDlu4EZaR5ybPLekBCD?=
 =?us-ascii?Q?k+vQNt/EYN+CcuVchz+eo2AV+FBSkK/HQ/qdS8oXpupcXTqZSiFZ85b8E+N0?=
 =?us-ascii?Q?UiagW7mEdMZS8kzu/Bc1TCa6B139W7y0pkY6+824hCA/D0D4a3KPYN/9Z7NN?=
 =?us-ascii?Q?bfIrk7zJFdzK44rheKK4Ru4o4oD5S7UBHKEzLmXjUv5Ecw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7A4Tb+a649a1Ct/VSmw21vCXdKjJEeDbKFx7IDScIfpXxl2lneaEfsY3U5F?=
 =?us-ascii?Q?kKvTsYsI6v/2DJ7dNScUM9yAcc7NNTzxYVO0JxTy0Eme+qE9dsY8dcg/XaXs?=
 =?us-ascii?Q?69M2nmdT4KvC+GwZLLqTKRmM5tY4l31jzVgz7YJi6boVH1Z3v6zN6rQJvFqe?=
 =?us-ascii?Q?wM8e0zJOhE1otXvDZRqAmLVY6GqRktrVxjhne/W3POHjwwM91HPlPlu20UCP?=
 =?us-ascii?Q?hFv/ckzoNx8FGakGUUxy6/L9B2hfW3w7UjQqD9M+7tiD7S7Q2nXAP4W058Sf?=
 =?us-ascii?Q?LvxLvT+vIt42wNGOCb/blFWrP37YdfMb3Iw02vzf8IoWkRfBl/Omy5jMIz07?=
 =?us-ascii?Q?PnTPdLlgwzDn3RuWdymc3QI+ZQd09tc4UW7GGSJMnU3CAzqL3X5111PssTZG?=
 =?us-ascii?Q?Z1n4kytU8Dtx/VGN/2wZF454EZ2o03Q6E0v/Ky+ZTndsctWljczSlMOOZclO?=
 =?us-ascii?Q?+R7uQ7emIdOtg7iTnGST5yfVImfMiJv7S8tQ2TBQ6f9uY3gXgvogt0T3k3Ob?=
 =?us-ascii?Q?wXJeifOyC1LN8lGMCR09niCA9liL6FhQCEUKebCYJDyITlK8qp7melW40yX7?=
 =?us-ascii?Q?uYjV2zKpzYqgTaOhW7CWTugg99wGJqgm25MeFuzJLaSFMljUqGODz0yvd+Bk?=
 =?us-ascii?Q?gLPDTbzxvN6+nAyKqusldEuIyI3GUUNIum1DjQlVnoi9t5y1ppVC7scSvtAM?=
 =?us-ascii?Q?Zn6x4lGH99IXRk+u9MLamk+/JnIKF2LtxKOE8vFN1RK/P6elKp1a4hiPrwbQ?=
 =?us-ascii?Q?+qLO4YoFD3KAtlqJebap9LOrF7Snu7YALqAMj7F57rLj55X7ovVn/wblaiSv?=
 =?us-ascii?Q?mC756LKDUn9rxoinKB034FZwozb4VPc90645sPp9Os2uBX5H4k0EE8YIOSna?=
 =?us-ascii?Q?PkoQFKq5CZx55dFSVNJU6Dr2pVoVQN4qdI82cFH4Q3KHl9enMFaqAOzzTJ7L?=
 =?us-ascii?Q?9op2oXoqzVP8JLuYC7XBS1dqWsYNHVSotHJXHDIU6cyHB/SsUB+s1gHChX8z?=
 =?us-ascii?Q?mY6ouHHS1vYQwp5PF5TVkO29dOzoJz2i1fbEK4C3MJ8azAKsmBZecagVpfSk?=
 =?us-ascii?Q?Lp6Zz3FnM7SHBE0ll9tWAZtpR84DUkc2+GAkspLCi11TtXmfrrstS6xq55mO?=
 =?us-ascii?Q?suUDeROczoaMH5ex0bpES0M9I62rSMx0MV+//VVjFcrEIixnfYbR0Sh5gLYt?=
 =?us-ascii?Q?Isiy3fjJr0ShYpMXexESPbG2MxhxyiL8LQMzZOGj8eyCyGThhVuzjZnlDzQA?=
 =?us-ascii?Q?4X5WqsZrq/JpF6MaWZj9DNMA7AcTbpv3XuYsMFjCwbXrYrwnaCUjvQRCWChz?=
 =?us-ascii?Q?wj8Cn+3js3tqbUUGdo5L6tPG6h0I0V06Eji5HRW8laYSNaFIaWy4PaRdhKzl?=
 =?us-ascii?Q?mVthRx3+xpXvpDoIEbxV06+Or5VtNCFduk92OEVcxJgVo5CRUdCiBEyPGc1A?=
 =?us-ascii?Q?R1v7GP6ubDMwiUCOXe8G5nmJxzb2Wf+S0bCnbv33ZdGQ7KDM6WEa9Z6WLPTO?=
 =?us-ascii?Q?AdfqgE9u94DfgSqgRaF0c4Pe7py2rq738K8fXPj59IiAGR1hv3G7MVHJIDCk?=
 =?us-ascii?Q?hT9x58MLdYSjaObYOa9qTMeELLIZgI6LDeyu8WWa/AB1nx2jbZ90h9lULgaa?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572197e6-07b3-4642-898b-08dcc1565489
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:11.1042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHctRgFzesm7t27w6y86ZIKAV2zdLKeelAEjrqHuOGXkUGglp8z5suPsbciIDgAGqoj3dnU+kAeawH9jhVLuvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
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

These operations are related to node. Convert them to the
new appropriate name space xe_ggtt_node.

v2: Also move arguments around for consistency (Lucas).
v3: s/node_balloon/node_insert_balloon and
    s/node_deballoon/node_remove_balloon (Michal).

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h        |  5 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++-----
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 960f5a28b7ed..d21474715bdb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
+ * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
- * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)
 {
 	int err;
 
@@ -384,18 +384,18 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
 }
 
 /**
- * xe_ggtt_deballoon - release a reserved GGTT region
+ * xe_ggtt_node_remove_balloon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_balloon() for details.
+ * See xe_ggtt_node_insert_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
 	if (!drm_mm_node_allocated(&node->base))
 		return;
 
-	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
+	xe_ggtt_dump_node(ggtt, &node->base, "remove-balloon");
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_remove_node(&node->base);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 67ae5f1602a3..e258a4f381b4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,9 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_insert_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				u64 start, u64 size);
+void xe_ggtt_node_remove_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47222bd9988d..39ff4e7f902e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,8 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0],
+						  start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +537,8 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_insert_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1],
+						  start, end);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +546,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +557,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_remove_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

