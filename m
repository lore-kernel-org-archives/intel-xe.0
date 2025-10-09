Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7101ECCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 17:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3300710EAC9;
	Thu,  9 Oct 2025 17:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYso6L4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C8410EAC9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760030936; x=1791566936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BVs2ke7ItyMm1+aygixs24hJkezGCTbU7FN59fJLtsI=;
 b=gYso6L4dmbQ1fEoUBCI1e/pC+M/g7BAbUfrVdamcOxSOndicVbpV4EXB
 xlF1AaZ+BXtAz+5SyNO2/nFHTfDVib2KdID+S1ZH/95QXN6Z2Wffrbfv4
 iwzPtFVPQcSb1dVUs5oI280GOF7F2C3cqmFMTBqlDJpyKSgmwViSAHsFL
 ERbgUA3yOJKUF+jM8ANDewnTVHFs51a6ho1Fm5/qMKrjSBf0ss85s/OQb
 hqyEUl/fyzNxMM6zE01zhxCe+3DjaFTXJY/LyjoppOpdP3MIyZAExYiH9
 m+f0e/dSLhvHaOhfJUfnWFpCxXLZsArOw5NOtBhQmKpeJZYgJpH0McMW3 w==;
X-CSE-ConnectionGUID: +iVJrAtgTbWM1XfAqUsgZw==
X-CSE-MsgGUID: y4ULF2bNRSqaEAO4CkwZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72861551"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="72861551"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:27:21 -0700
X-CSE-ConnectionGUID: gnBuHYaCQ2u41nulJZyL/g==
X-CSE-MsgGUID: oNFrqG/cQxOHssFAGxtXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180709413"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:27:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 10:27:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 10:27:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 10:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jABdevjceEP9ETEXlEnX6Px7GWJsFSKuSOX2alzkYA/xBelxE9WEdky6yzxbCZlMj2sntYMrV8aWt63gskFFMMyjYTekDJRxhGH7Sp90LpdLEeOIGBGtWFYXmY8fzoMmHeQAer9c+K7ohaB71If1Olg4smJO+PrJZ2NYwkB2RhSN1VYhUmw9QUf3v7rvQKxaIBXzHYl7eLWgIuDpHcVGob7VNz+ltozQY9zJPvrTncwH41805z50bgpVHCOAjpD8hJKgnKHGDEOD7/D1R8uEbrXwoQAlAEZbyxZ5+7bF6QbtGPklCv3odlqpE5E+USEL4sIWB9aeXQ9ND6soVXZd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AnVAm+eKJ3aRK7akKgvgiBXrTXdgsmxhqoKu/XK/cI=;
 b=JuOEB59+cTyQs7XFk2IBordMZtau/294J2JT+W+P6lP3LjlbqHMnwdK33pyDc2TJyLOoZE/fIBtH4aSakzAAWHKooh+fTZ5kMBDvlKFkQByozoKjlW5DYfuUIj8W5uCWE/CoOXwTTPZqbCSvBm69LQ0b8E7UCaGop/9s87OLTf77fhZHcwGDnDgf9FcTuNvUzmTP9QEPdTbzq8vvJqXTYz8Ttk3Gf7wi5+EjNuzdXPAX5iFKQVtHxJTMPsVsJQziw86zC51i1muc3agtXs0Wc8rsT8tRKN4FyTjhfJ3JbR3fzHRnpwp7bc5CvNogSfqFQ7ogpE4f4sSw4/Iu1qYA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 17:27:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 17:27:13 +0000
Date: Thu, 9 Oct 2025 10:27:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v1] drm/xe/ct: Separate waiting for retry from ct send
 function
Message-ID: <aOfwbbi6/2qhywwi@lstrano-desk.jf.intel.com>
References: <20251009170844.178199-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009170844.178199-1-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: f3394985-429c-442c-c9ee-08de07591552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xmPNms8Ma8rDU8JtwLEJ77tQlWCo2KVjg0UNPtsAjpW0qnIESvyv9tn0kKT5?=
 =?us-ascii?Q?oXHYMmf+w/Oj5C0QwQkA7nXGnoKilFu8F/JemwGicoQocl5YGoVJ4159rhFU?=
 =?us-ascii?Q?XD2ZNmHzf/Zdd5PUJqjsykLXirXKIgocVYf6646Z7Spy44l1mHGFcZeZr3fY?=
 =?us-ascii?Q?WLMAOPSrHssh01k5fBhYdM3RW34d7YTI4dIDQPQ50mkZDRE7xJ24hjhoPod/?=
 =?us-ascii?Q?3XaXTWKJpHAYAKqDVk/ODGqrKZN1WwoUjddZ0X1egEeqQIsMKfKC9eM2iT6x?=
 =?us-ascii?Q?pIKAGnKzZ6wLMx90hTnLVjzJHltVKdQPI7hFZ1QOVUGnzUsDhpZHoJbGCh86?=
 =?us-ascii?Q?CuRCU7/BZhu1r6eXohAm060odH1XAAVRyo0iqFMiJb43YHwPe+nGKn5OiuPr?=
 =?us-ascii?Q?a4PVdFir4yRjrDcKEbJMGmgtrHb/iVA8X6DCCc/hLWWlwtPAlo4KeKSEJGrU?=
 =?us-ascii?Q?wwtqOxQGEoAwUwQL6OhDSJhLBNRk0Qa4t6PcshsAwzI+D7BaX2iHhUJHUIcL?=
 =?us-ascii?Q?sX3NCgQBZkBGSDlAtSNidXDEjDGmkdpEawC8oi5e/6RXgPr3fe9PTylz0kff?=
 =?us-ascii?Q?juA/vMyJ9Fs2WqbitcJ5Fdc31KVDY8bs16/VwzCuVCslpg4dEBciFpo7MADl?=
 =?us-ascii?Q?3ckbJzKRBKp1w2mH0RhHz2B7kfKobNZdrBqrlWF8G3SJmrSqMSxh9OiaGljJ?=
 =?us-ascii?Q?9cBBBYx3p3YGRWowwir/16awV/FojsDEKGTo9NjEW9q12F5QVmJjV0VU3988?=
 =?us-ascii?Q?V7N+KIBH/0lbsoLHEQMjAPuHox7UFYJlBtEYj5OQA671+PwbGvc7e5z9FLFJ?=
 =?us-ascii?Q?I0S7mCI7LW18znyxvDeZusaRN8JVRl0l1J9H72zcyUV3NfGO9tok8lcwt7Ri?=
 =?us-ascii?Q?EKI/9LgNFS7602wjTmjdodnBA1ZLK2DEr/AwR6kPFQZvymiSDjDm55IPRDtn?=
 =?us-ascii?Q?5cbLSEgv20jYz74sKxQsSjSjCmKVvWV7H6AVhNjnzLQjkfd9Gn0/bkOQxaD2?=
 =?us-ascii?Q?faWf8MfBw17LO9ZAxoBqbm1b8HsLhnGkYbSaWbwNs0gUR0xeeO9ppDMVSlG/?=
 =?us-ascii?Q?5jtzQjR8S0N1mmJqE/GGsCy1lvp9fwlofhR0gGQQFtv6q+5BvPy83wxDhOX4?=
 =?us-ascii?Q?FIYQPlZa/8+/OfFaWkOrb6WZ6kRlzlU1tsGqxC1NGwz3t0+sixT41X1FvVeD?=
 =?us-ascii?Q?YYv7QzClA5pELDq3+kzVoSPFrjpiL/7RcjSH9Jum7JmiZZ27FvmxrjpZT7q5?=
 =?us-ascii?Q?MEEZWHv4aHPCUQUCToFat6GJ6uXHA4UY6yxffVTcSq3mOqJaGDrhlSV4dO9R?=
 =?us-ascii?Q?g/VN2lUxE4TyNmHYZABgrlaZES+gtQZ9BPiy7OxtJsYEL+FF6MnKoLuzFJVb?=
 =?us-ascii?Q?9cv0Ummr+4t+x7pOviae6TuPFtErCnr6ZmhZ47S297v0GoLpocJAL3I7P2eX?=
 =?us-ascii?Q?8QxrGMOGdRWgMSN+J0hZPsAd4tRduBOG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7k69fHnLxCTbPqCVBN2DlD3X6Tmjd8qd5pQevI8A/NLgBuVAdUQbFR7c15t?=
 =?us-ascii?Q?twnDYoe1r4eEIDiEp1Rk3PWv5u82HTQdVuxJCC6NiLFWLfFThsaLgTFUN2Ht?=
 =?us-ascii?Q?v+8+PSg3NpTexqFc/XAd5wxz9o9rhGg8uY0jL3I9NHIiYdBKlDg7y0eJB+Rm?=
 =?us-ascii?Q?Q3WbvJ0naYOHjQxPsELSC7Ry1yG6OD3LrReS8VQF9zUXOy1AxN8wjK9rlDuY?=
 =?us-ascii?Q?BFz6bCXcnnKAJ9mWoLK9dIVCWlpbeJFWIpIvJEiqjOcz1ZIbNR7r4NkSbhLd?=
 =?us-ascii?Q?qJ2omISHDsUIEyDSBCdpE/+6bkRQ0iP0uAuUuFlkKFEeDj8OgIKJr6qyw26s?=
 =?us-ascii?Q?A3AGnUpgdO+nA7mFt4OnYTBZTCzH1VygFDMVkH0++mSUT8qSIGks792SnO+A?=
 =?us-ascii?Q?rV7+WCqmoPddKRXgHdSCl7ogL+EnQo0IEeD2cK1UJPxlXLvyZ01iH1Ocf+FN?=
 =?us-ascii?Q?KAIPX9Fxz58WH3fVllVgH1fEtvATw1bCjVXPUhVhdgbn9SfxAVNXmf65xWZt?=
 =?us-ascii?Q?x0EonHIWKX/8J2Q9jA/d+/xVH/mzb8tTQVa7+UhIS2DK0zQLJfHBiRmroHkr?=
 =?us-ascii?Q?JNtsWOXF1jUMVFoAolxpjHclb8eYGDViDLvRFyuOR6Tdrh4UIc1rmtzESsGs?=
 =?us-ascii?Q?BvQEgkq19jlN6ZAnyzxun2fhe6D8SMatEeCuhZSkixeur4BA0A3lT+0M4Quc?=
 =?us-ascii?Q?/O5ZS536zWJq/TrWCg/F7v8C5uWqSCPRydIy0Djy7TbRLhs4dP/+pdWyzvrT?=
 =?us-ascii?Q?t2miFGjieklF8cq2Tur8qPt/aD5ii1p4nWKYo2wsWoMQavmfxzliObMhPnJR?=
 =?us-ascii?Q?wLWUCS3Y3aTy+cTRDNlre3pn+ibueQX8uOO5nc/WLdIxzCtIqfQ/FJRuMQwp?=
 =?us-ascii?Q?uvn2yQ5rbjG+79HeC1zc6nmhWHPE0LHgyfzmP0SFQc6T78DuUSt8rBzWqs19?=
 =?us-ascii?Q?q5qr/bIE3L9MHrcuhLjLOk9lbeTEOTTPc2ZoukdPtqCmVx2p0kVBMZerDytV?=
 =?us-ascii?Q?POgakhpR/t5k+q6dUTqglzvIqLU+LCfXslNhprN/KcYeKYcdvM9ItA7qbRyK?=
 =?us-ascii?Q?WpNmZGe+/K3vKlCzaXlV3VMKQ3lZnD500mw5n4BCCHChp5LwngXdtYIcJ+NR?=
 =?us-ascii?Q?djQ8GVFUsxl+hRnepoSPRxcey/xaMt8bkpcy/jKWneVqC3Q5LpAD6samV7ln?=
 =?us-ascii?Q?cXACIHhZSZuzb7Z80K/lh3VAvR0q+B7N8wtJSo5mzWRvQ7sCw6Xcy1kkk6hV?=
 =?us-ascii?Q?202Vmmc/yvdQec9vLMx7qv9ZoeQrCzdYPXTMcuergf5C3bnVdp3LDHfI7p9X?=
 =?us-ascii?Q?IkMYL7Bf1TiNMwV3QtQVhOo4ecJ0EJexpj2ZUpPCnw0kTWpCRMvmAa8wzZdj?=
 =?us-ascii?Q?VVBIL0fjJwLXtMFviT5+kIYjXaY5NzmyfY9aNVSJUROpsaJ++Fmo+sC4tJpd?=
 =?us-ascii?Q?jgj27DGKe9yIu8dtAUMZeP+qy5HQvgiDw8L3PLnJDY/p7Qvx5oHmDDpeboFt?=
 =?us-ascii?Q?3BOk6KvV7MSwmWxyOEkZmYSlgLdJhhQNMrNTgQ/4eF1YVqcMpyJjKE6oyAl4?=
 =?us-ascii?Q?QzM+d4SckXUtiyL88++wDDcH9FRzMRssYSbZL7ucEbruAt18+nOeW2mvUCgo?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3394985-429c-442c-c9ee-08de07591552
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 17:27:13.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzrRO2OlFAm0sab3Fa8OkeVj+I+1PJE8K9WGfJs/09CCTMGqUvkR1P8QyrD2ihL1pVce5DA2GRh3p0codXSGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

On Thu, Oct 09, 2025 at 07:08:44PM +0200, Tomasz Lis wrote:
> The function `guc_ct_send_locked()` is really quite simple, but still
> looks complex due to exposed internals. It is sending a message,
> and in case of lack of space, waiting for a proper moment to send
> a retry.
> 
> Clear separation of send function and wait function will help with
> readability. This is a cosmetic change only, no functional difference
> is expected.
> 
> This patch introduces `guc_ct_send_wait_for_retry()`, and uses it to
> greatly simplify `guc_ct_send_locked()`.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 64 +++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3ae1e8db143a..e68953ef3a00 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -991,22 +991,15 @@ static void kick_reset(struct xe_guc_ct *ct)
>  
>  static int dequeue_one_g2h(struct xe_guc_ct *ct);
>  
> -static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +/*
> + * wait before retry of sending h2g message
> + * Return: true if ready for retry, false if the wait timeouted
> + */
> +static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
> +				       u32 g2h_len, struct g2h_fence *g2h_fence,
> +				       unsigned int *sleep_period_ms)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> -	struct xe_gt *gt = ct_to_gt(ct);
> -	unsigned int sleep_period_ms = 1;
> -	int ret;
> -
> -	xe_gt_assert(gt, !g2h_len || !g2h_fence);
> -	lockdep_assert_held(&ct->lock);
> -	xe_device_assert_mem_access(ct_to_xe(ct));
> -
> -try_again:
> -	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> -				   g2h_fence);
>  
>  	/*
>  	 * We wait to try to restore credits for about 1 second before bailing.
> @@ -1015,24 +1008,22 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	 * the case of G2H we process any G2H in the channel, hopefully freeing
>  	 * credits as we consume the G2H messages.
>  	 */
> -	if (unlikely(ret == -EBUSY &&
> -		     !h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
> +	if (!h2g_has_room(ct, len + GUC_CTB_HDR_LEN)) {
>  		struct guc_ctb *h2g = &ct->ctbs.h2g;
>  
> -		if (sleep_period_ms == 1024)
> -			goto broken;
> +		if (*sleep_period_ms == 1024)
> +			return false;
>  
>  		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
>  						 h2g->info.size,
>  						 h2g->info.space,
>  						 len + GUC_CTB_HDR_LEN);
> -		msleep(sleep_period_ms);
> -		sleep_period_ms <<= 1;
> -
> -		goto try_again;
> -	} else if (unlikely(ret == -EBUSY)) {
> +		msleep(*sleep_period_ms);
> +		*sleep_period_ms <<= 1;
> +	} else {
>  		struct xe_device *xe = ct_to_xe(ct);
>  		struct guc_ctb *g2h = &ct->ctbs.g2h;
> +		int ret;
>  
>  		trace_xe_guc_ct_g2h_flow_control(xe, g2h->info.head,
>  						 desc_read(xe, g2h, tail),
> @@ -1046,7 +1037,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.info.head)
>  		if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
>  					g2h_avail(ct), HZ))
> -			goto broken;
> +			return false;
>  #undef g2h_avail
>  
>  		ret = dequeue_one_g2h(ct);
> @@ -1054,9 +1045,32 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			if (ret != -ECANCELED)
>  				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
>  					  ERR_PTR(ret));
> -			goto broken;
> +			return false;
>  		}
> +	}
> +	return true;
> +}
> +
> +static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 g2h_len, u32 num_g2h,
> +			      struct g2h_fence *g2h_fence)
> +{
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	unsigned int sleep_period_ms = 1;
> +	int ret;
> +
> +	xe_gt_assert(gt, !g2h_len || !g2h_fence);
> +	lockdep_assert_held(&ct->lock);
> +	xe_device_assert_mem_access(ct_to_xe(ct));
>  
> +try_again:
> +	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> +				   g2h_fence);
> +
> +	if (unlikely(ret == -EBUSY)) {
> +		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
> +						&sleep_period_ms))
> +			goto broken;
>  		goto try_again;
>  	}
>  
> -- 
> 2.25.1
> 
