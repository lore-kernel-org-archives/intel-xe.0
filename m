Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14D1EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8A010E8CB;
	Tue, 10 Sep 2024 18:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQ6A9+F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FB10E8CE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991757; x=1757527757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pL9Rv5sy7E9A4lkDLOJzKR0ByOpkwR1fPCWQ3IFjBdc=;
 b=UQ6A9+F/JHf4RwJcgvrIhG9XAevA9VwzNoEKYRBsKTncXEM/6+rEU1M5
 diFHXI7Fc7rA8N0XEOhbwNrvhPb9+JdQbuyBHEepAjIEKxv0QViAjB0w6
 btXPwJ65Vha86i2VXdnNGzf3/89KAYOv9L7oH21xvwQvTPpCfF5TeDkpn
 EVR7RwauUyhQCQ5/5u527rA9kAbeJ4JGaCw121cGiRRupkyiYKQIP5ff+
 jurhjq957hxj/jI9mI/IyyWm7sf35fNP8R8Ea2Pj/v24fTR4Lf48nB5OA
 I1j8RXxyUCQC3gNPWTfuO/g1XWxaJRXQoogII6O4NgcuSGLvlmSrFenrB Q==;
X-CSE-ConnectionGUID: o3X6Z5BcSzCgWwbf1IT0IQ==
X-CSE-MsgGUID: 2oodF+BaQICOAofRTwqN7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24256837"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24256837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:09:11 -0700
X-CSE-ConnectionGUID: aXIkTnanSt6HHATiVotdng==
X-CSE-MsgGUID: kiLG93AhREOXpLkLvkGchg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67628534"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:09:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:09:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:09:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbmgQLBMD+KvfKOC4Rwl+0Dy+WZTA7yCFO2I3SFKwf1zkW1WnnVCHYjOSBHOdXw+TRU6Bgn8DFI0UC3yG3v7JW0SnIz/MU6jFTh1ikAov1f3HdKi//DtnDbvN4mh3Q+JFI6uIxSdl/7dOwuhLP0bGmjNf55sNIPHmJwYsHZ5W+vPfKzV0JRPpjiSB7K1OKjxrMc3gh64fCaH+WeOmEsii+z4YYTZ2y9z2ABrbUGMztCjqTpYXHxFFR3Q/nMVgurrNaJVbj8JtV+NdpjyIIpRGHmDS9ihOLbv9rWrUUGsMgB6nnJSZFQzs/3Po3iZ+s7errkbAXdFYdkvuYSuajt50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E36w1tUGHnzeOCqqygrXPw9CT7/nu9/NE2SSsJ2eJO0=;
 b=vjaE1XK5t8PdCTSukrNZYySp4J/I+chFG9tVgU0CxvTtX+5Udoig2e2gOtO1abe57D5gkWiHdi8flM67IU4rF1zlyACNzc12joJ/vl2lNK2JG5tlrBhZe4DjsHJ+berRVFdVywpFoDpPtlsHyGj1t6srXdrYBqn1dIkD0F9cbFcs6Z6RpRH1fpOoisrXkz7cvEBhNkl4uzQi/5LGjOa87NcnlVAYGczTiKKJgAvP1/yrcemRH901KIzWl4wllaQGZhQkZyXN8HOdUgXVs6PSNldYqE6Aiz6c05y3Ldc+R/gyKGDVMYrgC1ZGa+a/XggrNd3VYfyR4gInbwloTOIoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:09:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:09:04 +0000
Date: Tue, 10 Sep 2024 14:09:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 41/43] drm/xe/ggtt: Convert register access to use
 xe_mmio
Message-ID: <ZuCLPWjn9A8EYmo4@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-86-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-86-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:303:16d::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f41953a-0a68-496e-eae3-08dcd1c3a7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SfylVDn8haCo0Ul//DdY9KJUmdjfuFHfEwo5rML5etkjpQCnuFmFN6eNADZe?=
 =?us-ascii?Q?u3eQou/x+fJWFVJlBt/DRRYao5NFXnsUKfpWrDFr4Gd6w3/oe0HhpIzhn+AC?=
 =?us-ascii?Q?2+XM8rKBXdARdpcGfd1lqSzqY8PM/twXkUdz0pW32nJsQU+VHdPoQvDL5jkf?=
 =?us-ascii?Q?wrlogGgEJTlthuHovPx5hrHmzuuZ1SHKbHicFjhx+ZtFdTzAA6BIqzANFlss?=
 =?us-ascii?Q?4gN17LmbtpuPZQoFaF48Wko/Tj8tuPtHZ6uXB60fWcaG+fzsWTTm0N8Gu0/i?=
 =?us-ascii?Q?q5oWS1ZF1hye8nwzvzGnAXC9DlWoJxTOd68XouE+WuqB4uXdCD3R8UIvmk/W?=
 =?us-ascii?Q?XWyKQkSociCGQWcVQ7YNnis6YmMurgZGtT82QlQB8EWwQ/JMC3jSHolKpQBd?=
 =?us-ascii?Q?4ECdzpzS/XwVCPz4sUzntjMdEb32cMFjb+4Wxh2Ki7Jw1yNBu5AkPedAbPfs?=
 =?us-ascii?Q?fn2+0H5Zc5gpddiietxyZRCg8hWqPVcuWNYBrFHgZ2iraYWn1gfhIMcxnjcG?=
 =?us-ascii?Q?olh9ETqY3vngkMnlmcrFP921ehQMfVGf3N0oeZkYfw5v+mFl/Fs57TKXubDw?=
 =?us-ascii?Q?Cptwb6pn79wu+28Oz4XV1RDdtaCwJaUNyodMA+5xnswrQpR4773dGx6qsQ8w?=
 =?us-ascii?Q?wX5J1gD7upuENqEbXOpNzP5jCTb0UeQa1WRMM/Zic9M55rWKBugtpMZ9RjD8?=
 =?us-ascii?Q?/b1biQtv/ti4k4C39bs62BF9EptjLHzSPZuHqhYOjEqedQxXr+KBhf+099TN?=
 =?us-ascii?Q?kP8yVu5+I8nGNVqjXKWkhGO19QjaEKXJNlOHpF+yiYnqt2HhZFVqHf/SSvBW?=
 =?us-ascii?Q?7d6ew7n/njrY1LGlXNRnrkkmo3opAwl6Nl1lNj3TMxrgUQAtbMeRvyeTS6ZH?=
 =?us-ascii?Q?Hnxts/wEP1atkjR2CzfMIPN75oM3KLy0gRcZ4F9+FpRD1GUzWwQfSCmzMWfz?=
 =?us-ascii?Q?7iKXpCh4a08tHz7GbWu67OonwDupH/OPEj01Uzm6wZ3JK/azGWKY0L5Tycs1?=
 =?us-ascii?Q?5HYE6aG3LO9Ti6rEZdpbkK3i6f2I17mtEODZdyZPm0jFw7/162XGUMUjdb9t?=
 =?us-ascii?Q?kN0vwds6YEtcRJsJZrY1yo8rOVFwRajoBkLoZnwwNtEwuX72KEOvrfjhqqOm?=
 =?us-ascii?Q?JFkUvY95D0z9OVi9NRSNwelxY423JAEPb4Gj+q4PccCGJdLF3GVM6f5oFbY8?=
 =?us-ascii?Q?hQ274l8bZxNwyMybueEc9zYn0b+b+sB0KEGKIO4hc71ZXsewhQmaXV7MktNX?=
 =?us-ascii?Q?pfkFgKlvRlxMmbttkiXKSEFvPjoeIJMtYmwY56FGZVSID4ThCC8UWbdLdGtJ?=
 =?us-ascii?Q?xO7sSGHSZWs18AYY9VwURE+QKLTBU7XvIS/w4ck0KXN99g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQ6KrvfTZmS8ipfL9MsFs34ed437gPdcB+wnUwgFbtMdqbWNK/2ZrPDZac8i?=
 =?us-ascii?Q?coVFuoXcIP+mgSMlMzqK6neSXO1hCIV9k+jSoSGP9RmC+ntLvthcIH8Dg/id?=
 =?us-ascii?Q?HOTklghEM48TZumtQc6oQ0HaEO3qgu2QbDvcAMmfvPodY4Yy9H7aIQLukDoG?=
 =?us-ascii?Q?AQTypwJYBLWtKoSsqEdrcVf7u87dI9HY8Oiu3R+TiYF7A1qiqAkPL+Ye6qkx?=
 =?us-ascii?Q?j2b7GouLzimVnhtllGWWrWT2+OJhA/nOFM7+buOiqkV853Ku+FwiE/qjNGSz?=
 =?us-ascii?Q?YyT/XTwwfY2KhauTEUUhLmftaVUO3AcW+F9xhUOwO2hpbnqusx0Tmc4cD4Ib?=
 =?us-ascii?Q?4Dm/LLzvh43mUNN9fmbZwxvKzL+Plijc0gopGHHszfOml0ardoYYapG0wGrk?=
 =?us-ascii?Q?rl4kH3J5yZgAMzF73oKyMIaameF+Yrkg4idGlM5FvzcvNhypWyEZf9I9yziM?=
 =?us-ascii?Q?6xwSRDtJeuHouB2vJQ1Q8FwW6WsWFJqf8pQoNHGIO1Gsql6nKfmKtz6zIMCA?=
 =?us-ascii?Q?zYdDU1H63lNKJeQ4UCVBQhKDIflvVWhBNVBJkzjbkB2ygym45I7nj7ht6THg?=
 =?us-ascii?Q?DUgBH7M7wWIEc2tXljV39wdztNXoQIcuqNUemKXaq8H/6ps33bNamea632os?=
 =?us-ascii?Q?kvTYybz4al8EvY5M2d8VJ5yqlDDucP9x7WfwylewzlnzE8BlP/sBfHBWlgP5?=
 =?us-ascii?Q?JIqJH4GEI3ydmDRIq2omS9+89Qm5Q0Fr9v4pY3JKQoAK/uKTmF3Cs9YPqvcR?=
 =?us-ascii?Q?o+K6NseGdbqyS7pw2QXOCY1SMlNymuxGISpzoEl98mj7rnc1k0FCUGApHT/w?=
 =?us-ascii?Q?lXO5kDxowNsLzYrsArMPu9zFfNrNkGBJrSYVlZu09DKg4GM/8BZB7wPdgEvQ?=
 =?us-ascii?Q?FU34E8PUHavBgFV/wm+snRTJx90vqdQujdxuJEiEDQfOaJt/aAPIL1Me1LnE?=
 =?us-ascii?Q?w3hkYWMVqkosm2uTG1i2XUNZvhSukMBgtjbjQ5X21CAkeuxUraY8rsO392qw?=
 =?us-ascii?Q?H9+Qx+2RHwV+Yd5usn8QgCJmdgA5CpDaHj2dPj0lXgc4H4KIJqIJ5H25xV4c?=
 =?us-ascii?Q?zpDA6Z6WwsrEl8A4bvcUujcMP/1dLT7UGg4Dta8GLe4cr2EyEJ2kZ6HxQYwq?=
 =?us-ascii?Q?Zy4DrYKUqzh397yFxx2gn2iLqwVbeGZk2IqlO6qC9J8hTv8GnSfp3A8M2fK0?=
 =?us-ascii?Q?bfIlWsD280d47g6uZltMjTuEJjzOrMWXcmj3PqsPuD/jbPxMapXjk2dt64P4?=
 =?us-ascii?Q?WCtr96UQ0XIrkjuuOW4ZPa5na+qVOINpyHKO4mEXuVqvoG22Qn8IEEJgNKGg?=
 =?us-ascii?Q?qIJbUMPJ39X1a+nTEedRotFr7xFJPORHDlys5IJ/f4WUrZs/VXbAOpn/PjsL?=
 =?us-ascii?Q?ajbQEzP30nAR+tvdWwstmiV/0v+2UAQ9lZFvfC8rQr4ppssTd5WtLDcVZRPN?=
 =?us-ascii?Q?TSuNCxARaj17fbR21MC+S+qXCAtCFskf9qPjsNUfYzqgweCYmax3my3Byalt?=
 =?us-ascii?Q?Tj+bIz7Qh68sUyVN0Mr17QkFLrM+aOKHDmZlHJyddamMLnh6b9Y1cSNU9Bry?=
 =?us-ascii?Q?28TYs2Lf7peB0ffIx17qJOA4Rq5NSRQvKxHyiDpmZs5wETAkUtUBd5ZRUKh9?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f41953a-0a68-496e-eae3-08dcd1c3a7b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:09:04.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxW+sjRO/wViQqApMk4IzYOenI2dkwTkPk0srVINMreGYOOBHlSn7C/JMXSdipp/Q09rI89qHL3FZEgn6VS31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:30PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f3fca5565d32..0f4e778a7663 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -107,8 +107,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  
>  static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  {
> -	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
> -			   ggtt->tile->media_gt;
> +	struct xe_tile *tile = ggtt->tile;
> +	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
> +		tile->primary_gt : tile->media_gt;
> +	struct xe_mmio *mmio = &affected_gt->mmio;
>  	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
>  	/*
>  	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
> @@ -118,7 +120,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  	lockdep_assert_held(&ggtt->lock);
>  
>  	if ((++ggtt->access_count % max_gtt_writes) == 0) {
> -		xe_mmio_write32(gt, GMD_ID, 0x0);
> +		xe_mmio_write32(mmio, GMD_ID, 0x0);
>  		ggtt->access_count = 0;
>  	}
>  }
> -- 
> 2.45.2
> 
