Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B4E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 19:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6D10EF8C;
	Thu,  5 Dec 2024 19:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aePNSWbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BFF10EF80
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733426872; x=1764962872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YV3d5QBSgmQTOIwxrFqbUQPjdYW7WshXJ3y2vVOVQpE=;
 b=aePNSWbZ513vnKWLhs4UP+DoVgJinFkeFHk5wyDkaPlUWZTq/l9qO/wA
 yENwd1VKEyBjRUCBmh2TDfeXwNvQXfHbwBjHImJaMyl6jfr5gCD/39Ax0
 LkBFGV/u8uHkNcCa4rRpXryIQ7pjdY65ZK0n24kKDT9eWyS36zTxzEMZL
 4+kzOE/qSBMa4tVeS/RUId7z+LBbIgCjzYGMe2IsKMOjpelpI7FSVRRxp
 3OH5NBd4wUWOzyiFJ0Pej5xqsWr6xy3mxELnkT0BBeEJCXE6tQMCEA0dG
 kx0JBnEK5c9l+niM/KONo69br9U0rGWc2K5rpM57J9CG5PMGWB0lPxNQq A==;
X-CSE-ConnectionGUID: pLvMgQTRTTeRVmXaXM4lpg==
X-CSE-MsgGUID: ASxFA9anQQKwKHVvVPg/kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33896699"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33896699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:27:51 -0800
X-CSE-ConnectionGUID: kGcmpRzkSiOzWXl3oUVWtQ==
X-CSE-MsgGUID: giFJEuKhQ0SLecX2c1WyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="98635813"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 11:27:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 11:27:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 11:27:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 11:27:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su7kUjUxthXlhumldUDdJhWc4K+G3gXNqaR/XifMutLo23o2VIe0tMxN3EB2RS5RUtMu9VurwarHd6eOKLdpVDsBMuAXuxNvzJIYBArbBXGntfkT9XAzh12CzlVJlVW0N/+1/mPp930fACJ6IEzcR0WHeM2CfedWwuqze94qNNJvUSHIsqUJP7PgeyFLkxW1sgFpq+it+xyxZISeugSsQL9SLidy70l/i/camlGruQT4952mQGl1ouaGxBksWQFo6Z804q13bBn8TuANQR5okLnb70VcbXeLdBYCl3SGF/UX6rqa8LAUabR3Ekbq5+hSrzLRl+OW5ylNPgMDY2SEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ2tN+djOuYE/oqybiLdr9wwdBmN6NPOS8pr+Dxq4dM=;
 b=ONg4WwHwXia9RzCxGar8eUXJq+ZGYLB9SVR7fKKaeyJG0U32eyUwCx7LUqpd3O+9zjCMn1VCibcMmziFMVecQDY46hEWZIYTmAESb0fpqvt3O9l4bnCqQm8DM/PpLXVTZvyRVbsKo1cYG9tgTAvVirURriKWsRFeRQeQsdG+xtUhfOhyQ6bFo97zhByHnyBTbCae6dYXPWMf23EHcLu2LhItMcuPyW8KGxAu/ippX3FNeN7frz9+4JPJqeoxWRu5UwuaTzBStAcB7HMXvJL9L9CHvJ9N7q6roKpHM+MNvydvU27QlkhWVu4no+hVwmn7z1JEAY/uyTPHirOFWIKhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 19:27:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 19:27:48 +0000
Date: Thu, 5 Dec 2024 11:27:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 4/5] drmxe/reg_sr: Convert whitelist to gt logging
Message-ID: <20241205192746.GE3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205182240.3463027-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 6341a105-d2ee-4f74-16f7-08dd1562e70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SFaHcGi06Z9nYDvD+3+8t2+022lmg15W3ae3X4nNSYNeRkC28NYMF9G9hsKR?=
 =?us-ascii?Q?XC2VEJxZ3ZUrLGyIRxGHlxVRpNtoaH6IyJQANOKsN7fZpC1N5nsOpjjZTcRJ?=
 =?us-ascii?Q?W2E5GBrzkdGvaFO1pn4PKTT93IxdkpSZZn1mqzzsfCQijTI82Z4YabqlUwNH?=
 =?us-ascii?Q?sf8FnYAFgyiRsUC4J+114eW9P7BZlF5PR2490YLcgkIEaAAEH1w+deyQQZla?=
 =?us-ascii?Q?jk7+qqkeQ6gGbEmld9XW32SHLf+Hfaijw2L0v0KiV8Bqsna6b/UF3m//UoQT?=
 =?us-ascii?Q?7s0EmbCtbiLnKmSDMNORaeaSgXyeZTvEjL89xjQwWRnuv5YfwA1aeNGHnhT8?=
 =?us-ascii?Q?yMVOyt8/PeB7DzenS/1J0Ty0nR7iOoufvEnJLhEyYJr+ArGteCA6geE22m78?=
 =?us-ascii?Q?Etvv0fKfb5P3IqjqiasauYqfdyY00Jidma1WyA4U9aLT02WNakHX067tglEj?=
 =?us-ascii?Q?VpQlzrF0DciqZpL5OWgFlv7e/HlhIMrRqHaYA2ShhKGMCnQYuBMKtgYTm1VG?=
 =?us-ascii?Q?K6kH+pHCY4ZdIJr5DXCu28iBqqGto9hqCDthAxuIxl/kOu+v9RSObq6AOnkT?=
 =?us-ascii?Q?ryAWWIMYYSQWtrBRdqRGJ67DHTAQGB3OxyNTR0BlTgazJz7qJwujfmxvpTyh?=
 =?us-ascii?Q?+NEFPU8gr+rWyquS3DCMTnq5R9Opl8TgH1MGjgY0FeG15yvjWODpw0Z4agWd?=
 =?us-ascii?Q?13q7k714YdliWH7eSl68N+HZkwZwzXrQBcQG0awTPVVIJ0KUEe/jXi8ktFiz?=
 =?us-ascii?Q?XsGYur5/uI4ANLauMUDwxRfZUW0bxId6aoJ+tl3xdnx/2LbexZ14qA5ITmvC?=
 =?us-ascii?Q?St/pkKdUUjvNTRb8JLyrtBqAcoFZ/h1D+FZFnR0MK58BnTAhZQahEocb/BTS?=
 =?us-ascii?Q?vv7lUT78DnDKe1VpfDiWFTKRfyNx23vPoJGGwBQ2zaQz6YtD5UOUo2cy9tbb?=
 =?us-ascii?Q?pOqV4AbaACOcJvfmZuzHtp+qFDi4g1ZjSaeqZawCNX5lN6qgde5diiXUCvx+?=
 =?us-ascii?Q?5+2AxD3ixQL5e9V15kF1UyULieTnHa7Ns+iK84gcYOFNBHCJlszrjJXbo6fS?=
 =?us-ascii?Q?RM+N+F5HvL4dh6vNIP0kuvlps+hEw4UkjJtngmgwFgPMgLqWp0ew15z1lYg+?=
 =?us-ascii?Q?36Eo7M47523nTjy7Jcrhgy4S/Oo+A5/tr34jvJTCEMVFe18Lx3qB2SPx7sNn?=
 =?us-ascii?Q?hv2HkoiMfixEbmeOF9F5BWtkpvZxA8IfdzOTqQEvWLxip31eUQH+d0aO4/bb?=
 =?us-ascii?Q?vZy5EdDMXQkrcborte+6sAt8hhgb/R5o6fNfjuJq2G9y66OoXFXetZnY+nXw?=
 =?us-ascii?Q?JzA/X/tz6o0K2+QhJpA7wi++6B4nNqWHRmE0HAJ8kBygKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYj/pWE5bcF6DOoMvDPfmGi27+hTF+Qvwkd51x/EcWySJzACAHyTUFWzuMTR?=
 =?us-ascii?Q?5AM04E3g5hsBrMKANoSCkf4ZEia+NlRDSmtw3q5GsFa8S5pYf03N1y4lK97P?=
 =?us-ascii?Q?6MzK2t3lh0cHH/YF3dkaaqnSutxiuul0TgbiUgYtFbHPgflg7u7q2zVgud0O?=
 =?us-ascii?Q?QyisAyQ09lO5WdvYhY4TCDxGu0aUMHrPopo5WN0VyqfjMYvdo8syqcz8+7Q9?=
 =?us-ascii?Q?S/zH2JUBnM+s2qn4B3AXsiuYBVc8PqTt/z6ke7lVo3AeTaNINiMSr5Ak5WRB?=
 =?us-ascii?Q?WGSYNkqqXVOx8+XPMDET/lS3Nk9xlbgTfz+T2XttmUOfvPdbA1y8RB8y42jg?=
 =?us-ascii?Q?GmoKePaGV0/M3r+1G6TPY+pWVgz1Su6TmjapPTK5yQPk8ZETF01VTooNvb7d?=
 =?us-ascii?Q?Iaydpmzq1RuwhV8skIUNnmvtPndEvhN7jFex8lSPxcjjhPTFbUu/JRtUMlMY?=
 =?us-ascii?Q?EgSFlOOhaIzT4uZh1JClzNEollrDML68t49SeU0vlMLJJHZ08XzQJus6tKoY?=
 =?us-ascii?Q?mx1pgKDDr39uWWNH4AbUJ4RWcV/GJjk12jmpSax+itGw2ybhAtQ74/F4eRHr?=
 =?us-ascii?Q?6iooW4nKgYD6LpKc7cVro0Rjoiw13R2UCanovjLwf2IUFd1mPaZ1KhLAFjNu?=
 =?us-ascii?Q?mjuY/y2d4quYBsEy/kYsaoQHeF1I3DqhdfB0F3u2hdAHJQCzTIUD2Bg/ttEc?=
 =?us-ascii?Q?Bl/OEp0zl0l7TgsGfarzSlJ0FXoQ973JzmPyxoZpuB4eQ1ZM+35xaExfrJaW?=
 =?us-ascii?Q?EbI6X3syJwaePWsz4aWEz0eWKiTYoQE9WuTQA3TeVeEWn4/69MPOREIaaBGQ?=
 =?us-ascii?Q?yy3f6HnpdjOIzc/tnaxzHVC6WZv3iFlcEXATFaBa6DA8toNHy+7ZM/1rLF3G?=
 =?us-ascii?Q?t4VT9WYleeZHK4ti8LJat3H3GTfcXqso7J6nVJbJ/ry0knbO+5SZfTTpLeaX?=
 =?us-ascii?Q?QmbmViQS5jpuph5+WGw4E+Kl8qL/cYrjdb/Pp70uTpM2x3/vDzEsmuFqzCb2?=
 =?us-ascii?Q?B2e9s1UtI1npZxkyQivgFomCejS/vSmaaQCCY1plnzIJogoPWTF1/NwErnGA?=
 =?us-ascii?Q?Nqvt977apatigw38wXvY2GKYqbv3mSbyay1zVj+rGsFGqWj8kO0dTWha9JyM?=
 =?us-ascii?Q?HCY7BU1MfhMDfXfigvNWNKtT1348I7lcbpqhNPPWngWQvgERzqQtRaMF3y1l?=
 =?us-ascii?Q?tC+VvfSjWYAJiCRVtU9xc66xkqOyPYbXlvehnSYTpei5y1dIuSIQMDYSinRQ?=
 =?us-ascii?Q?28TzRYUSLVMimI46ycADh1MO1jmY/O96XwNvQ+3Deeg6HzNAz8+FjLO6yVT+?=
 =?us-ascii?Q?Z4WDtFW7QblMCfa/K7qbiqMoQhjp50NyQ1EV2k08WbwJ9k/pc6LbwM6ux2pA?=
 =?us-ascii?Q?6QU8ZvB8EqiWdWRlBR+9b2QKFSIWAFMyiloOmluCwccqKjF6Zdst1lXU+4uX?=
 =?us-ascii?Q?bzy1wQBJAkqSFJvE+ZBbWWOdr/7v+jNO8sCDRiwGs4saurHk1cWF8w97RKlB?=
 =?us-ascii?Q?A4YiGgoeLqE5KD0NRgWUf9mihPR9fyYN+D1EtrWCeRuN61SiAPUFzHRnh7g2?=
 =?us-ascii?Q?MV15QU37nxbuo8pGFQzSKqqnc5xscLAy++Wc4GSMxmg+FLFZBep8z2R4sTUK?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6341a105-d2ee-4f74-16f7-08dd1562e70f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:27:48.5143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUw99uaxl09DohFxCwGJ94Pl2ji+bUoQp/UWiK/JuYm75Y9m0NUHxGBP8tSKQOVK/dK3LhX6vEql8Szxa64az0O8hilXnTUuTJT+vNqJ94Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
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

On Thu, Dec 05, 2024 at 10:22:39AM -0800, Lucas De Marchi wrote:
> Part of the whitelist printing was already using gt-logging - convert
> the rest.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index f982c1cdb369c..ea958400a15a1 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -196,7 +196,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  {
>  	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>  	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr_entry *entry;
>  	struct drm_printer p;
>  	u32 mmio_base = hwe->mmio_base;
> @@ -204,13 +203,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	unsigned int slot = 0;
>  	unsigned int fw_ref;
>  
> -	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
> +	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  		goto err_force_wake;
>  
> -	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
> +	p = xe_gt_dbg_printer(gt);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
>  			xe_gt_err(gt,
> @@ -238,7 +237,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  
>  err_force_wake:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");
> +	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>  }
>  
>  /**
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
