Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DF5C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B401A10E358;
	Fri, 14 Feb 2025 17:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOn/YKZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CB310E358
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739553940; x=1771089940;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7dsWDx49Q/s/XGeg2hOXYHPsA+RNA/Rx9c04FD7vsNg=;
 b=hOn/YKZ6e+3OX2DEccLLRkCVlNODaltBZnfvupgWUQzfuTQHgBEc++GV
 KQNPBoLIbODajuccN3XhjaEzdyDNab2p565pGj/igJ1QZINTvZk1mvBWq
 dAXJdO1HDaAKlVBHGUHXKQ5WRB9yjei0fkuo4UoW6uxSMsPAaTCkBTWIV
 zmbcyhKLT6z2R/Oyhdia02A3YHqlUQrk5gyyqbJT2V/DzIppA9EgKu6Ok
 G8zmgUaw1p+FInEjfYh/nvQTLlZuKcF2GBJQ4fMRTr2bjFCb33DCp7r4A
 G/AbWLcb8RjamMnOUMd5VKeouU2LFfMwrxronRyOKDBEB8E8IfpeRKl8z A==;
X-CSE-ConnectionGUID: G9uPki6uRGuN4z0ZqfQLtA==
X-CSE-MsgGUID: wwEUrYZAS8Sr7iO0qCQFOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40020236"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40020236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:25:40 -0800
X-CSE-ConnectionGUID: Fg1TsSfGQRSRtkWJRfrgWw==
X-CSE-MsgGUID: qNszEfoDThes+1LRjq/JPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113373287"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:25:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 14 Feb 2025 09:25:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 09:25:38 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 09:25:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak/kqVVJkmIEzFbde/The8QUqmhu530GOr9METJ4olZX1kc1lBwxymec8/2NUBHywxTlNxYMEGrIdS4dcSOwZadUVkQ9Nl3rsFJ2SzcwPVeat2j3PLZmtCi17DTz/ew9YhfXAi4xLI5sRkBvcOg9ZL6Ekx5J5551fRwWKeasgF56HL2UpzjpCUB2VVxTpGXsaQRKSNqX76CJP8pjXKoC+YBFqgpcwv0qGbfT0erD5zOQErP1veQHulAOOu5yrzbJXkVwNkDrvzMvYnJRqrqLuV+lEKfkD6/NBUBAp38UTwI+QbRyVLXgI4Y/WyemvzOWXE/k+JDVm3MAffNIMx2tpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA7wPdzHCpFGwgVRs6w+EtiK3FiEUy4Up/4PoJ2Yb5k=;
 b=fw6WdW+FFlzb5nzcamYIDm3ise9qi/QBjFOiIkjSSxkg5JQHWeRUDKD6nswB5T0fOtyGmqElBhgY0hxnIc2wK+4gmKocYx8q619t9dMj1tQQkJ8cbNzjINQ2udMkQXdlmxinhcYdwqkKg0P6neLXR5veaNBU0M1gIzaIRgRrS91ccmNn3p6DfmSedyT7zBjHi5VXbwztw1JXkfDSj59Hv+q0/B3bSS66XPP6wpEIQ0MBdgPL1e+JIJ5zdeOuKwOu8cWpIfe//2gvDXwhrhUyArdmhsX/alRqci/8/R+kBPG/7kkLBYSrtvXAymX4xGAty3/VLNJYCiPFcomkot88xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 17:25:07 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 17:25:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
Date: Fri, 14 Feb 2025 12:25:01 -0500
Message-ID: <20250214172503.502320-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8818b3-984f-4ba7-cdb9-08dd4d1c8691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n2pQraTkLH+ZIsQqhtWEtMUixXQgCO8MfrWEyy7+5934nvnA3ILvQiHhUDo9?=
 =?us-ascii?Q?yLSr5xntewaxOXrxT2PW5edzvMnIbg4Oeou7lB2brzqNeoT0SakNJP2vxnCD?=
 =?us-ascii?Q?ccbHzjpszV0mgy41dgrrVdUBm/spjQ1KcrdL4jgddfps909XbOg1oI71Yi9Q?=
 =?us-ascii?Q?0RQdj65aE6eN77Ez05apVksAUM8pV7SSo9+gU1d+c/gWbFKkA6+tG1p94UAq?=
 =?us-ascii?Q?qiuCbYQqpcEJPuDoJZBhww+WUt6GjAKCF55iIohaRKjHcBaNvJ907SyL8c0/?=
 =?us-ascii?Q?QAKycPeJCGec9WVt7Ntbwh3hfxKLPpmS/Ss6Dy9GYy3hrS6qrM6mTihZ2++M?=
 =?us-ascii?Q?zWF8X+MDkZGdL2y3LuEkBMzS6ABYkfreHFbDbIfYM4VY5GuJzG/hV/BoJQiy?=
 =?us-ascii?Q?eHXUA58huB4MfhvW+n4c+8eSqKuE0+zc4gfHPoZagETPrsVpjOQE4HTrsJhf?=
 =?us-ascii?Q?o7iBXpFZumFFIl/8YTOOVyiuTDaNucuH0zPW7KKb9n2Dnp3jseXBrojY0kuj?=
 =?us-ascii?Q?S9Ffwkj3/BX/7pOCCDbsXEPvjZAbDBchG/6Si7B4Nmvkq6vH8gjfqfOnrBEb?=
 =?us-ascii?Q?saV1Ig1QHetiETEEdiCF1npOrwqP77/VNK3w/SlmKgGPrQdDsXxRciAo9ByT?=
 =?us-ascii?Q?+kihkBURlEiEGRuVAN6TIfUoFLJKXMJXHNMlQuJpEDStJlSHTv8kT6FY9ZiS?=
 =?us-ascii?Q?fjau0JkV1Ga85BF7HpcRAkjwqqANgWf7vtl8gjzRK0ttv+UdeRHBoOK8HyCY?=
 =?us-ascii?Q?kkqMQwpTf7K6El/2p5Da1jsf4DHjR8D4QDdSx/h6hGlGYqjrdmQ73/VL8OMU?=
 =?us-ascii?Q?O9MlGLctYE4HCwLlORqnn3VBXYXg6Zu2D/5Re0uvGHuSbJoXic7+FigU/XHo?=
 =?us-ascii?Q?R/HGFCRworMESK/VZszVU6D45VGg1k+pmZcfHDzJQqOdt+6JlxlMIVAIsDAP?=
 =?us-ascii?Q?F81aWWLPkiQjN/CNNYJ+L7c1TMZ0PsBbhn4V7Y6rNGMqRgkIe4BPsF0z+w8Q?=
 =?us-ascii?Q?kYOPjsRm6M6zb6x0DBLaZBupz1I0jw/0Cn7XBeMAFii7Fc7b55CyboNjz/Zj?=
 =?us-ascii?Q?6Q1i1Js/fWDIKUV4xVQb/tFwsEAfuB6CSKxYaljW5DkXVxLMEUEn4Wq0X5v7?=
 =?us-ascii?Q?55XFZxqoq2miL1UerHi+I/rLrVBKwYb+QTBAnuXLPEXxG6Rz1tCB6HJQo76+?=
 =?us-ascii?Q?gGGMGdgl70yk2CtU1ZxHSMIlkXbNqbdL0xtu8lGJgRQDZuiJZAUXD2bE/VCz?=
 =?us-ascii?Q?7dirzKyfVII1v501WGkSc8SgTkTD76qCbcSIU9sqV8xdlR178QJV9Q6C5BnE?=
 =?us-ascii?Q?0iTAxOmavC2yOUZ7HxP2LZtgnV2b7RSxWfU0N4UltrV7oI0xro7A0TNVCP1H?=
 =?us-ascii?Q?oz0EY3WJQ7R4oW/xFf6TumBZx2lB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nxs63vU01CVC8h3z/n+EsZ+7LA2EEFSo6sfgg20oYLf/L42mBDhj2C5sd3jG?=
 =?us-ascii?Q?NJyGdb1Hza+t/JZ4f9byUrxT/AoPEkAszhOfspQFqBf8pe78EJ/AJqUL/Ja+?=
 =?us-ascii?Q?PykYYT7GQzVkq7mp5OSAIkwYZ/GOcnK9Qnv7kOidik8NeN22UtcV93GI4uVm?=
 =?us-ascii?Q?aT74spVRvuRnZmmaF+n+y7krHizeudUV6Vyo7v2ZIq8YVjq5eZMUci0Om804?=
 =?us-ascii?Q?DrAP8iCstT7X6YMYbeTrOMUJkK6J67uU5WneZiq5gOQcTUw0AV8Qsx2GZ1v5?=
 =?us-ascii?Q?OJz7wdyefi6f61EqIX4QI/3rVHq4yxo9iUvhwgOmfIStIzCWTBdxwdBuU2af?=
 =?us-ascii?Q?cV9HjF9Sz1yWWhnMzlsYJ4U1INDp6z9ibcEaHdMziCSs1tjf0RpKtrLzKJAH?=
 =?us-ascii?Q?K/Jv2Yg2D+oB357VBNVRXVWg/KjIRbY3wylyIu7RAHPA2MXhrtKUbG1+ZfyA?=
 =?us-ascii?Q?LlF+clJC7kaFVn5nMeVwYBM4j7QklC1qq2zNomsnp14WfLAqJjztDJQwUvJB?=
 =?us-ascii?Q?HMhQ8+n/jmdn7YYGabDyrpKxjmxWvsbSCfkYX+UVKpkpCAM1DDPhB9qB9Vd7?=
 =?us-ascii?Q?I/5B4Ny/pAOKYwOvIPEf04iXlZ+4WmYD7zqDr6siRJYNF1TjPhrbAYINdXtb?=
 =?us-ascii?Q?qV4HL4rJRydA1LLTQxgftqI9oiwKVxaxg0L/bOL7BnCfdYSWEUD+HPDmWCa2?=
 =?us-ascii?Q?QnqHNgE1yVbr0g+AojmzC6M1V2UhgmzHoJjwIxBMxHv0k9bXbu5TrCwh0E0l?=
 =?us-ascii?Q?69zYdkWtCFSzvoM7pdHwIZGy06hIsW5v5w9mQVR7AmREznyrDxFd473MnLUy?=
 =?us-ascii?Q?d8Oil8+y5RIYtuMjuRYsBwQpGXBkIVHeRQvNCLFOcn3zD2GymnBh9RfpkLxQ?=
 =?us-ascii?Q?O5Vllvfrf7Bmes6LWQxYtSMas1V+lw4iOsPZ4oit7zDtcMFcKL9fhxwk2ktB?=
 =?us-ascii?Q?OIzBX34yS8HQsFU879aY4TzXs7GKbcyhU8lU3eqMkxuROhttrMSybil+Rtpt?=
 =?us-ascii?Q?6c20vDnjPHe1YGWm4AwlxTUsk2nQEPKW7+u0BQ97kHAUC8yi18/rpPsoMcSQ?=
 =?us-ascii?Q?mxB5Nj0BD7j+9MWARdFnMH69QSaUX3J/uJy3VAHtXpg1WjpWdvQEmUYRfPKr?=
 =?us-ascii?Q?9N9jGWUWkzeVSnDUqzcdmFZZ4MpK3CgGCEh3MjzSsU6Jm6dgSPelt+UUg61h?=
 =?us-ascii?Q?+0nYuBXabXYCaH+tiRDurslrhWET+YjDdJFC/U2cqXJYBikjjyo4pxCy5JN9?=
 =?us-ascii?Q?Zwx/7gLOGeI8BUL6bHdR1rB/OwkHJbUuTrglXUktu8mt3EtPYRiTUpw7tfFa?=
 =?us-ascii?Q?wQkCNn0pEp3fW+yWhuhSkcqoQk9MOwEuDEDn/gXAMPSeDLZ868+6zxjgsDV1?=
 =?us-ascii?Q?FTK1PUDfmFM+s7FITO4b6Bch3WcGbS9tiMRVaObMdefjZcE73gmDUDcEHUeY?=
 =?us-ascii?Q?fHlb2cgbYFHrMBQ1iSEgD+FSa95QPHIrjKfHgvZJL24KiwC0Ad6/W+ILKOPV?=
 =?us-ascii?Q?XgllWlTrhl29LcgSlWjf5C1OyHKtc1AP7VjMicsA5X6dxz4LgMarh+EV1zI8?=
 =?us-ascii?Q?w0lqiXoLbg9tSwrIJvpdvA06Yu1A/JwzHrHZhB2kgQAlpFke3LMYgOvZeGfa?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8818b3-984f-4ba7-cdb9-08dd4d1c8691
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:25:07.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erc4XskepuquSDvGCFML22Lvg3AzP7rK7kJGXcnIlzhHKju7xjT8wnUPHoAAnuAZF7M+HFamM1ZhBg6s8XA19Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

v2: Keep the precision comment (Jonathan)
    Use a define for the regular SLPC reset timeout.
v3: Improve messages (Vinay)
    Only skip initialization if the second full-second wait failed.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 02409eedb914..74cc13012532 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_throttle.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -50,6 +51,8 @@
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
 
+#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
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
@@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 	};
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
 	return freq;
 }
 
+static u32 get_cur_freq(struct xe_gt *gt)
+{
+	u32 freq;
+
+	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
+	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
+	return decode_freq(freq);
+}
+
 /**
  * xe_guc_pc_get_cur_freq - Get Current requested frequency
  * @pc: The GuC PC
@@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
 		return -ETIMEDOUT;
 	}
 
-	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
-
-	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
-	*freq = decode_freq(*freq);
+	*freq = get_cur_freq(gt);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	return 0;
@@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
-		xe_gt_err(gt, "GuC PC Start failed\n");
-		ret = -EIO;
-		goto out;
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
+			      SLPC_RESET_TIMEOUT_MS)) {
+		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
+			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
+			   xe_gt_throttle_get_limit_reasons(gt));
+		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
+			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
+			/* Although GuC PC failed, do not block the usage of GPU */
+			ret = 0;
+			goto out;
+		}
 	}
 
 	ret = pc_init_freqs(pc);
-- 
2.48.1

