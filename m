Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0B9C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 16:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195E10E485;
	Thu, 15 Aug 2024 16:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsmpxu8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FCA10E482
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723740248; x=1755276248;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qTbZLQqItTysW0Kcnlv7T2P49kSpT1Jj/YPivXUht1s=;
 b=gsmpxu8XNDrB6tXVRitV0OFvbwVY6sFxVNrCI+bFwRps7IcfVbJryyTm
 ev18WlJS7H7ATPbdOYCxHeq42Y/tuFLl6OMtjMl43zMEz8hhkHExnu6iw
 4Q7UFlOlwEunUc09ytP5lJReyBB+YM5dGzkdLHAM10EnytJGKb6ZSzhNY
 o47O2w7LzWx9+X0ifOw5Bki1NinYo/eJZXbFUzhOjwEMhHNppg84M5ED/
 qSpy/KHWmZaCGhPwLtCixKyUs6wqTYJEHLYjUJxz0HK3bc2wFyXiXLzJq
 K/Smjq8mzpLyd4n6i1f5gVtCP9mVVXj6B2hEHjLqrwFyIG/Zl3Xpss5bz Q==;
X-CSE-ConnectionGUID: 7XvsKNoWT9W0tJu7QLcWaw==
X-CSE-MsgGUID: hIY8YVE8Qli3Rsi+Kccw4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21869029"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21869029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:44:08 -0700
X-CSE-ConnectionGUID: TOLmqsoaSdaFcaBoCGYhPw==
X-CSE-MsgGUID: hwxeOxW8RESd2S9uE1FkFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59042559"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 09:44:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:44:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:44:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 09:44:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 09:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKIT+tTslY5SFWJrZNWYTuFE24IzUF0yIE7fHDQiSjzN59MAl4mHvsggmhITmdQGaMz8b6fWJBdCYmtSJ0/+Dw27F7gtFnGVK2q34vOIlfj9phA0GjKE1z3NzaRm6i9q4iriKnKZgtgxqdHz0uYdw9652P87IFJANTtVG5kKhx3VBDFIPjOnGex3alzAbbhl27bFQB+5HdKHEUici2XswxU0nLhVqL23A1q0lBa7lV2STfRjvS82ggmHQK2+fV1ypZ3rG/N7GyxS7K6yaIJHlF7dZM40N607EK8EyQCKT10Xav51OqCVVcM+xYdZGfpgR0k7RIDAzJDIymJrqyykOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QU0KEckpvWNyzVAVr4zjD/OmvDQbmi1HBGUvym+oZ8=;
 b=fo1IHFUkwVeObR44YINL0kyCU04OWre3O900yMVGqGdoolRrF7s+YE2jtTyUI8GaeIiHSVanImRYUkUBy9A4HG6sAghBuUuYCEpiNFV/m2nJ+WcHtyuCSqOa07bTSu7IJCq+6M+021ZJfPwgzRh3gTSTpSO3nlPqbiNuFjtl4WWRQx5qGnNWk8JZkPchGS5pt5UB1Osfs3l/UUcHiuPc6XVgcxWmqb4DRC2c7oErU9APv6qDMW0Oh8pXWq7hgoOmcqR0Boika7V2GMIdWWc0d9aodeNTqMsZtvEtaygiZc1E0lJ6WOOX3FpXGcXQoMH5MSPsIIFDrAJvzzl+h62lxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7842.namprd11.prod.outlook.com (2603:10b6:610:128::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 16:44:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 16:44:03 +0000
Date: Thu, 15 Aug 2024 16:42:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/oa: Replace per GT oa mutex per a global one
Message-ID: <Zr4wETSA5Gzy5TzY@DUT025-TGLU.fm.intel.com>
References: <20240815162758.36495-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815162758.36495-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: e838e1df-c267-4810-313d-08dcbd4978d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ac1hbMV8mOqPSsehL+K7teIJct7uD0/MZFJw/DAlg8qEZEbiPSqysWpWFg?=
 =?iso-8859-1?Q?K8xVNDS8zl93XY5a3DS2g6scic+any9c7vLVl7ua1nZQsx3fqn9Ah8AP+a?=
 =?iso-8859-1?Q?jzNu+9FuDjsc5ScB65fMonMSCERYGy00Po/Dm/ZTDw1N0aG3ic5PpikkQ8?=
 =?iso-8859-1?Q?ABD+gOm1cZhxhDlDgX+RbwrLGzIOL89obzn4LhovSFddOU0E4HQ7KBypmm?=
 =?iso-8859-1?Q?eeczm2E6v2b7OdnL3t2StZi9pGJDgaSbgNyacaMtWYJT7/wnMXbfmaoRrX?=
 =?iso-8859-1?Q?Ax+Y+CpEfzy8od+qr30vW4o/oyLmYvJWSdrDMSiCP+XQhLboBVXwp2bZG/?=
 =?iso-8859-1?Q?YyIjHq3T0Q2+w4L2OQoOZpan4p+IQ21OBCFerTuBcKAI2+Em8bfhTDYfvv?=
 =?iso-8859-1?Q?vMUTtbuT6mKmyXE26eC3kjnv+a1N8er6hxhQSpnNRgpfji7AgaP0O8qZf6?=
 =?iso-8859-1?Q?0nOUe47mh8uSlv5ofnlDlEIDldyDBuJiwAymkDhMQnf+Vd4et5zr+Jqbcu?=
 =?iso-8859-1?Q?mR0LBHLOUZ3KHyP6yqdQthQknVVbuMHwzQCJtwxVW9zIFAXXzYh4/6Ht2L?=
 =?iso-8859-1?Q?Ap1iYqnzEDj75kQD9Xt+v58nbD9Kyx/guZ1V1Dq0e2PZVrwPj2PzZGqjGp?=
 =?iso-8859-1?Q?c5Q3DwhOCW3joLUi6jz8gurjxJY/HM0ix5OknCo4SpEJNjjBmU1SO7CETJ?=
 =?iso-8859-1?Q?/VH1dcYIvMGAgJyYGtSHIkltY3ZD+/sqDI/3RydOyzdxDBAcQaGGyLRgP9?=
 =?iso-8859-1?Q?k6wMfZmy7nIDDL9Vaw10zL9p0QvaQy3f3kRxosT3tH6aOqvu3/tRJSgD3c?=
 =?iso-8859-1?Q?+bh1QzUxx0SwUtFBNOqMLqfyXMZFTijOTvqwsBF7nrXlOrISuyrBb/gI5l?=
 =?iso-8859-1?Q?khJtEoD0VCjluVSW+whR6TN+x9pxz6dt9gy1i1/ejgwArPV2wAcca2rb7t?=
 =?iso-8859-1?Q?6QbCGGXJYRSLnbhDuG6Kyht5y3ajXq8QTu3mUAyRUfbfaRBAkVHEnzETiS?=
 =?iso-8859-1?Q?britT8HHV4BmDTP08ySTkt2WF3MGEzq93zWXMQS2hed6XL69FGJVxo5R19?=
 =?iso-8859-1?Q?fR/93i8EWKAIvxtBVLraDlU9meK34m40WhmriMzG9pMFvEHDW2PACxZx2c?=
 =?iso-8859-1?Q?A1I5hMsiN1933FHWgjLDWzzYCFRyEA3/5+zDqLyBktKD4ijvJ8+lOoKU6m?=
 =?iso-8859-1?Q?vYcr7FiT/3RemtPrkBhJRKNNCKlvqhFIS2AEeu+obXcMDM6j2xAxmIAiwJ?=
 =?iso-8859-1?Q?enT/X/vwalZfOBonOj3kH/9kQF/hEWEzr1UKEqL5OAvl0zn52pjBLoo2FO?=
 =?iso-8859-1?Q?xVsnMVdZVh1dsSJd9lBjBP4O7gDLMvFMkz83AZfCmsb0+lOZbiD4IuLH5a?=
 =?iso-8859-1?Q?6RMJKZ8SxOhoZByG8eUwp5kbPlVBwo/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8+sIPrYiLoAKlUYJCy809YQxbk/Y/DjNucEmM4wyN1pQmxzLntARC7QmmS?=
 =?iso-8859-1?Q?hL9S09dgPVp3FD2UhZ3HRYjHNjnG6vi8Au6wZcF/3zop3ghXl8D+G+SgYf?=
 =?iso-8859-1?Q?qdF/63gdbWPHO74retopSzW/mAxOFnTQKFbOhCwCiu9stCa1qLhfDOpH90?=
 =?iso-8859-1?Q?WFmiB7QsjJVH434EE3z014lCBZjcEjjtwp8qgnF4wPT5dBmtaecRE5NQkc?=
 =?iso-8859-1?Q?/hG5tA2nGf9jLaL5mZLshmYDoW562CE31cVplWaXtv5xxCZkDCCaGbmxPa?=
 =?iso-8859-1?Q?NlUqZNDu43kMaGiWNbskiFXqTmVnQ/B1lL6CWVwjvX6K47P3LPYibTNAt7?=
 =?iso-8859-1?Q?rk/TztLgR8N/uwu3AwKGg0tIAiN3kp/p9JjlOJnif5/G71Nq7dCJQbdJVi?=
 =?iso-8859-1?Q?xHgrxauXWynQ+c039I5eKVZu7zlh7S+VfT0BaS0fII4OtLwMUITF/KgHVV?=
 =?iso-8859-1?Q?p37XWwRULa3KPQ55637hgybaFE/4BGlNMfAUgcCWxth5wMdfstHk1knaY8?=
 =?iso-8859-1?Q?EYljHokUPHptqbD5NWMcz+p7s9K14tHrVM6bI7rjURjPMtKq5fP5VTzKM0?=
 =?iso-8859-1?Q?D5Tbg1ACl0BHSqd6F6M1RBtl9lKvg38P4TZNLc/L08luxxal+zYp+aGqJl?=
 =?iso-8859-1?Q?Vben5fiDbNqMt6GXFPDSpoe3yzHn0m/QyXU5Dt/vKSXHflLSpkPpyjTQX4?=
 =?iso-8859-1?Q?4hDwVUNz3TuRr9rqxsbGkdC9wrqlk5EpWFDGOCc9VVlQYtOt2MscCw3rqi?=
 =?iso-8859-1?Q?UjcbP5uiIt2QA4EguJY2M4mS93RmAgsxDmAEkUieqE6AjcZVP463TR423M?=
 =?iso-8859-1?Q?wxZwaTVt7Ct1A1CbGHkhc1n9e2UQ15AJgfnmyqyfMkUYF3bpf5NdwT9EK5?=
 =?iso-8859-1?Q?JMHUMpUXmUPf5MPikXkWU2EmiD884HvSIsmrQvjrME37KsIXqQJ45gfPvq?=
 =?iso-8859-1?Q?MtEaoZl1qxbcCaxXVZhK7fHElKdKLo+zKXX3ECL1tsHgiSxgPyqhzkyfWt?=
 =?iso-8859-1?Q?KKuYInui6M2YPON5+q6sq2rPv4Mt8p7pi4Qtc/VUGhl7yv6zLEJgtB87cz?=
 =?iso-8859-1?Q?7S3cwaxolADaXmLhCbqy9Z5smLx6w7dVjpJ6e9sULdB+pRrlUdUKHcq/aa?=
 =?iso-8859-1?Q?rbEPK5GGzRHi24qu8ZsyBLcqIBCVkmYGd4YktXix2raAStEmv2/BS3y3B5?=
 =?iso-8859-1?Q?HRbrCX/TVd/B9o3KWLs25JDTV/Ce0hU/E/vad1UvmLB6n12gUEnx7NIZQL?=
 =?iso-8859-1?Q?5okQ6QFEbOvcuhge9dJO3ZaiiLfiyiDKpQUM+4QQAFq4gAs4ZD0FVKB4/3?=
 =?iso-8859-1?Q?u+m82/0JZWtFceP6zrUGNC4N0naijvUI/wESEChsDUzDSCD134NXPl4acm?=
 =?iso-8859-1?Q?Tehh4B8DEJeV/LT5bgt+5KWf044YImhYk56ddWQxO1rR70MdA4BXDtoocA?=
 =?iso-8859-1?Q?V/Yon+lBgW/aypK3rnA+Z28t0sz2QMdPBUScNaq66ofGqXv1H/5dsIn3H/?=
 =?iso-8859-1?Q?RnDMxHwJJvAWHdjETOhM007OxykVft4PTT3mFPHoVMhaOAInAaB+SDJVvm?=
 =?iso-8859-1?Q?rlmCXn1A+TgkFvwV3S1iai3X9Wxql6FeJxLqHl5UbzEXtox1MUXYUxwiY7?=
 =?iso-8859-1?Q?tfteB7sd6XFzxXdGEPkLckr879nJRN5kqsXjvbDRifMTmR3x5+UDlBQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e838e1df-c267-4810-313d-08dcbd4978d2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 16:44:03.7852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1AMkzIgQoXBvPtc6C3MCLoSblBBRPsLCUVmjAvHbCpOdM/e/qCsxIJxAJkybM1duMDd0xZA8ERCknSqh9Rf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7842
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

On Thu, Aug 15, 2024 at 09:27:56AM -0700, José Roberto de Souza wrote:
> This mutex is not frequently used so there is no reason to have one
> per GT, also this reduce complexity.
> 
> Also it was missed the code to destroy the mutex.
> 

drmm_mutex_init provides the destroy.

Will stay out of this as Ashutosh owns this code but in general less
locks is better per guidelines from Sima. 

Matt

> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 13 +++++++------
>  drivers/gpu/drm/xe/xe_oa_types.h |  5 ++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 3ef92eb8fbb1e..d6eec8caf4c51 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1205,9 +1205,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>  	struct xe_oa_stream *stream = file->private_data;
>  	struct xe_gt *gt = stream->gt;
>  
> -	mutex_lock(&gt->oa.gt_lock);
> +	mutex_lock(&gt->tile->xe->oa.streams_lock);
>  	xe_oa_destroy_locked(stream);
> -	mutex_unlock(&gt->oa.gt_lock);
> +	mutex_unlock(&gt->tile->xe->oa.streams_lock);
>  
>  	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);
> @@ -1875,9 +1875,9 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
>  	}
>  
> -	mutex_lock(&param.hwe->gt->oa.gt_lock);
> +	mutex_lock(&xe->oa.streams_lock);
>  	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
> -	mutex_unlock(&param.hwe->gt->oa.gt_lock);
> +	mutex_unlock(&xe->oa.streams_lock);
>  err_exec_q:
>  	if (ret < 0 && param.exec_q)
>  		xe_exec_queue_put(param.exec_q);
> @@ -2388,8 +2388,6 @@ static int xe_oa_init_gt(struct xe_gt *gt)
>  
>  	__xe_oa_init_oa_units(gt);
>  
> -	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->oa.gt_lock);
> -
>  	return 0;
>  }
>  
> @@ -2472,6 +2470,8 @@ int xe_oa_init(struct xe_device *xe)
>  	oa->xe = xe;
>  	oa->oa_formats = oa_formats;
>  
> +	mutex_init(&oa->streams_lock);
> +
>  	drmm_mutex_init(&oa->xe->drm, &oa->metrics_lock);
>  	idr_init_base(&oa->metrics_idr, 1);
>  
> @@ -2508,5 +2508,6 @@ void xe_oa_fini(struct xe_device *xe)
>  	idr_for_each(&oa->metrics_idr, destroy_config, oa);
>  	idr_destroy(&oa->metrics_idr);
>  
> +	mutex_destroy(&oa->streams_lock);
>  	oa->xe = NULL;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 540c3ec53a6d7..17e17b5b93640 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -112,9 +112,6 @@ struct xe_oa_unit {
>   * struct xe_oa_gt - OA per-gt information
>   */
>  struct xe_oa_gt {
> -	/** @gt_lock: lock protecting create/destroy OA streams */
> -	struct mutex gt_lock;
> -
>  	/** @num_oa_units: number of oa units for each gt */
>  	u32 num_oa_units;
>  
> @@ -149,6 +146,8 @@ struct xe_oa {
>  
>  	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
>  	u16 oa_unit_ids;
> +
> +	struct mutex streams_lock;
>  };
>  
>  /** @xe_oa_buffer: State of the stream OA buffer */
> -- 
> 2.46.0
> 
