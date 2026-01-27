Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15E0D2FED9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6110E5B8;
	Tue, 27 Jan 2026 19:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ni8v3HRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1CE10E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769543517; x=1801079517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ng9Pt0j1fJDjkRNsd0b2wOOiOOBRWMaRtV2rsnlX/qE=;
 b=Ni8v3HRT0N/qAcsvRAyK3aFbenaI8PCRhQxF9Pw31dsNh/Elr/TLLBEk
 tfmMV5sAsKMDlkzkKM8RgY+iOUN6LJnPsc4EbvK8+FTr/JVIRJF2d5mSS
 CrjoS8FkvZBTNiywZLAwKm4Abi+rl1VTCuTnOgG/HIRqORhX6QfVnvG4P
 kJVZerlXY5i0Wh/wO4Wv7+4hHCN8KT0v1cq06SSCA0Uga1HmHZYyCFHiD
 sS5+rl4Sjpz5FA9GIMHwqADImcgUCylIGP4VPo9pBgV65Qak6qFHU3sih
 eE/bZ1aqO2J35mhpu3R9uYZctf25gp2Y3Hnutb2QSNVNvH5yaX/0ST4aZ g==;
X-CSE-ConnectionGUID: FrVfCuWIQKK+UZWA/S8u4g==
X-CSE-MsgGUID: xgdltqc8R7yjumG5KLUw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70466458"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70466458"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:51:57 -0800
X-CSE-ConnectionGUID: OC5ig/qxQJys6zFVrHHwVA==
X-CSE-MsgGUID: 9C+Up33QRUSelv9WzCYRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208078684"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:51:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:51:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:51:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:51:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5ZwflYGAaPVlF9cskTYktsJc0NymfXNoeSIwePo04u2Vps/mdDbNulEPw8MJ1iPfDethjtgf60vZiHGfaCIPUio+3Ps1GIxm4kvMRHmFtkcv7C5MKUJ5bjThVkaiiA+TiFI5AM296POfW2sj9fwqSLAMhcOSLWQ0k+n3dVUp8SAPvXWuNGwB8vjFzw4R1295SJyffl8TjPdTyIHzQsUmVQTy74wFzkz9olCZDA0wwG7IfnhcxnO2/bSuiAWJ5BAeTY3J484acHNx4Nb94MCCfIHTtggezgwJCR7A+2tpOeLyRJzZzqTmRScD0ieItDj91BragpH6dX0zdlJsg7m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLYc/vTexr3GB42WagtmCDJ1o38zc6hx3or4mxGBmq8=;
 b=gp4j2/hFbGu3i8NMVYmyBs/JAVKqQFPiDLlcXbX55sRpXPJrd2+GMuK5Hb+29uqFLXAK2hX+sNbWidrhToMkCrN5h/FJUxtCoL1Ymz45KMQiEez6OV5ubMToBS3S3nwyUEErydPbd7JrxdjS79mWG92am7pCiNECLtQvOyMxaNVsIvm5hNDr54UC7KH5sKvlzhjc9SEgyCtKwhq77zOMqxE/tibVLSKfv5X8Atxq3ngCuBP/zYDhByZ//NbkEjHKCLEWa4qGLqILCozVShhymvyMOP00uui44T61+hx2JlC4L2hLWAJExwlOUcKm0+2U8HRp7WeFY/Smf2shl4PKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:51:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:51:48 +0000
Date: Tue, 27 Jan 2026 11:51:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/6] drm/xe/guc: Limit sleep while waiting for H2G
 credits
Message-ID: <aXkXUbcvIEcl8mO+@lstrano-desk.jf.intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <20260127193727.601-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127193727.601-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 96576e59-eeca-47a9-93c4-08de5ddd81e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5nN/U82nRh1SFgvMuWhcyEelMLx+v3IyZxYIJP7oWKt1Qw1U2uCyjXHZJtgQ?=
 =?us-ascii?Q?wgXQwjQh2TjOqRuoO7DMyepytSVkmfhgRQAcNcG21OS7d3sf5wUeAGYJurI+?=
 =?us-ascii?Q?SBFfkuDhnLFTCAWMoGSenHTQKc76SYWK+5Xz3uRnDeYjpM0CRiW38o7EQvJW?=
 =?us-ascii?Q?tC6pRPj5BcDmQl4vy4ZEBctN24/wF16hjPTS+oh2mxIn7nE81/8De3dZdLlz?=
 =?us-ascii?Q?atnCZTFabX6GGDPPrKC83SkWLCKkDTHydYK81sjCDTHKpezj7JjlUruztqhh?=
 =?us-ascii?Q?vJgDX/lWOtVlO/XegdlXlfKUOChQvdOmzZoONFKFskhubsVAlqNI7AJ0bS69?=
 =?us-ascii?Q?p5ebB8ZeSGug5QiNFQeMOnNeaD+GIOyIq+MNvc5A4w2rF1NP0vGPi8K3+HZU?=
 =?us-ascii?Q?k5omAKocHrQMc46AYuJnSq5yQmHxIs83DRYv/xFQARU3dqjeajobuK5axd72?=
 =?us-ascii?Q?qD0RTeEJrySWngb9OYePeYhxOjIp/xIjxMLp8o42p/8MBEO6OquryhjJxwrT?=
 =?us-ascii?Q?6FARUXS1vviWWw+ySTkQY6uXOfHA7lEzzXad4UyWVRlRDiOUBzzlvCMvrbpg?=
 =?us-ascii?Q?66rwwzfANTYuJu1nDif+FDq05G7NMl7V5OsmMutruzYR0O3SSWaoO7zkWX9J?=
 =?us-ascii?Q?/DRBYDlgo3wL7fOShd6GwjGNqOSZBZTzmQVUO3/60enPyAU+2j82AmVh4FDa?=
 =?us-ascii?Q?b8clm6Ox/QGPv3H3qUNlCeJsgdxsa1lrz20NRNWTMha6tMQCBv0+nMBCQkUF?=
 =?us-ascii?Q?yGG7rjbmyUE3Dczly0rMCAdHy8aLDUR32hNQngSIbv+wgb9ImL8KJFY1WvJT?=
 =?us-ascii?Q?reHkLeasb2v86lkuqI/wSqKkobSTUyAGcwv7VfxTiTOLHVvq4O1Nzt4GMFUr?=
 =?us-ascii?Q?+1OLlLEoVP+9kNl1yCqHZebI58mqAsNWuW7UsZFEalQW2s6PS8EK/t0Ug2CA?=
 =?us-ascii?Q?YPaJzfp2E4PE3Byclz1QFuzik3O4PLtOz5STLEs8fALJtsHGapbd9B1MJ1/N?=
 =?us-ascii?Q?l4nC6Qe2ue/VnNhlMvjecT769ZoR9e9cYXsFA86tKhj316HNPIMhzTpB3V4C?=
 =?us-ascii?Q?Ln0Fja5bQu4epEyAiKD/RkWDH0N6vswfJ1kzqwmNEwroXo+a6zz1j3qMjMtb?=
 =?us-ascii?Q?6m7XfgORXvgP6EE+g1xaYfrTclDvAzcz/5xTYf7+ftxrGLBN6OBufBIDUn67?=
 =?us-ascii?Q?RpQ11jcgC06KHQd20qxH6mROcgBZ2AN9k95RpC8IOvBlHWy/oxzNry7cDWBu?=
 =?us-ascii?Q?mHB4P/CMzkkflVp62crgKh91dP8tpA8ctXg11m+ogs1tMOI8QvuApbYjxN1j?=
 =?us-ascii?Q?IdCcOC+bsxD2QAUGtCRJhrvDSnQOvauOPHgIFXZ6yku2KJVnieCLPEGFcvec?=
 =?us-ascii?Q?cQj7ZYZpuP2g1ZSz5tZERH3HsTxehRy29IGiebIeSnEdOFbcmX2h800nLCD+?=
 =?us-ascii?Q?j87JOVOEPLxgUzLzRGTuB2gXhhCDA1KvVxSrPMcxT8emSMYZua3Lug6iWdyk?=
 =?us-ascii?Q?S8P093NWQ+y3692CgM6bQxuBxBOZYwQv+waJJaf1cm5uGcrxqYWpKc5D9qm3?=
 =?us-ascii?Q?8nnsn3hPasbL+WaudnM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TmROkfaAfa5MMeKU9O/G2bo3+ryH8kM1uwFkRYiR/euigleoMQ5joCNz6216?=
 =?us-ascii?Q?vOZg5PKTrzdNT8j9HcnBxDP55kBdw/beNuB/T1CeNZRndnO2hDcclkV+HreT?=
 =?us-ascii?Q?X1wPvh0aoUhXbw/a+Ku4sel9oCyGGjcJ8OH4mOfYlkAbJI2Y9Dxs6/q1H2uu?=
 =?us-ascii?Q?0ctZBsYOjfXe6lNxP7ay1iBQ6vkxdqJ/S64sR2HJWP2Rd4vNm2rGd4lna7fF?=
 =?us-ascii?Q?+1fH2HXFPq6orj7H+pe4kr8C1iqUIhfq89bArH4AzcBBnSyUVAtRnBEq70kY?=
 =?us-ascii?Q?CPfp6wQF06TvDOFMWcetY+Q7AjZrKRhTM4TietCuImIG1ZTPf0Z8ejeFjFqg?=
 =?us-ascii?Q?BqSpfTyn2djm/BfN4uhKyJSwedojDRoPuGWw/8aRVq1FWLHZHaiWjO0wrSbo?=
 =?us-ascii?Q?Elt6+id+iOI6WxisJbBqDXQS1bukj+qn2uOoiCao3M30naXI9yLpuF5dZxxU?=
 =?us-ascii?Q?3hgnBObEq0Gg9Wngga2YNyKtC3mzQIGFyVYruh0fXlG9Lf38csneZdb01uH4?=
 =?us-ascii?Q?zBW6P3BXe7S/80STtBbGvdp6LVf+c0QyvwA6Eo4icCI3r8GqTRnk2dvROG3Z?=
 =?us-ascii?Q?MJCfViGZ2hsicZeyefsk2S8dPsg2dXpA1aX1ezWMXmiBc96XGPj9qQc+dAwE?=
 =?us-ascii?Q?9DNwh5BosiIWDHKlR+92EsEcyn8QgmRnV6yhhXerma95EQY2rvG/nxsqOXYC?=
 =?us-ascii?Q?aADpVW1Ky2cReg0sQMYaEXjdE7+AWDlqvAktNeUl+gvINX1ybL0n06hKIPUr?=
 =?us-ascii?Q?qoLig38IMUmV+M/amOCl+qwEgf3hk6OeZASPe5pnCj3qLTbvKR3/8yReWURy?=
 =?us-ascii?Q?Q4c4Db79t2jcNZmxc51idPqiydmeJ1upnq/tnQQebctEq4wuQpfRIg4OImVw?=
 =?us-ascii?Q?flKMeH/dqlH6YteJA9lCTzxkFbir0j13xe8DoQPubSklIkgyt0gGnKxHWj/0?=
 =?us-ascii?Q?BAnVaBBLp7PD1SRj23pOE5rm6c/lH7ESAzjo+DfPTizxqKo/4O2wPQYPvpmT?=
 =?us-ascii?Q?J33Y6TqsTdvo8watPdWP6iVJ+BLpxOhm4716VXBsEriQCCc1MMo6xX98NfjR?=
 =?us-ascii?Q?QFXSUIrwwynW6kRw9hWrIk6p8LQ64QCDW98RNsfJUbund3iy9cYgsPYzJys5?=
 =?us-ascii?Q?LiQhFBcOWmSYfXT2KJYsvG48VZMJOAah1B9w6V2I1xN9GPf6GgwGemK7VhRu?=
 =?us-ascii?Q?f3+GsFeBgO6Vj03V0SHAd1fX5WArKxeLuyzQUhmKULqqtAew+BqEtl7A/Fin?=
 =?us-ascii?Q?JDToYYsc/w04BQJIIzTC2oljvXj9tO5s3gRLBNkpEUP8S+yOIg9BpG70MZEi?=
 =?us-ascii?Q?P+aSqY3anG9LoCc/nV7xQI26S8KRBGp3T/6zOOpY5Fp+ZzKAg6wQKS1HQLmS?=
 =?us-ascii?Q?0ohDQhPwkxlk3SY9Wh52kvESF6zxrknG8z9QyAy+8FCetKsgFTQkBMTRqZ9G?=
 =?us-ascii?Q?luKH7oQjckoGrkzE8JCEj2rIarN9rVXvd55hNLRpTxD9Ox9RIAzYbln+XJ6i?=
 =?us-ascii?Q?/rL7u/GJnueigj1W2er6o1pbaUEQtTj1GHQPUwLn2jHzRQ5LRoaHECDAst1n?=
 =?us-ascii?Q?L2/o1AzuTQHnCF9WyXnpHim+CiakPZzKwEHtf5n4FauhrptdfB1BoqVe0mrT?=
 =?us-ascii?Q?FUejb/ZQpsggPSz+2GmQs3fBmHrV2q8d1Cos5uzApSCNQwXACfRY2r9MenCo?=
 =?us-ascii?Q?KIy9vJ8batdPP5JqhJ+luB7b67Nmg91VxprrSzOZWy2/+SZeqh6Lwmx8iNlP?=
 =?us-ascii?Q?xosNaFytkQut7g7AAdSiDt1Cf+ptQuw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96576e59-eeca-47a9-93c4-08de5ddd81e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:51:48.3760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLzJu0MufTMuKZFxgKgGPqbQdHlsn5DgIEOea5Ii9rYulTERnCoWCnoJkreSfrch1AnuC8FR+3TMR6YRN34xJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
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

On Tue, Jan 27, 2026 at 08:37:23PM +0100, Michal Wajdeczko wrote:
> Instead of endlessly increasing the sleep timeout while waiting
> for the H2G credits, use exponential increase only up to the given
> limit, like it was initially done in the GuC submission code.
> 
> While here, fix the actual timeout to the 1s as it was documented.

Yes, the existing wait is 2s which seems to be overkill.

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dfbf76037b04..d4111124cd5f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -32,6 +32,7 @@
>  #include "xe_guc_tlb_inval.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
> +#include "xe_sleep.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_trace_guc.h"
>  
> @@ -1101,7 +1102,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct);
>   */
>  static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  				       u32 g2h_len, struct g2h_fence *g2h_fence,
> -				       unsigned int *sleep_period_ms)
> +				       unsigned int *sleep_period_ms,
> +				       unsigned int *sleep_total_ms)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  
> @@ -1115,15 +1117,14 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
>  	if (!h2g_has_room(ct, len + GUC_CTB_HDR_LEN)) {
>  		struct guc_ctb *h2g = &ct->ctbs.h2g;
>  
> -		if (*sleep_period_ms == 1024)
> +		if (*sleep_total_ms > 1000)
>  			return false;
>  
>  		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
>  						 h2g->info.size,
>  						 h2g->info.space,
>  						 len + GUC_CTB_HDR_LEN);
> -		msleep(*sleep_period_ms);
> -		*sleep_period_ms <<= 1;
> +		xe_sleep_exponential_ms(sleep_period_ms, 64);
>  	} else {
>  		struct xe_device *xe = ct_to_xe(ct);
>  		struct guc_ctb *g2h = &ct->ctbs.g2h;
> @@ -1161,6 +1162,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	unsigned int sleep_period_ms = 1;
> +	unsigned int sleep_total_ms = 0;
>  	int ret;
>  
>  	xe_gt_assert(gt, !g2h_len || !g2h_fence);
> @@ -1173,7 +1175,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	if (unlikely(ret == -EBUSY)) {
>  		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
> -						&sleep_period_ms))
> +						&sleep_period_ms, &sleep_total_ms))
>  			goto broken;
>  		goto try_again;
>  	}
> -- 
> 2.47.1
> 
