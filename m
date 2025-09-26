Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA7BCAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 19:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2708610E004;
	Fri, 26 Sep 2025 19:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFiz8UP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0810E004
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758916326; x=1790452326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TE6wZkXuHILL+bgM8LnKp+9U3vOiSKm7BuQg8zUn7Qk=;
 b=gFiz8UP+DoscjQ3YBCTHC89S4WpR9ce1Ae9CUX2Lee9xEon/PpkmMyaR
 wkAtBF7Pg37MaKcVWAq2P5WYXcQ1OMHpvlQODR/PApso1Fe5uihpIZtKj
 //csqE8XBYPeTo5IE60m+AF94qLWQLeWq+lTekXlXkuj5Smb1/NkSal1Y
 mEiEUelDAAxZ/9kk3KnZqUU8rCYssCEJxf2ItMzL93giLRWXRKgtgg4Yp
 vdKyvbrq58/KcfjRFWBqPnFTpxTfCWbz3+0uRfm1p1IQuJL7XZ4d+qMhe
 Sklbfled7lifOo5XYSXYv7Bfy2WG9zvcTLmzCZIEWrxe6oTH7MoYaMc5O w==;
X-CSE-ConnectionGUID: T1WMI09rR9yUVBM16GQnkA==
X-CSE-MsgGUID: IP/ViXWcSGSVlI/Js/Nx2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72687663"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72687663"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:52:06 -0700
X-CSE-ConnectionGUID: 28pzDaWNQ6qJ9IeN3Lx28g==
X-CSE-MsgGUID: 2aIu9MXZRemYkSMT3IN1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214832472"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:52:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:52:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 12:52:04 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d95/K7XFZJ6AJs47hQigQotNqw6LayoO+B6Grq0xHOnyi5686429qiYMrFZq0m//CqkpzkjjnC8Qve29BEDaKlXCPA+6TisZYPaoLJH0IjQDcpApCRB3axVDb0Dn0WdeQZSuSeWqUc8tazMuOQR/WyQ3eZ6qZ/vyL7TRuKREt5idmc+MWDBHZBVKD+3n999+oqrTeS1N8vjOjqkHCEOnlYr9aKhHKhizhBV90WK0PyKU2zQ1lgTl60xKEXyFHg9XV9mQDFNpNjYQn4W/SnGLjxY/oSrYBMl8Cs635sT9R+K+5031MxrrShBJNxsyvoYQ/QvfZC1jaKeTo7V7YDVRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZpuUK8V9uyYzXwf8n/IN+zHNT1FTbogTy3smym4Iic=;
 b=BTd3sQOv5Ar2HAG9fSmy5KRBhs/JnL085xJmTDBILN2QM3Sv3tvOntfhY5sS2ApHj81ULA6cfq2kz3iBklnzx79F56LqXP8UkwJELxv0Fc6K/NlP8DqfRHsaI44XgfoMbUUwy+azmZEHXAytpi92wkX1U28zUbp+Ewuzs9C8YX38NqW6pbyQjexa1YpQFngXykvuTOtJ3HcvrpVOEFtU2uQOnXI3+RrtEgeKq8MSXZoIYELPZMcs/HwPzXHpJdkVR8ab1Lp9mTOAapRo53HSQL4aXAd/a7psy/SD+0+PPJMnkgMSqySq3oAunGN5ck6G16AXiYfOSgYLNu8pmsAWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 19:52:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 19:52:00 +0000
Date: Fri, 26 Sep 2025 12:51:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aNbu3ROORoQg3NRh@lstrano-desk.jf.intel.com>
References: <20250926131437.2228555-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250926131437.2228555-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:303:16d::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aa704c-295f-46f1-35bf-08ddfd362872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDuAbwvV9Zogv6K5D76NpL2fY49ugbhvJRD8XeNrZf1dYKIaDXG0EF0Sg4uF?=
 =?us-ascii?Q?5QVipl9Qtb+X4gbCN/7dh87QXfAgTUBKNNpg41p9gnYX2pPdfgaz1Omjpv1M?=
 =?us-ascii?Q?R8gGZk0NWBUveE5mMubQTq1oVF51VVz758Pj/rasNJzt2aakuufpVeHmHAhm?=
 =?us-ascii?Q?08lHBej+h9MceTR5w89696Jz3v6BGC45Lu1VC3txqxVg1PSgWeQiV1y0ZCFg?=
 =?us-ascii?Q?lpPLf9/e1G0ICN6mfaNpglQedO5s2ejq8qETySaDt3cBgy5SRoN5zb2YaXId?=
 =?us-ascii?Q?ZINRgQWYh++YnX1Q7yxLSuWU1l6DtEhCEjna1HOqojdUOQuiP57x/T4A80Jk?=
 =?us-ascii?Q?QRgKbrKa6caKvl7ongJ7J0ug/yquUhLxsRpumfWjfTkTNg9Qpao3hHYvn3RO?=
 =?us-ascii?Q?QrDRe352WwrYAeDzrCGwtnCYDqqr4zZgiIVqkDFpp1mcZccn0PVsqkopn63Y?=
 =?us-ascii?Q?4Hx/WrOB0AKkMnmGdcWzBzYd7rPUtv8UkLaD4mTpxRhhjb9XJmWWAZQdrkLQ?=
 =?us-ascii?Q?vA9NFGKPg4UbC0nHTSBG7LpnyA455eDAk8YuN3TgoU9LLIsCqMTaklIodtrM?=
 =?us-ascii?Q?ZpAZR5yvmwakf2UbCMlAf0YuV1RTSJfeL3vpwx3NCk+JCJ1XPHcY30IdGIqb?=
 =?us-ascii?Q?EJkjzlIWEcSU76+ZWu4FZHwP0w3OrstJnRiJ+ADPD0un1m4eH57rOh4QGqig?=
 =?us-ascii?Q?NuoW2BwQIPEGh6bJAV+biWSHFMeuLUDidA5+jdfK+pfCnpC5BeJ7z9q8081v?=
 =?us-ascii?Q?zpxNefczMR3akgxdvASuRg9Do2XH4+D1eKiz/NU7dCH+DVCDOnkc2pPVnDlZ?=
 =?us-ascii?Q?PN5fpmaBFhNJd72nww2IE2XNPO63CAdJZ4Ztw+yqj7PH6cAGOmrK3WZWYzbF?=
 =?us-ascii?Q?3jiH2Kp4+7p0NXKx/dlslgmGDSbKB79edpzIdjHRMiw2ENz6Pu4tiiBLboV/?=
 =?us-ascii?Q?fxGxpDotINegoM6M8HD9bg2buNSCeQaAblZBtOEPPYTNG03v3wZls7uzeNpy?=
 =?us-ascii?Q?TLp2yzQ1XgCKe/MaNUiO08ctr1Zg4nMRodHTC6mgiKDEnJKSxeEEiSjyIaQ+?=
 =?us-ascii?Q?rC3cVEvFYsOaxhEEoIHbeqvyS3EL9yAg8524JQJIzkJjuczqndqbT3AqDSCR?=
 =?us-ascii?Q?M606CBg3jieSnckU8M3H08s5ljpJc44g0pL34scJRg5P7OgJ4+n6/TAoi3gM?=
 =?us-ascii?Q?uqcfyBdMx5Ge7lmgMLamy7lMJ6wJW53cwYni52kwP1Ucgl73CWfwLEJzlDmr?=
 =?us-ascii?Q?MyR4sd8mHdC6kmexMZZ1pGmomvaB9NFEqRdYAQKtx12yYMxp2/sM0CyxeMph?=
 =?us-ascii?Q?RehNznb0PzYFC0pLNRgHBIwn7jKqcwgTJ5OAoPUeulz10qirvpovvAYNxO5x?=
 =?us-ascii?Q?ZrVPwarFWrdLEetUKimZL9rfIj0FKSxxAobFZhIvMf5/4PPB0D/BAvbbh781?=
 =?us-ascii?Q?C2Wr+403Va9axsNDBeFjFGQytkz45JA3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7m0IsQkTU4ze+BwrJYRn6n+YQuS5oar96X1+ZFG9e7AtVfRB6h7QKV7lwyNi?=
 =?us-ascii?Q?e1TYqDMwJPpkxrQ08Z5z6eBr5X+3Ed4onlhvCKQ0wPmvrepJWTAVsZTGRHag?=
 =?us-ascii?Q?UgFMO5UxjfuZlUgBWCTjHEDocD0JlHbh/CGkxq62e/IyqBJrgs9D1WWtjncX?=
 =?us-ascii?Q?gTpD+3CaB01wAS+VL0tcpsm9kJ+stEOItxgv3ukuv92rs9eJ7HwHx09JY0A8?=
 =?us-ascii?Q?R7aNtbF1SrDsdqTCsdPt0wHHb0RSlEsFBdpcw/ZUji2KXdzpdGmjTjZvekFA?=
 =?us-ascii?Q?jqfCj29BYP0PLv5iL/EiE4/W3gBmKHawLLsNPVAEvIozCUiulSYMg+F9AzoW?=
 =?us-ascii?Q?UCOxGZQNdMYIVv/IUGcQoezJe7msRReKZ5tssKhexk+8c8cxFi0ITjkKpyg0?=
 =?us-ascii?Q?9oJjUxKDuEylF3cUSfsJbvcskANxhorkcom/FUtni7jqBoFc+xbrBWICDPG1?=
 =?us-ascii?Q?59CJ2eqGpcgLgNfOkbVbpDPDGuRZxDnN6wzHBqP8zhedZLw8N+S+Hdw+rCB3?=
 =?us-ascii?Q?t0UY5DqmrWb2vTGLBNoZ7gOeiDKLTiYgZ5aBt5xzbXw/wdaUkyrtfK1eW0KO?=
 =?us-ascii?Q?Xh4eBVc+YmNi3591fi3Mf3Pd8egfzMgw3SJRNf69dumvAh9VtCG4VxMqtuiV?=
 =?us-ascii?Q?ClDpQqIf7OYbWr5oOeaM3QGVO2eYTUMI6p/I7cFYb3FA4NaOO4eWFdEXTpML?=
 =?us-ascii?Q?euYfAz3/ACHTYVDi014j5nZ52FWOCW//9/c0gcXFei7L+P1tssCKcjaUHNmn?=
 =?us-ascii?Q?xoxTDpnXHwUKs+/KRHXXNTFBBtRTT4dcUp25xyc+WQ5UzK80VVxVn50vaa2y?=
 =?us-ascii?Q?RamDPzjX8dNzsFtA4V50RALi76d7v1Lm3oySr1lUDS1d8Be/xIncookzBuky?=
 =?us-ascii?Q?3nPN1ZdS9etF+ugqED67lOAGTKwbbOP1i9mr832/hs76wIteN33ioeVKtqOK?=
 =?us-ascii?Q?9BJWUbMYkMMoFOog/XxQF+QeYhsdGPxcN4S6bX+3XqjUu26K3xYJIyxcNPfR?=
 =?us-ascii?Q?2mz4FE6D2mz3jy52C6GT3hzJF1CoTdYeQBhakZF66qx5Kk+ynHFD86R/qDvM?=
 =?us-ascii?Q?Zmcg8pOPmgV/boCW81D4HJNWyjpnlkDBAW0SGqZ6Xg3Q9VWsYb1I7GLx9RJr?=
 =?us-ascii?Q?YVnHlv6LFywV694ITOreTjb8aOVcxyvMDOt923tlzADFhdm5wobcsUi8oWoG?=
 =?us-ascii?Q?ILVfcVt+Vg1pRkawWNu13z7kysFCCFtkPNzxx11Z+v+k1btoEvjPSNC5rhGM?=
 =?us-ascii?Q?BL2aCeLoR1jUY0qFAEs2c+uxxAar8qyDdFZ3aFDS3ZTcgXbOIiALeWYA/FbG?=
 =?us-ascii?Q?S/ogO1bJZ7CPkpF1VyCScamSVBY6Y3sKH3pqyHc+egzolIESI2J/j59WdtoY?=
 =?us-ascii?Q?O1chgJ7xaI/xbpHH6oAWWoa3HcvbGENOgDW1lw2dosUm5zgy4Pu9l+DYUomc?=
 =?us-ascii?Q?tsosIqrx6ijSETCSSxyDz3dUhAcu1Rpy6NrzsNFKf52lo70GgCDuQtQSV8BI?=
 =?us-ascii?Q?PwwsyI+fXuLeGPCG15mjAvF9mNOEmB12LcA4CKDwJ3se0gD8xCwURMDvHxc3?=
 =?us-ascii?Q?+e31BLSLYq0wLeTOSMzTyxo6CFksJFYO+1avfbbkPo8e3l2Jgn8hHuERJePR?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aa704c-295f-46f1-35bf-08ddfd362872
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:52:00.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZj33V+bKQEyo9WKeSe5TPK1pwrE7q0FDDWDOizYD+0iUqsXM0LUM6c8UtVAja/2mZ6hYRY8irfNDfP3U8ircg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
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

On Fri, Sep 26, 2025 at 01:14:37PM +0000, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 128-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - Use _memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 51 +++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e2fff2107f68..88ed4d09a97e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -644,18 +645,39 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +#ifdef CONFIG_X86
> +/*
> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may trigger
> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> + * write the sequence atomically.
> + */
> +static void memcpy_vmovdqu(void *dst, const void *src)
> +{
> +	kernel_fpu_begin();
> +
> +	asm("vmovdqu (%0), %%ymm0\n"
> +	    "vmovups %%ymm0,   (%1)\n"
> +	    :: "r" (src), "r" (dst) : "memory");
> +
> +	kernel_fpu_end();
> +}
> +#endif

I'd write this part like:

#ifdef CONFIG_X86
/* The code you have above */
#else
static void memcpy_vmovdqu(void *dst, const void *src)
{
	WARN_ON_ONCE("NOT POSSIBLE");
}
#endif

> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,14 +695,25 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> +
> +#ifdef CONFIG_X86
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> +		memcpy_vmovdqu(cs, dw);
> +	else
> +		memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
> +#else
> +	memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);
> +#endif

Then here you won't need ifdef CONFIG_X86, rather just this:

	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
		memcpy_vmovdqu(cs, dw);
	else
		memcpy(cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);

I also think emit_flush_invalidate needs to use memcpy_vmovdqu too.

I think it generally fine for the emit_pte() to be interrupted aside
from maybe the first two DW, so maybe convert that part into a simple QW
store too /w WRITE_ONCE + smp_wmb() so the barriers are correct.

Also the free side could be problematic too. We might need to carefully
use memcpy_vmovdqu to stragically reinsert NOPs in way that is safe
(e.g. clobber emit_flush_invalidate, emit_copy_ccs in single
instructions, for emit_pte work backwards clearing out the write value
first and then final clear first DW /w smp_wmb() + WRITE_ONCE.

We might need to block CCS BO allocations during VF post migration
recovery too, I'll think that part through but if needed we can do that
in a follow up.

Matt

> +
> +	cs += EMIT_COPY_CCS_DW;
>  
>  	bb->len = cs - bb->cs;
>  }
> -- 
> 2.43.0
> 
