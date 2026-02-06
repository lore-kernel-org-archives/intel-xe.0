Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E2EECD9B5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 00:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C5610E192;
	Fri,  6 Feb 2026 00:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/H/ayhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD99A10E192
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 00:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770338962; x=1801874962;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EIV3iV8l3T2mmpZFn1PWixG3t7iMxK5dobRpnIcwecI=;
 b=h/H/ayhl5tYyEtIRjy4QqE7PmBFO9xw8Ry/cwFoz0gtwuIoOye48p25b
 sxfzsy99roh5E83jrzDsPnDkOzjhbzGNS/Hm/mVIpUUcQct77aQoh8I+z
 kXzOkHAfPRxI+uwwtf6xFofSc770Nxm/LVOBF1TpMQbwUnfjivvZenLEs
 iGF0IV+tx1z6PNOc8sZbdHJaU1q+7GmuE3n5JzcF8SQMtXGVohp1H6q4C
 9NiJxsKcE92P0liO2SUSP0qF7qzHGJwZBHHCxuZN6vw8Mh5wPQ747JFgF
 5y350dKra9KTA96WxPDrvlccShj8Yx4cL+DnTERDTLFJRsMg4ofWsLFQM A==;
X-CSE-ConnectionGUID: UGISMG2kR3WdGoV5SW18Dg==
X-CSE-MsgGUID: sxlYQaNNRjKSjVTwKHEI6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71447182"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="71447182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 16:49:21 -0800
X-CSE-ConnectionGUID: BculGH/BSJaNOC1e9tyJrg==
X-CSE-MsgGUID: 4+fH73jHRn6TL3vXANiYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210803332"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 16:49:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 16:49:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 16:49:20 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 16:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJctRePxzboEihO+M7S1hkIFlRU/CRl5iPDMmNpU1wN0M4CDKMIpi8+Tanoe0ZD8pTD7Hn1FFVYATJKfGnZY2nTVsfM6jpz+KJLz3JHVvhmJ3NRn1QuypwiNC/py9+ivCIWZhRmVeqoUi2UpBmPurS0spOdvLNcr+tNZZAeJYhtkgu2JyzDcqPtEXKkBLxgorzNUTIbZI2VrSCm/IhdKJzu3Tl2hpaRvLQZc/PZt6APOFD+knDdszZgXOUSbCrVc0R9O+UgyL+Dyx+1LOyROaDngcP9LqPK273ouH+WAHQadmNRomUrFJffcDc5wc4n3P83h1QVldBcORYo92cVmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XX3ZxbZ3sLYBcgDukn+Be/H2cxVr6nctbeB96mTS4Q=;
 b=Knqe0mwi5s2a0axeusA+NQoljhhs1D/MH946Jb2Iv3d3lOXJp9KRfZV8a66Bbsw8w/fB6YhRQfGdS59X6XG/438ZbCXppLZnG6lrq2fcVuubmd+91JaMHRR+E9q02fcxnrgW1V6VlxKuRh+G6do2Fj0nOuYG7efjRzoIReI/QRj9b9R+96AF0M9XrCg5mldwSmQv2/As1u8LkYmCeeWQOpej/xpC9jFL6izWjuE4N2V4ddNzReHL1tNlkXu5GM9K5zvYRTucMvSP7XqleejxI9zlrRkxCYYxRRVfD0A/FFpUO4WozyoYGxq5aKbxzZzpexRKlueh45trMSKOcwRrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9010.namprd11.prod.outlook.com (2603:10b6:208:564::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 00:49:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 00:49:12 +0000
Date: Thu, 5 Feb 2026 16:49:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Farah Kassabri <farah.kassabri@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ilia.levi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: add kernel VM BO unbind helper
Message-ID: <aYU6hs7SasIITfF4@lstrano-desk.jf.intel.com>
References: <20260119150330.6537-1-farah.kassabri@intel.com>
 <20260119150330.6537-2-farah.kassabri@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119150330.6537-2-farah.kassabri@intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0881d59b-8a8f-485b-4830-08de65198bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bvw8iOVpaLH8LlMY8b8i4dc21rHvKXf4r4Jb3r9sYw9FRYSRwg8T3v4DK3bh?=
 =?us-ascii?Q?rquvihL3E0KWmYYbWXGQ7byOF+MJqN6/NRb15JDMewpHvZvqWxVD2ruixrsr?=
 =?us-ascii?Q?Wmg8T2ypL88NORy3hvXP1fzDyYBMb9jPuUjUNs7+2SPg4rHOsO5SolcYPxNT?=
 =?us-ascii?Q?bmzdYJF6tNUEZGHvh2Yc+HVptbgsZLf2ebPk2uyh4se09IITwX0votwGy0iU?=
 =?us-ascii?Q?kpwRhooDz1wL34ZaczuN4kDXF43zEIpwFdEerRAKZ5+2imqFR9F7fSgIN44L?=
 =?us-ascii?Q?2WJokGJYQWd+NlD9tAKai2Jl82b+FF1CavkH025u+P0tj80kHt93i3HBDvFZ?=
 =?us-ascii?Q?Ph/2mcg7Nto9bxtxQYSPEmO1aHHQGVsX1VN5sGE+v8qQ6VjgNtqJ8bgO9xgs?=
 =?us-ascii?Q?FJKMHGuzcRrnRSS85wK/e4gSL3IdGY+DhZpw+tAISB5QGiE28FBVhcOlE0t4?=
 =?us-ascii?Q?JcQ6JeGs2zGSNG5PYvItsGERR6iAoQzyR/EYUQzUgPEXqUFuyJxsXDIX2cXY?=
 =?us-ascii?Q?00cIyH+aWLFLnK6Tq7VxH6a6ldj3kK6MWoeGhLSl8P316U3IJBvzlfgr1X9I?=
 =?us-ascii?Q?x4HT9beHob4VJgE2RnDK3OE1j8639B8q2cjixu9ycrGCvpa//wdnroAlzeiH?=
 =?us-ascii?Q?UNoXoxk8N7iqbzWRvJqdgyD8BoTfkOuhW+urUOSjY21BEIM3I3eSPLB68pSh?=
 =?us-ascii?Q?OgIP9IfFyfBAobpl1cUjmg4cnKj2obTdZGGvzwlAMxWiwxpJOFLtnfRagbxJ?=
 =?us-ascii?Q?X/0/oEbW/HTBHIbZHy7rkHSXDvQIVsAoT3aqeUwJygj5vj3wDa4E1tDqxwRN?=
 =?us-ascii?Q?r2F1U4Jr1j5FRX0Atb50Guy052eMnf9HtdLnohF5dasUozBPySeOCQfL+7wg?=
 =?us-ascii?Q?6D8T3MdIsH9xFCM7MNPk9N8uQ9EuQIPO1C8QLvIJbtDpVvci9vJRu/xs142O?=
 =?us-ascii?Q?4OEPqM7O134IZbUE6QKCcFeVNbjrBT8uZf4etv+Z7AWYN8pEfT2c10wjEXWx?=
 =?us-ascii?Q?OVUOac/JwIdozs5Ge97iCcdQftQ2r4kIn503iWAir6EVGPqyeSOQfC75C1vb?=
 =?us-ascii?Q?Bm9KyqadFViZ4GLtlub/ijmbCQJ+LgZk0aCvCGMNpQHTjeNqYlBsHOHiE39y?=
 =?us-ascii?Q?Y8H57BxaeSkAthznwuAa9JVzf9cXnEhCorve62JcDP6F3fnp8WjRKkJFJD8t?=
 =?us-ascii?Q?QYU6frOnusQqixn7Xtqw9PEp30mv6M6W08stLBtBoWiEtfkKKAdhcfSuw8PI?=
 =?us-ascii?Q?78ljiFei3Rml9p74EB4UDFfakPbuUWPp7GG3v4o1+W9lInNZmW6pfny1pUQw?=
 =?us-ascii?Q?WCAjiKm2h6b4K1RCYAtNf8m/pp4ei8SyxA32P+s9r0dkd/TD+tgcCUP+nOyj?=
 =?us-ascii?Q?czhoiNpOaErnh8CYSUUuNMvb9rRZUw5qwiwp27FLerHJFMyWR8mbrMu7DZ3c?=
 =?us-ascii?Q?QzlMo7zupv0aqUEmRXjU1jF8eCmH1KtXfxjLimQAw9ukX1V+A5Q441nUbUFE?=
 =?us-ascii?Q?M6VsbnL5XrQ2Pr2eJyKCjKUBVVAlKVZN55BjjHiE7RteZhqzEhrlbk6aL8GS?=
 =?us-ascii?Q?Kkpq02/12XybO7vDXzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PWplQJ9LC+gMdPqatzPMYR4dHpBJdc2w+5wp66EkowHObbzdrr4YMI4sT3in?=
 =?us-ascii?Q?m4o0pC8Bphrmhud1ml3LQWHIdrvi7w6Pqc3NiRycYdmvkP6gd9/EasjfTpk0?=
 =?us-ascii?Q?9oPvF1ghmubRHJYD63RkDvboKqjpGpwZl2F2QtgktbeWtdtHRFRDWLdBU7ve?=
 =?us-ascii?Q?pqb0mpQRR9IHbJJalrPs/KI08EH7I4TVYwbdKohrEF8ieAv4jFgMk3xfL1tO?=
 =?us-ascii?Q?Y5BKojFX1nVacjK4IEfEHqcxnPXIc6hnU5q8aevSjVM7gj2ybvsxKhmj5Wx+?=
 =?us-ascii?Q?ZTthWUElQgBZr3EXFD81/zv8kNmC+8Ma9CBe9sjVxNV0R6B8tB9Z5mVtj69u?=
 =?us-ascii?Q?fU+neooOGu6e8DpGxbKYSCUf3LKwaM7TGgw36ArfI1f0woXI7eT2kh8GWAHb?=
 =?us-ascii?Q?I0ZSGyN42TdtWtidFBmXA/VnL2AeuwOAMpr4RhDE23A+am+0W4fTKlVpUrXL?=
 =?us-ascii?Q?mjyFGzFg/Xve52x9mImPA2ron0RbKvXrtIJxcpc2u7GS7jo5GuqskjSi8m2m?=
 =?us-ascii?Q?KCCkWutYf9mSJN8JQSd3C9y4orp+O/wL+aMT/oTjqWja+YO/D3xu+481EgzH?=
 =?us-ascii?Q?6RSGHI/se7ANwfTPWsFoytpLfQpzuyo9DY3UDHZAaBhgr9ttWRFjaupQW7ZY?=
 =?us-ascii?Q?q4OtHVHPFwSx+T34XeMpRW62TYF3jr49AOEOAbDQxmz1/y51Q8yFuq4DDmfz?=
 =?us-ascii?Q?mZTCmBzWnv3l12dw5jgw8pdSbGc4zOCA4OcFo0Mt6iNFnH/OHrWlQ93ZDDs1?=
 =?us-ascii?Q?57lag8DO6s/JARerI2Ci9qvIsJQNO0pmuL2Hnyx/HhQyBuVT91wQSQcaGPjt?=
 =?us-ascii?Q?E0erRuo5oOGnyOmCfihlVenA/+jQFLUKmmGutaUp71KOQVvFMBS7KEJtYmcl?=
 =?us-ascii?Q?6H5kv0wZgn1MIUSxUWJeTLjTSD1dFkRvbR5nBdDo+3w99LqZLrSTGRn4CfWL?=
 =?us-ascii?Q?bVRs5nj9ZtAd7BU55EU7tKdIuyZ0SD3z1vBvUtt2YTyq1kB7MSfRrV9XZIpr?=
 =?us-ascii?Q?hjlioHVOE50kOiv0BaiErfn1zQZtNb7khMO6TQ0XJOP4Y2r4b5k/lyCCl1W1?=
 =?us-ascii?Q?ynInUS9nZjG7/P6eUMyJf8VhOl2em7DM0ujEl8OWY2plJ1OZUTttndL92/DC?=
 =?us-ascii?Q?MS2RSHVgIDXalhNWkbqexiusYWFgFWzXOR1aZlBfFdWGqKQZVcOFRdIq4p86?=
 =?us-ascii?Q?cM0prXkysPbn13booEYDCwjogZPq05sRC+pa9sVT32l5lNF3JzC3Q9DO1bi8?=
 =?us-ascii?Q?LoQJxfS320VZKdzy5KJdbhXgVMJONo42vJgULzlK25E488BMTTisNtBsZAvP?=
 =?us-ascii?Q?zlCcCHZ5n25sWwKP4P8yhaijT5izuP2mkA55E6C8NrGpRQxzMp3tV9c/w9dk?=
 =?us-ascii?Q?/wcmRW28xy0aCylLS487oZPqr+pe8ilKmCEvBUWii4z6tAnyOGBvsKNz6UVh?=
 =?us-ascii?Q?rUJasnuFT4aIBjqiWQrUiULsAtBanjao9Xj6vz7CFHiA/3bJvZEL3RQ1Xp5+?=
 =?us-ascii?Q?9A9C7nm/TIjNugMZ6iFxMTbT64wvY712ylT/ewam2WqxbFnuxmVnf892l6M/?=
 =?us-ascii?Q?7J6XuIeEQxbRTFnrEwhM7bhAhkebWy3roVJfaY9sATQer2iJEd5GWnsgTlwf?=
 =?us-ascii?Q?WVa0totYELv9aydpclGvmodByCXkteOcVwNE+/6NQPrlLUNvyWqQGdc4HBxa?=
 =?us-ascii?Q?CnMwmQew8xp22b7riBNjr0qlozwWHDsY2MVhK+gg3DEWLVte7bgeGSbbi7ok?=
 =?us-ascii?Q?pQRb6iEA3G2/nWvncLyzW/0Kt12OAvo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0881d59b-8a8f-485b-4830-08de65198bc4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:49:12.8439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjjMIAHZUE16vl4IGQFQUmUKsxVuFUvWgikzkZoP9yJDJuFoJunCJX7/XBbywj9K8E1nIlqu8itEMWj2/hYGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9010
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

On Mon, Jan 19, 2026 at 05:03:30PM +0200, Farah Kassabri wrote:
> Add xe_kernel_vm_unbind_bo() as the counterpart to
> xe_kernel_vm_bind_bo() to provide symmetry in the kernel VM BO
> lifecycle.
> 
> The new helper allows explicit unbinding of buffer objects from
> the kernel VM, enabling proper cleanup and preventing stale
> kernel VM mappings when BOs are no longer needed.
> 
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
> Reviewed-by: Ilia Levi <ilia.levi@intel.com>
> 

I was a bit hasty on my previous RB, thought about this more and have
some more feedback.

> Changes in v2:
> pass cache_lvl argument to the map operation instead of 0.
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm.h |  3 ++
>  2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a27145a4137e..425f406712b8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3830,21 +3830,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  }
>  
>  /**
> - * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + *  __xe_kernel_vm_bind_bo - internal helper to bind/unbind a BO to/from kernel owned VM
>   * @vm: VM to bind the BO to
>   * @bo: BO to bind
>   * @q: exec queue to use for the bind (optional)
>   * @addr: address at which to bind the BO
>   * @cache_lvl: PAT cache level to use
> + * @do_bind: true for bind, false for unbind
>   *
> - * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + * Common code for binding and un-binding a BO.
>   *
>   * Returns a dma_fence to track the binding completion if the job to do so was
>   * successfully submitted, an error pointer otherwise.
>   */
> -struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> -				       struct xe_exec_queue *q, u64 addr,
> -				       enum xe_cache_level cache_lvl)
> +static struct dma_fence *__xe_kernel_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +						struct xe_exec_queue *q, u64 addr,
> +						enum xe_cache_level cache_lvl, bool do_bind)

To make this a bit more robust / flexible - how about:

u64 range, u64 offset, u32 operation arguments which then are passed
into vm_bind_ioctl_ops_create.

Then to reflect this is a kernel binding op...

s/__xe_kernel_vm_bind_bo/__xe_kernel_vm_bind_op

>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
> @@ -3860,9 +3861,13 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> -				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> -				       vm->xe->pat.idx[cache_lvl]);
> +	if (do_bind)

We then can drop this if statement.

> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),

s/xe_bo_size(bo)/range to avoid UNMAP having to pass in a BO which isn't
required.

also s/bo, 0,/bo, offsets/

also s/DRM_XE_VM_BIND_OP_MAP/operation

> +					       DRM_XE_VM_BIND_OP_MAP, 0, 0,
> +					       vm->xe->pat.idx[cache_lvl]);
> +	else
> +		ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
> +					       DRM_XE_VM_BIND_OP_UNMAP, 0, 0, 0);
>  	if (IS_ERR(ops)) {
>  		err = PTR_ERR(ops);
>  		goto release_vm_lock;
> @@ -3903,6 +3908,44 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  	return fence;
>  }
>  
> +/**
> + * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
> + * @vm: VM to bind the BO to
> + * @bo: BO to bind
> + * @q: exec queue to use for the bind (optional)
> + * @addr: address at which to bind the BO
> + * @cache_lvl: PAT cache level to use
> + *
> + * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the binding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +				       struct xe_exec_queue *q, u64 addr,
> +				       enum xe_cache_level cache_lvl)
> +{

You could keep the signature the same, but it probably makes sense to
add 'u64 range, u64 offset' here and update the existing callers.

> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, cache_lvl, true);
> +}
> +
> +/**
> + * xe_vm_kernel_unbind_bo - unbind a BO from a kernel owned VM
> + * @vm: VM to unbind the BO from
> + * @bo: BO to unbind
> + * @q: exec queue to use for the unbind (optional)
> + * @addr: address at which the BO was bound
> + *
> + * Execute a VM bind unmap operation on a BO to remove it from a kernel-owned VM.
> + *
> + * Returns a dma_fence to track the unbinding completion if the job to do so was
> + * successfully submitted, an error pointer otherwise.
> + */
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr)
> +{

This signature should change to roughly:

xe_vm_kernel_unbind(struct xe_vm *vm, u64 addr, u64 range);

Matt

> +	return __xe_kernel_vm_bind_bo(vm, bo, q, addr, 0, false);
> +}
> +
>  /**
>   * xe_vm_lock() - Lock the vm's dma_resv object
>   * @vm: The struct xe_vm whose lock is to be locked
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ff32f43aa1d8..b87e80227c79 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -272,6 +272,9 @@ struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
>  
> +struct dma_fence *xe_vm_kernel_unbind_bo(struct xe_vm *vm, struct xe_bo *bo,
> +					 struct xe_exec_queue *q, u64 addr);
> +
>  void xe_vm_resume_rebind_worker(struct xe_vm *vm);
>  
>  /**
> -- 
> 2.43.0
> 
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
