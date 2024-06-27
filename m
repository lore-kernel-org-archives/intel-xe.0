Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3134C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 19:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B810E06D;
	Thu, 27 Jun 2024 19:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFiqQOis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FB010E06D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 19:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719517876; x=1751053876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=w/zoyM1nJmCK9Ax5+veS7Hk3wPDxUCo6OKXMHAmJhIw=;
 b=jFiqQOisGAeiSZ5YGbsodmJK/E0foCaisnBfzDytLToQlb15ew+4VRM1
 d+Zv5cBldq39gV75HYhqGMsOw7qOkkiZA3D5qujZy0VBKnCO0mFlO5ZYN
 5CPCPAj96UzO/RS8xUqpWfXowEp5dKiOasV7jg4fOO17iDOhsEOEmlVh8
 SmZW/8PxblHElHYIxDkvjLoKGgqpmnLkxjooAChTxuBqO+dEdxB8Un68Q
 NHxlCEngw8G8+hPPCffod/XHgcsu7NiuYnsBFs77Kxq46dCYDJfE0YN/u
 5zJ/DnfLkwgOKY91zyl1VgYjR9qRxydnYxSnr+6NQzIms9fNBUsItqkAU g==;
X-CSE-ConnectionGUID: 1GInAdehRU2oNPy6RllReQ==
X-CSE-MsgGUID: /6FIRD9xTC+GqzypQpx7bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19573028"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="19573028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 12:51:15 -0700
X-CSE-ConnectionGUID: jQQiIv2kSAaN5ug2Q5FGOA==
X-CSE-MsgGUID: HEJQXv1/TJSKlwaMh803zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="45247673"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 12:51:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 12:51:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 12:51:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 12:51:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 12:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXvEUAtmbtKfJ/EsT6e54BOPdUbwHxrquo5ILXzlUpOp4h7rNDBYCz4Xod24qYVjimLU1XQLdeDqkhIYrPG2nSj76fL6yjfU+tmoVSYj2Nn0Gp8ZVThwAEnL44bcZ6FM5RyVRQcNo6+DvcFZA/O1KmnROg4Y2akl8VZ5EOI8VZeOoklvB9YPPQ07InTxv1b95rl4O7HzCfU5ODzTMprNzibAWqOLnbJB3r8+kSw2H+Qs8lTM0ZqYOJI00fT32rJ+J5EtvsZUWZHKJe7iPm9iWqmsfSoYFpzekEqt2yGU9SGBKnuSlN4gmDogAYBJx3OzpxKMUqoqvgnPrjg4UG7a6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz+lCUvY5jm55m87i6nEko+I3rjChzCaKEIusHXtrFU=;
 b=bpb9qLe0xuZo3hYi7UHhseHEN801t7IEhXbDUBIrMZvkf98bccj/4RYW0m3SKtxUhbTMRztc+A5iZbb4yP3UHbNnZpQteBnVW88CrrqmaJ4hg8KhV3QY8PJXILAvcWYt+zm77mjYM9kq4z5QYLF8xNCnhqT+GYdDf7XQ7h/3kt0P2q27ogZKCfromg44HwiCzumZtqXulT/3blMnALBFC1R7LVIbIa5HVM0dqtJoV/Zda+fnGvr5lT1CaPEgLptxLPhjN6YWUpRqO4hF7Z993bATAh51iN5WSSfKh7x67rn9uDV5MiOIN/629UOhvIsLYCbfRQiPG0PFsflOkwR3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25; Thu, 27 Jun
 2024 19:51:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 19:51:10 +0000
Date: Thu, 27 Jun 2024 12:51:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/mocs: Check that MOCS table.ops is assigned
Message-ID: <20240627195107.GC2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240626211256.1620889-2-matthew.d.roper@intel.com>
 <bc86de52-01a2-478d-917e-60bdb04860e2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc86de52-01a2-478d-917e-60bdb04860e2@intel.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 31979935-4150-4b99-9a5a-08dc96e27e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hDuW/M2Rm+VS3H0uu26NklC+sYku5XGh4Z+8Fj7CQn9ombUwGFsBi1/2Z3xs?=
 =?us-ascii?Q?5d5VAt6XTeP59J8mlW0tLorGNV/IdxA8ZVRsfYUx31f6f7EY7IFWRI/aLcja?=
 =?us-ascii?Q?Nr7CkvvrVkbE2jNYDxPB1VvJvtf3OH/zgafxDqj07hD+gAPX/W8EBpe6eJBe?=
 =?us-ascii?Q?jyVDoEiNY0omUoUfDL16XgJBNhFGXFq4nNE7T3c6gBwMqdyHX9KKH+0lkfSc?=
 =?us-ascii?Q?M7B409yulwPSjR7d/LaB+64KTuqGz/p8CG58mX2lBy5B+XdjjfiQv9a7GBbU?=
 =?us-ascii?Q?4a5oJalN4MlUi1J7Vqa2UaEYLAqhwrDC0P8KB40AuDfflJ3KxtPSEgVXShXL?=
 =?us-ascii?Q?Fc9Gj4dvIsyrdz4h9vkY0go5zaRXkmBzTxLNcQPhqUgmgcP4QWm0+s2e92eJ?=
 =?us-ascii?Q?FnzfYtZs37zyNJ5xAyTnoR6sUegE8x3VfWTfLSByEJ46FtVrkxjGzl6BeeCd?=
 =?us-ascii?Q?SjuLmddehPnJG6O92YMh2/NgIpvsBbADPhzAuGNELM+QL7d/BjbaP9FhdDEr?=
 =?us-ascii?Q?Gen7cpwr1djjkzUOw56hdTAoQn+i3HGXEq0CBkHC9sYu+JUz7GcOlC6QpLUt?=
 =?us-ascii?Q?RIlOgQU1CloCaGyUbqelHVQo/VOA6Ci5wTx75XF0ZMAqXHWK49BjuwxSE8H5?=
 =?us-ascii?Q?OD7w15bMHErw+MrRPD15neChFOXZ2m2jzpbOU0OPbnYOeZ+cMXZUB1CaRj/1?=
 =?us-ascii?Q?/3znsQ3Cr+x32BzgXFVhaHoKPq/ehcb/CsIy8ND35tqs4kSE6yHT29HnGgjt?=
 =?us-ascii?Q?/VmOQGhPaTCoz+2FSo4t7gu04cYn6Gq8U+KLpknP+9hf/NtEVzLbdfU72wSa?=
 =?us-ascii?Q?ldG2h+6DvkEBI+ac7+a20UbpzKUlCJcV7eC4Z3Fz0lbbzN9bF1w77WTJfd4V?=
 =?us-ascii?Q?SjaNFV4oY1MyAds5U1z8/ifxYius4qDfkEqF/rcMKXBQkSgEh8Kteya+20QU?=
 =?us-ascii?Q?xcvsenQPTuGCFpnayv+R0/bzsfBuXzIZg4RGewv17/RRyoq0G+Akz1cFWkpy?=
 =?us-ascii?Q?Uj1DlQBpQFVMwg92i7gVv8qOETy6vfpdZxIN7PT2NXqor7qprri1SDW+dqgg?=
 =?us-ascii?Q?RLZ4JkQ3wPEN4lINA0ZvhtGszyoqC8eBIItZaPLRePsR1yE9NlLpukL/NxHr?=
 =?us-ascii?Q?PBMF/ogNb46WRta9jqorxyX1id1MEBWvXYUvxWXGgTKACctW9PloPyemX3MT?=
 =?us-ascii?Q?JBxBFDj4tmb0QIyCgiaY9uPS6x7lStzbT5xxAGjVhA/whaa+D/f8piMM2ld+?=
 =?us-ascii?Q?UIE1SuzSocMW46RHQZ0/Yc9cmlgt8uQtMmxoemXirEkIPBjw0wp7p79FKr0s?=
 =?us-ascii?Q?dqlmLZBiB5iiCqcx+pdFnGZ/iS6KzXlFWK6BrV6VEYO66g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?coD0Cn8ui9G8PDpYrzReLpPqY6Q4aXeOqDiYxoBjX8WHtD8+U37lKU/w3uQP?=
 =?us-ascii?Q?i1VfHAaoFz7p78gvmukXa4R39uB/lRr4/JZL1xbf/xTRN9yYo4GTWQAkqV0V?=
 =?us-ascii?Q?tHVRATzvmA0t3nl1b82psIxsnbpo7drbWOReciQDsRZu+iyiWcyCkaXFhlmE?=
 =?us-ascii?Q?hB7mMcqsasCcDr7LCF5mSBvHc0NsQBspi/oY4BKoHkuAUfi1PJ6edS4cLxkR?=
 =?us-ascii?Q?HhPA8BRk9lY6JchpXUY9u/vzveXmN4WyuziOTmUTFMFfkMCXZGLotBYLjqds?=
 =?us-ascii?Q?i40HQcwurBX56twJH92hyiuu8fsFcrtPEs88r/qPWbx8biVxxzHaHbPuhOkI?=
 =?us-ascii?Q?3wm2mw60BnEP4X59E1cTOU3ow6IHhfMtikEOmtvHLrHWsITQuzM1MGrxOzZI?=
 =?us-ascii?Q?KLrPX3kPkH/4IOeq91z1wUWtkmTZDphmOhqtolTA1b4z2iUujOxmvMQBa7UT?=
 =?us-ascii?Q?S8hcwk50au4TCt/yulqUSDuS2i81d7aMqnQoYsjZJiC7zuIR1diD6yXuXclL?=
 =?us-ascii?Q?EwYLFnUFf1k8KuWh68WFkr0e4rUe+Mn6cN5KgSgpPw5BGiJRh18bEmmuWwQu?=
 =?us-ascii?Q?wFgeaN4efqVgg44I7pVSlWtmtcWSORdHE4kin3cQexrq6emwq+MX58LlGHwo?=
 =?us-ascii?Q?YPItKTH4EIbG7abxUnaVoa1HZdHF2aIGS65WjgBRyQvTxgfTrgOyHHcX35w7?=
 =?us-ascii?Q?kdPx4pzav3aOw+ftG4g1JtJJC4kIxYq55uuWu11U+sGLCRFWoB2bWtKTus9e?=
 =?us-ascii?Q?BFUTjJu7TebotHdEbRpakt8/+sRPL86TvbrmHpaAB8JbeKTXrZCG9xAcio1z?=
 =?us-ascii?Q?aDLRqwCnscioWdT6QyNF0IX2Ppf2u6XrInwpj67XCkldPE6MVoiw9poYNonc?=
 =?us-ascii?Q?8l/uvKKEDFBmM5zWcbOwTj4rGAYgvXfi9aq62KKjiANwq0jR7W+R7r/BY0HD?=
 =?us-ascii?Q?w1EyBGi0/T4w0AZOUAMoLdo2/4tq5VHWDLLPLTaSy6r57eCZgQYnj/Fcv7yj?=
 =?us-ascii?Q?/ZFBYvH0CWRX4ma2F63LWvd4Vnb8UvhKrJbtI9mMl3V3UOc6QQsyqxOFCLL5?=
 =?us-ascii?Q?EX6q26hL77W6Ud6Nkcm1DoCQLecNd2Esjl4IKTycvBDv2t90inSOQ8UYXsVp?=
 =?us-ascii?Q?0bZDRPiv1Hh/Lmgv0yoCMUEEIhLJVMzPHvZ9mxdPzBjJgmbKAdsPWIr/N3cX?=
 =?us-ascii?Q?v0fQl03wEz03nxmYHgjkYybbAHK7vC/0KNyX7D4ehd3AK4HR/vwvyF7/Rvf1?=
 =?us-ascii?Q?I5ANbPXCaHzcqTHj9ZzxLZkRVhuEHOLSDdAYGMSwda2zrcSN2ejvmu2lza8K?=
 =?us-ascii?Q?y09jrD1Ux454wW8XLL9dwHR0T6URn0aUGLVcBNMr6xuHpiO/htcBLohwfIYi?=
 =?us-ascii?Q?hn3yAPXutoYtj9EeGIFXhS/2L3eJ+nG44PvU5iRsyOKFpR0DSEeam2aL1nPB?=
 =?us-ascii?Q?qOAk3FqFIT9broTMfAjilWceqnCJcaVmSY1NomPcnGh5jXeB8ZXNZuy7Rh5i?=
 =?us-ascii?Q?pPscq7VgjbPoGCpPRRhm32iiakYc018KuzQQ2DY6IkuUR6DOd1/vOdvPPye/?=
 =?us-ascii?Q?qg1pqP+lP/JqSWfGc7gcY+2BstIQkfQVrHWq7HXV8ORAxcFgr+xV8gHhS2IS?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31979935-4150-4b99-9a5a-08dc96e27e1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 19:51:10.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61qSkcrR2BHj6duAb0P0KZWng3q7NjAh6Tgn+05CkSPGbYcITjtVJptQ+nEsvR2N/E/XC1fuWPMe1cLHb5AZCgwaKBtZbDZXT+p92Kg0Nyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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

On Wed, Jun 26, 2024 at 11:31:09PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 26.06.2024 23:12, Matt Roper wrote:
> > When MOCS debugfs dumping was added in commit 9fbd0adbcbe8
> > ("drm/xe/mocs: Add debugfs node to dump mocs"), a sanity check was added
> > to xe_mocs_dump() to ensure table.ops->dump is not a NULL pointer.  The
> > more common programmer mistake when adding MOCS enablement for new
> > platforms is to simply forget to assign anything to table.ops
> > altogether.  Extend the check to also cover a NULL table.ops and add a
> > WARN() so that CI will help us catch these mistakes when new platforms
> > are enabled in the future.
> 
> but for the programming mistakes, shouldn't we use xe_assert() instead?
> 
> and in get_mocs_settings() there is already:
> 
> 	xe_assert(xe, !info->ops || info->ops->dump);
> 
> maybe it just needs to be updated?

Yeah, I didn't feel the warn-on was a good choice here, but didn't want
to change the existing flow of the function.  But since you pointed out
that we do indeed already have an assert in get_mocs_settings, I think
we can just remove this warn/return entirely and rely on the assert once
we fix the logic there; I'll send a patch to do that.


Matt

> 
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> > index de3f2d3f1b04..d43900d351f1 100644
> > --- a/drivers/gpu/drm/xe/xe_mocs.c
> > +++ b/drivers/gpu/drm/xe/xe_mocs.c
> > @@ -779,7 +779,7 @@ void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	flags = get_mocs_settings(xe, &table);
> >  
> > -	if (!table.ops->dump)
> > +	if (xe_gt_WARN_ON(gt, !table.ops || !table.ops->dump))
> >  		return;
> >  
> >  	xe_pm_runtime_get_noresume(xe);

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
