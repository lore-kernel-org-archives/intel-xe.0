Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21449C27C53
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 02:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71FB10E0D1;
	Sat,  8 Jun 2024 02:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHPqlaRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C9410E0D1
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 02:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717813846; x=1749349846;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w0WixbSbZtDMnHeMdg5yRtzq7MsEssppZYLJzXh2pW0=;
 b=gHPqlaRpbx0ImhWlwsPnTWfXSQ5+XT+3HEDy75oRaDPr/0diJRVPJozH
 Bz7AOraNHRX0YdnPeL5pK+jcAOYSaa/sL/MVf6yNHMP3lIbLm0W+Ofi6J
 L4aiceDrKg7bfQ5txONmUmeP3WmFSZNuLpEogKAeJb9HGG6j3EQjMW5Ys
 Onf2gKvKzboYFwAUjoESkbwbg8bBh+3AEewsnLTEdrCGuF4q0WuRXGEPT
 FQZ/t+8aCFTNzIJPtaaCwYrtC3SOXfh681ox63zx5QkKxDopd+bMaNMUn
 5Wzx3NQa5m9OsFcIlzd+AO5MRP4vHpb2s0xDqzVgm08w1yvKBBfe5DGid Q==;
X-CSE-ConnectionGUID: ckKHZmbtSya8cZuqFpzYNw==
X-CSE-MsgGUID: oMFlqmGHTnG2drkh8jZVkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25967860"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="25967860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 19:30:45 -0700
X-CSE-ConnectionGUID: kBK8J+fZRNqbjAsiKBHcjQ==
X-CSE-MsgGUID: DQIO/DarQk2Yih50haCf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; d="scan'208";a="39176728"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 19:30:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 19:30:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 19:30:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 19:30:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 19:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJXLWzDL/WH0HR+tAGTX2Y46hgC/V6yIroupyz59o/527pPm/JfPO/OWxdUr575iL+bCnkceDugzdRJR3o3L8a0PcdYEdohw8s4zSJClQzSFz7I+2mPSjzbLlbASH0BytZM1hXWsZww35GNiqCo8h0u8GQ/+3x69XL0+tTLpoz6UQDlSIELTiqSGtPHEZR/1h/kPXnMBK7hFl8hHolQ4YYoSAeBoBsasiEteA8GxNgGdnGNeRVfkc77fNIyEYIluORbIyL45x4ZcsrqVnFcVTdDPSsscAmkrhEnnEyR02qhUnHruC5bA6Crn2cszQN9UdeGtwwz7fPJx92Z/n+aGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NRXFujV+Mh1soTupkZIUHim6F5EC9PuOUJAJm8BDG4=;
 b=CYrcoXqTQtTuVp5PALISl4lxJObISH+D01XhNIZvsL6XzwQwbxj9DJfdnmA2xCQhNjFdF1YlJ59V/rh6A/DR6iz8OjuKIIJrV9zfaYn9iMSBUmVahUjXS5OZWx+rzZHMiUpP9f1DT4iE6V9UTN/zgwyjqjiLKlxRaVIkYt2uIaQisWLJkgAxd8m/zLcuy6D7GvfSuSPyBpgRcLTWMhTsm31QLnq3/JRNYoFdNPWg2hrMa52RWN/LNk+2KntcUifcuLix8rgEJq+iOqxMb5dTm+if9aCqeuA0kRvQXV6Wlry9tbfyZXn1xypWxaWkQxIXgZVpzN5pnbNLSAKBkztFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Sat, 8 Jun
 2024 02:30:40 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Sat, 8 Jun 2024
 02:30:39 +0000
Date: Sat, 8 Jun 2024 02:29:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe: Sample ctx timestamp to determine if jobs
 have timed out
Message-ID: <ZmPCFJAGBV3AqSCm@DUT025-TGLU.fm.intel.com>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
 <20240608002103.2371696-7-matthew.brost@intel.com>
 <a14e0277-1158-4266-a710-8c64340cd5d3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a14e0277-1158-4266-a710-8c64340cd5d3@intel.com>
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: da4dedd4-0478-4bf8-993e-08dc8762fcb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LzBpYxa6ikbPSPpk5CTiYSDZYH7qOq7QXTlMDG3RkAFt671B+3n/Zkn5Vt?=
 =?iso-8859-1?Q?WqoBXaG8hP5nxpZHVI58TkoKlJ+hfpoQUzIxONNTYSNnjBxP+JJmeOzKmO?=
 =?iso-8859-1?Q?32h/zJ89T/VDsnFtXY1m+xd2itleElLAsWdbx60Y/HZ9O1bRVWIIEdOnsV?=
 =?iso-8859-1?Q?XUXyDvgRRD8PlJjcaqNwBs9KRKdZBcJ3P9qPT/phOb7XbffCA+bMMuSnLp?=
 =?iso-8859-1?Q?vsBcSQ5w9sngLvqrIriuxpPYt+O56Sholg5o3bOxxfYP8+C0agbKkJ4owe?=
 =?iso-8859-1?Q?9D1vKjIRZgXqWLmq/GNqsKxKDoTNrdOn2LlcS3MHsafJEJoWIsWR9Ih0Ez?=
 =?iso-8859-1?Q?cR911P/jwVHkAFEQ5cc7bPMiG5UltzirYdMWYBdWYA6HAw7jhUvnPxL7k0?=
 =?iso-8859-1?Q?Jn4tpSbjsVuh6cY6xP9ZrE0Oi8UhkP9cfbU4FY3O8C28qh5sYSYGP/uK9e?=
 =?iso-8859-1?Q?YRnmaU+3yBvXEExM3fjnjUicEsOtqUiPOgdyId68tqXNe7cJ4NYBdb421X?=
 =?iso-8859-1?Q?vMOjsJ0/1h4n5iDrz0Gc4mB6LL7W90v3Wv4BfS5b/i6PI4z9+rTb3H2xo+?=
 =?iso-8859-1?Q?CNyhd0+H1RhSv83+dJJ1Y0aOpR0kgHFdpTWiM14+8xSy/zHZIn2P2prQJ6?=
 =?iso-8859-1?Q?Y/KPuzW+xdcQjXxAwjkGn2n+K0hQutUaF+2OuSTEtCRrdnn9tyVQetQKvC?=
 =?iso-8859-1?Q?OAebKA5xpf19mIidySRnvhfIMlCUsGEOtI06/uIlRUnk4KKgwMpZY0SnhD?=
 =?iso-8859-1?Q?Yk3vFD8tZLGmZjf3RkSJF3CkSf7ftI8KkDu4Q4hO4SHcMGX89BMT/9Ypqc?=
 =?iso-8859-1?Q?dIPos6wLS431HL6x6eZJmriqMKZMjGSdKQtKjwtN1E51SaLYUNbyP6mfuJ?=
 =?iso-8859-1?Q?8ixs2THRqFWt1/WtejfCZO+lSuTF2tOmZ5nvbjlpm5s3lqa4bAseUTM5EG?=
 =?iso-8859-1?Q?rhsHBUqJv5CbKHiFtFnCOGCuifKXrLgU6vA13tllg3LiHjPJSQ89yPLmgt?=
 =?iso-8859-1?Q?mdEgOfbEdU/F9n3l+YieO+fhtfTuFbeat/bL5zCVyXMApiiRjmt2E2lCW7?=
 =?iso-8859-1?Q?9or6qr8INP42GPlslPTGO/iHmOEVsgyukpuCsLksyEH7HUQJPr77zsEJe3?=
 =?iso-8859-1?Q?0Ek8Mdbt3YR0GhQtLYmYZWefL/ZXsb5nOpfABtTfPtQPWFBH7JwlWOIi77?=
 =?iso-8859-1?Q?s+oHgrCigBdciEHUKC0N3lUaovmIcJ9qoO1syw/Lv6cKQEZ8IP3WgdHzIg?=
 =?iso-8859-1?Q?Uw96XTjLlNk/ZeHj0DS+7l6srxAonszLIuOruJE2sKO/jksYxXKuPws92T?=
 =?iso-8859-1?Q?43RokEqqCNKJYCv8WTiGI+6nuEeJT2HlDY4wAir9ieHW4rwsLZNb7WCTqD?=
 =?iso-8859-1?Q?LoN+mbpPRY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sSqfU5rE2R/FBrDdjiULMJ/l80ccIqYSEFogaBK15n1T4afzUWuzsRwwqj?=
 =?iso-8859-1?Q?WXGa76wSzgHUn/XuP5p5ZOKHn/69EQQoQ2FWjb1mrlPQYmr2K5X+gHQaSP?=
 =?iso-8859-1?Q?XVEgbyneMlnuM7BmRc/fM6bba3YcaadueBqFyMshwE1O8S3P2H0eQ0zrm8?=
 =?iso-8859-1?Q?lyy0rfDEAUXSwlZPwKnat/4rfxlwZAEXwDd8yXLwOH1V8PH6IOvjmbaP9F?=
 =?iso-8859-1?Q?IUyle92ljqv3iczbH5UKAg6oeLVmVOfIUzKkA7wzq9j5FGK22I/oAkJvVx?=
 =?iso-8859-1?Q?CdQrQR95jBmUunx8k2AnmviwI72YXD/t7WjQ3xBpjV8iZTDkE2pSygKCq8?=
 =?iso-8859-1?Q?qWjbYSCxh4MAv8C0aabx+8VSfNmO+gVqShWird3+YTgZnFLGgA7CaKDAaU?=
 =?iso-8859-1?Q?eN2O7KPEhoIKYqUd+dhsBuMjPqYCno6av5+JMDVa7aCuUbp0BmZlzdtih+?=
 =?iso-8859-1?Q?Sj70/l4xzCbQEb+P56gfqMUFc3Mxh/WSXl5afGfrouxpy+vBPPpfjj29hJ?=
 =?iso-8859-1?Q?qQqWgZs7gYCf63wAyLPm7ZCQWSq6MSZi2SctyQp6eG6ywvsZecXdQehVX+?=
 =?iso-8859-1?Q?DxtwIJ0GoP0yYrKhbldBqkK6sjXrrdPu4g2snIhTU7M6hpbmzbDsieiEuJ?=
 =?iso-8859-1?Q?oThXl6mvOf0sRwtB+v5u4t01NqjwANyT1qjHVWD0pFgWTKBUzw8jmW6XUp?=
 =?iso-8859-1?Q?W8kvNOKq3Gh3PPHVibvXsLH/zD2/AWwigoOZ4J6E8kPCrvNfAJMgjbAbuc?=
 =?iso-8859-1?Q?2OsAqaZWfVdEKjNAbPhTdn4Ms2kw/lftetzakzDP37m6H4amsh2UddumIc?=
 =?iso-8859-1?Q?IUP9tNMtsqoFNeq3nByQizXamvFh568RyVP2iucmKKqRBIZcr5TAsg7RRD?=
 =?iso-8859-1?Q?9WOik0Uc9v86dzuxF5EfK/pVGUiE/RFUBmNDQEFR3LLAhtyIQppqhVUsgC?=
 =?iso-8859-1?Q?mBpZcsxpp65k48FLLLlPoFo2VTNYSFOIupMxtQbGACLymnsZluHgjwtCNn?=
 =?iso-8859-1?Q?Z9m2D9UjiICQwlA77dMjgwZ6QeTtNz0IEZqU73ia2oET2ix7ay+I5eGnBC?=
 =?iso-8859-1?Q?0CMm0nAq/fAoF1RX+SmpZEyruPsl+BDZhUXADA5W042Xrsy0OOGaxbRGqS?=
 =?iso-8859-1?Q?5AdSAN0VknOW01uiomQ7fg7NmvI9XBsJDcFRX371ljpIBKa707l2NMis48?=
 =?iso-8859-1?Q?+3q5qDAiZXt3rNiF4gvmdXqrHKtTMMJrGDWRzQiz/+R6lnvlVjg6Rjy0MV?=
 =?iso-8859-1?Q?Rx5mksDZ4Cx4f1/ga4RLyCReXE3Jam0F8/IK9eF4u5qKTJQRAyYeaDA4kj?=
 =?iso-8859-1?Q?RLDx2KdB1iVCsQaUWkyjVa5zCaZKl1yRySNEeRg/kGa33VcelIsv84X86x?=
 =?iso-8859-1?Q?vsWsrYYUZBqdx+O2KaKuJ3xt7giR3EtEW4K4RXtCvr+EOjkDSZFPrawao/?=
 =?iso-8859-1?Q?tSF5C6bQ8EWFXGnDDZtpE+6dfpaGn2wfhqBR8XR1SJKG+pI7YSJ6DHyJmT?=
 =?iso-8859-1?Q?bPhxlHAmZYb3TF1lMZ9ya7rTCkCgmM6Mexa57YRyvSVSQ6BsNQtlSHzrZs?=
 =?iso-8859-1?Q?ut0JKHdtD0io0xs2fLuYWYwxlNnPnFZGR/5XNT/A5cAqPH6libAcB1PqjH?=
 =?iso-8859-1?Q?d2erTofs6iZrP2zQ30MlBwtftuylLJ5ijbfMZ1EYuwbmQpA15AndtiFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4dedd4-0478-4bf8-993e-08dc8762fcb5
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2024 02:30:39.7124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Px/iSu4gGauB8EIdHuKVpX5nRYLHOI7q4yRHeqWRuLd8tA216quduLwdnuHkmiARzRaFyyX7MYoUQnuCIh1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Fri, Jun 07, 2024 at 07:13:51PM -0700, John Harrison wrote:
> On 6/7/2024 17:21, Matthew Brost wrote:
> > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > scheduling enable needs to be toggled to properly sample the timestamp.
> > If a job has not been running for longer than the timeout period,
> > re-enable scheduling and restart the TDR.
> > 
> > v2:
> >   - Use GT clock to msec helper (Umesh, off list)
> >   - s/ctx_timestamp_job/ctx_job_timestamp
> > v3:
> >   - Fix state machine for TDR, mainly decouple sched disable and deregister (testing)
> >   - Rebase (CI)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 218 +++++++++++++++++++++++------
> >   1 file changed, 175 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4464ba337d12..716dd489d596 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -23,6 +23,7 @@
> >   #include "xe_force_wake.h"
> >   #include "xe_gpu_scheduler.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_clock.h"
> >   #include "xe_gt_printk.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> > @@ -62,6 +63,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> >   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> >   static bool exec_queue_registered(struct xe_exec_queue *q)
> >   {
> > @@ -188,6 +190,21 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> >   }
> > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > +}
> > +
> > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >   {
> >   	return (atomic_read(&q->guc->state) &
> > @@ -920,6 +937,87 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	xe_sched_submission_start(sched);
> >   }
> > +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> > +
> > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> Is there any range bound on this? The hardware counter is only 32bits which
> gives a wrap at ~223s at the usual 19.2MHz.
> 

Yes, default Kconfig options set the to 10s. dma-fencing rules apply
to this limit too - signal in a reasonable amount of time. Anything more
than 223s seem unreasonable. Maybe add an assert here that pops if this
is over 100s to be paranoid?

> > +	u32 diff, running_time_ms;
> > +
> > +	if (ctx_timestamp < ctx_job_timestamp)
> > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +	else
> > +		diff = ctx_timestamp - ctx_job_timestamp;
> > +
> > +	/*
> > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > +	 */
> > +	running_time_ms =
> > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > +
> > +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
> > +		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
> > +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		 q->guc->id, running_time_ms, timeout_ms, diff);
> > +
> > +	return running_time_ms >= timeout_ms;
> > +}
> > +
> > +static void enable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	int ret;
> > +
> This is duplicating existing code? It would be good to replace the existing
> context enable code with a call to this as a common helper.
> 

Let me see what I can do to clean things up.

> It would also be a good idea to add checks that there is not already a
> pending enable or disable in flight. A problem we have on i915 is that there
> is some really convoluted code around the context enable/disable that can
> lead to multiple operations being in flight concurrently and all sorts of
> things getting confused as a result. Indeed. it looks like the Xe done
> handler (xe_guc_sched_done_handler / handle_sched_done) is not checking the
> enable/disable data word and will break if both an enable and a disable are
> in flight back to back with the disable first.
>

Agree. Let me add some asserts to the helpers I come up with.

> 
> > +	set_exec_queue_pending_enable(q);
> > +	set_exec_queue_enabled(q);
> > +	trace_xe_exec_queue_scheduling_enable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +
> > +	ret = wait_event_timeout(guc->ct.wq,
> > +				 !exec_queue_pending_enable(q) ||
> > +				 guc_read_stopped(guc), HZ * 5);
> > +	if (!ret || guc_read_stopped(guc)) {
> > +		drm_warn(&xe->drm, "Schedule enable failed to respond");
> > +		set_exec_queue_banned(q);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	}
> > +}
> > +
> > +static void disable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> Same comment about duplication and concurrency issues. Especially as this
> one does not appear to wait for the disable to complete so could lead to a
> back-to-back d/e.
>

The waiting is owned by the caller in this case (TDR). There is another
place that could call this which could use this helper (preempt fence
suspend path). I think the later path can pipeline this call with a
scheduler enable though, while the former cannot.

> > +
> > +	clear_exec_queue_enabled(q);
> > +	set_exec_queue_pending_disable(q);
> > +	trace_xe_exec_queue_scheduling_disable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +}
> > +
> > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > +		q->guc->id,
> > +	};
> > +
> > +	set_exec_queue_destroyed(q);
> > +	trace_xe_exec_queue_deregister(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -928,9 +1026,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	int err = -ETIME;
> >   	int i = 0;
> > -	bool wedged;
> > +	bool wedged, skip_timeout_check = exec_queue_reset(q) ||
> > +		exec_queue_killed_or_banned_or_wedged(q);
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> > @@ -942,50 +1042,31 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   		return DRM_GPU_SCHED_STAT_NOMINAL;
> >   	}
> > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		   q->guc->id, q->flags);
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -
> > -	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > -
> > -	trace_xe_sched_job_timedout(job);
> > +	/* Job hasn't started, can't be timed out */
> > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > +		goto rearm;
> > +	/*
> > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > +	 * modify scheduling state to read timestamp. We could read the
> > +	 * timestamp from a register to accumulate current running time but this
> > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > +	 * genuine timeouts.
> > +	 */
> >   	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> I'm confused. Doesn't wedge mean that the hardware is toast so all jobs are
> dead? I.e. when we wedge we should be cancelling everything that is in
> flight rather than letting it time out?
> 

Wedged mode == 2 is such that on hang we do not modify HW state (e.g. we
can't toggle schedule enable). If look at what mode does, we just take a
ref to all in use exec queues (so LRC memory sticks around and can poke
exec queue debugfs) and signal all fences.

> >   	/* Kill the run_job entry point */
> >   	xe_sched_submission_stop(sched);
> > -	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > -	 */
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			goto out;
> > -		}
> > -	}
> > -
> >   	/* Engine state now stable, disable scheduling if needed */
> >   	if (!wedged && exec_queue_registered(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> >   		int ret;
> >   		if (exec_queue_reset(q))
> >   			err = -EIO;
> > -		set_exec_queue_banned(q);
> > -		if (!exec_queue_destroyed(q)) {
> > -			xe_exec_queue_get(q);
> > -			disable_scheduling_deregister(guc, q);
> > -		}
> > +		set_exec_queue_check_timeout(q);
> It would be nice to document what this flag is being used for. As in, why is
> it necessary to know that a timeout check is in progress?
> 

Sure, will add something.

> > +		if (!exec_queue_destroyed(q))
> > +			disable_scheduling(q);
> Maybe have  a comment that the first step is to disable in order to flush
> out the current run time. And if the already flushed run time is excessive
> then the context will be disabled anyway due to the timeout.
> 

The 2nd step is to ban, deregister, and signal job fences. Can add a
comment.

> >   		/*
> >   		 * Must wait for scheduling to be disabled before signalling
> > @@ -1001,14 +1082,49 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   					 guc_read_stopped(guc), HZ * 5);
> >   		if (!ret || guc_read_stopped(guc)) {
> >   			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > +			clear_exec_queue_check_timeout(q);
> > +			set_exec_queue_banned(q);
> >   			xe_gt_reset_async(q->gt);
> >   			xe_sched_tdr_queue_imm(sched);
> > -			goto out;
> > +			goto rearm;
> > +		}
> > +	}
> > +
> > +	if (!skip_timeout_check && !check_timeout(q, job) &&
> > +	    !exec_queue_reset(q)) {
> > +		clear_exec_queue_check_timeout(q);
> > +		goto sched_enable;
> > +	}
> > +
> > +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		   q->guc->id, q->flags);
> Maybe include the context run count here?
>

Like the values from clear_exec_queue_check_timeout? We print that
information in that function.
 
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> > +
> > +	trace_xe_sched_job_timedout(job);
> > +
> > +	/*
> > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > +	 * somethings has gone wrong and the GT needs a reset
> > +	 */
> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +		if (!xe_sched_invalidate_job(job, 2)) {
> > +			xe_gt_reset_async(q->gt);
> > +			goto rearm;
> >   		}
> >   	}
> > +	if (!exec_queue_killed(q))
> > +		xe_devcoredump(job);
> Is it not worth capturing the core dump for kernel / VM jobs?
> 

This is in the wrong spot.

Matt

> John.
> 
> > +
> > +	set_exec_queue_banned(q);
> > +	xe_exec_queue_get(q);
> > +	__deregister_exec_queue(guc, q);
> > +
> >   	/* Stop fence signaling */
> >   	xe_hw_fence_irq_stop(q->fence_irq);
> > @@ -1030,7 +1146,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	/* Start fence signaling */
> >   	xe_hw_fence_irq_start(q->fence_irq);
> > -out:
> > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > +
> > +sched_enable:
> > +	enable_scheduling(q);
> > +rearm:
> > +	/*
> > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > +	 * some thought, do this in a follow up.
> > +	 */
> > +	xe_sched_add_pending_job(sched, job);
> > +	xe_sched_submission_start(sched);
> > +
> >   	return DRM_GPU_SCHED_STAT_NOMINAL;
> >   }
> > @@ -1434,7 +1562,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (exec_queue_registered(q)) {
> > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > +		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
> > +		    && exec_queue_destroyed(q)) ||
> >   		    xe_exec_queue_is_lr(q))
> >   			xe_exec_queue_put(q);
> >   		else if (exec_queue_destroyed(q))
> > @@ -1606,11 +1735,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >   		if (q->guc->suspend_pending) {
> >   			suspend_fence_signal(q);
> >   		} else {
> > -			if (exec_queue_banned(q)) {
> > +			if (exec_queue_banned(q) ||
> > +			    exec_queue_check_timeout(q)) {
> >   				smp_wmb();
> >   				wake_up_all(&guc->ct.wq);
> >   			}
> > -			deregister_exec_queue(guc, q);
> > +			if (!exec_queue_check_timeout(q))
> > +				deregister_exec_queue(guc, q);
> >   		}
> >   	}
> >   }
> > @@ -1648,7 +1779,8 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	clear_exec_queue_registered(q);
> > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > +	if (exec_queue_banned(q) || exec_queue_check_timeout(q) ||
> > +	    xe_exec_queue_is_lr(q))
> >   		xe_exec_queue_put(q);
> >   	else
> >   		__guc_exec_queue_fini(guc, q);
> > @@ -1711,7 +1843,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 * guc_exec_queue_timedout_job.
> >   	 */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> > @@ -1741,7 +1873,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >   		xe_guc_exec_queue_trigger_cleanup(q);
> >   	return 0;
> 
