Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D3CD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F12B10E41C;
	Tue,  9 Jun 2026 16:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGipEs6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD310E404;
 Tue,  9 Jun 2026 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781023643; x=1812559643;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hA23cU5AJjTdrrDwv8so1O9yyO4X8rR/Lq4MEiNzaMY=;
 b=PGipEs6orWcYXLHSRiDIUrAukmC09L67wahx06BaZF5KFG8OukGhFYV0
 yYXnmq/lby1F+v18lYbUVODgwfGPrfdfwaWvPnDIEzk9h9rA7xlDJRAn8
 uRMd+4MEPWE9nJwC27pqMizKSsCPxy88JbjxAHjQbDlChMB80KNGClyMk
 E5kvIqfK9bW0uUdb1e6gM3QIvej0rmQiyEfIo+ZYcAy0yTKTgn2NDhFL9
 ZRSBuHUlAi8aDCtkuOJvHmlztTSKBNqGlEE9HAW2mkr+8xJ3TTHq7ONgf
 22W0wLAQafS0NlowETFGbQinwQgerWu/ONd2VmWXWj/9ls6l2MYmEBvuG g==;
X-CSE-ConnectionGUID: 4J10hG5rQwm8UjLJ9Bcp4Q==
X-CSE-MsgGUID: gScgI1h6QwqVsmgJYHi+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81982269"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81982269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:47:22 -0700
X-CSE-ConnectionGUID: xmn2jf3lSdSWeNyawgLvUg==
X-CSE-MsgGUID: lOkse7d1RnyyOwBg1L+4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="239579759"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:47:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:47:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:47:21 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:47:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBo5E1Vgf6G8fyIFXZViSa6Y0ebigT6gEDYqoaNoibyIO5gylxZoqqUR518nBF3BPodrxNfDGHa9+CXcvl4z3aGZ+FIlrz4tGs7OW4ybilj4StC8GE5xv+gSzqdGjjqHQsRs3JKMKEYF1dzn3P/tsDTeoyMYykXc/Wt7iaRlEMhRVE3qrnFpp20xAoqEnWsH6LfmvmHBbAgYwDeDH4gnD5EC9LPdyNtq670NIccVgLB3Q+IhQ6pvfmB/toI2jV3VpBxNaglcEGwQoKApucq3o3L75e56YvraZVdfz4/wiWIofUFMI6Ye0Enqhwn8OJ/pDMCmZw5tOo43PZELiv3mDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNCVUAQNQbwg9d67cFlapH/SW/pJ8EMnW4ox1xZObkc=;
 b=gFr28rbIT2sGWndhEcBx5ztTFXAqby+QyawScmxhkuH11AZ+sSD2F+c87TnDVNguMBP/sPf266CLQfyY4dpygLfWbUImSweLe62h0bLkJ52r3T6Wi3mahumou0IjxYBbwLBUC6VDouERyPoBfBMPZWpqw23HqkvGdpKdX0HG1Z9P8j4JFh0OhhOMuk36t94xNBZmKaZ00Qy1hrmuHfi2JSPHUclbh49o0OrK1WR7ddBajcQXB6a1YImu3RxYARK71O/QX+0vyYRimLQkrYxRZXRj0ENlLPkWRAn/PgMGl0Q61KAGOANdEN24aXkfJqOlyQtkRQv4ngti4Q9v+1ih9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 16:47:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:47:11 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97?= Xe.CI.FULL: failure for drm/xe/nvls:
 Update PCI IDs (rev3)
In-Reply-To: <178074350923.50863.6713229616353354808@6beec6c84f66>
References: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
 <178074350923.50863.6713229616353354808@6beec6c84f66>
Date: Tue, 9 Jun 2026 13:47:06 -0300
Message-ID: <87ldcnpsol.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: d140ed97-07c9-4d71-0432-08dec646c084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 04sfFr5wiqBwRfxOearM4c2IpirlGxDakKkdAVgUJxE+pRLcC52bjkRI+9xRc2SimM9+hcdqiTRHprDf3RddeDwA5CMWAUU4oq3wo4Mcs5s7uwQQAawN6xMGkp6O5BVluszq7aLO8ujcGOLvSVDVoFhzWGkDxM0tzQeuC9XY4MnpXNWpy6/2PhTM8vqSrqqEU3yvFDnlqC13bVuX0ej/DYsDXUeOTZNPMeeYoGWfozw6bATzGrP1O2EIeKC/ad59YwWGO5OMVJbEvXddr5gaOGz2fnHzsFozE+k72fPSd+R1ilOLrCxwuDsS8jBPNsvDa5mpp1JISRDw8afyKqracOmJ4VS5DVHy/hnQ/791WF7ASIaxjA5tpZMmUdoj6X7vcFOFLZBHbY+1CGhT4oJiPyaoG8YB7HllJEpNfzCwAzermfZyjZmeyho8pv9Mwcq0ew3CZi5HYhufVwGoOcPFS/PZW4La1pf7mb4ZJk2KsM3gr5p+QKyFtSjDkmhtq228hCGFrhnT8/doQQ581Z8mTLbvmjbGvIVrjfefGIx8+/nz7JYgvRvDhz8HVC/x5pEZHkhvsaroh2AdhAQ9uQaNf+pswGNshIOlfdGQmnXmK0PkUC9AH8lrXC0rq3YNmfEkREVkxky8s/11FTt6EN7p7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XH8qu4D1HXTTZsNFVc3LSLlJn2hboS6sQTq0ZoqtBE0rs3BfVTP2hoio534V?=
 =?us-ascii?Q?ABJ4vgni0sjA76jvDZgj9+qG/5cvppPl4QTJzkG9Od2pef7Epgrf4dvTV0iX?=
 =?us-ascii?Q?MKHcoz7ct71VmwwgCLYYlDAbaHcBh8IjSYR7P12Yb7/T5mJCQ+PbjaQ8IH6C?=
 =?us-ascii?Q?NtUzSqpL5seibukKlKXkwXXkUuCrH/EcPF+DFJ0Nq6g22LZYbhMLT51NvaGS?=
 =?us-ascii?Q?h7+WAYEr5F0kLWHXrQKze5Eyyd1O3qq1CgerWbrH8+Ys+MyVrqL2a25wL5hZ?=
 =?us-ascii?Q?pxXb+NXlkhU0uHCLx9NtUMKsYirxX3dx0n0oZS9/TRWQ52mQgIWt49UHdV9j?=
 =?us-ascii?Q?AlhrA10BWW4Oyb+jwCR6LXnWHDGOm8Sn7ahjLsmM4m4m0ovOUHP7tTLYD6qz?=
 =?us-ascii?Q?4W03xeHOBqxho4dCXn5XSKIVRQYTkrfFyGbd/Rlkca/+OdU5XkHRNt+kCGW/?=
 =?us-ascii?Q?gHSdUaXMNrSHHVM4u1pjiW0PI9km/w6MYGYGvXWZnohgkGsNY74A13RH/0/B?=
 =?us-ascii?Q?6hb/0boaoFJUFPemnKNdbWNCRvZUd96sdS2BKdUxlDzPDbKUOY1CTaIA/+Wu?=
 =?us-ascii?Q?N9GCqb7YEiJNsyUuZCAwwUNnleUr7HbddNQLIvEEu6DyAbOrzdzy7HavR6UZ?=
 =?us-ascii?Q?CjMcO6vDhWOcnuqtGiHMdVu8OHeE1fqp1S31dmz1ELgEJsR0JmFVUPmER18h?=
 =?us-ascii?Q?yTaTPdK/Q6DzNbg6vaJCjvsmnT06vW1b2g8CvMUAgARIRjfiRNaJeq0KcJqD?=
 =?us-ascii?Q?19Hodmxjxh3Arg1A890HXWb1TX3drWrf8YjfhyAAUfmtaarzz4l9rHyaglZV?=
 =?us-ascii?Q?BGHqC6OrTLb11Kx+CyZkCGp4NC3Yq+I2NAq9/0yr+L041RffVv6s0CYCO7Hf?=
 =?us-ascii?Q?cEnUSiJFndgfx69gKKaNLXQfBdKw4g0M6TZssrL2GIp3aEs8ZNS4rk7AWSMQ?=
 =?us-ascii?Q?aqDjjDekKQs/Lm0w79k5sidZzgZuG9KxN0Fdj+66NZad/hzS6ZXREwShgKe8?=
 =?us-ascii?Q?qLqWrzDXB2iPuku+Hc3BJP0AvzMcIWA21Erbtat1Ya3jmQ3Ui9w5fdkS09Uj?=
 =?us-ascii?Q?OBZBRyS2pgfGL1u4+01BZd2AHCMUgKYGjv+VdD3m0Brck51Qo4j4atUHnYkh?=
 =?us-ascii?Q?jgItoW0bbFzdxZFxdUpOicvhD3CpbS9ZLCf5b0CoA6qvu2GU4gAx5ZmngpV7?=
 =?us-ascii?Q?WWz9EGeaH5x3lA4AdvofxnMMouvWRi9iX2gX263SrPrXb6irCc97GzI++OWC?=
 =?us-ascii?Q?ioGyTY80S63LQPeCMKlCHjVKBEWVOi0ZggoPyFmxQjvGmdLVOpzgEjfff1Of?=
 =?us-ascii?Q?kTug+LeTMm+pNiWLGJycpKMbzjOu9mLoENM2HfcPBQwWdOB+hkLkyde/Grjo?=
 =?us-ascii?Q?AKbt160nXgRQfdpo+MRvDlg0rOaN95GSKovcSFFbG3xoZZsnutjm2y2yLqpD?=
 =?us-ascii?Q?u30KU78dgkEXyGpRH34n8IduIUs1kl3R07+yNhPQkIbvo6MULHpsKkPfVo37?=
 =?us-ascii?Q?fsqdZODBvzxLXMGgHSKZwkAdwjPiFPlK6NzAx6K7Yh8/HtlqA1a+OGPGWVy6?=
 =?us-ascii?Q?J9hta9V1geh5uzfgZdoBBZ90L3FWLJ66xOsYGbU4S2pS3SawDaQOpoVCxAnP?=
 =?us-ascii?Q?vZtkmYa6bC0yTps/2X2xXucMtJ9h9dAZIpntPS10hQe8oRBldaVpkDOBotVd?=
 =?us-ascii?Q?MJmnSZsKQCtpze03BUGFnJ/HokPkhEGAMthT21S5aig+CO/0gCrJ+7y6DRgF?=
 =?us-ascii?Q?igPoq5dUFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: gWX+v8QteSN/C3h9Eg7iGUY0BJwPhJxv9mieGIfyUTed5lQdTF9NKw04DlpJzIn/2tGzjui0X4iEJ0T0L/O/ZklHCtc+Zaj28BEnmFajDoF+eFP7zrmjnF6Y2JjMRdV832xs/WdIUJpfcPSsl8LI61qqZg7j3m4rm1nVqiWPExgqdfo/6H8+5C6WYf5ZbaUn3QQ+j3bjd15/ygy6Ph7wsnBaSa7Jy+FEVaheAoW+EGfbXNnxp0Erx2Z9VB8c/XTZg2xGTOwltX8Y8mXh6nYrMc08lVcL1cnMPvC4N1InfUvXb8NjoMTONFKeneuiUYFvoXJbbWJzLsixu+X1/SZSfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d140ed97-07c9-4d71-0432-08dec646c084
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:47:11.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKLAdwp8GLuexWxmhcxeylWxixY73NDPXiT86w8Mjc3hgdML+BlIDCHbK6Wl4v/ciTUpePn521HPp2/mzpJ0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: drm/xe/nvls: Update PCI IDs (rev3)
> URL   : https://patchwork.freedesktop.org/series/167043/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52_FULL -> xe-pw-167043v3_FULL
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-167043v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-167043v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-167043v3_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167043v3/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-c-dp-2.html

This patch only updates PCI IDs for NVL-S and, as such, this BMG failure
is unrelated.

--
Gustavo Sousa
