Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC45E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 17:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3940D10E72A;
	Mon, 16 Dec 2024 17:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c93YW5oH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075610E72A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734369788; x=1765905788;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ehIrxaHnFVz4divgN2vFsCYvD4cdJ2HwvML3N9THsTw=;
 b=c93YW5oHWk1E2S0OhwOBbit79KBnXTo2k+Uno4ably1N+PXl+MJ3hh/e
 azEobJlqKLICt5lJlIHpWsWrDK9I0c7SN3nCN520VCfOuFqrxLvUtK5Aa
 N0lVTs4A9KNUEqiZYl4Un+eJyBi3EjCmH/PtXMzlN+Bhp0p2qNzR3pQzT
 YpO3PCS3iyY9NNNZnJYlMfyijUzHOY4JlgWIdQuWjj2Xa2dAg6jfkmRVA
 xOrjYn7IYOwnsHJmLQWaAxprB+/yfpeG+/olWGNOHuzluBUeKlTccsl3W
 16I2DPVrfTFqvxkUAu4Okt4KuWZB9NeP2imeU5xB1Jmf2Vm8Z7JECD63G w==;
X-CSE-ConnectionGUID: e1QjXNePRxave+u+pexs4g==
X-CSE-MsgGUID: q514HPIpSCG8d7q0MJ3NTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38540185"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="38540185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 09:23:08 -0800
X-CSE-ConnectionGUID: tCyii8t/Tnaufu8vhKPDbA==
X-CSE-MsgGUID: 3jaF0FIVSqiZxtAdd1p4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101868387"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 09:23:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 09:23:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 09:23:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 09:23:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANXV49slf4ryYrT+dFcCkADzjvxuxmxi6hiA+PFiV5HM259c/Wql4pd0WsStaJ42SYpqAfbs1l7BgPlpIAURAznVMs3ecvXOkka4qyqvlTUpSdiD/SZAs/45V0s/xz3Mdy4ynwGkbXI/AaJsHjfrjB1taz63mTDzMWdNenL6JMp/zzOb04FiLTKNSmMOcmwmGg2bdMqPailQilWeIcm8vGVQzUdutOpR/c8OQ+mWc54GLuxrTm0+vUaoes/a/Cbd0fjN7Cde2ng/udDzrWMDZ7tkooWsGrhLLaf3BdqGNaSUX/3lHMMkSqDAmTj833dHbW80eulA5xhjQWdYk45y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG/ET3eaA3t3Gj4kaTWH+b5Xis0R9c5N817P+lg2Yls=;
 b=p2LW6hMJ2vHFkGJz06bZbUw6nHQTZVJIN3Z9/cLNgzmnIxx7xGMrbzrK27Dislz3z72EdmjsNZnVPyAMQb8JJiL6z0xnreecFhd42rFhjW4nbIQp+M5+SHkxivrx032YM/u+meaf4zMYHiUPFHaP2G6CdgUQOTl6njU3kUqWtkSxK9+CZg79P3JOhXpUI9m1WLpwwSQt7/ray4fCuojTY01OpzX9GxRSd87zYl1XUaps4Ds5YJrCDf7Xwl6JIFd+dSfbg2/PNcV77Gv3tcCeYrHhXm5EKdJRbA8tPRozmebAAio98C+ei37E6TQzyyR60oTbCAub55ndgtojLFTlcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Mon, 16 Dec
 2024 17:23:03 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 17:23:03 +0000
Date: Mon, 16 Dec 2024 12:23:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/7] drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Message-ID: <Z2Bh9IFKqkzCSvYy@intel.com>
References: <20241216162941.86070-8-matthew.auld@intel.com>
 <20241216162941.86070-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216162941.86070-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0143.namprd04.prod.outlook.com
 (2603:10b6:303:84::28) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d5053b-f686-47ee-ac29-08dd1df64c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HmIGPTUc85W1uQGJQIfNFOl2G80Hzs33GRfIzTXr+Fv83z6dC3iO/utP0v?=
 =?iso-8859-1?Q?zFzuz219XUOOVmYJkkZBReoAEstpHIuHOcY0/miUGUoMJWS2rWLqwiENFR?=
 =?iso-8859-1?Q?Xv/ujE5I+fie7OygNC2uUyqQ2XFB5gMliJhKVD701RZ7qiZk6oFDg6Xqe0?=
 =?iso-8859-1?Q?p4Vts4ycgCyxATDyo7y87FDS3C1OhoP8U7rq01X2V0StL8qJ+I9N6YUAlb?=
 =?iso-8859-1?Q?1GpZy6E/e8W9NqLYz2+Ae5a2o0xnmGJ/Ax+TU2442tuT0SGinO0tyXp7SP?=
 =?iso-8859-1?Q?si1k9bvz6M6GMxD995GRvh/OOcPbJiNrKTlayZ52xOX0wXzbXRR4U3ZAJ0?=
 =?iso-8859-1?Q?6i8oFg0fDZwDSVwewmMGFv4ZLzLyDq8spNN2kN8HXqtL9RuJR6Ct5QlW3g?=
 =?iso-8859-1?Q?RGoeNSbSnKnuaIBe0Z3riJiRlMOj6PVSxQ1Lo3E/LZ18LEsTSR4tO7NfD7?=
 =?iso-8859-1?Q?d1pEvry79rgsQqZZj00Tq9TGGYZPjB69NGErN+grL3WDIiq74a3VWGVsiB?=
 =?iso-8859-1?Q?ICISf6cLNuLWkrLZObBLRLjRFV0l2oeneAer/nZFwP4kKU23fkNQ703h4t?=
 =?iso-8859-1?Q?NVqrOyFDA/tQgpzzyxKWGyVQw6DHEaYZqW3Xx90mr006Rw2VbyEVGvUrba?=
 =?iso-8859-1?Q?BFniUwUd3wTzQ+Bm81kXq4rZOCEbGuFIyAfOMW9EgsWXUaD/jTz54LJM10?=
 =?iso-8859-1?Q?PWJhC8KPX35MZ//48411kU52pPPT9OryKeikVKnc8/Tv6WxbPIytbPh8wH?=
 =?iso-8859-1?Q?0g6T+DdelXIl5t1KPs2m8v/sOtku5SPCh6sIJAZVs1ahX69AymLU7+GoQ8?=
 =?iso-8859-1?Q?VT6UrV+6CTWKeIoz0kQqY1kzRrNDlPWg2fzuQOna5/zUPw4dmhLPmBjUy9?=
 =?iso-8859-1?Q?Y9MfNbOiTbqeYSMUc686CtgglkPsOwSsoH4EoIkPerq5VqIRLoqkmN9XnG?=
 =?iso-8859-1?Q?eAW48iu1G4RaYKqXoTKDIA7GSqknXhN43GBpDiZG1UAnz0KGS3vtze42O7?=
 =?iso-8859-1?Q?Lb0UxS8qtdWBg2dBysdiUbFWdEnR00wR63fgN01V83YeRN+x6c0R48Zpsv?=
 =?iso-8859-1?Q?TirpnZi5ROKsp2by0ir0e3BygKyffnODr9C0JTDZGHemPJOeJcG2WmbSa/?=
 =?iso-8859-1?Q?yiXy2kHyRSsCfwxYQ5azn02/TkqsWHqD3VI8+z4LivbyqscGyFDyIjdCsQ?=
 =?iso-8859-1?Q?khYd35ZQXclkW/BpPwqgnzJu/Q/jJJAgM9VpeF2keyTb+JXZ6H9A9oTDKN?=
 =?iso-8859-1?Q?Kmzv53llZ/rdrq62n8RpkHbPWwunMSmLjYMUJW6FcPPJ/GeZg+XXZhPdWF?=
 =?iso-8859-1?Q?n5m5fw1e4fCYyaFrpy0wgY4mSJrpApWOklvuUujAvgDmFB7x/XO23cornq?=
 =?iso-8859-1?Q?znA5tV/6zejTzJDhrdAm5mZavtoJ8bCzBFTrC0nd3nKulFYxewcHUJQeEp?=
 =?iso-8859-1?Q?hA4FR3pOJbV/iYn5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hPALYvWqcSD4KeMDKtdciOIm3Kp9Ob1kOzLeJ9otGixl9gu7pBHIS0KKYO?=
 =?iso-8859-1?Q?8bB5MFeDeyNTMAM/UvNAlyx3V5ffrV2yZlBZAHd8sf5N7Bk/G/LNa56pyS?=
 =?iso-8859-1?Q?TqCclkFCRmtBL3w6B0/j98AxFgGp3ieKiviCxX+ZUNlC9Gg6c+mJ4G3dUV?=
 =?iso-8859-1?Q?pxUTDpFnEKgEGx/AUhwiFOq5b5ZEkhOKSuawRegxrtgiGmZlbEi5EeOcr+?=
 =?iso-8859-1?Q?5WhnS45UgzYWoqFugdPfvTNhHAIa0ZRno+q6iZ6JNqof9CTGtBx+SCO20r?=
 =?iso-8859-1?Q?XJuv+A1qJlUVy76QmzYH7dXeL+C2Y3SxNmLlhuQO80IoEm22OyrY5wQZTT?=
 =?iso-8859-1?Q?yub8pKGASsGfJFEFksadjCGWL0bajc3XmyaWRV+eawru5iGk0N2LnIjYJi?=
 =?iso-8859-1?Q?cxFABhj0fVUcnmUeUa37ipD56WcWjTNHRcfsOaPwYqQNBKxi5If+WsK+h/?=
 =?iso-8859-1?Q?qsgA4x05WOHwT4yX/q3qNYKr3cwNl6vxlyX8Yf2prPmaLFP2Xb7Go8ce0z?=
 =?iso-8859-1?Q?Oy26NEfTyP/gyUP3749E7jU2aEacH6pKPotb2yX4o50n9JIypJMvXoN238?=
 =?iso-8859-1?Q?gyQ+PVYQSz3CzIYrlsyaxXmf3/40NzKANskB+6/ZwN+MM3xrhVtfheR+nc?=
 =?iso-8859-1?Q?c9yLNQxTfO0x3pTosW6t06+MYPaGK7SIFC3Hi+XgaPkduVfJvn/2FSNfcq?=
 =?iso-8859-1?Q?rPTgSOLzjg9LPXUNLdZyn83jdy56uN7A/972lkMziZG9h9IZGUTR7bBnkN?=
 =?iso-8859-1?Q?HLamlsBMKYw7J3xE30wX5dOaydB5/IhFJnZonQwMZVqBJuXEcCyxY1rily?=
 =?iso-8859-1?Q?zOOOVFnQr5+R1SqVKgWP4UM/Pr6UDpQy7cdmC9iYtjY1sFHoV0zkLc+TzZ?=
 =?iso-8859-1?Q?jKlNBmVGNQ/SkNTeFvLsJnq9GFxJN/hmHCItL8EyFDMkqDumcGNFcLP9Ls?=
 =?iso-8859-1?Q?ZAGxfsUbSfdCMYg456egIRDV6X5QMO0TZCI87gCC3c54TAoaLi02Q2LoGb?=
 =?iso-8859-1?Q?RUIa1SusMaJLC07yVTaT8hsAJx+SUVp5Tv6YWq6xtORGzBugb4pg45FFSh?=
 =?iso-8859-1?Q?7fEx2S8Ji2wrPkpe3EIL3UIXD8DrxEmz70ipVmuW93aYcZwKympAJI49pN?=
 =?iso-8859-1?Q?EtinOzOJ0sB2H9lJRSjZrbYhqzkwrgv4xUjGHp9HnjP7tgBwfVnOS/cQ3M?=
 =?iso-8859-1?Q?+AoneCKC/cwWXknFweNrtewVGKzyxAQYgEdxvl9JhcILul33uTOA90Pa4e?=
 =?iso-8859-1?Q?+IA+CFr1rlq+7APAvscovzihLxPsodMiaMjgqTa6b0rWfhekGIMpm0oesg?=
 =?iso-8859-1?Q?wh/z180KhQOBTBZ0hCH7SN94pcVqPvh+3xZ9wHijMdZZuClOJJFPkS+c7X?=
 =?iso-8859-1?Q?nt7y0l+zp/Eb8DmKOujD21Y1kS4n7MFYFOF6cNPLcyErNZ5yD/BEYE4DbR?=
 =?iso-8859-1?Q?RHDQEn+11lub1axCimoHSha0eSE+yNdeBtoVUH2JnyUz4DkTSzftKzXiD+?=
 =?iso-8859-1?Q?ZmQQAgS6oxAUSl2z0bgd85tALo3t0g/cTGBZbyiEJUTkHnTUStlIAUi1Oe?=
 =?iso-8859-1?Q?a5MKQvaM2QOjN46lZA1ZfR5N4tK/xDyEWkq+3cg9D4JDQ7YVYZthP5tHvu?=
 =?iso-8859-1?Q?5LnUcSG0K3gXNIOrqFK/NVJw/m8djx+4UFQggRF7417Bv93RAUfWHjPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d5053b-f686-47ee-ac29-08dd1df64c1f
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:23:03.5035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljgV7GdkUodc+dnnauXHFvW4iE/LlQJ3Rw6dpT4UauY5lz9NW0siUxqJ+UN5j2RWICVMPKftFCYnYqU66Ga0SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
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

On Mon, Dec 16, 2024 at 04:29:44PM +0000, Matthew Auld wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Not all BOs need to be restored on resume / d3cold exit, add
> XE_BO_FLAG_PINNED_NO_RESTORE which skips restoring of BOs rather just
> allocates VRAM for the BO. This should slightly speedup resume / d3cold
> exit flows.
> 
> Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as NORESTORE.
> 
> v2:
>  - s/WONTNEED/NORESTORE (Vivi)
>  - Rebase on newly added g2g and backup object flow

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c      | 6 +++++-
>  drivers/gpu/drm/xe/xe_bo.h      | 9 +++++----
>  drivers/gpu/drm/xe/xe_guc.c     | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_ads.c | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c  | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 3 ++-
>  drivers/gpu/drm/xe/xe_sa.c      | 3 ++-
>  8 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e95909963e06..f08b725dd419 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -860,6 +860,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  	if (!xe_bo_is_vram(bo))
>  		goto out_unlock_bo;
>  
> +	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +		goto out_unlock_bo;
> +
>  	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
>  			      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED);
>  	if (IS_ERR(backup)) {
> @@ -1804,7 +1807,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
>  	struct xe_bo *bo;
>  	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
>  
> -	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
> +	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
> +				      XE_BO_FLAG_PINNED_NORESTORE);
>  
>  	xe_assert(xe, IS_DGFX(xe));
>  	xe_assert(xe, !(*src)->vmap.is_iomem);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a0ac2b9c903d..d75740b6e0a5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,10 +39,11 @@
>  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
>  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> -#define XE_BO_FLAG_GGTT0                BIT(18)
> -#define XE_BO_FLAG_GGTT1                BIT(19)
> -#define XE_BO_FLAG_GGTT2                BIT(20)
> -#define XE_BO_FLAG_GGTT3                BIT(21)
> +#define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
> +#define XE_BO_FLAG_GGTT0                BIT(19)
> +#define XE_BO_FLAG_GGTT1                BIT(20)
> +#define XE_BO_FLAG_GGTT2                BIT(21)
> +#define XE_BO_FLAG_GGTT3                BIT(22)
>  #define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
>  					 XE_BO_FLAG_GGTT1 | \
>  					 XE_BO_FLAG_GGTT2 | \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4e2868efb620..2fec35a81afd 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -453,7 +453,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
>  					  XE_BO_FLAG_GGTT_ALL |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 943146e5b460..887181c5395c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -413,7 +413,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d33f3a11e61..390598babae9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -238,7 +238,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index df4cfb698cdb..88e4348204a0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -261,7 +261,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>  					  XE_BO_FLAG_SYSTEM |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e8b9faeaef64..7c7f04f0d574 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1086,7 +1086,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index e055bed7ae55..d26e6d52d01f 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  					  XE_BO_FLAG_GGTT |
> -					  XE_BO_FLAG_GGTT_INVALIDATE);
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
>  	if (IS_ERR(bo)) {
>  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
>  			PTR_ERR(bo));
> -- 
> 2.47.1
> 
