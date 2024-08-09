Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3243C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 21:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4B210E98D;
	Fri,  9 Aug 2024 21:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyrbCPsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8315610E98D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723239227; x=1754775227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MfRq55C4swBMFZxa+9azeQlNlhBIOKGIFRYu4OUIPK8=;
 b=iyrbCPsbdLGtgvM24Z8nrv+KqP1NrQrCD1IFkeQ4Um318oscZJ367heU
 MexebuQeg56CRJR4KL/lyEQz4ybvSIBJEhV0MVzxwjc6KTIaGAiIpACWu
 0PjvhDNHhyOVc+icxX1mNDxCveUHVkfmoTfTIu2k6b80b62IQJNFXPlhH
 TeQcXAIA4bs23UkTn72G4+S6AoizHDb156Sak2bM/0Ns/bCR8SVuZ0VVL
 o8504cgETsreoLueJqLRqhNNb91Ix3AxMPwPmif00OPwaQsIq01hk/8T0
 WVTSdHs366KR4E0IE1Pi/wMsq91nmO54JSdsaJFICyEyHIDeUb5kYeb7p Q==;
X-CSE-ConnectionGUID: nfu0iGeJSmCCI46ar3bWyA==
X-CSE-MsgGUID: UjWnhNpkQHWerPXnVgfwEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32051185"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="32051185"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 14:33:46 -0700
X-CSE-ConnectionGUID: SZ8/AWBjSvuJZyGzEAAiyg==
X-CSE-MsgGUID: ZVCxiDs0RW+9c7OJlzx8Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57658515"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 14:33:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:33:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 14:33:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 14:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKTe+5aEn2CxaJ8C2MwNjivtWiS5Vn8Lk3OiuYIu8YlpehXPd12RsR/8cVPAnz0Gh1shPE89IcNpolow1vXzJ2sMh8qL+NBe6AC7hNNDuasIIFhEkoFfWffDKi7luq3BerZMPm9gX9A681njrbepiRWLZ+wSqIetWjK5OdpmfqjONYNMcbQj7T82enxhyrJnN1SqmarWm9VfEC66j7Bqgq8K4QMDs16O38Z75IuMAJX8eiwbAQr6NGeJ51R3xqxv3rTu1CDtypjhROscjS9YvyUqdtqN6gFgHtXtW1Zg213mU95YuYfLeBzZjkHAtO31NmQn0qwsZP/AcVtS53HnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2OM8QzW8KU6un9c7e9TNmVvwfdNCF5UkXNw1i9AecY=;
 b=h7jYWENUPOAV/5niE74lE74/2qYjqd70NGgNwMbEWNWqpDnz/tFnFuPtsJ1A5qni3PlAEF0bLLaad7LiqTi+jpQN9GDngdLi2Yg6fUccQWxzqUHW5lLQMHIDzc2VmRdAfm5vGClb63fwTIOP2bgRxjqAWHzQqiYx0uHTatXWLLcVu0rumGmhocBJraFnvHgXZWlCtcqxpbU3sXeXlOvF/Dizp8l8EYfPYam2LX8lzn+21Pst75Btmm2kQBwivlyqn0+nl4tPUx609lj5xu0ZAAY7LM/b8ExcWWcayi6Qkv3KJa0DPNwFP3Bpms+C9ANXuC+XvUZIkE87E7ql9ADE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 21:33:42 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 21:33:42 +0000
Date: Fri, 9 Aug 2024 17:33:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/12] drm/xe: Introduce xe_ggtt_largest_hole
Message-ID: <ZraLMv2UGwTltRuw@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-8-rodrigo.vivi@intel.com>
 <3ef3dece-525e-4832-9952-0a425a9c1017@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ef3dece-525e-4832-9952-0a425a9c1017@intel.com>
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6cb0c3-fc29-41b2-7dc8-08dcb8baf068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KDokdVY9PNYT+WKIEY3WpTa3+AcfG0bzHO7Im+27CwWKmWsjIaJ8xPyma1pQ?=
 =?us-ascii?Q?/RWGSTz8yb5+S481aur0TCM/tucsaOgY4Ga9iuk7sXSDDqsFZ6eSHR+clbCJ?=
 =?us-ascii?Q?OZ1HVpj9uwUZG92IfJ/3Dz8L09sRMW6mx+Ad9HftNt5QF3ZPm0/NOfs0bEDq?=
 =?us-ascii?Q?uC0n5mHixj0I/o3B9CX3I8RqsSZr8Z/SUympzLbGyKIGvybmgWFzYEauIwqX?=
 =?us-ascii?Q?EXnsfbPOWrFwjHYacy0YeZ53V4XxC5vlHKAa5nKe5Llq28jRzg56R+44zLyg?=
 =?us-ascii?Q?dv3CTNt3fTRn0IVg7DDsVvY8mwHcbrnOc2HQppTrwqRgSSVc7jyYEXS2wp3n?=
 =?us-ascii?Q?fbyROdneDNfMF6EfSZ9zTlIi4QDLpMF0fPmXUuOMjoGhBAQIPKFRuWpBEusp?=
 =?us-ascii?Q?d11x8OvWiTmjMqTpX9yrvPHMfrNvNLZKCoLZPZg8c3IWCin6U8+YIyyXQ5Le?=
 =?us-ascii?Q?YMPrrE0ggy0bpIP2kkqopvbrWi1r2upTzTI167AIsiKOsRQ0f7SbUung5M31?=
 =?us-ascii?Q?IiVsBJGWZeZGoIljBq5D18ZkDWD1cP846ktNWYIIYySigK2XxSRItaGJMtl5?=
 =?us-ascii?Q?052d03BOKerIrTHrnTCXU1aCWm1ggxrC1tLkU1o8a7DWykRs8DBt+D2WWiRI?=
 =?us-ascii?Q?nQXH0ZJ9fhq+33kI8Oq7djf+1N1DLyyOVqsk4gjyYZjzCD3J4bNthY/Zjd8v?=
 =?us-ascii?Q?u/KjWTYtb2n4gZpPTWjpYKgP7lKnJKYOuosTzRbIjSEgOBUcR9MAybk5vEsq?=
 =?us-ascii?Q?Qnr5aO87gp5ca0ApvvFloYNoFkAPyyLYautAe63UGoXbs40ob4Cl+Vyk9vbv?=
 =?us-ascii?Q?6KN7653adZTjwhLBx6/m3jqH9W9cIofVySNsIX1n1HlbyxjD6Es9k4HuXr2W?=
 =?us-ascii?Q?XNZI0cYRNnpN/uAR2BK6rXSN49hEKOWPY/MNrX4pbxpvFz+ehNn7gRqM7jH+?=
 =?us-ascii?Q?Lf1WcLTDRsl7agDTzXefdIso+waUvsVFUizR1Qiq/n3mZMNqUq9Afe7AImvG?=
 =?us-ascii?Q?z5diJzkwwYySj5z+o9HTv9/c4u1qz/SrV5LUnKVu8bzszDfoo39loOHk75FG?=
 =?us-ascii?Q?rPSx3MBA9ZOlPxZdK7ozPGDkhP42nrSqbXm3stK1bFRpcfRPXTaUEOhpinxn?=
 =?us-ascii?Q?7g+wphjUyXPEhDAOhwKvmKKKfOKhxxsqLQ+v6tyILVYtJHxVxEm8Ub6dS/2A?=
 =?us-ascii?Q?V2x0QZscBEYlUBkdka3vtl9TNXATrb2M7HhEiTGDiaURMHf45r21tvdgdbD6?=
 =?us-ascii?Q?zvIwyMIh6xXEA0CnpqjOcjoQb/OwoLtC0cUm6uHvAtBG1eMoUj8JwyZocjMR?=
 =?us-ascii?Q?+fw6s5zjw9wRMs3PjHWIDPhk0dV1x56xVg3C6cEVEzrC7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?keNyTErIhEJs/SWyuoDHtxckr/5waMkRuIV8n2Bsc++byfbAqqzH2TsKQBM/?=
 =?us-ascii?Q?PYV3t7hX5qzE2zAtzwMZMHXWwT9F3ROBb5jmboEJHGHeaiC54oYyFXi/SIiq?=
 =?us-ascii?Q?lgBGUenVgf6SQRv8VwGfhQpPrLrR9aAB5Yoft0NN63JvCqGdpnZCtD0Gfawi?=
 =?us-ascii?Q?MFGCH6Ci654RfMP5XP3C2j5cYJ1ZTZ1MD4Wr5h/DxQc6XZCZeSiw3EwMKG1W?=
 =?us-ascii?Q?T7bmUjbdf3131bm1M3vGsPp+X21CEHwAfp+ioIc5YQJOXlPfYxJbyEfBvML0?=
 =?us-ascii?Q?Zm2JvYM0Iu5RqmNmSZj42631g8+wNcP7vajaRCEMJYRqo6AvQ4+pxIR0yaYY?=
 =?us-ascii?Q?F6netQsbZNgzUH+iLVamTYHBtVHmU8cV8HMm2B+VWUkT3EpXw0JZ2HHcwK/Q?=
 =?us-ascii?Q?CRQPcnM0T7cqO5tEN6uDh5sJkqcI9lP+VUsYqTrLFWdS6pDCs73RXDwKyiVZ?=
 =?us-ascii?Q?nRI8iImh/Y665Ez9U7+6fAz5M5iphu0/lWrhwBp0A3EBtQuD9YOyDXvBvZtF?=
 =?us-ascii?Q?sJYgR6KuJLR+W5GEoCdkmD8pQVW58mzxwrlzixlegGZW3PK1TGMdUbFI3Gg1?=
 =?us-ascii?Q?pfcsP9Eg70EqZqb656rY827vQJDVMGas00nApipJgp0a4Sh5wCDCGlZspmmu?=
 =?us-ascii?Q?sFc6Gm7M6bajTFYerFrk6uV47QFeXKqVDcWDSLwCvCW/URamRzvPeaQ37Emo?=
 =?us-ascii?Q?2nTRMaqwVYj0gWjd7+w8oueUATt0Ze1aIxg+vJ74QrnjZepYAoHLDA/qCk79?=
 =?us-ascii?Q?GjuZUnUl5MM59NOkKuDpCn9j0Dx6OsoQTG3qEYUi8WnoIVKHxvIZk0Z0vaho?=
 =?us-ascii?Q?iuZKc7iz1rqCRiIxp4UEkiJwfJkHH42mQrQWNYLro893wzA3ma2FktptRAHW?=
 =?us-ascii?Q?sVjHzVNP2PHgAEwihMWdT0FMR4JwHpAOBJYSPuCOmCdiaGvWLwY95BYBXk+I?=
 =?us-ascii?Q?y5sqqw2FnTzNgGU4vFpLuA4n4rX6ys8lF/rM1ckDqjY13/H8+ts3M3Gjbiuo?=
 =?us-ascii?Q?MEqSGiBEfvEZTGMpvJBdAEOWkTJhpLH/swnSq9pA/KtUwyAv22IEHw9Dc6NG?=
 =?us-ascii?Q?IdRVIgkWfZMdXxpNcIkyTHyYJ8G53eJWqpq2XE7cfT+harWFG0aNblg3+dLH?=
 =?us-ascii?Q?UY4rKmFuTacm8PB5AeQlPSwzkHaqbzNqvcAqe0BIlX09m0bUj2GFSRIlD8xo?=
 =?us-ascii?Q?v5GTQWW0mafSkE9c46+nFEjzTwSXrbGM/luzYt3w3/sA6KMdUEw+kc+pp5B2?=
 =?us-ascii?Q?eYkV9EXVBpN+ODQriP2lntan4OFFiuYFbVeMyH07zaDLmMnFneaNhKPGxIeV?=
 =?us-ascii?Q?ZPwlMZ0gB8RuVft6xndNeQAULFbiHF5/pXHx79jyIR9HjrslCX4VXsI4bQ9O?=
 =?us-ascii?Q?gJNIAcTF/skoeEHbaB9duEJktZEbIaEDWEalRTY1PEgG5U+gvp0dDZSA/sYb?=
 =?us-ascii?Q?kJxbuk3Gii0S6rdu3qAtO+PBpkG+T6Qx0cvcNldbKDqDlQdxP6bywRFsTuDJ?=
 =?us-ascii?Q?xpghErlEfj+uiRurFe3mNj/kweAeEcbTEXMwDRhYN6bz1BdGDhrcn9ry/Sn6?=
 =?us-ascii?Q?KdQs/E/n92tXK48CTn/rN+17nJADFZrZW3LQ4Yg2YOCITnw7bIwbKm6saHF+?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6cb0c3-fc29-41b2-7dc8-08dcb8baf068
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 21:33:41.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r89iITfPQm2EuAWftUSuFpbRO0Hlv7Jl3DXbgWflXbei51QQTvqO4wBgzhM3SRzv49pNfJOfu5AXKBUyXaBZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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

On Thu, Jul 11, 2024 at 10:00:51PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 11.07.2024 19:11, Rodrigo Vivi wrote:
> > Introduce a new xe_ggtt_largest_hole helper that attends the SRIOV
> > demand and continue with the goal of limiting drm_mm access to xe_ggtt.
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c               | 35 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++------------
> >  3 files changed, 38 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 67337bfeb81e..dbaf1ce87fb4 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -584,6 +584,41 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
> >  }
> >  
> > +/**
> > + * xe_ggtt_largest_hole - Largest GGTT hole
> > + * @ggtt: the &xe_ggtt that will be inspected
> > + * @alignment: mininum alignment
> 
> typo: minimum

thanks, addressed this...

> 
> > + * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
> > + *
> > + * Return: size of the largest continuous GGTT region
> > + */
> > +u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> > +{
> > +	const struct drm_mm *mm = &ggtt->mm;
> > +	const struct drm_mm_node *entry;
> > +	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
> 
> this is likely not needed any more as xe_ggtt is always above WOPCM
> (unlikely to previous driver ;)

hmmm... probably... but can we leave this to a follow up after we
get this series merged?
I'm trying to not modify the current behavior more then it is already
doing...

> 
> > +	u64 hole_start, hole_end, hole_size;
> > +	u64 max_hole = 0;
> > +
> > +	mutex_lock(&ggtt->lock);
> > +
> > +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > +		hole_start = max(hole_start, hole_min_start);
> > +		hole_start = ALIGN(hole_start, alignment);
> > +		hole_end = ALIGN_DOWN(hole_end, alignment);
> > +		if (hole_start >= hole_end)
> > +			continue;
> > +		hole_size = hole_end - hole_start;
> > +		if (spare)
> > +			*spare -= min3(*spare, hole_size, max_hole);
> > +		max_hole = max(max_hole, hole_size);
> > +	}
> > +
> > +	mutex_unlock(&ggtt->lock);
> > +
> > +	return max_hole;
> > +}
> > +
> >  #ifdef CONFIG_PCI_IOV
> >  static u64 xe_encode_vfid_pte(u16 vfid)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index f816b3c0732b..31060fe7644b 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -29,6 +29,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >  			 u64 start, u64 end);
> >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > +u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> >  
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index efaf188290ea..1d17c34fe5a4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -590,30 +590,11 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
> >  static u64 pf_get_max_ggtt(struct xe_gt *gt)
> >  {
> >  	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> > -	const struct drm_mm *mm = &ggtt->mm;
> > -	const struct drm_mm_node *entry;
> >  	u64 alignment = pf_get_ggtt_alignment(gt);
> >  	u64 spare = pf_get_spare_ggtt(gt);
> > -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> > -	u64 hole_start, hole_end, hole_size;
> > -	u64 max_hole = 0;
> > -
> > -	mutex_lock(&ggtt->lock);
> > -
> > -	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > -		hole_start = max(hole_start, hole_min_start);
> > -		hole_start = ALIGN(hole_start, alignment);
> > -		hole_end = ALIGN_DOWN(hole_end, alignment);
> > -		if (hole_start >= hole_end)
> > -			continue;
> > -		hole_size = hole_end - hole_start;
> > -		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
> > -					hole_start, hole_size / SZ_1K);
> > -		spare -= min3(spare, hole_size, max_hole);
> > -		max_hole = max(max_hole, hole_size);
> > -	}
> > +	u64 max_hole;
> >  
> > -	mutex_unlock(&ggtt->lock);
> > +	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
> >  				max_hole / SZ_1K, spare / SZ_1K);
