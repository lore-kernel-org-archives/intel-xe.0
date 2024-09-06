Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03481CE7B0C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 16:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B3F10E8DE;
	Fri,  6 Sep 2024 16:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtmvuxC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77C10E8DE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725640167; x=1757176167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iC8KLULtt2Pt3C2RoXQ8LnnbBNQ0Py8TLQV7v3UWpno=;
 b=NtmvuxC3O44aVNYrRFqT+eLLZv+pVmyLK6mYTe+lyTbD+G2JVT91T747
 vAuZGjHyW6WqfE10O9wSOjaWQb2X986aGsxFPtAcpL1i+nLQ/s+KNdtcy
 GpbHoq9XVHoL8DX6B4e8LJFOwngrwDEzY/4heRjbiT+Ytyib5TXGjM47y
 Ac8+gD9/jykh82AKwdT8r2jFJ2N/syfde7TQtJ6Di6+i3VBPv9NkotS2t
 OPbDaWnGb1fdMEntjqyNbzb7YkomMwoRG2AEU7Y5vyFmSKjYjNxeu7vrE
 tP2FH7Ekj92LzEgIif51EpjRqvXMcrzuZ14AOZxNh9zjOozmGu7YALo6S g==;
X-CSE-ConnectionGUID: nnOP9cP3SySC0PPoL+wK5w==
X-CSE-MsgGUID: rNPmznA1Sdiu3XNMbNDMMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28288938"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="28288938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 09:29:26 -0700
X-CSE-ConnectionGUID: xVhBWeOXRJ2y/e1R+W3fWw==
X-CSE-MsgGUID: e9TWrOuoTdqUbMr/2dfPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65640202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 09:29:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 09:29:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 09:29:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 09:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4honJVHkYzzASG8Ni+CUBJj79YiDWjla98ewa57S25aSCWQI1Bk7btn8qxnMyVwsyarU4UiYpN5vQdsaGjsaI7gCvVVIj+Igp/7VAFGw1Q/fgRxvDB0N0ruquAVJe3Ur1rLfF7BtbaGzvNSDqDmUyBEiryopq6WqEqRf4BBJWh/FOGgaH0HpeUfcXUw58uW0MoJ028aIXNropHIjNj9MzpMul+LPv32GovrXoWPGK50kQxrFt6BWjaA1baAhk7Khd2tnuQLxstV9o3EvOW5Lm1JQdHZiLz+ZQsVuc7zDBhaOBvz63qIhUMKPEcq5W1aOM7SpFMd3W4KTgmcoNQn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xuabiqxd3a/aBCC9Lv2aNviQUUJMdKG8SLfGwRd39M=;
 b=HAZdP+6gpHFME4KFVQXv0Z/VvtK/bWcU4mKVchcaibuhp4lG+dMEz/Nke3qA/H7btU5ilCLXZ/nZSpXSNMG0C8f11SPTdRbG0wKrMPCJAPCRordDKNLbwh66N41iMEGURnCqgdkwgn3ikpzcrREuNHjHl1TFSiD/wXT/6iXxa10MMSEkKoj4VfleoyS7B6CY1Gj1SsePr4U/kdm3OjiC6JJAbHAGPr5cZBMorz+R5YDCV8tQf0xOXlLWIN/Ey7pqbno6sKi4dIM6pZo3BdXwnBjOJljQrxPz7jphUA7HKmjJTnGlk49UKZ5CyeGBSus3m/io4iOq2+I7aAUI2h06oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 16:29:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 16:29:21 +0000
Date: Fri, 6 Sep 2024 12:29:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call
 xe_force_wake_put if xe_force_wake_get succeds
Message-ID: <Ztst1yxHrJyHQMl6@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com>
 <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7b02c8-3b02-4240-e6e8-08dcce910c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TqT6xPoXFaeYUCQP0v57lzMabt7mNru/A4FJ4pSwhiP7k0ruSk+TvgkeJU1x?=
 =?us-ascii?Q?B27gykVD8zj82UESnqQbRWuCUDxpCk4K4xVI+KoYXcBds8ZBvM1RHlZ1EvAo?=
 =?us-ascii?Q?3GxrRrCZLT6gtlvUFJjqT58Ulvu9rTpOQt24L32ZYGqkEgsnqPJd70nnfS+t?=
 =?us-ascii?Q?HwRppAFBnmMwwOBTnN/nBXgW1lGiwUIA/tyiQ+gqng987v/VspBY2sCC91k+?=
 =?us-ascii?Q?GE5NUjAuEivVCmNfIQ6Bc2tMgl/FvEUK27+maiD0wIsbEAcerzuWe70u70iB?=
 =?us-ascii?Q?jt2otmWdLbR7+94c3fVTZt54oCywjZYBXHJoE0jEknw1HglIq9X11Jp+xM0K?=
 =?us-ascii?Q?bpGbILHgtvVq4xTcPm0E5SFsneCHNOUZulsRN92JcnQm/mCQLfZ6MRZapRhh?=
 =?us-ascii?Q?Jvo4v4yICoHiQ0bB5un5Qh4FPU/MK613No2/pTWcTNzKAnXSGoTvEpfUooAN?=
 =?us-ascii?Q?9lYuC2thqc83pN2MjUtn7gA3hUdW3K+MxYbI6NesAi6M1iOSD4kM/1x5aLjZ?=
 =?us-ascii?Q?9OvG2ra2656DSvBB0qxxUjxLRoiHTW3K8X/BUCr8U74brvUa2MhaA1e8lhbn?=
 =?us-ascii?Q?QrpZIzsTtr8jA5vT1Nw1FsCiWhT3Dj38AXNXS9NM7xwmpESskixfa2JZPFfl?=
 =?us-ascii?Q?h31toQVmGCIePAOwgh6bVX3Qhqk0OOwpL+0DZyfpWjox8tSTxjMyxNBaygA/?=
 =?us-ascii?Q?Se3y0s6sIJspIRxXMNOJYP++WBOaEnQEFiGs1IvBn+Spl2uXI356QqnALQyG?=
 =?us-ascii?Q?sNgKqXBag/eV1SjzYzeKeDLedbAgNqLSwZXTp9mJ4knXMottcRKIWIyzApJj?=
 =?us-ascii?Q?a2907eklSOgxUTDojo6bly4/2mYOMvXyZxzxsMMVDjoovvrCz4nSCqRCML7N?=
 =?us-ascii?Q?y2l+MzAOEnltR/6wKSc/I8kWdB+X5Vrr73Mp5TMk0Ar+u0Ig1mqMPmz7b+jh?=
 =?us-ascii?Q?PkNjovW9YlRWPy3cK3bceTL/2FKpadRRRXOoxtNwI2NDxDxOmzy/5oRq/QM/?=
 =?us-ascii?Q?E3awCE7BDioITuqmE4ZH1ZZ+DfpLjWgPX6jgBWsH8HLjAXCBQ44MxnrQq+Jf?=
 =?us-ascii?Q?f9kPt8YQGh9V/aLx+HsFj22dhjvKQ+L9UgRrQiIpM8dxPo4+43mi6UwQeoXV?=
 =?us-ascii?Q?+LIXu/NJeEcDVYF2iAKd7Bvg3cPFYM2kTqJ3zUsYLnQic3qC+iGRX/DSIAwx?=
 =?us-ascii?Q?oarIbSgNmrch7NRRodw50ohhpje8H/PxlgKcU+mIpEDlCn8/uce0RwH3GXkd?=
 =?us-ascii?Q?KHogl4N5yK+TjFfIn31zymeyoNrVbrWLhIpF0iLI71lRW6ZyF7f18GvlOHy7?=
 =?us-ascii?Q?PyeENBxrUL4mUI3BaEiPtzEu5IywLJ6P0u/sHnpqxzc7tA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?euCtC+FCk/szN1GCxsqUiI7VOR+q0uv0OuvpRvSYfweCW0PfBJWspOzMaFX2?=
 =?us-ascii?Q?2ghl8dM5IeXa+JK7mCCJ/ym+TTlWh8Tz9sbgjiZ5J3Ep8yafuza2nI0Xf9cx?=
 =?us-ascii?Q?NmZrHLoORpSsoVhw/oJckAHt1BZjH3MHXAYURifvtuVXGHdj8BZYi3/e97pd?=
 =?us-ascii?Q?1TbMHeS6CGxIBIi5EOLjUvbG8G1KEpWOuTXyuQgNN+kpmxHUzllNbB29JtFY?=
 =?us-ascii?Q?DcNiJSTexLn3Vrpl2P7UzNbiiy/FN1lTaoXat+Oxxr4kGbMQp2zRxD5vERaq?=
 =?us-ascii?Q?ed/E5REx8t1vtoPevABONB0zH7NHoZ1ZlyU7Ji/PMB9cQIe7PG+flFhS3MxB?=
 =?us-ascii?Q?++lYHJMoS75YkcW5tB3eZ2W2U1SD6IZdpcFUfbwmM2XEDU9sPdXXWt1lJ/nh?=
 =?us-ascii?Q?+w9HKPADf5aknmIaJwtXrd8BpzoXO7NgW3O0ufDBq8doDV6TaobvLjPzt0AE?=
 =?us-ascii?Q?VbmqCipUcsuiibrgJkccji7Qym+x3diuvbpLR6msMqzF9Rf9Ly6wW72C/17+?=
 =?us-ascii?Q?XrXlefa6/mCs8s1gBbmlcvQfcz4dGE+2hatdGJHerbsMUDBMNml7QBR+CRty?=
 =?us-ascii?Q?+8T983MLGX3BnOUYDmv+4baVw4xqnHkxABR7o9NrC63UO6n12sM56YS8fjfD?=
 =?us-ascii?Q?aHLDrAd9xr3MXFlkVxkf5gkKHQEiBPcXrMM4nMyir5Uuh/XeTqlFYFfCw9M7?=
 =?us-ascii?Q?2XxV0bNS6d/p+hzqgvhL1vT1pa6J/GRoCsacaiMwjEwzQ5AA/eU6q3DWwJeZ?=
 =?us-ascii?Q?ndUoUoeXvaixBBbyAZoeyXfZ1P+Ms75WfnkC3trKWSpl1srRRa9xte29+FKD?=
 =?us-ascii?Q?hhp4f1trXcqayK9xFDTBaQsm16u01gRE33jVRQGaL+EgpdeB52SBGJY4k9B+?=
 =?us-ascii?Q?XzjOPn5RR+XaO04I6EU0Rs3a7dgSpanVbXPDzmU0qw+n7+a/LJMBBPHds+lf?=
 =?us-ascii?Q?1L3tVIPrF70nfw/lo3Y7b5srF2chxZtAv/mjMN01QtbgF5YiXXJCa0WDoSsD?=
 =?us-ascii?Q?VKtN4JK8hbDGhQ3r3HretIyoJULvnp/Pp25ZwE40/JCPf1XxUT5AcFIV+3T7?=
 =?us-ascii?Q?VIXq9fYnq0KxbHNn2cTnrFBwBLNceuFcGNnaIYABg9HPgOANdUwKaFpIe6mj?=
 =?us-ascii?Q?nW/sHNHo7RTpQRSz4nl/bNAcIBb9rEWeh6RvUsX7HKPk9dOZ+Jwc1Fo1wupx?=
 =?us-ascii?Q?IQecv1msG3hLQ7uxqU2Il/zAMavXNIVxQXXpTYoiiqGA9IXX+TI1740N8Zla?=
 =?us-ascii?Q?KBhKYHQxnFKIwbiRoBk++DVePP9CVVQKcQ+3q4AWc9cKBib972IokVzw5SbL?=
 =?us-ascii?Q?6Gyh9pe5kGXDyjb3tqk7rYpZLenV0R5fVklN2CWLe7bYE6FoiRXhyScLNdGr?=
 =?us-ascii?Q?ThHYTbbHNr+gdRN2iwN6naMxH5P3hOgFGIDlKH0xR81Qiy4Oo658t0IkyA6/?=
 =?us-ascii?Q?HcNZ+n2pz84NURL/3B1mb1DAjf6yb/BkWwKeUBCPNj2jZYR0aLnZrMDTqvz8?=
 =?us-ascii?Q?Vq+kPtEhrdcA6KR5EUT/pUJwyrCFCgqsUnJTPmT7tEwfilvu2pjwNKS60d9w?=
 =?us-ascii?Q?7TsODTP7XeLgpgZVpzoU8Op3dZJVY6Q/vOWfl9FJm6SfaaZfMXiOlDEhhKZK?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7b02c8-3b02-4240-e6e8-08dcce910c93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 16:29:21.5950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o8/ZnlHEV4+gKRt1NPCRuRCQ2hclGGsLeONxLz8BgbxJk+BR4ZuxA4xlpwDCqIbP8rkdE1rVj2jUkhaoRDjlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

On Fri, Sep 06, 2024 at 01:21:41AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-09-2024 01:07, Rodrigo Vivi wrote:
> > On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
> > > A failure in xe_force_wake_get() no longer increments the domain's
> > > refcount, so xe_force_wake_put() should not be called in such cases
> > > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
> > >   1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index cca9cf536f76..3f86ab704c4f 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -259,11 +259,11 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
> > >   int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > >   {
> > >   	struct xe_device *xe = gt_to_xe(gt);
> > > +	int ret;
> > >   	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> > >   	    gt->uc.guc.submission_state.enabled) {
> > >   		struct xe_gt_tlb_invalidation_fence fence;
> > > -		int ret;
> > >   		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> > >   		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> > > @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > >   		if (IS_SRIOV_VF(xe))
> > >   			return 0;
> > > -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> > > +		ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > > +		xe_gt_WARN_ON(gt, ret);
> > > +
> > >   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> > >   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> > >   					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> > > @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > >   			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> > >   					GUC_TLB_INV_CR_INVALIDATE);
> > >   		}
> > > -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > +		if (!ret)
> > > +			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > 
> > looking all these cases now I honestly prefer the other way around.
> > 
> > If we called the get, we call the put.
> > get always increase the reference and put does the clean-up.
> > 
> > fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > 
> > xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > 
> > so, the fw_ref is a mask of the woken up cases which require
> > the ref drop and sleep call.
> 
> Hi Rodrigo,
> 
> Thanks for the input. AFAIU using this approach creates issue in the
> subsequent force_wake_get/put in callee function. Which I have tried to
> explain in cover letter.
> 
> [1] subsequent forcewake call by callee function assumes domains are
> already awake, which might not be true. This shows perfectly balanced
> xe_force_wake_get/_put can also cause problem.
> 
> [1] func_a() {
> 	XE_WARN(xe_force_wake_get()) <---> fails but increments refcount
> 
> 	func_b();
> 
> 	XE_WARN(xe_force_wake_put());<---> decrements refcounts
>  }
> 
>     func_b() {
> 	if(xe_force_wake_get()) <---> succeeds due to refcount of caller
> 		return;
> 
> 	does mmio_operations(); <---> Domain might not be awake
> 
> 	xe_force_wake_put(); <---> decrement refcount
>  }

Well, to be honest, this is what bugs me in this whole series.

If func_a failed, why would function b succeed? It that's the
case should we include more redundancy and retries so the
func_a would succeed like the func_b is expected in your
scenario?

But other then that, I'm afraid that you didn't fully understand
my idea. Sorry for not being clear.

My thought is, you do what you are doing in this series.
If the get doesn't succeed you drop the ref count and call the
disable.

The return of the get is just for the domains that have succeeded.
then the put returns only the ones that had succeeded.
The function B will then try to wake-up whatever had failed in
func_a.

Something like:


func_a() {
	fw_ref = xe_force_wake_get(ALL_DOMAINS) <---> fails GT-domain but return a mask with all the domains except GT.

	XE_WARN(!fw_ref);

	func_b();

	XE_WARN(xe_force_wake_put(fw_ref));<---> decrements refcounts of the domains which were actually woken up.
}

   func_b() {
        fw_ref = xe_force_wake_get(GT_DOMAIN);
	if(fw_ref & GT_DOMAIN) <---> likely fail anyway since func_a has failed, but it at least tries it out because you have handled it in your series...
		return;

	does mmio_operations(); <---> Domain might not be awake

	xe_force_wake_put(fw_ref); <---> decrement refcount of the domains you woked up.
}

does it make sense now?

> 
> BR
> Himal
> 
> > 
> > >   	}
> > >   	return 0;
> > > -- 
> > > 2.34.1
> > > 
