Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E3C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687A510E9C1;
	Thu, 30 Jan 2025 17:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7Y4NOGJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DD510E9C0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738258239; x=1769794239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oG75x9TKiahpGEh+FZOvkmVHYkRsq95Hwh4+Lst7J2g=;
 b=j7Y4NOGJxGyylFo0Zc9xjPqpEHP9o5zxFauqD4/mSLbxrMjVIHZnP8gN
 kTOJFBEmFCejIJB3htSPUH3FR/JuNrlpfV3hznwa4GA75SMHSCO8c8v1/
 qfWoTrJujNqpOngsN3P+09cvXLWwCBeN2H8ajeOb6QYe7HgvUm48RXHy5
 Lg93NEfbQDqhO7F26vgDZXr+16SShbSmxJxcO9ybAA6xm3Kx05wHFGqLs
 r1VXsU1sSpLn9wKrVBLW7wrnHxwcvWXIndWn0iC7qJADnrOWsr5Ba3Sz/
 k7RIkTpNccBxABCBV9lmgWsRLqcvHmuZP56AbC+eQZzFtL4wezfzuVUJF g==;
X-CSE-ConnectionGUID: e5toXRYbQqGcPDTMykI44g==
X-CSE-MsgGUID: TAPh3z3WSxG8N3g5tLRuFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56245065"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="56245065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:30:39 -0800
X-CSE-ConnectionGUID: UeJXCcZtQ+m9eUy8le0NdA==
X-CSE-MsgGUID: ug3kS00yQR6xtuqEVrxARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="140287441"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:30:38 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:30:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:30:37 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:30:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvVnHIBHEzWs5SwWSirr1sBMxhlrFDhCiIetY7mPzcTcW84GcPtqazTKj3inuJFi3tbqJoCA57NOchjCOXGPFGCSMGla95N7j6o/QEoqaGgFcij4ofJrtG4xTkD8KKsbixB+JrCSHynAFkNculAfYerx2bE3757zuRdk0CptkHsCpdY5Gx/OuPcFXLOKv13fCwmPHpDiGkRE/AP1yPIDD8Nk36mXcdL8NEr0IgHGCR1qfIwnfVXqXYX1nXDlXHcTweJjkdam1QJkdlAyNhmWi6SMFfpK+oKimLbUuSt5ByM8AQLLFiUxqdXhLxrUXWFgC0H+umDsJ9GI+fAPsSdyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsOyZXmV1XX/i/jekIHOdG8DlIrt7gu9/PWW4zJ0Dyk=;
 b=GjAtrTLYN4dbTZQcXwFEMCxUSEUj7kxwpqhvAzcsuv0KO1/EXfPlujxB30B0BGn8MDgRBUd7icHu2ZPA+k7NWAn6+6UdMj+jAkwwtDD/8QOPYIAw038ZtOPasEoCJ4EwHtrjD0VFQyLShgUxmmPtyng0bCcYZkfFtBE/JA2f8dxEiu5r8AD6aXMT+lGqu+NJr2GJftoiiLA2V73Gmgdk4Mhk0qVdfehydz6c4rfBUGF/ydHPHv4u5Tgn1T9PFwFygasdWsSjpJ2ZOpF8sRHQqVtFTha8zW1vJUt659n3pEz8/Bb5YgsiOifgrBxfVpbEhyBItmEMMOe3CZS4Ei/HTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 17:30:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 17:30:33 +0000
Date: Thu, 30 Jan 2025 09:30:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129005551.106214-1-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5d65f4-f9fb-4680-a610-08dd4153ccb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kc6FJXMnRGntOFS4rQeypDLbZLRhYQrJHNvWX/rvNGf9Iyhm1JEW8/Nrj49D?=
 =?us-ascii?Q?tKPJ8pJq3j6WI2T8LxFGEoqDNEAf9mQN+9m+N9jDoC7kj8ne0TJOZZ70zCYV?=
 =?us-ascii?Q?ZjfHzgpuOZrduDm4skqEBxfXiQeNx/0vCBFS8/bw64zbORFAOt8pUSAsQYZD?=
 =?us-ascii?Q?Ri5T7AJvYFpjpG5AJr7DHJ7+qGio5+y3lCD24AKUTmCEBMVozUm4XrKuegwG?=
 =?us-ascii?Q?eaQA3fa+yTB2tgaWnEljVu4KFWhfl39M5AhIvHcs74Fc7+O41dYEFl/ULZCw?=
 =?us-ascii?Q?nt9mne5En60E7HCiuJThGjYJMBIW+J4WIbYK0c+lUZ0KEHszidyWwYdKdD0d?=
 =?us-ascii?Q?1HQrAoIHz/huI6ESUFAVzFi7a3L3ScLKmYXOVuaxt+4JXgflsVo+m0aXhzNm?=
 =?us-ascii?Q?eWcADBpL0nrKWzRpCV4CYIZMDfp/M8yxOPGCe8lz4rrWCBbabF6btrX6VSP/?=
 =?us-ascii?Q?RoVm3stQUmdSKMAVdvgsIGBm7AvSCPn9GcMoGKgInDTN60r1WRDkgJnQgIW0?=
 =?us-ascii?Q?QaIjODqIR0FH18GhYzWjEOSDWJhT4AdW2KZI2RzYSXvwAXP9Kcc0Zr94cXk5?=
 =?us-ascii?Q?x7U06yQ54LhE+oGuM7virwS4ZLWk4s8i3GN2+7ueR+NY1LERuP3O7TJWkVlY?=
 =?us-ascii?Q?3Q6mGP2jBywmBjcgK1rquF4ZTAXr2rOhRbqWygBAHMiARqJpFoR1be9Z+h4C?=
 =?us-ascii?Q?ORcBzbW29/pWpEj8aBjaBwrCSRQlFIMAAv1Ql+IDT5Qs3bEdUeEtc3R3HQw1?=
 =?us-ascii?Q?/eEV1L0UpQs8roHLJwPriHGn6zJMgG+CCP/G8TfVMiMDLhRCIqgA2sa7fo+Y?=
 =?us-ascii?Q?VMAgFW7ldTOgJbG3jqen0V5MWy7xVBgKzXY34QEs+SzHX1ijwo+BBV/3l6ok?=
 =?us-ascii?Q?fIPeGLgbkW2PsHbpGpoKP1Cx9Cq1x6330oNUaDXrn0O1Q35q6QcMqqt//b55?=
 =?us-ascii?Q?445IBd0C+uAJlbROVX7GTlGrdWyRLC1laCOtfuxpEbVSgOpMqTTR4nxonVTM?=
 =?us-ascii?Q?9itAYO5/u0kC4VOttKbBTmaFvpwewMI1cKhgHfKVxcUgXRH43EcNCln0TUsG?=
 =?us-ascii?Q?jiimbFpj91iKWPqPt4eDX+jwhis34n6CUi1YqzgCJzaSK7PloI3RlpyP305N?=
 =?us-ascii?Q?04+XRIj+wbcxjvZLFN4oewL7nLA3VyfpjjDEBHAG0swfV5fkK3aElPnHvbhl?=
 =?us-ascii?Q?bM+Aygz4tsL01/OxRUSXTYF+aoPFfeLG5aRA077sr7cwVP9w8seG6YgPshrI?=
 =?us-ascii?Q?JtdX4Gtw0k/BzTTHsbXWhwUM7Y/FUIDIRRm5YCHnSsaGF8G7JCfKQsaeS8Aw?=
 =?us-ascii?Q?S+ajYQOh6FpNfd4gTWnqyz4nlcIEI86Un5yeexqJ1tA3cooQVBgO9oilDYbv?=
 =?us-ascii?Q?1irljaL8SZaO3YWgytFxJ+IHV5yE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ZHtW+Uwi7S6w0UvIhI26Yr9dmlLfP5J5jZb3dbGrtQ1Dmx+UfSaTPzExKMG?=
 =?us-ascii?Q?JpXoCdALiMsbjlkN8KYlBnj+DNbp2LiXo4UQilw7HOa+vTLWkAb7Q8i0eMdq?=
 =?us-ascii?Q?YQ/GGUAkKzRYtw7ddVt9QsaNi966JTbiJoXVtgsBFA6c0SI8nvYdod1AlhkH?=
 =?us-ascii?Q?7Xi+9j0lIocIKP76DwVKp6NALAs7d9amspnBPF8GZ2nDputS4bvRkf1tH5C0?=
 =?us-ascii?Q?mPeZUDNlZLg/fuLpODKn55mA/e26GHzXshG8hwaHVSiGtpDTgLQ+/hr0/Cb7?=
 =?us-ascii?Q?4cveXtVM/D5s86JZ+ZNzhZ2V4iaOyxdYGMPzCNjNDvbcZFfxcbpabGKbUiNq?=
 =?us-ascii?Q?t6qqHo85S0/kCp+5RqLuUpew/bMYRAxaouGqDqv9y3zyavp6mMZN1JW28k4Z?=
 =?us-ascii?Q?V6EtEHS3WH6RtW5VS/snCwTdUF5O/Y+RUU60Pod6gjOREQlJSwaS/LRrj2ml?=
 =?us-ascii?Q?S2z3niQ7N8yRqqUkEz1GYHM8f28hl25poCmZeqKLwCt/2ivHp503k8LHqo4n?=
 =?us-ascii?Q?Yb8UUTcnAI/SrHzlaXEukBK74KcaKtGovksSoAqa31of7gORw30seRG7wo2K?=
 =?us-ascii?Q?xya7k2PmY4kiuu9X4WVOpv+EKnUaSliRAkMRP7KuUkRzT9cyy83HRc9UPXaW?=
 =?us-ascii?Q?ItO4BzB6KOukLL+LbrDetbj+3z+uL/IJqwJ32tB6fIAEiRN7Ezq4Sj14ngR8?=
 =?us-ascii?Q?lg4weDgbvuJccvKWJ5eqpAHEQ8GIKR0+mxJ0MDmxnA+mKFRZfOsHNsdlnmHG?=
 =?us-ascii?Q?tK1qEGn2oxZY07fcj2Dg1zPgEytSrdx2wH7HYs3rjPcSrT5PjUzU/zsXT+hM?=
 =?us-ascii?Q?NfOhYWYhgc8LxPP0w4R4PK0mvGBdCVWA9UiMWyu9syG/uop7fgS7EXFk00fN?=
 =?us-ascii?Q?ADCQxQZr9xY2jdDs0R86+fNhegKPhwXICPUTOJLiB7HC0K0C/vVr1ezVyZ8e?=
 =?us-ascii?Q?CUsvfMHXy5uvdcr6wEtSfEdbENYcZ4XCmciaYzfj/vj8dLOSF3dG9NyxoBch?=
 =?us-ascii?Q?aL7usRRx2X6B5Q0AUX0X29ri3t0o4txmO4wvLRx2YFBsAc+UI8+Gy4CxXqGX?=
 =?us-ascii?Q?NUmWtwjxlqt7Qhx0nVeFIEN4qWqxehtn0OBRYamXs3swqPC1JZWgHAHSCZt7?=
 =?us-ascii?Q?WDg5P+KvTawgR3nTLtKUDBOZV0uXTztCc8nrc7BlXn4S0KSP0P7L7z/AAIck?=
 =?us-ascii?Q?sRGQKy7yqH1Y18D1ebsHgYKqXiDyJEOVVA4jaRRK3ydmS3/hrvEa9KPcOIQr?=
 =?us-ascii?Q?iYZRhixTRN84Ss1XqNV3nGwXxAm7/kF7pyyrHpzRRBUk9KAN5MCZJUqhZegL?=
 =?us-ascii?Q?evi22NA/0E/9NTPOAZL+CDFOKMRaq9wQ8FeUJA+cV04mjYF/1lF4qyhYwdpW?=
 =?us-ascii?Q?5RwQC1I1nG9D6sME1CZxD7dxnqBSZ0QBIW2+xxsvJNHYPi+hD0ViWLKhHgMp?=
 =?us-ascii?Q?hfdzuzuM0+sHGWQfSv4MPyjCsZCNCPmKZZDIdJAt0J8WHI9te+0014EHzoU8?=
 =?us-ascii?Q?rgq4nsWJmGK2yZfm/ns04uiY6yxX8cEOPuYSXBiOc0T/XPslC2Hay9fQOtlb?=
 =?us-ascii?Q?0CI+uCOu1JiU3ASRM5PqR963X61WideMZKLE06J7h9aUk/JLX6gduAD5yyow?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5d65f4-f9fb-4680-a610-08dd4153ccb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:30:33.0648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6PaLlqy0JAdVvrnY2yBpR8UqW3tCYobCoX5PtrIibSrdGUYmsSN2aq4i7m8bO1BO1u672KFlTdWWhi0mk3gezrJ36btqM/wrc9CB0/agqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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

On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> wa_15015404425 applies to xe3 A0 step as well.

We really need a better commit message explaining how this workaround is
different from our usual ones and why it needs to be handled in a
special way that's different from all of our other workarounds,
especially since someone who just quickly skims the workaround database
without digging into the details is going to incorrectly think this just
applies to Xe2 media and isn't relevant to PTL.

I was kind of hoping we'd add a more well-defined infrastructure for
handling device / SoC workarounds.  Adding quick hacks like this is
going to get out of hand quickly if more of these start showing up.


Matt

> 
> v2: query based off SOC stepping
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
>  drivers/gpu/drm/xe/xe_step.h |  2 ++
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d321a21aacf0..98d068ad33bb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
>  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  {
>  #define DUMMY_REG_OFFSET	0x130030
> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>  	int i;
>  
> -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> -		return;
> -
> -	/* 4 dummy writes */
> -	for (i = 0; i < 4; i++)
> -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> +	if (xe->info.platform == XE_LUNARLAKE ||
> +	    (xe->info.platform == XE_PANTHERLAKE &&
> +	     xe->info.revid == PTL_SOC_STEP_A0))
> +		/* 4 dummy writes */
> +		for (i = 0; i < 4; i++)
> +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
>  }
>  
>  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index 686cb59200c2..879486a818e9 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
>  
>  const char *xe_step_name(enum xe_step step);
>  
> +#define PTL_SOC_STEP_A0  0x0
> +
>  #endif
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
