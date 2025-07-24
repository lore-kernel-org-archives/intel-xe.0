Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C882C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 16:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A65510E05D;
	Thu, 24 Jul 2025 16:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SA3oL0eQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2410E05D
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Jul 2025 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753372922; x=1784908922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lw4lXntFgNvNasZf04D2BANRWHR2H0JRC2/2Ve/Vde8=;
 b=SA3oL0eQPrJjDspd2b8YIhrNo33IJHQxKNpY3z2a8rHIDAp5pibVlL6N
 VRrR/sdxg1WD9YfBTEKr4TDXTNhqReW/rn+bP1rNFeZYuLf3alEFwupYb
 3OGd5AoZ+WAQNNH44oubaCX2lof8SPfpPS63QcFfyGYfgF3nn8o3qRiRM
 P9gruPh5aYHZwx3oFFj5gaxRG3Gka3heJhmYSF+Q2AafNBtbBJUH8mD5C
 azWl3QjEkRBjMfDW2XCAnS0NK6sbThjVjt+tM4O3W3rveE+9ox2pMqyqh
 TTCUjdLkafr8EkMEhkuFBn8TIwFoIYrHo2Ae6EUwR/OJNxiAZ1+7iNroF w==;
X-CSE-ConnectionGUID: a9YuD8qnS3uEUOVQrKqqdg==
X-CSE-MsgGUID: huF0wCbbSPuKzpXrMBiL1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66261182"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="66261182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:01:51 -0700
X-CSE-ConnectionGUID: uxKs0ZpVR1qhHKfuYwQYVw==
X-CSE-MsgGUID: 0ld88i20Q6++I+uGjjI3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159894043"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:01:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:01:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:01:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTI/D83SD9gZYMw4Qs39MD+0RQZv/XHJIoGihwiyDfsaYcSxWUX2kdEO9qwB20y06g1TovoEQAweE9vyEjfi9vPyNl8BpoELYO9Rv9GLLaBnM7r82WoyaoUJiPzIe7MpZktO8ZPqwK41wiryRIH2bZHskFcvetGl6RE7hmvq+rFMQ5p/nyNzITnfJniEGPwnCZyRd4GCb2qiG1i7M+L7jTHrCVdwnpa2SG/ThhgTiuSW9pFbIgJDlk1quYLlumnoLhKUFscNxyAL2vUVW+WPB6glA+t+Xq1d/c+RMNvDs+L8qW8m03jWpJOG6KVJ8ty3sXteEb5OCaw141mdFuEr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYBP2k1BQic0m4FZofx5YgoYndO6/CdQjHKhUbnqG7E=;
 b=PekbXflspwLUtguQgXFnjiPmaxn7Xxd2UMXMgkSDHau0N0ea6E1IJFj3uY7PPRlZ0f+XW06SqP1jzL/9/c7aIccwQPO/sfwdXmBmEla/NoyL3D6/I7Vx+C5O3JTr7hJbgQ1g1AqXhKbTYkEWyiYc1j2apwCFG1/ZePEYAuaJXFaYJoGmc/1nbPY8IJfYsy0L5x6fZHbl5qmWvpN2iSDZ7Gv9/ESETqRWoqdgdvrnYhNWGTUbRxBC31mm06kiVWwFjFRtDuuHRRuMvOLr7v/LCmH4O/4SKD3rSc6QRxrw8XamPT2H6vVrCg9OlZsPun6XloBNGS0rE8C9SNLxf4itpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPFA5F77FFEC.namprd11.prod.outlook.com (2603:10b6:518:1::d40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 16:01:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:01:47 +0000
Date: Thu, 24 Jul 2025 13:01:41 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Message-ID: <hggwhghy5gaaycd6uxxocxfuapykjy2d3kkkiqmgr5m5rsbe6n@yhmpb5zu2sv7>
References: <20250723212020.3678133-1-John.C.Harrison@Intel.com>
 <20250723212020.3678133-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250723212020.3678133-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPFA5F77FFEC:EE_
X-MS-Office365-Filtering-Correlation-Id: b091c9a7-f10f-4c48-194d-08ddcacb6459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z1fITz+5qC3BbIhtckpbj/GG7zB7oCYwBOBhgLBTuHIYkb5onfhsO53QLlPh?=
 =?us-ascii?Q?5HBdi5pwQ9iG+D12KD06JoBCiafaXSdnSOq4vbyyMHHE2KarWxb3PQfSUKny?=
 =?us-ascii?Q?SVNdGBUqXexCU/z4Ut4K5TykHmrOHR5oMGK295UL5MF91ib13blyPVrpazSr?=
 =?us-ascii?Q?mNE/ukh7gUTUTY1cMfQX0oefbfhlBwyX7Ft9IKjU2f+AdpqkT5qSFaStdb1c?=
 =?us-ascii?Q?JJNKrs/o0ZqtPG+R5p+CpseHNMcK1XdaSyH0up7yWuKseSbFsAXQGfrP2AnS?=
 =?us-ascii?Q?i6jj5BfgxBz/MjPrKqFM3ba2wmCwpnXm7rUW4r59yubbR4T9hWg83n3jXMlY?=
 =?us-ascii?Q?oneFF/E6N83B2uLhBHklcAWs2oVeDBO9UqiOYzh5I6LH02VbcaW3K8kTHs1V?=
 =?us-ascii?Q?Bv5BBiCNMTnwqTXjASYSeXFJvfkzYEH+TOMwvs7kXI9NkRUZycEMZuVLTxQM?=
 =?us-ascii?Q?L2RrdoE0rjJhgax41IrkNHgdpzbYLY86iz1vS9kLDB2fOHsPJvKC60y+LuxW?=
 =?us-ascii?Q?PDy07Z4gJGZrFYTbApyRcIyDFOHmvD0Z/PDp93+FGzKwzFtnzgYn9sd/tNDn?=
 =?us-ascii?Q?t3c+RYPzVAfh53eUdtMu5DVNwnNfjmoQgEeLGUxO9uB0hLuL7vOs11bgCXsf?=
 =?us-ascii?Q?PhHSQ/PAQ9nanlVQ0hBPZvZAy5AfA06+/zN0X2B+ByOaDhpB268JYj1lWLdN?=
 =?us-ascii?Q?i+ZjRHUKLZ+9WBgN+uXNHVouL69n8JSCUskP7ZgP9KbKm61YJw5QQAw5q8qI?=
 =?us-ascii?Q?6RB0tz+ZeNP9ITc1e5IYxcQdDif/qHq8YvlqrbgJYFtfmQI2dvYaRgnj8OZx?=
 =?us-ascii?Q?AHE2N3pqZotQNe9f8uvIL4J86nwgw4HEdcTsIAZC4pIfX7Gbvo7Z2Cj41AAa?=
 =?us-ascii?Q?ZN8squPF12130QwOcPxK3yb0xu6qc9B6yNIxpXdLuu/voA1vxhM9uBWBcoW8?=
 =?us-ascii?Q?nhKHeAZm2zz2B5UUFSA1/HSvYnsTfZjf/fuaqqaNHzitbM+1ZrJ0uCcW80kZ?=
 =?us-ascii?Q?SpyUl5/eJXcAB2x7LG5U1Zir3ys9Lr7ooK3RBlb4vDIYp72NTcGcWR/LjvEB?=
 =?us-ascii?Q?TVjivp9MDK1enE6P8rQ62F+8Q+pMZeGYqGDkySyOr8BGmGmUsmGhtpKu9ga0?=
 =?us-ascii?Q?K2fhvzs98S3ancjnftZQ9Pur8zJtw9ONiXJedsr1yZiySioKYAbou5Wvnaz2?=
 =?us-ascii?Q?r63+VPpjXdq/gXg0XuTASWzmtJAzT1YbXD0Xvqd65DZeSH6rbIdcE9j1cniS?=
 =?us-ascii?Q?+ZdCJ/5YxQbB9oy/HI/5aD7BE8XfMbIo7Cmwz5bqFK1FqjefVECwB5snCdxd?=
 =?us-ascii?Q?ONGxJA/evHMk+CvWDJ4xf5//rF22KQPSeaxh4pBuNGd/Y5w54XL/8qpvznJi?=
 =?us-ascii?Q?5KnE8N0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?db4BZ1zbfrGjfcLmffHogOwrdla7beMW+GRAoxQGfRMfy0R0sl5dZKZNCPJd?=
 =?us-ascii?Q?IgiX+hTiQTqA3e2eCrkhVNSEsHdYf8Ak1Qlvel04o+tgvZg3oulqYda+l2oW?=
 =?us-ascii?Q?iq1vEIWQgFoz0qpThsvpN77yNkhfVogNud+BuHurdI3NPnnk1A/xEMCWR2V1?=
 =?us-ascii?Q?0kiJFFfQbpAYaU3hF8MmvAUGBVEbvMs6jmf56ccQ+HJp8FFui57cc7KgaZip?=
 =?us-ascii?Q?7jD9HEbngXgtZESgWXT7QsI94hCjuUShK/1zh7GjrtVI7Rzm79VEJmxx1DFj?=
 =?us-ascii?Q?23QhIsNpBStFrXmBotWb7sPSxcip49sIWDiWkJrX1iNtayPynxh2X14yWTnZ?=
 =?us-ascii?Q?r1zKAcav2Z7dUNp+d+46nNCjTnuNzN91CqEoR8fuTDnwGRwJf7jwBHgUJzzI?=
 =?us-ascii?Q?I0s8xwQj1+JWKh85ObNxPN0UYaTbTDXFmyvjuaVlUcxYSz+a8/3Qt4ZQBz5s?=
 =?us-ascii?Q?Soh9xAGjut82ZCBrN7d3NApepk2yWFotnPdTUVaaUilnyGyLcWsuvTykVQf3?=
 =?us-ascii?Q?n8cTiM9GQGGbHVwUcp9PGNmUA0Xs2BuOiU1lxhJa1bWY1UPiC5hO2rRuU+QV?=
 =?us-ascii?Q?bFUuCmaOiRzp57N3jnszY9HyCgnp1JtH2U6YvY6LhEJv5L+LsZofia1o3/NR?=
 =?us-ascii?Q?TE0fxWjESdWG0Vbj46q4VBqKGEs4PO8RtzjfvNowk0KhcUb5q3Z4eM3GFOOO?=
 =?us-ascii?Q?oxXXKt7QQbMgUgdKruowopPd6e84psASjHDQNzsTxZVnQA5eT0FzsHUOsk1j?=
 =?us-ascii?Q?8c2rYH/dS7gKh9O+HKGrpZrgq4dIK3HWAQcO3J7WYxa1WRlHoBfAjomyBvi5?=
 =?us-ascii?Q?+0x+c9b3k4C5qOSEQhjn0pOVfXiLnorFxmQtmkZRxFDMThcZAY11FJX8TnMI?=
 =?us-ascii?Q?uGsFtRYEkufsl6Ss2sqWlUkF7geSwLKXQEfUGTMRsn4JSUIgGXf1VGb2HGEU?=
 =?us-ascii?Q?eZPRqgVgEsycwApkLegHC+n5sFnx+W9c8ANTE/wSJQPKEMVmbnFE74tmAn4f?=
 =?us-ascii?Q?KONSweBQA9qotNuvam2BIGTX2581C1q0hgehaAa/CRs7gsXEV6xzDGRuVWlz?=
 =?us-ascii?Q?f1iXd09HOWreClEshhWDAttqFJh6K1d7ZRaHkiVOp7H6//ksykGyUVbfNaf9?=
 =?us-ascii?Q?h0ouojuIIfXFZ87+9uJ16et5wAulo/bMlZZvK7br/eF8O8wemwMynkAEjHo8?=
 =?us-ascii?Q?ipZWj2YLAV14OlAjbyyHbjew+y5jIVEQOkYeL002g6W+s8QwyY2P3PjlwuzX?=
 =?us-ascii?Q?hXuipqNTuuhwCPp0FRdaSBrTLhmWNJyi0wTqiT9g6BKKVTsmxowKaEWRGkkH?=
 =?us-ascii?Q?9peAJDSpnV1jGRY0rjcLQirHaUFdIIOMYTr2niuAVR3CBmNdM4Jwa0yIRyYj?=
 =?us-ascii?Q?ad92vCJs2jWqjFgOZKiTU28ITsZBnhL83RfgbBxCOeqTTbQ7sX6u4xq2FDv5?=
 =?us-ascii?Q?7eDd5vbgFVJ33uXwWjUuaLDnUdeMjzxkiuEWZKQCvCgABPyrqHiRR4GgTWtk?=
 =?us-ascii?Q?slyGp1KMliztSqpFEstgEmHagBaYYQV9uSxodkp57klcB/i5VP7pRHWDiFWm?=
 =?us-ascii?Q?GGzkKscIOdiepAETwtA7pJ/6wMIlyN+PFqEzRPceOP+Wh0ewOJrr8wUZ5mWn?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b091c9a7-f10f-4c48-194d-08ddcacb6459
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:01:47.1957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3xnUAN4YOwmTSXG2PL+eXVf8KRBffkIimx0eWSwtMY1bweVVxbIBM+YjAba45/ihQasj5xOeKaRcFGTWsjun+3ZgsmhX7WnCNs0+J105RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA5F77FFEC
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

On Wed, Jul 23, 2025 at 02:20:20PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The GuC has an option to write log data via NPK. This is basically a
>magic IO address that GuC writes arbitrary data to and which can be
>logged by a suitable hardware logger. This can allow retrieval of the
>GuC log in hardware debug environments even when the system as a whole
>dies horribly.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |  3 ++
> drivers/gpu/drm/xe/xe_guc.c      |  5 +++
> 3 files changed, 69 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 8ec1ff1e4e80..9fbd7e2ab152 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -77,6 +77,17 @@
>  * available for migrations, but it's disabled. This is intended for debugging
>  * purposes only.
>  *
>+ * GuC log target:
>+ * ---------------
>+ *
>+ * Specify the target for GuC firmware logging:
>+ *   0 = memory
>+ *   1 = NPK
>+ *   2 = memory + NPK
>+ *
>+ * Note that logging via NPK (North Peak) is only useful if some kind of hardware
>+ * debugger is attached that can save out the NPK stream externally.
>+ *
>  * Remove devices
>  * ==============
>  *
>@@ -90,6 +101,7 @@ struct xe_config_device {
>
> 	bool survivability_mode;
> 	u64 engines_allowed;
>+	u32 guc_log_target;

could be u8, right?

>
> 	/* protects attributes */
> 	struct mutex lock;
>@@ -226,12 +238,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
> 	return len;
> }
>
>+static ssize_t guc_log_target_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%d\n", dev->guc_log_target);
>+}
>+
>+static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	u32 guc_log_target;
>+	int ret;
>+
>+	ret = kstrtou32(page, 0, &guc_log_target);
>+	if (ret)
>+		return ret;
>+
>+	mutex_lock(&dev->lock);
>+	dev->guc_log_target = guc_log_target;

nit: we are copy and pasting this function for each attribute and adjusting
the type/var. In https://patchwork.freedesktop.org/patch/665377/?series=151729&rev=2
I decided to name it `var` so at least it's easier to copy and paste and
an eventual consolidation later more obvious.

>+	mutex_unlock(&dev->lock);
>+
>+	return len;
>+}
>+
> CONFIGFS_ATTR(, survivability_mode);
> CONFIGFS_ATTR(, engines_allowed);
>+CONFIGFS_ATTR(, guc_log_target);
>
> static struct configfs_attribute *xe_config_device_attrs[] = {
> 	&attr_survivability_mode,
> 	&attr_engines_allowed,
>+	&attr_guc_log_target,

There's also this patch that will conflict here,
https://patchwork.freedesktop.org/patch/665141/?series=151773&rev=4
particularly if the the suggestion for adding a defaults is done.

> 	NULL,
> };
>
>@@ -386,6 +424,29 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> 	return engines_allowed;
> }
>
>+/**
>+ * xe_configfs_get_guc_log_target - get configfs GuC log target attribute
>+ * @pdev: pci device
>+ *
>+ * find the configfs group that belongs to the pci device and return
>+ * the GuC log target attribute

There's also this in my patch series:
https://patchwork.freedesktop.org/patch/665376/?series=151729&rev=2
Any opinion?

>+ *
>+ * Return: GuC log target if config group is found, false otherwise
>+ */
>+u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *dev = configfs_find_group(pdev);
>+	u32 guc_log_target;
>+
>+	if (!dev)
>+		return false;
>+
>+	guc_log_target = dev->guc_log_target;
>+	config_item_put(&dev->group.cg_item);
>+
>+	return guc_log_target;
>+}
>+
> int __init xe_configfs_init(void)
> {
> 	struct config_group *root = &xe_configfs.su_group;
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index fb8764008089..97f9ad0f9495 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -16,12 +16,15 @@ void xe_configfs_exit(void);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>+u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
> #else
> static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>+static inline u32 xe_configfs_get_guc_log_target(struct pci_dev *pdev) { return 0; }
>+

trailing newline here that can be fixed while pushing.

I'm ok pushing this and I and Michal rebase on top after the reviews are
finished.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> #endif
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 8fac3c518975..53ef93e162d2 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -16,6 +16,7 @@
> #include "regs/xe_guc_regs.h"
> #include "regs/xe_irq_regs.h"
> #include "xe_bo.h"
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>@@ -67,6 +68,7 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>
> static u32 guc_ctl_debug_flags(struct xe_guc *guc)
> {
>+	u32 target = xe_configfs_get_guc_log_target(to_pci_dev(guc_to_xe(guc)->drm.dev));
> 	u32 level = xe_guc_log_get_level(&guc->log);
> 	u32 flags = 0;
>
>@@ -75,6 +77,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
> 	else
> 		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
>
>+	if (target)
>+		flags |= FIELD_PREP(GUC_LOG_DESTINATION, target);
>+
> 	return flags;
> }
>
>-- 
>2.49.0
>
